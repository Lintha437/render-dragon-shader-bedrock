// LuminanceHistogram / CleanUp / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT128
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/LuminanceHistogram/ComputeBindings.hlsli"

void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    rdAccess_intermediateValue((dispatchThreadId.y << 4u) + dispatchThreadId.x) = uint4(0u, 0u, 0u, 0u).x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    rdAccess_curFrameLuminanceHistogram((dispatchThreadId.y << 4u) + dispatchThreadId.x) = uint4(0u, 0u, 0u, 0u).x;
#endif
}
#if RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128
[numthreads(16, 8, 1)]
#elif RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE
[numthreads(16, 16, 1)]
#endif
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
