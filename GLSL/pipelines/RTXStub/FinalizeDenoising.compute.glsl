#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / FinalizeDenoising / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 32
#endif


#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue = reinterpretedBits.x;
    vec4 loadedBufferValue = imageLoad(shadowDenoisingOutputs[((scalarValue >> 8u) & 255u) + 0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
    float scalarValue1 = loadedBufferValue.x;
    imageStore(shadowDenoisingOutputs[((scalarValue >> 16u) & 255u) + 0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(scalarValue1, loadedBufferValue.yzw));
    imageStore(outputBufferPreviousSunLightShadow, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(scalarValue1, loadedBufferValue.yzw));
}
