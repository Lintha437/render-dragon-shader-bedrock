#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / BlendCheckerboardFields / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif


#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    if (!((float(gl_GlobalInvocationID.x) >= ViewCB.packedValues[80u].x) || (float(gl_GlobalInvocationID.y) >= ViewCB.packedValues[80u].y)))
    {
        uint reinterpretedBits = (floatBitsToUint(RootConstants.packedValues[0u]).x & 255u) + 0u;
        uint reinterpretedBits1 = ((floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u) + 0u;
        uint sumValue = uint(ViewCB.packedValues[80u].x) + gl_GlobalInvocationID.x;
        vec4 loadedBufferValue = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)));
        imageStore(denoisingOutputs[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)))));
        imageStore(denoisingOutputs[reinterpretedBits1], ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)), vec4(loadedBufferValue));
    }
}
