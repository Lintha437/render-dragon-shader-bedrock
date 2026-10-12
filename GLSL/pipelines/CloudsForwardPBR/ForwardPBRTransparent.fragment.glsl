#version 460
#extension GL_GOOGLE_include_directive : require
// CloudsForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/CloudsForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec3 vectorValue = vec3(varyingTexCoord3.x, varyingTexCoord3.y, varyingTexCoord3.z);
    float scalarValue = rdDot3Precise2(vectorValue, vectorValue);
    float nonlinearValue = spvNClamp((sqrt(scalarValue) / fragmentScalarConstants1.packedValues[128u]) - 0.89999997615814208984375, 0.0, 1.0);
    float productValue = ((fragmentScalarConstants1.packedValues[143u] * fragmentVectorConstants1.packedValues[35u].x) * varyingColor0.x) * fragmentScalarConstants1.packedValues[119u];
    float productValue1 = ((fragmentScalarConstants1.packedValues[143u] * fragmentVectorConstants1.packedValues[35u].y) * varyingColor0.y) * fragmentScalarConstants1.packedValues[119u];
    float productValue2 = ((fragmentScalarConstants1.packedValues[143u] * fragmentVectorConstants1.packedValues[35u].z) * varyingColor0.z) * fragmentScalarConstants1.packedValues[119u];
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue7;
    float multiplyAddValue8;
    float multiplyAddValue9;
    if (fragmentScalarConstants1.packedValues[98u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint scalarValue1 = uint(varyingTexCoord4);
    float nonlinearValue3 = spvNClamp(spvNMax((sqrt(((varyingTexCoord3.y * varyingTexCoord3.y) + (varyingTexCoord3.x * varyingTexCoord3.x)) + (varyingTexCoord3.z * varyingTexCoord3.z)) / fragmentVectorConstants1.packedValues[31u].x) + (-0.89999997615814208984375), 0.0), 0.0, 1.0);
    float productValue34 = fragmentVectorConstants1.packedValues[28u].w * fragmentVectorConstants1.packedValues[34u].w;
    float productValue35 = (fragmentVectorConstants1.packedValues[34u].x * varyingColor0.x) * productValue34;
    float productValue36 = (fragmentVectorConstants1.packedValues[34u].y * varyingColor0.y) * productValue34;
    float productValue37 = (fragmentVectorConstants1.packedValues[34u].z * varyingColor0.z) * productValue34;
    float multiplyAddValue52 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue55 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue56 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue55, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue54, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue53, multiplyAddValue52 * fragmentVectorConstants1.packedValues[0u].w)));
    float multiplyAddValue57 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue55, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue54, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue53, multiplyAddValue52 * fragmentVectorConstants1.packedValues[0u].x))) / multiplyAddValue56;
    float multiplyAddValue58 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue55, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue54, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue53, multiplyAddValue52 * fragmentVectorConstants1.packedValues[0u].y))) / multiplyAddValue56;
    float multiplyAddValue59 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue55, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue54, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue53, multiplyAddValue52 * fragmentVectorConstants1.packedValues[0u].z))) / multiplyAddValue56;
    float productValue7;
    float productValue8;
    float productValue9;
    if (fragmentVectorConstants1.packedValues[23u].z != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingNormal0.x, varyingNormal0.y * fragmentVectorConstants1.packedValues[5u].x));
        float multiplyAddValue5 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingNormal0.x, varyingNormal0.y * fragmentVectorConstants1.packedValues[5u].y));
        float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingNormal0.x, varyingNormal0.y * fragmentVectorConstants1.packedValues[5u].z));
        float inverseLengthValue = inversesqrt(scalarValue);
        float productValue3 = inverseLengthValue * varyingTexCoord3.x;
        float productValue4 = inverseLengthValue * varyingTexCoord3.z;
        float productValue5 = inverseLengthValue * varyingTexCoord3.y;
        bool conditionValue = productValue4 > 0.0;
        bool conditionValue1 = productValue3 > 0.0;
        float sumValue = fragmentScalarConstants1.packedValues[105u] - varyingTexCoord3.y;
        bool conditionValue2 = productValue4 < 0.0;
        bool conditionValue3 = productValue3 < 0.0;
        float comparisonValue = (productValue5 > 0.0) ? spvNMin((sumValue + 196.3300018310546875) / productValue5, 16.0) : ((productValue5 < 0.0) ? spvNMin((sumValue + 192.3300018310546875) / productValue5, 16.0) : 16.0);
        uint scalarValue1 = uint(varyingTexCoord4);
        bool comparisonValue1 = (scalarValue1 & 64u) != 0u;
        bool comparisonValue2 = (scalarValue1 & 2u) != 0u;
        bool comparisonValue3 = (scalarValue1 & 16u) != 0u;
        bool comparisonValue4 = (scalarValue1 & 8u) != 0u;
        float comparisonValue5 = conditionValue ? ((16.0 - varyingTexCoord5.y) / productValue4) : (conditionValue2 ? ((-varyingTexCoord5.y) / productValue4) : 16.0);
        bool bitwiseValue4 = ((!conditionValue) && (comparisonValue2 && conditionValue2)) || (comparisonValue1 && conditionValue);
        float comparisonValue6 = conditionValue1 ? ((16.0 - varyingTexCoord5.x) / productValue3) : (conditionValue3 ? ((-varyingTexCoord5.x) / productValue3) : 16.0);
        bool bitwiseValue5 = (comparisonValue3 && conditionValue1) || ((!conditionValue1) && (conditionValue3 && comparisonValue4));
        bool conditionValue4 = comparisonValue5 < comparisonValue6;
        bool conditionValue5 = comparisonValue6 < comparisonValue5;
        float comparisonValue7 = conditionValue4 ? (bitwiseValue4 ? comparisonValue : spvNMin(comparisonValue, comparisonValue5)) : (conditionValue5 ? (bitwiseValue5 ? comparisonValue : spvNMin(comparisonValue, comparisonValue6)) : comparisonValue);
        float intermediateValue26;
        if ((!(conditionValue4 || ((!bitwiseValue5) && conditionValue5))) || (conditionValue4 && bitwiseValue4))
        {
            float comparisonValue8;
            if (conditionValue1 && conditionValue)
            {
                comparisonValue8 = ((scalarValue1 & 128u) != 0u) ? comparisonValue7 : spvNMin(spvNMax(comparisonValue5, comparisonValue6), comparisonValue7);
            }
            else
            {
                float scalarValue2 = spvNMin(spvNMax(comparisonValue5, comparisonValue6), comparisonValue7);
                comparisonValue8 = (conditionValue2 && conditionValue1) ? (((scalarValue1 & 4u) != 0u) ? comparisonValue7 : scalarValue2) : ((conditionValue3 && conditionValue) ? (((scalarValue1 & 32u) != 0u) ? comparisonValue7 : scalarValue2) : ((conditionValue3 && conditionValue2) ? (((scalarValue1 & 1u) != 0u) ? comparisonValue7 : scalarValue2) : comparisonValue7));
            }
            intermediateValue26 = comparisonValue8;
        }
        else
        {
            intermediateValue26 = comparisonValue7;
        }
        float scalarValue3 = spvNMax(intermediateValue26, 0.0);
        float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[71u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[70u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[68u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[69u])));
        float multiplyAddValue11 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[71u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[70u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[68u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[69u])));
        float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[71u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[70u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[68u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[69u])));
        vec3 vectorValue1 = vec3(multiplyAddValue10, multiplyAddValue11, multiplyAddValue12);
        float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        float productValue6 = (fragmentScalarConstants1.packedValues[111u] * fragmentVectorConstants1.packedValues[27u].x) * fragmentScalarConstants1.packedValues[120u];
        float productValue10 = (fragmentScalarConstants1.packedValues[111u] * fragmentVectorConstants1.packedValues[27u].y) * fragmentScalarConstants1.packedValues[120u];
        float productValue11 = (fragmentScalarConstants1.packedValues[111u] * fragmentVectorConstants1.packedValues[27u].z) * fragmentScalarConstants1.packedValues[120u];
        bool comparisonValue9 = fragmentVectorConstants1.packedValues[24u].x != 0.0;
        vec3 productValue12 = vec3(inverseLengthValue1 * multiplyAddValue10, inverseLengthValue1 * multiplyAddValue11, inverseLengthValue1 * multiplyAddValue12);
        float multiplyAddValue16;
        float multiplyAddValue17;
        float multiplyAddValue18;
        if (fragmentVectorConstants1.packedValues[24u].y != 0.0)
        {
            float multiplyAddValue13 = fma(productValue4 * scalarValue3, 0.5, varyingTexCoord5.y);
            float multiplyAddValue14 = fma(productValue3 * scalarValue3, 0.5, varyingTexCoord5.x);
            vec3 vectorValue2 = vec3(fragmentVectorConstants1.packedValues[17u].xyz);
            float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
            float productValue13 = inverseLengthValue2 * fragmentVectorConstants1.packedValues[17u].y;
            float productValue14 = inverseLengthValue2 * fragmentVectorConstants1.packedValues[17u].z;
            float productValue15 = inverseLengthValue2 * fragmentVectorConstants1.packedValues[17u].x;
            bool conditionValue6 = productValue14 > 0.0;
            bool conditionValue7 = productValue15 > 0.0;
            float multiplyAddValue15 = fragmentScalarConstants1.packedValues[105u] - fma(productValue5 * scalarValue3, 0.5, varyingTexCoord3.y);
            bool conditionValue8 = productValue14 < 0.0;
            bool conditionValue9 = productValue15 < 0.0;
            float comparisonValue10 = (productValue13 > 0.0) ? spvNMin((multiplyAddValue15 + 196.3300018310546875) / productValue13, 16.0) : ((productValue13 < 0.0) ? spvNMin((multiplyAddValue15 + 192.3300018310546875) / productValue13, 16.0) : 16.0);
            float comparisonValue11 = conditionValue6 ? ((16.0 - multiplyAddValue13) / productValue14) : (conditionValue8 ? ((-multiplyAddValue13) / productValue14) : 16.0);
            bool bitwiseValue6 = ((!conditionValue6) && (comparisonValue2 && conditionValue8)) || (conditionValue6 && comparisonValue1);
            float comparisonValue12 = conditionValue7 ? ((16.0 - multiplyAddValue14) / productValue15) : (conditionValue9 ? ((-multiplyAddValue14) / productValue15) : 16.0);
            bool bitwiseValue7 = ((!conditionValue7) && (conditionValue9 && comparisonValue4)) || (conditionValue7 && comparisonValue3);
            bool conditionValue10 = comparisonValue11 < comparisonValue12;
            bool conditionValue11 = comparisonValue12 < comparisonValue11;
            float comparisonValue13 = conditionValue10 ? (bitwiseValue6 ? comparisonValue10 : spvNMin(comparisonValue10, comparisonValue11)) : (conditionValue11 ? (bitwiseValue7 ? comparisonValue10 : spvNMin(comparisonValue12, comparisonValue10)) : comparisonValue10);
            float intermediateValue44;
            if ((!(((!bitwiseValue7) && conditionValue11) || conditionValue10)) || (conditionValue10 && bitwiseValue6))
            {
                float comparisonValue15;
                if (conditionValue7 && conditionValue6)
                {
                    comparisonValue15 = ((scalarValue1 & 128u) != 0u) ? comparisonValue13 : spvNMin(spvNMax(comparisonValue11, comparisonValue12), comparisonValue13);
                }
                else
                {
                    float scalarValue4 = spvNMin(spvNMax(comparisonValue11, comparisonValue12), comparisonValue13);
                    comparisonValue15 = (conditionValue7 && conditionValue8) ? (((scalarValue1 & 4u) != 0u) ? comparisonValue13 : scalarValue4) : ((conditionValue6 && conditionValue9) ? (((scalarValue1 & 32u) != 0u) ? comparisonValue13 : scalarValue4) : ((conditionValue9 && conditionValue8) ? (((scalarValue1 & 1u) != 0u) ? comparisonValue13 : scalarValue4) : comparisonValue13));
                }
                intermediateValue44 = comparisonValue15;
            }
            else
            {
                intermediateValue44 = comparisonValue13;
            }
            float quotientValue1 = spvNClamp((1.0 / fragmentScalarConstants1.packedValues[100u]) * (scalarValue3 * 0.5), 0.0, 1.0);
            float multiplyAddValue19 = fma(-fma(quotientValue1, -2.0, 3.0), quotientValue1 * quotientValue1, 1.0);
            float exponentialValue = exp2(((-spvNMax(intermediateValue44, 0.0)) * fragmentScalarConstants1.packedValues[103u]) * 1.44269502162933349609375);
            vec3 vectorValue3 = vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2);
            float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
            float multiplyAddValue20 = rdDot2Precise(vec2(rdDot3Precise2(productValue12, vec3(-(inverseLengthValue3 * multiplyAddValue), -(inverseLengthValue3 * multiplyAddValue1), -(inverseLengthValue3 * multiplyAddValue2)))), vec2(fragmentScalarConstants1.packedValues[101u])) + fma(fragmentScalarConstants1.packedValues[101u], fragmentScalarConstants1.packedValues[101u], 1.0);
            float multiplyAddValue21 = (fma(-fragmentScalarConstants1.packedValues[101u], fragmentScalarConstants1.packedValues[101u], 1.0) * 0.079577468335628509521484375) / (multiplyAddValue20 * sqrt(multiplyAddValue20));
            multiplyAddValue16 = fma(exponentialValue * (multiplyAddValue21 * productValue11), multiplyAddValue19, productValue2);
            multiplyAddValue17 = fma(exponentialValue * (multiplyAddValue21 * productValue10), multiplyAddValue19, productValue1);
            multiplyAddValue18 = fma(exponentialValue * (multiplyAddValue21 * productValue6), multiplyAddValue19, productValue);
        }
        else
        {
            multiplyAddValue16 = productValue2;
            multiplyAddValue17 = productValue1;
            multiplyAddValue18 = productValue;
        }
        float quotientValue2 = spvNClamp((1.0 / fragmentScalarConstants1.packedValues[100u]) * scalarValue3, 0.0, 1.0);
        float multiplyAddValue22 = fma(-fma(quotientValue2, -2.0, 3.0), quotientValue2 * quotientValue2, 1.0);
        vec3 vectorValue4 = vec3(multiplyAddValue4, multiplyAddValue5, multiplyAddValue6);
        float sumValue1 = fragmentScalarConstants1.packedValues[153u] + 1.0;
        float productValue16 = sumValue1 * sumValue1;
        float quotientValue5 = spvNMax((rdDot3Precise2(vectorValue4, productValue12) + fragmentScalarConstants1.packedValues[153u]) / productValue16, 0.0);
        float quotientValue9 = spvNMax((rdDot3Precise2(vec3(-multiplyAddValue4, -multiplyAddValue5, -multiplyAddValue6), productValue12) + fragmentScalarConstants1.packedValues[153u]) / productValue16, 0.0);
        float productValue17 = varyingColor0.x * 0.3183098733425140380859375;
        float productValue18 = varyingColor0.y * 0.3183098733425140380859375;
        float productValue19 = varyingColor0.z * 0.3183098733425140380859375;
        float comparisonValue20;
        float comparisonValue21;
        float comparisonValue22;
        if (fragmentScalarConstants1.packedValues[136u] != 0.0)
        {
            bool conditionValue12 = fragmentScalarConstants1.packedValues[112u] > 0.0;
            bool conditionValue13 = fragmentScalarConstants1.packedValues[67u] > 0.0;
            float multiplyAddValue23 = conditionValue13 ? (fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue;
            float multiplyAddValue24 = conditionValue13 ? (fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue1;
            float multiplyAddValue25 = conditionValue13 ? (fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float multiplyAddValue60 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingNormal0.y, fragmentVectorConstants1.packedValues[4u].x * varyingNormal0.x));
        float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingNormal0.y, fragmentVectorConstants1.packedValues[4u].y * varyingNormal0.x));
        float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[5u].z, varyingNormal0.y, fragmentVectorConstants1.packedValues[4u].z * varyingNormal0.x));
        float inverseLengthValue7 = inversesqrt(dot(vec3(varyingTexCoord3.x, varyingTexCoord3.y, varyingTexCoord3.z), vec3(varyingTexCoord3.x, varyingTexCoord3.y, varyingTexCoord3.z)));
        float productValue38 = inverseLengthValue7 * varyingTexCoord3.x;
        float productValue39 = inverseLengthValue7 * varyingTexCoord3.y;
        float productValue40 = inverseLengthValue7 * varyingTexCoord3.z;
        float quotientValue;
        if (productValue39 > 0.0)
        {
            quotientValue = spvNMin(16.0, ((196.3300018310546875 - varyingTexCoord3.y) + fragmentVectorConstants1.packedValues[25u].y) / productValue39);
        }
        else
        {
            float branchMergedValue;
            if (productValue39 < 0.0)
            {
                branchMergedValue = spvNMin(16.0, ((192.3300018310546875 - varyingTexCoord3.y) + fragmentVectorConstants1.packedValues[25u].y) / productValue39);
            }
            else
            {
                branchMergedValue = 16.0;
            }
            quotientValue = branchMergedValue;
        }
        bool conditionValue15 = productValue40 > 0.0;
        float quotientValue3;
        uint bitwiseValue;
        if (conditionValue15)
        {
            quotientValue3 = (16.0 - varyingTexCoord5.y) / productValue40;
            bitwiseValue = (scalarValue1 >> 6u) & 1u;
        }
        else
        {
            uint branchMergedValue2;
            float branchMergedValue17;
            if (productValue40 < 0.0)
            {
                branchMergedValue2 = (scalarValue1 >> 1u) & 1u;
                branchMergedValue17 = ((-0.0) - varyingTexCoord5.y) / productValue40;
            }
            else
            {
                branchMergedValue2 = 0u;
                branchMergedValue17 = 16.0;
            }
            quotientValue3 = branchMergedValue17;
            bitwiseValue = branchMergedValue2;
        }
        bool conditionValue16 = productValue38 > 0.0;
        float quotientValue4;
        uint bitwiseValue1;
        if (conditionValue16)
        {
            quotientValue4 = (16.0 - varyingTexCoord5.x) / productValue38;
            bitwiseValue1 = (scalarValue1 >> 4u) & 1u;
        }
        else
        {
            uint branchMergedValue4;
            float branchMergedValue18;
            if (productValue38 < 0.0)
            {
                branchMergedValue4 = (scalarValue1 >> 3u) & 1u;
                branchMergedValue18 = ((-0.0) - varyingTexCoord5.x) / productValue38;
            }
            else
            {
                branchMergedValue4 = 0u;
                branchMergedValue18 = 16.0;
            }
            quotientValue4 = branchMergedValue18;
            bitwiseValue1 = branchMergedValue4;
        }
        float intermediateValue17;
        bool intermediateValue18;
        if (quotientValue4 > quotientValue3)
        {
            bool branchMergedValue5;
            float branchMergedValue19;
            if (bitwiseValue == 0u)
            {
                branchMergedValue5 = false;
                branchMergedValue19 = spvNMin(quotientValue, quotientValue3);
            }
            else
            {
                branchMergedValue5 = true;
                branchMergedValue19 = quotientValue;
            }
            intermediateValue17 = branchMergedValue19;
            intermediateValue18 = branchMergedValue5;
        }
        else
        {
            bool branchMergedValue6;
            float branchMergedValue20;
            if ((!(quotientValue4 < quotientValue3)) || (bitwiseValue1 != 0u))
            {
                branchMergedValue6 = true;
                branchMergedValue20 = quotientValue;
            }
            else
            {
                branchMergedValue6 = false;
                branchMergedValue20 = spvNMin(quotientValue, quotientValue4);
            }
            intermediateValue17 = branchMergedValue20;
            intermediateValue18 = branchMergedValue6;
        }
        float intermediateValue19;
        if (intermediateValue18)
        {
            float branchMergedValue7;
            if (conditionValue16 && conditionValue15)
            {
                float branchMergedValue27;
                if ((scalarValue1 & 128u) == 0u)
                {
                    branchMergedValue27 = spvNMin(intermediateValue17, spvNMax(quotientValue4, quotientValue3));
                }
                else
                {
                    branchMergedValue27 = intermediateValue17;
                }
                branchMergedValue7 = branchMergedValue27;
            }
            else
            {
                float branchMergedValue28;
                if (conditionValue16 && (productValue40 < 0.0))
                {
                    float branchMergedValue31;
                    if ((scalarValue1 & 4u) == 0u)
                    {
                        branchMergedValue31 = spvNMin(intermediateValue17, spvNMax(quotientValue4, quotientValue3));
                    }
                    else
                    {
                        branchMergedValue31 = intermediateValue17;
                    }
                    branchMergedValue28 = branchMergedValue31;
                }
                else
                {
                    float branchMergedValue32;
                    if ((productValue38 < 0.0) && conditionValue15)
                    {
                        float branchMergedValue35;
                        if ((scalarValue1 & 32u) == 0u)
                        {
                            branchMergedValue35 = spvNMin(intermediateValue17, spvNMax(quotientValue4, quotientValue3));
                        }
                        else
                        {
                            branchMergedValue35 = intermediateValue17;
                        }
                        branchMergedValue32 = branchMergedValue35;
                    }
                    else
                    {
                        float branchMergedValue36;
                        if (((scalarValue1 & 1u) != 0u) || ((!(productValue40 < 0.0)) || (!(productValue38 < 0.0))))
                        {
                            branchMergedValue36 = intermediateValue17;
                        }
                        else
                        {
                            branchMergedValue36 = spvNMin(intermediateValue17, spvNMax(quotientValue4, quotientValue3));
                        }
                        branchMergedValue32 = branchMergedValue36;
                    }
                    branchMergedValue28 = branchMergedValue32;
                }
                branchMergedValue7 = branchMergedValue28;
            }
            intermediateValue19 = branchMergedValue7;
        }
        else
        {
            intermediateValue19 = intermediateValue17;
        }
        float scalarValue17 = spvNMin(spvNMax(intermediateValue19, 0.0), 16.0);
        float multiplyAddValue63 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[16u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[16u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[16u].y, fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[4u].x)));
        float multiplyAddValue64 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[16u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[16u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[16u].y, fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[4u].y)));
        float multiplyAddValue65 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[16u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[16u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[16u].y, fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[4u].z)));
        float inverseLengthValue8 = inversesqrt(dot(vec3(multiplyAddValue63, multiplyAddValue64, multiplyAddValue65), vec3(multiplyAddValue63, multiplyAddValue64, multiplyAddValue65)));
        float productValue41 = inverseLengthValue8 * multiplyAddValue63;
        float productValue42 = inverseLengthValue8 * multiplyAddValue64;
        float productValue43 = inverseLengthValue8 * multiplyAddValue65;
        float productValue44 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[26u].w;
        float productValue45 = productValue44 * fragmentVectorConstants1.packedValues[26u].x;
        float productValue46 = productValue44 * fragmentVectorConstants1.packedValues[26u].y;
        float productValue50 = productValue44 * fragmentVectorConstants1.packedValues[26u].z;
        float productValue47;
        float productValue48;
        float productValue49;
        if (fragmentVectorConstants1.packedValues[23u].y != 0.0)
        {
            float productValue54 = scalarValue17 * 0.5;
            float productValue55 = productValue54 * inverseLengthValue7;
            float productValue56 = (productValue55 * varyingTexCoord3.y) + varyingTexCoord3.y;
            float productValue57 = (productValue55 * varyingTexCoord3.x) + varyingTexCoord5.x;
            float productValue58 = (productValue55 * varyingTexCoord3.z) + varyingTexCoord5.y;
            float inverseLengthValue9 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[16u].xyz), vec3(fragmentVectorConstants1.packedValues[16u].xyz)));
            float productValue59 = inverseLengthValue9 * fragmentVectorConstants1.packedValues[16u].x;
            float productValue60 = inverseLengthValue9 * fragmentVectorConstants1.packedValues[16u].y;
            float productValue61 = inverseLengthValue9 * fragmentVectorConstants1.packedValues[16u].z;
            float quotientValue6;
            if (productValue60 > 0.0)
            {
                quotientValue6 = spvNMin(16.0, ((196.3300018310546875 - productValue56) + fragmentVectorConstants1.packedValues[25u].y) / productValue60);
            }
            else
            {
                float branchMergedValue8;
                if (productValue60 < 0.0)
                {
                    branchMergedValue8 = spvNMin(16.0, ((192.3300018310546875 - productValue56) + fragmentVectorConstants1.packedValues[25u].y) / productValue60);
                }
                else
                {
                    branchMergedValue8 = 16.0;
                }
                quotientValue6 = branchMergedValue8;
            }
            bool conditionValue17 = productValue61 > 0.0;
            float quotientValue7;
            uint bitwiseValue2;
            if (conditionValue17)
            {
                quotientValue7 = (16.0 - productValue58) / productValue61;
                bitwiseValue2 = (scalarValue1 >> 6u) & 1u;
            }
            else
            {
                float branchMergedValue10;
                uint branchMergedValue23;
                if (productValue61 < 0.0)
                {
                    branchMergedValue10 = ((-0.0) - productValue58) / productValue61;
                    branchMergedValue23 = (scalarValue1 >> 1u) & 1u;
                }
                else
                {
                    branchMergedValue10 = 16.0;
                    branchMergedValue23 = 0u;
                }
                quotientValue7 = branchMergedValue10;
                bitwiseValue2 = branchMergedValue23;
            }
            bool conditionValue18 = productValue59 > 0.0;
            float quotientValue8;
            uint bitwiseValue3;
            if (conditionValue18)
            {
                quotientValue8 = (16.0 - productValue57) / productValue59;
                bitwiseValue3 = (scalarValue1 >> 4u) & 1u;
            }
            else
            {
                uint branchMergedValue11;
                float branchMergedValue24;
                if (productValue59 < 0.0)
                {
                    branchMergedValue11 = (scalarValue1 >> 3u) & 1u;
                    branchMergedValue24 = ((-0.0) - productValue57) / productValue59;
                }
                else
                {
                    branchMergedValue11 = 0u;
                    branchMergedValue24 = 16.0;
                }
                quotientValue8 = branchMergedValue24;
                bitwiseValue3 = branchMergedValue11;
            }
            float intermediateValue31;
            bool intermediateValue32;
            if (quotientValue8 > quotientValue7)
            {
                bool branchMergedValue12;
                float branchMergedValue25;
                if (bitwiseValue2 == 0u)
                {
                    branchMergedValue12 = false;
                    branchMergedValue25 = spvNMin(quotientValue6, quotientValue7);
                }
                else
                {
                    branchMergedValue12 = true;
                    branchMergedValue25 = quotientValue6;
                }
                intermediateValue31 = branchMergedValue25;
                intermediateValue32 = branchMergedValue12;
            }
            else
            {
                bool branchMergedValue13;
                float branchMergedValue26;
                if ((!(quotientValue8 < quotientValue7)) || (bitwiseValue3 != 0u))
                {
                    branchMergedValue13 = true;
                    branchMergedValue26 = quotientValue6;
                }
                else
                {
                    branchMergedValue13 = false;
                    branchMergedValue26 = spvNMin(quotientValue6, quotientValue8);
                }
                intermediateValue31 = branchMergedValue26;
                intermediateValue32 = branchMergedValue13;
            }
            float intermediateValue33;
            if (intermediateValue32)
            {
                float branchMergedValue14;
                if (conditionValue18 && conditionValue17)
                {
                    float branchMergedValue29;
                    if ((scalarValue1 & 128u) == 0u)
                    {
                        branchMergedValue29 = spvNMin(intermediateValue31, spvNMax(quotientValue8, quotientValue7));
                    }
                    else
                    {
                        branchMergedValue29 = intermediateValue31;
                    }
                    branchMergedValue14 = branchMergedValue29;
                }
                else
                {
                    float branchMergedValue30;
                    if (conditionValue18 && (productValue61 < 0.0))
                    {
                        float branchMergedValue33;
                        if ((scalarValue1 & 4u) == 0u)
                        {
                            branchMergedValue33 = spvNMin(intermediateValue31, spvNMax(quotientValue8, quotientValue7));
                        }
                        else
                        {
                            branchMergedValue33 = intermediateValue31;
                        }
                        branchMergedValue30 = branchMergedValue33;
                    }
                    else
                    {
                        float branchMergedValue34;
                        if ((productValue59 < 0.0) && conditionValue17)
                        {
                            float branchMergedValue37;
                            if ((scalarValue1 & 32u) == 0u)
                            {
                                branchMergedValue37 = spvNMin(intermediateValue31, spvNMax(quotientValue8, quotientValue7));
                            }
                            else
                            {
                                branchMergedValue37 = intermediateValue31;
                            }
                            branchMergedValue34 = branchMergedValue37;
                        }
                        else
                        {
                            float branchMergedValue38;
                            if (((scalarValue1 & 1u) != 0u) || ((!(productValue61 < 0.0)) || (!(productValue59 < 0.0))))
                            {
                                branchMergedValue38 = intermediateValue31;
                            }
                            else
                            {
                                branchMergedValue38 = spvNMin(intermediateValue31, spvNMax(quotientValue8, quotientValue7));
                            }
                            branchMergedValue34 = branchMergedValue38;
                        }
                        branchMergedValue30 = branchMergedValue34;
                    }
                    branchMergedValue14 = branchMergedValue30;
                }
                intermediateValue33 = branchMergedValue14;
            }
            else
            {
                intermediateValue33 = intermediateValue31;
            }
            float quotientValue12 = spvNClamp(productValue54 / fragmentVectorConstants1.packedValues[24u].x, 0.0, 1.0);
            float inverseLengthValue10 = inversesqrt(dot(vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54), vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54)));
            float dotProductValue = (((dot(vec3(productValue41, productValue42, productValue43), vec3((-0.0) - (multiplyAddValue52 * inverseLengthValue10), (-0.0) - (multiplyAddValue53 * inverseLengthValue10), (-0.0) - (multiplyAddValue54 * inverseLengthValue10))) * 2.0) + fragmentVectorConstants1.packedValues[24u].y) * fragmentVectorConstants1.packedValues[24u].y) + 1.0;
            float exponentialValue3 = (((1.0 - (fragmentVectorConstants1.packedValues[24u].y * fragmentVectorConstants1.packedValues[24u].y)) * 0.079577468335628509521484375) / (dotProductValue * sqrt(dotProductValue))) * ((1.0 - ((quotientValue12 * quotientValue12) * (3.0 - (quotientValue12 * 2.0)))) * exp2((spvNMin(spvNMax(intermediateValue33, 0.0), 16.0) * (-1.44269502162933349609375)) * fragmentVectorConstants1.packedValues[24u].w));
            productValue47 = (exponentialValue3 * productValue45) + productValue35;
            productValue48 = (exponentialValue3 * productValue46) + productValue36;
            productValue49 = (exponentialValue3 * productValue50) + productValue37;
        }
        else
        {
            productValue47 = productValue35;
            productValue48 = productValue36;
            productValue49 = productValue37;
        }
        float productValue51;
        float productValue52;
        float productValue53;
        if (fragmentVectorConstants1.packedValues[23u].x != 0.0)
        {
            float quotientValue13 = spvNClamp(scalarValue17 / fragmentVectorConstants1.packedValues[24u].x, 0.0, 1.0);
            float sumValue14 = fragmentVectorConstants1.packedValues[37u].y + 1.0;
            float productValue62 = sumValue14 * sumValue14;
            float dotProductValue1 = (((spvNMax((dot(vec3((-0.0) - multiplyAddValue60, (-0.0) - multiplyAddValue61, (-0.0) - multiplyAddValue62), vec3(productValue41, productValue42, productValue43)) + fragmentVectorConstants1.packedValues[37u].y) / productValue62, 0.0) * (1.0 - ((quotientValue13 * quotientValue13) * (3.0 - (quotientValue13 * 2.0))))) + spvNMax((dot(vec3(multiplyAddValue60, multiplyAddValue61, multiplyAddValue62), vec3(productValue41, productValue42, productValue43)) + fragmentVectorConstants1.packedValues[37u].y) / productValue62, 0.0)) * 0.3183098733425140380859375) * fragmentVectorConstants1.packedValues[28u].x;
            productValue51 = productValue47 + ((dotProductValue1 * varyingColor0.x) * productValue45);
            productValue52 = productValue48 + ((dotProductValue1 * varyingColor0.y) * productValue46);
            productValue53 = productValue49 + ((dotProductValue1 * varyingColor0.z) * productValue50);
        }
        else
        {
            productValue51 = productValue47;
            productValue52 = productValue48;
            productValue53 = productValue49;
        }
        float productValue63;
        float productValue64;
        float productValue65;
        if (fragmentVectorConstants1.packedValues[33u].x != 0.0)
        {
            bool conditionValue19 = fragmentVectorConstants1.packedValues[27u].x > 0.0;
#endif
            float sumValue2 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
            float sumValue3 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
            float sumValue4 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
#if RD_PLATFORM == RD_PLATFORM_SM50
            vec3 vectorValue5 = vec3(sumValue2, sumValue3, sumValue4);
            float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
            float productValue20 = inverseLengthValue4 * sumValue2;
            float productValue21 = inverseLengthValue4 * sumValue3;
            float productValue22 = inverseLengthValue4 * sumValue4;
            vec3 vectorValue6 = vec3(multiplyAddValue23, multiplyAddValue24, multiplyAddValue25);
            float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
            float scalarValue5 = rdDot3Precise2(vec3(productValue20, productValue21, productValue22), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z));
            float sumValue5 = -(scalarValue5 + scalarValue5);
            float multiplyAddValue29 = fma(varyingNormal0.x, sumValue5, productValue20);
            float multiplyAddValue30 = fma(varyingNormal0.y, sumValue5, productValue21);
            float multiplyAddValue31 = fma(varyingNormal0.z, sumValue5, productValue22);
            float sumValue6 = fragmentScalarConstants1.packedValues[137u] - 1.0;
            uint sumValue7 = uint(int(fragmentScalarConstants1.packedValues[72u])) + 2u;
            uint scalarValue6 = uint(abs(int(sumValue7))) % 3u;
            vec4 sampledTextureValue = textureLod(samplerCubeArray(materialTexture6, textureSampler6), vec4(multiplyAddValue29, multiplyAddValue30, multiplyAddValue31, trunc(fragmentScalarConstants1.packedValues[72u])), sumValue6);
            vec4 sampledTextureValue1 = textureLod(samplerCubeArray(materialTexture6, textureSampler6), vec4(multiplyAddValue29, multiplyAddValue30, multiplyAddValue31, rdSignedBitsToFloat(((sumValue7 & 2147483648u) != 0u) ? (-scalarValue6) : scalarValue6)), sumValue6);
            float scalarValue7 = sampledTextureValue1.x;
            float scalarValue8 = sampledTextureValue1.y;
            float scalarValue9 = sampledTextureValue1.z;
            float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[139u], sampledTextureValue.x - scalarValue7, scalarValue7);
            float multiplyAddValue33 = fma(fragmentScalarConstants1.packedValues[139u], sampledTextureValue.y - scalarValue8, scalarValue8);
            float multiplyAddValue34 = fma(fragmentScalarConstants1.packedValues[139u], sampledTextureValue.z - scalarValue9, scalarValue9);
            float comparisonValue14 = (conditionValue12 ? (multiplyAddValue32 * 301.72412109375) : multiplyAddValue32) * fragmentScalarConstants1.packedValues[138u];
            float comparisonValue16 = (conditionValue12 ? (multiplyAddValue33 * 301.72412109375) : multiplyAddValue33) * fragmentScalarConstants1.packedValues[138u];
            float comparisonValue17 = (conditionValue12 ? (multiplyAddValue34 * 301.72412109375) : multiplyAddValue34) * fragmentScalarConstants1.packedValues[138u];
            bool comparisonValue18 = (fragmentScalarConstants1.packedValues[119u] != 0.0) && (rdDot3Precise2(vec3(comparisonValue14, comparisonValue16, comparisonValue17), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < 0.0);
            vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(vectorValue4, vec3(-(multiplyAddValue23 * inverseLengthValue5), -(multiplyAddValue24 * inverseLengthValue5), -(multiplyAddValue25 * inverseLengthValue5))), 0.0, 1.0), 0.0));
            float multiplyAddValue35 = fma(sampledTextureValue2.x, 0.039999999105930328369140625, sampledTextureValue2.y);
            comparisonValue20 = comparisonValue18 ? 0.0 : (multiplyAddValue35 * comparisonValue17);
            comparisonValue21 = comparisonValue18 ? 0.0 : (multiplyAddValue35 * comparisonValue16);
            comparisonValue22 = comparisonValue18 ? 0.0 : (multiplyAddValue35 * comparisonValue14);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float inverseLengthValue11 = inversesqrt(dot(vec3(sumValue2, sumValue3, sumValue4), vec3(sumValue2, sumValue3, sumValue4)));
            float productValue66 = inverseLengthValue11 * sumValue2;
            float productValue67 = inverseLengthValue11 * sumValue3;
            float productValue68 = inverseLengthValue11 * sumValue4;
            float inverseLengthValue12 = inversesqrt(dot(vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54), vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54)));
            float dotProductValue2 = dot(vec3(productValue66, productValue67, productValue68), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)) * 2.0;
            float productValue69 = productValue66 - (dotProductValue2 * varyingNormal0.x);
            float productValue70 = productValue67 - (dotProductValue2 * varyingNormal0.y);
            float productValue71 = productValue68 - (dotProductValue2 * varyingNormal0.z);
            float sumValue15 = fragmentVectorConstants1.packedValues[33u].y + (-1.0);
            uint scalarValue18 = uint(int(fragmentVectorConstants1.packedValues[17u].x));
            vec4 sampledTextureValue7 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue69, productValue70, productValue71, float(int(scalarValue18))), sumValue15);
            vec4 sampledTextureValue8 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue69, productValue70, productValue71, float(int(uint(int(scalarValue18 + 2u) - int(3u) * (int(scalarValue18 + 2u) / int(3u)))))), sumValue15);
            float scalarValue19 = sampledTextureValue8.x;
            float scalarValue20 = sampledTextureValue8.y;
            float scalarValue21 = sampledTextureValue8.z;
            float productValue72 = ((sampledTextureValue7.x - scalarValue19) * fragmentVectorConstants1.packedValues[33u].w) + scalarValue19;
            float productValue73 = ((sampledTextureValue7.y - scalarValue20) * fragmentVectorConstants1.packedValues[33u].w) + scalarValue20;
            float productValue74 = ((sampledTextureValue7.z - scalarValue21) * fragmentVectorConstants1.packedValues[33u].w) + scalarValue21;
            float comparisonValue26 = (conditionValue19 ? (productValue72 * 301.72412109375) : productValue72) * fragmentVectorConstants1.packedValues[33u].z;
            float comparisonValue27 = (conditionValue19 ? (productValue73 * 301.72412109375) : productValue73) * fragmentVectorConstants1.packedValues[33u].z;
            float comparisonValue28 = (conditionValue19 ? (productValue74 * 301.72412109375) : productValue74) * fragmentVectorConstants1.packedValues[33u].z;
            float intermediateValue27;
            float intermediateValue28;
            float intermediateValue29;
            if (fragmentVectorConstants1.packedValues[28u].w != 0.0)
            {
                float branchMergedValue9;
                float branchMergedValue21;
                float branchMergedValue22;
                if (((dot(vec3(comparisonValue26, comparisonValue27, comparisonValue28), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= 0.0) ? 0.0 : 1.0) == 1.0)
                {
                    branchMergedValue9 = 0.0;
                    branchMergedValue21 = 0.0;
                    branchMergedValue22 = 0.0;
                }
                else
                {
                    branchMergedValue9 = comparisonValue28;
                    branchMergedValue21 = comparisonValue27;
                    branchMergedValue22 = comparisonValue26;
                }
                intermediateValue27 = branchMergedValue22;
                intermediateValue28 = branchMergedValue21;
                intermediateValue29 = branchMergedValue9;
            }
            else
            {
                intermediateValue27 = comparisonValue26;
                intermediateValue28 = comparisonValue27;
                intermediateValue29 = comparisonValue28;
            }
            vec4 sampledTextureValue9 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue60, multiplyAddValue61, multiplyAddValue62), vec3((-0.0) - (multiplyAddValue52 * inverseLengthValue12), (-0.0) - (multiplyAddValue53 * inverseLengthValue12), (-0.0) - (multiplyAddValue54 * inverseLengthValue12))), 0.0, 1.0), 0.0));
            float productValue75 = (sampledTextureValue9.x * 0.039999999105930328369140625) + sampledTextureValue9.y;
            productValue63 = productValue75 * intermediateValue27;
            productValue64 = productValue75 * intermediateValue28;
            productValue65 = productValue75 * intermediateValue29;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            comparisonValue20 = 0.0;
            comparisonValue21 = 0.0;
            comparisonValue22 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue63 = 0.0;
            productValue64 = 0.0;
            productValue65 = 0.0;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue7 = fma(comparisonValue20, fragmentScalarConstants1.packedValues[102u], comparisonValue9 ? fma(productValue11 * fma(quotientValue5, productValue19, multiplyAddValue22 * (quotientValue9 * productValue19)), fragmentScalarConstants1.packedValues[116u], multiplyAddValue16) : multiplyAddValue16);
        multiplyAddValue8 = fma(comparisonValue21, fragmentScalarConstants1.packedValues[102u], comparisonValue9 ? fma(productValue10 * fma(quotientValue5, productValue18, multiplyAddValue22 * (quotientValue9 * productValue18)), fragmentScalarConstants1.packedValues[116u], multiplyAddValue17) : multiplyAddValue17);
        multiplyAddValue9 = fma(comparisonValue22, fragmentScalarConstants1.packedValues[102u], comparisonValue9 ? fma(productValue6 * fma(quotientValue5, productValue17, multiplyAddValue22 * (quotientValue9 * productValue17)), fragmentScalarConstants1.packedValues[116u], multiplyAddValue18) : multiplyAddValue18);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue7 = (fragmentVectorConstants1.packedValues[24u].z * productValue63) + productValue51;
        productValue8 = (fragmentVectorConstants1.packedValues[24u].z * productValue64) + productValue52;
        productValue9 = (fragmentVectorConstants1.packedValues[24u].z * productValue65) + productValue53;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue7 = productValue2;
        multiplyAddValue8 = productValue1;
        multiplyAddValue9 = productValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue7 = productValue35;
        productValue8 = productValue36;
        productValue9 = productValue37;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue41;
    float intermediateValue42;
    float intermediateValue43;
    if (fragmentScalarConstants1.packedValues[84u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[20u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue26;
        float multiplyAddValue27;
        float multiplyAddValue28;
        if (nonlinearValue > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue1;
        float branchMergedValue15;
        float branchMergedValue16;
        if (nonlinearValue3 > 0.0)
#endif
        {
            float sumValue8 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
            float sumValue9 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
            float sumValue10 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
#if RD_PLATFORM == RD_PLATFORM_SM50
            vec3 vectorValue7 = vec3(sumValue8, sumValue9, sumValue10);
            float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
            float sumValue11 = fragmentScalarConstants1.packedValues[135u] - fragmentScalarConstants1.packedValues[132u];
            float multiplyAddValue36 = fma(sumValue9, inverseLengthValue6, sumValue11);
            float quotientValue10 = spvNClamp((1.0 / (sumValue11 + (fragmentScalarConstants1.packedValues[134u] - fragmentScalarConstants1.packedValues[135u]))) * multiplyAddValue36, 0.0, 1.0);
            float multiplyAddValue37 = fma(-fma(quotientValue10, -2.0, 3.0), quotientValue10 * quotientValue10, 1.0);
            float productValue23 = multiplyAddValue37 * (multiplyAddValue37 * multiplyAddValue37);
            vec3 productValue24 = vec3(sumValue8 * inverseLengthValue6, sumValue9 * inverseLengthValue6, sumValue10 * inverseLengthValue6);
            float scalarValue10 = rdDot3Precise2(productValue24, vec3(fragmentVectorConstants1.packedValues[40u].xyz));
            float scalarValue11 = rdDot3Precise2(productValue24, vec3(fragmentVectorConstants1.packedValues[23u].xyz));
            float quotientValue11 = spvNClamp((1.0 / (sumValue11 + fragmentScalarConstants1.packedValues[133u])) * multiplyAddValue36, 0.0, 1.0);
            float multiplyAddValue38 = fma(-fma(quotientValue11, -2.0, 3.0), quotientValue11 * quotientValue11, 1.0);
            float productValue25 = multiplyAddValue38 * (multiplyAddValue38 * multiplyAddValue38);
            float multiplyAddValue39 = fma(fma(scalarValue10, scalarValue10, 1.0) * fragmentScalarConstants1.packedValues[159u], 0.75, (fma(scalarValue11, scalarValue11, 1.0) * fragmentScalarConstants1.packedValues[127u]) * 0.75);
            float exponentialValue1 = spvNMin(exp2(log2(spvNMax(scalarValue10, 0.0)) * fragmentScalarConstants1.packedValues[79u]), 1.0);
            float exponentialValue2 = spvNMin(exp2(log2(spvNMax(scalarValue11, 0.0)) * fragmentScalarConstants1.packedValues[79u]), 1.0);
            float multiplyAddValue40 = fma(-exponentialValue1, 1.7999999523162841796875, 1.809999942779541015625);
            float multiplyAddValue41 = fma(-exponentialValue2, 1.7999999523162841796875, 1.809999942779541015625);
            float nonlinearValue1 = 0.0361000001430511474609375 / (sqrt(multiplyAddValue40) * multiplyAddValue40);
            float nonlinearValue2 = 0.0361000001430511474609375 / (sqrt(multiplyAddValue41) * multiplyAddValue41);
            multiplyAddValue26 = fma(nonlinearValue, fma((fma(productValue25, fragmentVectorConstants1.packedValues[36u].x - fragmentVectorConstants1.packedValues[20u].x, fragmentVectorConstants1.packedValues[20u].x) * fragmentScalarConstants1.packedValues[76u]) * 0.079577468335628509521484375, multiplyAddValue39, fma(exponentialValue1 * ((fragmentVectorConstants1.packedValues[39u].x * fragmentScalarConstants1.packedValues[159u]) * fragmentScalarConstants1.packedValues[77u]), nonlinearValue1, nonlinearValue2 * (exponentialValue2 * ((fragmentVectorConstants1.packedValues[31u].x * fragmentScalarConstants1.packedValues[127u]) * fragmentScalarConstants1.packedValues[78u]))) * ((productValue23 * fragmentVectorConstants1.packedValues[36u].x) * 0.079577468335628509521484375)) - multiplyAddValue9, multiplyAddValue9);
            multiplyAddValue27 = fma(nonlinearValue, fma((fma(productValue25, fragmentVectorConstants1.packedValues[36u].y - fragmentVectorConstants1.packedValues[20u].y, fragmentVectorConstants1.packedValues[20u].y) * fragmentScalarConstants1.packedValues[76u]) * 0.079577468335628509521484375, multiplyAddValue39, fma(exponentialValue1 * ((fragmentVectorConstants1.packedValues[39u].y * fragmentScalarConstants1.packedValues[159u]) * fragmentScalarConstants1.packedValues[77u]), nonlinearValue1, nonlinearValue2 * (exponentialValue2 * ((fragmentVectorConstants1.packedValues[31u].y * fragmentScalarConstants1.packedValues[127u]) * fragmentScalarConstants1.packedValues[78u]))) * ((productValue23 * fragmentVectorConstants1.packedValues[36u].y) * 0.079577468335628509521484375)) - multiplyAddValue8, multiplyAddValue8);
            multiplyAddValue28 = fma(nonlinearValue, fma((fma(productValue25, fragmentVectorConstants1.packedValues[36u].z - fragmentVectorConstants1.packedValues[20u].z, fragmentVectorConstants1.packedValues[20u].z) * fragmentScalarConstants1.packedValues[76u]) * 0.079577468335628509521484375, multiplyAddValue39, fma(exponentialValue1 * ((fragmentVectorConstants1.packedValues[39u].z * fragmentScalarConstants1.packedValues[159u]) * fragmentScalarConstants1.packedValues[77u]), nonlinearValue1, nonlinearValue2 * (exponentialValue2 * ((fragmentVectorConstants1.packedValues[31u].z * fragmentScalarConstants1.packedValues[127u]) * fragmentScalarConstants1.packedValues[78u]))) * ((productValue23 * fragmentVectorConstants1.packedValues[36u].z) * 0.079577468335628509521484375)) - multiplyAddValue7, multiplyAddValue7);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float inverseLengthValue13 = inversesqrt(dot(vec3(sumValue8, sumValue9, sumValue10), vec3(sumValue8, sumValue9, sumValue10)));
            float productValue76 = inverseLengthValue13 * sumValue8;
            float productValue77 = inverseLengthValue13 * sumValue9;
            float productValue78 = inverseLengthValue13 * sumValue10;
            float quotientValue14 = spvNClamp(((fragmentVectorConstants1.packedValues[32u].w - fragmentVectorConstants1.packedValues[32u].x) + productValue77) / (fragmentVectorConstants1.packedValues[32u].z - fragmentVectorConstants1.packedValues[32u].x), 0.0, 1.0);
            float productValue79 = 1.0 - ((quotientValue14 * quotientValue14) * (3.0 - (quotientValue14 * 2.0)));
            float productValue80 = (productValue79 * productValue79) * productValue79;
            float dotProductValue3 = dot(vec3(productValue76, productValue77, productValue78), vec3(fragmentVectorConstants1.packedValues[39u].xyz));
            float dotProductValue4 = dot(vec3(productValue76, productValue77, productValue78), vec3(fragmentVectorConstants1.packedValues[22u].xyz));
            float sumValue16 = fragmentVectorConstants1.packedValues[32u].x - fragmentVectorConstants1.packedValues[32u].w;
            float quotientValue15 = spvNClamp((productValue77 - sumValue16) / (fragmentVectorConstants1.packedValues[32u].y - sumValue16), 0.0, 1.0);
            float productValue81 = 1.0 - ((quotientValue15 * quotientValue15) * (3.0 - (quotientValue15 * 2.0)));
            float productValue82 = (productValue81 * productValue81) * productValue81;
            float productValue83 = (fragmentVectorConstants1.packedValues[18u].x * 0.75) * ((((dotProductValue4 * dotProductValue4) + 1.0) * fragmentVectorConstants1.packedValues[30u].w) + (((dotProductValue3 * dotProductValue3) + 1.0) * fragmentVectorConstants1.packedValues[38u].w));
            float exponentialValue4 = spvNClamp(exp2(log2(spvNMax(dotProductValue3, 0.0)) * fragmentVectorConstants1.packedValues[18u].w), 0.0, 1.0);
            float exponentialValue5 = spvNClamp(exp2(log2(spvNMax(dotProductValue4, 0.0)) * fragmentVectorConstants1.packedValues[18u].w), 0.0, 1.0);
            float productValue84 = 1.809999942779541015625 - (exponentialValue4 * 1.7999999523162841796875);
            float nonlinearValue4 = 0.036100022494792938232421875 / (sqrt(productValue84) * productValue84);
            float productValue85 = 1.809999942779541015625 - (exponentialValue5 * 1.7999999523162841796875);
            float nonlinearValue5 = 0.036100022494792938232421875 / (sqrt(productValue85) * productValue85);
            float productValue86 = exponentialValue4 * (fragmentVectorConstants1.packedValues[18u].y * fragmentVectorConstants1.packedValues[38u].w);
            float productValue87 = exponentialValue5 * (fragmentVectorConstants1.packedValues[18u].z * fragmentVectorConstants1.packedValues[30u].w);
            branchMergedValue1 = ((((((productValue80 * fragmentVectorConstants1.packedValues[35u].x) * (((productValue87 * fragmentVectorConstants1.packedValues[30u].x) * nonlinearValue5) + ((productValue86 * fragmentVectorConstants1.packedValues[38u].x) * nonlinearValue4))) + (((productValue82 * (fragmentVectorConstants1.packedValues[35u].x - fragmentVectorConstants1.packedValues[19u].x)) + fragmentVectorConstants1.packedValues[19u].x) * productValue83)) * 0.079577468335628509521484375) - productValue7) * nonlinearValue3) + productValue7;
            branchMergedValue15 = ((((((productValue80 * fragmentVectorConstants1.packedValues[35u].z) * (((productValue87 * fragmentVectorConstants1.packedValues[30u].z) * nonlinearValue5) + ((productValue86 * fragmentVectorConstants1.packedValues[38u].z) * nonlinearValue4))) + (((productValue82 * (fragmentVectorConstants1.packedValues[35u].z - fragmentVectorConstants1.packedValues[19u].z)) + fragmentVectorConstants1.packedValues[19u].z) * productValue83)) * 0.079577468335628509521484375) - productValue9) * nonlinearValue3) + productValue9;
            branchMergedValue16 = ((((((productValue80 * fragmentVectorConstants1.packedValues[35u].y) * (((productValue87 * fragmentVectorConstants1.packedValues[30u].y) * nonlinearValue5) + ((productValue86 * fragmentVectorConstants1.packedValues[38u].y) * nonlinearValue4))) + (((productValue82 * (fragmentVectorConstants1.packedValues[35u].y - fragmentVectorConstants1.packedValues[19u].y)) + fragmentVectorConstants1.packedValues[19u].y) * productValue83)) * 0.079577468335628509521484375) - productValue8) * nonlinearValue3) + productValue8;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue26 = multiplyAddValue9;
            multiplyAddValue27 = multiplyAddValue8;
            multiplyAddValue28 = multiplyAddValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue1 = productValue7;
            branchMergedValue15 = productValue9;
            branchMergedValue16 = productValue8;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue41 = multiplyAddValue28;
        intermediateValue42 = multiplyAddValue27;
        intermediateValue43 = multiplyAddValue26;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue2 = branchMergedValue1;
        intermediateValue3 = branchMergedValue16;
        intermediateValue4 = branchMergedValue15;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue41 = fma(nonlinearValue, fragmentVectorConstants1.packedValues[22u].z - multiplyAddValue7, multiplyAddValue7);
        intermediateValue42 = fma(nonlinearValue, fragmentVectorConstants1.packedValues[22u].y - multiplyAddValue8, multiplyAddValue8);
        intermediateValue43 = fma(nonlinearValue, fragmentVectorConstants1.packedValues[22u].x - multiplyAddValue9, multiplyAddValue9);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue2 = ((fragmentVectorConstants1.packedValues[21u].x - productValue7) * nonlinearValue3) + productValue7;
        intermediateValue3 = ((fragmentVectorConstants1.packedValues[21u].y - productValue8) * nonlinearValue3) + productValue8;
        intermediateValue4 = ((fragmentVectorConstants1.packedValues[21u].z - productValue9) * nonlinearValue3) + productValue9;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool comparisonValue19 = fragmentScalarConstants1.packedValues[172u] != 0.0;
    float multiplyAddValue49;
    float multiplyAddValue50;
    float multiplyAddValue51;
    float intermediateValue60;
    float intermediateValue61;
    float intermediateValue62;
    if (comparisonValue19)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue26;
    float productValue27;
    float productValue28;
    float intermediateValue11;
    float intermediateValue13;
    float intermediateValue14;
    if (fragmentVectorConstants1.packedValues[42u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue42 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue, multiplyAddValue1 * fragmentVectorConstants1.packedValues[1u].w)));
        float multiplyAddValue43 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue, multiplyAddValue1 * fragmentVectorConstants1.packedValues[1u].x))) / multiplyAddValue42;
        float multiplyAddValue44 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue, multiplyAddValue1 * fragmentVectorConstants1.packedValues[1u].y))) / multiplyAddValue42;
        float multiplyAddValue45 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue, multiplyAddValue1 * fragmentVectorConstants1.packedValues[1u].z))) / multiplyAddValue42;
        float productValue32 = (multiplyAddValue43 + 1.0) * 0.5;
        float productValue33 = (multiplyAddValue44 + 1.0) * 0.5;
        float multiplyAddValue46 = log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue45, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue43, multiplyAddValue44 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue45, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue43, multiplyAddValue44 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[168u]) / (fragmentScalarConstants1.packedValues[169u] - fragmentScalarConstants1.packedValues[168u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375;
        float multiplyAddValue47 = fma(multiplyAddValue46, trunc(fragmentScalarConstants1.packedValues[166u]), -0.5);
        uint sumValue12 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[166u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue47))), int(0u))))));
        float scalarValue12 = rdSignedBitsToFloat(sumValue12);
        float sumValue13 = spvNClamp(multiplyAddValue47 - scalarValue12, 0.0, 1.0);
        vec4 sampledTextureValue3 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(productValue32, productValue33, scalarValue12), 0.0);
        float scalarValue13 = sampledTextureValue3.x;
        float scalarValue14 = sampledTextureValue3.y;
        float scalarValue15 = sampledTextureValue3.z;
        float scalarValue16 = sampledTextureValue3.w;
        vec4 sampledTextureValue4 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(productValue32, productValue33, rdSignedBitsToFloat(sumValue12 + 1u)), 0.0);
        float multiplyAddValue48 = fma(sumValue13, sampledTextureValue4.w - scalarValue16, scalarValue16);
        multiplyAddValue49 = fma(multiplyAddValue48, intermediateValue43, fma(sumValue13, sampledTextureValue4.x - scalarValue13, scalarValue13));
        multiplyAddValue50 = fma(multiplyAddValue48, intermediateValue42, fma(sumValue13, sampledTextureValue4.y - scalarValue14, scalarValue14));
        multiplyAddValue51 = fma(multiplyAddValue48, intermediateValue41, fma(sumValue13, sampledTextureValue4.z - scalarValue15, scalarValue15));
        intermediateValue60 = productValue32;
        intermediateValue61 = multiplyAddValue46;
        intermediateValue62 = productValue33;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue88 = (multiplyAddValue57 + 1.0) * 0.5;
        float productValue89 = (multiplyAddValue58 + 1.0) * 0.5;
        float multiplyAddValue66 = log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue59, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue58, multiplyAddValue57 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue59, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue58, multiplyAddValue57 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[41u].x) / (fragmentVectorConstants1.packedValues[41u].y - fragmentVectorConstants1.packedValues[41u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375;
        uint scalarValue22 = uint(int(fragmentVectorConstants1.packedValues[40u].z));
        float productValue90 = (float(int(scalarValue22)) * multiplyAddValue66) + (-0.5);
        uint sumValue17 = uint(min(int(uint(max(int(uint(int(productValue90))), int(0u)))), int(scalarValue22 + 4294967294u)));
        float scalarValue23 = float(int(sumValue17));
        float sumValue18 = spvNMin(spvNMax(productValue90 - scalarValue23, 0.0), 1.0);
        vec4 sampledTextureValue10 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue88, productValue89, scalarValue23), 0.0);
        float scalarValue24 = sampledTextureValue10.x;
        float scalarValue25 = sampledTextureValue10.y;
        float scalarValue26 = sampledTextureValue10.z;
        float scalarValue27 = sampledTextureValue10.w;
        vec4 sampledTextureValue11 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue88, productValue89, float(int(sumValue17 + 1u))), 0.0);
        float productValue91 = ((sampledTextureValue11.w - scalarValue27) * sumValue18) + scalarValue27;
        productValue26 = (((sampledTextureValue11.x - scalarValue24) * sumValue18) + scalarValue24) + (productValue91 * intermediateValue2);
        productValue27 = (((sampledTextureValue11.y - scalarValue25) * sumValue18) + scalarValue25) + (productValue91 * intermediateValue3);
        productValue28 = (((sampledTextureValue11.z - scalarValue26) * sumValue18) + scalarValue26) + (productValue91 * intermediateValue4);
        intermediateValue11 = productValue88;
        intermediateValue13 = productValue89;
        intermediateValue14 = multiplyAddValue66;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue49 = intermediateValue43;
        multiplyAddValue50 = intermediateValue42;
        multiplyAddValue51 = intermediateValue41;
        intermediateValue60 = multiplyAddValue;
        intermediateValue61 = comparisonValue19 ? uintBitsToFloat(0xffffffffu ) : 0.0;
        intermediateValue62 = multiplyAddValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue26 = intermediateValue2;
        productValue27 = intermediateValue3;
        productValue28 = intermediateValue4;
        intermediateValue11 = intermediateValue12;
        intermediateValue13 = intermediateValue12;
        intermediateValue14 = intermediateValue12;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool conditionValue14 = fragmentScalarConstants1.packedValues[148u] > 0.5;
    bool intermediateValue65;
    bool sampledTextureValue5;
    if (conditionValue14)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool intermediateValue16;
    if (fragmentVectorConstants1.packedValues[36u].x > 0.5)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue65 = true;
        sampledTextureValue5 = textureLod(sampler3D(materialTexture5, textureSampler5), vec3(intermediateValue60, 1.0 - intermediateValue62, (exp2((intermediateValue61 - fragmentScalarConstants1.packedValues[150u]) * 5.770780086517333984375) - 1.0) * 0.0186573602259159088134765625), 0.0).y < fragmentScalarConstants1.packedValues[151u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        bool branchMergedValue3;
        if (textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(intermediateValue11, 1.0 - intermediateValue13, (exp2((intermediateValue14 - fragmentVectorConstants1.packedValues[36u].z) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625), 0.0).y < fragmentVectorConstants1.packedValues[36u].w)
        {
            branchMergedValue3 = false;
        }
        else
        {
            branchMergedValue3 = true;
        }
        intermediateValue16 = branchMergedValue3;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue65 = !conditionValue14;
        sampledTextureValue5 = false;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue16 = true;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool bitwiseValue8 = intermediateValue65 && sampledTextureValue5;
    float comparisonValue23;
    float comparisonValue24;
    float comparisonValue25;
    if (fragmentScalarConstants1.packedValues[112u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float comparisonValue29 = intermediateValue16 ? productValue26 : 0.0;
    float comparisonValue30 = intermediateValue16 ? productValue27 : 0.0;
    float comparisonValue31 = intermediateValue16 ? productValue28 : 0.0;
    float productValue29;
    float productValue30;
    float productValue31;
    if (fragmentVectorConstants1.packedValues[27u].x > 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float sampledTextureValue6 = (0.180000007152557373046875 / texture(sampler2D(materialTexture1, textureSampler1), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        comparisonValue23 = bitwiseValue8 ? 0.0 : (sampledTextureValue6 * multiplyAddValue51);
        comparisonValue24 = bitwiseValue8 ? 0.0 : (sampledTextureValue6 * multiplyAddValue50);
        comparisonValue25 = bitwiseValue8 ? 0.0 : (sampledTextureValue6 * multiplyAddValue49);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue12 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue29 = sampledTextureValue12 * comparisonValue29;
        productValue30 = sampledTextureValue12 * comparisonValue30;
        productValue31 = sampledTextureValue12 * comparisonValue31;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        comparisonValue23 = bitwiseValue8 ? 0.0 : multiplyAddValue51;
        comparisonValue24 = bitwiseValue8 ? 0.0 : multiplyAddValue50;
        comparisonValue25 = bitwiseValue8 ? 0.0 : multiplyAddValue49;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue29 = comparisonValue29;
        productValue30 = comparisonValue30;
        productValue31 = comparisonValue31;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = comparisonValue25;
    fragmentColor0.y = comparisonValue24;
    fragmentColor0.z = comparisonValue23;
    fragmentColor0.w = bitwiseValue8 ? 0.0 : varyingColor0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue29;
    fragmentColor0.y = productValue30;
    fragmentColor0.z = productValue31;
    fragmentColor0.w = intermediateValue16 ? varyingColor0.w : 0.0;
#endif
}
