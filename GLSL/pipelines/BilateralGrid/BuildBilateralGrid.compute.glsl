#version 460
#extension GL_GOOGLE_include_directive : require
// BilateralGrid / BuildBilateralGrid / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT64
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
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
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
    if ((gl_GlobalInvocationID.x < uint(computeVectorConstants0.packedValues[3u].x)) && (gl_GlobalInvocationID.y < uint(computeVectorConstants0.packedValues[3u].y)))
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue2 = texelFetch(materialTexture2, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue5 = sampledTextureValue2.x;
        float scalarValue6 = sampledTextureValue2.y;
        float scalarValue7 = sampledTextureValue2.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue = texelFetch(sceneColorTexture, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
        float scalarValue = sampledTextureValue.x;
        float scalarValue1 = sampledTextureValue.y;
        float scalarValue2 = sampledTextureValue.z;
#endif
        float quotientValue;
        float quotientValue1;
        float quotientValue2;
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (computeScalarConstants0.packedValues[4u] > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        if (computeVectorConstants0.packedValues[1u].x > 0.0)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float sampledTextureValue3 = (0.180000007152557373046875 / texelFetch(materialTexture1, ivec2(uvec2(0u)), int(0u)).x) + 9.9999997473787516355514526367188e-05;
            quotientValue = scalarValue7 / sampledTextureValue3;
            quotientValue1 = scalarValue6 / sampledTextureValue3;
            quotientValue2 = scalarValue5 / sampledTextureValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float sampledTextureValue1 = (0.180000007152557373046875 / texelFetch(previousFrameAverageLuminanceTexture, ivec2(uvec2(0u)), int(0u)).x) + 9.9999997473787516355514526367188e-05;
            quotientValue = scalarValue / sampledTextureValue1;
            quotientValue1 = scalarValue1 / sampledTextureValue1;
            quotientValue2 = scalarValue2 / sampledTextureValue1;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            quotientValue = scalarValue7;
            quotientValue1 = scalarValue6;
            quotientValue2 = scalarValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            quotientValue = scalarValue;
            quotientValue1 = scalarValue1;
            quotientValue2 = scalarValue2;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float nonlinearValue = (log2(spvNMin(spvNMax(rdDot3Precise2(vec3(quotientValue2, quotientValue1, quotientValue), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), computeScalarConstants0.packedValues[2u]), computeScalarConstants0.packedValues[3u])) - computeScalarConstants0.packedValues[0u]) / (computeScalarConstants0.packedValues[1u] - computeScalarConstants0.packedValues[0u]);
        uint productValue10 = uint(((rdEvaluateFloatExpression(gl_GlobalInvocationID.x) + 0.5) * computeVectorConstants0.packedValues[3u].z) * computeVectorConstants0.packedValues[2u].x);
        uint productValue11 = uint(min(int(uint(int(computeScalarConstants0.packedValues[10u])) - 2u), int(uint(max(int(uint(int(nonlinearValue * computeScalarConstants0.packedValues[10u]))), int(0u))))));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float dotProductValue = (log2(spvNMin(spvNMax(dot(vec3(quotientValue, quotientValue1, quotientValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), computeVectorConstants0.packedValues[0u].z), computeVectorConstants0.packedValues[0u].w)) - computeVectorConstants0.packedValues[0u].x) / (computeVectorConstants0.packedValues[0u].y - computeVectorConstants0.packedValues[0u].x);
        float productValue = computeVectorConstants0.packedValues[2u].z * dotProductValue;
        uint productValue1 = uint((computeVectorConstants0.packedValues[2u].x * (float(gl_GlobalInvocationID.x) + 0.5)) * computeVectorConstants0.packedValues[3u].z);
        uint productValue2 = uint((computeVectorConstants0.packedValues[2u].y * (float(gl_GlobalInvocationID.y) + 0.5)) * computeVectorConstants0.packedValues[3u].w);
        uint sumValue = uint(min(int(uint(max(int(uint(int(productValue))), int(0u)))), int(uint(int(computeVectorConstants0.packedValues[2u].z)) + 4294967294u)));
#endif
        uint scalarValue3 = uint(computeVectorConstants0.packedValues[2u].x);
        uint scalarValue4 = uint(computeVectorConstants0.packedValues[2u].y);
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint productValue12 = scalarValue3 * uint(((rdEvaluateFloatExpression(gl_GlobalInvocationID.y) + 0.5) * computeVectorConstants0.packedValues[3u].w) * computeVectorConstants0.packedValues[2u].y);
        uint productValue13 = productValue10 + (((scalarValue3 * productValue11) * scalarValue4) + productValue12);
        uint productValue14 = (productValue12 + ((scalarValue3 * (productValue11 + 1u)) * scalarValue4)) + productValue10;
        float multiplyAddValue = spvNClamp(fma(computeScalarConstants0.packedValues[10u], nonlinearValue, -rdEvaluateFloatExpression(productValue11)), 0.0, 1.0);
        float sumValue3 = 1.0 - multiplyAddValue;
        uint productValue15 = imageAtomicAdd(intermediateValue2, int(productValue13 * 2u), uint(sumValue3 * 256.0));
        uint productValue16 = imageAtomicAdd(intermediateValue2, int((productValue13 * 2u) + 1u), uint((nonlinearValue * sumValue3) * 256.0));
        uint productValue17 = imageAtomicAdd(intermediateValue2, int(productValue14 * 2u), uint(multiplyAddValue * 256.0));
        uint productValue18 = imageAtomicAdd(intermediateValue2, int((productValue14 * 2u) + 1u), uint((nonlinearValue * multiplyAddValue) * 256.0));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint productValue3 = ((productValue2 + (sumValue * scalarValue4)) * scalarValue3) + productValue1;
        uint productValue4 = ((((sumValue + 1u) * scalarValue4) + productValue2) * scalarValue3) + productValue1;
        float sumValue1 = spvNMin(spvNMax(productValue - float(sumValue), 0.0), 1.0);
        float sumValue2 = 1.0 - sumValue1;
        uint productValue5 = imageAtomicAdd(bilateralGrid, int(productValue3 * 2u), uint(sumValue2 * 256.0));
        float productValue6 = dotProductValue * 256.0;
        uint productValue7 = imageAtomicAdd(bilateralGrid, int((productValue3 * 2u) + 1u), uint(sumValue2 * productValue6));
        uint productValue8 = imageAtomicAdd(bilateralGrid, int(productValue4 * 2u), uint(sumValue1 * 256.0));
        uint productValue9 = imageAtomicAdd(bilateralGrid, int((productValue4 * 2u) + 1u), uint(sumValue1 * productValue6));
#endif
    }
}
