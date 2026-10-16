#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / FilterMoments / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uint reinterpretedBits = (floatBitsToUint(RootConstants.packedValues[0u]).x >> 16u) & 255u;
    uint reinterpretedBits1 = (floatBitsToUint(RootConstants.packedValues[0u]).x >> 8u) & 255u;
    vec4 loadedBufferValue = imageLoad(outputDenoisingMoments[reinterpretedBits], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
    float scalarValue = loadedBufferValue.x;
    float scalarValue1 = loadedBufferValue.y;
    uint reinterpretedBits2 = floatBitsToUint(RootConstants.packedValues[0u]).x >> 24u;
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
        vec4 sampledTextureValue1 = texelFetch(inputBufferNormal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue5 = sampledTextureValue1.x;
        float scalarValue6 = sampledTextureValue1.y;
        float sumValue = 1.0 - abs(scalarValue5);
        float scalarValue7 = abs(scalarValue6);
        float sumValue1 = sumValue - scalarValue7;
        bool conditionValue = sumValue1 < 0.0;
        float comparisonValue = conditionValue ? ((1.0 - scalarValue7) * ((scalarValue5 >= 0.0) ? 1.0 : (-1.0))) : scalarValue5;
        float comparisonValue1 = conditionValue ? (((scalarValue6 >= 0.0) ? 1.0 : (-1.0)) * sumValue) : scalarValue6;
        float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue1), vec3(comparisonValue, comparisonValue1, sumValue1)));
        float productValue = comparisonValue * inverseLengthValue;
        float productValue1 = comparisonValue1 * inverseLengthValue;
        float productValue2 = inverseLengthValue * sumValue1;
        uvec4 sampledTextureValue2 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)));
        uint scalarValue8 = sampledTextureValue2.x;
        uint multiplyAddValue = uint(int(fma(scalarValue2, 0.004999999888241291046142578125, 0.02500000037252902984619140625) * 1023.0));
        float intermediateValue14;
        float intermediateValue16;
        float intermediateValue18;
        float intermediateValue20;
        float intermediateValue21;
        float intermediateValue22;
        uint intermediateValue23;
        float scalarValue9 = 1.0;
        float scalarValue10 = scalarValue;
        float scalarValue11 = scalarValue1;
        uint scalarValue12 = 4294967294u;
        for (;;)
        {
            intermediateValue20 = scalarValue9;
            intermediateValue21 = scalarValue10;
            intermediateValue22 = scalarValue11;
            intermediateValue23 = 4294967294u;
            uint sumValue4;
            uint sumValue5;
            bool comparisonValue2;
            for (;;)
            {
                sumValue4 = intermediateValue23 + gl_GlobalInvocationID.x;
                sumValue5 = scalarValue12 + gl_GlobalInvocationID.y;
                comparisonValue2 = ((intermediateValue23 | scalarValue12) != 0u) && (((int(sumValue5) > int(4294967295u)) && (int(sumValue4) >= int(intermediateValue5))) && ((int(sumValue5) < int(intermediateValue7)) && (int(sumValue4) < int(intermediateValue6))));
                float branchMergedValue;
                float branchMergedValue1;
                float branchMergedValue2;
                if (comparisonValue2)
                {
                    uint sampledTextureValue3 = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(sumValue4, sumValue5)), int(0u))).x - scalarValue8;
                    vec4 sampledTextureValue4 = texelFetch(inputBufferNormal, ivec2(uvec2(sumValue4, sumValue5)), int(0u));
                    float scalarValue13 = sampledTextureValue4.x;
                    float scalarValue14 = sampledTextureValue4.y;
                    float sumValue2 = 1.0 - abs(scalarValue13);
                    float scalarValue15 = abs(scalarValue14);
                    float sumValue3 = sumValue2 - scalarValue15;
                    bool conditionValue1 = sumValue3 < 0.0;
                    float comparisonValue3 = conditionValue1 ? ((1.0 - scalarValue15) * ((scalarValue13 >= 0.0) ? 1.0 : (-1.0))) : scalarValue13;
                    float comparisonValue4 = conditionValue1 ? (((scalarValue14 >= 0.0) ? 1.0 : (-1.0)) * sumValue2) : scalarValue14;
                    float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue3, comparisonValue4, sumValue3), vec3(comparisonValue3, comparisonValue4, sumValue3)));
                    float dotProductValue = exp2(log2(spvNClamp(dot(vec3(productValue, productValue1, productValue2), vec3(comparisonValue3 * inverseLengthValue1, comparisonValue4 * inverseLengthValue1, inverseLengthValue1 * sumValue3)), 0.0, 1.0)) * ViewCB.packedValues[(reinterpretedBits2 << 1u) + 46u].z) * float(int(uint(abs(int(sampledTextureValue3)))) <= int(multiplyAddValue));
                    vec4 loadedBufferValue1 = imageLoad(outputDenoisingMoments[reinterpretedBits], ivec2(uvec2(sumValue4, sumValue5)));
                    branchMergedValue = dotProductValue + intermediateValue20;
                    branchMergedValue1 = (loadedBufferValue1.x * dotProductValue) + intermediateValue21;
                    branchMergedValue2 = (loadedBufferValue1.y * dotProductValue) + intermediateValue22;
                }
                else
                {
                    branchMergedValue = intermediateValue20;
                    branchMergedValue1 = intermediateValue21;
                    branchMergedValue2 = intermediateValue22;
                }
                intermediateValue14 = branchMergedValue;
                intermediateValue16 = branchMergedValue1;
                intermediateValue18 = branchMergedValue2;
                uint sumValue6 = intermediateValue23 + 1u;
                if (sumValue6 == 3u)
                {
                    break;
                }
                else
                {
                    intermediateValue20 = intermediateValue14;
                    intermediateValue21 = intermediateValue16;
                    intermediateValue22 = intermediateValue18;
                    intermediateValue23 = sumValue6;
                    continue;
                }
            }
            uint sumValue7 = scalarValue12 + 1u;
            if (sumValue7 == 3u)
            {
                break;
            }
            else
            {
                scalarValue9 = intermediateValue14;
                scalarValue10 = intermediateValue16;
                scalarValue11 = intermediateValue18;
                scalarValue12 = sumValue7;
                continue;
            }
        }
        float quotientValue = intermediateValue16 / intermediateValue14;
        imageStore(outputDenoisingMoments[reinterpretedBits1], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(quotientValue, intermediateValue18 / intermediateValue14, quotientValue, quotientValue));
    }
}
