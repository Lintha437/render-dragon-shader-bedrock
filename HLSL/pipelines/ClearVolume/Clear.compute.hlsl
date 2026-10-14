// ClearVolume / Clear / compute forward pipeline.
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
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/ClearVolume/ComputeBindings.hlsli"

void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    if (!(((int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.x))) <= int(dispatchThreadId.x)) || (int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.y))) <= int(dispatchThreadId.y))) || (int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z))) <= int(dispatchThreadId.z))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (!((int(dispatchThreadId.z) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z)))) || ((int(dispatchThreadId.x) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.x)))) || (int(dispatchThreadId.y) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.y)))))))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(RD_UNIFORM_CLEAR_VALUE);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        volumeTexture[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(RD_UNIFORM_CLEAR_VALUE);
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
