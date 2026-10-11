#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / AccumulateInscatter / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    float multiplyAddValue = ((ViewCB.packedValues[81u].z * 2.0) * ViewCB.packedValues[78u].z) + fma(float(gl_GlobalInvocationID.x), ViewCB.packedValues[80u].z, -1.0);
    float multiplyAddValue1 = fma(float(gl_GlobalInvocationID.y), ViewCB.packedValues[80u].w, 1.0) - ((ViewCB.packedValues[81u].w * 2.0) * ViewCB.packedValues[78u].w);
    float multiplyAddValue2 = fma(0.5, ViewCB.packedValues[22u].w, fma(multiplyAddValue1, ViewCB.packedValues[21u].w, multiplyAddValue * ViewCB.packedValues[20u].w)) + ViewCB.packedValues[23u].w;
    float multiplyAddValue3 = ((fma(0.5, ViewCB.packedValues[22u].x, fma(multiplyAddValue1, ViewCB.packedValues[21u].x, multiplyAddValue * ViewCB.packedValues[20u].x)) + ViewCB.packedValues[23u].x) / multiplyAddValue2) - ViewCB.packedValues[72u].x;
    float multiplyAddValue4 = ((fma(0.5, ViewCB.packedValues[22u].y, fma(multiplyAddValue1, ViewCB.packedValues[21u].y, multiplyAddValue * ViewCB.packedValues[20u].y)) + ViewCB.packedValues[23u].y) / multiplyAddValue2) - ViewCB.packedValues[72u].y;
    float multiplyAddValue5 = ((fma(0.5, ViewCB.packedValues[22u].z, fma(multiplyAddValue1, ViewCB.packedValues[21u].z, multiplyAddValue * ViewCB.packedValues[20u].z)) + ViewCB.packedValues[23u].z) / multiplyAddValue2) - ViewCB.packedValues[72u].z;
    float inverseLengthValue = multiplyAddValue4 * inversesqrt(dot(vec3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5), vec3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5)));
    uint scalarValue = uint(ViewCB.packedValues[54u].z);
    if (!(scalarValue == 0u))
    {
        float intermediateValue12;
        float scalarValue1 = 0.0;
        float scalarValue2 = 0.0;
        float scalarValue3 = 0.0;
        float scalarValue4 = 1.0;
        float scalarValue5 = 1.0;
        float scalarValue6 = 1.0;
        float scalarValue7 = 0.0;
        uint scalarValue8 = 0u;
        float multiplyAddValue6;
        float intermediateValue9;
        float intermediateValue10;
        float intermediateValue11;
        float sumValue1;
        bool reinterpretedBits;
        for (;;)
        {
            vec4 loadedBufferValue = imageLoad(volumetricInscatterRW, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, scalarValue8)));
            intermediateValue9 = loadedBufferValue.x;
            intermediateValue10 = loadedBufferValue.y;
            intermediateValue11 = loadedBufferValue.z;
            multiplyAddValue6 = (exp2(fma(float(scalarValue8), ViewCB.packedValues[55u].z, ViewCB.packedValues[55u].z * 0.5) * 3.45943164825439453125) + (-1.0)) * 5.0;
            sumValue1 = multiplyAddValue6 - scalarValue7;
            reinterpretedBits = floatBitsToUint(ViewCB.packedValues[54u]).w == 0u;
            float branchMergedValue;
            if (reinterpretedBits)
            {
                branchMergedValue = spvNClamp(fma(fma(inverseLengthValue, multiplyAddValue6, ViewCB.packedValues[72u].y), ViewCB.packedValues[90u].z, ViewCB.packedValues[90u].w), 0.0, 1.0);
            }
            else
            {
                branchMergedValue = 1.0;
            }
            intermediateValue12 = branchMergedValue;
            float productValue = (sumValue1 * (-1.44269502162933349609375)) * intermediateValue12;
            float productValue1 = (((intermediateValue9 * scalarValue4) * sumValue1) * ViewCB.packedValues[61u].x) + scalarValue1;
            float productValue2 = (((intermediateValue10 * scalarValue5) * sumValue1) * ViewCB.packedValues[61u].y) + scalarValue2;
            float productValue3 = (((intermediateValue11 * scalarValue6) * sumValue1) * ViewCB.packedValues[61u].z) + scalarValue3;
            float nonlinearValue = sqrt(productValue1);
            imageStore(volumetricResolvedInscatterRW, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, scalarValue8)), vec4(nonlinearValue, sqrt(productValue2), sqrt(productValue3), nonlinearValue));
            imageStore(volumetricResolvedTransmissionRW, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, scalarValue8)), vec4(scalarValue4, scalarValue5, scalarValue6, scalarValue4));
            uint sumValue = scalarValue8 + 1u;
            if (sumValue == scalarValue)
            {
                break;
            }
            else
            {
                scalarValue1 = productValue1;
                scalarValue2 = productValue2;
                scalarValue3 = productValue3;
                scalarValue4 = exp2(ViewCB.packedValues[62u].x * productValue) * scalarValue4;
                scalarValue5 = exp2(ViewCB.packedValues[62u].y * productValue) * scalarValue5;
                scalarValue6 = exp2(ViewCB.packedValues[62u].z * productValue) * scalarValue6;
                scalarValue7 = multiplyAddValue6;
                scalarValue8 = sumValue;
                continue;
            }
        }
    }
}
