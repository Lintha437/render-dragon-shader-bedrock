#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / CopyToFinal / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 7
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    vec4 sampledTextureValue = texelFetch(inputThisFrameTAAHistory, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (floatBitsToUint(ViewCB.packedValues[95u]).w == 0u)
    {
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if (ViewCB.packedValues[78u].x < ViewCB.packedValues[79u].x)
        {
            uint sumValue = 0u + 1u;
            vec2 sampledTextureValue1 = uintBitsToFloat(uvec2(texelFetch(inputIncidentLight, int(0u)).x, texelFetch(inputIncidentLight, int(sumValue)).x));
            float quotientValue = (sampledTextureValue1.y / sampledTextureValue1.x) * 4.0;
            branchMergedValue = spvNMax(quotientValue * scalarValue, 0.0);
            branchMergedValue1 = spvNMax(quotientValue * scalarValue1, 0.0);
            branchMergedValue2 = spvNMax(quotientValue * scalarValue2, 0.0);
        }
        else
        {
            branchMergedValue = scalarValue;
            branchMergedValue1 = scalarValue1;
            branchMergedValue2 = scalarValue2;
        }
        intermediateValue3 = branchMergedValue;
        intermediateValue4 = branchMergedValue1;
        intermediateValue5 = branchMergedValue2;
    }
    else
    {
        float exponentialValue = exp2(log2(spvNMax(scalarValue, 0.0)) * 0.0126833133399486541748046875);
        float exponentialValue1 = exp2(log2(spvNMax(scalarValue1, 0.0)) * 0.0126833133399486541748046875);
        float exponentialValue2 = exp2(log2(spvNMax(scalarValue2, 0.0)) * 0.0126833133399486541748046875);
        intermediateValue3 = exp2(log2(spvNMax((exponentialValue + (-0.8359375)) / (18.8515625 - (exponentialValue * 18.6875)), 0.0)) * 6.277394771575927734375) * 10000.0;
        intermediateValue4 = exp2(log2(spvNMax((exponentialValue1 + (-0.8359375)) / (18.8515625 - (exponentialValue1 * 18.6875)), 0.0)) * 6.277394771575927734375) * 10000.0;
        intermediateValue5 = exp2(log2(spvNMax((exponentialValue2 + (-0.8359375)) / (18.8515625 - (exponentialValue2 * 18.6875)), 0.0)) * 6.277394771575927734375) * 10000.0;
    }
    imageStore(outputBufferFinal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue3, intermediateValue4, intermediateValue5, 0.0));
}
