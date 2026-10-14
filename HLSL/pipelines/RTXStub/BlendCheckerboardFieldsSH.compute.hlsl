// RTXStub / BlendCheckerboardFieldsSH / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 9
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    if (!((float(dispatchThreadId.x) >= viewCbConstants[80u].x) || (float(dispatchThreadId.y) >= viewCbConstants[80u].y)))
    {
        uint reinterpretedBits = (asuint(rootConstantsConstants[0u]).x & 255u) + 0u;
        uint reinterpretedBits1 = asuint(rootConstantsConstants[0u]).x & 255u;
        uint reinterpretedBits2 = ((asuint(rootConstantsConstants[0u]).x >> 8u) & 255u) + 0u;
        uint reinterpretedBits3 = (asuint(rootConstantsConstants[0u]).x >> 8u) & 255u;
        uint sumValue = uint(viewCbConstants[80u].x) + dispatchThreadId.x;
        float4 vectorValue = denoisingOutputs[reinterpretedBits][uint2(sumValue, dispatchThreadId.y)].xxxx;
        float4 vectorValue1 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float4 vectorValue2 = denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(sumValue, dispatchThreadId.y)].xxxx;
        denoisingOutputs[reinterpretedBits2][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx).x;
        denoisingOutputs[reinterpretedBits2][uint2(sumValue, dispatchThreadId.y)] = float4(vectorValue).x;
        denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(vectorValue1).x;
        denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(sumValue, dispatchThreadId.y)] = float4(vectorValue2).x;
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
