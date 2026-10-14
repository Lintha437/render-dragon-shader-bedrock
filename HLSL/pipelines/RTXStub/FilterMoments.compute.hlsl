// RTXStub / FilterMoments / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint reinterpretedBits = (asuint(rootConstantsConstants[0u]).x >> 16u) & 255u;
    uint reinterpretedBits1 = (asuint(rootConstantsConstants[0u]).x >> 8u) & 255u;
    float4 vectorValue = outputDenoisingMoments[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
    float scalarValue = vectorValue.x;
    float scalarValue1 = vectorValue.y;
    uint reinterpretedBits2 = asuint(rootConstantsConstants[0u]).x >> 24u;
    float4 loadedBufferValue = inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
    float scalarValue2 = loadedBufferValue.x;
    uint intermediateValue6;
    uint intermediateValue7;
    uint intermediateValue8;
    if (asuint(viewCbConstants[91u]).y == 2u)
    {
        intermediateValue6 = 0u;
        intermediateValue7 = uint(int(viewCbConstants[78u].x));
        intermediateValue8 = uint(int(viewCbConstants[78u].y));
    }
    else
    {
        uint scalarValue3 = uint(viewCbConstants[80u].x);
        uint scalarValue4 = uint(viewCbConstants[78u].y);
        uint branchMergedValue3;
        uint branchMergedValue4;
        uint branchMergedValue5;
        if (dispatchThreadId.x < scalarValue3)
        {
            branchMergedValue3 = 0u;
            branchMergedValue4 = scalarValue3;
            branchMergedValue5 = scalarValue4;
        }
        else
        {
            branchMergedValue3 = scalarValue3;
            branchMergedValue4 = uint(viewCbConstants[78u].x);
            branchMergedValue5 = scalarValue4;
        }
        intermediateValue6 = branchMergedValue3;
        intermediateValue7 = branchMergedValue4;
        intermediateValue8 = branchMergedValue5;
    }
    if (((outputBufferHistoryLength[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx.x * 255.0f) >= 4.0f) || (scalarValue2 == 65504.0f))
    {
        outputDenoisingMoments[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(scalarValue, scalarValue1, scalarValue, scalarValue).x;
    }
    else
    {
        float4 loadedBufferValue1 = inputBufferNormal.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue5 = loadedBufferValue1.x;
        float scalarValue6 = loadedBufferValue1.y;
        float sumValue = 1.0f - abs(scalarValue5);
        float scalarValue7 = abs(scalarValue6);
        float sumValue1 = sumValue - scalarValue7;
        bool conditionValue = sumValue1 < 0.0f;
        float comparisonValue = conditionValue ? ((1.0f - scalarValue7) * ((scalarValue5 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue5;
        float comparisonValue1 = conditionValue ? (((scalarValue6 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue) : scalarValue6;
        float inverseLengthValue = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue1), float3(comparisonValue, comparisonValue1, sumValue1)));
        float productValue = comparisonValue * inverseLengthValue;
        float productValue1 = comparisonValue1 * inverseLengthValue;
        float productValue2 = inverseLengthValue * sumValue1;
        uint4 loadedBufferValue2 = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
        uint scalarValue8 = loadedBufferValue2.x;
        uint multiplyAddValue = uint(int(mad(scalarValue2, 0.004999999888241291046142578125f, 0.02500000037252902984619140625f) * 1023.0f));
        float intermediateValue15;
        float intermediateValue17;
        float intermediateValue19;
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
        uint intermediateValue24;
        float scalarValue9 = 1.0f;
        float scalarValue10 = scalarValue;
        float scalarValue11 = scalarValue1;
        uint scalarValue12 = 4294967294u;
        for (;;)
        {
            intermediateValue21 = scalarValue9;
            intermediateValue22 = scalarValue10;
            intermediateValue23 = scalarValue11;
            intermediateValue24 = 4294967294u;
            uint sumValue4;
            uint sumValue5;
            bool comparisonValue2;
            for (;;)
            {
                sumValue4 = intermediateValue24 + dispatchThreadId.x;
                sumValue5 = scalarValue12 + dispatchThreadId.y;
                comparisonValue2 = ((intermediateValue24 | scalarValue12) != 0u) && (((int(sumValue5) > int(4294967295u)) && (int(sumValue4) >= int(intermediateValue6))) && ((int(sumValue5) < int(intermediateValue8)) && (int(sumValue4) < int(intermediateValue7))));
                float branchMergedValue;
                float branchMergedValue1;
                float branchMergedValue2;
                if (comparisonValue2)
                {
                    uint loadedBufferValue3 = uint4(inputPlaneIdentifier.Load(int3(uint2(sumValue4, sumValue5), 0u))).x - scalarValue8;
                    float4 loadedBufferValue4 = inputBufferNormal.Load(int3(uint2(sumValue4, sumValue5), 0u));
                    float scalarValue13 = loadedBufferValue4.x;
                    float scalarValue14 = loadedBufferValue4.y;
                    float sumValue2 = 1.0f - abs(scalarValue13);
                    float scalarValue15 = abs(scalarValue14);
                    float sumValue3 = sumValue2 - scalarValue15;
                    bool conditionValue1 = sumValue3 < 0.0f;
                    float comparisonValue3 = conditionValue1 ? ((1.0f - scalarValue15) * ((scalarValue13 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue13;
                    float comparisonValue4 = conditionValue1 ? (((scalarValue14 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue2) : scalarValue14;
                    float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue3, comparisonValue4, sumValue3), float3(comparisonValue3, comparisonValue4, sumValue3)));
                    float clampedValue = exp2(log2(clamp(dot(float3(productValue, productValue1, productValue2), float3(comparisonValue3 * inverseLengthValue1, comparisonValue4 * inverseLengthValue1, inverseLengthValue1 * sumValue3)), 0.0f, 1.0f)) * viewCbConstants[(reinterpretedBits2 << 1u) + 46u].z) * float(int(uint(abs(int(loadedBufferValue3)))) <= int(multiplyAddValue));
                    float4 vectorValue1 = outputDenoisingMoments[reinterpretedBits][uint2(sumValue4, sumValue5)].xxxx;
                    branchMergedValue = clampedValue + intermediateValue21;
                    branchMergedValue1 = (vectorValue1.x * clampedValue) + intermediateValue22;
                    branchMergedValue2 = (vectorValue1.y * clampedValue) + intermediateValue23;
                }
                else
                {
                    branchMergedValue = intermediateValue21;
                    branchMergedValue1 = intermediateValue22;
                    branchMergedValue2 = intermediateValue23;
                }
                intermediateValue15 = branchMergedValue;
                intermediateValue17 = branchMergedValue1;
                intermediateValue19 = branchMergedValue2;
                uint sumValue6 = intermediateValue24 + 1u;
                if (sumValue6 == 3u)
                {
                    break;
                }
                else
                {
                    intermediateValue21 = intermediateValue15;
                    intermediateValue22 = intermediateValue17;
                    intermediateValue23 = intermediateValue19;
                    intermediateValue24 = sumValue6;
                    continue;
                }
            }
            uint sumValue7 = scalarValue12 + 1u;
            if (sumValue7 == 3u)
            {
                break;
            }
            else
            {
                scalarValue9 = intermediateValue15;
                scalarValue10 = intermediateValue17;
                scalarValue11 = intermediateValue19;
                scalarValue12 = sumValue7;
                continue;
            }
        }
        float quotientValue = intermediateValue17 / intermediateValue15;
        outputDenoisingMoments[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(quotientValue, intermediateValue19 / intermediateValue15, quotientValue, quotientValue).x;
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
