// BilateralGrid / FilterBilateralGrid / compute forward pipeline.
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
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/BilateralGrid/ComputeBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue6 = uint(RD_UNIFORM_GRID_DIMENSIONS.x);
    uint scalarValue7 = uint(RD_UNIFORM_GRID_DIMENSIONS.y);
    if (((dispatchThreadId.x < scalarValue6) && (dispatchThreadId.y < scalarValue7)) && (dispatchThreadId.z < uint(RD_UNIFORM_GRID_DIMENSIONS.z)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if ((dispatchThreadId.z < uint(RD_UNIFORM_GRID_DIMENSIONS.z)) && ((dispatchThreadId.x < uint(RD_UNIFORM_GRID_DIMENSIONS.x)) && (dispatchThreadId.y < uint(RD_UNIFORM_GRID_DIMENSIONS.y))))
#endif
    {
        uint scalarValue = uint(int(RD_UNIFORM_BILATERAL_FILTER_PARAMS.x));
#if RD_PLATFORM == RD_PLATFORM_SM50
        float scalarValue8 = trunc(RD_UNIFORM_BILATERAL_FILTER_PARAMS.x);
        float productValue5 = (scalarValue8 * scalarValue8) * 0.5f;
        uint sumValue14 = uint(int(RD_UNIFORM_GRID_DIMENSIONS.x)) - 1u;
        uint sumValue15 = uint(int(RD_UNIFORM_GRID_DIMENSIONS.y)) - 1u;
        uint sumValue16 = uint(min(int(sumValue14), int(uint(max(int(dispatchThreadId.x - scalarValue), int(0u))))));
        uint sumValue17 = uint(min(int(sumValue15), int(uint(max(int(dispatchThreadId.y - scalarValue), int(0u))))));
        uint sumValue18 = uint(min(int(uint(max(int(dispatchThreadId.x + scalarValue), int(0u)))), int(sumValue14)));
        uint sumValue19 = uint(min(int(sumValue15), int(uint(max(int(scalarValue + dispatchThreadId.y), int(0u))))));
        uint productValue6 = dispatchThreadId.z * scalarValue6;
        float scalarValue9 = rdUnsignedToFloat(dispatchThreadId.x);
        float scalarValue10 = rdUnsignedToFloat(dispatchThreadId.y);
        float intermediateValue9;
        float intermediateValue11;
        float intermediateValue13;
        intermediateValue9 = 0.0f;
        intermediateValue11 = 0.0f;
        intermediateValue13 = 0.0f;
        uint sumValue6;
        float intermediateValue10;
        float intermediateValue12;
        float intermediateValue14;
        uint scalarValue11 = sumValue17;
        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float scalarValue1 = float(int(scalarValue));
        float productValue = (scalarValue1 * scalarValue1) * 0.5f;
        uint sumValue = uint(int(RD_UNIFORM_GRID_DIMENSIONS.x)) + 4294967295u;
        uint sumValue1 = uint(min(int(uint(max(int(dispatchThreadId.x - scalarValue), int(0u)))), int(sumValue)));
        uint sumValue2 = uint(min(int(uint(max(int(scalarValue + dispatchThreadId.x), int(0u)))), int(sumValue)));
        uint sumValue3 = uint(int(RD_UNIFORM_GRID_DIMENSIONS.y)) + 4294967295u;
        uint sumValue4 = uint(min(int(uint(max(int(dispatchThreadId.y - scalarValue), int(0u)))), int(sumValue3)));
        uint sumValue5 = uint(min(int(uint(max(int(scalarValue + dispatchThreadId.y), int(0u)))), int(sumValue3)));
        float intermediateValue2;
        float intermediateValue4;
        float intermediateValue6;
        if (sumValue4 > sumValue5)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            if (sumValue19 < scalarValue11)
            {
                break;
            }
            uint productValue7 = (productValue6 * scalarValue7) + (scalarValue6 * scalarValue11);
            float sumValue20 = rdUnsignedToFloat(scalarValue11) - scalarValue10;
            float productValue8 = sumValue20 * sumValue20;
            intermediateValue10 = intermediateValue9;
            intermediateValue12 = intermediateValue11;
            intermediateValue14 = intermediateValue13;
            float sumValue8;
            float multiplyAddValue;
            float multiplyAddValue1;
            uint sumValue9;
            uint scalarValue12 = sumValue16;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue2 = 0.0f;
            intermediateValue4 = 0.0f;
            intermediateValue6 = 0.0f;
        }
        else
        {
            float intermediateValue3;
            float intermediateValue5;
            float intermediateValue7;
            float scalarValue2 = 0.0f;
            float scalarValue3 = 0.0f;
            float scalarValue4 = 0.0f;
            uint scalarValue5 = sumValue4;
            bool intermediateValue12;
#endif
            for (;;)
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                if (sumValue18 < scalarValue12)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue12 = sumValue1 > sumValue2;
                float branchMergedValue;
                float branchMergedValue1;
                float branchMergedValue2;
                if (intermediateValue12)
                {
                    branchMergedValue = scalarValue2;
                    branchMergedValue1 = scalarValue3;
                    branchMergedValue2 = scalarValue4;
                }
                else
                {
                    float intermediateValue13;
                    float intermediateValue14;
                    float intermediateValue15;
                    uint intermediateValue16;
                    intermediateValue13 = scalarValue2;
                    intermediateValue14 = scalarValue3;
                    intermediateValue15 = scalarValue4;
                    intermediateValue16 = sumValue1;
                    float productValue1;
                    float productValue2;
                    float sumValue7;
                    for (;;)
                    {
                        uint productValue3 = (((uint(RD_UNIFORM_GRID_DIMENSIONS.y) * dispatchThreadId.z) + scalarValue5) * uint(RD_UNIFORM_GRID_DIMENSIONS.x)) + intermediateValue16;
                        float sumValue10 = float(intermediateValue16) - float(dispatchThreadId.x);
                        float sumValue11 = float(scalarValue5) - float(dispatchThreadId.y);
                        float exponentialValue = exp2((((-0.0f) - ((sumValue11 * sumValue11) + (sumValue10 * sumValue10))) / productValue) * 1.44269502162933349609375f);
                        float productValue4 = exponentialValue * 0.00390625f;
                        productValue1 = (productValue4 * float(rdAccess_bilateralGrid(productValue3 * 2u).xxxx.x)) + intermediateValue13;
                        productValue2 = (productValue4 * float(rdAccess_bilateralGrid((productValue3 * 2u) + 1u).xxxx.x)) + intermediateValue14;
                        sumValue7 = exponentialValue + intermediateValue15;
                        uint sumValue12 = intermediateValue16 + 1u;
                        if (sumValue12 > sumValue2)
                        {
                            break;
                        }
                        else
                        {
                            intermediateValue13 = productValue1;
                            intermediateValue14 = productValue2;
                            intermediateValue15 = sumValue7;
                            intermediateValue16 = sumValue12;
                        }
                    }
                    branchMergedValue = productValue1;
                    branchMergedValue1 = productValue2;
                    branchMergedValue2 = sumValue7;
                }
                intermediateValue3 = branchMergedValue;
                intermediateValue5 = branchMergedValue1;
                intermediateValue7 = branchMergedValue2;
                uint sumValue13 = scalarValue5 + 1u;
                if (sumValue13 > sumValue5)
#endif
                {
                    break;
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                uint productValue9 = (productValue7 + scalarValue12) * 2u;
                uint2 sumValue21 = uint2(rdAccess_intermediateValue1(productValue9).xxxx.x, rdAccess_intermediateValue1(productValue9 + 1u).xxxx.x);
                float sumValue22 = rdUnsignedToFloat(scalarValue12) - scalarValue9;
                float multiplyAddValue2 = exp2(((-mad(sumValue22, sumValue22, productValue8)) / productValue5) * 1.44269502162933349609375f);
                multiplyAddValue1 = mad(multiplyAddValue2, rdUnsignedToFloat(sumValue21.x) * 0.00390625f, intermediateValue14);
                multiplyAddValue = mad(multiplyAddValue2, rdUnsignedToFloat(sumValue21.y) * 0.00390625f, intermediateValue12);
                sumValue8 = intermediateValue10 + multiplyAddValue2;
                sumValue9 = scalarValue12 + 1u;
                intermediateValue10 = sumValue8;
                intermediateValue12 = multiplyAddValue;
                intermediateValue14 = multiplyAddValue1;
                scalarValue12 = sumValue9;
                continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                else
                {
                    scalarValue2 = intermediateValue3;
                    scalarValue3 = intermediateValue5;
                    scalarValue4 = intermediateValue7;
                    scalarValue5 = sumValue13;
                    continue;
                }
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            sumValue6 = scalarValue11 + 1u;
            intermediateValue9 = intermediateValue10;
            intermediateValue11 = intermediateValue12;
            intermediateValue13 = intermediateValue14;
            scalarValue11 = sumValue6;
            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue2 = intermediateValue3;
            intermediateValue4 = intermediateValue5;
            intermediateValue6 = intermediateValue7;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        rdAccess_intermediateValue(uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)) = float4(intermediateValue13 / intermediateValue9, intermediateValue11 / intermediateValue9, 0.0f, 0.0f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        filteredBilateralGridOutputTexture[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(intermediateValue2 / intermediateValue6, intermediateValue4 / intermediateValue6, 0.0f, 0.0f);
#endif
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
