#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandPrepassGlint / GeometryPrepass / fragment forward pipeline.
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

#include "../../include/materials/ItemInHandPrepassGlint/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue23 = fragmentScalarConstants1.packedValues[60u] * fragmentScalarConstants1.packedValues[60u];
    bool bitwiseValue = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[60u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue = (bitwiseValue ? spvNMin(productValue23, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue2 = (bitwiseValue ? spvNMin(fma(fma(productValue23, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue23, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue3 = (bitwiseValue ? spvNMin(fma(productValue23 * productValue23, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue23, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue24 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue2, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue3, comparisonValue)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue / productValue24, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue2 / productValue24, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue3 / productValue24, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue24, 0.0, 1.0) * 255.0);
    fragmentColor0.x = (uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(fragmentScalarConstants1.packedValues[61u], 0.0, 1.0) * 255.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue7 = fma(varyingColor0.w, fma(multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue4), multiplyAddValue4);
    float multiplyAddValue8 = fma(varyingColor0.w, fma(multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue5), multiplyAddValue5);
    float multiplyAddValue9 = fma(varyingColor0.w, fma(multiplyAddValue6, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue6), multiplyAddValue6);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue10 = fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[13u].x, sampledTextureValue2.x * fragmentVectorConstants1.packedValues[13u].x) * fragmentVectorConstants1.packedValues[14u].x;
    float multiplyAddValue11 = fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[13u].y, sampledTextureValue2.y * fragmentVectorConstants1.packedValues[13u].y) * fragmentVectorConstants1.packedValues[14u].y;
    float multiplyAddValue12 = fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[13u].z, sampledTextureValue2.z * fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[14u].z;
    fragmentColor1.x = fma(multiplyAddValue10, multiplyAddValue10, fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].x - multiplyAddValue7, multiplyAddValue7));
    fragmentColor1.y = fma(multiplyAddValue11, multiplyAddValue11, fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].y - multiplyAddValue8, multiplyAddValue8));
    fragmentColor1.z = fma(multiplyAddValue12, multiplyAddValue12, fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].z - multiplyAddValue9, multiplyAddValue9));
    fragmentColor1.w = (varyingTexCoord8.w < varyingTexCoord8.x) ? fma(varyingTexCoord8.x, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-varyingTexCoord8.w, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue25 = inverseLengthValue1 * varyingNormal0.x;
    float productValue26 = inverseLengthValue1 * varyingNormal0.y;
    float productValue27 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / (abs(productValue27) + (abs(productValue26) + abs(productValue25)));
    float productValue28 = quotientValue1 * productValue25;
    float productValue29 = quotientValue1 * productValue26;
    bool conditionValue1 = productValue27 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? (((productValue28 >= 0.0) ? sumValue3 : (-1.0)) * (1.0 - abs(productValue29))) : productValue28;
    fragmentColor2.y = conditionValue1 ? (((productValue29 >= 0.0) ? sumValue3 : (-1.0)) * (1.0 - abs(productValue28))) : productValue29;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue44 = fragmentScalarConstants1.packedValues[64u] * fragmentScalarConstants1.packedValues[64u];
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[64u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue1 = (bitwiseValue1 ? spvNMin(productValue44, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue15 = (bitwiseValue1 ? spvNMin(fma(fma(productValue44, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue44, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue16 = (bitwiseValue1 ? spvNMin(fma(productValue44 * productValue44, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue44, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue45 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue15, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue16, comparisonValue1)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue1 / productValue45, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue15 / productValue45, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue16 / productValue45, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue45, 0.0, 1.0) * 255.0);
    fragmentColor0.x = (uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(fragmentScalarConstants1.packedValues[65u], 0.0, 1.0) * 255.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float productValue46 = multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue47 = multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue48 = multiplyAddValue4 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue1 = ceil(multiplyAddValue5);
    float multiplyAddValue17 = fma(scalarValue1, fma(multiplyAddValue5, fragmentVectorConstants1.packedValues[14u].x, -productValue46), productValue46);
    float multiplyAddValue18 = fma(scalarValue1, fma(multiplyAddValue5, fragmentVectorConstants1.packedValues[14u].y, -productValue47), productValue47);
    float multiplyAddValue19 = fma(scalarValue1, fma(multiplyAddValue5, fragmentVectorConstants1.packedValues[14u].z, -productValue48), productValue48);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue20 = fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[13u].x, sampledTextureValue2.x * fragmentVectorConstants1.packedValues[13u].x) * fragmentVectorConstants1.packedValues[15u].x;
    float multiplyAddValue21 = fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[13u].y, sampledTextureValue2.y * fragmentVectorConstants1.packedValues[13u].y) * fragmentVectorConstants1.packedValues[15u].y;
    float multiplyAddValue22 = fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[13u].z, sampledTextureValue2.z * fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[15u].z;
    fragmentColor1.x = fma(multiplyAddValue20, multiplyAddValue20, fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].x - multiplyAddValue17, multiplyAddValue17));
    fragmentColor1.y = fma(multiplyAddValue21, multiplyAddValue21, fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].y - multiplyAddValue18, multiplyAddValue18));
    fragmentColor1.z = fma(multiplyAddValue22, multiplyAddValue22, fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].z - multiplyAddValue19, multiplyAddValue19));
    fragmentColor1.w = (varyingTexCoord8.w < varyingTexCoord8.x) ? fma(varyingTexCoord8.x, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-varyingTexCoord8.w, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue25 = inverseLengthValue1 * varyingNormal0.x;
    float productValue26 = inverseLengthValue1 * varyingNormal0.y;
    float productValue27 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / (abs(productValue27) + (abs(productValue26) + abs(productValue25)));
    float productValue28 = quotientValue1 * productValue25;
    float productValue29 = quotientValue1 * productValue26;
    bool conditionValue1 = productValue27 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? (((productValue28 >= 0.0) ? sumValue3 : (-1.0)) * (1.0 - abs(productValue29))) : productValue28;
    fragmentColor2.y = conditionValue1 ? (((productValue29 >= 0.0) ? sumValue3 : (-1.0)) * (1.0 - abs(productValue28))) : productValue29;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue2 = (fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0;
    float productValue3 = (((productValue * fragmentVectorConstants1.packedValues[0u].x) - productValue) * varyingColor0.w) + productValue;
    float productValue4 = (((productValue1 * fragmentVectorConstants1.packedValues[0u].y) - productValue1) * varyingColor0.w) + productValue1;
    float productValue5 = (((productValue2 * fragmentVectorConstants1.packedValues[0u].z) - productValue2) * varyingColor0.w) + productValue2;
    vec4 sampledTextureValue = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue1 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue6 = (fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[14u].x) * (sampledTextureValue1.x + sampledTextureValue.x);
    float productValue7 = (fragmentVectorConstants1.packedValues[13u].y * fragmentVectorConstants1.packedValues[14u].y) * (sampledTextureValue1.y + sampledTextureValue.y);
    float productValue8 = (fragmentVectorConstants1.packedValues[13u].z * fragmentVectorConstants1.packedValues[14u].z) * (sampledTextureValue1.z + sampledTextureValue.z);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0;
    float productValue1 = (fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0;
    float productValue30 = productValue * fragmentVectorConstants1.packedValues[0u].x;
    float productValue31 = productValue * fragmentVectorConstants1.packedValues[0u].y;
    float productValue32 = productValue * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue = ceil(productValue1);
    float productValue33 = (((productValue1 * fragmentVectorConstants1.packedValues[14u].x) - productValue30) * scalarValue) + productValue30;
    float productValue34 = (((productValue1 * fragmentVectorConstants1.packedValues[14u].y) - productValue31) * scalarValue) + productValue31;
    float productValue35 = (((productValue1 * fragmentVectorConstants1.packedValues[14u].z) - productValue32) * scalarValue) + productValue32;
    vec4 sampledTextureValue = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue1 = texture(sampler2D(glintTextureTexture, glintTextureSampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue36 = (fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[15u].x) * (sampledTextureValue1.x + sampledTextureValue.x);
    float productValue37 = (fragmentVectorConstants1.packedValues[13u].y * fragmentVectorConstants1.packedValues[15u].y) * (sampledTextureValue1.y + sampledTextureValue.y);
    float productValue38 = (fragmentVectorConstants1.packedValues[13u].z * fragmentVectorConstants1.packedValues[15u].z) * (sampledTextureValue1.z + sampledTextureValue.z);
#endif
    float sumValue = varyingTexCoord5.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue1 = varyingTexCoord5.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue2 = varyingTexCoord5.z - fragmentVectorConstants1.packedValues[11u].z;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[35u], sumValue2, fma(fragmentScalarConstants1.packedValues[27u], sumValue, sumValue1 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue14, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue13, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue14, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue13, 0.5, 0.5);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue9 = inverseLengthValue * varyingNormal0.x;
    float productValue10 = inverseLengthValue * varyingNormal0.y;
    float productValue11 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / ((abs(productValue10) + abs(productValue9)) + abs(productValue11));
    float productValue12 = quotientValue * productValue9;
    float productValue13 = quotientValue * productValue10;
    bool conditionValue = productValue11 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue1;
    float productValue15;
    float productValue16;
    if ((fragmentVectorConstants1.packedValues[15u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue14 = fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[15u].x;
        intermediateValue1 = spvNClamp(productValue14, 0.0, 1.0);
        productValue15 = spvNClamp(((productValue14 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue14, 0.0, 1.0);
        productValue16 = spvNClamp((((productValue14 * productValue14) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue14, 0.0, 1.0);
    }
    else
    {
        intermediateValue1 = fragmentVectorConstants1.packedValues[10u].x;
        productValue15 = fragmentVectorConstants1.packedValues[10u].y;
        productValue16 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue19 = intermediateValue1 * 0.16666667163372039794921875;
    float productValue20 = productValue15 * 0.16666667163372039794921875;
    float productValue21 = productValue16 * 0.16666667163372039794921875;
    float productValue22 = ceil(spvNClamp(spvNMax(spvNMax(productValue19, productValue21), spvNMax(productValue20, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue19 / productValue22, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue20 / productValue22, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue21 / productValue22, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue22, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[15u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[5u].x - productValue3) * fragmentVectorConstants1.packedValues[5u].w) + productValue3) + (productValue6 * productValue6);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[5u].y - productValue4) * fragmentVectorConstants1.packedValues[5u].w) + productValue4) + (productValue7 * productValue7);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[5u].z - productValue5) * fragmentVectorConstants1.packedValues[5u].w) + productValue5) + (productValue8 * productValue8);
    fragmentColor1.w = (varyingTexCoord8.x > varyingTexCoord8.w) ? ((varyingTexCoord8.x * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (varyingTexCoord8.w * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue12 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue13))) : productValue12;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue12)) * ((productValue13 < 0.0) ? (-1.0) : 1.0)) : productValue13;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue1)) * 0.5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue9 = inverseLengthValue * varyingNormal0.x;
    float productValue10 = inverseLengthValue * varyingNormal0.y;
    float productValue11 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / ((abs(productValue10) + abs(productValue9)) + abs(productValue11));
    float productValue12 = quotientValue * productValue9;
    float productValue13 = quotientValue * productValue10;
    bool conditionValue = productValue11 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue2;
    float productValue17;
    float productValue18;
    if ((fragmentVectorConstants1.packedValues[16u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue39 = fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[16u].x;
        intermediateValue2 = spvNClamp(productValue39, 0.0, 1.0);
        productValue17 = spvNClamp(((productValue39 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue39, 0.0, 1.0);
        productValue18 = spvNClamp((((productValue39 * productValue39) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue39, 0.0, 1.0);
    }
    else
    {
        intermediateValue2 = fragmentVectorConstants1.packedValues[10u].x;
        productValue17 = fragmentVectorConstants1.packedValues[10u].y;
        productValue18 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue40 = intermediateValue2 * 0.16666667163372039794921875;
    float productValue41 = productValue17 * 0.16666667163372039794921875;
    float productValue42 = productValue18 * 0.16666667163372039794921875;
    float productValue43 = ceil(spvNClamp(spvNMax(spvNMax(productValue40, productValue42), spvNMax(productValue41, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(varyingTexCoord8.z, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(varyingTexCoord8.y, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue40 / productValue43, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue41 / productValue43, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue42 / productValue43, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue43, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[16u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[5u].x - productValue33) * fragmentVectorConstants1.packedValues[5u].w) + productValue33) + (productValue36 * productValue36);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[5u].y - productValue34) * fragmentVectorConstants1.packedValues[5u].w) + productValue34) + (productValue37 * productValue37);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[5u].z - productValue35) * fragmentVectorConstants1.packedValues[5u].w) + productValue35) + (productValue38 * productValue38);
    fragmentColor1.w = (varyingTexCoord8.x > varyingTexCoord8.w) ? ((varyingTexCoord8.x * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (varyingTexCoord8.w * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue12 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue13))) : productValue12;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue12)) * ((productValue13 < 0.0) ? (-1.0) : 1.0)) : productValue13;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue1)) * 0.5;
#endif
}
