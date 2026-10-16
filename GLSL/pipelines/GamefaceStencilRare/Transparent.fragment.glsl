#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceStencilRare / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE2_FLOAT_8 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE2_FLOAT_2 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT2_FLOAT_9 1
#endif

#include "../../include/materials/GamefaceStencilRare/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
    uint scalarValue = uint(varyingTexCoord3.w);
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint bitwiseValue19 = (uint(varyingTexCoord3.z) << 4u) + ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    float intermediateValue17;
    float bitwiseValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue32 = bitfieldInsert(bitfieldExtract(uint(varyingTexCoord3.y), int(4u), int(4u)), uint(varyingTexCoord3.z), int(4u), int(28u));
    float nonlinearValue;
    float bitwiseValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint bitwiseValue7 = (uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue = bitwiseValue7 + 1u;
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[bitwiseValue7].x));
    uint sumValue1 = uint(int(fragmentVectorConstants1.packedValues[uint(max(int(0u), int(scalarValue1 + 4294967295u)))].y));
    float nonlinearValue;
    float intermediateValue3;
#endif
    if (scalarValue == 1u)
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float scalarValue80 = varyingTexCoord2.x - varyingTexCoord1.x;
        precise float sumValue66 = varyingTexCoord2.y - varyingTexCoord1.y;
        vec2 vectorValue15 = vec2(scalarValue80, sumValue66);
        float scalarValue81 = rdDot2Precise2(vectorValue15, vectorValue15);
        precise float nonlinearValue5 = sqrt(scalarValue81) - varyingTexCoord1.z;
        precise float sumValue67 = 0.5 - nonlinearValue5;
        intermediateValue17 = spvNClamp(sumValue67, 0.0, 1.0);
        bitwiseValue1 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM50
        vec2 vectorValue4 = vec2(varyingTexCoord2.x - varyingTexCoord1.x, varyingTexCoord2.y - varyingTexCoord1.y);
        float scalarValue33 = rdDot2Precise2(vectorValue4, vectorValue4);
        nonlinearValue = spvNClamp((varyingTexCoord1.z - sqrt(scalarValue33)) + 0.5, 0.0, 1.0);
        bitwiseValue = fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float scalarValue2 = varyingTexCoord2.x - varyingTexCoord1.x;
        float sumValue2 = varyingTexCoord2.y - varyingTexCoord1.y;
        nonlinearValue = spvNMin(spvNMax((varyingTexCoord1.z + 0.5) - sqrt((sumValue2 * sumValue2) + (scalarValue2 * scalarValue2)), 0.0), 1.0);
        intermediateValue3 = fragmentVectorConstants1.packedValues[sumValue].w;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        float intermediateValue18;
        float bitwiseValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float productValue3;
        float bitwiseValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue4;
        float branchMergedValue7;
#endif
        if (scalarValue == 2u)
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float scalarValue82 = varyingTexCoord2.x - varyingTexCoord1.x;
            precise float sumValue68 = varyingTexCoord2.y - varyingTexCoord1.y;
            vec2 vectorValue16 = vec2(scalarValue82, sumValue68);
            float scalarValue83 = rdDot2Precise2(vectorValue16, vectorValue16);
            float nonlinearValue6 = sqrt(scalarValue83);
            precise float sumValue69 = nonlinearValue6 - varyingTexCoord1.z;
            precise float sumValue70 = varyingTexCoord1.z - varyingTexCoord1.w;
            precise float sumValue71 = nonlinearValue6 - sumValue70;
            precise float sumValue72 = 0.5 - sumValue69;
            precise float sumValue73 = 0.5 - sumValue71;
            precise float sumValue74 = 1.0 - spvNClamp(sumValue73, 0.0, 1.0);
            precise float productValue41 = sumValue74 * spvNClamp(sumValue72, 0.0, 1.0);
            bitwiseValue2 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
            intermediateValue18 = productValue41;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            vec2 vectorValue5 = vec2(varyingTexCoord2.x - varyingTexCoord1.x, varyingTexCoord2.y - varyingTexCoord1.y);
            float scalarValue34 = rdDot2Precise2(vectorValue5, vectorValue5);
            float nonlinearValue3 = sqrt(scalarValue34);
            bitwiseValue1 = fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
            productValue3 = (1.0 - spvNClamp(0.5 - (nonlinearValue3 + (varyingTexCoord1.w - varyingTexCoord1.z)), 0.0, 1.0)) * spvNClamp((varyingTexCoord1.z - nonlinearValue3) + 0.5, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float scalarValue3 = varyingTexCoord2.x - varyingTexCoord1.x;
            float sumValue3 = varyingTexCoord2.y - varyingTexCoord1.y;
            float nonlinearValue1 = sqrt((sumValue3 * sumValue3) + (scalarValue3 * scalarValue3));
            float sumValue4 = varyingTexCoord1.z + 0.5;
            branchMergedValue4 = (1.0 - spvNMin(spvNMax((sumValue4 - varyingTexCoord1.w) - nonlinearValue1, 0.0), 1.0)) * spvNMin(spvNMax(sumValue4 - nonlinearValue1, 0.0), 1.0);
            branchMergedValue7 = fragmentVectorConstants1.packedValues[sumValue].w;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float bitwiseValue3;
            float multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float bitwiseValue2;
            float multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue30;
            float branchMergedValue31;
#endif
            if (scalarValue == 4u)
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                precise float scalarValue84 = varyingTexCoord2.x - varyingTexCoord1.x;
                precise float sumValue75 = varyingTexCoord2.y - varyingTexCoord1.y;
                precise float quotientValue34 = scalarValue84 / varyingTexCoord1.z;
                precise float quotientValue35 = sumValue75 / varyingTexCoord1.w;
                vec2 vectorValue17 = vec2(quotientValue34, quotientValue35);
                float scalarValue85 = rdDot2Precise2(vectorValue17, vectorValue17);
                precise float sumValue76 = scalarValue85 - 1.0;
                precise float sumValue77 = quotientValue34 + quotientValue34;
                precise float sumValue78 = quotientValue35 + quotientValue35;
                precise float productValue42 = dFdx(quotientValue34) * sumValue77;
                precise float productValue43 = dFdx(quotientValue35) * sumValue78;
                precise float sumValue79 = productValue43 + productValue42;
                precise float productValue44 = dFdy(-quotientValue34) * sumValue77;
                precise float productValue45 = dFdy(-quotientValue35) * sumValue78;
                precise float sumValue80 = productValue45 + productValue44;
                vec2 vectorValue18 = vec2(sumValue79, sumValue80);
                float scalarValue86 = rdDot2Precise2(vectorValue18, vectorValue18);
                bitwiseValue3 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                multiplyAddValue = spvNClamp(fma(-sumValue76, inversesqrt(spvNMax(scalarValue86, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue4 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord1.z;
                float quotientValue = (varyingTexCoord2.y - varyingTexCoord1.y) / varyingTexCoord1.w;
                vec2 vectorValue6 = vec2(scalarValue4, quotientValue);
                float scalarValue35 = rdDot2Precise2(vectorValue6, vectorValue6);
                float sumValue32 = scalarValue4 + scalarValue4;
                float sumValue33 = quotientValue + quotientValue;
                vec2 multiplyAddValue1 = vec2(fma(dFdxCoarse(quotientValue), sumValue33, dFdxCoarse(scalarValue4) * sumValue32), fma(dFdyCoarse(-quotientValue), sumValue33, dFdyCoarse(-scalarValue4) * sumValue32));
                float scalarValue36 = rdDot2Precise2(multiplyAddValue1, multiplyAddValue1);
                bitwiseValue2 = fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
                multiplyAddValue = spvNClamp(fma(1.0 - scalarValue35, inversesqrt(spvNMax(scalarValue36, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float scalarValue4 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord1.z;
                float quotientValue = (varyingTexCoord2.y - varyingTexCoord1.y) / varyingTexCoord1.w;
                float productValue = ((dFdxCoarse(quotientValue) * quotientValue) + (dFdxCoarse(scalarValue4) * scalarValue4)) * 2.0;
                float productValue1 = ((dFdyCoarse((-0.0) - quotientValue) * quotientValue) + (dFdyCoarse((-0.0) - scalarValue4) * scalarValue4)) * 2.0;
                branchMergedValue30 = spvNClamp(0.5 - (inversesqrt(spvNMax(dot(vec2(productValue, productValue1), vec2(productValue, productValue1)), 9.9999997473787516355514526367188e-05)) * (dot(vec2(scalarValue4, quotientValue), vec2(scalarValue4, quotientValue)) + (-1.0))), 0.0, 1.0);
                branchMergedValue31 = fragmentVectorConstants1.packedValues[sumValue].w;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float bitwiseValue4;
                float intermediateValue27;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float bitwiseValue3;
                float multiplyAddValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float branchMergedValue44;
                float branchMergedValue45;
#endif
                if (scalarValue == 5u)
                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                    precise float scalarValue87 = varyingTexCoord2.x - varyingTexCoord1.x;
                    precise float sumValue81 = varyingTexCoord2.y - varyingTexCoord1.y;
                    uint productValue46 = (bitwiseValue19 * 4u) + 1u;
                    precise float multiplyAddValue54 = scalarValue87 / fma(fragmentScalarConstants1.packedValues[productValue46], 0.5, varyingTexCoord1.z);
                    precise float multiplyAddValue55 = sumValue81 / fma(fragmentScalarConstants1.packedValues[productValue46], 0.5, varyingTexCoord1.w);
                    vec2 vectorValue19 = vec2(multiplyAddValue54, multiplyAddValue55);
                    float scalarValue88 = rdDot2Precise2(vectorValue19, vectorValue19);
                    precise float sumValue82 = scalarValue88 - 1.0;
                    precise float sumValue83 = multiplyAddValue54 + multiplyAddValue54;
                    precise float sumValue84 = multiplyAddValue55 + multiplyAddValue55;
                    precise float productValue47 = dFdx(multiplyAddValue54) * sumValue83;
                    precise float productValue48 = dFdx(multiplyAddValue55) * sumValue84;
                    precise float productValue49 = dFdy(-multiplyAddValue54) * sumValue83;
                    precise float productValue50 = dFdy(-multiplyAddValue55) * sumValue84;
                    precise float sumValue85 = productValue48 + productValue47;
                    precise float sumValue86 = productValue50 + productValue49;
                    vec2 vectorValue20 = vec2(sumValue85, sumValue86);
                    float scalarValue89 = rdDot2Precise2(vectorValue20, vectorValue20);
                    float scalarValue90 = -fragmentScalarConstants1.packedValues[productValue46];
                    precise float multiplyAddValue56 = scalarValue87 / fma(scalarValue90, 0.5, varyingTexCoord1.z);
                    precise float multiplyAddValue57 = sumValue81 / fma(scalarValue90, 0.5, varyingTexCoord1.w);
                    vec2 vectorValue21 = vec2(multiplyAddValue56, multiplyAddValue57);
                    float scalarValue91 = rdDot2Precise2(vectorValue21, vectorValue21);
                    precise float sumValue87 = scalarValue91 - 1.0;
                    precise float sumValue88 = multiplyAddValue56 + multiplyAddValue56;
                    precise float sumValue89 = multiplyAddValue57 + multiplyAddValue57;
                    precise float productValue51 = dFdx(multiplyAddValue56) * sumValue88;
                    precise float productValue52 = dFdx(multiplyAddValue57) * sumValue89;
                    precise float sumValue90 = productValue52 + productValue51;
                    precise float productValue53 = dFdy(-multiplyAddValue56) * sumValue88;
                    precise float productValue54 = dFdy(-multiplyAddValue57) * sumValue89;
                    precise float sumValue91 = productValue54 + productValue53;
                    vec2 vectorValue22 = vec2(sumValue90, sumValue91);
                    float scalarValue92 = rdDot2Precise2(vectorValue22, vectorValue22);
                    precise float multiplyAddValue58 = spvNClamp(fma(-sumValue82, inversesqrt(spvNMax(scalarValue89, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0) * spvNClamp(fma(sumValue87, inversesqrt(spvNMax(scalarValue92, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0);
                    bitwiseValue4 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                    intermediateValue27 = multiplyAddValue58;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    float scalarValue2 = varyingTexCoord2.x - varyingTexCoord1.x;
                    float sumValue2 = varyingTexCoord2.y - varyingTexCoord1.y;
                    uint productValue31 = (scalarValue32 * 4u) + 1u;
                    float multiplyAddValue3 = scalarValue2 / fma(fragmentScalarConstants1.packedValues[productValue31], 0.5, varyingTexCoord1.z);
                    float multiplyAddValue4 = sumValue2 / fma(fragmentScalarConstants1.packedValues[productValue31], 0.5, varyingTexCoord1.w);
                    vec2 vectorValue7 = vec2(multiplyAddValue3, multiplyAddValue4);
                    float scalarValue37 = rdDot2Precise2(vectorValue7, vectorValue7);
                    float sumValue34 = multiplyAddValue3 + multiplyAddValue3;
                    float sumValue35 = multiplyAddValue4 + multiplyAddValue4;
                    vec2 multiplyAddValue5 = vec2(fma(dFdxCoarse(multiplyAddValue4), sumValue35, dFdxCoarse(multiplyAddValue3) * sumValue34), fma(dFdyCoarse(-multiplyAddValue4), sumValue35, dFdyCoarse(-multiplyAddValue3) * sumValue34));
                    float scalarValue38 = rdDot2Precise2(multiplyAddValue5, multiplyAddValue5);
                    float scalarValue39 = -fragmentScalarConstants1.packedValues[productValue31];
                    float multiplyAddValue6 = scalarValue2 / fma(scalarValue39, 0.5, varyingTexCoord1.z);
                    float multiplyAddValue13 = sumValue2 / fma(scalarValue39, 0.5, varyingTexCoord1.w);
                    vec2 vectorValue8 = vec2(multiplyAddValue6, multiplyAddValue13);
                    float scalarValue40 = rdDot2Precise2(vectorValue8, vectorValue8);
                    float sumValue36 = multiplyAddValue6 + multiplyAddValue6;
                    float sumValue37 = multiplyAddValue13 + multiplyAddValue13;
                    vec2 multiplyAddValue14 = vec2(fma(dFdxCoarse(multiplyAddValue13), sumValue37, dFdxCoarse(multiplyAddValue6) * sumValue36), fma(dFdyCoarse(-multiplyAddValue13), sumValue37, dFdyCoarse(-multiplyAddValue6) * sumValue36));
                    float scalarValue41 = rdDot2Precise2(multiplyAddValue14, multiplyAddValue14);
                    bitwiseValue3 = fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
                    multiplyAddValue2 = spvNClamp(fma(1.0 - scalarValue37, inversesqrt(spvNMax(scalarValue38, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0) * spvNClamp(fma(scalarValue40 - 1.0, inversesqrt(spvNMax(scalarValue41, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float scalarValue5 = varyingTexCoord2.x - varyingTexCoord1.x;
                    float sumValue5 = varyingTexCoord2.y - varyingTexCoord1.y;
                    float productValue2 = fragmentVectorConstants1.packedValues[bitwiseValue7].y * 0.5;
                    float quotientValue1 = scalarValue5 / (productValue2 + varyingTexCoord1.z);
                    float quotientValue2 = sumValue5 / (productValue2 + varyingTexCoord1.w);
                    float productValue4 = ((dFdxCoarse(quotientValue2) * quotientValue2) + (dFdxCoarse(quotientValue1) * quotientValue1)) * 2.0;
                    float productValue5 = ((dFdyCoarse((-0.0) - quotientValue2) * quotientValue2) + (dFdyCoarse((-0.0) - quotientValue1) * quotientValue1)) * 2.0;
                    float quotientValue3 = scalarValue5 / (varyingTexCoord1.z - productValue2);
                    float quotientValue4 = sumValue5 / (varyingTexCoord1.w - productValue2);
                    float productValue6 = ((dFdxCoarse(quotientValue4) * quotientValue4) + (dFdxCoarse(quotientValue3) * quotientValue3)) * 2.0;
                    float productValue7 = ((dFdyCoarse((-0.0) - quotientValue4) * quotientValue4) + (dFdyCoarse((-0.0) - quotientValue3) * quotientValue3)) * 2.0;
                    branchMergedValue44 = spvNClamp((inversesqrt(spvNMax(dot(vec2(productValue6, productValue7), vec2(productValue6, productValue7)), 9.9999997473787516355514526367188e-05)) * (dot(vec2(quotientValue3, quotientValue4), vec2(quotientValue3, quotientValue4)) + (-1.0))) + 0.5, 0.0, 1.0) * spvNClamp(0.5 - (inversesqrt(spvNMax(dot(vec2(productValue4, productValue5), vec2(productValue4, productValue5)), 9.9999997473787516355514526367188e-05)) * (dot(vec2(quotientValue1, quotientValue2), vec2(quotientValue1, quotientValue2)) + (-1.0))), 0.0, 1.0);
                    branchMergedValue45 = fragmentVectorConstants1.packedValues[sumValue].w;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                    uint productValue55 = uint(int(fragmentScalarConstants1.packedValues[bitwiseValue19 * 4u]));
                    float intermediateValue38;
                    float bitwiseValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    uint productValue32 = uint(int(fragmentScalarConstants1.packedValues[scalarValue32 * 4u]));
                    float intermediateValue31;
                    float bitwiseValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float branchMergedValue46;
                    float branchMergedValue47;
#endif
                    if (scalarValue == 6u)
                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                        uint scalarValue93 = productValue55 + 1u;
                        uint productValue56 = productValue55 * 4u;
                        precise float productValue57 = fragmentScalarConstants1.packedValues[productValue56] * 0.307196319103240966796875;
                        float multiplyAddValue59 = (fragmentScalarConstants1.packedValues[productValue56] > 3.0) ? productValue57 : fma(fragmentScalarConstants1.packedValues[productValue56], 0.100000001490116119384765625, 0.60000002384185791015625);
                        uint bitwiseValue20 = (uint(int(fragmentScalarConstants1.packedValues[productValue56])) << 1u) + 1u;
                        uint bitwiseValue21 = uint(abs(int(bitwiseValue20))) >> 1u;
                        uint comparisonValue10 = (((bitwiseValue20 ^ 2u) & 2147483648u) != 0u) ? (-bitwiseValue21) : bitwiseValue21;
                        precise float productValue58 = multiplyAddValue59 * 2.5066282749176025390625;
                        float intermediateValue40;
                        intermediateValue40 = 0.0;
                        precise float sumValue27;
                        uint sumValue28;
                        uint scalarValue10 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                        uint scalarValue42 = productValue32 + 1u;
                        uint productValue33 = productValue32 * 4u;
                        float multiplyAddValue17 = (fragmentScalarConstants1.packedValues[productValue33] > 3.0) ? (fragmentScalarConstants1.packedValues[productValue33] * 0.307196319103240966796875) : fma(fragmentScalarConstants1.packedValues[productValue33], 0.100000001490116119384765625, 0.60000002384185791015625);
                        uint scalarValue43 = bitfieldInsert(1u, uint(int(fragmentScalarConstants1.packedValues[productValue33])), int(1u), int(31u));
                        uint bitwiseValue14 = uint(abs(int(scalarValue43))) >> 1u;
                        uint comparisonValue6 = (((scalarValue43 ^ 2u) & 2147483648u) != 0u) ? (-bitwiseValue14) : bitwiseValue14;
                        float productValue34 = multiplyAddValue17 * 2.5066282749176025390625;
                        float intermediateValue34;
                        intermediateValue34 = 0.0;
                        float exponentialValue;
                        uint sumValue8;
                        uint scalarValue10 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        uint scalarValue6 = scalarValue1 + 1u;
                        float comparisonValue = (fragmentVectorConstants1.packedValues[scalarValue1].x > 3.0) ? (fragmentVectorConstants1.packedValues[scalarValue1].x * 0.307196319103240966796875) : ((fragmentVectorConstants1.packedValues[scalarValue1].x * 0.100000001490116119384765625) + 0.60000002384185791015625);
                        uint bitwiseValue8 = uint(int(fragmentVectorConstants1.packedValues[scalarValue1].x)) << 1u;
                        uint bitwiseValue10 = bitwiseValue8 | 1u;
                        uint quotientValue5 = uint(int(bitwiseValue10) / int(2u));
                        float intermediateValue8;
                        if (int(bitwiseValue10) > int(0u))
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                            if (int(bitwiseValue20) <= int(scalarValue10))
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            if (int(scalarValue43) <= int(scalarValue10))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            uint bitwiseValue11 = bitwiseValue8 | 1u;
                            float intermediateValue9;
                            uint intermediateValue10;
                            intermediateValue9 = 0.0;
                            intermediateValue10 = 0u;
                            float exponentialValue;
                            for (;;)
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
                                break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float quotientValue6 = float(int(intermediateValue10 - quotientValue5)) / comparisonValue;
                                exponentialValue = (exp2((quotientValue6 * quotientValue6) * (-0.721347510814666748046875)) / (comparisonValue * 2.5066282749176025390625)) + intermediateValue9;
                                uint sumValue6 = intermediateValue10 + 1u;
                                if (sumValue6 == bitwiseValue11)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue9 = exponentialValue;
                                    intermediateValue10 = sumValue6;
                                }
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                            float sumValue92 = rdSignedBitsToFloat2(scalarValue10 - comparisonValue10);
                            precise float quotientValue36 = sumValue92 / multiplyAddValue59;
                            precise float productValue59 = quotientValue36 * quotientValue36;
                            precise float productValue60 = productValue59 * (-0.721347510814666748046875);
                            precise float exponentialValue23 = exp2(productValue60) / productValue58;
                            sumValue27 = exponentialValue23 + intermediateValue40;
                            sumValue28 = scalarValue10 + 1u;
                            intermediateValue40 = sumValue27;
                            scalarValue10 = sumValue28;
                            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            float sumValue38 = rdSignedBitsToFloat2(scalarValue10 - comparisonValue6);
                            float quotientValue21 = sumValue38 / multiplyAddValue17;
                            exponentialValue = (exp2((quotientValue21 * quotientValue21) * (-0.721347510814666748046875)) / productValue34) + intermediateValue34;
                            sumValue8 = scalarValue10 + 1u;
                            intermediateValue34 = exponentialValue;
                            scalarValue10 = sumValue8;
                            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            intermediateValue8 = exponentialValue;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM40
                        precise float sumValue93 = fragmentScalarConstants1.packedValues[productValue56] + 1.0;
                        precise float productValue61 = sumValue93 * 0.5;
                        precise float quotientValue37 = 1.0 / productValue58;
                        precise float quotientValue38 = quotientValue37 / intermediateValue40;
                        precise float productValue62 = quotientValue38 * 0.5;
                        uint multiplyAddValue60 = uint(int(fma(-floor(productValue61), 2.0, sumValue93)));
                        uint multiplyAddValue61 = uint(int(fma(fragmentScalarConstants1.packedValues[productValue56], 0.5, 1.0)));
                        bool comparisonValue11 = multiplyAddValue60 != 1u;
                        bool comparisonValue12 = (fragmentVectorConstants1.packedValues[scalarValue93].z != (-1.0)) || (fragmentVectorConstants1.packedValues[scalarValue93].w != (-1.0));
                        precise float sumValue94 = fragmentVectorConstants1.packedValues[scalarValue93].z + fragmentVectorConstants1.packedValues[scalarValue93].x;
                        precise float sumValue95 = fragmentVectorConstants1.packedValues[scalarValue93].w + fragmentVectorConstants1.packedValues[scalarValue93].y;
                        float intermediateValue65;
                        intermediateValue65 = 0.0;
                        float multiplyAddValue15;
                        uint sumValue49;
                        float intermediateValue62;
                        float intermediateValue64;
                        float intermediateValue67;
                        float scalarValue8 = 0.0;
                        float scalarValue9 = 0.0;
                        float scalarValue94 = productValue62;
                        uint scalarValue45 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                        float sumValue39 = fragmentScalarConstants1.packedValues[productValue33] + 1.0;
                        float quotientValue22 = ((1.0 / productValue34) / intermediateValue34) * 0.5;
                        uint multiplyAddValue19 = uint(int(fma(-floor(sumValue39 * 0.5), 2.0, sumValue39)));
                        uint multiplyAddValue25 = uint(int(fma(fragmentScalarConstants1.packedValues[productValue33], 0.5, 1.0)));
                        bool comparisonValue7 = multiplyAddValue19 != 1u;
                        bool comparisonValue8 = (fragmentVectorConstants1.packedValues[scalarValue42].z != (-1.0)) || (fragmentVectorConstants1.packedValues[scalarValue42].w != (-1.0));
                        float sumValue40 = fragmentVectorConstants1.packedValues[scalarValue42].z + fragmentVectorConstants1.packedValues[scalarValue42].x;
                        float sumValue41 = fragmentVectorConstants1.packedValues[scalarValue42].w + fragmentVectorConstants1.packedValues[scalarValue42].y;
                        float intermediateValue51;
                        intermediateValue51 = 0.0;
                        float sampledTextureValue2;
                        uint sumValue19;
                        float productValue11;
                        float productValue12;
                        float intermediateValue53;
                        float scalarValue8 = 0.0;
                        float scalarValue9 = 0.0;
                        float scalarValue44 = quotientValue22;
                        uint scalarValue45 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        else
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                            if (int(scalarValue45) >= int(multiplyAddValue61))
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            if (int(scalarValue45) >= int(multiplyAddValue25))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            intermediateValue8 = 0.0;
                        }
                        float sumValue7 = fragmentVectorConstants1.packedValues[scalarValue1].x + 1.0;
                        uint productValue8 = uint(int(sumValue7 - (floor(sumValue7 * 0.5) * 2.0)));
                        uint productValue13 = uint(int((fragmentVectorConstants1.packedValues[scalarValue1].x * 0.5) + 1.0));
                        float branchMergedValue49;
                        float branchMergedValue51;
                        if (int(productValue13) > int(0u))
                        {
                            float quotientValue7 = 0.1994711458683013916015625 / (intermediateValue8 * comparisonValue);
                            float sampledTextureValue;
                            float intermediateValue25;
                            float intermediateValue26;
                            float intermediateValue27;
                            float intermediateValue28;
                            float intermediateValue15;
                            float productValue9;
                            float productValue10;
                            float scalarValue7 = quotientValue7;
                            float scalarValue8 = 0.0;
                            float scalarValue9 = 0.0;
                            uint scalarValue10 = 0u;
                            float scalarValue11 = 0.0;
                            bool comparisonValue2;
                            for (;;)
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
                                break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                comparisonValue2 = (productValue8 != 1u) || (scalarValue10 != 0u);
                                if (comparisonValue2)
                                {
                                    uint bitwiseValue12 = scalarValue10 << 1u;
                                    float quotientValue8 = float(int(productValue8 - bitwiseValue12)) / comparisonValue;
                                    float productValue14 = (comparisonValue * 2.5066282749176025390625) * intermediateValue8;
                                    float bitwiseValue13 = float(int(productValue8 - (bitwiseValue12 | 1u))) / comparisonValue;
                                    float exponentialValue19 = exp2((bitwiseValue13 * bitwiseValue13) * (-0.721347510814666748046875)) / productValue14;
                                    float exponentialValue20 = exponentialValue19 + ((scalarValue10 == 0u) ? scalarValue7 : (exp2((quotientValue8 * quotientValue8) * (-0.721347510814666748046875)) / productValue14));
                                    float quotientValue9 = (exponentialValue19 / exponentialValue20) + float(int(bitwiseValue12 - productValue8));
                                    intermediateValue15 = exponentialValue20;
                                    productValue9 = quotientValue9 * fragmentVectorConstants1.packedValues[scalarValue1].y;
                                    productValue10 = quotientValue9 * fragmentVectorConstants1.packedValues[scalarValue1].z;
                                }
                                else
                                {
                                    intermediateValue15 = scalarValue7;
                                    productValue9 = scalarValue8;
                                    productValue10 = scalarValue9;
                                }
                                float sumValue10 = productValue9 + varyingTexCoord1.x;
                                float sumValue11 = productValue10 + varyingTexCoord1.y;
                                float sumValue12 = varyingTexCoord1.x - productValue9;
                                float sumValue13 = varyingTexCoord1.y - productValue10;
                                float branchMergedValue;
                                float branchMergedValue1;
                                float branchMergedValue2;
                                float branchMergedValue3;
                                if ((fragmentVectorConstants1.packedValues[scalarValue6].z != (-1.0)) || (fragmentVectorConstants1.packedValues[scalarValue6].w != (-1.0)))
                                {
                                    float sumValue14 = fragmentVectorConstants1.packedValues[scalarValue6].x + fragmentVectorConstants1.packedValues[scalarValue6].z;
                                    float sumValue15 = fragmentVectorConstants1.packedValues[scalarValue6].y + fragmentVectorConstants1.packedValues[scalarValue6].w;
                                    branchMergedValue = spvNMin(spvNMax(sumValue13, fragmentVectorConstants1.packedValues[scalarValue6].y), sumValue15);
                                    branchMergedValue1 = spvNMin(spvNMax(sumValue12, fragmentVectorConstants1.packedValues[scalarValue6].x), sumValue14);
                                    branchMergedValue2 = spvNMin(spvNMax(sumValue11, fragmentVectorConstants1.packedValues[scalarValue6].y), sumValue15);
                                    branchMergedValue3 = spvNMin(spvNMax(sumValue10, fragmentVectorConstants1.packedValues[scalarValue6].x), sumValue14);
                                }
                                else
                                {
                                    branchMergedValue = sumValue13;
                                    branchMergedValue1 = sumValue12;
                                    branchMergedValue2 = sumValue11;
                                    branchMergedValue3 = sumValue10;
                                }
                                intermediateValue28 = branchMergedValue;
                                intermediateValue27 = branchMergedValue1;
                                intermediateValue26 = branchMergedValue2;
                                intermediateValue25 = branchMergedValue3;
                                sampledTextureValue = ((texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * intermediateValue27) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * intermediateValue28) + fragmentVectorConstants1.packedValues[128u].y)).w + texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * intermediateValue25) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * intermediateValue26) + fragmentVectorConstants1.packedValues[128u].y)).w) * intermediateValue15) + scalarValue11;
                                uint sumValue16 = scalarValue10 + 1u;
                                if (sumValue16 == productValue13)
                                {
                                    break;
                                }
                                else
                                {
                                    scalarValue7 = intermediateValue15;
                                    scalarValue8 = productValue9;
                                    scalarValue9 = productValue10;
                                    scalarValue10 = sumValue16;
                                    scalarValue11 = sampledTextureValue;
                                    continue;
                                }
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                            bool comparisonValue9 = scalarValue45 != 0u;
                            if (comparisonValue11 || comparisonValue9)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            bool comparisonValue9 = scalarValue45 != 0u;
                            if (comparisonValue7 || comparisonValue9)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            branchMergedValue49 = fragmentVectorConstants1.packedValues[sumValue].w;
                            branchMergedValue51 = sampledTextureValue;
                        }
                        else
                        {
                            branchMergedValue49 = fragmentVectorConstants1.packedValues[sumValue].w;
                            branchMergedValue51 = 0.0;
                        }
                        branchMergedValue46 = branchMergedValue49;
                        branchMergedValue47 = branchMergedValue51;
                    }
                    else
                    {
                        float branchMergedValue48;
                        float branchMergedValue50;
                        if (scalarValue == 7u)
                        {
                            float sumValue8;
                            float sumValue9;
                            if ((fragmentVectorConstants1.packedValues[scalarValue1].z != (-1.0)) || (fragmentVectorConstants1.packedValues[scalarValue1].w != (-1.0)))
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                uint bitwiseValue15 = scalarValue45 << 1u;
                                uint sumValue96 = multiplyAddValue60 - bitwiseValue15;
                                float scalarValue95 = rdSignedBitsToFloat2(sumValue96);
                                precise float quotientValue39 = scalarValue95 / multiplyAddValue59;
                                precise float productValue63 = quotientValue39 * quotientValue39;
                                precise float productValue64 = productValue63 * (-0.721347510814666748046875);
                                precise float exponentialValue24 = exp2(productValue64) / productValue58;
                                precise float quotientValue40 = exponentialValue24 / intermediateValue40;
                                float sumValue97 = rdSignedBitsToFloat2(sumValue96 - 1u);
                                precise float quotientValue41 = sumValue97 / multiplyAddValue59;
                                precise float productValue65 = quotientValue41 * quotientValue41;
                                precise float productValue66 = productValue65 * (-0.721347510814666748046875);
                                precise float exponentialValue25 = exp2(productValue66) / productValue58;
                                precise float quotientValue42 = exponentialValue25 / intermediateValue40;
                                precise float comparisonValue13 = quotientValue42 + (comparisonValue9 ? quotientValue40 : scalarValue94);
                                float sumValue98 = rdSignedBitsToFloat2(bitwiseValue15 - multiplyAddValue60);
                                precise float quotientValue43 = quotientValue42 / comparisonValue13;
                                precise float sumValue99 = quotientValue43 + sumValue98;
                                precise float productValue67 = sumValue99 * fragmentVectorConstants1.packedValues[productValue55].y;
                                precise float productValue68 = sumValue99 * fragmentVectorConstants1.packedValues[productValue55].z;
                                intermediateValue67 = comparisonValue13;
                                intermediateValue64 = productValue68;
                                intermediateValue62 = productValue67;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                uint bitwiseValue15 = scalarValue45 << 1u;
                                uint sumValue42 = multiplyAddValue19 - bitwiseValue15;
                                float scalarValue46 = rdSignedBitsToFloat2(sumValue42);
                                float quotientValue23 = scalarValue46 / multiplyAddValue17;
                                float sumValue43 = rdSignedBitsToFloat2(sumValue42 - 1u);
                                float quotientValue24 = sumValue43 / multiplyAddValue17;
                                float exponentialValue21 = (exp2((quotientValue24 * quotientValue24) * (-0.721347510814666748046875)) / productValue34) / intermediateValue34;
                                float exponentialValue22 = exponentialValue21 + (comparisonValue9 ? ((exp2((quotientValue23 * quotientValue23) * (-0.721347510814666748046875)) / productValue34) / intermediateValue34) : scalarValue44);
                                float sumValue44 = rdSignedBitsToFloat2(bitwiseValue15 - multiplyAddValue19);
                                float quotientValue25 = (exponentialValue21 / exponentialValue22) + sumValue44;
                                intermediateValue53 = exponentialValue22;
                                productValue12 = quotientValue25 * fragmentVectorConstants1.packedValues[productValue32].z;
                                productValue11 = quotientValue25 * fragmentVectorConstants1.packedValues[productValue32].y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                sumValue8 = spvNMin(spvNMax(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[scalarValue1].x), fragmentVectorConstants1.packedValues[scalarValue1].x + fragmentVectorConstants1.packedValues[scalarValue1].z);
                                sumValue9 = spvNMin(spvNMax(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[scalarValue1].y), fragmentVectorConstants1.packedValues[scalarValue1].y + fragmentVectorConstants1.packedValues[scalarValue1].w);
#endif
                            }
                            else
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                intermediateValue67 = scalarValue94;
                                intermediateValue64 = scalarValue9;
                                intermediateValue62 = scalarValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                intermediateValue53 = scalarValue44;
                                productValue12 = scalarValue9;
                                productValue11 = scalarValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                sumValue8 = varyingTexCoord1.x;
                                sumValue9 = varyingTexCoord1.y;
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                            precise float sumValue100 = intermediateValue62 + varyingTexCoord1.x;
                            precise float sumValue101 = intermediateValue64 + varyingTexCoord1.y;
                            precise float sumValue102 = varyingTexCoord1.x - intermediateValue62;
                            precise float sumValue103 = varyingTexCoord1.y - intermediateValue64;
                            precise float sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(comparisonValue12 ? spvNMin(sumValue94, spvNMax(sumValue102, fragmentVectorConstants1.packedValues[scalarValue93].x)) : sumValue102, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(comparisonValue12 ? spvNMin(sumValue95, spvNMax(sumValue103, fragmentVectorConstants1.packedValues[scalarValue93].y)) : sumValue103, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).w + texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(comparisonValue12 ? spvNMin(sumValue94, spvNMax(sumValue100, fragmentVectorConstants1.packedValues[scalarValue93].x)) : sumValue100, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(comparisonValue12 ? spvNMin(sumValue95, spvNMax(sumValue101, fragmentVectorConstants1.packedValues[scalarValue93].y)) : sumValue101, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).w;
                            multiplyAddValue15 = fma(intermediateValue67, sampledTextureValue12, intermediateValue65);
                            sumValue49 = scalarValue45 + 1u;
                            scalarValue8 = intermediateValue62;
                            scalarValue9 = intermediateValue64;
                            intermediateValue65 = multiplyAddValue15;
                            scalarValue94 = intermediateValue67;
                            scalarValue45 = sumValue49;
                            continue;
                        }
                        intermediateValue38 = intermediateValue65;
                        bitwiseValue5 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                    }
                    else
                    {
                        uint sumValue104 = uint(max(int(productValue55 - 1u), int(0u)));
                        uint productValue69 = uint(int(fragmentScalarConstants1.packedValues[(sumValue104 * 4u) + 1u]));
                        float intermediateValue51;
                        float intermediateValue53;
                        if (scalarValue == 7u)
                        {
                            bool conditionValue1 = (fragmentVectorConstants1.packedValues[productValue55].z != (-1.0)) || (fragmentVectorConstants1.packedValues[productValue55].w != (-1.0));
                            precise float sumValue105 = fragmentVectorConstants1.packedValues[productValue55].z + fragmentVectorConstants1.packedValues[productValue55].x;
                            precise float sumValue106 = fragmentVectorConstants1.packedValues[productValue55].w + fragmentVectorConstants1.packedValues[productValue55].y;
                            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(conditionValue1 ? spvNMin(sumValue105, spvNMax(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[productValue55].x)) : varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(conditionValue1 ? spvNMin(sumValue106, spvNMax(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[productValue55].y)) : varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                            float scalarValue96 = sampledTextureValue13.x;
                            float scalarValue97 = sampledTextureValue13.y;
                            float scalarValue98 = sampledTextureValue13.z;
                            float exponentialValue1;
                            float exponentialValue2;
                            float exponentialValue3;
                            if ((productValue69 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            float sumValue45 = productValue11 + varyingTexCoord1.x;
                            float sumValue46 = productValue12 + varyingTexCoord1.y;
                            float sumValue47 = varyingTexCoord1.x - productValue11;
                            float sumValue48 = varyingTexCoord1.y - productValue12;
                            sampledTextureValue2 = fma(intermediateValue53, texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(comparisonValue8 ? spvNMin(sumValue40, spvNMax(sumValue47, fragmentVectorConstants1.packedValues[scalarValue42].x)) : sumValue47, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(comparisonValue8 ? spvNMin(sumValue41, spvNMax(sumValue48, fragmentVectorConstants1.packedValues[scalarValue42].y)) : sumValue48, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).w + texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(comparisonValue8 ? spvNMin(sumValue40, spvNMax(sumValue45, fragmentVectorConstants1.packedValues[scalarValue42].x)) : sumValue45, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(comparisonValue8 ? spvNMin(sumValue41, spvNMax(sumValue46, fragmentVectorConstants1.packedValues[scalarValue42].y)) : sumValue46, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y))).w, intermediateValue51);
                            sumValue19 = scalarValue45 + 1u;
                            scalarValue8 = productValue11;
                            scalarValue9 = productValue12;
                            intermediateValue51 = sampledTextureValue2;
                            scalarValue44 = intermediateValue53;
                            scalarValue45 = sumValue19;
                            continue;
                        }
                        intermediateValue31 = intermediateValue51;
                        bitwiseValue4 = fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
                    }
                    else
                    {
                        uint sumValue50 = uint(max(int(productValue32 - 1u), int(0u)));
                        uint productValue35 = uint(int(fragmentScalarConstants1.packedValues[(sumValue50 * 4u) + 1u]));
                        float intermediateValue43;
                        float multiplyAddValue15;
                        if (scalarValue == 7u)
                        {
                            bool conditionValue = (fragmentVectorConstants1.packedValues[productValue32].z != (-1.0)) || (fragmentVectorConstants1.packedValues[productValue32].w != (-1.0));
                            vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(conditionValue ? spvNMin(fragmentVectorConstants1.packedValues[productValue32].z + fragmentVectorConstants1.packedValues[productValue32].x, spvNMax(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[productValue32].x)) : varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(conditionValue ? spvNMin(fragmentVectorConstants1.packedValues[productValue32].w + fragmentVectorConstants1.packedValues[productValue32].y, spvNMax(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[productValue32].y)) : varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                            float scalarValue47 = sampledTextureValue8.x;
                            float scalarValue48 = sampledTextureValue8.y;
                            float scalarValue49 = sampledTextureValue8.z;
                            float exponentialValue1;
                            float exponentialValue2;
                            float exponentialValue3;
                            if ((productValue35 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            vec4 sampledTextureValue3 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * sumValue8) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * sumValue9) + fragmentVectorConstants1.packedValues[128u].y));
                            float scalarValue12 = sampledTextureValue3.x;
                            float scalarValue13 = sampledTextureValue3.y;
                            float scalarValue14 = sampledTextureValue3.z;
                            float intermediateValue20;
                            float intermediateValue21;
                            float intermediateValue22;
                            if ((sumValue1 & 2u) == 0u)
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                precise float productValue70 = scalarValue96 * 0.077399380505084991455078125;
                                precise float productValue71 = scalarValue97 * 0.077399380505084991455078125;
                                precise float productValue72 = scalarValue98 * 0.077399380505084991455078125;
                                precise float sumValue107 = scalarValue96 + 0.054999999701976776123046875;
                                precise float sumValue108 = scalarValue97 + 0.054999999701976776123046875;
                                precise float sumValue109 = scalarValue98 + 0.054999999701976776123046875;
                                precise float productValue73 = sumValue107 * 0.947867333889007568359375;
                                precise float productValue74 = sumValue108 * 0.947867333889007568359375;
                                precise float productValue75 = sumValue109 * 0.947867333889007568359375;
                                precise float nonlinearValue7 = log2(productValue73) * 2.400000095367431640625;
                                precise float nonlinearValue8 = log2(productValue74) * 2.400000095367431640625;
                                precise float nonlinearValue9 = log2(productValue75) * 2.400000095367431640625;
                                exponentialValue1 = (scalarValue98 > 0.040449999272823333740234375) ? exp2(nonlinearValue9) : productValue72;
                                exponentialValue2 = (scalarValue97 > 0.040449999272823333740234375) ? exp2(nonlinearValue8) : productValue71;
                                exponentialValue3 = (scalarValue96 > 0.040449999272823333740234375) ? exp2(nonlinearValue7) : productValue70;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                exponentialValue1 = (scalarValue49 > 0.040449999272823333740234375) ? exp2(log2((scalarValue49 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue49 * 0.077399380505084991455078125);
                                exponentialValue2 = (scalarValue48 > 0.040449999272823333740234375) ? exp2(log2((scalarValue48 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue48 * 0.077399380505084991455078125);
                                exponentialValue3 = (scalarValue47 > 0.040449999272823333740234375) ? exp2(log2((scalarValue47 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue47 * 0.077399380505084991455078125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float branchMergedValue5;
                                float branchMergedValue14;
                                float branchMergedValue15;
                                if ((sumValue1 & 16u) == 0u)
                                {
                                    branchMergedValue5 = scalarValue13;
                                    branchMergedValue14 = scalarValue14;
                                    branchMergedValue15 = scalarValue12;
                                }
                                else
                                {
                                    float exponentialValue4;
                                    if (!(scalarValue12 <= 0.003130800090730190277099609375))
                                    {
                                        exponentialValue4 = (exp2(log2(scalarValue12) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                    }
                                    else
                                    {
                                        exponentialValue4 = scalarValue12 * 12.9200000762939453125;
                                    }
                                    float exponentialValue6;
                                    if (!(scalarValue13 <= 0.003130800090730190277099609375))
                                    {
                                        exponentialValue6 = (exp2(log2(scalarValue13) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                    }
                                    else
                                    {
                                        exponentialValue6 = scalarValue13 * 12.9200000762939453125;
                                    }
                                    float branchMergedValue32;
                                    float branchMergedValue35;
                                    float branchMergedValue36;
                                    if (!(scalarValue14 <= 0.003130800090730190277099609375))
                                    {
                                        branchMergedValue32 = exponentialValue6;
                                        branchMergedValue35 = (exp2(log2(scalarValue14) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                        branchMergedValue36 = exponentialValue4;
                                    }
                                    else
                                    {
                                        branchMergedValue32 = exponentialValue6;
                                        branchMergedValue35 = scalarValue14 * 12.9200000762939453125;
                                        branchMergedValue36 = exponentialValue4;
                                    }
                                    branchMergedValue5 = branchMergedValue32;
                                    branchMergedValue14 = branchMergedValue35;
                                    branchMergedValue15 = branchMergedValue36;
                                }
                                intermediateValue20 = branchMergedValue15;
                                intermediateValue21 = branchMergedValue5;
                                intermediateValue22 = branchMergedValue14;
#endif
                            }
                            else
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                float multiplyAddValue7;
                                float multiplyAddValue8;
                                float multiplyAddValue9;
                                if ((productValue69 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                float multiplyAddValue10;
                                float multiplyAddValue11;
                                float multiplyAddValue12;
                                if ((productValue35 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float exponentialValue3;
                                if (!(scalarValue12 <= 0.040449999272823333740234375))
#endif
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    precise float productValue76 = scalarValue96 * 12.9200000762939453125;
                                    precise float productValue77 = scalarValue97 * 12.9200000762939453125;
                                    precise float productValue78 = scalarValue98 * 12.9200000762939453125;
                                    precise float nonlinearValue10 = log2(scalarValue96) * 0.4166666567325592041015625;
                                    precise float nonlinearValue11 = log2(scalarValue97) * 0.4166666567325592041015625;
                                    precise float nonlinearValue12 = log2(scalarValue98) * 0.4166666567325592041015625;
                                    multiplyAddValue9 = (scalarValue96 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue10), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue76;
                                    multiplyAddValue8 = (scalarValue97 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue11), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue77;
                                    multiplyAddValue7 = (scalarValue98 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue12), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue78;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    multiplyAddValue12 = (scalarValue47 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue47) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue47 * 12.9200000762939453125);
                                    multiplyAddValue11 = (scalarValue48 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue48) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue48 * 12.9200000762939453125);
                                    multiplyAddValue10 = (scalarValue49 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue49) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue49 * 12.9200000762939453125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    exponentialValue3 = exp2(log2((scalarValue12 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
                                }
                                else
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    multiplyAddValue9 = scalarValue96;
                                    multiplyAddValue8 = scalarValue97;
                                    multiplyAddValue7 = scalarValue98;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    multiplyAddValue12 = scalarValue47;
                                    multiplyAddValue11 = scalarValue48;
                                    multiplyAddValue10 = scalarValue49;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    exponentialValue3 = scalarValue12 * 0.077399380505084991455078125;
#endif
                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                exponentialValue1 = multiplyAddValue7;
                                exponentialValue2 = multiplyAddValue8;
                                exponentialValue3 = multiplyAddValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                exponentialValue1 = multiplyAddValue10;
                                exponentialValue2 = multiplyAddValue11;
                                exponentialValue3 = multiplyAddValue12;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float exponentialValue5;
                                if (!(scalarValue13 <= 0.040449999272823333740234375))
                                {
                                    exponentialValue5 = exp2(log2((scalarValue13 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                }
                                else
                                {
                                    exponentialValue5 = scalarValue13 * 0.077399380505084991455078125;
                                }
                                float branchMergedValue6;
                                float branchMergedValue16;
                                float branchMergedValue17;
                                if (!(scalarValue14 <= 0.040449999272823333740234375))
                                {
                                    branchMergedValue6 = exponentialValue5;
                                    branchMergedValue16 = exp2(log2((scalarValue14 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                    branchMergedValue17 = exponentialValue3;
                                }
                                else
                                {
                                    branchMergedValue6 = exponentialValue5;
                                    branchMergedValue16 = scalarValue14 * 0.077399380505084991455078125;
                                    branchMergedValue17 = exponentialValue3;
                                }
                                intermediateValue20 = branchMergedValue17;
                                intermediateValue21 = branchMergedValue6;
                                intermediateValue22 = branchMergedValue16;
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                            float scalarValue99 = spvNMax(sampledTextureValue13.w, 9.9999997473787516355514526367188e-06);
                            precise float quotientValue44 = exponentialValue3 / scalarValue99;
                            precise float quotientValue45 = exponentialValue2 / scalarValue99;
                            precise float quotientValue46 = exponentialValue1 / scalarValue99;
                            uint sumValue110 = productValue55 + 5u;
                            vec4 vectorValue23 = vec4(quotientValue44, quotientValue45, quotientValue46, scalarValue99);
                            float sumValue111 = rdDot4Precise2(vectorValue23, fragmentVectorConstants1.packedValues[productValue55 + 1u]);
                            float sumValue112 = rdDot4Precise2(vectorValue23, fragmentVectorConstants1.packedValues[productValue55 + 2u]);
                            float sumValue113 = rdDot4Precise2(vectorValue23, fragmentVectorConstants1.packedValues[productValue55 + 3u]);
                            float sumValue114 = rdDot4Precise2(vectorValue23, fragmentVectorConstants1.packedValues[productValue55 + 4u]);
                            precise float sumValue115 = sumValue111 + fragmentVectorConstants1.packedValues[sumValue110].x;
                            precise float sumValue116 = sumValue112 + fragmentVectorConstants1.packedValues[sumValue110].y;
                            precise float sumValue117 = sumValue113 + fragmentVectorConstants1.packedValues[sumValue110].z;
                            precise float sumValue118 = sumValue114 + fragmentVectorConstants1.packedValues[sumValue110].w;
                            float scalarValue100 = rdDot3Precise(vec3(sumValue115, sumValue116, sumValue117), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                            float scalarValue101 = spvNClamp(scalarValue100, 0.0, 1.0);
                            precise float sumValue119 = sumValue118 - scalarValue101;
                            precise float multiplyAddValue62 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 8u) >> 2u], sumValue119, scalarValue101) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                            precise float productValue79 = multiplyAddValue62 * spvNClamp(varyingTexCoord1.z, 0.0, 1.0);
                            intermediateValue51 = 1.0;
                            intermediateValue53 = productValue79;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            float scalarValue50 = spvNMax(sampledTextureValue8.w, 9.9999997473787516355514526367188e-06);
                            uint sumValue51 = productValue32 + 5u;
                            vec4 quotientValue26 = vec4(exponentialValue3 / scalarValue50, exponentialValue2 / scalarValue50, exponentialValue1 / scalarValue50, scalarValue50);
                            float sumValue52 = rdDot4Precise2(quotientValue26, fragmentVectorConstants1.packedValues[productValue32 + 1u]);
                            float sumValue53 = rdDot4Precise2(quotientValue26, fragmentVectorConstants1.packedValues[productValue32 + 2u]);
                            float sumValue54 = rdDot4Precise2(quotientValue26, fragmentVectorConstants1.packedValues[productValue32 + 3u]);
                            float sumValue55 = rdDot4Precise2(quotientValue26, fragmentVectorConstants1.packedValues[productValue32 + 4u]);
                            float sumValue56 = rdDot3Precise(vec3(sumValue52 + fragmentVectorConstants1.packedValues[sumValue51].x, sumValue53 + fragmentVectorConstants1.packedValues[sumValue51].y, sumValue54 + fragmentVectorConstants1.packedValues[sumValue51].z), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                            float scalarValue51 = spvNClamp(sumValue56, 0.0, 1.0);
                            intermediateValue43 = 1.0;
                            multiplyAddValue15 = (fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 8u) >> 2u], (sumValue55 + fragmentVectorConstants1.packedValues[sumValue51].w) - scalarValue51, scalarValue51) * fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u]) * spvNClamp(varyingTexCoord1.z, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            float scalarValue15 = spvNMax(sampledTextureValue3.w, 9.9999997473787516355514526367188e-06);
                            float quotientValue10 = intermediateValue20 / scalarValue15;
                            float quotientValue11 = intermediateValue21 / scalarValue15;
                            float quotientValue12 = intermediateValue22 / scalarValue15;
                            uint sumValue17 = scalarValue1 + 5u;
                            float dotProductValue = spvNClamp((((dot(vec4(quotientValue10, quotientValue11, quotientValue12, scalarValue15), vec4(fragmentVectorConstants1.packedValues[scalarValue1 + 2u])) + fragmentVectorConstants1.packedValues[sumValue17].y) * 0.715200006961822509765625) + ((dot(vec4(quotientValue10, quotientValue11, quotientValue12, scalarValue15), vec4(fragmentVectorConstants1.packedValues[scalarValue1 + 1u])) + fragmentVectorConstants1.packedValues[sumValue17].x) * 0.2125999927520751953125)) + ((dot(vec4(quotientValue10, quotientValue11, quotientValue12, scalarValue15), vec4(fragmentVectorConstants1.packedValues[scalarValue1 + 3u])) + fragmentVectorConstants1.packedValues[sumValue17].z) * 0.072200000286102294921875), 0.0, 1.0);
                            branchMergedValue48 = (spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentVectorConstants1.packedValues[sumValue].w) * ((((dot(vec4(quotientValue10, quotientValue11, quotientValue12, scalarValue15), vec4(fragmentVectorConstants1.packedValues[scalarValue1 + 4u])) + fragmentVectorConstants1.packedValues[sumValue17].w) - dotProductValue) * fragmentVectorConstants1.packedValues[sumValue].z) + dotProductValue);
                            branchMergedValue50 = 1.0;
#endif
                        }
                        else
                        {
                            bool comparisonValue1 = scalarValue == 12u;
#if RD_PLATFORM == RD_PLATFORM_SM40
                            float intermediateValue52;
                            float intermediateValue54;
                            if (comparisonValue1 || (scalarValue == 9u))
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            float intermediateValue44;
                            float intermediateValue45;
                            if (comparisonValue1 || (scalarValue == 9u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            float branchMergedValue52;
                            float branchMergedValue53;
                            if ((scalarValue == 9u) || comparisonValue1)
#endif
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                float intermediateValue55;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                float sampledTextureValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float branchMergedValue54;
                                float branchMergedValue56;
#endif
                                if (comparisonValue1)
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    precise float bitwiseValue22 = spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                                    precise float sampledTextureValue14 = bitwiseValue22 * texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[131u].z, fragmentVectorConstants1.packedValues[131u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[131u].w, fragmentVectorConstants1.packedValues[131u].y))).x;
                                    intermediateValue55 = sampledTextureValue14;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    sampledTextureValue1 = (spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u]) * texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[131u].z, fragmentVectorConstants1.packedValues[131u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[131u].w, fragmentVectorConstants1.packedValues[131u].y))).x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    branchMergedValue54 = (spvNClamp(varyingTexCoord1.z, 0.0, 1.0) * fragmentVectorConstants1.packedValues[sumValue].w) * texture(sampler2D(txBuffer3Texture, txBuffer3Sampler), vec2((fragmentVectorConstants1.packedValues[131u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[131u].x, (fragmentVectorConstants1.packedValues[131u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[131u].y)).x;
                                    branchMergedValue56 = 1.0;
#endif
                                }
                                else
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    intermediateValue55 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    sampledTextureValue1 = fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    branchMergedValue54 = fragmentVectorConstants1.packedValues[sumValue].w;
                                    branchMergedValue56 = 1.0;
#endif
                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                intermediateValue52 = 1.0;
                                intermediateValue54 = intermediateValue55;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                intermediateValue44 = 1.0;
                                intermediateValue45 = sampledTextureValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                branchMergedValue52 = branchMergedValue54;
                                branchMergedValue53 = branchMergedValue56;
#endif
                            }
                            else
                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                float bitwiseValue9;
                                float intermediateValue57;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                float bitwiseValue6;
                                float productValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float branchMergedValue55;
                                float branchMergedValue57;
#endif
                                if (scalarValue == 11u)
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    float scalarValue52 = rdDot3Precise(vec3(varyingTexCoord1.x, varyingTexCoord1.y, varyingTexCoord1.z), vec3(varyingTexCoord2.x, varyingTexCoord2.y, 1.0));
                                    precise float sumValue120 = 1.0 - spvNMin(abs(scalarValue52), 1.0);
                                    precise float productValue80 = sumValue120 * varyingTexCoord1.w;
                                    bitwiseValue9 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                                    intermediateValue57 = spvNClamp(productValue80, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    float scalarValue52 = rdDot3Precise(vec3(varyingTexCoord1.x, varyingTexCoord1.y, varyingTexCoord1.z), vec3(varyingTexCoord2.x, varyingTexCoord2.y, 1.0));
                                    bitwiseValue6 = fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
                                    productValue9 = spvNClamp((1.0 - spvNMin(abs(scalarValue52), 1.0)) * varyingTexCoord1.w, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    branchMergedValue55 = spvNClamp((1.0 - spvNClamp(abs(dot(vec3(varyingTexCoord1.x, varyingTexCoord1.y, varyingTexCoord1.z), vec3(varyingTexCoord2.x, varyingTexCoord2.y, 1.0))), 0.0, 1.0)) * varyingTexCoord1.w, 0.0, 1.0);
                                    branchMergedValue57 = fragmentVectorConstants1.packedValues[sumValue].w;
#endif
                                }
                                else
                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    float intermediateValue56;
                                    float intermediateValue58;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    float multiplyAddValue16;
                                    float intermediateValue46;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    float branchMergedValue58;
                                    float branchMergedValue59;
#endif
                                    if (scalarValue == 19u)
                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                        vec4 vectorValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                        float scalarValue53 = vectorValue9.x;
                                        uint productValue81 = (productValue55 * 4u) + 1u;
                                        precise float productValue82 = fragmentScalarConstants1.packedValues[productValue81] * 0.5;
                                        float nonlinearValue13 = sqrt(productValue82);
                                        float multiplyAddValue63 = fma(nonlinearValue13, 0.5, -0.89999997615814208984375);
                                        precise float quotientValue47 = fragmentScalarConstants1.packedValues[(productValue55 * 4u) + 2u] / fragmentScalarConstants1.packedValues[productValue81];
                                        precise float productValue83 = nonlinearValue13 * quotientValue47;
                                        uint bitwiseValue23 = (((16u * productValue55) + 16u) + 12u) >> 2u;
                                        precise float bitwiseValue24 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u] - fragmentScalarConstants1.packedValues[bitwiseValue23];
                                        precise float multiplyAddValue64 = fma(spvNClamp(fma(scalarValue53, nonlinearValue13, -fma(productValue83, 0.5, multiplyAddValue63)), 0.0, 1.0), bitwiseValue24, fragmentScalarConstants1.packedValues[bitwiseValue23]) * spvNClamp(fma(scalarValue53, nonlinearValue13, -spvNMax(fma(-productValue83, 0.5, multiplyAddValue63), 0.0)), 0.0, 1.0);
                                        intermediateValue56 = multiplyAddValue64;
                                        intermediateValue58 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                        vec4 vectorValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                        float scalarValue53 = vectorValue9.x;
                                        uint productValue36 = (productValue32 * 4u) + 1u;
                                        float nonlinearValue4 = sqrt(fragmentScalarConstants1.packedValues[productValue36] * 0.5);
                                        float multiplyAddValue36 = fma(nonlinearValue4, 0.5, -0.89999997615814208984375);
                                        float quotientValue27 = nonlinearValue4 * (fragmentScalarConstants1.packedValues[(productValue32 * 4u) + 2u] / fragmentScalarConstants1.packedValues[productValue36]);
                                        uint bitwiseValue16 = (((16u * productValue32) + 16u) + 12u) >> 2u;
                                        multiplyAddValue16 = spvNClamp(fma(scalarValue53, nonlinearValue4, -spvNMax(fma(-quotientValue27, 0.5, multiplyAddValue36), 0.0)), 0.0, 1.0) * fma(spvNClamp(fma(scalarValue53, nonlinearValue4, -fma(quotientValue27, 0.5, multiplyAddValue36)), 0.0, 1.0), fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u] - fragmentScalarConstants1.packedValues[bitwiseValue16], fragmentScalarConstants1.packedValues[bitwiseValue16]);
                                        intermediateValue46 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                        uint scalarValue16 = scalarValue1 + 1u;
                                        float nonlinearValue2 = sqrt(fragmentVectorConstants1.packedValues[scalarValue1].y * 0.5);
                                        float productValue15 = nonlinearValue2 * 0.5;
                                        float sumValue18 = productValue15 + (-0.89999997615814208984375);
                                        float quotientValue13 = productValue15 * (fragmentVectorConstants1.packedValues[scalarValue1].z / fragmentVectorConstants1.packedValues[scalarValue1].y);
                                        float sampledTextureValue4 = nonlinearValue2 * texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y)).x;
                                        branchMergedValue58 = 1.0;
                                        branchMergedValue59 = ((spvNClamp((sampledTextureValue4 - sumValue18) - quotientValue13, 0.0, 1.0) * (fragmentVectorConstants1.packedValues[sumValue].w - fragmentVectorConstants1.packedValues[scalarValue16].w)) + fragmentVectorConstants1.packedValues[scalarValue16].w) * spvNClamp(sampledTextureValue4 - spvNMax(0.0, sumValue18 - quotientValue13), 0.0, 1.0);
#endif
                                    }
                                    else
                                    {
                                        bool comparisonValue3 = scalarValue == 35u;
#if RD_PLATFORM == RD_PLATFORM_SM40
                                        float multiplyAddValue16;
                                        float intermediateValue69;
                                        if (comparisonValue3 || (scalarValue == 32u))
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                        float comparisonValue5;
                                        float multiplyAddValue18;
                                        if ((scalarValue == 32u) || comparisonValue3)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                        float branchMergedValue60;
                                        float branchMergedValue61;
                                        if ((scalarValue == 32u) || comparisonValue3)
#endif
                                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                            uint scalarValue102 = uint(int(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 0u) >> 2u]));
                                            float intermediateValue76;
                                            float intermediateValue77;
                                            float intermediateValue78;
                                            float intermediateValue79;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                            uint scalarValue54 = uint(int(fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 0u) >> 2u]));
                                            float intermediateValue61;
                                            float intermediateValue62;
                                            float intermediateValue63;
                                            float intermediateValue64;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                            uint scalarValue17 = uint(int(fragmentVectorConstants1.packedValues[sumValue].x));
                                            float intermediateValue35;
                                            float intermediateValue36;
                                            float intermediateValue37;
                                            float intermediateValue38;
#endif
                                            if (comparisonValue3)
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                vec4 sampledTextureValue15 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[productValue55].z, fract(varyingTexCoord1.z), fragmentVectorConstants1.packedValues[productValue55].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[productValue55].w, fract(varyingTexCoord1.w), fragmentVectorConstants1.packedValues[productValue55].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                intermediateValue76 = sampledTextureValue15.w;
                                                intermediateValue77 = sampledTextureValue15.z;
                                                intermediateValue78 = sampledTextureValue15.y;
                                                intermediateValue79 = sampledTextureValue15.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                vec4 sampledTextureValue9 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[productValue32].z, fract(varyingTexCoord1.z), fragmentVectorConstants1.packedValues[productValue32].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[productValue32].w, fract(varyingTexCoord1.w), fragmentVectorConstants1.packedValues[productValue32].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                intermediateValue61 = sampledTextureValue9.w;
                                                intermediateValue62 = sampledTextureValue9.z;
                                                intermediateValue63 = sampledTextureValue9.y;
                                                intermediateValue64 = sampledTextureValue9.x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                vec4 sampledTextureValue5 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((((fragmentVectorConstants1.packedValues[scalarValue1].z * fract(varyingTexCoord1.z)) + fragmentVectorConstants1.packedValues[scalarValue1].x) * fragmentVectorConstants1.packedValues[128u].z) + fragmentVectorConstants1.packedValues[128u].x, (((fract(varyingTexCoord1.w) * fragmentVectorConstants1.packedValues[scalarValue1].w) + fragmentVectorConstants1.packedValues[scalarValue1].y) * fragmentVectorConstants1.packedValues[128u].w) + fragmentVectorConstants1.packedValues[128u].y));
                                                intermediateValue35 = sampledTextureValue5.x;
                                                intermediateValue36 = sampledTextureValue5.y;
                                                intermediateValue37 = sampledTextureValue5.z;
                                                intermediateValue38 = sampledTextureValue5.w;
#endif
                                            }
                                            else
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                vec4 sampledTextureValue10 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.z, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.w, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                intermediateValue76 = sampledTextureValue10.w;
                                                intermediateValue77 = sampledTextureValue10.z;
                                                intermediateValue78 = sampledTextureValue10.y;
                                                intermediateValue79 = sampledTextureValue10.x;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                vec4 sampledTextureValue10 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.z, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.w, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                intermediateValue61 = sampledTextureValue10.w;
                                                intermediateValue62 = sampledTextureValue10.z;
                                                intermediateValue63 = sampledTextureValue10.y;
                                                intermediateValue64 = sampledTextureValue10.x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                vec4 sampledTextureValue6 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.z) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.w) + fragmentVectorConstants1.packedValues[128u].y));
                                                intermediateValue35 = sampledTextureValue6.x;
                                                intermediateValue36 = sampledTextureValue6.y;
                                                intermediateValue37 = sampledTextureValue6.z;
                                                intermediateValue38 = sampledTextureValue6.w;
#endif
                                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                            float exponentialValue9;
                                            float exponentialValue10;
                                            float exponentialValue11;
                                            if ((productValue69 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                            float exponentialValue9;
                                            float exponentialValue10;
                                            float exponentialValue11;
                                            if ((productValue35 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                            float intermediateValue46;
                                            float intermediateValue47;
                                            float intermediateValue48;
                                            if ((sumValue1 & 2u) == 0u)
#endif
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                precise float productValue84 = intermediateValue79 * 0.077399380505084991455078125;
                                                precise float productValue85 = intermediateValue78 * 0.077399380505084991455078125;
                                                precise float productValue86 = intermediateValue77 * 0.077399380505084991455078125;
                                                precise float sumValue121 = intermediateValue79 + 0.054999999701976776123046875;
                                                precise float sumValue122 = intermediateValue78 + 0.054999999701976776123046875;
                                                precise float sumValue123 = intermediateValue77 + 0.054999999701976776123046875;
                                                precise float productValue87 = sumValue121 * 0.947867333889007568359375;
                                                precise float productValue88 = sumValue122 * 0.947867333889007568359375;
                                                precise float productValue89 = sumValue123 * 0.947867333889007568359375;
                                                precise float nonlinearValue14 = log2(productValue87) * 2.400000095367431640625;
                                                precise float nonlinearValue15 = log2(productValue88) * 2.400000095367431640625;
                                                precise float nonlinearValue16 = log2(productValue89) * 2.400000095367431640625;
                                                exponentialValue9 = (intermediateValue77 > 0.040449999272823333740234375) ? exp2(nonlinearValue16) : productValue86;
                                                exponentialValue10 = (intermediateValue78 > 0.040449999272823333740234375) ? exp2(nonlinearValue15) : productValue85;
                                                exponentialValue11 = (intermediateValue79 > 0.040449999272823333740234375) ? exp2(nonlinearValue14) : productValue84;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                exponentialValue9 = (intermediateValue62 > 0.040449999272823333740234375) ? exp2(log2((intermediateValue62 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (intermediateValue62 * 0.077399380505084991455078125);
                                                exponentialValue10 = (intermediateValue63 > 0.040449999272823333740234375) ? exp2(log2((intermediateValue63 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (intermediateValue63 * 0.077399380505084991455078125);
                                                exponentialValue11 = (intermediateValue64 > 0.040449999272823333740234375) ? exp2(log2((intermediateValue64 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (intermediateValue64 * 0.077399380505084991455078125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                float branchMergedValue9;
                                                float branchMergedValue20;
                                                float branchMergedValue21;
                                                if ((sumValue1 & 16u) == 0u)
                                                {
                                                    branchMergedValue9 = intermediateValue37;
                                                    branchMergedValue20 = intermediateValue36;
                                                    branchMergedValue21 = intermediateValue35;
                                                }
                                                else
                                                {
                                                    float exponentialValue12;
                                                    if (!(intermediateValue35 <= 0.003130800090730190277099609375))
                                                    {
                                                        exponentialValue12 = (exp2(log2(intermediateValue35) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue12 = intermediateValue35 * 12.9200000762939453125;
                                                    }
                                                    float exponentialValue14;
                                                    if (!(intermediateValue36 <= 0.003130800090730190277099609375))
                                                    {
                                                        exponentialValue14 = (exp2(log2(intermediateValue36) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue14 = intermediateValue36 * 12.9200000762939453125;
                                                    }
                                                    float branchMergedValue34;
                                                    float branchMergedValue40;
                                                    float branchMergedValue41;
                                                    if (!(intermediateValue37 <= 0.003130800090730190277099609375))
                                                    {
                                                        branchMergedValue34 = (exp2(log2(intermediateValue37) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                        branchMergedValue40 = exponentialValue14;
                                                        branchMergedValue41 = exponentialValue12;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue34 = intermediateValue37 * 12.9200000762939453125;
                                                        branchMergedValue40 = exponentialValue14;
                                                        branchMergedValue41 = exponentialValue12;
                                                    }
                                                    branchMergedValue9 = branchMergedValue34;
                                                    branchMergedValue20 = branchMergedValue40;
                                                    branchMergedValue21 = branchMergedValue41;
                                                }
                                                intermediateValue46 = branchMergedValue21;
                                                intermediateValue47 = branchMergedValue20;
                                                intermediateValue48 = branchMergedValue9;
#endif
                                            }
                                            else
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                float multiplyAddValue29;
                                                float multiplyAddValue30;
                                                float multiplyAddValue31;
                                                if ((productValue69 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                float multiplyAddValue26;
                                                float multiplyAddValue27;
                                                float multiplyAddValue28;
                                                if ((productValue35 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                float exponentialValue11;
                                                if (!(intermediateValue35 <= 0.040449999272823333740234375))
#endif
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    precise float productValue90 = intermediateValue79 * 12.9200000762939453125;
                                                    precise float productValue91 = intermediateValue78 * 12.9200000762939453125;
                                                    precise float productValue92 = intermediateValue77 * 12.9200000762939453125;
                                                    precise float nonlinearValue17 = log2(intermediateValue79) * 0.4166666567325592041015625;
                                                    precise float nonlinearValue18 = log2(intermediateValue78) * 0.4166666567325592041015625;
                                                    precise float nonlinearValue19 = log2(intermediateValue77) * 0.4166666567325592041015625;
                                                    multiplyAddValue31 = (intermediateValue79 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue17), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue90;
                                                    multiplyAddValue30 = (intermediateValue78 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue18), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue91;
                                                    multiplyAddValue29 = (intermediateValue77 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue19), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue92;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    multiplyAddValue28 = (intermediateValue64 > 0.003130800090730190277099609375) ? fma(exp2(log2(intermediateValue64) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (intermediateValue64 * 12.9200000762939453125);
                                                    multiplyAddValue27 = (intermediateValue63 > 0.003130800090730190277099609375) ? fma(exp2(log2(intermediateValue63) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (intermediateValue63 * 12.9200000762939453125);
                                                    multiplyAddValue26 = (intermediateValue62 > 0.003130800090730190277099609375) ? fma(exp2(log2(intermediateValue62) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (intermediateValue62 * 12.9200000762939453125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    exponentialValue11 = exp2(log2((intermediateValue35 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
                                                }
                                                else
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    multiplyAddValue31 = intermediateValue79;
                                                    multiplyAddValue30 = intermediateValue78;
                                                    multiplyAddValue29 = intermediateValue77;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    multiplyAddValue28 = intermediateValue64;
                                                    multiplyAddValue27 = intermediateValue63;
                                                    multiplyAddValue26 = intermediateValue62;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    exponentialValue11 = intermediateValue35 * 0.077399380505084991455078125;
#endif
                                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                exponentialValue9 = multiplyAddValue29;
                                                exponentialValue10 = multiplyAddValue30;
                                                exponentialValue11 = multiplyAddValue31;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                exponentialValue9 = multiplyAddValue26;
                                                exponentialValue10 = multiplyAddValue27;
                                                exponentialValue11 = multiplyAddValue28;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                float exponentialValue13;
                                                if (!(intermediateValue36 <= 0.040449999272823333740234375))
                                                {
                                                    exponentialValue13 = exp2(log2((intermediateValue36 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                }
                                                else
                                                {
                                                    exponentialValue13 = intermediateValue36 * 0.077399380505084991455078125;
                                                }
                                                float branchMergedValue11;
                                                float branchMergedValue24;
                                                float branchMergedValue25;
                                                if (!(intermediateValue37 <= 0.040449999272823333740234375))
                                                {
                                                    branchMergedValue11 = exp2(log2((intermediateValue37 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                    branchMergedValue24 = exponentialValue13;
                                                    branchMergedValue25 = exponentialValue11;
                                                }
                                                else
                                                {
                                                    branchMergedValue11 = intermediateValue37 * 0.077399380505084991455078125;
                                                    branchMergedValue24 = exponentialValue13;
                                                    branchMergedValue25 = exponentialValue11;
                                                }
                                                intermediateValue46 = branchMergedValue25;
                                                intermediateValue47 = branchMergedValue24;
                                                intermediateValue48 = branchMergedValue11;
#endif
                                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                            float scalarValue55 = rdDot3Precise(vec3(exponentialValue11, exponentialValue10, exponentialValue9), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                            float scalarValue56 = spvNClamp(scalarValue55, 0.0, 1.0);
                                            precise float multiplyAddValue65 = fma(float((scalarValue102 & 1u) != 0u), fma(intermediateValue76, -2.0, 1.0), intermediateValue76) - scalarValue56;
                                            float multiplyAddValue66 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 8u) >> 2u], multiplyAddValue65, scalarValue56);
                                            precise float sumValue124 = 1.0 - multiplyAddValue66;
                                            precise float sumValue125 = varyingTexCoord2.x - varyingTexCoord1.x;
                                            precise float sumValue126 = varyingTexCoord2.y - varyingTexCoord1.y;
                                            precise float quotientValue48 = sumValue125 / varyingTexCoord2.z;
                                            precise float quotientValue49 = sumValue126 / fragmentScalarConstants1.packedValues[(bitwiseValue19 * 4u) + 1u];
                                            vec2 vectorValue24 = vec2(quotientValue48, quotientValue49);
                                            float scalarValue103 = rdDot2Precise2(vectorValue24, vectorValue24);
                                            precise float sumValue127 = scalarValue103 - 1.0;
                                            precise float sumValue128 = quotientValue48 + quotientValue48;
                                            precise float sumValue129 = quotientValue49 + quotientValue49;
                                            precise float productValue93 = dFdx(quotientValue48) * sumValue128;
                                            precise float productValue94 = dFdx(quotientValue49) * sumValue129;
                                            precise float productValue95 = dFdy(-quotientValue48) * sumValue128;
                                            precise float productValue96 = dFdy(-quotientValue49) * sumValue129;
                                            precise float sumValue130 = productValue94 + productValue93;
                                            precise float sumValue131 = productValue96 + productValue95;
                                            vec2 vectorValue25 = vec2(sumValue130, sumValue131);
                                            float scalarValue104 = rdDot2Precise2(vectorValue25, vectorValue25);
                                            precise float multiplyAddValue67 = spvNClamp(fma(-sumValue127, inversesqrt(spvNMax(scalarValue104, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                                            multiplyAddValue16 = fma(float((scalarValue102 & 2u) != 0u), sumValue124, multiplyAddValue66);
                                            intermediateValue69 = multiplyAddValue67;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                            float scalarValue55 = rdDot3Precise(vec3(exponentialValue11, exponentialValue10, exponentialValue9), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                            float scalarValue56 = spvNClamp(scalarValue55, 0.0, 1.0);
                                            float multiplyAddValue37 = fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 8u) >> 2u], (((scalarValue54 & 1u) != 0u) ? (fma(intermediateValue61, -2.0, 1.0) + intermediateValue61) : intermediateValue61) - scalarValue56, scalarValue56);
                                            float quotientValue14 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord2.z;
                                            float quotientValue28 = (varyingTexCoord2.y - varyingTexCoord1.y) / fragmentScalarConstants1.packedValues[(scalarValue32 * 4u) + 1u];
                                            vec2 vectorValue10 = vec2(quotientValue14, quotientValue28);
                                            float scalarValue57 = rdDot2Precise2(vectorValue10, vectorValue10);
                                            float sumValue57 = quotientValue14 + quotientValue14;
                                            float sumValue58 = quotientValue28 + quotientValue28;
                                            vec2 multiplyAddValue38 = vec2(fma(dFdxCoarse(quotientValue28), sumValue58, dFdxCoarse(quotientValue14) * sumValue57), fma(dFdyCoarse(-quotientValue28), sumValue58, dFdyCoarse(-quotientValue14) * sumValue57));
                                            float scalarValue58 = rdDot2Precise2(multiplyAddValue38, multiplyAddValue38);
                                            comparisonValue5 = ((scalarValue54 & 2u) != 0u) ? ((1.0 - multiplyAddValue37) + multiplyAddValue37) : multiplyAddValue37;
                                            multiplyAddValue18 = spvNClamp(fma(1.0 - scalarValue57, inversesqrt(spvNMax(scalarValue58, 9.9999997473787516355514526367188e-05)), 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                            float productValue16 = spvNClamp(((intermediateValue47 * 0.715200006961822509765625) + (intermediateValue46 * 0.2125999927520751953125)) + (intermediateValue48 * 0.072200000286102294921875), 0.0, 1.0);
                                            float comparisonValue4 = (((((1.0 - (intermediateValue38 * 2.0)) * float((scalarValue17 & 1u) != 0u)) + intermediateValue38) - productValue16) * fragmentVectorConstants1.packedValues[sumValue].z) + productValue16;
                                            float quotientValue14 = (varyingTexCoord2.x - varyingTexCoord1.x) / varyingTexCoord2.z;
                                            float quotientValue15 = (varyingTexCoord2.y - varyingTexCoord1.y) / fragmentVectorConstants1.packedValues[bitwiseValue7].y;
                                            float productValue17 = ((dFdxCoarse(quotientValue15) * quotientValue15) + (dFdxCoarse(quotientValue14) * quotientValue14)) * 2.0;
                                            float productValue18 = ((dFdyCoarse((-0.0) - quotientValue15) * quotientValue15) + (dFdyCoarse((-0.0) - quotientValue14) * quotientValue14)) * 2.0;
                                            branchMergedValue60 = spvNClamp(0.5 - (inversesqrt(spvNMax(dot(vec2(productValue17, productValue18), vec2(productValue17, productValue18)), 9.9999997473787516355514526367188e-05)) * (dot(vec2(quotientValue14, quotientValue15), vec2(quotientValue14, quotientValue15)) + (-1.0))), 0.0, 1.0) * fragmentVectorConstants1.packedValues[sumValue].w;
                                            branchMergedValue61 = ((1.0 - comparisonValue4) * float((scalarValue17 & 2u) != 0u)) + comparisonValue4;
#endif
                                        }
                                        else
                                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                            float multiplyAddValue35;
                                            float intermediateValue100;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                            float multiplyAddValue31;
                                            float multiplyAddValue33;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                            float branchMergedValue62;
                                            float branchMergedValue63;
#endif
                                            if (scalarValue == 33u)
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                uint scalarValue105 = productValue55 + 1u;
                                                vec4 sampledTextureValue16 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[scalarValue105].z, fract(varyingTexCoord1.z), fragmentVectorConstants1.packedValues[scalarValue105].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[scalarValue105].w, fract(varyingTexCoord1.w), fragmentVectorConstants1.packedValues[scalarValue105].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                float scalarValue106 = sampledTextureValue16.x;
                                                float scalarValue107 = sampledTextureValue16.y;
                                                float scalarValue108 = sampledTextureValue16.z;
                                                float scalarValue109 = sampledTextureValue16.w;
                                                float exponentialValue6;
                                                float exponentialValue7;
                                                float exponentialValue8;
                                                if ((productValue69 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                uint scalarValue59 = productValue32 + 1u;
                                                vec4 sampledTextureValue11 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(fma(fragmentVectorConstants1.packedValues[scalarValue59].z, fract(varyingTexCoord1.z), fragmentVectorConstants1.packedValues[scalarValue59].x), fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(fma(fragmentVectorConstants1.packedValues[scalarValue59].w, fract(varyingTexCoord1.w), fragmentVectorConstants1.packedValues[scalarValue59].y), fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                float scalarValue60 = sampledTextureValue11.x;
                                                float scalarValue61 = sampledTextureValue11.y;
                                                float scalarValue62 = sampledTextureValue11.z;
                                                float scalarValue63 = sampledTextureValue11.w;
                                                float exponentialValue6;
                                                float exponentialValue7;
                                                float exponentialValue8;
                                                if ((productValue35 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                uint scalarValue18 = scalarValue1 + 1u;
                                                vec4 sampledTextureValue7 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * ((fragmentVectorConstants1.packedValues[scalarValue18].z * fract(varyingTexCoord1.z)) + fragmentVectorConstants1.packedValues[scalarValue18].x)) + fragmentVectorConstants1.packedValues[128u].x, (((fract(varyingTexCoord1.w) * fragmentVectorConstants1.packedValues[scalarValue18].w) + fragmentVectorConstants1.packedValues[scalarValue18].y) * fragmentVectorConstants1.packedValues[128u].w) + fragmentVectorConstants1.packedValues[128u].y));
                                                float scalarValue19 = sampledTextureValue7.x;
                                                float scalarValue20 = sampledTextureValue7.y;
                                                float scalarValue21 = sampledTextureValue7.z;
                                                float scalarValue22 = sampledTextureValue7.w;
                                                float intermediateValue40;
                                                float intermediateValue41;
                                                float intermediateValue42;
                                                if ((sumValue1 & 2u) == 0u)
#endif
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    precise float productValue97 = scalarValue106 * 0.077399380505084991455078125;
                                                    precise float productValue98 = scalarValue107 * 0.077399380505084991455078125;
                                                    precise float productValue99 = scalarValue108 * 0.077399380505084991455078125;
                                                    precise float sumValue132 = scalarValue106 + 0.054999999701976776123046875;
                                                    precise float sumValue133 = scalarValue107 + 0.054999999701976776123046875;
                                                    precise float sumValue134 = scalarValue108 + 0.054999999701976776123046875;
                                                    precise float productValue100 = sumValue132 * 0.947867333889007568359375;
                                                    precise float productValue101 = sumValue133 * 0.947867333889007568359375;
                                                    precise float productValue102 = sumValue134 * 0.947867333889007568359375;
                                                    precise float nonlinearValue20 = log2(productValue100) * 2.400000095367431640625;
                                                    precise float nonlinearValue21 = log2(productValue101) * 2.400000095367431640625;
                                                    precise float nonlinearValue22 = log2(productValue102) * 2.400000095367431640625;
                                                    exponentialValue6 = (scalarValue108 > 0.040449999272823333740234375) ? exp2(nonlinearValue22) : productValue99;
                                                    exponentialValue7 = (scalarValue107 > 0.040449999272823333740234375) ? exp2(nonlinearValue21) : productValue98;
                                                    exponentialValue8 = (scalarValue106 > 0.040449999272823333740234375) ? exp2(nonlinearValue20) : productValue97;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    exponentialValue6 = (scalarValue62 > 0.040449999272823333740234375) ? exp2(log2((scalarValue62 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue62 * 0.077399380505084991455078125);
                                                    exponentialValue7 = (scalarValue61 > 0.040449999272823333740234375) ? exp2(log2((scalarValue61 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue61 * 0.077399380505084991455078125);
                                                    exponentialValue8 = (scalarValue60 > 0.040449999272823333740234375) ? exp2(log2((scalarValue60 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue60 * 0.077399380505084991455078125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    float branchMergedValue8;
                                                    float branchMergedValue18;
                                                    float branchMergedValue19;
                                                    if ((sumValue1 & 16u) == 0u)
                                                    {
                                                        branchMergedValue8 = scalarValue21;
                                                        branchMergedValue18 = scalarValue19;
                                                        branchMergedValue19 = scalarValue20;
                                                    }
                                                    else
                                                    {
                                                        float exponentialValue8;
                                                        if (!(scalarValue19 <= 0.003130800090730190277099609375))
                                                        {
                                                            exponentialValue8 = (exp2(log2(scalarValue19) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                        }
                                                        else
                                                        {
                                                            exponentialValue8 = scalarValue19 * 12.9200000762939453125;
                                                        }
                                                        float exponentialValue10;
                                                        if (!(scalarValue20 <= 0.003130800090730190277099609375))
                                                        {
                                                            exponentialValue10 = (exp2(log2(scalarValue20) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                        }
                                                        else
                                                        {
                                                            exponentialValue10 = scalarValue20 * 12.9200000762939453125;
                                                        }
                                                        float branchMergedValue33;
                                                        float branchMergedValue38;
                                                        float branchMergedValue39;
                                                        if (!(scalarValue21 <= 0.003130800090730190277099609375))
                                                        {
                                                            branchMergedValue33 = (exp2(log2(scalarValue21) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                            branchMergedValue38 = exponentialValue8;
                                                            branchMergedValue39 = exponentialValue10;
                                                        }
                                                        else
                                                        {
                                                            branchMergedValue33 = scalarValue21 * 12.9200000762939453125;
                                                            branchMergedValue38 = exponentialValue8;
                                                            branchMergedValue39 = exponentialValue10;
                                                        }
                                                        branchMergedValue8 = branchMergedValue33;
                                                        branchMergedValue18 = branchMergedValue38;
                                                        branchMergedValue19 = branchMergedValue39;
                                                    }
                                                    intermediateValue40 = branchMergedValue18;
                                                    intermediateValue41 = branchMergedValue19;
                                                    intermediateValue42 = branchMergedValue8;
#endif
                                                }
                                                else
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    float multiplyAddValue20;
                                                    float multiplyAddValue21;
                                                    float multiplyAddValue22;
                                                    if ((productValue69 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    float multiplyAddValue22;
                                                    float multiplyAddValue23;
                                                    float multiplyAddValue24;
                                                    if ((productValue35 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    float exponentialValue7;
                                                    if (!(scalarValue19 <= 0.040449999272823333740234375))
#endif
                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                        precise float productValue103 = scalarValue106 * 12.9200000762939453125;
                                                        precise float productValue104 = scalarValue107 * 12.9200000762939453125;
                                                        precise float productValue105 = scalarValue108 * 12.9200000762939453125;
                                                        precise float nonlinearValue23 = log2(scalarValue106) * 0.4166666567325592041015625;
                                                        precise float nonlinearValue24 = log2(scalarValue107) * 0.4166666567325592041015625;
                                                        precise float nonlinearValue25 = log2(scalarValue108) * 0.4166666567325592041015625;
                                                        multiplyAddValue22 = (scalarValue106 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue23), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue103;
                                                        multiplyAddValue21 = (scalarValue107 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue24), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue104;
                                                        multiplyAddValue20 = (scalarValue108 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue25), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue105;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                        multiplyAddValue24 = (scalarValue60 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue60) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue60 * 12.9200000762939453125);
                                                        multiplyAddValue23 = (scalarValue61 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue61) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue61 * 12.9200000762939453125);
                                                        multiplyAddValue22 = (scalarValue62 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue62) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue62 * 12.9200000762939453125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                        exponentialValue7 = exp2(log2((scalarValue19 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
                                                    }
                                                    else
                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                        multiplyAddValue22 = scalarValue106;
                                                        multiplyAddValue21 = scalarValue107;
                                                        multiplyAddValue20 = scalarValue108;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                        multiplyAddValue24 = scalarValue60;
                                                        multiplyAddValue23 = scalarValue61;
                                                        multiplyAddValue22 = scalarValue62;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                        exponentialValue7 = scalarValue19 * 0.077399380505084991455078125;
#endif
                                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    exponentialValue6 = multiplyAddValue20;
                                                    exponentialValue7 = multiplyAddValue21;
                                                    exponentialValue8 = multiplyAddValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    exponentialValue6 = multiplyAddValue22;
                                                    exponentialValue7 = multiplyAddValue23;
                                                    exponentialValue8 = multiplyAddValue24;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    float exponentialValue9;
                                                    if (!(scalarValue20 <= 0.040449999272823333740234375))
                                                    {
                                                        exponentialValue9 = exp2(log2((scalarValue20 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                    }
                                                    else
                                                    {
                                                        exponentialValue9 = scalarValue20 * 0.077399380505084991455078125;
                                                    }
                                                    float branchMergedValue10;
                                                    float branchMergedValue22;
                                                    float branchMergedValue23;
                                                    if (!(scalarValue21 <= 0.040449999272823333740234375))
                                                    {
                                                        branchMergedValue10 = exp2(log2((scalarValue21 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                        branchMergedValue22 = exponentialValue7;
                                                        branchMergedValue23 = exponentialValue9;
                                                    }
                                                    else
                                                    {
                                                        branchMergedValue10 = scalarValue21 * 0.077399380505084991455078125;
                                                        branchMergedValue22 = exponentialValue7;
                                                        branchMergedValue23 = exponentialValue9;
                                                    }
                                                    intermediateValue40 = branchMergedValue22;
                                                    intermediateValue41 = branchMergedValue23;
                                                    intermediateValue42 = branchMergedValue10;
#endif
                                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                precise float sumValue135 = 1.0 - scalarValue109;
                                                precise float sumValue136 = scalarValue109 - sumValue135;
                                                float scalarValue64 = rdDot3Precise(vec3(exponentialValue8, exponentialValue7, exponentialValue6), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                                float scalarValue65 = spvNClamp(scalarValue64, 0.0, 1.0);
                                                precise float multiplyAddValue68 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 0u) >> 2u], sumValue136, sumValue135) - scalarValue65;
                                                float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 8u) >> 2u], multiplyAddValue68, scalarValue65);
                                                precise float sumValue137 = 1.0 - multiplyAddValue69;
                                                precise float sumValue138 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                precise float sumValue139 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                vec2 vectorValue26 = vec2(sumValue138, sumValue139);
                                                float scalarValue110 = rdDot2Precise2(vectorValue26, vectorValue26);
                                                precise float nonlinearValue26 = sqrt(scalarValue110) - varyingTexCoord2.z;
                                                precise float multiplyAddValue70 = spvNClamp(fma(-spvNMin(fragmentScalarConstants1.packedValues[productValue55 * 4u], fragmentScalarConstants1.packedValues[(productValue55 * 4u) + 1u]), nonlinearValue26, 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                                                multiplyAddValue35 = fma(fragmentScalarConstants1.packedValues[(bitwiseValue19 * 4u) + 1u], sumValue137, multiplyAddValue69);
                                                intermediateValue100 = multiplyAddValue70;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                float scalarValue64 = rdDot3Precise(vec3(exponentialValue8, exponentialValue7, exponentialValue6), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                                float scalarValue65 = spvNClamp(scalarValue64, 0.0, 1.0);
                                                float multiplyAddValue46 = fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 8u) >> 2u], fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 0u) >> 2u], scalarValue63 + (scalarValue63 - 1.0), 1.0 - scalarValue63) - scalarValue65, scalarValue65);
                                                vec2 sumValue59 = vec2(varyingTexCoord2.x - varyingTexCoord1.x, varyingTexCoord2.y - varyingTexCoord1.y);
                                                float scalarValue66 = rdDot2Precise2(sumValue59, sumValue59);
                                                multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[(scalarValue32 * 4u) + 1u], 1.0 - multiplyAddValue46, multiplyAddValue46);
                                                multiplyAddValue33 = spvNClamp(fma(-spvNMin(fragmentScalarConstants1.packedValues[productValue32 * 4u], fragmentScalarConstants1.packedValues[(productValue32 * 4u) + 1u]), sqrt(scalarValue66) - varyingTexCoord2.z, 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                float sumValue20 = 1.0 - scalarValue22;
                                                float productValue19 = spvNClamp(((intermediateValue41 * 0.715200006961822509765625) + (intermediateValue40 * 0.2125999927520751953125)) + (intermediateValue42 * 0.072200000286102294921875), 0.0, 1.0);
                                                float productValue20 = (((((scalarValue22 - sumValue20) * fragmentVectorConstants1.packedValues[sumValue].x) + sumValue20) - productValue19) * fragmentVectorConstants1.packedValues[sumValue].z) + productValue19;
                                                float sumValue21 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                float sumValue22 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                branchMergedValue62 = spvNClamp(0.5 - ((sqrt((sumValue22 * sumValue22) + (sumValue21 * sumValue21)) - varyingTexCoord2.z) * ((fragmentVectorConstants1.packedValues[scalarValue1].x < fragmentVectorConstants1.packedValues[scalarValue1].y) ? fragmentVectorConstants1.packedValues[scalarValue1].x : fragmentVectorConstants1.packedValues[scalarValue1].y)), 0.0, 1.0) * fragmentVectorConstants1.packedValues[sumValue].w;
                                                branchMergedValue63 = ((1.0 - productValue20) * fragmentVectorConstants1.packedValues[bitwiseValue7].y) + productValue20;
#endif
                                            }
                                            else
                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                float intermediateValue99;
                                                float intermediateValue101;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                float multiplyAddValue32;
                                                float intermediateValue79;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                float branchMergedValue64;
                                                float branchMergedValue65;
#endif
                                                if (scalarValue == 23u)
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    vec4 vectorValue11 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                    float scalarValue67 = vectorValue11.x;
                                                    uint productValue106 = productValue55 * 4u;
                                                    uint productValue107 = (productValue55 * 4u) + 2u;
                                                    precise float productValue108 = fragmentScalarConstants1.packedValues[productValue106] * fragmentScalarConstants1.packedValues[productValue107];
                                                    float multiplyAddValue71 = fma(productValue108, 0.5, 0.5);
                                                    float multiplyAddValue72 = fma(-fragmentScalarConstants1.packedValues[productValue107], fragmentScalarConstants1.packedValues[productValue106], multiplyAddValue71);
                                                    precise float sumValue140 = multiplyAddValue72 - fragmentScalarConstants1.packedValues[productValue106];
                                                    precise float sumValue141 = multiplyAddValue72 + fragmentScalarConstants1.packedValues[productValue106];
                                                    precise float sumValue142 = sumValue141 - sumValue140;
                                                    precise float sumValue143 = scalarValue67 - sumValue140;
                                                    precise float quotientValue50 = 1.0 / sumValue142;
                                                    precise float productValue109 = quotientValue50 * sumValue143;
                                                    float scalarValue111 = spvNClamp(productValue109, 0.0, 1.0);
                                                    precise float productValue110 = scalarValue111 * scalarValue111;
                                                    precise float multiplyAddValue73 = productValue110 * fma(scalarValue111, -2.0, 3.0);
                                                    if (multiplyAddValue73 <= 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    vec4 vectorValue11 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                    float scalarValue67 = vectorValue11.x;
                                                    uint productValue37 = productValue32 * 4u;
                                                    uint productValue38 = (productValue32 * 4u) + 2u;
                                                    float multiplyAddValue47 = fma(fragmentScalarConstants1.packedValues[productValue37] * fragmentScalarConstants1.packedValues[productValue38], 0.5, 0.5);
                                                    float multiplyAddValue48 = fma(-fragmentScalarConstants1.packedValues[productValue38], fragmentScalarConstants1.packedValues[productValue37], multiplyAddValue47);
                                                    float sumValue60 = fragmentScalarConstants1.packedValues[productValue37] - multiplyAddValue48;
                                                    float quotientValue29 = spvNClamp((1.0 / (sumValue60 + (multiplyAddValue48 + fragmentScalarConstants1.packedValues[productValue37]))) * (scalarValue67 + sumValue60), 0.0, 1.0);
                                                    float multiplyAddValue49 = (quotientValue29 * quotientValue29) * fma(quotientValue29, -2.0, 3.0);
                                                    if (multiplyAddValue49 <= 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    vec4 vectorValue = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y));
                                                    uint sumValue23 = scalarValue1 + 1u;
                                                    float productValue21 = fragmentVectorConstants1.packedValues[scalarValue1].z * fragmentVectorConstants1.packedValues[scalarValue1].x;
                                                    float productValue22 = (productValue21 * 0.5) + 0.5;
                                                    float productValue23 = fragmentVectorConstants1.packedValues[scalarValue1].x * 2.0;
                                                    float sumValue24 = fragmentVectorConstants1.packedValues[scalarValue1].x + vectorValue.x;
                                                    float quotientValue16 = spvNClamp(((sumValue24 + productValue21) - productValue22) / productValue23, 0.0, 1.0);
                                                    float productValue24 = (quotientValue16 * quotientValue16) * (3.0 - (quotientValue16 * 2.0));
                                                    if (!(!(productValue24 <= 0.0)))
#endif
                                                    {
                                                        isFragmentDiscarded = true;
                                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    precise float sumValue144 = multiplyAddValue71 - fragmentScalarConstants1.packedValues[productValue106];
                                                    precise float sumValue145 = multiplyAddValue71 + fragmentScalarConstants1.packedValues[productValue106];
                                                    precise float sumValue146 = sumValue145 - sumValue144;
                                                    precise float sumValue147 = scalarValue67 - sumValue144;
                                                    precise float quotientValue51 = 1.0 / sumValue146;
                                                    precise float productValue111 = quotientValue51 * sumValue147;
                                                    float scalarValue112 = spvNClamp(productValue111, 0.0, 1.0);
                                                    precise float productValue112 = scalarValue112 * scalarValue112;
                                                    precise float multiplyAddValue74 = productValue112 * fma(scalarValue112, -2.0, 3.0);
                                                    uint bitwiseValue25 = (((16u * productValue55) + 16u) + 12u) >> 2u;
                                                    precise float bitwiseValue26 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u] - fragmentScalarConstants1.packedValues[bitwiseValue25];
                                                    precise float multiplyAddValue75 = multiplyAddValue73 * fma(multiplyAddValue74, bitwiseValue26, fragmentScalarConstants1.packedValues[bitwiseValue25]);
                                                    intermediateValue99 = multiplyAddValue75;
                                                    intermediateValue101 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    float sumValue61 = fragmentScalarConstants1.packedValues[productValue37] - multiplyAddValue47;
                                                    float quotientValue30 = spvNClamp((scalarValue67 + sumValue61) * (1.0 / (sumValue61 + (multiplyAddValue47 + fragmentScalarConstants1.packedValues[productValue37]))), 0.0, 1.0);
                                                    uint bitwiseValue17 = (((16u * productValue32) + 16u) + 12u) >> 2u;
                                                    multiplyAddValue32 = multiplyAddValue49 * fma((quotientValue30 * quotientValue30) * fma(quotientValue30, -2.0, 3.0), fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u] - fragmentScalarConstants1.packedValues[bitwiseValue17], fragmentScalarConstants1.packedValues[bitwiseValue17]);
                                                    intermediateValue79 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    float quotientValue17 = spvNClamp((sumValue24 - productValue22) / productValue23, 0.0, 1.0);
                                                    branchMergedValue64 = 1.0;
                                                    branchMergedValue65 = ((((quotientValue17 * quotientValue17) * (fragmentVectorConstants1.packedValues[sumValue].w - fragmentVectorConstants1.packedValues[sumValue23].w)) * (3.0 - (quotientValue17 * 2.0))) + fragmentVectorConstants1.packedValues[sumValue23].w) * productValue24;
#endif
                                                }
                                                else
                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    float intermediateValue102;
                                                    float intermediateValue103;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    float multiplyAddValue34;
                                                    float intermediateValue80;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    float branchMergedValue66;
                                                    float branchMergedValue67;
#endif
                                                    if (scalarValue == 24u)
                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                        vec4 vectorValue12 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[131u].z, fragmentVectorConstants1.packedValues[131u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[131u].w, fragmentVectorConstants1.packedValues[131u].y)));
                                                        float scalarValue68 = vectorValue12.x;
                                                        float scalarValue69 = vectorValue12.y;
                                                        precise float sumValue148 = 0.5 - varyingTexCoord1.z;
                                                        precise float sumValue149 = varyingTexCoord1.z + 0.5;
                                                        precise float sumValue150 = sumValue149 - sumValue148;
                                                        precise float sumValue151 = spvNMax(spvNMin(scalarValue69, scalarValue68), spvNMin(vectorValue12.z, spvNMax(scalarValue69, scalarValue68))) - sumValue148;
                                                        precise float quotientValue52 = 1.0 / sumValue150;
                                                        precise float productValue113 = sumValue151 * quotientValue52;
                                                        float scalarValue113 = spvNClamp(productValue113, 0.0, 1.0);
                                                        precise float productValue114 = scalarValue113 * scalarValue113;
                                                        precise float multiplyAddValue76 = productValue114 * fma(scalarValue113, -2.0, 3.0);
                                                        precise float bitwiseValue27 = multiplyAddValue76 * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                                                        intermediateValue102 = bitwiseValue27;
                                                        intermediateValue103 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                        vec4 vectorValue12 = texture(sampler2D(materialTexture3, textureSampler3), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[131u].z, fragmentVectorConstants1.packedValues[131u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[131u].w, fragmentVectorConstants1.packedValues[131u].y)));
                                                        float scalarValue68 = vectorValue12.x;
                                                        float scalarValue69 = vectorValue12.y;
                                                        float sumValue62 = varyingTexCoord1.z - 0.5;
                                                        float quotientValue31 = spvNClamp((spvNMax(spvNMin(scalarValue69, scalarValue68), spvNMin(vectorValue12.z, spvNMax(scalarValue69, scalarValue68))) + sumValue62) * (1.0 / (sumValue62 + (varyingTexCoord1.z + 0.5))), 0.0, 1.0);
                                                        multiplyAddValue34 = ((quotientValue31 * quotientValue31) * fma(quotientValue31, -2.0, 3.0)) * fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
                                                        intermediateValue80 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                        vec4 vectorValue1 = texture(sampler2D(txBuffer3Texture, txBuffer3Sampler), vec2((fragmentVectorConstants1.packedValues[131u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[131u].x, (fragmentVectorConstants1.packedValues[131u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[131u].y));
                                                        float scalarValue23 = vectorValue1.x;
                                                        float scalarValue24 = vectorValue1.y;
                                                        float sumValue25 = 0.5 - varyingTexCoord1.z;
                                                        float quotientValue18 = spvNClamp((spvNMax(spvNMin(scalarValue23, scalarValue24), spvNMin(spvNMax(scalarValue23, scalarValue24), vectorValue1.z)) - sumValue25) / ((varyingTexCoord1.z + 0.5) - sumValue25), 0.0, 1.0);
                                                        branchMergedValue66 = 1.0;
                                                        branchMergedValue67 = ((quotientValue18 * quotientValue18) * fragmentVectorConstants1.packedValues[sumValue].w) * (3.0 - (quotientValue18 * 2.0));
#endif
                                                    }
                                                    else
                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                        float intermediateValue104;
                                                        float intermediateValue105;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                        float multiplyAddValue35;
                                                        float intermediateValue81;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                        float branchMergedValue68;
                                                        float branchMergedValue69;
#endif
                                                        if (scalarValue == 25u)
                                                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                            vec4 vectorValue13 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                            float scalarValue70 = vectorValue13.x;
                                                            float scalarValue71 = vectorValue13.y;
                                                            uint productValue115 = productValue55 * 4u;
                                                            uint productValue116 = (productValue55 * 4u) + 2u;
                                                            precise float productValue117 = fragmentScalarConstants1.packedValues[productValue115] * fragmentScalarConstants1.packedValues[productValue116];
                                                            float multiplyAddValue77 = fma(productValue117, 0.5, 0.5);
                                                            float multiplyAddValue78 = fma(-fragmentScalarConstants1.packedValues[productValue116], fragmentScalarConstants1.packedValues[productValue115], multiplyAddValue77);
                                                            float scalarValue72 = spvNMax(spvNMin(vectorValue13.z, spvNMax(scalarValue71, scalarValue70)), spvNMin(scalarValue71, scalarValue70));
                                                            precise float sumValue152 = multiplyAddValue78 - fragmentScalarConstants1.packedValues[productValue115];
                                                            precise float sumValue153 = multiplyAddValue78 + fragmentScalarConstants1.packedValues[productValue115];
                                                            precise float sumValue154 = sumValue153 - sumValue152;
                                                            precise float sumValue155 = scalarValue72 - sumValue152;
                                                            precise float quotientValue53 = 1.0 / sumValue154;
                                                            precise float productValue118 = quotientValue53 * sumValue155;
                                                            float scalarValue114 = spvNClamp(productValue118, 0.0, 1.0);
                                                            precise float productValue119 = scalarValue114 * scalarValue114;
                                                            precise float multiplyAddValue79 = productValue119 * fma(scalarValue114, -2.0, 3.0);
                                                            if (multiplyAddValue79 <= 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                            vec4 vectorValue13 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.x, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.y, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                            float scalarValue70 = vectorValue13.x;
                                                            float scalarValue71 = vectorValue13.y;
                                                            uint productValue39 = productValue32 * 4u;
                                                            uint productValue40 = (productValue32 * 4u) + 2u;
                                                            float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[productValue39] * fragmentScalarConstants1.packedValues[productValue40], 0.5, 0.5);
                                                            float multiplyAddValue51 = fma(-fragmentScalarConstants1.packedValues[productValue40], fragmentScalarConstants1.packedValues[productValue39], multiplyAddValue50);
                                                            float scalarValue72 = spvNMax(spvNMin(vectorValue13.z, spvNMax(scalarValue71, scalarValue70)), spvNMin(scalarValue71, scalarValue70));
                                                            float sumValue63 = fragmentScalarConstants1.packedValues[productValue39] - multiplyAddValue51;
                                                            float quotientValue32 = spvNClamp((1.0 / (sumValue63 + (multiplyAddValue51 + fragmentScalarConstants1.packedValues[productValue39]))) * (sumValue63 + scalarValue72), 0.0, 1.0);
                                                            float multiplyAddValue52 = (quotientValue32 * quotientValue32) * fma(quotientValue32, -2.0, 3.0);
                                                            if (multiplyAddValue52 <= 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                            vec4 vectorValue2 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.x) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.y) + fragmentVectorConstants1.packedValues[128u].y));
                                                            float scalarValue25 = vectorValue2.x;
                                                            float scalarValue26 = vectorValue2.y;
                                                            uint sumValue26 = scalarValue1 + 1u;
                                                            float productValue25 = fragmentVectorConstants1.packedValues[scalarValue1].z * fragmentVectorConstants1.packedValues[scalarValue1].x;
                                                            float productValue26 = (productValue25 * 0.5) + 0.5;
                                                            float scalarValue27 = spvNMax(spvNMin(scalarValue25, scalarValue26), spvNMin(spvNMax(scalarValue25, scalarValue26), vectorValue2.z));
                                                            float productValue27 = fragmentVectorConstants1.packedValues[scalarValue1].x * 2.0;
                                                            float quotientValue19 = spvNClamp((((productValue25 + fragmentVectorConstants1.packedValues[scalarValue1].x) - productValue26) + scalarValue27) / productValue27, 0.0, 1.0);
                                                            float productValue28 = (quotientValue19 * quotientValue19) * (3.0 - (quotientValue19 * 2.0));
                                                            if (!(!(productValue28 <= 0.0)))
#endif
                                                            {
                                                                isFragmentDiscarded = true;
                                                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                            precise float sumValue156 = multiplyAddValue77 - fragmentScalarConstants1.packedValues[productValue115];
                                                            precise float sumValue157 = multiplyAddValue77 + fragmentScalarConstants1.packedValues[productValue115];
                                                            precise float sumValue158 = sumValue157 - sumValue156;
                                                            precise float sumValue159 = scalarValue72 - sumValue156;
                                                            precise float quotientValue54 = 1.0 / sumValue158;
                                                            precise float productValue120 = quotientValue54 * sumValue159;
                                                            float scalarValue115 = spvNClamp(productValue120, 0.0, 1.0);
                                                            precise float productValue121 = scalarValue115 * scalarValue115;
                                                            precise float multiplyAddValue80 = productValue121 * fma(scalarValue115, -2.0, 3.0);
                                                            uint bitwiseValue28 = (((16u * productValue55) + 16u) + 12u) >> 2u;
                                                            precise float bitwiseValue29 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u] - fragmentScalarConstants1.packedValues[bitwiseValue28];
                                                            precise float multiplyAddValue81 = multiplyAddValue79 * fma(multiplyAddValue80, bitwiseValue29, fragmentScalarConstants1.packedValues[bitwiseValue28]);
                                                            intermediateValue104 = multiplyAddValue81;
                                                            intermediateValue105 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                            float sumValue64 = fragmentScalarConstants1.packedValues[productValue39] - multiplyAddValue50;
                                                            float quotientValue33 = spvNClamp((1.0 / (sumValue64 + (multiplyAddValue50 + fragmentScalarConstants1.packedValues[productValue39]))) * (sumValue64 + scalarValue72), 0.0, 1.0);
                                                            uint bitwiseValue18 = (((16u * productValue32) + 16u) + 12u) >> 2u;
                                                            multiplyAddValue35 = multiplyAddValue52 * fma((quotientValue33 * quotientValue33) * fma(quotientValue33, -2.0, 3.0), fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u] - fragmentScalarConstants1.packedValues[bitwiseValue18], fragmentScalarConstants1.packedValues[bitwiseValue18]);
                                                            intermediateValue81 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                            float quotientValue20 = spvNClamp(((fragmentVectorConstants1.packedValues[scalarValue1].x - productValue26) + scalarValue27) / productValue27, 0.0, 1.0);
                                                            branchMergedValue68 = 1.0;
                                                            branchMergedValue69 = ((((quotientValue20 * quotientValue20) * (fragmentVectorConstants1.packedValues[sumValue].w - fragmentVectorConstants1.packedValues[sumValue26].w)) * (3.0 - (quotientValue20 * 2.0))) + fragmentVectorConstants1.packedValues[sumValue26].w) * productValue28;
#endif
                                                        }
                                                        else
                                                        {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                            float multiplyAddValue41;
                                                            float intermediateValue117;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                            float multiplyAddValue39;
                                                            float multiplyAddValue40;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                            float branchMergedValue70;
                                                            float branchMergedValue71;
#endif
                                                            if (scalarValue == 31u)
                                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                vec4 vectorValue14 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.z, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.w, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                                float scalarValue73 = vectorValue14.x;
                                                                float scalarValue74 = vectorValue14.y;
                                                                float scalarValue75 = vectorValue14.z;
                                                                float scalarValue76 = vectorValue14.w;
                                                                float exponentialValue12;
                                                                float exponentialValue13;
                                                                float exponentialValue14;
                                                                if ((productValue69 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                vec4 vectorValue14 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord1.z, fragmentVectorConstants1.packedValues[128u].z, fragmentVectorConstants1.packedValues[128u].x), fma(varyingTexCoord1.w, fragmentVectorConstants1.packedValues[128u].w, fragmentVectorConstants1.packedValues[128u].y)));
                                                                float scalarValue73 = vectorValue14.x;
                                                                float scalarValue74 = vectorValue14.y;
                                                                float scalarValue75 = vectorValue14.z;
                                                                float scalarValue76 = vectorValue14.w;
                                                                float exponentialValue12;
                                                                float exponentialValue13;
                                                                float exponentialValue14;
                                                                if ((productValue35 & 2u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                vec4 vectorValue3 = texture(sampler2D(txBufferTexture, txBufferSampler), vec2((fragmentVectorConstants1.packedValues[128u].z * varyingTexCoord1.z) + fragmentVectorConstants1.packedValues[128u].x, (fragmentVectorConstants1.packedValues[128u].w * varyingTexCoord1.w) + fragmentVectorConstants1.packedValues[128u].y));
                                                                float scalarValue28 = vectorValue3.x;
                                                                float scalarValue29 = vectorValue3.y;
                                                                float scalarValue30 = vectorValue3.z;
                                                                float scalarValue31 = vectorValue3.w;
                                                                float intermediateValue58;
                                                                float intermediateValue59;
                                                                float intermediateValue60;
                                                                if ((sumValue1 & 2u) == 0u)
#endif
                                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                    precise float productValue122 = scalarValue73 * 0.077399380505084991455078125;
                                                                    precise float productValue123 = scalarValue74 * 0.077399380505084991455078125;
                                                                    precise float productValue124 = scalarValue75 * 0.077399380505084991455078125;
                                                                    precise float sumValue160 = scalarValue73 + 0.054999999701976776123046875;
                                                                    precise float sumValue161 = scalarValue74 + 0.054999999701976776123046875;
                                                                    precise float sumValue162 = scalarValue75 + 0.054999999701976776123046875;
                                                                    precise float productValue125 = sumValue160 * 0.947867333889007568359375;
                                                                    precise float productValue126 = sumValue161 * 0.947867333889007568359375;
                                                                    precise float productValue127 = sumValue162 * 0.947867333889007568359375;
                                                                    precise float nonlinearValue27 = log2(productValue125) * 2.400000095367431640625;
                                                                    precise float nonlinearValue28 = log2(productValue126) * 2.400000095367431640625;
                                                                    precise float nonlinearValue29 = log2(productValue127) * 2.400000095367431640625;
                                                                    exponentialValue12 = (scalarValue75 > 0.040449999272823333740234375) ? exp2(nonlinearValue29) : productValue124;
                                                                    exponentialValue13 = (scalarValue74 > 0.040449999272823333740234375) ? exp2(nonlinearValue28) : productValue123;
                                                                    exponentialValue14 = (scalarValue73 > 0.040449999272823333740234375) ? exp2(nonlinearValue27) : productValue122;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                    exponentialValue12 = (scalarValue75 > 0.040449999272823333740234375) ? exp2(log2((scalarValue75 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue75 * 0.077399380505084991455078125);
                                                                    exponentialValue13 = (scalarValue74 > 0.040449999272823333740234375) ? exp2(log2((scalarValue74 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue74 * 0.077399380505084991455078125);
                                                                    exponentialValue14 = (scalarValue73 > 0.040449999272823333740234375) ? exp2(log2((scalarValue73 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625) : (scalarValue73 * 0.077399380505084991455078125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                    float branchMergedValue12;
                                                                    float branchMergedValue26;
                                                                    float branchMergedValue27;
                                                                    if ((sumValue1 & 16u) == 0u)
                                                                    {
                                                                        branchMergedValue12 = scalarValue30;
                                                                        branchMergedValue26 = scalarValue29;
                                                                        branchMergedValue27 = scalarValue28;
                                                                    }
                                                                    else
                                                                    {
                                                                        float exponentialValue16;
                                                                        if (!(scalarValue28 <= 0.003130800090730190277099609375))
                                                                        {
                                                                            exponentialValue16 = (exp2(log2(scalarValue28) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                                        }
                                                                        else
                                                                        {
                                                                            exponentialValue16 = scalarValue28 * 12.9200000762939453125;
                                                                        }
                                                                        float exponentialValue18;
                                                                        if (!(scalarValue29 <= 0.003130800090730190277099609375))
                                                                        {
                                                                            exponentialValue18 = (exp2(log2(scalarValue29) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                                        }
                                                                        else
                                                                        {
                                                                            exponentialValue18 = scalarValue29 * 12.9200000762939453125;
                                                                        }
                                                                        float branchMergedValue37;
                                                                        float branchMergedValue42;
                                                                        float branchMergedValue43;
                                                                        if (!(scalarValue30 <= 0.003130800090730190277099609375))
                                                                        {
                                                                            branchMergedValue37 = (exp2(log2(scalarValue30) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
                                                                            branchMergedValue42 = exponentialValue18;
                                                                            branchMergedValue43 = exponentialValue16;
                                                                        }
                                                                        else
                                                                        {
                                                                            branchMergedValue37 = scalarValue30 * 12.9200000762939453125;
                                                                            branchMergedValue42 = exponentialValue18;
                                                                            branchMergedValue43 = exponentialValue16;
                                                                        }
                                                                        branchMergedValue12 = branchMergedValue37;
                                                                        branchMergedValue26 = branchMergedValue42;
                                                                        branchMergedValue27 = branchMergedValue43;
                                                                    }
                                                                    intermediateValue58 = branchMergedValue27;
                                                                    intermediateValue59 = branchMergedValue26;
                                                                    intermediateValue60 = branchMergedValue12;
#endif
                                                                }
                                                                else
                                                                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                    float multiplyAddValue43;
                                                                    float multiplyAddValue44;
                                                                    float multiplyAddValue45;
                                                                    if ((productValue69 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                    float multiplyAddValue41;
                                                                    float multiplyAddValue42;
                                                                    float multiplyAddValue43;
                                                                    if ((productValue35 & 16u) != 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                    float exponentialValue15;
                                                                    if (!(scalarValue28 <= 0.040449999272823333740234375))
#endif
                                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                        precise float productValue128 = scalarValue73 * 12.9200000762939453125;
                                                                        precise float productValue129 = scalarValue74 * 12.9200000762939453125;
                                                                        precise float productValue130 = scalarValue75 * 12.9200000762939453125;
                                                                        precise float nonlinearValue30 = log2(scalarValue73) * 0.4166666567325592041015625;
                                                                        precise float nonlinearValue31 = log2(scalarValue74) * 0.4166666567325592041015625;
                                                                        precise float nonlinearValue32 = log2(scalarValue75) * 0.4166666567325592041015625;
                                                                        multiplyAddValue45 = (scalarValue73 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue30), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue128;
                                                                        multiplyAddValue44 = (scalarValue74 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue31), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue129;
                                                                        multiplyAddValue43 = (scalarValue75 > 0.003130800090730190277099609375) ? fma(exp2(nonlinearValue32), 1.05499994754791259765625, -0.054999999701976776123046875) : productValue130;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                        multiplyAddValue43 = (scalarValue73 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue73) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue73 * 12.9200000762939453125);
                                                                        multiplyAddValue42 = (scalarValue74 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue74) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue74 * 12.9200000762939453125);
                                                                        multiplyAddValue41 = (scalarValue75 > 0.003130800090730190277099609375) ? fma(exp2(log2(scalarValue75) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875) : (scalarValue75 * 12.9200000762939453125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                        exponentialValue15 = exp2(log2((scalarValue28 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
#endif
                                                                    }
                                                                    else
                                                                    {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                        multiplyAddValue45 = scalarValue73;
                                                                        multiplyAddValue44 = scalarValue74;
                                                                        multiplyAddValue43 = scalarValue75;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                        multiplyAddValue43 = scalarValue73;
                                                                        multiplyAddValue42 = scalarValue74;
                                                                        multiplyAddValue41 = scalarValue75;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                        exponentialValue15 = scalarValue28 * 0.077399380505084991455078125;
#endif
                                                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                    exponentialValue12 = multiplyAddValue43;
                                                                    exponentialValue13 = multiplyAddValue44;
                                                                    exponentialValue14 = multiplyAddValue45;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                    exponentialValue12 = multiplyAddValue41;
                                                                    exponentialValue13 = multiplyAddValue42;
                                                                    exponentialValue14 = multiplyAddValue43;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                    float exponentialValue17;
                                                                    if (!(scalarValue29 <= 0.040449999272823333740234375))
                                                                    {
                                                                        exponentialValue17 = exp2(log2((scalarValue29 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                                    }
                                                                    else
                                                                    {
                                                                        exponentialValue17 = scalarValue29 * 0.077399380505084991455078125;
                                                                    }
                                                                    float branchMergedValue13;
                                                                    float branchMergedValue28;
                                                                    float branchMergedValue29;
                                                                    if (!(scalarValue30 <= 0.040449999272823333740234375))
                                                                    {
                                                                        branchMergedValue13 = exp2(log2((scalarValue30 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                                                                        branchMergedValue28 = exponentialValue17;
                                                                        branchMergedValue29 = exponentialValue15;
                                                                    }
                                                                    else
                                                                    {
                                                                        branchMergedValue13 = scalarValue30 * 0.077399380505084991455078125;
                                                                        branchMergedValue28 = exponentialValue17;
                                                                        branchMergedValue29 = exponentialValue15;
                                                                    }
                                                                    intermediateValue58 = branchMergedValue29;
                                                                    intermediateValue59 = branchMergedValue28;
                                                                    intermediateValue60 = branchMergedValue13;
#endif
                                                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                precise float sumValue163 = 1.0 - scalarValue76;
                                                                precise float sumValue164 = scalarValue76 - sumValue163;
                                                                float scalarValue77 = rdDot3Precise(vec3(exponentialValue14, exponentialValue13, exponentialValue12), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                                                float scalarValue78 = spvNClamp(scalarValue77, 0.0, 1.0);
                                                                precise float multiplyAddValue82 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 0u) >> 2u], sumValue164, sumValue163) - scalarValue78;
                                                                float multiplyAddValue83 = fma(fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 8u) >> 2u], multiplyAddValue82, scalarValue78);
                                                                precise float sumValue165 = 1.0 - multiplyAddValue83;
                                                                precise float sumValue166 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                                precise float sumValue167 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                                vec2 vectorValue27 = vec2(sumValue166, sumValue167);
                                                                float scalarValue116 = rdDot2Precise2(vectorValue27, vectorValue27);
                                                                precise float nonlinearValue33 = sqrt(scalarValue116) - varyingTexCoord2.z;
                                                                precise float multiplyAddValue84 = spvNClamp(fma(-spvNMin(fragmentScalarConstants1.packedValues[productValue55 * 4u], fragmentScalarConstants1.packedValues[(productValue55 * 4u) + 1u]), nonlinearValue33, 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                                                                multiplyAddValue41 = fma(fragmentScalarConstants1.packedValues[(bitwiseValue19 * 4u) + 1u], sumValue165, multiplyAddValue83);
                                                                intermediateValue117 = multiplyAddValue84;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                float scalarValue77 = rdDot3Precise(vec3(exponentialValue14, exponentialValue13, exponentialValue12), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                                                                float scalarValue78 = spvNClamp(scalarValue77, 0.0, 1.0);
                                                                float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 8u) >> 2u], fma(fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 0u) >> 2u], (scalarValue76 - 1.0) + scalarValue76, 1.0 - scalarValue76) - scalarValue78, scalarValue78);
                                                                vec2 sumValue65 = vec2(varyingTexCoord2.x - varyingTexCoord1.x, varyingTexCoord2.y - varyingTexCoord1.y);
                                                                float scalarValue79 = rdDot2Precise2(sumValue65, sumValue65);
                                                                multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[(scalarValue32 * 4u) + 1u], 1.0 - multiplyAddValue53, multiplyAddValue53);
                                                                multiplyAddValue40 = spvNClamp(fma(-spvNMin(fragmentScalarConstants1.packedValues[productValue32 * 4u], fragmentScalarConstants1.packedValues[(productValue32 * 4u) + 1u]), sqrt(scalarValue79) - varyingTexCoord2.z, 0.5), 0.0, 1.0) * fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                float sumValue29 = 1.0 - scalarValue31;
                                                                float productValue29 = spvNClamp(((intermediateValue59 * 0.715200006961822509765625) + (intermediateValue58 * 0.2125999927520751953125)) + (intermediateValue60 * 0.072200000286102294921875), 0.0, 1.0);
                                                                float productValue30 = (((((scalarValue31 - sumValue29) * fragmentVectorConstants1.packedValues[sumValue].x) + sumValue29) - productValue29) * fragmentVectorConstants1.packedValues[sumValue].z) + productValue29;
                                                                float sumValue30 = varyingTexCoord2.x - varyingTexCoord1.x;
                                                                float sumValue31 = varyingTexCoord2.y - varyingTexCoord1.y;
                                                                branchMergedValue70 = spvNClamp(0.5 - (((fragmentVectorConstants1.packedValues[scalarValue1].x < fragmentVectorConstants1.packedValues[scalarValue1].y) ? fragmentVectorConstants1.packedValues[scalarValue1].x : fragmentVectorConstants1.packedValues[scalarValue1].y) * (sqrt((sumValue31 * sumValue31) + (sumValue30 * sumValue30)) - varyingTexCoord2.z)), 0.0, 1.0) * fragmentVectorConstants1.packedValues[sumValue].w;
                                                                branchMergedValue71 = ((1.0 - productValue30) * fragmentVectorConstants1.packedValues[bitwiseValue7].y) + productValue30;
#endif
                                                            }
                                                            else
                                                            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                                multiplyAddValue41 = fragmentScalarConstants1.packedValues[(((16u * bitwiseValue19) + 16u) + 12u) >> 2u];
                                                                intermediateValue117 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                                multiplyAddValue39 = fragmentScalarConstants1.packedValues[(((16u * scalarValue32) + 16u) + 12u) >> 2u];
                                                                multiplyAddValue40 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                                branchMergedValue70 = 1.0;
                                                                branchMergedValue71 = fragmentVectorConstants1.packedValues[sumValue].w;
#endif
                                                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                            intermediateValue104 = multiplyAddValue41;
                                                            intermediateValue105 = intermediateValue117;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                            multiplyAddValue35 = multiplyAddValue39;
                                                            intermediateValue81 = multiplyAddValue40;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                            branchMergedValue68 = branchMergedValue70;
                                                            branchMergedValue69 = branchMergedValue71;
#endif
                                                        }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                        intermediateValue102 = intermediateValue104;
                                                        intermediateValue103 = intermediateValue105;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                        multiplyAddValue34 = multiplyAddValue35;
                                                        intermediateValue80 = intermediateValue81;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                        branchMergedValue66 = branchMergedValue68;
                                                        branchMergedValue67 = branchMergedValue69;
#endif
                                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                    intermediateValue99 = intermediateValue102;
                                                    intermediateValue101 = intermediateValue103;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                    multiplyAddValue32 = multiplyAddValue34;
                                                    intermediateValue79 = intermediateValue80;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                    branchMergedValue64 = branchMergedValue66;
                                                    branchMergedValue65 = branchMergedValue67;
#endif
                                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                                multiplyAddValue35 = intermediateValue99;
                                                intermediateValue100 = intermediateValue101;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                                multiplyAddValue31 = multiplyAddValue32;
                                                multiplyAddValue33 = intermediateValue79;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                                branchMergedValue62 = branchMergedValue64;
                                                branchMergedValue63 = branchMergedValue65;
#endif
                                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                            multiplyAddValue16 = multiplyAddValue35;
                                            intermediateValue69 = intermediateValue100;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                            comparisonValue5 = multiplyAddValue31;
                                            multiplyAddValue18 = multiplyAddValue33;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                            branchMergedValue60 = branchMergedValue62;
                                            branchMergedValue61 = branchMergedValue63;
#endif
                                        }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                        intermediateValue56 = multiplyAddValue16;
                                        intermediateValue58 = intermediateValue69;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                        multiplyAddValue16 = comparisonValue5;
                                        intermediateValue46 = multiplyAddValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                        branchMergedValue58 = branchMergedValue60;
                                        branchMergedValue59 = branchMergedValue61;
#endif
                                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                    bitwiseValue9 = intermediateValue56;
                                    intermediateValue57 = intermediateValue58;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                    bitwiseValue6 = multiplyAddValue16;
                                    productValue9 = intermediateValue46;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                    branchMergedValue55 = branchMergedValue58;
                                    branchMergedValue57 = branchMergedValue59;
#endif
                                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                                intermediateValue52 = bitwiseValue9;
                                intermediateValue54 = intermediateValue57;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                                intermediateValue44 = bitwiseValue6;
                                intermediateValue45 = productValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                branchMergedValue52 = branchMergedValue55;
                                branchMergedValue53 = branchMergedValue57;
#endif
                            }
#if RD_PLATFORM == RD_PLATFORM_SM40
                            intermediateValue51 = intermediateValue52;
                            intermediateValue53 = intermediateValue54;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                            intermediateValue43 = intermediateValue44;
                            multiplyAddValue15 = intermediateValue45;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            branchMergedValue48 = branchMergedValue52;
                            branchMergedValue50 = branchMergedValue53;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM40
                        intermediateValue38 = intermediateValue51;
                        bitwiseValue5 = intermediateValue53;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                        intermediateValue31 = intermediateValue43;
                        bitwiseValue4 = multiplyAddValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        branchMergedValue46 = branchMergedValue48;
                        branchMergedValue47 = branchMergedValue50;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM40
                    bitwiseValue4 = intermediateValue38;
                    intermediateValue27 = bitwiseValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    bitwiseValue3 = intermediateValue31;
                    multiplyAddValue2 = bitwiseValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue44 = branchMergedValue46;
                    branchMergedValue45 = branchMergedValue47;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                bitwiseValue3 = bitwiseValue4;
                multiplyAddValue = intermediateValue27;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                bitwiseValue2 = bitwiseValue3;
                multiplyAddValue = multiplyAddValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue30 = branchMergedValue44;
                branchMergedValue31 = branchMergedValue45;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM40
            bitwiseValue2 = bitwiseValue3;
            intermediateValue18 = multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            bitwiseValue1 = bitwiseValue2;
            productValue3 = multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue4 = branchMergedValue30;
            branchMergedValue7 = branchMergedValue31;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        intermediateValue17 = intermediateValue18;
        bitwiseValue1 = bitwiseValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        nonlinearValue = productValue3;
        bitwiseValue = bitwiseValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        nonlinearValue = branchMergedValue4;
        intermediateValue3 = branchMergedValue7;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    if (((scalarValue == 3u) ? bitwiseValue1 : intermediateValue17) < 0.00390625)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    if (((scalarValue == 3u) ? bitwiseValue : nonlinearValue) < 0.00390625)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (((scalarValue == 3u) ? intermediateValue3 : nonlinearValue) < 0.00390625)
#endif
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = 0.0;
    fragmentColor0.y = 0.0;
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
    discardIfRequested();
}
