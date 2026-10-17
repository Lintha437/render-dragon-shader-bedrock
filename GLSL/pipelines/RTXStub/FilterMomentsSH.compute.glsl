#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / FilterMomentsSH / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
#endif

#extension GL_EXT_samplerless_texture_functions : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uint reinterpretedBits = (floatBitsToUint(RootConstants.packedValues[0u]).x >> 16u) & 255u;
    uint reinterpretedBits1 = (floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u;
    vec4 loadedBufferValue = imageLoad(outputDenoisingMoments[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
    float scalarValue = loadedBufferValue.x;
    float scalarValue1 = loadedBufferValue.y;
    vec4 sampledTextureValue = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
    float scalarValue2 = sampledTextureValue.x;
    uint intermediateValue5;
    uint intermediateValue6;
    uint intermediateValue7;
    if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
    {
        intermediateValue5 = 0u;
        intermediateValue6 = uint(int(ViewCB.packedValues[78u].x));
        intermediateValue7 = uint(int(ViewCB.packedValues[78u].y));
    }
    else
    {
        uint scalarValue3 = uint(ViewCB.packedValues[80u].x);
        uint scalarValue4 = uint(ViewCB.packedValues[78u].y);
        uint branchMergedValue3;
        uint branchMergedValue4;
        uint branchMergedValue5;
        if (gl_GlobalInvocationID.x < scalarValue3)
        {
            branchMergedValue3 = 0u;
            branchMergedValue4 = scalarValue3;
            branchMergedValue5 = scalarValue4;
        }
        else
        {
            branchMergedValue3 = scalarValue3;
            branchMergedValue4 = uint(ViewCB.packedValues[78u].x);
            branchMergedValue5 = scalarValue4;
        }
        intermediateValue5 = branchMergedValue3;
        intermediateValue6 = branchMergedValue4;
        intermediateValue7 = branchMergedValue5;
    }
    if (((imageLoad(outputBufferHistoryLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y))).x * 255.0) >= 4.0) || (scalarValue2 == 65504.0))
    {
        imageStore(outputDenoisingMoments[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(scalarValue, scalarValue1, scalarValue, scalarValue));
    }
    else
    {
        uvec4 sampledTextureValue1 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)));
        uint scalarValue5 = sampledTextureValue1.x;
        uint multiplyAddValue = uint(int(fma(scalarValue2, 0.004999999888241291046142578125, 0.02500000037252902984619140625) * 1023.0));
        float intermediateValue10;
        float intermediateValue12;
        float intermediateValue14;
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        uint intermediateValue19;
        float scalarValue6 = 1.0;
        float scalarValue7 = scalarValue;
        float scalarValue8 = scalarValue1;
        uint scalarValue9 = 4294967294u;
        for (;;)
        {
            intermediateValue16 = scalarValue6;
            intermediateValue17 = scalarValue7;
            intermediateValue18 = scalarValue8;
            intermediateValue19 = 4294967294u;
            uint sumValue2;
            uint sumValue3;
            bool comparisonValue;
            for (;;)
            {
                sumValue2 = intermediateValue19 + gl_GlobalInvocationID.x;
                sumValue3 = scalarValue9 + gl_GlobalInvocationID.y;
                comparisonValue = ((intermediateValue19 | scalarValue9) != 0u) && (((int(sumValue3) > int(4294967295u)) && (int(sumValue2) >= int(intermediateValue5))) && ((int(sumValue3) < int(intermediateValue7)) && (int(sumValue2) < int(intermediateValue6))));
                float branchMergedValue;
                float branchMergedValue1;
                float branchMergedValue2;
                if (comparisonValue)
                {
                    uint sampledTextureValue2 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(sumValue2, sumValue3)), int(0u))).x - scalarValue5;
                    float comparisonValue1 = float(int(uint(abs(int(sampledTextureValue2)))) <= int(multiplyAddValue));
                    vec4 loadedBufferValue1 = imageLoad(outputDenoisingMoments[reinterpretedBits], ivec2(uvec2(sumValue2, sumValue3)));
                    branchMergedValue = comparisonValue1 + intermediateValue16;
                    branchMergedValue1 = (loadedBufferValue1.x * comparisonValue1) + intermediateValue17;
                    branchMergedValue2 = (loadedBufferValue1.y * comparisonValue1) + intermediateValue18;
                }
                else
                {
                    branchMergedValue = intermediateValue16;
                    branchMergedValue1 = intermediateValue17;
                    branchMergedValue2 = intermediateValue18;
                }
                intermediateValue10 = branchMergedValue;
                intermediateValue12 = branchMergedValue1;
                intermediateValue14 = branchMergedValue2;
                uint sumValue = intermediateValue19 + 1u;
                if (sumValue == 3u)
                {
                    break;
                }
                else
                {
                    intermediateValue16 = intermediateValue10;
                    intermediateValue17 = intermediateValue12;
                    intermediateValue18 = intermediateValue14;
                    intermediateValue19 = sumValue;
                    continue;
                }
            }
            uint sumValue1 = scalarValue9 + 1u;
            if (sumValue1 == 3u)
            {
                break;
            }
            else
            {
                scalarValue6 = intermediateValue10;
                scalarValue7 = intermediateValue12;
                scalarValue8 = intermediateValue14;
                scalarValue9 = sumValue1;
                continue;
            }
        }
        float quotientValue = intermediateValue12 / intermediateValue10;
        imageStore(outputDenoisingMoments[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(quotientValue, intermediateValue14 / intermediateValue10, quotientValue, quotientValue));
    }
}
