#version 460
#extension GL_GOOGLE_include_directive : require
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


#include "../../include/materials/GPUDebugUtils/ComputeBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    imageStore(intermediateValue, int(gl_GlobalInvocationID.x), ivec4(uvec4(0u)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    imageStore(fakeRwBuffer, int(gl_GlobalInvocationID.x), ivec4(uvec4(0u)));
#endif
}
