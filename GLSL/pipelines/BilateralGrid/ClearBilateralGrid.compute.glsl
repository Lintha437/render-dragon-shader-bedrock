#version 460
#extension GL_GOOGLE_include_directive : require
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
#define RD_BINDING_LAYOUT 4
#endif


#include "../../include/materials/BilateralGrid/ComputeBindings.glsli"

void main()
{
    uint scalarValue = uint(computeVectorConstants0.packedValues[0u].x);
    uint scalarValue1 = uint(computeVectorConstants0.packedValues[0u].z);
    if ((gl_GlobalInvocationID.z < scalarValue1) && ((gl_GlobalInvocationID.x < scalarValue) && (gl_GlobalInvocationID.y < uint(computeVectorConstants0.packedValues[0u].y))))
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint productValue = (gl_GlobalInvocationID.z + (scalarValue1 * (gl_GlobalInvocationID.x + (gl_GlobalInvocationID.y * scalarValue)))) * 2u;
        imageStore(intermediateValue, int(productValue), uvec4(0u));
        imageStore(intermediateValue, int(productValue + 1u), uvec4(0u));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint productValue1 = (((scalarValue * gl_GlobalInvocationID.y) + gl_GlobalInvocationID.x) * scalarValue1) + gl_GlobalInvocationID.z;
        imageStore(bilateralGrid, int(productValue1 * 2u), uvec4(0u));
        imageStore(bilateralGrid, int((productValue1 * 2u) + 1u), uvec4(0u));
#endif
    }
}
