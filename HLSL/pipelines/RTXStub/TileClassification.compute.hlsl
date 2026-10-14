// RTXStub / TileClassification / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 18
#endif

#define RD_USE_DIVIDE_UNSIGNED_UINT_19 1

#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

#include "../../include/Math.hlsli"
void executeComputeStage()
{
    uint scalarValue = rdDivideUnsigned(256u, WaveGetLaneCount());
    uint4 loadedBufferValue = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
    uint scalarValue1 = loadedBufferValue.x;
    bool comparisonValue = scalarValue1 == 0u;
    uint intermediateValue5;
    uint intermediateValue7;
    if (WaveActiveAllTrue(comparisonValue))
    {
        intermediateValue5 = 0u;
        intermediateValue7 = 1u;
    }
    else
    {
        uint scalarValue2 = WaveReadLaneFirst(scalarValue1);
        intermediateValue5 = scalarValue2;
        intermediateValue7 = WaveActiveAllTrue(int(scalarValue2 - scalarValue1) < int(50u)) ? 2u : 0u;
    }
    float4 loadedBufferValue1 = shadowDenoisingInputs[0u].Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
    float scalarValue3 = loadedBufferValue1.x;
    float scalarValue4 = loadedBufferValue1.y;
    float scalarValue5 = loadedBufferValue1.z;
    float scalarValue6 = WaveReadLaneFirst(scalarValue3);
    float scalarValue7 = WaveReadLaneFirst(scalarValue4);
    float scalarValue8 = WaveReadLaneFirst(scalarValue5);
    bool bitwiseValue = WaveActiveAllTrue(comparisonValue || (((abs(scalarValue3 - scalarValue6) < 0.00999999977648258209228515625f) && (abs(scalarValue4 - scalarValue7) < 0.00999999977648258209228515625f)) && (abs(scalarValue5 - scalarValue8) < 0.00999999977648258209228515625f)));
    uint bitwiseValue1 = intermediateValue7 | 4u;
    uint comparisonValue1 = bitwiseValue ? bitwiseValue1 : intermediateValue7;
    uint scalarValue9 = rdDivideUnsigned(localThreadIndex, WaveGetLaneCount());
    if (WaveIsFirstLane())
    {
        intermediateValue[scalarValue9] = comparisonValue1;
        intermediateValue1[scalarValue9] = intermediateValue5;
    }
    GroupMemoryBarrierWithGroupSync();
    if ((scalarValue9 == 0u) && WaveIsFirstLane())
    {
        uint intermediateValue15;
        uint intermediateValue16;
        intermediateValue15 = comparisonValue1;
        intermediateValue16 = 1u;
        uint comparisonValue2;
        for (;;)
        {
            uint bitwiseValue2 = intermediateValue[intermediateValue16] & intermediateValue15;
            comparisonValue2 = (int(intermediateValue1[intermediateValue16] - scalarValue1) > int(49u)) ? (bitwiseValue2 & 4294967293u) : bitwiseValue2;
            uint sumValue = intermediateValue16 + 1u;
            if (sumValue < scalarValue)
            {
                intermediateValue15 = comparisonValue2;
                intermediateValue16 = sumValue;
            }
            else
            {
                break;
            }
        }
        uint comparisonValue3 = ((comparisonValue2 & 1u) != 0u) ? (comparisonValue2 | 6u) : comparisonValue2;
        outputTileClassification[uint2(dispatchThreadId.x >> 4u, dispatchThreadId.y >> 4u)] = int4(((((comparisonValue3 & 2u) != 0u) ? (scalarValue1 & 4294967288u) : 0u) | comparisonValue3).xxxx);
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    localThreadIndex = stage_input.localThreadIndex;
    executeComputeStage();
}
