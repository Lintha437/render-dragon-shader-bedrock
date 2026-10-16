// RTXStub / ReprojectSpecularOnly / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 38
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    if ((localThreadId.x < 5u) && (localThreadId.y < 5u))
    {
        uint bitwiseValue = uint(min(max(float(uint(float(((workgroupId.x << 2u) & 1073741820u) + localThreadId.x) * viewCbConstants[88u].x)), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x));
        uint bitwiseValue1 = uint(min(max(float(uint(float(((workgroupId.y << 2u) & 1073741820u) + localThreadId.y) * viewCbConstants[88u].x)), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x));
        intermediateValue[localThreadId.x + (localThreadId.y * 5u)] = uint4(inputAdaptiveDenoiserPlaneIdentifier.Load(int3(uint2(bitwiseValue, bitwiseValue1), 0u))).x;
        float4 loadedBufferValue = inputAdaptiveDenoiserGradients[0u].Load(int3(uint2(bitwiseValue, bitwiseValue1), 0u));
        float scalarValue = loadedBufferValue.y;
        float nonlinearValue = min(abs(sqrt(max(scalarValue + loadedBufferValue.x, 9.9999997473787516355514526367188e-05f)) - sqrt(scalarValue)) * 10.0f, 1.0f);
        intermediateValue1[localThreadId.x + (localThreadId.y * 5u)] = max(1.0f / ((nonlinearValue * nonlinearValue) + 9.9999997473787516355514526367188e-05f), 1.0f);
    }
    GroupMemoryBarrierWithGroupSync();
    float4 loadedBufferValue1 = inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
    float scalarValue1 = loadedBufferValue1.x;
    uint reinterpretedBits = ((asuint(rootConstantsConstants[0u]).x >> 16u) & 255u) + 0u;
    if (scalarValue1 == 65504.0f)
    {
        outputBufferHistoryLength[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0039215688593685626983642578125f.xxxx;
        outputBufferSpecularMoments[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
        denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
        outputBufferReflectionDistance[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.x;
    }
    else
    {
        uint4 reinterpretedBits1 = asuint(viewCbConstants[91u]);
        uint scalarValue2 = reinterpretedBits1.y;
        bool comparisonValue = scalarValue2 == 2u;
        uint intermediateValue6;
        if (comparisonValue)
        {
            intermediateValue6 = dispatchThreadId.x;
        }
        else
        {
            uint productValue = uint(viewCbConstants[78u].x * 0.5f);
            uint reinterpretedBits2 = (((scalarValue2 == 0u) ? asuint(viewCbConstants[84u]).z : 0u) + dispatchThreadId.y) & 1u;
            uint branchMergedValue15;
            if (dispatchThreadId.x < productValue)
            {
                branchMergedValue15 = ((dispatchThreadId.x << 1u) | 1u) - reinterpretedBits2;
            }
            else
            {
                branchMergedValue15 = reinterpretedBits2 | ((dispatchThreadId.x - productValue) << 1u);
            }
            intermediateValue6 = branchMergedValue15;
        }
        float sumValue = float(intermediateValue6) + 0.5f;
        float sumValue1 = float(dispatchThreadId.y) + 0.5f;
        float productValue1 = sumValue1 * 2.0f;
        uint intermediateValue7;
        if (comparisonValue)
        {
            intermediateValue7 = 0u;
        }
        else
        {
            intermediateValue7 = uint(inputPrimaryThroughput.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).w == 0.0f);
        }
        bool comparisonValue1 = intermediateValue7 == 0u;
        uint intermediateValue10;
        uint intermediateValue11;
        uint intermediateValue12;
        uint intermediateValue13;
        if (comparisonValue1)
        {
            uint branchMergedValue16;
            uint branchMergedValue22;
            uint branchMergedValue23;
            uint branchMergedValue24;
            if (comparisonValue)
            {
                branchMergedValue16 = dispatchThreadId.x;
                branchMergedValue22 = 0u;
                branchMergedValue23 = uint(int(viewCbConstants[78u].x));
                branchMergedValue24 = uint(int(viewCbConstants[78u].y));
            }
            else
            {
                uint scalarValue3 = uint(viewCbConstants[80u].x);
                uint scalarValue4 = uint(viewCbConstants[78u].y);
                uint branchMergedValue44;
                uint branchMergedValue46;
                uint branchMergedValue47;
                uint branchMergedValue48;
                if (dispatchThreadId.x < scalarValue3)
                {
                    branchMergedValue44 = dispatchThreadId.x;
                    branchMergedValue46 = 0u;
                    branchMergedValue47 = scalarValue3;
                    branchMergedValue48 = scalarValue4;
                }
                else
                {
                    branchMergedValue44 = dispatchThreadId.x;
                    branchMergedValue46 = scalarValue3;
                    branchMergedValue47 = uint(viewCbConstants[78u].x);
                    branchMergedValue48 = scalarValue4;
                }
                branchMergedValue16 = branchMergedValue44;
                branchMergedValue22 = branchMergedValue46;
                branchMergedValue23 = branchMergedValue47;
                branchMergedValue24 = branchMergedValue48;
            }
            intermediateValue10 = branchMergedValue16;
            intermediateValue11 = branchMergedValue22;
            intermediateValue12 = branchMergedValue23;
            intermediateValue13 = branchMergedValue24;
        }
        else
        {
            intermediateValue10 = intermediateValue6;
            intermediateValue11 = 0u;
            intermediateValue12 = uint(int(viewCbConstants[78u].x));
            intermediateValue13 = uint(int(viewCbConstants[78u].y));
        }
        float sumValue2 = float(intermediateValue10) + 0.5f;
        float sumValue3 = float(int(intermediateValue12 - intermediateValue11));
        float scalarValue5 = float(int(intermediateValue13));
        float4 loadedBufferValue2 = inputBufferMotionVectors.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue6 = loadedBufferValue2.x;
        float scalarValue7 = loadedBufferValue2.y;
        float productValue2 = scalarValue6 * sumValue3;
        float productValue3 = scalarValue7 * scalarValue5;
        float sumValue4 = (viewCbConstants[81u].z - viewCbConstants[82u].x) + sumValue2;
        float sumValue5 = sumValue4 + productValue2;
        float sumValue6 = (viewCbConstants[81u].w - viewCbConstants[82u].y) + sumValue1;
        float sumValue7 = sumValue6 + productValue3;
        float4 loadedBufferValue3 = inputBufferReprojectedPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue8 = loadedBufferValue3.x;
        float4 loadedBufferValue4 = inputGeometryNormal.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue9 = loadedBufferValue4.x;
        float scalarValue10 = loadedBufferValue4.y;
        float sumValue8 = 1.0f - abs(scalarValue9);
        float scalarValue11 = abs(scalarValue10);
        float sumValue9 = sumValue8 - scalarValue11;
        bool conditionValue = sumValue9 < 0.0f;
        float comparisonValue2 = conditionValue ? ((1.0f - scalarValue11) * ((scalarValue9 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue9;
        float comparisonValue3 = conditionValue ? (((scalarValue10 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue8) : scalarValue10;
        float inverseLengthValue = rsqrt(dot(float3(comparisonValue2, comparisonValue3, sumValue9), float3(comparisonValue2, comparisonValue3, sumValue9)));
        float productValue4 = comparisonValue2 * inverseLengthValue;
        float productValue5 = comparisonValue3 * inverseLengthValue;
        float productValue6 = inverseLengthValue * sumValue9;
        float4 loadedBufferValue5 = inputBufferNormal.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue12 = loadedBufferValue5.x;
        float scalarValue13 = loadedBufferValue5.y;
        float sumValue10 = 1.0f - abs(scalarValue12);
        float scalarValue14 = abs(scalarValue13);
        float sumValue11 = sumValue10 - scalarValue14;
        bool conditionValue1 = sumValue11 < 0.0f;
        float comparisonValue4 = conditionValue1 ? ((1.0f - scalarValue14) * ((scalarValue12 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue12;
        float comparisonValue5 = conditionValue1 ? (((scalarValue13 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue10) : scalarValue13;
        float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue4, comparisonValue5, sumValue11), float3(comparisonValue4, comparisonValue5, sumValue11)));
        float productValue7 = comparisonValue4 * inverseLengthValue1;
        float productValue8 = comparisonValue5 * inverseLengthValue1;
        float productValue9 = inverseLengthValue1 * sumValue11;
        float productValue10 = ((scalarValue6 + (sumValue * viewCbConstants[78u].z)) * 2.0f) + (-1.0f);
        float productValue11 = (1.0f - (viewCbConstants[78u].w * productValue1)) - (scalarValue7 * 2.0f);
        float multiplyAddValue = mad(0.5f, viewCbConstants[34u].w, mad(productValue11, viewCbConstants[33u].w, viewCbConstants[32u].w * productValue10)) + viewCbConstants[35u].w;
        float multiplyAddValue1 = ((mad(0.5f, viewCbConstants[34u].x, mad(productValue11, viewCbConstants[33u].x, viewCbConstants[32u].x * productValue10)) + viewCbConstants[35u].x) / multiplyAddValue) - viewCbConstants[73u].x;
        float multiplyAddValue2 = ((mad(0.5f, viewCbConstants[34u].y, mad(productValue11, viewCbConstants[33u].y, viewCbConstants[32u].y * productValue10)) + viewCbConstants[35u].y) / multiplyAddValue) - viewCbConstants[73u].y;
        float multiplyAddValue3 = ((mad(0.5f, viewCbConstants[34u].z, mad(productValue11, viewCbConstants[33u].z, viewCbConstants[32u].z * productValue10)) + viewCbConstants[35u].z) / multiplyAddValue) - viewCbConstants[73u].z;
        float inverseLengthValue2 = rsqrt(dot(float3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3), float3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3)));
        float multiplyAddValue4 = dot(float3(mad(multiplyAddValue1 * inverseLengthValue2, scalarValue8, viewCbConstants[73u].x), mad(multiplyAddValue2 * inverseLengthValue2, scalarValue8, viewCbConstants[73u].y), mad(multiplyAddValue3 * inverseLengthValue2, scalarValue8, viewCbConstants[73u].z)), float3(productValue4, productValue5, productValue6));
        float multiplyAddValue5 = mad(scalarValue8, 0.004999999888241291046142578125f, 0.02500000037252902984619140625f);
        float sumValue12 = sumValue5 + (-0.5f);
        float sumValue13 = sumValue7 + (-0.5f);
        uint scalarValue15 = uint(int(floor(sumValue12)));
        uint scalarValue16 = uint(int(floor(sumValue13)));
        float scalarValue17 = frac(sumValue12);
        float scalarValue18 = frac(sumValue13);
        float sumValue14;
        uint intermediateValue32;
        uint intermediateValue33;
        float intermediateValue2[4];
        float scalarValue19 = 0.0f;
        uint scalarValue20 = 0u;
        uint bitwiseValue3;
        uint sumValue16;
        uint sumValue17;
        float comparisonValue6;
        uint reinterpretedBits3;
        bool comparisonValue7;
        for (;;)
        {
            uint bitwiseValue2 = scalarValue20 & 1u;
            bitwiseValue3 = scalarValue20 >> 1u;
            uint bitwiseValue4 = bitwiseValue3 & 1u;
            sumValue16 = bitwiseValue2 + scalarValue15;
            sumValue17 = bitwiseValue4 + scalarValue16;
            float sumValue15 = 1.0f - scalarValue17;
            float sumValue18 = 1.0f - scalarValue18;
            comparisonValue6 = (((int(sumValue16) < int(intermediateValue11)) || (int(sumValue17) < int(0u))) || ((int(sumValue16) >= int(intermediateValue12)) || (int(sumValue17) >= int(intermediateValue13)))) ? 0.0f : (((float(int(bitwiseValue4)) * (scalarValue18 - sumValue18)) + sumValue18) * ((float(int(bitwiseValue2)) * (scalarValue17 - sumValue15)) + sumValue15));
            reinterpretedBits3 = asuint(viewCbConstants[91u]).y;
            comparisonValue7 = reinterpretedBits3 == 2u;
            uint branchMergedValue;
            uint branchMergedValue3;
            if (comparisonValue1)
            {
                uint branchMergedValue40;
                uint branchMergedValue42;
                if (comparisonValue7)
                {
                    branchMergedValue40 = sumValue16;
                    branchMergedValue42 = sumValue16;
                }
                else
                {
                    uint productValue12 = uint(viewCbConstants[78u].x * 0.5f);
                    uint reinterpretedBits4 = (((reinterpretedBits3 == 0u) ? (asuint(viewCbConstants[84u]).z + 1u) : 0u) + sumValue17) & 1u;
                    uint branchMergedValue50;
                    uint branchMergedValue51;
                    if (sumValue16 < productValue12)
                    {
                        branchMergedValue50 = sumValue16;
                        branchMergedValue51 = ((sumValue16 << 1u) | 1u) - reinterpretedBits4;
                    }
                    else
                    {
                        branchMergedValue50 = sumValue16;
                        branchMergedValue51 = reinterpretedBits4 | ((sumValue16 - productValue12) << 1u);
                    }
                    branchMergedValue40 = branchMergedValue50;
                    branchMergedValue42 = branchMergedValue51;
                }
                branchMergedValue = branchMergedValue40;
                branchMergedValue3 = branchMergedValue42;
            }
            else
            {
                uint branchMergedValue41;
                uint branchMergedValue43;
                if (comparisonValue7)
                {
                    branchMergedValue41 = sumValue16;
                    branchMergedValue43 = sumValue16;
                }
                else
                {
                    branchMergedValue41 = ((((((bitwiseValue3 + scalarValue16) ^ (scalarValue20 + scalarValue15)) & 1u) != 0u) != (((asuint(viewCbConstants[84u]).z & 1u) | reinterpretedBits3) != 0u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue16 >> 1u);
                    branchMergedValue43 = sumValue16;
                }
                branchMergedValue = branchMergedValue41;
                branchMergedValue3 = branchMergedValue43;
            }
            intermediateValue32 = branchMergedValue;
            intermediateValue33 = branchMergedValue3;
            float scalarValue21 = float(sumValue17);
            uint productValue13 = uint(min(max(float(uint(viewCbConstants[88u].x * float(intermediateValue32))), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x));
            uint productValue14 = uint(min(max(float(uint(viewCbConstants[88u].x * scalarValue21)), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x));
            float4 loadedBufferValue6 = previousPrimaryNormalBuffer.Load(int3(uint2(productValue13, productValue14), 0u));
            float scalarValue22 = loadedBufferValue6.x;
            float scalarValue23 = loadedBufferValue6.y;
            float sumValue19 = 1.0f - abs(scalarValue22);
            float scalarValue24 = abs(scalarValue23);
            float sumValue20 = sumValue19 - scalarValue24;
            bool conditionValue2 = sumValue20 < 0.0f;
            float comparisonValue8 = conditionValue2 ? ((1.0f - scalarValue24) * ((scalarValue22 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue22;
            float comparisonValue9 = conditionValue2 ? (((scalarValue23 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue19) : scalarValue23;
            float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue8, comparisonValue9, sumValue20), float3(comparisonValue8, comparisonValue9, sumValue20)));
            float4 loadedBufferValue7 = previousPrimaryPathLengthBuffer.Load(int3(uint2(productValue13, productValue14), 0u));
            float scalarValue25 = loadedBufferValue7.x;
            float productValue15 = (((float(intermediateValue33) + 0.5f) * 2.0f) * viewCbConstants[78u].z) + (-1.0f);
            float productValue16 = 1.0f - (((scalarValue21 + 0.5f) * 2.0f) * viewCbConstants[78u].w);
            float multiplyAddValue6 = mad(0.5f, viewCbConstants[34u].w, mad(productValue16, viewCbConstants[33u].w, viewCbConstants[32u].w * productValue15)) + viewCbConstants[35u].w;
            float multiplyAddValue7 = ((mad(0.5f, viewCbConstants[34u].x, mad(productValue16, viewCbConstants[33u].x, viewCbConstants[32u].x * productValue15)) + viewCbConstants[35u].x) / multiplyAddValue6) - viewCbConstants[73u].x;
            float multiplyAddValue8 = ((mad(0.5f, viewCbConstants[34u].y, mad(productValue16, viewCbConstants[33u].y, viewCbConstants[32u].y * productValue15)) + viewCbConstants[35u].y) / multiplyAddValue6) - viewCbConstants[73u].y;
            float multiplyAddValue9 = ((mad(0.5f, viewCbConstants[34u].z, mad(productValue16, viewCbConstants[33u].z, viewCbConstants[32u].z * productValue15)) + viewCbConstants[35u].z) / multiplyAddValue6) - viewCbConstants[73u].z;
            float inverseLengthValue4 = rsqrt(dot(float3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9), float3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9)));
            float multiplyAddValue10 = (abs(multiplyAddValue4 - dot(float3(mad(multiplyAddValue7 * inverseLengthValue4, scalarValue25, viewCbConstants[73u].x), mad(multiplyAddValue8 * inverseLengthValue4, scalarValue25, viewCbConstants[73u].y), mad(multiplyAddValue9 * inverseLengthValue4, scalarValue25, viewCbConstants[73u].z)), float3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0f : (clamp(mad(dot(float3(comparisonValue8 * inverseLengthValue3, comparisonValue9 * inverseLengthValue3, inverseLengthValue3 * sumValue20), float3(productValue7, productValue8, productValue9)), 3.759398937225341796875f, -2.2556393146514892578125f), 0.0f, 1.0f) * comparisonValue6);
            intermediateValue2[scalarValue20] = multiplyAddValue10;
            sumValue14 = multiplyAddValue10 + scalarValue19;
            uint sumValue21 = scalarValue20 + 1u;
            if (sumValue21 == 4u)
            {
                break;
            }
            else
            {
                scalarValue19 = sumValue14;
                scalarValue20 = sumValue21;
                continue;
            }
        }
        bool reinterpretedBits5 = (asuint(rootConstantsConstants[0u]).x & 2u) != 0u;
        float quotientValue = 1.0f / sumValue14;
        float intermediateValue40;
        float intermediateValue41;
        float intermediateValue42;
        float intermediateValue43;
        float intermediateValue44;
        float intermediateValue45;
        float intermediateValue46;
        uint intermediateValue47;
        if (sumValue14 > 0.0f)
        {
            float intermediateValue54;
            float intermediateValue56;
            float intermediateValue58;
            float intermediateValue60;
            float intermediateValue62;
            float intermediateValue64;
            float intermediateValue66;
            float scalarValue26 = 0.0f;
            float scalarValue27 = 0.0f;
            float scalarValue28 = 0.0f;
            float scalarValue29 = 0.0f;
            float scalarValue30 = 0.0f;
            float scalarValue31 = 0.0f;
            float scalarValue32 = 0.0f;
            uint scalarValue33 = 0u;
            float intermediateValue68;
            bool comparisonValue12;
            for (;;)
            {
                intermediateValue68 = intermediateValue2[scalarValue33];
                comparisonValue12 = intermediateValue68 != 0.0f;
                float branchMergedValue1;
                float branchMergedValue4;
                float branchMergedValue5;
                float branchMergedValue6;
                float branchMergedValue7;
                float branchMergedValue8;
                float branchMergedValue9;
                if (comparisonValue12)
                {
                    uint bitwiseValue5 = scalarValue33 >> 1u;
                    uint bitwiseValue6 = (scalarValue33 & 1u) + scalarValue15;
                    uint intermediateValue95;
                    if (comparisonValue1)
                    {
                        intermediateValue95 = bitwiseValue6;
                    }
                    else
                    {
                        uint4 reinterpretedBits7 = asuint(viewCbConstants[91u]);
                        uint scalarValue34 = reinterpretedBits7.y;
                        uint branchMergedValue19;
                        if (scalarValue34 == 2u)
                        {
                            branchMergedValue19 = bitwiseValue6;
                        }
                        else
                        {
                            branchMergedValue19 = ((((((bitwiseValue5 + scalarValue16) ^ (scalarValue33 + scalarValue15)) & 1u) != 0u) != (((asuint(viewCbConstants[84u]).z & 1u) | scalarValue34) != 0u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (bitwiseValue6 >> 1u);
                        }
                        intermediateValue95 = branchMergedValue19;
                    }
                    uint productValue17 = uint(min(max(float(uint(viewCbConstants[88u].x * float(intermediateValue95))), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x));
                    uint bitwiseValue7 = uint(min(max(float(uint(viewCbConstants[88u].x * float((bitwiseValue5 & 1u) + scalarValue16))), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x));
                    float4 loadedBufferValue8 = previousSpecularBuffer.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                    float productValue33;
                    float productValue34;
                    if (reinterpretedBits5)
                    {
                        float4 loadedBufferValue9 = inputFinalSpecularMoments.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                        productValue33 = (loadedBufferValue9.x * intermediateValue68) + scalarValue29;
                        productValue34 = (loadedBufferValue9.y * intermediateValue68) + scalarValue30;
                    }
                    else
                    {
                        productValue33 = scalarValue29;
                        productValue34 = scalarValue30;
                    }
                    float4 loadedBufferValue10 = previousHistoryLengthBuffer.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                    float productValue18 = intermediateValue68 * 255.0f;
                    branchMergedValue1 = (loadedBufferValue10.y * productValue18) + scalarValue32;
                    branchMergedValue4 = (loadedBufferValue10.x * productValue18) + scalarValue31;
                    branchMergedValue5 = productValue34;
                    branchMergedValue6 = (loadedBufferValue8.z * intermediateValue68) + scalarValue28;
                    branchMergedValue7 = (loadedBufferValue8.y * intermediateValue68) + scalarValue27;
                    branchMergedValue8 = (loadedBufferValue8.x * intermediateValue68) + scalarValue26;
                    branchMergedValue9 = productValue33;
                }
                else
                {
                    branchMergedValue1 = scalarValue32;
                    branchMergedValue4 = scalarValue31;
                    branchMergedValue5 = scalarValue30;
                    branchMergedValue6 = scalarValue28;
                    branchMergedValue7 = scalarValue27;
                    branchMergedValue8 = scalarValue26;
                    branchMergedValue9 = scalarValue29;
                }
                intermediateValue66 = branchMergedValue1;
                intermediateValue64 = branchMergedValue4;
                intermediateValue62 = branchMergedValue5;
                intermediateValue58 = branchMergedValue6;
                intermediateValue56 = branchMergedValue7;
                intermediateValue54 = branchMergedValue8;
                intermediateValue60 = branchMergedValue9;
                uint sumValue22 = scalarValue33 + 1u;
                if (sumValue22 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue26 = intermediateValue54;
                    scalarValue27 = intermediateValue56;
                    scalarValue28 = intermediateValue58;
                    scalarValue29 = intermediateValue60;
                    scalarValue30 = intermediateValue62;
                    scalarValue31 = intermediateValue64;
                    scalarValue32 = intermediateValue66;
                    scalarValue33 = sumValue22;
                    continue;
                }
            }
            float productValue19 = intermediateValue54 * quotientValue;
            float productValue20 = intermediateValue56 * quotientValue;
            float productValue21 = intermediateValue58 * quotientValue;
            float productValue22 = intermediateValue60 * quotientValue;
            float productValue23 = intermediateValue62 * quotientValue;
            float productValue24 = intermediateValue64 * quotientValue;
            float productValue25 = intermediateValue66 * quotientValue;
            bool reinterpretedBits8 = asuint(viewCbConstants[53u]).w != 0u;
            float comparisonValue10 = reinterpretedBits8 ? (productValue24 + 1.0f) : productValue24;
            float comparisonValue11 = reinterpretedBits8 ? (productValue25 + 1.0f) : productValue25;
            float branchMergedValue17;
            uint branchMergedValue25;
            float branchMergedValue26;
            float branchMergedValue27;
            float branchMergedValue28;
            float branchMergedValue29;
            float branchMergedValue30;
            float branchMergedValue31;
            if (asuint(viewCbConstants[87u]).w == 0u)
            {
                branchMergedValue17 = comparisonValue11;
                branchMergedValue25 = 0u;
                branchMergedValue26 = productValue19;
                branchMergedValue27 = productValue20;
                branchMergedValue28 = productValue21;
                branchMergedValue29 = productValue22;
                branchMergedValue30 = productValue23;
                branchMergedValue31 = comparisonValue10;
            }
            else
            {
                uint4 loadedBufferValue11 = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
                uint scalarValue35 = loadedBufferValue11.x;
                uint bitwiseValue9 = localThreadId.x >> 2u;
                uint bitwiseValue10 = localThreadId.y >> 2u;
                uint productValue26 = intermediateValue[bitwiseValue9 + (bitwiseValue10 * 5u)] - scalarValue35;
                float productValue49;
                if (int(uint(abs(int(productValue26)))) < int(200u))
                {
                    productValue49 = min(viewCbConstants[98u].z, intermediateValue1[bitwiseValue9 + (bitwiseValue10 * 5u)]);
                }
                else
                {
                    productValue49 = viewCbConstants[98u].z;
                }
                uint sumValue23 = bitwiseValue10 + 1u;
                uint productValue27 = intermediateValue[bitwiseValue9 + (sumValue23 * 5u)] - scalarValue35;
                float productValue56;
                if (int(uint(abs(int(productValue27)))) < int(200u))
                {
                    productValue56 = min(productValue49, intermediateValue1[bitwiseValue9 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue56 = productValue49;
                }
                uint sumValue24 = bitwiseValue9 + 1u;
                uint productValue28 = intermediateValue[sumValue24 + (bitwiseValue10 * 5u)] - scalarValue35;
                float productValue58;
                if (int(uint(abs(int(productValue28)))) < int(200u))
                {
                    productValue58 = min(productValue56, intermediateValue1[sumValue24 + (bitwiseValue10 * 5u)]);
                }
                else
                {
                    productValue58 = productValue56;
                }
                uint productValue29 = intermediateValue[sumValue24 + (sumValue23 * 5u)] - scalarValue35;
                float productValue60;
                if (int(uint(abs(int(productValue29)))) < int(200u))
                {
                    productValue60 = min(productValue58, intermediateValue1[sumValue24 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue60 = productValue58;
                }
                branchMergedValue17 = min(comparisonValue11, productValue60);
                branchMergedValue25 = 0u;
                branchMergedValue26 = productValue19;
                branchMergedValue27 = productValue20;
                branchMergedValue28 = productValue21;
                branchMergedValue29 = productValue22;
                branchMergedValue30 = productValue23;
                branchMergedValue31 = min(comparisonValue10, productValue60);
            }
            intermediateValue40 = branchMergedValue26;
            intermediateValue41 = branchMergedValue27;
            intermediateValue42 = branchMergedValue28;
            intermediateValue43 = branchMergedValue29;
            intermediateValue44 = branchMergedValue30;
            intermediateValue45 = branchMergedValue31;
            intermediateValue46 = branchMergedValue17;
            intermediateValue47 = branchMergedValue25;
        }
        else
        {
            intermediateValue40 = 0.0f;
            intermediateValue41 = 0.0f;
            intermediateValue42 = 0.0f;
            intermediateValue43 = 0.0f;
            intermediateValue44 = 0.0f;
            intermediateValue45 = 1.0f;
            intermediateValue46 = 1.0f;
            intermediateValue47 = 1u;
        }
        float productValue30 = viewCbConstants[78u].z * sumValue5;
        float productValue31 = viewCbConstants[78u].w * sumValue7;
        float productValue32 = viewCbConstants[78u].z * (sumValue5 - sumValue2);
        float productValue36 = viewCbConstants[78u].w * (sumValue7 - sumValue1);
        float4 vectorValue = outputBufferIndirectSpecular[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue36 = vectorValue.x;
        float4 loadedBufferValue12 = inputEmissiveAndLinearRoughness.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue37 = loadedBufferValue12.w;
        float4 vectorValue1 = outputBufferReflectionDistance[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue38 = vectorValue1.x;
        float sumValue25 = scalarValue38 + scalarValue1;
        float productValue37 = ((sumValue * 2.0f) * viewCbConstants[78u].z) + (-1.0f);
        float productValue38 = 1.0f - (viewCbConstants[78u].w * productValue1);
        float multiplyAddValue11 = mad(0.5f, viewCbConstants[22u].w, mad(productValue38, viewCbConstants[21u].w, viewCbConstants[20u].w * productValue37)) + viewCbConstants[23u].w;
        float multiplyAddValue12 = ((mad(0.5f, viewCbConstants[22u].x, mad(productValue38, viewCbConstants[21u].x, viewCbConstants[20u].x * productValue37)) + viewCbConstants[23u].x) / multiplyAddValue11) - viewCbConstants[72u].x;
        float multiplyAddValue13 = ((mad(0.5f, viewCbConstants[22u].y, mad(productValue38, viewCbConstants[21u].y, viewCbConstants[20u].y * productValue37)) + viewCbConstants[23u].y) / multiplyAddValue11) - viewCbConstants[72u].y;
        float multiplyAddValue14 = ((mad(0.5f, viewCbConstants[22u].z, mad(productValue38, viewCbConstants[21u].z, viewCbConstants[20u].z * productValue37)) + viewCbConstants[23u].z) / multiplyAddValue11) - viewCbConstants[72u].z;
        float inverseLengthValue5 = rsqrt(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14))) * sumValue25;
        float productValue39 = ((inverseLengthValue5 * multiplyAddValue12) - viewCbConstants[71u].x) + viewCbConstants[72u].x;
        float productValue40 = ((inverseLengthValue5 * multiplyAddValue13) - viewCbConstants[71u].y) + viewCbConstants[72u].y;
        float productValue41 = ((inverseLengthValue5 * multiplyAddValue14) - viewCbConstants[71u].z) + viewCbConstants[72u].z;
        float multiplyAddValue15 = mad(productValue41, viewCbConstants[26u].w, mad(productValue40, viewCbConstants[25u].w, productValue39 * viewCbConstants[24u].w)) + viewCbConstants[27u].w;
        float multiplyAddValue16 = (sumValue3 * 0.5f) * (((mad(productValue41, viewCbConstants[26u].x, mad(productValue40, viewCbConstants[25u].x, productValue39 * viewCbConstants[24u].x)) + viewCbConstants[27u].x) / multiplyAddValue15) - productValue37);
        float multiplyAddValue17 = (scalarValue5 * (-0.5f)) * (((mad(productValue41, viewCbConstants[26u].y, mad(productValue40, viewCbConstants[25u].y, productValue39 * viewCbConstants[24u].y)) + viewCbConstants[27u].y) / multiplyAddValue15) - productValue38);
        float sumValue26 = multiplyAddValue16 - productValue2;
        float sumValue27 = multiplyAddValue17 - productValue3;
        float nonlinearValue1 = max(sqrt((sumValue27 * sumValue27) + (sumValue26 * sumValue26)) + (-0.100000001490116119384765625f), 0.0f);
        float productValue42 = nonlinearValue1 * 0.02500000037252902984619140625f;
        float quotientValue1 = max(((scalarValue37 * scalarValue37) * scalarValue38) / sumValue25, scalarValue37 * 0.5f);
        float quotientValue2 = max(max(viewCbConstants[88u].w, 1.0f / intermediateValue46), min(productValue42, 1.0f) * 0.25f);
        float productValue43 = min(((1.0f - quotientValue1) * (1.0f - productValue42)) + productValue42, 1.0f);
        float intermediateValue73;
        float intermediateValue74;
        float intermediateValue75;
        float intermediateValue76;
        float intermediateValue77;
        float intermediateValue78;
        float intermediateValue80;
        if ((sumValue14 != 0.0f) && (productValue43 > 0.0f))
        {
            float sumValue28 = (multiplyAddValue16 + sumValue4) + (-0.5f);
            float sumValue31 = (multiplyAddValue17 + sumValue6) + (-0.5f);
            uint scalarValue39 = uint(int(floor(sumValue28)));
            uint scalarValue40 = uint(int(floor(sumValue31)));
            float scalarValue41 = frac(sumValue28);
            float scalarValue42 = frac(sumValue31);
            float nonlinearValue2 = log2(max(scalarValue38, 0.00999999977648258209228515625f));
            float intermediateValue79;
            float intermediateValue84;
            float intermediateValue86;
            float intermediateValue88;
            float intermediateValue90;
            float intermediateValue92;
            float scalarValue43 = 0.0f;
            uint scalarValue44 = 0u;
            float scalarValue45 = 0.0f;
            float scalarValue46 = 0.0f;
            float scalarValue47 = 0.0f;
            float scalarValue48 = 0.0f;
            float scalarValue49 = 0.0f;
            uint bitwiseValue8;
            uint sumValue29;
            uint sumValue30;
            float productValue35;
            uint reinterpretedBits6;
            bool comparisonValue13;
            for (;;)
            {
                uint bitwiseValue11 = scalarValue44 & 1u;
                bitwiseValue8 = scalarValue44 >> 1u;
                uint bitwiseValue12 = bitwiseValue8 & 1u;
                sumValue29 = bitwiseValue11 + scalarValue39;
                sumValue30 = bitwiseValue12 + scalarValue40;
                float sumValue32 = 1.0f - scalarValue41;
                float sumValue33 = 1.0f - scalarValue42;
                productValue35 = ((float(int(bitwiseValue12)) * (scalarValue42 - sumValue33)) + sumValue33) * ((float(int(bitwiseValue11)) * (scalarValue41 - sumValue32)) + sumValue32);
                reinterpretedBits6 = asuint(viewCbConstants[91u]).y;
                comparisonValue13 = reinterpretedBits6 == 2u;
                uint intermediateValue99;
                uint intermediateValue100;
                if (comparisonValue1)
                {
                    uint branchMergedValue20;
                    uint branchMergedValue38;
                    if (comparisonValue13)
                    {
                        branchMergedValue20 = sumValue29;
                        branchMergedValue38 = sumValue29;
                    }
                    else
                    {
                        uint productValue44 = uint(viewCbConstants[78u].x * 0.5f);
                        uint reinterpretedBits9 = (((reinterpretedBits6 == 0u) ? (asuint(viewCbConstants[84u]).z + 1u) : 0u) + sumValue30) & 1u;
                        uint branchMergedValue45;
                        uint branchMergedValue49;
                        if (sumValue29 < productValue44)
                        {
                            branchMergedValue45 = ((sumValue29 << 1u) | 1u) - reinterpretedBits9;
                            branchMergedValue49 = sumValue29;
                        }
                        else
                        {
                            branchMergedValue45 = reinterpretedBits9 | ((sumValue29 - productValue44) << 1u);
                            branchMergedValue49 = sumValue29;
                        }
                        branchMergedValue20 = branchMergedValue45;
                        branchMergedValue38 = branchMergedValue49;
                    }
                    intermediateValue99 = branchMergedValue38;
                    intermediateValue100 = branchMergedValue20;
                }
                else
                {
                    uint branchMergedValue21;
                    uint branchMergedValue39;
                    if (comparisonValue13)
                    {
                        branchMergedValue21 = sumValue29;
                        branchMergedValue39 = sumValue29;
                    }
                    else
                    {
                        branchMergedValue21 = sumValue29;
                        branchMergedValue39 = ((((((bitwiseValue8 + scalarValue40) ^ (scalarValue44 + scalarValue39)) & 1u) != 0u) != (((asuint(viewCbConstants[84u]).z & 1u) | reinterpretedBits6) != 0u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue29 >> 1u);
                    }
                    intermediateValue99 = branchMergedValue39;
                    intermediateValue100 = branchMergedValue21;
                }
                float branchMergedValue2;
                float branchMergedValue10;
                float branchMergedValue11;
                float branchMergedValue12;
                float branchMergedValue13;
                float branchMergedValue14;
                if (((int(sumValue30) < int(0u)) || (int(intermediateValue99) < int(intermediateValue11))) || ((int(sumValue30) >= int(intermediateValue13)) || (int(intermediateValue99) >= int(intermediateValue12))))
                {
                    branchMergedValue2 = scalarValue48;
                    branchMergedValue10 = scalarValue47;
                    branchMergedValue11 = scalarValue46;
                    branchMergedValue12 = scalarValue45;
                    branchMergedValue13 = scalarValue43;
                    branchMergedValue14 = scalarValue49;
                }
                else
                {
                    uint productValue45 = uint(min(max(float(uint(viewCbConstants[88u].x * float(intermediateValue99))), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x));
                    uint productValue46 = uint(min(max(float(uint(viewCbConstants[88u].x * float(sumValue30))), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x));
                    float productValue47 = scalarValue37 * (-0.25f);
                    float4 loadedBufferValue13 = previousPrimaryNormalBuffer.Load(int3(uint2(productValue45, productValue46), 0u));
                    float scalarValue50 = loadedBufferValue13.x;
                    float scalarValue51 = loadedBufferValue13.y;
                    float sumValue34 = 1.0f - abs(scalarValue50);
                    float scalarValue52 = abs(scalarValue51);
                    float sumValue35 = sumValue34 - scalarValue52;
                    bool conditionValue3 = sumValue35 < 0.0f;
                    float comparisonValue14 = conditionValue3 ? ((1.0f - scalarValue52) * ((scalarValue50 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue50;
                    float comparisonValue15 = conditionValue3 ? (((scalarValue51 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue34) : scalarValue51;
                    float inverseLengthValue6 = rsqrt(dot(float3(comparisonValue14, comparisonValue15, sumValue35), float3(comparisonValue14, comparisonValue15, sumValue35)));
                    float sumValue36 = 0.050000011920928955078125f - productValue47;
                    float4 loadedBufferValue14 = previousPrimaryPathLengthBuffer.Load(int3(uint2(productValue45, productValue46), 0u));
                    float scalarValue53 = loadedBufferValue14.x;
                    float productValue48 = (((float(int(intermediateValue100)) + 0.5f) * 2.0f) * viewCbConstants[78u].z) + (-1.0f);
                    float productValue50 = 1.0f - (((float(int(sumValue30)) + 0.5f) * 2.0f) * viewCbConstants[78u].w);
                    float multiplyAddValue19 = mad(0.5f, viewCbConstants[34u].w, mad(productValue50, viewCbConstants[33u].w, viewCbConstants[32u].w * productValue48)) + viewCbConstants[35u].w;
                    float multiplyAddValue20 = ((mad(0.5f, viewCbConstants[34u].x, mad(productValue50, viewCbConstants[33u].x, viewCbConstants[32u].x * productValue48)) + viewCbConstants[35u].x) / multiplyAddValue19) - viewCbConstants[73u].x;
                    float multiplyAddValue21 = ((mad(0.5f, viewCbConstants[34u].y, mad(productValue50, viewCbConstants[33u].y, viewCbConstants[32u].y * productValue48)) + viewCbConstants[35u].y) / multiplyAddValue19) - viewCbConstants[73u].y;
                    float multiplyAddValue22 = ((mad(0.5f, viewCbConstants[34u].z, mad(productValue50, viewCbConstants[33u].z, viewCbConstants[32u].z * productValue48)) + viewCbConstants[35u].z) / multiplyAddValue19) - viewCbConstants[73u].z;
                    float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22), float3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22)));
                    float loadedBufferValue15 = clamp(mad(abs(nonlinearValue2 - log2(max(previousReflectionDistanceBuffer.Load(int3(uint2(productValue45, productValue46), 0u)).x, 0.00999999977648258209228515625f))), -2.0f, 2.0f), 0.0f, 1.0f);
                    float loadedBufferValue16 = (((1.0f - loadedBufferValue15) * scalarValue37) + loadedBufferValue15) * ((abs(multiplyAddValue4 - dot(float3(mad(multiplyAddValue20 * inverseLengthValue7, scalarValue53, viewCbConstants[73u].x), mad(multiplyAddValue21 * inverseLengthValue7, scalarValue53, viewCbConstants[73u].y), mad(multiplyAddValue22 * inverseLengthValue7, scalarValue53, viewCbConstants[73u].z)), float3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0f : ((productValue35 * clamp(mad(dot(float3(productValue7, productValue8, productValue9), float3(comparisonValue14 * inverseLengthValue6, comparisonValue15 * inverseLengthValue6, inverseLengthValue6 * sumValue35)), 1.0f / sumValue36, ((-0.0f) - (productValue47 + 0.949999988079071044921875f)) / sumValue36), 0.0f, 1.0f)) * clamp(mad(abs(scalarValue37 - previousLinearRoughnessBuffer.Load(int3(uint2(productValue45, productValue46), 0u)).x), -12.5f, 1.5f), 0.0f, 1.0f)));
                    float4 loadedBufferValue17 = previousSpecularBuffer.Load(int3(uint2(productValue45, productValue46), 0u));
                    float4 loadedBufferValue18 = inputFinalSpecularMoments.Load(int3(uint2(intermediateValue99, sumValue30), 0u));
                    branchMergedValue2 = (loadedBufferValue18.x * loadedBufferValue16) + scalarValue48;
                    branchMergedValue10 = (loadedBufferValue16 * loadedBufferValue17.z) + scalarValue47;
                    branchMergedValue11 = (loadedBufferValue16 * loadedBufferValue17.y) + scalarValue46;
                    branchMergedValue12 = (loadedBufferValue16 * loadedBufferValue17.x) + scalarValue45;
                    branchMergedValue13 = loadedBufferValue16 + scalarValue43;
                    branchMergedValue14 = (loadedBufferValue18.y * loadedBufferValue16) + scalarValue49;
                }
                intermediateValue90 = branchMergedValue2;
                intermediateValue88 = branchMergedValue10;
                intermediateValue86 = branchMergedValue11;
                intermediateValue84 = branchMergedValue12;
                intermediateValue79 = branchMergedValue13;
                intermediateValue92 = branchMergedValue14;
                uint sumValue37 = scalarValue44 + 1u;
                if (sumValue37 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue43 = intermediateValue79;
                    scalarValue44 = sumValue37;
                    scalarValue45 = intermediateValue84;
                    scalarValue46 = intermediateValue86;
                    scalarValue47 = intermediateValue88;
                    scalarValue48 = intermediateValue90;
                    scalarValue49 = intermediateValue92;
                    continue;
                }
            }
            float branchMergedValue18;
            float branchMergedValue32;
            float branchMergedValue33;
            float branchMergedValue34;
            float branchMergedValue35;
            float branchMergedValue36;
            float branchMergedValue37;
            if (intermediateValue79 > 0.00999999977648258209228515625f)
            {
                branchMergedValue18 = quotientValue2;
                branchMergedValue32 = intermediateValue79;
                branchMergedValue33 = (((intermediateValue90 / intermediateValue79) - intermediateValue43) * productValue43) + intermediateValue43;
                branchMergedValue34 = (((intermediateValue88 / intermediateValue79) - intermediateValue42) * productValue43) + intermediateValue42;
                branchMergedValue35 = (((intermediateValue86 / intermediateValue79) - intermediateValue41) * productValue43) + intermediateValue41;
                branchMergedValue36 = (((intermediateValue84 / intermediateValue79) - intermediateValue40) * productValue43) + intermediateValue40;
                branchMergedValue37 = (((intermediateValue92 / intermediateValue79) - intermediateValue44) * productValue43) + intermediateValue44;
            }
            else
            {
                branchMergedValue18 = 1.0f;
                branchMergedValue32 = intermediateValue79;
                branchMergedValue33 = intermediateValue43;
                branchMergedValue34 = intermediateValue42;
                branchMergedValue35 = intermediateValue41;
                branchMergedValue36 = intermediateValue40;
                branchMergedValue37 = intermediateValue44;
            }
            intermediateValue73 = branchMergedValue36;
            intermediateValue74 = branchMergedValue35;
            intermediateValue75 = branchMergedValue34;
            intermediateValue76 = branchMergedValue33;
            intermediateValue77 = branchMergedValue37;
            intermediateValue78 = branchMergedValue32;
            intermediateValue80 = branchMergedValue18;
        }
        else
        {
            intermediateValue73 = intermediateValue40;
            intermediateValue74 = intermediateValue41;
            intermediateValue75 = intermediateValue42;
            intermediateValue76 = intermediateValue43;
            intermediateValue77 = intermediateValue44;
            intermediateValue78 = sumValue14;
            intermediateValue80 = quotientValue2;
        }
        float intermediateValue93;
        float intermediateValue94;
        float multiplyAddValue18;
        if (reinterpretedBits5)
        {
            float dotProductValue = dot(float3(scalarValue36, vectorValue.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float comparisonValue16 = min(max(1.0f / max(intermediateValue46, 0.00999999977648258209228515625f), viewCbConstants[89u].x), (intermediateValue78 == 0.0f) ? 1.0f : 0.100000001490116119384765625f);
            float productValue51 = (comparisonValue16 * (dotProductValue - intermediateValue76)) + intermediateValue76;
            float productValue52 = (comparisonValue16 * ((dotProductValue * dotProductValue) - intermediateValue77)) + intermediateValue77;
            float exponentialValue = max(exp2((12.0f / intermediateValue46) + 1.0f) + (-10.55606365203857421875f), 0.0f);
            float comparisonValue17 = (intermediateValue47 != 0u) ? (exponentialValue + 1000000.0f) : exponentialValue;
            float productValue53 = max(0.0f, productValue52 - (productValue51 * productValue51));
            float sumValue38 = comparisonValue17 + productValue53;
            intermediateValue93 = productValue51;
            intermediateValue94 = productValue52;
            multiplyAddValue18 = ((comparisonValue17 > productValue53) ? ((-0.0f) - sumValue38) : sumValue38) * mad(productValue43, (nonlinearValue1 * 200.0f) * quotientValue1, 1.0f);
        }
        else
        {
            intermediateValue93 = 0.0f;
            intermediateValue94 = 0.0f;
            multiplyAddValue18 = 0.0f;
        }
        outputBufferSpecularMoments[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue93, intermediateValue94, intermediateValue93, intermediateValue93);
        float clampedValue = ((intermediateValue80 + (-1.0f)) * ((productValue30 < 0.5f) ? min(clamp(((productValue32 < 0.0f) ? productValue30 : (1.0f - productValue30)) / (abs(productValue32) + 9.9999997473787516355514526367188e-06f), 0.0f, 1.0f), clamp(((productValue36 < 0.0f) ? productValue31 : (1.0f - productValue31)) / (abs(productValue36) + 9.9999997473787516355514526367188e-06f), 0.0f, 1.0f)) : 1.0f)) + 1.0f;
        float intermediateValue97;
        if (asuint(viewCbConstants[91u]).y == 2u)
        {
            intermediateValue97 = 1.0f;
        }
        else
        {
            intermediateValue97 = asfloat(rdLoad_inputIncidentLight(4u).x);
        }
        float productValue54 = intermediateValue97 * intermediateValue73;
        float productValue55 = intermediateValue97 * intermediateValue74;
        float productValue57 = intermediateValue97 * intermediateValue75;
        denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(((scalarValue36 - productValue54) * clampedValue) + productValue54, ((vectorValue.y - productValue55) * clampedValue) + productValue55, ((vectorValue.z - productValue57) * clampedValue) + productValue57, multiplyAddValue18);
        float productValue59 = intermediateValue45 * 0.0039215688593685626983642578125f;
        outputBufferHistoryLength[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(productValue59, 0.0039215688593685626983642578125f / clampedValue, productValue59, productValue59);
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    workgroupId = stage_input.workgroupId;
    localThreadId = stage_input.localThreadId;
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
