// RTXStub / DiffuseFireflyFilter / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 27
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    if (!(inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).x == 65504.0f))
    {
        uint reinterpretedBits = (asuint(rootConstantsConstants[0u]).x & 255u) + 0u;
        float4 vectorValue = denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue = vectorValue.x;
        float scalarValue1 = vectorValue.y;
        float scalarValue2 = vectorValue.z;
        float scalarValue3 = vectorValue.w;
        uint sumValue = dispatchThreadId.x + 4294967295u;
        uint sumValue1 = dispatchThreadId.y + 4294967295u;
        float4 vectorValue1 = denoisingOutputs[reinterpretedBits][uint2(sumValue, sumValue1)].xxxx;
        float4 vectorValue2 = denoisingOutputs[reinterpretedBits][uint2(sumValue, dispatchThreadId.y)].xxxx;
        uint sumValue2 = dispatchThreadId.y + 1u;
        float4 vectorValue3 = denoisingOutputs[reinterpretedBits][uint2(sumValue, sumValue2)].xxxx;
        float4 vectorValue4 = denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, sumValue2)].xxxx;
        float4 vectorValue5 = denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, sumValue1)].xxxx;
        uint sumValue3 = dispatchThreadId.x + 1u;
        float4 vectorValue6 = denoisingOutputs[reinterpretedBits][uint2(sumValue3, sumValue1)].xxxx;
        float4 vectorValue7 = denoisingOutputs[reinterpretedBits][uint2(sumValue3, dispatchThreadId.y)].xxxx;
        float4 vectorValue8 = denoisingOutputs[reinterpretedBits][uint2(sumValue3, sumValue2)].xxxx;
        float productValue = (((((((vectorValue2.x + vectorValue1.x) + vectorValue3.x) + vectorValue4.x) + vectorValue5.x) + vectorValue6.x) + vectorValue7.x) + vectorValue8.x) * 0.125f;
        float productValue1 = (((((((vectorValue2.y + vectorValue1.y) + vectorValue3.y) + vectorValue4.y) + vectorValue5.y) + vectorValue6.y) + vectorValue7.y) + vectorValue8.y) * 0.125f;
        float productValue2 = (((((((vectorValue2.z + vectorValue1.z) + vectorValue3.z) + vectorValue4.z) + vectorValue5.z) + vectorValue6.z) + vectorValue7.z) + vectorValue8.z) * 0.125f;
        float dotProductValue = dot(float3(scalarValue, scalarValue1, scalarValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
        if (dotProductValue != 0.0f)
        {
            uint reinterpretedBits1 = ((asuint(rootConstantsConstants[0u]).x >> 24u) << 1u) + 47u;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((dot(float3(productValue, productValue1, productValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) / dotProductValue) < (((viewCbConstants[reinterpretedBits1].x - viewCbConstants[reinterpretedBits1].y) * clamp(outputBufferHistoryLength[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx.x * 63.75f, 0.0f, 1.0f)) + viewCbConstants[reinterpretedBits1].y))
            {
                branchMergedValue = productValue;
                branchMergedValue1 = productValue1;
                branchMergedValue2 = productValue2;
            }
            else
            {
                branchMergedValue = scalarValue;
                branchMergedValue1 = scalarValue1;
                branchMergedValue2 = scalarValue2;
            }
            intermediateValue13 = branchMergedValue;
            intermediateValue14 = branchMergedValue1;
            intermediateValue15 = branchMergedValue2;
        }
        else
        {
            intermediateValue13 = scalarValue;
            intermediateValue14 = scalarValue1;
            intermediateValue15 = scalarValue2;
        }
        uint reinterpretedBits2 = asuint(intermediateValue13) & 2147483647u;
        uint reinterpretedBits3 = asuint(intermediateValue14) & 2147483647u;
        uint reinterpretedBits4 = asuint(intermediateValue15) & 2147483647u;
        uint reinterpretedBits5 = asuint(scalarValue3) & 2147483647u;
        if (!(((reinterpretedBits5 > 2139095040u) || (((reinterpretedBits2 > 2139095040u) || (reinterpretedBits3 > 2139095040u)) || (reinterpretedBits4 > 2139095040u))) || ((reinterpretedBits5 == 2139095040u) || (((reinterpretedBits2 == 2139095040u) || (reinterpretedBits3 == 2139095040u)) || (reinterpretedBits4 == 2139095040u)))))
        {
            denoisingOutputs[((asuint(rootConstantsConstants[0u]).x >> 8u) & 255u) + 0u][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue13, intermediateValue14, intermediateValue15, scalarValue3).x;
        }
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
