#version 460
#extension GL_GOOGLE_include_directive : require
// LightClustering / ClusterLights / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_ANGULAR_REFINEMENT
#define RD_FEATURE_ANGULAR_REFINEMENT RD_ON
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
#if RD_FEATURE_ANGULAR_REFINEMENT == RD_ON
#extension GL_EXT_spirv_intrinsics : require
#endif
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/LightClustering/ComputeBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float scalarValue10 = rdEvaluateFloatExpression(gl_GlobalInvocationID.x);
    float scalarValue11 = rdEvaluateFloatExpression(gl_GlobalInvocationID.y);
    float scalarValue12 = rdEvaluateFloatExpression(gl_GlobalInvocationID.z);
    if (!(((scalarValue10 >= computeVectorConstants0.packedValues[2u].x) || (scalarValue11 >= computeVectorConstants0.packedValues[2u].y)) || (scalarValue12 >= computeVectorConstants0.packedValues[2u].z)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float scalarValue = float(gl_GlobalInvocationID.x);
    float scalarValue1 = float(gl_GlobalInvocationID.y);
    float scalarValue2 = float(gl_GlobalInvocationID.z);
    uint scalarValue3 = uint(int(computeVectorConstants0.packedValues[2u].w));
    uint scalarValue4 = uint(int(computeVectorConstants0.packedValues[1u].x));
    if (!((scalarValue2 >= computeVectorConstants0.packedValues[2u].z) || ((scalarValue >= computeVectorConstants0.packedValues[2u].x) || (scalarValue1 >= computeVectorConstants0.packedValues[2u].y))))
#endif
    {
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        uint scalarValue13 = uint(int(computeScalarConstants0.packedValues[11u]));
        uint scalarValue14 = uint(int(computeScalarConstants0.packedValues[4u]));
        uint multiplyAddValue = uint(int(fma(scalarValue12 * computeScalarConstants0.packedValues[8u], computeScalarConstants0.packedValues[9u], fma(scalarValue11, computeScalarConstants0.packedValues[8u], scalarValue10))));
        float sumValue22 = scalarValue12 + 0.5;
        float sumValue23 = computeScalarConstants0.packedValues[10u] - 2.0;
        float sumValue24 = computeScalarConstants0.packedValues[13u] - computeScalarConstants0.packedValues[14u];
        float multiplyAddValue1 = (sumValue22 < 1.0) ? (computeScalarConstants0.packedValues[0u] * 0.5) : ((sumValue22 < 2.0) ? ((computeVectorConstants0.packedValues[0u].y + computeScalarConstants0.packedValues[0u]) * 0.5) : exp2(fma((scalarValue12 - 1.5) / sumValue23, sumValue24, computeScalarConstants0.packedValues[14u])));
        float productValue15 = multiplyAddValue1 * computeScalarConstants0.packedValues[2u];
        float productValue16 = productValue15 * computeScalarConstants0.packedValues[3u];
        float multiplyAddValue2 = fma((scalarValue10 + 0.5) / computeVectorConstants0.packedValues[2u].x, productValue16 + productValue16, -productValue16);
        float multiplyAddValue3 = fma((scalarValue11 + 0.5) / computeVectorConstants0.packedValues[2u].y, productValue15 + productValue15, -productValue15);
        bool comparisonValue11 = gl_GlobalInvocationID.z == 1u;
        bool comparisonValue12 = gl_GlobalInvocationID.z != 0u;
        float multiplyAddValue4 = comparisonValue12 ? (comparisonValue11 ? computeVectorConstants0.packedValues[0u].x : exp2(fma(rdEvaluateFloatExpression(gl_GlobalInvocationID.z - 2u) / sumValue23, sumValue24, computeScalarConstants0.packedValues[14u]))) : 0.0;
        float multiplyAddValue5 = comparisonValue12 ? (comparisonValue11 ? computeVectorConstants0.packedValues[0u].y : exp2(fma(rdEvaluateFloatExpression(gl_GlobalInvocationID.z - 1u) / sumValue23, sumValue24, computeScalarConstants0.packedValues[14u]))) : computeScalarConstants0.packedValues[0u];
        float productValue17 = computeScalarConstants0.packedValues[2u] * computeScalarConstants0.packedValues[3u];
        float quotientValue8 = (productValue17 + productValue17) / computeScalarConstants0.packedValues[8u];
        float quotientValue9 = (computeVectorConstants0.packedValues[0u].z + computeScalarConstants0.packedValues[2u]) / computeScalarConstants0.packedValues[9u];
        float multiplyAddValue6 = fma(scalarValue10, quotientValue8, -productValue17);
        float sumValue25 = quotientValue8 + multiplyAddValue6;
        float multiplyAddValue7 = fma(scalarValue11, quotientValue9, -computeScalarConstants0.packedValues[2u]);
        float sumValue26 = quotientValue9 + multiplyAddValue7;
        uint bitwiseValue1 = scalarValue14 << 1u;
        uint sumValue27 = scalarValue14 - 2u;
        uint intermediateValue16;
        intermediateValue16 = 0u;
        uint intermediateValue17;
        uint sumValue6;
        uint scalarValue5 = 0u;
        for (;;)
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        uint scalarValue13 = uint(int(computeScalarConstants0.packedValues[11u]));
        uint scalarValue14 = uint(int(computeScalarConstants0.packedValues[4u]));
        uint multiplyAddValue = uint(int(fma(scalarValue12 * computeScalarConstants0.packedValues[8u], computeScalarConstants0.packedValues[9u], fma(scalarValue11, computeScalarConstants0.packedValues[8u], scalarValue10))));
        float sumValue22 = scalarValue12 + 0.5;
        float multiplyAddValue21 = (sumValue22 < 1.0) ? (computeScalarConstants0.packedValues[0u] * 0.5) : ((sumValue22 < 2.0) ? ((computeScalarConstants0.packedValues[1u] + computeScalarConstants0.packedValues[0u]) * 0.5) : exp2(fma((scalarValue12 - 1.5) / (computeScalarConstants0.packedValues[10u] - 2.0), computeScalarConstants0.packedValues[13u] - computeScalarConstants0.packedValues[14u], computeScalarConstants0.packedValues[14u])));
        float productValue28 = multiplyAddValue21 * computeScalarConstants0.packedValues[2u];
        float productValue29 = productValue28 * computeScalarConstants0.packedValues[3u];
        float multiplyAddValue22 = fma((scalarValue10 + 0.5) / computeVectorConstants0.packedValues[2u].x, productValue29 + productValue29, -productValue29);
        float multiplyAddValue23 = fma((scalarValue11 + 0.5) / computeVectorConstants0.packedValues[2u].y, productValue28 + productValue28, -productValue28);
        uint bitwiseValue1 = scalarValue14 << 1u;
        uint sumValue27 = scalarValue14 - 2u;
        uint intermediateValue14;
        intermediateValue14 = 0u;
        uint intermediateValue15;
        uint sumValue2;
        uint scalarValue5 = 0u;
        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint productValue = uint(int((((computeVectorConstants0.packedValues[2u].y * scalarValue2) + scalarValue1) * computeVectorConstants0.packedValues[2u].x) + scalarValue)) * scalarValue4;
        float sumValue = scalarValue2 + 0.5;
        float productValue1;
        if (sumValue < 1.0)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            if (int(scalarValue13) <= int(scalarValue5))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue1 = computeVectorConstants0.packedValues[0u].x * 0.5;
        }
        else
        {
            float branchMergedValue1;
            if (sumValue < 2.0)
#endif
            {
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                break;
            }
            uint productValue18 = scalarValue5 * 16u;
            vec3 sampledTextureValue5 = uintBitsToFloat(uvec3(texelFetch(intermediateValue, int(productValue18)).x, texelFetch(intermediateValue, int(productValue18 + 1u)).x, texelFetch(intermediateValue, int(productValue18 + 2u)).x));
            uint productValue19 = scalarValue5 * 16u;
            uint sumValue28 = productValue19 + 4u;
            vec3 sampledTextureValue6 = uintBitsToFloat(uvec3(texelFetch(intermediateValue, int(sumValue28)).x, texelFetch(intermediateValue, int(sumValue28 + 1u)).x, texelFetch(intermediateValue, int(sumValue28 + 2u)).x));
            if ((scalarValue12 < sampledTextureValue5.z) || (sampledTextureValue6.z < scalarValue12))
            {
                sumValue6 = scalarValue5 + 1u;
                intermediateValue17 = intermediateValue16;
                intermediateValue16 = intermediateValue17;
                scalarValue5 = sumValue6;
                continue;
            }
            if ((scalarValue11 < sampledTextureValue5.y) || (sampledTextureValue6.y < scalarValue11))
            {
                sumValue6 = scalarValue5 + 1u;
                intermediateValue17 = intermediateValue16;
                intermediateValue16 = intermediateValue17;
                scalarValue5 = sumValue6;
                continue;
            }
            if ((scalarValue10 < sampledTextureValue5.x) || (sampledTextureValue6.x < scalarValue10))
            {
                sumValue6 = scalarValue5 + 1u;
                intermediateValue17 = intermediateValue16;
                intermediateValue16 = intermediateValue17;
                scalarValue5 = sumValue6;
                continue;
            }
            uint productValue20 = scalarValue5 * 16u;
            uint sumValue29 = productValue20 + 8u;
            vec3 sampledTextureValue7 = uintBitsToFloat(uvec3(texelFetch(intermediateValue, int(sumValue29)).x, texelFetch(intermediateValue, int(sumValue29 + 1u)).x, texelFetch(intermediateValue, int(sumValue29 + 2u)).x));
            float scalarValue15 = sampledTextureValue7.x;
            float scalarValue16 = sampledTextureValue7.y;
            float scalarValue17 = sampledTextureValue7.z;
            vec3 vectorValue = vec3(scalarValue15, scalarValue16, scalarValue17);
            uint productValue21 = scalarValue5 * 16u;
            uint sumValue30 = productValue21 + 12u;
            vec2 sampledTextureValue8 = uintBitsToFloat(uvec2(texelFetch(intermediateValue, int(sumValue30)).x, texelFetch(intermediateValue, int(sumValue30 + 1u)).x));
            float scalarValue18 = sampledTextureValue8.y;
            float productValue22 = scalarValue18 * scalarValue18;
            bool intermediateValue24;
            if (productValue22 < rdDot3Precise2(vectorValue, vectorValue))
            {
                bool bitwiseValue2 = !(((scalarValue18 - scalarValue17) < multiplyAddValue4) || (multiplyAddValue5 < (-(scalarValue18 + scalarValue17))));
                bool multiplyAddValue8;
                if (bitwiseValue2)
                {
                    float scalarValue19 = spvNMin(multiplyAddValue5, spvNMax(multiplyAddValue4, -scalarValue17));
                    float sumValue31 = scalarValue17 + scalarValue19;
                    float multiplyAddValue9 = spvNMax(fma(-sumValue31, sumValue31, productValue22), 0.0);
                    float scalarValue20 = spvNMax(scalarValue19, 9.9999997473787516355514526367188e-05);
                    float quotientValue10 = 1.0 / scalarValue20;
                    vec2 vectorValue1 = vec2(scalarValue15, scalarValue16);
                    float multiplyAddValue10 = sqrt(multiplyAddValue9) / sqrt(spvNMax(fma(scalarValue20, scalarValue20, rdDot2Precise(vectorValue1, vectorValue1)) - multiplyAddValue9, 9.9999999392252902907785028219223e-09));
                    float quotientValue11 = (1.0 / spvNMax(multiplyAddValue10, 1.0)) * spvNMin(multiplyAddValue10, 1.0);
                    float productValue23 = quotientValue11 * quotientValue11;
                    float multiplyAddValue11 = fma(productValue23, fma(productValue23, fma(productValue23, fma(productValue23, 0.02083509974181652069091796875, -0.08513300120830535888671875), 0.1801410019397735595703125), -0.33029949665069580078125), 0.999866008758544921875);
                    float multiplyAddValue12 = fma(quotientValue11, multiplyAddValue11, (multiplyAddValue10 > 1.0) ? fma(multiplyAddValue11 * quotientValue11, -2.0, 1.57079637050628662109375) : 0.0);
                    float productValue24 = spvNMin(sumValue25, spvNMax(multiplyAddValue6, scalarValue15 * quotientValue10));
                    float productValue25 = spvNMin(sumValue26, spvNMax(multiplyAddValue7, scalarValue16 * quotientValue10));
                    float scalarValue21 = -scalarValue20;
                    float multiplyAddValue13 = fma(scalarValue21, productValue24, scalarValue15);
                    float multiplyAddValue14 = fma(scalarValue15, productValue24, scalarValue20);
                    float scalarValue22 = abs(multiplyAddValue14);
                    float scalarValue23 = abs(multiplyAddValue13);
                    float quotientValue12 = (1.0 / spvNMax(scalarValue22, scalarValue23)) * spvNMin(scalarValue22, scalarValue23);
                    float productValue26 = quotientValue12 * quotientValue12;
                    float multiplyAddValue15 = fma(productValue26, fma(productValue26, fma(productValue26, fma(productValue26, 0.02083509974181652069091796875, -0.08513300120830535888671875), 0.1801410019397735595703125), -0.33029949665069580078125), 0.999866008758544921875);
                    float multiplyAddValue16 = fma(quotientValue12, multiplyAddValue15, (scalarValue22 < scalarValue23) ? fma(multiplyAddValue15 * quotientValue12, -2.0, 1.57079637050628662109375) : 0.0);
                    float comparisonValue13 = (multiplyAddValue14 < 0.0) ? (multiplyAddValue16 - 3.1415927410125732421875) : multiplyAddValue16;
                    float multiplyAddValue17 = fma(scalarValue21, productValue25, scalarValue16);
                    float multiplyAddValue18 = fma(scalarValue16, productValue25, scalarValue20);
                    float scalarValue24 = abs(multiplyAddValue18);
                    float scalarValue25 = abs(multiplyAddValue17);
                    float quotientValue13 = spvNMin(scalarValue24, scalarValue25) * (1.0 / spvNMax(scalarValue24, scalarValue25));
                    float productValue27 = quotientValue13 * quotientValue13;
                    float multiplyAddValue19 = fma(productValue27, fma(productValue27, fma(productValue27, fma(productValue27, 0.02083509974181652069091796875, -0.08513300120830535888671875), 0.1801410019397735595703125), -0.33029949665069580078125), 0.999866008758544921875);
                    float multiplyAddValue20 = fma(quotientValue13, multiplyAddValue19, (scalarValue24 < scalarValue25) ? fma(quotientValue13 * multiplyAddValue19, -2.0, 1.57079637050628662109375) : 0.0);
                    float comparisonValue14 = (multiplyAddValue18 < 0.0) ? (multiplyAddValue20 - 3.1415927410125732421875) : multiplyAddValue20;
                    float comparisonValue15 = abs(((spvNMin(multiplyAddValue18, multiplyAddValue17) < 0.0) && (spvNMax(multiplyAddValue18, multiplyAddValue17) >= 0.0)) ? (-comparisonValue14) : comparisonValue14);
                    float comparisonValue16 = abs(((spvNMin(multiplyAddValue14, multiplyAddValue13) < 0.0) && (spvNMax(multiplyAddValue14, multiplyAddValue13) >= 0.0)) ? (-comparisonValue13) : comparisonValue13);
                    multiplyAddValue8 = (multiplyAddValue12 * multiplyAddValue12) >= fma(comparisonValue16, comparisonValue16, comparisonValue15 * comparisonValue15);
                }
                else
                {
                    multiplyAddValue8 = bitwiseValue2;
                }
                intermediateValue24 = multiplyAddValue8;
            }
            else
            {
                intermediateValue24 = true;
            }
            if (!intermediateValue24)
            {
                sumValue6 = scalarValue5 + 1u;
                intermediateValue17 = intermediateValue16;
                intermediateValue16 = intermediateValue17;
                scalarValue5 = sumValue6;
                continue;
            }
            vec3 sumValue32 = vec3(scalarValue15 - multiplyAddValue2, scalarValue16 - multiplyAddValue3, multiplyAddValue1 + scalarValue17);
            float nonlinearValue3 = sqrt(rdDot3Precise2(sumValue32, sumValue32));
            if ((int(scalarValue14) <= int(intermediateValue16)) && (nonlinearValue3 >= uintBitsToFloat(intermediateValue4[min(((intermediateValue16 << 1u) - 2u), 128u)])))
            {
                sumValue6 = scalarValue5 + 1u;
                intermediateValue17 = intermediateValue16;
                intermediateValue16 = intermediateValue17;
                scalarValue5 = sumValue6;
                continue;
            }
            uint intermediateValue34;
            intermediateValue34 = 0u;
            uint comparisonValue6;
            uint comparisonValue7;
            uint scalarValue26 = intermediateValue16;
            for (;;)
            {
                if (int(scalarValue26) <= int(intermediateValue34))
                {
                    break;
                }
                uint sumValue33 = scalarValue26 + intermediateValue34;
                uint bitwiseValue3 = uint(abs(int(sumValue33))) >> 1u;
                uint comparisonValue17 = (((sumValue33 ^ 2u) & 2147483648u) != 0u) ? (-bitwiseValue3) : bitwiseValue3;
                bool reinterpretedBits = uintBitsToFloat(intermediateValue4[min((comparisonValue17 << 1u), 128u)]) < nonlinearValue3;
                comparisonValue6 = reinterpretedBits ? scalarValue26 : comparisonValue17;
                comparisonValue7 = reinterpretedBits ? (comparisonValue17 + 1u) : intermediateValue34;
                scalarValue26 = comparisonValue6;
                intermediateValue34 = comparisonValue7;
                continue;
            }
            uint reinterpretedBits1 = floatBitsToUint(nonlinearValue3);
            uint reinterpretedBits2 = floatBitsToUint(sampledTextureValue8.x);
            uint sumValue8;
            if (int(scalarValue14) > int(intermediateValue16))
            {
                uint sumValue34 = intermediateValue16 - 1u;
                uint sumValue16;
                uint scalarValue27 = sumValue34;
                for (;;)
                {
                    if (int(intermediateValue34) > int(scalarValue27))
                    {
                        break;
                    }
                    uint bitwiseValue4 = scalarValue27 << 1u;
                    uint sumValue35 = bitwiseValue4 + 2u;
                    uint sumValue36 = intermediateValue4[min((bitwiseValue4 + 1u), 128u)];
                    if (sumValue35 < 128u)
                    {
                        intermediateValue4[sumValue35] = intermediateValue4[min(bitwiseValue4, 128u)];
                    }
                    uint sumValue37 = bitwiseValue4 + 3u;
                    if (sumValue37 < 128u)
                    {
                        intermediateValue4[sumValue37] = sumValue36;
                    }
                    sumValue16 = scalarValue27 - 1u;
                    scalarValue27 = sumValue16;
                    continue;
                }
                uint bitwiseValue5 = intermediateValue34 << 1u;
                if (bitwiseValue5 < 128u)
                {
                    intermediateValue4[bitwiseValue5] = reinterpretedBits1;
                }
                uint sumValue38 = bitwiseValue5 + 1u;
                if (sumValue38 < 128u)
                {
                    intermediateValue4[sumValue38] = intermediateValue16;
                }
                imageStore(intermediateValue1, int((scalarValue14 * multiplyAddValue) + intermediateValue16), uvec4(floatBitsToUint(rdSignedBitsToFloat(reinterpretedBits2))));
                sumValue8 = intermediateValue16 + 1u;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                break;
            }
            uint productValue18 = scalarValue5 * 16u;
            uvec3 sampledTextureValue9 = uvec3(texelFetch(intermediateValue, int(productValue18)).x, texelFetch(intermediateValue, int(productValue18 + 1u)).x, texelFetch(intermediateValue, int(productValue18 + 2u)).x);
            uint productValue19 = scalarValue5 * 16u;
            uint sumValue28 = productValue19 + 4u;
            uvec3 sampledTextureValue10 = uvec3(texelFetch(intermediateValue, int(sumValue28)).x, texelFetch(intermediateValue, int(sumValue28 + 1u)).x, texelFetch(intermediateValue, int(sumValue28 + 2u)).x);
            if ((scalarValue12 < uintBitsToFloat(sampledTextureValue9.z)) || (uintBitsToFloat(sampledTextureValue10.z) < scalarValue12))
            {
                sumValue2 = scalarValue5 + 1u;
                intermediateValue15 = intermediateValue14;
                intermediateValue14 = intermediateValue15;
                scalarValue5 = sumValue2;
                continue;
            }
            if ((scalarValue11 < uintBitsToFloat(sampledTextureValue9.y)) || (uintBitsToFloat(sampledTextureValue10.y) < scalarValue11))
            {
                sumValue2 = scalarValue5 + 1u;
                intermediateValue15 = intermediateValue14;
                intermediateValue14 = intermediateValue15;
                scalarValue5 = sumValue2;
                continue;
            }
            if ((scalarValue10 < uintBitsToFloat(sampledTextureValue9.x)) || (uintBitsToFloat(sampledTextureValue10.x) < scalarValue10))
            {
                sumValue2 = scalarValue5 + 1u;
                intermediateValue15 = intermediateValue14;
                intermediateValue14 = intermediateValue15;
                scalarValue5 = sumValue2;
                continue;
            }
            uint productValue30 = (scalarValue5 * 16u) + 8u;
            uvec3 sampledTextureValue11 = uvec3(texelFetch(intermediateValue, int(productValue30)).x, texelFetch(intermediateValue, int(productValue30 + 1u)).x, texelFetch(intermediateValue, int(productValue30 + 2u)).x);
            vec3 reinterpretedBits3 = vec3(uintBitsToFloat(sampledTextureValue11.x) - multiplyAddValue22, uintBitsToFloat(sampledTextureValue11.y) - multiplyAddValue23, multiplyAddValue21 + uintBitsToFloat(sampledTextureValue11.z));
            float nonlinearValue4 = sqrt(rdDot3Precise2(reinterpretedBits3, reinterpretedBits3));
            if ((int(scalarValue14) <= int(intermediateValue14)) && (nonlinearValue4 >= uintBitsToFloat(intermediateValue4[min(((intermediateValue14 << 1u) - 2u), 128u)])))
            {
                sumValue2 = scalarValue5 + 1u;
                intermediateValue15 = intermediateValue14;
                intermediateValue14 = intermediateValue15;
                scalarValue5 = sumValue2;
                continue;
            }
            uvec4 sampledTextureValue12 = texelFetch(intermediateValue, int((scalarValue5 * 16u) + 12u));
            uint scalarValue30 = sampledTextureValue12.x;
            uint intermediateValue19;
            intermediateValue19 = 0u;
            uint comparisonValue;
            uint comparisonValue1;
            uint scalarValue31 = intermediateValue14;
            for (;;)
            {
                if (int(intermediateValue19) >= int(scalarValue31))
                {
                    break;
                }
                uint sumValue47 = intermediateValue19 + scalarValue31;
                uint bitwiseValue8 = uint(abs(int(sumValue47))) >> 1u;
                uint comparisonValue19 = (((sumValue47 ^ 2u) & 2147483648u) != 0u) ? (-bitwiseValue8) : bitwiseValue8;
                bool reinterpretedBits4 = uintBitsToFloat(intermediateValue4[min((comparisonValue19 << 1u), 128u)]) < nonlinearValue4;
                comparisonValue = reinterpretedBits4 ? scalarValue31 : comparisonValue19;
                comparisonValue1 = reinterpretedBits4 ? (comparisonValue19 + 1u) : intermediateValue19;
                scalarValue31 = comparisonValue;
                intermediateValue19 = comparisonValue1;
                continue;
            }
            uint reinterpretedBits5 = floatBitsToUint(nonlinearValue4);
            uint sumValue4;
            if (int(scalarValue14) > int(intermediateValue14))
            {
                uint sumValue48 = intermediateValue14 - 1u;
                uint sumValue8;
                uint scalarValue32 = sumValue48;
                for (;;)
                {
                    if (int(intermediateValue19) > int(scalarValue32))
                    {
                        break;
                    }
                    uint bitwiseValue9 = scalarValue32 << 1u;
                    uint sumValue49 = bitwiseValue9 + 2u;
                    uint sumValue50 = intermediateValue4[min((bitwiseValue9 + 1u), 128u)];
                    if (sumValue49 < 128u)
                    {
                        intermediateValue4[sumValue49] = intermediateValue4[min(bitwiseValue9, 128u)];
                    }
                    uint sumValue51 = bitwiseValue9 + 3u;
                    if (sumValue51 < 128u)
                    {
                        intermediateValue4[sumValue51] = sumValue50;
                    }
                    sumValue8 = scalarValue32 - 1u;
                    scalarValue32 = sumValue8;
                    continue;
                }
                uint bitwiseValue10 = intermediateValue19 << 1u;
                if (bitwiseValue10 < 128u)
                {
                    intermediateValue4[bitwiseValue10] = reinterpretedBits5;
                }
                uint sumValue52 = bitwiseValue10 + 1u;
                if (sumValue52 < 128u)
                {
                    intermediateValue4[sumValue52] = intermediateValue14;
                }
                imageStore(intermediateValue1, int((scalarValue14 * multiplyAddValue) + intermediateValue14), uvec4(floatBitsToUint(rdSignedBitsToFloat(scalarValue30))));
                sumValue4 = intermediateValue14 + 1u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue1 = (computeVectorConstants0.packedValues[0u].x + computeVectorConstants0.packedValues[0u].y) * 0.5;
#endif
            }
            else
            {
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                uint sumValue39 = min((bitwiseValue1 - 1u), 128u);
                uint scalarValue28 = intermediateValue4[sumValue39];
                uint sumValue17;
                uint scalarValue29 = sumValue27;
                for (;;)
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                uint sumValue39 = min((bitwiseValue1 - 1u), 128u);
                uint scalarValue28 = intermediateValue4[sumValue39];
                uint sumValue9;
                uint scalarValue29 = sumValue27;
                for (;;)
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue1 = exp2((((scalarValue2 + (-1.5)) / (computeVectorConstants0.packedValues[2u].z + (-2.0))) * (computeVectorConstants0.packedValues[3u].y - computeVectorConstants0.packedValues[3u].z)) + computeVectorConstants0.packedValues[3u].z);
            }
            productValue1 = branchMergedValue1;
        }
        float quotientValue = ((((computeVectorConstants0.packedValues[0u].w * 2.0) * ((scalarValue + 0.5) / computeVectorConstants0.packedValues[2u].x)) - computeVectorConstants0.packedValues[0u].w) * computeVectorConstants0.packedValues[0u].z) * productValue1;
        float quotientValue1 = productValue1 * (((computeVectorConstants0.packedValues[0u].z * 2.0) * ((scalarValue1 + 0.5) / computeVectorConstants0.packedValues[2u].y)) - computeVectorConstants0.packedValues[0u].z);
        uint intermediateValue7;
        if (int(scalarValue3) > int(0u))
        {
            uint intermediateValue8;
            float intermediateValue[64];
            uint intermediateValue1[64];
            uint scalarValue5 = 0u;
            uint scalarValue6 = 0u;
            vec3 sampledTextureValue;
            float intermediateValue11;
            vec3 sampledTextureValue1;
            float intermediateValue12;
            float intermediateValue13;
            float intermediateValue14;
            float intermediateValue15;
            uint sampledTextureValue3;
            float sampledTextureValue4;
            bool bitwiseValue;
            for (;;)
            {
                uint productValue2 = scalarValue6 * 16u;
                sampledTextureValue = uintBitsToFloat(uvec3(texelFetch(extends, int(productValue2)).x, texelFetch(extends, int(productValue2 + 1u)).x, texelFetch(extends, int(productValue2 + 2u)).x));
                intermediateValue11 = sampledTextureValue.x;
                uint productValue3 = (scalarValue6 * 16u) + 4u;
                sampledTextureValue1 = uintBitsToFloat(uvec3(texelFetch(extends, int(productValue3)).x, texelFetch(extends, int(productValue3 + 1u)).x, texelFetch(extends, int(productValue3 + 2u)).x));
                intermediateValue12 = sampledTextureValue1.x;
                uint productValue4 = (scalarValue6 * 16u) + 8u;
                vec3 sampledTextureValue2 = uintBitsToFloat(uvec3(texelFetch(extends, int(productValue4)).x, texelFetch(extends, int(productValue4 + 1u)).x, texelFetch(extends, int(productValue4 + 2u)).x));
                intermediateValue13 = sampledTextureValue2.x;
                intermediateValue14 = sampledTextureValue2.y;
                intermediateValue15 = sampledTextureValue2.z;
                sampledTextureValue3 = texelFetch(extends, int((scalarValue6 * 16u) + 12u)).x;
                sampledTextureValue4 = uintBitsToFloat(texelFetch(extends, int((scalarValue6 * 16u) + 13u)).x);
                bitwiseValue = (scalarValue2 < sampledTextureValue.z) || (scalarValue2 > sampledTextureValue1.z);
                uint branchMergedValue;
                if (bitwiseValue)
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue1 = exp2((((scalarValue2 + (-1.5)) / (computeVectorConstants0.packedValues[2u].z + (-2.0))) * (computeVectorConstants0.packedValues[3u].y - computeVectorConstants0.packedValues[3u].z)) + computeVectorConstants0.packedValues[3u].z);
            }
            productValue1 = branchMergedValue1;
        }
        float quotientValue = ((((computeVectorConstants0.packedValues[0u].w * 2.0) * ((scalarValue + 0.5) / computeVectorConstants0.packedValues[2u].x)) - computeVectorConstants0.packedValues[0u].w) * computeVectorConstants0.packedValues[0u].z) * productValue1;
        float quotientValue1 = productValue1 * (((computeVectorConstants0.packedValues[0u].z * 2.0) * ((scalarValue1 + 0.5) / computeVectorConstants0.packedValues[2u].y)) - computeVectorConstants0.packedValues[0u].z);
        uint intermediateValue7;
        if (int(scalarValue3) > int(0u))
        {
            uint intermediateValue8;
            float intermediateValue[64];
            uint intermediateValue1[64];
            uint scalarValue5 = 0u;
            uint scalarValue6 = 0u;
            vec3 sampledTextureValue;
            float intermediateValue11;
            vec3 sampledTextureValue1;
            float intermediateValue12;
            float intermediateValue13;
            float intermediateValue14;
            float intermediateValue15;
            uint sampledTextureValue3;
            bool bitwiseValue;
            for (;;)
            {
                uint productValue2 = scalarValue6 * 16u;
                sampledTextureValue = uintBitsToFloat(uvec3(texelFetch(extends, int(productValue2)).x, texelFetch(extends, int(productValue2 + 1u)).x, texelFetch(extends, int(productValue2 + 2u)).x));
                intermediateValue11 = sampledTextureValue.x;
                uint productValue3 = (scalarValue6 * 16u) + 4u;
                sampledTextureValue1 = uintBitsToFloat(uvec3(texelFetch(extends, int(productValue3)).x, texelFetch(extends, int(productValue3 + 1u)).x, texelFetch(extends, int(productValue3 + 2u)).x));
                intermediateValue12 = sampledTextureValue1.x;
                uint productValue4 = (scalarValue6 * 16u) + 8u;
                vec3 sampledTextureValue2 = uintBitsToFloat(uvec3(texelFetch(extends, int(productValue4)).x, texelFetch(extends, int(productValue4 + 1u)).x, texelFetch(extends, int(productValue4 + 2u)).x));
                intermediateValue13 = sampledTextureValue2.x;
                intermediateValue14 = sampledTextureValue2.y;
                intermediateValue15 = sampledTextureValue2.z;
                sampledTextureValue3 = texelFetch(extends, int((scalarValue6 * 16u) + 12u)).x;
                bitwiseValue = (scalarValue2 < sampledTextureValue.z) || (scalarValue2 > sampledTextureValue1.z);
                uint branchMergedValue;
                if (bitwiseValue)
#endif
                {
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(intermediateValue34) > int(scalarValue29))
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(intermediateValue19) > int(scalarValue29))
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue = scalarValue5;
                }
                else
                {
                    uint branchMergedValue5;
                    if ((scalarValue1 < sampledTextureValue.y) || (scalarValue1 > sampledTextureValue1.y))
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue = scalarValue5;
                }
                else
                {
                    uint branchMergedValue2;
                    if ((scalarValue1 < sampledTextureValue.y) || (scalarValue1 > sampledTextureValue1.y))
#endif
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        break;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        branchMergedValue5 = scalarValue5;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        branchMergedValue2 = scalarValue5;
#endif
                    }
#if RD_PLATFORM == RD_PLATFORM_SM50
                    uint bitwiseValue6 = scalarValue29 << 1u;
                    uint sumValue40 = bitwiseValue6 + 2u;
                    uint sumValue41 = intermediateValue4[min((bitwiseValue6 + 1u), 128u)];
                    if (sumValue40 < 128u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    else
#endif
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        intermediateValue4[sumValue40] = intermediateValue4[min(bitwiseValue6, 128u)];
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        uint branchMergedValue6;
                        if ((scalarValue < intermediateValue11) || (scalarValue > intermediateValue12))
                        {
                            branchMergedValue6 = scalarValue5;
                        }
                        else
                        {
                            float productValue5 = sampledTextureValue4 * sampledTextureValue4;
                            bool intermediateValue16;
                            if (!(dot(vec3(intermediateValue13, intermediateValue14, intermediateValue15), vec3(intermediateValue13, intermediateValue14, intermediateValue15)) <= productValue5))
                            {
                                float sumValue1 = (-0.0) - intermediateValue15;
                                float intermediateValue17;
                                float intermediateValue18;
                                if (gl_GlobalInvocationID.z == 0u)
                                {
                                    intermediateValue17 = 0.0;
                                    intermediateValue18 = computeVectorConstants0.packedValues[0u].x;
                                }
                                else
                                {
                                    float branchMergedValue3;
                                    float branchMergedValue4;
                                    if (gl_GlobalInvocationID.z == 1u)
                                    {
                                        branchMergedValue3 = computeVectorConstants0.packedValues[0u].x;
                                        branchMergedValue4 = computeVectorConstants0.packedValues[0u].y;
                                    }
                                    else
                                    {
                                        float sumValue3 = computeVectorConstants0.packedValues[2u].z + (-2.0);
                                        float sumValue5 = computeVectorConstants0.packedValues[3u].y - computeVectorConstants0.packedValues[3u].z;
                                        branchMergedValue3 = exp2((sumValue5 * (float(gl_GlobalInvocationID.z + 4294967294u) / sumValue3)) + computeVectorConstants0.packedValues[3u].z);
                                        branchMergedValue4 = exp2((sumValue5 * (float(gl_GlobalInvocationID.z + 4294967295u) / sumValue3)) + computeVectorConstants0.packedValues[3u].z);
                                    }
                                    intermediateValue17 = branchMergedValue3;
                                    intermediateValue18 = branchMergedValue4;
                                }
                                bool branchMergedValue2;
                                if (((sampledTextureValue4 - intermediateValue15) < intermediateValue17) || ((sumValue1 - sampledTextureValue4) > intermediateValue18))
                                {
                                    branchMergedValue2 = false;
                                }
                                else
                                {
                                    float scalarValue7 = spvNMin(spvNMax(sumValue1, intermediateValue17), intermediateValue18);
                                    float sumValue7 = scalarValue7 + intermediateValue15;
                                    float nonlinearValue = sqrt(spvNMax(productValue5 - (sumValue7 * sumValue7), 0.0));
                                    float scalarValue8 = spvNMax(scalarValue7, 9.9999997473787516355514526367188e-05);
                                    float productValue6 = computeVectorConstants0.packedValues[0u].z * computeVectorConstants0.packedValues[0u].w;
                                    float quotientValue2 = (productValue6 * 2.0) / computeVectorConstants0.packedValues[2u].x;
                                    float quotientValue3 = (computeVectorConstants0.packedValues[0u].z * 2.0) / computeVectorConstants0.packedValues[2u].y;
                                    float productValue7 = (quotientValue2 * scalarValue) - productValue6;
                                    float productValue8 = (quotientValue3 * scalarValue1) - computeVectorConstants0.packedValues[0u].z;
                                    float quotientValue4 = 1.0 / scalarValue8;
                                    float nonlinearValue1 = atan(nonlinearValue / sqrt(spvNMax((((intermediateValue13 * intermediateValue13) + (intermediateValue14 * intermediateValue14)) - (nonlinearValue * nonlinearValue)) + (scalarValue8 * scalarValue8), 9.9999999392252902907785028219223e-09)));
                                    float productValue9 = spvNMin(spvNMax(quotientValue4 * intermediateValue13, productValue7), productValue7 + quotientValue2);
                                    float productValue10 = spvNMin(spvNMax(quotientValue4 * intermediateValue14, productValue8), productValue8 + quotientValue3);
                                    float sumValue10 = (-0.0) - scalarValue8;
                                    float productValue11 = (productValue9 * intermediateValue13) + scalarValue8;
                                    float productValue12 = (productValue9 * sumValue10) + intermediateValue13;
                                    float quotientValue5 = atan(productValue12 / productValue11);
                                    bool conditionValue = productValue11 < 0.0;
                                    bool comparisonValue2 = productValue11 == 0.0;
                                    bool comparisonValue3 = productValue12 >= 0.0;
                                    bool conditionValue1 = productValue12 < 0.0;
                                    float comparisonValue4 = abs((comparisonValue2 && comparisonValue3) ? 1.57079637050628662109375 : ((comparisonValue2 && conditionValue1) ? (-1.57079637050628662109375) : ((conditionValue && conditionValue1) ? (quotientValue5 + (-3.1415927410125732421875)) : ((conditionValue && comparisonValue3) ? (quotientValue5 + 3.1415927410125732421875) : quotientValue5))));
                                    float productValue13 = (productValue10 * intermediateValue14) + scalarValue8;
                                    float productValue14 = (productValue10 * sumValue10) + intermediateValue14;
                                    float quotientValue6 = atan(productValue14 / productValue13);
                                    bool conditionValue2 = productValue13 < 0.0;
                                    bool comparisonValue5 = productValue13 == 0.0;
                                    bool comparisonValue8 = productValue14 >= 0.0;
                                    bool conditionValue3 = productValue14 < 0.0;
                                    float comparisonValue9 = abs((comparisonValue5 && comparisonValue8) ? 1.57079637050628662109375 : ((comparisonValue5 && conditionValue3) ? (-1.57079637050628662109375) : ((conditionValue2 && conditionValue3) ? (quotientValue6 + (-3.1415927410125732421875)) : ((conditionValue2 && comparisonValue8) ? (quotientValue6 + 3.1415927410125732421875) : quotientValue6))));
                                    branchMergedValue2 = ((comparisonValue9 * comparisonValue9) + (comparisonValue4 * comparisonValue4)) <= (nonlinearValue1 * nonlinearValue1);
                                }
                                intermediateValue16 = branchMergedValue2;
                            }
                            else
                            {
                                intermediateValue16 = true;
                            }
                            uint branchMergedValue7;
                            if (intermediateValue16)
                            {
                                float sumValue11 = intermediateValue13 - quotientValue;
                                float sumValue12 = intermediateValue14 - quotientValue1;
                                float sumValue13 = intermediateValue15 + productValue1;
                                float nonlinearValue2 = sqrt(((sumValue11 * sumValue11) + (sumValue12 * sumValue12)) + (sumValue13 * sumValue13));
                                uint branchMergedValue8;
                                if ((int(scalarValue5) >= int(scalarValue4)) && (nonlinearValue2 >= intermediateValue[scalarValue5 + 4294967295u]))
                                {
                                    branchMergedValue8 = scalarValue5;
                                }
                                else
                                {
                                    uint intermediateValue25;
                                    if (int(scalarValue5) > int(0u))
                                    {
                                        uint intermediateValue26;
                                        uint intermediateValue27;
                                        intermediateValue26 = 0u;
                                        intermediateValue27 = scalarValue5;
                                        uint comparisonValue6;
                                        for (;;)
                                        {
                                            uint sumValue14 = intermediateValue27 + intermediateValue26;
                                            uint quotientValue7 = uint(int(sumValue14) / int(2u));
                                            bool conditionValue4 = intermediateValue[quotientValue7] < nonlinearValue2;
                                            comparisonValue6 = conditionValue4 ? (quotientValue7 + 1u) : intermediateValue26;
                                            uint comparisonValue10 = conditionValue4 ? intermediateValue27 : quotientValue7;
                                            if (int(comparisonValue6) < int(comparisonValue10))
                                            {
                                                intermediateValue26 = comparisonValue6;
                                                intermediateValue27 = comparisonValue10;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                        intermediateValue25 = comparisonValue6;
                                    }
                                    else
                                    {
                                        intermediateValue25 = 0u;
                                    }
                                    uint branchMergedValue9;
                                    if (int(scalarValue5) < int(scalarValue4))
                                    {
                                        if (int(scalarValue5) > int(intermediateValue25))
                                        {
                                            uint intermediateValue30;
                                            intermediateValue30 = scalarValue5;
                                            for (;;)
                                            {
                                                uint sumValue15 = intermediateValue30 + 4294967295u;
                                                intermediateValue[intermediateValue30] = intermediateValue[sumValue15];
                                                intermediateValue1[intermediateValue30] = intermediateValue1[sumValue15];
                                                if (int(sumValue15) > int(intermediateValue25))
                                                {
                                                    intermediateValue30 = sumValue15;
                                                }
                                                else
                                                {
                                                    break;
                                                }
                                            }
                                        }
                                        intermediateValue[intermediateValue25] = nonlinearValue2;
                                        intermediateValue1[intermediateValue25] = scalarValue5;
                                        imageStore(zLightLookupArray, int(scalarValue5 + productValue), uvec4(floatBitsToUint(float(int(sampledTextureValue3)))));
                                        branchMergedValue9 = scalarValue5 + 1u;
                                    }
                                    else
                                    {
                                        uint sumValue18 = scalarValue4 + 4294967295u;
                                        uint scalarValue9 = intermediateValue1[sumValue18];
                                        uint sumValue19 = scalarValue4 + 4294967294u;
                                        if (!(int(sumValue19) < int(intermediateValue25)))
                                        {
                                            uint intermediateValue31;
                                            intermediateValue31 = sumValue19;
                                            for (;;)
                                            {
                                                uint sumValue20 = intermediateValue31 + 1u;
                                                intermediateValue[sumValue20] = intermediateValue[intermediateValue31];
                                                intermediateValue1[sumValue20] = intermediateValue1[intermediateValue31];
                                                if (int(intermediateValue31) > int(intermediateValue25))
                                                {
                                                    intermediateValue31 += 4294967295u;
                                                }
                                                else
                                                {
                                                    break;
                                                }
                                            }
                                        }
                                        intermediateValue[intermediateValue25] = nonlinearValue2;
                                        intermediateValue1[intermediateValue25] = scalarValue9;
                                        imageStore(zLightLookupArray, int(scalarValue9 + productValue), uvec4(floatBitsToUint(float(int(sampledTextureValue3)))));
                                        branchMergedValue9 = scalarValue5;
                                    }
                                    branchMergedValue8 = branchMergedValue9;
                                }
                                branchMergedValue7 = branchMergedValue8;
                            }
                            else
                            {
                                branchMergedValue7 = scalarValue5;
                            }
                            branchMergedValue6 = branchMergedValue7;
                        }
                        branchMergedValue5 = branchMergedValue6;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        uint branchMergedValue3;
                        if ((scalarValue < intermediateValue11) || (scalarValue > intermediateValue12))
                        {
                            branchMergedValue3 = scalarValue5;
                        }
                        else
                        {
                            float sumValue11 = intermediateValue13 - quotientValue;
                            float sumValue12 = intermediateValue14 - quotientValue1;
                            float sumValue13 = intermediateValue15 + productValue1;
                            float nonlinearValue2 = sqrt(((sumValue11 * sumValue11) + (sumValue12 * sumValue12)) + (sumValue13 * sumValue13));
                            uint branchMergedValue4;
                            if ((int(scalarValue5) >= int(scalarValue4)) && (nonlinearValue2 >= intermediateValue[scalarValue5 + 4294967295u]))
                            {
                                branchMergedValue4 = scalarValue5;
                            }
                            else
                            {
                                uint intermediateValue16;
                                if (int(scalarValue5) > int(0u))
                                {
                                    uint intermediateValue17;
                                    uint intermediateValue18;
                                    intermediateValue17 = 0u;
                                    intermediateValue18 = scalarValue5;
                                    uint comparisonValue;
                                    for (;;)
                                    {
                                        uint sumValue44 = intermediateValue18 + intermediateValue17;
                                        uint quotientValue14 = uint(int(sumValue44) / int(2u));
                                        bool conditionValue5 = intermediateValue[quotientValue14] < nonlinearValue2;
                                        comparisonValue = conditionValue5 ? (quotientValue14 + 1u) : intermediateValue17;
                                        uint comparisonValue18 = conditionValue5 ? intermediateValue18 : quotientValue14;
                                        if (int(comparisonValue) < int(comparisonValue18))
                                        {
                                            intermediateValue17 = comparisonValue;
                                            intermediateValue18 = comparisonValue18;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    }
                                    intermediateValue16 = comparisonValue;
                                }
                                else
                                {
                                    intermediateValue16 = 0u;
                                }
                                uint branchMergedValue5;
                                if (int(scalarValue5) < int(scalarValue4))
                                {
                                    if (int(scalarValue5) > int(intermediateValue16))
                                    {
                                        uint intermediateValue21;
                                        intermediateValue21 = scalarValue5;
                                        for (;;)
                                        {
                                            uint sumValue45 = intermediateValue21 + 4294967295u;
                                            intermediateValue[intermediateValue21] = intermediateValue[sumValue45];
                                            intermediateValue1[intermediateValue21] = intermediateValue1[sumValue45];
                                            if (int(sumValue45) > int(intermediateValue16))
                                            {
                                                intermediateValue21 = sumValue45;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                    }
                                    intermediateValue[intermediateValue16] = nonlinearValue2;
                                    intermediateValue1[intermediateValue16] = scalarValue5;
                                    imageStore(zLightLookupArray, int(scalarValue5 + productValue), uvec4(floatBitsToUint(float(int(sampledTextureValue3)))));
                                    branchMergedValue5 = scalarValue5 + 1u;
                                }
                                else
                                {
                                    uint sumValue18 = scalarValue4 + 4294967295u;
                                    uint scalarValue9 = intermediateValue1[sumValue18];
                                    uint sumValue19 = scalarValue4 + 4294967294u;
                                    if (!(int(sumValue19) < int(intermediateValue16)))
                                    {
                                        uint intermediateValue22;
                                        intermediateValue22 = sumValue19;
                                        for (;;)
                                        {
                                            uint sumValue46 = intermediateValue22 + 1u;
                                            intermediateValue[sumValue46] = intermediateValue[intermediateValue22];
                                            intermediateValue1[sumValue46] = intermediateValue1[intermediateValue22];
                                            if (int(intermediateValue22) > int(intermediateValue16))
                                            {
                                                intermediateValue22 += 4294967295u;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                    }
                                    intermediateValue[intermediateValue16] = nonlinearValue2;
                                    intermediateValue1[intermediateValue16] = scalarValue9;
                                    imageStore(zLightLookupArray, int(scalarValue9 + productValue), uvec4(floatBitsToUint(float(int(sampledTextureValue3)))));
                                    branchMergedValue5 = scalarValue5;
                                }
                                branchMergedValue4 = branchMergedValue5;
                            }
                            branchMergedValue3 = branchMergedValue4;
                        }
                        branchMergedValue2 = branchMergedValue3;
#endif
                    }
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    uint sumValue42 = bitwiseValue6 + 3u;
                    if (sumValue42 < 128u)
                    {
                        intermediateValue4[sumValue42] = sumValue41;
                    }
                    sumValue17 = scalarValue29 - 1u;
                    scalarValue29 = sumValue17;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    uint sumValue42 = bitwiseValue6 + 3u;
                    if (sumValue42 < 128u)
                    {
                        intermediateValue4[sumValue42] = sumValue41;
                    }
                    sumValue9 = scalarValue29 - 1u;
                    scalarValue29 = sumValue9;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue = branchMergedValue5;
                }
                intermediateValue8 = branchMergedValue;
                uint sumValue21 = scalarValue6 + 1u;
                if (sumValue21 == scalarValue3)
                {
                    break;
                }
                else
                {
                    scalarValue5 = intermediateValue8;
                    scalarValue6 = sumValue21;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue = branchMergedValue2;
                }
                intermediateValue8 = branchMergedValue;
                uint sumValue21 = scalarValue6 + 1u;
                if (sumValue21 == scalarValue3)
                {
                    break;
                }
                else
                {
                    scalarValue5 = intermediateValue8;
                    scalarValue6 = sumValue21;
#endif
                    continue;
                }
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                uint bitwiseValue7 = intermediateValue34 << 1u;
                if (bitwiseValue7 < 128u)
                {
                    intermediateValue4[bitwiseValue7] = reinterpretedBits1;
                }
                uint sumValue43 = bitwiseValue7 + 1u;
                if (sumValue43 < 128u)
                {
                    intermediateValue4[sumValue43] = scalarValue28;
                }
                imageStore(intermediateValue1, int((scalarValue14 * multiplyAddValue) + scalarValue28), uvec4(floatBitsToUint(rdSignedBitsToFloat(reinterpretedBits2))));
                sumValue8 = intermediateValue16;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                uint bitwiseValue11 = intermediateValue19 << 1u;
                if (bitwiseValue11 < 128u)
                {
                    intermediateValue4[bitwiseValue11] = reinterpretedBits5;
                }
                uint sumValue53 = bitwiseValue11 + 1u;
                if (sumValue53 < 128u)
                {
                    intermediateValue4[sumValue53] = scalarValue28;
                }
                imageStore(intermediateValue1, int((scalarValue14 * multiplyAddValue) + scalarValue28), uvec4(floatBitsToUint(rdSignedBitsToFloat(scalarValue30))));
                sumValue4 = intermediateValue14;
#endif
            }
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            sumValue6 = scalarValue5 + 1u;
            intermediateValue17 = sumValue8;
            intermediateValue16 = intermediateValue17;
            scalarValue5 = sumValue6;
            continue;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            sumValue2 = scalarValue5 + 1u;
            intermediateValue15 = sumValue4;
            intermediateValue14 = intermediateValue15;
            scalarValue5 = sumValue2;
            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue7 = intermediateValue8;
#endif
        }
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        if (int(scalarValue14) > int(intermediateValue16))
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        if (int(scalarValue14) > int(intermediateValue14))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        else
#endif
        {
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            imageStore(intermediateValue1, int(intermediateValue16 + (scalarValue14 * multiplyAddValue)), uvec4(floatBitsToUint(-1.0)));
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            imageStore(intermediateValue1, int(intermediateValue14 + (scalarValue14 * multiplyAddValue)), uvec4(floatBitsToUint(-1.0)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue7 = 0u;
        }
        if (int(intermediateValue7) < int(scalarValue4))
        {
            imageStore(zLightLookupArray, int(intermediateValue7 + productValue), uvec4(floatBitsToUint(-1.0)));
#endif
        }
    }
}
