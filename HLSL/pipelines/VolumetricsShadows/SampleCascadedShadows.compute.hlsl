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

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_4 1
#endif

#include "../../include/materials/VolumetricsShadows/ComputeBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue14 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
    if (!((int(dispatchThreadId.z) >= int(scalarValue14)) || ((int(dispatchThreadId.x) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.x)))) || (int(dispatchThreadId.y) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.y)))))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (!((int(dispatchThreadId.z) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z)))) || ((int(dispatchThreadId.x) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.x)))) || (int(dispatchThreadId.y) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.y)))))))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float sumValue32 = rdSignedBitsToFloat(dispatchThreadId.x) + 0.5f;
        float sumValue33 = rdSignedBitsToFloat(dispatchThreadId.y) + 0.5f;
        float sumValue34 = rdSignedBitsToFloat(dispatchThreadId.z) + 0.5f;
        float multiplyAddValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sumValue = float(int(dispatchThreadId.x)) + 0.5f;
        float sumValue1 = float(int(dispatchThreadId.y)) + 0.5f;
        float sumValue2 = float(int(dispatchThreadId.z)) + 0.5f;
        float quotientValue = (((RD_UNIFORM_JITTER_OFFSET.x + sumValue) / RD_UNIFORM_VOLUME_DIMENSIONS.x) * 2.0f) + (-1.0f);
        float quotientValue1 = (((RD_UNIFORM_JITTER_OFFSET.y + sumValue1) / RD_UNIFORM_VOLUME_DIMENSIONS.y) * 2.0f) + (-1.0f);
        float exponentialValue = (exp2(((RD_UNIFORM_JITTER_OFFSET.z + sumValue2) / RD_UNIFORM_VOLUME_DIMENSIONS.z) * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f;
        float productValue = (-0.0f) - ((exponentialValue * RD_UNIFORM_VOLUME_NEAR_FAR.y) + ((1.0f - exponentialValue) * RD_UNIFORM_VOLUME_NEAR_FAR.x));
        float multiplyAddValue = (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, productValue, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, productValue, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w);
        float multiplyAddValue1 = mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.w, quotientValue1, quotientValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.w;
        float multiplyAddValue2 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.x, quotientValue1, quotientValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue1;
        float multiplyAddValue3 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.y, quotientValue1, quotientValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue1;
        float multiplyAddValue4 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue1;
        float productValue1;
#endif
        if (uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.x)) == 1u)
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue26 = mad((sumValue32 + RD_UNIFORM_JITTER_OFFSET.x) / RD_UNIFORM_VOLUME_DIMENSIONS.x, 2.0f, -1.0f);
            float multiplyAddValue27 = mad((sumValue33 + RD_UNIFORM_JITTER_OFFSET.y) / RD_UNIFORM_VOLUME_DIMENSIONS.y, 2.0f, -1.0f);
            float exponentialValue2 = exp2(((sumValue34 + RD_UNIFORM_JITTER_OFFSET.z) / RD_UNIFORM_VOLUME_DIMENSIONS.z) * 5.770780086517333984375f);
            float multiplyAddValue28 = -mad(mad(1.0f - exponentialValue2, 0.0186573602259159088134765625f, 1.0f), RD_UNIFORM_VOLUME_NEAR_FAR.x, ((exponentialValue2 - 1.0f) * 0.0186573602259159088134765625f) * RD_UNIFORM_VOLUME_NEAR_FAR.y);
            float multiplyAddValue29 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue28, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue28, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w);
            float multiplyAddValue30 = mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue29, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue26, multiplyAddValue27 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.w;
            float multiplyAddValue31 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue29, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue26, multiplyAddValue27 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue30;
            float multiplyAddValue32 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue29, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue26, multiplyAddValue27 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue30;
            float multiplyAddValue33 = (mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue29, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue26, multiplyAddValue27 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue30;
            uint clampedValue2 = uint(int(rdDot4Precise(float4(clamp(RD_UNIFORM_CASCADES_PER_SET.x, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.y, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.z, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.w, 0.0f, 1.0f)), 1.0f.xxxx)));
            bool comparisonValue18 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
            float intermediateValue11;
            intermediateValue11 = 1.0f;
            uint sumValue3;
            float intermediateValue12;
            uint intermediateValue14;
            uint scalarValue1 = 0u;
            uint scalarValue2 = 0u;
            for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint clampedValue = uint(int(dot(float4(clamp(RD_UNIFORM_CASCADES_PER_SET.x, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.y, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.z, 0.0f, 1.0f), clamp(RD_UNIFORM_CASCADES_PER_SET.w, 0.0f, 1.0f)), 1.0f.xxxx)));
            float intermediateValue;
            if (int(clampedValue) > int(0u))
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                if (int(clampedValue2) <= int(scalarValue2))
                {
                    break;
                }
                uint comparisonValue19 = uint(min(int(uint(int((scalarValue2 == 3u) ? RD_UNIFORM_CASCADES_PER_SET.w : ((scalarValue2 == 2u) ? RD_UNIFORM_CASCADES_PER_SET.z : ((scalarValue2 == 1u) ? RD_UNIFORM_CASCADES_PER_SET.y : ((scalarValue2 == 0u) ? RD_UNIFORM_CASCADES_PER_SET.x : 0.0f))))) + scalarValue1), int(8u)));
                intermediateValue12 = intermediateValue11;
                intermediateValue14 = scalarValue1;
                float comparisonValue2;
                uint intermediateValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float intermediateValue1;
                uint intermediateValue7;
                float scalarValue = 1.0f;
                uint scalarValue1 = 0u;
                uint scalarValue2 = 0u;
                uint quotientValue4;
                bool intermediateValue9;
#endif
                for (;;)
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    if (int(comparisonValue19) <= int(intermediateValue14))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    uint sumValue4 = scalarValue2 + 128u;
                    quotientValue4 = uint(min(int(uint(int(vertexConstants[sumValue4 / 4u][sumValue4 % 4u])) + scalarValue1), int(8u)));
                    intermediateValue9 = int(scalarValue1) < int(quotientValue4);
                    float branchMergedValue;
                    uint branchMergedValue5;
                    if (intermediateValue9)
#endif
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        break;
                    }
                    uint bitwiseValue1 = intermediateValue14 << 2u;
                    uint sumValue35 = bitwiseValue1 + 33u;
                    uint sumValue36 = bitwiseValue1 + 32u;
                    uint sumValue37 = bitwiseValue1 + 34u;
                    uint sumValue38 = bitwiseValue1 + 35u;
                    float multiplyAddValue34 = mad(computeVectorConstants0[sumValue37].x, multiplyAddValue33, mad(computeVectorConstants0[sumValue36].x, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0[sumValue35].x)) + computeVectorConstants0[sumValue38].x;
                    float multiplyAddValue35 = mad(computeVectorConstants0[sumValue37].y, multiplyAddValue33, mad(computeVectorConstants0[sumValue36].y, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0[sumValue35].y)) + computeVectorConstants0[sumValue38].y;
                    float multiplyAddValue36 = mad(computeVectorConstants0[sumValue37].z, multiplyAddValue33, mad(computeVectorConstants0[sumValue36].z, multiplyAddValue31, multiplyAddValue32 * computeVectorConstants0[sumValue35].z)) + computeVectorConstants0[sumValue38].z;
                    if (((abs(multiplyAddValue34) <= 1.0f) && (abs(multiplyAddValue35) <= 1.0f)) && (abs(multiplyAddValue36) <= 1.0f))
                    {
                        float multiplyAddValue37 = mad(multiplyAddValue34, 0.5f, 0.5f);
                        uint bitwiseValue2 = (((16u * intermediateValue14) + 128u) + 12u) >> 2u;
                        uint multiplyAddValue38 = uint(clamp(int(uint(int(mad(computeVectorConstants0[bitwiseValue2 / 4u][bitwiseValue2 % 4u], RD_UNIFORM_VOLUME_SHADOW_SETTINGS.x, 0.5f)))), int(1u), int(9u)));
                        bool conditionValue = !comparisonValue18;
                        uint comparisonValue20 = (comparisonValue18 ? 1u : multiplyAddValue38) >> 1u;
                        float multiplyAddValue40 = 1.0f - mad(multiplyAddValue35, 0.5f, 0.5f);
                        float scalarValue17 = rdSignedBitsToFloat(intermediateValue14);
                        uint bitwiseValue3 = (((16u * intermediateValue14) + 128u) + 4u) >> 2u;
                        float quotientValue10 = multiplyAddValue36 - computeVectorConstants0[bitwiseValue3 / 4u][bitwiseValue3 % 4u];
                        float intermediateValue32;
                        intermediateValue32 = 0.0f;
                        uint sumValue12;
                        float intermediateValue33;
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
                            uint sumValue5 = bitwiseValue + 33u;
                            uint sumValue6 = bitwiseValue + 34u;
                            uint sumValue7 = bitwiseValue + 35u;
                            uint sumValue8 = bitwiseValue + 36u;
                            multiplyAddValue22 = mad(vertexConstants[sumValue7].x, multiplyAddValue4, mad(vertexConstants[sumValue6].x, multiplyAddValue3, vertexConstants[sumValue5].x * multiplyAddValue2)) + vertexConstants[sumValue8].x;
                            multiplyAddValue23 = mad(vertexConstants[sumValue7].y, multiplyAddValue4, mad(vertexConstants[sumValue6].y, multiplyAddValue3, vertexConstants[sumValue5].y * multiplyAddValue2)) + vertexConstants[sumValue8].y;
                            multiplyAddValue24 = mad(vertexConstants[sumValue7].z, multiplyAddValue4, mad(vertexConstants[sumValue6].z, multiplyAddValue3, vertexConstants[sumValue5].z * multiplyAddValue2)) + vertexConstants[sumValue8].z;
                            comparisonValue2 = ((abs(multiplyAddValue22) <= 1.0f) && (abs(multiplyAddValue23) <= 1.0f)) && (abs(multiplyAddValue24) <= 1.0f);
                            float branchMergedValue1;
                            uint branchMergedValue6;
                            if (comparisonValue2)
                            {
                                uint sumValue9 = scalarValue4 + 112u;
                                uint sumValue17 = scalarValue4 + 8u;
                                float quotientValue2 = min(max(1.0f, vertexConstants[sumValue9 / 4u][sumValue9 % 4u]), 1.0f);
                                float nonlinearValue = (sqrt(1.0f - (quotientValue2 * quotientValue2)) / quotientValue2) * vertexConstants[sumValue17].z;
                                float productValue2 = (multiplyAddValue22 * 0.5f) + 0.5f;
                                float productValue3 = 0.5f - (multiplyAddValue23 * 0.5f);
                                uint comparisonValue = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int((RD_UNIFORM_VOLUME_SHADOW_SETTINGS.x * vertexConstants[sumValue17].w) + 0.5f))), int(1u)))), int(9u)));
                                uint quotientValue3 = uint(int(comparisonValue) / int(2u));
                                float intermediateValue25;
                                if (int(comparisonValue) > int(0u))
                                {
                                    float sumValue19;
                                    float intermediateValue35;
                                    uint intermediateValue36;
                                    float scalarValue5 = 0.0f;
                                    uint scalarValue6 = 0u;
                                    for (;;)
                                    {
                                        intermediateValue35 = scalarValue5;
                                        intermediateValue36 = 0u;
                                        float intermediateValue42;
                                        float productValue20;
                                        float4 intermediateValue37;
                                        float intermediateValue38;
                                        float intermediateValue39;
                                        float productValue21;
                                        bool comparisonValue12;
                                        float sumValue24;
                                        for (;;)
                                        {
                                            float productValue4 = (productValue2 + ((float(int(intermediateValue36 - quotientValue3)) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x)) * vertexConstants[sumValue17].x;
                                            productValue20 = (productValue3 + (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x * (float(int(scalarValue6 - quotientValue3)) + 0.5f))) * vertexConstants[sumValue17].x;
                                            intermediateValue37 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue4, productValue20, float(int(scalarValue4))));
                                            intermediateValue38 = intermediateValue37.w;
                                            intermediateValue39 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z;
                                            productValue21 = frac((productValue4 * intermediateValue39) + 0.5f);
                                            comparisonValue12 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                            sumValue24 = (multiplyAddValue24 - vertexConstants[sumValue17].y) - nonlinearValue;
                                            float branchMergedValue4;
                                            if (comparisonValue12)
                                            {
                                                branchMergedValue4 = float(intermediateValue38 >= sumValue24);
                                            }
                                            else
                                            {
                                                float comparisonValue1 = (intermediateValue37.x < sumValue24) ? 0.0f : 1.0f;
                                                float comparisonValue7 = (intermediateValue38 < sumValue24) ? 0.0f : 1.0f;
                                                float comparisonValue8 = ((((intermediateValue37.z < sumValue24) ? 0.0f : 1.0f) - comparisonValue7) * productValue21) + comparisonValue7;
                                                branchMergedValue4 = (((((((intermediateValue37.y < sumValue24) ? 0.0f : 1.0f) - comparisonValue1) * productValue21) + comparisonValue1) - comparisonValue8) * frac((productValue20 * intermediateValue39) + 0.5f)) + comparisonValue8;
                                            }
                                            intermediateValue42 = branchMergedValue4;
                                            sumValue19 = intermediateValue42 + intermediateValue35;
                                            uint sumValue20 = intermediateValue36 + 1u;
                                            if (sumValue20 == comparisonValue)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                intermediateValue35 = sumValue19;
                                                intermediateValue36 = sumValue20;
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
                                    intermediateValue25 = 0.0f;
                                }
                                branchMergedValue1 = min(scalarValue3, intermediateValue25 / float(int(comparisonValue * comparisonValue)));
                                branchMergedValue6 = quotientValue4;
                            }
                            else
                            {
                                branchMergedValue1 = scalarValue3;
                                branchMergedValue6 = scalarValue4 + 1u;
                            }
                            intermediateValue12 = branchMergedValue1;
                            intermediateValue13 = branchMergedValue6;
                            if (int(intermediateValue13) < int(quotientValue4))
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
                            float sumValue39 = rdSignedBitsToFloat(scalarValue6 - comparisonValue20) + 0.5f;
                            intermediateValue33 = intermediateValue32;
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
                    if (sumValue22 == clampedValue)
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
                intermediateValue = 1.0f;
            }
            float intermediateValue11;
            if (int(uint(int(RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x))) > int(0u))
            {
                float scalarValue7 = min(max(1.0f, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                float multiplyAddValue5 = min(((RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) + mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, multiplyAddValue4, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z, multiplyAddValue3, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z * multiplyAddValue2))) - ((sqrt(1.0f - (scalarValue7 * scalarValue7)) / scalarValue7) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z), 1.0f);
                float multiplyAddValue6 = (((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, multiplyAddValue4, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x, multiplyAddValue3, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x * multiplyAddValue2)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x) * 0.5f) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                float multiplyAddValue7 = (0.5f - ((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, multiplyAddValue4, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y, multiplyAddValue3, RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y * multiplyAddValue2)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y) * 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                uint comparisonValue9 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int((RD_UNIFORM_VOLUME_SHADOW_SETTINGS.x * 2.0f) + 0.5f))), int(1u)))), int(9u)));
                uint quotientValue5 = uint(int(comparisonValue9) / int(2u));
                float branchMergedValue7;
                if ((multiplyAddValue7 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y) && (((multiplyAddValue6 >= 0.0f) && (multiplyAddValue6 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue7 >= 0.0f)))
                {
                    float dotProductValue = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx) + 1.0f;
                    float intermediateValue19;
                    if (int(comparisonValue9) > int(0u))
                    {
                        float sumValue13;
                        float intermediateValue26;
                        uint intermediateValue27;
                        float scalarValue8 = 0.0f;
                        uint scalarValue9 = 0u;
                        for (;;)
                        {
                            intermediateValue26 = scalarValue8;
                            intermediateValue27 = 0u;
                            float intermediateValue40;
                            float productValue13;
                            float productValue14;
                            bool comparisonValue4;
#endif
                            for (;;)
                            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                                if ((conditionValue && (int(multiplyAddValue38) <= int(scalarValue9))) || (comparisonValue18 && (int(scalarValue9) >= int(1u))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                                float productValue5 = RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z;
                                productValue13 = (productValue5 * (float(int(intermediateValue27 - quotientValue5)) + 0.5f)) + multiplyAddValue6;
                                productValue14 = (productValue5 * (float(int(scalarValue9 - quotientValue5)) + 0.5f)) + multiplyAddValue7;
                                comparisonValue4 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                                float branchMergedValue2;
                                if (comparisonValue4)
                                {
                                    branchMergedValue2 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue13, productValue14, dotProductValue), 0.0f).x >= multiplyAddValue5);
                                }
                                else
                                {
                                    float4 vectorValue = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue13, productValue14, dotProductValue));
                                    float productValue6 = frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue13) + 0.5f);
                                    float comparisonValue10 = (vectorValue.x < multiplyAddValue5) ? 0.0f : 1.0f;
                                    float comparisonValue11 = (vectorValue.w < multiplyAddValue5) ? 0.0f : 1.0f;
                                    float comparisonValue13 = ((((vectorValue.z < multiplyAddValue5) ? 0.0f : 1.0f) - comparisonValue11) * productValue6) + comparisonValue11;
                                    branchMergedValue2 = (((((((vectorValue.y < multiplyAddValue5) ? 0.0f : 1.0f) - comparisonValue10) * productValue6) + comparisonValue10) - comparisonValue13) * frac((RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z * productValue14) + 0.5f)) + comparisonValue13;
                                }
                                intermediateValue40 = branchMergedValue2;
                                sumValue13 = intermediateValue40 + intermediateValue26;
                                uint sumValue23 = intermediateValue27 + 1u;
                                if (sumValue23 == comparisonValue9)
#endif
                                {
                                    break;
                                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                                uint bitwiseValue4 = (((16u * intermediateValue14) + 128u) + 0u) >> 2u;
                                uint quotientValue11 = bitwiseValue4 / 4u;
                                uint scalarValue18 = bitwiseValue4 % 4u;
                                float multiplyAddValue41 = mad(multiplyAddValue37, computeVectorConstants0[quotientValue11][scalarValue18], ((rdSignedBitsToFloat(scalarValue9 - comparisonValue20) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x) * computeVectorConstants0[quotientValue11][scalarValue18]);
                                float multiplyAddValue42 = mad(multiplyAddValue40, computeVectorConstants0[quotientValue11][scalarValue18], (sumValue39 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x) * computeVectorConstants0[quotientValue11][scalarValue18]);
                                float4 vectorValue2 = materialTexture1.GatherRed(textureSampler1, float3(multiplyAddValue41, multiplyAddValue42, scalarValue17));
                                float multiplyAddValue43 = frac(mad(multiplyAddValue41, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z, 0.5f));
                                bool comparisonValue21 = vectorValue2.w >= quotientValue10;
                                bool comparisonValue22 = vectorValue2.x >= quotientValue10;
                                float comparisonValue23 = float(vectorValue2.y >= quotientValue10);
                                float comparisonValue24 = float(vectorValue2.z >= quotientValue10);
                                float multiplyAddValue44 = mad(multiplyAddValue43, comparisonValue21 ? (comparisonValue24 - 1.0f) : comparisonValue24, float(comparisonValue21));
                                multiplyAddValue39 = comparisonValue18 ? (comparisonValue21 ? (intermediateValue33 + 1.0f) : intermediateValue33) : (intermediateValue33 + mad(frac(mad(multiplyAddValue42, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z, 0.5f)), mad(multiplyAddValue43, comparisonValue22 ? (comparisonValue23 - 1.0f) : comparisonValue23, float(comparisonValue22)) - multiplyAddValue44, multiplyAddValue44));
                                sumValue18 = scalarValue9 + 1u;
                                intermediateValue33 = multiplyAddValue39;
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
                            intermediateValue32 = intermediateValue33;
                            scalarValue6 = sumValue12;
                            continue;
#endif
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        intermediateValue18 = comparisonValue19;
                        comparisonValue2 = min(intermediateValue32 / rdSignedBitsToFloat(comparisonValue18 ? 1u : (multiplyAddValue38 * multiplyAddValue38)), intermediateValue12);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        intermediateValue19 = sumValue13;
#endif
                    }
                    else
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        intermediateValue18 = intermediateValue14 + 1u;
                        comparisonValue2 = intermediateValue12;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        intermediateValue19 = 0.0f;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    intermediateValue12 = comparisonValue2;
                    intermediateValue14 = intermediateValue18;
                    continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue7 = intermediateValue19 / float(int(comparisonValue9 * comparisonValue9));
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                sumValue3 = scalarValue2 + 1u;
                intermediateValue11 = intermediateValue12;
                scalarValue1 = intermediateValue14;
                scalarValue2 = sumValue3;
                continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                else
                {
                    branchMergedValue7 = 1.0f;
                }
                intermediateValue11 = branchMergedValue7;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float intermediateValue19;
            if (int(uint(int(RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.x))) > int(0u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            else
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float multiplyAddValue45 = mad(mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.x, multiplyAddValue33, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.x, multiplyAddValue31, multiplyAddValue32 * RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.x)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.x, 0.5f, 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                float multiplyAddValue46 = (1.0f - mad(mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.y, multiplyAddValue33, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.y, multiplyAddValue31, multiplyAddValue32 * RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.y)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.y, 0.5f, 0.5f)) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y;
                float comparisonValue3;
                if ((((multiplyAddValue45 >= 0.0f) && (multiplyAddValue45 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y)) && (multiplyAddValue46 >= 0.0f)) && (multiplyAddValue46 < RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue11 = 1.0f;
            }
            float intermediateValue15;
            if ((int(uint(int(RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x))) > int(0u)) && (int(uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y))) > int(0u)))
            {
                float multiplyAddValue9 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, multiplyAddValue4, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w, multiplyAddValue3, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w * multiplyAddValue2)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
                float scalarValue10 = min(max(1.0f, RD_UNIFORM_ND_LFLOOR.x), 1.0f);
                float multiplyAddValue10 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, multiplyAddValue4, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z, multiplyAddValue3, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z * multiplyAddValue2)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue9) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y) - ((sqrt(1.0f - (scalarValue10 * scalarValue10)) / scalarValue10) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.z);
                float multiplyAddValue11 = (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, multiplyAddValue4, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x, multiplyAddValue3, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x * multiplyAddValue2)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue9) * 0.5f) + 0.5f;
                float multiplyAddValue12 = 0.5f - (((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, multiplyAddValue4, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y, multiplyAddValue3, RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y * multiplyAddValue2)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue9) * 0.5f);
                uint comparisonValue14 = (RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f) ? 1u : uint(min(int(uint(max(int(uint(int((RD_UNIFORM_VOLUME_SHADOW_SETTINGS.x * RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z) + 0.5f))), int(1u)))), int(9u)));
                uint quotientValue6 = uint(int(comparisonValue14) / int(2u));
                float dotProductValue1 = dot(float4(RD_UNIFORM_CASCADES_PER_SET), 1.0f.xxxx);
                float intermediateValue20;
                if (int(comparisonValue14) > int(0u))
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    float multiplyAddValue47 = min((mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_2.z, multiplyAddValue33, mad(RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_0.z, multiplyAddValue31, multiplyAddValue32 * RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_1.z)) + RD_UNIFORM_PLAYER_SHADOW_PROJ_ROW_3.z) - RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y, 1.0f);
                    uint multiplyAddValue48 = uint(clamp(int(uint(int(mad(RD_UNIFORM_VOLUME_SHADOW_SETTINGS.x, 2.0f, 0.5f)))), int(1u), int(9u)));
                    bool conditionValue1 = !comparisonValue18;
                    uint comparisonValue25 = (comparisonValue18 ? 1u : multiplyAddValue48) >> 1u;
                    float sumValue40 = rdDot4Precise(RD_UNIFORM_CASCADES_PER_SET, 1.0f.xxxx) + 1.0f;
                    float intermediateValue24;
                    intermediateValue24 = 0.0f;
                    uint sumValue10;
                    float intermediateValue25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float sumValue14;
                    float intermediateValue28;
                    uint intermediateValue29;
                    float scalarValue11 = 0.0f;
#endif
                    uint scalarValue12 = 0u;
                    for (;;)
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        if ((comparisonValue18 && (int(scalarValue12) >= int(1u))) || (conditionValue1 && (int(multiplyAddValue48) <= int(scalarValue12))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        intermediateValue28 = scalarValue11;
                        intermediateValue29 = 0u;
                        float intermediateValue41;
                        float4 intermediateValue30;
                        float productValue15;
                        float productValue16;
                        bool comparisonValue5;
                        for (;;)
                        {
                            intermediateValue30 = RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH;
                            productValue15 = (multiplyAddValue11 + ((float(int(intermediateValue29 - quotientValue6)) + 0.5f) * intermediateValue30.x)) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                            productValue16 = (multiplyAddValue12 + (intermediateValue30.x * (float(int(scalarValue12 - quotientValue6)) + 0.5f))) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x;
                            comparisonValue5 = RD_UNIFORM_QUANTIZATION_PARAMETERS.x != 0.0f;
                            float branchMergedValue3;
                            if (comparisonValue5)
                            {
                                branchMergedValue3 = float(shadowCascadesTexture.SampleLevel(shadowCascadesSampler, float3(productValue15, productValue16, dotProductValue1), 0.0f).x >= multiplyAddValue10);
                            }
                            else
                            {
                                float4 vectorValue1 = shadowCascadesTexture.GatherRed(shadowCascadesSampler, float3(productValue15, productValue16, dotProductValue1));
                                float productValue7 = frac((productValue15 * intermediateValue30.z) + 0.5f);
                                float comparisonValue15 = (vectorValue1.x < multiplyAddValue10) ? 0.0f : 1.0f;
                                float comparisonValue16 = (vectorValue1.w < multiplyAddValue10) ? 0.0f : 1.0f;
                                float comparisonValue17 = ((((vectorValue1.z < multiplyAddValue10) ? 0.0f : 1.0f) - comparisonValue16) * productValue7) + comparisonValue16;
                                branchMergedValue3 = (((((((vectorValue1.y < multiplyAddValue10) ? 0.0f : 1.0f) - comparisonValue15) * productValue7) + comparisonValue15) - comparisonValue17) * frac((productValue16 * intermediateValue30.z) + 0.5f)) + comparisonValue17;
                            }
                            intermediateValue41 = branchMergedValue3;
                            sumValue14 = intermediateValue41 + intermediateValue28;
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
                        float sumValue41 = rdSignedBitsToFloat(scalarValue12 - comparisonValue25) + 0.5f;
                        intermediateValue25 = intermediateValue24;
                        uint sumValue15;
                        float sampledTextureValue1;
                        uint scalarValue19 = 0u;
                        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                        else
#endif
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            if ((conditionValue1 && (int(multiplyAddValue48) <= int(scalarValue19))) || (comparisonValue18 && (int(scalarValue19) >= int(1u))))
                            {
                                break;
                            }
                            float multiplyAddValue49 = mad((rdSignedBitsToFloat(scalarValue19 - comparisonValue25) + 0.5f) * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z, RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y, multiplyAddValue45);
                            float multiplyAddValue50 = mad(sumValue41 * RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.z, RD_UNIFORM_FIRST_PERSON_PLAYER_SHADOWS_ENABLED_AND_RESOLUTION_AND_FILTER_WIDTH_AND_TEXTURE_DIMENSIONS.y, multiplyAddValue46);
                            if (comparisonValue18)
                            {
                                sampledTextureValue1 = (materialTexture1.SampleLevel(textureSampler1, float3(multiplyAddValue49, multiplyAddValue50, sumValue40), 0.0f).x >= multiplyAddValue47) ? (intermediateValue25 + 1.0f) : intermediateValue25;
                            }
                            else
                            {
                                float4 vectorValue3 = materialTexture1.GatherRed(textureSampler1, float3(multiplyAddValue49, multiplyAddValue50, sumValue40));
                                float multiplyAddValue51 = frac(mad(multiplyAddValue49, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z, 0.5f));
                                bool comparisonValue26 = vectorValue3.x >= multiplyAddValue47;
                                bool comparisonValue27 = vectorValue3.w >= multiplyAddValue47;
                                float comparisonValue28 = float(vectorValue3.y >= multiplyAddValue47);
                                float comparisonValue29 = float(vectorValue3.z >= multiplyAddValue47);
                                float multiplyAddValue52 = mad(multiplyAddValue51, comparisonValue27 ? (comparisonValue29 - 1.0f) : comparisonValue29, float(comparisonValue27));
                                sampledTextureValue1 = mad(frac(mad(multiplyAddValue50, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z, 0.5f)), mad(multiplyAddValue51, comparisonValue26 ? (comparisonValue28 - 1.0f) : comparisonValue28, float(comparisonValue26)) - multiplyAddValue52, multiplyAddValue52) + intermediateValue25;
                            }
                            sumValue15 = scalarValue19 + 1u;
                            intermediateValue25 = sampledTextureValue1;
                            scalarValue19 = sumValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                            scalarValue11 = sumValue14;
                            scalarValue12 = sumValue27;
#endif
                            continue;
                        }
#if RD_PLATFORM == RD_PLATFORM_SM50
                        sumValue10 = scalarValue12 + 1u;
                        intermediateValue24 = intermediateValue25;
                        scalarValue12 = sumValue10;
                        continue;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    comparisonValue3 = intermediateValue24 / rdSignedBitsToFloat(comparisonValue18 ? 1u : (multiplyAddValue48 * multiplyAddValue48));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    intermediateValue20 = sumValue14;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    comparisonValue3 = 1.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    intermediateValue20 = 0.0f;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue19 = comparisonValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float quotientValue7 = intermediateValue20 / float(int(comparisonValue14 * comparisonValue14));
                float branchMergedValue8;
                if (quotientValue7 < 1.0f)
                {
                    branchMergedValue8 = min(1.0f, max(quotientValue7, 1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w));
                }
                else
                {
                    branchMergedValue8 = 1.0f;
                }
                intermediateValue15 = branchMergedValue8;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue19 = 1.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue15 = 1.0f;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float comparisonValue6;
            if ((int(uint(int(RD_UNIFORM_CLOUD_SHADOWS_VISIBLE.x))) > int(0u)) && (int(uint(int(RD_UNIFORM_DIRECTIONAL_SHADOW_MODE_AND_CLOUD_SHADOW_TOGGLE_AND_POINT_LIGHT_TOGGLE.y))) > int(0u)))
            {
                float multiplyAddValue53 = mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.w, multiplyAddValue33, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.w, multiplyAddValue31, multiplyAddValue32 * RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.w)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.w;
                float multiplyAddValue54 = ((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.z, multiplyAddValue33, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.z, multiplyAddValue31, multiplyAddValue32 * RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.z)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.z) / multiplyAddValue53) - (RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.y / (multiplyAddValue53 / multiplyAddValue53));
                float multiplyAddValue55 = mad((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.x, multiplyAddValue33, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.x, multiplyAddValue31, multiplyAddValue32 * RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.x)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.x) / multiplyAddValue53, 0.5f, 0.5f);
                float multiplyAddValue56 = 1.0f - mad((mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_2.y, multiplyAddValue33, mad(RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_0.y, multiplyAddValue31, multiplyAddValue32 * RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_1.y)) + RD_UNIFORM_CLOUD_SHADOW_PROJ_ROW_3.y) / multiplyAddValue53, 0.5f, 0.5f);
                uint multiplyAddValue57 = uint(clamp(int(uint(int(mad(RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.z, RD_UNIFORM_VOLUME_SHADOW_SETTINGS.x, 0.5f)))), int(1u), int(9u)));
                bool conditionValue2 = !comparisonValue18;
                uint comparisonValue30 = (comparisonValue18 ? 1u : multiplyAddValue57) >> 1u;
                float scalarValue20 = rdDot4Precise(RD_UNIFORM_CASCADES_PER_SET, 1.0f.xxxx);
                float intermediateValue27;
                intermediateValue27 = 0.0f;
                uint sumValue11;
                float intermediateValue28;
                uint scalarValue21 = 0u;
                for (;;)
                {
                    if ((conditionValue2 && (int(multiplyAddValue57) <= int(scalarValue21))) || (comparisonValue18 && (int(scalarValue21) >= int(1u))))
                    {
                        break;
                    }
                    float sumValue42 = rdSignedBitsToFloat(scalarValue21 - comparisonValue30) + 0.5f;
                    intermediateValue28 = intermediateValue27;
                    uint sumValue16;
                    float sampledTextureValue2;
                    uint scalarValue22 = 0u;
                    for (;;)
                    {
                        if ((comparisonValue18 && (int(scalarValue22) >= int(1u))) || (conditionValue2 && (int(multiplyAddValue57) <= int(scalarValue22))))
                        {
                            break;
                        }
                        float multiplyAddValue58 = mad(multiplyAddValue55, RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x, ((rdSignedBitsToFloat(scalarValue22 - comparisonValue30) + 0.5f) * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x);
                        float multiplyAddValue59 = mad(multiplyAddValue56, RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x, (sumValue42 * RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.x) * RD_UNIFORM_CASCADES_PARAMETERS_ROW_0.x);
                        if (comparisonValue18)
                        {
                            sampledTextureValue2 = (materialTexture1.SampleLevel(textureSampler1, float3(multiplyAddValue58, multiplyAddValue59, scalarValue20), 0.0f).x >= multiplyAddValue54) ? (intermediateValue28 + 1.0f) : intermediateValue28;
                        }
                        else
                        {
                            float4 vectorValue4 = materialTexture1.GatherRed(textureSampler1, float3(multiplyAddValue58, multiplyAddValue59, scalarValue20));
                            float multiplyAddValue60 = frac(mad(multiplyAddValue58, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z, 0.5f));
                            bool comparisonValue31 = vectorValue4.x >= multiplyAddValue54;
                            bool comparisonValue32 = vectorValue4.w >= multiplyAddValue54;
                            float comparisonValue33 = float(vectorValue4.y >= multiplyAddValue54);
                            float comparisonValue34 = float(vectorValue4.z >= multiplyAddValue54);
                            float multiplyAddValue61 = mad(multiplyAddValue60, comparisonValue32 ? (comparisonValue34 - 1.0f) : comparisonValue34, float(comparisonValue32));
                            sampledTextureValue2 = intermediateValue28 + mad(frac(mad(multiplyAddValue59, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.z, 0.5f)), mad(multiplyAddValue60, comparisonValue31 ? (comparisonValue33 - 1.0f) : comparisonValue33, float(comparisonValue31)) - multiplyAddValue61, multiplyAddValue61);
                        }
                        sumValue16 = scalarValue22 + 1u;
                        intermediateValue28 = sampledTextureValue2;
                        scalarValue22 = sumValue16;
                        continue;
                    }
                    sumValue11 = scalarValue21 + 1u;
                    intermediateValue27 = intermediateValue28;
                    scalarValue21 = sumValue11;
                    continue;
                }
                float comparisonValue35 = intermediateValue27 / rdSignedBitsToFloat(comparisonValue18 ? 1u : (multiplyAddValue57 * multiplyAddValue57));
                comparisonValue6 = (comparisonValue35 < 1.0f) ? min(max(1.0f - RD_UNIFORM_EMISSIVE_MULTIPLIER_AND_DESATURATION_AND_CLOUD_PCF_AND_CONTRIBUTION.w, comparisonValue35), 1.0f) : 1.0f;
            }
            else
            {
                comparisonValue6 = 1.0f;
            }
            float scalarValue23 = min(min(comparisonValue6, intermediateValue19), intermediateValue11);
            float productValue22 = max(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - min(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y * 0.100000001490116119384765625f, 8.0f), 0.0f);
            float clampedValue3 = clamp((1.0f / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue22)) * (-productValue22), 0.0f, 1.0f);
            multiplyAddValue8 = mad((clampedValue3 * clampedValue3) * mad(clampedValue3, -2.0f, 3.0f), 1.0f - scalarValue23, scalarValue23);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float scalarValue13 = min(intermediateValue, min(intermediateValue11, intermediateValue15));
            float productValue8 = max(0.0f, RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - min(RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y * 0.100000001490116119384765625f, 8.0f));
            float clampedValue1 = clamp(((-0.0f) - productValue8) / (RD_UNIFORM_SHADOW_FILTER_OFFSET_AND_RANGE_FAR_AND_MAP_SIZE_AND_NORMAL_OFFSET_STRENGTH.y - productValue8), 0.0f, 1.0f);
            productValue1 = (((clampedValue1 * clampedValue1) * (1.0f - scalarValue13)) * (3.0f - (clampedValue1 * 2.0f))) + scalarValue13;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue8 = 1.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue1 = 1.0f;
#endif
        }
        if (RD_UNIFORM_TEMPORAL_SETTINGS.x != 0.0f)
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue62 = mad(sumValue32 / RD_UNIFORM_VOLUME_DIMENSIONS.x, 2.0f, -1.0f);
            float multiplyAddValue63 = mad(sumValue33 / RD_UNIFORM_VOLUME_DIMENSIONS.y, 2.0f, -1.0f);
            float exponentialValue3 = exp2((sumValue34 / RD_UNIFORM_VOLUME_DIMENSIONS.z) * 5.770780086517333984375f);
            float multiplyAddValue64 = -mad(mad(1.0f - exponentialValue3, 0.0186573602259159088134765625f, 1.0f), RD_UNIFORM_VOLUME_NEAR_FAR.x, ((exponentialValue3 - 1.0f) * 0.0186573602259159088134765625f) * RD_UNIFORM_VOLUME_NEAR_FAR.y);
            float multiplyAddValue65 = mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue64, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue64, RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w);
            float multiplyAddValue66 = mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue65, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.w, multiplyAddValue62, multiplyAddValue63 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.w;
            float multiplyAddValue67 = ((mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue65, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.x, multiplyAddValue62, multiplyAddValue63 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue66) - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
            float multiplyAddValue68 = ((mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue65, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.y, multiplyAddValue62, multiplyAddValue63 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue66) - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
            float multiplyAddValue69 = ((mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue65, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.z, multiplyAddValue62, multiplyAddValue63 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.z)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue66) - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
            float multiplyAddValue70 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, multiplyAddValue69, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w, multiplyAddValue67, multiplyAddValue68 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
            float multiplyAddValue71 = (mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, multiplyAddValue69, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x, multiplyAddValue67, multiplyAddValue68 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue70;
            float multiplyAddValue72 = (mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, multiplyAddValue69, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y, multiplyAddValue67, multiplyAddValue68 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue70;
            float multiplyAddValue73 = (mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.z, multiplyAddValue69, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.z, multiplyAddValue67, multiplyAddValue68 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.z)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.z) / multiplyAddValue70;
            float productValue23 = (multiplyAddValue71 + 1.0f) * 0.5f;
            float productValue24 = (multiplyAddValue72 + 1.0f) * 0.5f;
            float multiplyAddValue74 = log2(mad((((-(mad(RD_UNIFORM_PREV_INV_PROJ_ROW_2.z, multiplyAddValue73, mad(RD_UNIFORM_PREV_INV_PROJ_ROW_0.z, multiplyAddValue71, multiplyAddValue72 * RD_UNIFORM_PREV_INV_PROJ_ROW_1.z)) + RD_UNIFORM_PREV_INV_PROJ_ROW_3.z)) / (mad(RD_UNIFORM_PREV_INV_PROJ_ROW_2.w, multiplyAddValue73, mad(RD_UNIFORM_PREV_INV_PROJ_ROW_0.w, multiplyAddValue71, multiplyAddValue72 * RD_UNIFORM_PREV_INV_PROJ_ROW_1.w)) + RD_UNIFORM_PREV_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x), 53.598148345947265625f, 1.0f)) * 0.17328679561614990234375f;
            float3 multiplyAddValue75 = float3(mad(-RD_UNIFORM_VOLUME_DIMENSIONS.x, productValue23, min(max(productValue23 * RD_UNIFORM_VOLUME_DIMENSIONS.x, 0.0f), RD_UNIFORM_VOLUME_DIMENSIONS.x)), mad(-RD_UNIFORM_VOLUME_DIMENSIONS.y, productValue24, min(max(productValue24 * RD_UNIFORM_VOLUME_DIMENSIONS.y, 0.0f), RD_UNIFORM_VOLUME_DIMENSIONS.y)), mad(-RD_UNIFORM_VOLUME_DIMENSIONS.z, multiplyAddValue74, min(max(multiplyAddValue74 * RD_UNIFORM_VOLUME_DIMENSIONS.z, 0.0f), RD_UNIFORM_VOLUME_DIMENSIONS.z)));
            float multiplyAddValue76 = mad(multiplyAddValue74, trunc(RD_UNIFORM_VOLUME_DIMENSIONS.z), -0.5f);
            uint sumValue43 = uint(min(int(scalarValue14 - 2u), int(uint(max(int(uint(int(multiplyAddValue76))), int(0u))))));
            float scalarValue24 = rdSignedBitsToFloat(sumValue43);
            float4 sampledTextureValue3 = materialTexture0.SampleLevel(textureSampler0, float3(productValue23, productValue24, scalarValue24), 0.0f);
            float scalarValue25 = sampledTextureValue3.x;
            intermediateValue2[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = mad(mad(clamp(sqrt(rdDot3Precise(multiplyAddValue75, multiplyAddValue75)) * RD_UNIFORM_TEMPORAL_SETTINGS.y, 0.0f, 1.0f), -RD_UNIFORM_TEMPORAL_SETTINGS.z, RD_UNIFORM_TEMPORAL_SETTINGS.z), mad(clamp(multiplyAddValue76 - scalarValue24, 0.0f, 1.0f), materialTexture0.SampleLevel(textureSampler0, float3(productValue23, productValue24, rdSignedBitsToFloat(sumValue43 + 1u)), 0.0f).x - scalarValue25, scalarValue25) - multiplyAddValue8, multiplyAddValue8).xxxx;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float quotientValue8 = ((sumValue / RD_UNIFORM_VOLUME_DIMENSIONS.x) * 2.0f) + (-1.0f);
            float quotientValue9 = ((sumValue1 / RD_UNIFORM_VOLUME_DIMENSIONS.y) * 2.0f) + (-1.0f);
            float exponentialValue1 = (exp2((sumValue2 / RD_UNIFORM_VOLUME_DIMENSIONS.z) * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f;
            float productValue9 = (-0.0f) - ((exponentialValue1 * RD_UNIFORM_VOLUME_NEAR_FAR.y) + ((1.0f - exponentialValue1) * RD_UNIFORM_VOLUME_NEAR_FAR.x));
            float multiplyAddValue13 = (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.z, productValue9, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.z) / (mad(RD_UNIFORM_PROJECTION_MATRIX_ROW_2.w, productValue9, 0.0f) + RD_UNIFORM_PROJECTION_MATRIX_ROW_3.w);
            float multiplyAddValue14 = mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.w, multiplyAddValue13, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.w, quotientValue9, quotientValue8 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.w)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.w;
            float multiplyAddValue15 = ((mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.x, multiplyAddValue13, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.x, quotientValue9, quotientValue8 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.x)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue14) - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
            float multiplyAddValue16 = ((mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.y, multiplyAddValue13, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.y, quotientValue9, quotientValue8 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.y)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue14) - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
            float multiplyAddValue17 = ((mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_2.z, multiplyAddValue13, mad(RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_1.z, quotientValue9, quotientValue8 * RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_0.z)) + RD_UNIFORM_INVERSE_VIEW_PROJECTION_MATRIX_ROW_3.z) / multiplyAddValue14) - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
            float multiplyAddValue18 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, multiplyAddValue17, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, multiplyAddValue16, multiplyAddValue15 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
            float multiplyAddValue19 = (mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, multiplyAddValue17, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, multiplyAddValue16, multiplyAddValue15 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue18;
            float multiplyAddValue20 = (mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, multiplyAddValue17, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, multiplyAddValue16, multiplyAddValue15 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue18;
            float multiplyAddValue21 = (mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.z, multiplyAddValue17, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.z, multiplyAddValue16, multiplyAddValue15 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.z)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.z) / multiplyAddValue18;
            float productValue10 = (multiplyAddValue19 + 1.0f) * 0.5f;
            float productValue11 = (multiplyAddValue20 + 1.0f) * 0.5f;
            float multiplyAddValue25 = log2(((((((-0.0f) - (RD_UNIFORM_PREV_INV_PROJ_ROW_3.z + mad(RD_UNIFORM_PREV_INV_PROJ_ROW_2.z, multiplyAddValue21, mad(RD_UNIFORM_PREV_INV_PROJ_ROW_1.z, multiplyAddValue20, multiplyAddValue19 * RD_UNIFORM_PREV_INV_PROJ_ROW_0.z)))) / (mad(RD_UNIFORM_PREV_INV_PROJ_ROW_2.w, multiplyAddValue21, mad(RD_UNIFORM_PREV_INV_PROJ_ROW_1.w, multiplyAddValue20, multiplyAddValue19 * RD_UNIFORM_PREV_INV_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_INV_PROJ_ROW_3.w)) - RD_UNIFORM_VOLUME_NEAR_FAR.x) / (RD_UNIFORM_VOLUME_NEAR_FAR.y - RD_UNIFORM_VOLUME_NEAR_FAR.x)) * 53.598148345947265625f) + 1.0f) * 0.17328679561614990234375f;
            float productValue12 = productValue10 * RD_UNIFORM_VOLUME_DIMENSIONS.x;
            float productValue17 = productValue11 * RD_UNIFORM_VOLUME_DIMENSIONS.y;
            float productValue18 = multiplyAddValue25 * RD_UNIFORM_VOLUME_DIMENSIONS.z;
            float sumValue28 = min(max(productValue12, 0.0f), RD_UNIFORM_VOLUME_DIMENSIONS.x) - productValue12;
            float sumValue29 = min(max(productValue17, 0.0f), RD_UNIFORM_VOLUME_DIMENSIONS.y) - productValue17;
            float sumValue30 = min(max(productValue18, 0.0f), RD_UNIFORM_VOLUME_DIMENSIONS.z) - productValue18;
            uint scalarValue14 = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
            float productValue19 = (multiplyAddValue25 * float(int(scalarValue14))) + (-0.5f);
            uint sumValue31 = uint(min(int(uint(max(int(uint(int(productValue19))), int(0u)))), int(scalarValue14 + 4294967294u)));
            float scalarValue15 = float(int(sumValue31));
            float4 sampledTextureValue = previousCascadedShadowBufferTexture.SampleLevel(previousCascadedShadowBufferSampler, float3(productValue10, productValue11, scalarValue15), 0.0f);
            float scalarValue16 = sampledTextureValue.x;
            cascadedShadowBufferOutTexture[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = ((((scalarValue16 - productValue1) + ((previousCascadedShadowBufferTexture.SampleLevel(previousCascadedShadowBufferSampler, float3(productValue10, productValue11, float(int(sumValue31 + 1u))), 0.0f).x - scalarValue16) * min(max(productValue19 - scalarValue15, 0.0f), 1.0f))) * (RD_UNIFORM_TEMPORAL_SETTINGS.z - (clamp(sqrt(((sumValue29 * sumValue29) + (sumValue28 * sumValue28)) + (sumValue30 * sumValue30)) * RD_UNIFORM_TEMPORAL_SETTINGS.y, 0.0f, 1.0f) * RD_UNIFORM_TEMPORAL_SETTINGS.z))) + productValue1).xxxx;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue2[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = multiplyAddValue8.xxxx;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            cascadedShadowBufferOutTexture[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = productValue1.xxxx;
#endif
        }
    }
}
#if RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128
[numthreads(8, 8, 2)]
#elif RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT256
[numthreads(8, 8, 4)]
#elif RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE
[numthreads(8, 8, 8)]
#endif
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
