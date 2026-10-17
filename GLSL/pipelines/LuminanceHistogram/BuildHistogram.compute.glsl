#version 460
#extension GL_GOOGLE_include_directive : require
// LuminanceHistogram / BuildHistogram / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT128
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/LuminanceHistogram/ComputeBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM50)
    uint sumValue;
    uint scalarValue4 = 0u;
    for (;;)
    {
        if (scalarValue4 >= 2u)
        {
            break;
        }
        intermediateValue7[gl_LocalInvocationIndex + (scalarValue4 * 128u)] = 0u;
        sumValue = scalarValue4 + 1u;
        scalarValue4 = sumValue;
        continue;
    }
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    intermediateValue7[gl_LocalInvocationIndex] = 0u;
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM65)
    intermediateValue[gl_LocalInvocationIndex] = 0u;
    uint sumValue1 = gl_LocalInvocationIndex + 128u;
    intermediateValue[sumValue1] = 0u;
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    intermediateValue[gl_LocalInvocationIndex] = 0u;
#endif
    barrier();
    if ((gl_GlobalInvocationID.x < uint(computeVectorConstants0.packedValues[4u].x)) && (gl_GlobalInvocationID.y < uint(computeVectorConstants0.packedValues[4u].y)))
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float quotientValue5 = (rdSignedBitsToFloat(gl_GlobalInvocationID.x) + 0.5) / computeVectorConstants0.packedValues[4u].z;
        float quotientValue6 = (rdSignedBitsToFloat(gl_GlobalInvocationID.y) + 0.5) / computeVectorConstants0.packedValues[4u].w;
        vec4 sampledTextureValue2 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(quotientValue5, quotientValue6), 0.0);
        float scalarValue5 = sampledTextureValue2.x;
        float scalarValue6 = sampledTextureValue2.y;
        float scalarValue7 = sampledTextureValue2.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float quotientValue = (float(int(gl_GlobalInvocationID.x)) + 0.5) / computeVectorConstants0.packedValues[4u].z;
        float quotientValue1 = (float(int(gl_GlobalInvocationID.y)) + 0.5) / computeVectorConstants0.packedValues[4u].w;
        vec4 sampledTextureValue = textureLod(sampler2D(gameColorTexture, gameColorSampler), vec2(quotientValue, quotientValue1), 0.0);
        float scalarValue = sampledTextureValue.x;
        float scalarValue1 = sampledTextureValue.y;
        float scalarValue2 = sampledTextureValue.z;
#endif
        float quotientValue2;
        float quotientValue3;
        float quotientValue4;
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (computeScalarConstants0.packedValues[12u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        if (computeVectorConstants0.packedValues[3u].x > 0.0)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float sampledTextureValue3 = (0.180000007152557373046875 / textureLod(sampler2D(materialTexture1, textureSampler1), vec2(0.5), 0.0).x) + 9.9999997473787516355514526367188e-05;
            quotientValue2 = scalarValue7 / sampledTextureValue3;
            quotientValue3 = scalarValue6 / sampledTextureValue3;
            quotientValue4 = scalarValue5 / sampledTextureValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float sampledTextureValue1 = (0.180000007152557373046875 / textureLod(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5), 0.0).x) + 9.9999997473787516355514526367188e-05;
            quotientValue2 = scalarValue / sampledTextureValue1;
            quotientValue3 = scalarValue1 / sampledTextureValue1;
            quotientValue4 = scalarValue2 / sampledTextureValue1;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            quotientValue2 = scalarValue7;
            quotientValue3 = scalarValue6;
            quotientValue4 = scalarValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            quotientValue2 = scalarValue;
            quotientValue3 = scalarValue1;
            quotientValue4 = scalarValue2;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float scalarValue8 = rdDot3Precise2(vec3(quotientValue4, quotientValue3, quotientValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        vec2 sumValue6 = vec2(quotientValue5 - 0.5, quotientValue6 - 0.5);
        uint multiplyAddValue = atomicAdd(intermediateValue7[(scalarValue8 >= 0.00095000001601874828338623046875) ? uint(fma(spvNClamp((log2(scalarValue8) - computeScalarConstants0.packedValues[8u]) / computeScalarConstants0.packedValues[0u], 0.0, 1.0), 254.0, 1.0)) : 0u], uint(exp2((rdDot2Precise(sumValue6, sumValue6) * (-computeScalarConstants0.packedValues[4u])) * 1.44269502162933349609375) * 256.0));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float dotProductValue = dot(vec3(quotientValue2, quotientValue3, quotientValue4), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        uint intermediateValue5;
        if (dotProductValue < 0.00095000001601874828338623046875)
        {
            intermediateValue5 = 0u;
        }
        else
        {
            intermediateValue5 = uint((spvNMin(spvNMax((log2(dotProductValue) - computeVectorConstants0.packedValues[2u].x) / computeVectorConstants0.packedValues[0u].x, 0.0), 1.0) * 254.0) + 1.0);
        }
        float sumValue3 = quotientValue + (-0.5);
        float sumValue4 = quotientValue1 + (-0.5);
        uint dotProductValue1 = atomicAdd(intermediateValue[intermediateValue5], uint(exp2((dot(vec2(sumValue3, sumValue4), vec2(sumValue3, sumValue4)) * (-1.44269502162933349609375)) * computeVectorConstants0.packedValues[1u].x) * 256.0));
#endif
    }
    barrier();
#if (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM50)
    uint sumValue2;
    uint scalarValue9 = 0u;
    for (;;)
    {
        if (scalarValue9 >= 2u)
        {
            break;
        }
        uint productValue = gl_LocalInvocationIndex + (scalarValue9 * 128u);
        uint scalarValue10 = imageAtomicAdd(intermediateValue2, int(productValue), intermediateValue7[productValue]);
        sumValue2 = scalarValue9 + 1u;
        scalarValue9 = sumValue2;
        continue;
    }
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue11 = imageAtomicAdd(intermediateValue2, int(gl_LocalInvocationIndex), intermediateValue7[gl_LocalInvocationIndex]);
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue3 = imageAtomicAdd(curFrameLuminanceHistogram, int(gl_LocalInvocationIndex), intermediateValue[gl_LocalInvocationIndex]);
    uint sumValue5 = imageAtomicAdd(curFrameLuminanceHistogram, int(gl_LocalInvocationIndex + 128u), intermediateValue[sumValue1]);
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue3 = imageAtomicAdd(curFrameLuminanceHistogram, int(gl_LocalInvocationIndex), intermediateValue[gl_LocalInvocationIndex]);
#endif
}
