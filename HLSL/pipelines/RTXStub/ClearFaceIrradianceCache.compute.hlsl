// RTXStub / ClearFaceIrradianceCache / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 23
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint scalarValue = reinterpretedBits.x;
    if (dispatchThreadId.x < (scalarValue >> 12u))
    {
        uint sumValue = reinterpretedBits.y + dispatchThreadId.x;
        uint bitwiseValue = (scalarValue & 4095u) + 0u;
        rdByteStore_faceIrradianceCache_uint16_t4(bitwiseValue, (sumValue * 2u) * 8 + 0, uint16_t4((uint16_t)f32tof16(half(0.0)), (uint16_t)f32tof16(half(0.0)), (uint16_t)f32tof16(half(0.0)), (uint16_t)f32tof16(half(0.0))));
        rdByteStore_faceIrradianceCache_uint16_t4(bitwiseValue, ((sumValue * 2u) + 1u) * 8 + 0, uint16_t4((uint16_t)f32tof16(half(0.0)), (uint16_t)f32tof16(half(0.0)), (uint16_t)f32tof16(half(0.0)), (uint16_t)f32tof16(half(0.0))));
    }
}
[numthreads(128, 1, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
