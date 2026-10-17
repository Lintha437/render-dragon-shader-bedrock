#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / DiffuseFireflyFilter / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 27
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    if (!(texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).x == 65504.0))
    {
        uint reinterpretedBits = (floatBitsToUint(RootConstants.packedValues[0u]).x & 255u) + 0u;
        vec4 loadedBufferValue = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue = loadedBufferValue.x;
        float scalarValue1 = loadedBufferValue.y;
        float scalarValue2 = loadedBufferValue.z;
        float scalarValue3 = loadedBufferValue.w;
        uint sumValue = gl_GlobalInvocationID.x + 4294967295u;
        uint sumValue1 = gl_GlobalInvocationID.y + 4294967295u;
        vec4 loadedBufferValue1 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue, sumValue1)));
        vec4 loadedBufferValue2 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)));
        uint sumValue2 = gl_GlobalInvocationID.y + 1u;
        vec4 loadedBufferValue3 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue, sumValue2)));
        vec4 loadedBufferValue4 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, sumValue2)));
        vec4 loadedBufferValue5 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, sumValue1)));
        uint sumValue3 = gl_GlobalInvocationID.x + 1u;
        vec4 loadedBufferValue6 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue3, sumValue1)));
        vec4 loadedBufferValue7 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue3, gl_GlobalInvocationID.y)));
        vec4 loadedBufferValue8 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue3, sumValue2)));
        float productValue = (((((((loadedBufferValue2.x + loadedBufferValue1.x) + loadedBufferValue3.x) + loadedBufferValue4.x) + loadedBufferValue5.x) + loadedBufferValue6.x) + loadedBufferValue7.x) + loadedBufferValue8.x) * 0.125;
        float productValue1 = (((((((loadedBufferValue2.y + loadedBufferValue1.y) + loadedBufferValue3.y) + loadedBufferValue4.y) + loadedBufferValue5.y) + loadedBufferValue6.y) + loadedBufferValue7.y) + loadedBufferValue8.y) * 0.125;
        float productValue2 = (((((((loadedBufferValue2.z + loadedBufferValue1.z) + loadedBufferValue3.z) + loadedBufferValue4.z) + loadedBufferValue5.z) + loadedBufferValue6.z) + loadedBufferValue7.z) + loadedBufferValue8.z) * 0.125;
        float dotProductValue = dot(vec3(scalarValue, scalarValue1, scalarValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float intermediateValue4;
        float intermediateValue5;
        float intermediateValue6;
        if (dotProductValue != 0.0)
        {
            uint reinterpretedBits1 = ((floatBitsToUint(RootConstants.packedValues[0u]).x >> 24u) << 1u) + 47u;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((dot(vec3(productValue, productValue1, productValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) / dotProductValue) < (((ViewCB.packedValues[reinterpretedBits1].x - ViewCB.packedValues[reinterpretedBits1].y) * spvNClamp(imageLoad(outputBufferHistoryLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y))).x * 63.75, 0.0, 1.0)) + ViewCB.packedValues[reinterpretedBits1].y))
            {
                branchMergedValue = productValue;
                branchMergedValue1 = productValue1;
                branchMergedValue2 = productValue2;
            }
            else
            {
                branchMergedValue = scalarValue;
                branchMergedValue1 = scalarValue1;
                branchMergedValue2 = scalarValue2;
            }
            intermediateValue4 = branchMergedValue;
            intermediateValue5 = branchMergedValue1;
            intermediateValue6 = branchMergedValue2;
        }
        else
        {
            intermediateValue4 = scalarValue;
            intermediateValue5 = scalarValue1;
            intermediateValue6 = scalarValue2;
        }
        uint reinterpretedBits2 = floatBitsToUint(intermediateValue4) & 2147483647u;
        uint reinterpretedBits3 = floatBitsToUint(intermediateValue5) & 2147483647u;
        uint reinterpretedBits4 = floatBitsToUint(intermediateValue6) & 2147483647u;
        uint reinterpretedBits5 = floatBitsToUint(scalarValue3) & 2147483647u;
        if (!(((reinterpretedBits5 > 2139095040u) || (((reinterpretedBits2 > 2139095040u) || (reinterpretedBits3 > 2139095040u)) || (reinterpretedBits4 > 2139095040u))) || ((reinterpretedBits5 == 2139095040u) || (((reinterpretedBits2 == 2139095040u) || (reinterpretedBits3 == 2139095040u)) || (reinterpretedBits4 == 2139095040u)))))
        {
            imageStore(denoisingOutputs[((floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u) + 0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue4, intermediateValue5, intermediateValue6, scalarValue3));
        }
    }
}
