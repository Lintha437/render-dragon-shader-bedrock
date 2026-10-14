// GPUDebugUtils / GpuValidationPass / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/GPUDebugUtils/ComputeBindings.hlsli"

void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    rdAccess_intermediateValue(dispatchThreadId.x) = int4(uint4(0u, 0u, 0u, 0u));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    rdAccess_fakeRwBuffer(dispatchThreadId.x) = int4(uint4(0u, 0u, 0u, 0u));
#endif
}
[numthreads(256, 1, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
