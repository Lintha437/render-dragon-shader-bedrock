#version 460
#extension GL_GOOGLE_include_directive : require
// ActorTintPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/ActorTintPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue = fragmentScalarConstants1.packedValues[48u] * fragmentScalarConstants1.packedValues[48u];
    bool bitwiseValue = (((fragmentScalarConstants1.packedValues[37u] + fragmentScalarConstants1.packedValues[36u]) + fragmentScalarConstants1.packedValues[38u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[48u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue = (bitwiseValue ? spvNMin(productValue, 1.0) : fragmentVectorConstants1.packedValues[9u].x) * 0.16666667163372039794921875;
    float multiplyAddValue = (bitwiseValue ? spvNMin(fma(fma(productValue, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue, 1.0) : fragmentVectorConstants1.packedValues[9u].y) * 0.16666667163372039794921875;
    float multiplyAddValue1 = (bitwiseValue ? spvNMin(fma(productValue * productValue, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue, 1.0) : fragmentVectorConstants1.packedValues[9u].z) * 0.16666667163372039794921875;
    float productValue1 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue1, comparisonValue)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue / productValue1, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue / productValue1, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue1 / productValue1, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue1, 0.0, 1.0) * 255.0);
    uint productValue2 = uint(floor(fragmentScalarConstants1.packedValues[39u] * 255.0));
    fragmentColor0.w = (uint(spvNClamp(fragmentScalarConstants1.packedValues[49u], 0.0, 1.0) * 255.0) + (((productValue2 & 1u) != 0u) ? 256u : 0u)) + (((productValue2 & 2u) != 0u) ? 512u : 0u);
    fragmentColor0.x = 32512u;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue3 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[13u].x;
    float productValue4 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[13u].y;
    float productValue5 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[13u].z;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float multiplyAddValue2 = fma(scalarValue, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[14u].x, -productValue3), productValue3);
    float multiplyAddValue3 = fma(scalarValue, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[14u].y, -productValue4), productValue4);
    float multiplyAddValue4 = fma(scalarValue, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[14u].z, -productValue5), productValue5);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[19u], fma(-multiplyAddValue2, multiplyAddValue5, fragmentVectorConstants1.packedValues[4u].x), multiplyAddValue2 * multiplyAddValue5);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[19u], fma(-multiplyAddValue3, multiplyAddValue6, fragmentVectorConstants1.packedValues[4u].y), multiplyAddValue3 * multiplyAddValue6);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[19u], fma(-multiplyAddValue4, multiplyAddValue7, fragmentVectorConstants1.packedValues[4u].z), multiplyAddValue4 * multiplyAddValue7);
    fragmentColor1.w = 0.4980392158031463623046875;
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue6 = inverseLengthValue * varyingNormal0.x;
    float productValue7 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / (abs(productValue8) + (abs(productValue7) + abs(productValue6)));
    float productValue9 = quotientValue * productValue6;
    float productValue10 = quotientValue * productValue7;
    bool conditionValue = productValue8 < 0.0;
    float sumValue = 2.0 - 1.0;
    fragmentColor2.x = conditionValue ? (((productValue9 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue10))) : productValue9;
    fragmentColor2.y = conditionValue ? (((productValue10 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue9))) : productValue10;
    float sumValue1 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[10u].x;
    float sumValue2 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[10u].y;
    float sumValue3 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[10u].z;
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[31u], sumValue3, fma(fragmentScalarConstants1.packedValues[23u], sumValue1, sumValue2 * fragmentScalarConstants1.packedValues[27u])) + fragmentScalarConstants1.packedValues[35u];
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue9, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[7u].x, sumValue3, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue1, sumValue2 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[8u].x) / multiplyAddValue8, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue9, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[7u].y, sumValue3, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue1, sumValue2 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[8u].y) / multiplyAddValue8, 0.5, 0.5);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue = fragmentScalarConstants1.packedValues[48u] * fragmentScalarConstants1.packedValues[48u];
    bool bitwiseValue = (((fragmentScalarConstants1.packedValues[37u] + fragmentScalarConstants1.packedValues[36u]) + fragmentScalarConstants1.packedValues[38u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[48u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue = (bitwiseValue ? spvNMin(productValue, 1.0) : fragmentVectorConstants1.packedValues[9u].x) * 0.16666667163372039794921875;
    float multiplyAddValue = (bitwiseValue ? spvNMin(fma(fma(productValue, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue, 1.0) : fragmentVectorConstants1.packedValues[9u].y) * 0.16666667163372039794921875;
    float multiplyAddValue1 = (bitwiseValue ? spvNMin(fma(productValue * productValue, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue, 1.0) : fragmentVectorConstants1.packedValues[9u].z) * 0.16666667163372039794921875;
    float productValue1 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue1, comparisonValue)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue / productValue1, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue / productValue1, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue1 / productValue1, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue1, 0.0, 1.0) * 255.0);
    uint productValue2 = uint(floor(fragmentScalarConstants1.packedValues[39u] * 255.0));
    fragmentColor0.w = (uint(spvNClamp(fragmentScalarConstants1.packedValues[49u], 0.0, 1.0) * 255.0) + (((productValue2 & 1u) != 0u) ? 256u : 0u)) + (((productValue2 & 2u) != 0u) ? 512u : 0u);
    fragmentColor0.x = 32512u;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    bool productValue44 = ((1.0 - scalarValue) * (scalarValue7 + (scalarValue6 + scalarValue5))) > 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue12 = productValue44 ? (fma(fragmentVectorConstants1.packedValues[13u].x, sampledTextureValue.x, -scalarValue5) + scalarValue5) : scalarValue5;
    float multiplyAddValue13 = productValue44 ? (fma(fragmentVectorConstants1.packedValues[13u].y, sampledTextureValue.y, -scalarValue6) + scalarValue6) : scalarValue6;
    float multiplyAddValue14 = productValue44 ? (fma(fragmentVectorConstants1.packedValues[13u].z, sampledTextureValue.z, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue15 = fma(scalarValue, fma(scalarValue5, fragmentVectorConstants1.packedValues[14u].x, -multiplyAddValue12), multiplyAddValue12);
    float multiplyAddValue16 = fma(scalarValue, fma(scalarValue6, fragmentVectorConstants1.packedValues[14u].y, -multiplyAddValue13), multiplyAddValue13);
    float multiplyAddValue17 = fma(scalarValue, fma(scalarValue7, fragmentVectorConstants1.packedValues[14u].z, -multiplyAddValue14), multiplyAddValue14);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[19u], fma(-multiplyAddValue15, multiplyAddValue5, fragmentVectorConstants1.packedValues[4u].x), multiplyAddValue15 * multiplyAddValue5);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[19u], fma(-multiplyAddValue16, multiplyAddValue6, fragmentVectorConstants1.packedValues[4u].y), multiplyAddValue16 * multiplyAddValue6);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[19u], fma(-multiplyAddValue17, multiplyAddValue7, fragmentVectorConstants1.packedValues[4u].z), multiplyAddValue17 * multiplyAddValue7);
    fragmentColor1.w = 0.4980392158031463623046875;
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue6 = inverseLengthValue * varyingNormal0.x;
    float productValue7 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / (abs(productValue8) + (abs(productValue7) + abs(productValue6)));
    float productValue9 = quotientValue * productValue6;
    float productValue10 = quotientValue * productValue7;
    bool conditionValue = productValue8 < 0.0;
    float sumValue = 2.0 - 1.0;
    fragmentColor2.x = conditionValue ? (((productValue9 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue10))) : productValue9;
    fragmentColor2.y = conditionValue ? (((productValue10 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue9))) : productValue10;
    float sumValue1 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[10u].x;
    float sumValue2 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[10u].y;
    float sumValue3 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[10u].z;
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[31u], sumValue3, fma(fragmentScalarConstants1.packedValues[23u], sumValue1, sumValue2 * fragmentScalarConstants1.packedValues[27u])) + fragmentScalarConstants1.packedValues[35u];
    float multiplyAddValue9 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue9, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[7u].x, sumValue3, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue1, sumValue2 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[8u].x) / multiplyAddValue8, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue9, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[7u].y, sumValue3, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue1, sumValue2 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[8u].y) / multiplyAddValue8, 0.5, 0.5);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue71 = fragmentScalarConstants1.packedValues[52u] * fragmentScalarConstants1.packedValues[52u];
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[52u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue1 = (bitwiseValue3 ? spvNMin(productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue20 = (bitwiseValue3 ? spvNMin(fma(fma(productValue71, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue21 = (bitwiseValue3 ? spvNMin(fma(productValue71 * productValue71, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue72 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue20, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue21, comparisonValue1)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue1 / productValue72, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue20 / productValue72, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue21 / productValue72, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue72, 0.0, 1.0) * 255.0);
    uint productValue73 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = (uint(spvNClamp(fragmentScalarConstants1.packedValues[53u], 0.0, 1.0) * 255.0) + (((productValue73 & 1u) != 0u) ? 256u : 0u)) + (((productValue73 & 2u) != 0u) ? 512u : 0u);
    fragmentColor0.x = 32512u;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue74 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[14u].x;
    float productValue75 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[14u].y;
    float productValue76 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[14u].z;
    float productValue77 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[14u].w;
    float multiplyAddValue22 = fma(productValue77, fma(productValue74, fragmentVectorConstants1.packedValues[0u].x, -productValue74), productValue74);
    float multiplyAddValue23 = fma(productValue77, fma(productValue75, fragmentVectorConstants1.packedValues[0u].y, -productValue75), productValue75);
    float multiplyAddValue24 = fma(productValue77, fma(productValue76, fragmentVectorConstants1.packedValues[0u].z, -productValue76), productValue76);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float multiplyAddValue25 = fma(scalarValue, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[15u].x, -multiplyAddValue22), multiplyAddValue22);
    float multiplyAddValue26 = fma(scalarValue, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[15u].y, -multiplyAddValue23), multiplyAddValue23);
    float multiplyAddValue27 = fma(scalarValue, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[15u].z, -multiplyAddValue24), multiplyAddValue24);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue25, multiplyAddValue28, fragmentVectorConstants1.packedValues[5u].x), multiplyAddValue25 * multiplyAddValue28);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue26, multiplyAddValue29, fragmentVectorConstants1.packedValues[5u].y), multiplyAddValue26 * multiplyAddValue29);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue27, multiplyAddValue30, fragmentVectorConstants1.packedValues[5u].z), multiplyAddValue27 * multiplyAddValue30);
    fragmentColor1.w = 0.4980392158031463623046875;
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue6 = inverseLengthValue * varyingNormal0.x;
    float productValue7 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / (abs(productValue8) + (abs(productValue7) + abs(productValue6)));
    float productValue9 = quotientValue * productValue6;
    float productValue10 = quotientValue * productValue7;
    bool conditionValue = productValue8 < 0.0;
    float sumValue = 2.0 - 1.0;
    fragmentColor2.x = conditionValue ? (((productValue9 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue10))) : productValue9;
    fragmentColor2.y = conditionValue ? (((productValue10 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue9))) : productValue10;
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[35u], sumValue6, fma(fragmentScalarConstants1.packedValues[27u], sumValue4, sumValue5 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue32, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue31, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue32, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue31, 0.5, 0.5);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue71 = fragmentScalarConstants1.packedValues[52u] * fragmentScalarConstants1.packedValues[52u];
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[52u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue1 = (bitwiseValue3 ? spvNMin(productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue20 = (bitwiseValue3 ? spvNMin(fma(fma(productValue71, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue21 = (bitwiseValue3 ? spvNMin(fma(productValue71 * productValue71, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue72 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue20, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue21, comparisonValue1)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue1 / productValue72, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue20 / productValue72, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue21 / productValue72, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue72, 0.0, 1.0) * 255.0);
    uint productValue73 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = (uint(spvNClamp(fragmentScalarConstants1.packedValues[53u], 0.0, 1.0) * 255.0) + (((productValue73 & 1u) != 0u) ? 256u : 0u)) + (((productValue73 & 2u) != 0u) ? 512u : 0u);
    fragmentColor0.x = 32512u;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    bool productValue44 = ((1.0 - scalarValue) * (scalarValue7 + (scalarValue6 + scalarValue5))) > 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue33 = productValue44 ? (fma(fragmentVectorConstants1.packedValues[14u].x, sampledTextureValue.x, -scalarValue5) + scalarValue5) : scalarValue5;
    float multiplyAddValue34 = productValue44 ? (fma(fragmentVectorConstants1.packedValues[14u].y, sampledTextureValue.y, -scalarValue6) + scalarValue6) : scalarValue6;
    float multiplyAddValue35 = productValue44 ? (fma(fragmentVectorConstants1.packedValues[14u].z, sampledTextureValue.z, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue36 = productValue44 ? (fma(fragmentVectorConstants1.packedValues[14u].w, sampledTextureValue.w, -scalarValue) + scalarValue) : scalarValue;
    float multiplyAddValue37 = fma(multiplyAddValue36, fma(multiplyAddValue33, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue33), multiplyAddValue33);
    float multiplyAddValue38 = fma(multiplyAddValue36, fma(multiplyAddValue34, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue34), multiplyAddValue34);
    float multiplyAddValue39 = fma(multiplyAddValue36, fma(multiplyAddValue35, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue35), multiplyAddValue35);
    float multiplyAddValue40 = fma(scalarValue, fma(scalarValue5, fragmentVectorConstants1.packedValues[15u].x, -multiplyAddValue37), multiplyAddValue37);
    float multiplyAddValue41 = fma(scalarValue, fma(scalarValue6, fragmentVectorConstants1.packedValues[15u].y, -multiplyAddValue38), multiplyAddValue38);
    float multiplyAddValue42 = fma(scalarValue, fma(scalarValue7, fragmentVectorConstants1.packedValues[15u].z, -multiplyAddValue39), multiplyAddValue39);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue40, multiplyAddValue28, fragmentVectorConstants1.packedValues[5u].x), multiplyAddValue40 * multiplyAddValue28);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue41, multiplyAddValue29, fragmentVectorConstants1.packedValues[5u].y), multiplyAddValue41 * multiplyAddValue29);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue42, multiplyAddValue30, fragmentVectorConstants1.packedValues[5u].z), multiplyAddValue42 * multiplyAddValue30);
    fragmentColor1.w = 0.4980392158031463623046875;
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue6 = inverseLengthValue * varyingNormal0.x;
    float productValue7 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / (abs(productValue8) + (abs(productValue7) + abs(productValue6)));
    float productValue9 = quotientValue * productValue6;
    float productValue10 = quotientValue * productValue7;
    bool conditionValue = productValue8 < 0.0;
    float sumValue = 2.0 - 1.0;
    fragmentColor2.x = conditionValue ? (((productValue9 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue10))) : productValue9;
    fragmentColor2.y = conditionValue ? (((productValue10 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue9))) : productValue10;
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[35u], sumValue6, fma(fragmentScalarConstants1.packedValues[27u], sumValue4, sumValue5 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue32, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue31, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue32, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue31, 0.5, 0.5);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue71 = fragmentScalarConstants1.packedValues[52u] * fragmentScalarConstants1.packedValues[52u];
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[52u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue1 = (bitwiseValue3 ? spvNMin(productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue20 = (bitwiseValue3 ? spvNMin(fma(fma(productValue71, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue21 = (bitwiseValue3 ? spvNMin(fma(productValue71 * productValue71, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue72 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue20, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue21, comparisonValue1)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue1 / productValue72, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue20 / productValue72, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue21 / productValue72, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue72, 0.0, 1.0) * 255.0);
    uint productValue73 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = (uint(spvNClamp(fragmentScalarConstants1.packedValues[53u], 0.0, 1.0) * 255.0) + (((productValue73 & 1u) != 0u) ? 256u : 0u)) + (((productValue73 & 2u) != 0u) ? 512u : 0u);
    fragmentColor0.x = 32512u;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue74 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[14u].x;
    float productValue75 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[14u].y;
    float productValue89 = productValue74 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue90 = productValue74 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue91 = productValue74 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue9 = ceil(productValue75);
    float multiplyAddValue43 = fma(scalarValue9, fma(productValue75, fragmentVectorConstants1.packedValues[15u].x, -productValue89), productValue89);
    float multiplyAddValue44 = fma(scalarValue9, fma(productValue75, fragmentVectorConstants1.packedValues[15u].y, -productValue90), productValue90);
    float multiplyAddValue45 = fma(scalarValue9, fma(productValue75, fragmentVectorConstants1.packedValues[15u].z, -productValue91), productValue91);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float multiplyAddValue46 = fma(scalarValue, fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[15u].x, -multiplyAddValue43), multiplyAddValue43);
    float multiplyAddValue47 = fma(scalarValue, fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[15u].y, -multiplyAddValue44), multiplyAddValue44);
    float multiplyAddValue48 = fma(scalarValue, fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[15u].z, -multiplyAddValue45), multiplyAddValue45);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue46, multiplyAddValue28, fragmentVectorConstants1.packedValues[5u].x), multiplyAddValue46 * multiplyAddValue28);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue47, multiplyAddValue29, fragmentVectorConstants1.packedValues[5u].y), multiplyAddValue47 * multiplyAddValue29);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue48, multiplyAddValue30, fragmentVectorConstants1.packedValues[5u].z), multiplyAddValue48 * multiplyAddValue30);
    fragmentColor1.w = 0.4980392158031463623046875;
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue6 = inverseLengthValue * varyingNormal0.x;
    float productValue7 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / (abs(productValue8) + (abs(productValue7) + abs(productValue6)));
    float productValue9 = quotientValue * productValue6;
    float productValue10 = quotientValue * productValue7;
    bool conditionValue = productValue8 < 0.0;
    float sumValue = 2.0 - 1.0;
    fragmentColor2.x = conditionValue ? (((productValue9 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue10))) : productValue9;
    fragmentColor2.y = conditionValue ? (((productValue10 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue9))) : productValue10;
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[35u], sumValue6, fma(fragmentScalarConstants1.packedValues[27u], sumValue4, sumValue5 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue32, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue31, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue32, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue31, 0.5, 0.5);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue71 = fragmentScalarConstants1.packedValues[52u] * fragmentScalarConstants1.packedValues[52u];
    bool bitwiseValue3 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[52u] > 9.9999997473787516355514526367188e-05);
    float comparisonValue1 = (bitwiseValue3 ? spvNMin(productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue20 = (bitwiseValue3 ? spvNMin(fma(fma(productValue71, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue21 = (bitwiseValue3 ? spvNMin(fma(productValue71 * productValue71, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue71, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue72 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue20, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue21, comparisonValue1)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(comparisonValue1 / productValue72, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue20 / productValue72, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue21 / productValue72, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue72, 0.0, 1.0) * 255.0);
    uint productValue73 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = (uint(spvNClamp(fragmentScalarConstants1.packedValues[53u], 0.0, 1.0) * 255.0) + (((productValue73 & 1u) != 0u) ? 256u : 0u)) + (((productValue73 & 2u) != 0u) ? 512u : 0u);
    fragmentColor0.x = 32512u;
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    bool productValue44 = ((1.0 - scalarValue) * (scalarValue7 + (scalarValue6 + scalarValue5))) > 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue33 = productValue44 ? (fma(fragmentVectorConstants1.packedValues[14u].x, sampledTextureValue.x, -scalarValue5) + scalarValue5) : scalarValue5;
    float multiplyAddValue34 = productValue44 ? (fma(fragmentVectorConstants1.packedValues[14u].y, sampledTextureValue.y, -scalarValue6) + scalarValue6) : scalarValue6;
    float productValue104 = multiplyAddValue33 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue105 = multiplyAddValue33 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue106 = multiplyAddValue33 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue11 = ceil(multiplyAddValue34);
    float multiplyAddValue49 = fma(scalarValue11, fma(multiplyAddValue34, fragmentVectorConstants1.packedValues[15u].x, -productValue104), productValue104);
    float multiplyAddValue50 = fma(scalarValue11, fma(multiplyAddValue34, fragmentVectorConstants1.packedValues[15u].y, -productValue105), productValue105);
    float multiplyAddValue51 = fma(scalarValue11, fma(multiplyAddValue34, fragmentVectorConstants1.packedValues[15u].z, -productValue106), productValue106);
    float multiplyAddValue52 = fma(scalarValue, fma(scalarValue5, fragmentVectorConstants1.packedValues[15u].x, -multiplyAddValue49), multiplyAddValue49);
    float multiplyAddValue53 = fma(scalarValue, fma(scalarValue6, fragmentVectorConstants1.packedValues[15u].y, -multiplyAddValue50), multiplyAddValue50);
    float multiplyAddValue54 = fma(scalarValue, fma(scalarValue7, fragmentVectorConstants1.packedValues[15u].z, -multiplyAddValue51), multiplyAddValue51);
    float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue52, multiplyAddValue28, fragmentVectorConstants1.packedValues[5u].x), multiplyAddValue52 * multiplyAddValue28);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue53, multiplyAddValue29, fragmentVectorConstants1.packedValues[5u].y), multiplyAddValue53 * multiplyAddValue29);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fma(-multiplyAddValue54, multiplyAddValue30, fragmentVectorConstants1.packedValues[5u].z), multiplyAddValue54 * multiplyAddValue30);
    fragmentColor1.w = 0.4980392158031463623046875;
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue6 = inverseLengthValue * varyingNormal0.x;
    float productValue7 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / (abs(productValue8) + (abs(productValue7) + abs(productValue6)));
    float productValue9 = quotientValue * productValue6;
    float productValue10 = quotientValue * productValue7;
    bool conditionValue = productValue8 < 0.0;
    float sumValue = 2.0 - 1.0;
    fragmentColor2.x = conditionValue ? (((productValue9 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue10))) : productValue9;
    fragmentColor2.y = conditionValue ? (((productValue10 >= 0.0) ? sumValue : (-1.0)) * (1.0 - abs(productValue9))) : productValue10;
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[35u], sumValue6, fma(fragmentScalarConstants1.packedValues[27u], sumValue4, sumValue5 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue32, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue31, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue32, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue31, 0.5, 0.5);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue11 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[13u].x;
    float productValue15 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[13u].y;
    float productValue20 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[13u].z;
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    float productValue21 = ((((fragmentVectorConstants1.packedValues[14u].x * sampledTextureValue3.x) - productValue11) * scalarValue1) + productValue11) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue22 = ((((fragmentVectorConstants1.packedValues[14u].y * sampledTextureValue3.y) - productValue15) * scalarValue1) + productValue15) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue23 = ((((fragmentVectorConstants1.packedValues[14u].z * sampledTextureValue3.z) - productValue20) * scalarValue1) + productValue20) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float sumValue1 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[10u].x;
    float sumValue2 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[10u].y;
    float sumValue3 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[10u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue24 = inverseLengthValue1 * varyingNormal0.x;
    float productValue25 = inverseLengthValue1 * varyingNormal0.y;
    float productValue26 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / ((abs(productValue25) + abs(productValue24)) + abs(productValue26));
    float productValue27 = quotientValue1 * productValue24;
    float productValue28 = quotientValue1 * productValue25;
    bool conditionValue1 = productValue26 < 0.0;
    float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[7u].w, sumValue3, fma(fragmentVectorConstants1.packedValues[6u].w, sumValue2, sumValue1 * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[8u].w;
    float intermediateValue2;
    float productValue12;
    float productValue13;
    if ((fragmentVectorConstants1.packedValues[12u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[9u].x + fragmentVectorConstants1.packedValues[9u].y) + fragmentVectorConstants1.packedValues[9u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue29 = fragmentVectorConstants1.packedValues[12u].x * fragmentVectorConstants1.packedValues[12u].x;
        intermediateValue2 = spvNClamp(productValue29, 0.0, 1.0);
        productValue12 = spvNClamp(((productValue29 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue29, 0.0, 1.0);
        productValue13 = spvNClamp((((productValue29 * productValue29) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue29, 0.0, 1.0);
    }
    else
    {
        intermediateValue2 = fragmentVectorConstants1.packedValues[9u].x;
        productValue12 = fragmentVectorConstants1.packedValues[9u].y;
        productValue13 = fragmentVectorConstants1.packedValues[9u].z;
    }
    float productValue30 = intermediateValue2 * 0.16666667163372039794921875;
    float productValue31 = productValue12 * 0.16666667163372039794921875;
    float productValue32 = productValue13 * 0.16666667163372039794921875;
    float productValue33 = ceil(spvNClamp(spvNMax(spvNMax(productValue30, productValue32), spvNMax(productValue31, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[9u].w * 255.0)) << 8u;
    fragmentColor0.x = 32512u;
    fragmentColor0.y = ((uint(spvNClamp(productValue30 / productValue33, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue31 / productValue33, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue32 / productValue33, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue33, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[12u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[4u].x - productValue21) * fragmentVectorConstants1.packedValues[4u].w) + productValue21;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[4u].y - productValue22) * fragmentVectorConstants1.packedValues[4u].w) + productValue22;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[4u].z - productValue23) * fragmentVectorConstants1.packedValues[4u].w) + productValue23;
    fragmentColor1.w = 0.4980392158031463623046875;
    fragmentColor2.x = conditionValue1 ? (((productValue27 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue27)) * ((productValue28 < 0.0) ? (-1.0) : 1.0)) : productValue28;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue10) - ((fma(fragmentVectorConstants1.packedValues[7u].x, sumValue3, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue2, sumValue1 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[8u].x) / multiplyAddValue11)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue10) - ((fma(fragmentVectorConstants1.packedValues[7u].y, sumValue3, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue2, sumValue1 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[8u].y) / multiplyAddValue11)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.x;
    float scalarValue3 = sampledTextureValue3.y;
    float scalarValue4 = sampledTextureValue3.z;
    float scalarValue1 = sampledTextureValue3.w;
    float productValue34 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0 - scalarValue1)) > 0.0);
    float productValue35 = (productValue34 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[13u].x) - scalarValue2)) + scalarValue2;
    float productValue36 = (productValue34 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[13u].y) - scalarValue3)) + scalarValue3;
    float productValue37 = (productValue34 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[13u].z) - scalarValue4)) + scalarValue4;
    float productValue38 = ((((fragmentVectorConstants1.packedValues[14u].x * scalarValue2) - productValue35) * scalarValue1) + productValue35) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue39 = ((((fragmentVectorConstants1.packedValues[14u].y * scalarValue3) - productValue36) * scalarValue1) + productValue36) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue40 = ((((fragmentVectorConstants1.packedValues[14u].z * scalarValue4) - productValue37) * scalarValue1) + productValue37) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float sumValue1 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[10u].x;
    float sumValue2 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[10u].y;
    float sumValue3 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[10u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue24 = inverseLengthValue1 * varyingNormal0.x;
    float productValue25 = inverseLengthValue1 * varyingNormal0.y;
    float productValue26 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / ((abs(productValue25) + abs(productValue24)) + abs(productValue26));
    float productValue27 = quotientValue1 * productValue24;
    float productValue28 = quotientValue1 * productValue25;
    bool conditionValue1 = productValue26 < 0.0;
    float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[7u].w, sumValue3, fma(fragmentVectorConstants1.packedValues[6u].w, sumValue2, sumValue1 * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[8u].w;
    float intermediateValue5;
    float productValue13;
    float productValue14;
    if ((fragmentVectorConstants1.packedValues[12u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[9u].x + fragmentVectorConstants1.packedValues[9u].y) + fragmentVectorConstants1.packedValues[9u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue29 = fragmentVectorConstants1.packedValues[12u].x * fragmentVectorConstants1.packedValues[12u].x;
        intermediateValue5 = spvNClamp(productValue29, 0.0, 1.0);
        productValue13 = spvNClamp(((productValue29 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue29, 0.0, 1.0);
        productValue14 = spvNClamp((((productValue29 * productValue29) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue29, 0.0, 1.0);
    }
    else
    {
        intermediateValue5 = fragmentVectorConstants1.packedValues[9u].x;
        productValue13 = fragmentVectorConstants1.packedValues[9u].y;
        productValue14 = fragmentVectorConstants1.packedValues[9u].z;
    }
    float productValue41 = intermediateValue5 * 0.16666667163372039794921875;
    float productValue32 = productValue13 * 0.16666667163372039794921875;
    float productValue42 = productValue14 * 0.16666667163372039794921875;
    float productValue43 = ceil(spvNClamp(spvNMax(spvNMax(productValue41, productValue42), spvNMax(productValue32, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[9u].w * 255.0)) << 8u;
    fragmentColor0.x = 32512u;
    fragmentColor0.y = ((uint(spvNClamp(productValue41 / productValue43, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue32 / productValue43, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue42 / productValue43, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue43, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[12u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[4u].x - productValue38) * fragmentVectorConstants1.packedValues[4u].w) + productValue38;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[4u].y - productValue39) * fragmentVectorConstants1.packedValues[4u].w) + productValue39;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[4u].z - productValue40) * fragmentVectorConstants1.packedValues[4u].w) + productValue40;
    fragmentColor1.w = 0.4980392158031463623046875;
    fragmentColor2.x = conditionValue1 ? (((productValue27 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue27)) * ((productValue28 < 0.0) ? (-1.0) : 1.0)) : productValue28;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue10) - ((fma(fragmentVectorConstants1.packedValues[7u].x, sumValue3, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue2, sumValue1 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[8u].x) / multiplyAddValue11)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue10) - ((fma(fragmentVectorConstants1.packedValues[7u].y, sumValue3, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue2, sumValue1 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[8u].y) / multiplyAddValue11)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue45 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[14u].x;
    float productValue46 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[14u].y;
    float productValue47 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[14u].z;
    float productValue48 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[14u].w;
    float productValue49 = (((productValue45 * fragmentVectorConstants1.packedValues[0u].x) - productValue45) * productValue48) + productValue45;
    float productValue50 = (((productValue46 * fragmentVectorConstants1.packedValues[0u].y) - productValue46) * productValue48) + productValue46;
    float productValue51 = (((productValue47 * fragmentVectorConstants1.packedValues[0u].z) - productValue47) * productValue48) + productValue47;
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    float productValue52 = ((((fragmentVectorConstants1.packedValues[15u].x * sampledTextureValue3.x) - productValue49) * scalarValue1) + productValue49) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue53 = ((((fragmentVectorConstants1.packedValues[15u].y * sampledTextureValue3.y) - productValue50) * scalarValue1) + productValue50) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue54 = ((((fragmentVectorConstants1.packedValues[15u].z * sampledTextureValue3.z) - productValue51) * scalarValue1) + productValue51) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue24 = inverseLengthValue1 * varyingNormal0.x;
    float productValue25 = inverseLengthValue1 * varyingNormal0.y;
    float productValue26 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / ((abs(productValue25) + abs(productValue24)) + abs(productValue26));
    float productValue27 = quotientValue1 * productValue24;
    float productValue28 = quotientValue1 * productValue25;
    bool conditionValue1 = productValue26 < 0.0;
    float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue2;
    float productValue16;
    float productValue17;
    if ((fragmentVectorConstants1.packedValues[13u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue55 = fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue2 = spvNClamp(productValue55, 0.0, 1.0);
        productValue16 = spvNClamp(((productValue55 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue55, 0.0, 1.0);
        productValue17 = spvNClamp((((productValue55 * productValue55) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue55, 0.0, 1.0);
    }
    else
    {
        intermediateValue2 = fragmentVectorConstants1.packedValues[10u].x;
        productValue16 = fragmentVectorConstants1.packedValues[10u].y;
        productValue17 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue30 = intermediateValue2 * 0.16666667163372039794921875;
    float productValue56 = productValue16 * 0.16666667163372039794921875;
    float productValue57 = productValue17 * 0.16666667163372039794921875;
    float productValue58 = ceil(spvNClamp(spvNMax(spvNMax(productValue30, productValue57), spvNMax(productValue56, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = 32512u;
    fragmentColor0.y = ((uint(spvNClamp(productValue30 / productValue58, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue56 / productValue58, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue57 / productValue58, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue58, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[13u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue52) * fragmentVectorConstants1.packedValues[5u].w) + productValue52;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue53) * fragmentVectorConstants1.packedValues[5u].w) + productValue53;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue54) * fragmentVectorConstants1.packedValues[5u].w) + productValue54;
    fragmentColor1.w = 0.4980392158031463623046875;
    fragmentColor2.x = conditionValue1 ? (((productValue27 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue27)) * ((productValue28 < 0.0) ? (-1.0) : 1.0)) : productValue28;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue18) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue19)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue18) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue19)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.x;
    float scalarValue3 = sampledTextureValue3.y;
    float scalarValue4 = sampledTextureValue3.z;
    float scalarValue1 = sampledTextureValue3.w;
    float productValue34 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0 - scalarValue1)) > 0.0);
    float productValue59 = (productValue34 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[14u].x) - scalarValue2)) + scalarValue2;
    float productValue60 = (productValue34 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[14u].y) - scalarValue3)) + scalarValue3;
    float productValue61 = (productValue34 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[14u].z) - scalarValue4)) + scalarValue4;
    float productValue62 = (productValue34 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[14u].w) - scalarValue1)) + scalarValue1;
    float productValue63 = (((productValue59 * fragmentVectorConstants1.packedValues[0u].x) - productValue59) * productValue62) + productValue59;
    float productValue64 = (((productValue60 * fragmentVectorConstants1.packedValues[0u].y) - productValue60) * productValue62) + productValue60;
    float productValue65 = (((productValue61 * fragmentVectorConstants1.packedValues[0u].z) - productValue61) * productValue62) + productValue61;
    float productValue66 = ((((fragmentVectorConstants1.packedValues[15u].x * scalarValue2) - productValue63) * scalarValue1) + productValue63) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue67 = ((((fragmentVectorConstants1.packedValues[15u].y * scalarValue3) - productValue64) * scalarValue1) + productValue64) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue68 = ((((fragmentVectorConstants1.packedValues[15u].z * scalarValue4) - productValue65) * scalarValue1) + productValue65) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue24 = inverseLengthValue1 * varyingNormal0.x;
    float productValue25 = inverseLengthValue1 * varyingNormal0.y;
    float productValue26 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / ((abs(productValue25) + abs(productValue24)) + abs(productValue26));
    float productValue27 = quotientValue1 * productValue24;
    float productValue28 = quotientValue1 * productValue25;
    bool conditionValue1 = productValue26 < 0.0;
    float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue5;
    float productValue17;
    float productValue18;
    if ((fragmentVectorConstants1.packedValues[13u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue55 = fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue5 = spvNClamp(productValue55, 0.0, 1.0);
        productValue17 = spvNClamp(((productValue55 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue55, 0.0, 1.0);
        productValue18 = spvNClamp((((productValue55 * productValue55) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue55, 0.0, 1.0);
    }
    else
    {
        intermediateValue5 = fragmentVectorConstants1.packedValues[10u].x;
        productValue17 = fragmentVectorConstants1.packedValues[10u].y;
        productValue18 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue41 = intermediateValue5 * 0.16666667163372039794921875;
    float productValue57 = productValue17 * 0.16666667163372039794921875;
    float productValue69 = productValue18 * 0.16666667163372039794921875;
    float productValue70 = ceil(spvNClamp(spvNMax(spvNMax(productValue41, productValue69), spvNMax(productValue57, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = 32512u;
    fragmentColor0.y = ((uint(spvNClamp(productValue41 / productValue70, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue57 / productValue70, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue69 / productValue70, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue70, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[13u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue66) * fragmentVectorConstants1.packedValues[5u].w) + productValue66;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue67) * fragmentVectorConstants1.packedValues[5u].w) + productValue67;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue68) * fragmentVectorConstants1.packedValues[5u].w) + productValue68;
    fragmentColor1.w = 0.4980392158031463623046875;
    fragmentColor2.x = conditionValue1 ? (((productValue27 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue27)) * ((productValue28 < 0.0) ? (-1.0) : 1.0)) : productValue28;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue18) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue19)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue18) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue19)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue45 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[14u].x;
    float productValue46 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[14u].y;
    float productValue78 = fragmentVectorConstants1.packedValues[0u].x * productValue45;
    float productValue79 = fragmentVectorConstants1.packedValues[0u].y * productValue45;
    float productValue80 = fragmentVectorConstants1.packedValues[0u].z * productValue45;
    float scalarValue8 = ceil(productValue46);
    float productValue81 = (((productValue46 * fragmentVectorConstants1.packedValues[15u].x) - productValue78) * scalarValue8) + productValue78;
    float productValue82 = (((productValue46 * fragmentVectorConstants1.packedValues[15u].y) - productValue79) * scalarValue8) + productValue79;
    float productValue83 = (((productValue46 * fragmentVectorConstants1.packedValues[15u].z) - productValue80) * scalarValue8) + productValue80;
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    float productValue84 = ((((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[15u].x) - productValue81) * scalarValue1) + productValue81) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue85 = ((((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[15u].y) - productValue82) * scalarValue1) + productValue82) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue86 = ((((sampledTextureValue3.z * fragmentVectorConstants1.packedValues[15u].z) - productValue83) * scalarValue1) + productValue83) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue24 = inverseLengthValue1 * varyingNormal0.x;
    float productValue25 = inverseLengthValue1 * varyingNormal0.y;
    float productValue26 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / ((abs(productValue25) + abs(productValue24)) + abs(productValue26));
    float productValue27 = quotientValue1 * productValue24;
    float productValue28 = quotientValue1 * productValue25;
    bool conditionValue1 = productValue26 < 0.0;
    float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue3;
    float productValue17;
    float productValue18;
    if ((fragmentVectorConstants1.packedValues[13u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue55 = fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue3 = spvNClamp(productValue55, 0.0, 1.0);
        productValue17 = spvNClamp(((productValue55 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue55, 0.0, 1.0);
        productValue18 = spvNClamp((((productValue55 * productValue55) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue55, 0.0, 1.0);
    }
    else
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[10u].x;
        productValue17 = fragmentVectorConstants1.packedValues[10u].y;
        productValue18 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue87 = intermediateValue3 * 0.16666667163372039794921875;
    float productValue57 = productValue17 * 0.16666667163372039794921875;
    float productValue69 = productValue18 * 0.16666667163372039794921875;
    float productValue88 = ceil(spvNClamp(spvNMax(spvNMax(productValue87, productValue69), spvNMax(productValue57, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = 32512u;
    fragmentColor0.y = ((uint(spvNClamp(productValue87 / productValue88, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue57 / productValue88, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue69 / productValue88, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue88, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[13u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue84) * fragmentVectorConstants1.packedValues[5u].w) + productValue84;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue85) * fragmentVectorConstants1.packedValues[5u].w) + productValue85;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue86) * fragmentVectorConstants1.packedValues[5u].w) + productValue86;
    fragmentColor1.w = 0.4980392158031463623046875;
    fragmentColor2.x = conditionValue1 ? (((productValue27 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue27)) * ((productValue28 < 0.0) ? (-1.0) : 1.0)) : productValue28;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue18) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue19)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue18) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue19)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.x;
    float scalarValue3 = sampledTextureValue3.y;
    float scalarValue4 = sampledTextureValue3.z;
    float scalarValue1 = sampledTextureValue3.w;
    float productValue34 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0 - scalarValue1)) > 0.0);
    float productValue59 = (productValue34 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[14u].x) - scalarValue2)) + scalarValue2;
    float productValue60 = (productValue34 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[14u].y) - scalarValue3)) + scalarValue3;
    float productValue92 = productValue59 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue93 = productValue59 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue94 = productValue59 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue10 = ceil(productValue60);
    float productValue95 = (((productValue60 * fragmentVectorConstants1.packedValues[15u].x) - productValue92) * scalarValue10) + productValue92;
    float productValue96 = (((productValue60 * fragmentVectorConstants1.packedValues[15u].y) - productValue93) * scalarValue10) + productValue93;
    float productValue97 = (((productValue60 * fragmentVectorConstants1.packedValues[15u].z) - productValue94) * scalarValue10) + productValue94;
    float productValue98 = ((((fragmentVectorConstants1.packedValues[15u].x * scalarValue2) - productValue95) * scalarValue1) + productValue95) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue99 = ((((fragmentVectorConstants1.packedValues[15u].y * scalarValue3) - productValue96) * scalarValue1) + productValue96) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue100 = ((((fragmentVectorConstants1.packedValues[15u].z * scalarValue4) - productValue97) * scalarValue1) + productValue97) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue24 = inverseLengthValue1 * varyingNormal0.x;
    float productValue25 = inverseLengthValue1 * varyingNormal0.y;
    float productValue26 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / ((abs(productValue25) + abs(productValue24)) + abs(productValue26));
    float productValue27 = quotientValue1 * productValue24;
    float productValue28 = quotientValue1 * productValue25;
    bool conditionValue1 = productValue26 < 0.0;
    float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue6;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[13u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue55 = fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue6 = spvNClamp(productValue55, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue55 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue55, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue55 * productValue55) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue55, 0.0, 1.0);
    }
    else
    {
        intermediateValue6 = fragmentVectorConstants1.packedValues[10u].x;
        productValue18 = fragmentVectorConstants1.packedValues[10u].y;
        productValue19 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue101 = intermediateValue6 * 0.16666667163372039794921875;
    float productValue69 = productValue18 * 0.16666667163372039794921875;
    float productValue102 = productValue19 * 0.16666667163372039794921875;
    float productValue103 = ceil(spvNClamp(spvNMax(spvNMax(productValue101, productValue102), spvNMax(productValue69, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue2 = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = 32512u;
    fragmentColor0.y = ((uint(spvNClamp(productValue101 / productValue103, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue69 / productValue103, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue102 / productValue103, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue103, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[13u].y, 0.0, 1.0) * 255.0) | (bitwiseValue2 & 256u)) | (bitwiseValue2 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue98) * fragmentVectorConstants1.packedValues[5u].w) + productValue98;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue99) * fragmentVectorConstants1.packedValues[5u].w) + productValue99;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue100) * fragmentVectorConstants1.packedValues[5u].w) + productValue100;
    fragmentColor1.w = 0.4980392158031463623046875;
    fragmentColor2.x = conditionValue1 ? (((productValue27 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue28))) : productValue27;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue27)) * ((productValue28 < 0.0) ? (-1.0) : 1.0)) : productValue28;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue18) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue19)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue18) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue19)) * 0.5;
#endif
}
