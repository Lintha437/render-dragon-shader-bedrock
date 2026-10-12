#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / DiffuseFireflyFilterSH / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 29
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    if (!(texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).x == 65504.0))
    {
        uint reinterpretedBits = (floatBitsToUint(RootConstants.packedValues[0u]).x & 255u) + 0u;
        uint reinterpretedBits1 = floatBitsToUint(RootConstants.packedValues[0u]).x & 255u;
        uint reinterpretedBits2 = (floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u;
        vec4 loadedBufferValue = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue = loadedBufferValue.x;
        float scalarValue1 = loadedBufferValue.y;
        float scalarValue2 = loadedBufferValue.z;
        float scalarValue3 = loadedBufferValue.w;
        vec4 loadedBufferValue1 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
        float scalarValue4 = loadedBufferValue1.x;
        float scalarValue5 = loadedBufferValue1.y;
        float scalarValue6 = loadedBufferValue1.w;
        uint sumValue = gl_GlobalInvocationID.x + 4294967295u;
        uint sumValue1 = gl_GlobalInvocationID.y + 4294967295u;
        vec4 loadedBufferValue2 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue, sumValue1)));
        vec4 loadedBufferValue3 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)));
        uint sumValue2 = gl_GlobalInvocationID.y + 1u;
        vec4 loadedBufferValue4 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue, sumValue2)));
        vec4 loadedBufferValue5 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, sumValue2)));
        vec4 loadedBufferValue6 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, sumValue1)));
        uint sumValue3 = gl_GlobalInvocationID.x + 1u;
        vec4 loadedBufferValue7 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue3, sumValue1)));
        vec4 loadedBufferValue8 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue3, gl_GlobalInvocationID.y)));
        vec4 loadedBufferValue9 = imageLoad(denoisingOutputs[reinterpretedBits], ivec2(uvec2(sumValue3, sumValue2)));
        vec4 loadedBufferValue10 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(sumValue, sumValue1)));
        vec4 loadedBufferValue11 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)));
        vec4 loadedBufferValue12 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(sumValue, sumValue2)));
        vec4 loadedBufferValue13 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, sumValue2)));
        vec4 loadedBufferValue14 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, sumValue1)));
        vec4 loadedBufferValue15 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(sumValue3, sumValue1)));
        vec4 loadedBufferValue16 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(sumValue3, gl_GlobalInvocationID.y)));
        vec4 loadedBufferValue17 = imageLoad(denoisingChromaAndVarianceOutputs[reinterpretedBits1], ivec2(uvec2(sumValue3, sumValue2)));
        float productValue = (((((((loadedBufferValue3.w + loadedBufferValue2.w) + loadedBufferValue4.w) + loadedBufferValue5.w) + loadedBufferValue6.w) + loadedBufferValue7.w) + loadedBufferValue8.w) + loadedBufferValue9.w) * 0.125;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        if (scalarValue3 != 0.0)
        {
            uint reinterpretedBits3 = ((floatBitsToUint(RootConstants.packedValues[0u]).x >> 24u) << 1u) + 47u;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            float branchMergedValue3;
            float branchMergedValue4;
            float branchMergedValue5;
            if ((productValue / scalarValue3) < (((ViewCB.packedValues[reinterpretedBits3].x - ViewCB.packedValues[reinterpretedBits3].y) * spvNClamp(imageLoad(outputBufferHistoryLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y))).x * 63.75, 0.0, 1.0)) + ViewCB.packedValues[reinterpretedBits3].y))
            {
                branchMergedValue = (((((((loadedBufferValue3.x + loadedBufferValue2.x) + loadedBufferValue4.x) + loadedBufferValue5.x) + loadedBufferValue6.x) + loadedBufferValue7.x) + loadedBufferValue8.x) + loadedBufferValue9.x) * 0.125;
                branchMergedValue1 = (((((((loadedBufferValue3.y + loadedBufferValue2.y) + loadedBufferValue4.y) + loadedBufferValue5.y) + loadedBufferValue6.y) + loadedBufferValue7.y) + loadedBufferValue8.y) + loadedBufferValue9.y) * 0.125;
                branchMergedValue2 = (((((((loadedBufferValue3.z + loadedBufferValue2.z) + loadedBufferValue4.z) + loadedBufferValue5.z) + loadedBufferValue6.z) + loadedBufferValue7.z) + loadedBufferValue8.z) + loadedBufferValue9.z) * 0.125;
                branchMergedValue3 = productValue;
                branchMergedValue4 = (((((((loadedBufferValue11.x + loadedBufferValue10.x) + loadedBufferValue12.x) + loadedBufferValue13.x) + loadedBufferValue14.x) + loadedBufferValue15.x) + loadedBufferValue16.x) + loadedBufferValue17.x) * 0.125;
                branchMergedValue5 = (((((((loadedBufferValue11.y + loadedBufferValue10.y) + loadedBufferValue12.y) + loadedBufferValue13.y) + loadedBufferValue14.y) + loadedBufferValue15.y) + loadedBufferValue16.y) + loadedBufferValue17.y) * 0.125;
            }
            else
            {
                branchMergedValue = scalarValue;
                branchMergedValue1 = scalarValue1;
                branchMergedValue2 = scalarValue2;
                branchMergedValue3 = scalarValue3;
                branchMergedValue4 = scalarValue4;
                branchMergedValue5 = scalarValue5;
            }
            intermediateValue7 = branchMergedValue;
            intermediateValue8 = branchMergedValue1;
            intermediateValue9 = branchMergedValue2;
            intermediateValue10 = branchMergedValue3;
            intermediateValue11 = branchMergedValue4;
            intermediateValue12 = branchMergedValue5;
        }
        else
        {
            intermediateValue7 = scalarValue;
            intermediateValue8 = scalarValue1;
            intermediateValue9 = scalarValue2;
            intermediateValue10 = scalarValue3;
            intermediateValue11 = scalarValue4;
            intermediateValue12 = scalarValue5;
        }
        uint reinterpretedBits4 = floatBitsToUint(intermediateValue7) & 2147483647u;
        uint reinterpretedBits5 = floatBitsToUint(intermediateValue8) & 2147483647u;
        uint reinterpretedBits6 = floatBitsToUint(intermediateValue9) & 2147483647u;
        uint reinterpretedBits7 = floatBitsToUint(intermediateValue10) & 2147483647u;
        if (!(((((reinterpretedBits4 > 2139095040u) || (reinterpretedBits5 > 2139095040u)) || (reinterpretedBits6 > 2139095040u)) || (reinterpretedBits7 > 2139095040u)) || ((((reinterpretedBits4 == 2139095040u) || (reinterpretedBits5 == 2139095040u)) || (reinterpretedBits6 == 2139095040u)) || (reinterpretedBits7 == 2139095040u))))
        {
            imageStore(denoisingOutputs[((floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u) + 0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue7, intermediateValue8, intermediateValue9, intermediateValue10));
        }
        uint reinterpretedBits8 = floatBitsToUint(intermediateValue11) & 2147483647u;
        uint reinterpretedBits9 = floatBitsToUint(intermediateValue12) & 2147483647u;
        uint reinterpretedBits10 = floatBitsToUint(scalarValue6) & 2147483647u;
        if (!(((reinterpretedBits10 > 2139095040u) || ((reinterpretedBits8 > 2139095040u) || (reinterpretedBits9 > 2139095040u))) || ((reinterpretedBits10 == 2139095040u) || ((reinterpretedBits8 == 2139095040u) || (reinterpretedBits9 == 2139095040u)))))
        {
            imageStore(denoisingChromaAndVarianceOutputs[reinterpretedBits2], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue11, intermediateValue12, 0.0, scalarValue6));
        }
    }
}
