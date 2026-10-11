#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPatternPrepass / GeometryPrepass / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 5
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/ActorPatternPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue4 = uint(int(fragmentScalarConstants1.packedValues[4u]));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uint scalarValue5 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    uint intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    intermediateValue12 = 4294967295u;
    intermediateValue13 = sampledTextureValue3.z;
    intermediateValue14 = sampledTextureValue3.y;
    intermediateValue15 = sampledTextureValue3.x;
    uint comparisonValue;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint sumValue;
    uint scalarValue6 = 0u;
    for (;;)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue5 = uint(int(fragmentScalarConstants1.packedValues[0u]));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    float comparisonValue;
    if ((scalarValue5 & 1u) == 1u)
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[1u].x));
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
    bool comparisonValue;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (int(uint(int(fragmentVectorConstants1.packedValues[0u].x))) > int(0u))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue11 = uint(int(fragmentVectorConstants1.packedValues[0u].x));
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float intermediateValue1;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    if ((scalarValue11 & 1u) == 0u)
#endif
    {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        if (int(scalarValue5) <= int(scalarValue6))
        {
            break;
        }
        uint sumValue7 = scalarValue6 + 22u;
        vec4 sampledTextureValue4 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(fragmentVectorConstants1.packedValues[sumValue7].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue7].x), fma(fragmentVectorConstants1.packedValues[sumValue7].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue7].y)));
        uint sumValue8 = scalarValue6 + 15u;
        float bitwiseValue1 = sampledTextureValue4.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue6) + 240u) + 12u) >> 2u];
        multiplyAddValue2 = fma(bitwiseValue1, fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[sumValue8].x, -intermediateValue15), intermediateValue15);
        multiplyAddValue1 = fma(bitwiseValue1, fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[sumValue8].y, -intermediateValue14), intermediateValue14);
        multiplyAddValue = fma(bitwiseValue1, fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[sumValue8].z, -intermediateValue13), intermediateValue13);
        comparisonValue = ((bitwiseValue1 > 0.5) && (intermediateValue12 != 0u)) ? 0u : intermediateValue12;
        sumValue = scalarValue6 + 1u;
        intermediateValue12 = comparisonValue;
        intermediateValue13 = multiplyAddValue;
        intermediateValue14 = multiplyAddValue1;
        intermediateValue15 = multiplyAddValue2;
        scalarValue6 = sumValue;
        continue;
    }
    fragmentColor1.x = intermediateValue15;
    fragmentColor1.y = intermediateValue14;
    fragmentColor1.z = intermediateValue13;
    uint comparisonValue3 = (intermediateValue12 != 0u) ? scalarValue4 : (scalarValue4 & 4294967294u);
    float scalarValue7 = dFdxCoarse(varyingTexCoord0.x);
    float scalarValue8 = dFdxCoarse(varyingTexCoord0.y);
    float scalarValue9 = dFdyCoarse(varyingTexCoord0.x);
    float scalarValue10 = dFdyCoarse(varyingTexCoord0.y);
    float intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    float comparisonValue2;
    if ((comparisonValue3 & 1u) == 1u)
    {
        vec4 sampledTextureValue5 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), vec2(scalarValue7, scalarValue8), vec2(scalarValue9, scalarValue10));
        intermediateValue21 = sampledTextureValue5.y;
        intermediateValue22 = sampledTextureValue5.z;
        intermediateValue23 = sampledTextureValue5.x;
        comparisonValue2 = ((comparisonValue3 & 2u) == 2u) ? sampledTextureValue5.w : fragmentScalarConstants1.packedValues[120u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue6 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue9 = sampledTextureValue6.y;
        intermediateValue10 = sampledTextureValue6.z;
        intermediateValue11 = sampledTextureValue6.x;
        comparisonValue = ((scalarValue5 & 2u) == 2u) ? sampledTextureValue6.w : fragmentScalarConstants1.packedValues[60u];
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
            uint sumValue1 = intermediateValue7 + 22u;
            uint sumValue2 = intermediateValue7 + 15u;
            vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue1].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue1].x, (fragmentVectorConstants1.packedValues[sumValue1].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue1].y));
            float productValue3 = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[sumValue2].w;
            productValue = (((sampledTextureValue1.x * fragmentVectorConstants1.packedValues[sumValue2].x) - intermediateValue9) * productValue3) + intermediateValue9;
            productValue1 = (((sampledTextureValue1.y * fragmentVectorConstants1.packedValues[sumValue2].y) - intermediateValue10) * productValue3) + intermediateValue10;
            productValue2 = (((sampledTextureValue1.z * fragmentVectorConstants1.packedValues[sumValue2].z) - intermediateValue11) * productValue3) + intermediateValue11;
            comparisonValue2 = ((intermediateValue8 != 0u) && (productValue3 > 0.5)) ? 0u : intermediateValue8;
            uint sumValue3 = intermediateValue7 + 1u;
            if (int(sumValue3) < int(uint(int(fragmentVectorConstants1.packedValues[0u].x))))
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
        intermediateValue1 = fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue2 = fragmentVectorConstants1.packedValues[11u].x;
        intermediateValue3 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[15u].x;
#endif
    }
    else
    {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue21 = fragmentScalarConstants1.packedValues[48u];
        intermediateValue22 = fragmentScalarConstants1.packedValues[116u];
        intermediateValue23 = fragmentScalarConstants1.packedValues[56u];
        comparisonValue2 = fragmentScalarConstants1.packedValues[120u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue9 = fragmentScalarConstants1.packedValues[44u];
        intermediateValue10 = fragmentScalarConstants1.packedValues[56u];
        intermediateValue11 = fragmentScalarConstants1.packedValues[52u];
        comparisonValue = fragmentScalarConstants1.packedValues[60u];
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        comparisonValue = true;
        intermediateValue4 = scalarValue1;
        intermediateValue5 = scalarValue2;
        intermediateValue6 = scalarValue3;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue2 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue1 = sampledTextureValue2.x;
        intermediateValue2 = sampledTextureValue2.y;
        intermediateValue3 = sampledTextureValue2.z;
        intermediateValue4 = ((scalarValue11 & 2u) != 0u) ? sampledTextureValue2.w : fragmentVectorConstants1.packedValues[15u].x;
#endif
    }
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    fragmentColor1.w = (comparisonValue2 < intermediateValue23) ? fma(intermediateValue23, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue2, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue18 = inverseLengthValue1 * varyingNormal0.x;
    float productValue19 = inverseLengthValue1 * varyingNormal0.y;
    float productValue20 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / (abs(productValue20) + (abs(productValue19) + abs(productValue18)));
    float productValue21 = quotientValue1 * productValue18;
    float productValue22 = quotientValue1 * productValue19;
    bool conditionValue1 = productValue20 < 0.0;
    float sumValue9 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue22)) * ((productValue21 >= 0.0) ? sumValue9 : (-1.0))) : productValue21;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue21)) * ((productValue22 >= 0.0) ? sumValue9 : (-1.0))) : productValue22;
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[19u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[15u])) + fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[35u], sumValue6, fma(fragmentScalarConstants1.packedValues[27u], sumValue4, sumValue5 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue5, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue6, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[3u].y)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue5, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue6, 0.5, 0.5);
    bool bitwiseValue2 = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[52u] > 9.9999997473787516355514526367188e-05);
    float productValue23 = fragmentScalarConstants1.packedValues[52u] * fragmentScalarConstants1.packedValues[52u];
    float comparisonValue4 = (bitwiseValue2 ? spvNMin(productValue23, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue7 = (bitwiseValue2 ? spvNMin(fma(fma(productValue23, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue23, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue8 = (bitwiseValue2 ? spvNMin(fma(productValue23 * productValue23, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue23, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue24 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue7, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue8, comparisonValue4)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue7 / productValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue4 / productValue24, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue8 / productValue24, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue24, 0.0, 1.0) * 255.0);
    uint productValue25 = uint(floor(fragmentScalarConstants1.packedValues[43u] * 255.0));
    fragmentColor0.w = ((((productValue25 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[53u], 0.0, 1.0) * 255.0)) + (((productValue25 & 2u) != 0u) ? 512u : 0u);
    fragmentColor0.x = uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue10 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[10u].x;
    float sumValue11 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[10u].y;
    float sumValue12 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[10u].z;
    fragmentColor1.w = (comparisonValue < intermediateValue11) ? fma(intermediateValue11, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue18 = inverseLengthValue1 * varyingNormal0.x;
    float productValue19 = inverseLengthValue1 * varyingNormal0.y;
    float productValue20 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue1 = 1.0 / (abs(productValue20) + (abs(productValue19) + abs(productValue18)));
    float productValue21 = quotientValue1 * productValue18;
    float productValue22 = quotientValue1 * productValue19;
    bool conditionValue1 = productValue20 < 0.0;
    float sumValue9 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? (((productValue21 >= 0.0) ? sumValue9 : (-1.0)) * (1.0 - abs(productValue22))) : productValue21;
    fragmentColor2.y = conditionValue1 ? (((productValue22 >= 0.0) ? sumValue9 : (-1.0)) * (1.0 - abs(productValue21))) : productValue22;
    float multiplyAddValue11 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[31u], sumValue12, fma(fragmentScalarConstants1.packedValues[23u], sumValue10, sumValue11 * fragmentScalarConstants1.packedValues[27u])) + fragmentScalarConstants1.packedValues[35u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue11, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[7u].x, sumValue12, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue10, sumValue11 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[8u].x) / multiplyAddValue12, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue11, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[7u].y, sumValue12, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue10, sumValue11 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[8u].y) / multiplyAddValue12, 0.5, 0.5);
    bool bitwiseValue4 = (((fragmentScalarConstants1.packedValues[37u] + fragmentScalarConstants1.packedValues[36u]) + fragmentScalarConstants1.packedValues[38u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[48u] > 9.9999997473787516355514526367188e-05);
    float productValue31 = fragmentScalarConstants1.packedValues[48u] * fragmentScalarConstants1.packedValues[48u];
    float comparisonValue5 = (bitwiseValue4 ? spvNMin(productValue31, 1.0) : fragmentVectorConstants1.packedValues[9u].x) * 0.16666667163372039794921875;
    float multiplyAddValue13 = (bitwiseValue4 ? spvNMin(fma(fma(productValue31, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue31, 1.0) : fragmentVectorConstants1.packedValues[9u].y) * 0.16666667163372039794921875;
    float multiplyAddValue14 = (bitwiseValue4 ? spvNMin(fma(productValue31 * productValue31, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue31, 1.0) : fragmentVectorConstants1.packedValues[9u].z) * 0.16666667163372039794921875;
    float productValue32 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue13, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue14, comparisonValue5)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue13 / productValue32, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue5 / productValue32, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue14 / productValue32, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue32, 0.0, 1.0) * 255.0);
    uint productValue33 = uint(floor(fragmentScalarConstants1.packedValues[39u] * 255.0));
    fragmentColor0.w = ((((productValue33 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[49u], 0.0, 1.0) * 255.0)) + (((productValue33 & 2u) != 0u) ? 512u : 0u);
    fragmentColor0.x = uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor1.x = sampledTextureValue3.x;
    fragmentColor1.y = sampledTextureValue3.y;
    fragmentColor1.z = sampledTextureValue3.z;
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint comparisonValue1 = comparisonValue ? scalarValue : (scalarValue & 4294967294u);
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if ((comparisonValue1 & 1u) == 0u)
    {
        intermediateValue12 = fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[12u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue15 = fragmentVectorConstants1.packedValues[30u].x;
    }
    else
    {
        vec4 sampledTextureValue2 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue12 = sampledTextureValue2.x;
        intermediateValue13 = sampledTextureValue2.y;
        intermediateValue14 = sampledTextureValue2.z;
        intermediateValue15 = ((comparisonValue1 & 2u) != 0u) ? sampledTextureValue2.w : fragmentVectorConstants1.packedValues[30u].x;
    }
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue4 = inverseLengthValue * varyingNormal0.x;
    float productValue5 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / ((abs(productValue5) + abs(productValue4)) + abs(productValue8));
    float productValue9 = quotientValue * productValue4;
    float productValue12 = quotientValue * productValue5;
    bool conditionValue = productValue8 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue17;
    float productValue10;
    float productValue11;
    if ((fragmentVectorConstants1.packedValues[13u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue13 = fragmentVectorConstants1.packedValues[13u].x * fragmentVectorConstants1.packedValues[13u].x;
        intermediateValue17 = spvNClamp(productValue13, 0.0, 1.0);
        productValue10 = spvNClamp(((productValue13 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue13, 0.0, 1.0);
        productValue11 = spvNClamp((((productValue13 * productValue13) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue13, 0.0, 1.0);
    }
    else
    {
        intermediateValue17 = fragmentVectorConstants1.packedValues[10u].x;
        productValue10 = fragmentVectorConstants1.packedValues[10u].y;
        productValue11 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue14 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue15 = productValue10 * 0.16666667163372039794921875;
    float productValue16 = productValue11 * 0.16666667163372039794921875;
    float productValue17 = ceil(spvNClamp(spvNMax(spvNMax(productValue14, productValue16), spvNMax(productValue15, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[10u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue14 / productValue17, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue15 / productValue17, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue16 / productValue17, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue17, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[13u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = intermediateValue4;
    fragmentColor1.y = intermediateValue5;
    fragmentColor1.z = intermediateValue6;
    fragmentColor1.w = (intermediateValue12 > intermediateValue15) ? ((intermediateValue12 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue15 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue9 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue12))) : productValue9;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue9)) * ((productValue12 < 0.0) ? (-1.0) : 1.0)) : productValue12;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[2u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[5u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue10 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[10u].x;
    float sumValue11 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[10u].y;
    float sumValue12 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[10u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue4 = inverseLengthValue * varyingNormal0.x;
    float productValue5 = inverseLengthValue * varyingNormal0.y;
    float productValue8 = inverseLengthValue * varyingNormal0.z;
    float quotientValue = 1.0 / ((abs(productValue5) + abs(productValue4)) + abs(productValue8));
    float productValue9 = quotientValue * productValue4;
    float productValue12 = quotientValue * productValue5;
    bool conditionValue = productValue8 < 0.0;
    float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[7u].w, sumValue12, fma(fragmentVectorConstants1.packedValues[6u].w, sumValue11, sumValue10 * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[8u].w;
    float intermediateValue6;
    float productValue6;
    float productValue7;
    if ((fragmentVectorConstants1.packedValues[12u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[9u].x + fragmentVectorConstants1.packedValues[9u].y) + fragmentVectorConstants1.packedValues[9u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue26 = fragmentVectorConstants1.packedValues[12u].x * fragmentVectorConstants1.packedValues[12u].x;
        intermediateValue6 = spvNClamp(productValue26, 0.0, 1.0);
        productValue6 = spvNClamp(((productValue26 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue26, 0.0, 1.0);
        productValue7 = spvNClamp((((productValue26 * productValue26) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue26, 0.0, 1.0);
    }
    else
    {
        intermediateValue6 = fragmentVectorConstants1.packedValues[9u].x;
        productValue6 = fragmentVectorConstants1.packedValues[9u].y;
        productValue7 = fragmentVectorConstants1.packedValues[9u].z;
    }
    float productValue27 = intermediateValue6 * 0.16666667163372039794921875;
    float productValue28 = productValue6 * 0.16666667163372039794921875;
    float productValue29 = productValue7 * 0.16666667163372039794921875;
    float productValue30 = ceil(spvNClamp(spvNMax(spvNMax(productValue27, productValue29), spvNMax(productValue28, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue3 = uint(floor(fragmentVectorConstants1.packedValues[9u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue3, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue2, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue27 / productValue30, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue28 / productValue30, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue29 / productValue30, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue30, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[12u].y, 0.0, 1.0) * 255.0) | (bitwiseValue3 & 256u)) | (bitwiseValue3 & 512u);
    fragmentColor1.x = sampledTextureValue.x;
    fragmentColor1.y = sampledTextureValue.y;
    fragmentColor1.z = sampledTextureValue.z;
    fragmentColor1.w = (intermediateValue1 > intermediateValue4) ? ((intermediateValue1 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue4 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue ? (((productValue9 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue12))) : productValue9;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue9)) * ((productValue12 < 0.0) ? (-1.0) : 1.0)) : productValue12;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue9) - ((fma(fragmentVectorConstants1.packedValues[7u].x, sumValue12, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue11, sumValue10 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[8u].x) / multiplyAddValue10)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue9) - ((fma(fragmentVectorConstants1.packedValues[7u].y, sumValue12, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue11, sumValue10 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[8u].y) / multiplyAddValue10)) * 0.5;
#endif
}
