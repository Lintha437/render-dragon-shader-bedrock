// RTXStub / AdaptiveDenoiserCalculateGradientsInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 10
#endif

#define RD_USE_DIVIDE_UNSIGNED_UINT_19 1
#define RD_USE_MODULO_UNSIGNED_UINT_20 1

#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

#include "../../include/Math.hlsli"
void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint scalarValue = reinterpretedBits.z;
    uint bitwiseValue = workgroupId.y >> 4u;
    uint bitwiseValue1 = ((scalarValue & 1023u) * (workgroupId.y & 15u)) + workgroupId.x;
    uint comparisonValue = (bitwiseValue == ((scalarValue >> 14u) & 63u)) ? ((scalarValue >> 10u) & 15u) : 16u;
    uint bitwiseValue2 = (rdDivideUnsigned(bitwiseValue1, comparisonValue) << 2u) + localThreadId.x;
    uint bitwiseValue3 = ((rdModuloUnsigned(bitwiseValue1, comparisonValue) + (bitwiseValue << 4u)) << 3u) + localThreadId.y;
    uint bitwiseValue4 = bitwiseValue2 << 2u;
    uint bitwiseValue5 = bitwiseValue3 << 2u;
    float4 loadedBufferValue = inputBufferPrimaryPathLength.Load(int3(uint2(bitwiseValue4, bitwiseValue5), 0u));
    float scalarValue1 = loadedBufferValue.x;
    uint dotProductValue;
    uint intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (scalarValue1 == 65504.0f)
    {
        dotProductValue = 0u;
        intermediateValue4 = 4u;
        intermediateValue5 = 0.0f;
        intermediateValue6 = 0.0f;
    }
    else
    {
        float4 loadedBufferValue1 = previousPrimaryNormalBuffer.Load(int3(uint2(bitwiseValue4, bitwiseValue5), 0u));
        float scalarValue2 = loadedBufferValue1.x;
        float scalarValue3 = loadedBufferValue1.y;
        float sumValue = 1.0f - abs(scalarValue2);
        float scalarValue4 = abs(scalarValue3);
        float sumValue1 = sumValue - scalarValue4;
        bool conditionValue = sumValue1 < 0.0f;
        float comparisonValue1 = conditionValue ? ((1.0f - scalarValue4) * ((scalarValue2 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue2;
        float comparisonValue2 = conditionValue ? (((scalarValue3 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue) : scalarValue3;
        float inverseLengthValue = rsqrt(dot(float3(comparisonValue1, comparisonValue2, sumValue1), float3(comparisonValue1, comparisonValue2, sumValue1)));
        float productValue = comparisonValue1 * inverseLengthValue;
        float productValue1 = comparisonValue2 * inverseLengthValue;
        float productValue2 = inverseLengthValue * sumValue1;
        float comparisonValue3 = ((productValue2 != 0.0f) || ((productValue != 0.0f) || (productValue1 != 0.0f))) ? productValue2 : 1.0f;
        float inverseLengthValue1 = rsqrt(dot(float3(productValue, productValue1, comparisonValue3), float3(productValue, productValue1, comparisonValue3)));
        float productValue3 = productValue1 * inverseLengthValue1;
        float4 loadedBufferValue2 = inputPreviousGeometryNormal.Load(int3(uint2(bitwiseValue4, bitwiseValue5), 0u));
        float scalarValue5 = loadedBufferValue2.x;
        float scalarValue6 = loadedBufferValue2.y;
        precise float sumValue2 = 1.0f - abs(scalarValue5);
        float scalarValue7 = abs(scalarValue6);
        precise float sumValue3 = sumValue2 - scalarValue7;
        bool conditionValue1 = sumValue3 < 0.0f;
        precise float sumValue4 = 1.0f - scalarValue7;
        precise float comparisonValue4 = ((scalarValue5 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue4;
        precise float comparisonValue5 = sumValue2 * ((scalarValue6 >= 0.0f) ? 1.0f : (-1.0f));
        float comparisonValue6 = conditionValue1 ? comparisonValue4 : scalarValue5;
        float comparisonValue7 = conditionValue1 ? comparisonValue5 : scalarValue6;
        float inverseLengthValue2 = rsqrt(dot(float3(comparisonValue6, comparisonValue7, sumValue3), float3(comparisonValue6, comparisonValue7, sumValue3)));
        precise float productValue4 = inverseLengthValue2 * comparisonValue7;
        float4 loadedBufferValue3 = inputPrimaryWorldPosition.Load(int3(uint2(bitwiseValue4, bitwiseValue5), 0u));
        precise float sumValue5 = viewCbConstants[71u].y + loadedBufferValue3.y;
        float productValue5 = inverseLengthValue1 * productValue;
        float productValue6 = comparisonValue3 * inverseLengthValue1;
        precise float productValue7 = inverseLengthValue2 * comparisonValue6;
        precise float productValue8 = sumValue3 * inverseLengthValue2;
        precise float sumValue6 = viewCbConstants[71u].x + loadedBufferValue3.x;
        precise float sumValue7 = viewCbConstants[71u].z + loadedBufferValue3.z;
        bool dotProductValue1 = dot(float3(0.847100675106048583984375f, 0.2079117000102996826171875f, 0.489073812961578369140625f), float3(productValue5, productValue3, productValue6)) > 0.949999988079071044921875f;
        float comparisonValue8 = dotProductValue1 ? (-0.639436304569244384765625f) : 0.847100675106048583984375f;
        float comparisonValue9 = dotProductValue1 ? (-0.3907311260700225830078125f) : 0.2079117000102996826171875f;
        float comparisonValue10 = dotProductValue1 ? 0.6621558666229248046875f : 0.489073812961578369140625f;
        float dotProductValue2 = dot(float3(comparisonValue8, comparisonValue9, comparisonValue10), float3(productValue5, productValue3, productValue6));
        float productValue9 = comparisonValue8 - (dotProductValue2 * productValue5);
        float productValue10 = comparisonValue9 - (dotProductValue2 * productValue3);
        float productValue11 = comparisonValue10 - (dotProductValue2 * productValue6);
        float inverseLengthValue3 = rsqrt(dot(float3(productValue9, productValue10, productValue11), float3(productValue9, productValue10, productValue11)));
        float productValue12 = productValue9 * inverseLengthValue3;
        float productValue13 = productValue10 * inverseLengthValue3;
        float productValue14 = productValue11 * inverseLengthValue3;
        uint productValue15 = uint(int(productValue7 * 256.0f));
        uint productValue16 = uint(int(productValue4 * 256.0f));
        uint productValue17 = uint(int(productValue8 * 256.0f));
        float reinterpretedBits1 = (abs(sumValue6) < 0.03125f) ? (sumValue6 + (productValue7 * 1.52587890625e-05f)) : asfloat(((sumValue6 < 0.0f) ? (-productValue15) : productValue15) + asuint(sumValue6));
        float reinterpretedBits2 = (abs(sumValue5) < 0.03125f) ? (sumValue5 + (productValue4 * 1.52587890625e-05f)) : asfloat(((sumValue5 < 0.0f) ? (-productValue16) : productValue16) + asuint(sumValue5));
        float reinterpretedBits3 = (abs(sumValue7) < 0.03125f) ? (sumValue7 + (productValue8 * 1.52587890625e-05f)) : asfloat(((sumValue7 < 0.0f) ? (-productValue17) : productValue17) + asuint(sumValue7));
        uint reinterpretedBits4 = asuint(viewCbConstants[84u]).z + 4294967295u;
        float4 loadedBufferValue4 = blueNoiseTexture.Load(int4(uint3(bitwiseValue4 & 252u, bitwiseValue5 & 252u, (reinterpretedBits4 >> 1u) & 127u), 0u));
        bool comparisonValue11 = (reinterpretedBits4 & 1u) == 0u;
        float comparisonValue12 = comparisonValue11 ? loadedBufferValue4.x : loadedBufferValue4.z;
        float nonlinearValue = sqrt(comparisonValue12);
        float comparisonValue13 = (comparisonValue11 ? loadedBufferValue4.y : loadedBufferValue4.w) * 6.283185482025146484375f;
        float wavePhaseValue = cos(comparisonValue13) * nonlinearValue;
        float wavePhaseValue1 = sin(comparisonValue13) * nonlinearValue;
        float nonlinearValue1 = sqrt(1.0f - comparisonValue12);
        float multiplyAddValue = mad(nonlinearValue1, productValue5, mad(wavePhaseValue1, (productValue14 * productValue3) - (productValue13 * productValue6), wavePhaseValue * productValue12));
        float multiplyAddValue1 = mad(nonlinearValue1, productValue3, mad(wavePhaseValue1, (productValue12 * productValue6) - (productValue14 * productValue5), wavePhaseValue * productValue13));
        float multiplyAddValue2 = mad(nonlinearValue1, productValue6, mad(wavePhaseValue1, (productValue13 * productValue5) - (productValue12 * productValue3), wavePhaseValue * productValue14));
        RayDesc _3ident = {float3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3), 0.0f, float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), 10.0f};
        intermediateValue16.TraceRayInline(SceneBVH, 512u, 2u, _3ident);
        bool conditionValue2 = intermediateValue16.Proceed();
        if (conditionValue2)
        {
            bool intermediateValue37;
            bool comparisonValue14;
            for (;;)
            {
                uint scalarValue8 = intermediateValue16.CandidateType();
                comparisonValue14 = scalarValue8 == 0u;
                if (comparisonValue14)
                {
                    float2 vectorValue = intermediateValue16.CandidateTriangleBarycentrics();
                    float2 vectorValue1 = intermediateValue16.CandidateTriangleBarycentrics();
                    uint scalarValue9 = intermediateValue16.CandidatePrimitiveIndex();
                    uint scalarValue10 = intermediateValue16.CandidateInstanceID();
                    uint scalarValue11 = intermediateValue16.CandidateInstanceIndex();
                    uint productValue18 = (scalarValue11 * 76u) + 58u;
                    uint productValue19 = (scalarValue11 * 76u) + 61u;
                    precise float sumValue8 = 1.0f - vectorValue.x;
                    precise float sumValue9 = sumValue8 - vectorValue1.y;
                    uint bitwiseValue7 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue11 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue9 >> 1u);
                    uint productValue20 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue11 * 76u) + 54u) * 2 + 0)) + 0u;
                    bool comparisonValue15 = (scalarValue9 & 1u) == 0u;
                    uint comparisonValue16 = comparisonValue15 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue20), bitwiseValue7 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue20), bitwiseValue7 * 16 + 0).x;
                    uint comparisonValue17 = comparisonValue15 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue20), bitwiseValue7 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue20), bitwiseValue7 * 16 + 0).w;
                    uint comparisonValue18 = comparisonValue15 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue20), bitwiseValue7 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue20), bitwiseValue7 * 16 + 0).z;
                    bool productValue21 = rdByteLoad_objectInstances_uint16_t(0u, productValue19 * 2 + 0) < 0u;
                    float intermediateValue49;
                    float intermediateValue50;
                    if (productValue21)
                    {
                        uint bitwiseValue8 = comparisonValue18 >> 15u;
                        precise float bitwiseValue9 = float(bitwiseValue8 & 1u) * 2.0f;
                        precise float sumValue10 = bitwiseValue9 + (-1.0f);
                        precise float bitwiseValue10 = float(comparisonValue18 >> 31u) * 2.0f;
                        precise float sumValue11 = bitwiseValue10 + (-1.0f);
                        precise float bitwiseValue11 = float((comparisonValue18 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue12 = float(bitwiseValue8 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue22 = sumValue10 * 3.0517578125e-05f;
                        precise float productValue23 = sumValue11 * 3.0517578125e-05f;
                        precise float sumValue12 = bitwiseValue11 + productValue22;
                        precise float sumValue13 = bitwiseValue12 + productValue23;
                        intermediateValue49 = sumValue12;
                        intermediateValue50 = sumValue13;
                    }
                    else
                    {
                        precise float bitwiseValue13 = float(comparisonValue18 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue14 = float(comparisonValue18 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue24 = bitwiseValue13 * 16384.0f;
                        precise float sumValue14 = productValue24 + 0.5f;
                        precise float productValue25 = bitwiseValue14 * 16384.0f;
                        precise float sumValue15 = productValue25 + 0.5f;
                        precise float productValue26 = floor(sumValue14) * 6.103515625e-05f;
                        precise float productValue27 = floor(sumValue15) * 6.103515625e-05f;
                        intermediateValue49 = productValue26;
                        intermediateValue50 = productValue27;
                    }
                    precise float productValue28 = sumValue9 * intermediateValue49;
                    precise float productValue29 = sumValue9 * intermediateValue50;
                    precise float sumValue16 = productValue28 + 0.0f;
                    precise float sumValue17 = productValue29 + 0.0f;
                    float intermediateValue65;
                    float intermediateValue66;
                    if (productValue21)
                    {
                        uint bitwiseValue15 = comparisonValue17 >> 15u;
                        precise float bitwiseValue16 = float(bitwiseValue15 & 1u) * 2.0f;
                        precise float sumValue18 = bitwiseValue16 + (-1.0f);
                        precise float bitwiseValue17 = float(comparisonValue17 >> 31u) * 2.0f;
                        precise float sumValue19 = bitwiseValue17 + (-1.0f);
                        precise float bitwiseValue18 = float((comparisonValue17 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue19 = float(bitwiseValue15 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue30 = sumValue18 * 3.0517578125e-05f;
                        precise float productValue31 = sumValue19 * 3.0517578125e-05f;
                        precise float sumValue20 = bitwiseValue18 + productValue30;
                        precise float sumValue21 = bitwiseValue19 + productValue31;
                        intermediateValue65 = sumValue20;
                        intermediateValue66 = sumValue21;
                    }
                    else
                    {
                        precise float bitwiseValue20 = float(comparisonValue17 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue21 = float(comparisonValue17 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue32 = bitwiseValue20 * 16384.0f;
                        precise float sumValue22 = productValue32 + 0.5f;
                        precise float productValue33 = bitwiseValue21 * 16384.0f;
                        precise float sumValue23 = productValue33 + 0.5f;
                        precise float productValue34 = floor(sumValue22) * 6.103515625e-05f;
                        precise float productValue35 = floor(sumValue23) * 6.103515625e-05f;
                        intermediateValue65 = productValue34;
                        intermediateValue66 = productValue35;
                    }
                    precise float productValue36 = vectorValue.x * intermediateValue65;
                    precise float productValue37 = vectorValue.x * intermediateValue66;
                    precise float sumValue24 = sumValue16 + productValue36;
                    precise float sumValue25 = sumValue17 + productValue37;
                    float intermediateValue74;
                    float intermediateValue75;
                    if (productValue21)
                    {
                        uint bitwiseValue22 = comparisonValue16 >> 15u;
                        precise float bitwiseValue23 = float(bitwiseValue22 & 1u) * 2.0f;
                        precise float sumValue26 = bitwiseValue23 + (-1.0f);
                        precise float bitwiseValue24 = float(comparisonValue16 >> 31u) * 2.0f;
                        precise float sumValue27 = bitwiseValue24 + (-1.0f);
                        precise float bitwiseValue25 = float((comparisonValue16 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue26 = float(bitwiseValue22 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue41 = sumValue26 * 3.0517578125e-05f;
                        precise float productValue42 = sumValue27 * 3.0517578125e-05f;
                        precise float sumValue28 = bitwiseValue25 + productValue41;
                        precise float sumValue29 = bitwiseValue26 + productValue42;
                        intermediateValue74 = sumValue28;
                        intermediateValue75 = sumValue29;
                    }
                    else
                    {
                        precise float bitwiseValue27 = float(comparisonValue16 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue28 = float(comparisonValue16 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue43 = bitwiseValue27 * 16384.0f;
                        precise float sumValue30 = productValue43 + 0.5f;
                        precise float productValue44 = bitwiseValue28 * 16384.0f;
                        precise float sumValue31 = productValue44 + 0.5f;
                        precise float productValue45 = floor(sumValue30) * 6.103515625e-05f;
                        precise float productValue46 = floor(sumValue31) * 6.103515625e-05f;
                        intermediateValue74 = productValue45;
                        intermediateValue75 = productValue46;
                    }
                    precise float productValue47 = vectorValue1.y * intermediateValue74;
                    precise float productValue48 = vectorValue1.y * intermediateValue75;
                    precise float sumValue32 = sumValue24 + productValue47;
                    precise float sumValue33 = sumValue25 + productValue48;
                    float intermediateValue84;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue18 * 2 + 0) == 65535u)
                    {
                        intermediateValue84 = 1.0f;
                    }
                    else
                    {
                        uint reinterpretedBits11;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue18 * 2 + 0) > 4095u)
                        {
                            reinterpretedBits11 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits11 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue18 * 2 + 0));
                        }
                        intermediateValue84 = textures[NonUniformResourceIndex(reinterpretedBits11 + 0u)].SampleLevel(defaultSampler, float2(sumValue32, sumValue33), -0.25f).w;
                    }
                    uint comparisonValue33;
                    if (scalarValue10 == 2u)
                    {
                        comparisonValue33 = 0u;
                    }
                    else
                    {
                        comparisonValue33 = uint(intermediateValue84 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue19 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                    }
                    if (comparisonValue33 == 0u)
                    {
                        intermediateValue16.CommitNonOpaqueTriangleHit();
                    }
                }
                intermediateValue37 = intermediateValue16.Proceed();
                if (intermediateValue37)
                {
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        uint scalarValue12 = intermediateValue16.CommittedStatus();
        float intermediateValue27;
        float intermediateValue28;
        float intermediateValue29;
        uint bitwiseValue6;
        if (scalarValue12 == 1u)
        {
            float2 vectorValue2 = intermediateValue16.CommittedTriangleBarycentrics();
            float2 vectorValue3 = intermediateValue16.CommittedTriangleBarycentrics();
            float scalarValue13 = intermediateValue16.CommittedRayT();
            uint scalarValue14 = intermediateValue16.CommittedPrimitiveIndex();
            uint scalarValue15 = intermediateValue16.CommittedInstanceIndex();
            intermediateValue27 = vectorValue2.x;
            intermediateValue28 = vectorValue3.y;
            intermediateValue29 = scalarValue13;
            bitwiseValue6 = ((scalarValue14 << 14u) & 1073725440u) | (scalarValue15 & 16383u);
        }
        else
        {
            intermediateValue27 = 0.0f;
            intermediateValue28 = 0.0f;
            intermediateValue29 = 10000.0f;
            bitwiseValue6 = 1073741823u;
        }
        RayDesc _4ident = {float3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3), 0.0f, float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), intermediateValue29};
        intermediateValue30.TraceRayInline(SceneBVH, 512u, 16u, _4ident);
        bool conditionValue3 = intermediateValue30.Proceed();
        float intermediateValue38;
        float intermediateValue40;
        float intermediateValue42;
        if (conditionValue3)
        {
            float intermediateValue39;
            float intermediateValue41;
            float intermediateValue43;
            float scalarValue16 = 1.0f;
            float scalarValue17 = 1.0f;
            float scalarValue18 = 1.0f;
            bool comparisonValue23;
            for (;;)
            {
                uint scalarValue19 = intermediateValue30.CandidateType();
                comparisonValue23 = scalarValue19 == 0u;
                float branchMergedValue;
                float branchMergedValue1;
                float branchMergedValue2;
                if (comparisonValue23)
                {
                    float2 vectorValue4 = intermediateValue30.CandidateTriangleBarycentrics();
                    float2 vectorValue5 = intermediateValue30.CandidateTriangleBarycentrics();
                    float scalarValue20 = intermediateValue30.CandidateTriangleRayT();
                    uint scalarValue21 = intermediateValue30.CandidatePrimitiveIndex();
                    uint scalarValue22 = intermediateValue30.CandidateInstanceID();
                    uint scalarValue23 = intermediateValue30.CandidateInstanceIndex();
                    uint productValue49 = (scalarValue23 * 76u) + 58u;
                    uint productValue50 = (scalarValue23 * 76u) + 61u;
                    precise float sumValue34 = 1.0f - vectorValue4.x;
                    precise float sumValue35 = sumValue34 - vectorValue5.y;
                    uint bitwiseValue29 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue23 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue21 >> 1u);
                    uint productValue51 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue23 * 76u) + 54u) * 2 + 0)) + 0u;
                    bool comparisonValue19 = (scalarValue21 & 1u) == 0u;
                    uint comparisonValue20 = comparisonValue19 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue51), bitwiseValue29 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue51), bitwiseValue29 * 16 + 0).x;
                    uint comparisonValue21 = comparisonValue19 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue51), bitwiseValue29 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue51), bitwiseValue29 * 16 + 0).w;
                    uint comparisonValue22 = comparisonValue19 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue51), bitwiseValue29 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue51), bitwiseValue29 * 16 + 0).z;
                    bool productValue52 = rdByteLoad_objectInstances_uint16_t(0u, productValue50 * 2 + 0) < 0u;
                    float intermediateValue67;
                    float intermediateValue68;
                    if (productValue52)
                    {
                        uint bitwiseValue30 = comparisonValue22 >> 15u;
                        precise float bitwiseValue31 = float(bitwiseValue30 & 1u) * 2.0f;
                        precise float sumValue36 = bitwiseValue31 + (-1.0f);
                        precise float bitwiseValue32 = float(comparisonValue22 >> 31u) * 2.0f;
                        precise float sumValue37 = bitwiseValue32 + (-1.0f);
                        precise float bitwiseValue33 = float((comparisonValue22 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue34 = float(bitwiseValue30 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue53 = sumValue36 * 3.0517578125e-05f;
                        precise float productValue54 = sumValue37 * 3.0517578125e-05f;
                        precise float sumValue38 = bitwiseValue33 + productValue53;
                        precise float sumValue39 = bitwiseValue34 + productValue54;
                        intermediateValue67 = sumValue38;
                        intermediateValue68 = sumValue39;
                    }
                    else
                    {
                        precise float bitwiseValue35 = float(comparisonValue22 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue36 = float(comparisonValue22 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue55 = bitwiseValue35 * 16384.0f;
                        precise float sumValue40 = productValue55 + 0.5f;
                        precise float productValue56 = bitwiseValue36 * 16384.0f;
                        precise float sumValue41 = productValue56 + 0.5f;
                        precise float productValue57 = floor(sumValue40) * 6.103515625e-05f;
                        precise float productValue58 = floor(sumValue41) * 6.103515625e-05f;
                        intermediateValue67 = productValue57;
                        intermediateValue68 = productValue58;
                    }
                    precise float productValue59 = sumValue35 * intermediateValue67;
                    precise float productValue60 = sumValue35 * intermediateValue68;
                    precise float sumValue42 = productValue59 + 0.0f;
                    precise float sumValue43 = productValue60 + 0.0f;
                    float intermediateValue76;
                    float intermediateValue77;
                    if (productValue52)
                    {
                        uint bitwiseValue37 = comparisonValue21 >> 15u;
                        precise float bitwiseValue40 = float(bitwiseValue37 & 1u) * 2.0f;
                        precise float sumValue44 = bitwiseValue40 + (-1.0f);
                        precise float bitwiseValue41 = float(comparisonValue21 >> 31u) * 2.0f;
                        precise float sumValue45 = bitwiseValue41 + (-1.0f);
                        precise float bitwiseValue42 = float((comparisonValue21 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue43 = float(bitwiseValue37 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue61 = sumValue44 * 3.0517578125e-05f;
                        precise float productValue62 = sumValue45 * 3.0517578125e-05f;
                        precise float sumValue46 = bitwiseValue42 + productValue61;
                        precise float sumValue47 = bitwiseValue43 + productValue62;
                        intermediateValue76 = sumValue46;
                        intermediateValue77 = sumValue47;
                    }
                    else
                    {
                        precise float bitwiseValue44 = float(comparisonValue21 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue45 = float(comparisonValue21 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue63 = bitwiseValue44 * 16384.0f;
                        precise float sumValue48 = productValue63 + 0.5f;
                        precise float productValue64 = bitwiseValue45 * 16384.0f;
                        precise float sumValue49 = productValue64 + 0.5f;
                        precise float productValue65 = floor(sumValue48) * 6.103515625e-05f;
                        precise float productValue66 = floor(sumValue49) * 6.103515625e-05f;
                        intermediateValue76 = productValue65;
                        intermediateValue77 = productValue66;
                    }
                    precise float productValue67 = vectorValue4.x * intermediateValue76;
                    precise float productValue68 = vectorValue4.x * intermediateValue77;
                    precise float sumValue50 = sumValue42 + productValue67;
                    precise float sumValue51 = sumValue43 + productValue68;
                    float intermediateValue85;
                    float intermediateValue86;
                    if (productValue52)
                    {
                        uint bitwiseValue46 = comparisonValue20 >> 15u;
                        precise float bitwiseValue47 = float(bitwiseValue46 & 1u) * 2.0f;
                        precise float sumValue52 = bitwiseValue47 + (-1.0f);
                        precise float bitwiseValue48 = float(comparisonValue20 >> 31u) * 2.0f;
                        precise float sumValue53 = bitwiseValue48 + (-1.0f);
                        precise float bitwiseValue49 = float((comparisonValue20 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue50 = float(bitwiseValue46 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue69 = sumValue52 * 3.0517578125e-05f;
                        precise float productValue70 = sumValue53 * 3.0517578125e-05f;
                        precise float sumValue54 = bitwiseValue49 + productValue69;
                        precise float sumValue55 = bitwiseValue50 + productValue70;
                        intermediateValue85 = sumValue54;
                        intermediateValue86 = sumValue55;
                    }
                    else
                    {
                        precise float bitwiseValue51 = float(comparisonValue20 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue52 = float(comparisonValue20 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue71 = bitwiseValue51 * 16384.0f;
                        precise float sumValue56 = productValue71 + 0.5f;
                        precise float productValue72 = bitwiseValue52 * 16384.0f;
                        precise float sumValue57 = productValue72 + 0.5f;
                        precise float productValue73 = floor(sumValue56) * 6.103515625e-05f;
                        precise float productValue74 = floor(sumValue57) * 6.103515625e-05f;
                        intermediateValue85 = productValue73;
                        intermediateValue86 = productValue74;
                    }
                    precise float productValue75 = vectorValue5.y * intermediateValue85;
                    precise float productValue76 = vectorValue5.y * intermediateValue86;
                    precise float sumValue58 = sumValue50 + productValue75;
                    precise float sumValue59 = sumValue51 + productValue76;
                    float intermediateValue89;
                    float intermediateValue90;
                    float intermediateValue91;
                    float intermediateValue92;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue49 * 2 + 0) == 65535u)
                    {
                        intermediateValue89 = 1.0f;
                        intermediateValue90 = 1.0f;
                        intermediateValue91 = 1.0f;
                        intermediateValue92 = 1.0f;
                    }
                    else
                    {
                        uint reinterpretedBits17;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue49 * 2 + 0) > 4095u)
                        {
                            reinterpretedBits17 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits17 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue49 * 2 + 0));
                        }
                        float4 sampledTextureValue = textures[NonUniformResourceIndex(reinterpretedBits17 + 0u)].SampleLevel(defaultSampler, float2(sumValue58, sumValue59), min(mad(scalarValue20, 0.083333335816860198974609375f, -0.25f), 2.0f));
                        intermediateValue89 = sampledTextureValue.x;
                        intermediateValue90 = sampledTextureValue.y;
                        intermediateValue91 = sampledTextureValue.z;
                        intermediateValue92 = sampledTextureValue.w;
                    }
                    float intermediateValue99;
                    float intermediateValue100;
                    float intermediateValue101;
                    if (scalarValue22 == 2u)
                    {
                        float branchMergedValue6;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue50 * 2 + 0) & 128u) == 0u)
                        {
                            float intermediateValue103;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue50 * 2 + 0) & 2048u) == 0u)
                            {
                                intermediateValue103 = intermediateValue92;
                            }
                            else
                            {
                                intermediateValue103 = clamp(mad(intermediateValue92, 2.0f, -1.0f), 0.0f, 1.0f);
                            }
                            branchMergedValue6 = intermediateValue91 - (intermediateValue103 * intermediateValue91);
                            branchMergedValue7 = intermediateValue90 - (intermediateValue103 * intermediateValue90);
                            branchMergedValue8 = intermediateValue89 - (intermediateValue103 * intermediateValue89);
                        }
                        else
                        {
                            branchMergedValue6 = 0.33399999141693115234375f;
                            branchMergedValue7 = 0.33399999141693115234375f;
                            branchMergedValue8 = 0.33399999141693115234375f;
                        }
                        intermediateValue99 = branchMergedValue8;
                        intermediateValue100 = branchMergedValue7;
                        intermediateValue101 = branchMergedValue6;
                    }
                    else
                    {
                        float sumValue60 = 1.0f - intermediateValue92;
                        intermediateValue99 = sumValue60;
                        intermediateValue100 = sumValue60;
                        intermediateValue101 = sumValue60;
                    }
                    float productValue77 = intermediateValue99 * scalarValue16;
                    float productValue78 = intermediateValue100 * scalarValue17;
                    float productValue79 = intermediateValue101 * scalarValue18;
                    float intermediateValue57;
                    float intermediateValue58;
                    float intermediateValue59;
                    bool intermediateValue104;
                    if (!(dot(float3(productValue77, productValue78, productValue79), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                    {
                        intermediateValue104 = false;
                        intermediateValue57 = productValue77;
                        intermediateValue58 = productValue78;
                        intermediateValue59 = productValue79;
                    }
                    else
                    {
                        intermediateValue104 = true;
                        intermediateValue57 = 0.0f;
                        intermediateValue58 = 0.0f;
                        intermediateValue59 = 0.0f;
                    }
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if (intermediateValue104)
                    {
                        intermediateValue30.CommitNonOpaqueTriangleHit();
                        branchMergedValue9 = intermediateValue59;
                        branchMergedValue10 = intermediateValue58;
                        branchMergedValue11 = intermediateValue57;
                    }
                    else
                    {
                        branchMergedValue9 = intermediateValue59;
                        branchMergedValue10 = intermediateValue58;
                        branchMergedValue11 = intermediateValue57;
                    }
                    branchMergedValue = branchMergedValue9;
                    branchMergedValue1 = branchMergedValue10;
                    branchMergedValue2 = branchMergedValue11;
                }
                else
                {
                    branchMergedValue = scalarValue18;
                    branchMergedValue1 = scalarValue17;
                    branchMergedValue2 = scalarValue16;
                }
                intermediateValue43 = branchMergedValue;
                intermediateValue41 = branchMergedValue1;
                intermediateValue39 = branchMergedValue2;
                bool conditionValue4 = intermediateValue30.Proceed();
                if (conditionValue4)
                {
                    scalarValue16 = intermediateValue39;
                    scalarValue17 = intermediateValue41;
                    scalarValue18 = intermediateValue43;
                    continue;
                }
                else
                {
                    break;
                }
            }
            intermediateValue38 = intermediateValue39;
            intermediateValue40 = intermediateValue41;
            intermediateValue42 = intermediateValue43;
        }
        else
        {
            intermediateValue38 = 1.0f;
            intermediateValue40 = 1.0f;
            intermediateValue42 = 1.0f;
        }
        uint scalarValue24 = intermediateValue30.CommittedStatus();
        bool comparisonValue24 = scalarValue24 == 1u;
        float comparisonValue25 = comparisonValue24 ? 0.0f : intermediateValue38;
        float comparisonValue26 = comparisonValue24 ? 0.0f : intermediateValue40;
        float comparisonValue27 = comparisonValue24 ? 0.0f : intermediateValue42;
        float productValue38;
        float productValue39;
        float productValue40;
        if (intermediateValue29 < 10000.0f)
        {
            uint bitwiseValue53 = bitwiseValue6 & 16383u;
            uint productValue80 = (bitwiseValue53 * 76u) + 58u;
            uint productValue81 = (bitwiseValue53 * 76u) + 59u;
            uint productValue82 = (bitwiseValue53 * 76u) + 61u;
            uint productValue83 = (bitwiseValue53 * 38u) + 32u;
            uint productValue84 = (bitwiseValue53 * 38u) + 24u;
            uint productValue85 = (bitwiseValue53 * 76u) + 72u;
            uint bitwiseValue54 = ((bitwiseValue6 >> 13u) & 2u) | ((bitwiseValue6 >> 13u) & 131068u);
            uint productValue86 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue53 * 76u) + 54u) * 2 + 0));
            uint sumValue61 = productValue86 + 0u;
            float sumValue62 = (1.0f - intermediateValue27) - intermediateValue28;
            uint sumValue63 = productValue86 + 0u;
            uint productValue87 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue53 * 76u) + 56u) * 2 + 0));
            uint productValue88 = productValue87 * (rdByteLoad_objectInstances_uint(0u, productValue84 * 4 + 0) + bitwiseValue54);
            uint bitwiseValue55 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue85 * 2 + 0) & 255u);
            uint bitwiseValue56 = (bitwiseValue55 + productValue88) >> 2u;
            uint bitwiseValue57 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue85 * 2 + 0) >> 8u);
            uint bitwiseValue60 = (bitwiseValue57 + productValue88) >> 2u;
            bool productValue89 = rdByteLoad_objectInstances_uint16_t(0u, productValue82 * 2 + 0) < 0u;
            float bitwiseValue38;
            float bitwiseValue39;
            if (productValue89)
            {
                uint bitwiseValue61 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue60 * 4 + 0) >> 15u;
                bitwiseValue38 = ((float(bitwiseValue61 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue60 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                bitwiseValue39 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue60 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue61 & 65534u) * 1.525902189314365386962890625e-05f);
            }
            else
            {
                bitwiseValue38 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue60 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                bitwiseValue39 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue60 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
            }
            uint intermediateValue69;
            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue82 * 2 + 0) & 256u) == 0u)
            {
                intermediateValue69 = 0u;
            }
            else
            {
                intermediateValue69 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), ((uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue53 * 76u) + 74u) * 2 + 0) >> 8u) + productValue88) >> 2u) * 4 + 0) & 65535u;
            }
            uint bitwiseValue62 = productValue87 * (rdByteLoad_objectInstances_uint(0u, productValue84 * 4 + 0) + (bitwiseValue54 | 1u));
            uint bitwiseValue63 = (bitwiseValue55 + bitwiseValue62) >> 2u;
            uint bitwiseValue64 = (bitwiseValue57 + bitwiseValue62) >> 2u;
            float bitwiseValue58;
            float bitwiseValue59;
            if (productValue89)
            {
                uint bitwiseValue65 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue64 * 4 + 0) >> 15u;
                bitwiseValue58 = ((float(bitwiseValue65 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue64 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                bitwiseValue59 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue64 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue65 & 65534u) * 1.525902189314365386962890625e-05f);
            }
            else
            {
                bitwiseValue58 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue64 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                bitwiseValue59 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue64 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
            }
            uint bitwiseValue66 = productValue87 * (rdByteLoad_objectInstances_uint(0u, productValue84 * 4 + 0) + (bitwiseValue54 ^ 2u));
            uint bitwiseValue67 = (bitwiseValue55 + bitwiseValue66) >> 2u;
            uint bitwiseValue68 = (bitwiseValue57 + bitwiseValue66) >> 2u;
            float bitwiseValue79;
            float bitwiseValue80;
            if (productValue89)
            {
                uint bitwiseValue69 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue68 * 4 + 0) >> 15u;
                bitwiseValue79 = ((float(bitwiseValue69 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue68 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
                bitwiseValue80 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue68 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue69 & 65534u) * 1.525902189314365386962890625e-05f);
            }
            else
            {
                bitwiseValue79 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue68 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
                bitwiseValue80 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue68 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
            }
            float productValue90 = ((bitwiseValue58 * intermediateValue27) + (bitwiseValue38 * sumValue62)) + (bitwiseValue79 * intermediateValue28);
            float productValue91 = ((bitwiseValue59 * intermediateValue27) + (bitwiseValue39 * sumValue62)) + (bitwiseValue80 * intermediateValue28);
            float bitwiseValue70 = (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue63 * 4 + 0) & 255u) * intermediateValue27) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue56 * 4 + 0) & 255u) * sumValue62)) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue67 * 4 + 0) & 255u) * intermediateValue28)) * 0.0039215688593685626983642578125f;
            float bitwiseValue71 = (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue63 * 4 + 0) >> 8u) & 255u) * intermediateValue27) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue56 * 4 + 0) >> 8u) & 255u) * sumValue62)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue67 * 4 + 0) >> 8u) & 255u) * intermediateValue28)) * 0.0039215688593685626983642578125f;
            float bitwiseValue72 = (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue63 * 4 + 0) >> 16u) & 255u) * intermediateValue27) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue56 * 4 + 0) >> 16u) & 255u) * sumValue62)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue67 * 4 + 0) >> 16u) & 255u) * intermediateValue28)) * 0.0039215688593685626983642578125f;
            float bitwiseValue73 = (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue63 * 4 + 0) >> 24u) * intermediateValue27) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue56 * 4 + 0) >> 24u) * sumValue62)) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue63), bitwiseValue67 * 4 + 0) >> 24u) * intermediateValue28)) * 0.0039215688593685626983642578125f;
            float2 reinterpretedBits5 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, (intermediateValue69 * 8u) * 8 + 0));
            float2 reinterpretedBits6 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue69 * 8u) + 1u) * 8 + 0));
            float reinterpretedBits7 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue69 * 16u) + 13u) * 4 + 0));
            float reinterpretedBits8 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue69 * 16u) + 14u) * 4 + 0));
            float nonlinearValue2 = max(0.0f, log2(abs((viewCbConstants[89u].y * scalarValue1) + (intermediateValue29 * 0.100000001490116119384765625f))) + float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue61), ((((rdByteLoad_objectInstances_uint(0u, ((bitwiseValue53 * 38u) + 25u) * 4 + 0) >> 2u) + ((bitwiseValue6 >> 15u) & 32767u)) * 8u) + 6u) * 2 + 0))));
            uint reinterpretedBits16;
            if (rdByteLoad_objectInstances_uint16_t(0u, productValue80 * 2 + 0) > 4095u)
            {
                reinterpretedBits16 = asuint(viewCbConstants[98u]).w;
            }
            else
            {
                reinterpretedBits16 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue80 * 2 + 0));
            }
            uint sumValue64 = reinterpretedBits16 + 0u;
            float intermediateValue93;
            float intermediateValue94;
            float intermediateValue95;
            float intermediateValue96;
            if (rdByteLoad_objectInstances_uint16_t(0u, productValue80 * 2 + 0) == 65535u)
            {
                intermediateValue93 = 1.0f;
                intermediateValue94 = 1.0f;
                intermediateValue95 = 1.0f;
                intermediateValue96 = 1.0f;
            }
            else
            {
                float4 sampledTextureValue1 = textures[NonUniformResourceIndex(sumValue64)].SampleLevel(defaultSampler, float2(productValue90, productValue91), min(nonlinearValue2, reinterpretedBits7));
                intermediateValue93 = sampledTextureValue1.x;
                intermediateValue94 = sampledTextureValue1.y;
                intermediateValue95 = sampledTextureValue1.z;
                intermediateValue96 = sampledTextureValue1.w;
            }
            float productValue120;
            float productValue121;
            float productValue122;
            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue82 * 2 + 0) & 1536u) == 0u)
            {
                float intermediateValue105;
                float intermediateValue106;
                float intermediateValue107;
                float intermediateValue108;
                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue82 * 2 + 0) & 4u) == 0u)
                {
                    intermediateValue105 = intermediateValue96;
                    intermediateValue106 = bitwiseValue70;
                    intermediateValue107 = bitwiseValue71;
                    intermediateValue108 = bitwiseValue72;
                }
                else
                {
                    uint reinterpretedBits18;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue81 * 2 + 0) > 4095u)
                    {
                        reinterpretedBits18 = asuint(viewCbConstants[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits18 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue81 * 2 + 0));
                    }
                    float4 sampledTextureValue2 = textures[NonUniformResourceIndex(reinterpretedBits18 + 0u)].SampleLevel(defaultSampler, float2(bitwiseValue70, bitwiseValue71), 0.0f);
                    intermediateValue105 = 1.0f;
                    intermediateValue106 = ((((sampledTextureValue2.x * 2.0f) + (-1.0f)) * bitwiseValue72) + 1.0f) * bitwiseValue73;
                    intermediateValue107 = ((((sampledTextureValue2.y * 2.0f) + (-1.0f)) * bitwiseValue72) + 1.0f) * bitwiseValue73;
                    intermediateValue108 = ((((sampledTextureValue2.z * 2.0f) + (-1.0f)) * bitwiseValue72) + 1.0f) * bitwiseValue73;
                }
                float intermediateValue111;
                float intermediateValue112;
                float intermediateValue113;
                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue82 * 2 + 0) & 8192u) == 0u)
                {
                    intermediateValue111 = intermediateValue106;
                    intermediateValue112 = intermediateValue107;
                    intermediateValue113 = intermediateValue108;
                }
                else
                {
                    intermediateValue111 = ((1.0f - intermediateValue106) * intermediateValue105) + intermediateValue106;
                    intermediateValue112 = ((1.0f - intermediateValue107) * intermediateValue105) + intermediateValue107;
                    intermediateValue113 = ((1.0f - intermediateValue108) * intermediateValue105) + intermediateValue108;
                }
                float intermediateValue115;
                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue82 * 2 + 0) & 2048u) == 0u)
                {
                    intermediateValue115 = intermediateValue105;
                }
                else
                {
                    intermediateValue115 = clamp(mad(intermediateValue105, 2.0f, -1.0f), 0.0f, 1.0f);
                }
                float bitwiseValue74 = (intermediateValue111 * intermediateValue93) * ((intermediateValue115 * ((float(rdByteLoad_objectInstances_uint(0u, productValue83 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                float bitwiseValue75 = (intermediateValue112 * intermediateValue94) * ((intermediateValue115 * ((float((rdByteLoad_objectInstances_uint(0u, productValue83 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                float bitwiseValue76 = (intermediateValue113 * intermediateValue95) * ((intermediateValue115 * ((float((rdByteLoad_objectInstances_uint(0u, productValue83 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                float productValue131;
                if (bitwiseValue74 < 0.040449999272823333740234375f)
                {
                    productValue131 = bitwiseValue74 * 0.077399380505084991455078125f;
                }
                else
                {
                    productValue131 = exp2(log2((bitwiseValue74 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                }
                float productValue132;
                if (bitwiseValue75 < 0.040449999272823333740234375f)
                {
                    productValue132 = bitwiseValue75 * 0.077399380505084991455078125f;
                }
                else
                {
                    productValue132 = exp2(log2((bitwiseValue75 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                }
                float productValue133;
                if (bitwiseValue76 < 0.040449999272823333740234375f)
                {
                    productValue133 = bitwiseValue76 * 0.077399380505084991455078125f;
                }
                else
                {
                    productValue133 = exp2(log2((bitwiseValue76 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                }
                float reinterpretedBits20;
                if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue69 * 16u) + 8u) * 4 + 0) & 1u) == 0u)
                {
                    reinterpretedBits20 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue69 * 16u) + 10u) * 4 + 0));
                }
                else
                {
                    float4 sampledTextureValue3 = textures[NonUniformResourceIndex(sumValue64)].SampleLevel(defaultSampler, float2(mad(productValue90, reinterpretedBits5.x, reinterpretedBits6.x), mad(productValue91, reinterpretedBits5.y, reinterpretedBits6.y)), min((reinterpretedBits8 - reinterpretedBits7) + nonlinearValue2, reinterpretedBits8));
                    float scalarValue25 = sampledTextureValue3.y;
                    reinterpretedBits20 = mad(scalarValue25, scalarValue25, 0.0f);
                }
                float dotProductValue3 = dot(float3(productValue131, productValue132, productValue133), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                float productValue92 = (reinterpretedBits20 * 5.0f) * viewCbConstants[84u].w;
                productValue120 = productValue92 * (((dotProductValue3 - productValue131) * viewCbConstants[85u].x) + productValue131);
                productValue121 = productValue92 * (((dotProductValue3 - productValue132) * viewCbConstants[85u].x) + productValue132);
                productValue122 = productValue92 * (((dotProductValue3 - productValue133) * viewCbConstants[85u].x) + productValue133);
            }
            else
            {
                productValue120 = intermediateValue102;
                productValue121 = intermediateValue102;
                productValue122 = intermediateValue102;
            }
            productValue38 = (productValue120 * comparisonValue25) * viewCbConstants[85u].y;
            productValue39 = (productValue121 * comparisonValue26) * viewCbConstants[85u].y;
            productValue40 = (productValue122 * comparisonValue27) * viewCbConstants[85u].y;
        }
        else
        {
            productValue38 = 0.0f;
            productValue39 = 0.0f;
            productValue40 = 0.0f;
        }
        uint reinterpretedBits9 = asuint(viewCbConstants[84u]).z + 4294967295u;
        float4 loadedBufferValue5 = blueNoiseTexture.Load(int4(uint3(bitwiseValue2 & 255u, bitwiseValue3 & 255u, (reinterpretedBits9 >> 2u) & 127u), 0u));
        uint bitwiseValue77 = reinterpretedBits9 & 3u;
        float intermediateValue61;
        if (bitwiseValue77 == 0u)
        {
            intermediateValue61 = loadedBufferValue5.x;
        }
        else
        {
            float branchMergedValue4;
            if (bitwiseValue77 == 1u)
            {
                branchMergedValue4 = loadedBufferValue5.y;
            }
            else
            {
                branchMergedValue4 = (bitwiseValue77 == 2u) ? loadedBufferValue5.z : loadedBufferValue5.w;
            }
            intermediateValue61 = branchMergedValue4;
        }
        precise float productValue93 = intermediateValue61 * 32.0f;
        uint scalarValue26 = min(uint(productValue93), 31u);
        uint productValue94 = scalarValue26 * 5u;
        float3 reinterpretedBits10 = asfloat(uint3(rdByteLoad_inputTemporallyStableLights_uint(0u, productValue94 * 4 + 0), rdByteLoad_inputTemporallyStableLights_uint(0u, (productValue94 + 1u) * 4 + 0), rdByteLoad_inputTemporallyStableLights_uint(0u, (productValue94 + 2u) * 4 + 0)));
        precise float productValue95 = productValue7 * 0.0199999995529651641845703125f;
        precise float productValue96 = productValue4 * 0.0199999995529651641845703125f;
        precise float productValue97 = productValue8 * 0.0199999995529651641845703125f;
        precise float sumValue65 = productValue95 + sumValue6;
        precise float sumValue66 = productValue96 + sumValue5;
        precise float sumValue67 = productValue97 + sumValue7;
        precise float sumValue68 = reinterpretedBits10.x - sumValue65;
        precise float sumValue69 = reinterpretedBits10.y - sumValue66;
        precise float sumValue70 = reinterpretedBits10.z - sumValue67;
        precise float productValue98 = sumValue68 * sumValue68;
        precise float productValue99 = sumValue69 * sumValue69;
        precise float sumValue71 = productValue98 + productValue99;
        precise float productValue100 = sumValue70 * sumValue70;
        precise float sumValue72 = productValue100 + sumValue71;
        float nonlinearValue3 = sqrt(sumValue72);
        precise float quotientValue = sumValue68 / nonlinearValue3;
        precise float quotientValue1 = sumValue69 / nonlinearValue3;
        precise float quotientValue2 = sumValue70 / nonlinearValue3;
        uint loadedBufferValue6 = (uint(inputBufferSurfaceOpacityAndObjectCategory.Load(int3(uint2(bitwiseValue4, bitwiseValue5), 0u)).y * 255.0f) >> 7u) & 1u;
        float dotProductValue4 = max(dot(float3(quotientValue, quotientValue1, quotientValue2), float3(productValue7, productValue4, productValue8)), 0.0f);
        float intermediateValue7;
        if (dotProductValue4 > 0.00999999977648258209228515625f)
        {
            RayDesc _5ident = {float3(sumValue65, sumValue66, sumValue67), 0.0f, float3(quotientValue, quotientValue1, quotientValue2), max(0.0f, nonlinearValue3 + (-0.4000000059604644775390625f))};
            intermediateValue63.TraceRayInline(SceneBVH, 512u, 135u, _5ident);
            bool conditionValue5 = intermediateValue63.Proceed();
            if (conditionValue5)
            {
                bool intermediateValue83;
                bool comparisonValue28;
                for (;;)
                {
                    uint scalarValue27 = intermediateValue63.CandidateType();
                    comparisonValue28 = scalarValue27 == 0u;
                    if (comparisonValue28)
                    {
                        float2 vectorValue6 = intermediateValue63.CandidateTriangleBarycentrics();
                        float2 vectorValue7 = intermediateValue63.CandidateTriangleBarycentrics();
                        uint scalarValue28 = intermediateValue63.CandidatePrimitiveIndex();
                        uint scalarValue29 = intermediateValue63.CandidateInstanceID();
                        uint scalarValue30 = intermediateValue63.CandidateInstanceIndex();
                        uint productValue101 = (scalarValue30 * 76u) + 58u;
                        uint productValue102 = (scalarValue30 * 76u) + 61u;
                        precise float sumValue73 = 1.0f - vectorValue6.x;
                        precise float sumValue74 = sumValue73 - vectorValue7.y;
                        uint bitwiseValue78 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue30 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue28 >> 1u);
                        uint productValue103 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue30 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue29 = (scalarValue28 & 1u) == 0u;
                        uint comparisonValue30 = comparisonValue29 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue103), bitwiseValue78 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue103), bitwiseValue78 * 16 + 0).x;
                        uint comparisonValue31 = comparisonValue29 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue103), bitwiseValue78 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue103), bitwiseValue78 * 16 + 0).w;
                        uint comparisonValue32 = comparisonValue29 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue103), bitwiseValue78 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue103), bitwiseValue78 * 16 + 0).z;
                        bool productValue104 = rdByteLoad_objectInstances_uint16_t(0u, productValue102 * 2 + 0) < 0u;
                        float intermediateValue87;
                        float intermediateValue88;
                        if (productValue104)
                        {
                            uint bitwiseValue81 = comparisonValue32 >> 15u;
                            precise float bitwiseValue82 = float(bitwiseValue81 & 1u) * 2.0f;
                            precise float sumValue75 = bitwiseValue82 + (-1.0f);
                            precise float bitwiseValue83 = float(comparisonValue32 >> 31u) * 2.0f;
                            precise float sumValue76 = bitwiseValue83 + (-1.0f);
                            precise float bitwiseValue84 = float((comparisonValue32 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue85 = float(bitwiseValue81 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue105 = sumValue75 * 3.0517578125e-05f;
                            precise float productValue106 = sumValue76 * 3.0517578125e-05f;
                            precise float sumValue77 = bitwiseValue84 + productValue105;
                            precise float sumValue78 = bitwiseValue85 + productValue106;
                            intermediateValue87 = sumValue77;
                            intermediateValue88 = sumValue78;
                        }
                        else
                        {
                            precise float bitwiseValue86 = float(comparisonValue32 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue87 = float(comparisonValue32 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue107 = bitwiseValue86 * 16384.0f;
                            precise float sumValue79 = productValue107 + 0.5f;
                            precise float productValue108 = bitwiseValue87 * 16384.0f;
                            precise float sumValue80 = productValue108 + 0.5f;
                            precise float productValue109 = floor(sumValue79) * 6.103515625e-05f;
                            precise float productValue110 = floor(sumValue80) * 6.103515625e-05f;
                            intermediateValue87 = productValue109;
                            intermediateValue88 = productValue110;
                        }
                        precise float productValue111 = sumValue74 * intermediateValue87;
                        precise float productValue112 = sumValue74 * intermediateValue88;
                        precise float sumValue81 = productValue111 + 0.0f;
                        precise float sumValue82 = productValue112 + 0.0f;
                        float intermediateValue97;
                        float intermediateValue98;
                        if (productValue104)
                        {
                            uint bitwiseValue88 = comparisonValue31 >> 15u;
                            precise float bitwiseValue89 = float(bitwiseValue88 & 1u) * 2.0f;
                            precise float sumValue83 = bitwiseValue89 + (-1.0f);
                            precise float bitwiseValue90 = float(comparisonValue31 >> 31u) * 2.0f;
                            precise float sumValue84 = bitwiseValue90 + (-1.0f);
                            precise float bitwiseValue91 = float((comparisonValue31 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue92 = float(bitwiseValue88 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue113 = sumValue83 * 3.0517578125e-05f;
                            precise float productValue114 = sumValue84 * 3.0517578125e-05f;
                            precise float sumValue85 = bitwiseValue91 + productValue113;
                            precise float sumValue86 = bitwiseValue92 + productValue114;
                            intermediateValue97 = sumValue85;
                            intermediateValue98 = sumValue86;
                        }
                        else
                        {
                            precise float bitwiseValue93 = float(comparisonValue31 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue94 = float(comparisonValue31 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue115 = bitwiseValue93 * 16384.0f;
                            precise float sumValue87 = productValue115 + 0.5f;
                            precise float productValue116 = bitwiseValue94 * 16384.0f;
                            precise float sumValue88 = productValue116 + 0.5f;
                            precise float productValue117 = floor(sumValue87) * 6.103515625e-05f;
                            precise float productValue118 = floor(sumValue88) * 6.103515625e-05f;
                            intermediateValue97 = productValue117;
                            intermediateValue98 = productValue118;
                        }
                        precise float productValue119 = vectorValue6.x * intermediateValue97;
                        precise float productValue123 = vectorValue6.x * intermediateValue98;
                        precise float sumValue89 = sumValue81 + productValue119;
                        precise float sumValue90 = sumValue82 + productValue123;
                        float intermediateValue109;
                        float intermediateValue110;
                        if (productValue104)
                        {
                            uint bitwiseValue95 = comparisonValue30 >> 15u;
                            precise float bitwiseValue96 = float(bitwiseValue95 & 1u) * 2.0f;
                            precise float sumValue91 = bitwiseValue96 + (-1.0f);
                            precise float bitwiseValue97 = float(comparisonValue30 >> 31u) * 2.0f;
                            precise float sumValue92 = bitwiseValue97 + (-1.0f);
                            precise float bitwiseValue98 = float((comparisonValue30 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue99 = float(bitwiseValue95 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue124 = sumValue91 * 3.0517578125e-05f;
                            precise float productValue125 = sumValue92 * 3.0517578125e-05f;
                            precise float sumValue93 = bitwiseValue98 + productValue124;
                            precise float sumValue94 = bitwiseValue99 + productValue125;
                            intermediateValue109 = sumValue93;
                            intermediateValue110 = sumValue94;
                        }
                        else
                        {
                            precise float bitwiseValue100 = float(comparisonValue30 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue101 = float(comparisonValue30 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue126 = bitwiseValue100 * 16384.0f;
                            precise float sumValue95 = productValue126 + 0.5f;
                            precise float productValue127 = bitwiseValue101 * 16384.0f;
                            precise float sumValue96 = productValue127 + 0.5f;
                            precise float productValue128 = floor(sumValue95) * 6.103515625e-05f;
                            precise float productValue129 = floor(sumValue96) * 6.103515625e-05f;
                            intermediateValue109 = productValue128;
                            intermediateValue110 = productValue129;
                        }
                        precise float productValue130 = vectorValue7.y * intermediateValue109;
                        precise float productValue134 = vectorValue7.y * intermediateValue110;
                        precise float sumValue97 = sumValue89 + productValue130;
                        precise float sumValue98 = sumValue90 + productValue134;
                        float intermediateValue114;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue101 * 2 + 0) == 65535u)
                        {
                            intermediateValue114 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits19;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue101 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits19 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits19 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue101 * 2 + 0));
                            }
                            intermediateValue114 = textures[NonUniformResourceIndex(reinterpretedBits19 + 0u)].SampleLevel(defaultSampler, float2(sumValue97, sumValue98), -0.25f).w;
                        }
                        uint comparisonValue34;
                        if (scalarValue29 == 2u)
                        {
                            comparisonValue34 = 0u;
                        }
                        else
                        {
                            comparisonValue34 = uint(intermediateValue114 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue102 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                        }
                        if (comparisonValue34 == 0u)
                        {
                            intermediateValue63.CommitNonOpaqueTriangleHit();
                        }
                    }
                    intermediateValue83 = intermediateValue63.Proceed();
                    if (intermediateValue83)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint scalarValue31 = intermediateValue63.CommittedStatus();
            bool intermediateValue73;
            if (scalarValue31 == 1u)
            {
                float scalarValue32 = intermediateValue63.CommittedRayT();
                intermediateValue73 = scalarValue32 < 10000.0f;
            }
            else
            {
                intermediateValue73 = false;
            }
            float branchMergedValue5;
            if (intermediateValue73)
            {
                branchMergedValue5 = 0.0f;
            }
            else
            {
                branchMergedValue5 = ((asfloat(rdByteLoad_inputTemporallyStableLights_uint(0u, ((scalarValue26 * 5u) + 3u) * 4 + 0)) * 32.0f) * dotProductValue4) / (nonlinearValue3 * nonlinearValue3);
            }
            intermediateValue7 = branchMergedValue5;
        }
        else
        {
            intermediateValue7 = 0.0f;
        }
        dotProductValue = uint(int(dot(float3(viewCbConstants[71u].xyz), float3(productValue7, productValue4, productValue8)) * 1024.0f));
        intermediateValue4 = ((rdByteLoad_inputTemporallyStableLights_uint(0u, ((scalarValue26 * 5u) + 4u) * 4 + 0) & 3u) != 0u) ? (loadedBufferValue6 | 2u) : loadedBufferValue6;
        intermediateValue5 = dot(float3((viewCbConstants[59u].x * comparisonValue25) + productValue38, (viewCbConstants[59u].y * comparisonValue26) + productValue39, (viewCbConstants[59u].z * comparisonValue27) + productValue40), 0.066666670143604278564453125f.xxx);
        intermediateValue6 = intermediateValue7;
    }
    float4 loadedBufferValue7 = inputAdaptiveDenoiserReference.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
    float intermediateValue18;
    if ((intermediateValue4 & 5u) == 0u)
    {
        float sumValue99 = intermediateValue5 - loadedBufferValue7.x;
        float branchMergedValue3;
        if ((intermediateValue4 & 2u) == 0u)
        {
            branchMergedValue3 = (intermediateValue6 - loadedBufferValue7.y) + sumValue99;
        }
        else
        {
            branchMergedValue3 = sumValue99;
        }
        intermediateValue18 = branchMergedValue3;
    }
    else
    {
        intermediateValue18 = 0.0f;
    }
    float4 reinterpretedBits12 = denoisingOutputs[(asuint(rootConstantsConstants[0u]).x & 255u) + 0u][uint2(bitwiseValue4, bitwiseValue5)].xxxx;
    float intermediateValue20;
    if (asuint(viewCbConstants[91u]).y == 2u)
    {
        intermediateValue20 = 1.0f;
    }
    else
    {
        intermediateValue20 = asfloat(rdByteLoad_inputIncidentLight_uint(0u, 16));
    }
    float dotProductValue5 = intermediateValue20 * ((asuint(viewCbConstants[96u]).x != 0u) ? reinterpretedBits12.w : dot(float3(reinterpretedBits12.xyz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)));
    float reinterpretedBits13 = asfloat(rdByteLoad_inputIncidentLight_uint(0u, 0)) * intermediateValue18;
    outputAdaptiveDenoiserGradients[0u][uint2(bitwiseValue2, bitwiseValue3)] = float4(reinterpretedBits13, dotProductValue5, reinterpretedBits13, reinterpretedBits13);
    uint reinterpretedBits14 = asuint(reinterpretedBits13) & 2147483647u;
    uint reinterpretedBits15 = asuint(dotProductValue5) & 2147483647u;
    if (((reinterpretedBits15 > 2139095040u) || (reinterpretedBits14 > 2139095040u)) || ((reinterpretedBits15 == 2139095040u) || (reinterpretedBits14 == 2139095040u)))
    {
        if (outputBufferDebug[uint2(bitwiseValue4, bitwiseValue5)].xxxx.w == 0.0f)
        {
            outputBufferDebug[uint2(bitwiseValue4, bitwiseValue5)] = float4(1.0f, 0.0f, 1.0f, 1.0f).x;
            outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
        }
    }
    outputAdaptiveDenoiserPlaneIdentifier[uint2(bitwiseValue2, bitwiseValue3)] = int4((uint4(inputPlaneIdentifier.Load(int3(uint2(bitwiseValue4, bitwiseValue5), 0u))).x + dotProductValue).xxxx);
}
[numthreads(4, 8, 1)]
void main(ComputeStageInput stage_input)
{
    workgroupId = stage_input.workgroupId;
    localThreadId = stage_input.localThreadId;
    executeComputeStage();
}
