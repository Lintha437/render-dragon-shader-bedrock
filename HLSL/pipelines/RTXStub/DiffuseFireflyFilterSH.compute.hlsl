// RTXStub / DiffuseFireflyFilterSH / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 29
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    if (!(inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).x == 65504.0f))
    {
        uint reinterpretedBits = (asuint(rootConstantsConstants[0u]).x & 255u) + 0u;
        uint reinterpretedBits1 = asuint(rootConstantsConstants[0u]).x & 255u;
        uint reinterpretedBits2 = (asuint(rootConstantsConstants[0u]).x >> 8u) & 255u;
        float4 vectorValue = denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue = vectorValue.x;
        float scalarValue1 = vectorValue.y;
        float scalarValue2 = vectorValue.z;
        float scalarValue3 = vectorValue.w;
        float4 vectorValue1 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue4 = vectorValue1.x;
        float scalarValue5 = vectorValue1.y;
        float scalarValue6 = vectorValue1.w;
        uint sumValue = dispatchThreadId.x + 4294967295u;
        uint sumValue1 = dispatchThreadId.y + 4294967295u;
        float4 vectorValue2 = denoisingOutputs[reinterpretedBits][uint2(sumValue, sumValue1)].xxxx;
        float4 vectorValue3 = denoisingOutputs[reinterpretedBits][uint2(sumValue, dispatchThreadId.y)].xxxx;
        uint sumValue2 = dispatchThreadId.y + 1u;
        float4 vectorValue4 = denoisingOutputs[reinterpretedBits][uint2(sumValue, sumValue2)].xxxx;
        float4 vectorValue5 = denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, sumValue2)].xxxx;
        float4 vectorValue6 = denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, sumValue1)].xxxx;
        uint sumValue3 = dispatchThreadId.x + 1u;
        float4 vectorValue7 = denoisingOutputs[reinterpretedBits][uint2(sumValue3, sumValue1)].xxxx;
        float4 vectorValue8 = denoisingOutputs[reinterpretedBits][uint2(sumValue3, dispatchThreadId.y)].xxxx;
        float4 vectorValue9 = denoisingOutputs[reinterpretedBits][uint2(sumValue3, sumValue2)].xxxx;
        float4 vectorValue10 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(sumValue, sumValue1)].xxxx;
        float4 vectorValue11 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(sumValue, dispatchThreadId.y)].xxxx;
        float4 vectorValue12 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(sumValue, sumValue2)].xxxx;
        float4 vectorValue13 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(dispatchThreadId.x, sumValue2)].xxxx;
        float4 vectorValue14 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(dispatchThreadId.x, sumValue1)].xxxx;
        float4 vectorValue15 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(sumValue3, sumValue1)].xxxx;
        float4 vectorValue16 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(sumValue3, dispatchThreadId.y)].xxxx;
        float4 vectorValue17 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(sumValue3, sumValue2)].xxxx;
        float productValue = (((((((vectorValue3.w + vectorValue2.w) + vectorValue4.w) + vectorValue5.w) + vectorValue6.w) + vectorValue7.w) + vectorValue8.w) + vectorValue9.w) * 0.125f;
        float intermediateValue25;
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
        float intermediateValue29;
        float intermediateValue30;
        if (scalarValue3 != 0.0f)
        {
            uint reinterpretedBits3 = ((asuint(rootConstantsConstants[0u]).x >> 24u) << 1u) + 47u;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            float branchMergedValue3;
            float branchMergedValue4;
            float branchMergedValue5;
            if ((productValue / scalarValue3) < (((viewCbConstants[reinterpretedBits3].x - viewCbConstants[reinterpretedBits3].y) * clamp(outputBufferHistoryLength[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx.x * 63.75f, 0.0f, 1.0f)) + viewCbConstants[reinterpretedBits3].y))
            {
                branchMergedValue = (((((((vectorValue3.x + vectorValue2.x) + vectorValue4.x) + vectorValue5.x) + vectorValue6.x) + vectorValue7.x) + vectorValue8.x) + vectorValue9.x) * 0.125f;
                branchMergedValue1 = (((((((vectorValue3.y + vectorValue2.y) + vectorValue4.y) + vectorValue5.y) + vectorValue6.y) + vectorValue7.y) + vectorValue8.y) + vectorValue9.y) * 0.125f;
                branchMergedValue2 = (((((((vectorValue3.z + vectorValue2.z) + vectorValue4.z) + vectorValue5.z) + vectorValue6.z) + vectorValue7.z) + vectorValue8.z) + vectorValue9.z) * 0.125f;
                branchMergedValue3 = productValue;
                branchMergedValue4 = (((((((vectorValue11.x + vectorValue10.x) + vectorValue12.x) + vectorValue13.x) + vectorValue14.x) + vectorValue15.x) + vectorValue16.x) + vectorValue17.x) * 0.125f;
                branchMergedValue5 = (((((((vectorValue11.y + vectorValue10.y) + vectorValue12.y) + vectorValue13.y) + vectorValue14.y) + vectorValue15.y) + vectorValue16.y) + vectorValue17.y) * 0.125f;
            }
            else
            {
                branchMergedValue = scalarValue;
                branchMergedValue1 = scalarValue1;
                branchMergedValue2 = scalarValue2;
                branchMergedValue3 = scalarValue3;
                branchMergedValue4 = scalarValue4;
                branchMergedValue5 = scalarValue5;
            }
            intermediateValue25 = branchMergedValue;
            intermediateValue26 = branchMergedValue1;
            intermediateValue27 = branchMergedValue2;
            intermediateValue28 = branchMergedValue3;
            intermediateValue29 = branchMergedValue4;
            intermediateValue30 = branchMergedValue5;
        }
        else
        {
            intermediateValue25 = scalarValue;
            intermediateValue26 = scalarValue1;
            intermediateValue27 = scalarValue2;
            intermediateValue28 = scalarValue3;
            intermediateValue29 = scalarValue4;
            intermediateValue30 = scalarValue5;
        }
        uint reinterpretedBits4 = asuint(intermediateValue25) & 2147483647u;
        uint reinterpretedBits5 = asuint(intermediateValue26) & 2147483647u;
        uint reinterpretedBits6 = asuint(intermediateValue27) & 2147483647u;
        uint reinterpretedBits7 = asuint(intermediateValue28) & 2147483647u;
        if (!(((((reinterpretedBits4 > 2139095040u) || (reinterpretedBits5 > 2139095040u)) || (reinterpretedBits6 > 2139095040u)) || (reinterpretedBits7 > 2139095040u)) || ((((reinterpretedBits4 == 2139095040u) || (reinterpretedBits5 == 2139095040u)) || (reinterpretedBits6 == 2139095040u)) || (reinterpretedBits7 == 2139095040u))))
        {
            denoisingOutputs[((asuint(rootConstantsConstants[0u]).x >> 8u) & 255u) + 0u][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue25, intermediateValue26, intermediateValue27, intermediateValue28).x;
        }
        uint reinterpretedBits8 = asuint(intermediateValue29) & 2147483647u;
        uint reinterpretedBits9 = asuint(intermediateValue30) & 2147483647u;
        uint reinterpretedBits10 = asuint(scalarValue6) & 2147483647u;
        if (!(((reinterpretedBits10 > 2139095040u) || ((reinterpretedBits8 > 2139095040u) || (reinterpretedBits9 > 2139095040u))) || ((reinterpretedBits10 == 2139095040u) || ((reinterpretedBits8 == 2139095040u) || (reinterpretedBits9 == 2139095040u)))))
        {
            denoisingChromaAndVarianceOutputs[reinterpretedBits2][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue29, intermediateValue30, 0.0f, scalarValue6).x;
        }
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
