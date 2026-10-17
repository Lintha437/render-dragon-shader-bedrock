// RTXStub / AccumulateInscatter / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    float multiplyAddValue = ((viewCbConstants[81u].z * 2.0f) * viewCbConstants[78u].z) + mad(float(dispatchThreadId.x), viewCbConstants[80u].z, -1.0f);
    float multiplyAddValue1 = mad(float(dispatchThreadId.y), viewCbConstants[80u].w, 1.0f) - ((viewCbConstants[81u].w * 2.0f) * viewCbConstants[78u].w);
    float multiplyAddValue2 = mad(0.5f, viewCbConstants[22u].w, mad(multiplyAddValue1, viewCbConstants[21u].w, multiplyAddValue * viewCbConstants[20u].w)) + viewCbConstants[23u].w;
    float multiplyAddValue3 = ((mad(0.5f, viewCbConstants[22u].x, mad(multiplyAddValue1, viewCbConstants[21u].x, multiplyAddValue * viewCbConstants[20u].x)) + viewCbConstants[23u].x) / multiplyAddValue2) - viewCbConstants[72u].x;
    float multiplyAddValue4 = ((mad(0.5f, viewCbConstants[22u].y, mad(multiplyAddValue1, viewCbConstants[21u].y, multiplyAddValue * viewCbConstants[20u].y)) + viewCbConstants[23u].y) / multiplyAddValue2) - viewCbConstants[72u].y;
    float multiplyAddValue5 = ((mad(0.5f, viewCbConstants[22u].z, mad(multiplyAddValue1, viewCbConstants[21u].z, multiplyAddValue * viewCbConstants[20u].z)) + viewCbConstants[23u].z) / multiplyAddValue2) - viewCbConstants[72u].z;
    float inverseLengthValue = multiplyAddValue4 * rsqrt(dot(float3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5), float3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5)));
    uint scalarValue = uint(viewCbConstants[54u].z);
    if (!(scalarValue == 0u))
    {
        float intermediateValue13;
        float scalarValue1 = 0.0f;
        float scalarValue2 = 0.0f;
        float scalarValue3 = 0.0f;
        float scalarValue4 = 1.0f;
        float scalarValue5 = 1.0f;
        float scalarValue6 = 1.0f;
        float scalarValue7 = 0.0f;
        uint scalarValue8 = 0u;
        float multiplyAddValue6;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        float sumValue1;
        bool reinterpretedBits;
        for (;;)
        {
            float4 vectorValue = volumetricInscatterRW[uint3(dispatchThreadId.x, dispatchThreadId.y, scalarValue8)].xxxx;
            intermediateValue10 = vectorValue.x;
            intermediateValue11 = vectorValue.y;
            intermediateValue12 = vectorValue.z;
            multiplyAddValue6 = (exp2(mad(float(scalarValue8), viewCbConstants[55u].z, viewCbConstants[55u].z * 0.5f) * 3.45943164825439453125f) + (-1.0f)) * 5.0f;
            sumValue1 = multiplyAddValue6 - scalarValue7;
            reinterpretedBits = asuint(viewCbConstants[54u]).w == 0u;
            float branchMergedValue;
            if (reinterpretedBits)
            {
                branchMergedValue = clamp(mad(mad(inverseLengthValue, multiplyAddValue6, viewCbConstants[72u].y), viewCbConstants[90u].z, viewCbConstants[90u].w), 0.0f, 1.0f);
            }
            else
            {
                branchMergedValue = 1.0f;
            }
            intermediateValue13 = branchMergedValue;
            float productValue = (sumValue1 * (-1.44269502162933349609375f)) * intermediateValue13;
            float productValue1 = (((intermediateValue10 * scalarValue4) * sumValue1) * viewCbConstants[61u].x) + scalarValue1;
            float productValue2 = (((intermediateValue11 * scalarValue5) * sumValue1) * viewCbConstants[61u].y) + scalarValue2;
            float productValue3 = (((intermediateValue12 * scalarValue6) * sumValue1) * viewCbConstants[61u].z) + scalarValue3;
            float nonlinearValue = sqrt(productValue1);
            volumetricResolvedInscatterRW[uint3(dispatchThreadId.x, dispatchThreadId.y, scalarValue8)] = float4(nonlinearValue, sqrt(productValue2), sqrt(productValue3), nonlinearValue);
            volumetricResolvedTransmissionRW[uint3(dispatchThreadId.x, dispatchThreadId.y, scalarValue8)] = float4(scalarValue4, scalarValue5, scalarValue6, scalarValue4);
            uint sumValue = scalarValue8 + 1u;
            if (sumValue == scalarValue)
            {
                break;
            }
            else
            {
                scalarValue1 = productValue1;
                scalarValue2 = productValue2;
                scalarValue3 = productValue3;
                scalarValue4 = exp2(viewCbConstants[62u].x * productValue) * scalarValue4;
                scalarValue5 = exp2(viewCbConstants[62u].y * productValue) * scalarValue5;
                scalarValue6 = exp2(viewCbConstants[62u].z * productValue) * scalarValue6;
                scalarValue7 = multiplyAddValue6;
                scalarValue8 = sumValue;
                continue;
            }
        }
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
