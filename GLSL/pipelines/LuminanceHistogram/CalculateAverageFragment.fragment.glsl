#version 460
#extension GL_GOOGLE_include_directive : require
// LuminanceHistogram / CalculateAverageFragment / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT128
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/LuminanceHistogram/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue6;
    intermediateValue6 = 0.0;
    float multiplyAddValue;
    uint sumValue;
    uint scalarValue1 = 1u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue;
    uint intermediateValue1;
    intermediateValue = 0.0;
    intermediateValue1 = 1u;
    float loadedBufferValue;
#endif
    for (;;)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (scalarValue1 >= 256u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        loadedBufferValue = (float(imageLoad(curFrameLuminanceHistogram, int(intermediateValue1)).x) * 0.00390625) + intermediateValue;
        uint sumValue3 = intermediateValue1 + 1u;
        if (sumValue3 == 256u)
#endif
        {
            break;
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue = fma(rdEvaluateFloatExpression(intermediateValue1.packedValues[scalarValue1]), 0.00390625, intermediateValue6);
        sumValue = scalarValue1 + 1u;
        intermediateValue6 = multiplyAddValue;
        scalarValue1 = sumValue;
        continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        else
        {
            intermediateValue = loadedBufferValue;
            intermediateValue1 = sumValue3;
        }
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float productValue3 = intermediateValue6 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue4 = intermediateValue6 * fragmentVectorConstants1.packedValues[4u].y;
    float intermediateValue8;
    float intermediateValue9;
    intermediateValue8 = 0.0;
    intermediateValue9 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = fragmentVectorConstants1.packedValues[4u].x * loadedBufferValue;
    float productValue1 = fragmentVectorConstants1.packedValues[4u].y * loadedBufferValue;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    uint intermediateValue5;
    intermediateValue2 = 0.0;
    intermediateValue3 = 0.0;
    intermediateValue4 = 0.0;
    intermediateValue5 = 1u;
    float productValue2;
#endif
    float sumValue1;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint sumValue2;
    float scalarValue2 = 0.0;
    uint scalarValue3 = 1u;
#endif
    for (;;)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (scalarValue3 >= 256u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float scalarValue = spvNMax(intermediateValue3, productValue);
        float loadedBufferValue1 = (float(imageLoad(curFrameLuminanceHistogram, int(intermediateValue5)).x) * 0.00390625) + intermediateValue3;
        float sumValue4 = spvNMax(spvNMin(loadedBufferValue1, productValue1), scalarValue) - scalarValue;
        productValue2 = (sumValue4 * float(intermediateValue5)) + intermediateValue2;
        sumValue1 = sumValue4 + intermediateValue4;
        uint sumValue5 = intermediateValue5 + 1u;
        if (sumValue5 == 256u)
#endif
        {
            break;
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float scalarValue4 = spvNMax(productValue3, scalarValue2);
        multiplyAddValue2 = fma(rdEvaluateFloatExpression(intermediateValue1.packedValues[scalarValue3]), 0.00390625, scalarValue2);
        float sumValue6 = spvNMax(scalarValue4, spvNMin(productValue4, multiplyAddValue2)) - scalarValue4;
        multiplyAddValue1 = fma(sumValue6, rdEvaluateFloatExpression(scalarValue3), intermediateValue9);
        sumValue1 = sumValue6 + intermediateValue8;
        sumValue2 = scalarValue3 + 1u;
        intermediateValue8 = sumValue1;
        intermediateValue9 = multiplyAddValue1;
        scalarValue2 = multiplyAddValue2;
        scalarValue3 = sumValue2;
        continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        else
        {
            intermediateValue2 = productValue2;
            intermediateValue3 = loadedBufferValue1;
            intermediateValue4 = sumValue1;
            intermediateValue5 = sumValue5;
        }
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue3 = fma(((intermediateValue9 / spvNMax(intermediateValue8, 1.0)) - 1.0) * fragmentScalarConstants1.packedValues[8u], 0.00393700785934925079345703125, fragmentScalarConstants1.packedValues[12u]);
    float sampledTextureValue1 = spvNMin(fragmentScalarConstants1.packedValues[8u] + fragmentScalarConstants1.packedValues[12u], spvNMax(log2(spvNMax(textureLod(sampler2D(materialTexture1, textureSampler1), vec2(0.5), 0.0).x, 0.00095000001601874828338623046875)), fragmentScalarConstants1.packedValues[12u]));
    float multiplyAddValue4 = exp2((fragmentScalarConstants1.packedValues[0u] > 0.5) ? fma(multiplyAddValue3 - sampledTextureValue1, 1.0 - exp2((((sampledTextureValue1 < multiplyAddValue3) ? fragmentScalarConstants1.packedValues[5u] : fragmentScalarConstants1.packedValues[6u]) * ((-fragmentScalarConstants1.packedValues[1u]) * fragmentScalarConstants1.packedValues[4u])) * 1.44269502162933349609375), sampledTextureValue1) : multiplyAddValue3);
    fragmentColor0.x = multiplyAddValue4;
    fragmentColor0.y = multiplyAddValue4;
    fragmentColor0.z = multiplyAddValue4;
    fragmentColor0.w = multiplyAddValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float quotientValue = ((((productValue2 / spvNMax(sumValue1, 1.0)) + (-1.0)) * 0.00393700785934925079345703125) * fragmentVectorConstants1.packedValues[2u].x) + fragmentVectorConstants1.packedValues[3u].x;
    float exponentialValue;
    if (fragmentVectorConstants1.packedValues[0u].x > 0.5)
    {
        float sampledTextureValue = spvNMin(spvNMax(log2(spvNMax(textureLod(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5), 0.0).x, 0.00095000001601874828338623046875)), fragmentVectorConstants1.packedValues[3u].x), fragmentVectorConstants1.packedValues[3u].x + fragmentVectorConstants1.packedValues[2u].x);
        exponentialValue = ((1.0 - exp2(((fragmentVectorConstants1.packedValues[0u].y * (-1.44269502162933349609375)) * fragmentVectorConstants1.packedValues[1u].x) * ((quotientValue > sampledTextureValue) ? fragmentVectorConstants1.packedValues[1u].y : fragmentVectorConstants1.packedValues[1u].z))) * (quotientValue - sampledTextureValue)) + sampledTextureValue;
    }
    else
    {
        exponentialValue = quotientValue;
    }
    float exponentialValue1 = exp2(exponentialValue);
    fragmentColor0.x = exponentialValue1;
    fragmentColor0.y = exponentialValue1;
    fragmentColor0.z = exponentialValue1;
    fragmentColor0.w = exponentialValue1;
#endif
}
