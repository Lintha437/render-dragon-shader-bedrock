// Checkerboarding / DoCheckerboarding / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 1
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/Checkerboarding/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint comparisonValue = ((((dispatchThreadId.y ^ dispatchThreadId.x) & 1u) == 0u) ? uint(RD_UNIFORM_OTHER_SIDE_OFFSET.x) : 0u) + uint(int(dispatchThreadId.x) / int(2u));
    colorMetalnessOutputTexture[uint2(comparisonValue, dispatchThreadId.y)] = float4(colorMetalnessInputTexture.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
    normalOutputTexture[uint2(comparisonValue, dispatchThreadId.y)] = float4(normalInputTexture.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).xyxx);
    emissiveLinearRoughnessOutputTexture[uint2(comparisonValue, dispatchThreadId.y)] = float4(emissiveLinearRoughnessInputTexture.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
    planeIdOutputTexture[uint2(comparisonValue, dispatchThreadId.y)] = planeIdInputTexture.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).x.xxxx;
    worldPositionOutputTexture[uint2(comparisonValue, dispatchThreadId.y)] = float4(worldPositionInputTexture.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
    lowPrecisionWorldPositionOutputTexture[uint2(comparisonValue, dispatchThreadId.y)] = float4(lowPrecisionWorldPositionInputTexture.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
    viewDirectionAndSplitMaskOutputTexture[uint2(comparisonValue, dispatchThreadId.y)] = float4(viewDirectionAndSplitMaskInputTexture.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
}
[numthreads(8, 8, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
