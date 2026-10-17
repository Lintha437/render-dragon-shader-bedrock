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

#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT2_PRECISE_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/LightClustering/ComputeBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float scalarValue10 = rdUnsignedToFloat(dispatchThreadId.x);
    float scalarValue11 = rdUnsignedToFloat(dispatchThreadId.y);
    float scalarValue12 = rdUnsignedToFloat(dispatchThreadId.z);
    if (!(((scalarValue10 >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || (scalarValue11 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y)) || (scalarValue12 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float scalarValue = float(dispatchThreadId.x);
    float scalarValue1 = float(dispatchThreadId.y);
    float scalarValue2 = float(dispatchThreadId.z);
    uint scalarValue3 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
    uint scalarValue4 = uint(int(RD_UNIFORM_LIGHTS_PER_CLUSTER.x));
    if (!((scalarValue2 >= RD_UNIFORM_CLUSTER_DIMENSIONS.z) || ((scalarValue >= RD_UNIFORM_CLUSTER_DIMENSIONS.x) || (scalarValue1 >= RD_UNIFORM_CLUSTER_DIMENSIONS.y))))
#endif
    {
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        uint scalarValue3 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
        uint scalarValue4 = uint(int(RD_UNIFORM_LIGHTS_PER_CLUSTER.x));
        uint multiplyAddValue = uint(int(mad(scalarValue12 * RD_UNIFORM_CLUSTER_DIMENSIONS.x, RD_UNIFORM_CLUSTER_DIMENSIONS.y, mad(scalarValue11, RD_UNIFORM_CLUSTER_DIMENSIONS.x, scalarValue10))));
        float sumValue22 = scalarValue12 + 0.5f;
        float sumValue23 = RD_UNIFORM_CLUSTER_DIMENSIONS.z - 2.0f;
        float sumValue5 = RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.y - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z;
        float multiplyAddValue1 = (sumValue22 < 1.0f) ? (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x * 0.5f) : ((sumValue22 < 2.0f) ? ((RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y + RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x) * 0.5f) : exp2(mad((scalarValue12 - 1.5f) / sumValue23, sumValue5, RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z)));
        float productValue15 = multiplyAddValue1 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z;
        float productValue16 = productValue15 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
        float multiplyAddValue2 = mad((scalarValue10 + 0.5f) / RD_UNIFORM_CLUSTER_DIMENSIONS.x, productValue16 + productValue16, -productValue16);
        float multiplyAddValue3 = mad((scalarValue11 + 0.5f) / RD_UNIFORM_CLUSTER_DIMENSIONS.y, productValue15 + productValue15, -productValue15);
        bool comparisonValue11 = dispatchThreadId.z == 1u;
        bool comparisonValue12 = dispatchThreadId.z != 0u;
        float multiplyAddValue4 = comparisonValue12 ? (comparisonValue11 ? RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x : exp2(mad(rdUnsignedToFloat(dispatchThreadId.z - 2u) / sumValue23, sumValue5, RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z))) : 0.0f;
        float multiplyAddValue5 = comparisonValue12 ? (comparisonValue11 ? RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y : exp2(mad(rdUnsignedToFloat(dispatchThreadId.z - 1u) / sumValue23, sumValue5, RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z))) : RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x;
        float productValue6 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
        float quotientValue8 = (productValue6 + productValue6) / RD_UNIFORM_CLUSTER_DIMENSIONS.x;
        float quotientValue9 = (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z + RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z) / RD_UNIFORM_CLUSTER_DIMENSIONS.y;
        float multiplyAddValue6 = mad(scalarValue10, quotientValue8, -productValue6);
        float sumValue24 = quotientValue8 + multiplyAddValue6;
        float multiplyAddValue7 = mad(scalarValue11, quotientValue9, -RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z);
        float sumValue25 = quotientValue9 + multiplyAddValue7;
        uint bitwiseValue1 = scalarValue4 << 1u;
        uint sumValue26 = scalarValue4 - 2u;
        uint intermediateValue14;
        intermediateValue14 = 0u;
        uint intermediateValue15;
        uint sumValue6;
        uint scalarValue5 = 0u;
        for (;;)
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        uint scalarValue3 = uint(int(RD_UNIFORM_CLUSTER_DIMENSIONS.w));
        uint scalarValue4 = uint(int(RD_UNIFORM_LIGHTS_PER_CLUSTER.x));
        uint multiplyAddValue = uint(int(mad(scalarValue12 * RD_UNIFORM_CLUSTER_DIMENSIONS.x, RD_UNIFORM_CLUSTER_DIMENSIONS.y, mad(scalarValue11, RD_UNIFORM_CLUSTER_DIMENSIONS.x, scalarValue10))));
        float sumValue22 = scalarValue12 + 0.5f;
        float multiplyAddValue21 = (sumValue22 < 1.0f) ? (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x * 0.5f) : ((sumValue22 < 2.0f) ? ((RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y + RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x) * 0.5f) : exp2(mad((scalarValue12 - 1.5f) / (RD_UNIFORM_CLUSTER_DIMENSIONS.z - 2.0f), RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.y - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z, RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z)));
        float productValue27 = multiplyAddValue21 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z;
        float productValue28 = productValue27 * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
        float multiplyAddValue22 = mad((scalarValue10 + 0.5f) / RD_UNIFORM_CLUSTER_DIMENSIONS.x, productValue28 + productValue28, -productValue28);
        float multiplyAddValue23 = mad((scalarValue11 + 0.5f) / RD_UNIFORM_CLUSTER_DIMENSIONS.y, productValue27 + productValue27, -productValue27);
        uint bitwiseValue1 = scalarValue4 << 1u;
        uint sumValue26 = scalarValue4 - 2u;
        uint intermediateValue12;
        intermediateValue12 = 0u;
        uint intermediateValue13;
        uint sumValue2;
        uint scalarValue5 = 0u;
        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint productValue = uint(int((((RD_UNIFORM_CLUSTER_DIMENSIONS.y * scalarValue2) + scalarValue1) * RD_UNIFORM_CLUSTER_DIMENSIONS.x) + scalarValue)) * scalarValue4;
        float sumValue = scalarValue2 + 0.5f;
        float productValue1;
        if (sumValue < 1.0f)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            if (int(scalarValue3) <= int(scalarValue5))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue1 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x * 0.5f;
        }
        else
        {
            float branchMergedValue1;
            if (sumValue < 2.0f)
#endif
            {
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                break;
            }
            uint productValue17 = scalarValue5 * 16u;
            float3 loadedBufferValue5 = asfloat(uint3(rdLoad_intermediateValue(productValue17).x, rdLoad_intermediateValue(productValue17 + 1u).x, rdLoad_intermediateValue(productValue17 + 2u).x));
            uint productValue18 = scalarValue5 * 16u;
            uint sumValue27 = productValue18 + 4u;
            float3 loadedBufferValue6 = asfloat(uint3(rdLoad_intermediateValue(sumValue27).x, rdLoad_intermediateValue(sumValue27 + 1u).x, rdLoad_intermediateValue(sumValue27 + 2u).x));
            if ((scalarValue12 < loadedBufferValue5.z) || (loadedBufferValue6.z < scalarValue12))
            {
                sumValue6 = scalarValue5 + 1u;
                intermediateValue15 = intermediateValue14;
                intermediateValue14 = intermediateValue15;
                scalarValue5 = sumValue6;
                continue;
            }
            if ((scalarValue11 < loadedBufferValue5.y) || (loadedBufferValue6.y < scalarValue11))
            {
                sumValue6 = scalarValue5 + 1u;
                intermediateValue15 = intermediateValue14;
                intermediateValue14 = intermediateValue15;
                scalarValue5 = sumValue6;
                continue;
            }
            if ((scalarValue10 < loadedBufferValue5.x) || (loadedBufferValue6.x < scalarValue10))
            {
                sumValue6 = scalarValue5 + 1u;
                intermediateValue15 = intermediateValue14;
                intermediateValue14 = intermediateValue15;
                scalarValue5 = sumValue6;
                continue;
            }
            uint productValue19 = scalarValue5 * 16u;
            uint sumValue28 = productValue19 + 8u;
            float3 loadedBufferValue7 = asfloat(uint3(rdLoad_intermediateValue(sumValue28).x, rdLoad_intermediateValue(sumValue28 + 1u).x, rdLoad_intermediateValue(sumValue28 + 2u).x));
            float scalarValue13 = loadedBufferValue7.x;
            float scalarValue14 = loadedBufferValue7.y;
            float scalarValue15 = loadedBufferValue7.z;
            float3 vectorValue = float3(scalarValue13, scalarValue14, scalarValue15);
            uint productValue20 = scalarValue5 * 16u;
            uint sumValue29 = productValue20 + 12u;
            float2 loadedBufferValue8 = asfloat(uint2(rdLoad_intermediateValue(sumValue29).x, rdLoad_intermediateValue(sumValue29 + 1u).x));
            float scalarValue16 = loadedBufferValue8.y;
            float productValue21 = scalarValue16 * scalarValue16;
            bool intermediateValue22;
            if (productValue21 < rdDot3Precise(vectorValue, vectorValue))
            {
                bool bitwiseValue2 = !(((scalarValue16 - scalarValue15) < multiplyAddValue4) || (multiplyAddValue5 < (-(scalarValue16 + scalarValue15))));
                bool multiplyAddValue8;
                if (bitwiseValue2)
                {
                    float scalarValue17 = min(multiplyAddValue5, max(multiplyAddValue4, -scalarValue15));
                    float sumValue30 = scalarValue15 + scalarValue17;
                    float multiplyAddValue9 = max(mad(-sumValue30, sumValue30, productValue21), 0.0f);
                    float scalarValue18 = max(scalarValue17, 9.9999997473787516355514526367188e-05f);
                    float quotientValue10 = 1.0f / scalarValue18;
                    float2 vectorValue1 = float2(scalarValue13, scalarValue14);
                    float multiplyAddValue10 = sqrt(multiplyAddValue9) / sqrt(max(mad(scalarValue18, scalarValue18, rdDot2Precise(vectorValue1, vectorValue1)) - multiplyAddValue9, 9.9999999392252902907785028219223e-09f));
                    float quotientValue11 = (1.0f / max(multiplyAddValue10, 1.0f)) * min(multiplyAddValue10, 1.0f);
                    float productValue22 = quotientValue11 * quotientValue11;
                    float multiplyAddValue11 = mad(productValue22, mad(productValue22, mad(productValue22, mad(productValue22, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
                    float multiplyAddValue12 = mad(quotientValue11, multiplyAddValue11, (multiplyAddValue10 > 1.0f) ? mad(multiplyAddValue11 * quotientValue11, -2.0f, 1.57079637050628662109375f) : 0.0f);
                    float productValue23 = min(sumValue24, max(multiplyAddValue6, scalarValue13 * quotientValue10));
                    float productValue24 = min(sumValue25, max(multiplyAddValue7, scalarValue14 * quotientValue10));
                    float scalarValue19 = -scalarValue18;
                    float multiplyAddValue13 = mad(scalarValue19, productValue23, scalarValue13);
                    float multiplyAddValue14 = mad(scalarValue13, productValue23, scalarValue18);
                    float scalarValue20 = abs(multiplyAddValue14);
                    float scalarValue21 = abs(multiplyAddValue13);
                    float quotientValue12 = (1.0f / max(scalarValue20, scalarValue21)) * min(scalarValue20, scalarValue21);
                    float productValue25 = quotientValue12 * quotientValue12;
                    float multiplyAddValue15 = mad(productValue25, mad(productValue25, mad(productValue25, mad(productValue25, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
                    float multiplyAddValue16 = mad(quotientValue12, multiplyAddValue15, (scalarValue20 < scalarValue21) ? mad(multiplyAddValue15 * quotientValue12, -2.0f, 1.57079637050628662109375f) : 0.0f);
                    float comparisonValue13 = (multiplyAddValue14 < 0.0f) ? (multiplyAddValue16 - 3.1415927410125732421875f) : multiplyAddValue16;
                    float multiplyAddValue17 = mad(scalarValue19, productValue24, scalarValue14);
                    float multiplyAddValue18 = mad(scalarValue14, productValue24, scalarValue18);
                    float scalarValue22 = abs(multiplyAddValue18);
                    float scalarValue23 = abs(multiplyAddValue17);
                    float quotientValue13 = min(scalarValue22, scalarValue23) * (1.0f / max(scalarValue22, scalarValue23));
                    float productValue26 = quotientValue13 * quotientValue13;
                    float multiplyAddValue19 = mad(productValue26, mad(productValue26, mad(productValue26, mad(productValue26, 0.02083509974181652069091796875f, -0.08513300120830535888671875f), 0.1801410019397735595703125f), -0.33029949665069580078125f), 0.999866008758544921875f);
                    float multiplyAddValue20 = mad(quotientValue13, multiplyAddValue19, (scalarValue22 < scalarValue23) ? mad(quotientValue13 * multiplyAddValue19, -2.0f, 1.57079637050628662109375f) : 0.0f);
                    float comparisonValue14 = (multiplyAddValue18 < 0.0f) ? (multiplyAddValue20 - 3.1415927410125732421875f) : multiplyAddValue20;
                    float comparisonValue15 = abs(((min(multiplyAddValue18, multiplyAddValue17) < 0.0f) && (max(multiplyAddValue18, multiplyAddValue17) >= 0.0f)) ? (-comparisonValue14) : comparisonValue14);
                    float comparisonValue16 = abs(((min(multiplyAddValue14, multiplyAddValue13) < 0.0f) && (max(multiplyAddValue14, multiplyAddValue13) >= 0.0f)) ? (-comparisonValue13) : comparisonValue13);
                    multiplyAddValue8 = (multiplyAddValue12 * multiplyAddValue12) >= mad(comparisonValue16, comparisonValue16, comparisonValue15 * comparisonValue15);
                }
                else
                {
                    multiplyAddValue8 = bitwiseValue2;
                }
                intermediateValue22 = multiplyAddValue8;
            }
            else
            {
                intermediateValue22 = true;
            }
            if (!intermediateValue22)
            {
                sumValue6 = scalarValue5 + 1u;
                intermediateValue15 = intermediateValue14;
                intermediateValue14 = intermediateValue15;
                scalarValue5 = sumValue6;
                continue;
            }
            float3 sumValue31 = float3(scalarValue13 - multiplyAddValue2, scalarValue14 - multiplyAddValue3, multiplyAddValue1 + scalarValue15);
            float nonlinearValue3 = sqrt(rdDot3Precise(sumValue31, sumValue31));
            if ((int(scalarValue4) <= int(intermediateValue14)) && (nonlinearValue3 >= asfloat(intermediateValue2[min(((intermediateValue14 << 1u) - 2u), 128u)])))
            {
                sumValue6 = scalarValue5 + 1u;
                intermediateValue15 = intermediateValue14;
                intermediateValue14 = intermediateValue15;
                scalarValue5 = sumValue6;
                continue;
            }
            uint intermediateValue32;
            intermediateValue32 = 0u;
            uint comparisonValue6;
            uint comparisonValue7;
            uint scalarValue24 = intermediateValue14;
            for (;;)
            {
                if (int(scalarValue24) <= int(intermediateValue32))
                {
                    break;
                }
                uint sumValue32 = scalarValue24 + intermediateValue32;
                uint bitwiseValue3 = uint(abs(int(sumValue32))) >> 1u;
                uint comparisonValue17 = (((sumValue32 ^ 2u) & 2147483648u) != 0u) ? (-bitwiseValue3) : bitwiseValue3;
                bool reinterpretedBits = asfloat(intermediateValue2[min((comparisonValue17 << 1u), 128u)]) < nonlinearValue3;
                comparisonValue6 = reinterpretedBits ? scalarValue24 : comparisonValue17;
                comparisonValue7 = reinterpretedBits ? (comparisonValue17 + 1u) : intermediateValue32;
                scalarValue24 = comparisonValue6;
                intermediateValue32 = comparisonValue7;
                continue;
            }
            uint reinterpretedBits1 = asuint(nonlinearValue3);
            uint reinterpretedBits2 = asuint(loadedBufferValue8.x);
            uint sumValue8;
            if (int(scalarValue4) > int(intermediateValue14))
            {
                uint sumValue33 = intermediateValue14 - 1u;
                uint sumValue16;
                uint scalarValue25 = sumValue33;
                for (;;)
                {
                    if (int(intermediateValue32) > int(scalarValue25))
                    {
                        break;
                    }
                    uint bitwiseValue4 = scalarValue25 << 1u;
                    uint sumValue34 = bitwiseValue4 + 2u;
                    uint sumValue35 = intermediateValue2[min((bitwiseValue4 + 1u), 128u)];
                    if (sumValue34 < 128u)
                    {
                        intermediateValue2[sumValue34] = intermediateValue2[min(bitwiseValue4, 128u)];
                    }
                    uint sumValue36 = bitwiseValue4 + 3u;
                    if (sumValue36 < 128u)
                    {
                        intermediateValue2[sumValue36] = sumValue35;
                    }
                    sumValue16 = scalarValue25 - 1u;
                    scalarValue25 = sumValue16;
                    continue;
                }
                uint bitwiseValue5 = intermediateValue32 << 1u;
                if (bitwiseValue5 < 128u)
                {
                    intermediateValue2[bitwiseValue5] = reinterpretedBits1;
                }
                uint sumValue37 = bitwiseValue5 + 1u;
                if (sumValue37 < 128u)
                {
                    intermediateValue2[sumValue37] = intermediateValue14;
                }
                rdAccess_intermediateValue1((scalarValue4 * multiplyAddValue) + intermediateValue14) = asuint(rdSignedBitsToFloat(reinterpretedBits2)).x;
                sumValue8 = intermediateValue14 + 1u;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                break;
            }
            uint productValue17 = scalarValue5 * 16u;
            uint3 loadedBufferValue9 = uint3(rdLoad_intermediateValue(productValue17).x, rdLoad_intermediateValue(productValue17 + 1u).x, rdLoad_intermediateValue(productValue17 + 2u).x);
            uint productValue18 = scalarValue5 * 16u;
            uint sumValue27 = productValue18 + 4u;
            uint3 loadedBufferValue10 = uint3(rdLoad_intermediateValue(sumValue27).x, rdLoad_intermediateValue(sumValue27 + 1u).x, rdLoad_intermediateValue(sumValue27 + 2u).x);
            if ((scalarValue12 < asfloat(loadedBufferValue9.z)) || (asfloat(loadedBufferValue10.z) < scalarValue12))
            {
                sumValue2 = scalarValue5 + 1u;
                intermediateValue13 = intermediateValue12;
                intermediateValue12 = intermediateValue13;
                scalarValue5 = sumValue2;
                continue;
            }
            if ((scalarValue11 < asfloat(loadedBufferValue9.y)) || (asfloat(loadedBufferValue10.y) < scalarValue11))
            {
                sumValue2 = scalarValue5 + 1u;
                intermediateValue13 = intermediateValue12;
                intermediateValue12 = intermediateValue13;
                scalarValue5 = sumValue2;
                continue;
            }
            if ((scalarValue10 < asfloat(loadedBufferValue9.x)) || (asfloat(loadedBufferValue10.x) < scalarValue10))
            {
                sumValue2 = scalarValue5 + 1u;
                intermediateValue13 = intermediateValue12;
                intermediateValue12 = intermediateValue13;
                scalarValue5 = sumValue2;
                continue;
            }
            uint productValue29 = (scalarValue5 * 16u) + 8u;
            uint3 loadedBufferValue11 = uint3(rdLoad_intermediateValue(productValue29).x, rdLoad_intermediateValue(productValue29 + 1u).x, rdLoad_intermediateValue(productValue29 + 2u).x);
            float3 reinterpretedBits3 = float3(asfloat(loadedBufferValue11.x) - multiplyAddValue22, asfloat(loadedBufferValue11.y) - multiplyAddValue23, multiplyAddValue21 + asfloat(loadedBufferValue11.z));
            float nonlinearValue4 = sqrt(rdDot3Precise(reinterpretedBits3, reinterpretedBits3));
            if ((int(scalarValue4) <= int(intermediateValue12)) && (nonlinearValue4 >= asfloat(intermediateValue2[min(((intermediateValue12 << 1u) - 2u), 128u)])))
            {
                sumValue2 = scalarValue5 + 1u;
                intermediateValue13 = intermediateValue12;
                intermediateValue12 = intermediateValue13;
                scalarValue5 = sumValue2;
                continue;
            }
            uint4 loadedBufferValue12 = rdLoad_intermediateValue((scalarValue5 * 16u) + 12u);
            uint scalarValue28 = loadedBufferValue12.x;
            uint intermediateValue17;
            intermediateValue17 = 0u;
            uint comparisonValue;
            uint comparisonValue1;
            uint scalarValue29 = intermediateValue12;
            for (;;)
            {
                if (int(intermediateValue17) >= int(scalarValue29))
                {
                    break;
                }
                uint sumValue46 = intermediateValue17 + scalarValue29;
                uint bitwiseValue8 = uint(abs(int(sumValue46))) >> 1u;
                uint comparisonValue19 = (((sumValue46 ^ 2u) & 2147483648u) != 0u) ? (-bitwiseValue8) : bitwiseValue8;
                bool reinterpretedBits4 = asfloat(intermediateValue2[min((comparisonValue19 << 1u), 128u)]) < nonlinearValue4;
                comparisonValue = reinterpretedBits4 ? scalarValue29 : comparisonValue19;
                comparisonValue1 = reinterpretedBits4 ? (comparisonValue19 + 1u) : intermediateValue17;
                scalarValue29 = comparisonValue;
                intermediateValue17 = comparisonValue1;
                continue;
            }
            uint reinterpretedBits5 = asuint(nonlinearValue4);
            uint sumValue4;
            if (int(scalarValue4) > int(intermediateValue12))
            {
                uint sumValue47 = intermediateValue12 - 1u;
                uint sumValue8;
                uint scalarValue30 = sumValue47;
                for (;;)
                {
                    if (int(intermediateValue17) > int(scalarValue30))
                    {
                        break;
                    }
                    uint bitwiseValue9 = scalarValue30 << 1u;
                    uint sumValue48 = bitwiseValue9 + 2u;
                    uint sumValue49 = intermediateValue2[min((bitwiseValue9 + 1u), 128u)];
                    if (sumValue48 < 128u)
                    {
                        intermediateValue2[sumValue48] = intermediateValue2[min(bitwiseValue9, 128u)];
                    }
                    uint sumValue50 = bitwiseValue9 + 3u;
                    if (sumValue50 < 128u)
                    {
                        intermediateValue2[sumValue50] = sumValue49;
                    }
                    sumValue8 = scalarValue30 - 1u;
                    scalarValue30 = sumValue8;
                    continue;
                }
                uint bitwiseValue10 = intermediateValue17 << 1u;
                if (bitwiseValue10 < 128u)
                {
                    intermediateValue2[bitwiseValue10] = reinterpretedBits5;
                }
                uint sumValue51 = bitwiseValue10 + 1u;
                if (sumValue51 < 128u)
                {
                    intermediateValue2[sumValue51] = intermediateValue12;
                }
                rdAccess_intermediateValue1((scalarValue4 * multiplyAddValue) + intermediateValue12) = asuint(rdSignedBitsToFloat(scalarValue28)).x;
                sumValue4 = intermediateValue12 + 1u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue1 = (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x + RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y) * 0.5f;
#endif
            }
            else
            {
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                uint sumValue38 = min((bitwiseValue1 - 1u), 128u);
                uint scalarValue26 = intermediateValue2[sumValue38];
                uint sumValue17;
                uint scalarValue27 = sumValue26;
                for (;;)
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                uint sumValue38 = min((bitwiseValue1 - 1u), 128u);
                uint scalarValue26 = intermediateValue2[sumValue38];
                uint sumValue9;
                uint scalarValue27 = sumValue26;
                for (;;)
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue1 = exp2((((scalarValue2 + (-1.5f)) / (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) * (RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.y - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z)) + RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z);
            }
            productValue1 = branchMergedValue1;
        }
        float quotientValue = ((((RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w * 2.0f) * ((scalarValue + 0.5f) / RD_UNIFORM_CLUSTER_DIMENSIONS.x)) - RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w) * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z) * productValue1;
        float quotientValue1 = productValue1 * (((RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * 2.0f) * ((scalarValue1 + 0.5f) / RD_UNIFORM_CLUSTER_DIMENSIONS.y)) - RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z);
        uint intermediateValue7;
        if (int(scalarValue3) > int(0u))
        {
            uint intermediateValue8;
            float rdAccess_intermediateValue(64);
            uint rdAccess_intermediateValue1(64);
            uint scalarValue5 = 0u;
            uint scalarValue6 = 0u;
            float3 loadedBufferValue;
            float intermediateValue11;
            float3 loadedBufferValue1;
            float intermediateValue12;
            float intermediateValue13;
            float intermediateValue14;
            float intermediateValue15;
            uint loadedBufferValue3;
            float loadedBufferValue4;
            bool bitwiseValue;
            for (;;)
            {
                uint productValue2 = scalarValue6 * 16u;
                loadedBufferValue = asfloat(uint3(rdLoad_extends(productValue2).x, rdLoad_extends(productValue2 + 1u).x, rdLoad_extends(productValue2 + 2u).x));
                intermediateValue11 = loadedBufferValue.x;
                uint productValue3 = (scalarValue6 * 16u) + 4u;
                loadedBufferValue1 = asfloat(uint3(rdLoad_extends(productValue3).x, rdLoad_extends(productValue3 + 1u).x, rdLoad_extends(productValue3 + 2u).x));
                intermediateValue12 = loadedBufferValue1.x;
                uint productValue4 = (scalarValue6 * 16u) + 8u;
                float3 loadedBufferValue2 = asfloat(uint3(rdLoad_extends(productValue4).x, rdLoad_extends(productValue4 + 1u).x, rdLoad_extends(productValue4 + 2u).x));
                intermediateValue13 = loadedBufferValue2.x;
                intermediateValue14 = loadedBufferValue2.y;
                intermediateValue15 = loadedBufferValue2.z;
                loadedBufferValue3 = rdLoad_extends((scalarValue6 * 16u) + 12u).x;
                loadedBufferValue4 = asfloat(rdLoad_extends((scalarValue6 * 16u) + 13u).x);
                bitwiseValue = (scalarValue2 < loadedBufferValue.z) || (scalarValue2 > loadedBufferValue1.z);
                uint branchMergedValue;
                if (bitwiseValue)
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue1 = exp2((((scalarValue2 + (-1.5f)) / (RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f))) * (RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.y - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z)) + RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z);
            }
            productValue1 = branchMergedValue1;
        }
        float quotientValue = ((((RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w * 2.0f) * ((scalarValue + 0.5f) / RD_UNIFORM_CLUSTER_DIMENSIONS.x)) - RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w) * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z) * productValue1;
        float quotientValue1 = productValue1 * (((RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * 2.0f) * ((scalarValue1 + 0.5f) / RD_UNIFORM_CLUSTER_DIMENSIONS.y)) - RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z);
        uint intermediateValue7;
        if (int(scalarValue3) > int(0u))
        {
            uint intermediateValue8;
            float rdAccess_intermediateValue(64);
            uint rdAccess_intermediateValue1(64);
            uint scalarValue5 = 0u;
            uint scalarValue6 = 0u;
            float3 loadedBufferValue;
            float intermediateValue11;
            float3 loadedBufferValue1;
            float intermediateValue12;
            float intermediateValue13;
            float intermediateValue14;
            float intermediateValue15;
            uint loadedBufferValue3;
            bool bitwiseValue;
            for (;;)
            {
                uint productValue2 = scalarValue6 * 16u;
                loadedBufferValue = asfloat(uint3(rdLoad_extends(productValue2).x, rdLoad_extends(productValue2 + 1u).x, rdLoad_extends(productValue2 + 2u).x));
                intermediateValue11 = loadedBufferValue.x;
                uint productValue3 = (scalarValue6 * 16u) + 4u;
                loadedBufferValue1 = asfloat(uint3(rdLoad_extends(productValue3).x, rdLoad_extends(productValue3 + 1u).x, rdLoad_extends(productValue3 + 2u).x));
                intermediateValue12 = loadedBufferValue1.x;
                uint productValue4 = (scalarValue6 * 16u) + 8u;
                float3 loadedBufferValue2 = asfloat(uint3(rdLoad_extends(productValue4).x, rdLoad_extends(productValue4 + 1u).x, rdLoad_extends(productValue4 + 2u).x));
                intermediateValue13 = loadedBufferValue2.x;
                intermediateValue14 = loadedBufferValue2.y;
                intermediateValue15 = loadedBufferValue2.z;
                loadedBufferValue3 = rdLoad_extends((scalarValue6 * 16u) + 12u).x;
                bitwiseValue = (scalarValue2 < loadedBufferValue.z) || (scalarValue2 > loadedBufferValue1.z);
                uint branchMergedValue;
                if (bitwiseValue)
#endif
                {
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(intermediateValue32) > int(scalarValue27))
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(intermediateValue17) > int(scalarValue27))
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue = scalarValue5;
                }
                else
                {
                    uint branchMergedValue5;
                    if ((scalarValue1 < loadedBufferValue.y) || (scalarValue1 > loadedBufferValue1.y))
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue = scalarValue5;
                }
                else
                {
                    uint branchMergedValue2;
                    if ((scalarValue1 < loadedBufferValue.y) || (scalarValue1 > loadedBufferValue1.y))
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
                    uint bitwiseValue6 = scalarValue27 << 1u;
                    uint sumValue39 = bitwiseValue6 + 2u;
                    uint sumValue40 = intermediateValue2[min((bitwiseValue6 + 1u), 128u)];
                    if (sumValue39 < 128u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    else
#endif
                    {
#if RD_PLATFORM == RD_PLATFORM_SM50
                        intermediateValue2[sumValue39] = intermediateValue2[min(bitwiseValue6, 128u)];
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        uint branchMergedValue6;
                        if ((scalarValue < intermediateValue11) || (scalarValue > intermediateValue12))
                        {
                            branchMergedValue6 = scalarValue5;
                        }
                        else
                        {
                            float productValue5 = loadedBufferValue4 * loadedBufferValue4;
                            bool intermediateValue16;
                            if (!(dot(float3(intermediateValue13, intermediateValue14, intermediateValue15), float3(intermediateValue13, intermediateValue14, intermediateValue15)) <= productValue5))
                            {
                                float sumValue1 = (-0.0f) - intermediateValue15;
                                float intermediateValue17;
                                float intermediateValue18;
                                if (dispatchThreadId.z == 0u)
                                {
                                    intermediateValue17 = 0.0f;
                                    intermediateValue18 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x;
                                }
                                else
                                {
                                    float branchMergedValue3;
                                    float branchMergedValue4;
                                    if (dispatchThreadId.z == 1u)
                                    {
                                        branchMergedValue3 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.x;
                                        branchMergedValue4 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.y;
                                    }
                                    else
                                    {
                                        float sumValue3 = RD_UNIFORM_CLUSTER_DIMENSIONS.z + (-2.0f);
                                        float sumValue5 = RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.y - RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z;
                                        branchMergedValue3 = exp2((sumValue5 * (float(dispatchThreadId.z + 4294967294u) / sumValue3)) + RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z);
                                        branchMergedValue4 = exp2((sumValue5 * (float(dispatchThreadId.z + 4294967295u) / sumValue3)) + RD_UNIFORM_POINT_LIGHT_PRE_CALC_VALUES.z);
                                    }
                                    intermediateValue17 = branchMergedValue3;
                                    intermediateValue18 = branchMergedValue4;
                                }
                                bool branchMergedValue2;
                                if (((loadedBufferValue4 - intermediateValue15) < intermediateValue17) || ((sumValue1 - loadedBufferValue4) > intermediateValue18))
                                {
                                    branchMergedValue2 = false;
                                }
                                else
                                {
                                    float scalarValue7 = min(max(sumValue1, intermediateValue17), intermediateValue18);
                                    float sumValue7 = scalarValue7 + intermediateValue15;
                                    float nonlinearValue = sqrt(max(productValue5 - (sumValue7 * sumValue7), 0.0f));
                                    float scalarValue8 = max(scalarValue7, 9.9999997473787516355514526367188e-05f);
                                    float productValue6 = RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.w;
                                    float quotientValue2 = (productValue6 * 2.0f) / RD_UNIFORM_CLUSTER_DIMENSIONS.x;
                                    float quotientValue3 = (RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z * 2.0f) / RD_UNIFORM_CLUSTER_DIMENSIONS.y;
                                    float productValue7 = (quotientValue2 * scalarValue) - productValue6;
                                    float productValue8 = (quotientValue3 * scalarValue1) - RD_UNIFORM_CLUSTER_DEPTH_BOUNDS.z;
                                    float quotientValue4 = 1.0f / scalarValue8;
                                    float nonlinearValue1 = atan(nonlinearValue / sqrt(max((((intermediateValue13 * intermediateValue13) + (intermediateValue14 * intermediateValue14)) - (nonlinearValue * nonlinearValue)) + (scalarValue8 * scalarValue8), 9.9999999392252902907785028219223e-09f)));
                                    float productValue9 = min(max(quotientValue4 * intermediateValue13, productValue7), productValue7 + quotientValue2);
                                    float productValue10 = min(max(quotientValue4 * intermediateValue14, productValue8), productValue8 + quotientValue3);
                                    float sumValue10 = (-0.0f) - scalarValue8;
                                    float productValue11 = (productValue9 * intermediateValue13) + scalarValue8;
                                    float productValue12 = (productValue9 * sumValue10) + intermediateValue13;
                                    float quotientValue5 = atan(productValue12 / productValue11);
                                    bool conditionValue = productValue11 < 0.0f;
                                    bool comparisonValue2 = productValue11 == 0.0f;
                                    bool comparisonValue3 = productValue12 >= 0.0f;
                                    bool conditionValue1 = productValue12 < 0.0f;
                                    float comparisonValue4 = abs((comparisonValue2 && comparisonValue3) ? 1.57079637050628662109375f : ((comparisonValue2 && conditionValue1) ? (-1.57079637050628662109375f) : ((conditionValue && conditionValue1) ? (quotientValue5 + (-3.1415927410125732421875f)) : ((conditionValue && comparisonValue3) ? (quotientValue5 + 3.1415927410125732421875f) : quotientValue5))));
                                    float productValue13 = (productValue10 * intermediateValue14) + scalarValue8;
                                    float productValue14 = (productValue10 * sumValue10) + intermediateValue14;
                                    float quotientValue6 = atan(productValue14 / productValue13);
                                    bool conditionValue2 = productValue13 < 0.0f;
                                    bool comparisonValue5 = productValue13 == 0.0f;
                                    bool comparisonValue8 = productValue14 >= 0.0f;
                                    bool conditionValue3 = productValue14 < 0.0f;
                                    float comparisonValue9 = abs((comparisonValue5 && comparisonValue8) ? 1.57079637050628662109375f : ((comparisonValue5 && conditionValue3) ? (-1.57079637050628662109375f) : ((conditionValue2 && conditionValue3) ? (quotientValue6 + (-3.1415927410125732421875f)) : ((conditionValue2 && comparisonValue8) ? (quotientValue6 + 3.1415927410125732421875f) : quotientValue6))));
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
                                if ((int(scalarValue5) >= int(scalarValue4)) && (nonlinearValue2 >= rdAccess_intermediateValue(scalarValue5 + 4294967295u)))
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
                                            bool conditionValue4 = rdAccess_intermediateValue(quotientValue7) < nonlinearValue2;
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
                                                rdAccess_intermediateValue(intermediateValue30) = rdAccess_intermediateValue(sumValue15);
                                                rdAccess_intermediateValue1(intermediateValue30) = rdAccess_intermediateValue1(sumValue15);
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
                                        rdAccess_intermediateValue(intermediateValue25) = nonlinearValue2;
                                        rdAccess_intermediateValue1(intermediateValue25) = scalarValue5;
                                        rdAccess_zLightLookupArray(scalarValue5 + productValue) = asuint(float(int(loadedBufferValue3))).x;
                                        branchMergedValue9 = scalarValue5 + 1u;
                                    }
                                    else
                                    {
                                        uint sumValue18 = scalarValue4 + 4294967295u;
                                        uint scalarValue9 = rdAccess_intermediateValue1(sumValue18);
                                        uint sumValue19 = scalarValue4 + 4294967294u;
                                        if (!(int(sumValue19) < int(intermediateValue25)))
                                        {
                                            uint intermediateValue31;
                                            intermediateValue31 = sumValue19;
                                            for (;;)
                                            {
                                                uint sumValue20 = intermediateValue31 + 1u;
                                                rdAccess_intermediateValue(sumValue20) = rdAccess_intermediateValue(intermediateValue31);
                                                rdAccess_intermediateValue1(sumValue20) = rdAccess_intermediateValue1(intermediateValue31);
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
                                        rdAccess_intermediateValue(intermediateValue25) = nonlinearValue2;
                                        rdAccess_intermediateValue1(intermediateValue25) = scalarValue9;
                                        rdAccess_zLightLookupArray(scalarValue9 + productValue) = asuint(float(int(loadedBufferValue3))).x;
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
                            if ((int(scalarValue5) >= int(scalarValue4)) && (nonlinearValue2 >= rdAccess_intermediateValue(scalarValue5 + 4294967295u)))
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
                                        uint sumValue43 = intermediateValue18 + intermediateValue17;
                                        uint quotientValue14 = uint(int(sumValue43) / int(2u));
                                        bool conditionValue5 = rdAccess_intermediateValue(quotientValue14) < nonlinearValue2;
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
                                            uint sumValue44 = intermediateValue21 + 4294967295u;
                                            rdAccess_intermediateValue(intermediateValue21) = rdAccess_intermediateValue(sumValue44);
                                            rdAccess_intermediateValue1(intermediateValue21) = rdAccess_intermediateValue1(sumValue44);
                                            if (int(sumValue44) > int(intermediateValue16))
                                            {
                                                intermediateValue21 = sumValue44;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                    }
                                    rdAccess_intermediateValue(intermediateValue16) = nonlinearValue2;
                                    rdAccess_intermediateValue1(intermediateValue16) = scalarValue5;
                                    rdAccess_zLightLookupArray(scalarValue5 + productValue) = asuint(float(int(loadedBufferValue3))).x;
                                    branchMergedValue5 = scalarValue5 + 1u;
                                }
                                else
                                {
                                    uint sumValue18 = scalarValue4 + 4294967295u;
                                    uint scalarValue9 = rdAccess_intermediateValue1(sumValue18);
                                    uint sumValue19 = scalarValue4 + 4294967294u;
                                    if (!(int(sumValue19) < int(intermediateValue16)))
                                    {
                                        uint intermediateValue22;
                                        intermediateValue22 = sumValue19;
                                        for (;;)
                                        {
                                            uint sumValue45 = intermediateValue22 + 1u;
                                            rdAccess_intermediateValue(sumValue45) = rdAccess_intermediateValue(intermediateValue22);
                                            rdAccess_intermediateValue1(sumValue45) = rdAccess_intermediateValue1(intermediateValue22);
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
                                    rdAccess_intermediateValue(intermediateValue16) = nonlinearValue2;
                                    rdAccess_intermediateValue1(intermediateValue16) = scalarValue9;
                                    rdAccess_zLightLookupArray(scalarValue9 + productValue) = asuint(float(int(loadedBufferValue3))).x;
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
                    uint sumValue41 = bitwiseValue6 + 3u;
                    if (sumValue41 < 128u)
                    {
                        intermediateValue2[sumValue41] = sumValue40;
                    }
                    sumValue17 = scalarValue27 - 1u;
                    scalarValue27 = sumValue17;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    uint sumValue41 = bitwiseValue6 + 3u;
                    if (sumValue41 < 128u)
                    {
                        intermediateValue2[sumValue41] = sumValue40;
                    }
                    sumValue9 = scalarValue27 - 1u;
                    scalarValue27 = sumValue9;
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
                uint bitwiseValue7 = intermediateValue32 << 1u;
                if (bitwiseValue7 < 128u)
                {
                    intermediateValue2[bitwiseValue7] = reinterpretedBits1;
                }
                uint sumValue42 = bitwiseValue7 + 1u;
                if (sumValue42 < 128u)
                {
                    intermediateValue2[sumValue42] = scalarValue26;
                }
                rdAccess_intermediateValue1((scalarValue4 * multiplyAddValue) + scalarValue26) = asuint(rdSignedBitsToFloat(reinterpretedBits2)).x;
                sumValue8 = intermediateValue14;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                uint bitwiseValue11 = intermediateValue17 << 1u;
                if (bitwiseValue11 < 128u)
                {
                    intermediateValue2[bitwiseValue11] = reinterpretedBits5;
                }
                uint sumValue52 = bitwiseValue11 + 1u;
                if (sumValue52 < 128u)
                {
                    intermediateValue2[sumValue52] = scalarValue26;
                }
                rdAccess_intermediateValue1((scalarValue4 * multiplyAddValue) + scalarValue26) = asuint(rdSignedBitsToFloat(scalarValue28)).x;
                sumValue4 = intermediateValue12;
#endif
            }
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            sumValue6 = scalarValue5 + 1u;
            intermediateValue15 = sumValue8;
            intermediateValue14 = intermediateValue15;
            scalarValue5 = sumValue6;
            continue;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            sumValue2 = scalarValue5 + 1u;
            intermediateValue13 = sumValue4;
            intermediateValue12 = intermediateValue13;
            scalarValue5 = sumValue2;
            continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue7 = intermediateValue8;
#endif
        }
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        if (int(scalarValue4) > int(intermediateValue14))
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        if (int(scalarValue4) > int(intermediateValue12))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        else
#endif
        {
#if (RD_FEATURE_ANGULAR_REFINEMENT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            rdAccess_intermediateValue1(intermediateValue14 + (scalarValue4 * multiplyAddValue)) = asuint(-1.0f).x;
#elif (RD_FEATURE_ANGULAR_REFINEMENT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            rdAccess_intermediateValue1(intermediateValue12 + (scalarValue4 * multiplyAddValue)) = asuint(-1.0f).x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue7 = 0u;
        }
        if (int(intermediateValue7) < int(scalarValue4))
        {
            rdAccess_zLightLookupArray(intermediateValue7 + productValue) = asuint(-1.0f).x;
#endif
        }
    }
}
[numthreads(4, 4, 4)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
