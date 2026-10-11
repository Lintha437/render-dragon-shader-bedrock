#version 460
#extension GL_GOOGLE_include_directive : require
// MeshFallbackPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if (RD_FEATURE_USE_TEXTURES == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/MeshFallbackPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_USE_TEXTURES == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue1.w < 0.5)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor1.x = (sampledTextureValue1.x * fragmentVectorConstants1.packedValues[10u].x) * varyingColor0.x;
    fragmentColor1.y = (sampledTextureValue1.y * fragmentVectorConstants1.packedValues[10u].y) * varyingColor0.y;
    fragmentColor1.z = (sampledTextureValue1.z * fragmentVectorConstants1.packedValues[10u].z) * varyingColor0.z;
    float sumValue = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[9u].x;
    float sumValue1 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[9u].y;
    float sumValue2 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[9u].z;
    fragmentColor1.w = (fragmentScalarConstants1.packedValues[47u] < fragmentScalarConstants1.packedValues[44u]) ? fma(fragmentScalarConstants1.packedValues[44u], 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-fragmentScalarConstants1.packedValues[47u], 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue);
    float productValue12 = inverseLengthValue1 * varyingNormal0.x;
    float productValue13 = inverseLengthValue1 * varyingNormal0.y;
    float productValue14 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / (abs(productValue14) + (abs(productValue13) + abs(productValue12)));
    float productValue15 = quotientValue1 * productValue12;
    float productValue16 = quotientValue1 * productValue13;
    bool conditionValue1 = productValue14 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue16)) * ((productValue15 >= 0.0) ? sumValue3 : (-1.0))) : productValue15;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue15)) * ((productValue16 >= 0.0) ? sumValue3 : (-1.0))) : productValue16;
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[27u], sumValue2, fma(fragmentScalarConstants1.packedValues[19u], sumValue, sumValue1 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue2, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue3, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue2, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue3, 0.5, 0.5);
    bool bitwiseValue = (((fragmentScalarConstants1.packedValues[33u] + fragmentScalarConstants1.packedValues[32u]) + fragmentScalarConstants1.packedValues[34u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[48u] > 9.9999997473787516355514526367188e-05);
    float productValue17 = fragmentScalarConstants1.packedValues[48u] * fragmentScalarConstants1.packedValues[48u];
    float comparisonValue = (bitwiseValue ? spvNMin(productValue17, 1.0) : fragmentVectorConstants1.packedValues[8u].x) * 0.16666667163372039794921875;
    float multiplyAddValue4 = (bitwiseValue ? spvNMin(fma(fma(productValue17, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue17, 1.0) : fragmentVectorConstants1.packedValues[8u].y) * 0.16666667163372039794921875;
    float multiplyAddValue5 = (bitwiseValue ? spvNMin(fma(productValue17 * productValue17, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue17, 1.0) : fragmentVectorConstants1.packedValues[8u].z) * 0.16666667163372039794921875;
    float productValue18 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue4, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue5, comparisonValue)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue4 / productValue18, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue / productValue18, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue5 / productValue18, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue18, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(fragmentScalarConstants1.packedValues[49u], 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(fragmentVectorConstants1.packedValues[11u].y, 0.0, 1.0) * 255.0) + (uint(spvNClamp(fragmentVectorConstants1.packedValues[11u].z, 0.0, 1.0) * 255.0) * 256u);
    discardIfRequested();
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue17 = fragmentScalarConstants1.packedValues[48u] * fragmentScalarConstants1.packedValues[48u];
    bool bitwiseValue = (((fragmentScalarConstants1.packedValues[33u] + fragmentScalarConstants1.packedValues[32u]) + fragmentScalarConstants1.packedValues[34u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[48u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue = (bitwiseValue ? spvNMin(productValue17, 1.0) : fragmentVectorConstants1.packedValues[8u].x) * 0.16666667163372039794921875;
    float multiplyAddValue4 = (bitwiseValue ? spvNMin(fma(fma(productValue17, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue17, 1.0) : fragmentVectorConstants1.packedValues[8u].y) * 0.16666667163372039794921875;
    float multiplyAddValue5 = (bitwiseValue ? spvNMin(fma(productValue17 * productValue17, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue17, 1.0) : fragmentVectorConstants1.packedValues[8u].z) * 0.16666667163372039794921875;
    float productValue18 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue4, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue5, comparisonValue)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue / productValue18, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue4 / productValue18, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue5 / productValue18, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue18, 0.0, 1.0) * 255.0);
    fragmentColor0.x = (uint(spvNClamp(fragmentVectorConstants1.packedValues[11u].z, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(fragmentVectorConstants1.packedValues[11u].y, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(fragmentScalarConstants1.packedValues[49u], 0.0, 1.0) * 255.0);
    fragmentColor1.w = (fragmentScalarConstants1.packedValues[47u] < fragmentScalarConstants1.packedValues[44u]) ? fma(fragmentScalarConstants1.packedValues[44u], 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-fragmentScalarConstants1.packedValues[47u], 0.4980392158031463623046875, 0.4980392158031463623046875);
    fragmentColor1.x = varyingColor0.x * fragmentVectorConstants1.packedValues[10u].x;
    fragmentColor1.y = varyingColor0.y * fragmentVectorConstants1.packedValues[10u].y;
    fragmentColor1.z = varyingColor0.z * fragmentVectorConstants1.packedValues[10u].z;
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue19 = inverseLengthValue2 * varyingNormal0.x;
    float productValue20 = inverseLengthValue2 * varyingNormal0.y;
    float productValue21 = inverseLengthValue2 * varyingNormal0.z;
    float quotientValue2 = 1.0 / (abs(productValue21) + (abs(productValue20) + abs(productValue19)));
    float productValue22 = quotientValue2 * productValue19;
    float productValue23 = quotientValue2 * productValue20;
    bool conditionValue2 = productValue21 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue2 ? (((productValue22 >= 0.0) ? sumValue3 : (-1.0)) * (1.0 - abs(productValue23))) : productValue22;
    fragmentColor2.y = conditionValue2 ? (((productValue23 >= 0.0) ? sumValue3 : (-1.0)) * (1.0 - abs(productValue22))) : productValue23;
    float sumValue = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[9u].x;
    float sumValue1 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[9u].y;
    float sumValue2 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[9u].z;
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[27u], sumValue2, fma(fragmentScalarConstants1.packedValues[19u], sumValue, sumValue1 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue2, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue3, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue2, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue3, 0.5, 0.5);
#elif (RD_FEATURE_USE_TEXTURES == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_USE_TEXTURES == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    if (sampledTextureValue.w < 0.5)
    {
        isFragmentDiscarded = true;
    }
    float sumValue = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[9u].x;
    float sumValue1 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[9u].y;
    float sumValue2 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[9u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue = inverseLengthValue * varyingNormal0.x;
    float productValue1 = inverseLengthValue * varyingNormal0.y;
    float productValue2 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / ((abs(productValue1) + abs(productValue)) + abs(productValue2));
    float productValue3 = quotientValue * productValue;
    float productValue4 = quotientValue * productValue1;
    bool conditionValue = productValue2 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float intermediateValue1;
    float productValue6;
    float productValue7;
    if ((fragmentVectorConstants1.packedValues[12u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[8u].x + fragmentVectorConstants1.packedValues[8u].y) + fragmentVectorConstants1.packedValues[8u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue5 = fragmentVectorConstants1.packedValues[12u].x * fragmentVectorConstants1.packedValues[12u].x;
        intermediateValue1 = spvNClamp(productValue5, 0.0, 1.0);
        productValue6 = spvNClamp(((productValue5 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue5, 0.0, 1.0);
        productValue7 = spvNClamp((((productValue5 * productValue5) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue5, 0.0, 1.0);
    }
    else
    {
        intermediateValue1 = fragmentVectorConstants1.packedValues[8u].x;
        productValue6 = fragmentVectorConstants1.packedValues[8u].y;
        productValue7 = fragmentVectorConstants1.packedValues[8u].z;
    }
    float productValue8 = intermediateValue1 * 0.16666667163372039794921875;
    float productValue9 = productValue6 * 0.16666667163372039794921875;
    float productValue10 = productValue7 * 0.16666667163372039794921875;
    float productValue11 = ceil(spvNClamp(spvNMax(spvNMax(productValue8, productValue10), spvNMax(productValue9, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(fragmentVectorConstants1.packedValues[11u].z, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(fragmentVectorConstants1.packedValues[11u].y, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue8 / productValue11, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue9 / productValue11, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue10 / productValue11, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue11, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[12u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = (sampledTextureValue.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[10u].x;
    fragmentColor1.y = (sampledTextureValue.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[10u].y;
    fragmentColor1.z = (sampledTextureValue.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[10u].z;
    fragmentColor1.w = (fragmentVectorConstants1.packedValues[11u].x > fragmentVectorConstants1.packedValues[11u].w) ? ((fragmentVectorConstants1.packedValues[11u].x * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (fragmentVectorConstants1.packedValues[11u].w * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue3 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue4))) : productValue3;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue3)) * ((productValue4 < 0.0) ? (-1.0) : 1.0)) : productValue4;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue1)) * 0.5;
    discardIfRequested();
#elif (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_USE_TEXTURES == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[9u].x;
    float sumValue1 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[9u].y;
    float sumValue2 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[9u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue = inverseLengthValue * varyingNormal0.x;
    float productValue1 = inverseLengthValue * varyingNormal0.y;
    float productValue2 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / ((abs(productValue1) + abs(productValue)) + abs(productValue2));
    float productValue3 = quotientValue * productValue;
    float productValue4 = quotientValue * productValue1;
    bool conditionValue = productValue2 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float intermediateValue1;
    float productValue6;
    float productValue7;
    if ((fragmentVectorConstants1.packedValues[12u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[8u].x + fragmentVectorConstants1.packedValues[8u].y) + fragmentVectorConstants1.packedValues[8u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue5 = fragmentVectorConstants1.packedValues[12u].x * fragmentVectorConstants1.packedValues[12u].x;
        intermediateValue1 = spvNClamp(productValue5, 0.0, 1.0);
        productValue6 = spvNClamp(((productValue5 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue5, 0.0, 1.0);
        productValue7 = spvNClamp((((productValue5 * productValue5) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue5, 0.0, 1.0);
    }
    else
    {
        intermediateValue1 = fragmentVectorConstants1.packedValues[8u].x;
        productValue6 = fragmentVectorConstants1.packedValues[8u].y;
        productValue7 = fragmentVectorConstants1.packedValues[8u].z;
    }
    float productValue8 = intermediateValue1 * 0.16666667163372039794921875;
    float productValue9 = productValue6 * 0.16666667163372039794921875;
    float productValue10 = productValue7 * 0.16666667163372039794921875;
    float productValue11 = ceil(spvNClamp(spvNMax(spvNMax(productValue8, productValue10), spvNMax(productValue9, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(fragmentVectorConstants1.packedValues[11u].z, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(fragmentVectorConstants1.packedValues[11u].y, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue8 / productValue11, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue9 / productValue11, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue10 / productValue11, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue11, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[12u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = fragmentVectorConstants1.packedValues[10u].x * varyingColor0.x;
    fragmentColor1.y = fragmentVectorConstants1.packedValues[10u].y * varyingColor0.y;
    fragmentColor1.z = fragmentVectorConstants1.packedValues[10u].z * varyingColor0.z;
    fragmentColor1.w = (fragmentVectorConstants1.packedValues[11u].x > fragmentVectorConstants1.packedValues[11u].w) ? ((fragmentVectorConstants1.packedValues[11u].x * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (fragmentVectorConstants1.packedValues[11u].w * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue3 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue4))) : productValue3;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue3)) * ((productValue4 < 0.0) ? (-1.0) : 1.0)) : productValue4;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue1)) * 0.5;
#endif
}
