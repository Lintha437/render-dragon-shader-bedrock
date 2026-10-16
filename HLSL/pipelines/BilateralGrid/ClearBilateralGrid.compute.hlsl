// BilateralGrid / ClearBilateralGrid / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT128
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif


#include "../../include/materials/BilateralGrid/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint scalarValue = uint(RD_UNIFORM_GRID_DIMENSIONS.x);
    uint scalarValue1 = uint(RD_UNIFORM_GRID_DIMENSIONS.z);
    if ((dispatchThreadId.z < scalarValue1) && ((dispatchThreadId.x < scalarValue) && (dispatchThreadId.y < uint(RD_UNIFORM_GRID_DIMENSIONS.y))))
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint productValue = (dispatchThreadId.z + (scalarValue1 * (dispatchThreadId.x + (dispatchThreadId.y * scalarValue)))) * 2u;
        rdAccess_intermediateValue(productValue) = uint4(0u, 0u, 0u, 0u).x;
        rdAccess_intermediateValue(productValue + 1u) = uint4(0u, 0u, 0u, 0u).x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint productValue1 = (((scalarValue * dispatchThreadId.y) + dispatchThreadId.x) * scalarValue1) + dispatchThreadId.z;
        rdAccess_bilateralGrid(productValue1 * 2u) = uint4(0u, 0u, 0u, 0u).x;
        rdAccess_bilateralGrid((productValue1 * 2u) + 1u) = uint4(0u, 0u, 0u, 0u).x;
#endif
    }
}
#if RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128
[numthreads(8, 8, 2)]
#elif RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT256
[numthreads(8, 8, 4)]
#elif RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE
[numthreads(8, 8, 8)]
#endif
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
