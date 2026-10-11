#version 460
#extension GL_GOOGLE_include_directive : require
// BilateralGrid / FilterBilateralGrid / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT128
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 10
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/BilateralGrid/ComputeBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue6 = uint(computeVectorConstants0.packedValues[1u].x);
    uint scalarValue7 = uint(computeVectorConstants0.packedValues[1u].y);
    if (((gl_GlobalInvocationID.x < scalarValue6) && (gl_GlobalInvocationID.y < scalarValue7)) && (gl_GlobalInvocationID.z < uint(computeVectorConstants0.packedValues[1u].z)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if ((gl_GlobalInvocationID.z < uint(computeVectorConstants0.packedValues[1u].z)) && ((gl_GlobalInvocationID.x < uint(computeVectorConstants0.packedValues[1u].x)) && (gl_GlobalInvocationID.y < uint(computeVectorConstants0.packedValues[1u].y))))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint scalarValue8 = uint(int(computeScalarConstants0.packedValues[0u]));
        float scalarValue9 = trunc(computeScalarConstants0.packedValues[0u]);
        float productValue3 = (scalarValue9 * scalarValue9) * 0.5;
        uint sumValue14 = uint(int(computeVectorConstants0.packedValues[1u].x)) - 1u;
        uint sumValue15 = uint(int(computeVectorConstants0.packedValues[1u].y)) - 1u;
        uint sumValue16 = uint(min(int(sumValue14), int(uint(max(int(gl_GlobalInvocationID.x - scalarValue8), int(0u))))));
        uint sumValue17 = uint(min(int(sumValue15), int(uint(max(int(gl_GlobalInvocationID.y - scalarValue8), int(0u))))));
        uint sumValue18 = uint(min(int(uint(max(int(gl_GlobalInvocationID.x + scalarValue8), int(0u)))), int(sumValue14)));
        uint sumValue19 = uint(min(int(sumValue15), int(uint(max(int(scalarValue8 + gl_GlobalInvocationID.y), int(0u))))));
        uint productValue4 = gl_GlobalInvocationID.z * scalarValue6;
        float scalarValue10 = rdEvaluateFloatExpression(gl_GlobalInvocationID.x);
        float scalarValue11 = rdEvaluateFloatExpression(gl_GlobalInvocationID.y);
        float intermediateValue11;
        float intermediateValue13;
        float intermediateValue15;
        intermediateValue11 = 0.0;
        intermediateValue13 = 0.0;
        intermediateValue15 = 0.0;
        uint sumValue6;
        float intermediateValue12;
        float intermediateValue14;
        float intermediateValue16;
        uint scalarValue12 = sumValue17;
        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint scalarValue = uint(int(computeVectorConstants0.packedValues[0u].x));
        float scalarValue1 = float(int(scalarValue));
        float productValue = (scalarValue1 * scalarValue1) * 0.5;
        uint sumValue = uint(int(computeVectorConstants0.packedValues[1u].x)) + 4294967295u;
        uint sumValue1 = uint(min(int(uint(max(int(gl_GlobalInvocationID.x - scalarValue), int(0u)))), int(sumValue)));
        uint sumValue2 = uint(min(int(uint(max(int(scalarValue + gl_GlobalInvocationID.x), int(0u)))), int(sumValue)));
        uint sumValue3 = uint(int(computeVectorConstants0.packedValues[1u].y)) + 4294967295u;
        uint sumValue4 = uint(min(int(uint(max(int(gl_GlobalInvocationID.y - scalarValue), int(0u)))), int(sumValue3)));
        uint sumValue5 = uint(min(int(uint(max(int(scalarValue + gl_GlobalInvocationID.y), int(0u)))), int(sumValue3)));
        float intermediateValue2;
        float intermediateValue4;
        float intermediateValue6;
        if (sumValue4 > sumValue5)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            if (sumValue19 < scalarValue12)
            {
                break;
            }
            uint productValue5 = (productValue4 * scalarValue7) + (scalarValue6 * scalarValue12);
            float sumValue20 = rdEvaluateFloatExpression(scalarValue12) - scalarValue11;
            float productValue6 = sumValue20 * sumValue20;
            intermediateValue12 = intermediateValue11;
            intermediateValue14 = intermediateValue13;
            intermediateValue16 = intermediateValue15;
            float sumValue8;
            float multiplyAddValue;
            float multiplyAddValue1;
            uint sumValue9;
            uint scalarValue13 = sumValue16;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue2 = 0.0;
            intermediateValue4 = 0.0;
            intermediateValue6 = 0.0;
        }
        else
        {
            float intermediateValue3;
            float intermediateValue5;
            float intermediateValue7;
            float scalarValue2 = 0.0;
            float scalarValue3 = 0.0;
            float scalarValue4 = 0.0;
            uint scalarValue5 = sumValue4;
            bool intermediateValue12;
#endif
            for (;;)
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                if (sumValue18 < scalarValue13)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue12 = sumValue1 > sumValue2;
                float branchMergedValue;
                float branchMergedValue1;
                float branchMergedValue2;
                if (intermediateValue12)
                {
                    branchMergedValue = scalarValue2;
                    branchMergedValue1 = scalarValue3;
                    branchMergedValue2 = scalarValue4;
                }
                else
                {
                    float intermediateValue13;
                    float intermediateValue14;
                    float intermediateValue15;
                    uint intermediateValue16;
                    intermediateValue13 = scalarValue2;
                    intermediateValue14 = scalarValue3;
                    intermediateValue15 = scalarValue4;
                    intermediateValue16 = sumValue1;
                    float loadedBufferValue;
                    float loadedBufferValue1;
                    float sumValue7;
                    for (;;)
                    {
                        uint productValue1 = (((uint(computeVectorConstants0.packedValues[1u].y) * gl_GlobalInvocationID.z) + scalarValue5) * uint(computeVectorConstants0.packedValues[1u].x)) + intermediateValue16;
                        float sumValue10 = float(intermediateValue16) - float(gl_GlobalInvocationID.x);
                        float sumValue11 = float(scalarValue5) - float(gl_GlobalInvocationID.y);
                        float exponentialValue = exp2((((-0.0) - ((sumValue11 * sumValue11) + (sumValue10 * sumValue10))) / productValue) * 1.44269502162933349609375);
                        float productValue2 = exponentialValue * 0.00390625;
                        loadedBufferValue = (productValue2 * float(imageLoad(bilateralGrid, int(productValue1 * 2u)).x)) + intermediateValue13;
                        loadedBufferValue1 = (productValue2 * float(imageLoad(bilateralGrid, int((productValue1 * 2u) + 1u)).x)) + intermediateValue14;
                        sumValue7 = exponentialValue + intermediateValue15;
                        uint sumValue12 = intermediateValue16 + 1u;
                        if (sumValue12 > sumValue2)
                        {
                            break;
                        }
                        else
                        {
                            intermediateValue13 = loadedBufferValue;
                            intermediateValue14 = loadedBufferValue1;
                            intermediateValue15 = sumValue7;
                            intermediateValue16 = sumValue12;
                        }
                    }
                    branchMergedValue = loadedBufferValue;
                    branchMergedValue1 = loadedBufferValue1;
                    branchMergedValue2 = sumValue7;
                }
                intermediateValue3 = branchMergedValue;
                intermediateValue5 = branchMergedValue1;
                intermediateValue7 = branchMergedValue2;
                uint sumValue13 = scalarValue5 + 1u;
                if (sumValue13 > sumValue5)
#endif
                {
                    break;
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                uint productValue7 = (productValue5 + scalarValue13) * 2u;
                uvec2 loadedBufferValue2 = uvec2(imageLoad(intermediateValue1, int(productValue7)).x, imageLoad(intermediateValue1, int(productValue7 + 1u)).x);
                float sumValue21 = rdEvaluateFloatExpression(scalarValue13) - scalarValue10;
                float multiplyAddValue2 = exp2(((-fma(sumValue21, sumValue21, productValue6)) / productValue3) * 1.44269502162933349609375);
                multiplyAddValue1 = fma(multiplyAddValue2, rdEvaluateFloatExpression(loadedBufferValue2.x) * 0.00390625, intermediateValue16);
                multiplyAddValue = fma(multiplyAddValue2, rdEvaluateFloatExpression(loadedBufferValue2.y) * 0.00390625, intermediateValue14);
                sumValue8 = intermediateValue12 + multiplyAddValue2;
                sumValue9 = scalarValue13 + 1u;
                intermediateValue12 = sumValue8;
                intermediateValue14 = multiplyAddValue;
                intermediateValue16 = multiplyAddValue1;
                scalarValue13 = sumValue9;
                continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                else
                {
                    scalarValue2 = intermediateValue3;
                    scalarValue3 = intermediateValue5;
                    scalarValue4 = intermediateValue7;
                    scalarValue5 = sumValue13;
                    continue;
                }
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            sumValue6 = scalarValue12 + 1u;
            intermediateValue11 = intermediateValue12;
            intermediateValue13 = intermediateValue14;
            intermediateValue15 = intermediateValue16;
            scalarValue12 = sumValue6;
            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue2 = intermediateValue3;
            intermediateValue4 = intermediateValue5;
            intermediateValue6 = intermediateValue7;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        imageStore(intermediateValue, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(intermediateValue15 / intermediateValue11, intermediateValue13 / intermediateValue11, 0.0, 0.0));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        imageStore(filteredBilateralGridOutputTexture, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(intermediateValue2 / intermediateValue6, intermediateValue4 / intermediateValue6, 0.0, 0.0));
#endif
    }
}
