// RTXStub / ReprojectSH / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 36
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
    uint reinterpretedBits = ((asuint(rootConstantsConstants[0u]).x >> 8u) & 255u) + 0u;
    uint reinterpretedBits1 = (asuint(rootConstantsConstants[0u]).x >> 8u) & 255u;
    uint reinterpretedBits2 = ((asuint(rootConstantsConstants[0u]).x >> 16u) & 255u) + 0u;
    if (scalarValue1 == 65504.0f)
    {
        outputBufferHistoryLength[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0039215688593685626983642578125f.xxxx;
        outputBufferDiffuseMoments[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
        denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
        denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
        outputBufferSpecularMoments[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
        denoisingOutputs[reinterpretedBits2][uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
        outputBufferReflectionDistance[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.x;
    }
    else
    {
        uint4 reinterpretedBits3 = asuint(viewCbConstants[91u]);
        uint scalarValue2 = reinterpretedBits3.y;
        bool comparisonValue = scalarValue2 == 2u;
        uint intermediateValue6;
        if (comparisonValue)
        {
            intermediateValue6 = dispatchThreadId.x;
        }
        else
        {
            uint productValue = uint(viewCbConstants[78u].x * 0.5f);
            uint reinterpretedBits4 = (((scalarValue2 == 0u) ? asuint(viewCbConstants[84u]).z : 0u) + dispatchThreadId.y) & 1u;
            uint branchMergedValue23;
            if (dispatchThreadId.x < productValue)
            {
                branchMergedValue23 = ((dispatchThreadId.x << 1u) | 1u) - reinterpretedBits4;
            }
            else
            {
                branchMergedValue23 = reinterpretedBits4 | ((dispatchThreadId.x - productValue) << 1u);
            }
            intermediateValue6 = branchMergedValue23;
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
            uint branchMergedValue24;
            uint branchMergedValue30;
            uint branchMergedValue31;
            uint branchMergedValue32;
            if (comparisonValue)
            {
                branchMergedValue24 = 0u;
                branchMergedValue30 = uint(int(viewCbConstants[78u].y));
                branchMergedValue31 = uint(int(viewCbConstants[78u].x));
                branchMergedValue32 = dispatchThreadId.x;
            }
            else
            {
                uint scalarValue3 = uint(viewCbConstants[80u].x);
                uint scalarValue4 = uint(viewCbConstants[78u].y);
                uint branchMergedValue60;
                uint branchMergedValue62;
                uint branchMergedValue63;
                uint branchMergedValue64;
                if (dispatchThreadId.x < scalarValue3)
                {
                    branchMergedValue60 = 0u;
                    branchMergedValue62 = scalarValue4;
                    branchMergedValue63 = scalarValue3;
                    branchMergedValue64 = dispatchThreadId.x;
                }
                else
                {
                    branchMergedValue60 = scalarValue3;
                    branchMergedValue62 = scalarValue4;
                    branchMergedValue63 = uint(viewCbConstants[78u].x);
                    branchMergedValue64 = dispatchThreadId.x;
                }
                branchMergedValue24 = branchMergedValue60;
                branchMergedValue30 = branchMergedValue62;
                branchMergedValue31 = branchMergedValue63;
                branchMergedValue32 = branchMergedValue64;
            }
            intermediateValue10 = branchMergedValue32;
            intermediateValue11 = branchMergedValue24;
            intermediateValue12 = branchMergedValue31;
            intermediateValue13 = branchMergedValue30;
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
        float productValue7 = comparisonValue5 * inverseLengthValue1;
        float productValue8 = ((scalarValue6 + (sumValue * viewCbConstants[78u].z)) * 2.0f) + (-1.0f);
        float productValue9 = (1.0f - (viewCbConstants[78u].w * productValue1)) - (scalarValue7 * 2.0f);
        float multiplyAddValue = mad(0.5f, viewCbConstants[34u].w, mad(productValue9, viewCbConstants[33u].w, viewCbConstants[32u].w * productValue8)) + viewCbConstants[35u].w;
        float multiplyAddValue1 = ((mad(0.5f, viewCbConstants[34u].x, mad(productValue9, viewCbConstants[33u].x, viewCbConstants[32u].x * productValue8)) + viewCbConstants[35u].x) / multiplyAddValue) - viewCbConstants[73u].x;
        float multiplyAddValue2 = ((mad(0.5f, viewCbConstants[34u].y, mad(productValue9, viewCbConstants[33u].y, viewCbConstants[32u].y * productValue8)) + viewCbConstants[35u].y) / multiplyAddValue) - viewCbConstants[73u].y;
        float multiplyAddValue3 = ((mad(0.5f, viewCbConstants[34u].z, mad(productValue9, viewCbConstants[33u].z, viewCbConstants[32u].z * productValue8)) + viewCbConstants[35u].z) / multiplyAddValue) - viewCbConstants[73u].z;
        float inverseLengthValue2 = rsqrt(dot(float3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3), float3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3)));
        float multiplyAddValue4 = dot(float3(mad(multiplyAddValue1 * inverseLengthValue2, scalarValue8, viewCbConstants[73u].x), mad(multiplyAddValue2 * inverseLengthValue2, scalarValue8, viewCbConstants[73u].y), mad(multiplyAddValue3 * inverseLengthValue2, scalarValue8, viewCbConstants[73u].z)), float3(productValue4, productValue5, productValue6));
        float multiplyAddValue5 = mad(scalarValue8, 0.004999999888241291046142578125f, 0.02500000037252902984619140625f);
        uint4 reinterpretedBits5 = asuint(rootConstantsConstants[0u]);
        uint scalarValue15 = reinterpretedBits5.x;
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
        uint reinterpretedBits6;
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
            reinterpretedBits6 = asuint(viewCbConstants[91u]).y;
            comparisonValue7 = reinterpretedBits6 == 2u;
            uint branchMergedValue;
            uint branchMergedValue3;
            if (comparisonValue1)
            {
                uint branchMergedValue56;
                uint branchMergedValue58;
                if (comparisonValue7)
                {
                    branchMergedValue56 = sumValue16;
                    branchMergedValue58 = sumValue16;
                }
                else
                {
                    uint productValue10 = uint(viewCbConstants[78u].x * 0.5f);
                    uint reinterpretedBits7 = (((reinterpretedBits6 == 0u) ? (asuint(viewCbConstants[84u]).z + 1u) : 0u) + sumValue17) & 1u;
                    uint branchMergedValue66;
                    uint branchMergedValue67;
                    if (sumValue16 < productValue10)
                    {
                        branchMergedValue66 = sumValue16;
                        branchMergedValue67 = ((sumValue16 << 1u) | 1u) - reinterpretedBits7;
                    }
                    else
                    {
                        branchMergedValue66 = sumValue16;
                        branchMergedValue67 = reinterpretedBits7 | ((sumValue16 - productValue10) << 1u);
                    }
                    branchMergedValue56 = branchMergedValue66;
                    branchMergedValue58 = branchMergedValue67;
                }
                branchMergedValue = branchMergedValue56;
                branchMergedValue3 = branchMergedValue58;
            }
            else
            {
                uint branchMergedValue57;
                uint branchMergedValue59;
                if (comparisonValue7)
                {
                    branchMergedValue57 = sumValue16;
                    branchMergedValue59 = sumValue16;
                }
                else
                {
                    branchMergedValue57 = ((((((bitwiseValue3 + scalarValue17) ^ (scalarValue21 + scalarValue16)) & 1u) != 0u) != (((asuint(viewCbConstants[84u]).z & 1u) | reinterpretedBits6) != 0u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue16 >> 1u);
                    branchMergedValue59 = sumValue16;
                }
                branchMergedValue = branchMergedValue57;
                branchMergedValue3 = branchMergedValue59;
            }
            intermediateValue33 = branchMergedValue;
            intermediateValue34 = branchMergedValue3;
            float scalarValue22 = float(sumValue17);
            uint productValue11 = uint(min(max(float(uint(viewCbConstants[88u].x * float(intermediateValue33))), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x));
            uint productValue12 = uint(min(max(float(uint(viewCbConstants[88u].x * scalarValue22)), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x));
            float4 loadedBufferValue6 = inputPreviousGeometryNormal.Load(int3(uint2(productValue11, productValue12), 0u));
            float scalarValue23 = loadedBufferValue6.x;
            float scalarValue24 = loadedBufferValue6.y;
            float sumValue19 = 1.0f - abs(scalarValue23);
            float scalarValue25 = abs(scalarValue24);
            float sumValue20 = sumValue19 - scalarValue25;
            bool conditionValue2 = sumValue20 < 0.0f;
            float comparisonValue8 = conditionValue2 ? ((1.0f - scalarValue25) * ((scalarValue23 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue23;
            float comparisonValue9 = conditionValue2 ? (((scalarValue24 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue19) : scalarValue24;
            float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue8, comparisonValue9, sumValue20), float3(comparisonValue8, comparisonValue9, sumValue20)));
            float4 loadedBufferValue7 = previousPrimaryPathLengthBuffer.Load(int3(uint2(productValue11, productValue12), 0u));
            float scalarValue26 = loadedBufferValue7.x;
            float productValue13 = (((float(intermediateValue34) + 0.5f) * 2.0f) * viewCbConstants[78u].z) + (-1.0f);
            float productValue14 = 1.0f - (((scalarValue22 + 0.5f) * 2.0f) * viewCbConstants[78u].w);
            float multiplyAddValue6 = mad(0.5f, viewCbConstants[34u].w, mad(productValue14, viewCbConstants[33u].w, viewCbConstants[32u].w * productValue13)) + viewCbConstants[35u].w;
            float multiplyAddValue7 = ((mad(0.5f, viewCbConstants[34u].x, mad(productValue14, viewCbConstants[33u].x, viewCbConstants[32u].x * productValue13)) + viewCbConstants[35u].x) / multiplyAddValue6) - viewCbConstants[73u].x;
            float multiplyAddValue8 = ((mad(0.5f, viewCbConstants[34u].y, mad(productValue14, viewCbConstants[33u].y, viewCbConstants[32u].y * productValue13)) + viewCbConstants[35u].y) / multiplyAddValue6) - viewCbConstants[73u].y;
            float multiplyAddValue9 = ((mad(0.5f, viewCbConstants[34u].z, mad(productValue14, viewCbConstants[33u].z, viewCbConstants[32u].z * productValue13)) + viewCbConstants[35u].z) / multiplyAddValue6) - viewCbConstants[73u].z;
            float inverseLengthValue4 = rsqrt(dot(float3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9), float3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9)));
            float multiplyAddValue10 = (abs(multiplyAddValue4 - dot(float3(mad(multiplyAddValue7 * inverseLengthValue4, scalarValue26, viewCbConstants[73u].x), mad(multiplyAddValue8 * inverseLengthValue4, scalarValue26, viewCbConstants[73u].y), mad(multiplyAddValue9 * inverseLengthValue4, scalarValue26, viewCbConstants[73u].z)), float3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0f : (clamp(mad(dot(float3(comparisonValue8 * inverseLengthValue3, comparisonValue9 * inverseLengthValue3, inverseLengthValue3 * sumValue20), float3(productValue4, productValue5, productValue6)), 3.759398937225341796875f, -2.2556393146514892578125f), 0.0f, 1.0f) * comparisonValue6);
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
        float productValue15 = comparisonValue4 * inverseLengthValue1;
        float productValue16 = inverseLengthValue1 * sumValue11;
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
        float intermediateValue53;
        float intermediateValue54;
        float intermediateValue55;
        uint intermediateValue56;
        if (sumValue14 > 0.0f)
        {
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
            float intermediateValue81;
            float intermediateValue83;
            float intermediateValue85;
            float intermediateValue87;
            float intermediateValue89;
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
            float scalarValue39 = 0.0f;
            float scalarValue40 = 0.0f;
            float scalarValue41 = 0.0f;
            uint scalarValue42 = 0u;
            float intermediateValue91;
            bool comparisonValue14;
            for (;;)
            {
                intermediateValue91 = intermediateValue2[scalarValue42];
                comparisonValue14 = intermediateValue91 != 0.0f;
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
                float branchMergedValue20;
                float branchMergedValue21;
                float branchMergedValue22;
                if (comparisonValue14)
                {
                    uint bitwiseValue5 = scalarValue42 >> 1u;
                    uint bitwiseValue6 = (scalarValue42 & 1u) + scalarValue16;
                    uint intermediateValue100;
                    if (comparisonValue1)
                    {
                        intermediateValue100 = bitwiseValue6;
                    }
                    else
                    {
                        uint4 reinterpretedBits8 = asuint(viewCbConstants[91u]);
                        uint scalarValue43 = reinterpretedBits8.y;
                        uint branchMergedValue26;
                        if (scalarValue43 == 2u)
                        {
                            branchMergedValue26 = bitwiseValue6;
                        }
                        else
                        {
                            branchMergedValue26 = ((((((bitwiseValue5 + scalarValue17) ^ (scalarValue42 + scalarValue16)) & 1u) != 0u) != (((asuint(viewCbConstants[84u]).z & 1u) | scalarValue43) != 0u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (bitwiseValue6 >> 1u);
                        }
                        intermediateValue100 = branchMergedValue26;
                    }
                    uint productValue17 = uint(min(max(float(uint(viewCbConstants[88u].x * float(intermediateValue100))), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x));
                    uint bitwiseValue7 = uint(min(max(float(uint(viewCbConstants[88u].x * float((bitwiseValue5 & 1u) + scalarValue17))), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x));
                    float4 loadedBufferValue8 = previousDiffuseBuffer.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                    float4 loadedBufferValue9 = previousDiffuseChromaBuffer.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                    float4 loadedBufferValue10 = previousSpecularBuffer.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                    float productValue37;
                    float productValue38;
                    if (comparisonValue10)
                    {
                        float4 loadedBufferValue11 = inputFinalDiffuseMoments.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                        productValue37 = (loadedBufferValue11.x * intermediateValue91) + scalarValue36;
                        productValue38 = (loadedBufferValue11.y * intermediateValue91) + scalarValue37;
                    }
                    else
                    {
                        productValue37 = scalarValue36;
                        productValue38 = scalarValue37;
                    }
                    float productValue39;
                    float productValue40;
                    if (comparisonValue11)
                    {
                        float4 loadedBufferValue12 = inputFinalSpecularMoments.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                        productValue39 = (loadedBufferValue12.x * intermediateValue91) + scalarValue38;
                        productValue40 = (loadedBufferValue12.y * intermediateValue91) + scalarValue39;
                    }
                    else
                    {
                        productValue39 = scalarValue38;
                        productValue40 = scalarValue39;
                    }
                    float4 loadedBufferValue13 = previousHistoryLengthBuffer.Load(int3(uint2(productValue17, bitwiseValue7), 0u));
                    float productValue18 = intermediateValue91 * 255.0f;
                    branchMergedValue1 = (loadedBufferValue13.y * productValue18) + scalarValue41;
                    branchMergedValue4 = (loadedBufferValue13.x * productValue18) + scalarValue40;
                    branchMergedValue5 = productValue40;
                    branchMergedValue6 = productValue39;
                    branchMergedValue7 = productValue38;
                    branchMergedValue8 = productValue37;
                    branchMergedValue9 = (loadedBufferValue10.z * intermediateValue91) + scalarValue35;
                    branchMergedValue10 = (loadedBufferValue10.y * intermediateValue91) + scalarValue34;
                    branchMergedValue11 = (loadedBufferValue10.x * intermediateValue91) + scalarValue33;
                    branchMergedValue12 = (loadedBufferValue9.y * intermediateValue91) + scalarValue32;
                    branchMergedValue18 = (loadedBufferValue9.x * intermediateValue91) + scalarValue31;
                    branchMergedValue19 = (loadedBufferValue8.w * intermediateValue91) + scalarValue30;
                    branchMergedValue20 = (loadedBufferValue8.z * intermediateValue91) + scalarValue29;
                    branchMergedValue21 = (loadedBufferValue8.y * intermediateValue91) + scalarValue28;
                    branchMergedValue22 = (loadedBufferValue8.x * intermediateValue91) + scalarValue27;
                }
                else
                {
                    branchMergedValue1 = scalarValue41;
                    branchMergedValue4 = scalarValue40;
                    branchMergedValue5 = scalarValue39;
                    branchMergedValue6 = scalarValue38;
                    branchMergedValue7 = scalarValue37;
                    branchMergedValue8 = scalarValue36;
                    branchMergedValue9 = scalarValue35;
                    branchMergedValue10 = scalarValue34;
                    branchMergedValue11 = scalarValue33;
                    branchMergedValue12 = scalarValue32;
                    branchMergedValue18 = scalarValue31;
                    branchMergedValue19 = scalarValue30;
                    branchMergedValue20 = scalarValue29;
                    branchMergedValue21 = scalarValue28;
                    branchMergedValue22 = scalarValue27;
                }
                intermediateValue89 = branchMergedValue1;
                intermediateValue87 = branchMergedValue4;
                intermediateValue85 = branchMergedValue5;
                intermediateValue83 = branchMergedValue6;
                intermediateValue81 = branchMergedValue7;
                intermediateValue79 = branchMergedValue8;
                intermediateValue77 = branchMergedValue9;
                intermediateValue75 = branchMergedValue10;
                intermediateValue73 = branchMergedValue11;
                intermediateValue71 = branchMergedValue12;
                intermediateValue69 = branchMergedValue18;
                intermediateValue67 = branchMergedValue19;
                intermediateValue65 = branchMergedValue20;
                intermediateValue63 = branchMergedValue21;
                intermediateValue61 = branchMergedValue22;
                uint sumValue22 = scalarValue42 + 1u;
                if (sumValue22 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue27 = intermediateValue61;
                    scalarValue28 = intermediateValue63;
                    scalarValue29 = intermediateValue65;
                    scalarValue30 = intermediateValue67;
                    scalarValue31 = intermediateValue69;
                    scalarValue32 = intermediateValue71;
                    scalarValue33 = intermediateValue73;
                    scalarValue34 = intermediateValue75;
                    scalarValue35 = intermediateValue77;
                    scalarValue36 = intermediateValue79;
                    scalarValue37 = intermediateValue81;
                    scalarValue38 = intermediateValue83;
                    scalarValue39 = intermediateValue85;
                    scalarValue40 = intermediateValue87;
                    scalarValue41 = intermediateValue89;
                    scalarValue42 = sumValue22;
                    continue;
                }
            }
            float productValue19 = intermediateValue61 * quotientValue;
            float productValue20 = intermediateValue63 * quotientValue;
            float productValue21 = intermediateValue65 * quotientValue;
            float productValue22 = intermediateValue67 * quotientValue;
            float productValue23 = intermediateValue69 * quotientValue;
            float productValue24 = intermediateValue71 * quotientValue;
            float productValue25 = intermediateValue79 * quotientValue;
            float productValue26 = intermediateValue81 * quotientValue;
            float productValue27 = intermediateValue73 * quotientValue;
            float productValue28 = intermediateValue75 * quotientValue;
            float productValue29 = intermediateValue77 * quotientValue;
            float productValue30 = intermediateValue83 * quotientValue;
            float productValue31 = intermediateValue85 * quotientValue;
            float productValue32 = intermediateValue87 * quotientValue;
            float productValue33 = intermediateValue89 * quotientValue;
            bool reinterpretedBits9 = asuint(viewCbConstants[53u]).w != 0u;
            float comparisonValue12 = reinterpretedBits9 ? (productValue32 + 1.0f) : productValue32;
            float comparisonValue13 = reinterpretedBits9 ? (productValue33 + 1.0f) : productValue33;
            float branchMergedValue25;
            uint branchMergedValue33;
            float branchMergedValue34;
            float branchMergedValue35;
            float branchMergedValue36;
            float branchMergedValue37;
            float branchMergedValue38;
            float branchMergedValue39;
            float branchMergedValue40;
            float branchMergedValue41;
            float branchMergedValue50;
            float branchMergedValue51;
            float branchMergedValue52;
            float branchMergedValue53;
            float branchMergedValue54;
            float branchMergedValue55;
            if (asuint(viewCbConstants[87u]).w == 0u)
            {
                branchMergedValue25 = productValue31;
                branchMergedValue33 = 0u;
                branchMergedValue34 = comparisonValue13;
                branchMergedValue35 = comparisonValue12;
                branchMergedValue36 = productValue27;
                branchMergedValue37 = productValue30;
                branchMergedValue38 = productValue26;
                branchMergedValue39 = productValue25;
                branchMergedValue40 = productValue29;
                branchMergedValue41 = productValue28;
                branchMergedValue50 = productValue24;
                branchMergedValue51 = productValue23;
                branchMergedValue52 = productValue22;
                branchMergedValue53 = productValue21;
                branchMergedValue54 = productValue20;
                branchMergedValue55 = productValue19;
            }
            else
            {
                uint4 loadedBufferValue14 = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
                uint scalarValue44 = loadedBufferValue14.x;
                uint bitwiseValue8 = localThreadId.x >> 2u;
                uint bitwiseValue9 = localThreadId.y >> 2u;
                uint productValue34 = intermediateValue[bitwiseValue8 + (bitwiseValue9 * 5u)] - scalarValue44;
                float productValue64;
                if (int(uint(abs(int(productValue34)))) < int(200u))
                {
                    productValue64 = min(viewCbConstants[98u].z, intermediateValue1[bitwiseValue8 + (bitwiseValue9 * 5u)]);
                }
                else
                {
                    productValue64 = viewCbConstants[98u].z;
                }
                uint sumValue23 = bitwiseValue9 + 1u;
                uint productValue35 = intermediateValue[bitwiseValue8 + (sumValue23 * 5u)] - scalarValue44;
                float productValue70;
                if (int(uint(abs(int(productValue35)))) < int(200u))
                {
                    productValue70 = min(productValue64, intermediateValue1[bitwiseValue8 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue70 = productValue64;
                }
                uint sumValue24 = bitwiseValue8 + 1u;
                uint productValue36 = intermediateValue[sumValue24 + (bitwiseValue9 * 5u)] - scalarValue44;
                float productValue73;
                if (int(uint(abs(int(productValue36)))) < int(200u))
                {
                    productValue73 = min(productValue70, intermediateValue1[sumValue24 + (bitwiseValue9 * 5u)]);
                }
                else
                {
                    productValue73 = productValue70;
                }
                uint productValue41 = intermediateValue[sumValue24 + (sumValue23 * 5u)] - scalarValue44;
                float productValue80;
                if (int(uint(abs(int(productValue41)))) < int(200u))
                {
                    productValue80 = min(productValue73, intermediateValue1[sumValue24 + (sumValue23 * 5u)]);
                }
                else
                {
                    productValue80 = productValue73;
                }
                branchMergedValue25 = productValue31;
                branchMergedValue33 = 0u;
                branchMergedValue34 = min(comparisonValue13, productValue80);
                branchMergedValue35 = min(comparisonValue12, productValue80);
                branchMergedValue36 = productValue27;
                branchMergedValue37 = productValue30;
                branchMergedValue38 = productValue26;
                branchMergedValue39 = productValue25;
                branchMergedValue40 = productValue29;
                branchMergedValue41 = productValue28;
                branchMergedValue50 = productValue24;
                branchMergedValue51 = productValue23;
                branchMergedValue52 = productValue22;
                branchMergedValue53 = productValue21;
                branchMergedValue54 = productValue20;
                branchMergedValue55 = productValue19;
            }
            intermediateValue41 = branchMergedValue55;
            intermediateValue42 = branchMergedValue54;
            intermediateValue43 = branchMergedValue53;
            intermediateValue44 = branchMergedValue52;
            intermediateValue45 = branchMergedValue51;
            intermediateValue46 = branchMergedValue50;
            intermediateValue47 = branchMergedValue36;
            intermediateValue48 = branchMergedValue41;
            intermediateValue49 = branchMergedValue40;
            intermediateValue50 = branchMergedValue39;
            intermediateValue51 = branchMergedValue38;
            intermediateValue52 = branchMergedValue37;
            intermediateValue53 = branchMergedValue25;
            intermediateValue54 = branchMergedValue35;
            intermediateValue55 = branchMergedValue34;
            intermediateValue56 = branchMergedValue33;
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
            intermediateValue51 = 0.0f;
            intermediateValue52 = 0.0f;
            intermediateValue53 = 0.0f;
            intermediateValue54 = 1.0f;
            intermediateValue55 = 1.0f;
            intermediateValue56 = 1u;
        }
        float productValue42 = viewCbConstants[78u].z * sumValue5;
        float productValue43 = viewCbConstants[78u].w * sumValue7;
        float productValue44 = viewCbConstants[78u].z * (sumValue5 - sumValue2);
        float productValue45 = viewCbConstants[78u].w * (sumValue7 - sumValue1);
        float clampedValue = (productValue42 < 0.5f) ? min(clamp(((productValue44 < 0.0f) ? productValue42 : (1.0f - productValue42)) / (abs(productValue44) + 9.9999997473787516355514526367188e-06f), 0.0f, 1.0f), clamp(((productValue45 < 0.0f) ? productValue43 : (1.0f - productValue43)) / (abs(productValue45) + 9.9999997473787516355514526367188e-06f), 0.0f, 1.0f)) : 1.0f;
        float4 vectorValue = outputBufferIndirectDiffuse[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue45 = vectorValue.w;
        float4 vectorValue1 = outputBufferIndirectDiffuseChroma[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float intermediateValue92;
        float intermediateValue93;
        float comparisonValue17;
        if (comparisonValue10)
        {
            float comparisonValue15 = min(max(1.0f / max(intermediateValue54, 0.00999999977648258209228515625f), viewCbConstants[88u].z), (sumValue14 == 0.0f) ? 1.0f : 0.100000001490116119384765625f);
            float productValue46 = (comparisonValue15 * (scalarValue45 - intermediateValue50)) + intermediateValue50;
            float productValue47 = (comparisonValue15 * ((scalarValue45 * scalarValue45) - intermediateValue51)) + intermediateValue51;
            float exponentialValue = max(exp2((12.0f / intermediateValue54) + 1.0f) + (-10.55606365203857421875f), 0.0f);
            float comparisonValue16 = (intermediateValue56 != 0u) ? (exponentialValue + 1000000.0f) : exponentialValue;
            float productValue48 = max(0.0f, productValue47 - (productValue46 * productValue46));
            float sumValue25 = comparisonValue16 + productValue48;
            intermediateValue92 = productValue46;
            intermediateValue93 = productValue47;
            comparisonValue17 = (comparisonValue16 > productValue48) ? ((-0.0f) - sumValue25) : sumValue25;
        }
        else
        {
            intermediateValue92 = 0.0f;
            intermediateValue93 = 0.0f;
            comparisonValue17 = 0.0f;
        }
        outputBufferDiffuseMoments[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue92, intermediateValue93, intermediateValue92, intermediateValue92);
        float quotientValue1 = ((max(viewCbConstants[88u].y, 1.0f / intermediateValue54) + (-1.0f)) * clampedValue) + 1.0f;
        float intermediateValue94;
        if (asuint(viewCbConstants[91u]).y == 2u)
        {
            intermediateValue94 = 1.0f;
        }
        else
        {
            intermediateValue94 = asfloat(rdLoad_inputIncidentLight(4u).x);
        }
        float dotProductValue = dot(intermediateValue94.xxx, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        float productValue49 = dotProductValue * intermediateValue41;
        float productValue50 = dotProductValue * intermediateValue42;
        float productValue51 = dotProductValue * intermediateValue43;
        float productValue52 = dotProductValue * intermediateValue44;
        float productValue53 = dotProductValue * intermediateValue45;
        float productValue54 = dotProductValue * intermediateValue46;
        denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(((vectorValue.x - productValue49) * quotientValue1) + productValue49, ((vectorValue.y - productValue50) * quotientValue1) + productValue50, ((vectorValue.z - productValue51) * quotientValue1) + productValue51, ((scalarValue45 - productValue52) * quotientValue1) + productValue52);
        denoisingChromaAndVarianceOutputs[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(((vectorValue1.x - productValue53) * quotientValue1) + productValue53, ((vectorValue1.y - productValue54) * quotientValue1) + productValue54, 0.0f, comparisonValue17);
        float4 vectorValue2 = outputBufferIndirectSpecular[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue46 = vectorValue2.x;
        float4 loadedBufferValue15 = inputEmissiveAndLinearRoughness.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue47 = loadedBufferValue15.w;
        float4 vectorValue3 = outputBufferReflectionDistance[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue48 = vectorValue3.x;
        float sumValue26 = scalarValue48 + scalarValue1;
        float productValue55 = ((sumValue * 2.0f) * viewCbConstants[78u].z) + (-1.0f);
        float productValue56 = 1.0f - (viewCbConstants[78u].w * productValue1);
        float multiplyAddValue11 = mad(0.5f, viewCbConstants[22u].w, mad(productValue56, viewCbConstants[21u].w, productValue55 * viewCbConstants[20u].w)) + viewCbConstants[23u].w;
        float multiplyAddValue12 = ((mad(0.5f, viewCbConstants[22u].x, mad(productValue56, viewCbConstants[21u].x, productValue55 * viewCbConstants[20u].x)) + viewCbConstants[23u].x) / multiplyAddValue11) - viewCbConstants[72u].x;
        float multiplyAddValue13 = ((mad(0.5f, viewCbConstants[22u].y, mad(productValue56, viewCbConstants[21u].y, productValue55 * viewCbConstants[20u].y)) + viewCbConstants[23u].y) / multiplyAddValue11) - viewCbConstants[72u].y;
        float multiplyAddValue14 = ((mad(0.5f, viewCbConstants[22u].z, mad(productValue56, viewCbConstants[21u].z, productValue55 * viewCbConstants[20u].z)) + viewCbConstants[23u].z) / multiplyAddValue11) - viewCbConstants[72u].z;
        float inverseLengthValue5 = rsqrt(dot(float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), float3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14))) * sumValue26;
        float productValue57 = ((inverseLengthValue5 * multiplyAddValue12) - viewCbConstants[71u].x) + viewCbConstants[72u].x;
        float productValue59 = ((inverseLengthValue5 * multiplyAddValue13) - viewCbConstants[71u].y) + viewCbConstants[72u].y;
        float productValue60 = ((inverseLengthValue5 * multiplyAddValue14) - viewCbConstants[71u].z) + viewCbConstants[72u].z;
        float multiplyAddValue15 = mad(productValue60, viewCbConstants[26u].w, mad(productValue59, viewCbConstants[25u].w, productValue57 * viewCbConstants[24u].w)) + viewCbConstants[27u].w;
        float multiplyAddValue16 = (sumValue3 * 0.5f) * (((mad(productValue60, viewCbConstants[26u].x, mad(productValue59, viewCbConstants[25u].x, productValue57 * viewCbConstants[24u].x)) + viewCbConstants[27u].x) / multiplyAddValue15) - productValue55);
        float multiplyAddValue17 = (scalarValue5 * (-0.5f)) * (((mad(productValue60, viewCbConstants[26u].y, mad(productValue59, viewCbConstants[25u].y, productValue57 * viewCbConstants[24u].y)) + viewCbConstants[27u].y) / multiplyAddValue15) - productValue56);
        float sumValue27 = multiplyAddValue16 - productValue2;
        float sumValue28 = multiplyAddValue17 - productValue3;
        float nonlinearValue1 = max(sqrt((sumValue28 * sumValue28) + (sumValue27 * sumValue27)) + (-0.100000001490116119384765625f), 0.0f);
        float productValue61 = nonlinearValue1 * 0.02500000037252902984619140625f;
        float quotientValue2 = max(((scalarValue47 * scalarValue47) * scalarValue48) / sumValue26, scalarValue47 * 0.5f);
        float quotientValue3 = max(max(viewCbConstants[88u].w, 1.0f / intermediateValue55), min(productValue61, 1.0f) * 0.25f);
        float productValue62 = min(((1.0f - quotientValue2) * (1.0f - productValue61)) + productValue61, 1.0f);
        float intermediateValue106;
        float intermediateValue107;
        float intermediateValue108;
        float intermediateValue109;
        float intermediateValue110;
        float intermediateValue111;
        float intermediateValue113;
        if ((sumValue14 != 0.0f) && (productValue62 > 0.0f))
        {
            float sumValue29 = (multiplyAddValue16 + sumValue4) + (-0.5f);
            float sumValue32 = (multiplyAddValue17 + sumValue6) + (-0.5f);
            uint scalarValue49 = uint(int(floor(sumValue29)));
            uint scalarValue50 = uint(int(floor(sumValue32)));
            float scalarValue51 = frac(sumValue29);
            float scalarValue52 = frac(sumValue32);
            float nonlinearValue2 = log2(max(scalarValue48, 0.00999999977648258209228515625f));
            float intermediateValue112;
            float intermediateValue118;
            float intermediateValue120;
            float intermediateValue122;
            float intermediateValue124;
            float intermediateValue126;
            float scalarValue53 = 0.0f;
            uint scalarValue54 = 0u;
            float scalarValue55 = 0.0f;
            float scalarValue56 = 0.0f;
            float scalarValue57 = 0.0f;
            float scalarValue58 = 0.0f;
            float scalarValue59 = 0.0f;
            uint bitwiseValue11;
            uint sumValue30;
            uint sumValue31;
            float productValue58;
            uint reinterpretedBits10;
            bool comparisonValue18;
            for (;;)
            {
                uint bitwiseValue10 = scalarValue54 & 1u;
                bitwiseValue11 = scalarValue54 >> 1u;
                uint bitwiseValue12 = bitwiseValue11 & 1u;
                sumValue30 = bitwiseValue10 + scalarValue49;
                sumValue31 = bitwiseValue12 + scalarValue50;
                float sumValue33 = 1.0f - scalarValue51;
                float sumValue34 = 1.0f - scalarValue52;
                productValue58 = ((float(int(bitwiseValue12)) * (scalarValue52 - sumValue34)) + sumValue34) * ((float(int(bitwiseValue10)) * (scalarValue51 - sumValue33)) + sumValue33);
                reinterpretedBits10 = asuint(viewCbConstants[91u]).y;
                comparisonValue18 = reinterpretedBits10 == 2u;
                uint intermediateValue130;
                uint intermediateValue131;
                if (comparisonValue1)
                {
                    uint branchMergedValue28;
                    uint branchMergedValue48;
                    if (comparisonValue18)
                    {
                        branchMergedValue28 = sumValue30;
                        branchMergedValue48 = sumValue30;
                    }
                    else
                    {
                        uint productValue63 = uint(viewCbConstants[78u].x * 0.5f);
                        uint reinterpretedBits11 = (((reinterpretedBits10 == 0u) ? (asuint(viewCbConstants[84u]).z + 1u) : 0u) + sumValue31) & 1u;
                        uint branchMergedValue61;
                        uint branchMergedValue65;
                        if (sumValue30 < productValue63)
                        {
                            branchMergedValue61 = ((sumValue30 << 1u) | 1u) - reinterpretedBits11;
                            branchMergedValue65 = sumValue30;
                        }
                        else
                        {
                            branchMergedValue61 = reinterpretedBits11 | ((sumValue30 - productValue63) << 1u);
                            branchMergedValue65 = sumValue30;
                        }
                        branchMergedValue28 = branchMergedValue61;
                        branchMergedValue48 = branchMergedValue65;
                    }
                    intermediateValue130 = branchMergedValue48;
                    intermediateValue131 = branchMergedValue28;
                }
                else
                {
                    uint branchMergedValue29;
                    uint branchMergedValue49;
                    if (comparisonValue18)
                    {
                        branchMergedValue29 = sumValue30;
                        branchMergedValue49 = sumValue30;
                    }
                    else
                    {
                        branchMergedValue29 = sumValue30;
                        branchMergedValue49 = ((((((bitwiseValue11 + scalarValue50) ^ (scalarValue54 + scalarValue49)) & 1u) != 0u) != (((asuint(viewCbConstants[84u]).z & 1u) | reinterpretedBits10) != 0u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue30 >> 1u);
                    }
                    intermediateValue130 = branchMergedValue49;
                    intermediateValue131 = branchMergedValue29;
                }
                float branchMergedValue2;
                float branchMergedValue13;
                float branchMergedValue14;
                float branchMergedValue15;
                float branchMergedValue16;
                float branchMergedValue17;
                if (((int(sumValue31) < int(0u)) || (int(intermediateValue130) < int(intermediateValue11))) || ((int(sumValue31) >= int(intermediateValue13)) || (int(intermediateValue130) >= int(intermediateValue12))))
                {
                    branchMergedValue2 = scalarValue59;
                    branchMergedValue13 = scalarValue58;
                    branchMergedValue14 = scalarValue57;
                    branchMergedValue15 = scalarValue55;
                    branchMergedValue16 = scalarValue56;
                    branchMergedValue17 = scalarValue53;
                }
                else
                {
                    uint productValue65 = uint(min(max(float(uint(viewCbConstants[88u].x * float(intermediateValue130))), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x));
                    uint productValue66 = uint(min(max(float(uint(viewCbConstants[88u].x * float(sumValue31))), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x));
                    float productValue67 = scalarValue47 * (-0.25f);
                    float4 loadedBufferValue16 = previousPrimaryNormalBuffer.Load(int3(uint2(productValue65, productValue66), 0u));
                    float scalarValue60 = loadedBufferValue16.x;
                    float scalarValue61 = loadedBufferValue16.y;
                    float sumValue35 = 1.0f - abs(scalarValue60);
                    float scalarValue62 = abs(scalarValue61);
                    float sumValue36 = sumValue35 - scalarValue62;
                    bool conditionValue3 = sumValue36 < 0.0f;
                    float comparisonValue19 = conditionValue3 ? ((1.0f - scalarValue62) * ((scalarValue60 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue60;
                    float comparisonValue20 = conditionValue3 ? (((scalarValue61 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue35) : scalarValue61;
                    float inverseLengthValue6 = rsqrt(dot(float3(comparisonValue19, comparisonValue20, sumValue36), float3(comparisonValue19, comparisonValue20, sumValue36)));
                    float sumValue37 = 0.050000011920928955078125f - productValue67;
                    float4 loadedBufferValue17 = previousPrimaryPathLengthBuffer.Load(int3(uint2(productValue65, productValue66), 0u));
                    float scalarValue63 = loadedBufferValue17.x;
                    float productValue68 = (((float(int(intermediateValue131)) + 0.5f) * 2.0f) * viewCbConstants[78u].z) + (-1.0f);
                    float productValue69 = 1.0f - (((float(int(sumValue31)) + 0.5f) * 2.0f) * viewCbConstants[78u].w);
                    float multiplyAddValue19 = mad(0.5f, viewCbConstants[34u].w, mad(productValue69, viewCbConstants[33u].w, viewCbConstants[32u].w * productValue68)) + viewCbConstants[35u].w;
                    float multiplyAddValue20 = ((mad(0.5f, viewCbConstants[34u].x, mad(productValue69, viewCbConstants[33u].x, viewCbConstants[32u].x * productValue68)) + viewCbConstants[35u].x) / multiplyAddValue19) - viewCbConstants[73u].x;
                    float multiplyAddValue21 = ((mad(0.5f, viewCbConstants[34u].y, mad(productValue69, viewCbConstants[33u].y, viewCbConstants[32u].y * productValue68)) + viewCbConstants[35u].y) / multiplyAddValue19) - viewCbConstants[73u].y;
                    float multiplyAddValue22 = ((mad(0.5f, viewCbConstants[34u].z, mad(productValue69, viewCbConstants[33u].z, viewCbConstants[32u].z * productValue68)) + viewCbConstants[35u].z) / multiplyAddValue19) - viewCbConstants[73u].z;
                    float inverseLengthValue7 = rsqrt(dot(float3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22), float3(multiplyAddValue20, multiplyAddValue21, multiplyAddValue22)));
                    float loadedBufferValue18 = clamp(mad(abs(nonlinearValue2 - log2(max(previousReflectionDistanceBuffer.Load(int3(uint2(productValue65, productValue66), 0u)).x, 0.00999999977648258209228515625f))), -2.0f, 2.0f), 0.0f, 1.0f);
                    float loadedBufferValue19 = (((1.0f - loadedBufferValue18) * scalarValue47) + loadedBufferValue18) * ((abs(multiplyAddValue4 - dot(float3(mad(multiplyAddValue20 * inverseLengthValue7, scalarValue63, viewCbConstants[73u].x), mad(multiplyAddValue21 * inverseLengthValue7, scalarValue63, viewCbConstants[73u].y), mad(multiplyAddValue22 * inverseLengthValue7, scalarValue63, viewCbConstants[73u].z)), float3(productValue4, productValue5, productValue6))) > multiplyAddValue5) ? 0.0f : ((productValue58 * clamp(mad(dot(float3(productValue15, productValue7, productValue16), float3(comparisonValue19 * inverseLengthValue6, comparisonValue20 * inverseLengthValue6, inverseLengthValue6 * sumValue36)), 1.0f / sumValue37, ((-0.0f) - (productValue67 + 0.949999988079071044921875f)) / sumValue37), 0.0f, 1.0f)) * clamp(mad(abs(scalarValue47 - previousLinearRoughnessBuffer.Load(int3(uint2(productValue65, productValue66), 0u)).x), -12.5f, 1.5f), 0.0f, 1.0f)));
                    float4 loadedBufferValue20 = previousSpecularBuffer.Load(int3(uint2(productValue65, productValue66), 0u));
                    float4 loadedBufferValue21 = inputFinalSpecularMoments.Load(int3(uint2(intermediateValue130, sumValue31), 0u));
                    branchMergedValue2 = (loadedBufferValue21.y * loadedBufferValue19) + scalarValue59;
                    branchMergedValue13 = (loadedBufferValue21.x * loadedBufferValue19) + scalarValue58;
                    branchMergedValue14 = (loadedBufferValue19 * loadedBufferValue20.z) + scalarValue57;
                    branchMergedValue15 = (loadedBufferValue19 * loadedBufferValue20.x) + scalarValue55;
                    branchMergedValue16 = (loadedBufferValue19 * loadedBufferValue20.y) + scalarValue56;
                    branchMergedValue17 = loadedBufferValue19 + scalarValue53;
                }
                intermediateValue126 = branchMergedValue2;
                intermediateValue124 = branchMergedValue13;
                intermediateValue122 = branchMergedValue14;
                intermediateValue118 = branchMergedValue15;
                intermediateValue120 = branchMergedValue16;
                intermediateValue112 = branchMergedValue17;
                uint sumValue38 = scalarValue54 + 1u;
                if (sumValue38 == 4u)
                {
                    break;
                }
                else
                {
                    scalarValue53 = intermediateValue112;
                    scalarValue54 = sumValue38;
                    scalarValue55 = intermediateValue118;
                    scalarValue56 = intermediateValue120;
                    scalarValue57 = intermediateValue122;
                    scalarValue58 = intermediateValue124;
                    scalarValue59 = intermediateValue126;
                    continue;
                }
            }
            float branchMergedValue27;
            float branchMergedValue42;
            float branchMergedValue43;
            float branchMergedValue44;
            float branchMergedValue45;
            float branchMergedValue46;
            float branchMergedValue47;
            if (intermediateValue112 > 0.00999999977648258209228515625f)
            {
                branchMergedValue27 = quotientValue3;
                branchMergedValue42 = intermediateValue112;
                branchMergedValue43 = (((intermediateValue126 / intermediateValue112) - intermediateValue53) * productValue62) + intermediateValue53;
                branchMergedValue44 = (((intermediateValue124 / intermediateValue112) - intermediateValue52) * productValue62) + intermediateValue52;
                branchMergedValue45 = (((intermediateValue122 / intermediateValue112) - intermediateValue49) * productValue62) + intermediateValue49;
                branchMergedValue46 = (((intermediateValue120 / intermediateValue112) - intermediateValue48) * productValue62) + intermediateValue48;
                branchMergedValue47 = (((intermediateValue118 / intermediateValue112) - intermediateValue47) * productValue62) + intermediateValue47;
            }
            else
            {
                branchMergedValue27 = 1.0f;
                branchMergedValue42 = intermediateValue112;
                branchMergedValue43 = intermediateValue53;
                branchMergedValue44 = intermediateValue52;
                branchMergedValue45 = intermediateValue49;
                branchMergedValue46 = intermediateValue48;
                branchMergedValue47 = intermediateValue47;
            }
            intermediateValue106 = branchMergedValue47;
            intermediateValue107 = branchMergedValue46;
            intermediateValue108 = branchMergedValue45;
            intermediateValue109 = branchMergedValue44;
            intermediateValue110 = branchMergedValue43;
            intermediateValue111 = branchMergedValue42;
            intermediateValue113 = branchMergedValue27;
        }
        else
        {
            intermediateValue106 = intermediateValue47;
            intermediateValue107 = intermediateValue48;
            intermediateValue108 = intermediateValue49;
            intermediateValue109 = intermediateValue52;
            intermediateValue110 = intermediateValue53;
            intermediateValue111 = sumValue14;
            intermediateValue113 = quotientValue3;
        }
        float intermediateValue127;
        float intermediateValue128;
        float multiplyAddValue18;
        if (comparisonValue11)
        {
            float dotProductValue1 = dot(float3(scalarValue46, vectorValue2.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float comparisonValue21 = min(max(1.0f / max(intermediateValue55, 0.00999999977648258209228515625f), viewCbConstants[89u].x), (intermediateValue111 == 0.0f) ? 1.0f : 0.100000001490116119384765625f);
            float productValue71 = (comparisonValue21 * (dotProductValue1 - intermediateValue109)) + intermediateValue109;
            float productValue72 = (comparisonValue21 * ((dotProductValue1 * dotProductValue1) - intermediateValue110)) + intermediateValue110;
            float exponentialValue1 = max(exp2((12.0f / intermediateValue55) + 1.0f) + (-10.55606365203857421875f), 0.0f);
            float comparisonValue22 = (intermediateValue56 != 0u) ? (exponentialValue1 + 1000000.0f) : exponentialValue1;
            float productValue74 = max(0.0f, productValue72 - (productValue71 * productValue71));
            float sumValue39 = comparisonValue22 + productValue74;
            intermediateValue127 = productValue71;
            intermediateValue128 = productValue72;
            multiplyAddValue18 = ((comparisonValue22 > productValue74) ? ((-0.0f) - sumValue39) : sumValue39) * mad(productValue62, (nonlinearValue1 * 200.0f) * quotientValue2, 1.0f);
        }
        else
        {
            intermediateValue127 = 0.0f;
            intermediateValue128 = 0.0f;
            multiplyAddValue18 = 0.0f;
        }
        outputBufferSpecularMoments[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue127, intermediateValue128, intermediateValue127, intermediateValue127);
        float productValue75 = ((intermediateValue113 + (-1.0f)) * clampedValue) + 1.0f;
        float intermediateValue129;
        if (asuint(viewCbConstants[91u]).y == 2u)
        {
            intermediateValue129 = 1.0f;
        }
        else
        {
            intermediateValue129 = asfloat(rdLoad_inputIncidentLight(4u).x);
        }
        float productValue76 = intermediateValue129 * intermediateValue106;
        float productValue77 = intermediateValue129 * intermediateValue107;
        float productValue78 = intermediateValue129 * intermediateValue108;
        denoisingOutputs[reinterpretedBits2][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(((scalarValue46 - productValue76) * productValue75) + productValue76, ((vectorValue2.y - productValue77) * productValue75) + productValue77, ((vectorValue2.z - productValue78) * productValue75) + productValue78, multiplyAddValue18);
        float productValue79 = intermediateValue54 * 0.0039215688593685626983642578125f;
        outputBufferHistoryLength[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(productValue79, 0.0039215688593685626983642578125f / productValue75, productValue79, productValue79);
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
