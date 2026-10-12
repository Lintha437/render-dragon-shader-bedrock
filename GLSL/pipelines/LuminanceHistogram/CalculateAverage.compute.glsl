#version 460
#extension GL_GOOGLE_include_directive : require
// LuminanceHistogram / CalculateAverage / compute forward pipeline.
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
#define RD_BINDING_LAYOUT 8
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

#include "../../include/materials/LuminanceHistogram/ComputeBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue7;
    intermediateValue7 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue;
    uint intermediateValue1;
    intermediateValue = 0.0;
    intermediateValue1 = 1u;
#endif
    float loadedBufferValue;
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint sumValue;
    uint scalarValue1 = 1u;
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
        loadedBufferValue = fma(rdEvaluateFloatExpression(imageLoad(intermediateValue2, int(scalarValue1)).x), 0.00390625, intermediateValue7);
        sumValue = scalarValue1 + 1u;
        intermediateValue7 = loadedBufferValue;
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
    float productValue3 = intermediateValue7 * computeVectorConstants0.packedValues[4u].x;
    float productValue4 = intermediateValue7 * computeVectorConstants0.packedValues[4u].y;
    float intermediateValue9;
    float intermediateValue10;
    intermediateValue9 = 0.0;
    intermediateValue10 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = computeVectorConstants0.packedValues[4u].x * loadedBufferValue;
    float productValue1 = computeVectorConstants0.packedValues[4u].y * loadedBufferValue;
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
    float multiplyAddValue;
    float loadedBufferValue1;
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
        float loadedBufferValue2 = (float(imageLoad(curFrameLuminanceHistogram, int(intermediateValue5)).x) * 0.00390625) + intermediateValue3;
        float sumValue4 = spvNMax(spvNMin(loadedBufferValue2, productValue1), scalarValue) - scalarValue;
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
        loadedBufferValue1 = fma(rdEvaluateFloatExpression(imageLoad(intermediateValue2, int(scalarValue3)).x), 0.00390625, scalarValue2);
        float sumValue6 = spvNMax(scalarValue4, spvNMin(productValue4, loadedBufferValue1)) - scalarValue4;
        multiplyAddValue = fma(sumValue6, rdEvaluateFloatExpression(scalarValue3), intermediateValue10);
        sumValue1 = sumValue6 + intermediateValue9;
        sumValue2 = scalarValue3 + 1u;
        intermediateValue9 = sumValue1;
        intermediateValue10 = multiplyAddValue;
        scalarValue2 = loadedBufferValue1;
        scalarValue3 = sumValue2;
        continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        else
        {
            intermediateValue2 = productValue2;
            intermediateValue3 = loadedBufferValue2;
            intermediateValue4 = sumValue1;
            intermediateValue5 = sumValue5;
        }
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue1 = fma(((intermediateValue10 / spvNMax(intermediateValue9, 1.0)) - 1.0) * computeScalarConstants0.packedValues[4u], 0.00393700785934925079345703125, computeScalarConstants0.packedValues[12u]);
    float sampledTextureValue1 = spvNMin(computeScalarConstants0.packedValues[4u] + computeScalarConstants0.packedValues[12u], spvNMax(log2(spvNMax(textureLod(sampler2D(materialTexture1, textureSampler1), vec2(0.5), 0.0).x, 0.00095000001601874828338623046875)), computeScalarConstants0.packedValues[12u]));
    imageStore(intermediateValue1, ivec2(uvec2(0u)), vec4(exp2((computeScalarConstants0.packedValues[8u] > 0.5) ? fma(multiplyAddValue1 - sampledTextureValue1, 1.0 - exp2((((sampledTextureValue1 < multiplyAddValue1) ? computeScalarConstants0.packedValues[1u] : computeScalarConstants0.packedValues[2u]) * (computeScalarConstants0.packedValues[0u] * (-computeScalarConstants0.packedValues[9u]))) * 1.44269502162933349609375), sampledTextureValue1) : multiplyAddValue1)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float quotientValue = ((((productValue2 / spvNMax(sumValue1, 1.0)) + (-1.0)) * 0.00393700785934925079345703125) * computeVectorConstants0.packedValues[1u].x) + computeVectorConstants0.packedValues[3u].x;
    float exponentialValue;
    if (computeVectorConstants0.packedValues[2u].x > 0.5)
    {
        float sampledTextureValue = spvNMin(spvNMax(log2(spvNMax(textureLod(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5), 0.0).x, 0.00095000001601874828338623046875)), computeVectorConstants0.packedValues[3u].x), computeVectorConstants0.packedValues[3u].x + computeVectorConstants0.packedValues[1u].x);
        exponentialValue = ((1.0 - exp2(((computeVectorConstants0.packedValues[2u].y * (-1.44269502162933349609375)) * computeVectorConstants0.packedValues[0u].x) * ((quotientValue > sampledTextureValue) ? computeVectorConstants0.packedValues[0u].y : computeVectorConstants0.packedValues[0u].z))) * (quotientValue - sampledTextureValue)) + sampledTextureValue;
    }
    else
    {
        exponentialValue = quotientValue;
    }
    imageStore(adaptedFrameAverageLuminanceTexture, ivec2(uvec2(0u)), vec4(exp2(exponentialValue)));
#endif
}
