#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / ToneMappingHistogram / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 47
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    if (!((int(gl_GlobalInvocationID.x) > int(uint(int(ViewCB.packedValues[79u].x)))) || (int(gl_GlobalInvocationID.y) > int(uint(int(ViewCB.packedValues[79u].y))))))
    {
        bool conditionValue = gl_LocalInvocationIndex < 256u;
        if (conditionValue)
        {
            intermediateValue[gl_LocalInvocationIndex] = 0u;
        }
        barrier();
        float sampledTextureValue = dot(vec3(texelFetch(inputFinalColour, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).xyz), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        if ((sampledTextureValue > 0.0) && (sampledTextureValue < 16.0))
        {
            float nonlinearValue = (spvNMax(log2(sampledTextureValue), -24.0) + 24.0) * 9.10714244842529296875;
            uint scalarValue = uint(nonlinearValue);
            uint sumValue = scalarValue + 1u;
            float scalarValue1 = fract(nonlinearValue);
            uint productValue = atomicAdd(intermediateValue[scalarValue], uint((1.0 - scalarValue1) * 64.0));
            if (sumValue < 256u)
            {
                uint productValue1 = atomicAdd(intermediateValue[sumValue], uint(scalarValue1 * 64.0));
            }
        }
        barrier();
        if (conditionValue)
        {
            if (!(intermediateValue[gl_LocalInvocationIndex] == 0u))
            {
                uint scalarValue2 = imageAtomicAdd(outputBufferToneMappingHistogram, ivec2(uvec2(gl_LocalInvocationIndex, 0u)), intermediateValue[gl_LocalInvocationIndex]);
            }
        }
    }
}
