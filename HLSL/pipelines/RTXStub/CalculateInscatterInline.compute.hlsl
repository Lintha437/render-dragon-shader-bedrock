// RTXStub / CalculateInscatterInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 24
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    precise float productValue = float(dispatchThreadId.x) * viewCbConstants[80u].z;
    precise float sumValue = productValue + (-1.0f);
    precise float productValue1 = float(dispatchThreadId.z) * viewCbConstants[55u].z;
    uint4 reinterpretedBits = asuint(viewCbConstants[84u]);
    uint scalarValue = reinterpretedBits.z;
    uint bitwiseValue = dispatchThreadId.x & 65535u;
    uint bitwiseValue1 = dispatchThreadId.y & 65535u;
    uint bitwiseValue2 = ((bitwiseValue << 8u) | bitwiseValue) & 16711935u;
    uint bitwiseValue3 = ((bitwiseValue2 << 4u) | bitwiseValue2) & 252645135u;
    uint bitwiseValue4 = ((bitwiseValue3 << 2u) | bitwiseValue3) & 858993459u;
    uint bitwiseValue5 = ((bitwiseValue1 << 8u) | bitwiseValue1) & 16711935u;
    uint bitwiseValue6 = ((bitwiseValue5 << 4u) | bitwiseValue5) & 252645135u;
    uint bitwiseValue7 = ((bitwiseValue6 << 2u) | bitwiseValue6) & 858993459u;
    uint bitwiseValue8;
    uint bitwiseValue10;
    uint intermediateValue1;
    uint intermediateValue2;
    bitwiseValue8 = (((((bitwiseValue7 << 1u) | bitwiseValue7) << 1u) & 2863311530u) | (((bitwiseValue4 << 1u) | bitwiseValue4) & 1431655765u)) + scalarValue;
    bitwiseValue10 = scalarValue + (dispatchThreadId.z & 3u);
    intermediateValue1 = 0u;
    intermediateValue2 = 0u;
    uint bitwiseValue9;
    for (;;)
    {
        uint sumValue1 = intermediateValue1 + 2654435769u;
        bitwiseValue9 = ((((bitwiseValue10 >> 5u) + 3355524772u) ^ ((bitwiseValue10 << 4u) + 2738958700u)) ^ (sumValue1 + bitwiseValue10)) + bitwiseValue8;
        uint sumValue2 = intermediateValue2 + 1u;
        if (sumValue2 == 16u)
        {
            break;
        }
        else
        {
            bitwiseValue8 = bitwiseValue9;
            bitwiseValue10 = ((((bitwiseValue9 << 4u) + 2911926141u) ^ (bitwiseValue9 + sumValue1)) ^ ((bitwiseValue9 >> 5u) + 2123724318u)) + bitwiseValue10;
            intermediateValue1 = sumValue1;
            intermediateValue2 = sumValue2;
        }
    }
    precise float productValue2 = float(dispatchThreadId.y) * viewCbConstants[80u].w;
    precise float sumValue3 = productValue2 + 1.0f;
    precise float productValue3 = viewCbConstants[55u].z * 0.5f;
    precise float sumValue4 = productValue3 + productValue1;
    uint productValue4 = (bitwiseValue9 * 1664525u) + 1013904223u;
    precise float bitwiseValue11 = float(productValue4 & 16777215u) * 5.9604644775390625e-08f;
    uint productValue5 = (productValue4 * 1664525u) + 1013904223u;
    precise float bitwiseValue12 = float(productValue5 & 16777215u) * 5.9604644775390625e-08f;
    precise float bitwiseValue13 = float(((productValue5 * 1664525u) + 7271263u) & 16777215u) * 5.9604644775390625e-08f;
    precise float productValue6 = bitwiseValue11 * 2.0f;
    precise float productValue7 = bitwiseValue12 * 2.0f;
    precise float productValue8 = bitwiseValue13 * 2.0f;
    precise float sumValue5 = productValue6 + (-1.0f);
    precise float sumValue6 = productValue7 + (-1.0f);
    precise float sumValue7 = productValue8 + (-1.0f);
    float exponentialValue = (exp2(sumValue4 * 3.45943164825439453125f) + (-1.0f)) * 5.0f;
    precise float productValue9 = productValue1 * 3.45943164825439453125f;
    precise float exponentialValue1 = exp2(productValue9) + (-1.0f);
    precise float productValue10 = exponentialValue1 * 50.0f;
    precise float quotientValue = productValue10 / 10.0f;
    float productValue11 = ((viewCbConstants[81u].z * 2.0f) * viewCbConstants[78u].z) + sumValue;
    float productValue12 = sumValue3 - ((viewCbConstants[81u].w * 2.0f) * viewCbConstants[78u].w);
    float multiplyAddValue = mad(0.5f, viewCbConstants[22u].w, mad(productValue12, viewCbConstants[21u].w, productValue11 * viewCbConstants[20u].w)) + viewCbConstants[23u].w;
    float multiplyAddValue1 = ((mad(0.5f, viewCbConstants[22u].x, mad(productValue12, viewCbConstants[21u].x, productValue11 * viewCbConstants[20u].x)) + viewCbConstants[23u].x) / multiplyAddValue) - viewCbConstants[72u].x;
    float multiplyAddValue2 = ((mad(0.5f, viewCbConstants[22u].y, mad(productValue12, viewCbConstants[21u].y, productValue11 * viewCbConstants[20u].y)) + viewCbConstants[23u].y) / multiplyAddValue) - viewCbConstants[72u].y;
    float multiplyAddValue3 = ((mad(0.5f, viewCbConstants[22u].z, mad(productValue12, viewCbConstants[21u].z, productValue11 * viewCbConstants[20u].z)) + viewCbConstants[23u].z) / multiplyAddValue) - viewCbConstants[72u].z;
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
        float multiplyAddValue13 = mad(mad(multiplyAddValue8, 0.5f, 0.5f), (viewCbConstants[54u].x + (-1.0f)) * viewCbConstants[55u].x, viewCbConstants[55u].x * 0.5f);
        float multiplyAddValue14 = mad(mad(multiplyAddValue9, -0.5f, 0.5f), (viewCbConstants[54u].y + (-1.0f)) * viewCbConstants[55u].y, viewCbConstants[55u].y * 0.5f);
        float nonlinearValue = log2((sqrt(((multiplyAddValue11 * multiplyAddValue11) + (multiplyAddValue10 * multiplyAddValue10)) + (multiplyAddValue12 * multiplyAddValue12)) * 0.20000000298023223876953125f) + 1.0f) * 0.289064824581146240234375f;
        float4 sampledTextureValue = volumetricInscatterPrevious.SampleLevel(linearSampler, float3(multiplyAddValue13, multiplyAddValue14, nonlinearValue), 0.0f);
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
    precise float productValue13 = viewCbConstants[55u].x * sumValue5;
    precise float productValue14 = viewCbConstants[55u].y * sumValue6;
    precise float sumValue8 = sumValue + productValue13;
    precise float sumValue9 = productValue14 + sumValue3;
    precise float sumValue10 = viewCbConstants[78u].x + (-1.0f);
    precise float sumValue11 = viewCbConstants[78u].y + (-1.0f);
    precise float productValue15 = sumValue8 * 0.5f;
    precise float sumValue12 = productValue15 + 0.5f;
    precise float productValue16 = sumValue9 * (-0.5f);
    precise float sumValue13 = productValue16 + 0.5f;
    precise float clampedValue = clamp(sumValue12, 0.0f, 1.0f) * sumValue10;
    precise float sumValue14 = clampedValue + 0.5f;
    precise float clampedValue1 = clamp(sumValue13, 0.0f, 1.0f) * sumValue11;
    precise float sumValue15 = clampedValue1 + 0.5f;
    uint sumValue16 = uint(min(int(uint(max(int(uint(int(sumValue14))), int(0u)))), int(uint(int(viewCbConstants[78u].x)) + 4294967295u)));
    uint sumValue17 = uint(min(int(uint(max(int(uint(int(sumValue15))), int(0u)))), int(uint(int(viewCbConstants[78u].y)) + 4294967295u)));
    uint4 reinterpretedBits2 = asuint(viewCbConstants[91u]);
    uint scalarValue1 = reinterpretedBits2.y;
    uint comparisonValue;
    if (scalarValue1 == 2u)
    {
        comparisonValue = sumValue16;
    }
    else
    {
        comparisonValue = ((((sumValue17 ^ sumValue16) & 1u) != (uint(((scalarValue & 1u) != 0u) && (scalarValue1 == 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue16 >> 1u);
    }
    float loadedBufferValue = abs(inputPrimaryWorldPosition.Load(int3(uint2(comparisonValue, sumValue17), 0u)).w);
    uint sumValue18 = scalarValue + dispatchThreadId.z;
    float4 loadedBufferValue1 = blueNoiseTexture.Load(int4(uint3(dispatchThreadId.x & 255u, dispatchThreadId.y & 255u, (sumValue18 >> 2u) & 127u), 0u));
    uint bitwiseValue14 = sumValue18 & 3u;
    float intermediateValue11;
    if (bitwiseValue14 == 0u)
    {
        intermediateValue11 = loadedBufferValue1.x;
    }
    else
    {
        float branchMergedValue9;
        if (bitwiseValue14 == 1u)
        {
            branchMergedValue9 = loadedBufferValue1.y;
        }
        else
        {
            branchMergedValue9 = (bitwiseValue14 == 2u) ? loadedBufferValue1.z : loadedBufferValue1.w;
        }
        intermediateValue11 = branchMergedValue9;
    }
    precise float sumValue19 = intermediateValue11 + (-0.5f);
    precise float productValue17 = sumValue19 * viewCbConstants[55u].z;
    precise float sumValue20 = productValue17 + sumValue4;
    precise float productValue18 = sumValue20 * 3.45943164825439453125f;
    precise float exponentialValue2 = exp2(productValue18) + (-1.0f);
    precise float productValue19 = exponentialValue2 * 50.0f;
    precise float quotientValue1 = productValue19 / 10.0f;
    float intermediateValue12;
    if (loadedBufferValue == 65504.0f)
    {
        intermediateValue12 = quotientValue1;
    }
    else
    {
        precise float productValue20 = loadedBufferValue * 0.9900000095367431640625f;
        precise float sumValue21 = productValue20 + (-0.00999999977648258209228515625f);
        intermediateValue12 = min(sumValue21, quotientValue1);
    }
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if (intermediateValue12 < quotientValue)
    {
        float sumValue22 = max(intermediateValue6 + (-1.0f), 0.0f);
        float branchMergedValue10;
        float branchMergedValue16;
        float branchMergedValue17;
        float branchMergedValue18;
        if (reinterpretedBits1 && (sumValue22 > 0.0f))
        {
            float multiplyAddValue15 = clamp(mad(sumValue22, 0.3333333432674407958984375f, -0.3333333432674407958984375f), 0.0f, 1.0f) + 0.001000000047497451305389404296875f;
            float4 sampledTextureValue1 = volumetricInscatterPrevious.SampleLevel(linearSampler, float3(mad(sumValue5, viewCbConstants[55u].x, intermediateValue7), mad(sumValue6, viewCbConstants[55u].y, intermediateValue8), mad(sumValue7, viewCbConstants[55u].z, intermediateValue9)), 0.0f);
            float scalarValue2 = sampledTextureValue1.w;
            float multiplyAddValue16 = clamp(mad(scalarValue2, 0.3333333432674407958984375f, -0.3333333432674407958984375f), 0.0f, 1.0f) + 0.001000000047497451305389404296875f;
            float sumValue23 = multiplyAddValue16 + multiplyAddValue15;
            float branchMergedValue38;
            float branchMergedValue39;
            float branchMergedValue40;
            float branchMergedValue41;
            if (sumValue23 > 0.0f)
            {
                branchMergedValue38 = ((multiplyAddValue16 * sampledTextureValue1.y) + (multiplyAddValue15 * intermediateValue4)) / sumValue23;
                branchMergedValue39 = ((multiplyAddValue16 * sampledTextureValue1.x) + (multiplyAddValue15 * intermediateValue3)) / sumValue23;
                branchMergedValue40 = ((multiplyAddValue16 * scalarValue2) + (multiplyAddValue15 * sumValue22)) / sumValue23;
                branchMergedValue41 = ((multiplyAddValue16 * sampledTextureValue1.z) + (multiplyAddValue15 * intermediateValue5)) / sumValue23;
            }
            else
            {
                branchMergedValue38 = 0.0f;
                branchMergedValue39 = 0.0f;
                branchMergedValue40 = 0.0f;
                branchMergedValue41 = 0.0f;
            }
            branchMergedValue10 = branchMergedValue38;
            branchMergedValue16 = branchMergedValue39;
            branchMergedValue17 = branchMergedValue40;
            branchMergedValue18 = branchMergedValue41;
        }
        else
        {
            branchMergedValue10 = intermediateValue4 * 0.800000011920928955078125f;
            branchMergedValue16 = intermediateValue3 * 0.800000011920928955078125f;
            branchMergedValue17 = sumValue22;
            branchMergedValue18 = intermediateValue5 * 0.800000011920928955078125f;
        }
        intermediateValue16 = branchMergedValue16;
        intermediateValue17 = branchMergedValue10;
        intermediateValue18 = branchMergedValue18;
        intermediateValue19 = branchMergedValue17;
    }
    else
    {
        precise float sumValue24 = float(int(sumValue16)) + 0.5f;
        precise float sumValue25 = float(int(sumValue17)) + 0.5f;
        precise float productValue21 = viewCbConstants[78u].z * sumValue24;
        precise float productValue22 = viewCbConstants[78u].w * sumValue25;
        precise float productValue23 = productValue21 * 2.0f;
        precise float productValue24 = productValue22 * 2.0f;
        precise float sumValue26 = productValue23 + (-1.0f);
        precise float sumValue27 = 1.0f - productValue24;
        precise float productValue25 = viewCbConstants[81u].z * viewCbConstants[78u].z;
        precise float productValue26 = viewCbConstants[81u].w * viewCbConstants[78u].w;
        precise float productValue27 = productValue25 * 2.0f;
        precise float productValue28 = productValue26 * 2.0f;
        precise float sumValue28 = productValue27 + sumValue26;
        precise float sumValue29 = sumValue27 - productValue28;
        precise float productValue29 = viewCbConstants[20u].x * sumValue28;
        precise float productValue30 = sumValue29 * viewCbConstants[21u].x;
        precise float sumValue30 = productValue30 + productValue29;
        precise float productValue31 = 0.5f * viewCbConstants[22u].x;
        precise float sumValue31 = productValue31 + sumValue30;
        precise float productValue32 = 1.0f * viewCbConstants[23u].x;
        precise float sumValue32 = productValue32 + sumValue31;
        precise float productValue33 = viewCbConstants[20u].y * sumValue28;
        precise float productValue34 = sumValue29 * viewCbConstants[21u].y;
        precise float sumValue33 = productValue34 + productValue33;
        precise float productValue35 = 0.5f * viewCbConstants[22u].y;
        precise float sumValue34 = productValue35 + sumValue33;
        precise float productValue36 = 1.0f * viewCbConstants[23u].y;
        precise float sumValue35 = productValue36 + sumValue34;
        precise float productValue37 = viewCbConstants[20u].z * sumValue28;
        precise float productValue38 = sumValue29 * viewCbConstants[21u].z;
        precise float sumValue36 = productValue38 + productValue37;
        precise float productValue39 = 0.5f * viewCbConstants[22u].z;
        precise float sumValue37 = productValue39 + sumValue36;
        precise float productValue40 = 1.0f * viewCbConstants[23u].z;
        precise float sumValue38 = productValue40 + sumValue37;
        precise float productValue41 = viewCbConstants[20u].w * sumValue28;
        precise float productValue42 = sumValue29 * viewCbConstants[21u].w;
        precise float sumValue39 = productValue42 + productValue41;
        precise float productValue43 = 0.5f * viewCbConstants[22u].w;
        precise float sumValue40 = productValue43 + sumValue39;
        precise float productValue44 = 1.0f * viewCbConstants[23u].w;
        precise float sumValue41 = productValue44 + sumValue40;
        precise float quotientValue2 = sumValue32 / sumValue41;
        precise float quotientValue3 = sumValue35 / sumValue41;
        precise float quotientValue4 = sumValue38 / sumValue41;
        precise float sumValue42 = quotientValue2 - viewCbConstants[72u].x;
        precise float sumValue43 = quotientValue3 - viewCbConstants[72u].y;
        precise float sumValue44 = quotientValue4 - viewCbConstants[72u].z;
        float inverseLengthValue1 = rsqrt(dot(float3(sumValue42, sumValue43, sumValue44), float3(sumValue42, sumValue43, sumValue44)));
        precise float productValue45 = sumValue42 * inverseLengthValue1;
        precise float productValue46 = sumValue43 * inverseLengthValue1;
        precise float productValue47 = sumValue44 * inverseLengthValue1;
        precise float productValue48 = productValue45 * intermediateValue12;
        precise float sumValue45 = productValue48 + viewCbConstants[72u].x;
        precise float productValue49 = productValue46 * intermediateValue12;
        precise float sumValue46 = productValue49 + viewCbConstants[72u].y;
        precise float productValue50 = productValue47 * intermediateValue12;
        precise float sumValue47 = productValue50 + viewCbConstants[72u].z;
        bool reinterpretedBits3 = asuint(viewCbConstants[54u]).w == 0u;
        float multiplyAddValue17;
        if (reinterpretedBits3)
        {
            multiplyAddValue17 = clamp(mad(sumValue46, viewCbConstants[90u].z, viewCbConstants[90u].w), 0.0f, 1.0f);
        }
        else
        {
            multiplyAddValue17 = 1.0f;
        }
        RayDesc _4ident = {float3(sumValue45, sumValue46, sumValue47), 0.0f, float3(viewCbConstants[53u].xyz), 10000.0f};
        intermediateValue14.TraceRayInline(SceneBVH, 512u, 32u, _4ident);
        bool conditionValue = intermediateValue14.Proceed();
        if (conditionValue)
        {
            bool intermediateValue29;
            bool comparisonValue1;
            for (;;)
            {
                uint scalarValue3 = intermediateValue14.CandidateType();
                comparisonValue1 = scalarValue3 == 0u;
                if (comparisonValue1)
                {
                    float2 vectorValue = intermediateValue14.CandidateTriangleBarycentrics();
                    float2 vectorValue1 = intermediateValue14.CandidateTriangleBarycentrics();
                    uint scalarValue4 = intermediateValue14.CandidatePrimitiveIndex();
                    uint scalarValue5 = intermediateValue14.CandidateInstanceID();
                    uint scalarValue6 = intermediateValue14.CandidateInstanceIndex();
                    uint productValue51 = (scalarValue6 * 76u) + 58u;
                    uint productValue52 = (scalarValue6 * 76u) + 61u;
                    precise float sumValue48 = 1.0f - vectorValue.x;
                    precise float sumValue49 = sumValue48 - vectorValue1.y;
                    uint bitwiseValue15 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue6 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue4 >> 1u);
                    uint productValue53 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue6 * 76u) + 54u) * 2 + 0)) + 0u;
                    bool comparisonValue2 = (scalarValue4 & 1u) == 0u;
                    uint comparisonValue3 = comparisonValue2 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue53), bitwiseValue15 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue53), bitwiseValue15 * 16 + 0).x;
                    uint comparisonValue4 = comparisonValue2 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue53), bitwiseValue15 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue53), bitwiseValue15 * 16 + 0).w;
                    uint comparisonValue5 = comparisonValue2 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue53), bitwiseValue15 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue53), bitwiseValue15 * 16 + 0).z;
                    bool productValue54 = rdByteLoad_objectInstances_uint16_t(0u, productValue52 * 2 + 0) < 0u;
                    float intermediateValue47;
                    float intermediateValue48;
                    if (productValue54)
                    {
                        uint bitwiseValue16 = comparisonValue5 >> 15u;
                        precise float bitwiseValue17 = float(bitwiseValue16 & 1u) * 2.0f;
                        precise float sumValue50 = bitwiseValue17 + (-1.0f);
                        precise float bitwiseValue18 = float(comparisonValue5 >> 31u) * 2.0f;
                        precise float sumValue51 = bitwiseValue18 + (-1.0f);
                        precise float bitwiseValue19 = float((comparisonValue5 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue20 = float(bitwiseValue16 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue55 = sumValue50 * 3.0517578125e-05f;
                        precise float productValue56 = sumValue51 * 3.0517578125e-05f;
                        precise float sumValue52 = bitwiseValue19 + productValue55;
                        precise float sumValue53 = bitwiseValue20 + productValue56;
                        intermediateValue47 = sumValue52;
                        intermediateValue48 = sumValue53;
                    }
                    else
                    {
                        precise float bitwiseValue21 = float(comparisonValue5 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue22 = float(comparisonValue5 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue57 = bitwiseValue21 * 16384.0f;
                        precise float sumValue54 = productValue57 + 0.5f;
                        precise float productValue58 = bitwiseValue22 * 16384.0f;
                        precise float sumValue55 = productValue58 + 0.5f;
                        precise float productValue59 = floor(sumValue54) * 6.103515625e-05f;
                        precise float productValue60 = floor(sumValue55) * 6.103515625e-05f;
                        intermediateValue47 = productValue59;
                        intermediateValue48 = productValue60;
                    }
                    precise float productValue61 = sumValue49 * intermediateValue47;
                    precise float productValue62 = sumValue49 * intermediateValue48;
                    precise float sumValue56 = productValue61 + 0.0f;
                    precise float sumValue57 = productValue62 + 0.0f;
                    float intermediateValue83;
                    float intermediateValue84;
                    if (productValue54)
                    {
                        uint bitwiseValue23 = comparisonValue4 >> 15u;
                        precise float bitwiseValue24 = float(bitwiseValue23 & 1u) * 2.0f;
                        precise float sumValue58 = bitwiseValue24 + (-1.0f);
                        precise float bitwiseValue25 = float(comparisonValue4 >> 31u) * 2.0f;
                        precise float sumValue59 = bitwiseValue25 + (-1.0f);
                        precise float bitwiseValue26 = float((comparisonValue4 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue27 = float(bitwiseValue23 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue63 = sumValue58 * 3.0517578125e-05f;
                        precise float productValue64 = sumValue59 * 3.0517578125e-05f;
                        precise float sumValue60 = bitwiseValue26 + productValue63;
                        precise float sumValue61 = bitwiseValue27 + productValue64;
                        intermediateValue83 = sumValue60;
                        intermediateValue84 = sumValue61;
                    }
                    else
                    {
                        precise float bitwiseValue28 = float(comparisonValue4 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue29 = float(comparisonValue4 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue65 = bitwiseValue28 * 16384.0f;
                        precise float sumValue62 = productValue65 + 0.5f;
                        precise float productValue66 = bitwiseValue29 * 16384.0f;
                        precise float sumValue63 = productValue66 + 0.5f;
                        precise float productValue67 = floor(sumValue62) * 6.103515625e-05f;
                        precise float productValue68 = floor(sumValue63) * 6.103515625e-05f;
                        intermediateValue83 = productValue67;
                        intermediateValue84 = productValue68;
                    }
                    precise float productValue69 = vectorValue.x * intermediateValue83;
                    precise float productValue70 = vectorValue.x * intermediateValue84;
                    precise float sumValue64 = sumValue56 + productValue69;
                    precise float sumValue65 = sumValue57 + productValue70;
                    float intermediateValue111;
                    float intermediateValue112;
                    if (productValue54)
                    {
                        uint bitwiseValue30 = comparisonValue3 >> 15u;
                        precise float bitwiseValue31 = float(bitwiseValue30 & 1u) * 2.0f;
                        precise float sumValue66 = bitwiseValue31 + (-1.0f);
                        precise float bitwiseValue32 = float(comparisonValue3 >> 31u) * 2.0f;
                        precise float sumValue67 = bitwiseValue32 + (-1.0f);
                        precise float bitwiseValue33 = float((comparisonValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue34 = float(bitwiseValue30 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue71 = sumValue66 * 3.0517578125e-05f;
                        precise float productValue72 = sumValue67 * 3.0517578125e-05f;
                        precise float sumValue68 = bitwiseValue33 + productValue71;
                        precise float sumValue69 = bitwiseValue34 + productValue72;
                        intermediateValue111 = sumValue68;
                        intermediateValue112 = sumValue69;
                    }
                    else
                    {
                        precise float bitwiseValue35 = float(comparisonValue3 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue36 = float(comparisonValue3 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue73 = bitwiseValue35 * 16384.0f;
                        precise float sumValue70 = productValue73 + 0.5f;
                        precise float productValue74 = bitwiseValue36 * 16384.0f;
                        precise float sumValue71 = productValue74 + 0.5f;
                        precise float productValue75 = floor(sumValue70) * 6.103515625e-05f;
                        precise float productValue76 = floor(sumValue71) * 6.103515625e-05f;
                        intermediateValue111 = productValue75;
                        intermediateValue112 = productValue76;
                    }
                    precise float productValue77 = vectorValue1.y * intermediateValue111;
                    precise float productValue78 = vectorValue1.y * intermediateValue112;
                    precise float sumValue72 = sumValue64 + productValue77;
                    precise float sumValue73 = sumValue65 + productValue78;
                    float intermediateValue115;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue51 * 2 + 0) == 65535u)
                    {
                        intermediateValue115 = 1.0f;
                    }
                    else
                    {
                        uint reinterpretedBits4;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue51 * 2 + 0) > 4095u)
                        {
                            reinterpretedBits4 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits4 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue51 * 2 + 0));
                        }
                        intermediateValue115 = textures[NonUniformResourceIndex(reinterpretedBits4 + 0u)].SampleLevel(defaultSampler, float2(sumValue72, sumValue73), -0.25f).w;
                    }
                    uint comparisonValue28;
                    if (scalarValue5 == 2u)
                    {
                        comparisonValue28 = 0u;
                    }
                    else
                    {
                        comparisonValue28 = uint(intermediateValue115 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue52 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                    }
                    if (comparisonValue28 == 0u)
                    {
                        intermediateValue14.CommitNonOpaqueTriangleHit();
                    }
                }
                intermediateValue29 = intermediateValue14.Proceed();
                if (intermediateValue29)
                {
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        uint scalarValue7 = intermediateValue14.CommittedStatus();
        float intermediateValue23;
        if (scalarValue7 == 1u)
        {
            float scalarValue8 = intermediateValue14.CommittedRayT();
            intermediateValue23 = scalarValue8;
        }
        else
        {
            intermediateValue23 = 10000.0f;
        }
        float intermediateValue44;
        float intermediateValue45;
        float intermediateValue46;
        if (intermediateValue23 < 10000.0f)
        {
            precise float productValue79 = intermediateValue23 * viewCbConstants[63u].x;
            precise float productValue80 = intermediateValue23 * viewCbConstants[63u].y;
            precise float productValue81 = intermediateValue23 * viewCbConstants[63u].z;
            precise float productValue82 = productValue79 * (-1.44269502162933349609375f);
            precise float productValue83 = productValue80 * (-1.44269502162933349609375f);
            precise float productValue84 = productValue81 * (-1.44269502162933349609375f);
            precise float productValue85 = viewCbConstants[53u].x * intermediateValue23;
            precise float sumValue74 = productValue85 + sumValue45;
            precise float productValue86 = viewCbConstants[53u].z * intermediateValue23;
            precise float sumValue75 = productValue86 + sumValue47;
            precise float productValue87 = sumValue74 * viewCbConstants[83u].z;
            precise float sumValue76 = productValue87 + viewCbConstants[84u].x;
            precise float productValue88 = sumValue75 * viewCbConstants[83u].w;
            precise float sumValue77 = productValue88 + viewCbConstants[84u].y;
            float4 sampledTextureValue2 = wibblyTexture.SampleLevel(linearWrapSampler, float2(sumValue76, sumValue77), 0.0f);
            precise float sumValue78 = sampledTextureValue2.x + (-0.5f);
            precise float sumValue79 = sampledTextureValue2.y + (-0.5f);
            precise float productValue89 = sumValue74 * viewCbConstants[82u].z;
            precise float sumValue80 = productValue89 + viewCbConstants[83u].x;
            precise float productValue90 = sumValue75 * viewCbConstants[82u].w;
            precise float sumValue81 = productValue90 + viewCbConstants[83u].y;
            precise float productValue91 = sumValue78 * 0.4000000059604644775390625f;
            precise float productValue92 = sumValue79 * 0.4000000059604644775390625f;
            precise float sumValue82 = sumValue80 + productValue91;
            precise float sumValue83 = productValue92 + sumValue81;
            precise float productValue93 = viewCbConstants[68u].w * 63.0f;
            uint scalarValue9 = uint(int(floor(productValue93)));
            precise float productValue94 = float(int(scalarValue9 + 1u)) * 0.015625f;
            precise float sumValue84 = (-0.0f) - productValue94;
            float scalarValue10 = frac(abs(productValue94));
            precise float sumValue85 = (-0.0f) - scalarValue10;
            precise float comparisonValue6 = ((productValue94 >= sumValue84) ? scalarValue10 : sumValue85) * 64.0f;
            float4 sampledTextureValue3 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue82, sumValue83, float(int(scalarValue9))), 0.0f);
            float scalarValue11 = sampledTextureValue3.x;
            precise float sampledTextureValue4 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue82, sumValue83, float(int(uint(int(comparisonValue6))))), 0.0f).x - scalarValue11;
            precise float productValue95 = frac(productValue93) * sampledTextureValue4;
            precise float sumValue86 = scalarValue11 + productValue95;
            precise float productValue96 = sumValue86 * 7.0f;
            precise float sumValue87 = productValue96 + 0.800000011920928955078125f;
            precise float productValue97 = intermediateValue23 * (-0.100000001490116119384765625f);
            precise float sumValue88 = sumValue87 + (-1.0f);
            precise float exponentialValue3 = exp2(productValue97) * sumValue88;
            precise float sumValue89 = exponentialValue3 + 1.0f;
            precise float exponentialValue4 = exp2(productValue82) * sumValue89;
            precise float exponentialValue5 = exp2(productValue83) * sumValue89;
            precise float exponentialValue6 = exp2(productValue84) * sumValue89;
            RayDesc _5ident = {float3(sumValue45, sumValue46, sumValue47), 0.0f, float3(viewCbConstants[53u].xyz), intermediateValue23};
            intermediateValue33.TraceRayInline(SceneBVH, 512u, 22u, _5ident);
            bool conditionValue1 = intermediateValue33.Proceed();
            float intermediateValue35;
            float intermediateValue37;
            float intermediateValue39;
            if (conditionValue1)
            {
                float intermediateValue36;
                float intermediateValue38;
                float intermediateValue40;
                float scalarValue12 = exponentialValue4;
                float scalarValue13 = exponentialValue5;
                float scalarValue14 = exponentialValue6;
                bool comparisonValue11;
                for (;;)
                {
                    uint scalarValue15 = intermediateValue33.CandidateType();
                    comparisonValue11 = scalarValue15 == 0u;
                    float branchMergedValue;
                    float branchMergedValue3;
                    float branchMergedValue4;
                    if (comparisonValue11)
                    {
                        float2 vectorValue2 = intermediateValue33.CandidateTriangleBarycentrics();
                        float2 vectorValue3 = intermediateValue33.CandidateTriangleBarycentrics();
                        float scalarValue16 = intermediateValue33.CandidateTriangleRayT();
                        uint scalarValue17 = intermediateValue33.CandidatePrimitiveIndex();
                        uint scalarValue18 = intermediateValue33.CandidateInstanceID();
                        uint scalarValue19 = intermediateValue33.CandidateInstanceIndex();
                        uint productValue98 = (scalarValue19 * 76u) + 58u;
                        uint productValue99 = (scalarValue19 * 76u) + 61u;
                        precise float sumValue90 = 1.0f - vectorValue2.x;
                        precise float sumValue91 = sumValue90 - vectorValue3.y;
                        uint bitwiseValue37 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue19 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue17 >> 1u);
                        uint productValue100 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue19 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue7 = (scalarValue17 & 1u) == 0u;
                        uint comparisonValue8 = comparisonValue7 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue37 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue37 * 16 + 0).x;
                        uint comparisonValue9 = comparisonValue7 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue37 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue37 * 16 + 0).w;
                        uint comparisonValue10 = comparisonValue7 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue37 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue100), bitwiseValue37 * 16 + 0).z;
                        bool productValue101 = rdByteLoad_objectInstances_uint16_t(0u, productValue99 * 2 + 0) < 0u;
                        float intermediateValue99;
                        float intermediateValue100;
                        if (productValue101)
                        {
                            uint bitwiseValue38 = comparisonValue10 >> 15u;
                            precise float bitwiseValue39 = float(bitwiseValue38 & 1u) * 2.0f;
                            precise float sumValue92 = bitwiseValue39 + (-1.0f);
                            precise float bitwiseValue40 = float(comparisonValue10 >> 31u) * 2.0f;
                            precise float sumValue93 = bitwiseValue40 + (-1.0f);
                            precise float bitwiseValue41 = float((comparisonValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue42 = float(bitwiseValue38 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue102 = sumValue92 * 3.0517578125e-05f;
                            precise float productValue103 = sumValue93 * 3.0517578125e-05f;
                            precise float sumValue94 = bitwiseValue41 + productValue102;
                            precise float sumValue95 = bitwiseValue42 + productValue103;
                            intermediateValue99 = sumValue94;
                            intermediateValue100 = sumValue95;
                        }
                        else
                        {
                            precise float bitwiseValue43 = float(comparisonValue10 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue44 = float(comparisonValue10 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue104 = bitwiseValue43 * 16384.0f;
                            precise float sumValue96 = productValue104 + 0.5f;
                            precise float productValue105 = bitwiseValue44 * 16384.0f;
                            precise float sumValue97 = productValue105 + 0.5f;
                            precise float productValue106 = floor(sumValue96) * 6.103515625e-05f;
                            precise float productValue107 = floor(sumValue97) * 6.103515625e-05f;
                            intermediateValue99 = productValue106;
                            intermediateValue100 = productValue107;
                        }
                        precise float productValue108 = sumValue91 * intermediateValue99;
                        precise float productValue109 = sumValue91 * intermediateValue100;
                        precise float sumValue98 = productValue108 + 0.0f;
                        precise float sumValue99 = productValue109 + 0.0f;
                        float intermediateValue116;
                        float intermediateValue117;
                        if (productValue101)
                        {
                            uint bitwiseValue45 = comparisonValue9 >> 15u;
                            precise float bitwiseValue46 = float(bitwiseValue45 & 1u) * 2.0f;
                            precise float sumValue100 = bitwiseValue46 + (-1.0f);
                            precise float bitwiseValue47 = float(comparisonValue9 >> 31u) * 2.0f;
                            precise float sumValue101 = bitwiseValue47 + (-1.0f);
                            precise float bitwiseValue48 = float((comparisonValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue49 = float(bitwiseValue45 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue110 = sumValue100 * 3.0517578125e-05f;
                            precise float productValue111 = sumValue101 * 3.0517578125e-05f;
                            precise float sumValue102 = bitwiseValue48 + productValue110;
                            precise float sumValue103 = bitwiseValue49 + productValue111;
                            intermediateValue116 = sumValue102;
                            intermediateValue117 = sumValue103;
                        }
                        else
                        {
                            precise float bitwiseValue50 = float(comparisonValue9 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue51 = float(comparisonValue9 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue112 = bitwiseValue50 * 16384.0f;
                            precise float sumValue104 = productValue112 + 0.5f;
                            precise float productValue113 = bitwiseValue51 * 16384.0f;
                            precise float sumValue105 = productValue113 + 0.5f;
                            precise float productValue114 = floor(sumValue104) * 6.103515625e-05f;
                            precise float productValue115 = floor(sumValue105) * 6.103515625e-05f;
                            intermediateValue116 = productValue114;
                            intermediateValue117 = productValue115;
                        }
                        precise float productValue116 = vectorValue2.x * intermediateValue116;
                        precise float productValue117 = vectorValue2.x * intermediateValue117;
                        precise float sumValue106 = sumValue98 + productValue116;
                        precise float sumValue107 = sumValue99 + productValue117;
                        float intermediateValue122;
                        float intermediateValue123;
                        if (productValue101)
                        {
                            uint bitwiseValue52 = comparisonValue8 >> 15u;
                            precise float bitwiseValue53 = float(bitwiseValue52 & 1u) * 2.0f;
                            precise float sumValue108 = bitwiseValue53 + (-1.0f);
                            precise float bitwiseValue54 = float(comparisonValue8 >> 31u) * 2.0f;
                            precise float sumValue109 = bitwiseValue54 + (-1.0f);
                            precise float bitwiseValue55 = float((comparisonValue8 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue56 = float(bitwiseValue52 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue118 = sumValue108 * 3.0517578125e-05f;
                            precise float productValue119 = sumValue109 * 3.0517578125e-05f;
                            precise float sumValue110 = bitwiseValue55 + productValue118;
                            precise float sumValue111 = bitwiseValue56 + productValue119;
                            intermediateValue122 = sumValue110;
                            intermediateValue123 = sumValue111;
                        }
                        else
                        {
                            precise float bitwiseValue57 = float(comparisonValue8 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue58 = float(comparisonValue8 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue120 = bitwiseValue57 * 16384.0f;
                            precise float sumValue112 = productValue120 + 0.5f;
                            precise float productValue121 = bitwiseValue58 * 16384.0f;
                            precise float sumValue113 = productValue121 + 0.5f;
                            precise float productValue122 = floor(sumValue112) * 6.103515625e-05f;
                            precise float productValue123 = floor(sumValue113) * 6.103515625e-05f;
                            intermediateValue122 = productValue122;
                            intermediateValue123 = productValue123;
                        }
                        precise float productValue124 = vectorValue3.y * intermediateValue122;
                        precise float productValue125 = vectorValue3.y * intermediateValue123;
                        precise float sumValue114 = sumValue106 + productValue124;
                        precise float sumValue115 = sumValue107 + productValue125;
                        precise float productValue126 = scalarValue16 * 0.083333335816860198974609375f;
                        precise float sumValue116 = productValue126 + (-0.25f);
                        float intermediateValue126;
                        float intermediateValue127;
                        float intermediateValue128;
                        float intermediateValue129;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue98 * 2 + 0) == 65535u)
                        {
                            intermediateValue126 = 1.0f;
                            intermediateValue127 = 1.0f;
                            intermediateValue128 = 1.0f;
                            intermediateValue129 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits5;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue98 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits5 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits5 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue98 * 2 + 0));
                            }
                            float4 sampledTextureValue5 = textures[NonUniformResourceIndex(reinterpretedBits5 + 0u)].SampleLevel(defaultSampler, float2(sumValue114, sumValue115), min(sumValue116, 2.0f));
                            intermediateValue126 = sampledTextureValue5.x;
                            intermediateValue127 = sampledTextureValue5.y;
                            intermediateValue128 = sampledTextureValue5.z;
                            intermediateValue129 = sampledTextureValue5.w;
                        }
                        float intermediateValue138;
                        float intermediateValue139;
                        float intermediateValue140;
                        if (scalarValue18 == 2u)
                        {
                            float branchMergedValue13;
                            float branchMergedValue23;
                            float branchMergedValue24;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue99 * 2 + 0) & 128u) == 0u)
                            {
                                float intermediateValue145;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue99 * 2 + 0) & 2048u) == 0u)
                                {
                                    intermediateValue145 = intermediateValue129;
                                }
                                else
                                {
                                    precise float productValue127 = intermediateValue129 * 2.0f;
                                    precise float sumValue117 = productValue127 + (-1.0f);
                                    intermediateValue145 = clamp(sumValue117, 0.0f, 1.0f);
                                }
                                precise float sumValue118 = 0.0f - intermediateValue126;
                                precise float sumValue119 = 0.0f - intermediateValue127;
                                precise float sumValue120 = 0.0f - intermediateValue128;
                                precise float productValue128 = sumValue118 * intermediateValue145;
                                precise float productValue129 = sumValue119 * intermediateValue145;
                                precise float productValue130 = sumValue120 * intermediateValue145;
                                precise float sumValue121 = intermediateValue126 + productValue128;
                                precise float sumValue122 = intermediateValue127 + productValue129;
                                precise float sumValue123 = intermediateValue128 + productValue130;
                                branchMergedValue13 = sumValue123;
                                branchMergedValue23 = sumValue122;
                                branchMergedValue24 = sumValue121;
                            }
                            else
                            {
                                branchMergedValue13 = 0.33399999141693115234375f;
                                branchMergedValue23 = 0.33399999141693115234375f;
                                branchMergedValue24 = 0.33399999141693115234375f;
                            }
                            intermediateValue138 = branchMergedValue24;
                            intermediateValue139 = branchMergedValue23;
                            intermediateValue140 = branchMergedValue13;
                        }
                        else
                        {
                            precise float sumValue124 = 1.0f - intermediateValue129;
                            intermediateValue138 = sumValue124;
                            intermediateValue139 = sumValue124;
                            intermediateValue140 = sumValue124;
                        }
                        precise float productValue131 = scalarValue12 * intermediateValue138;
                        precise float productValue132 = scalarValue13 * intermediateValue139;
                        precise float productValue133 = scalarValue14 * intermediateValue140;
                        float intermediateValue68;
                        float intermediateValue69;
                        float intermediateValue70;
                        bool intermediateValue146;
                        if (!(dot(float3(productValue131, productValue132, productValue133), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                        {
                            intermediateValue146 = false;
                            intermediateValue68 = productValue131;
                            intermediateValue69 = productValue132;
                            intermediateValue70 = productValue133;
                        }
                        else
                        {
                            intermediateValue146 = true;
                            intermediateValue68 = 0.0f;
                            intermediateValue69 = 0.0f;
                            intermediateValue70 = 0.0f;
                        }
                        float branchMergedValue29;
                        float branchMergedValue32;
                        float branchMergedValue33;
                        if (intermediateValue146)
                        {
                            intermediateValue33.CommitNonOpaqueTriangleHit();
                            branchMergedValue29 = intermediateValue70;
                            branchMergedValue32 = intermediateValue69;
                            branchMergedValue33 = intermediateValue68;
                        }
                        else
                        {
                            branchMergedValue29 = intermediateValue70;
                            branchMergedValue32 = intermediateValue69;
                            branchMergedValue33 = intermediateValue68;
                        }
                        branchMergedValue = branchMergedValue29;
                        branchMergedValue3 = branchMergedValue32;
                        branchMergedValue4 = branchMergedValue33;
                    }
                    else
                    {
                        branchMergedValue = scalarValue14;
                        branchMergedValue3 = scalarValue13;
                        branchMergedValue4 = scalarValue12;
                    }
                    intermediateValue40 = branchMergedValue;
                    intermediateValue38 = branchMergedValue3;
                    intermediateValue36 = branchMergedValue4;
                    bool conditionValue2 = intermediateValue33.Proceed();
                    if (conditionValue2)
                    {
                        scalarValue12 = intermediateValue36;
                        scalarValue13 = intermediateValue38;
                        scalarValue14 = intermediateValue40;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue35 = intermediateValue36;
                intermediateValue37 = intermediateValue38;
                intermediateValue39 = intermediateValue40;
            }
            else
            {
                intermediateValue35 = exponentialValue4;
                intermediateValue37 = exponentialValue5;
                intermediateValue39 = exponentialValue6;
            }
            uint scalarValue20 = intermediateValue33.CommittedStatus();
            bool comparisonValue12 = scalarValue20 == 1u;
            float comparisonValue13 = comparisonValue12 ? 0.0f : intermediateValue35;
            float comparisonValue14 = comparisonValue12 ? 0.0f : intermediateValue37;
            float comparisonValue15 = comparisonValue12 ? 0.0f : intermediateValue39;
            float branchMergedValue12;
            float branchMergedValue21;
            float branchMergedValue22;
            if (dot(float3(comparisonValue13, comparisonValue14, comparisonValue15), 1.0f.xxx) > 0.00999999977648258209228515625f)
            {
                RayDesc _6ident = {float3(sumValue74, mad(viewCbConstants[53u].y, intermediateValue23, sumValue46), sumValue75), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                intermediateValue53.TraceRayInline(SceneBVH, 512u, 22u, _6ident);
                bool conditionValue3 = intermediateValue53.Proceed();
                float intermediateValue72;
                float intermediateValue74;
                float intermediateValue76;
                if (conditionValue3)
                {
                    float intermediateValue73;
                    float intermediateValue75;
                    float intermediateValue77;
                    float scalarValue21 = comparisonValue13;
                    float scalarValue22 = comparisonValue14;
                    float scalarValue23 = comparisonValue15;
                    bool comparisonValue19;
                    for (;;)
                    {
                        uint scalarValue24 = intermediateValue53.CandidateType();
                        comparisonValue19 = scalarValue24 == 0u;
                        float branchMergedValue2;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        if (comparisonValue19)
                        {
                            float2 vectorValue4 = intermediateValue53.CandidateTriangleBarycentrics();
                            float2 vectorValue5 = intermediateValue53.CandidateTriangleBarycentrics();
                            float scalarValue25 = intermediateValue53.CandidateTriangleRayT();
                            uint scalarValue26 = intermediateValue53.CandidatePrimitiveIndex();
                            uint scalarValue27 = intermediateValue53.CandidateInstanceID();
                            uint scalarValue28 = intermediateValue53.CandidateInstanceIndex();
                            uint productValue134 = (scalarValue28 * 76u) + 58u;
                            uint productValue135 = (scalarValue28 * 76u) + 61u;
                            precise float sumValue125 = 1.0f - vectorValue4.x;
                            precise float sumValue126 = sumValue125 - vectorValue5.y;
                            uint bitwiseValue59 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue28 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue26 >> 1u);
                            uint productValue136 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue28 * 76u) + 54u) * 2 + 0)) + 0u;
                            bool comparisonValue16 = (scalarValue26 & 1u) == 0u;
                            uint comparisonValue17 = comparisonValue16 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue136), bitwiseValue59 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue136), bitwiseValue59 * 16 + 0).x;
                            uint comparisonValue20 = comparisonValue16 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue136), bitwiseValue59 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue136), bitwiseValue59 * 16 + 0).w;
                            uint comparisonValue21 = comparisonValue16 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue136), bitwiseValue59 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue136), bitwiseValue59 * 16 + 0).z;
                            bool productValue137 = rdByteLoad_objectInstances_uint16_t(0u, productValue135 * 2 + 0) < 0u;
                            float intermediateValue118;
                            float intermediateValue119;
                            if (productValue137)
                            {
                                uint bitwiseValue60 = comparisonValue21 >> 15u;
                                precise float bitwiseValue61 = float(bitwiseValue60 & 1u) * 2.0f;
                                precise float sumValue127 = bitwiseValue61 + (-1.0f);
                                precise float bitwiseValue62 = float(comparisonValue21 >> 31u) * 2.0f;
                                precise float sumValue128 = bitwiseValue62 + (-1.0f);
                                precise float bitwiseValue63 = float((comparisonValue21 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue64 = float(bitwiseValue60 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue138 = sumValue127 * 3.0517578125e-05f;
                                precise float productValue139 = sumValue128 * 3.0517578125e-05f;
                                precise float sumValue129 = bitwiseValue63 + productValue138;
                                precise float sumValue130 = bitwiseValue64 + productValue139;
                                intermediateValue118 = sumValue129;
                                intermediateValue119 = sumValue130;
                            }
                            else
                            {
                                precise float bitwiseValue65 = float(comparisonValue21 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue66 = float(comparisonValue21 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue140 = bitwiseValue65 * 16384.0f;
                                precise float sumValue131 = productValue140 + 0.5f;
                                precise float productValue141 = bitwiseValue66 * 16384.0f;
                                precise float sumValue132 = productValue141 + 0.5f;
                                precise float productValue142 = floor(sumValue131) * 6.103515625e-05f;
                                precise float productValue143 = floor(sumValue132) * 6.103515625e-05f;
                                intermediateValue118 = productValue142;
                                intermediateValue119 = productValue143;
                            }
                            precise float productValue144 = sumValue126 * intermediateValue118;
                            precise float productValue145 = sumValue126 * intermediateValue119;
                            precise float sumValue133 = productValue144 + 0.0f;
                            precise float sumValue134 = productValue145 + 0.0f;
                            float intermediateValue124;
                            float intermediateValue125;
                            if (productValue137)
                            {
                                uint bitwiseValue67 = comparisonValue20 >> 15u;
                                precise float bitwiseValue68 = float(bitwiseValue67 & 1u) * 2.0f;
                                precise float sumValue135 = bitwiseValue68 + (-1.0f);
                                precise float bitwiseValue69 = float(comparisonValue20 >> 31u) * 2.0f;
                                precise float sumValue136 = bitwiseValue69 + (-1.0f);
                                precise float bitwiseValue70 = float((comparisonValue20 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue71 = float(bitwiseValue67 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue146 = sumValue135 * 3.0517578125e-05f;
                                precise float productValue147 = sumValue136 * 3.0517578125e-05f;
                                precise float sumValue137 = bitwiseValue70 + productValue146;
                                precise float sumValue138 = bitwiseValue71 + productValue147;
                                intermediateValue124 = sumValue137;
                                intermediateValue125 = sumValue138;
                            }
                            else
                            {
                                precise float bitwiseValue72 = float(comparisonValue20 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue73 = float(comparisonValue20 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue148 = bitwiseValue72 * 16384.0f;
                                precise float sumValue139 = productValue148 + 0.5f;
                                precise float productValue149 = bitwiseValue73 * 16384.0f;
                                precise float sumValue140 = productValue149 + 0.5f;
                                precise float productValue150 = floor(sumValue139) * 6.103515625e-05f;
                                precise float productValue151 = floor(sumValue140) * 6.103515625e-05f;
                                intermediateValue124 = productValue150;
                                intermediateValue125 = productValue151;
                            }
                            precise float productValue152 = vectorValue4.x * intermediateValue124;
                            precise float productValue153 = vectorValue4.x * intermediateValue125;
                            precise float sumValue141 = sumValue133 + productValue152;
                            precise float sumValue142 = sumValue134 + productValue153;
                            float intermediateValue132;
                            float intermediateValue133;
                            if (productValue137)
                            {
                                uint bitwiseValue74 = comparisonValue17 >> 15u;
                                precise float bitwiseValue75 = float(bitwiseValue74 & 1u) * 2.0f;
                                precise float sumValue143 = bitwiseValue75 + (-1.0f);
                                precise float bitwiseValue76 = float(comparisonValue17 >> 31u) * 2.0f;
                                precise float sumValue144 = bitwiseValue76 + (-1.0f);
                                precise float bitwiseValue77 = float((comparisonValue17 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue78 = float(bitwiseValue74 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue154 = sumValue143 * 3.0517578125e-05f;
                                precise float productValue155 = sumValue144 * 3.0517578125e-05f;
                                precise float sumValue145 = bitwiseValue77 + productValue154;
                                precise float sumValue146 = bitwiseValue78 + productValue155;
                                intermediateValue132 = sumValue145;
                                intermediateValue133 = sumValue146;
                            }
                            else
                            {
                                precise float bitwiseValue79 = float(comparisonValue17 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue80 = float(comparisonValue17 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue156 = bitwiseValue79 * 16384.0f;
                                precise float sumValue147 = productValue156 + 0.5f;
                                precise float productValue157 = bitwiseValue80 * 16384.0f;
                                precise float sumValue148 = productValue157 + 0.5f;
                                precise float productValue158 = floor(sumValue147) * 6.103515625e-05f;
                                precise float productValue159 = floor(sumValue148) * 6.103515625e-05f;
                                intermediateValue132 = productValue158;
                                intermediateValue133 = productValue159;
                            }
                            precise float productValue160 = vectorValue5.y * intermediateValue132;
                            precise float productValue161 = vectorValue5.y * intermediateValue133;
                            precise float sumValue149 = sumValue141 + productValue160;
                            precise float sumValue150 = sumValue142 + productValue161;
                            float intermediateValue141;
                            float intermediateValue142;
                            float intermediateValue143;
                            float intermediateValue144;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue134 * 2 + 0) == 65535u)
                            {
                                intermediateValue141 = 1.0f;
                                intermediateValue142 = 1.0f;
                                intermediateValue143 = 1.0f;
                                intermediateValue144 = 1.0f;
                            }
                            else
                            {
                                uint reinterpretedBits7;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue134 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits7 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits7 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue134 * 2 + 0));
                                }
                                float4 sampledTextureValue6 = textures[NonUniformResourceIndex(reinterpretedBits7 + 0u)].SampleLevel(defaultSampler, float2(sumValue149, sumValue150), min(mad(scalarValue25, 0.083333335816860198974609375f, -0.25f), 2.0f));
                                intermediateValue141 = sampledTextureValue6.x;
                                intermediateValue142 = sampledTextureValue6.y;
                                intermediateValue143 = sampledTextureValue6.z;
                                intermediateValue144 = sampledTextureValue6.w;
                            }
                            float intermediateValue150;
                            float intermediateValue151;
                            float intermediateValue152;
                            if (scalarValue27 == 2u)
                            {
                                float branchMergedValue15;
                                float branchMergedValue27;
                                float branchMergedValue28;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue135 * 2 + 0) & 128u) == 0u)
                                {
                                    float intermediateValue155;
                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue135 * 2 + 0) & 2048u) == 0u)
                                    {
                                        intermediateValue155 = intermediateValue144;
                                    }
                                    else
                                    {
                                        intermediateValue155 = clamp(mad(intermediateValue144, 2.0f, -1.0f), 0.0f, 1.0f);
                                    }
                                    branchMergedValue15 = intermediateValue143 - (intermediateValue155 * intermediateValue143);
                                    branchMergedValue27 = intermediateValue142 - (intermediateValue155 * intermediateValue142);
                                    branchMergedValue28 = intermediateValue141 - (intermediateValue155 * intermediateValue141);
                                }
                                else
                                {
                                    branchMergedValue15 = 0.33399999141693115234375f;
                                    branchMergedValue27 = 0.33399999141693115234375f;
                                    branchMergedValue28 = 0.33399999141693115234375f;
                                }
                                intermediateValue150 = branchMergedValue28;
                                intermediateValue151 = branchMergedValue27;
                                intermediateValue152 = branchMergedValue15;
                            }
                            else
                            {
                                float sumValue151 = 1.0f - intermediateValue144;
                                intermediateValue150 = sumValue151;
                                intermediateValue151 = sumValue151;
                                intermediateValue152 = sumValue151;
                            }
                            float productValue162 = intermediateValue150 * scalarValue21;
                            float productValue163 = intermediateValue151 * scalarValue22;
                            float productValue164 = intermediateValue152 * scalarValue23;
                            float intermediateValue107;
                            float intermediateValue108;
                            float intermediateValue109;
                            bool intermediateValue156;
                            if (!(dot(float3(productValue162, productValue163, productValue164), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                            {
                                intermediateValue156 = false;
                                intermediateValue107 = productValue162;
                                intermediateValue108 = productValue163;
                                intermediateValue109 = productValue164;
                            }
                            else
                            {
                                intermediateValue156 = true;
                                intermediateValue107 = 0.0f;
                                intermediateValue108 = 0.0f;
                                intermediateValue109 = 0.0f;
                            }
                            float branchMergedValue31;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            if (intermediateValue156)
                            {
                                intermediateValue53.CommitNonOpaqueTriangleHit();
                                branchMergedValue31 = intermediateValue109;
                                branchMergedValue36 = intermediateValue108;
                                branchMergedValue37 = intermediateValue107;
                            }
                            else
                            {
                                branchMergedValue31 = intermediateValue109;
                                branchMergedValue36 = intermediateValue108;
                                branchMergedValue37 = intermediateValue107;
                            }
                            branchMergedValue2 = branchMergedValue31;
                            branchMergedValue7 = branchMergedValue36;
                            branchMergedValue8 = branchMergedValue37;
                        }
                        else
                        {
                            branchMergedValue2 = scalarValue23;
                            branchMergedValue7 = scalarValue22;
                            branchMergedValue8 = scalarValue21;
                        }
                        intermediateValue77 = branchMergedValue2;
                        intermediateValue75 = branchMergedValue7;
                        intermediateValue73 = branchMergedValue8;
                        bool conditionValue4 = intermediateValue53.Proceed();
                        if (conditionValue4)
                        {
                            scalarValue21 = intermediateValue73;
                            scalarValue22 = intermediateValue75;
                            scalarValue23 = intermediateValue77;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue72 = intermediateValue73;
                    intermediateValue74 = intermediateValue75;
                    intermediateValue76 = intermediateValue77;
                }
                else
                {
                    intermediateValue72 = comparisonValue13;
                    intermediateValue74 = comparisonValue14;
                    intermediateValue76 = comparisonValue15;
                }
                uint scalarValue29 = intermediateValue53.CommittedStatus();
                bool comparisonValue22 = scalarValue29 == 1u;
                branchMergedValue12 = comparisonValue22 ? 0.0f : intermediateValue76;
                branchMergedValue21 = comparisonValue22 ? 0.0f : intermediateValue74;
                branchMergedValue22 = comparisonValue22 ? 0.0f : intermediateValue72;
            }
            else
            {
                branchMergedValue12 = comparisonValue15;
                branchMergedValue21 = comparisonValue14;
                branchMergedValue22 = comparisonValue13;
            }
            intermediateValue44 = branchMergedValue22;
            intermediateValue45 = branchMergedValue21;
            intermediateValue46 = branchMergedValue12;
        }
        else
        {
            float branchMergedValue11;
            float branchMergedValue19;
            float branchMergedValue20;
            if (reinterpretedBits3)
            {
                RayDesc _7ident = {float3(sumValue45, sumValue46, sumValue47), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                intermediateValue42.TraceRayInline(SceneBVH, 512u, 22u, _7ident);
                bool conditionValue5 = intermediateValue42.Proceed();
                float intermediateValue55;
                float intermediateValue57;
                float intermediateValue59;
                if (conditionValue5)
                {
                    float intermediateValue56;
                    float intermediateValue58;
                    float intermediateValue60;
                    float scalarValue30 = 1.0f;
                    float scalarValue31 = 1.0f;
                    float scalarValue32 = 1.0f;
                    bool comparisonValue18;
                    for (;;)
                    {
                        uint scalarValue33 = intermediateValue42.CandidateType();
                        comparisonValue18 = scalarValue33 == 0u;
                        float branchMergedValue1;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (comparisonValue18)
                        {
                            float2 vectorValue6 = intermediateValue42.CandidateTriangleBarycentrics();
                            float2 vectorValue7 = intermediateValue42.CandidateTriangleBarycentrics();
                            float scalarValue34 = intermediateValue42.CandidateTriangleRayT();
                            uint scalarValue35 = intermediateValue42.CandidatePrimitiveIndex();
                            uint scalarValue36 = intermediateValue42.CandidateInstanceID();
                            uint scalarValue37 = intermediateValue42.CandidateInstanceIndex();
                            uint productValue165 = (scalarValue37 * 76u) + 58u;
                            uint productValue166 = (scalarValue37 * 76u) + 61u;
                            precise float sumValue152 = 1.0f - vectorValue6.x;
                            precise float sumValue153 = sumValue152 - vectorValue7.y;
                            uint bitwiseValue81 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue37 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue35 >> 1u);
                            uint productValue167 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue37 * 76u) + 54u) * 2 + 0)) + 0u;
                            bool comparisonValue23 = (scalarValue35 & 1u) == 0u;
                            uint comparisonValue24 = comparisonValue23 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue167), bitwiseValue81 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue167), bitwiseValue81 * 16 + 0).x;
                            uint comparisonValue25 = comparisonValue23 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue167), bitwiseValue81 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue167), bitwiseValue81 * 16 + 0).w;
                            uint comparisonValue26 = comparisonValue23 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue167), bitwiseValue81 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue167), bitwiseValue81 * 16 + 0).z;
                            bool productValue168 = rdByteLoad_objectInstances_uint16_t(0u, productValue166 * 2 + 0) < 0u;
                            float intermediateValue113;
                            float intermediateValue114;
                            if (productValue168)
                            {
                                uint bitwiseValue82 = comparisonValue26 >> 15u;
                                precise float bitwiseValue83 = float(bitwiseValue82 & 1u) * 2.0f;
                                precise float sumValue154 = bitwiseValue83 + (-1.0f);
                                precise float bitwiseValue84 = float(comparisonValue26 >> 31u) * 2.0f;
                                precise float sumValue155 = bitwiseValue84 + (-1.0f);
                                precise float bitwiseValue85 = float((comparisonValue26 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue86 = float(bitwiseValue82 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue169 = sumValue154 * 3.0517578125e-05f;
                                precise float productValue170 = sumValue155 * 3.0517578125e-05f;
                                precise float sumValue156 = bitwiseValue85 + productValue169;
                                precise float sumValue157 = bitwiseValue86 + productValue170;
                                intermediateValue113 = sumValue156;
                                intermediateValue114 = sumValue157;
                            }
                            else
                            {
                                precise float bitwiseValue87 = float(comparisonValue26 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue88 = float(comparisonValue26 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue171 = bitwiseValue87 * 16384.0f;
                                precise float sumValue158 = productValue171 + 0.5f;
                                precise float productValue172 = bitwiseValue88 * 16384.0f;
                                precise float sumValue159 = productValue172 + 0.5f;
                                precise float productValue173 = floor(sumValue158) * 6.103515625e-05f;
                                precise float productValue174 = floor(sumValue159) * 6.103515625e-05f;
                                intermediateValue113 = productValue173;
                                intermediateValue114 = productValue174;
                            }
                            precise float productValue175 = sumValue153 * intermediateValue113;
                            precise float productValue176 = sumValue153 * intermediateValue114;
                            precise float sumValue160 = productValue175 + 0.0f;
                            precise float sumValue161 = productValue176 + 0.0f;
                            float intermediateValue120;
                            float intermediateValue121;
                            if (productValue168)
                            {
                                uint bitwiseValue89 = comparisonValue25 >> 15u;
                                precise float bitwiseValue90 = float(bitwiseValue89 & 1u) * 2.0f;
                                precise float sumValue162 = bitwiseValue90 + (-1.0f);
                                precise float bitwiseValue91 = float(comparisonValue25 >> 31u) * 2.0f;
                                precise float sumValue163 = bitwiseValue91 + (-1.0f);
                                precise float bitwiseValue92 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue93 = float(bitwiseValue89 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue177 = sumValue162 * 3.0517578125e-05f;
                                precise float productValue178 = sumValue163 * 3.0517578125e-05f;
                                precise float sumValue164 = bitwiseValue92 + productValue177;
                                precise float sumValue165 = bitwiseValue93 + productValue178;
                                intermediateValue120 = sumValue164;
                                intermediateValue121 = sumValue165;
                            }
                            else
                            {
                                precise float bitwiseValue94 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue95 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue179 = bitwiseValue94 * 16384.0f;
                                precise float sumValue166 = productValue179 + 0.5f;
                                precise float productValue180 = bitwiseValue95 * 16384.0f;
                                precise float sumValue167 = productValue180 + 0.5f;
                                precise float productValue181 = floor(sumValue166) * 6.103515625e-05f;
                                precise float productValue182 = floor(sumValue167) * 6.103515625e-05f;
                                intermediateValue120 = productValue181;
                                intermediateValue121 = productValue182;
                            }
                            precise float productValue183 = vectorValue6.x * intermediateValue120;
                            precise float productValue184 = vectorValue6.x * intermediateValue121;
                            precise float sumValue168 = sumValue160 + productValue183;
                            precise float sumValue169 = sumValue161 + productValue184;
                            float intermediateValue130;
                            float intermediateValue131;
                            if (productValue168)
                            {
                                uint bitwiseValue96 = comparisonValue24 >> 15u;
                                precise float bitwiseValue97 = float(bitwiseValue96 & 1u) * 2.0f;
                                precise float sumValue170 = bitwiseValue97 + (-1.0f);
                                precise float bitwiseValue98 = float(comparisonValue24 >> 31u) * 2.0f;
                                precise float sumValue171 = bitwiseValue98 + (-1.0f);
                                precise float bitwiseValue99 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue100 = float(bitwiseValue96 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue185 = sumValue170 * 3.0517578125e-05f;
                                precise float productValue186 = sumValue171 * 3.0517578125e-05f;
                                precise float sumValue172 = bitwiseValue99 + productValue185;
                                precise float sumValue173 = bitwiseValue100 + productValue186;
                                intermediateValue130 = sumValue172;
                                intermediateValue131 = sumValue173;
                            }
                            else
                            {
                                precise float bitwiseValue101 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue102 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue187 = bitwiseValue101 * 16384.0f;
                                precise float sumValue174 = productValue187 + 0.5f;
                                precise float productValue188 = bitwiseValue102 * 16384.0f;
                                precise float sumValue175 = productValue188 + 0.5f;
                                precise float productValue189 = floor(sumValue174) * 6.103515625e-05f;
                                precise float productValue190 = floor(sumValue175) * 6.103515625e-05f;
                                intermediateValue130 = productValue189;
                                intermediateValue131 = productValue190;
                            }
                            precise float productValue191 = vectorValue7.y * intermediateValue130;
                            precise float productValue192 = vectorValue7.y * intermediateValue131;
                            precise float sumValue176 = sumValue168 + productValue191;
                            precise float sumValue177 = sumValue169 + productValue192;
                            float intermediateValue134;
                            float intermediateValue135;
                            float intermediateValue136;
                            float intermediateValue137;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue165 * 2 + 0) == 65535u)
                            {
                                intermediateValue134 = 1.0f;
                                intermediateValue135 = 1.0f;
                                intermediateValue136 = 1.0f;
                                intermediateValue137 = 1.0f;
                            }
                            else
                            {
                                uint reinterpretedBits6;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue165 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits6 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits6 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue165 * 2 + 0));
                                }
                                float4 sampledTextureValue7 = textures[NonUniformResourceIndex(reinterpretedBits6 + 0u)].SampleLevel(defaultSampler, float2(sumValue176, sumValue177), min(mad(scalarValue34, 0.083333335816860198974609375f, -0.25f), 2.0f));
                                intermediateValue134 = sampledTextureValue7.x;
                                intermediateValue135 = sampledTextureValue7.y;
                                intermediateValue136 = sampledTextureValue7.z;
                                intermediateValue137 = sampledTextureValue7.w;
                            }
                            float intermediateValue147;
                            float intermediateValue148;
                            float intermediateValue149;
                            if (scalarValue36 == 2u)
                            {
                                float branchMergedValue14;
                                float branchMergedValue25;
                                float branchMergedValue26;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue166 * 2 + 0) & 128u) == 0u)
                                {
                                    float intermediateValue153;
                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue166 * 2 + 0) & 2048u) == 0u)
                                    {
                                        intermediateValue153 = intermediateValue137;
                                    }
                                    else
                                    {
                                        intermediateValue153 = clamp(mad(intermediateValue137, 2.0f, -1.0f), 0.0f, 1.0f);
                                    }
                                    branchMergedValue14 = intermediateValue136 - (intermediateValue153 * intermediateValue136);
                                    branchMergedValue25 = intermediateValue135 - (intermediateValue153 * intermediateValue135);
                                    branchMergedValue26 = intermediateValue134 - (intermediateValue153 * intermediateValue134);
                                }
                                else
                                {
                                    branchMergedValue14 = 0.33399999141693115234375f;
                                    branchMergedValue25 = 0.33399999141693115234375f;
                                    branchMergedValue26 = 0.33399999141693115234375f;
                                }
                                intermediateValue147 = branchMergedValue26;
                                intermediateValue148 = branchMergedValue25;
                                intermediateValue149 = branchMergedValue14;
                            }
                            else
                            {
                                float sumValue178 = 1.0f - intermediateValue137;
                                intermediateValue147 = sumValue178;
                                intermediateValue148 = sumValue178;
                                intermediateValue149 = sumValue178;
                            }
                            float productValue193 = intermediateValue147 * scalarValue30;
                            float productValue194 = intermediateValue148 * scalarValue31;
                            float productValue195 = intermediateValue149 * scalarValue32;
                            float intermediateValue95;
                            float intermediateValue96;
                            float intermediateValue97;
                            bool intermediateValue154;
                            if (!(dot(float3(productValue193, productValue194, productValue195), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                            {
                                intermediateValue154 = false;
                                intermediateValue95 = productValue193;
                                intermediateValue96 = productValue194;
                                intermediateValue97 = productValue195;
                            }
                            else
                            {
                                intermediateValue154 = true;
                                intermediateValue95 = 0.0f;
                                intermediateValue96 = 0.0f;
                                intermediateValue97 = 0.0f;
                            }
                            float branchMergedValue30;
                            float branchMergedValue34;
                            float branchMergedValue35;
                            if (intermediateValue154)
                            {
                                intermediateValue42.CommitNonOpaqueTriangleHit();
                                branchMergedValue30 = intermediateValue97;
                                branchMergedValue34 = intermediateValue96;
                                branchMergedValue35 = intermediateValue95;
                            }
                            else
                            {
                                branchMergedValue30 = intermediateValue97;
                                branchMergedValue34 = intermediateValue96;
                                branchMergedValue35 = intermediateValue95;
                            }
                            branchMergedValue1 = branchMergedValue30;
                            branchMergedValue5 = branchMergedValue34;
                            branchMergedValue6 = branchMergedValue35;
                        }
                        else
                        {
                            branchMergedValue1 = scalarValue32;
                            branchMergedValue5 = scalarValue31;
                            branchMergedValue6 = scalarValue30;
                        }
                        intermediateValue60 = branchMergedValue1;
                        intermediateValue58 = branchMergedValue5;
                        intermediateValue56 = branchMergedValue6;
                        bool conditionValue6 = intermediateValue42.Proceed();
                        if (conditionValue6)
                        {
                            scalarValue30 = intermediateValue56;
                            scalarValue31 = intermediateValue58;
                            scalarValue32 = intermediateValue60;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue55 = intermediateValue56;
                    intermediateValue57 = intermediateValue58;
                    intermediateValue59 = intermediateValue60;
                }
                else
                {
                    intermediateValue55 = 1.0f;
                    intermediateValue57 = 1.0f;
                    intermediateValue59 = 1.0f;
                }
                uint scalarValue38 = intermediateValue42.CommittedStatus();
                bool comparisonValue27 = scalarValue38 == 1u;
                branchMergedValue11 = comparisonValue27 ? 0.0f : intermediateValue59;
                branchMergedValue19 = comparisonValue27 ? 0.0f : intermediateValue57;
                branchMergedValue20 = comparisonValue27 ? 0.0f : intermediateValue55;
            }
            else
            {
                branchMergedValue11 = 0.0f;
                branchMergedValue19 = 0.0f;
                branchMergedValue20 = 0.0f;
            }
            intermediateValue44 = branchMergedValue20;
            intermediateValue45 = branchMergedValue19;
            intermediateValue46 = branchMergedValue11;
        }
        float productValue196 = viewCbConstants[60u].w * viewCbConstants[60u].w;
        float multiplyAddValue18 = (((1.0f - productValue196) / exp2(log2(abs((productValue196 + 1.0f) - ((viewCbConstants[60u].w * 2.0f) * min(max(dot(float3(viewCbConstants[52u].xyz), float3(productValue45, productValue46, productValue47)), -1.0f), 1.0f)))) * 1.5f)) * 0.3183098733425140380859375f) * ((multiplyAddValue17 * multiplyAddValue17) * clamp(mad(float(asuint(viewCbConstants[53u]).w), 0.02500000037252902984619140625f, -0.5f), 0.0f, 1.0f));
        float sumValue179 = min(intermediateValue6 + 1.0f, 16.0f);
        float quotientValue5 = 1.0f / sumValue179;
        intermediateValue16 = ((((multiplyAddValue18 * intermediateValue44) * viewCbConstants[50u].x) - intermediateValue3) * quotientValue5) + intermediateValue3;
        intermediateValue17 = ((((multiplyAddValue18 * intermediateValue45) * viewCbConstants[50u].y) - intermediateValue4) * quotientValue5) + intermediateValue4;
        intermediateValue18 = ((((multiplyAddValue18 * intermediateValue46) * viewCbConstants[50u].z) - intermediateValue5) * quotientValue5) + intermediateValue5;
        intermediateValue19 = sumValue179;
    }
    volumetricInscatterRW[uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(intermediateValue16, intermediateValue17, intermediateValue18, intermediateValue19);
}
[numthreads(4, 4, 2)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
