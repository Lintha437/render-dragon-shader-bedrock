// RTXStub / FinalizeDenoising / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 32
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint scalarValue = reinterpretedBits.x;
    float4 bitwiseValue = shadowDenoisingOutputs[((scalarValue >> 8u) & 255u) + 0u][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
    float scalarValue1 = bitwiseValue.x;
    shadowDenoisingOutputs[((scalarValue >> 16u) & 255u) + 0u][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(scalarValue1, bitwiseValue.yzw).x;
    outputBufferPreviousSunLightShadow[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(scalarValue1, bitwiseValue.yzw);
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
