#version 460
#extension GL_GOOGLE_include_directive : require
// CloudsForwardPBR / ForwardPBRTransparentSkyProbe / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 4
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
    float scalarValue12 = rdDot3Precise2(vectorValue, vectorValue);
    float nonlinearValue3 = spvNClamp((sqrt(scalarValue12) / fragmentScalarConstants1.packedValues[128u]) - 0.89999997615814208984375, 0.0, 1.0);
    float productValue64 = ((fragmentScalarConstants1.packedValues[143u] * fragmentVectorConstants1.packedValues[35u].x) * varyingColor0.x) * fragmentScalarConstants1.packedValues[119u];
    float productValue65 = ((fragmentScalarConstants1.packedValues[143u] * fragmentVectorConstants1.packedValues[35u].y) * varyingColor0.y) * fragmentScalarConstants1.packedValues[119u];
    float productValue66 = ((fragmentScalarConstants1.packedValues[143u] * fragmentVectorConstants1.packedValues[35u].z) * varyingColor0.z) * fragmentScalarConstants1.packedValues[119u];
    float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue23 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue24 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue25 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue23, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue18, multiplyAddValue19 * fragmentVectorConstants1.packedValues[1u].w)));
    float multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue23, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue18, multiplyAddValue19 * fragmentVectorConstants1.packedValues[1u].x))) / multiplyAddValue25;
    float multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue23, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue18, multiplyAddValue19 * fragmentVectorConstants1.packedValues[1u].y))) / multiplyAddValue25;
    float multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue23, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue18, multiplyAddValue19 * fragmentVectorConstants1.packedValues[1u].z))) / multiplyAddValue25;
    float intermediateValue24;
    float multiplyAddValue11;
    float multiplyAddValue12;
    float multiplyAddValue13;
    if (fragmentScalarConstants1.packedValues[98u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint scalarValue = uint(varyingTexCoord4);
    float nonlinearValue = spvNClamp(spvNMax((sqrt(((varyingTexCoord3.y * varyingTexCoord3.y) + (varyingTexCoord3.x * varyingTexCoord3.x)) + (varyingTexCoord3.z * varyingTexCoord3.z)) / fragmentVectorConstants1.packedValues[31u].x) + (-0.89999997615814208984375), 0.0), 0.0, 1.0);
    float productValue = fragmentVectorConstants1.packedValues[28u].w * fragmentVectorConstants1.packedValues[34u].w;
    float productValue1 = (fragmentVectorConstants1.packedValues[34u].x * varyingColor0.x) * productValue;
    float productValue2 = (fragmentVectorConstants1.packedValues[34u].y * varyingColor0.y) * productValue;
    float productValue3 = (fragmentVectorConstants1.packedValues[34u].z * varyingColor0.z) * productValue;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[0u].w)));
    float multiplyAddValue5 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[0u].x))) / multiplyAddValue4;
    float multiplyAddValue6 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[0u].y))) / multiplyAddValue4;
    float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue3, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue2, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * fragmentVectorConstants1.packedValues[0u].z))) / multiplyAddValue4;
    float productValue7;
    float productValue8;
    float productValue9;
    if (fragmentVectorConstants1.packedValues[23u].z != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue29 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingNormal0.x, varyingNormal0.y * fragmentVectorConstants1.packedValues[5u].x));
        float multiplyAddValue30 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingNormal0.x, varyingNormal0.y * fragmentVectorConstants1.packedValues[5u].y));
        float multiplyAddValue34 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingNormal0.x, varyingNormal0.y * fragmentVectorConstants1.packedValues[5u].z));
        float inverseLengthValue7 = inversesqrt(scalarValue12);
        float productValue67 = inverseLengthValue7 * varyingTexCoord3.x;
        float productValue68 = inverseLengthValue7 * varyingTexCoord3.z;
        float productValue69 = inverseLengthValue7 * varyingTexCoord3.y;
        bool conditionValue6 = productValue68 > 0.0;
        bool conditionValue7 = productValue67 > 0.0;
        float sumValue11 = fragmentScalarConstants1.packedValues[105u] - varyingTexCoord3.y;
        bool conditionValue8 = productValue68 < 0.0;
        bool conditionValue9 = productValue67 < 0.0;
        float comparisonValue6 = (productValue69 > 0.0) ? spvNMin((sumValue11 + 196.3300018310546875) / productValue69, 16.0) : ((productValue69 < 0.0) ? spvNMin((sumValue11 + 192.3300018310546875) / productValue69, 16.0) : 16.0);
        uint scalarValue = uint(varyingTexCoord4);
        bool comparisonValue7 = (scalarValue & 64u) != 0u;
        bool comparisonValue10 = (scalarValue & 2u) != 0u;
        bool comparisonValue11 = (scalarValue & 16u) != 0u;
        bool comparisonValue12 = (scalarValue & 8u) != 0u;
        float comparisonValue13 = conditionValue6 ? ((16.0 - varyingTexCoord5.y) / productValue68) : (conditionValue8 ? ((-varyingTexCoord5.y) / productValue68) : 16.0);
        bool bitwiseValue4 = ((!conditionValue6) && (conditionValue8 && comparisonValue10)) || (comparisonValue7 && conditionValue6);
        float comparisonValue14 = conditionValue7 ? ((16.0 - varyingTexCoord5.x) / productValue67) : (conditionValue9 ? ((-varyingTexCoord5.x) / productValue67) : 16.0);
        bool bitwiseValue5 = ((!conditionValue7) && (conditionValue9 && comparisonValue12)) || (conditionValue7 && comparisonValue11);
        bool conditionValue10 = comparisonValue13 < comparisonValue14;
        bool conditionValue11 = comparisonValue14 < comparisonValue13;
        float comparisonValue15 = conditionValue10 ? (bitwiseValue4 ? comparisonValue6 : spvNMin(comparisonValue6, comparisonValue13)) : (conditionValue11 ? (bitwiseValue5 ? comparisonValue6 : spvNMin(comparisonValue6, comparisonValue14)) : comparisonValue6);
        float intermediateValue25;
        if ((!(conditionValue10 || ((!bitwiseValue5) && conditionValue11))) || (conditionValue10 && bitwiseValue4))
        {
            float comparisonValue9;
            if (conditionValue6 && conditionValue7)
            {
                comparisonValue9 = ((scalarValue & 128u) != 0u) ? comparisonValue15 : spvNMin(spvNMax(comparisonValue13, comparisonValue14), comparisonValue15);
            }
            else
            {
                float scalarValue13 = spvNMin(spvNMax(comparisonValue13, comparisonValue14), comparisonValue15);
                comparisonValue9 = (conditionValue8 && conditionValue7) ? (((scalarValue & 4u) != 0u) ? comparisonValue15 : scalarValue13) : ((conditionValue6 && conditionValue9) ? (((scalarValue & 32u) != 0u) ? comparisonValue15 : scalarValue13) : ((conditionValue9 && conditionValue8) ? (((scalarValue & 1u) != 0u) ? comparisonValue15 : scalarValue13) : comparisonValue15));
            }
            intermediateValue25 = comparisonValue9;
        }
        else
        {
            intermediateValue25 = comparisonValue15;
        }
        float scalarValue14 = spvNMax(intermediateValue25, 0.0);
        float multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[71u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[70u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[68u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[69u])));
        float multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[71u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[70u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[68u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[69u])));
        float multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[71u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[70u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[68u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[69u])));
        vec3 vectorValue1 = vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37);
        float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
        float productValue70 = (fragmentScalarConstants1.packedValues[111u] * fragmentVectorConstants1.packedValues[27u].x) * fragmentScalarConstants1.packedValues[120u];
        float productValue71 = (fragmentScalarConstants1.packedValues[111u] * fragmentVectorConstants1.packedValues[27u].y) * fragmentScalarConstants1.packedValues[120u];
        float productValue72 = (fragmentScalarConstants1.packedValues[111u] * fragmentVectorConstants1.packedValues[27u].z) * fragmentScalarConstants1.packedValues[120u];
        bool comparisonValue17 = fragmentVectorConstants1.packedValues[24u].x != 0.0;
        vec3 productValue73 = vec3(inverseLengthValue8 * multiplyAddValue35, inverseLengthValue8 * multiplyAddValue36, inverseLengthValue8 * multiplyAddValue37);
        float multiplyAddValue20;
        float multiplyAddValue21;
        float multiplyAddValue22;
        if (fragmentVectorConstants1.packedValues[24u].y != 0.0)
        {
            float multiplyAddValue38 = fma(productValue68 * scalarValue14, 0.5, varyingTexCoord5.y);
            float multiplyAddValue39 = fma(productValue67 * scalarValue14, 0.5, varyingTexCoord5.x);
            vec3 vectorValue2 = vec3(fragmentVectorConstants1.packedValues[17u].xyz);
            float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
            float productValue74 = inverseLengthValue9 * fragmentVectorConstants1.packedValues[17u].y;
            float productValue75 = inverseLengthValue9 * fragmentVectorConstants1.packedValues[17u].z;
            float productValue76 = inverseLengthValue9 * fragmentVectorConstants1.packedValues[17u].x;
            bool conditionValue12 = productValue75 > 0.0;
            bool conditionValue13 = productValue76 > 0.0;
            float multiplyAddValue40 = fragmentScalarConstants1.packedValues[105u] - fma(productValue69 * scalarValue14, 0.5, varyingTexCoord3.y);
            bool conditionValue14 = productValue75 < 0.0;
            bool conditionValue15 = productValue76 < 0.0;
            float comparisonValue18 = (productValue74 > 0.0) ? spvNMin((multiplyAddValue40 + 196.3300018310546875) / productValue74, 16.0) : ((productValue74 < 0.0) ? spvNMin((multiplyAddValue40 + 192.3300018310546875) / productValue74, 16.0) : 16.0);
            float comparisonValue19 = conditionValue12 ? ((16.0 - multiplyAddValue38) / productValue75) : (conditionValue14 ? ((-multiplyAddValue38) / productValue75) : 16.0);
            bool bitwiseValue6 = (conditionValue12 && comparisonValue7) || ((!conditionValue12) && (conditionValue14 && comparisonValue10));
            float comparisonValue20 = conditionValue13 ? ((16.0 - multiplyAddValue39) / productValue76) : (conditionValue15 ? ((-multiplyAddValue39) / productValue76) : 16.0);
            bool bitwiseValue7 = ((!conditionValue13) && (conditionValue15 && comparisonValue12)) || (conditionValue13 && comparisonValue11);
            bool conditionValue16 = comparisonValue19 < comparisonValue20;
            bool conditionValue17 = comparisonValue20 < comparisonValue19;
            float comparisonValue23 = conditionValue16 ? (bitwiseValue6 ? comparisonValue18 : spvNMin(comparisonValue18, comparisonValue19)) : (conditionValue17 ? (bitwiseValue7 ? comparisonValue18 : spvNMin(comparisonValue20, comparisonValue18)) : comparisonValue18);
            float intermediateValue45;
            if ((conditionValue16 && bitwiseValue6) || (!(conditionValue16 || ((!bitwiseValue7) && conditionValue17))))
            {
                float comparisonValue16;
                if (conditionValue13 && conditionValue12)
                {
                    comparisonValue16 = ((scalarValue & 128u) != 0u) ? comparisonValue23 : spvNMin(spvNMax(comparisonValue19, comparisonValue20), comparisonValue23);
                }
                else
                {
                    float scalarValue15 = spvNMin(spvNMax(comparisonValue19, comparisonValue20), comparisonValue23);
                    comparisonValue16 = (conditionValue13 && conditionValue14) ? (((scalarValue & 4u) != 0u) ? comparisonValue23 : scalarValue15) : ((conditionValue12 && conditionValue15) ? (((scalarValue & 32u) != 0u) ? comparisonValue23 : scalarValue15) : ((conditionValue15 && conditionValue14) ? (((scalarValue & 1u) != 0u) ? comparisonValue23 : scalarValue15) : comparisonValue23));
                }
                intermediateValue45 = comparisonValue16;
            }
            else
            {
                intermediateValue45 = comparisonValue23;
            }
            float quotientValue10 = spvNClamp((1.0 / fragmentScalarConstants1.packedValues[100u]) * (scalarValue14 * 0.5), 0.0, 1.0);
            float multiplyAddValue41 = fma(-fma(quotientValue10, -2.0, 3.0), quotientValue10 * quotientValue10, 1.0);
            float exponentialValue3 = exp2(((-spvNMax(intermediateValue45, 0.0)) * fragmentScalarConstants1.packedValues[103u]) * 1.44269502162933349609375);
            vec3 vectorValue3 = vec3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue23);
            float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
            float multiplyAddValue42 = rdDot2Precise(vec2(rdDot3Precise2(productValue73, vec3(-(inverseLengthValue10 * multiplyAddValue18), -(inverseLengthValue10 * multiplyAddValue19), -(inverseLengthValue10 * multiplyAddValue23)))), vec2(fragmentScalarConstants1.packedValues[101u])) + fma(fragmentScalarConstants1.packedValues[101u], fragmentScalarConstants1.packedValues[101u], 1.0);
            float multiplyAddValue43 = (fma(-fragmentScalarConstants1.packedValues[101u], fragmentScalarConstants1.packedValues[101u], 1.0) * 0.079577468335628509521484375) / (multiplyAddValue42 * sqrt(multiplyAddValue42));
            multiplyAddValue20 = fma(exponentialValue3 * (multiplyAddValue43 * productValue72), multiplyAddValue41, productValue66);
            multiplyAddValue21 = fma(exponentialValue3 * (multiplyAddValue43 * productValue71), multiplyAddValue41, productValue65);
            multiplyAddValue22 = fma(exponentialValue3 * (multiplyAddValue43 * productValue70), multiplyAddValue41, productValue64);
        }
        else
        {
            multiplyAddValue20 = productValue66;
            multiplyAddValue21 = productValue65;
            multiplyAddValue22 = productValue64;
        }
        float quotientValue11 = spvNClamp((1.0 / fragmentScalarConstants1.packedValues[100u]) * scalarValue14, 0.0, 1.0);
        float multiplyAddValue44 = fma(-fma(quotientValue11, -2.0, 3.0), quotientValue11 * quotientValue11, 1.0);
        vec3 vectorValue4 = vec3(multiplyAddValue29, multiplyAddValue30, multiplyAddValue34);
        float sumValue12 = fragmentScalarConstants1.packedValues[157u] + 1.0;
        float productValue77 = sumValue12 * sumValue12;
        float quotientValue12 = spvNMax((rdDot3Precise2(vectorValue4, productValue73) + fragmentScalarConstants1.packedValues[157u]) / productValue77, 0.0);
        float quotientValue13 = spvNMax((rdDot3Precise2(vec3(-multiplyAddValue29, -multiplyAddValue30, -multiplyAddValue34), productValue73) + fragmentScalarConstants1.packedValues[157u]) / productValue77, 0.0);
        float productValue78 = varyingColor0.x * 0.3183098733425140380859375;
        float productValue79 = varyingColor0.y * 0.3183098733425140380859375;
        float productValue80 = varyingColor0.z * 0.3183098733425140380859375;
        float comparisonValue8;
        float comparisonValue21;
        float comparisonValue22;
        if (fragmentScalarConstants1.packedValues[136u] != 0.0)
        {
            bool conditionValue18 = fragmentScalarConstants1.packedValues[112u] > 0.0;
            bool conditionValue19 = fragmentScalarConstants1.packedValues[67u] > 0.0;
            float multiplyAddValue45 = conditionValue19 ? (fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue18;
            float multiplyAddValue46 = conditionValue19 ? (fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue19;
            float multiplyAddValue47 = conditionValue19 ? (fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue23;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingNormal0.y, fragmentVectorConstants1.packedValues[4u].x * varyingNormal0.x));
        float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingNormal0.y, fragmentVectorConstants1.packedValues[4u].y * varyingNormal0.x));
        float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingNormal0.z, fma(fragmentVectorConstants1.packedValues[5u].z, varyingNormal0.y, fragmentVectorConstants1.packedValues[4u].z * varyingNormal0.x));
        float inverseLengthValue = inversesqrt(dot(vec3(varyingTexCoord3.x, varyingTexCoord3.y, varyingTexCoord3.z), vec3(varyingTexCoord3.x, varyingTexCoord3.y, varyingTexCoord3.z)));
        float productValue4 = inverseLengthValue * varyingTexCoord3.x;
        float productValue5 = inverseLengthValue * varyingTexCoord3.y;
        float productValue6 = inverseLengthValue * varyingTexCoord3.z;
        float quotientValue;
        if (productValue5 > 0.0)
        {
            quotientValue = spvNMin(16.0, ((196.3300018310546875 - varyingTexCoord3.y) + fragmentVectorConstants1.packedValues[25u].y) / productValue5);
        }
        else
        {
            float branchMergedValue;
            if (productValue5 < 0.0)
            {
                branchMergedValue = spvNMin(16.0, ((192.3300018310546875 - varyingTexCoord3.y) + fragmentVectorConstants1.packedValues[25u].y) / productValue5);
            }
            else
            {
                branchMergedValue = 16.0;
            }
            quotientValue = branchMergedValue;
        }
        bool conditionValue = productValue6 > 0.0;
        float quotientValue3;
        uint bitwiseValue;
        if (conditionValue)
        {
            quotientValue3 = (16.0 - varyingTexCoord5.y) / productValue6;
            bitwiseValue = (scalarValue >> 6u) & 1u;
        }
        else
        {
            uint branchMergedValue2;
            float branchMergedValue17;
            if (productValue6 < 0.0)
            {
                branchMergedValue2 = (scalarValue >> 1u) & 1u;
                branchMergedValue17 = ((-0.0) - varyingTexCoord5.y) / productValue6;
            }
            else
            {
                branchMergedValue2 = 0u;
                branchMergedValue17 = 16.0;
            }
            quotientValue3 = branchMergedValue17;
            bitwiseValue = branchMergedValue2;
        }
        bool conditionValue1 = productValue4 > 0.0;
        float quotientValue4;
        uint bitwiseValue1;
        if (conditionValue1)
        {
            quotientValue4 = (16.0 - varyingTexCoord5.x) / productValue4;
            bitwiseValue1 = (scalarValue >> 4u) & 1u;
        }
        else
        {
            uint branchMergedValue4;
            float branchMergedValue18;
            if (productValue4 < 0.0)
            {
                branchMergedValue4 = (scalarValue >> 3u) & 1u;
                branchMergedValue18 = ((-0.0) - varyingTexCoord5.x) / productValue4;
            }
            else
            {
                branchMergedValue4 = 0u;
                branchMergedValue18 = 16.0;
            }
            quotientValue4 = branchMergedValue18;
            bitwiseValue1 = branchMergedValue4;
        }
        float intermediateValue18;
        bool intermediateValue19;
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
            intermediateValue18 = branchMergedValue19;
            intermediateValue19 = branchMergedValue5;
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
            intermediateValue18 = branchMergedValue20;
            intermediateValue19 = branchMergedValue6;
        }
        float intermediateValue20;
        if (intermediateValue19)
        {
            float branchMergedValue7;
            if (conditionValue1 && conditionValue)
            {
                float branchMergedValue27;
                if ((scalarValue & 128u) == 0u)
                {
                    branchMergedValue27 = spvNMin(intermediateValue18, spvNMax(quotientValue4, quotientValue3));
                }
                else
                {
                    branchMergedValue27 = intermediateValue18;
                }
                branchMergedValue7 = branchMergedValue27;
            }
            else
            {
                float branchMergedValue28;
                if (conditionValue1 && (productValue6 < 0.0))
                {
                    float branchMergedValue31;
                    if ((scalarValue & 4u) == 0u)
                    {
                        branchMergedValue31 = spvNMin(intermediateValue18, spvNMax(quotientValue4, quotientValue3));
                    }
                    else
                    {
                        branchMergedValue31 = intermediateValue18;
                    }
                    branchMergedValue28 = branchMergedValue31;
                }
                else
                {
                    float branchMergedValue32;
                    if ((productValue4 < 0.0) && conditionValue)
                    {
                        float branchMergedValue35;
                        if ((scalarValue & 32u) == 0u)
                        {
                            branchMergedValue35 = spvNMin(intermediateValue18, spvNMax(quotientValue4, quotientValue3));
                        }
                        else
                        {
                            branchMergedValue35 = intermediateValue18;
                        }
                        branchMergedValue32 = branchMergedValue35;
                    }
                    else
                    {
                        float branchMergedValue36;
                        if (((scalarValue & 1u) != 0u) || ((!(productValue6 < 0.0)) || (!(productValue4 < 0.0))))
                        {
                            branchMergedValue36 = intermediateValue18;
                        }
                        else
                        {
                            branchMergedValue36 = spvNMin(intermediateValue18, spvNMax(quotientValue4, quotientValue3));
                        }
                        branchMergedValue32 = branchMergedValue36;
                    }
                    branchMergedValue28 = branchMergedValue32;
                }
                branchMergedValue7 = branchMergedValue28;
            }
            intermediateValue20 = branchMergedValue7;
        }
        else
        {
            intermediateValue20 = intermediateValue18;
        }
        float scalarValue1 = spvNMin(spvNMax(intermediateValue20, 0.0), 16.0);
        float multiplyAddValue14 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[16u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[16u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[16u].y, fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[4u].x)));
        float multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[16u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[16u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[16u].y, fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[4u].y)));
        float multiplyAddValue16 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[16u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[16u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[16u].y, fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[4u].z)));
        float inverseLengthValue1 = inversesqrt(dot(vec3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16), vec3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16)));
        float productValue10 = inverseLengthValue1 * multiplyAddValue14;
        float productValue11 = inverseLengthValue1 * multiplyAddValue15;
        float productValue12 = inverseLengthValue1 * multiplyAddValue16;
        float productValue13 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[26u].w;
        float productValue14 = productValue13 * fragmentVectorConstants1.packedValues[26u].x;
        float productValue15 = productValue13 * fragmentVectorConstants1.packedValues[26u].y;
        float productValue16 = productValue13 * fragmentVectorConstants1.packedValues[26u].z;
        float productValue44;
        float productValue45;
        float productValue46;
        if (fragmentVectorConstants1.packedValues[23u].y != 0.0)
        {
            float productValue17 = scalarValue1 * 0.5;
            float productValue18 = productValue17 * inverseLengthValue;
            float productValue19 = (productValue18 * varyingTexCoord3.y) + varyingTexCoord3.y;
            float productValue20 = (productValue18 * varyingTexCoord3.x) + varyingTexCoord5.x;
            float productValue21 = (productValue18 * varyingTexCoord3.z) + varyingTexCoord5.y;
            float inverseLengthValue2 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[16u].xyz), vec3(fragmentVectorConstants1.packedValues[16u].xyz)));
            float productValue22 = inverseLengthValue2 * fragmentVectorConstants1.packedValues[16u].x;
            float productValue23 = inverseLengthValue2 * fragmentVectorConstants1.packedValues[16u].y;
            float productValue24 = inverseLengthValue2 * fragmentVectorConstants1.packedValues[16u].z;
            float quotientValue6;
            if (productValue23 > 0.0)
            {
                quotientValue6 = spvNMin(16.0, ((196.3300018310546875 - productValue19) + fragmentVectorConstants1.packedValues[25u].y) / productValue23);
            }
            else
            {
                float branchMergedValue8;
                if (productValue23 < 0.0)
                {
                    branchMergedValue8 = spvNMin(16.0, ((192.3300018310546875 - productValue19) + fragmentVectorConstants1.packedValues[25u].y) / productValue23);
                }
                else
                {
                    branchMergedValue8 = 16.0;
                }
                quotientValue6 = branchMergedValue8;
            }
            bool conditionValue2 = productValue24 > 0.0;
            float quotientValue7;
            uint bitwiseValue2;
            if (conditionValue2)
            {
                quotientValue7 = (16.0 - productValue21) / productValue24;
                bitwiseValue2 = (scalarValue >> 6u) & 1u;
            }
            else
            {
                uint branchMergedValue10;
                float branchMergedValue23;
                if (productValue24 < 0.0)
                {
                    branchMergedValue10 = (scalarValue >> 1u) & 1u;
                    branchMergedValue23 = ((-0.0) - productValue21) / productValue24;
                }
                else
                {
                    branchMergedValue10 = 0u;
                    branchMergedValue23 = 16.0;
                }
                quotientValue7 = branchMergedValue23;
                bitwiseValue2 = branchMergedValue10;
            }
            bool conditionValue3 = productValue22 > 0.0;
            float quotientValue8;
            uint bitwiseValue3;
            if (conditionValue3)
            {
                quotientValue8 = (16.0 - productValue20) / productValue22;
                bitwiseValue3 = (scalarValue >> 4u) & 1u;
            }
            else
            {
                uint branchMergedValue11;
                float branchMergedValue24;
                if (productValue22 < 0.0)
                {
                    branchMergedValue11 = (scalarValue >> 3u) & 1u;
                    branchMergedValue24 = ((-0.0) - productValue20) / productValue22;
                }
                else
                {
                    branchMergedValue11 = 0u;
                    branchMergedValue24 = 16.0;
                }
                quotientValue8 = branchMergedValue24;
                bitwiseValue3 = branchMergedValue11;
            }
            float intermediateValue32;
            bool intermediateValue33;
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
                intermediateValue32 = branchMergedValue25;
                intermediateValue33 = branchMergedValue12;
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
                intermediateValue32 = branchMergedValue26;
                intermediateValue33 = branchMergedValue13;
            }
            float intermediateValue34;
            if (intermediateValue33)
            {
                float branchMergedValue14;
                if (conditionValue3 && conditionValue2)
                {
                    float branchMergedValue29;
                    if ((scalarValue & 128u) == 0u)
                    {
                        branchMergedValue29 = spvNMin(intermediateValue32, spvNMax(quotientValue8, quotientValue7));
                    }
                    else
                    {
                        branchMergedValue29 = intermediateValue32;
                    }
                    branchMergedValue14 = branchMergedValue29;
                }
                else
                {
                    float branchMergedValue30;
                    if (conditionValue3 && (productValue24 < 0.0))
                    {
                        float branchMergedValue33;
                        if ((scalarValue & 4u) == 0u)
                        {
                            branchMergedValue33 = spvNMin(intermediateValue32, spvNMax(quotientValue8, quotientValue7));
                        }
                        else
                        {
                            branchMergedValue33 = intermediateValue32;
                        }
                        branchMergedValue30 = branchMergedValue33;
                    }
                    else
                    {
                        float branchMergedValue34;
                        if ((productValue22 < 0.0) && conditionValue2)
                        {
                            float branchMergedValue37;
                            if ((scalarValue & 32u) == 0u)
                            {
                                branchMergedValue37 = spvNMin(intermediateValue32, spvNMax(quotientValue8, quotientValue7));
                            }
                            else
                            {
                                branchMergedValue37 = intermediateValue32;
                            }
                            branchMergedValue34 = branchMergedValue37;
                        }
                        else
                        {
                            float branchMergedValue38;
                            if (((scalarValue & 1u) != 0u) || ((!(productValue24 < 0.0)) || (!(productValue22 < 0.0))))
                            {
                                branchMergedValue38 = intermediateValue32;
                            }
                            else
                            {
                                branchMergedValue38 = spvNMin(intermediateValue32, spvNMax(quotientValue8, quotientValue7));
                            }
                            branchMergedValue34 = branchMergedValue38;
                        }
                        branchMergedValue30 = branchMergedValue34;
                    }
                    branchMergedValue14 = branchMergedValue30;
                }
                intermediateValue34 = branchMergedValue14;
            }
            else
            {
                intermediateValue34 = intermediateValue32;
            }
            float quotientValue1 = spvNClamp(productValue17 / fragmentVectorConstants1.packedValues[24u].x, 0.0, 1.0);
            float inverseLengthValue3 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
            float dotProductValue = (((dot(vec3(productValue10, productValue11, productValue12), vec3((-0.0) - (multiplyAddValue * inverseLengthValue3), (-0.0) - (multiplyAddValue1 * inverseLengthValue3), (-0.0) - (multiplyAddValue2 * inverseLengthValue3))) * 2.0) + fragmentVectorConstants1.packedValues[24u].y) * fragmentVectorConstants1.packedValues[24u].y) + 1.0;
            float exponentialValue = (((1.0 - (fragmentVectorConstants1.packedValues[24u].y * fragmentVectorConstants1.packedValues[24u].y)) * 0.079577468335628509521484375) / (dotProductValue * sqrt(dotProductValue))) * ((1.0 - ((quotientValue1 * quotientValue1) * (3.0 - (quotientValue1 * 2.0)))) * exp2((spvNMin(spvNMax(intermediateValue34, 0.0), 16.0) * (-1.44269502162933349609375)) * fragmentVectorConstants1.packedValues[24u].w));
            productValue44 = (exponentialValue * productValue14) + productValue1;
            productValue45 = (exponentialValue * productValue15) + productValue2;
            productValue46 = (exponentialValue * productValue16) + productValue3;
        }
        else
        {
            productValue44 = productValue1;
            productValue45 = productValue2;
            productValue46 = productValue3;
        }
        float productValue48;
        float productValue49;
        float productValue50;
        if (fragmentVectorConstants1.packedValues[23u].x != 0.0)
        {
            float quotientValue2 = spvNClamp(scalarValue1 / fragmentVectorConstants1.packedValues[24u].x, 0.0, 1.0);
            float sumValue = fragmentVectorConstants1.packedValues[38u].y + 1.0;
            float productValue25 = sumValue * sumValue;
            float dotProductValue1 = (((spvNMax((dot(vec3((-0.0) - multiplyAddValue8, (-0.0) - multiplyAddValue9, (-0.0) - multiplyAddValue10), vec3(productValue10, productValue11, productValue12)) + fragmentVectorConstants1.packedValues[38u].y) / productValue25, 0.0) * (1.0 - ((quotientValue2 * quotientValue2) * (3.0 - (quotientValue2 * 2.0))))) + spvNMax((dot(vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), vec3(productValue10, productValue11, productValue12)) + fragmentVectorConstants1.packedValues[38u].y) / productValue25, 0.0)) * 0.3183098733425140380859375) * fragmentVectorConstants1.packedValues[28u].x;
            productValue48 = productValue44 + ((dotProductValue1 * varyingColor0.x) * productValue14);
            productValue49 = productValue45 + ((dotProductValue1 * varyingColor0.y) * productValue15);
            productValue50 = productValue46 + ((dotProductValue1 * varyingColor0.z) * productValue16);
        }
        else
        {
            productValue48 = productValue44;
            productValue49 = productValue45;
            productValue50 = productValue46;
        }
        float productValue60;
        float productValue61;
        float productValue62;
        if (fragmentVectorConstants1.packedValues[33u].x != 0.0)
        {
            bool conditionValue4 = fragmentVectorConstants1.packedValues[27u].x > 0.0;
#endif
            float sumValue1 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
            float sumValue2 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
            float sumValue3 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
#if RD_PLATFORM == RD_PLATFORM_SM50
            vec3 vectorValue5 = vec3(sumValue1, sumValue2, sumValue3);
            float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
            float productValue81 = inverseLengthValue11 * sumValue1;
            float productValue82 = inverseLengthValue11 * sumValue2;
            float productValue83 = inverseLengthValue11 * sumValue3;
            vec3 vectorValue6 = vec3(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47);
            float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
            float scalarValue16 = rdDot3Precise2(vec3(productValue81, productValue82, productValue83), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z));
            float sumValue13 = -(scalarValue16 + scalarValue16);
            float multiplyAddValue48 = fma(varyingNormal0.x, sumValue13, productValue81);
            float multiplyAddValue49 = fma(varyingNormal0.y, sumValue13, productValue82);
            float multiplyAddValue53 = fma(varyingNormal0.z, sumValue13, productValue83);
            float sumValue14 = fragmentScalarConstants1.packedValues[137u] - 1.0;
            uint sumValue15 = uint(int(fragmentScalarConstants1.packedValues[72u])) + 2u;
            uint scalarValue17 = uint(abs(int(sumValue15))) % 3u;
            vec4 sampledTextureValue6 = textureLod(samplerCubeArray(materialTexture6, textureSampler6), vec4(multiplyAddValue48, multiplyAddValue49, multiplyAddValue53, trunc(fragmentScalarConstants1.packedValues[72u])), sumValue14);
            vec4 sampledTextureValue7 = textureLod(samplerCubeArray(materialTexture6, textureSampler6), vec4(multiplyAddValue48, multiplyAddValue49, multiplyAddValue53, rdSignedBitsToFloat(((sumValue15 & 2147483648u) != 0u) ? (-scalarValue17) : scalarValue17)), sumValue14);
            float scalarValue18 = sampledTextureValue7.x;
            float scalarValue19 = sampledTextureValue7.y;
            float scalarValue20 = sampledTextureValue7.z;
            float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[139u], sampledTextureValue6.x - scalarValue18, scalarValue18);
            float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[139u], sampledTextureValue6.y - scalarValue19, scalarValue19);
            float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[139u], sampledTextureValue6.z - scalarValue20, scalarValue20);
            float comparisonValue24 = (conditionValue18 ? (multiplyAddValue54 * 301.72412109375) : multiplyAddValue54) * fragmentScalarConstants1.packedValues[138u];
            float comparisonValue25 = (conditionValue18 ? (multiplyAddValue55 * 301.72412109375) : multiplyAddValue55) * fragmentScalarConstants1.packedValues[138u];
            float comparisonValue26 = (conditionValue18 ? (multiplyAddValue56 * 301.72412109375) : multiplyAddValue56) * fragmentScalarConstants1.packedValues[138u];
            bool comparisonValue27 = (fragmentScalarConstants1.packedValues[119u] != 0.0) && (rdDot3Precise2(vec3(comparisonValue24, comparisonValue25, comparisonValue26), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < 0.0);
            vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(vectorValue4, vec3(-(multiplyAddValue45 * inverseLengthValue12), -(multiplyAddValue46 * inverseLengthValue12), -(multiplyAddValue47 * inverseLengthValue12))), 0.0, 1.0), 0.0));
            float multiplyAddValue57 = fma(sampledTextureValue8.x, 0.039999999105930328369140625, sampledTextureValue8.y);
            comparisonValue21 = comparisonValue27 ? 0.0 : (multiplyAddValue57 * comparisonValue26);
            comparisonValue22 = comparisonValue27 ? 0.0 : (multiplyAddValue57 * comparisonValue25);
            comparisonValue8 = comparisonValue27 ? 0.0 : (multiplyAddValue57 * comparisonValue24);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float inverseLengthValue4 = inversesqrt(dot(vec3(sumValue1, sumValue2, sumValue3), vec3(sumValue1, sumValue2, sumValue3)));
            float productValue29 = inverseLengthValue4 * sumValue1;
            float productValue30 = inverseLengthValue4 * sumValue2;
            float productValue31 = inverseLengthValue4 * sumValue3;
            float inverseLengthValue5 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
            float dotProductValue2 = dot(vec3(productValue29, productValue30, productValue31), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)) * 2.0;
            float productValue32 = productValue29 - (dotProductValue2 * varyingNormal0.x);
            float productValue33 = productValue30 - (dotProductValue2 * varyingNormal0.y);
            float productValue34 = productValue31 - (dotProductValue2 * varyingNormal0.z);
            float sumValue4 = fragmentVectorConstants1.packedValues[33u].y + (-1.0);
            uint scalarValue2 = uint(int(fragmentVectorConstants1.packedValues[17u].x));
            vec4 sampledTextureValue = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue32, productValue33, productValue34, float(int(scalarValue2))), sumValue4);
            vec4 sampledTextureValue1 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue32, productValue33, productValue34, float(int(uint(int(scalarValue2 + 2u) - int(3u) * (int(scalarValue2 + 2u) / int(3u)))))), sumValue4);
            float scalarValue3 = sampledTextureValue1.x;
            float scalarValue4 = sampledTextureValue1.y;
            float scalarValue5 = sampledTextureValue1.z;
            float productValue35 = ((sampledTextureValue.x - scalarValue3) * fragmentVectorConstants1.packedValues[33u].w) + scalarValue3;
            float productValue36 = ((sampledTextureValue.y - scalarValue4) * fragmentVectorConstants1.packedValues[33u].w) + scalarValue4;
            float productValue37 = ((sampledTextureValue.z - scalarValue5) * fragmentVectorConstants1.packedValues[33u].w) + scalarValue5;
            float comparisonValue = (conditionValue4 ? (productValue35 * 301.72412109375) : productValue35) * fragmentVectorConstants1.packedValues[33u].z;
            float comparisonValue1 = (conditionValue4 ? (productValue36 * 301.72412109375) : productValue36) * fragmentVectorConstants1.packedValues[33u].z;
            float comparisonValue2 = (conditionValue4 ? (productValue37 * 301.72412109375) : productValue37) * fragmentVectorConstants1.packedValues[33u].z;
            float intermediateValue28;
            float intermediateValue29;
            float intermediateValue30;
            if (fragmentVectorConstants1.packedValues[28u].w != 0.0)
            {
                float branchMergedValue9;
                float branchMergedValue21;
                float branchMergedValue22;
                if (((dot(vec3(comparisonValue, comparisonValue1, comparisonValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= 0.0) ? 0.0 : 1.0) == 1.0)
                {
                    branchMergedValue9 = 0.0;
                    branchMergedValue21 = 0.0;
                    branchMergedValue22 = 0.0;
                }
                else
                {
                    branchMergedValue9 = comparisonValue2;
                    branchMergedValue21 = comparisonValue1;
                    branchMergedValue22 = comparisonValue;
                }
                intermediateValue28 = branchMergedValue22;
                intermediateValue29 = branchMergedValue21;
                intermediateValue30 = branchMergedValue9;
            }
            else
            {
                intermediateValue28 = comparisonValue;
                intermediateValue29 = comparisonValue1;
                intermediateValue30 = comparisonValue2;
            }
            vec4 sampledTextureValue2 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue8, multiplyAddValue9, multiplyAddValue10), vec3((-0.0) - (multiplyAddValue * inverseLengthValue5), (-0.0) - (multiplyAddValue1 * inverseLengthValue5), (-0.0) - (multiplyAddValue2 * inverseLengthValue5))), 0.0, 1.0), 0.0));
            float productValue38 = (sampledTextureValue2.x * 0.039999999105930328369140625) + sampledTextureValue2.y;
            productValue60 = productValue38 * intermediateValue28;
            productValue61 = productValue38 * intermediateValue29;
            productValue62 = productValue38 * intermediateValue30;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            comparisonValue21 = 0.0;
            comparisonValue22 = 0.0;
            comparisonValue8 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue60 = 0.0;
            productValue61 = 0.0;
            productValue62 = 0.0;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue24 = comparisonValue8;
        multiplyAddValue11 = fma(comparisonValue21, fragmentScalarConstants1.packedValues[102u], comparisonValue17 ? fma(productValue72 * fma(quotientValue12, productValue80, multiplyAddValue44 * (quotientValue13 * productValue80)), fragmentScalarConstants1.packedValues[116u], multiplyAddValue20) : multiplyAddValue20);
        multiplyAddValue12 = fma(comparisonValue22, fragmentScalarConstants1.packedValues[102u], comparisonValue17 ? fma(productValue71 * fma(quotientValue12, productValue79, multiplyAddValue44 * (quotientValue13 * productValue79)), fragmentScalarConstants1.packedValues[116u], multiplyAddValue21) : multiplyAddValue21);
        multiplyAddValue13 = fma(comparisonValue8, fragmentScalarConstants1.packedValues[102u], comparisonValue17 ? fma(productValue70 * fma(quotientValue12, productValue78, multiplyAddValue44 * (quotientValue13 * productValue78)), fragmentScalarConstants1.packedValues[116u], multiplyAddValue22) : multiplyAddValue22);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue7 = (fragmentVectorConstants1.packedValues[24u].z * productValue60) + productValue48;
        productValue8 = (fragmentVectorConstants1.packedValues[24u].z * productValue61) + productValue49;
        productValue9 = (fragmentVectorConstants1.packedValues[24u].z * productValue62) + productValue50;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue24 = multiplyAddValue18;
        multiplyAddValue11 = productValue66;
        multiplyAddValue12 = productValue65;
        multiplyAddValue13 = productValue64;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue7 = productValue1;
        productValue8 = productValue2;
        productValue9 = productValue3;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue41;
    uint intermediateValue42;
    uint intermediateValue43;
    uint intermediateValue44;
    if (fragmentScalarConstants1.packedValues[84u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[20u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint multiplyAddValue31;
        uint multiplyAddValue32;
        uint multiplyAddValue33;
        float intermediateValue40;
        if (nonlinearValue3 > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue1;
        float branchMergedValue15;
        float branchMergedValue16;
        if (nonlinearValue > 0.0)
#endif
        {
            float sumValue5 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
            float sumValue6 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
            float sumValue7 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
#if RD_PLATFORM == RD_PLATFORM_SM50
            vec3 vectorValue7 = vec3(sumValue5, sumValue6, sumValue7);
            float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
            float sumValue16 = fragmentScalarConstants1.packedValues[135u] - fragmentScalarConstants1.packedValues[132u];
            float multiplyAddValue58 = fma(sumValue6, inverseLengthValue13, sumValue16);
            float quotientValue14 = spvNClamp((1.0 / (sumValue16 + (fragmentScalarConstants1.packedValues[134u] - fragmentScalarConstants1.packedValues[135u]))) * multiplyAddValue58, 0.0, 1.0);
            float multiplyAddValue59 = fma(-fma(quotientValue14, -2.0, 3.0), quotientValue14 * quotientValue14, 1.0);
            float productValue84 = multiplyAddValue59 * (multiplyAddValue59 * multiplyAddValue59);
            vec3 productValue85 = vec3(sumValue5 * inverseLengthValue13, sumValue6 * inverseLengthValue13, sumValue7 * inverseLengthValue13);
            float scalarValue21 = rdDot3Precise2(productValue85, vec3(fragmentVectorConstants1.packedValues[41u].xyz));
            float scalarValue22 = rdDot3Precise2(productValue85, vec3(fragmentVectorConstants1.packedValues[23u].xyz));
            float quotientValue15 = spvNClamp((1.0 / (sumValue16 + fragmentScalarConstants1.packedValues[133u])) * multiplyAddValue58, 0.0, 1.0);
            float multiplyAddValue60 = fma(-fma(quotientValue15, -2.0, 3.0), quotientValue15 * quotientValue15, 1.0);
            float productValue86 = multiplyAddValue60 * (multiplyAddValue60 * multiplyAddValue60);
            float multiplyAddValue61 = fma(fma(scalarValue21, scalarValue21, 1.0) * fragmentScalarConstants1.packedValues[163u], 0.75, (fma(scalarValue22, scalarValue22, 1.0) * fragmentScalarConstants1.packedValues[127u]) * 0.75);
            float exponentialValue4 = spvNMin(exp2(log2(spvNMax(scalarValue21, 0.0)) * fragmentScalarConstants1.packedValues[79u]), 1.0);
            float exponentialValue5 = spvNMin(exp2(log2(spvNMax(scalarValue22, 0.0)) * fragmentScalarConstants1.packedValues[79u]), 1.0);
            float multiplyAddValue62 = fma(-exponentialValue4, 1.7999999523162841796875, 1.809999942779541015625);
            float multiplyAddValue63 = fma(-exponentialValue5, 1.7999999523162841796875, 1.809999942779541015625);
            float nonlinearValue4 = 0.0361000001430511474609375 / (sqrt(multiplyAddValue62) * multiplyAddValue62);
            float nonlinearValue5 = 0.0361000001430511474609375 / (sqrt(multiplyAddValue63) * multiplyAddValue63);
            float multiplyAddValue64 = fma(exponentialValue4 * ((fragmentVectorConstants1.packedValues[40u].x * fragmentScalarConstants1.packedValues[163u]) * fragmentScalarConstants1.packedValues[77u]), nonlinearValue4, nonlinearValue5 * (exponentialValue5 * ((fragmentVectorConstants1.packedValues[31u].x * fragmentScalarConstants1.packedValues[127u]) * fragmentScalarConstants1.packedValues[78u]))) * ((productValue84 * fragmentVectorConstants1.packedValues[36u].x) * 0.079577468335628509521484375);
            multiplyAddValue31 = floatBitsToUint(fma(nonlinearValue3, fma((fma(productValue86, fragmentVectorConstants1.packedValues[36u].x - fragmentVectorConstants1.packedValues[20u].x, fragmentVectorConstants1.packedValues[20u].x) * fragmentScalarConstants1.packedValues[76u]) * 0.079577468335628509521484375, multiplyAddValue61, multiplyAddValue64) - multiplyAddValue13, multiplyAddValue13));
            multiplyAddValue32 = floatBitsToUint(fma(nonlinearValue3, fma((fma(productValue86, fragmentVectorConstants1.packedValues[36u].y - fragmentVectorConstants1.packedValues[20u].y, fragmentVectorConstants1.packedValues[20u].y) * fragmentScalarConstants1.packedValues[76u]) * 0.079577468335628509521484375, multiplyAddValue61, fma(exponentialValue4 * ((fragmentVectorConstants1.packedValues[40u].y * fragmentScalarConstants1.packedValues[163u]) * fragmentScalarConstants1.packedValues[77u]), nonlinearValue4, nonlinearValue5 * (exponentialValue5 * ((fragmentVectorConstants1.packedValues[31u].y * fragmentScalarConstants1.packedValues[127u]) * fragmentScalarConstants1.packedValues[78u]))) * ((productValue84 * fragmentVectorConstants1.packedValues[36u].y) * 0.079577468335628509521484375)) - multiplyAddValue12, multiplyAddValue12));
            multiplyAddValue33 = floatBitsToUint(fma(nonlinearValue3, fma((fma(productValue86, fragmentVectorConstants1.packedValues[36u].z - fragmentVectorConstants1.packedValues[20u].z, fragmentVectorConstants1.packedValues[20u].z) * fragmentScalarConstants1.packedValues[76u]) * 0.079577468335628509521484375, multiplyAddValue61, fma(exponentialValue4 * ((fragmentVectorConstants1.packedValues[40u].z * fragmentScalarConstants1.packedValues[163u]) * fragmentScalarConstants1.packedValues[77u]), nonlinearValue4, nonlinearValue5 * (exponentialValue5 * ((fragmentVectorConstants1.packedValues[31u].z * fragmentScalarConstants1.packedValues[127u]) * fragmentScalarConstants1.packedValues[78u]))) * ((productValue84 * fragmentVectorConstants1.packedValues[36u].z) * 0.079577468335628509521484375)) - multiplyAddValue11, multiplyAddValue11));
            intermediateValue40 = multiplyAddValue64;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float inverseLengthValue6 = inversesqrt(dot(vec3(sumValue5, sumValue6, sumValue7), vec3(sumValue5, sumValue6, sumValue7)));
            float productValue39 = inverseLengthValue6 * sumValue5;
            float productValue40 = inverseLengthValue6 * sumValue6;
            float productValue41 = inverseLengthValue6 * sumValue7;
            float quotientValue5 = spvNClamp(((fragmentVectorConstants1.packedValues[32u].w - fragmentVectorConstants1.packedValues[32u].x) + productValue40) / (fragmentVectorConstants1.packedValues[32u].z - fragmentVectorConstants1.packedValues[32u].x), 0.0, 1.0);
            float productValue42 = 1.0 - ((quotientValue5 * quotientValue5) * (3.0 - (quotientValue5 * 2.0)));
            float productValue43 = (productValue42 * productValue42) * productValue42;
            float dotProductValue3 = dot(vec3(productValue39, productValue40, productValue41), vec3(fragmentVectorConstants1.packedValues[40u].xyz));
            float dotProductValue4 = dot(vec3(productValue39, productValue40, productValue41), vec3(fragmentVectorConstants1.packedValues[22u].xyz));
            float sumValue8 = fragmentVectorConstants1.packedValues[32u].x - fragmentVectorConstants1.packedValues[32u].w;
            float quotientValue9 = spvNClamp((productValue40 - sumValue8) / (fragmentVectorConstants1.packedValues[32u].y - sumValue8), 0.0, 1.0);
            float productValue47 = 1.0 - ((quotientValue9 * quotientValue9) * (3.0 - (quotientValue9 * 2.0)));
            float productValue51 = (productValue47 * productValue47) * productValue47;
            float productValue52 = (fragmentVectorConstants1.packedValues[18u].x * 0.75) * ((((dotProductValue4 * dotProductValue4) + 1.0) * fragmentVectorConstants1.packedValues[30u].w) + (((dotProductValue3 * dotProductValue3) + 1.0) * fragmentVectorConstants1.packedValues[39u].w));
            float exponentialValue1 = spvNClamp(exp2(log2(spvNMax(dotProductValue3, 0.0)) * fragmentVectorConstants1.packedValues[18u].w), 0.0, 1.0);
            float exponentialValue2 = spvNClamp(exp2(log2(spvNMax(dotProductValue4, 0.0)) * fragmentVectorConstants1.packedValues[18u].w), 0.0, 1.0);
            float productValue53 = 1.809999942779541015625 - (exponentialValue1 * 1.7999999523162841796875);
            float nonlinearValue1 = 0.036100022494792938232421875 / (sqrt(productValue53) * productValue53);
            float productValue54 = 1.809999942779541015625 - (exponentialValue2 * 1.7999999523162841796875);
            float nonlinearValue2 = 0.036100022494792938232421875 / (sqrt(productValue54) * productValue54);
            float productValue55 = exponentialValue1 * (fragmentVectorConstants1.packedValues[18u].y * fragmentVectorConstants1.packedValues[39u].w);
            float productValue56 = exponentialValue2 * (fragmentVectorConstants1.packedValues[18u].z * fragmentVectorConstants1.packedValues[30u].w);
            branchMergedValue1 = ((((((productValue43 * fragmentVectorConstants1.packedValues[35u].z) * (((productValue56 * fragmentVectorConstants1.packedValues[30u].z) * nonlinearValue2) + ((productValue55 * fragmentVectorConstants1.packedValues[39u].z) * nonlinearValue1))) + (((productValue51 * (fragmentVectorConstants1.packedValues[35u].z - fragmentVectorConstants1.packedValues[19u].z)) + fragmentVectorConstants1.packedValues[19u].z) * productValue52)) * 0.079577468335628509521484375) - productValue9) * nonlinearValue) + productValue9;
            branchMergedValue15 = ((((((productValue43 * fragmentVectorConstants1.packedValues[35u].y) * (((productValue56 * fragmentVectorConstants1.packedValues[30u].y) * nonlinearValue2) + ((productValue55 * fragmentVectorConstants1.packedValues[39u].y) * nonlinearValue1))) + (((productValue51 * (fragmentVectorConstants1.packedValues[35u].y - fragmentVectorConstants1.packedValues[19u].y)) + fragmentVectorConstants1.packedValues[19u].y) * productValue52)) * 0.079577468335628509521484375) - productValue8) * nonlinearValue) + productValue8;
            branchMergedValue16 = ((((((productValue43 * fragmentVectorConstants1.packedValues[35u].x) * (((productValue56 * fragmentVectorConstants1.packedValues[30u].x) * nonlinearValue2) + ((productValue55 * fragmentVectorConstants1.packedValues[39u].x) * nonlinearValue1))) + (((productValue51 * (fragmentVectorConstants1.packedValues[35u].x - fragmentVectorConstants1.packedValues[19u].x)) + fragmentVectorConstants1.packedValues[19u].x) * productValue52)) * 0.079577468335628509521484375) - productValue7) * nonlinearValue) + productValue7;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue31 = floatBitsToUint(multiplyAddValue13);
            multiplyAddValue32 = floatBitsToUint(multiplyAddValue12);
            multiplyAddValue33 = floatBitsToUint(multiplyAddValue11);
            intermediateValue40 = intermediateValue24;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue1 = productValue9;
            branchMergedValue15 = productValue8;
            branchMergedValue16 = productValue7;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue41 = intermediateValue40;
        intermediateValue42 = multiplyAddValue33;
        intermediateValue43 = multiplyAddValue32;
        intermediateValue44 = multiplyAddValue31;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue2 = branchMergedValue16;
        intermediateValue3 = branchMergedValue15;
        intermediateValue4 = branchMergedValue1;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue41 = intermediateValue24;
        intermediateValue42 = floatBitsToUint(fma(nonlinearValue3, fragmentVectorConstants1.packedValues[22u].z - multiplyAddValue11, multiplyAddValue11));
        intermediateValue43 = floatBitsToUint(fma(nonlinearValue3, fragmentVectorConstants1.packedValues[22u].y - multiplyAddValue12, multiplyAddValue12));
        intermediateValue44 = floatBitsToUint(fma(nonlinearValue3, fragmentVectorConstants1.packedValues[22u].x - multiplyAddValue13, multiplyAddValue13));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue2 = ((fragmentVectorConstants1.packedValues[21u].x - productValue7) * nonlinearValue) + productValue7;
        intermediateValue3 = ((fragmentVectorConstants1.packedValues[21u].y - productValue8) * nonlinearValue) + productValue8;
        intermediateValue4 = ((fragmentVectorConstants1.packedValues[21u].z - productValue9) * nonlinearValue) + productValue9;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    bool comparisonValue28 = fragmentScalarConstants1.packedValues[176u] != 0.0;
    uint multiplyAddValue50;
    uint multiplyAddValue51;
    uint multiplyAddValue52;
    float intermediateValue61;
    float intermediateValue62;
    float intermediateValue63;
    if (comparisonValue28)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue26;
    float productValue27;
    float productValue28;
    float intermediateValue11;
    float intermediateValue13;
    float intermediateValue14;
    if (fragmentVectorConstants1.packedValues[43u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float productValue87 = (multiplyAddValue26 + 1.0) * 0.5;
        float productValue88 = (multiplyAddValue27 + 1.0) * 0.5;
        float multiplyAddValue65 = log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue28, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue26, multiplyAddValue27 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue28, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue26, multiplyAddValue27 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[172u]) / (fragmentScalarConstants1.packedValues[173u] - fragmentScalarConstants1.packedValues[172u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375;
        float multiplyAddValue66 = fma(multiplyAddValue65, trunc(fragmentScalarConstants1.packedValues[170u]), -0.5);
        uint sumValue17 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[170u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue66))), int(0u))))));
        float scalarValue23 = rdSignedBitsToFloat(sumValue17);
        float sumValue18 = spvNClamp(multiplyAddValue66 - scalarValue23, 0.0, 1.0);
        vec4 sampledTextureValue9 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(productValue87, productValue88, scalarValue23), 0.0);
        float scalarValue24 = sampledTextureValue9.x;
        float scalarValue25 = sampledTextureValue9.y;
        float scalarValue26 = sampledTextureValue9.z;
        float scalarValue27 = sampledTextureValue9.w;
        vec4 sampledTextureValue10 = textureLod(sampler2DArray(materialTexture3, textureSampler3), vec3(productValue87, productValue88, rdSignedBitsToFloat(sumValue17 + 1u)), 0.0);
        float multiplyAddValue67 = fma(sumValue18, sampledTextureValue10.w - scalarValue27, scalarValue27);
        multiplyAddValue50 = floatBitsToUint(fma(multiplyAddValue67, uintBitsToFloat(intermediateValue44), fma(sumValue18, sampledTextureValue10.x - scalarValue24, scalarValue24)));
        multiplyAddValue51 = floatBitsToUint(fma(multiplyAddValue67, uintBitsToFloat(intermediateValue43), fma(sumValue18, sampledTextureValue10.y - scalarValue25, scalarValue25)));
        multiplyAddValue52 = floatBitsToUint(fma(multiplyAddValue67, uintBitsToFloat(intermediateValue42), fma(sumValue18, sampledTextureValue10.z - scalarValue26, scalarValue26)));
        intermediateValue61 = productValue87;
        intermediateValue62 = multiplyAddValue65;
        intermediateValue63 = productValue88;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue57 = (multiplyAddValue5 + 1.0) * 0.5;
        float productValue58 = (multiplyAddValue6 + 1.0) * 0.5;
        float multiplyAddValue17 = log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue6, multiplyAddValue5 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue7, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue6, multiplyAddValue5 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[42u].x) / (fragmentVectorConstants1.packedValues[42u].y - fragmentVectorConstants1.packedValues[42u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375;
        uint scalarValue6 = uint(int(fragmentVectorConstants1.packedValues[41u].z));
        float productValue59 = (float(int(scalarValue6)) * multiplyAddValue17) + (-0.5);
        uint sumValue9 = uint(min(int(uint(max(int(uint(int(productValue59))), int(0u)))), int(scalarValue6 + 4294967294u)));
        float scalarValue7 = float(int(sumValue9));
        float sumValue10 = spvNMin(spvNMax(productValue59 - scalarValue7, 0.0), 1.0);
        vec4 sampledTextureValue3 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue57, productValue58, scalarValue7), 0.0);
        float scalarValue8 = sampledTextureValue3.x;
        float scalarValue9 = sampledTextureValue3.y;
        float scalarValue10 = sampledTextureValue3.z;
        float scalarValue11 = sampledTextureValue3.w;
        vec4 sampledTextureValue4 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue57, productValue58, float(int(sumValue9 + 1u))), 0.0);
        float productValue63 = ((sampledTextureValue4.w - scalarValue11) * sumValue10) + scalarValue11;
        productValue26 = (((sampledTextureValue4.x - scalarValue8) * sumValue10) + scalarValue8) + (productValue63 * intermediateValue2);
        productValue27 = (((sampledTextureValue4.y - scalarValue9) * sumValue10) + scalarValue9) + (productValue63 * intermediateValue3);
        productValue28 = (((sampledTextureValue4.z - scalarValue10) * sumValue10) + scalarValue10) + (productValue63 * intermediateValue4);
        intermediateValue11 = productValue57;
        intermediateValue13 = productValue58;
        intermediateValue14 = multiplyAddValue17;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue50 = intermediateValue44;
        multiplyAddValue51 = intermediateValue43;
        multiplyAddValue52 = intermediateValue42;
        intermediateValue61 = comparisonValue28 ? uintBitsToFloat(0xffffffffu ) : 0.0;
        intermediateValue62 = intermediateValue41;
        intermediateValue63 = nonlinearValue3;
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
    uint intermediateValue65;
    bool sampledTextureValue5;
    if (fragmentScalarConstants1.packedValues[152u] > 0.5)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool intermediateValue16;
    if (fragmentVectorConstants1.packedValues[37u].x > 0.5)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue65 = 0u;
        sampledTextureValue5 = textureLod(sampler3D(materialTexture5, textureSampler5), vec3(intermediateValue61, 1.0 - intermediateValue63, (exp2((intermediateValue62 - fragmentScalarConstants1.packedValues[154u]) * 5.770780086517333984375) - 1.0) * 0.0186573602259159088134765625), 0.0).y < fragmentScalarConstants1.packedValues[155u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        bool branchMergedValue3;
        if (textureLod(sampler3D(skyAmbientSamplesTexture, skyAmbientSamplesSampler), vec3(intermediateValue11, 1.0 - intermediateValue13, (exp2((intermediateValue14 - fragmentVectorConstants1.packedValues[37u].z) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625), 0.0).y < fragmentVectorConstants1.packedValues[37u].w)
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
        intermediateValue65 = floatBitsToUint(intermediateValue63);
        sampledTextureValue5 = false;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue16 = true;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint comparisonValue29 = sampledTextureValue5 ? intermediateValue65 : 4294967295u;
    fragmentColor0.w = uintBitsToFloat(comparisonValue29 & floatBitsToUint(varyingColor0.w)) * ((spvNMin(spvNMax((multiplyAddValue27 + 1.0) * 0.5, fragmentScalarConstants1.packedValues[149u]), fragmentScalarConstants1.packedValues[148u]) - fragmentScalarConstants1.packedValues[149u]) / ((fragmentScalarConstants1.packedValues[148u] - fragmentScalarConstants1.packedValues[149u]) + 9.9999997473787516355514526367188e-06));
    bool conditionValue20 = fragmentScalarConstants1.packedValues[112u] > 0.0;
    float reinterpretedBits = uintBitsToFloat(multiplyAddValue50 & comparisonValue29);
    float reinterpretedBits1 = uintBitsToFloat(multiplyAddValue51 & comparisonValue29);
    float reinterpretedBits2 = uintBitsToFloat(multiplyAddValue52 & comparisonValue29);
    fragmentColor0.x = conditionValue20 ? (reinterpretedBits * 0.0033142860047519207000732421875) : reinterpretedBits;
    fragmentColor0.y = conditionValue20 ? (reinterpretedBits1 * 0.0033142860047519207000732421875) : reinterpretedBits1;
    fragmentColor0.z = conditionValue20 ? (reinterpretedBits2 * 0.0033142860047519207000732421875) : reinterpretedBits2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float comparisonValue3 = intermediateValue16 ? productValue26 : 0.0;
    float comparisonValue4 = intermediateValue16 ? productValue27 : 0.0;
    float comparisonValue5 = intermediateValue16 ? productValue28 : 0.0;
    bool conditionValue5 = fragmentVectorConstants1.packedValues[27u].x > 0.0;
    fragmentColor0.x = conditionValue5 ? (comparisonValue3 * 0.0033142860047519207000732421875) : comparisonValue3;
    fragmentColor0.y = conditionValue5 ? (comparisonValue4 * 0.0033142860047519207000732421875) : comparisonValue4;
    fragmentColor0.z = conditionValue5 ? (comparisonValue5 * 0.0033142860047519207000732421875) : comparisonValue5;
    fragmentColor0.w = ((spvNMin(spvNMax((multiplyAddValue6 + 1.0) * 0.5, fragmentVectorConstants1.packedValues[36u].y), fragmentVectorConstants1.packedValues[36u].x) - fragmentVectorConstants1.packedValues[36u].y) / ((fragmentVectorConstants1.packedValues[36u].x + 9.9999997473787516355514526367188e-06) - fragmentVectorConstants1.packedValues[36u].y)) * (intermediateValue16 ? varyingColor0.w : 0.0);
#endif
}
