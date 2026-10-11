#version 460
#extension GL_GOOGLE_include_directive : require
// VolumetricsShadows / SampleCascadedShadows / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT128
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/VolumetricsShadows/ComputeBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue17 = uint(int(computeVectorConstants0.packedValues[30u].z));
    if (!((int(gl_GlobalInvocationID.z) >= int(scalarValue17)) || ((int(gl_GlobalInvocationID.x) >= int(uint(int(computeVectorConstants0.packedValues[30u].x)))) || (int(gl_GlobalInvocationID.y) >= int(uint(int(computeVectorConstants0.packedValues[30u].y)))))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (!((int(gl_GlobalInvocationID.z) >= int(uint(int(computeVectorConstants0.packedValues[31u].z)))) || ((int(gl_GlobalInvocationID.x) >= int(uint(int(computeVectorConstants0.packedValues[31u].x)))) || (int(gl_GlobalInvocationID.y) >= int(uint(int(computeVectorConstants0.packedValues[31u].y)))))))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float sumValue32 = rdSignedBitsToFloat(gl_GlobalInvocationID.x) + 0.5;
        float sumValue33 = rdSignedBitsToFloat(gl_GlobalInvocationID.y) + 0.5;
        float sumValue34 = rdSignedBitsToFloat(gl_GlobalInvocationID.z) + 0.5;
        float multiplyAddValue8;
        if (uint(int(computeScalarConstants0.packedValues[108u])) == 1u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sumValue = float(int(gl_GlobalInvocationID.x)) + 0.5;
        float sumValue1 = float(int(gl_GlobalInvocationID.y)) + 0.5;
        float sumValue2 = float(int(gl_GlobalInvocationID.z)) + 0.5;
        float quotientValue = (((computeVectorConstants0.packedValues[30u].x + sumValue) / computeVectorConstants0.packedValues[31u].x) * 2.0) + (-1.0);
        float quotientValue1 = (((computeVectorConstants0.packedValues[30u].y + sumValue1) / computeVectorConstants0.packedValues[31u].y) * 2.0) + (-1.0);
        float exponentialValue = (exp2(((computeVectorConstants0.packedValues[30u].z + sumValue2) / computeVectorConstants0.packedValues[31u].z) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625;
        float productValue = (-0.0) - ((exponentialValue * computeVectorConstants0.packedValues[77u].y) + ((1.0 - exponentialValue) * computeVectorConstants0.packedValues[77u].x));
        float multiplyAddValue = (fma(computeVectorConstants0.packedValues[2u].z, productValue, 0.0) + computeVectorConstants0.packedValues[3u].z) / (fma(computeVectorConstants0.packedValues[2u].w, productValue, 0.0) + computeVectorConstants0.packedValues[3u].w);
        float multiplyAddValue1 = fma(computeVectorConstants0.packedValues[18u].w, multiplyAddValue, fma(computeVectorConstants0.packedValues[17u].w, quotientValue1, quotientValue * computeVectorConstants0.packedValues[16u].w)) + computeVectorConstants0.packedValues[19u].w;
        float multiplyAddValue2 = (fma(computeVectorConstants0.packedValues[18u].x, multiplyAddValue, fma(computeVectorConstants0.packedValues[17u].x, quotientValue1, quotientValue * computeVectorConstants0.packedValues[16u].x)) + computeVectorConstants0.packedValues[19u].x) / multiplyAddValue1;
        float multiplyAddValue3 = (fma(computeVectorConstants0.packedValues[18u].y, multiplyAddValue, fma(computeVectorConstants0.packedValues[17u].y, quotientValue1, quotientValue * computeVectorConstants0.packedValues[16u].y)) + computeVectorConstants0.packedValues[19u].y) / multiplyAddValue1;
        float multiplyAddValue4 = (fma(computeVectorConstants0.packedValues[18u].z, multiplyAddValue, fma(computeVectorConstants0.packedValues[17u].z, quotientValue1, quotientValue * computeVectorConstants0.packedValues[16u].z)) + computeVectorConstants0.packedValues[19u].z) / multiplyAddValue1;
        float productValue1;
        if (uint(int(computeVectorConstants0.packedValues[27u].x)) == 1u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue26 = fma((sumValue32 + computeVectorConstants0.packedValues[29u].x) / computeVectorConstants0.packedValues[30u].x, 2.0, -1.0);
            float multiplyAddValue27 = fma((sumValue33 + computeVectorConstants0.packedValues[29u].y) / computeVectorConstants0.packedValues[30u].y, 2.0, -1.0);
            float exponentialValue2 = exp2(((sumValue34 + computeVectorConstants0.packedValues[29u].z) / computeVectorConstants0.packedValues[30u].z) * 5.770780086517333984375);
            float multiplyAddValue28 = -fma(fma(1.0 - exponentialValue2, 0.0186573602259159088134765625, 1.0), computeScalarConstants0.packedValues[304u], ((exponentialValue2 - 1.0) * 0.0186573602259159088134765625) * computeScalarConstants0.packedValues[305u]);
            float multiplyAddValue29 = fma(computeVectorConstants0.packedValues[2u].z, multiplyAddValue28, computeVectorConstants0.packedValues[3u].z) / fma(computeVectorConstants0.packedValues[2u].w, multiplyAddValue28, computeVectorConstants0.packedValues[3u].w);
            float multiplyAddValue30 = fma(computeVectorConstants0.packedValues[18u].w, multiplyAddValue29, fma(computeVectorConstants0.packedValues[16u].w, multiplyAddValue26, multiplyAddValue27 * computeVectorConstants0.packedValues[17u].w)) + computeVectorConstants0.packedValues[19u].w;
            float multiplyAddValue31 = (fma(computeVectorConstants0.packedValues[18u].x, multiplyAddValue29, fma(computeVectorConstants0.packedValues[16u].x, multiplyAddValue26, multiplyAddValue27 * computeVectorConstants0.packedValues[17u].x)) + computeVectorConstants0.packedValues[19u].x) / multiplyAddValue30;
            float multiplyAddValue32 = (fma(computeVectorConstants0.packedValues[18u].y, multiplyAddValue29, fma(computeVectorConstants0.packedValues[16u].y, multiplyAddValue26, multiplyAddValue27 * computeVectorConstants0.packedValues[17u].y)) + computeVectorConstants0.packedValues[19u].y) / multiplyAddValue30;
            float multiplyAddValue33 = (fma(computeVectorConstants0.packedValues[18u].z, multiplyAddValue29, fma(computeVectorConstants0.packedValues[16u].z, multiplyAddValue26, multiplyAddValue27 * computeVectorConstants0.packedValues[17u].z)) + computeVectorConstants0.packedValues[19u].z) / multiplyAddValue30;
            uint scalarValue18 = uint(int(rdDot4Precise(vec4(spvNClamp(computeVectorConstants0.packedValues[31u].x, 0.0, 1.0), spvNClamp(computeVectorConstants0.packedValues[31u].y, 0.0, 1.0), spvNClamp(computeVectorConstants0.packedValues[31u].z, 0.0, 1.0), spvNClamp(computeVectorConstants0.packedValues[31u].w, 0.0, 1.0)), vec4(1.0))));
            bool comparisonValue18 = computeScalarConstants0.packedValues[104u] != 0.0;
            float intermediateValue14;
            intermediateValue14 = 1.0;
            uint sumValue3;
            float intermediateValue15;
            uint intermediateValue17;
            uint scalarValue1 = 0u;
            uint scalarValue2 = 0u;
            for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint dotProductValue = uint(int(dot(vec4(spvNClamp(computeVectorConstants0.packedValues[32u].x, 0.0, 1.0), spvNClamp(computeVectorConstants0.packedValues[32u].y, 0.0, 1.0), spvNClamp(computeVectorConstants0.packedValues[32u].z, 0.0, 1.0), spvNClamp(computeVectorConstants0.packedValues[32u].w, 0.0, 1.0)), vec4(1.0))));
            float intermediateValue;
            if (int(dotProductValue) > int(0u))
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                if (int(scalarValue18) <= int(scalarValue2))
                {
                    break;
                }
                uint comparisonValue19 = uint(min(int(uint(int((scalarValue2 == 3u) ? computeVectorConstants0.packedValues[31u].w : ((scalarValue2 == 2u) ? computeVectorConstants0.packedValues[31u].z : ((scalarValue2 == 1u) ? computeVectorConstants0.packedValues[31u].y : ((scalarValue2 == 0u) ? computeVectorConstants0.packedValues[31u].x : 0.0))))) + scalarValue1), int(8u)));
                intermediateValue15 = intermediateValue14;
                intermediateValue17 = scalarValue1;
                float comparisonValue2;
                uint intermediateValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float intermediateValue1;
                uint intermediateValue7;
                float scalarValue = 1.0;
                uint scalarValue1 = 0u;
                uint scalarValue2 = 0u;
                uint sumValue8;
                bool intermediateValue9;
#endif
                for (;;)
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    if (int(comparisonValue19) <= int(intermediateValue17))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    sumValue8 = uint(min(int(uint(int(computeScalarConstants0.packedValues[scalarValue2 + 128u])) + scalarValue1), int(8u)));
                    intermediateValue9 = int(scalarValue1) < int(sumValue8);
                    float branchMergedValue;
                    uint branchMergedValue5;
                    if (intermediateValue9)
#endif
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        break;
                    }
                    uint bitwiseValue1 = intermediateValue17 << 2u;
                    uint sumValue35 = bitwiseValue1 + 33u;
                    uint sumValue36 = bitwiseValue1 + 32u;
                    uint sumValue37 = bitwiseValue1 + 34u;
                    uint sumValue38 = bitwiseValue1 + 35u;
                    float multiplyAddValue34 = fma(computeVectorConstants0.packedValues[sumValue37].x, multiplyAddValue33, fma(computeVectorConstants0.packedValues[sumValue36].x, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0.packedValues[sumValue35].x)) + computeVectorConstants0.packedValues[sumValue38].x;
                    float multiplyAddValue35 = fma(computeVectorConstants0.packedValues[sumValue37].y, multiplyAddValue33, fma(computeVectorConstants0.packedValues[sumValue36].y, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0.packedValues[sumValue35].y)) + computeVectorConstants0.packedValues[sumValue38].y;
                    float multiplyAddValue36 = fma(computeVectorConstants0.packedValues[sumValue37].z, multiplyAddValue33, fma(computeVectorConstants0.packedValues[sumValue36].z, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0.packedValues[sumValue35].z)) + computeVectorConstants0.packedValues[sumValue38].z;
                    if (((abs(multiplyAddValue34) <= 1.0) && (abs(multiplyAddValue35) <= 1.0)) && (abs(multiplyAddValue36) <= 1.0))
                    {
                        float multiplyAddValue37 = fma(multiplyAddValue34, 0.5, 0.5);
                        uint multiplyAddValue38 = uint(clamp(int(uint(int(fma(computeScalarConstants0.packedValues[(((16u * intermediateValue17) + 128u) + 12u) >> 2u], computeScalarConstants0.packedValues[80u], 0.5)))), int(1u), int(9u)));
                        bool conditionValue = !comparisonValue18;
                        uint comparisonValue20 = (comparisonValue18 ? 1u : multiplyAddValue38) >> 1u;
                        float multiplyAddValue40 = 1.0 - fma(multiplyAddValue35, 0.5, 0.5);
                        float scalarValue19 = rdSignedBitsToFloat(intermediateValue17);
                        float bitwiseValue2 = multiplyAddValue36 - computeScalarConstants0.packedValues[(((16u * intermediateValue17) + 128u) + 4u) >> 2u];
                        float intermediateValue35;
                        intermediateValue35 = 0.0;
                        uint sumValue12;
                        float intermediateValue36;
                        uint scalarValue6 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        float intermediateValue12;
                        uint intermediateValue13;
                        float scalarValue3 = scalarValue;
                        uint scalarValue4 = scalarValue1;
                        float multiplyAddValue22;
                        float multiplyAddValue23;
                        float multiplyAddValue24;
                        bool comparisonValue2;
#endif
                        for (;;)
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            if ((comparisonValue18 && (int(scalarValue6) >= int(1u))) || ((int(multiplyAddValue38) <= int(scalarValue6)) && conditionValue))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            uint bitwiseValue = scalarValue4 << 2u;
                            uint sumValue4 = bitwiseValue + 33u;
                            uint sumValue5 = bitwiseValue + 34u;
                            uint sumValue6 = bitwiseValue + 35u;
                            uint sumValue7 = bitwiseValue + 36u;
                            multiplyAddValue22 = fma(computeVectorConstants0.packedValues[sumValue6].x, multiplyAddValue4, fma(computeVectorConstants0.packedValues[sumValue5].x, multiplyAddValue3, computeVectorConstants0.packedValues[sumValue4].x * multiplyAddValue2)) + computeVectorConstants0.packedValues[sumValue7].x;
                            multiplyAddValue23 = fma(computeVectorConstants0.packedValues[sumValue6].y, multiplyAddValue4, fma(computeVectorConstants0.packedValues[sumValue5].y, multiplyAddValue3, computeVectorConstants0.packedValues[sumValue4].y * multiplyAddValue2)) + computeVectorConstants0.packedValues[sumValue7].y;
                            multiplyAddValue24 = fma(computeVectorConstants0.packedValues[sumValue6].z, multiplyAddValue4, fma(computeVectorConstants0.packedValues[sumValue5].z, multiplyAddValue3, computeVectorConstants0.packedValues[sumValue4].z * multiplyAddValue2)) + computeVectorConstants0.packedValues[sumValue7].z;
                            comparisonValue2 = ((abs(multiplyAddValue22) <= 1.0) && (abs(multiplyAddValue23) <= 1.0)) && (abs(multiplyAddValue24) <= 1.0);
                            float branchMergedValue1;
                            uint branchMergedValue6;
                            if (comparisonValue2)
                            {
                                uint sumValue9 = scalarValue4 + 8u;
                                float sumValue17 = spvNMin(spvNMax(1.0, computeScalarConstants0.packedValues[scalarValue4 + 112u]), 1.0);
                                float nonlinearValue = (sqrt(1.0 - (sumValue17 * sumValue17)) / sumValue17) * computeVectorConstants0.packedValues[sumValue9].z;
                                float productValue2 = (multiplyAddValue22 * 0.5) + 0.5;
                                float productValue3 = 0.5 - (multiplyAddValue23 * 0.5);
                                uint comparisonValue = (computeVectorConstants0.packedValues[26u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int((computeVectorConstants0.packedValues[20u].x * computeVectorConstants0.packedValues[sumValue9].w) + 0.5))), int(1u)))), int(9u)));
                                uint quotientValue2 = uint(int(comparisonValue) / int(2u));
                                float intermediateValue25;
                                if (int(comparisonValue) > int(0u))
                                {
                                    float sumValue19;
                                    float intermediateValue33;
                                    uint intermediateValue34;
                                    float scalarValue5 = 0.0;
                                    uint scalarValue6 = 0u;
                                    for (;;)
                                    {
                                        intermediateValue33 = scalarValue5;
                                        intermediateValue34 = 0u;
                                        float intermediateValue39;
                                        float productValue20;
                                        vec4 sampledTextureValue3;
                                        float intermediateValue35;
                                        float intermediateValue36;
                                        float productValue21;
                                        bool comparisonValue12;
                                        float sumValue24;
                                        for (;;)
                                        {
                                            float productValue4 = (productValue2 + ((float(int(intermediateValue34 - quotientValue2)) + 0.5) * computeVectorConstants0.packedValues[75u].x)) * computeVectorConstants0.packedValues[sumValue9].x;
                                            productValue20 = (productValue3 + (computeVectorConstants0.packedValues[75u].x * (float(int(scalarValue6 - quotientValue2)) + 0.5))) * computeVectorConstants0.packedValues[sumValue9].x;
                                            sampledTextureValue3 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue4, productValue20, float(int(scalarValue4))));
                                            intermediateValue35 = sampledTextureValue3.w;
                                            intermediateValue36 = computeVectorConstants0.packedValues[75u].z;
                                            productValue21 = fract((productValue4 * intermediateValue36) + 0.5);
                                            comparisonValue12 = computeVectorConstants0.packedValues[26u].x != 0.0;
                                            sumValue24 = (multiplyAddValue24 - computeVectorConstants0.packedValues[sumValue9].y) - nonlinearValue;
                                            float branchMergedValue4;
                                            if (comparisonValue12)
                                            {
                                                branchMergedValue4 = float(intermediateValue35 >= sumValue24);
                                            }
                                            else
                                            {
                                                float comparisonValue1 = (sampledTextureValue3.x < sumValue24) ? 0.0 : 1.0;
                                                float comparisonValue7 = (intermediateValue35 < sumValue24) ? 0.0 : 1.0;
                                                float comparisonValue8 = ((((sampledTextureValue3.z < sumValue24) ? 0.0 : 1.0) - comparisonValue7) * productValue21) + comparisonValue7;
                                                branchMergedValue4 = (((((((sampledTextureValue3.y < sumValue24) ? 0.0 : 1.0) - comparisonValue1) * productValue21) + comparisonValue1) - comparisonValue8) * fract((productValue20 * intermediateValue36) + 0.5)) + comparisonValue8;
                                            }
                                            intermediateValue39 = branchMergedValue4;
                                            sumValue19 = intermediateValue39 + intermediateValue33;
                                            uint sumValue20 = intermediateValue34 + 1u;
                                            if (sumValue20 == comparisonValue)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                intermediateValue33 = sumValue19;
                                                intermediateValue34 = sumValue20;
                                                continue;
                                            }
                                        }
                                        uint sumValue21 = scalarValue6 + 1u;
                                        if (sumValue21 == comparisonValue)
                                        {
                                            break;
                                        }
                                        else
                                        {
                                            scalarValue5 = sumValue19;
                                            scalarValue6 = sumValue21;
                                            continue;
                                        }
                                    }
                                    intermediateValue25 = sumValue19;
                                }
                                else
                                {
                                    intermediateValue25 = 0.0;
                                }
                                branchMergedValue1 = spvNMin(scalarValue3, intermediateValue25 / float(int(comparisonValue * comparisonValue)));
                                branchMergedValue6 = sumValue8;
                            }
                            else
                            {
                                branchMergedValue1 = scalarValue3;
                                branchMergedValue6 = scalarValue4 + 1u;
                            }
                            intermediateValue12 = branchMergedValue1;
                            intermediateValue13 = branchMergedValue6;
                            if (int(intermediateValue13) < int(sumValue8))
                            {
                                scalarValue3 = intermediateValue12;
                                scalarValue4 = intermediateValue13;
                                continue;
                            }
                            else
#endif
                            {
                                break;
                            }
#if RD_PLATFORM == RD_PLATFORM_SM50
                            float sumValue39 = rdSignedBitsToFloat(scalarValue6 - comparisonValue20) + 0.5;
                            intermediateValue36 = intermediateValue35;
                            float multiplyAddValue39;
                            uint sumValue18;
                            uint scalarValue9 = 0u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        }
                        branchMergedValue = intermediateValue12;
                        branchMergedValue5 = intermediateValue13;
                    }
                    else
                    {
                        branchMergedValue = scalarValue;
                        branchMergedValue5 = scalarValue1;
                    }
                    intermediateValue1 = branchMergedValue;
                    intermediateValue7 = branchMergedValue5;
                    uint sumValue22 = scalarValue2 + 1u;
                    if (sumValue22 == dotProductValue)
                    {
                        break;
                    }
                    else
                    {
                        scalarValue = intermediateValue1;
                        scalarValue1 = intermediateValue7;
                        scalarValue2 = sumValue22;
                        continue;
                    }
                }
                intermediateValue = intermediateValue1;
            }
            else
            {
                intermediateValue = 1.0;
            }
            float intermediateValue11;
            if (int(uint(int(computeVectorConstants0.packedValues[21u].x))) > int(0u))
            {
                float scalarValue7 = spvNMin(spvNMax(1.0, computeVectorConstants0.packedValues[28u].x), 1.0);
                float multiplyAddValue5 = spvNMin(((computeVectorConstants0.packedValues[73u].z - computeVectorConstants0.packedValues[8u].y) + fma(computeVectorConstants0.packedValues[72u].z, multiplyAddValue4, fma(computeVectorConstants0.packedValues[71u].z, multiplyAddValue3, computeVectorConstants0.packedValues[70u].z * multiplyAddValue2))) - ((sqrt(1.0 - (scalarValue7 * scalarValue7)) / scalarValue7) * computeVectorConstants0.packedValues[8u].z), 1.0);
                float multiplyAddValue6 = (((fma(computeVectorConstants0.packedValues[72u].x, multiplyAddValue4, fma(computeVectorConstants0.packedValues[71u].x, multiplyAddValue3, computeVectorConstants0.packedValues[70u].x * multiplyAddValue2)) + computeVectorConstants0.packedValues[73u].x) * 0.5) + 0.5) * computeVectorConstants0.packedValues[21u].y;
                float multiplyAddValue7 = (0.5 - ((fma(computeVectorConstants0.packedValues[72u].y, multiplyAddValue4, fma(computeVectorConstants0.packedValues[71u].y, multiplyAddValue3, computeVectorConstants0.packedValues[70u].y * multiplyAddValue2)) + computeVectorConstants0.packedValues[73u].y) * 0.5)) * computeVectorConstants0.packedValues[21u].y;
                uint comparisonValue9 = (computeVectorConstants0.packedValues[26u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int((computeVectorConstants0.packedValues[20u].x * 2.0) + 0.5))), int(1u)))), int(9u)));
                uint quotientValue3 = uint(int(comparisonValue9) / int(2u));
                float branchMergedValue7;
                if ((multiplyAddValue7 < computeVectorConstants0.packedValues[21u].y) && (((multiplyAddValue6 >= 0.0) && (multiplyAddValue6 < computeVectorConstants0.packedValues[21u].y)) && (multiplyAddValue7 >= 0.0)))
                {
                    float dotProductValue1 = dot(vec4(computeVectorConstants0.packedValues[32u]), vec4(1.0)) + 1.0;
                    float intermediateValue19;
                    if (int(comparisonValue9) > int(0u))
                    {
                        float sumValue13;
                        float intermediateValue26;
                        uint intermediateValue27;
                        float scalarValue8 = 0.0;
                        uint scalarValue9 = 0u;
                        for (;;)
                        {
                            intermediateValue26 = scalarValue8;
                            intermediateValue27 = 0u;
                            float intermediateValue37;
                            float productValue13;
                            float productValue14;
                            bool comparisonValue4;
#endif
                            for (;;)
                            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                                if ((conditionValue && (int(multiplyAddValue38) <= int(scalarValue9))) || (comparisonValue18 && (int(scalarValue9) >= int(1u))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float productValue5 = computeVectorConstants0.packedValues[21u].y * computeVectorConstants0.packedValues[21u].z;
                                productValue13 = (productValue5 * (float(int(intermediateValue27 - quotientValue3)) + 0.5)) + multiplyAddValue6;
                                productValue14 = (productValue5 * (float(int(scalarValue9 - quotientValue3)) + 0.5)) + multiplyAddValue7;
                                comparisonValue4 = computeVectorConstants0.packedValues[26u].x != 0.0;
                                float branchMergedValue2;
                                if (comparisonValue4)
                                {
                                    branchMergedValue2 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue13, productValue14, dotProductValue1), 0.0).x >= multiplyAddValue5);
                                }
                                else
                                {
                                    vec4 sampledTextureValue = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue13, productValue14, dotProductValue1));
                                    float productValue6 = fract((computeVectorConstants0.packedValues[75u].z * productValue13) + 0.5);
                                    float comparisonValue10 = (sampledTextureValue.x < multiplyAddValue5) ? 0.0 : 1.0;
                                    float comparisonValue11 = (sampledTextureValue.w < multiplyAddValue5) ? 0.0 : 1.0;
                                    float comparisonValue13 = ((((sampledTextureValue.z < multiplyAddValue5) ? 0.0 : 1.0) - comparisonValue11) * productValue6) + comparisonValue11;
                                    branchMergedValue2 = (((((((sampledTextureValue.y < multiplyAddValue5) ? 0.0 : 1.0) - comparisonValue10) * productValue6) + comparisonValue10) - comparisonValue13) * fract((computeVectorConstants0.packedValues[75u].z * productValue14) + 0.5)) + comparisonValue13;
                                }
                                intermediateValue37 = branchMergedValue2;
                                sumValue13 = intermediateValue37 + intermediateValue26;
                                uint sumValue23 = intermediateValue27 + 1u;
                                if (sumValue23 == comparisonValue9)
#endif
                                {
                                    break;
                                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                                uint bitwiseValue3 = (((16u * intermediateValue17) + 128u) + 0u) >> 2u;
                                float multiplyAddValue41 = fma(multiplyAddValue37, computeScalarConstants0.packedValues[bitwiseValue3], ((rdSignedBitsToFloat(scalarValue9 - comparisonValue20) + 0.5) * computeScalarConstants0.packedValues[296u]) * computeScalarConstants0.packedValues[bitwiseValue3]);
                                float multiplyAddValue42 = fma(multiplyAddValue40, computeScalarConstants0.packedValues[bitwiseValue3], (sumValue39 * computeScalarConstants0.packedValues[296u]) * computeScalarConstants0.packedValues[bitwiseValue3]);
                                vec4 sampledTextureValue6 = textureGather(sampler2DArray(materialTexture1, textureSampler1), vec3(multiplyAddValue41, multiplyAddValue42, scalarValue19));
                                float multiplyAddValue43 = fract(fma(multiplyAddValue41, computeScalarConstants0.packedValues[298u], 0.5));
                                bool comparisonValue21 = sampledTextureValue6.w >= bitwiseValue2;
                                bool comparisonValue22 = sampledTextureValue6.x >= bitwiseValue2;
                                float comparisonValue23 = float(sampledTextureValue6.y >= bitwiseValue2);
                                float comparisonValue24 = float(sampledTextureValue6.z >= bitwiseValue2);
                                float multiplyAddValue44 = fma(multiplyAddValue43, comparisonValue21 ? (comparisonValue24 - 1.0) : comparisonValue24, float(comparisonValue21));
                                multiplyAddValue39 = comparisonValue18 ? (comparisonValue21 ? (intermediateValue36 + 1.0) : intermediateValue36) : (intermediateValue36 + fma(fract(fma(multiplyAddValue42, computeScalarConstants0.packedValues[298u], 0.5)), fma(multiplyAddValue43, comparisonValue22 ? (comparisonValue23 - 1.0) : comparisonValue23, float(comparisonValue22)) - multiplyAddValue44, multiplyAddValue44));
                                sumValue18 = scalarValue9 + 1u;
                                intermediateValue36 = multiplyAddValue39;
                                scalarValue9 = sumValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                else
                                {
                                    intermediateValue26 = sumValue13;
                                    intermediateValue27 = sumValue23;
                                    continue;
                                }
                            }
                            uint sumValue25 = scalarValue9 + 1u;
                            if (sumValue25 == comparisonValue9)
                            {
                                break;
                            }
                            else
                            {
                                scalarValue8 = sumValue13;
                                scalarValue9 = sumValue25;
#endif
                                continue;
                            }
#if RD_PLATFORM == RD_PLATFORM_SM50
                            sumValue12 = scalarValue6 + 1u;
                            intermediateValue35 = intermediateValue36;
                            scalarValue6 = sumValue12;
                            continue;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        intermediateValue21 = comparisonValue19;
                        comparisonValue2 = spvNMin(intermediateValue35 / rdSignedBitsToFloat(comparisonValue18 ? 1u : (multiplyAddValue38 * multiplyAddValue38)), intermediateValue15);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        intermediateValue19 = sumValue13;
#endif
                    }
                    else
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        intermediateValue21 = intermediateValue17 + 1u;
                        comparisonValue2 = intermediateValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        intermediateValue19 = 0.0;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue15 = comparisonValue2;
                    intermediateValue17 = intermediateValue21;
                    continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue7 = intermediateValue19 / float(int(comparisonValue9 * comparisonValue9));
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                sumValue3 = scalarValue2 + 1u;
                intermediateValue14 = intermediateValue15;
                scalarValue1 = intermediateValue17;
                scalarValue2 = sumValue3;
                continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                else
                {
                    branchMergedValue7 = 1.0;
                }
                intermediateValue11 = branchMergedValue7;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float intermediateValue22;
            if (int(uint(int(computeScalarConstants0.packedValues[84u]))) > int(0u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            else
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float multiplyAddValue45 = fma(fma(computeVectorConstants0.packedValues[71u].x, multiplyAddValue33, fma(computeVectorConstants0.packedValues[69u].x, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0.packedValues[70u].x)) + computeVectorConstants0.packedValues[72u].x, 0.5, 0.5) * computeScalarConstants0.packedValues[85u];
                float multiplyAddValue46 = (1.0 - fma(fma(computeVectorConstants0.packedValues[71u].y, multiplyAddValue33, fma(computeVectorConstants0.packedValues[69u].y, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0.packedValues[70u].y)) + computeVectorConstants0.packedValues[72u].y, 0.5, 0.5)) * computeScalarConstants0.packedValues[85u];
                float comparisonValue3;
                if ((((multiplyAddValue45 >= 0.0) && (multiplyAddValue45 < computeScalarConstants0.packedValues[85u])) && (multiplyAddValue46 >= 0.0)) && (multiplyAddValue46 < computeScalarConstants0.packedValues[85u]))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue11 = 1.0;
            }
            float intermediateValue15;
            if ((int(uint(int(computeVectorConstants0.packedValues[69u].x))) > int(0u)) && (int(uint(int(computeVectorConstants0.packedValues[27u].y))) > int(0u)))
            {
                float multiplyAddValue9 = fma(computeVectorConstants0.packedValues[67u].w, multiplyAddValue4, fma(computeVectorConstants0.packedValues[66u].w, multiplyAddValue3, computeVectorConstants0.packedValues[65u].w * multiplyAddValue2)) + computeVectorConstants0.packedValues[68u].w;
                float scalarValue10 = spvNMin(spvNMax(1.0, computeVectorConstants0.packedValues[28u].x), 1.0);
                float multiplyAddValue10 = (((fma(computeVectorConstants0.packedValues[67u].z, multiplyAddValue4, fma(computeVectorConstants0.packedValues[66u].z, multiplyAddValue3, computeVectorConstants0.packedValues[65u].z * multiplyAddValue2)) + computeVectorConstants0.packedValues[68u].z) / multiplyAddValue9) - computeVectorConstants0.packedValues[8u].y) - ((sqrt(1.0 - (scalarValue10 * scalarValue10)) / scalarValue10) * computeVectorConstants0.packedValues[8u].z);
                float multiplyAddValue11 = (((fma(computeVectorConstants0.packedValues[67u].x, multiplyAddValue4, fma(computeVectorConstants0.packedValues[66u].x, multiplyAddValue3, computeVectorConstants0.packedValues[65u].x * multiplyAddValue2)) + computeVectorConstants0.packedValues[68u].x) / multiplyAddValue9) * 0.5) + 0.5;
                float multiplyAddValue12 = 0.5 - (((fma(computeVectorConstants0.packedValues[67u].y, multiplyAddValue4, fma(computeVectorConstants0.packedValues[66u].y, multiplyAddValue3, computeVectorConstants0.packedValues[65u].y * multiplyAddValue2)) + computeVectorConstants0.packedValues[68u].y) / multiplyAddValue9) * 0.5);
                uint comparisonValue14 = (computeVectorConstants0.packedValues[26u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int((computeVectorConstants0.packedValues[20u].x * computeVectorConstants0.packedValues[74u].z) + 0.5))), int(1u)))), int(9u)));
                uint quotientValue4 = uint(int(comparisonValue14) / int(2u));
                float dotProductValue2 = dot(vec4(computeVectorConstants0.packedValues[32u]), vec4(1.0));
                float intermediateValue20;
                if (int(comparisonValue14) > int(0u))
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    float multiplyAddValue47 = spvNMin((fma(computeVectorConstants0.packedValues[71u].z, multiplyAddValue33, fma(computeVectorConstants0.packedValues[69u].z, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0.packedValues[70u].z)) + computeVectorConstants0.packedValues[72u].z) - computeScalarConstants0.packedValues[33u], 1.0);
                    uint multiplyAddValue48 = uint(clamp(int(uint(int(fma(computeScalarConstants0.packedValues[80u], 2.0, 0.5)))), int(1u), int(9u)));
                    bool conditionValue1 = !comparisonValue18;
                    uint comparisonValue25 = (comparisonValue18 ? 1u : multiplyAddValue48) >> 1u;
                    float sumValue40 = rdDot4Precise(computeVectorConstants0.packedValues[31u], vec4(1.0)) + 1.0;
                    float intermediateValue27;
                    intermediateValue27 = 0.0;
                    uint sumValue10;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float sumValue14;
#endif
                    float intermediateValue28;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    uint intermediateValue29;
                    float scalarValue11 = 0.0;
#endif
                    uint scalarValue12 = 0u;
                    for (;;)
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        if ((comparisonValue18 && (int(scalarValue12) >= int(1u))) || (conditionValue1 && (int(multiplyAddValue48) <= int(scalarValue12))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        intermediateValue28 = scalarValue11;
                        intermediateValue29 = 0u;
                        float intermediateValue38;
                        vec4 intermediateValue30;
                        float productValue15;
                        float productValue16;
                        bool comparisonValue5;
                        for (;;)
                        {
                            intermediateValue30 = computeVectorConstants0.packedValues[75u];
                            productValue15 = (multiplyAddValue11 + ((float(int(intermediateValue29 - quotientValue4)) + 0.5) * intermediateValue30.x)) * computeVectorConstants0.packedValues[8u].x;
                            productValue16 = (multiplyAddValue12 + (intermediateValue30.x * (float(int(scalarValue12 - quotientValue4)) + 0.5))) * computeVectorConstants0.packedValues[8u].x;
                            comparisonValue5 = computeVectorConstants0.packedValues[26u].x != 0.0;
                            float branchMergedValue3;
                            if (comparisonValue5)
                            {
                                branchMergedValue3 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue15, productValue16, dotProductValue2), 0.0).x >= multiplyAddValue10);
                            }
                            else
                            {
                                vec4 sampledTextureValue4 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue15, productValue16, dotProductValue2));
                                float productValue7 = fract((productValue15 * intermediateValue30.z) + 0.5);
                                float comparisonValue15 = (sampledTextureValue4.x < multiplyAddValue10) ? 0.0 : 1.0;
                                float comparisonValue16 = (sampledTextureValue4.w < multiplyAddValue10) ? 0.0 : 1.0;
                                float comparisonValue17 = ((((sampledTextureValue4.z < multiplyAddValue10) ? 0.0 : 1.0) - comparisonValue16) * productValue7) + comparisonValue16;
                                branchMergedValue3 = (((((((sampledTextureValue4.y < multiplyAddValue10) ? 0.0 : 1.0) - comparisonValue15) * productValue7) + comparisonValue15) - comparisonValue17) * fract((productValue16 * intermediateValue30.z) + 0.5)) + comparisonValue17;
                            }
                            intermediateValue38 = branchMergedValue3;
                            sumValue14 = intermediateValue38 + intermediateValue28;
                            uint sumValue26 = intermediateValue29 + 1u;
                            if (sumValue26 == comparisonValue14)
                            {
                                break;
                            }
                            else
                            {
                                intermediateValue28 = sumValue14;
                                intermediateValue29 = sumValue26;
                                continue;
                            }
                        }
                        uint sumValue27 = scalarValue12 + 1u;
                        if (sumValue27 == comparisonValue14)
#endif
                        {
                            break;
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        float sumValue41 = rdSignedBitsToFloat(scalarValue12 - comparisonValue25) + 0.5;
                        intermediateValue28 = intermediateValue27;
                        uint sumValue15;
                        float sampledTextureValue1;
                        uint scalarValue20 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        else
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            if ((conditionValue1 && (int(multiplyAddValue48) <= int(scalarValue20))) || (comparisonValue18 && (int(scalarValue20) >= int(1u))))
                            {
                                break;
                            }
                            float multiplyAddValue49 = fma((rdSignedBitsToFloat(scalarValue20 - comparisonValue25) + 0.5) * computeScalarConstants0.packedValues[86u], computeScalarConstants0.packedValues[85u], multiplyAddValue45);
                            float multiplyAddValue50 = fma(sumValue41 * computeScalarConstants0.packedValues[86u], computeScalarConstants0.packedValues[85u], multiplyAddValue46);
                            if (comparisonValue18)
                            {
                                sampledTextureValue1 = (textureLod(sampler2DArray(materialTexture1, textureSampler1), vec3(multiplyAddValue49, multiplyAddValue50, sumValue40), 0.0).x >= multiplyAddValue47) ? (intermediateValue28 + 1.0) : intermediateValue28;
                            }
                            else
                            {
                                vec4 sampledTextureValue7 = textureGather(sampler2DArray(materialTexture1, textureSampler1), vec3(multiplyAddValue49, multiplyAddValue50, sumValue40));
                                float multiplyAddValue51 = fract(fma(multiplyAddValue49, computeScalarConstants0.packedValues[298u], 0.5));
                                bool comparisonValue26 = sampledTextureValue7.x >= multiplyAddValue47;
                                bool comparisonValue27 = sampledTextureValue7.w >= multiplyAddValue47;
                                float comparisonValue28 = float(sampledTextureValue7.y >= multiplyAddValue47);
                                float comparisonValue29 = float(sampledTextureValue7.z >= multiplyAddValue47);
                                float multiplyAddValue52 = fma(multiplyAddValue51, comparisonValue27 ? (comparisonValue29 - 1.0) : comparisonValue29, float(comparisonValue27));
                                sampledTextureValue1 = fma(fract(fma(multiplyAddValue50, computeScalarConstants0.packedValues[298u], 0.5)), fma(multiplyAddValue51, comparisonValue26 ? (comparisonValue28 - 1.0) : comparisonValue28, float(comparisonValue26)) - multiplyAddValue52, multiplyAddValue52) + intermediateValue28;
                            }
                            sumValue15 = scalarValue20 + 1u;
                            intermediateValue28 = sampledTextureValue1;
                            scalarValue20 = sumValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            scalarValue11 = sumValue14;
                            scalarValue12 = sumValue27;
#endif
                            continue;
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        sumValue10 = scalarValue12 + 1u;
                        intermediateValue27 = intermediateValue28;
                        scalarValue12 = sumValue10;
                        continue;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    comparisonValue3 = intermediateValue27 / rdSignedBitsToFloat(comparisonValue18 ? 1u : (multiplyAddValue48 * multiplyAddValue48));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    intermediateValue20 = sumValue14;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    comparisonValue3 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    intermediateValue20 = 0.0;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue22 = comparisonValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float quotientValue5 = intermediateValue20 / float(int(comparisonValue14 * comparisonValue14));
                float branchMergedValue8;
                if (quotientValue5 < 1.0)
                {
                    branchMergedValue8 = spvNMin(1.0, spvNMax(quotientValue5, 1.0 - computeVectorConstants0.packedValues[74u].w));
                }
                else
                {
                    branchMergedValue8 = 1.0;
                }
                intermediateValue15 = branchMergedValue8;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue22 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue15 = 1.0;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float comparisonValue6;
            if ((int(uint(int(computeScalarConstants0.packedValues[272u]))) > int(0u)) && (int(uint(int(computeScalarConstants0.packedValues[109u]))) > int(0u)))
            {
                float multiplyAddValue53 = fma(computeVectorConstants0.packedValues[66u].w, multiplyAddValue33, fma(computeVectorConstants0.packedValues[64u].w, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0.packedValues[65u].w)) + computeVectorConstants0.packedValues[67u].w;
                float multiplyAddValue54 = ((fma(computeVectorConstants0.packedValues[66u].z, multiplyAddValue33, fma(computeVectorConstants0.packedValues[64u].z, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0.packedValues[65u].z)) + computeVectorConstants0.packedValues[67u].z) / multiplyAddValue53) - (computeScalarConstants0.packedValues[33u] / (multiplyAddValue53 / multiplyAddValue53));
                float multiplyAddValue55 = fma((fma(computeVectorConstants0.packedValues[66u].x, multiplyAddValue33, fma(computeVectorConstants0.packedValues[64u].x, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0.packedValues[65u].x)) + computeVectorConstants0.packedValues[67u].x) / multiplyAddValue53, 0.5, 0.5);
                float multiplyAddValue56 = 1.0 - fma((fma(computeVectorConstants0.packedValues[66u].y, multiplyAddValue33, fma(computeVectorConstants0.packedValues[64u].y, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0.packedValues[65u].y)) + computeVectorConstants0.packedValues[67u].y) / multiplyAddValue53, 0.5, 0.5);
                uint multiplyAddValue57 = uint(clamp(int(uint(int(fma(computeScalarConstants0.packedValues[294u], computeScalarConstants0.packedValues[80u], 0.5)))), int(1u), int(9u)));
                bool conditionValue2 = !comparisonValue18;
                uint comparisonValue30 = (comparisonValue18 ? 1u : multiplyAddValue57) >> 1u;
                float scalarValue21 = rdDot4Precise(computeVectorConstants0.packedValues[31u], vec4(1.0));
                float intermediateValue30;
                intermediateValue30 = 0.0;
                uint sumValue11;
                float intermediateValue31;
                uint scalarValue22 = 0u;
                for (;;)
                {
                    if ((conditionValue2 && (int(multiplyAddValue57) <= int(scalarValue22))) || (comparisonValue18 && (int(scalarValue22) >= int(1u))))
                    {
                        break;
                    }
                    float sumValue42 = rdSignedBitsToFloat(scalarValue22 - comparisonValue30) + 0.5;
                    intermediateValue31 = intermediateValue30;
                    uint sumValue16;
                    float sampledTextureValue2;
                    uint scalarValue23 = 0u;
                    for (;;)
                    {
                        if ((comparisonValue18 && (int(scalarValue23) >= int(1u))) || (conditionValue2 && (int(multiplyAddValue57) <= int(scalarValue23))))
                        {
                            break;
                        }
                        float multiplyAddValue58 = fma(multiplyAddValue55, computeScalarConstants0.packedValues[32u], ((rdSignedBitsToFloat(scalarValue23 - comparisonValue30) + 0.5) * computeScalarConstants0.packedValues[296u]) * computeScalarConstants0.packedValues[32u]);
                        float multiplyAddValue59 = fma(multiplyAddValue56, computeScalarConstants0.packedValues[32u], (sumValue42 * computeScalarConstants0.packedValues[296u]) * computeScalarConstants0.packedValues[32u]);
                        if (comparisonValue18)
                        {
                            sampledTextureValue2 = (textureLod(sampler2DArray(materialTexture1, textureSampler1), vec3(multiplyAddValue58, multiplyAddValue59, scalarValue21), 0.0).x >= multiplyAddValue54) ? (intermediateValue31 + 1.0) : intermediateValue31;
                        }
                        else
                        {
                            vec4 sampledTextureValue8 = textureGather(sampler2DArray(materialTexture1, textureSampler1), vec3(multiplyAddValue58, multiplyAddValue59, scalarValue21));
                            float multiplyAddValue60 = fract(fma(multiplyAddValue58, computeScalarConstants0.packedValues[298u], 0.5));
                            bool comparisonValue31 = sampledTextureValue8.x >= multiplyAddValue54;
                            bool comparisonValue32 = sampledTextureValue8.w >= multiplyAddValue54;
                            float comparisonValue33 = float(sampledTextureValue8.y >= multiplyAddValue54);
                            float comparisonValue34 = float(sampledTextureValue8.z >= multiplyAddValue54);
                            float multiplyAddValue61 = fma(multiplyAddValue60, comparisonValue32 ? (comparisonValue34 - 1.0) : comparisonValue34, float(comparisonValue32));
                            sampledTextureValue2 = intermediateValue31 + fma(fract(fma(multiplyAddValue59, computeScalarConstants0.packedValues[298u], 0.5)), fma(multiplyAddValue60, comparisonValue31 ? (comparisonValue33 - 1.0) : comparisonValue33, float(comparisonValue31)) - multiplyAddValue61, multiplyAddValue61);
                        }
                        sumValue16 = scalarValue23 + 1u;
                        intermediateValue31 = sampledTextureValue2;
                        scalarValue23 = sumValue16;
                        continue;
                    }
                    sumValue11 = scalarValue22 + 1u;
                    intermediateValue30 = intermediateValue31;
                    scalarValue22 = sumValue11;
                    continue;
                }
                float comparisonValue35 = intermediateValue30 / rdSignedBitsToFloat(comparisonValue18 ? 1u : (multiplyAddValue57 * multiplyAddValue57));
                comparisonValue6 = (comparisonValue35 < 1.0) ? spvNMin(spvNMax(1.0 - computeScalarConstants0.packedValues[295u], comparisonValue35), 1.0) : 1.0;
            }
            else
            {
                comparisonValue6 = 1.0;
            }
            float scalarValue24 = spvNMin(spvNMin(comparisonValue6, intermediateValue22), intermediateValue14);
            float productValue22 = spvNMax(computeScalarConstants0.packedValues[297u] - spvNMin(computeScalarConstants0.packedValues[297u] * 0.100000001490116119384765625, 8.0), 0.0);
            float quotientValue9 = spvNClamp((1.0 / (computeScalarConstants0.packedValues[297u] - productValue22)) * (-productValue22), 0.0, 1.0);
            multiplyAddValue8 = fma((quotientValue9 * quotientValue9) * fma(quotientValue9, -2.0, 3.0), 1.0 - scalarValue24, scalarValue24);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float scalarValue13 = spvNMin(intermediateValue, spvNMin(intermediateValue11, intermediateValue15));
            float productValue8 = spvNMax(0.0, computeVectorConstants0.packedValues[75u].y - spvNMin(computeVectorConstants0.packedValues[75u].y * 0.100000001490116119384765625, 8.0));
            float quotientValue6 = spvNClamp(((-0.0) - productValue8) / (computeVectorConstants0.packedValues[75u].y - productValue8), 0.0, 1.0);
            productValue1 = (((quotientValue6 * quotientValue6) * (1.0 - scalarValue13)) * (3.0 - (quotientValue6 * 2.0))) + scalarValue13;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue8 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue1 = 1.0;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (computeScalarConstants0.packedValues[300u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        if (computeVectorConstants0.packedValues[76u].x != 0.0)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue62 = fma(sumValue32 / computeVectorConstants0.packedValues[30u].x, 2.0, -1.0);
            float multiplyAddValue63 = fma(sumValue33 / computeVectorConstants0.packedValues[30u].y, 2.0, -1.0);
            float exponentialValue3 = exp2((sumValue34 / computeVectorConstants0.packedValues[30u].z) * 5.770780086517333984375);
            float multiplyAddValue64 = -fma(fma(1.0 - exponentialValue3, 0.0186573602259159088134765625, 1.0), computeScalarConstants0.packedValues[304u], ((exponentialValue3 - 1.0) * 0.0186573602259159088134765625) * computeScalarConstants0.packedValues[305u]);
            float multiplyAddValue65 = fma(computeVectorConstants0.packedValues[2u].z, multiplyAddValue64, computeVectorConstants0.packedValues[3u].z) / fma(computeVectorConstants0.packedValues[2u].w, multiplyAddValue64, computeVectorConstants0.packedValues[3u].w);
            float multiplyAddValue66 = fma(computeVectorConstants0.packedValues[18u].w, multiplyAddValue65, fma(computeVectorConstants0.packedValues[16u].w, multiplyAddValue62, multiplyAddValue63 * computeVectorConstants0.packedValues[17u].w)) + computeVectorConstants0.packedValues[19u].w;
            float multiplyAddValue67 = ((fma(computeVectorConstants0.packedValues[18u].x, multiplyAddValue65, fma(computeVectorConstants0.packedValues[16u].x, multiplyAddValue62, multiplyAddValue63 * computeVectorConstants0.packedValues[17u].x)) + computeVectorConstants0.packedValues[19u].x) / multiplyAddValue66) - computeVectorConstants0.packedValues[28u].x;
            float multiplyAddValue68 = ((fma(computeVectorConstants0.packedValues[18u].y, multiplyAddValue65, fma(computeVectorConstants0.packedValues[16u].y, multiplyAddValue62, multiplyAddValue63 * computeVectorConstants0.packedValues[17u].y)) + computeVectorConstants0.packedValues[19u].y) / multiplyAddValue66) - computeVectorConstants0.packedValues[28u].y;
            float multiplyAddValue69 = ((fma(computeVectorConstants0.packedValues[18u].z, multiplyAddValue65, fma(computeVectorConstants0.packedValues[16u].z, multiplyAddValue62, multiplyAddValue63 * computeVectorConstants0.packedValues[17u].z)) + computeVectorConstants0.packedValues[19u].z) / multiplyAddValue66) - computeVectorConstants0.packedValues[28u].z;
            float multiplyAddValue70 = fma(computeVectorConstants0.packedValues[24u].w, multiplyAddValue69, fma(computeVectorConstants0.packedValues[22u].w, multiplyAddValue67, multiplyAddValue68 * computeVectorConstants0.packedValues[23u].w)) + computeVectorConstants0.packedValues[25u].w;
            float multiplyAddValue71 = (fma(computeVectorConstants0.packedValues[24u].x, multiplyAddValue69, fma(computeVectorConstants0.packedValues[22u].x, multiplyAddValue67, multiplyAddValue68 * computeVectorConstants0.packedValues[23u].x)) + computeVectorConstants0.packedValues[25u].x) / multiplyAddValue70;
            float multiplyAddValue72 = (fma(computeVectorConstants0.packedValues[24u].y, multiplyAddValue69, fma(computeVectorConstants0.packedValues[22u].y, multiplyAddValue67, multiplyAddValue68 * computeVectorConstants0.packedValues[23u].y)) + computeVectorConstants0.packedValues[25u].y) / multiplyAddValue70;
            float multiplyAddValue73 = (fma(computeVectorConstants0.packedValues[24u].z, multiplyAddValue69, fma(computeVectorConstants0.packedValues[22u].z, multiplyAddValue67, multiplyAddValue68 * computeVectorConstants0.packedValues[23u].z)) + computeVectorConstants0.packedValues[25u].z) / multiplyAddValue70;
            float productValue23 = (multiplyAddValue71 + 1.0) * 0.5;
            float productValue24 = (multiplyAddValue72 + 1.0) * 0.5;
            float multiplyAddValue74 = log2(fma((((-(fma(computeVectorConstants0.packedValues[6u].z, multiplyAddValue73, fma(computeVectorConstants0.packedValues[4u].z, multiplyAddValue71, multiplyAddValue72 * computeVectorConstants0.packedValues[5u].z)) + computeVectorConstants0.packedValues[7u].z)) / (fma(computeVectorConstants0.packedValues[6u].w, multiplyAddValue73, fma(computeVectorConstants0.packedValues[4u].w, multiplyAddValue71, multiplyAddValue72 * computeVectorConstants0.packedValues[5u].w)) + computeVectorConstants0.packedValues[7u].w)) - computeScalarConstants0.packedValues[304u]) / (computeScalarConstants0.packedValues[305u] - computeScalarConstants0.packedValues[304u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375;
            vec3 multiplyAddValue75 = vec3(fma(-computeVectorConstants0.packedValues[30u].x, productValue23, spvNMin(spvNMax(productValue23 * computeVectorConstants0.packedValues[30u].x, 0.0), computeVectorConstants0.packedValues[30u].x)), fma(-computeVectorConstants0.packedValues[30u].y, productValue24, spvNMin(spvNMax(productValue24 * computeVectorConstants0.packedValues[30u].y, 0.0), computeVectorConstants0.packedValues[30u].y)), fma(-computeVectorConstants0.packedValues[30u].z, multiplyAddValue74, spvNMin(spvNMax(multiplyAddValue74 * computeVectorConstants0.packedValues[30u].z, 0.0), computeVectorConstants0.packedValues[30u].z)));
            float multiplyAddValue76 = fma(multiplyAddValue74, trunc(computeScalarConstants0.packedValues[122u]), -0.5);
            uint sumValue43 = uint(min(int(scalarValue17 - 2u), int(uint(max(int(uint(int(multiplyAddValue76))), int(0u))))));
            float scalarValue25 = rdSignedBitsToFloat(sumValue43);
            vec4 sampledTextureValue9 = textureLod(sampler2DArray(materialTexture0, textureSampler0), vec3(productValue23, productValue24, scalarValue25), 0.0);
            float scalarValue26 = sampledTextureValue9.x;
            imageStore(intermediateValue2, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(fma(fma(spvNClamp(sqrt(rdDot3Precise2(multiplyAddValue75, multiplyAddValue75)) * computeScalarConstants0.packedValues[301u], 0.0, 1.0), -computeScalarConstants0.packedValues[302u], computeScalarConstants0.packedValues[302u]), fma(spvNClamp(multiplyAddValue76 - scalarValue25, 0.0, 1.0), textureLod(sampler2DArray(materialTexture0, textureSampler0), vec3(productValue23, productValue24, rdSignedBitsToFloat(sumValue43 + 1u)), 0.0).x - scalarValue26, scalarValue26) - multiplyAddValue8, multiplyAddValue8)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float quotientValue7 = ((sumValue / computeVectorConstants0.packedValues[31u].x) * 2.0) + (-1.0);
            float quotientValue8 = ((sumValue1 / computeVectorConstants0.packedValues[31u].y) * 2.0) + (-1.0);
            float exponentialValue1 = (exp2((sumValue2 / computeVectorConstants0.packedValues[31u].z) * 5.770780086517333984375) + (-1.0)) * 0.0186573602259159088134765625;
            float productValue9 = (-0.0) - ((exponentialValue1 * computeVectorConstants0.packedValues[77u].y) + ((1.0 - exponentialValue1) * computeVectorConstants0.packedValues[77u].x));
            float multiplyAddValue13 = (fma(computeVectorConstants0.packedValues[2u].z, productValue9, 0.0) + computeVectorConstants0.packedValues[3u].z) / (fma(computeVectorConstants0.packedValues[2u].w, productValue9, 0.0) + computeVectorConstants0.packedValues[3u].w);
            float multiplyAddValue14 = fma(computeVectorConstants0.packedValues[18u].w, multiplyAddValue13, fma(computeVectorConstants0.packedValues[17u].w, quotientValue8, quotientValue7 * computeVectorConstants0.packedValues[16u].w)) + computeVectorConstants0.packedValues[19u].w;
            float multiplyAddValue15 = ((fma(computeVectorConstants0.packedValues[18u].x, multiplyAddValue13, fma(computeVectorConstants0.packedValues[17u].x, quotientValue8, quotientValue7 * computeVectorConstants0.packedValues[16u].x)) + computeVectorConstants0.packedValues[19u].x) / multiplyAddValue14) - computeVectorConstants0.packedValues[29u].x;
            float multiplyAddValue16 = ((fma(computeVectorConstants0.packedValues[18u].y, multiplyAddValue13, fma(computeVectorConstants0.packedValues[17u].y, quotientValue8, quotientValue7 * computeVectorConstants0.packedValues[16u].y)) + computeVectorConstants0.packedValues[19u].y) / multiplyAddValue14) - computeVectorConstants0.packedValues[29u].y;
            float multiplyAddValue17 = ((fma(computeVectorConstants0.packedValues[18u].z, multiplyAddValue13, fma(computeVectorConstants0.packedValues[17u].z, quotientValue8, quotientValue7 * computeVectorConstants0.packedValues[16u].z)) + computeVectorConstants0.packedValues[19u].z) / multiplyAddValue14) - computeVectorConstants0.packedValues[29u].z;
            float multiplyAddValue18 = fma(computeVectorConstants0.packedValues[24u].w, multiplyAddValue17, fma(computeVectorConstants0.packedValues[23u].w, multiplyAddValue16, multiplyAddValue15 * computeVectorConstants0.packedValues[22u].w)) + computeVectorConstants0.packedValues[25u].w;
            float multiplyAddValue19 = (fma(computeVectorConstants0.packedValues[24u].x, multiplyAddValue17, fma(computeVectorConstants0.packedValues[23u].x, multiplyAddValue16, multiplyAddValue15 * computeVectorConstants0.packedValues[22u].x)) + computeVectorConstants0.packedValues[25u].x) / multiplyAddValue18;
            float multiplyAddValue20 = (fma(computeVectorConstants0.packedValues[24u].y, multiplyAddValue17, fma(computeVectorConstants0.packedValues[23u].y, multiplyAddValue16, multiplyAddValue15 * computeVectorConstants0.packedValues[22u].y)) + computeVectorConstants0.packedValues[25u].y) / multiplyAddValue18;
            float multiplyAddValue21 = (fma(computeVectorConstants0.packedValues[24u].z, multiplyAddValue17, fma(computeVectorConstants0.packedValues[23u].z, multiplyAddValue16, multiplyAddValue15 * computeVectorConstants0.packedValues[22u].z)) + computeVectorConstants0.packedValues[25u].z) / multiplyAddValue18;
            float productValue10 = (multiplyAddValue19 + 1.0) * 0.5;
            float productValue11 = (multiplyAddValue20 + 1.0) * 0.5;
            float multiplyAddValue25 = log2(((((((-0.0) - (computeVectorConstants0.packedValues[7u].z + fma(computeVectorConstants0.packedValues[6u].z, multiplyAddValue21, fma(computeVectorConstants0.packedValues[5u].z, multiplyAddValue20, multiplyAddValue19 * computeVectorConstants0.packedValues[4u].z)))) / (fma(computeVectorConstants0.packedValues[6u].w, multiplyAddValue21, fma(computeVectorConstants0.packedValues[5u].w, multiplyAddValue20, multiplyAddValue19 * computeVectorConstants0.packedValues[4u].w)) + computeVectorConstants0.packedValues[7u].w)) - computeVectorConstants0.packedValues[77u].x) / (computeVectorConstants0.packedValues[77u].y - computeVectorConstants0.packedValues[77u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375;
            float productValue12 = productValue10 * computeVectorConstants0.packedValues[31u].x;
            float productValue17 = productValue11 * computeVectorConstants0.packedValues[31u].y;
            float productValue18 = multiplyAddValue25 * computeVectorConstants0.packedValues[31u].z;
            float sumValue28 = spvNMin(spvNMax(productValue12, 0.0), computeVectorConstants0.packedValues[31u].x) - productValue12;
            float sumValue29 = spvNMin(spvNMax(productValue17, 0.0), computeVectorConstants0.packedValues[31u].y) - productValue17;
            float sumValue30 = spvNMin(spvNMax(productValue18, 0.0), computeVectorConstants0.packedValues[31u].z) - productValue18;
            uint scalarValue14 = uint(int(computeVectorConstants0.packedValues[31u].z));
            float productValue19 = (multiplyAddValue25 * float(int(scalarValue14))) + (-0.5);
            uint sumValue31 = uint(min(int(uint(max(int(uint(int(productValue19))), int(0u)))), int(scalarValue14 + 4294967294u)));
            float scalarValue15 = float(int(sumValue31));
            vec4 sampledTextureValue5 = textureLod(sampler2DArray(previousCascadedShadowBufferTexture, previousCascadedShadowBufferSampler), vec3(productValue10, productValue11, scalarValue15), 0.0);
            float scalarValue16 = sampledTextureValue5.x;
            imageStore(cascadedShadowBufferOutTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4((((scalarValue16 - productValue1) + ((textureLod(sampler2DArray(previousCascadedShadowBufferTexture, previousCascadedShadowBufferSampler), vec3(productValue10, productValue11, float(int(sumValue31 + 1u))), 0.0).x - scalarValue16) * spvNMin(spvNMax(productValue19 - scalarValue15, 0.0), 1.0))) * (computeVectorConstants0.packedValues[76u].z - (spvNClamp(sqrt(((sumValue29 * sumValue29) + (sumValue28 * sumValue28)) + (sumValue30 * sumValue30)) * computeVectorConstants0.packedValues[76u].y, 0.0, 1.0) * computeVectorConstants0.packedValues[76u].z))) + productValue1));
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            imageStore(intermediateValue2, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(multiplyAddValue8));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            imageStore(cascadedShadowBufferOutTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(productValue1));
#endif
        }
    }
}
