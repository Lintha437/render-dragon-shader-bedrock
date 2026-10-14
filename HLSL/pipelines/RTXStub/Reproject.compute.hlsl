// RTXStub / Reproject / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 34
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
        outputBufferDiffuseMoments[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
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
            uint branchMergedValue20;
            if (dispatchThreadId.x < productValue)
            {
                branchMergedValue20 = ((dispatchThreadId.x << 1u) | 1u) - reinterpretedBits2;
            }
            else
            {
                branchMergedValue20 = reinterpretedBits2 | ((dispatchThreadId.x - productValue) << 1u);
            }
            intermediateValue6 = branchMergedValue20;
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
            uint branchMergedValue21;
            uint branchMergedValue27;
            uint branchMergedValue28;
            uint branchMergedValue29;
            if (comparisonValue)
            {
                branchMergedValue21 = dispatchThreadId.x;
                branchMergedValue27 = uint(int(viewCbConstants[78u].y));
                branchMergedValue28 = uint(int(viewCbConstants[78u].x));
                branchMergedValue29 = 0u;
            }
            else
            {
                uint scalarValue3 = uint(viewCbConstants[80u].x);
                uint scalarValue4 = uint(viewCbConstants[78u].y);
                uint branchMergedValue54;
                uint branchMergedValue56;
                uint branchMergedValue57;
                uint branchMergedValue58;
                if (dispatchThreadId.x < scalarValue3)
                {
                    branchMergedValue54 = dispatchThreadId.x;
                    branchMergedValue56 = scalarValue4;
                    branchMergedValue57 = scalarValue3;
                    branchMergedValue58 = 0u;
                }
                else
                {
                    branchMergedValue54 = dispatchThreadId.x;
                    branchMergedValue56 = scalarValue4;
                    branchMergedValue57 = uint(viewCbConstants[78u].x);
                    branchMergedValue58 = scalarValue3;
                }
                branchMergedValue21 = branchMergedValue54;
                branchMergedValue27 = branchMergedValue56;
                branchMergedValue28 = branchMergedValue57;
                branchMergedValue29 = branchMergedValue58;
            }
            intermediateValue10 = branchMergedValue21;
            intermediateValue11 = branchMergedValue29;
            intermediateValue12 = branchMergedValue28;
            intermediateValue13 = branchMergedValue27;
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
        uint4 reinterpretedBits3 = asuint(rootConstantsConstants[0u]);
        uint scalarValue15 = reinterpretedBits3.x;
        float sumValue12 = sumValue5 + (-0.5f);
        float sumValue13 = sumValue7 + (-0.5f);
        uint scalarValue16 = uint(int(floor(sumValue12)));
        uint scalarValue17 = uint(int(floor(sumValue13)));
        float scalarValue18 = frac(sumValue12);
        float scalarValue19 = frac(sumValue13);
        float sumValue14;
        uint intermediateValue33;
        uint intermediateValue34;
        float intermediateValue2[4];
        float scalarValue20 = 0.0f;
        uint scalarValue21 = 0u;
        uint bitwiseValue3;
        uint sumValue16;
        uint sumValue17;
        float comparisonValue6;
        uint reinterpretedBits4;
        bool comparisonValue7;
        for (;;)
        {
            uint bitwiseValue2 = scalarValue21 & 1u;
            bitwiseValue3 = scalarValue21 >> 1u;
            uint bitwiseValue4 = bitwiseValue3 & 1u;
            sumValue16 = bitwiseValue2 + scalarValue16;
            sumValue17 = bitwiseValue4 + scalarValue17;
            float sumValue15 = 1.0f - scalarValue18;
            float sumValue18 = 1.0f - scalarValue19;
            comparisonValue6 = (((int(sumValue16) < int(intermediateValue11)) || (int(sumValue17) < int(0u))) || ((int(sumValue16) >= int(intermediateValue12)) || (int(sumValue17) >= int(intermediateValue13)))) ? 0.0f : (((float(int(bitwiseValue4)) * (scalarValue19 - sumValue18)) + sumValue18) * ((float(int(bitwiseValue2)) * (scalarValue18 - sumValue15)) + sumValue15));
            reinterpretedBits4 = asuint(viewCbConstants[91u]).y;
            comparisonValue7 = reinterpretedBits4 == 2u;
            uint branchMergedValue;
            uint branchMergedValue3;
            if (comparisonValue1)
            {
                uint branchMergedValue50;
                uint branchMergedValue52;
                if (comparisonValue7)
                {
                    branchMergedValue50 = sumValue16;
                    branchMergedValue52 = sumValue16;
                }
                else
                {
                    uint productValue12 = uint(viewCbConstants[78u].x * 0.5f);
                    uint reinterpretedBits5 = (((reinterpretedBits4 == 0u) ? (asuint(viewCbConstants[84u]).z + 1u) : 0u) + sumValue17) & 1u;
                    uint branchMergedValue60;
                    uint branchMergedValue61;
                    if (sumValue16 < productValue12)
                    {
                        branchMergedValue60 = ((sumValue16 << 1u) | 1u) - reinterpretedBits5;
                        branchMergedValue61 = sumValue16;
                    }
                    else
                    {
                        branchMergedValue60 = reinterpretedBits5 | ((sumValue16 - productValue12) << 1u);
                        branchMergedValue61 = sumValue16;
                    }
                    branchMergedValue50 = branchMergedValue60;
                    branchMergedValue52 = branchMergedValue61;
                }
                branchMergedValue = branchMergedValue50;
                branchMergedValue3 = branchMergedValue52;
            }
            else
            {
                uint branchMergedValue51;
                uint branchMergedValue53;
                if (comparisonValue7)
                {
                    branchMergedValue51 = sumValue16;
                    branchMergedValue53 = sumValue16;
                }
                else
                {
                    branchMergedValue51 = sumValue16;
                    branchMergedValue53 = ((((((bitwiseValue3 + scalarValue17) ^ (scalarValue21 + scalarValue16)) & 1u) != 0u) != (((asuint(viewCbConstants[84u]).z & 1u) | reinterpretedBits4) != 0u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue16 >> 1u);
                }
                branchMergedValue = branchMergedValue51;
                branchMergedValue3 = branchMergedValue53;
            }
            intermediateValue34 = branchMergedValue;
            intermediateValue33 = branchMergedValue3;
            float scalarValue22 = float(sumValue17);
            uint productValue13 = uint(min(max(float(uint(viewCbConstants[88u].x * float(intermediateValue33))), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x));
            uint productValue14 = uint(min(max(float(uint(viewCbConstants[88u].x * scalarValue22)), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x));
            float4 loadedBufferValue6 = previousPrimaryNormalBuffer.Load(int3(uint2(productValue13, productValue14), 0u));
            float scalarValue23 = loadedBufferValue6.x;
            float scalarValue24 = loadedBufferValue6.y;
            float sumValue19 = 1.0f - abs(scalarValue23);
            float scalarValue25 = abs(scalarValue24);
            float sumValue20 = sumValue19 - scalarValue25;
            bool conditionValue2 = sumValue20 < 0.0f;
            float comparisonValue8 = conditionValue2 ? ((1.0f - scalarValue25) * ((scalarValue23 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue23;
            float comparisonValue9 = conditionValue2 ? (((scalarValue24 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue19) : scalarValue24;
            float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue8, comparisonValue9, sumValue20), float3(comparisonValue8, comparisonValue9, sumValue20)));
            float4 loadedBufferValue7 = previousPrimaryPathLengthBuffer.Load(int3(uint2(productValue13, productValue14), 0u));
            float scalarValue26 = loadedBufferValue7.x;
            float productValue15 = (((float(intermediateValue34) + 0.5f) * 2.0f) * viewCbConstants[78u].z) + (-1.0f);
            float productValue16 = 1.0f - (((scalarValue22 + 0.5f) * 2.0f) * viewCbConstants[78u].w);
            float multiplyAddValue6 = mad(0.5f, viewCbConstants[34u].w, mad(productValue16, viewCbConstants[33u].w, viewCbConstants[32u].w * productValue15)) + viewCbConstants[35u].w;
            float multiplyAddValue7 = ((mad(0.5f, viewCbConstants[34u].x, mad(productValue16, viewCbConstants[33u].x, viewCbConstants[32u].x * productValue15)) + viewCbConstants[35u].x) / multiplyAddValue6) - viewCbConstants[73u].x;
            float multiplyAddValue8 = ((mad(0.5f, viewCbConstants[34u].y, mad(productValue16, viewCbConstants[33u].y, viewCbConstants[32u].y * productValue15)) + viewCbConstants[35u].y) / multiplyAddValue6) - viewCbConstants[73u].y;
            float multiplyAddValue9 = ((mad(0.5f, viewCbConstants[34u].z, mad(productValue16, viewCbConstants[33u].z, viewCbConstants[32u].z * productValue15)) + viewCbConstants[35u].z) / multiplyAddValue6) - viewCbConstants[73u].z;
            float inverseLengthValue4 = rsqrt(dot(float3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9), float3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9)));
            float multiplyAddValue10 = (abs(multiplyAddValue4 - dot(float3(mad(multiplyAddValue7 * inverseLengthValue4, scalarValue26, viewCbConstants[73u].x), mad(multiplyAddValue8 * inverseLengthValue4, scalarValue26, viewCbConstants[73u].y), mad(multiplyAddValue9 * inverseLengthValue4, scalarValue26, viewCbConstants[73u].z)), float3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0f : (clamp(mad(dot(float3(comparisonValue8 * inverseLengthValue3, comparisonValue9 * inverseLengthValue3, inverseLengthValue3 * sumValue20), float3(productValue7, productValue8, productValue9)), 3.759398937225341796875f, -2.2556393146514892578125f), 0.0f, 1.0f) * comparisonValue6);
            intermediateValue2[scalarValue21] = multiplyAddValue10;
            sumValue14 = multiplyAddValue10 + scalarValue20;
            uint sumValue21 = scalarValue21 + 1u;
            if (sumValue21 == 4u)
            {
                break;
            }
            else
            {
                scalarValue20 = sumValue14;
                scalarValue21 = sumValue21;
                continue;
            }
        }
        bool comparisonValue10 = (scalarValue15 & 1u) != 0u;
        bool comparisonValue11 = (scalarValue15 & 2u) != 0u;
        float quotientValue = 1.0f / sumValue14;
        float intermediateValue41;
        float intermediateValue42;
        float intermediateValue43;
        float intermediateValue44;
        float intermediateValue45;
        float intermediateValue46;
        float intermediateValue47;
        float intermediateValue48;
        float intermediateValue49;
        float intermediateValue50;
        float intermediateValue51;
        float intermediateValue52;
        uint intermediateValue53;
        if (sumValue14 > 0.0f)
        {
            float intermediateValue57;
            float intermediateValue59;
            float intermediateValue61;
            float intermediateValue63;
            float intermediateValue65;
            float intermediateValue67;
            float intermediateValue69;
            float intermediateValue71;
            float intermediateValue73;
            float intermediateValue75;
            float intermediateValue77;
            float intermediateValue79;
            float scalarValue27 = 0.0f;
            float scalarValue28 = 0.0f;
            float scalarValue29 = 0.0f;
            float scalarValue30 = 0.0f;
            float scalarValue31 = 0.0f;
            float scalarValue32 = 0.0f;
            float scalarValue33 = 0.0f;
            float scalarValue34 = 0.0f;
            float scalarValue35 = 0.0f;
            float scalarValue36 = 0.0f;
            float scalarValue37 = 0.0f;
            float scalarValue38 = 0.0f;
            uint scalarValue39 = 0u;
            float intermediateValue81;
            bool comparisonValue14;
            for (;;)
            {
                intermediateValue81 = intermediateValue2[scalarValue39];
                comparisonValue14 = intermediateValue81 != 0.0f;
                float branchMergedValue1;
                float branchMergedValue4;
                float branchMergedValue5;
                float branchMergedValue6;
                float branchMergedValue7;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                float branchMergedValue12;
                float branchMergedValue18;
                float branchMergedValue19;
                if (comparisonValue14)
                {
                    uint bitwiseValue5 = scalarValue39 >> 1u;
                    uint bitwiseValue6 = (scalarValue39 & 1u) + scalarValue16;
                    uint intermediateValue90;
                    if (comparisonValue1)
                    {
                        intermediateValue90 = bitwiseValue6;
                    }
                    else
                    {
                        uint4 reinterpretedBits6 = asuint(viewCbConstants[91u]);
                        uint scalarValue40 = reinterpretedBits6.y;
                        uint branchMergedValue23;
                        if (scalarValue40 == 2u)
                        {
                            branchMergedValue23 = bitwiseValue6;
                        }
                        else
                        {
                            branchMergedValue23 = ((((((bitwiseValue5 + scalarValue17) ^ (scalarValue39 + scalarValue16)) & 1u) != 0u) != (((asuint(viewCbConstants[84u]).z & 1u) | scalarValue40) != 0u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (bitwiseValue6 >> 1u);
                        }
                        intermediateValue90 = branchMergedValue23;
                    }
                    uint productValue17 = uint(min(max(float(uint(viewCbConstants[88u].x * float(intermediateValue90))), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x));
                    uint bitwiseValue7 = uint(min(max(float(uint(viewCbConstants[88u].x * float((bitwiseValue5 & 1u) + scalarValue17))), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x));
                    float4 loadedBufferValue8 = previousDiffuseBuffer.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                    float4 loadedBufferValue9 = previousSpecularBuffer.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                    float productValue34;
                    float productValue35;
                    if (comparisonValue10)
                    {
                        float4 loadedBufferValue10 = inputFinalDiffuseMoments.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                        productValue34 = (loadedBufferValue10.x * intermediateValue81) + scalarValue33;
                        productValue35 = (loadedBufferValue10.y * intermediateValue81) + scalarValue34;
                    }
                    else
                    {
                        productValue34 = scalarValue33;
                        productValue35 = scalarValue34;
                    }
                    float productValue36;
                    float productValue37;
                    if (comparisonValue11)
                    {
                        float4 loadedBufferValue11 = inputFinalSpecularMoments.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                        productValue36 = (loadedBufferValue11.x * intermediateValue81) + scalarValue35;
                        productValue37 = (loadedBufferValue11.y * intermediateValue81) + scalarValue36;
                    }
                    else
                    {
                        productValue36 = scalarValue35;
                        productValue37 = scalarValue36;
                    }
                    float4 loadedBufferValue12 = previousHistoryLengthBuffer.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                    float productValue18 = intermediateValue81 * 255.0f;
                    branchMergedValue1 = (loadedBufferValue12.y * productValue18) + scalarValue38;
                    branchMergedValue4 = (loadedBufferValue12.x * productValue18) + scalarValue37;
                    branchMergedValue5 = productValue37;
                    branchMergedValue6 = productValue36;
                    branchMergedValue7 = productValue35;
                    branchMergedValue8 = productValue34;
                    branchMergedValue9 = (loadedBufferValue9.z * intermediateValue81) + scalarValue32;
                    branchMergedValue10 = (loadedBufferValue9.y * intermediateValue81) + scalarValue31;
                    branchMergedValue11 = (loadedBufferValue9.x * intermediateValue81) + scalarValue30;
                    branchMergedValue12 = (loadedBufferValue8.z * intermediateValue81) + scalarValue29;
                    branchMergedValue18 = (loadedBufferValue8.y * intermediateValue81) + scalarValue28;
                    branchMergedValue19 = (loadedBufferValue8.x * intermediateValue81) + scalarValue27;
                }
                else
                {
                    branchMergedValue1 = scalarValue38;
                    branchMergedValue4 = scalarValue37;
                    branchMergedValue5 = scalarValue36;
                    branchMergedValue6 = scalarValue35;
                    branchMergedValue7 = scalarValue34;
                    branchMergedValue8 = scalarValue33;
                    branchMergedValue9 = scalarValue32;
                    branchMergedValue10 = scalarValue31;
                    branchMergedValue11 = scalarValue30;
                    branchMergedValue12 = scalarValue29;
                    branchMergedValue18 = scalarValue28;
                    branchMergedValue19 = scalarValue27;
                }
                intermediateValue79 = branchMergedValue1;
                intermediateValue77 = branchMergedValue4;
                intermediateValue75 = branchMergedValue5;
                intermediateValue73 = branchMergedValue6;
                intermediateValue71 = branchMergedValue7;
                intermediateValue69 = branchMergedValue8;
                intermediateValue67 = branchMergedValue9;
                intermediateValue65 = branchMergedValue10;
                intermediateValue63 = branchMergedValue11;
                intermediateValue61 = branchMergedValue12;
                intermediateValue59 = branchMergedValue18;
                intermediateValue57 = branchMergedValue19;
                uint sumValue22 = scalarValue39 + 1u;
                if (sumValue22 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue27 = intermediateValue57;
                    scalarValue28 = intermediateValue59;
                    scalarValue29 = intermediateValue61;
                    scalarValue30 = intermediateValue63;
                    scalarValue31 = intermediateValue65;
                    scalarValue32 = intermediateValue67;
                    scalarValue33 = intermediateValue69;
                    scalarValue34 = intermediateValue71;
                    scalarValue35 = intermediateValue73;
                    scalarValue36 = intermediateValue75;
                    scalarValue37 = intermediateValue77;
                    scalarValue38 = intermediateValue79;
                    scalarValue39 = sumValue22;
                    continue;
                }
            }
            float productValue19 = intermediateValue57 * quotientValue;
            float productValue20 = intermediateValue59 * quotientValue;
            float productValue21 = intermediateValue61 * quotientValue;
            float productValue22 = intermediateValue69 * quotientValue;
            float productValue23 = intermediateValue71 * quotientValue;
            float productValue24 = intermediateValue63 * quotientValue;
            float productValue25 = intermediateValue65 * quotientValue;
            float productValue26 = intermediateValue67 * quotientValue;
            float productValue27 = intermediateValue73 * quotientValue;
            float productValue28 = intermediateValue75 * quotientValue;
            float productValue29 = intermediateValue77 * quotientValue;
            float productValue30 = intermediateValue79 * quotientValue;
            bool reinterpretedBits7 = asuint(viewCbConstants[53u]).w != 0u;
            float comparisonValue12 = reinterpretedBits7 ? (productValue29 + 1.0f) : productValue29;
            float comparisonValue13 = reinterpretedBits7 ? (productValue30 + 1.0f) : productValue30;
            uint branchMergedValue22;
            float branchMergedValue30;
            float branchMergedValue31;
            float branchMergedValue32;
            float branchMergedValue33;
            float branchMergedValue34;
            float branchMergedValue35;
            float branchMergedValue36;
            float branchMergedValue37;
            float branchMergedValue38;
            float branchMergedValue47;
            float branchMergedValue48;
            float branchMergedValue49;
            if (asuint(viewCbConstants[87u]).w == 0u)
            {
                branchMergedValue22 = 0u;
                branchMergedValue30 = comparisonValue13;
                branchMergedValue31 = comparisonValue12;
                branchMergedValue32 = productValue28;
                branchMergedValue33 = productValue27;
                branchMergedValue34 = productValue23;
                branchMergedValue35 = productValue22;
                branchMergedValue36 = productValue26;
                branchMergedValue37 = productValue25;
                branchMergedValue38 = productValue24;
                branchMergedValue47 = productValue21;
                branchMergedValue48 = productValue20;
                branchMergedValue49 = productValue19;
            }
            else
            {
                uint4 loadedBufferValue13 = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
                uint scalarValue41 = loadedBufferValue13.x;
                uint bitwiseValue8 = localThreadId.x >> 2u;
                uint bitwiseValue9 = localThreadId.y >> 2u;
                uint productValue31 = intermediateValue[bitwiseValue8 + (bitwiseValue9 * 5u)] - scalarValue41;
                float productValue58;
                if (int(uint(abs(int(productValue31)))) < int(200u))
                {
                    productValue58 = min(viewCbConstants[98u].z, intermediateValue1[bitwiseValue8 + (bitwiseValue9 * 5u)]);
                }
                else
                {
                    productValue58 = viewCbConstants[98u].z;
                }
                uint sumValue23 = bitwiseValue9 + 1u;
                uint productValue32 = intermediateValue[bitwiseValue8 + (sumValue23 * 5u)] - scalarValue41;
                float productValue64;
                if (int(uint(abs(int(productValue32)))) < int(200u))
                {
                    productValue64 = min(productValue58, intermediateValue1[bitwiseValue8 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue64 = productValue58;
                }
                uint sumValue24 = bitwiseValue8 + 1u;
                uint productValue33 = intermediateValue[sumValue24 + (bitwiseValue9 * 5u)] - scalarValue41;
                float productValue67;
                if (int(uint(abs(int(productValue33)))) < int(200u))
                {
                    productValue67 = min(productValue64, intermediateValue1[sumValue24 + (bitwiseValue9 * 5u)]);
                }
                else
                {
                    productValue67 = productValue64;
                }
                uint productValue38 = intermediateValue[sumValue24 + (sumValue23 * 5u)] - scalarValue41;
                float productValue74;
                if (int(uint(abs(int(productValue38)))) < int(200u))
                {
                    productValue74 = min(productValue67, intermediateValue1[sumValue24 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue74 = productValue67;
                }
                branchMergedValue22 = 0u;
                branchMergedValue30 = min(comparisonValue13, productValue74);
                branchMergedValue31 = min(comparisonValue12, productValue74);
                branchMergedValue32 = productValue28;
                branchMergedValue33 = productValue27;
                branchMergedValue34 = productValue23;
                branchMergedValue35 = productValue22;
                branchMergedValue36 = productValue26;
                branchMergedValue37 = productValue25;
                branchMergedValue38 = productValue24;
                branchMergedValue47 = productValue21;
                branchMergedValue48 = productValue20;
                branchMergedValue49 = productValue19;
            }
            intermediateValue41 = branchMergedValue49;
            intermediateValue42 = branchMergedValue48;
            intermediateValue43 = branchMergedValue47;
            intermediateValue44 = branchMergedValue38;
            intermediateValue45 = branchMergedValue37;
            intermediateValue46 = branchMergedValue36;
            intermediateValue47 = branchMergedValue35;
            intermediateValue48 = branchMergedValue34;
            intermediateValue49 = branchMergedValue33;
            intermediateValue50 = branchMergedValue32;
            intermediateValue51 = branchMergedValue31;
            intermediateValue52 = branchMergedValue30;
            intermediateValue53 = branchMergedValue22;
        }
        else
        {
            intermediateValue41 = 0.0f;
            intermediateValue42 = 0.0f;
            intermediateValue43 = 0.0f;
            intermediateValue44 = 0.0f;
            intermediateValue45 = 0.0f;
            intermediateValue46 = 0.0f;
            intermediateValue47 = 0.0f;
            intermediateValue48 = 0.0f;
            intermediateValue49 = 0.0f;
            intermediateValue50 = 0.0f;
            intermediateValue51 = 1.0f;
            intermediateValue52 = 1.0f;
            intermediateValue53 = 1u;
        }
        float productValue39 = viewCbConstants[78u].z * sumValue5;
        float productValue40 = viewCbConstants[78u].w * sumValue7;
        float productValue41 = viewCbConstants[78u].z * (sumValue5 - sumValue2);
        float productValue42 = viewCbConstants[78u].w * (sumValue7 - sumValue1);
        float clampedValue = (productValue39 < 0.5f) ? min(clamp(((productValue41 < 0.0f) ? productValue39 : (1.0f - productValue39)) / (abs(productValue41) + 9.9999997473787516355514526367188e-06f), 0.0f, 1.0f), clamp(((productValue42 < 0.0f) ? productValue40 : (1.0f - productValue40)) / (abs(productValue42) + 9.9999997473787516355514526367188e-06f), 0.0f, 1.0f)) : 1.0f;
        float4 vectorValue = outputBufferIndirectDiffuse[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue42 = vectorValue.x;
        float intermediateValue82;
        float intermediateValue83;
        float comparisonValue17;
        if (comparisonValue10)
        {
            float dotProductValue = dot(float3(scalarValue42, vectorValue.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float comparisonValue15 = min(max(1.0f / max(intermediateValue51, 0.00999999977648258209228515625f), viewCbConstants[88u].z), (sumValue14 == 0.0f) ? 1.0f : 0.100000001490116119384765625f);
            float productValue43 = (comparisonValue15 * (dotProductValue - intermediateValue47)) + intermediateValue47;
            float productValue44 = (comparisonValue15 * ((dotProductValue * dotProductValue) - intermediateValue48)) + intermediateValue48;
            float exponentialValue = max(exp2((12.0f / intermediateValue51) + 1.0f) + (-10.55606365203857421875f), 0.0f);
            float comparisonValue16 = (intermediateValue53 != 0u) ? (exponentialValue + 1000000.0f) : exponentialValue;
            float productValue45 = max(0.0f, productValue44 - (productValue43 * productValue43));
            float sumValue25 = comparisonValue16 + productValue45;
            intermediateValue82 = productValue43;
            intermediateValue83 = productValue44;
            comparisonValue17 = (comparisonValue16 > productValue45) ? ((-0.0f) - sumValue25) : sumValue25;
        }
        else
        {
            intermediateValue82 = 0.0f;
            intermediateValue83 = 0.0f;
            comparisonValue17 = 0.0f;
        }
        outputBufferDiffuseMoments[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue82, intermediateValue83, intermediateValue82, intermediateValue82);
        float quotientValue1 = ((max(viewCbConstants[88u].y, 1.0f / intermediateValue51) + (-1.0f)) * clampedValue) + 1.0f;
        float intermediateValue84;
        if (asuint(viewCbConstants[91u]).y == 2u)
        {
            intermediateValue84 = 1.0f;
        }
        else
        {
            intermediateValue84 = asfloat(rdLoad_inputIncidentLight(4u).x);
        }
        float productValue46 = intermediateValue84 * intermediateValue41;
        float productValue47 = intermediateValue84 * intermediateValue42;
        float productValue48 = intermediateValue84 * intermediateValue43;
        denoisingOutputs[((asuint(rootConstantsConstants[0u]).x >> 8u) & 255u) + 0u][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(((scalarValue42 - productValue46) * quotientValue1) + productValue46, ((vectorValue.y - productValue47) * quotientValue1) + productValue47, ((vectorValue.z - productValue48) * quotientValue1) + productValue48, comparisonValue17);
        float4 vectorValue1 = outputBufferIndirectSpecular[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue43 = vectorValue1.x;
        float4 loadedBufferValue14 = inputEmissiveAndLinearRoughness.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue44 = loadedBufferValue14.w;
        float4 vectorValue2 = outputBufferReflectionDistance[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue45 = vectorValue2.x;
        float sumValue26 = scalarValue45 + scalarValue1;
        float productValue49 = ((sumValue * 2.0f) * viewCbConstants[78u].z) + (-1.0f);
        float productValue50 = 1.0f - (viewCbConstants[78u].w * productValue1);
        float multiplyAddValue11 = mad(0.5f, viewCbConstants[22u].w, mad(productValue50, viewCbConstants[21u].w, productValue49 * viewCbConstants[20u].w)) + viewCbConstants[23u].w;
        float multiplyAddValue12 = ((mad(0.5f, viewCbConstants[22u].x, mad(productValue50, viewCbConstants[21u].x, productValue49 * viewCbConstants[20u].x)) + viewCbConstants[23u].x) / multiplyAddValue11) - viewCbConstants[72u].x;
        float multiplyAddValue13 = ((mad(0.5f, viewCbConstants[22u].y, mad(productValue50, viewCbConstants[21u].y, productValue49 * viewCbConstants[20u].y)) + viewCbConstants[23u].y) / multiplyAddValue11) - viewCbConstants[72u].y;
        float multiplyAddValue14 = ((mad(0.5f, viewCbConstants[22u].z, mad(productValue50, viewCbConstants[21u].z, productValue49 * viewCbConstants[20u].z)) + viewCbConstants[23u].z) / multiplyAddValue11) - viewCbConstants[72u].z;
        float inverseLengthValue5 = rsqrt(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14))) * sumValue26;
        float productValue51 = ((inverseLengthValue5 * multiplyAddValue12) - viewCbConstants[71u].x) + viewCbConstants[72u].x;
        float productValue53 = ((inverseLengthValue5 * multiplyAddValue13) - viewCbConstants[71u].y) + viewCbConstants[72u].y;
        float productValue54 = ((inverseLengthValue5 * multiplyAddValue14) - viewCbConstants[71u].z) + viewCbConstants[72u].z;
        float multiplyAddValue15 = mad(productValue54, viewCbConstants[26u].w, mad(productValue53, viewCbConstants[25u].w, productValue51 * viewCbConstants[24u].w)) + viewCbConstants[27u].w;
        float multiplyAddValue16 = (sumValue3 * 0.5f) * (((mad(productValue54, viewCbConstants[26u].x, mad(productValue53, viewCbConstants[25u].x, productValue51 * viewCbConstants[24u].x)) + viewCbConstants[27u].x) / multiplyAddValue15) - productValue49);
        float multiplyAddValue17 = (scalarValue5 * (-0.5f)) * (((mad(productValue54, viewCbConstants[26u].y, mad(productValue53, viewCbConstants[25u].y, productValue51 * viewCbConstants[24u].y)) + viewCbConstants[27u].y) / multiplyAddValue15) - productValue50);
        float sumValue27 = multiplyAddValue16 - productValue2;
        float sumValue28 = multiplyAddValue17 - productValue3;
        float nonlinearValue1 = max(sqrt((sumValue28 * sumValue28) + (sumValue27 * sumValue27)) + (-0.100000001490116119384765625f), 0.0f);
        float productValue55 = nonlinearValue1 * 0.02500000037252902984619140625f;
        float quotientValue2 = max(((scalarValue44 * scalarValue44) * scalarValue45) / sumValue26, scalarValue44 * 0.5f);
        float quotientValue3 = max(max(viewCbConstants[88u].w, 1.0f / intermediateValue52), min(productValue55, 1.0f) * 0.25f);
        float productValue56 = min(((1.0f - quotientValue2) * (1.0f - productValue55)) + productValue55, 1.0f);
        float intermediateValue96;
        float intermediateValue97;
        float intermediateValue98;
        float intermediateValue99;
        float intermediateValue100;
        float intermediateValue101;
        float intermediateValue103;
        if ((sumValue14 != 0.0f) && (productValue56 > 0.0f))
        {
            float sumValue29 = (multiplyAddValue16 + sumValue4) + (-0.5f);
            float sumValue32 = (multiplyAddValue17 + sumValue6) + (-0.5f);
            uint scalarValue46 = uint(int(floor(sumValue29)));
            uint scalarValue47 = uint(int(floor(sumValue32)));
            float scalarValue48 = frac(sumValue29);
            float scalarValue49 = frac(sumValue32);
            float nonlinearValue2 = log2(max(scalarValue45, 0.00999999977648258209228515625f));
            float intermediateValue102;
            float intermediateValue108;
            float intermediateValue110;
            float intermediateValue112;
            float intermediateValue114;
            float intermediateValue116;
            float scalarValue50 = 0.0f;
            uint scalarValue51 = 0u;
            float scalarValue52 = 0.0f;
            float scalarValue53 = 0.0f;
            float scalarValue54 = 0.0f;
            float scalarValue55 = 0.0f;
            float scalarValue56 = 0.0f;
            uint bitwiseValue11;
            uint sumValue30;
            uint sumValue31;
            float productValue52;
            uint reinterpretedBits8;
            bool comparisonValue18;
            for (;;)
            {
                uint bitwiseValue10 = scalarValue51 & 1u;
                bitwiseValue11 = scalarValue51 >> 1u;
                uint bitwiseValue12 = bitwiseValue11 & 1u;
                sumValue30 = bitwiseValue10 + scalarValue46;
                sumValue31 = bitwiseValue12 + scalarValue47;
                float sumValue33 = 1.0f - scalarValue48;
                float sumValue34 = 1.0f - scalarValue49;
                productValue52 = ((float(int(bitwiseValue12)) * (scalarValue49 - sumValue34)) + sumValue34) * ((float(int(bitwiseValue10)) * (scalarValue48 - sumValue33)) + sumValue33);
                reinterpretedBits8 = asuint(viewCbConstants[91u]).y;
                comparisonValue18 = reinterpretedBits8 == 2u;
                uint intermediateValue120;
                uint intermediateValue121;
                if (comparisonValue1)
                {
                    uint branchMergedValue25;
                    uint branchMergedValue45;
                    if (comparisonValue18)
                    {
                        branchMergedValue25 = sumValue30;
                        branchMergedValue45 = sumValue30;
                    }
                    else
                    {
                        uint productValue57 = uint(viewCbConstants[78u].x * 0.5f);
                        uint reinterpretedBits9 = (((reinterpretedBits8 == 0u) ? (asuint(viewCbConstants[84u]).z + 1u) : 0u) + sumValue31) & 1u;
                        uint branchMergedValue55;
                        uint branchMergedValue59;
                        if (sumValue30 < productValue57)
                        {
                            branchMergedValue55 = ((sumValue30 << 1u) | 1u) - reinterpretedBits9;
                            branchMergedValue59 = sumValue30;
                        }
                        else
                        {
                            branchMergedValue55 = reinterpretedBits9 | ((sumValue30 - productValue57) << 1u);
                            branchMergedValue59 = sumValue30;
                        }
                        branchMergedValue25 = branchMergedValue55;
                        branchMergedValue45 = branchMergedValue59;
                    }
                    intermediateValue120 = branchMergedValue45;
                    intermediateValue121 = branchMergedValue25;
                }
                else
                {
                    uint branchMergedValue26;
                    uint branchMergedValue46;
                    if (comparisonValue18)
                    {
                        branchMergedValue26 = sumValue30;
                        branchMergedValue46 = sumValue30;
                    }
                    else
                    {
                        branchMergedValue26 = sumValue30;
                        branchMergedValue46 = ((((((bitwiseValue11 + scalarValue47) ^ (scalarValue51 + scalarValue46)) & 1u) != 0u) != (((asuint(viewCbConstants[84u]).z & 1u) | reinterpretedBits8) != 0u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue30 >> 1u);
                    }
                    intermediateValue120 = branchMergedValue46;
                    intermediateValue121 = branchMergedValue26;
                }
                float branchMergedValue2;
                float branchMergedValue13;
                float branchMergedValue14;
                float branchMergedValue15;
                float branchMergedValue16;
                float branchMergedValue17;
                if (((int(sumValue31) < int(0u)) || (int(intermediateValue120) < int(intermediateValue11))) || ((int(sumValue31) >= int(intermediateValue13)) || (int(intermediateValue120) >= int(intermediateValue12))))
                {
                    branchMergedValue2 = scalarValue56;
                    branchMergedValue13 = scalarValue55;
                    branchMergedValue14 = scalarValue54;
                    branchMergedValue15 = scalarValue53;
                    branchMergedValue16 = scalarValue52;
                    branchMergedValue17 = scalarValue50;
                }
                else
                {
                    uint productValue59 = uint(min(max(float(uint(viewCbConstants[88u].x * float(intermediateValue120))), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x));
                    uint productValue60 = uint(min(max(float(uint(viewCbConstants[88u].x * float(sumValue31))), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x));
                    float productValue61 = scalarValue44 * (-0.25f);
                    float4 loadedBufferValue15 = previousPrimaryNormalBuffer.Load(int3(uint2(productValue59, productValue60), 0u));
                    float scalarValue57 = loadedBufferValue15.x;
                    float scalarValue58 = loadedBufferValue15.y;
                    float sumValue35 = 1.0f - abs(scalarValue57);
                    float scalarValue59 = abs(scalarValue58);
                    float sumValue36 = sumValue35 - scalarValue59;
                    bool conditionValue3 = sumValue36 < 0.0f;
                    float comparisonValue19 = conditionValue3 ? ((1.0f - scalarValue59) * ((scalarValue57 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue57;
                    float comparisonValue20 = conditionValue3 ? (((scalarValue58 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue35) : scalarValue58;
                    float inverseLengthValue6 = rsqrt(dot(float3(comparisonValue19, comparisonValue20, sumValue36), float3(comparisonValue19, comparisonValue20, sumValue36)));
                    float sumValue37 = 0.050000011920928955078125f - productValue61;
                    float4 loadedBufferValue16 = previousPrimaryPathLengthBuffer.Load(int3(uint2(productValue59, productValue60), 0u));
                    float scalarValue60 = loadedBufferValue16.x;
                    float productValue62 = (((float(int(intermediateValue121)) + 0.5f) * 2.0f) * viewCbConstants[78u].z) + (-1.0f);
                    float productValue63 = 1.0f - (((float(int(sumValue31)) + 0.5f) * 2.0f) * viewCbConstants[78u].w);
                    float multiplyAddValue19 = mad(0.5f, viewCbConstants[34u].w, mad(productValue63, viewCbConstants[33u].w, viewCbConstants[32u].w * productValue62)) + viewCbConstants[35u].w;
                    float multiplyAddValue20 = ((mad(0.5f, viewCbConstants[34u].x, mad(productValue63, viewCbConstants[33u].x, viewCbConstants[32u].x * productValue62)) + viewCbConstants[35u].x) / multiplyAddValue19) - viewCbConstants[73u].x;
                    float multiplyAddValue21 = ((mad(0.5f, viewCbConstants[34u].y, mad(productValue63, viewCbConstants[33u].y, viewCbConstants[32u].y * productValue62)) + viewCbConstants[35u].y) / multiplyAddValue19) - viewCbConstants[73u].y;
                    float multiplyAddValue22 = ((mad(0.5f, viewCbConstants[34u].z, mad(productValue63, viewCbConstants[33u].z, viewCbConstants[32u].z * productValue62)) + viewCbConstants[35u].z) / multiplyAddValue19) - viewCbConstants[73u].z;
                    float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22), float3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22)));
                    float loadedBufferValue17 = clamp(mad(abs(nonlinearValue2 - log2(max(previousReflectionDistanceBuffer.Load(int3(uint2(productValue59, productValue60), 0u)).x, 0.00999999977648258209228515625f))), -2.0f, 2.0f), 0.0f, 1.0f);
                    float loadedBufferValue18 = (((1.0f - loadedBufferValue17) * scalarValue44) + loadedBufferValue17) * ((abs(multiplyAddValue4 - dot(float3(mad(multiplyAddValue20 * inverseLengthValue7, scalarValue60, viewCbConstants[73u].x), mad(multiplyAddValue21 * inverseLengthValue7, scalarValue60, viewCbConstants[73u].y), mad(multiplyAddValue22 * inverseLengthValue7, scalarValue60, viewCbConstants[73u].z)), float3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0f : ((productValue52 * clamp(mad(dot(float3(productValue7, productValue8, productValue9), float3(comparisonValue19 * inverseLengthValue6, comparisonValue20 * inverseLengthValue6, inverseLengthValue6 * sumValue36)), 1.0f / sumValue37, ((-0.0f) - (productValue61 + 0.949999988079071044921875f)) / sumValue37), 0.0f, 1.0f)) * clamp(mad(abs(scalarValue44 - previousLinearRoughnessBuffer.Load(int3(uint2(productValue59, productValue60), 0u)).x), -12.5f, 1.5f), 0.0f, 1.0f)));
                    float4 loadedBufferValue19 = previousSpecularBuffer.Load(int3(uint2(productValue59, productValue60), 0u));
                    float4 loadedBufferValue20 = inputFinalSpecularMoments.Load(int3(uint2(intermediateValue120, sumValue31), 0u));
                    branchMergedValue2 = (loadedBufferValue20.y * loadedBufferValue18) + scalarValue56;
                    branchMergedValue13 = (loadedBufferValue20.x * loadedBufferValue18) + scalarValue55;
                    branchMergedValue14 = (loadedBufferValue18 * loadedBufferValue19.z) + scalarValue54;
                    branchMergedValue15 = (loadedBufferValue18 * loadedBufferValue19.y) + scalarValue53;
                    branchMergedValue16 = (loadedBufferValue18 * loadedBufferValue19.x) + scalarValue52;
                    branchMergedValue17 = loadedBufferValue18 + scalarValue50;
                }
                intermediateValue116 = branchMergedValue2;
                intermediateValue114 = branchMergedValue13;
                intermediateValue112 = branchMergedValue14;
                intermediateValue110 = branchMergedValue15;
                intermediateValue108 = branchMergedValue16;
                intermediateValue102 = branchMergedValue17;
                uint sumValue38 = scalarValue51 + 1u;
                if (sumValue38 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue50 = intermediateValue102;
                    scalarValue51 = sumValue38;
                    scalarValue52 = intermediateValue108;
                    scalarValue53 = intermediateValue110;
                    scalarValue54 = intermediateValue112;
                    scalarValue55 = intermediateValue114;
                    scalarValue56 = intermediateValue116;
                    continue;
                }
            }
            float branchMergedValue24;
            float branchMergedValue39;
            float branchMergedValue40;
            float branchMergedValue41;
            float branchMergedValue42;
            float branchMergedValue43;
            float branchMergedValue44;
            if (intermediateValue102 > 0.00999999977648258209228515625f)
            {
                branchMergedValue24 = intermediateValue102;
                branchMergedValue39 = (((intermediateValue116 / intermediateValue102) - intermediateValue50) * productValue56) + intermediateValue50;
                branchMergedValue40 = (((intermediateValue114 / intermediateValue102) - intermediateValue49) * productValue56) + intermediateValue49;
                branchMergedValue41 = (((intermediateValue112 / intermediateValue102) - intermediateValue46) * productValue56) + intermediateValue46;
                branchMergedValue42 = quotientValue3;
                branchMergedValue43 = (((intermediateValue108 / intermediateValue102) - intermediateValue44) * productValue56) + intermediateValue44;
                branchMergedValue44 = (((intermediateValue110 / intermediateValue102) - intermediateValue45) * productValue56) + intermediateValue45;
            }
            else
            {
                branchMergedValue24 = intermediateValue102;
                branchMergedValue39 = intermediateValue50;
                branchMergedValue40 = intermediateValue49;
                branchMergedValue41 = intermediateValue46;
                branchMergedValue42 = 1.0f;
                branchMergedValue43 = intermediateValue44;
                branchMergedValue44 = intermediateValue45;
            }
            intermediateValue96 = branchMergedValue43;
            intermediateValue97 = branchMergedValue44;
            intermediateValue98 = branchMergedValue41;
            intermediateValue99 = branchMergedValue40;
            intermediateValue100 = branchMergedValue39;
            intermediateValue101 = branchMergedValue24;
            intermediateValue103 = branchMergedValue42;
        }
        else
        {
            intermediateValue96 = intermediateValue44;
            intermediateValue97 = intermediateValue45;
            intermediateValue98 = intermediateValue46;
            intermediateValue99 = intermediateValue49;
            intermediateValue100 = intermediateValue50;
            intermediateValue101 = sumValue14;
            intermediateValue103 = quotientValue3;
        }
        float intermediateValue117;
        float intermediateValue118;
        float multiplyAddValue18;
        if (comparisonValue11)
        {
            float dotProductValue1 = dot(float3(scalarValue43, vectorValue1.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float comparisonValue21 = min(max(1.0f / max(intermediateValue52, 0.00999999977648258209228515625f), viewCbConstants[89u].x), (intermediateValue101 == 0.0f) ? 1.0f : 0.100000001490116119384765625f);
            float productValue65 = (comparisonValue21 * (dotProductValue1 - intermediateValue99)) + intermediateValue99;
            float productValue66 = (comparisonValue21 * ((dotProductValue1 * dotProductValue1) - intermediateValue100)) + intermediateValue100;
            float exponentialValue1 = max(exp2((12.0f / intermediateValue52) + 1.0f) + (-10.55606365203857421875f), 0.0f);
            float comparisonValue22 = (intermediateValue53 != 0u) ? (exponentialValue1 + 1000000.0f) : exponentialValue1;
            float productValue68 = max(0.0f, productValue66 - (productValue65 * productValue65));
            float sumValue39 = comparisonValue22 + productValue68;
            intermediateValue117 = productValue65;
            intermediateValue118 = productValue66;
            multiplyAddValue18 = ((comparisonValue22 > productValue68) ? ((-0.0f) - sumValue39) : sumValue39) * mad(productValue56, (nonlinearValue1 * 200.0f) * quotientValue2, 1.0f);
        }
        else
        {
            intermediateValue117 = 0.0f;
            intermediateValue118 = 0.0f;
            multiplyAddValue18 = 0.0f;
        }
        outputBufferSpecularMoments[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue117, intermediateValue118, intermediateValue117, intermediateValue117);
        float productValue69 = ((intermediateValue103 + (-1.0f)) * clampedValue) + 1.0f;
        float intermediateValue119;
        if (asuint(viewCbConstants[91u]).y == 2u)
        {
            intermediateValue119 = 1.0f;
        }
        else
        {
            intermediateValue119 = asfloat(rdLoad_inputIncidentLight(4u).x);
        }
        float productValue70 = intermediateValue119 * intermediateValue96;
        float productValue71 = intermediateValue119 * intermediateValue97;
        float productValue72 = intermediateValue119 * intermediateValue98;
        denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(((scalarValue43 - productValue70) * productValue69) + productValue70, ((vectorValue1.y - productValue71) * productValue69) + productValue71, ((vectorValue1.z - productValue72) * productValue69) + productValue72, multiplyAddValue18);
        float productValue73 = intermediateValue51 * 0.0039215688593685626983642578125f;
        outputBufferHistoryLength[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(productValue73, 0.0039215688593685626983642578125f / productValue69, productValue73, productValue73);
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
