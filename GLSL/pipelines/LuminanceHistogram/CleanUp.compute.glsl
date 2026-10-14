#version 460
#extension GL_GOOGLE_include_directive : require
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


#include "../../include/materials/LuminanceHistogram/ComputeBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    imageStore(intermediateValue, int((gl_GlobalInvocationID.y << 4u) + gl_GlobalInvocationID.x), uvec4(0u));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    imageStore(curFrameLuminanceHistogram, int((gl_GlobalInvocationID.y << 4u) + gl_GlobalInvocationID.x), uvec4(0u));
#endif
}
