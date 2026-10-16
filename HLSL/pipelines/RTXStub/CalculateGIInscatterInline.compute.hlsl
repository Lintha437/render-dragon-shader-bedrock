// RTXStub / CalculateGIInscatterInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 22
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    precise float productValue = float(dispatchThreadId.x) * viewCbConstants[81u].x;
    precise float sumValue = productValue + (-1.0f);
    precise float productValue1 = float(dispatchThreadId.z) * viewCbConstants[57u].z;
    uint bitwiseValue = dispatchThreadId.z & 3u;
    uint4 reinterpretedBits = asuint(viewCbConstants[84u]);
    uint scalarValue = reinterpretedBits.z;
    uint bitwiseValue1 = dispatchThreadId.x & 65535u;
    uint bitwiseValue2 = dispatchThreadId.y & 65535u;
    uint bitwiseValue3 = ((bitwiseValue1 << 8u) | bitwiseValue1) & 16711935u;
    uint bitwiseValue4 = ((bitwiseValue3 << 4u) | bitwiseValue3) & 252645135u;
    uint bitwiseValue5 = ((bitwiseValue4 << 2u) | bitwiseValue4) & 858993459u;
    uint bitwiseValue6 = ((bitwiseValue2 << 8u) | bitwiseValue2) & 16711935u;
    uint bitwiseValue7 = ((bitwiseValue6 << 4u) | bitwiseValue6) & 252645135u;
    uint bitwiseValue8 = ((bitwiseValue7 << 2u) | bitwiseValue7) & 858993459u;
    uint bitwiseValue9;
    uint sumValue1;
    uint intermediateValue1;
    uint intermediateValue2;
    bitwiseValue9 = (((((bitwiseValue8 << 1u) | bitwiseValue8) << 1u) & 2863311530u) | (((bitwiseValue5 << 1u) | bitwiseValue5) & 1431655765u)) + scalarValue;
    sumValue1 = scalarValue + bitwiseValue;
    intermediateValue1 = 0u;
    intermediateValue2 = 0u;
    uint bitwiseValue10;
    for (;;)
    {
        uint sumValue2 = intermediateValue1 + 2654435769u;
        bitwiseValue10 = ((((sumValue1 >> 5u) + 3355524772u) ^ ((sumValue1 << 4u) + 2738958700u)) ^ (sumValue2 + sumValue1)) + bitwiseValue9;
        uint sumValue3 = intermediateValue2 + 1u;
        if (sumValue3 == 16u)
        {
            break;
        }
        else
        {
            bitwiseValue9 = bitwiseValue10;
            sumValue1 = ((((bitwiseValue10 << 4u) + 2911926141u) ^ (bitwiseValue10 + sumValue2)) ^ ((bitwiseValue10 >> 5u) + 2123724318u)) + sumValue1;
            intermediateValue1 = sumValue2;
            intermediateValue2 = sumValue3;
        }
    }
    precise float productValue2 = float(dispatchThreadId.y) * viewCbConstants[81u].y;
    precise float sumValue4 = productValue2 + 1.0f;
    precise float productValue3 = viewCbConstants[57u].z * 0.5f;
    precise float sumValue5 = productValue3 + productValue1;
    uint productValue4 = (bitwiseValue10 * 1664525u) + 1013904223u;
    precise float bitwiseValue11 = float(productValue4 & 16777215u) * 5.9604644775390625e-08f;
    uint productValue5 = (productValue4 * 1664525u) + 1013904223u;
    precise float bitwiseValue12 = float(productValue5 & 16777215u) * 5.9604644775390625e-08f;
    precise float bitwiseValue13 = float(((productValue5 * 1664525u) + 7271263u) & 16777215u) * 5.9604644775390625e-08f;
    precise float productValue6 = bitwiseValue11 * 2.0f;
    precise float productValue7 = bitwiseValue12 * 2.0f;
    precise float productValue8 = bitwiseValue13 * 2.0f;
    precise float sumValue6 = productValue6 + (-1.0f);
    precise float sumValue7 = productValue7 + (-1.0f);
    precise float sumValue8 = productValue8 + (-1.0f);
    float exponentialValue = (exp2(sumValue5 * 3.45943164825439453125f) + (-1.0f)) * 5.0f;
    precise float productValue9 = productValue1 * 3.45943164825439453125f;
    precise float exponentialValue1 = exp2(productValue9) + (-1.0f);
    precise float productValue10 = exponentialValue1 * 50.0f;
    precise float quotientValue = productValue10 / 10.0f;
    float productValue11 = viewCbConstants[78u].w * 2.0f;
    float productValue12 = productValue11 * viewCbConstants[81u].w;
    float productValue13 = ((viewCbConstants[78u].z * viewCbConstants[81u].z) * 2.0f) + sumValue;
    float sumValue9 = sumValue4 - productValue12;
    float multiplyAddValue = mad(0.5f, viewCbConstants[22u].w, mad(sumValue9, viewCbConstants[21u].w, viewCbConstants[20u].w * productValue13)) + viewCbConstants[23u].w;
    float multiplyAddValue1 = ((mad(0.5f, viewCbConstants[22u].x, mad(sumValue9, viewCbConstants[21u].x, viewCbConstants[20u].x * productValue13)) + viewCbConstants[23u].x) / multiplyAddValue) - viewCbConstants[72u].x;
    float multiplyAddValue2 = ((mad(0.5f, viewCbConstants[22u].y, mad(sumValue9, viewCbConstants[21u].y, viewCbConstants[20u].y * productValue13)) + viewCbConstants[23u].y) / multiplyAddValue) - viewCbConstants[72u].y;
    float multiplyAddValue3 = ((mad(0.5f, viewCbConstants[22u].z, mad(sumValue9, viewCbConstants[21u].z, viewCbConstants[20u].z * productValue13)) + viewCbConstants[23u].z) / multiplyAddValue) - viewCbConstants[72u].z;
    float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3), float3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3)));
    float multiplyAddValue4 = viewCbConstants[69u].x + mad(multiplyAddValue1 * inverseLengthValue, exponentialValue, viewCbConstants[72u].x);
    float multiplyAddValue5 = viewCbConstants[69u].y + mad(multiplyAddValue2 * inverseLengthValue, exponentialValue, viewCbConstants[72u].y);
    float multiplyAddValue6 = viewCbConstants[69u].z + mad(multiplyAddValue3 * inverseLengthValue, exponentialValue, viewCbConstants[72u].z);
    float multiplyAddValue7 = mad(multiplyAddValue6, viewCbConstants[26u].w, mad(multiplyAddValue5, viewCbConstants[25u].w, multiplyAddValue4 * viewCbConstants[24u].w)) + viewCbConstants[27u].w;
    float multiplyAddValue8 = (mad(multiplyAddValue6, viewCbConstants[26u].x, mad(multiplyAddValue5, viewCbConstants[25u].x, multiplyAddValue4 * viewCbConstants[24u].x)) + viewCbConstants[27u].x) / multiplyAddValue7;
    float multiplyAddValue9 = (mad(multiplyAddValue6, viewCbConstants[26u].y, mad(multiplyAddValue5, viewCbConstants[25u].y, multiplyAddValue4 * viewCbConstants[24u].y)) + viewCbConstants[27u].y) / multiplyAddValue7;
    bool reinterpretedBits1 = ((abs(multiplyAddValue8) < 1.0099999904632568359375f) && (abs(multiplyAddValue9) < 1.0099999904632568359375f)) && (asuint(viewCbConstants[55u]).w != 0u);
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if (reinterpretedBits1)
    {
        float multiplyAddValue10 = mad(multiplyAddValue6, viewCbConstants[30u].x, mad(multiplyAddValue5, viewCbConstants[29u].x, viewCbConstants[28u].x * multiplyAddValue4)) + viewCbConstants[31u].x;
        float multiplyAddValue11 = mad(multiplyAddValue6, viewCbConstants[30u].y, mad(multiplyAddValue5, viewCbConstants[29u].y, viewCbConstants[28u].y * multiplyAddValue4)) + viewCbConstants[31u].y;
        float multiplyAddValue12 = mad(multiplyAddValue6, viewCbConstants[30u].z, mad(multiplyAddValue5, viewCbConstants[29u].z, viewCbConstants[28u].z * multiplyAddValue4)) + viewCbConstants[31u].z;
        float multiplyAddValue13 = mad(mad(multiplyAddValue8, 0.5f, 0.5f), (viewCbConstants[56u].x + (-1.0f)) * viewCbConstants[57u].x, viewCbConstants[57u].x * 0.5f);
        float multiplyAddValue14 = mad(mad(multiplyAddValue9, -0.5f, 0.5f), (viewCbConstants[56u].y + (-1.0f)) * viewCbConstants[57u].y, viewCbConstants[57u].y * 0.5f);
        float nonlinearValue = log2((sqrt(((multiplyAddValue11 * multiplyAddValue11) + (multiplyAddValue10 * multiplyAddValue10)) + (multiplyAddValue12 * multiplyAddValue12)) * 0.20000000298023223876953125f) + 1.0f) * 0.289064824581146240234375f;
        float4 sampledTextureValue = volumetricGIInscatterPrevious.SampleLevel(linearSampler, float3(multiplyAddValue13, multiplyAddValue14, nonlinearValue), 0.0f);
        intermediateValue3 = sampledTextureValue.x;
        intermediateValue4 = sampledTextureValue.y;
        intermediateValue5 = sampledTextureValue.z;
        intermediateValue6 = sampledTextureValue.w;
        intermediateValue7 = multiplyAddValue13;
        intermediateValue8 = multiplyAddValue14;
        intermediateValue9 = nonlinearValue;
    }
    else
    {
        intermediateValue3 = 0.0f;
        intermediateValue4 = 0.0f;
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
        intermediateValue7 = 0.0f;
        intermediateValue8 = 0.0f;
        intermediateValue9 = 0.0f;
    }
    precise float productValue14 = viewCbConstants[57u].x * sumValue6;
    precise float productValue15 = viewCbConstants[57u].y * sumValue7;
    precise float sumValue10 = sumValue + productValue14;
    precise float sumValue11 = productValue15 + sumValue4;
    precise float sumValue12 = viewCbConstants[78u].x + (-1.0f);
    precise float sumValue13 = viewCbConstants[78u].y + (-1.0f);
    precise float productValue16 = sumValue10 * 0.5f;
    precise float sumValue14 = productValue16 + 0.5f;
    precise float productValue17 = sumValue11 * (-0.5f);
    precise float sumValue15 = productValue17 + 0.5f;
    precise float clampedValue = clamp(sumValue14, 0.0f, 1.0f) * sumValue12;
    precise float sumValue16 = clampedValue + 0.5f;
    precise float clampedValue1 = clamp(sumValue15, 0.0f, 1.0f) * sumValue13;
    precise float sumValue17 = clampedValue1 + 0.5f;
    uint sumValue18 = uint(min(int(uint(max(int(uint(int(sumValue16))), int(0u)))), int(uint(int(viewCbConstants[78u].x)) + 4294967295u)));
    uint sumValue19 = uint(min(int(uint(max(int(uint(int(sumValue17))), int(0u)))), int(uint(int(viewCbConstants[78u].y)) + 4294967295u)));
    uint4 reinterpretedBits2 = asuint(viewCbConstants[91u]);
    uint scalarValue1 = reinterpretedBits2.y;
    uint comparisonValue;
    if (scalarValue1 == 2u)
    {
        comparisonValue = sumValue18;
    }
    else
    {
        comparisonValue = ((((sumValue19 ^ sumValue18) & 1u) != (uint(((scalarValue & 1u) != 0u) && (scalarValue1 == 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue18 >> 1u);
    }
    float loadedBufferValue = abs(inputPrimaryWorldPosition.Load(int3(uint2(comparisonValue, sumValue19), 0u)).w);
    uint sumValue20 = scalarValue + dispatchThreadId.z;
    uint bitwiseValue14 = dispatchThreadId.x & 255u;
    uint bitwiseValue15 = dispatchThreadId.y & 255u;
    float4 loadedBufferValue1 = blueNoiseTexture.Load(int4(uint3(bitwiseValue14, bitwiseValue15, (sumValue20 >> 2u) & 127u), 0u));
    uint bitwiseValue16 = sumValue20 & 3u;
    float intermediateValue11;
    if (bitwiseValue16 == 0u)
    {
        intermediateValue11 = loadedBufferValue1.x;
    }
    else
    {
        float branchMergedValue;
        if (bitwiseValue16 == 1u)
        {
            branchMergedValue = loadedBufferValue1.y;
        }
        else
        {
            branchMergedValue = (bitwiseValue16 == 2u) ? loadedBufferValue1.z : loadedBufferValue1.w;
        }
        intermediateValue11 = branchMergedValue;
    }
    precise float sumValue21 = intermediateValue11 + (-0.5f);
    precise float productValue18 = sumValue21 * viewCbConstants[57u].z;
    precise float sumValue22 = productValue18 + sumValue5;
    precise float productValue19 = sumValue22 * 3.45943164825439453125f;
    precise float exponentialValue2 = exp2(productValue19) + (-1.0f);
    precise float productValue20 = exponentialValue2 * 50.0f;
    precise float quotientValue1 = productValue20 / 10.0f;
    float intermediateValue12;
    if (loadedBufferValue == 65504.0f)
    {
        intermediateValue12 = quotientValue1;
    }
    else
    {
        precise float productValue21 = loadedBufferValue * 0.9900000095367431640625f;
        precise float sumValue23 = productValue21 + (-0.00999999977648258209228515625f);
        intermediateValue12 = min(sumValue23, quotientValue1);
    }
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if (intermediateValue12 < quotientValue)
    {
        float sumValue24 = max(intermediateValue6 + (-1.0f), 0.0f);
        float branchMergedValue1;
        float branchMergedValue5;
        float branchMergedValue6;
        float branchMergedValue7;
        if (reinterpretedBits1 && (sumValue24 > 0.0f))
        {
            float multiplyAddValue15 = clamp(mad(sumValue24, 0.3333333432674407958984375f, -0.3333333432674407958984375f), 0.0f, 1.0f) + 0.001000000047497451305389404296875f;
            float4 sampledTextureValue1 = volumetricGIInscatterPrevious.SampleLevel(linearSampler, float3(mad(sumValue6, viewCbConstants[57u].x, intermediateValue7), mad(sumValue7, viewCbConstants[57u].y, intermediateValue8), mad(sumValue8, viewCbConstants[57u].z, intermediateValue9)), 0.0f);
            float scalarValue2 = sampledTextureValue1.w;
            float multiplyAddValue16 = clamp(mad(scalarValue2, 0.3333333432674407958984375f, -0.3333333432674407958984375f), 0.0f, 1.0f) + 0.001000000047497451305389404296875f;
            float sumValue25 = multiplyAddValue16 + multiplyAddValue15;
            float branchMergedValue12;
            float branchMergedValue14;
            float branchMergedValue15;
            float branchMergedValue16;
            if (sumValue25 > 0.0f)
            {
                branchMergedValue12 = ((multiplyAddValue16 * sampledTextureValue1.x) + (multiplyAddValue15 * intermediateValue3)) / sumValue25;
                branchMergedValue14 = ((multiplyAddValue16 * scalarValue2) + (multiplyAddValue15 * sumValue24)) / sumValue25;
                branchMergedValue15 = ((multiplyAddValue16 * sampledTextureValue1.z) + (multiplyAddValue15 * intermediateValue5)) / sumValue25;
                branchMergedValue16 = ((multiplyAddValue16 * sampledTextureValue1.y) + (multiplyAddValue15 * intermediateValue4)) / sumValue25;
            }
            else
            {
                branchMergedValue12 = 0.0f;
                branchMergedValue14 = 0.0f;
                branchMergedValue15 = 0.0f;
                branchMergedValue16 = 0.0f;
            }
            branchMergedValue1 = branchMergedValue12;
            branchMergedValue5 = branchMergedValue14;
            branchMergedValue6 = branchMergedValue15;
            branchMergedValue7 = branchMergedValue16;
        }
        else
        {
            branchMergedValue1 = intermediateValue3 * 0.800000011920928955078125f;
            branchMergedValue5 = sumValue24;
            branchMergedValue6 = intermediateValue5 * 0.800000011920928955078125f;
            branchMergedValue7 = intermediateValue4 * 0.800000011920928955078125f;
        }
        intermediateValue14 = branchMergedValue1;
        intermediateValue15 = branchMergedValue7;
        intermediateValue16 = branchMergedValue6;
        intermediateValue17 = branchMergedValue5;
    }
    else
    {
        float productValue22 = ((viewCbConstants[78u].z * 2.0f) * ((viewCbConstants[81u].z + 0.5f) + float(int(sumValue18)))) + (-1.0f);
        float productValue23 = (1.0f - (productValue11 * (float(int(sumValue19)) + 0.5f))) - productValue12;
        float multiplyAddValue17 = mad(0.5f, viewCbConstants[22u].w, mad(productValue23, viewCbConstants[21u].w, productValue22 * viewCbConstants[20u].w)) + viewCbConstants[23u].w;
        float multiplyAddValue18 = ((mad(0.5f, viewCbConstants[22u].x, mad(productValue23, viewCbConstants[21u].x, productValue22 * viewCbConstants[20u].x)) + viewCbConstants[23u].x) / multiplyAddValue17) - viewCbConstants[72u].x;
        float multiplyAddValue19 = ((mad(0.5f, viewCbConstants[22u].y, mad(productValue23, viewCbConstants[21u].y, productValue22 * viewCbConstants[20u].y)) + viewCbConstants[23u].y) / multiplyAddValue17) - viewCbConstants[72u].y;
        float multiplyAddValue20 = ((mad(0.5f, viewCbConstants[22u].z, mad(productValue23, viewCbConstants[21u].z, productValue22 * viewCbConstants[20u].z)) + viewCbConstants[23u].z) / multiplyAddValue17) - viewCbConstants[72u].z;
        float inverseLengthValue1 = rsqrt(dot(float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), float3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
        float multiplyAddValue21 = mad(inverseLengthValue1 * multiplyAddValue19, intermediateValue12, viewCbConstants[72u].y);
        float multiplyAddValue22;
        if (asuint(viewCbConstants[54u]).w == 0u)
        {
            multiplyAddValue22 = clamp(mad(multiplyAddValue21, viewCbConstants[90u].z, viewCbConstants[90u].w), 0.0f, 1.0f);
        }
        else
        {
            multiplyAddValue22 = 1.0f;
        }
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if (asuint(viewCbConstants[86u]).z == 0u)
        {
            intermediateValue18 = 0.0f;
            intermediateValue19 = 0.0f;
            intermediateValue20 = 0.0f;
        }
        else
        {
            float4 loadedBufferValue2 = blueNoiseTexture.Load(int4(uint3(bitwiseValue14, bitwiseValue15, scalarValue & 127u), 0u));
            float intermediateValue21;
            if (bitwiseValue == 0u)
            {
                intermediateValue21 = loadedBufferValue2.x;
            }
            else
            {
                float branchMergedValue2;
                if (bitwiseValue == 1u)
                {
                    branchMergedValue2 = loadedBufferValue2.y;
                }
                else
                {
                    branchMergedValue2 = (bitwiseValue == 2u) ? loadedBufferValue2.z : loadedBufferValue2.w;
                }
                intermediateValue21 = branchMergedValue2;
            }
            float productValue24 = intermediateValue21 * 40502.859375f;
            float productValue25 = (productValue24 - floor(productValue24)) * 6.283185482025146484375f;
            float productValue26 = 0.9999847412109375f - (intermediateValue21 * 2.0f);
            float clampedValue2 = sqrt(clamp(1.0f - (productValue26 * productValue26), 0.0f, 1.0f));
            float wavePhaseValue = cos(productValue25) * clampedValue2;
            float wavePhaseValue1 = sin(productValue25) * clampedValue2;
            RayDesc _2ident = {float3(mad(inverseLengthValue1 * multiplyAddValue18, intermediateValue12, viewCbConstants[72u].x), multiplyAddValue21, mad(inverseLengthValue1 * multiplyAddValue20, intermediateValue12, viewCbConstants[72u].z)), 0.0f, float3(wavePhaseValue, wavePhaseValue1, productValue26), 10000.0f};
            intermediateValue22.TraceRayInline(SceneBVH, 512u, 159u, _2ident);
            bool conditionValue = intermediateValue22.Proceed();
            if (conditionValue)
            {
                bool intermediateValue35;
                bool comparisonValue1;
                for (;;)
                {
                    uint scalarValue3 = intermediateValue22.CandidateType();
                    comparisonValue1 = scalarValue3 == 0u;
                    if (comparisonValue1)
                    {
                        float2 vectorValue = intermediateValue22.CandidateTriangleBarycentrics();
                        float2 vectorValue1 = intermediateValue22.CandidateTriangleBarycentrics();
                        uint scalarValue4 = intermediateValue22.CandidatePrimitiveIndex();
                        uint scalarValue5 = intermediateValue22.CandidateInstanceID();
                        uint scalarValue6 = intermediateValue22.CandidateInstanceIndex();
                        uint productValue27 = (scalarValue6 * 76u) + 58u;
                        uint productValue28 = (scalarValue6 * 76u) + 61u;
                        precise float sumValue26 = 1.0f - vectorValue.x;
                        precise float sumValue27 = sumValue26 - vectorValue1.y;
                        uint bitwiseValue18 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue6 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue4 >> 1u);
                        uint productValue29 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue6 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue2 = (scalarValue4 & 1u) == 0u;
                        uint comparisonValue3 = comparisonValue2 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue29), bitwiseValue18 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue29), bitwiseValue18 * 16 + 0).x;
                        uint comparisonValue4 = comparisonValue2 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue29), bitwiseValue18 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue29), bitwiseValue18 * 16 + 0).w;
                        uint comparisonValue5 = comparisonValue2 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue29), bitwiseValue18 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue29), bitwiseValue18 * 16 + 0).z;
                        bool productValue30 = rdByteLoad_objectInstances_uint16_t(0u, productValue28 * 2 + 0) < 0u;
                        float intermediateValue40;
                        float intermediateValue41;
                        if (productValue30)
                        {
                            uint bitwiseValue19 = comparisonValue5 >> 15u;
                            precise float bitwiseValue20 = float(bitwiseValue19 & 1u) * 2.0f;
                            precise float sumValue28 = bitwiseValue20 + (-1.0f);
                            precise float bitwiseValue21 = float(comparisonValue5 >> 31u) * 2.0f;
                            precise float sumValue29 = bitwiseValue21 + (-1.0f);
                            precise float bitwiseValue22 = float((comparisonValue5 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue23 = float(bitwiseValue19 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue31 = sumValue28 * 3.0517578125e-05f;
                            precise float productValue32 = sumValue29 * 3.0517578125e-05f;
                            precise float sumValue30 = bitwiseValue22 + productValue31;
                            precise float sumValue31 = bitwiseValue23 + productValue32;
                            intermediateValue40 = sumValue30;
                            intermediateValue41 = sumValue31;
                        }
                        else
                        {
                            precise float bitwiseValue24 = float(comparisonValue5 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue25 = float(comparisonValue5 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue33 = bitwiseValue24 * 16384.0f;
                            precise float sumValue32 = productValue33 + 0.5f;
                            precise float productValue34 = bitwiseValue25 * 16384.0f;
                            precise float sumValue33 = productValue34 + 0.5f;
                            precise float productValue35 = floor(sumValue32) * 6.103515625e-05f;
                            precise float productValue36 = floor(sumValue33) * 6.103515625e-05f;
                            intermediateValue40 = productValue35;
                            intermediateValue41 = productValue36;
                        }
                        precise float productValue37 = sumValue27 * intermediateValue40;
                        precise float productValue38 = sumValue27 * intermediateValue41;
                        precise float sumValue34 = productValue37 + 0.0f;
                        precise float sumValue35 = productValue38 + 0.0f;
                        float intermediateValue48;
                        float intermediateValue49;
                        if (productValue30)
                        {
                            uint bitwiseValue26 = comparisonValue4 >> 15u;
                            precise float bitwiseValue27 = float(bitwiseValue26 & 1u) * 2.0f;
                            precise float sumValue36 = bitwiseValue27 + (-1.0f);
                            precise float bitwiseValue28 = float(comparisonValue4 >> 31u) * 2.0f;
                            precise float sumValue37 = bitwiseValue28 + (-1.0f);
                            precise float bitwiseValue29 = float((comparisonValue4 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue30 = float(bitwiseValue26 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue39 = sumValue36 * 3.0517578125e-05f;
                            precise float productValue40 = sumValue37 * 3.0517578125e-05f;
                            precise float sumValue38 = bitwiseValue29 + productValue39;
                            precise float sumValue39 = bitwiseValue30 + productValue40;
                            intermediateValue48 = sumValue38;
                            intermediateValue49 = sumValue39;
                        }
                        else
                        {
                            precise float bitwiseValue31 = float(comparisonValue4 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue32 = float(comparisonValue4 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue41 = bitwiseValue31 * 16384.0f;
                            precise float sumValue40 = productValue41 + 0.5f;
                            precise float productValue42 = bitwiseValue32 * 16384.0f;
                            precise float sumValue41 = productValue42 + 0.5f;
                            precise float productValue43 = floor(sumValue40) * 6.103515625e-05f;
                            precise float productValue44 = floor(sumValue41) * 6.103515625e-05f;
                            intermediateValue48 = productValue43;
                            intermediateValue49 = productValue44;
                        }
                        precise float productValue45 = vectorValue.x * intermediateValue48;
                        precise float productValue46 = vectorValue.x * intermediateValue49;
                        precise float sumValue42 = sumValue34 + productValue45;
                        precise float sumValue43 = sumValue35 + productValue46;
                        float intermediateValue62;
                        float intermediateValue63;
                        if (productValue30)
                        {
                            uint bitwiseValue33 = comparisonValue3 >> 15u;
                            precise float bitwiseValue34 = float(bitwiseValue33 & 1u) * 2.0f;
                            precise float sumValue44 = bitwiseValue34 + (-1.0f);
                            precise float bitwiseValue35 = float(comparisonValue3 >> 31u) * 2.0f;
                            precise float sumValue45 = bitwiseValue35 + (-1.0f);
                            precise float bitwiseValue36 = float((comparisonValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue37 = float(bitwiseValue33 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue47 = sumValue44 * 3.0517578125e-05f;
                            precise float productValue48 = sumValue45 * 3.0517578125e-05f;
                            precise float sumValue46 = bitwiseValue36 + productValue47;
                            precise float sumValue47 = bitwiseValue37 + productValue48;
                            intermediateValue62 = sumValue46;
                            intermediateValue63 = sumValue47;
                        }
                        else
                        {
                            precise float bitwiseValue38 = float(comparisonValue3 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue39 = float(comparisonValue3 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue49 = bitwiseValue38 * 16384.0f;
                            precise float sumValue48 = productValue49 + 0.5f;
                            precise float productValue50 = bitwiseValue39 * 16384.0f;
                            precise float sumValue49 = productValue50 + 0.5f;
                            precise float productValue51 = floor(sumValue48) * 6.103515625e-05f;
                            precise float productValue52 = floor(sumValue49) * 6.103515625e-05f;
                            intermediateValue62 = productValue51;
                            intermediateValue63 = productValue52;
                        }
                        precise float productValue53 = vectorValue1.y * intermediateValue62;
                        precise float productValue54 = vectorValue1.y * intermediateValue63;
                        precise float sumValue50 = sumValue42 + productValue53;
                        precise float sumValue51 = sumValue43 + productValue54;
                        float intermediateValue64;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue27 * 2 + 0) == 65535u)
                        {
                            intermediateValue64 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits5;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue27 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits5 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits5 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue27 * 2 + 0));
                            }
                            intermediateValue64 = textures[NonUniformResourceIndex(reinterpretedBits5 + 0u)].SampleLevel(defaultSampler, float2(sumValue50, sumValue51), -0.25f).w;
                        }
                        uint comparisonValue10;
                        if (scalarValue5 == 2u)
                        {
                            comparisonValue10 = 0u;
                        }
                        else
                        {
                            comparisonValue10 = uint(intermediateValue64 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue28 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                        }
                        if (comparisonValue10 == 0u)
                        {
                            intermediateValue22.CommitNonOpaqueTriangleHit();
                        }
                    }
                    intermediateValue35 = intermediateValue22.Proceed();
                    if (intermediateValue35)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint scalarValue7 = intermediateValue22.CommittedStatus();
            bool intermediateValue29;
            uint bitwiseValue17;
            if (scalarValue7 == 1u)
            {
                float scalarValue8 = intermediateValue22.CommittedRayT();
                uint scalarValue9 = intermediateValue22.CommittedPrimitiveIndex();
                uint scalarValue10 = intermediateValue22.CommittedInstanceIndex();
                intermediateValue29 = scalarValue8 < 10000.0f;
                bitwiseValue17 = ((scalarValue9 << 14u) & 1073725440u) | (scalarValue10 & 16383u);
            }
            else
            {
                intermediateValue29 = false;
                bitwiseValue17 = 1073741823u;
            }
            float intermediateValue37;
            float intermediateValue38;
            float intermediateValue39;
            if (intermediateValue29)
            {
                uint bitwiseValue40 = bitwiseValue17 & 16383u;
                uint productValue55 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue40 * 76u) + 54u) * 2 + 0)) + 0u;
                uint bitwiseValue41 = ((rdByteLoad_objectInstances_uint(0u, ((bitwiseValue40 * 38u) + 25u) * 4 + 0) >> 2u) + ((bitwiseValue17 >> 15u) & 32767u)) * 8u;
                half3 productValue56 = (half3)f16tof32(uint16_t3(rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue55), bitwiseValue41 * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue55), (bitwiseValue41 + 1u) * 2 + 0), rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue55), (bitwiseValue41 + 2u) * 2 + 0)));
                intermediateValue37 = float(productValue56.x);
                intermediateValue38 = float(productValue56.y);
                intermediateValue39 = float(productValue56.z);
            }
            else
            {
                uint4 reinterpretedBits3 = asuint(viewCbConstants[75u]);
                uint scalarValue11 = reinterpretedBits3.w;
                float branchMergedValue3;
                float branchMergedValue8;
                float branchMergedValue9;
                if (scalarValue11 == 1u)
                {
                    branchMergedValue3 = viewCbConstants[58u].z;
                    branchMergedValue8 = viewCbConstants[58u].y;
                    branchMergedValue9 = viewCbConstants[58u].x;
                }
                else
                {
                    float branchMergedValue13;
                    float branchMergedValue17;
                    float branchMergedValue18;
                    if (scalarValue11 == 2u)
                    {
                        uint4 vectorValue2 = asuint(viewCbConstants[74u]);
                        uint scalarValue12 = vectorValue2.z;
                        uint reinterpretedBits4;
                        if (scalarValue12 > 4095u)
                        {
                            reinterpretedBits4 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits4 = scalarValue12;
                        }
                        float scalarValue13 = abs(wavePhaseValue);
                        float scalarValue14 = abs(wavePhaseValue1);
                        float scalarValue15 = abs(productValue26);
                        float intermediateValue61;
                        float comparisonValue9;
                        float sumValue52;
                        if ((scalarValue13 >= scalarValue14) && (scalarValue13 >= scalarValue15))
                        {
                            intermediateValue61 = scalarValue13;
                            comparisonValue9 = (wavePhaseValue < 0.0f) ? ((-0.0f) - productValue26) : productValue26;
                            sumValue52 = (-0.0f) - wavePhaseValue1;
                        }
                        else
                        {
                            float sumValue53 = (-0.0f) - wavePhaseValue;
                            float branchMergedValue4;
                            float branchMergedValue10;
                            float branchMergedValue11;
                            if (!(scalarValue14 >= scalarValue15))
                            {
                                branchMergedValue4 = (-0.0f) - wavePhaseValue1;
                                branchMergedValue10 = (productValue26 < 0.0f) ? wavePhaseValue : sumValue53;
                                branchMergedValue11 = scalarValue15;
                            }
                            else
                            {
                                branchMergedValue4 = (wavePhaseValue1 < 0.0f) ? ((-0.0f) - productValue26) : productValue26;
                                branchMergedValue10 = sumValue53;
                                branchMergedValue11 = scalarValue14;
                            }
                            intermediateValue61 = branchMergedValue11;
                            comparisonValue9 = branchMergedValue10;
                            sumValue52 = branchMergedValue4;
                        }
                        precise float quotientValue2 = 0.5f / intermediateValue61;
                        float4 sampledTextureValue2 = textures[NonUniformResourceIndex(reinterpretedBits4 + 0u)].SampleLevel(linearSampler, float2(frac(mad(comparisonValue9, quotientValue2, 0.5f) * viewCbConstants[74u].x), frac(mad(sumValue52, quotientValue2, 0.5f) * viewCbConstants[74u].y)), 0.0f);
                        branchMergedValue13 = (viewCbConstants[58u].z * sampledTextureValue2.z) * viewCbConstants[97u].w;
                        branchMergedValue17 = (viewCbConstants[58u].y * sampledTextureValue2.y) * viewCbConstants[97u].w;
                        branchMergedValue18 = (viewCbConstants[58u].x * sampledTextureValue2.x) * viewCbConstants[97u].w;
                    }
                    else
                    {
                        float branchMergedValue19;
                        float branchMergedValue20;
                        float branchMergedValue21;
                        if (scalarValue11 == 4u)
                        {
                            float scalarValue16 = (dot(float3(wavePhaseValue, wavePhaseValue1, productValue26), float3(viewCbConstants[52u].xyz)) * 0.5f) + 0.5f;
                            branchMergedValue19 = ((viewCbConstants[75u].z - viewCbConstants[76u].z) * scalarValue16) + viewCbConstants[76u].z;
                            branchMergedValue20 = ((viewCbConstants[75u].y - viewCbConstants[76u].y) * scalarValue16) + viewCbConstants[76u].y;
                            branchMergedValue21 = ((viewCbConstants[75u].x - viewCbConstants[76u].x) * scalarValue16) + viewCbConstants[76u].x;
                        }
                        else
                        {
                            float comparisonValue8;
                            if (abs(wavePhaseValue1) < 1.0f)
                            {
                                float quotientValue3 = atan(productValue26 / wavePhaseValue);
                                bool conditionValue1 = wavePhaseValue < 0.0f;
                                bool comparisonValue6 = wavePhaseValue == 0.0f;
                                bool comparisonValue7 = productValue26 >= 0.0f;
                                bool conditionValue2 = productValue26 < 0.0f;
                                comparisonValue8 = (comparisonValue7 && comparisonValue6) ? 1.57079637050628662109375f : ((conditionValue2 && comparisonValue6) ? (-1.57079637050628662109375f) : ((conditionValue2 && conditionValue1) ? (quotientValue3 + (-3.1415927410125732421875f)) : ((comparisonValue7 && conditionValue1) ? (quotientValue3 + 3.1415927410125732421875f) : quotientValue3)));
                            }
                            else
                            {
                                comparisonValue8 = 0.0f;
                            }
                            float multiplyAddValue23 = mad(abs((frac((comparisonValue8 - viewCbConstants[50u].w) * 0.15915493667125701904296875f) * 2.0f) + (-1.0f)), 0.984375f, 0.0078125f);
                            float multiplyAddValue24 = mad(0.5f - (asin(wavePhaseValue1) * 0.3183098733425140380859375f), 0.96875f, 0.015625f);
                            float productValue57 = viewCbConstants[51u].w * 7.0f;
                            float scalarValue17 = frac(productValue57);
                            uint scalarValue18 = uint(int(floor(productValue57)));
                            float productValue58 = float(int(scalarValue18 + 1u)) * 0.125f;
                            float scalarValue19 = frac(abs(productValue58));
                            float4 sampledTextureValue3 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue23, multiplyAddValue24, float(int(scalarValue18))), 0.0f);
                            float scalarValue20 = sampledTextureValue3.x;
                            float scalarValue21 = sampledTextureValue3.y;
                            float scalarValue22 = sampledTextureValue3.z;
                            float productValue59 = scalarValue20 * scalarValue20;
                            float productValue60 = scalarValue21 * scalarValue21;
                            float productValue61 = scalarValue22 * scalarValue22;
                            float4 sampledTextureValue4 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue23, multiplyAddValue24, float(int(uint(int(((productValue58 >= ((-0.0f) - productValue58)) ? scalarValue19 : ((-0.0f) - scalarValue19)) * 8.0f))))), 0.0f);
                            float scalarValue23 = sampledTextureValue4.x;
                            float scalarValue24 = sampledTextureValue4.y;
                            float scalarValue25 = sampledTextureValue4.z;
                            float dotProductValue = exp2(log2(max(dot(float3(wavePhaseValue, wavePhaseValue1, productValue26), float3(viewCbConstants[52u].xyz)), 0.0f)) * 7.0f);
                            float productValue62 = dotProductValue * 0.0500000007450580596923828125f;
                            float productValue63 = ((((scalarValue23 * scalarValue23) - productValue59) * scalarValue17) + productValue59) + (productValue62 * viewCbConstants[50u].x);
                            float productValue64 = ((((scalarValue24 * scalarValue24) - productValue60) * scalarValue17) + productValue60) + (productValue62 * viewCbConstants[50u].y);
                            float productValue65 = ((((scalarValue25 * scalarValue25) - productValue61) * scalarValue17) + productValue61) + (productValue62 * viewCbConstants[50u].z);
                            float productValue66 = (dotProductValue * 0.64999997615814208984375f) + 0.3499999940395355224609375f;
                            branchMergedValue19 = ((((viewCbConstants[58u].z * productValue66) - productValue65) * viewCbConstants[58u].w) + productValue65) * viewCbConstants[97u].w;
                            branchMergedValue20 = ((((viewCbConstants[58u].y * productValue66) - productValue64) * viewCbConstants[58u].w) + productValue64) * viewCbConstants[97u].w;
                            branchMergedValue21 = ((((viewCbConstants[58u].x * productValue66) - productValue63) * viewCbConstants[58u].w) + productValue63) * viewCbConstants[97u].w;
                        }
                        branchMergedValue13 = branchMergedValue19;
                        branchMergedValue17 = branchMergedValue20;
                        branchMergedValue18 = branchMergedValue21;
                    }
                    branchMergedValue3 = branchMergedValue13;
                    branchMergedValue8 = branchMergedValue17;
                    branchMergedValue9 = branchMergedValue18;
                }
                intermediateValue37 = branchMergedValue9;
                intermediateValue38 = branchMergedValue8;
                intermediateValue39 = branchMergedValue3;
            }
            intermediateValue18 = intermediateValue37 * 0.3183098733425140380859375f;
            intermediateValue19 = intermediateValue38 * 0.3183098733425140380859375f;
            intermediateValue20 = intermediateValue39 * 0.3183098733425140380859375f;
        }
        float multiplyAddValue25 = multiplyAddValue22 * clamp(mad(float(asuint(viewCbConstants[53u]).w), 0.02500000037252902984619140625f, -0.5f), 0.0f, 1.0f);
        float sumValue54 = min(intermediateValue6 + 1.0f, 200.0f);
        float quotientValue4 = 1.0f / sumValue54;
        intermediateValue14 = (quotientValue4 * ((intermediateValue18 * multiplyAddValue25) - intermediateValue3)) + intermediateValue3;
        intermediateValue15 = (quotientValue4 * ((intermediateValue19 * multiplyAddValue25) - intermediateValue4)) + intermediateValue4;
        intermediateValue16 = (quotientValue4 * ((intermediateValue20 * multiplyAddValue25) - intermediateValue5)) + intermediateValue5;
        intermediateValue17 = sumValue54;
    }
    volumetricGIInscatterRW[0u][uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(intermediateValue14, intermediateValue15, intermediateValue16, intermediateValue17);
}
[numthreads(4, 4, 2)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
