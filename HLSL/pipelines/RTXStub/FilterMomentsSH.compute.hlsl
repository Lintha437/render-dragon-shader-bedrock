// RTXStub / FilterMomentsSH / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint reinterpretedBits = (asuint(rootConstantsConstants[0u]).x >> 16u) & 255u;
    uint reinterpretedBits1 = (asuint(rootConstantsConstants[0u]).x >> 8u) & 255u;
    float4 vectorValue = outputDenoisingMoments[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
    float scalarValue = vectorValue.x;
    float scalarValue1 = vectorValue.y;
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
        uint4 loadedBufferValue1 = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
        uint scalarValue5 = loadedBufferValue1.x;
        uint multiplyAddValue = uint(int(mad(scalarValue2, 0.004999999888241291046142578125f, 0.02500000037252902984619140625f) * 1023.0f));
        float intermediateValue11;
        float intermediateValue13;
        float intermediateValue15;
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        uint intermediateValue20;
        float scalarValue6 = 1.0f;
        float scalarValue7 = scalarValue;
        float scalarValue8 = scalarValue1;
        uint scalarValue9 = 4294967294u;
        for (;;)
        {
            intermediateValue17 = scalarValue6;
            intermediateValue18 = scalarValue7;
            intermediateValue19 = scalarValue8;
            intermediateValue20 = 4294967294u;
            uint sumValue2;
            uint sumValue3;
            bool comparisonValue;
            for (;;)
            {
                sumValue2 = intermediateValue20 + dispatchThreadId.x;
                sumValue3 = scalarValue9 + dispatchThreadId.y;
                comparisonValue = ((intermediateValue20 | scalarValue9) != 0u) && (((int(sumValue3) > int(4294967295u)) && (int(sumValue2) >= int(intermediateValue6))) && ((int(sumValue3) < int(intermediateValue8)) && (int(sumValue2) < int(intermediateValue7))));
                float branchMergedValue;
                float branchMergedValue1;
                float branchMergedValue2;
                if (comparisonValue)
                {
                    uint loadedBufferValue2 = uint4(inputPlaneIdentifier.Load(int3(uint2(sumValue2, sumValue3), 0u))).x - scalarValue5;
                    float comparisonValue1 = float(int(uint(abs(int(loadedBufferValue2)))) <= int(multiplyAddValue));
                    float4 vectorValue1 = outputDenoisingMoments[reinterpretedBits][uint2(sumValue2, sumValue3)].xxxx;
                    branchMergedValue = comparisonValue1 + intermediateValue17;
                    branchMergedValue1 = (vectorValue1.x * comparisonValue1) + intermediateValue18;
                    branchMergedValue2 = (vectorValue1.y * comparisonValue1) + intermediateValue19;
                }
                else
                {
                    branchMergedValue = intermediateValue17;
                    branchMergedValue1 = intermediateValue18;
                    branchMergedValue2 = intermediateValue19;
                }
                intermediateValue11 = branchMergedValue;
                intermediateValue13 = branchMergedValue1;
                intermediateValue15 = branchMergedValue2;
                uint sumValue = intermediateValue20 + 1u;
                if (sumValue == 3u)
                {
                    break;
                }
                else
                {
                    intermediateValue17 = intermediateValue11;
                    intermediateValue18 = intermediateValue13;
                    intermediateValue19 = intermediateValue15;
                    intermediateValue20 = sumValue;
                    continue;
                }
            }
            uint sumValue1 = scalarValue9 + 1u;
            if (sumValue1 == 3u)
            {
                break;
            }
            else
            {
                scalarValue6 = intermediateValue11;
                scalarValue7 = intermediateValue13;
                scalarValue8 = intermediateValue15;
                scalarValue9 = sumValue1;
                continue;
            }
        }
        float quotientValue = intermediateValue13 / intermediateValue11;
        outputDenoisingMoments[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(quotientValue, intermediateValue15 / intermediateValue11, quotientValue, quotientValue).x;
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
