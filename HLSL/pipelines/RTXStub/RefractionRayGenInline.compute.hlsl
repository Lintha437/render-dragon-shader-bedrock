// RTXStub / RefractionRayGenInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 37
#endif

#define RD_USE_DIVIDE_UNSIGNED_UINT_19 1
#define RD_USE_MODULO_UNSIGNED_UINT_20 1

#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

#include "../../include/Math.hlsli"
void executeComputeStage()
{
    uint intermediateValue1[3];
    float intermediateValue2[3];
    RaytracingAccelerationStructure intermediateValue;
    uint bitwiseValue2;
    uint bitwiseValue3;
    bool reinterpretedBits1;
    for (;;)
    {
        intermediateValue = SceneBVH;
        uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
        uint scalarValue = reinterpretedBits.z;
        uint bitwiseValue = workgroupId.y >> 4u;
        uint bitwiseValue1 = ((scalarValue & 1023u) * (workgroupId.y & 15u)) + workgroupId.x;
        uint comparisonValue = (bitwiseValue == ((scalarValue >> 14u) & 63u)) ? ((scalarValue >> 10u) & 15u) : 16u;
        bitwiseValue2 = (rdDivideUnsigned(bitwiseValue1, comparisonValue) << 2u) + localThreadId.x;
        bitwiseValue3 = ((rdModuloUnsigned(bitwiseValue1, comparisonValue) + (bitwiseValue << 4u)) << 3u) + localThreadId.y;
        reinterpretedBits1 = asuint(viewCbConstants[91u]).y == 2u;
        if (!reinterpretedBits1)
        {
            uint loadedBufferValue = uint(inputPrimaryThroughput.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u)).w);
            if ((loadedBufferValue & 15u) > ((loadedBufferValue >> 4u) & 15u))
            {
                break;
            }
        }
        float4 loadedBufferValue1 = inputBufferSurfaceOpacityAndObjectCategory.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue1 = loadedBufferValue1.x;
        precise float productValue = loadedBufferValue1.y * 255.0f;
        uint scalarValue2 = uint(productValue);
        if (scalarValue1 == 1.0f)
        {
            break;
        }
        float4 loadedBufferValue2 = inputBufferPrimaryPathLength.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue3 = loadedBufferValue2.x;
        if (scalarValue3 == 65504.0f)
        {
            break;
        }
        uint bitwiseValue4 = scalarValue2 << 30u;
        float4 loadedBufferValue3 = inputBufferColourAndMetallic.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue4 = loadedBufferValue3.x;
        float scalarValue5 = loadedBufferValue3.y;
        float scalarValue6 = loadedBufferValue3.z;
        float productValue1 = scalarValue4 * scalarValue4;
        float productValue2 = scalarValue5 * scalarValue5;
        float productValue3 = scalarValue6 * scalarValue6;
        float4 loadedBufferValue4 = inputGeometryNormal.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue7 = loadedBufferValue4.x;
        float scalarValue8 = loadedBufferValue4.y;
        precise float sumValue = 1.0f - abs(scalarValue7);
        float scalarValue9 = abs(scalarValue8);
        precise float sumValue1 = sumValue - scalarValue9;
        bool conditionValue = sumValue1 < 0.0f;
        precise float sumValue2 = 1.0f - scalarValue9;
        precise float comparisonValue1 = ((scalarValue7 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue2;
        precise float comparisonValue2 = sumValue * ((scalarValue8 >= 0.0f) ? 1.0f : (-1.0f));
        float comparisonValue3 = conditionValue ? comparisonValue1 : scalarValue7;
        float comparisonValue4 = conditionValue ? comparisonValue2 : scalarValue8;
        float inverseLengthValue = rsqrt(dot(float3(comparisonValue3, comparisonValue4, sumValue1), float3(comparisonValue3, comparisonValue4, sumValue1)));
        precise float productValue4 = inverseLengthValue * comparisonValue3;
        precise float productValue5 = inverseLengthValue * comparisonValue4;
        precise float productValue6 = sumValue1 * inverseLengthValue;
        float4 loadedBufferValue5 = inputPrimaryWorldPosition.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        precise float sumValue3 = loadedBufferValue5.x + 0.0f;
        precise float sumValue4 = loadedBufferValue5.y + 0.0f;
        precise float sumValue5 = loadedBufferValue5.z + 0.0f;
        float4 loadedBufferValue6 = inputPrimaryViewDirection.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue10 = loadedBufferValue6.x;
        float scalarValue11 = loadedBufferValue6.y;
        float scalarValue12 = loadedBufferValue6.z;
        float reinterpretedBits2 = asfloat(rdByteLoad_inputIncidentLight_uint(0u, 0));
        precise float productValue7 = scalarValue3 * viewCbConstants[89u].y;
        bool reinterpretedBits3 = asuint(viewCbConstants[54u]).w != 0u;
        uint comparisonValue5 = reinterpretedBits3 ? 0u : 2u;
        float comparisonValue6 = reinterpretedBits3 ? 1.33000004291534423828125f : 1.0f;
        uint comparisonValue7 = uint((scalarValue2 & 3u) != 3u);
        uint intermediateValue20;
        float intermediateValue22;
        float intermediateValue24;
        float intermediateValue26;
        float intermediateValue28;
        float intermediateValue30;
        float intermediateValue32;
        float intermediateValue34;
        float intermediateValue36;
        float intermediateValue38;
        float intermediateValue40;
        float intermediateValue42;
        float intermediateValue44;
        float intermediateValue46;
        float intermediateValue48;
        float intermediateValue50;
        float intermediateValue52;
        float intermediateValue55;
        float intermediateValue57;
        float intermediateValue59;
        float intermediateValue61;
        float intermediateValue63;
        float reinterpretedBits4;
        float reinterpretedBits5;
        float reinterpretedBits6;
        uint comparisonValue8;
        float comparisonValue9;
        uint intermediateValue79;
        uint sumValue6;
        float comparisonValue10;
        bool intermediateValue137;
        float intermediateValue65;
        float intermediateValue67;
        float intermediateValue69;
        float productValue8;
        float productValue9;
        float productValue10;
        float intermediateValue81;
        uint intermediateValue83;
        uint scalarValue13 = 0u;
        float scalarValue14 = 0.0f;
        float scalarValue15 = 0.0f;
        float scalarValue16 = 0.0f;
        float scalarValue17 = 0.0f;
        float scalarValue18 = 0.0f;
        float scalarValue19 = 0.0f;
        float scalarValue20 = 0.0f;
        float scalarValue21 = 0.0f;
        float scalarValue22 = productValue4;
        float scalarValue23 = productValue5;
        float scalarValue24 = productValue6;
        float scalarValue25 = 0.0f;
        float scalarValue26 = 0.0f;
        float scalarValue27 = sumValue3;
        float scalarValue28 = sumValue4;
        float scalarValue29 = sumValue5;
        float scalarValue30 = 0.0f;
        float scalarValue31 = scalarValue1;
        float scalarValue32 = productValue1;
        float scalarValue33 = productValue2;
        float scalarValue34 = productValue3;
        float scalarValue35 = scalarValue10;
        float scalarValue36 = scalarValue11;
        float scalarValue37 = scalarValue12;
        float scalarValue38 = sumValue3;
        float scalarValue39 = sumValue4;
        float scalarValue40 = sumValue5;
        float scalarValue41 = reinterpretedBits2;
        float scalarValue42 = reinterpretedBits2;
        float scalarValue43 = reinterpretedBits2;
        uint scalarValue44 = comparisonValue5;
        float scalarValue45 = comparisonValue6;
        uint scalarValue46 = comparisonValue7;
        float scalarValue47 = scalarValue3;
        uint scalarValue48 = bitwiseValue4;
        float scalarValue49 = 1.0f;
        uint scalarValue50 = 0u;
        float scalarValue51 = 0.0f;
        bool comparisonValue11;
        bool comparisonValue12;
        bool comparisonValue13;
        for (;;)
        {
            comparisonValue11 = scalarValue46 == 1u;
            comparisonValue12 = (scalarValue44 != 1u) && comparisonValue11;
            comparisonValue13 = scalarValue46 == 0u;
            uint comparisonValue16;
            float comparisonValue17;
            if (comparisonValue13)
            {
                bool comparisonValue14 = scalarValue44 == 0u;
                comparisonValue16 = comparisonValue14 ? 2u : 0u;
                comparisonValue17 = comparisonValue14 ? 1.0f : 1.33000004291534423828125f;
            }
            else
            {
                bool comparisonValue15 = scalarValue44 == 1u;
                comparisonValue16 = comparisonValue15 ? 6u : 1u;
                comparisonValue17 = comparisonValue15 ? scalarValue49 : 1.5f;
            }
            uint comparisonValue18;
            float comparisonValue19;
            if (comparisonValue16 == 6u)
            {
                RayDesc _7ident = {float3(scalarValue38, scalarValue39, scalarValue40), scalarValue47 + (-0.0500000007450580596923828125f), float3(scalarValue35, scalarValue36, scalarValue37), scalarValue47 + 0.0500000007450580596923828125f};
                intermediateValue87.TraceRayInline(intermediateValue, 512u, 32u, _7ident);
                bool conditionValue1 = intermediateValue87.Proceed();
                if (conditionValue1)
                {
                    bool intermediateValue104;
                    bool comparisonValue20;
                    for (;;)
                    {
                        uint scalarValue52 = intermediateValue87.CandidateType();
                        comparisonValue20 = scalarValue52 == 0u;
                        if (comparisonValue20)
                        {
                            float2 vectorValue = intermediateValue87.CandidateTriangleBarycentrics();
                            float2 vectorValue1 = intermediateValue87.CandidateTriangleBarycentrics();
                            float scalarValue53 = intermediateValue87.CandidateTriangleRayT();
                            uint scalarValue54 = intermediateValue87.CandidatePrimitiveIndex();
                            uint scalarValue55 = intermediateValue87.CandidateInstanceID();
                            uint scalarValue56 = intermediateValue87.CandidateInstanceIndex();
                            bool intermediateValue107;
                            if (scalarValue55 == 1u)
                            {
                                uint scalarValue57 = (scalarValue56 * 76u) + 58u;
                                uint productValue11 = (scalarValue56 * 76u) + 61u;
                                precise float sumValue7 = 1.0f - vectorValue.x;
                                precise float sumValue8 = sumValue7 - vectorValue1.y;
                                uint productValue12 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue56 * 76u) + 54u) * 2 + 0));
                                uint bitwiseValue5 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue56 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue54 >> 1u);
                                uint sumValue9 = productValue12 + 0u;
                                bool comparisonValue21 = (scalarValue54 & 1u) == 0u;
                                uint comparisonValue22 = comparisonValue21 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue9), bitwiseValue5 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue9), bitwiseValue5 * 16 + 0).x;
                                uint comparisonValue23 = comparisonValue21 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue9), bitwiseValue5 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue9), bitwiseValue5 * 16 + 0).w;
                                uint comparisonValue24 = comparisonValue21 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue9), bitwiseValue5 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue9), bitwiseValue5 * 16 + 0).z;
                                bool productValue13 = rdByteLoad_objectInstances_uint16_t(0u, productValue11 * 2 + 0) < 0u;
                                float intermediateValue125;
                                float intermediateValue126;
                                if (productValue13)
                                {
                                    uint bitwiseValue6 = comparisonValue24 >> 15u;
                                    precise float bitwiseValue7 = float(bitwiseValue6 & 1u) * 2.0f;
                                    precise float sumValue10 = bitwiseValue7 + (-1.0f);
                                    precise float bitwiseValue8 = float(comparisonValue24 >> 31u) * 2.0f;
                                    precise float sumValue11 = bitwiseValue8 + (-1.0f);
                                    precise float bitwiseValue9 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue10 = float(bitwiseValue6 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue14 = sumValue10 * 3.0517578125e-05f;
                                    precise float productValue15 = sumValue11 * 3.0517578125e-05f;
                                    precise float sumValue12 = bitwiseValue9 + productValue14;
                                    precise float sumValue13 = bitwiseValue10 + productValue15;
                                    intermediateValue125 = sumValue12;
                                    intermediateValue126 = sumValue13;
                                }
                                else
                                {
                                    precise float bitwiseValue11 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue12 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue16 = bitwiseValue11 * 16384.0f;
                                    precise float sumValue14 = productValue16 + 0.5f;
                                    precise float productValue17 = bitwiseValue12 * 16384.0f;
                                    precise float sumValue15 = productValue17 + 0.5f;
                                    precise float productValue18 = floor(sumValue14) * 6.103515625e-05f;
                                    precise float productValue19 = floor(sumValue15) * 6.103515625e-05f;
                                    intermediateValue125 = productValue18;
                                    intermediateValue126 = productValue19;
                                }
                                precise float productValue20 = sumValue8 * intermediateValue125;
                                precise float productValue21 = sumValue8 * intermediateValue126;
                                precise float sumValue16 = productValue20 + 0.0f;
                                precise float sumValue17 = productValue21 + 0.0f;
                                float intermediateValue139;
                                float intermediateValue140;
                                if (productValue13)
                                {
                                    uint bitwiseValue14 = comparisonValue23 >> 15u;
                                    precise float bitwiseValue16 = float(bitwiseValue14 & 1u) * 2.0f;
                                    precise float sumValue18 = bitwiseValue16 + (-1.0f);
                                    precise float bitwiseValue17 = float(comparisonValue23 >> 31u) * 2.0f;
                                    precise float sumValue19 = bitwiseValue17 + (-1.0f);
                                    precise float bitwiseValue18 = float((comparisonValue23 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue19 = float(bitwiseValue14 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue22 = sumValue18 * 3.0517578125e-05f;
                                    precise float productValue23 = sumValue19 * 3.0517578125e-05f;
                                    precise float sumValue20 = bitwiseValue18 + productValue22;
                                    precise float sumValue21 = bitwiseValue19 + productValue23;
                                    intermediateValue139 = sumValue20;
                                    intermediateValue140 = sumValue21;
                                }
                                else
                                {
                                    precise float bitwiseValue20 = float(comparisonValue23 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue21 = float(comparisonValue23 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue24 = bitwiseValue20 * 16384.0f;
                                    precise float sumValue22 = productValue24 + 0.5f;
                                    precise float productValue25 = bitwiseValue21 * 16384.0f;
                                    precise float sumValue23 = productValue25 + 0.5f;
                                    precise float productValue26 = floor(sumValue22) * 6.103515625e-05f;
                                    precise float productValue27 = floor(sumValue23) * 6.103515625e-05f;
                                    intermediateValue139 = productValue26;
                                    intermediateValue140 = productValue27;
                                }
                                precise float productValue28 = vectorValue.x * intermediateValue139;
                                precise float productValue29 = vectorValue.x * intermediateValue140;
                                precise float sumValue24 = sumValue16 + productValue28;
                                precise float sumValue25 = sumValue17 + productValue29;
                                float intermediateValue174;
                                float intermediateValue175;
                                if (productValue13)
                                {
                                    uint bitwiseValue22 = comparisonValue22 >> 15u;
                                    precise float bitwiseValue23 = float(bitwiseValue22 & 1u) * 2.0f;
                                    precise float sumValue26 = bitwiseValue23 + (-1.0f);
                                    precise float bitwiseValue24 = float(comparisonValue22 >> 31u) * 2.0f;
                                    precise float sumValue27 = bitwiseValue24 + (-1.0f);
                                    precise float bitwiseValue25 = float((comparisonValue22 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue26 = float(bitwiseValue22 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue30 = sumValue26 * 3.0517578125e-05f;
                                    precise float productValue31 = sumValue27 * 3.0517578125e-05f;
                                    precise float sumValue28 = bitwiseValue25 + productValue30;
                                    precise float sumValue29 = bitwiseValue26 + productValue31;
                                    intermediateValue174 = sumValue28;
                                    intermediateValue175 = sumValue29;
                                }
                                else
                                {
                                    precise float bitwiseValue27 = float(comparisonValue22 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue28 = float(comparisonValue22 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue32 = bitwiseValue27 * 16384.0f;
                                    precise float sumValue30 = productValue32 + 0.5f;
                                    precise float productValue33 = bitwiseValue28 * 16384.0f;
                                    precise float sumValue31 = productValue33 + 0.5f;
                                    precise float productValue34 = floor(sumValue30) * 6.103515625e-05f;
                                    precise float productValue35 = floor(sumValue31) * 6.103515625e-05f;
                                    intermediateValue174 = productValue34;
                                    intermediateValue175 = productValue35;
                                }
                                precise float productValue36 = vectorValue1.y * intermediateValue174;
                                precise float productValue37 = vectorValue1.y * intermediateValue175;
                                precise float sumValue32 = sumValue24 + productValue36;
                                precise float sumValue33 = sumValue25 + productValue37;
                                uint sumValue34 = productValue12 + 0u;
                                uint reinterpretedBits10;
                                if (rdByteLoad_objectInstances_uint16_t(0u, scalarValue57 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits10 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits10 = uint(rdByteLoad_objectInstances_uint16_t(0u, scalarValue57 * 2 + 0));
                                }
                                bool branchMergedValue32;
                                if (!(((rdByteLoad_objectInstances_uint16_t(0u, scalarValue57 * 2 + 0) != 65535u) ? textures[NonUniformResourceIndex(reinterpretedBits10 + 0u)].SampleLevel(defaultSampler, float2(sumValue32, sumValue33), min((float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue34), ((bitwiseValue5 * 8u) + 6u) * 2 + 0))) + 1.0f) + log2(abs(viewCbConstants[89u].z * scalarValue53)), float(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue34), ((bitwiseValue5 * 8u) + 7u) * 2 + 0)))).w : 1.0f) <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue11 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f)))
                                {
                                    branchMergedValue32 = true;
                                }
                                else
                                {
                                    branchMergedValue32 = false;
                                }
                                intermediateValue107 = branchMergedValue32;
                            }
                            else
                            {
                                intermediateValue107 = true;
                            }
                            if (intermediateValue107)
                            {
                                intermediateValue87.CommitNonOpaqueTriangleHit();
                            }
                        }
                        intermediateValue104 = intermediateValue87.Proceed();
                        if (intermediateValue104)
                        {
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                uint scalarValue58 = intermediateValue87.CommittedStatus();
                float intermediateValue93;
                if (scalarValue58 == 1u)
                {
                    float scalarValue59 = intermediateValue87.CommittedRayT();
                    intermediateValue93 = scalarValue59;
                }
                else
                {
                    intermediateValue93 = 10000.0f;
                }
                bool conditionValue2 = intermediateValue93 < 10000.0f;
                comparisonValue18 = conditionValue2 ? 0u : 2u;
                comparisonValue19 = conditionValue2 ? 1.33000004291534423828125f : 1.0f;
            }
            else
            {
                comparisonValue18 = comparisonValue16;
                comparisonValue19 = comparisonValue17;
            }
            precise float dotProductValue = dot(float3(scalarValue35, scalarValue36, scalarValue37), float3(scalarValue22, scalarValue23, scalarValue24));
            precise float sumValue35 = (-0.0f) - dotProductValue;
            precise float quotientValue = scalarValue45 / comparisonValue19;
            precise float productValue38 = quotientValue * quotientValue;
            precise float productValue39 = dotProductValue * dotProductValue;
            precise float sumValue36 = 1.0f - productValue39;
            precise float productValue40 = productValue38 * sumValue36;
            bool conditionValue3 = productValue40 > 1.0f;
            float intermediateValue95;
            if (conditionValue3)
            {
                precise float productValue41 = dotProductValue * (-2.0f);
                precise float productValue42 = scalarValue22 * productValue41;
                precise float productValue43 = scalarValue23 * productValue41;
                precise float productValue44 = scalarValue24 * productValue41;
                precise float sumValue37 = scalarValue35 + productValue42;
                precise float sumValue38 = scalarValue36 + productValue43;
                precise float sumValue39 = scalarValue37 + productValue44;
                intermediateValue65 = sumValue37;
                intermediateValue67 = sumValue38;
                intermediateValue69 = sumValue39;
                intermediateValue95 = 1.0f;
            }
            else
            {
                precise float sumValue40 = 1.0f - productValue40;
                float nonlinearValue = sqrt(sumValue40);
                precise float productValue45 = scalarValue35 * quotientValue;
                precise float productValue46 = scalarValue36 * quotientValue;
                precise float productValue47 = scalarValue37 * quotientValue;
                precise float productValue48 = quotientValue * sumValue35;
                precise float sumValue41 = productValue48 - nonlinearValue;
                precise float productValue49 = scalarValue22 * sumValue41;
                precise float productValue50 = scalarValue23 * sumValue41;
                precise float productValue51 = scalarValue24 * sumValue41;
                precise float sumValue42 = productValue45 + productValue49;
                precise float sumValue43 = productValue46 + productValue50;
                precise float sumValue44 = productValue47 + productValue51;
                float quotientValue1 = (scalarValue45 - comparisonValue19) / (comparisonValue19 + scalarValue45);
                float productValue52 = 1.0f - (quotientValue1 * quotientValue1);
                intermediateValue65 = sumValue42;
                intermediateValue67 = sumValue43;
                intermediateValue69 = sumValue44;
                intermediateValue95 = productValue52 - (productValue52 * exp2(log2(1.0f - ((scalarValue45 <= comparisonValue19) ? sumValue35 : nonlinearValue)) * 5.0f));
            }
            float comparisonValue25 = conditionValue3 ? scalarValue22 : ((-0.0f) - scalarValue22);
            float comparisonValue26 = conditionValue3 ? scalarValue23 : ((-0.0f) - scalarValue23);
            float comparisonValue27 = conditionValue3 ? scalarValue24 : ((-0.0f) - scalarValue24);
            uint productValue53 = uint(int(comparisonValue25 * 256.0f));
            uint productValue54 = uint(int(comparisonValue26 * 256.0f));
            uint productValue55 = uint(int(comparisonValue27 * 256.0f));
            reinterpretedBits4 = (abs(scalarValue27) < 0.03125f) ? ((comparisonValue25 * 1.52587890625e-05f) + scalarValue27) : asfloat(((scalarValue27 < 0.0f) ? (-productValue53) : productValue53) + asuint(scalarValue27));
            reinterpretedBits5 = (abs(scalarValue28) < 0.03125f) ? ((comparisonValue26 * 1.52587890625e-05f) + scalarValue28) : asfloat(((scalarValue28 < 0.0f) ? (-productValue54) : productValue54) + asuint(scalarValue28));
            reinterpretedBits6 = (abs(scalarValue29) < 0.03125f) ? ((comparisonValue27 * 1.52587890625e-05f) + scalarValue29) : asfloat(((scalarValue29 < 0.0f) ? (-productValue55) : productValue55) + asuint(scalarValue29));
            comparisonValue8 = conditionValue3 ? scalarValue44 : comparisonValue18;
            comparisonValue9 = conditionValue3 ? scalarValue45 : comparisonValue19;
            RayDesc _8ident = {float3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6), 0.0f, float3(intermediateValue65, intermediateValue67, intermediateValue69), 10000.0f};
            intermediateValue96.TraceRayInline(intermediateValue, (comparisonValue12 ? 544u : 528u) | 512u, 109u, _8ident);
            bool conditionValue4 = intermediateValue96.Proceed();
            if (conditionValue4)
            {
                bool intermediateValue121;
                bool comparisonValue28;
                for (;;)
                {
                    uint scalarValue60 = intermediateValue96.CandidateType();
                    comparisonValue28 = scalarValue60 == 0u;
                    if (comparisonValue28)
                    {
                        float2 vectorValue2 = intermediateValue96.CandidateTriangleBarycentrics();
                        float2 vectorValue3 = intermediateValue96.CandidateTriangleBarycentrics();
                        float scalarValue61 = intermediateValue96.CandidateTriangleRayT();
                        uint scalarValue62 = intermediateValue96.CandidatePrimitiveIndex();
                        uint scalarValue63 = intermediateValue96.CandidateInstanceID();
                        uint scalarValue64 = intermediateValue96.CandidateInstanceIndex();
                        bool intermediateValue128;
                        if (scalarValue63 == 1u)
                        {
                            uint scalarValue65 = (scalarValue64 * 76u) + 58u;
                            uint productValue56 = (scalarValue64 * 76u) + 61u;
                            precise float sumValue45 = 1.0f - vectorValue2.x;
                            precise float sumValue46 = sumValue45 - vectorValue3.y;
                            uint productValue57 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue64 * 76u) + 54u) * 2 + 0));
                            uint bitwiseValue29 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue64 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue62 >> 1u);
                            uint sumValue47 = productValue57 + 0u;
                            bool comparisonValue29 = (scalarValue62 & 1u) == 0u;
                            uint comparisonValue30 = comparisonValue29 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue47), bitwiseValue29 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue47), bitwiseValue29 * 16 + 0).x;
                            uint comparisonValue31 = comparisonValue29 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue47), bitwiseValue29 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue47), bitwiseValue29 * 16 + 0).w;
                            uint comparisonValue32 = comparisonValue29 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue47), bitwiseValue29 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue47), bitwiseValue29 * 16 + 0).z;
                            bool productValue58 = rdByteLoad_objectInstances_uint16_t(0u, productValue56 * 2 + 0) < 0u;
                            float intermediateValue141;
                            float intermediateValue142;
                            if (productValue58)
                            {
                                uint bitwiseValue30 = comparisonValue32 >> 15u;
                                precise float bitwiseValue31 = float(bitwiseValue30 & 1u) * 2.0f;
                                precise float sumValue48 = bitwiseValue31 + (-1.0f);
                                precise float bitwiseValue32 = float(comparisonValue32 >> 31u) * 2.0f;
                                precise float sumValue49 = bitwiseValue32 + (-1.0f);
                                precise float bitwiseValue33 = float((comparisonValue32 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue34 = float(bitwiseValue30 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue59 = sumValue48 * 3.0517578125e-05f;
                                precise float productValue60 = sumValue49 * 3.0517578125e-05f;
                                precise float sumValue50 = bitwiseValue33 + productValue59;
                                precise float sumValue51 = bitwiseValue34 + productValue60;
                                intermediateValue141 = sumValue50;
                                intermediateValue142 = sumValue51;
                            }
                            else
                            {
                                precise float bitwiseValue35 = float(comparisonValue32 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue36 = float(comparisonValue32 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue61 = bitwiseValue35 * 16384.0f;
                                precise float sumValue52 = productValue61 + 0.5f;
                                precise float productValue62 = bitwiseValue36 * 16384.0f;
                                precise float sumValue53 = productValue62 + 0.5f;
                                precise float productValue63 = floor(sumValue52) * 6.103515625e-05f;
                                precise float productValue64 = floor(sumValue53) * 6.103515625e-05f;
                                intermediateValue141 = productValue63;
                                intermediateValue142 = productValue64;
                            }
                            precise float productValue65 = sumValue46 * intermediateValue141;
                            precise float productValue66 = sumValue46 * intermediateValue142;
                            precise float sumValue54 = productValue65 + 0.0f;
                            precise float sumValue55 = productValue66 + 0.0f;
                            float intermediateValue176;
                            float intermediateValue177;
                            if (productValue58)
                            {
                                uint bitwiseValue37 = comparisonValue31 >> 15u;
                                precise float bitwiseValue38 = float(bitwiseValue37 & 1u) * 2.0f;
                                precise float sumValue56 = bitwiseValue38 + (-1.0f);
                                precise float bitwiseValue39 = float(comparisonValue31 >> 31u) * 2.0f;
                                precise float sumValue57 = bitwiseValue39 + (-1.0f);
                                precise float bitwiseValue40 = float((comparisonValue31 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue41 = float(bitwiseValue37 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue67 = sumValue56 * 3.0517578125e-05f;
                                precise float productValue68 = sumValue57 * 3.0517578125e-05f;
                                precise float sumValue58 = bitwiseValue40 + productValue67;
                                precise float sumValue59 = bitwiseValue41 + productValue68;
                                intermediateValue176 = sumValue58;
                                intermediateValue177 = sumValue59;
                            }
                            else
                            {
                                precise float bitwiseValue42 = float(comparisonValue31 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue43 = float(comparisonValue31 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue69 = bitwiseValue42 * 16384.0f;
                                precise float sumValue60 = productValue69 + 0.5f;
                                precise float productValue70 = bitwiseValue43 * 16384.0f;
                                precise float sumValue61 = productValue70 + 0.5f;
                                precise float productValue71 = floor(sumValue60) * 6.103515625e-05f;
                                precise float productValue72 = floor(sumValue61) * 6.103515625e-05f;
                                intermediateValue176 = productValue71;
                                intermediateValue177 = productValue72;
                            }
                            precise float productValue73 = vectorValue2.x * intermediateValue176;
                            precise float productValue74 = vectorValue2.x * intermediateValue177;
                            precise float sumValue62 = sumValue54 + productValue73;
                            precise float sumValue63 = sumValue55 + productValue74;
                            float intermediateValue192;
                            float intermediateValue193;
                            if (productValue58)
                            {
                                uint bitwiseValue44 = comparisonValue30 >> 15u;
                                precise float bitwiseValue45 = float(bitwiseValue44 & 1u) * 2.0f;
                                precise float sumValue64 = bitwiseValue45 + (-1.0f);
                                precise float bitwiseValue46 = float(comparisonValue30 >> 31u) * 2.0f;
                                precise float sumValue65 = bitwiseValue46 + (-1.0f);
                                precise float bitwiseValue47 = float((comparisonValue30 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue48 = float(bitwiseValue44 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue75 = sumValue64 * 3.0517578125e-05f;
                                precise float productValue76 = sumValue65 * 3.0517578125e-05f;
                                precise float sumValue66 = bitwiseValue47 + productValue75;
                                precise float sumValue67 = bitwiseValue48 + productValue76;
                                intermediateValue192 = sumValue66;
                                intermediateValue193 = sumValue67;
                            }
                            else
                            {
                                precise float bitwiseValue49 = float(comparisonValue30 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue50 = float(comparisonValue30 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue77 = bitwiseValue49 * 16384.0f;
                                precise float sumValue68 = productValue77 + 0.5f;
                                precise float productValue78 = bitwiseValue50 * 16384.0f;
                                precise float sumValue69 = productValue78 + 0.5f;
                                precise float productValue79 = floor(sumValue68) * 6.103515625e-05f;
                                precise float productValue80 = floor(sumValue69) * 6.103515625e-05f;
                                intermediateValue192 = productValue79;
                                intermediateValue193 = productValue80;
                            }
                            precise float productValue81 = vectorValue3.y * intermediateValue192;
                            precise float productValue82 = vectorValue3.y * intermediateValue193;
                            precise float sumValue70 = sumValue62 + productValue81;
                            precise float sumValue71 = sumValue63 + productValue82;
                            uint sumValue72 = productValue57 + 0u;
                            uint reinterpretedBits17;
                            if (rdByteLoad_objectInstances_uint16_t(0u, scalarValue65 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits17 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits17 = uint(rdByteLoad_objectInstances_uint16_t(0u, scalarValue65 * 2 + 0));
                            }
                            bool branchMergedValue33;
                            if (!(((rdByteLoad_objectInstances_uint16_t(0u, scalarValue65 * 2 + 0) != 65535u) ? textures[NonUniformResourceIndex(reinterpretedBits17 + 0u)].SampleLevel(defaultSampler, float2(sumValue70, sumValue71), min((float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue72), ((bitwiseValue29 * 8u) + 6u) * 2 + 0))) + 1.0f) + log2(abs(viewCbConstants[89u].z * scalarValue61)), float(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue72), ((bitwiseValue29 * 8u) + 7u) * 2 + 0)))).w : 1.0f) <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue56 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f)))
                            {
                                branchMergedValue33 = true;
                            }
                            else
                            {
                                branchMergedValue33 = false;
                            }
                            intermediateValue128 = branchMergedValue33;
                        }
                        else
                        {
                            intermediateValue128 = true;
                        }
                        if (intermediateValue128)
                        {
                            intermediateValue96.CommitNonOpaqueTriangleHit();
                        }
                    }
                    intermediateValue121 = intermediateValue96.Proceed();
                    if (intermediateValue121)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint scalarValue66 = intermediateValue96.CommittedStatus();
            float intermediateValue122;
            float intermediateValue123;
            float intermediateValue124;
            uint bitwiseValue13;
            if (scalarValue66 == 1u)
            {
                float2 vectorValue4 = intermediateValue96.CommittedTriangleBarycentrics();
                float2 vectorValue5 = intermediateValue96.CommittedTriangleBarycentrics();
                float scalarValue67 = intermediateValue96.CommittedRayT();
                uint scalarValue68 = intermediateValue96.CommittedPrimitiveIndex();
                uint scalarValue69 = intermediateValue96.CommittedInstanceID();
                uint scalarValue70 = intermediateValue96.CommittedInstanceIndex();
                intermediateValue122 = vectorValue4.x;
                intermediateValue123 = vectorValue5.y;
                intermediateValue124 = scalarValue67;
                bitwiseValue13 = ((scalarValue69 << 30u) | ((scalarValue68 << 14u) & 1073725440u)) | (scalarValue70 & 16383u);
            }
            else
            {
                intermediateValue122 = 0.0f;
                intermediateValue123 = 0.0f;
                intermediateValue124 = 10000.0f;
                bitwiseValue13 = scalarValue48 | 1073741823u;
            }
            sumValue6 = scalarValue50 + 1u;
            float intermediateValue132;
            float intermediateValue134;
            if (comparisonValue8 == 0u)
            {
                bool conditionValue5 = intermediateValue124 < 10000.0f;
                RayDesc _9ident = {float3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6), 0.0f, float3(intermediateValue65, intermediateValue67, intermediateValue69), conditionValue5 ? (intermediateValue124 + 0.0500000007450580596923828125f) : 10000.0f};
                intermediateValue130.TraceRayInline(intermediateValue, 512u, 32u, _9ident);
                bool conditionValue6 = intermediateValue130.Proceed();
                if (conditionValue6)
                {
                    bool intermediateValue173;
                    bool comparisonValue34;
                    for (;;)
                    {
                        uint scalarValue71 = intermediateValue130.CandidateType();
                        comparisonValue34 = scalarValue71 == 0u;
                        if (comparisonValue34)
                        {
                            float2 vectorValue6 = intermediateValue130.CandidateTriangleBarycentrics();
                            float2 vectorValue7 = intermediateValue130.CandidateTriangleBarycentrics();
                            float scalarValue72 = intermediateValue130.CandidateTriangleRayT();
                            uint scalarValue73 = intermediateValue130.CandidatePrimitiveIndex();
                            uint scalarValue74 = intermediateValue130.CandidateInstanceID();
                            uint scalarValue75 = intermediateValue130.CandidateInstanceIndex();
                            bool intermediateValue179;
                            if (scalarValue74 == 1u)
                            {
                                uint scalarValue76 = (scalarValue75 * 76u) + 58u;
                                uint productValue83 = (scalarValue75 * 76u) + 61u;
                                precise float sumValue73 = 1.0f - vectorValue6.x;
                                precise float sumValue74 = sumValue73 - vectorValue7.y;
                                uint productValue84 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue75 * 76u) + 54u) * 2 + 0));
                                uint bitwiseValue51 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue75 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue73 >> 1u);
                                uint sumValue75 = productValue84 + 0u;
                                bool comparisonValue33 = (scalarValue73 & 1u) == 0u;
                                uint comparisonValue35 = comparisonValue33 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue75), bitwiseValue51 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue75), bitwiseValue51 * 16 + 0).x;
                                uint comparisonValue36 = comparisonValue33 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue75), bitwiseValue51 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue75), bitwiseValue51 * 16 + 0).w;
                                uint comparisonValue37 = comparisonValue33 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue75), bitwiseValue51 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue75), bitwiseValue51 * 16 + 0).z;
                                bool productValue85 = rdByteLoad_objectInstances_uint16_t(0u, productValue83 * 2 + 0) < 0u;
                                float intermediateValue194;
                                float intermediateValue195;
                                if (productValue85)
                                {
                                    uint bitwiseValue52 = comparisonValue37 >> 15u;
                                    precise float bitwiseValue53 = float(bitwiseValue52 & 1u) * 2.0f;
                                    precise float sumValue76 = bitwiseValue53 + (-1.0f);
                                    precise float bitwiseValue54 = float(comparisonValue37 >> 31u) * 2.0f;
                                    precise float sumValue77 = bitwiseValue54 + (-1.0f);
                                    precise float bitwiseValue55 = float((comparisonValue37 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue56 = float(bitwiseValue52 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue86 = sumValue76 * 3.0517578125e-05f;
                                    precise float productValue87 = sumValue77 * 3.0517578125e-05f;
                                    precise float sumValue78 = bitwiseValue55 + productValue86;
                                    precise float sumValue79 = bitwiseValue56 + productValue87;
                                    intermediateValue194 = sumValue78;
                                    intermediateValue195 = sumValue79;
                                }
                                else
                                {
                                    precise float bitwiseValue57 = float(comparisonValue37 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue58 = float(comparisonValue37 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue88 = bitwiseValue57 * 16384.0f;
                                    precise float sumValue80 = productValue88 + 0.5f;
                                    precise float productValue89 = bitwiseValue58 * 16384.0f;
                                    precise float sumValue81 = productValue89 + 0.5f;
                                    precise float productValue90 = floor(sumValue80) * 6.103515625e-05f;
                                    precise float productValue91 = floor(sumValue81) * 6.103515625e-05f;
                                    intermediateValue194 = productValue90;
                                    intermediateValue195 = productValue91;
                                }
                                precise float productValue92 = sumValue74 * intermediateValue194;
                                precise float productValue93 = sumValue74 * intermediateValue195;
                                precise float sumValue82 = productValue92 + 0.0f;
                                precise float sumValue83 = productValue93 + 0.0f;
                                float intermediateValue203;
                                float intermediateValue204;
                                if (productValue85)
                                {
                                    uint bitwiseValue59 = comparisonValue36 >> 15u;
                                    precise float bitwiseValue60 = float(bitwiseValue59 & 1u) * 2.0f;
                                    precise float sumValue84 = bitwiseValue60 + (-1.0f);
                                    precise float bitwiseValue61 = float(comparisonValue36 >> 31u) * 2.0f;
                                    precise float sumValue85 = bitwiseValue61 + (-1.0f);
                                    precise float bitwiseValue62 = float((comparisonValue36 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue63 = float(bitwiseValue59 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue94 = sumValue84 * 3.0517578125e-05f;
                                    precise float productValue95 = sumValue85 * 3.0517578125e-05f;
                                    precise float sumValue86 = bitwiseValue62 + productValue94;
                                    precise float sumValue87 = bitwiseValue63 + productValue95;
                                    intermediateValue203 = sumValue86;
                                    intermediateValue204 = sumValue87;
                                }
                                else
                                {
                                    precise float bitwiseValue64 = float(comparisonValue36 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue65 = float(comparisonValue36 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue96 = bitwiseValue64 * 16384.0f;
                                    precise float sumValue88 = productValue96 + 0.5f;
                                    precise float productValue97 = bitwiseValue65 * 16384.0f;
                                    precise float sumValue89 = productValue97 + 0.5f;
                                    precise float productValue98 = floor(sumValue88) * 6.103515625e-05f;
                                    precise float productValue99 = floor(sumValue89) * 6.103515625e-05f;
                                    intermediateValue203 = productValue98;
                                    intermediateValue204 = productValue99;
                                }
                                precise float productValue100 = vectorValue6.x * intermediateValue203;
                                precise float productValue101 = vectorValue6.x * intermediateValue204;
                                precise float sumValue90 = sumValue82 + productValue100;
                                precise float sumValue91 = sumValue83 + productValue101;
                                float intermediateValue228;
                                float intermediateValue229;
                                if (productValue85)
                                {
                                    uint bitwiseValue66 = comparisonValue35 >> 15u;
                                    precise float bitwiseValue67 = float(bitwiseValue66 & 1u) * 2.0f;
                                    precise float sumValue92 = bitwiseValue67 + (-1.0f);
                                    precise float bitwiseValue68 = float(comparisonValue35 >> 31u) * 2.0f;
                                    precise float sumValue93 = bitwiseValue68 + (-1.0f);
                                    precise float bitwiseValue69 = float((comparisonValue35 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue70 = float(bitwiseValue66 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue102 = sumValue92 * 3.0517578125e-05f;
                                    precise float productValue103 = sumValue93 * 3.0517578125e-05f;
                                    precise float sumValue94 = bitwiseValue69 + productValue102;
                                    precise float sumValue95 = bitwiseValue70 + productValue103;
                                    intermediateValue228 = sumValue94;
                                    intermediateValue229 = sumValue95;
                                }
                                else
                                {
                                    precise float bitwiseValue71 = float(comparisonValue35 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue72 = float(comparisonValue35 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue104 = bitwiseValue71 * 16384.0f;
                                    precise float sumValue96 = productValue104 + 0.5f;
                                    precise float productValue105 = bitwiseValue72 * 16384.0f;
                                    precise float sumValue97 = productValue105 + 0.5f;
                                    precise float productValue106 = floor(sumValue96) * 6.103515625e-05f;
                                    precise float productValue107 = floor(sumValue97) * 6.103515625e-05f;
                                    intermediateValue228 = productValue106;
                                    intermediateValue229 = productValue107;
                                }
                                precise float productValue108 = vectorValue7.y * intermediateValue228;
                                precise float productValue109 = vectorValue7.y * intermediateValue229;
                                precise float sumValue98 = sumValue90 + productValue108;
                                precise float sumValue99 = sumValue91 + productValue109;
                                uint sumValue100 = productValue84 + 0u;
                                uint reinterpretedBits26;
                                if (rdByteLoad_objectInstances_uint16_t(0u, scalarValue76 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits26 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits26 = uint(rdByteLoad_objectInstances_uint16_t(0u, scalarValue76 * 2 + 0));
                                }
                                bool branchMergedValue35;
                                if (!(((rdByteLoad_objectInstances_uint16_t(0u, scalarValue76 * 2 + 0) != 65535u) ? textures[NonUniformResourceIndex(reinterpretedBits26 + 0u)].SampleLevel(defaultSampler, float2(sumValue98, sumValue99), min((float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue100), ((bitwiseValue51 * 8u) + 6u) * 2 + 0))) + 1.0f) + log2(abs(viewCbConstants[89u].z * scalarValue72)), float(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue100), ((bitwiseValue51 * 8u) + 7u) * 2 + 0)))).w : 1.0f) <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue83 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f)))
                                {
                                    branchMergedValue35 = true;
                                }
                                else
                                {
                                    branchMergedValue35 = false;
                                }
                                intermediateValue179 = branchMergedValue35;
                            }
                            else
                            {
                                intermediateValue179 = true;
                            }
                            if (intermediateValue179)
                            {
                                intermediateValue130.CommitNonOpaqueTriangleHit();
                            }
                        }
                        intermediateValue173 = intermediateValue130.Proceed();
                        if (intermediateValue173)
                        {
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                uint scalarValue77 = intermediateValue130.CommittedStatus();
                float intermediateValue133;
                float intermediateValue135;
                float intermediateValue136;
                uint bitwiseValue15;
                if (scalarValue77 == 1u)
                {
                    float2 vectorValue8 = intermediateValue130.CommittedTriangleBarycentrics();
                    float2 vectorValue9 = intermediateValue130.CommittedTriangleBarycentrics();
                    float scalarValue78 = intermediateValue130.CommittedRayT();
                    uint scalarValue79 = intermediateValue130.CommittedPrimitiveIndex();
                    uint scalarValue80 = intermediateValue130.CommittedInstanceID();
                    uint scalarValue81 = intermediateValue130.CommittedInstanceIndex();
                    intermediateValue133 = vectorValue8.x;
                    intermediateValue135 = vectorValue9.y;
                    intermediateValue136 = scalarValue78;
                    bitwiseValue15 = ((scalarValue80 << 30u) | ((scalarValue79 << 14u) & 1073725440u)) | (scalarValue81 & 16383u);
                }
                else
                {
                    intermediateValue133 = 0.0f;
                    intermediateValue135 = 0.0f;
                    intermediateValue136 = 10000.0f;
                    bitwiseValue15 = 1073741823u;
                }
                uint branchMergedValue34;
                float branchMergedValue45;
                float branchMergedValue46;
                float branchMergedValue47;
                if (intermediateValue136 < 10000.0f)
                {
                    uint branchMergedValue113;
                    float branchMergedValue114;
                    float branchMergedValue115;
                    float branchMergedValue116;
                    if (conditionValue5)
                    {
                        precise float sumValue101 = intermediateValue124 - intermediateValue136;
                        bool bitwiseValue73 = (intermediateValue124 > intermediateValue136) && (abs(sumValue101) > 0.100000001490116119384765625f);
                        branchMergedValue113 = bitwiseValue73 ? bitwiseValue15 : bitwiseValue13;
                        branchMergedValue114 = bitwiseValue73 ? intermediateValue136 : intermediateValue124;
                        branchMergedValue115 = bitwiseValue73 ? intermediateValue135 : intermediateValue123;
                        branchMergedValue116 = bitwiseValue73 ? intermediateValue133 : intermediateValue122;
                    }
                    else
                    {
                        branchMergedValue113 = bitwiseValue15;
                        branchMergedValue114 = intermediateValue136;
                        branchMergedValue115 = intermediateValue135;
                        branchMergedValue116 = intermediateValue133;
                    }
                    branchMergedValue34 = branchMergedValue113;
                    branchMergedValue45 = branchMergedValue114;
                    branchMergedValue46 = branchMergedValue115;
                    branchMergedValue47 = branchMergedValue116;
                }
                else
                {
                    branchMergedValue34 = bitwiseValue13;
                    branchMergedValue45 = intermediateValue124;
                    branchMergedValue46 = intermediateValue123;
                    branchMergedValue47 = intermediateValue122;
                }
                intermediateValue132 = branchMergedValue47;
                intermediateValue134 = branchMergedValue46;
                intermediateValue81 = branchMergedValue45;
                intermediateValue83 = branchMergedValue34;
            }
            else
            {
                intermediateValue132 = intermediateValue122;
                intermediateValue134 = intermediateValue123;
                intermediateValue81 = intermediateValue124;
                intermediateValue83 = bitwiseValue13;
            }
            intermediateValue137 = intermediateValue81 < 10000.0f;
            float comparisonValue38 = intermediateValue137 ? intermediateValue81 : 10000.0f;
            uint sumValue102 = comparisonValue8 + 63u;
            float productValue110 = min(comparisonValue38, 50.0f) * (-1.44269502162933349609375f);
            float exponentialValue = (intermediateValue95 * scalarValue41) * exp2(productValue110 * viewCbConstants[sumValue102].x);
            float exponentialValue1 = (intermediateValue95 * scalarValue42) * exp2(productValue110 * viewCbConstants[sumValue102].y);
            float exponentialValue2 = (intermediateValue95 * scalarValue43) * exp2(productValue110 * viewCbConstants[sumValue102].z);
            comparisonValue10 = (comparisonValue8 == 2u) ? (comparisonValue38 + scalarValue51) : scalarValue51;
            if (comparisonValue11)
            {
                productValue8 = exponentialValue * (scalarValue32 - (scalarValue32 * scalarValue31));
                productValue9 = exponentialValue1 * (scalarValue33 - (scalarValue33 * scalarValue31));
                productValue10 = exponentialValue2 * (scalarValue34 - (scalarValue34 * scalarValue31));
            }
            else
            {
                productValue8 = exponentialValue;
                productValue9 = exponentialValue1;
                productValue10 = exponentialValue2;
            }
            float branchMergedValue;
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            float branchMergedValue10;
            float branchMergedValue11;
            float branchMergedValue12;
            float branchMergedValue19;
            float branchMergedValue20;
            float branchMergedValue21;
            float branchMergedValue22;
            float branchMergedValue23;
            float branchMergedValue24;
            float branchMergedValue25;
            float branchMergedValue26;
            float branchMergedValue27;
            uint branchMergedValue28;
            uint branchMergedValue29;
            float branchMergedValue30;
            float branchMergedValue31;
            if (intermediateValue137)
            {
                uint bitwiseValue74 = intermediateValue83 & 16383u;
                uint productValue111 = bitwiseValue74 * 38u;
                float4 reinterpretedBits7 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue111 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue111 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue111 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue111 + 3u) * 4 + 0)));
                float scalarValue82 = reinterpretedBits7.x;
                float scalarValue83 = reinterpretedBits7.y;
                float scalarValue84 = reinterpretedBits7.z;
                uint productValue112 = (bitwiseValue74 * 38u) + 4u;
                float4 reinterpretedBits8 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue112 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue112 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue112 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue112 + 3u) * 4 + 0)));
                float scalarValue85 = reinterpretedBits8.x;
                float scalarValue86 = reinterpretedBits8.y;
                float scalarValue87 = reinterpretedBits8.z;
                uint productValue113 = (bitwiseValue74 * 38u) + 8u;
                float4 reinterpretedBits9 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue113 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue113 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue113 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue113 + 3u) * 4 + 0)));
                float scalarValue88 = reinterpretedBits9.x;
                float scalarValue89 = reinterpretedBits9.y;
                float scalarValue90 = reinterpretedBits9.z;
                uint productValue114 = (bitwiseValue74 * 38u) + 24u;
                uint productValue115 = (bitwiseValue74 * 38u) + 25u;
                uint productValue116 = (bitwiseValue74 * 76u) + 61u;
                uint productValue117 = (bitwiseValue74 * 76u) + 72u;
                uint bitwiseValue75 = ((intermediateValue83 >> 13u) & 2u) | ((intermediateValue83 >> 13u) & 131068u);
                uint bitwiseValue76 = bitwiseValue75 | 1u;
                uint bitwiseValue77 = bitwiseValue75 ^ 2u;
                intermediateValue1[0u] = bitwiseValue75;
                intermediateValue1[1u] = bitwiseValue76;
                intermediateValue1[2u] = bitwiseValue77;
                uint productValue118 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue74 * 76u) + 54u) * 2 + 0));
                uint sumValue103 = productValue118 + 0u;
                uint bitwiseValue78 = (rdByteLoad_objectInstances_uint(0u, productValue115 * 4 + 0) >> 2u) + ((intermediateValue83 >> 15u) & 32767u);
                uint productValue119 = bitwiseValue78 * 4u;
                float productValue120 = float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue103), ((bitwiseValue78 * 8u) + 6u) * 2 + 0)));
                precise float bitwiseValue79 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue103), productValue119 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue104 = bitwiseValue79 + (-1.0f);
                precise float bitwiseValue80 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue103), productValue119 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue105 = bitwiseValue80 + (-1.0f);
                precise float bitwiseValue81 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue103), productValue119 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue106 = bitwiseValue81 + (-1.0f);
                precise float sumValue107 = 1.0f - intermediateValue132;
                precise float sumValue108 = sumValue107 - intermediateValue134;
                intermediateValue2[0u] = sumValue108;
                intermediateValue2[1u] = intermediateValue132;
                intermediateValue2[2u] = intermediateValue134;
                uint sumValue109 = productValue118 + 0u;
                uint productValue121 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue74 * 76u) + 56u) * 2 + 0));
                uint productValue122 = productValue121 * (rdByteLoad_objectInstances_uint(0u, productValue114 * 4 + 0) + bitwiseValue75);
                uint bitwiseValue82 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue74 * 76u) + 71u) * 2 + 0) & 255u);
                uint bitwiseValue83 = (bitwiseValue82 + productValue122) >> 1u;
                half3 productValue123 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue109), bitwiseValue83 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue109), (bitwiseValue83 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue109), (bitwiseValue83 + 2u) * 2 + 0)));
                uint bitwiseValue84 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue117 * 2 + 0) & 255u);
                uint bitwiseValue85 = (bitwiseValue84 + productValue122) >> 2u;
                precise float bitwiseValue86 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue85 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue87 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue85 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue88 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue85 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue89 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue85 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                uint bitwiseValue90 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue117 * 2 + 0) >> 8u);
                uint bitwiseValue91 = (bitwiseValue90 + productValue122) >> 2u;
                bool productValue124 = rdByteLoad_objectInstances_uint16_t(0u, productValue116 * 2 + 0) < 0u;
                float intermediateValue180;
                float intermediateValue181;
                if (productValue124)
                {
                    uint bitwiseValue92 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue91 * 4 + 0) >> 15u;
                    precise float bitwiseValue93 = float(bitwiseValue92 & 1u) * 2.0f;
                    precise float sumValue110 = bitwiseValue93 + (-1.0f);
                    precise float bitwiseValue94 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue91 * 4 + 0) >> 31u) * 2.0f;
                    precise float sumValue111 = bitwiseValue94 + (-1.0f);
                    precise float bitwiseValue95 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue91 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue96 = float(bitwiseValue92 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue125 = sumValue110 * 3.0517578125e-05f;
                    precise float productValue126 = sumValue111 * 3.0517578125e-05f;
                    precise float sumValue112 = bitwiseValue95 + productValue125;
                    precise float sumValue113 = bitwiseValue96 + productValue126;
                    intermediateValue180 = sumValue112;
                    intermediateValue181 = sumValue113;
                }
                else
                {
                    precise float bitwiseValue97 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue91 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue98 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue91 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue127 = bitwiseValue97 * 16384.0f;
                    precise float sumValue114 = productValue127 + 0.5f;
                    precise float productValue128 = bitwiseValue98 * 16384.0f;
                    precise float sumValue115 = productValue128 + 0.5f;
                    precise float productValue129 = floor(sumValue114) * 6.103515625e-05f;
                    precise float productValue130 = floor(sumValue115) * 6.103515625e-05f;
                    intermediateValue180 = productValue129;
                    intermediateValue181 = productValue130;
                }
                uint intermediateValue159;
                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue116 * 2 + 0) & 256u) == 0u)
                {
                    intermediateValue159 = 0u;
                }
                else
                {
                    intermediateValue159 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), ((uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue74 * 76u) + 74u) * 2 + 0) >> 8u) + productValue122) >> 2u) * 4 + 0) & 65535u;
                }
                precise float productValue131 = sumValue108 * float(productValue123.x);
                precise float productValue132 = sumValue108 * float(productValue123.y);
                precise float productValue133 = sumValue108 * float(productValue123.z);
                precise float sumValue116 = productValue131 + 0.0f;
                precise float sumValue117 = productValue132 + 0.0f;
                precise float sumValue118 = productValue133 + 0.0f;
                precise float productValue134 = sumValue108 * intermediateValue180;
                precise float productValue135 = sumValue108 * intermediateValue181;
                precise float sumValue119 = productValue134 + 0.0f;
                precise float sumValue120 = productValue135 + 0.0f;
                precise float productValue136 = sumValue108 * bitwiseValue86;
                precise float productValue137 = sumValue108 * bitwiseValue87;
                precise float productValue138 = sumValue108 * bitwiseValue88;
                precise float productValue139 = sumValue108 * bitwiseValue89;
                precise float sumValue121 = productValue136 + 0.0f;
                precise float sumValue122 = productValue137 + 0.0f;
                precise float sumValue123 = productValue138 + 0.0f;
                precise float sumValue124 = productValue139 + 0.0f;
                uint productValue140 = productValue121 * (rdByteLoad_objectInstances_uint(0u, productValue114 * 4 + 0) + bitwiseValue76);
                uint bitwiseValue99 = (bitwiseValue82 + productValue140) >> 1u;
                half3 productValue141 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue109), bitwiseValue99 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue109), (bitwiseValue99 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue109), (bitwiseValue99 + 2u) * 2 + 0)));
                uint bitwiseValue100 = (bitwiseValue84 + productValue140) >> 2u;
                precise float bitwiseValue101 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue100 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue102 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue100 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue103 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue100 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue104 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue100 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                uint bitwiseValue105 = (bitwiseValue90 + productValue140) >> 2u;
                float intermediateValue197;
                float intermediateValue198;
                if (productValue124)
                {
                    uint bitwiseValue106 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue105 * 4 + 0) >> 15u;
                    precise float bitwiseValue107 = float(bitwiseValue106 & 1u) * 2.0f;
                    precise float sumValue125 = bitwiseValue107 + (-1.0f);
                    precise float bitwiseValue108 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue105 * 4 + 0) >> 31u) * 2.0f;
                    precise float sumValue126 = bitwiseValue108 + (-1.0f);
                    precise float bitwiseValue109 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue105 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue110 = float(bitwiseValue106 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue142 = sumValue125 * 3.0517578125e-05f;
                    precise float productValue143 = sumValue126 * 3.0517578125e-05f;
                    precise float sumValue127 = bitwiseValue109 + productValue142;
                    precise float sumValue128 = bitwiseValue110 + productValue143;
                    intermediateValue197 = sumValue127;
                    intermediateValue198 = sumValue128;
                }
                else
                {
                    precise float bitwiseValue111 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue105 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue112 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue105 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue144 = bitwiseValue111 * 16384.0f;
                    precise float sumValue129 = productValue144 + 0.5f;
                    precise float productValue145 = bitwiseValue112 * 16384.0f;
                    precise float sumValue130 = productValue145 + 0.5f;
                    precise float productValue146 = floor(sumValue129) * 6.103515625e-05f;
                    precise float productValue147 = floor(sumValue130) * 6.103515625e-05f;
                    intermediateValue197 = productValue146;
                    intermediateValue198 = productValue147;
                }
                precise float productValue148 = intermediateValue132 * float(productValue141.x);
                precise float productValue149 = intermediateValue132 * float(productValue141.y);
                precise float productValue150 = intermediateValue132 * float(productValue141.z);
                precise float sumValue131 = sumValue116 + productValue148;
                precise float sumValue132 = sumValue117 + productValue149;
                precise float sumValue133 = sumValue118 + productValue150;
                precise float productValue151 = intermediateValue132 * intermediateValue197;
                precise float productValue152 = intermediateValue132 * intermediateValue198;
                precise float sumValue134 = sumValue119 + productValue151;
                precise float sumValue135 = sumValue120 + productValue152;
                precise float productValue153 = intermediateValue132 * bitwiseValue101;
                precise float productValue154 = intermediateValue132 * bitwiseValue102;
                precise float productValue155 = intermediateValue132 * bitwiseValue103;
                precise float productValue156 = intermediateValue132 * bitwiseValue104;
                precise float sumValue136 = sumValue121 + productValue153;
                precise float sumValue137 = sumValue122 + productValue154;
                precise float sumValue138 = sumValue123 + productValue155;
                precise float sumValue139 = sumValue124 + productValue156;
                uint productValue157 = productValue121 * (rdByteLoad_objectInstances_uint(0u, productValue114 * 4 + 0) + bitwiseValue77);
                uint bitwiseValue113 = (bitwiseValue82 + productValue157) >> 1u;
                half3 productValue158 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue109), bitwiseValue113 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue109), (bitwiseValue113 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue109), (bitwiseValue113 + 2u) * 2 + 0)));
                uint bitwiseValue114 = (bitwiseValue84 + productValue157) >> 2u;
                precise float bitwiseValue115 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue114 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue116 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue114 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue117 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue114 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue118 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue114 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                uint bitwiseValue119 = (bitwiseValue90 + productValue157) >> 2u;
                float intermediateValue212;
                float intermediateValue213;
                if (productValue124)
                {
                    uint bitwiseValue120 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue119 * 4 + 0) >> 15u;
                    precise float bitwiseValue121 = float(bitwiseValue120 & 1u) * 2.0f;
                    precise float sumValue140 = bitwiseValue121 + (-1.0f);
                    precise float bitwiseValue122 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue119 * 4 + 0) >> 31u) * 2.0f;
                    precise float sumValue141 = bitwiseValue122 + (-1.0f);
                    precise float bitwiseValue123 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue119 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue124 = float(bitwiseValue120 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue159 = sumValue140 * 3.0517578125e-05f;
                    precise float productValue160 = sumValue141 * 3.0517578125e-05f;
                    precise float sumValue142 = bitwiseValue123 + productValue159;
                    precise float sumValue143 = bitwiseValue124 + productValue160;
                    intermediateValue212 = sumValue142;
                    intermediateValue213 = sumValue143;
                }
                else
                {
                    precise float bitwiseValue125 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue119 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue126 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue109), bitwiseValue119 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue161 = bitwiseValue125 * 16384.0f;
                    precise float sumValue144 = productValue161 + 0.5f;
                    precise float productValue162 = bitwiseValue126 * 16384.0f;
                    precise float sumValue145 = productValue162 + 0.5f;
                    precise float productValue163 = floor(sumValue144) * 6.103515625e-05f;
                    precise float productValue164 = floor(sumValue145) * 6.103515625e-05f;
                    intermediateValue212 = productValue163;
                    intermediateValue213 = productValue164;
                }
                precise float productValue165 = intermediateValue134 * float(productValue158.x);
                precise float productValue166 = intermediateValue134 * float(productValue158.y);
                precise float productValue167 = intermediateValue134 * float(productValue158.z);
                precise float sumValue146 = sumValue131 + productValue165;
                precise float sumValue147 = sumValue132 + productValue166;
                precise float sumValue148 = sumValue133 + productValue167;
                precise float productValue168 = intermediateValue134 * intermediateValue212;
                precise float productValue169 = intermediateValue134 * intermediateValue213;
                precise float sumValue149 = sumValue134 + productValue168;
                precise float sumValue150 = sumValue135 + productValue169;
                precise float productValue170 = intermediateValue134 * bitwiseValue115;
                precise float productValue171 = intermediateValue134 * bitwiseValue116;
                precise float productValue172 = intermediateValue134 * bitwiseValue117;
                precise float productValue173 = intermediateValue134 * bitwiseValue118;
                precise float sumValue151 = sumValue136 + productValue170;
                precise float sumValue152 = sumValue137 + productValue171;
                precise float sumValue153 = sumValue138 + productValue172;
                precise float sumValue154 = sumValue139 + productValue173;
                precise float productValue174 = scalarValue82 * sumValue146;
                precise float productValue175 = sumValue147 * scalarValue83;
                precise float sumValue155 = productValue175 + productValue174;
                precise float productValue176 = sumValue148 * scalarValue84;
                precise float sumValue156 = productValue176 + sumValue155;
                precise float productValue177 = 1.0f * reinterpretedBits7.w;
                precise float sumValue157 = productValue177 + sumValue156;
                precise float productValue178 = scalarValue85 * sumValue146;
                precise float productValue179 = sumValue147 * scalarValue86;
                precise float sumValue158 = productValue179 + productValue178;
                precise float productValue180 = sumValue148 * scalarValue87;
                precise float sumValue159 = productValue180 + sumValue158;
                precise float productValue181 = 1.0f * reinterpretedBits8.w;
                precise float sumValue160 = productValue181 + sumValue159;
                precise float productValue182 = scalarValue88 * sumValue146;
                precise float productValue183 = sumValue147 * scalarValue89;
                precise float sumValue161 = productValue183 + productValue182;
                precise float productValue184 = sumValue148 * scalarValue90;
                precise float sumValue162 = productValue184 + sumValue161;
                precise float productValue185 = 1.0f * reinterpretedBits9.w;
                precise float sumValue163 = productValue185 + sumValue162;
                precise float productValue186 = scalarValue82 * sumValue104;
                precise float productValue187 = sumValue105 * scalarValue83;
                precise float sumValue164 = productValue187 + productValue186;
                precise float productValue188 = sumValue106 * scalarValue84;
                precise float sumValue165 = productValue188 + sumValue164;
                precise float productValue189 = scalarValue85 * sumValue104;
                precise float productValue190 = sumValue105 * scalarValue86;
                precise float sumValue166 = productValue190 + productValue189;
                precise float productValue191 = sumValue106 * scalarValue87;
                precise float sumValue167 = productValue191 + sumValue166;
                precise float productValue192 = scalarValue88 * sumValue104;
                precise float productValue193 = sumValue105 * scalarValue89;
                precise float sumValue168 = productValue193 + productValue192;
                precise float productValue194 = sumValue106 * scalarValue90;
                precise float sumValue169 = productValue194 + sumValue168;
                float inverseLengthValue1 = rsqrt(dot(float3(sumValue165, sumValue167, sumValue169), float3(sumValue165, sumValue167, sumValue169)));
                precise float productValue195 = sumValue165 * inverseLengthValue1;
                precise float productValue196 = sumValue167 * inverseLengthValue1;
                precise float productValue197 = sumValue169 * inverseLengthValue1;
                bool dotProductValue1 = dot(float3(intermediateValue65, intermediateValue67, intermediateValue69), float3(productValue195, productValue196, productValue197)) > 0.0f;
                precise float sumValue170 = (-0.0f) - productValue195;
                precise float sumValue171 = (-0.0f) - productValue196;
                precise float sumValue172 = (-0.0f) - productValue197;
                float comparisonValue39 = dotProductValue1 ? sumValue170 : productValue195;
                float comparisonValue40 = dotProductValue1 ? sumValue171 : productValue196;
                float comparisonValue41 = dotProductValue1 ? sumValue172 : productValue197;
                float intermediateValue160;
                float intermediateValue161;
                float intermediateValue162;
                if (((rdByteLoad_objectInstances_uint16_t(0u, productValue116 * 2 + 0) & 1u) != 0u) && (asuint(viewCbConstants[86u]).y != 0u))
                {
                    uint sumValue173 = productValue118 + 0u;
                    float sumValue175;
                    float sumValue176;
                    float sumValue177;
                    uint sumValue185;
                    float scalarValue91 = sumValue108;
                    uint scalarValue92 = bitwiseValue75;
                    float scalarValue93 = 0.0f;
                    float scalarValue94 = 0.0f;
                    float scalarValue95 = 0.0f;
                    uint scalarValue96 = 0u;
                    half3 productValue233;
                    half3 productValue235;
                    for (;;)
                    {
                        uint productValue198 = scalarValue92 + rdByteLoad_objectInstances_uint(0u, productValue115 * 4 + 0);
                        uint productValue199 = productValue198 * 8u;
                        productValue233 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue173), productValue199 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue173), (productValue199 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue173), (productValue199 + 2u) * 2 + 0)));
                        uint productValue200 = (productValue198 * 8u) + 4u;
                        productValue235 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue173), productValue200 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue173), (productValue200 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue173), (productValue200 + 2u) * 2 + 0)));
                        half intermediateValue266;
                        half intermediateValue267;
                        half intermediateValue268;
                        if (dotProductValue1)
                        {
                            intermediateValue266 = productValue235.x;
                            intermediateValue267 = productValue235.y;
                            intermediateValue268 = productValue235.z;
                        }
                        else
                        {
                            intermediateValue266 = productValue233.x;
                            intermediateValue267 = productValue233.y;
                            intermediateValue268 = productValue233.z;
                        }
                        precise float productValue201 = float(intermediateValue268) * scalarValue91;
                        precise float productValue202 = float(intermediateValue267) * scalarValue91;
                        precise float productValue203 = float(intermediateValue266) * scalarValue91;
                        sumValue175 = productValue203 + scalarValue93;
                        sumValue176 = productValue202 + scalarValue94;
                        sumValue177 = productValue201 + scalarValue95;
                        sumValue185 = scalarValue96 + 1u;
                        if (sumValue185 == 3u)
                        {
                            break;
                        }
                        scalarValue91 = intermediateValue2[sumValue185];
                        scalarValue92 = intermediateValue1[sumValue185];
                        scalarValue93 = sumValue175;
                        scalarValue94 = sumValue176;
                        scalarValue95 = sumValue177;
                        scalarValue96 = sumValue185;
                        continue;
                    }
                    intermediateValue160 = sumValue175;
                    intermediateValue161 = sumValue176;
                    intermediateValue162 = sumValue177;
                }
                else
                {
                    intermediateValue160 = 0.0f;
                    intermediateValue161 = 0.0f;
                    intermediateValue162 = 0.0f;
                }
                uint bitwiseValue127 = intermediateValue83 >> 30u;
                uint productValue204 = (bitwiseValue74 * 76u) + 58u;
                uint productValue205 = (bitwiseValue74 * 76u) + 59u;
                uint productValue209 = (bitwiseValue74 * 76u) + 61u;
                uint productValue210 = (bitwiseValue74 * 38u) + 32u;
                float branchMergedValue81;
                float branchMergedValue85;
                float branchMergedValue86;
                float branchMergedValue87;
                float branchMergedValue88;
                float branchMergedValue89;
                float branchMergedValue90;
                float branchMergedValue91;
                float branchMergedValue92;
                float branchMergedValue93;
                float branchMergedValue100;
                float branchMergedValue101;
                float branchMergedValue102;
                float branchMergedValue103;
                float branchMergedValue104;
                float branchMergedValue105;
                float branchMergedValue106;
                float branchMergedValue107;
                float branchMergedValue108;
                uint branchMergedValue109;
                uint branchMergedValue110;
                float branchMergedValue111;
                float branchMergedValue112;
                if (((bitwiseValue127 & 2u) == 0u) || ((rdByteLoad_objectInstances_uint16_t(0u, productValue209 * 2 + 0) & 1536u) != 0u))
                {
                    branchMergedValue81 = intermediateValue161;
                    branchMergedValue85 = intermediateValue162;
                    branchMergedValue86 = sumValue151;
                    branchMergedValue87 = sumValue152;
                    branchMergedValue88 = sumValue153;
                    branchMergedValue89 = sumValue154;
                    branchMergedValue90 = comparisonValue39;
                    branchMergedValue91 = comparisonValue40;
                    branchMergedValue92 = comparisonValue41;
                    branchMergedValue93 = sumValue149;
                    branchMergedValue100 = sumValue150;
                    branchMergedValue101 = sumValue157;
                    branchMergedValue102 = sumValue160;
                    branchMergedValue103 = sumValue163;
                    branchMergedValue104 = scalarValue30;
                    branchMergedValue105 = scalarValue31;
                    branchMergedValue106 = scalarValue32;
                    branchMergedValue107 = scalarValue33;
                    branchMergedValue108 = scalarValue34;
                    branchMergedValue109 = 4u;
                    branchMergedValue110 = intermediateValue159;
                    branchMergedValue111 = productValue120;
                    branchMergedValue112 = intermediateValue160;
                }
                else
                {
                    precise float sumValue174 = viewCbConstants[89u].y + productValue7;
                    precise float nonlinearValue1 = productValue120 + log2(abs(sumValue174));
                    uint reinterpretedBits28;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue204 * 2 + 0) > 4095u)
                    {
                        reinterpretedBits28 = asuint(viewCbConstants[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits28 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue204 * 2 + 0));
                    }
                    float intermediateValue269;
                    float intermediateValue270;
                    float intermediateValue271;
                    float intermediateValue272;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue204 * 2 + 0) == 65535u)
                    {
                        intermediateValue269 = 1.0f;
                        intermediateValue270 = 1.0f;
                        intermediateValue271 = 1.0f;
                        intermediateValue272 = 1.0f;
                    }
                    else
                    {
                        float4 sampledTextureValue = textures[NonUniformResourceIndex(reinterpretedBits28 + 0u)].SampleLevel(defaultSampler, float2(sumValue149, sumValue150), min(max(0.0f, nonlinearValue1), asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue159 * 16u) + 13u) * 4 + 0))));
                        intermediateValue269 = sampledTextureValue.x;
                        intermediateValue270 = sampledTextureValue.y;
                        intermediateValue271 = sampledTextureValue.z;
                        intermediateValue272 = sampledTextureValue.w;
                    }
                    float intermediateValue163;
                    float intermediateValue164;
                    float intermediateValue165;
                    float intermediateValue166;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue209 * 2 + 0) & 1024u) == 0u)
                    {
                        float branchMergedValue41;
                        float branchMergedValue69;
                        float branchMergedValue70;
                        float branchMergedValue71;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue209 * 2 + 0) & 512u) == 0u)
                        {
                            float intermediateValue306;
                            float intermediateValue307;
                            float intermediateValue308;
                            float intermediateValue309;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue209 * 2 + 0) & 4u) == 0u)
                            {
                                intermediateValue306 = intermediateValue272;
                                intermediateValue307 = sumValue151;
                                intermediateValue308 = sumValue152;
                                intermediateValue309 = sumValue153;
                            }
                            else
                            {
                                uint reinterpretedBits29;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue205 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits29 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits29 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue205 * 2 + 0));
                                }
                                float4 sampledTextureValue1 = textures[NonUniformResourceIndex(reinterpretedBits29 + 0u)].SampleLevel(defaultSampler, float2(sumValue151, sumValue152), 0.0f);
                                precise float productValue211 = sampledTextureValue1.x * 2.0f;
                                precise float productValue212 = sampledTextureValue1.y * 2.0f;
                                precise float productValue213 = sampledTextureValue1.z * 2.0f;
                                precise float sumValue178 = productValue211 + (-1.0f);
                                precise float sumValue179 = productValue212 + (-1.0f);
                                precise float sumValue180 = productValue213 + (-1.0f);
                                precise float productValue214 = sumValue153 * sumValue178;
                                precise float productValue215 = sumValue153 * sumValue179;
                                precise float productValue216 = sumValue153 * sumValue180;
                                precise float sumValue181 = productValue214 + 1.0f;
                                precise float sumValue182 = productValue215 + 1.0f;
                                precise float sumValue183 = productValue216 + 1.0f;
                                precise float productValue217 = sumValue154 * sumValue181;
                                precise float productValue218 = sumValue154 * sumValue182;
                                precise float productValue219 = sumValue154 * sumValue183;
                                intermediateValue306 = 1.0f;
                                intermediateValue307 = productValue217;
                                intermediateValue308 = productValue218;
                                intermediateValue309 = productValue219;
                            }
                            float intermediateValue322;
                            float intermediateValue323;
                            float intermediateValue324;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue209 * 2 + 0) & 8192u) == 0u)
                            {
                                intermediateValue322 = intermediateValue307;
                                intermediateValue323 = intermediateValue308;
                                intermediateValue324 = intermediateValue309;
                            }
                            else
                            {
                                precise float sumValue184 = 1.0f - intermediateValue307;
                                precise float sumValue186 = 1.0f - intermediateValue308;
                                precise float sumValue188 = 1.0f - intermediateValue309;
                                precise float productValue220 = intermediateValue306 * sumValue184;
                                precise float productValue221 = intermediateValue306 * sumValue186;
                                precise float productValue222 = intermediateValue306 * sumValue188;
                                precise float sumValue189 = intermediateValue307 + productValue220;
                                precise float sumValue190 = intermediateValue308 + productValue221;
                                precise float sumValue191 = intermediateValue309 + productValue222;
                                intermediateValue322 = sumValue189;
                                intermediateValue323 = sumValue190;
                                intermediateValue324 = sumValue191;
                            }
                            precise float productValue223 = intermediateValue269 * intermediateValue322;
                            precise float productValue224 = intermediateValue270 * intermediateValue323;
                            precise float productValue225 = intermediateValue271 * intermediateValue324;
                            float intermediateValue289;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue209 * 2 + 0) & 2048u) == 0u)
                            {
                                intermediateValue289 = intermediateValue306;
                            }
                            else
                            {
                                precise float productValue226 = intermediateValue306 * 2.0f;
                                precise float sumValue192 = productValue226 + (-1.0f);
                                intermediateValue289 = clamp(sumValue192, 0.0f, 1.0f);
                            }
                            precise float bitwiseValue128 = float(rdByteLoad_objectInstances_uint(0u, productValue210 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                            precise float bitwiseValue129 = float((rdByteLoad_objectInstances_uint(0u, productValue210 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                            precise float bitwiseValue130 = float((rdByteLoad_objectInstances_uint(0u, productValue210 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                            precise float sumValue193 = bitwiseValue128 + (-1.0f);
                            precise float sumValue194 = bitwiseValue129 + (-1.0f);
                            precise float sumValue195 = bitwiseValue130 + (-1.0f);
                            precise float productValue227 = sumValue193 * intermediateValue289;
                            precise float productValue228 = sumValue194 * intermediateValue289;
                            precise float productValue229 = sumValue195 * intermediateValue289;
                            precise float sumValue196 = productValue227 + 1.0f;
                            precise float sumValue197 = productValue228 + 1.0f;
                            precise float sumValue198 = productValue229 + 1.0f;
                            precise float productValue230 = productValue223 * sumValue196;
                            precise float productValue231 = productValue224 * sumValue197;
                            precise float productValue232 = productValue225 * sumValue198;
                            float intermediateValue290;
                            if (productValue230 < 0.040449999272823333740234375f)
                            {
                                precise float productValue234 = productValue230 * 0.077399380505084991455078125f;
                                intermediateValue290 = productValue234;
                            }
                            else
                            {
                                precise float sumValue199 = productValue230 + 0.054999999701976776123046875f;
                                precise float productValue236 = sumValue199 * 0.947867333889007568359375f;
                                precise float nonlinearValue2 = log2(productValue236) * 2.400000095367431640625f;
                                intermediateValue290 = exp2(nonlinearValue2);
                            }
                            float intermediateValue291;
                            if (productValue231 < 0.040449999272823333740234375f)
                            {
                                precise float productValue237 = productValue231 * 0.077399380505084991455078125f;
                                intermediateValue291 = productValue237;
                            }
                            else
                            {
                                precise float sumValue200 = productValue231 + 0.054999999701976776123046875f;
                                precise float productValue238 = sumValue200 * 0.947867333889007568359375f;
                                precise float nonlinearValue3 = log2(productValue238) * 2.400000095367431640625f;
                                intermediateValue291 = exp2(nonlinearValue3);
                            }
                            float branchMergedValue120;
                            float branchMergedValue131;
                            float branchMergedValue132;
                            float branchMergedValue133;
                            if (productValue232 < 0.040449999272823333740234375f)
                            {
                                precise float productValue239 = productValue232 * 0.077399380505084991455078125f;
                                branchMergedValue120 = productValue239;
                                branchMergedValue131 = intermediateValue291;
                                branchMergedValue132 = intermediateValue290;
                                branchMergedValue133 = intermediateValue289;
                            }
                            else
                            {
                                precise float sumValue201 = productValue232 + 0.054999999701976776123046875f;
                                precise float productValue240 = sumValue201 * 0.947867333889007568359375f;
                                precise float nonlinearValue4 = log2(productValue240) * 2.400000095367431640625f;
                                branchMergedValue120 = exp2(nonlinearValue4);
                                branchMergedValue131 = intermediateValue291;
                                branchMergedValue132 = intermediateValue290;
                                branchMergedValue133 = intermediateValue289;
                            }
                            branchMergedValue41 = branchMergedValue120;
                            branchMergedValue69 = branchMergedValue131;
                            branchMergedValue70 = branchMergedValue132;
                            branchMergedValue71 = branchMergedValue133;
                        }
                        else
                        {
                            branchMergedValue41 = exp2(log2(viewCbConstants[98u].y * intermediateValue271) * 1.39999997615814208984375f);
                            branchMergedValue69 = exp2(log2(viewCbConstants[98u].y * intermediateValue270) * 1.39999997615814208984375f);
                            branchMergedValue70 = exp2(log2(viewCbConstants[98u].y * intermediateValue269) * 1.39999997615814208984375f);
                            branchMergedValue71 = scalarValue30;
                        }
                        intermediateValue163 = branchMergedValue71;
                        intermediateValue164 = branchMergedValue70;
                        intermediateValue165 = branchMergedValue69;
                        intermediateValue166 = branchMergedValue41;
                    }
                    else
                    {
                        intermediateValue163 = scalarValue30;
                        intermediateValue164 = exp2(log2(viewCbConstants[98u].x * intermediateValue269) * 1.7999999523162841796875f);
                        intermediateValue165 = exp2(log2(viewCbConstants[98u].x * intermediateValue270) * 1.7999999523162841796875f);
                        intermediateValue166 = exp2(log2(viewCbConstants[98u].x * intermediateValue271) * 1.7999999523162841796875f);
                    }
                    float branchMergedValue134;
                    float branchMergedValue135;
                    float branchMergedValue136;
                    float branchMergedValue137;
                    float branchMergedValue138;
                    float branchMergedValue139;
                    float branchMergedValue140;
                    float branchMergedValue141;
                    float branchMergedValue142;
                    float branchMergedValue143;
                    float branchMergedValue144;
                    float branchMergedValue145;
                    float branchMergedValue146;
                    float branchMergedValue147;
                    float branchMergedValue148;
                    float branchMergedValue149;
                    float branchMergedValue150;
                    float branchMergedValue151;
                    float branchMergedValue152;
                    uint branchMergedValue153;
                    uint branchMergedValue154;
                    float branchMergedValue155;
                    float branchMergedValue156;
                    if (intermediateValue163 > (((scalarValue50 == 0u) || (bitwiseValue127 == 3u)) ? 0.949999988079071044921875f : 0.5f))
                    {
                        branchMergedValue134 = intermediateValue161;
                        branchMergedValue135 = intermediateValue162;
                        branchMergedValue136 = sumValue151;
                        branchMergedValue137 = sumValue152;
                        branchMergedValue138 = sumValue153;
                        branchMergedValue139 = sumValue154;
                        branchMergedValue140 = comparisonValue39;
                        branchMergedValue141 = comparisonValue40;
                        branchMergedValue142 = comparisonValue41;
                        branchMergedValue143 = sumValue149;
                        branchMergedValue144 = sumValue150;
                        branchMergedValue145 = sumValue157;
                        branchMergedValue146 = sumValue160;
                        branchMergedValue147 = sumValue163;
                        branchMergedValue148 = intermediateValue163;
                        branchMergedValue149 = intermediateValue163;
                        branchMergedValue150 = intermediateValue164;
                        branchMergedValue151 = intermediateValue165;
                        branchMergedValue152 = intermediateValue166;
                        branchMergedValue153 = 4u;
                        branchMergedValue154 = intermediateValue159;
                        branchMergedValue155 = productValue120;
                        branchMergedValue156 = intermediateValue160;
                    }
                    else
                    {
                        branchMergedValue134 = intermediateValue161;
                        branchMergedValue135 = intermediateValue162;
                        branchMergedValue136 = sumValue151;
                        branchMergedValue137 = sumValue152;
                        branchMergedValue138 = sumValue153;
                        branchMergedValue139 = sumValue154;
                        branchMergedValue140 = comparisonValue39;
                        branchMergedValue141 = comparisonValue40;
                        branchMergedValue142 = comparisonValue41;
                        branchMergedValue143 = sumValue149;
                        branchMergedValue144 = sumValue150;
                        branchMergedValue145 = sumValue157;
                        branchMergedValue146 = sumValue160;
                        branchMergedValue147 = sumValue163;
                        branchMergedValue148 = intermediateValue163;
                        branchMergedValue149 = intermediateValue163;
                        branchMergedValue150 = intermediateValue164;
                        branchMergedValue151 = intermediateValue165;
                        branchMergedValue152 = intermediateValue166;
                        branchMergedValue153 = uint(bitwiseValue127 != 3u);
                        branchMergedValue154 = intermediateValue159;
                        branchMergedValue155 = productValue120;
                        branchMergedValue156 = intermediateValue160;
                    }
                    branchMergedValue81 = branchMergedValue134;
                    branchMergedValue85 = branchMergedValue135;
                    branchMergedValue86 = branchMergedValue136;
                    branchMergedValue87 = branchMergedValue137;
                    branchMergedValue88 = branchMergedValue138;
                    branchMergedValue89 = branchMergedValue139;
                    branchMergedValue90 = branchMergedValue140;
                    branchMergedValue91 = branchMergedValue141;
                    branchMergedValue92 = branchMergedValue142;
                    branchMergedValue93 = branchMergedValue143;
                    branchMergedValue100 = branchMergedValue144;
                    branchMergedValue101 = branchMergedValue145;
                    branchMergedValue102 = branchMergedValue146;
                    branchMergedValue103 = branchMergedValue147;
                    branchMergedValue104 = branchMergedValue148;
                    branchMergedValue105 = branchMergedValue149;
                    branchMergedValue106 = branchMergedValue150;
                    branchMergedValue107 = branchMergedValue151;
                    branchMergedValue108 = branchMergedValue152;
                    branchMergedValue109 = branchMergedValue153;
                    branchMergedValue110 = branchMergedValue154;
                    branchMergedValue111 = branchMergedValue155;
                    branchMergedValue112 = branchMergedValue156;
                }
                branchMergedValue = branchMergedValue81;
                branchMergedValue4 = branchMergedValue85;
                branchMergedValue5 = branchMergedValue86;
                branchMergedValue6 = branchMergedValue87;
                branchMergedValue7 = branchMergedValue88;
                branchMergedValue8 = branchMergedValue89;
                branchMergedValue9 = branchMergedValue90;
                branchMergedValue10 = branchMergedValue91;
                branchMergedValue11 = branchMergedValue92;
                branchMergedValue12 = branchMergedValue93;
                branchMergedValue19 = branchMergedValue100;
                branchMergedValue20 = branchMergedValue101;
                branchMergedValue21 = branchMergedValue102;
                branchMergedValue22 = branchMergedValue103;
                branchMergedValue23 = branchMergedValue104;
                branchMergedValue24 = branchMergedValue105;
                branchMergedValue25 = branchMergedValue106;
                branchMergedValue26 = branchMergedValue107;
                branchMergedValue27 = branchMergedValue108;
                branchMergedValue28 = branchMergedValue109;
                branchMergedValue29 = branchMergedValue110;
                branchMergedValue30 = branchMergedValue111;
                branchMergedValue31 = branchMergedValue112;
            }
            else
            {
                branchMergedValue = scalarValue16;
                branchMergedValue4 = scalarValue17;
                branchMergedValue5 = scalarValue18;
                branchMergedValue6 = scalarValue19;
                branchMergedValue7 = scalarValue20;
                branchMergedValue8 = scalarValue21;
                branchMergedValue9 = scalarValue22;
                branchMergedValue10 = scalarValue23;
                branchMergedValue11 = scalarValue24;
                branchMergedValue12 = scalarValue25;
                branchMergedValue19 = scalarValue26;
                branchMergedValue20 = scalarValue27;
                branchMergedValue21 = scalarValue28;
                branchMergedValue22 = scalarValue29;
                branchMergedValue23 = scalarValue30;
                branchMergedValue24 = scalarValue31;
                branchMergedValue25 = scalarValue32;
                branchMergedValue26 = scalarValue33;
                branchMergedValue27 = scalarValue34;
                branchMergedValue28 = 4u;
                branchMergedValue29 = scalarValue13;
                branchMergedValue30 = scalarValue14;
                branchMergedValue31 = scalarValue15;
            }
            intermediateValue26 = branchMergedValue;
            intermediateValue28 = branchMergedValue4;
            intermediateValue30 = branchMergedValue5;
            intermediateValue32 = branchMergedValue6;
            intermediateValue34 = branchMergedValue7;
            intermediateValue36 = branchMergedValue8;
            intermediateValue38 = branchMergedValue9;
            intermediateValue40 = branchMergedValue10;
            intermediateValue42 = branchMergedValue11;
            intermediateValue44 = branchMergedValue12;
            intermediateValue46 = branchMergedValue19;
            intermediateValue48 = branchMergedValue20;
            intermediateValue50 = branchMergedValue21;
            intermediateValue52 = branchMergedValue22;
            intermediateValue55 = branchMergedValue23;
            intermediateValue57 = branchMergedValue24;
            intermediateValue59 = branchMergedValue25;
            intermediateValue61 = branchMergedValue26;
            intermediateValue63 = branchMergedValue27;
            intermediateValue79 = branchMergedValue28;
            intermediateValue20 = branchMergedValue29;
            intermediateValue22 = branchMergedValue30;
            intermediateValue24 = branchMergedValue31;
            if ((sumValue6 < 8u) && (intermediateValue79 != 4u))
            {
                scalarValue13 = intermediateValue20;
                scalarValue14 = intermediateValue22;
                scalarValue15 = intermediateValue24;
                scalarValue16 = intermediateValue26;
                scalarValue17 = intermediateValue28;
                scalarValue18 = intermediateValue30;
                scalarValue19 = intermediateValue32;
                scalarValue20 = intermediateValue34;
                scalarValue21 = intermediateValue36;
                scalarValue22 = intermediateValue38;
                scalarValue23 = intermediateValue40;
                scalarValue24 = intermediateValue42;
                scalarValue25 = intermediateValue44;
                scalarValue26 = intermediateValue46;
                scalarValue27 = intermediateValue48;
                scalarValue28 = intermediateValue50;
                scalarValue29 = intermediateValue52;
                scalarValue30 = intermediateValue55;
                scalarValue31 = intermediateValue57;
                scalarValue32 = intermediateValue59;
                scalarValue33 = intermediateValue61;
                scalarValue34 = intermediateValue63;
                scalarValue35 = intermediateValue65;
                scalarValue36 = intermediateValue67;
                scalarValue37 = intermediateValue69;
                scalarValue38 = reinterpretedBits4;
                scalarValue39 = reinterpretedBits5;
                scalarValue40 = reinterpretedBits6;
                scalarValue41 = productValue8;
                scalarValue42 = productValue9;
                scalarValue43 = productValue10;
                scalarValue44 = comparisonValue8;
                scalarValue45 = comparisonValue9;
                scalarValue46 = intermediateValue79;
                scalarValue47 = intermediateValue81;
                scalarValue48 = intermediateValue83;
                scalarValue49 = comparisonValue9;
                scalarValue50 = sumValue6;
                scalarValue51 = comparisonValue10;
                continue;
            }
            else
            {
                break;
            }
        }
        if (!(intermediateValue79 == 4u))
        {
            break;
        }
        float intermediateValue182;
        float intermediateValue183;
        float intermediateValue184;
        float intermediateValue185;
        float intermediateValue186;
        float intermediateValue188;
        float intermediateValue190;
        if (intermediateValue137)
        {
            uint bitwiseValue131 = intermediateValue83 & 16383u;
            uint productValue241 = (bitwiseValue131 * 76u) + 58u;
            uint productValue242 = (bitwiseValue131 * 76u) + 59u;
            uint productValue243 = (bitwiseValue131 * 76u) + 61u;
            uint productValue244 = (bitwiseValue131 * 38u) + 32u;
            float2 reinterpretedBits11 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, (intermediateValue20 * 8u) * 8 + 0));
            float2 reinterpretedBits12 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue20 * 8u) + 1u) * 8 + 0));
            float reinterpretedBits13 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue20 * 16u) + 13u) * 4 + 0));
            float reinterpretedBits14 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue20 * 16u) + 14u) * 4 + 0));
            float nonlinearValue5 = max(0.0f, log2(abs(productValue7 + viewCbConstants[89u].y)) + intermediateValue22);
            uint reinterpretedBits15;
            if (rdByteLoad_objectInstances_uint16_t(0u, productValue241 * 2 + 0) > 4095u)
            {
                reinterpretedBits15 = asuint(viewCbConstants[98u]).w;
            }
            else
            {
                reinterpretedBits15 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue241 * 2 + 0));
            }
            uint sumValue202 = reinterpretedBits15 + 0u;
            float intermediateValue199;
            float intermediateValue200;
            float intermediateValue201;
            float intermediateValue202;
            if (rdByteLoad_objectInstances_uint16_t(0u, productValue241 * 2 + 0) == 65535u)
            {
                intermediateValue199 = 1.0f;
                intermediateValue200 = 1.0f;
                intermediateValue201 = 1.0f;
                intermediateValue202 = 1.0f;
            }
            else
            {
                float4 sampledTextureValue2 = textures[NonUniformResourceIndex(sumValue202)].SampleLevel(defaultSampler, float2(intermediateValue44, intermediateValue46), min(nonlinearValue5, reinterpretedBits13));
                intermediateValue199 = sampledTextureValue2.x;
                intermediateValue200 = sampledTextureValue2.y;
                intermediateValue201 = sampledTextureValue2.z;
                intermediateValue202 = sampledTextureValue2.w;
            }
            float intermediateValue187;
            float intermediateValue189;
            float intermediateValue191;
            float intermediateValue214;
            float intermediateValue215;
            float intermediateValue216;
            float intermediateValue217;
            float intermediateValue218;
            float intermediateValue219;
            float intermediateValue220;
            float intermediateValue221;
            float intermediateValue222;
            float intermediateValue223;
            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue243 * 2 + 0) & 1024u) == 0u)
            {
                float branchMergedValue38;
                float branchMergedValue56;
                float branchMergedValue57;
                float branchMergedValue58;
                float branchMergedValue59;
                float branchMergedValue60;
                float branchMergedValue61;
                float branchMergedValue62;
                float branchMergedValue63;
                float branchMergedValue64;
                float branchMergedValue78;
                float branchMergedValue79;
                float branchMergedValue80;
                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue243 * 2 + 0) & 512u) == 0u)
                {
                    float intermediateValue230;
                    float intermediateValue231;
                    float intermediateValue232;
                    float intermediateValue233;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue243 * 2 + 0) & 4u) == 0u)
                    {
                        intermediateValue230 = intermediateValue202;
                        intermediateValue231 = intermediateValue30;
                        intermediateValue232 = intermediateValue32;
                        intermediateValue233 = intermediateValue34;
                    }
                    else
                    {
                        uint reinterpretedBits27;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue242 * 2 + 0) > 4095u)
                        {
                            reinterpretedBits27 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits27 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue242 * 2 + 0));
                        }
                        float4 sampledTextureValue3 = textures[NonUniformResourceIndex(reinterpretedBits27 + 0u)].SampleLevel(defaultSampler, float2(intermediateValue30, intermediateValue32), 0.0f);
                        intermediateValue230 = 1.0f;
                        intermediateValue231 = ((((sampledTextureValue3.x * 2.0f) + (-1.0f)) * intermediateValue34) + 1.0f) * intermediateValue36;
                        intermediateValue232 = ((((sampledTextureValue3.y * 2.0f) + (-1.0f)) * intermediateValue34) + 1.0f) * intermediateValue36;
                        intermediateValue233 = ((((sampledTextureValue3.z * 2.0f) + (-1.0f)) * intermediateValue34) + 1.0f) * intermediateValue36;
                    }
                    float intermediateValue254;
                    float intermediateValue255;
                    float intermediateValue256;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue243 * 2 + 0) & 8192u) == 0u)
                    {
                        intermediateValue254 = intermediateValue231;
                        intermediateValue255 = intermediateValue232;
                        intermediateValue256 = intermediateValue233;
                    }
                    else
                    {
                        intermediateValue254 = ((1.0f - intermediateValue231) * intermediateValue230) + intermediateValue231;
                        intermediateValue255 = ((1.0f - intermediateValue232) * intermediateValue230) + intermediateValue232;
                        intermediateValue256 = ((1.0f - intermediateValue233) * intermediateValue230) + intermediateValue233;
                    }
                    float intermediateValue263;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue243 * 2 + 0) & 2048u) == 0u)
                    {
                        intermediateValue263 = intermediateValue230;
                    }
                    else
                    {
                        intermediateValue263 = clamp(mad(intermediateValue230, 2.0f, -1.0f), 0.0f, 1.0f);
                    }
                    float bitwiseValue132 = (intermediateValue254 * intermediateValue199) * ((intermediateValue263 * ((float(rdByteLoad_objectInstances_uint(0u, productValue244 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                    float bitwiseValue133 = (intermediateValue255 * intermediateValue200) * ((intermediateValue263 * ((float((rdByteLoad_objectInstances_uint(0u, productValue244 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                    float bitwiseValue134 = (intermediateValue256 * intermediateValue201) * ((intermediateValue263 * ((float((rdByteLoad_objectInstances_uint(0u, productValue244 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
                    float productValue206;
                    if (bitwiseValue132 < 0.040449999272823333740234375f)
                    {
                        productValue206 = bitwiseValue132 * 0.077399380505084991455078125f;
                    }
                    else
                    {
                        productValue206 = exp2(log2((bitwiseValue132 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                    }
                    float productValue207;
                    if (bitwiseValue133 < 0.040449999272823333740234375f)
                    {
                        productValue207 = bitwiseValue133 * 0.077399380505084991455078125f;
                    }
                    else
                    {
                        productValue207 = exp2(log2((bitwiseValue133 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                    }
                    float productValue208;
                    if (bitwiseValue134 < 0.040449999272823333740234375f)
                    {
                        productValue208 = bitwiseValue134 * 0.077399380505084991455078125f;
                    }
                    else
                    {
                        productValue208 = exp2(log2((bitwiseValue134 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
                    }
                    float reinterpretedBits30;
                    float reinterpretedBits31;
                    float reinterpretedBits32;
                    if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue20 * 16u) + 8u) * 4 + 0) & 1u) == 0u)
                    {
                        reinterpretedBits30 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue20 * 16u) + 11u) * 4 + 0));
                        reinterpretedBits31 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue20 * 16u) + 9u) * 4 + 0));
                        reinterpretedBits32 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue20 * 16u) + 10u) * 4 + 0));
                    }
                    else
                    {
                        float4 sampledTextureValue4 = textures[NonUniformResourceIndex(sumValue202)].SampleLevel(defaultSampler, float2(mad(intermediateValue44, reinterpretedBits11.x, reinterpretedBits12.x), mad(intermediateValue46, reinterpretedBits11.y, reinterpretedBits12.y)), min((reinterpretedBits14 - reinterpretedBits13) + nonlinearValue5, reinterpretedBits14));
                        float scalarValue97 = sampledTextureValue4.y;
                        reinterpretedBits30 = sampledTextureValue4.x;
                        reinterpretedBits31 = sampledTextureValue4.z;
                        reinterpretedBits32 = mad(scalarValue97, scalarValue97, 0.0f);
                    }
                    float sumValue203 = 1.0f - reinterpretedBits30;
                    float productValue245 = sumValue203 * productValue206;
                    float productValue246 = sumValue203 * productValue207;
                    float productValue247 = sumValue203 * productValue208;
                    float dotProductValue2 = dot(float3(productValue206, productValue207, productValue208), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                    float productValue248 = (reinterpretedBits32 * 5.0f) * viewCbConstants[84u].w;
                    branchMergedValue38 = productValue208;
                    branchMergedValue56 = productValue248 * (((dotProductValue2 - productValue208) * viewCbConstants[85u].x) + productValue208);
                    branchMergedValue57 = reinterpretedBits31 - (viewCbConstants[85u].w * reinterpretedBits31);
                    branchMergedValue58 = productValue248 * (((dotProductValue2 - productValue206) * viewCbConstants[85u].x) + productValue206);
                    branchMergedValue59 = productValue248 * (((dotProductValue2 - productValue207) * viewCbConstants[85u].x) + productValue207);
                    branchMergedValue60 = (reinterpretedBits30 * (productValue206 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                    branchMergedValue61 = (reinterpretedBits30 * (productValue207 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                    branchMergedValue62 = (reinterpretedBits30 * (productValue208 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                    branchMergedValue63 = productValue245 - (productValue245 * reinterpretedBits32);
                    branchMergedValue64 = productValue246 - (productValue246 * reinterpretedBits32);
                    branchMergedValue78 = productValue247 - (productValue247 * reinterpretedBits32);
                    branchMergedValue79 = productValue206;
                    branchMergedValue80 = productValue207;
                }
                else
                {
                    branchMergedValue38 = exp2(log2(viewCbConstants[98u].y * intermediateValue201) * 1.39999997615814208984375f);
                    branchMergedValue56 = intermediateValue54;
                    branchMergedValue57 = intermediateValue54;
                    branchMergedValue58 = intermediateValue54;
                    branchMergedValue59 = intermediateValue54;
                    branchMergedValue60 = intermediateValue54;
                    branchMergedValue61 = intermediateValue54;
                    branchMergedValue62 = intermediateValue54;
                    branchMergedValue63 = intermediateValue54;
                    branchMergedValue64 = intermediateValue54;
                    branchMergedValue78 = intermediateValue54;
                    branchMergedValue79 = exp2(log2(viewCbConstants[98u].y * intermediateValue199) * 1.39999997615814208984375f);
                    branchMergedValue80 = exp2(log2(viewCbConstants[98u].y * intermediateValue200) * 1.39999997615814208984375f);
                }
                intermediateValue214 = branchMergedValue57;
                intermediateValue215 = branchMergedValue58;
                intermediateValue216 = branchMergedValue59;
                intermediateValue217 = branchMergedValue56;
                intermediateValue218 = branchMergedValue60;
                intermediateValue219 = branchMergedValue61;
                intermediateValue220 = branchMergedValue62;
                intermediateValue221 = branchMergedValue63;
                intermediateValue222 = branchMergedValue64;
                intermediateValue223 = branchMergedValue78;
                intermediateValue187 = branchMergedValue79;
                intermediateValue189 = branchMergedValue80;
                intermediateValue191 = branchMergedValue38;
            }
            else
            {
                intermediateValue214 = intermediateValue54;
                intermediateValue215 = intermediateValue54;
                intermediateValue216 = intermediateValue54;
                intermediateValue217 = intermediateValue54;
                intermediateValue218 = intermediateValue54;
                intermediateValue219 = intermediateValue54;
                intermediateValue220 = intermediateValue54;
                intermediateValue221 = intermediateValue54;
                intermediateValue222 = intermediateValue54;
                intermediateValue223 = intermediateValue54;
                intermediateValue187 = exp2(log2(viewCbConstants[98u].x * intermediateValue199) * 1.7999999523162841796875f);
                intermediateValue189 = exp2(log2(viewCbConstants[98u].x * intermediateValue200) * 1.7999999523162841796875f);
                intermediateValue191 = exp2(log2(viewCbConstants[98u].x * intermediateValue201) * 1.7999999523162841796875f);
            }
            float branchMergedValue36;
            float branchMergedValue48;
            float branchMergedValue49;
            float branchMergedValue50;
            float branchMergedValue51;
            float branchMergedValue52;
            float branchMergedValue53;
            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue243 * 2 + 0) & 1536u) == 0u)
            {
                rdByteStore_outputVisibleBLASs_uint(0u, uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue131 * 76u) + 62u) * 2 + 0)) * 4 + 0, asuint(viewCbConstants[84u]).z);
                float productValue249 = (intermediateValue221 * intermediateValue24) + intermediateValue215;
                float productValue250 = (intermediateValue222 * intermediateValue26) + intermediateValue216;
                float productValue251 = (intermediateValue223 * intermediateValue28) + intermediateValue217;
                precise float sumValue204 = (-0.0f) - intermediateValue38;
                precise float sumValue205 = (-0.0f) - intermediateValue40;
                precise float sumValue206 = (-0.0f) - intermediateValue42;
                float comparisonValue42 = comparisonValue12 ? sumValue204 : intermediateValue38;
                float comparisonValue43 = comparisonValue12 ? sumValue205 : intermediateValue40;
                float comparisonValue44 = comparisonValue12 ? sumValue206 : intermediateValue42;
                precise float productValue252 = comparisonValue42 * 256.0f;
                uint scalarValue98 = uint(int(productValue252));
                precise float productValue253 = comparisonValue43 * 256.0f;
                uint scalarValue99 = uint(int(productValue253));
                precise float productValue254 = comparisonValue44 * 256.0f;
                uint scalarValue100 = uint(int(productValue254));
                precise float productValue255 = comparisonValue42 * 1.52587890625e-05f;
                precise float sumValue207 = productValue255 + intermediateValue48;
                float reinterpretedBits16 = (abs(intermediateValue48) < 0.03125f) ? sumValue207 : asfloat(((intermediateValue48 < 0.0f) ? (-scalarValue98) : scalarValue98) + asuint(intermediateValue48));
                precise float productValue256 = comparisonValue43 * 1.52587890625e-05f;
                precise float sumValue208 = productValue256 + intermediateValue50;
                float reinterpretedBits18 = (abs(intermediateValue50) < 0.03125f) ? sumValue208 : asfloat(((intermediateValue50 < 0.0f) ? (-scalarValue99) : scalarValue99) + asuint(intermediateValue50));
                precise float productValue257 = comparisonValue44 * 1.52587890625e-05f;
                precise float sumValue209 = productValue257 + intermediateValue52;
                float reinterpretedBits19 = (abs(intermediateValue52) < 0.03125f) ? sumValue209 : asfloat(((intermediateValue52 < 0.0f) ? (-scalarValue100) : scalarValue100) + asuint(intermediateValue52));
                float intermediateValue257;
                float intermediateValue258;
                float intermediateValue259;
                if (dot(float3(viewCbConstants[52u].xyz), float3(comparisonValue42, comparisonValue43, comparisonValue44)) < 0.0f)
                {
                    intermediateValue257 = 0.0f;
                    intermediateValue258 = 0.0f;
                    intermediateValue259 = 0.0f;
                }
                else
                {
                    RayDesc _10ident = {float3(reinterpretedBits16, reinterpretedBits18, reinterpretedBits19), 0.0f, float3(viewCbConstants[53u].xyz), 10000.0f};
                    intermediateValue260.TraceRayInline(intermediateValue, 512u, 32u, _10ident);
                    bool conditionValue7 = intermediateValue260.Proceed();
                    if (conditionValue7)
                    {
                        bool intermediateValue281;
                        bool comparisonValue52;
                        for (;;)
                        {
                            uint scalarValue101 = intermediateValue260.CandidateType();
                            comparisonValue52 = scalarValue101 == 0u;
                            if (comparisonValue52)
                            {
                                float2 vectorValue10 = intermediateValue260.CandidateTriangleBarycentrics();
                                float2 vectorValue11 = intermediateValue260.CandidateTriangleBarycentrics();
                                uint scalarValue102 = intermediateValue260.CandidatePrimitiveIndex();
                                uint scalarValue103 = intermediateValue260.CandidateInstanceID();
                                uint scalarValue104 = intermediateValue260.CandidateInstanceIndex();
                                uint productValue258 = (scalarValue104 * 76u) + 58u;
                                uint productValue259 = (scalarValue104 * 76u) + 61u;
                                precise float sumValue210 = 1.0f - vectorValue10.x;
                                precise float sumValue211 = sumValue210 - vectorValue11.y;
                                uint bitwiseValue135 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue104 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue102 >> 1u);
                                uint productValue260 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue104 * 76u) + 54u) * 2 + 0)) + 0u;
                                bool comparisonValue45 = (scalarValue102 & 1u) == 0u;
                                uint comparisonValue46 = comparisonValue45 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue260), bitwiseValue135 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue260), bitwiseValue135 * 16 + 0).x;
                                uint comparisonValue48 = comparisonValue45 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue260), bitwiseValue135 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue260), bitwiseValue135 * 16 + 0).w;
                                uint comparisonValue49 = comparisonValue45 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue260), bitwiseValue135 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue260), bitwiseValue135 * 16 + 0).z;
                                bool productValue261 = rdByteLoad_objectInstances_uint16_t(0u, productValue259 * 2 + 0) < 0u;
                                float intermediateValue310;
                                float intermediateValue311;
                                if (productValue261)
                                {
                                    uint bitwiseValue136 = comparisonValue49 >> 15u;
                                    precise float bitwiseValue137 = float(bitwiseValue136 & 1u) * 2.0f;
                                    precise float sumValue212 = bitwiseValue137 + (-1.0f);
                                    precise float bitwiseValue138 = float(comparisonValue49 >> 31u) * 2.0f;
                                    precise float sumValue213 = bitwiseValue138 + (-1.0f);
                                    precise float bitwiseValue139 = float((comparisonValue49 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue140 = float(bitwiseValue136 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue262 = sumValue212 * 3.0517578125e-05f;
                                    precise float productValue263 = sumValue213 * 3.0517578125e-05f;
                                    precise float sumValue214 = bitwiseValue139 + productValue262;
                                    precise float sumValue215 = bitwiseValue140 + productValue263;
                                    intermediateValue310 = sumValue214;
                                    intermediateValue311 = sumValue215;
                                }
                                else
                                {
                                    precise float bitwiseValue141 = float(comparisonValue49 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue142 = float(comparisonValue49 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue264 = bitwiseValue141 * 16384.0f;
                                    precise float sumValue216 = productValue264 + 0.5f;
                                    precise float productValue265 = bitwiseValue142 * 16384.0f;
                                    precise float sumValue217 = productValue265 + 0.5f;
                                    precise float productValue266 = floor(sumValue216) * 6.103515625e-05f;
                                    precise float productValue267 = floor(sumValue217) * 6.103515625e-05f;
                                    intermediateValue310 = productValue266;
                                    intermediateValue311 = productValue267;
                                }
                                precise float productValue268 = sumValue211 * intermediateValue310;
                                precise float productValue269 = sumValue211 * intermediateValue311;
                                precise float sumValue218 = productValue268 + 0.0f;
                                precise float sumValue219 = productValue269 + 0.0f;
                                float intermediateValue352;
                                float intermediateValue353;
                                if (productValue261)
                                {
                                    uint bitwiseValue143 = comparisonValue48 >> 15u;
                                    precise float bitwiseValue144 = float(bitwiseValue143 & 1u) * 2.0f;
                                    precise float sumValue220 = bitwiseValue144 + (-1.0f);
                                    precise float bitwiseValue145 = float(comparisonValue48 >> 31u) * 2.0f;
                                    precise float sumValue221 = bitwiseValue145 + (-1.0f);
                                    precise float bitwiseValue146 = float((comparisonValue48 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue147 = float(bitwiseValue143 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue270 = sumValue220 * 3.0517578125e-05f;
                                    precise float productValue271 = sumValue221 * 3.0517578125e-05f;
                                    precise float sumValue222 = bitwiseValue146 + productValue270;
                                    precise float sumValue223 = bitwiseValue147 + productValue271;
                                    intermediateValue352 = sumValue222;
                                    intermediateValue353 = sumValue223;
                                }
                                else
                                {
                                    precise float bitwiseValue148 = float(comparisonValue48 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue149 = float(comparisonValue48 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue272 = bitwiseValue148 * 16384.0f;
                                    precise float sumValue224 = productValue272 + 0.5f;
                                    precise float productValue273 = bitwiseValue149 * 16384.0f;
                                    precise float sumValue225 = productValue273 + 0.5f;
                                    precise float productValue274 = floor(sumValue224) * 6.103515625e-05f;
                                    precise float productValue275 = floor(sumValue225) * 6.103515625e-05f;
                                    intermediateValue352 = productValue274;
                                    intermediateValue353 = productValue275;
                                }
                                precise float productValue276 = vectorValue10.x * intermediateValue352;
                                precise float productValue277 = vectorValue10.x * intermediateValue353;
                                precise float sumValue226 = sumValue218 + productValue276;
                                precise float sumValue227 = sumValue219 + productValue277;
                                float intermediateValue373;
                                float intermediateValue374;
                                if (productValue261)
                                {
                                    uint bitwiseValue150 = comparisonValue46 >> 15u;
                                    precise float bitwiseValue151 = float(bitwiseValue150 & 1u) * 2.0f;
                                    precise float sumValue228 = bitwiseValue151 + (-1.0f);
                                    precise float bitwiseValue152 = float(comparisonValue46 >> 31u) * 2.0f;
                                    precise float sumValue229 = bitwiseValue152 + (-1.0f);
                                    precise float bitwiseValue153 = float((comparisonValue46 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue154 = float(bitwiseValue150 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue278 = sumValue228 * 3.0517578125e-05f;
                                    precise float productValue279 = sumValue229 * 3.0517578125e-05f;
                                    precise float sumValue230 = bitwiseValue153 + productValue278;
                                    precise float sumValue231 = bitwiseValue154 + productValue279;
                                    intermediateValue373 = sumValue230;
                                    intermediateValue374 = sumValue231;
                                }
                                else
                                {
                                    precise float bitwiseValue155 = float(comparisonValue46 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue156 = float(comparisonValue46 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue280 = bitwiseValue155 * 16384.0f;
                                    precise float sumValue232 = productValue280 + 0.5f;
                                    precise float productValue281 = bitwiseValue156 * 16384.0f;
                                    precise float sumValue233 = productValue281 + 0.5f;
                                    precise float productValue282 = floor(sumValue232) * 6.103515625e-05f;
                                    precise float productValue283 = floor(sumValue233) * 6.103515625e-05f;
                                    intermediateValue373 = productValue282;
                                    intermediateValue374 = productValue283;
                                }
                                precise float productValue284 = vectorValue11.y * intermediateValue373;
                                precise float productValue285 = vectorValue11.y * intermediateValue374;
                                precise float sumValue234 = sumValue226 + productValue284;
                                precise float sumValue235 = sumValue227 + productValue285;
                                float intermediateValue375;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue258 * 2 + 0) == 65535u)
                                {
                                    intermediateValue375 = 1.0f;
                                }
                                else
                                {
                                    uint reinterpretedBits33;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue258 * 2 + 0) > 4095u)
                                    {
                                        reinterpretedBits33 = asuint(viewCbConstants[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits33 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue258 * 2 + 0));
                                    }
                                    intermediateValue375 = textures[NonUniformResourceIndex(reinterpretedBits33 + 0u)].SampleLevel(defaultSampler, float2(sumValue234, sumValue235), -0.25f).w;
                                }
                                uint comparisonValue76;
                                if (scalarValue103 == 2u)
                                {
                                    comparisonValue76 = 0u;
                                }
                                else
                                {
                                    comparisonValue76 = uint(intermediateValue375 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue259 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                }
                                if (comparisonValue76 == 0u)
                                {
                                    intermediateValue260.CommitNonOpaqueTriangleHit();
                                }
                            }
                            intermediateValue281 = intermediateValue260.Proceed();
                            if (intermediateValue281)
                            {
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    uint scalarValue105 = intermediateValue260.CommittedStatus();
                    float intermediateValue275;
                    if (scalarValue105 == 1u)
                    {
                        float scalarValue106 = intermediateValue260.CommittedRayT();
                        intermediateValue275 = scalarValue106;
                    }
                    else
                    {
                        intermediateValue275 = 10000.0f;
                    }
                    float branchMergedValue39;
                    float branchMergedValue65;
                    float branchMergedValue66;
                    if (intermediateValue275 < 10000.0f)
                    {
                        precise float productValue286 = intermediateValue275 * viewCbConstants[63u].x;
                        precise float productValue287 = intermediateValue275 * viewCbConstants[63u].y;
                        precise float productValue288 = intermediateValue275 * viewCbConstants[63u].z;
                        precise float productValue289 = productValue286 * (-1.44269502162933349609375f);
                        precise float productValue290 = productValue287 * (-1.44269502162933349609375f);
                        precise float productValue291 = productValue288 * (-1.44269502162933349609375f);
                        precise float productValue292 = viewCbConstants[53u].x * intermediateValue275;
                        precise float sumValue236 = productValue292 + reinterpretedBits16;
                        precise float productValue293 = viewCbConstants[53u].z * intermediateValue275;
                        precise float sumValue237 = productValue293 + reinterpretedBits19;
                        precise float productValue294 = sumValue236 * viewCbConstants[83u].z;
                        precise float sumValue238 = productValue294 + viewCbConstants[84u].x;
                        precise float productValue295 = sumValue237 * viewCbConstants[83u].w;
                        precise float sumValue239 = productValue295 + viewCbConstants[84u].y;
                        float4 sampledTextureValue5 = wibblyTexture.SampleLevel(linearWrapSampler, float2(sumValue238, sumValue239), 0.0f);
                        precise float sumValue240 = sampledTextureValue5.x + (-0.5f);
                        precise float sumValue241 = sampledTextureValue5.y + (-0.5f);
                        precise float productValue296 = sumValue236 * viewCbConstants[82u].z;
                        precise float sumValue242 = productValue296 + viewCbConstants[83u].x;
                        precise float productValue297 = sumValue237 * viewCbConstants[82u].w;
                        precise float sumValue243 = productValue297 + viewCbConstants[83u].y;
                        precise float productValue298 = sumValue240 * 0.4000000059604644775390625f;
                        precise float productValue299 = sumValue241 * 0.4000000059604644775390625f;
                        precise float sumValue244 = sumValue242 + productValue298;
                        precise float sumValue245 = productValue299 + sumValue243;
                        precise float productValue300 = viewCbConstants[68u].w * 63.0f;
                        uint scalarValue107 = uint(int(floor(productValue300)));
                        precise float productValue301 = float(int(scalarValue107 + 1u)) * 0.015625f;
                        precise float sumValue246 = (-0.0f) - productValue301;
                        float scalarValue108 = frac(abs(productValue301));
                        precise float sumValue247 = (-0.0f) - scalarValue108;
                        precise float comparisonValue50 = ((productValue301 >= sumValue246) ? scalarValue108 : sumValue247) * 64.0f;
                        float4 sampledTextureValue6 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue244, sumValue245, float(int(scalarValue107))), 0.0f);
                        float scalarValue109 = sampledTextureValue6.x;
                        precise float sampledTextureValue7 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue244, sumValue245, float(int(uint(int(comparisonValue50))))), 0.0f).x - scalarValue109;
                        precise float productValue302 = frac(productValue300) * sampledTextureValue7;
                        precise float sumValue248 = scalarValue109 + productValue302;
                        precise float productValue303 = sumValue248 * 7.0f;
                        precise float sumValue249 = productValue303 + 0.800000011920928955078125f;
                        precise float productValue304 = intermediateValue275 * (-0.100000001490116119384765625f);
                        precise float sumValue250 = sumValue249 + (-1.0f);
                        precise float exponentialValue3 = exp2(productValue304) * sumValue250;
                        precise float sumValue251 = exponentialValue3 + 1.0f;
                        precise float exponentialValue4 = exp2(productValue289) * sumValue251;
                        precise float exponentialValue5 = exp2(productValue290) * sumValue251;
                        precise float exponentialValue6 = exp2(productValue291) * sumValue251;
                        RayDesc _11ident = {float3(reinterpretedBits16, reinterpretedBits18, reinterpretedBits19), 0.0f, float3(viewCbConstants[53u].xyz), intermediateValue275};
                        intermediateValue285.TraceRayInline(intermediateValue, 512u, 223u, _11ident);
                        bool conditionValue8 = intermediateValue285.Proceed();
                        float intermediateValue292;
                        float intermediateValue294;
                        float intermediateValue296;
                        if (conditionValue8)
                        {
                            float intermediateValue293;
                            float intermediateValue295;
                            float intermediateValue297;
                            float scalarValue110 = exponentialValue4;
                            float scalarValue111 = exponentialValue5;
                            float scalarValue112 = exponentialValue6;
                            bool comparisonValue60;
                            for (;;)
                            {
                                uint scalarValue113 = intermediateValue285.CandidateType();
                                comparisonValue60 = scalarValue113 == 0u;
                                float branchMergedValue1;
                                float branchMergedValue13;
                                float branchMergedValue14;
                                if (comparisonValue60)
                                {
                                    float2 vectorValue12 = intermediateValue285.CandidateTriangleBarycentrics();
                                    float2 vectorValue13 = intermediateValue285.CandidateTriangleBarycentrics();
                                    float scalarValue114 = intermediateValue285.CandidateTriangleRayT();
                                    uint scalarValue115 = intermediateValue285.CandidatePrimitiveIndex();
                                    uint scalarValue116 = intermediateValue285.CandidateInstanceID();
                                    uint scalarValue117 = intermediateValue285.CandidateInstanceIndex();
                                    uint productValue305 = (scalarValue117 * 76u) + 58u;
                                    uint productValue306 = (scalarValue117 * 76u) + 61u;
                                    precise float sumValue252 = 1.0f - vectorValue12.x;
                                    precise float sumValue253 = sumValue252 - vectorValue13.y;
                                    uint bitwiseValue157 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue117 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue115 >> 1u);
                                    uint productValue307 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue117 * 76u) + 54u) * 2 + 0)) + 0u;
                                    bool comparisonValue53 = (scalarValue115 & 1u) == 0u;
                                    uint comparisonValue54 = comparisonValue53 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue307), bitwiseValue157 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue307), bitwiseValue157 * 16 + 0).x;
                                    uint comparisonValue55 = comparisonValue53 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue307), bitwiseValue157 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue307), bitwiseValue157 * 16 + 0).w;
                                    uint comparisonValue56 = comparisonValue53 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue307), bitwiseValue157 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue307), bitwiseValue157 * 16 + 0).z;
                                    bool productValue308 = rdByteLoad_objectInstances_uint16_t(0u, productValue306 * 2 + 0) < 0u;
                                    float intermediateValue359;
                                    float intermediateValue360;
                                    if (productValue308)
                                    {
                                        uint bitwiseValue158 = comparisonValue56 >> 15u;
                                        precise float bitwiseValue159 = float(bitwiseValue158 & 1u) * 2.0f;
                                        precise float sumValue254 = bitwiseValue159 + (-1.0f);
                                        precise float bitwiseValue160 = float(comparisonValue56 >> 31u) * 2.0f;
                                        precise float sumValue255 = bitwiseValue160 + (-1.0f);
                                        precise float bitwiseValue161 = float((comparisonValue56 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue162 = float(bitwiseValue158 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue309 = sumValue254 * 3.0517578125e-05f;
                                        precise float productValue310 = sumValue255 * 3.0517578125e-05f;
                                        precise float sumValue256 = bitwiseValue161 + productValue309;
                                        precise float sumValue257 = bitwiseValue162 + productValue310;
                                        intermediateValue359 = sumValue256;
                                        intermediateValue360 = sumValue257;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue163 = float(comparisonValue56 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue164 = float(comparisonValue56 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue311 = bitwiseValue163 * 16384.0f;
                                        precise float sumValue258 = productValue311 + 0.5f;
                                        precise float productValue312 = bitwiseValue164 * 16384.0f;
                                        precise float sumValue259 = productValue312 + 0.5f;
                                        precise float productValue313 = floor(sumValue258) * 6.103515625e-05f;
                                        precise float productValue314 = floor(sumValue259) * 6.103515625e-05f;
                                        intermediateValue359 = productValue313;
                                        intermediateValue360 = productValue314;
                                    }
                                    precise float productValue315 = sumValue253 * intermediateValue359;
                                    precise float productValue316 = sumValue253 * intermediateValue360;
                                    precise float sumValue260 = productValue315 + 0.0f;
                                    precise float sumValue261 = productValue316 + 0.0f;
                                    float intermediateValue376;
                                    float intermediateValue377;
                                    if (productValue308)
                                    {
                                        uint bitwiseValue165 = comparisonValue55 >> 15u;
                                        precise float bitwiseValue166 = float(bitwiseValue165 & 1u) * 2.0f;
                                        precise float sumValue262 = bitwiseValue166 + (-1.0f);
                                        precise float bitwiseValue167 = float(comparisonValue55 >> 31u) * 2.0f;
                                        precise float sumValue263 = bitwiseValue167 + (-1.0f);
                                        precise float bitwiseValue168 = float((comparisonValue55 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue169 = float(bitwiseValue165 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue317 = sumValue262 * 3.0517578125e-05f;
                                        precise float productValue318 = sumValue263 * 3.0517578125e-05f;
                                        precise float sumValue264 = bitwiseValue168 + productValue317;
                                        precise float sumValue265 = bitwiseValue169 + productValue318;
                                        intermediateValue376 = sumValue264;
                                        intermediateValue377 = sumValue265;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue170 = float(comparisonValue55 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue171 = float(comparisonValue55 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue319 = bitwiseValue170 * 16384.0f;
                                        precise float sumValue266 = productValue319 + 0.5f;
                                        precise float productValue320 = bitwiseValue171 * 16384.0f;
                                        precise float sumValue267 = productValue320 + 0.5f;
                                        precise float productValue321 = floor(sumValue266) * 6.103515625e-05f;
                                        precise float productValue322 = floor(sumValue267) * 6.103515625e-05f;
                                        intermediateValue376 = productValue321;
                                        intermediateValue377 = productValue322;
                                    }
                                    precise float productValue323 = vectorValue12.x * intermediateValue376;
                                    precise float productValue324 = vectorValue12.x * intermediateValue377;
                                    precise float sumValue268 = sumValue260 + productValue323;
                                    precise float sumValue269 = sumValue261 + productValue324;
                                    float intermediateValue382;
                                    float intermediateValue383;
                                    if (productValue308)
                                    {
                                        uint bitwiseValue172 = comparisonValue54 >> 15u;
                                        precise float bitwiseValue173 = float(bitwiseValue172 & 1u) * 2.0f;
                                        precise float sumValue270 = bitwiseValue173 + (-1.0f);
                                        precise float bitwiseValue174 = float(comparisonValue54 >> 31u) * 2.0f;
                                        precise float sumValue271 = bitwiseValue174 + (-1.0f);
                                        precise float bitwiseValue175 = float((comparisonValue54 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue176 = float(bitwiseValue172 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue325 = sumValue270 * 3.0517578125e-05f;
                                        precise float productValue326 = sumValue271 * 3.0517578125e-05f;
                                        precise float sumValue272 = bitwiseValue175 + productValue325;
                                        precise float sumValue273 = bitwiseValue176 + productValue326;
                                        intermediateValue382 = sumValue272;
                                        intermediateValue383 = sumValue273;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue177 = float(comparisonValue54 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue178 = float(comparisonValue54 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue327 = bitwiseValue177 * 16384.0f;
                                        precise float sumValue274 = productValue327 + 0.5f;
                                        precise float productValue328 = bitwiseValue178 * 16384.0f;
                                        precise float sumValue275 = productValue328 + 0.5f;
                                        precise float productValue329 = floor(sumValue274) * 6.103515625e-05f;
                                        precise float productValue330 = floor(sumValue275) * 6.103515625e-05f;
                                        intermediateValue382 = productValue329;
                                        intermediateValue383 = productValue330;
                                    }
                                    precise float productValue331 = vectorValue13.y * intermediateValue382;
                                    precise float productValue332 = vectorValue13.y * intermediateValue383;
                                    precise float sumValue276 = sumValue268 + productValue331;
                                    precise float sumValue277 = sumValue269 + productValue332;
                                    precise float productValue333 = scalarValue114 * 0.083333335816860198974609375f;
                                    precise float sumValue278 = productValue333 + (-0.25f);
                                    float intermediateValue388;
                                    float intermediateValue389;
                                    float intermediateValue390;
                                    float intermediateValue391;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue305 * 2 + 0) == 65535u)
                                    {
                                        intermediateValue388 = 1.0f;
                                        intermediateValue389 = 1.0f;
                                        intermediateValue390 = 1.0f;
                                        intermediateValue391 = 1.0f;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits34;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue305 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits34 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits34 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue305 * 2 + 0));
                                        }
                                        float4 sampledTextureValue8 = textures[NonUniformResourceIndex(reinterpretedBits34 + 0u)].SampleLevel(defaultSampler, float2(sumValue276, sumValue277), min(sumValue278, 2.0f));
                                        intermediateValue388 = sampledTextureValue8.x;
                                        intermediateValue389 = sampledTextureValue8.y;
                                        intermediateValue390 = sampledTextureValue8.z;
                                        intermediateValue391 = sampledTextureValue8.w;
                                    }
                                    float intermediateValue398;
                                    float intermediateValue399;
                                    float intermediateValue400;
                                    if (scalarValue116 == 2u)
                                    {
                                        float branchMergedValue42;
                                        float branchMergedValue72;
                                        float branchMergedValue73;
                                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue306 * 2 + 0) & 128u) == 0u)
                                        {
                                            float intermediateValue408;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue306 * 2 + 0) & 2048u) == 0u)
                                            {
                                                intermediateValue408 = intermediateValue391;
                                            }
                                            else
                                            {
                                                precise float productValue334 = intermediateValue391 * 2.0f;
                                                precise float sumValue279 = productValue334 + (-1.0f);
                                                intermediateValue408 = clamp(sumValue279, 0.0f, 1.0f);
                                            }
                                            precise float sumValue280 = 0.0f - intermediateValue388;
                                            precise float sumValue281 = 0.0f - intermediateValue389;
                                            precise float sumValue282 = 0.0f - intermediateValue390;
                                            precise float productValue335 = sumValue280 * intermediateValue408;
                                            precise float productValue336 = sumValue281 * intermediateValue408;
                                            precise float productValue337 = sumValue282 * intermediateValue408;
                                            precise float sumValue283 = intermediateValue388 + productValue335;
                                            precise float sumValue284 = intermediateValue389 + productValue336;
                                            precise float sumValue285 = intermediateValue390 + productValue337;
                                            branchMergedValue42 = sumValue283;
                                            branchMergedValue72 = sumValue284;
                                            branchMergedValue73 = sumValue285;
                                        }
                                        else
                                        {
                                            branchMergedValue42 = 0.33399999141693115234375f;
                                            branchMergedValue72 = 0.33399999141693115234375f;
                                            branchMergedValue73 = 0.33399999141693115234375f;
                                        }
                                        intermediateValue398 = branchMergedValue42;
                                        intermediateValue399 = branchMergedValue72;
                                        intermediateValue400 = branchMergedValue73;
                                    }
                                    else
                                    {
                                        precise float sumValue286 = 1.0f - intermediateValue391;
                                        intermediateValue398 = sumValue286;
                                        intermediateValue399 = sumValue286;
                                        intermediateValue400 = sumValue286;
                                    }
                                    precise float productValue338 = scalarValue110 * intermediateValue398;
                                    precise float productValue339 = scalarValue111 * intermediateValue399;
                                    precise float productValue340 = scalarValue112 * intermediateValue400;
                                    float intermediateValue331;
                                    float intermediateValue332;
                                    float intermediateValue333;
                                    bool intermediateValue409;
                                    if (!(dot(float3(productValue338, productValue339, productValue340), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                    {
                                        intermediateValue409 = false;
                                        intermediateValue331 = productValue338;
                                        intermediateValue332 = productValue339;
                                        intermediateValue333 = productValue340;
                                    }
                                    else
                                    {
                                        intermediateValue409 = true;
                                        intermediateValue331 = 0.0f;
                                        intermediateValue332 = 0.0f;
                                        intermediateValue333 = 0.0f;
                                    }
                                    float branchMergedValue82;
                                    float branchMergedValue94;
                                    float branchMergedValue95;
                                    if (intermediateValue409)
                                    {
                                        intermediateValue285.CommitNonOpaqueTriangleHit();
                                        branchMergedValue82 = intermediateValue333;
                                        branchMergedValue94 = intermediateValue332;
                                        branchMergedValue95 = intermediateValue331;
                                    }
                                    else
                                    {
                                        branchMergedValue82 = intermediateValue333;
                                        branchMergedValue94 = intermediateValue332;
                                        branchMergedValue95 = intermediateValue331;
                                    }
                                    branchMergedValue1 = branchMergedValue82;
                                    branchMergedValue13 = branchMergedValue94;
                                    branchMergedValue14 = branchMergedValue95;
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue112;
                                    branchMergedValue13 = scalarValue111;
                                    branchMergedValue14 = scalarValue110;
                                }
                                intermediateValue297 = branchMergedValue1;
                                intermediateValue295 = branchMergedValue13;
                                intermediateValue293 = branchMergedValue14;
                                bool conditionValue9 = intermediateValue285.Proceed();
                                if (conditionValue9)
                                {
                                    scalarValue110 = intermediateValue293;
                                    scalarValue111 = intermediateValue295;
                                    scalarValue112 = intermediateValue297;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            intermediateValue292 = intermediateValue293;
                            intermediateValue294 = intermediateValue295;
                            intermediateValue296 = intermediateValue297;
                        }
                        else
                        {
                            intermediateValue292 = exponentialValue4;
                            intermediateValue294 = exponentialValue5;
                            intermediateValue296 = exponentialValue6;
                        }
                        uint scalarValue118 = intermediateValue285.CommittedStatus();
                        bool comparisonValue57 = scalarValue118 == 1u;
                        float comparisonValue58 = comparisonValue57 ? 0.0f : intermediateValue292;
                        float comparisonValue59 = comparisonValue57 ? 0.0f : intermediateValue294;
                        float comparisonValue62 = comparisonValue57 ? 0.0f : intermediateValue296;
                        float branchMergedValue119;
                        float branchMergedValue129;
                        float branchMergedValue130;
                        if (dot(float3(comparisonValue58, comparisonValue59, comparisonValue62), 1.0f.xxx) > 0.00999999977648258209228515625f)
                        {
                            RayDesc _12ident = {float3(sumValue236, mad(viewCbConstants[53u].y, intermediateValue275, reinterpretedBits18), sumValue237), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                            intermediateValue316.TraceRayInline(intermediateValue, 512u, 223u, _12ident);
                            bool conditionValue10 = intermediateValue316.Proceed();
                            float intermediateValue335;
                            float intermediateValue337;
                            float intermediateValue339;
                            if (conditionValue10)
                            {
                                float intermediateValue336;
                                float intermediateValue338;
                                float intermediateValue340;
                                float scalarValue119 = comparisonValue58;
                                float scalarValue120 = comparisonValue59;
                                float scalarValue121 = comparisonValue62;
                                bool comparisonValue71;
                                for (;;)
                                {
                                    uint scalarValue122 = intermediateValue316.CandidateType();
                                    comparisonValue71 = scalarValue122 == 0u;
                                    float branchMergedValue3;
                                    float branchMergedValue17;
                                    float branchMergedValue18;
                                    if (comparisonValue71)
                                    {
                                        float2 vectorValue14 = intermediateValue316.CandidateTriangleBarycentrics();
                                        float2 vectorValue15 = intermediateValue316.CandidateTriangleBarycentrics();
                                        float scalarValue123 = intermediateValue316.CandidateTriangleRayT();
                                        uint scalarValue124 = intermediateValue316.CandidatePrimitiveIndex();
                                        uint scalarValue125 = intermediateValue316.CandidateInstanceID();
                                        uint scalarValue126 = intermediateValue316.CandidateInstanceIndex();
                                        uint productValue341 = (scalarValue126 * 76u) + 58u;
                                        uint productValue342 = (scalarValue126 * 76u) + 61u;
                                        precise float sumValue287 = 1.0f - vectorValue14.x;
                                        precise float sumValue288 = sumValue287 - vectorValue15.y;
                                        uint bitwiseValue179 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue126 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue124 >> 1u);
                                        uint productValue343 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue126 * 76u) + 54u) * 2 + 0)) + 0u;
                                        bool comparisonValue63 = (scalarValue124 & 1u) == 0u;
                                        uint comparisonValue64 = comparisonValue63 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue343), bitwiseValue179 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue343), bitwiseValue179 * 16 + 0).x;
                                        uint comparisonValue65 = comparisonValue63 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue343), bitwiseValue179 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue343), bitwiseValue179 * 16 + 0).w;
                                        uint comparisonValue66 = comparisonValue63 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue343), bitwiseValue179 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue343), bitwiseValue179 * 16 + 0).z;
                                        bool productValue344 = rdByteLoad_objectInstances_uint16_t(0u, productValue342 * 2 + 0) < 0u;
                                        float intermediateValue378;
                                        float intermediateValue379;
                                        if (productValue344)
                                        {
                                            uint bitwiseValue180 = comparisonValue66 >> 15u;
                                            precise float bitwiseValue181 = float(bitwiseValue180 & 1u) * 2.0f;
                                            precise float sumValue289 = bitwiseValue181 + (-1.0f);
                                            precise float bitwiseValue182 = float(comparisonValue66 >> 31u) * 2.0f;
                                            precise float sumValue290 = bitwiseValue182 + (-1.0f);
                                            precise float bitwiseValue183 = float((comparisonValue66 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue184 = float(bitwiseValue180 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue345 = sumValue289 * 3.0517578125e-05f;
                                            precise float productValue346 = sumValue290 * 3.0517578125e-05f;
                                            precise float sumValue291 = bitwiseValue183 + productValue345;
                                            precise float sumValue292 = bitwiseValue184 + productValue346;
                                            intermediateValue378 = sumValue291;
                                            intermediateValue379 = sumValue292;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue185 = float(comparisonValue66 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue186 = float(comparisonValue66 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue347 = bitwiseValue185 * 16384.0f;
                                            precise float sumValue293 = productValue347 + 0.5f;
                                            precise float productValue348 = bitwiseValue186 * 16384.0f;
                                            precise float sumValue294 = productValue348 + 0.5f;
                                            precise float productValue349 = floor(sumValue293) * 6.103515625e-05f;
                                            precise float productValue350 = floor(sumValue294) * 6.103515625e-05f;
                                            intermediateValue378 = productValue349;
                                            intermediateValue379 = productValue350;
                                        }
                                        precise float productValue351 = sumValue288 * intermediateValue378;
                                        precise float productValue352 = sumValue288 * intermediateValue379;
                                        precise float sumValue295 = productValue351 + 0.0f;
                                        precise float sumValue296 = productValue352 + 0.0f;
                                        float intermediateValue384;
                                        float intermediateValue385;
                                        if (productValue344)
                                        {
                                            uint bitwiseValue187 = comparisonValue65 >> 15u;
                                            precise float bitwiseValue188 = float(bitwiseValue187 & 1u) * 2.0f;
                                            precise float sumValue297 = bitwiseValue188 + (-1.0f);
                                            precise float bitwiseValue189 = float(comparisonValue65 >> 31u) * 2.0f;
                                            precise float sumValue298 = bitwiseValue189 + (-1.0f);
                                            precise float bitwiseValue190 = float((comparisonValue65 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue191 = float(bitwiseValue187 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue353 = sumValue297 * 3.0517578125e-05f;
                                            precise float productValue354 = sumValue298 * 3.0517578125e-05f;
                                            precise float sumValue299 = bitwiseValue190 + productValue353;
                                            precise float sumValue300 = bitwiseValue191 + productValue354;
                                            intermediateValue384 = sumValue299;
                                            intermediateValue385 = sumValue300;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue192 = float(comparisonValue65 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue193 = float(comparisonValue65 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue355 = bitwiseValue192 * 16384.0f;
                                            precise float sumValue301 = productValue355 + 0.5f;
                                            precise float productValue356 = bitwiseValue193 * 16384.0f;
                                            precise float sumValue302 = productValue356 + 0.5f;
                                            precise float productValue357 = floor(sumValue301) * 6.103515625e-05f;
                                            precise float productValue358 = floor(sumValue302) * 6.103515625e-05f;
                                            intermediateValue384 = productValue357;
                                            intermediateValue385 = productValue358;
                                        }
                                        precise float productValue359 = vectorValue14.x * intermediateValue384;
                                        precise float productValue360 = vectorValue14.x * intermediateValue385;
                                        precise float sumValue303 = sumValue295 + productValue359;
                                        precise float sumValue304 = sumValue296 + productValue360;
                                        float intermediateValue396;
                                        float intermediateValue397;
                                        if (productValue344)
                                        {
                                            uint bitwiseValue194 = comparisonValue64 >> 15u;
                                            precise float bitwiseValue195 = float(bitwiseValue194 & 1u) * 2.0f;
                                            precise float sumValue305 = bitwiseValue195 + (-1.0f);
                                            precise float bitwiseValue196 = float(comparisonValue64 >> 31u) * 2.0f;
                                            precise float sumValue306 = bitwiseValue196 + (-1.0f);
                                            precise float bitwiseValue197 = float((comparisonValue64 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue198 = float(bitwiseValue194 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue361 = sumValue305 * 3.0517578125e-05f;
                                            precise float productValue362 = sumValue306 * 3.0517578125e-05f;
                                            precise float sumValue307 = bitwiseValue197 + productValue361;
                                            precise float sumValue308 = bitwiseValue198 + productValue362;
                                            intermediateValue396 = sumValue307;
                                            intermediateValue397 = sumValue308;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue199 = float(comparisonValue64 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue200 = float(comparisonValue64 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue363 = bitwiseValue199 * 16384.0f;
                                            precise float sumValue309 = productValue363 + 0.5f;
                                            precise float productValue364 = bitwiseValue200 * 16384.0f;
                                            precise float sumValue310 = productValue364 + 0.5f;
                                            precise float productValue365 = floor(sumValue309) * 6.103515625e-05f;
                                            precise float productValue366 = floor(sumValue310) * 6.103515625e-05f;
                                            intermediateValue396 = productValue365;
                                            intermediateValue397 = productValue366;
                                        }
                                        precise float productValue367 = vectorValue15.y * intermediateValue396;
                                        precise float productValue368 = vectorValue15.y * intermediateValue397;
                                        precise float sumValue311 = sumValue303 + productValue367;
                                        precise float sumValue312 = sumValue304 + productValue368;
                                        float intermediateValue401;
                                        float intermediateValue402;
                                        float intermediateValue403;
                                        float intermediateValue404;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue341 * 2 + 0) == 65535u)
                                        {
                                            intermediateValue401 = 1.0f;
                                            intermediateValue402 = 1.0f;
                                            intermediateValue403 = 1.0f;
                                            intermediateValue404 = 1.0f;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits36;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue341 * 2 + 0) > 4095u)
                                            {
                                                reinterpretedBits36 = asuint(viewCbConstants[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits36 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue341 * 2 + 0));
                                            }
                                            float4 sampledTextureValue9 = textures[NonUniformResourceIndex(reinterpretedBits36 + 0u)].SampleLevel(defaultSampler, float2(sumValue311, sumValue312), min(mad(scalarValue123, 0.083333335816860198974609375f, -0.25f), 2.0f));
                                            intermediateValue401 = sampledTextureValue9.x;
                                            intermediateValue402 = sampledTextureValue9.y;
                                            intermediateValue403 = sampledTextureValue9.z;
                                            intermediateValue404 = sampledTextureValue9.w;
                                        }
                                        float intermediateValue412;
                                        float intermediateValue413;
                                        float intermediateValue414;
                                        if (scalarValue125 == 2u)
                                        {
                                            float branchMergedValue44;
                                            float branchMergedValue76;
                                            float branchMergedValue77;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue342 * 2 + 0) & 128u) == 0u)
                                            {
                                                float intermediateValue415;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue342 * 2 + 0) & 2048u) == 0u)
                                                {
                                                    intermediateValue415 = intermediateValue404;
                                                }
                                                else
                                                {
                                                    intermediateValue415 = clamp(mad(intermediateValue404, 2.0f, -1.0f), 0.0f, 1.0f);
                                                }
                                                branchMergedValue44 = intermediateValue401 - (intermediateValue415 * intermediateValue401);
                                                branchMergedValue76 = intermediateValue403 - (intermediateValue415 * intermediateValue403);
                                                branchMergedValue77 = intermediateValue402 - (intermediateValue415 * intermediateValue402);
                                            }
                                            else
                                            {
                                                branchMergedValue44 = 0.33399999141693115234375f;
                                                branchMergedValue76 = 0.33399999141693115234375f;
                                                branchMergedValue77 = 0.33399999141693115234375f;
                                            }
                                            intermediateValue412 = branchMergedValue44;
                                            intermediateValue413 = branchMergedValue77;
                                            intermediateValue414 = branchMergedValue76;
                                        }
                                        else
                                        {
                                            float sumValue313 = 1.0f - intermediateValue404;
                                            intermediateValue412 = sumValue313;
                                            intermediateValue413 = sumValue313;
                                            intermediateValue414 = sumValue313;
                                        }
                                        float productValue369 = intermediateValue412 * scalarValue119;
                                        float productValue370 = intermediateValue413 * scalarValue120;
                                        float productValue371 = intermediateValue414 * scalarValue121;
                                        float intermediateValue367;
                                        float intermediateValue368;
                                        float intermediateValue369;
                                        bool intermediateValue416;
                                        if (!(dot(float3(productValue369, productValue370, productValue371), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                        {
                                            intermediateValue416 = false;
                                            intermediateValue367 = productValue369;
                                            intermediateValue368 = productValue370;
                                            intermediateValue369 = productValue371;
                                        }
                                        else
                                        {
                                            intermediateValue416 = true;
                                            intermediateValue367 = 0.0f;
                                            intermediateValue368 = 0.0f;
                                            intermediateValue369 = 0.0f;
                                        }
                                        float branchMergedValue84;
                                        float branchMergedValue98;
                                        float branchMergedValue99;
                                        if (intermediateValue416)
                                        {
                                            intermediateValue316.CommitNonOpaqueTriangleHit();
                                            branchMergedValue84 = intermediateValue369;
                                            branchMergedValue98 = intermediateValue368;
                                            branchMergedValue99 = intermediateValue367;
                                        }
                                        else
                                        {
                                            branchMergedValue84 = intermediateValue369;
                                            branchMergedValue98 = intermediateValue368;
                                            branchMergedValue99 = intermediateValue367;
                                        }
                                        branchMergedValue3 = branchMergedValue84;
                                        branchMergedValue17 = branchMergedValue98;
                                        branchMergedValue18 = branchMergedValue99;
                                    }
                                    else
                                    {
                                        branchMergedValue3 = scalarValue121;
                                        branchMergedValue17 = scalarValue120;
                                        branchMergedValue18 = scalarValue119;
                                    }
                                    intermediateValue340 = branchMergedValue3;
                                    intermediateValue338 = branchMergedValue17;
                                    intermediateValue336 = branchMergedValue18;
                                    bool conditionValue11 = intermediateValue316.Proceed();
                                    if (conditionValue11)
                                    {
                                        scalarValue119 = intermediateValue336;
                                        scalarValue120 = intermediateValue338;
                                        scalarValue121 = intermediateValue340;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue335 = intermediateValue336;
                                intermediateValue337 = intermediateValue338;
                                intermediateValue339 = intermediateValue340;
                            }
                            else
                            {
                                intermediateValue335 = comparisonValue58;
                                intermediateValue337 = comparisonValue59;
                                intermediateValue339 = comparisonValue62;
                            }
                            uint scalarValue127 = intermediateValue316.CommittedStatus();
                            bool comparisonValue67 = scalarValue127 == 1u;
                            branchMergedValue119 = comparisonValue67 ? 0.0f : intermediateValue335;
                            branchMergedValue129 = comparisonValue67 ? 0.0f : intermediateValue337;
                            branchMergedValue130 = comparisonValue67 ? 0.0f : intermediateValue339;
                        }
                        else
                        {
                            branchMergedValue119 = comparisonValue58;
                            branchMergedValue129 = comparisonValue59;
                            branchMergedValue130 = comparisonValue62;
                        }
                        branchMergedValue39 = branchMergedValue119;
                        branchMergedValue65 = branchMergedValue129;
                        branchMergedValue66 = branchMergedValue130;
                    }
                    else
                    {
                        RayDesc _13ident = {float3(reinterpretedBits16, reinterpretedBits18, reinterpretedBits19), 0.0f, float3(viewCbConstants[52u].xyz), 10000.0f};
                        intermediateValue287.TraceRayInline(intermediateValue, 512u, 223u, _13ident);
                        bool conditionValue12 = intermediateValue287.Proceed();
                        float intermediateValue299;
                        float intermediateValue301;
                        float intermediateValue303;
                        if (conditionValue12)
                        {
                            float intermediateValue300;
                            float intermediateValue302;
                            float intermediateValue304;
                            float scalarValue128 = 1.0f;
                            float scalarValue129 = 1.0f;
                            float scalarValue130 = 1.0f;
                            bool comparisonValue61;
                            for (;;)
                            {
                                uint scalarValue131 = intermediateValue287.CandidateType();
                                comparisonValue61 = scalarValue131 == 0u;
                                float branchMergedValue2;
                                float branchMergedValue15;
                                float branchMergedValue16;
                                if (comparisonValue61)
                                {
                                    float2 vectorValue16 = intermediateValue287.CandidateTriangleBarycentrics();
                                    float2 vectorValue17 = intermediateValue287.CandidateTriangleBarycentrics();
                                    float scalarValue132 = intermediateValue287.CandidateTriangleRayT();
                                    uint scalarValue133 = intermediateValue287.CandidatePrimitiveIndex();
                                    uint scalarValue134 = intermediateValue287.CandidateInstanceID();
                                    uint scalarValue135 = intermediateValue287.CandidateInstanceIndex();
                                    uint productValue372 = (scalarValue135 * 76u) + 58u;
                                    uint productValue373 = (scalarValue135 * 76u) + 61u;
                                    precise float sumValue314 = 1.0f - vectorValue16.x;
                                    precise float sumValue315 = sumValue314 - vectorValue17.y;
                                    uint bitwiseValue201 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue135 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue133 >> 1u);
                                    uint productValue374 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue135 * 76u) + 54u) * 2 + 0)) + 0u;
                                    bool comparisonValue68 = (scalarValue133 & 1u) == 0u;
                                    uint comparisonValue69 = comparisonValue68 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue374), bitwiseValue201 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue374), bitwiseValue201 * 16 + 0).x;
                                    uint comparisonValue70 = comparisonValue68 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue374), bitwiseValue201 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue374), bitwiseValue201 * 16 + 0).w;
                                    uint comparisonValue72 = comparisonValue68 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue374), bitwiseValue201 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue374), bitwiseValue201 * 16 + 0).z;
                                    bool productValue375 = rdByteLoad_objectInstances_uint16_t(0u, productValue373 * 2 + 0) < 0u;
                                    float intermediateValue371;
                                    float intermediateValue372;
                                    if (productValue375)
                                    {
                                        uint bitwiseValue202 = comparisonValue72 >> 15u;
                                        precise float bitwiseValue203 = float(bitwiseValue202 & 1u) * 2.0f;
                                        precise float sumValue316 = bitwiseValue203 + (-1.0f);
                                        precise float bitwiseValue204 = float(comparisonValue72 >> 31u) * 2.0f;
                                        precise float sumValue317 = bitwiseValue204 + (-1.0f);
                                        precise float bitwiseValue205 = float((comparisonValue72 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue206 = float(bitwiseValue202 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue376 = sumValue316 * 3.0517578125e-05f;
                                        precise float productValue377 = sumValue317 * 3.0517578125e-05f;
                                        precise float sumValue318 = bitwiseValue205 + productValue376;
                                        precise float sumValue319 = bitwiseValue206 + productValue377;
                                        intermediateValue371 = sumValue318;
                                        intermediateValue372 = sumValue319;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue207 = float(comparisonValue72 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue208 = float(comparisonValue72 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue378 = bitwiseValue207 * 16384.0f;
                                        precise float sumValue320 = productValue378 + 0.5f;
                                        precise float productValue379 = bitwiseValue208 * 16384.0f;
                                        precise float sumValue321 = productValue379 + 0.5f;
                                        precise float productValue380 = floor(sumValue320) * 6.103515625e-05f;
                                        precise float productValue381 = floor(sumValue321) * 6.103515625e-05f;
                                        intermediateValue371 = productValue380;
                                        intermediateValue372 = productValue381;
                                    }
                                    precise float productValue382 = sumValue315 * intermediateValue371;
                                    precise float productValue383 = sumValue315 * intermediateValue372;
                                    precise float sumValue322 = productValue382 + 0.0f;
                                    precise float sumValue323 = productValue383 + 0.0f;
                                    float intermediateValue380;
                                    float intermediateValue381;
                                    if (productValue375)
                                    {
                                        uint bitwiseValue209 = comparisonValue70 >> 15u;
                                        precise float bitwiseValue210 = float(bitwiseValue209 & 1u) * 2.0f;
                                        precise float sumValue324 = bitwiseValue210 + (-1.0f);
                                        precise float bitwiseValue211 = float(comparisonValue70 >> 31u) * 2.0f;
                                        precise float sumValue325 = bitwiseValue211 + (-1.0f);
                                        precise float bitwiseValue212 = float((comparisonValue70 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue213 = float(bitwiseValue209 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue384 = sumValue324 * 3.0517578125e-05f;
                                        precise float productValue385 = sumValue325 * 3.0517578125e-05f;
                                        precise float sumValue326 = bitwiseValue212 + productValue384;
                                        precise float sumValue327 = bitwiseValue213 + productValue385;
                                        intermediateValue380 = sumValue326;
                                        intermediateValue381 = sumValue327;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue214 = float(comparisonValue70 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue215 = float(comparisonValue70 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue386 = bitwiseValue214 * 16384.0f;
                                        precise float sumValue328 = productValue386 + 0.5f;
                                        precise float productValue387 = bitwiseValue215 * 16384.0f;
                                        precise float sumValue329 = productValue387 + 0.5f;
                                        precise float productValue388 = floor(sumValue328) * 6.103515625e-05f;
                                        precise float productValue389 = floor(sumValue329) * 6.103515625e-05f;
                                        intermediateValue380 = productValue388;
                                        intermediateValue381 = productValue389;
                                    }
                                    precise float productValue390 = vectorValue16.x * intermediateValue380;
                                    precise float productValue391 = vectorValue16.x * intermediateValue381;
                                    precise float sumValue330 = sumValue322 + productValue390;
                                    precise float sumValue331 = sumValue323 + productValue391;
                                    float intermediateValue386;
                                    float intermediateValue387;
                                    if (productValue375)
                                    {
                                        uint bitwiseValue216 = comparisonValue69 >> 15u;
                                        precise float bitwiseValue217 = float(bitwiseValue216 & 1u) * 2.0f;
                                        precise float sumValue332 = bitwiseValue217 + (-1.0f);
                                        precise float bitwiseValue218 = float(comparisonValue69 >> 31u) * 2.0f;
                                        precise float sumValue333 = bitwiseValue218 + (-1.0f);
                                        precise float bitwiseValue219 = float((comparisonValue69 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue220 = float(bitwiseValue216 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue392 = sumValue332 * 3.0517578125e-05f;
                                        precise float productValue393 = sumValue333 * 3.0517578125e-05f;
                                        precise float sumValue334 = bitwiseValue219 + productValue392;
                                        precise float sumValue335 = bitwiseValue220 + productValue393;
                                        intermediateValue386 = sumValue334;
                                        intermediateValue387 = sumValue335;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue221 = float(comparisonValue69 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue222 = float(comparisonValue69 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue394 = bitwiseValue221 * 16384.0f;
                                        precise float sumValue336 = productValue394 + 0.5f;
                                        precise float productValue395 = bitwiseValue222 * 16384.0f;
                                        precise float sumValue337 = productValue395 + 0.5f;
                                        precise float productValue396 = floor(sumValue336) * 6.103515625e-05f;
                                        precise float productValue397 = floor(sumValue337) * 6.103515625e-05f;
                                        intermediateValue386 = productValue396;
                                        intermediateValue387 = productValue397;
                                    }
                                    precise float productValue398 = vectorValue17.y * intermediateValue386;
                                    precise float productValue399 = vectorValue17.y * intermediateValue387;
                                    precise float sumValue338 = sumValue330 + productValue398;
                                    precise float sumValue339 = sumValue331 + productValue399;
                                    float intermediateValue392;
                                    float intermediateValue393;
                                    float intermediateValue394;
                                    float intermediateValue395;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue372 * 2 + 0) == 65535u)
                                    {
                                        intermediateValue392 = 1.0f;
                                        intermediateValue393 = 1.0f;
                                        intermediateValue394 = 1.0f;
                                        intermediateValue395 = 1.0f;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits35;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue372 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits35 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits35 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue372 * 2 + 0));
                                        }
                                        float4 sampledTextureValue10 = textures[NonUniformResourceIndex(reinterpretedBits35 + 0u)].SampleLevel(defaultSampler, float2(sumValue338, sumValue339), min(mad(scalarValue132, 0.083333335816860198974609375f, -0.25f), 2.0f));
                                        intermediateValue392 = sampledTextureValue10.x;
                                        intermediateValue393 = sampledTextureValue10.y;
                                        intermediateValue394 = sampledTextureValue10.z;
                                        intermediateValue395 = sampledTextureValue10.w;
                                    }
                                    float intermediateValue405;
                                    float intermediateValue406;
                                    float intermediateValue407;
                                    if (scalarValue134 == 2u)
                                    {
                                        float branchMergedValue43;
                                        float branchMergedValue74;
                                        float branchMergedValue75;
                                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue373 * 2 + 0) & 128u) == 0u)
                                        {
                                            float intermediateValue410;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue373 * 2 + 0) & 2048u) == 0u)
                                            {
                                                intermediateValue410 = intermediateValue395;
                                            }
                                            else
                                            {
                                                intermediateValue410 = clamp(mad(intermediateValue395, 2.0f, -1.0f), 0.0f, 1.0f);
                                            }
                                            branchMergedValue43 = intermediateValue392 - (intermediateValue410 * intermediateValue392);
                                            branchMergedValue74 = intermediateValue394 - (intermediateValue410 * intermediateValue394);
                                            branchMergedValue75 = intermediateValue393 - (intermediateValue410 * intermediateValue393);
                                        }
                                        else
                                        {
                                            branchMergedValue43 = 0.33399999141693115234375f;
                                            branchMergedValue74 = 0.33399999141693115234375f;
                                            branchMergedValue75 = 0.33399999141693115234375f;
                                        }
                                        intermediateValue405 = branchMergedValue43;
                                        intermediateValue406 = branchMergedValue75;
                                        intermediateValue407 = branchMergedValue74;
                                    }
                                    else
                                    {
                                        float sumValue340 = 1.0f - intermediateValue395;
                                        intermediateValue405 = sumValue340;
                                        intermediateValue406 = sumValue340;
                                        intermediateValue407 = sumValue340;
                                    }
                                    float productValue400 = intermediateValue405 * scalarValue128;
                                    float productValue401 = intermediateValue406 * scalarValue129;
                                    float productValue402 = intermediateValue407 * scalarValue130;
                                    float intermediateValue348;
                                    float intermediateValue349;
                                    float intermediateValue350;
                                    bool intermediateValue411;
                                    if (!(dot(float3(productValue400, productValue401, productValue402), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                    {
                                        intermediateValue411 = false;
                                        intermediateValue348 = productValue400;
                                        intermediateValue349 = productValue401;
                                        intermediateValue350 = productValue402;
                                    }
                                    else
                                    {
                                        intermediateValue411 = true;
                                        intermediateValue348 = 0.0f;
                                        intermediateValue349 = 0.0f;
                                        intermediateValue350 = 0.0f;
                                    }
                                    float branchMergedValue83;
                                    float branchMergedValue96;
                                    float branchMergedValue97;
                                    if (intermediateValue411)
                                    {
                                        intermediateValue287.CommitNonOpaqueTriangleHit();
                                        branchMergedValue83 = intermediateValue349;
                                        branchMergedValue96 = intermediateValue348;
                                        branchMergedValue97 = intermediateValue350;
                                    }
                                    else
                                    {
                                        branchMergedValue83 = intermediateValue349;
                                        branchMergedValue96 = intermediateValue348;
                                        branchMergedValue97 = intermediateValue350;
                                    }
                                    branchMergedValue2 = branchMergedValue83;
                                    branchMergedValue15 = branchMergedValue96;
                                    branchMergedValue16 = branchMergedValue97;
                                }
                                else
                                {
                                    branchMergedValue2 = scalarValue129;
                                    branchMergedValue15 = scalarValue128;
                                    branchMergedValue16 = scalarValue130;
                                }
                                intermediateValue302 = branchMergedValue2;
                                intermediateValue300 = branchMergedValue15;
                                intermediateValue304 = branchMergedValue16;
                                bool conditionValue13 = intermediateValue287.Proceed();
                                if (conditionValue13)
                                {
                                    scalarValue128 = intermediateValue300;
                                    scalarValue129 = intermediateValue302;
                                    scalarValue130 = intermediateValue304;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            intermediateValue299 = intermediateValue300;
                            intermediateValue301 = intermediateValue302;
                            intermediateValue303 = intermediateValue304;
                        }
                        else
                        {
                            intermediateValue299 = 1.0f;
                            intermediateValue301 = 1.0f;
                            intermediateValue303 = 1.0f;
                        }
                        uint scalarValue136 = intermediateValue287.CommittedStatus();
                        bool comparisonValue73 = scalarValue136 == 1u;
                        branchMergedValue39 = comparisonValue73 ? 0.0f : intermediateValue299;
                        branchMergedValue65 = comparisonValue73 ? 0.0f : intermediateValue301;
                        branchMergedValue66 = comparisonValue73 ? 0.0f : intermediateValue303;
                    }
                    intermediateValue257 = branchMergedValue39;
                    intermediateValue258 = branchMergedValue65;
                    intermediateValue259 = branchMergedValue66;
                }
                float branchMergedValue117;
                float branchMergedValue121;
                float branchMergedValue122;
                float branchMergedValue123;
                float branchMergedValue124;
                float branchMergedValue125;
                float branchMergedValue126;
                if (dot(float3(intermediateValue257, intermediateValue258, intermediateValue259), 1.0f.xxx) > 0.0f)
                {
                    float sumValue341 = (-0.0f) - intermediateValue65;
                    float sumValue342 = (-0.0f) - intermediateValue67;
                    float sumValue343 = (-0.0f) - intermediateValue69;
                    float scalarValue137 = max(intermediateValue214, 0.00999999977648258209228515625f);
                    float sumValue344 = viewCbConstants[52u].x - intermediateValue65;
                    float sumValue345 = viewCbConstants[52u].y - intermediateValue67;
                    float sumValue346 = viewCbConstants[52u].z - intermediateValue69;
                    float inverseLengthValue2 = rsqrt(dot(float3(sumValue344, sumValue345, sumValue346), float3(sumValue344, sumValue345, sumValue346)));
                    float productValue403 = inverseLengthValue2 * sumValue344;
                    float productValue404 = inverseLengthValue2 * sumValue345;
                    float productValue405 = inverseLengthValue2 * sumValue346;
                    float clampedValue = clamp(dot(float3(intermediateValue38, intermediateValue40, intermediateValue42), float3(viewCbConstants[52u].xyz)), 0.0f, 1.0f);
                    float clampedValue1 = clamp(dot(float3(intermediateValue38, intermediateValue40, intermediateValue42), float3(sumValue341, sumValue342, sumValue343)), 0.0f, 1.0f);
                    float clampedValue2 = clamp(dot(float3(intermediateValue38, intermediateValue40, intermediateValue42), float3(productValue403, productValue404, productValue405)), 0.0f, 1.0f);
                    float clampedValue3 = clamp(dot(float3(sumValue341, sumValue342, sumValue343), float3(productValue403, productValue404, productValue405)), 0.0f, 1.0f);
                    float productValue406 = scalarValue137 * scalarValue137;
                    float productValue407 = productValue406 * productValue406;
                    float productValue408 = (((clampedValue2 * productValue407) - clampedValue2) * clampedValue2) + 1.0f;
                    float productValue409 = productValue406 * 0.5f;
                    float sumValue347 = 1.0f - productValue409;
                    float clampedValue4 = clamp(dot(float3(intermediateValue218, intermediateValue219, intermediateValue220), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
                    float clampedValue5 = exp2(log2(clamp(1.0f - clampedValue3, 0.0f, 1.0f)) * 5.0f);
                    float productValue410 = (clampedValue5 * (clampedValue4 - intermediateValue218)) + intermediateValue218;
                    float productValue411 = (clampedValue5 * (clampedValue4 - intermediateValue219)) + intermediateValue219;
                    float productValue412 = (clampedValue5 * (clampedValue4 - intermediateValue220)) + intermediateValue220;
                    float productValue413 = ((clampedValue3 * clampedValue3) * (scalarValue137 * 2.0f)) + (-0.5f);
                    float clampedValue6 = (((exp2(log2(clamp(1.0f - clampedValue1, 0.0f, 1.0f)) * 5.0f) * productValue413) + 1.0f) * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue, 0.0f, 1.0f)) * 5.0f) * productValue413) + 1.0f);
                    float quotientValue2 = ((productValue407 / ((productValue408 * productValue408) + 1.0000000133514319600180897396058e-10f)) * 0.3183098733425140380859375f) * (0.25f / ((((clampedValue1 * sumValue347) + productValue409) * ((clampedValue * sumValue347) + productValue409)) + 1.0000000133514319600180897396058e-10f));
                    branchMergedValue117 = (((viewCbConstants[50u].x * intermediateValue257) * clampedValue) * ((((1.0f - productValue410) * intermediateValue221) * clampedValue6) + (productValue410 * quotientValue2))) + productValue249;
                    branchMergedValue121 = (((viewCbConstants[50u].z * intermediateValue259) * clampedValue) * ((((1.0f - productValue412) * intermediateValue223) * clampedValue6) + (productValue412 * quotientValue2))) + productValue251;
                    branchMergedValue122 = 1.0f;
                    branchMergedValue123 = 0.0f;
                    branchMergedValue124 = 0.0f;
                    branchMergedValue125 = 0.0f;
                    branchMergedValue126 = (((viewCbConstants[50u].y * intermediateValue258) * clampedValue) * ((((1.0f - productValue411) * intermediateValue222) * clampedValue6) + (productValue411 * quotientValue2))) + productValue250;
                }
                else
                {
                    branchMergedValue117 = productValue249;
                    branchMergedValue121 = productValue251;
                    branchMergedValue122 = 1.0f;
                    branchMergedValue123 = 0.0f;
                    branchMergedValue124 = 0.0f;
                    branchMergedValue125 = 0.0f;
                    branchMergedValue126 = productValue250;
                }
                branchMergedValue36 = branchMergedValue117;
                branchMergedValue48 = branchMergedValue121;
                branchMergedValue49 = branchMergedValue122;
                branchMergedValue50 = branchMergedValue123;
                branchMergedValue51 = branchMergedValue124;
                branchMergedValue52 = branchMergedValue125;
                branchMergedValue53 = branchMergedValue126;
            }
            else
            {
                branchMergedValue36 = 0.0f;
                branchMergedValue48 = 0.0f;
                branchMergedValue49 = 0.0f;
                branchMergedValue50 = intermediateValue187;
                branchMergedValue51 = intermediateValue189;
                branchMergedValue52 = intermediateValue191;
                branchMergedValue53 = 0.0f;
            }
            intermediateValue182 = branchMergedValue36;
            intermediateValue183 = branchMergedValue53;
            intermediateValue184 = branchMergedValue48;
            intermediateValue185 = branchMergedValue49;
            intermediateValue186 = branchMergedValue50;
            intermediateValue188 = branchMergedValue51;
            intermediateValue190 = branchMergedValue52;
        }
        else
        {
            intermediateValue182 = 0.0f;
            intermediateValue183 = 0.0f;
            intermediateValue184 = 0.0f;
            intermediateValue185 = 0.0f;
            intermediateValue186 = 0.0f;
            intermediateValue188 = 0.0f;
            intermediateValue190 = 0.0f;
        }
        float multiplyAddValue;
        if (comparisonValue10 > 0.0f)
        {
            multiplyAddValue = (1.0f - clamp(mad(comparisonValue10, viewCbConstants[51u].x, viewCbConstants[51u].y), 0.0f, 1.0f)) * intermediateValue185;
        }
        else
        {
            multiplyAddValue = intermediateValue185;
        }
        uint4 reinterpretedBits20 = asuint(viewCbConstants[76u]);
        uint scalarValue138 = reinterpretedBits20.w;
        float intermediateValue205;
        float intermediateValue206;
        float intermediateValue207;
        if (scalarValue138 == 1u)
        {
            intermediateValue205 = viewCbConstants[58u].x;
            intermediateValue206 = viewCbConstants[58u].y;
            intermediateValue207 = viewCbConstants[58u].z;
        }
        else
        {
            float branchMergedValue37;
            float branchMergedValue54;
            float branchMergedValue55;
            if (scalarValue138 == 2u)
            {
                uint4 vectorValue18 = asuint(viewCbConstants[74u]);
                uint scalarValue139 = vectorValue18.z;
                uint reinterpretedBits22;
                if (scalarValue139 > 4095u)
                {
                    reinterpretedBits22 = asuint(viewCbConstants[98u]).w;
                }
                else
                {
                    reinterpretedBits22 = scalarValue139;
                }
                float scalarValue140 = abs(intermediateValue65);
                float scalarValue141 = abs(intermediateValue67);
                float scalarValue142 = abs(intermediateValue69);
                float intermediateValue262;
                float comparisonValue51;
                float sumValue187;
                if ((scalarValue140 >= scalarValue141) && (scalarValue140 >= scalarValue142))
                {
                    intermediateValue262 = scalarValue140;
                    comparisonValue51 = (intermediateValue65 < 0.0f) ? ((-0.0f) - intermediateValue69) : intermediateValue69;
                    sumValue187 = (-0.0f) - intermediateValue67;
                }
                else
                {
                    float sumValue348 = (-0.0f) - intermediateValue65;
                    float branchMergedValue40;
                    float branchMergedValue67;
                    float branchMergedValue68;
                    if (!(scalarValue141 >= scalarValue142))
                    {
                        branchMergedValue40 = scalarValue142;
                        branchMergedValue67 = (intermediateValue69 < 0.0f) ? intermediateValue65 : sumValue348;
                        branchMergedValue68 = (-0.0f) - intermediateValue67;
                    }
                    else
                    {
                        branchMergedValue40 = scalarValue141;
                        branchMergedValue67 = sumValue348;
                        branchMergedValue68 = (intermediateValue67 < 0.0f) ? ((-0.0f) - intermediateValue69) : intermediateValue69;
                    }
                    intermediateValue262 = branchMergedValue40;
                    comparisonValue51 = branchMergedValue67;
                    sumValue187 = branchMergedValue68;
                }
                precise float quotientValue3 = 0.5f / intermediateValue262;
                float4 sampledTextureValue11 = textures[NonUniformResourceIndex(reinterpretedBits22 + 0u)].SampleLevel(linearSampler, float2(frac(mad(comparisonValue51, quotientValue3, 0.5f) * viewCbConstants[74u].x), frac(mad(sumValue187, quotientValue3, 0.5f) * viewCbConstants[74u].y)), 0.0f);
                branchMergedValue37 = (viewCbConstants[58u].z * sampledTextureValue11.z) * viewCbConstants[97u].w;
                branchMergedValue54 = (viewCbConstants[58u].x * sampledTextureValue11.x) * viewCbConstants[97u].w;
                branchMergedValue55 = (viewCbConstants[58u].y * sampledTextureValue11.y) * viewCbConstants[97u].w;
            }
            else
            {
                float branchMergedValue118;
                float branchMergedValue127;
                float branchMergedValue128;
                if (scalarValue138 == 4u)
                {
                    float scalarValue143 = (dot(float3(intermediateValue65, intermediateValue67, intermediateValue69), float3(viewCbConstants[52u].xyz)) * 0.5f) + 0.5f;
                    branchMergedValue118 = ((viewCbConstants[75u].z - viewCbConstants[76u].z) * scalarValue143) + viewCbConstants[76u].z;
                    branchMergedValue127 = ((viewCbConstants[75u].x - viewCbConstants[76u].x) * scalarValue143) + viewCbConstants[76u].x;
                    branchMergedValue128 = ((viewCbConstants[75u].y - viewCbConstants[76u].y) * scalarValue143) + viewCbConstants[76u].y;
                }
                else
                {
                    float comparisonValue47;
                    if (abs(intermediateValue67) < 1.0f)
                    {
                        float quotientValue4 = atan(intermediateValue69 / intermediateValue65);
                        bool conditionValue14 = intermediateValue65 < 0.0f;
                        bool comparisonValue74 = intermediateValue65 == 0.0f;
                        bool comparisonValue75 = intermediateValue69 >= 0.0f;
                        bool conditionValue15 = intermediateValue69 < 0.0f;
                        comparisonValue47 = (comparisonValue74 && comparisonValue75) ? 1.57079637050628662109375f : ((comparisonValue74 && conditionValue15) ? (-1.57079637050628662109375f) : ((conditionValue14 && conditionValue15) ? (quotientValue4 + (-3.1415927410125732421875f)) : ((conditionValue14 && comparisonValue75) ? (quotientValue4 + 3.1415927410125732421875f) : quotientValue4)));
                    }
                    else
                    {
                        comparisonValue47 = 0.0f;
                    }
                    float multiplyAddValue1 = mad(abs((frac((comparisonValue47 - viewCbConstants[50u].w) * 0.15915493667125701904296875f) * 2.0f) + (-1.0f)), 0.984375f, 0.0078125f);
                    float multiplyAddValue2 = mad(0.5f - (asin(intermediateValue67) * 0.3183098733425140380859375f), 0.96875f, 0.015625f);
                    float productValue414 = viewCbConstants[51u].w * 7.0f;
                    float scalarValue144 = frac(productValue414);
                    uint scalarValue145 = uint(int(floor(productValue414)));
                    float productValue415 = float(int(scalarValue145 + 1u)) * 0.125f;
                    float scalarValue146 = frac(abs(productValue415));
                    float4 sampledTextureValue12 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue1, multiplyAddValue2, float(int(scalarValue145))), 0.0f);
                    float scalarValue147 = sampledTextureValue12.x;
                    float scalarValue148 = sampledTextureValue12.y;
                    float scalarValue149 = sampledTextureValue12.z;
                    float productValue416 = scalarValue147 * scalarValue147;
                    float productValue417 = scalarValue148 * scalarValue148;
                    float productValue418 = scalarValue149 * scalarValue149;
                    float4 sampledTextureValue13 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue1, multiplyAddValue2, float(int(uint(int(((productValue415 >= ((-0.0f) - productValue415)) ? scalarValue146 : ((-0.0f) - scalarValue146)) * 8.0f))))), 0.0f);
                    float scalarValue150 = sampledTextureValue13.x;
                    float scalarValue151 = sampledTextureValue13.y;
                    float scalarValue152 = sampledTextureValue13.z;
                    float dotProductValue3 = exp2(log2(max(dot(float3(intermediateValue65, intermediateValue67, intermediateValue69), float3(viewCbConstants[52u].xyz)), 0.0f)) * 7.0f);
                    float productValue419 = dotProductValue3 * 0.0500000007450580596923828125f;
                    float productValue420 = ((((scalarValue150 * scalarValue150) - productValue416) * scalarValue144) + productValue416) + (productValue419 * viewCbConstants[50u].x);
                    float productValue421 = ((((scalarValue151 * scalarValue151) - productValue417) * scalarValue144) + productValue417) + (productValue419 * viewCbConstants[50u].y);
                    float productValue422 = ((((scalarValue152 * scalarValue152) - productValue418) * scalarValue144) + productValue418) + (productValue419 * viewCbConstants[50u].z);
                    float productValue423 = (dotProductValue3 * 0.64999997615814208984375f) + 0.3499999940395355224609375f;
                    branchMergedValue118 = ((((viewCbConstants[58u].z * productValue423) - productValue422) * viewCbConstants[58u].w) + productValue422) * viewCbConstants[97u].w;
                    branchMergedValue127 = ((((viewCbConstants[58u].x * productValue423) - productValue420) * viewCbConstants[58u].w) + productValue420) * viewCbConstants[97u].w;
                    branchMergedValue128 = ((((viewCbConstants[58u].y * productValue423) - productValue421) * viewCbConstants[58u].w) + productValue421) * viewCbConstants[97u].w;
                }
                branchMergedValue37 = branchMergedValue118;
                branchMergedValue54 = branchMergedValue127;
                branchMergedValue55 = branchMergedValue128;
            }
            intermediateValue205 = branchMergedValue54;
            intermediateValue206 = branchMergedValue55;
            intermediateValue207 = branchMergedValue37;
        }
        float4 vectorValue19 = outputBufferEmissiveAndLinearRoughness[uint2(bitwiseValue2, bitwiseValue3)].xxxx;
        float scalarValue153 = vectorValue19.w;
        float productValue424 = vectorValue19.x + max(0.0f, ((intermediateValue205 + intermediateValue186) + ((intermediateValue182 - intermediateValue205) * multiplyAddValue)) * productValue8);
        float productValue425 = vectorValue19.y + max(0.0f, ((intermediateValue206 + intermediateValue188) + ((intermediateValue183 - intermediateValue206) * multiplyAddValue)) * productValue9);
        float productValue426 = vectorValue19.z + max(0.0f, ((intermediateValue207 + intermediateValue190) + ((intermediateValue184 - intermediateValue207) * multiplyAddValue)) * productValue10);
        uint reinterpretedBits21 = asuint(productValue424) & 2147483647u;
        uint reinterpretedBits23 = asuint(productValue425) & 2147483647u;
        uint reinterpretedBits24 = asuint(productValue426) & 2147483647u;
        uint reinterpretedBits25 = asuint(scalarValue153) & 2147483647u;
        if (((reinterpretedBits25 > 2139095040u) || ((reinterpretedBits24 > 2139095040u) || ((reinterpretedBits21 > 2139095040u) || (reinterpretedBits23 > 2139095040u)))) || ((reinterpretedBits25 == 2139095040u) || ((reinterpretedBits24 == 2139095040u) || ((reinterpretedBits21 == 2139095040u) || (reinterpretedBits23 == 2139095040u)))))
        {
            break;
        }
        outputBufferEmissiveAndLinearRoughness[uint2(bitwiseValue2, bitwiseValue3)] = float4(productValue424, productValue425, productValue426, scalarValue153).x;
        break;
    }
}
[numthreads(4, 8, 1)]
void main(ComputeStageInput stage_input)
{
    workgroupId = stage_input.workgroupId;
    localThreadId = stage_input.localThreadId;
    executeComputeStage();
}
