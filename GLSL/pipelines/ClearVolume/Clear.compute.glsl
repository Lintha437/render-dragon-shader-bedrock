#version 460
#extension GL_GOOGLE_include_directive : require
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


#include "../../include/materials/ClearVolume/ComputeBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    if (!(((int(uint(int(computeVectorConstants0.packedValues[1u].x))) <= int(gl_GlobalInvocationID.x)) || (int(uint(int(computeVectorConstants0.packedValues[1u].y))) <= int(gl_GlobalInvocationID.y))) || (int(uint(int(computeVectorConstants0.packedValues[1u].z))) <= int(gl_GlobalInvocationID.z))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (!((int(gl_GlobalInvocationID.z) >= int(uint(int(computeVectorConstants0.packedValues[1u].z)))) || ((int(gl_GlobalInvocationID.x) >= int(uint(int(computeVectorConstants0.packedValues[1u].x)))) || (int(gl_GlobalInvocationID.y) >= int(uint(int(computeVectorConstants0.packedValues[1u].y)))))))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        imageStore(intermediateValue, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(computeVectorConstants0.packedValues[0u]));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        imageStore(volumeTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(computeVectorConstants0.packedValues[0u]));
#endif
    }
}
