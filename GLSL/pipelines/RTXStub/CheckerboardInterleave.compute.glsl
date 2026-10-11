#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / CheckerboardInterleave / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 20
#endif

#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(ViewCB.packedValues[91u]);
    uint scalarValue = reinterpretedBits.y;
    uint intermediateValue1;
    uint intermediateValue2;
    if (scalarValue == 2u)
    {
        intermediateValue1 = gl_GlobalInvocationID.x;
        intermediateValue2 = 0u;
    }
    else
    {
        uint bitwiseValue = gl_GlobalInvocationID.x >> 1u;
        uint scalarValue1 = uint(int(ViewCB.packedValues[80u].x));
        uint branchMergedValue;
        uint branchMergedValue3;
        if (((gl_GlobalInvocationID.y ^ gl_GlobalInvocationID.x) & 1u) == (uint((scalarValue == 0u) && ((floatBitsToUint(ViewCB.packedValues[84u]).z & 1u) != 0u)) ^ 1u))
        {
            branchMergedValue = bitwiseValue;
            branchMergedValue3 = scalarValue1;
        }
        else
        {
            branchMergedValue = scalarValue1 + bitwiseValue;
            branchMergedValue3 = -scalarValue1;
        }
        intermediateValue1 = branchMergedValue;
        intermediateValue2 = branchMergedValue3;
    }
    float scalarValue2 = float(int(gl_GlobalInvocationID.y));
    if ((float(int(gl_GlobalInvocationID.x)) >= ViewCB.packedValues[78u].x) || (scalarValue2 >= ViewCB.packedValues[78u].y))
    {
        imageStore(outputBufferFinal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(outputBufferReprojectedPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
        imageStore(outputBufferMotionVectors, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(0.0));
    }
    else
    {
        vec4 sampledTextureValue = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(intermediateValue1, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue3 = sampledTextureValue.x;
        vec4 sampledTextureValue1 = texelFetch(inputBufferReflectionMotionVectors, ivec2(uvec2(intermediateValue1, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue4 = sampledTextureValue1.x;
        float scalarValue5 = sampledTextureValue1.y;
        vec4 sampledTextureValue2 = texelFetch(inputBufferPreInterleaveCurrent, ivec2(uvec2(intermediateValue1, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue6 = sampledTextureValue2.x;
        float scalarValue7 = sampledTextureValue2.y;
        float scalarValue8 = sampledTextureValue2.z;
        float scalarValue9 = sampledTextureValue2.w;
        float comparisonValue4;
        float comparisonValue5;
        float comparisonValue6;
        float productValue;
        float productValue1;
        float productValue2;
        float comparisonValue7;
        if (scalarValue9 != 0.0)
        {
            uint sumValue = intermediateValue2 + intermediateValue1;
            vec4 sampledTextureValue3 = texelFetch(inputBufferPreInterleaveCurrent, ivec2(uvec2(sumValue, gl_GlobalInvocationID.y + 1u)), int(0u));
            vec4 sampledTextureValue4 = texelFetch(inputBufferPreInterleaveCurrent, ivec2(uvec2(sumValue, gl_GlobalInvocationID.y + 4294967295u)), int(0u));
            vec4 sampledTextureValue5 = texelFetch(inputBufferPreInterleaveCurrent, ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)), int(0u));
            vec4 sampledTextureValue6 = texelFetch(inputBufferPreInterleaveCurrent, ivec2(uvec2((((gl_GlobalInvocationID.x << 1u) & 2u) + 4294967295u) + sumValue, gl_GlobalInvocationID.y)), int(0u));
            bool comparisonValue = (gl_GlobalInvocationID.x == 0u) || (gl_GlobalInvocationID.x == (uint(int(ViewCB.packedValues[78u].x)) + 4294967295u));
            float comparisonValue1 = (((sampledTextureValue4.x + sampledTextureValue3.x) + (comparisonValue ? 0.0 : sampledTextureValue5.x)) + (comparisonValue ? 0.0 : sampledTextureValue6.x)) * 0.25;
            float comparisonValue2 = (((sampledTextureValue4.y + sampledTextureValue3.y) + (comparisonValue ? 0.0 : sampledTextureValue5.y)) + (comparisonValue ? 0.0 : sampledTextureValue6.y)) * 0.25;
            float comparisonValue3 = (((sampledTextureValue4.z + sampledTextureValue3.z) + (comparisonValue ? 0.0 : sampledTextureValue5.z)) + (comparisonValue ? 0.0 : sampledTextureValue6.z)) * 0.25;
            vec4 sampledTextureValue7 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)), int(0u));
            float scalarValue10 = sampledTextureValue7.x;
            vec4 sampledTextureValue8 = texelFetch(inputBufferReflectionMotionVectors, ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)), int(0u));
            float scalarValue11 = sampledTextureValue8.x;
            float scalarValue12 = sampledTextureValue8.y;
            float intermediateValue18;
            float intermediateValue19;
            float intermediateValue20;
            uint intermediateValue21;
            if (scalarValue == 0u)
            {
                float scalarValue13 = ViewCB.packedValues[80u].x * scalarValue11;
                float productValue3 = ViewCB.packedValues[80u].y * scalarValue12;
                float sumValue1 = (float(int(sumValue)) + 0.5) + scalarValue13;
                float sumValue2 = (scalarValue2 + 0.5) + productValue3;
                uint scalarValue14 = uint(ViewCB.packedValues[80u].x);
                bool conditionValue = sumValue < scalarValue14;
                float branchMergedValue1;
                float branchMergedValue4;
                float branchMergedValue5;
                uint branchMergedValue6;
                if ((((sumValue2 > 0.0) && (sumValue1 > (conditionValue ? 0.0 : float(int(scalarValue14))))) && (dot(vec2(scalarValue13, productValue3), vec2(scalarValue13, productValue3)) < 2.0)) && ((sumValue1 < float(int((conditionValue ? scalarValue14 : uint(ViewCB.packedValues[78u].x)) + 4294967295u))) && (sumValue2 < float(int(uint(ViewCB.packedValues[78u].y) + 4294967295u)))))
                {
                    vec4 sampledTextureValue9 = texelFetch(inputBufferPreInterleavePrevious, ivec2(uvec2(uint(spvNMin(spvNMax(float(uint(ViewCB.packedValues[88u].x * float(uint(floor(sumValue1))))), 0.0), ViewCB.packedValues[78u].x * ViewCB.packedValues[88u].x)), uint(spvNMin(spvNMax(float(uint(float(uint(floor(sumValue2))) * ViewCB.packedValues[88u].x)), 0.0), ViewCB.packedValues[78u].y * ViewCB.packedValues[88u].x)))), int(0u));
                    branchMergedValue1 = sampledTextureValue9.x;
                    branchMergedValue4 = sampledTextureValue9.y;
                    branchMergedValue5 = sampledTextureValue9.z;
                    branchMergedValue6 = uint(scalarValue3 < scalarValue10);
                }
                else
                {
                    branchMergedValue1 = comparisonValue1;
                    branchMergedValue4 = comparisonValue2;
                    branchMergedValue5 = comparisonValue3;
                    branchMergedValue6 = 0u;
                }
                intermediateValue18 = branchMergedValue1;
                intermediateValue19 = branchMergedValue4;
                intermediateValue20 = branchMergedValue5;
                intermediateValue21 = branchMergedValue6;
            }
            else
            {
                intermediateValue18 = comparisonValue1;
                intermediateValue19 = comparisonValue2;
                intermediateValue20 = comparisonValue3;
                intermediateValue21 = 0u;
            }
            vec4 sampledTextureValue10 = texelFetch(inputBufferIncomingIrradianceCache, ivec2(uvec2(intermediateValue1, gl_GlobalInvocationID.y)), int(0u));
            float scalarValue15 = sampledTextureValue10.w;
            float sampledTextureValue11;
            if (scalarValue15 < 0.0)
            {
                sampledTextureValue11 = 1.0 - texelFetch(inputBufferIncomingIrradianceCache, ivec2(uvec2(sumValue, gl_GlobalInvocationID.y)), int(0u)).w;
            }
            else
            {
                sampledTextureValue11 = scalarValue15;
            }
            uint bitwiseValue1 = uint(scalarValue9) >> 8u;
            uint intermediateValue26;
            if (bitwiseValue1 == 3u)
            {
                intermediateValue26 = uint(dot(vec2(scalarValue11, scalarValue12), vec2(scalarValue11, scalarValue12)) > dot(vec2(scalarValue4, scalarValue5), vec2(scalarValue4, scalarValue5)));
            }
            else
            {
                uint branchMergedValue2;
                if (bitwiseValue1 == 0u)
                {
                    branchMergedValue2 = uint(dot(vec3(intermediateValue18, intermediateValue19, intermediateValue20), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) > dot(vec3(scalarValue6, scalarValue7, scalarValue8), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)));
                }
                else
                {
                    branchMergedValue2 = uint(bitwiseValue1 != ((int(intermediateValue2) > int(0u)) ? 1u : 2u));
                }
                intermediateValue26 = branchMergedValue2;
            }
            bool comparisonValue8 = intermediateValue26 != 0u;
            comparisonValue4 = comparisonValue8 ? scalarValue10 : scalarValue3;
            comparisonValue5 = comparisonValue8 ? scalarValue11 : scalarValue4;
            comparisonValue6 = comparisonValue8 ? scalarValue12 : scalarValue5;
            productValue = (sampledTextureValue11 * (intermediateValue18 - scalarValue6)) + scalarValue6;
            productValue1 = (sampledTextureValue11 * (intermediateValue19 - scalarValue7)) + scalarValue7;
            productValue2 = (sampledTextureValue11 * (intermediateValue20 - scalarValue8)) + scalarValue8;
            comparisonValue7 = float(intermediateValue21 != 0u);
        }
        else
        {
            comparisonValue4 = scalarValue3;
            comparisonValue5 = scalarValue4;
            comparisonValue6 = scalarValue5;
            productValue = scalarValue6;
            productValue1 = scalarValue7;
            productValue2 = scalarValue8;
            comparisonValue7 = 0.0;
        }
        float intermediateValue23;
        float intermediateValue24;
        float intermediateValue25;
        if (floatBitsToUint(ViewCB.packedValues[95u]).w == 0u)
        {
            intermediateValue23 = productValue;
            intermediateValue24 = productValue1;
            intermediateValue25 = productValue2;
        }
        else
        {
            float exponentialValue = exp2(log2(spvNMax(productValue * 9.9999997473787516355514526367188e-05, 0.0)) * 0.1593017578125);
            float exponentialValue1 = exp2(log2(spvNMax(productValue1 * 9.9999997473787516355514526367188e-05, 0.0)) * 0.1593017578125);
            float exponentialValue2 = exp2(log2(spvNMax(productValue2 * 9.9999997473787516355514526367188e-05, 0.0)) * 0.1593017578125);
            intermediateValue23 = spvNClamp(exp2(log2(((exponentialValue * 18.8515625) + 0.8359375) / ((exponentialValue * 18.6875) + 1.0)) * 78.84375), 0.0, 1.0);
            intermediateValue24 = spvNClamp(exp2(log2(((exponentialValue1 * 18.8515625) + 0.8359375) / ((exponentialValue1 * 18.6875) + 1.0)) * 78.84375), 0.0, 1.0);
            intermediateValue25 = spvNClamp(exp2(log2(((exponentialValue2 * 18.8515625) + 0.8359375) / ((exponentialValue2 * 18.6875) + 1.0)) * 78.84375), 0.0, 1.0);
        }
        imageStore(outputBufferFinal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(intermediateValue23, intermediateValue24, intermediateValue25, comparisonValue7));
        imageStore(outputBufferReprojectedPathLength, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(comparisonValue4));
        imageStore(outputBufferMotionVectors, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(comparisonValue5, comparisonValue6, comparisonValue5, comparisonValue5));
    }
}
