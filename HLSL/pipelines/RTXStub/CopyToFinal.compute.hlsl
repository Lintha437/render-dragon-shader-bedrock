// RTXStub / CopyToFinal / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 7
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    float4 loadedBufferValue = inputThisFrameTAAHistory.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
    float scalarValue = loadedBufferValue.x;
    float scalarValue1 = loadedBufferValue.y;
    float scalarValue2 = loadedBufferValue.z;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (asuint(viewCbConstants[95u]).w == 0u)
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (viewCbConstants[78u].x < viewCbConstants[79u].x)
        {
            float2 loadedBufferValue1 = asfloat(uint2(rdLoad_inputIncidentLight(0u).x, rdLoad_inputIncidentLight(0u + 1u).x));
            float quotientValue = (loadedBufferValue1.y / loadedBufferValue1.x) * 4.0f;
            branchMergedValue = max(quotientValue * scalarValue, 0.0f);
            branchMergedValue1 = max(quotientValue * scalarValue1, 0.0f);
            branchMergedValue2 = max(quotientValue * scalarValue2, 0.0f);
        }
        else
        {
            branchMergedValue = scalarValue;
            branchMergedValue1 = scalarValue1;
            branchMergedValue2 = scalarValue2;
        }
        intermediateValue3 = branchMergedValue;
        intermediateValue4 = branchMergedValue1;
        intermediateValue5 = branchMergedValue2;
    }
    else
    {
        float exponentialValue = exp2(log2(max(scalarValue, 0.0f)) * 0.0126833133399486541748046875f);
        float exponentialValue1 = exp2(log2(max(scalarValue1, 0.0f)) * 0.0126833133399486541748046875f);
        float exponentialValue2 = exp2(log2(max(scalarValue2, 0.0f)) * 0.0126833133399486541748046875f);
        intermediateValue3 = exp2(log2(max((exponentialValue + (-0.8359375f)) / (18.8515625f - (exponentialValue * 18.6875f)), 0.0f)) * 6.277394771575927734375f) * 10000.0f;
        intermediateValue4 = exp2(log2(max((exponentialValue1 + (-0.8359375f)) / (18.8515625f - (exponentialValue1 * 18.6875f)), 0.0f)) * 6.277394771575927734375f) * 10000.0f;
        intermediateValue5 = exp2(log2(max((exponentialValue2 + (-0.8359375f)) / (18.8515625f - (exponentialValue2 * 18.6875f)), 0.0f)) * 6.277394771575927734375f) * 10000.0f;
    }
    outputBufferFinal[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue3, intermediateValue4, intermediateValue5, 0.0f);
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
