// RTXStub / ToneMappingHistogram / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 47
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    if (!((int(dispatchThreadId.x) > int(uint(int(viewCbConstants[79u].x)))) || (int(dispatchThreadId.y) > int(uint(int(viewCbConstants[79u].y))))))
    {
        bool conditionValue = localThreadIndex < 256u;
        if (conditionValue)
        {
            intermediateValue[localThreadIndex] = 0u;
        }
        GroupMemoryBarrierWithGroupSync();
        float loadedBufferValue = dot(float3(inputFinalColour.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).xyz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        if ((loadedBufferValue > 0.0f) && (loadedBufferValue < 16.0f))
        {
            float nonlinearValue = (max(log2(loadedBufferValue), -24.0f) + 24.0f) * 9.10714244842529296875f;
            uint scalarValue = uint(nonlinearValue);
            uint sumValue = scalarValue + 1u;
            float scalarValue1 = frac(nonlinearValue);
            uint intermediateValue4;
            InterlockedAdd(intermediateValue[scalarValue], uint((1.0f - scalarValue1) * 64.0f), intermediateValue4);
            if (sumValue < 256u)
            {
                uint intermediateValue5;
                InterlockedAdd(intermediateValue[sumValue], uint(scalarValue1 * 64.0f), intermediateValue5);
            }
        }
        GroupMemoryBarrierWithGroupSync();
        if (conditionValue)
        {
            if (!(intermediateValue[localThreadIndex] == 0u))
            {
                uint intermediateValue6;
                InterlockedAdd(outputBufferToneMappingHistogram[uint2(localThreadIndex, 0u)], intermediateValue[localThreadIndex], intermediateValue6);
            }
        }
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    localThreadIndex = stage_input.localThreadIndex;
    executeComputeStage();
}
