// RTXStub / PrimaryCheckerboardRayGenInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 31
#endif

#define RD_USE_DIVIDE_UNSIGNED_UINT_19 1
#define RD_USE_MODULO_UNSIGNED_UINT_20 1
#define RD_USE_TEXTURE_SIZE_UINT2_0 1

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
    uint4 reinterpretedBits1 = asuint(viewCbConstants[91u]);
    uint scalarValue1 = reinterpretedBits1.y;
    uint intermediateValue7;
    uint intermediateValue9;
    if (scalarValue1 == 2u)
    {
        intermediateValue7 = 0u;
        intermediateValue9 = bitwiseValue2;
    }
    else
    {
        precise float productValue = viewCbConstants[78u].x * 0.5f;
        uint scalarValue2 = uint(productValue);
        bool comparisonValue1 = bitwiseValue2 >= scalarValue2;
        uint scalarValue3 = uint(comparisonValue1);
        uint reinterpretedBits2 = (((scalarValue1 == 0u) ? asuint(viewCbConstants[84u]).z : 0u) + bitwiseValue3) & 1u;
        uint branchMergedValue10;
        uint branchMergedValue17;
        if (comparisonValue1)
        {
            branchMergedValue10 = reinterpretedBits2 | ((bitwiseValue2 - scalarValue2) << 1u);
            branchMergedValue17 = scalarValue3;
        }
        else
        {
            branchMergedValue10 = ((bitwiseValue2 << 1u) | 1u) - reinterpretedBits2;
            branchMergedValue17 = scalarValue3;
        }
        intermediateValue7 = branchMergedValue17;
        intermediateValue9 = branchMergedValue10;
    }
    bool comparisonValue2 = intermediateValue7 == 0u;
    precise float sumValue = float(intermediateValue9) + 0.5f;
    precise float sumValue1 = float(bitwiseValue3) + 0.5f;
    precise float productValue1 = sumValue * viewCbConstants[78u].z;
    precise float productValue2 = sumValue1 * viewCbConstants[78u].w;
    precise float productValue3 = productValue1 * 2.0f;
    precise float productValue4 = productValue2 * 2.0f;
    precise float sumValue2 = productValue3 + (-1.0f);
    precise float sumValue3 = 1.0f - productValue4;
    precise float productValue5 = viewCbConstants[78u].z * viewCbConstants[81u].z;
    precise float productValue6 = viewCbConstants[78u].w * viewCbConstants[81u].w;
    precise float productValue7 = productValue5 * 2.0f;
    precise float productValue8 = productValue6 * 2.0f;
    precise float sumValue4 = sumValue2 + productValue7;
    precise float sumValue5 = sumValue3 - productValue8;
    precise float productValue9 = viewCbConstants[20u].x * sumValue4;
    precise float productValue10 = sumValue5 * viewCbConstants[21u].x;
    precise float sumValue6 = productValue10 + productValue9;
    precise float productValue11 = 0.5f * viewCbConstants[22u].x;
    precise float sumValue7 = productValue11 + sumValue6;
    precise float productValue12 = 1.0f * viewCbConstants[23u].x;
    precise float sumValue8 = productValue12 + sumValue7;
    precise float productValue13 = viewCbConstants[20u].y * sumValue4;
    precise float productValue14 = sumValue5 * viewCbConstants[21u].y;
    precise float sumValue9 = productValue14 + productValue13;
    precise float productValue15 = 0.5f * viewCbConstants[22u].y;
    precise float sumValue10 = productValue15 + sumValue9;
    precise float productValue16 = 1.0f * viewCbConstants[23u].y;
    precise float sumValue11 = productValue16 + sumValue10;
    precise float productValue17 = viewCbConstants[20u].z * sumValue4;
    precise float productValue18 = sumValue5 * viewCbConstants[21u].z;
    precise float sumValue12 = productValue18 + productValue17;
    precise float productValue19 = 0.5f * viewCbConstants[22u].z;
    precise float sumValue13 = productValue19 + sumValue12;
    precise float productValue20 = 1.0f * viewCbConstants[23u].z;
    precise float sumValue14 = productValue20 + sumValue13;
    precise float productValue21 = viewCbConstants[20u].w * sumValue4;
    precise float productValue22 = sumValue5 * viewCbConstants[21u].w;
    precise float sumValue15 = productValue22 + productValue21;
    precise float productValue23 = 0.5f * viewCbConstants[22u].w;
    precise float sumValue16 = productValue23 + sumValue15;
    precise float productValue24 = 1.0f * viewCbConstants[23u].w;
    precise float sumValue17 = productValue24 + sumValue16;
    precise float quotientValue = sumValue8 / sumValue17;
    precise float quotientValue1 = sumValue11 / sumValue17;
    precise float quotientValue2 = sumValue14 / sumValue17;
    precise float sumValue18 = quotientValue - viewCbConstants[72u].x;
    precise float sumValue19 = quotientValue1 - viewCbConstants[72u].y;
    precise float sumValue20 = quotientValue2 - viewCbConstants[72u].z;
    float inverseLengthValue = rsqrt(dot(float3(sumValue18, sumValue19, sumValue20), float3(sumValue18, sumValue19, sumValue20)));
    precise float productValue25 = sumValue18 * inverseLengthValue;
    precise float productValue26 = sumValue19 * inverseLengthValue;
    precise float productValue27 = sumValue20 * inverseLengthValue;
    bool reinterpretedBits3 = asuint(viewCbConstants[54u]).w != 0u;
    uint comparisonValue3 = reinterpretedBits3 ? 0u : 2u;
    half comparisonValue4 = reinterpretedBits3 ? half(1.330078125) : half(1.0);
    float intermediateValue[2];
    uint intermediateValue1[3];
    float intermediateValue2[3];
    float intermediateValue11;
    float intermediateValue14;
    float intermediateValue16;
    float intermediateValue18;
    float intermediateValue20;
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
    uint intermediateValue48;
    float intermediateValue50;
    uint intermediateValue52;
    float intermediateValue53;
    float intermediateValue54;
    half intermediateValue55;
    half intermediateValue57;
    half intermediateValue59;
    half intermediateValue61;
    half intermediateValue63;
    half intermediateValue65;
    uint intermediateValue67;
    half intermediateValue69;
    uint intermediateValue71;
    uint intermediateValue73;
    float intermediateValue350;
    float intermediateValue351;
    for (;;)
    {
        intermediateValue11 = intermediateValue13;
        intermediateValue14 = intermediateValue13;
        intermediateValue16 = intermediateValue13;
        intermediateValue18 = intermediateValue13;
        intermediateValue20 = intermediateValue13;
        intermediateValue22 = intermediateValue13;
        intermediateValue24 = intermediateValue13;
        intermediateValue26 = intermediateValue13;
        intermediateValue28 = intermediateValue13;
        intermediateValue30 = intermediateValue13;
        intermediateValue32 = intermediateValue13;
        intermediateValue34 = intermediateValue13;
        intermediateValue36 = productValue25;
        intermediateValue38 = productValue26;
        intermediateValue40 = productValue27;
        intermediateValue42 = viewCbConstants[72u].x;
        intermediateValue44 = viewCbConstants[72u].y;
        intermediateValue46 = viewCbConstants[72u].z;
        intermediateValue48 = 0u;
        intermediateValue50 = 0.0f;
        intermediateValue52 = 0u;
        intermediateValue53 = 65504.0f;
        intermediateValue54 = 0.0f;
        intermediateValue55 = half(1.0);
        intermediateValue57 = half(1.0);
        intermediateValue59 = half(1.0);
        intermediateValue61 = half(1.0);
        intermediateValue63 = half(1.0);
        intermediateValue65 = half(1.0);
        intermediateValue67 = comparisonValue3;
        intermediateValue69 = comparisonValue4;
        intermediateValue71 = 0u;
        intermediateValue73 = 0u;
        float intermediateValue37;
        float intermediateValue39;
        float intermediateValue41;
        float intermediateValue43;
        float intermediateValue45;
        float intermediateValue47;
        float comparisonValue5;
        precise float sumValue21;
        half intermediateValue56;
        half intermediateValue58;
        half intermediateValue60;
        half intermediateValue62;
        half intermediateValue64;
        half intermediateValue66;
        uint intermediateValue68;
        half intermediateValue70;
        float intermediateValue12;
        float intermediateValue15;
        float intermediateValue17;
        float intermediateValue19;
        float intermediateValue21;
        float intermediateValue23;
        float intermediateValue25;
        float intermediateValue27;
        float intermediateValue29;
        float intermediateValue31;
        float intermediateValue33;
        float intermediateValue35;
        uint intermediateValue49;
        float intermediateValue51;
        uint bitwiseValue4;
        uint intermediateValue72;
        uint intermediateValue103;
        float multiplyAddValue;
        float multiplyAddValue1;
        float multiplyAddValue2;
        float intermediateValue116;
        float intermediateValue118;
        float intermediateValue120;
        float intermediateValue122;
        float intermediateValue123;
        float intermediateValue124;
        float intermediateValue125;
        float intermediateValue126;
        float intermediateValue127;
        float intermediateValue140;
        float intermediateValue142;
        float intermediateValue144;
        float intermediateValue152;
        float intermediateValue153;
        float intermediateValue154;
        float intermediateValue197;
        float intermediateValue199;
        float intermediateValue201;
        float intermediateValue203;
        float intermediateValue205;
        float intermediateValue207;
        bool branchMergedValue107;
        bool branchMergedValue160;
        float branchMergedValue161;
        uint branchMergedValue162;
        uint branchMergedValue163;
        uint branchMergedValue164;
        half branchMergedValue165;
        half branchMergedValue166;
        half branchMergedValue167;
        half branchMergedValue168;
        half branchMergedValue169;
        half branchMergedValue170;
        float branchMergedValue171;
        uint branchMergedValue172;
        float branchMergedValue173;
        float branchMergedValue174;
        float branchMergedValue175;
        float branchMergedValue176;
        float branchMergedValue177;
        float branchMergedValue178;
        float branchMergedValue179;
        float branchMergedValue180;
        bool comparisonValue6;
        bool comparisonValue7;
        bool comparisonValue9;
        bool intermediateValue75;
        for (;;)
        {
            comparisonValue6 = intermediateValue67 == 1u;
            comparisonValue7 = intermediateValue73 != 0u;
            uint comparisonValue8 = comparisonValue7 ? 118u : 109u;
            comparisonValue9 = intermediateValue67 == 0u;
            RayDesc _4ident = {float3(intermediateValue42, intermediateValue44, intermediateValue46), 0.0f, float3(intermediateValue36, intermediateValue38, intermediateValue40), 10000.0f};
            intermediateValue74.TraceRayInline(SceneBVH, (comparisonValue6 ? 544u : ((intermediateValue67 == 3u) ? 512u : 528u)) | 512u, comparisonValue9 ? (comparisonValue8 & 63u) : comparisonValue8, _4ident);
            intermediateValue75 = intermediateValue74.Proceed();
            if (intermediateValue75)
            {
                bool intermediateValue93;
                bool comparisonValue10;
                for (;;)
                {
                    uint scalarValue4 = intermediateValue74.CandidateType();
                    comparisonValue10 = scalarValue4 == 0u;
                    if (comparisonValue10)
                    {
                        float2 vectorValue = intermediateValue74.CandidateTriangleBarycentrics();
                        float2 vectorValue1 = intermediateValue74.CandidateTriangleBarycentrics();
                        float scalarValue5 = intermediateValue74.CandidateTriangleRayT();
                        uint scalarValue6 = intermediateValue74.CandidatePrimitiveIndex();
                        uint scalarValue7 = intermediateValue74.CandidateInstanceID();
                        uint scalarValue8 = intermediateValue74.CandidateInstanceIndex();
                        bool intermediateValue105;
                        if (scalarValue7 == 1u)
                        {
                            uint scalarValue9 = (scalarValue8 * 76u) + 58u;
                            uint productValue28 = (scalarValue8 * 76u) + 61u;
                            precise float sumValue22 = 1.0f - vectorValue.x;
                            precise float sumValue23 = sumValue22 - vectorValue1.y;
                            uint productValue29 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue8 * 76u) + 54u) * 2 + 0));
                            uint bitwiseValue7 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue8 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue6 >> 1u);
                            uint sumValue24 = productValue29 + 0u;
                            bool comparisonValue11 = (scalarValue6 & 1u) == 0u;
                            uint comparisonValue12 = comparisonValue11 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue24), bitwiseValue7 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue24), bitwiseValue7 * 16 + 0).x;
                            uint comparisonValue13 = comparisonValue11 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue24), bitwiseValue7 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue24), bitwiseValue7 * 16 + 0).w;
                            uint comparisonValue14 = comparisonValue11 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue24), bitwiseValue7 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue24), bitwiseValue7 * 16 + 0).z;
                            bool productValue30 = rdByteLoad_objectInstances_uint16_t(0u, productValue28 * 2 + 0) < 0u;
                            float intermediateValue174;
                            float intermediateValue175;
                            if (productValue30)
                            {
                                uint bitwiseValue8 = comparisonValue14 >> 15u;
                                precise float bitwiseValue9 = float(bitwiseValue8 & 1u) * 2.0f;
                                precise float sumValue25 = bitwiseValue9 + (-1.0f);
                                precise float bitwiseValue10 = float(comparisonValue14 >> 31u) * 2.0f;
                                precise float sumValue26 = bitwiseValue10 + (-1.0f);
                                precise float bitwiseValue11 = float((comparisonValue14 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue12 = float(bitwiseValue8 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue31 = sumValue25 * 3.0517578125e-05f;
                                precise float productValue32 = sumValue26 * 3.0517578125e-05f;
                                precise float sumValue27 = bitwiseValue11 + productValue31;
                                precise float sumValue28 = bitwiseValue12 + productValue32;
                                intermediateValue174 = sumValue27;
                                intermediateValue175 = sumValue28;
                            }
                            else
                            {
                                precise float bitwiseValue13 = float(comparisonValue14 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue14 = float(comparisonValue14 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue33 = bitwiseValue13 * 16384.0f;
                                precise float sumValue29 = productValue33 + 0.5f;
                                precise float productValue34 = bitwiseValue14 * 16384.0f;
                                precise float sumValue30 = productValue34 + 0.5f;
                                precise float productValue35 = floor(sumValue29) * 6.103515625e-05f;
                                precise float productValue36 = floor(sumValue30) * 6.103515625e-05f;
                                intermediateValue174 = productValue35;
                                intermediateValue175 = productValue36;
                            }
                            precise float productValue37 = sumValue23 * intermediateValue174;
                            precise float productValue38 = sumValue23 * intermediateValue175;
                            precise float sumValue31 = productValue37 + 0.0f;
                            precise float sumValue32 = productValue38 + 0.0f;
                            float intermediateValue191;
                            float intermediateValue192;
                            if (productValue30)
                            {
                                uint bitwiseValue15 = comparisonValue13 >> 15u;
                                precise float bitwiseValue16 = float(bitwiseValue15 & 1u) * 2.0f;
                                precise float sumValue33 = bitwiseValue16 + (-1.0f);
                                precise float bitwiseValue17 = float(comparisonValue13 >> 31u) * 2.0f;
                                precise float sumValue34 = bitwiseValue17 + (-1.0f);
                                precise float bitwiseValue18 = float((comparisonValue13 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue19 = float(bitwiseValue15 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue39 = sumValue33 * 3.0517578125e-05f;
                                precise float productValue40 = sumValue34 * 3.0517578125e-05f;
                                precise float sumValue35 = bitwiseValue18 + productValue39;
                                precise float sumValue36 = bitwiseValue19 + productValue40;
                                intermediateValue191 = sumValue35;
                                intermediateValue192 = sumValue36;
                            }
                            else
                            {
                                precise float bitwiseValue20 = float(comparisonValue13 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue21 = float(comparisonValue13 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue41 = bitwiseValue20 * 16384.0f;
                                precise float sumValue37 = productValue41 + 0.5f;
                                precise float productValue42 = bitwiseValue21 * 16384.0f;
                                precise float sumValue38 = productValue42 + 0.5f;
                                precise float productValue43 = floor(sumValue37) * 6.103515625e-05f;
                                precise float productValue44 = floor(sumValue38) * 6.103515625e-05f;
                                intermediateValue191 = productValue43;
                                intermediateValue192 = productValue44;
                            }
                            precise float productValue45 = vectorValue.x * intermediateValue191;
                            precise float productValue46 = vectorValue.x * intermediateValue192;
                            precise float sumValue39 = sumValue31 + productValue45;
                            precise float sumValue40 = sumValue32 + productValue46;
                            float intermediateValue246;
                            float intermediateValue247;
                            if (productValue30)
                            {
                                uint bitwiseValue22 = comparisonValue12 >> 15u;
                                precise float bitwiseValue23 = float(bitwiseValue22 & 1u) * 2.0f;
                                precise float sumValue41 = bitwiseValue23 + (-1.0f);
                                precise float bitwiseValue24 = float(comparisonValue12 >> 31u) * 2.0f;
                                precise float sumValue42 = bitwiseValue24 + (-1.0f);
                                precise float bitwiseValue25 = float((comparisonValue12 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue26 = float(bitwiseValue22 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue47 = sumValue41 * 3.0517578125e-05f;
                                precise float productValue48 = sumValue42 * 3.0517578125e-05f;
                                precise float sumValue43 = bitwiseValue25 + productValue47;
                                precise float sumValue44 = bitwiseValue26 + productValue48;
                                intermediateValue246 = sumValue43;
                                intermediateValue247 = sumValue44;
                            }
                            else
                            {
                                precise float bitwiseValue27 = float(comparisonValue12 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue28 = float(comparisonValue12 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue49 = bitwiseValue27 * 16384.0f;
                                precise float sumValue45 = productValue49 + 0.5f;
                                precise float productValue50 = bitwiseValue28 * 16384.0f;
                                precise float sumValue46 = productValue50 + 0.5f;
                                precise float productValue51 = floor(sumValue45) * 6.103515625e-05f;
                                precise float productValue52 = floor(sumValue46) * 6.103515625e-05f;
                                intermediateValue246 = productValue51;
                                intermediateValue247 = productValue52;
                            }
                            precise float productValue53 = vectorValue1.y * intermediateValue246;
                            precise float productValue54 = vectorValue1.y * intermediateValue247;
                            precise float sumValue47 = sumValue39 + productValue53;
                            precise float sumValue48 = sumValue40 + productValue54;
                            uint sumValue49 = productValue29 + 0u;
                            uint reinterpretedBits18;
                            if (rdByteLoad_objectInstances_uint16_t(0u, scalarValue9 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits18 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits18 = uint(rdByteLoad_objectInstances_uint16_t(0u, scalarValue9 * 2 + 0));
                            }
                            bool branchMergedValue16;
                            if (!(((rdByteLoad_objectInstances_uint16_t(0u, scalarValue9 * 2 + 0) != 65535u) ? textures[NonUniformResourceIndex(reinterpretedBits18 + 0u)].SampleLevel(defaultSampler, float2(sumValue47, sumValue48), min((float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue49), ((bitwiseValue7 * 8u) + 6u) * 2 + 0))) + 1.0f) + log2(abs(viewCbConstants[89u].z * scalarValue5)), float(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue49), ((bitwiseValue7 * 8u) + 7u) * 2 + 0)))).w : 1.0f) <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue28 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f)))
                            {
                                branchMergedValue16 = true;
                            }
                            else
                            {
                                branchMergedValue16 = false;
                            }
                            intermediateValue105 = branchMergedValue16;
                        }
                        else
                        {
                            intermediateValue105 = true;
                        }
                        if (intermediateValue105)
                        {
                            intermediateValue74.CommitNonOpaqueTriangleHit();
                        }
                    }
                    intermediateValue93 = intermediateValue74.Proceed();
                    if (intermediateValue93)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint scalarValue10 = intermediateValue74.CommittedStatus();
            float intermediateValue84;
            float intermediateValue85;
            float intermediateValue86;
            uint bitwiseValue5;
            if (scalarValue10 == 1u)
            {
                float2 vectorValue2 = intermediateValue74.CommittedTriangleBarycentrics();
                float2 vectorValue3 = intermediateValue74.CommittedTriangleBarycentrics();
                float scalarValue11 = intermediateValue74.CommittedRayT();
                uint scalarValue12 = intermediateValue74.CommittedPrimitiveIndex();
                uint scalarValue13 = intermediateValue74.CommittedInstanceID();
                uint scalarValue14 = intermediateValue74.CommittedInstanceIndex();
                intermediateValue84 = vectorValue2.x;
                intermediateValue85 = vectorValue3.y;
                intermediateValue86 = scalarValue11;
                bitwiseValue5 = ((scalarValue13 << 30u) | ((scalarValue12 << 14u) & 1073725440u)) | (scalarValue14 & 16383u);
            }
            else
            {
                intermediateValue84 = 0.0f;
                intermediateValue85 = 0.0f;
                intermediateValue86 = 10000.0f;
                bitwiseValue5 = 1073741823u;
            }
            float intermediateValue97;
            float intermediateValue99;
            float intermediateValue101;
            if (intermediateValue67 < 2u)
            {
                bool conditionValue = intermediateValue86 < 10000.0f;
                RayDesc _5ident = {float3(intermediateValue42, intermediateValue44, intermediateValue46), 0.0f, float3(intermediateValue36, intermediateValue38, intermediateValue40), conditionValue ? (intermediateValue86 + 0.0500000007450580596923828125f) : 10000.0f};
                intermediateValue95.TraceRayInline(SceneBVH, 512u, 32u, _5ident);
                bool conditionValue1 = intermediateValue95.Proceed();
                if (conditionValue1)
                {
                    bool intermediateValue182;
                    bool comparisonValue20;
                    for (;;)
                    {
                        uint scalarValue15 = intermediateValue95.CandidateType();
                        comparisonValue20 = scalarValue15 == 0u;
                        if (comparisonValue20)
                        {
                            float2 vectorValue4 = intermediateValue95.CandidateTriangleBarycentrics();
                            float2 vectorValue5 = intermediateValue95.CandidateTriangleBarycentrics();
                            float scalarValue16 = intermediateValue95.CandidateTriangleRayT();
                            uint scalarValue17 = intermediateValue95.CandidatePrimitiveIndex();
                            uint scalarValue18 = intermediateValue95.CandidateInstanceID();
                            uint scalarValue19 = intermediateValue95.CandidateInstanceIndex();
                            bool intermediateValue187;
                            if (scalarValue18 == 1u)
                            {
                                uint scalarValue20 = (scalarValue19 * 76u) + 58u;
                                uint productValue55 = (scalarValue19 * 76u) + 61u;
                                precise float sumValue50 = 1.0f - vectorValue4.x;
                                precise float sumValue51 = sumValue50 - vectorValue5.y;
                                uint productValue56 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue19 * 76u) + 54u) * 2 + 0));
                                uint bitwiseValue29 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue19 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue17 >> 1u);
                                uint sumValue52 = productValue56 + 0u;
                                bool comparisonValue15 = (scalarValue17 & 1u) == 0u;
                                uint comparisonValue16 = comparisonValue15 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue52), bitwiseValue29 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue52), bitwiseValue29 * 16 + 0).x;
                                uint comparisonValue17 = comparisonValue15 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue52), bitwiseValue29 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue52), bitwiseValue29 * 16 + 0).w;
                                uint comparisonValue18 = comparisonValue15 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue52), bitwiseValue29 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(sumValue52), bitwiseValue29 * 16 + 0).z;
                                bool productValue57 = rdByteLoad_objectInstances_uint16_t(0u, productValue55 * 2 + 0) < 0u;
                                float intermediateValue223;
                                float intermediateValue224;
                                if (productValue57)
                                {
                                    uint bitwiseValue30 = comparisonValue18 >> 15u;
                                    precise float bitwiseValue31 = float(bitwiseValue30 & 1u) * 2.0f;
                                    precise float sumValue53 = bitwiseValue31 + (-1.0f);
                                    precise float bitwiseValue33 = float(comparisonValue18 >> 31u) * 2.0f;
                                    precise float sumValue54 = bitwiseValue33 + (-1.0f);
                                    precise float bitwiseValue34 = float((comparisonValue18 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue35 = float(bitwiseValue30 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue58 = sumValue53 * 3.0517578125e-05f;
                                    precise float productValue59 = sumValue54 * 3.0517578125e-05f;
                                    precise float sumValue55 = bitwiseValue34 + productValue58;
                                    precise float sumValue56 = bitwiseValue35 + productValue59;
                                    intermediateValue223 = sumValue55;
                                    intermediateValue224 = sumValue56;
                                }
                                else
                                {
                                    precise float bitwiseValue36 = float(comparisonValue18 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue37 = float(comparisonValue18 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue60 = bitwiseValue36 * 16384.0f;
                                    precise float sumValue57 = productValue60 + 0.5f;
                                    precise float productValue61 = bitwiseValue37 * 16384.0f;
                                    precise float sumValue58 = productValue61 + 0.5f;
                                    precise float productValue62 = floor(sumValue57) * 6.103515625e-05f;
                                    precise float productValue63 = floor(sumValue58) * 6.103515625e-05f;
                                    intermediateValue223 = productValue62;
                                    intermediateValue224 = productValue63;
                                }
                                precise float productValue64 = sumValue51 * intermediateValue223;
                                precise float productValue65 = sumValue51 * intermediateValue224;
                                precise float sumValue59 = productValue64 + 0.0f;
                                precise float sumValue60 = productValue65 + 0.0f;
                                float intermediateValue252;
                                float intermediateValue253;
                                if (productValue57)
                                {
                                    uint bitwiseValue38 = comparisonValue17 >> 15u;
                                    precise float bitwiseValue39 = float(bitwiseValue38 & 1u) * 2.0f;
                                    precise float sumValue61 = bitwiseValue39 + (-1.0f);
                                    precise float bitwiseValue40 = float(comparisonValue17 >> 31u) * 2.0f;
                                    precise float sumValue62 = bitwiseValue40 + (-1.0f);
                                    precise float bitwiseValue41 = float((comparisonValue17 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue42 = float(bitwiseValue38 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue66 = sumValue61 * 3.0517578125e-05f;
                                    precise float productValue67 = sumValue62 * 3.0517578125e-05f;
                                    precise float sumValue63 = bitwiseValue41 + productValue66;
                                    precise float sumValue64 = bitwiseValue42 + productValue67;
                                    intermediateValue252 = sumValue63;
                                    intermediateValue253 = sumValue64;
                                }
                                else
                                {
                                    precise float bitwiseValue43 = float(comparisonValue17 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue44 = float(comparisonValue17 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue68 = bitwiseValue43 * 16384.0f;
                                    precise float sumValue65 = productValue68 + 0.5f;
                                    precise float productValue69 = bitwiseValue44 * 16384.0f;
                                    precise float sumValue66 = productValue69 + 0.5f;
                                    precise float productValue70 = floor(sumValue65) * 6.103515625e-05f;
                                    precise float productValue71 = floor(sumValue66) * 6.103515625e-05f;
                                    intermediateValue252 = productValue70;
                                    intermediateValue253 = productValue71;
                                }
                                precise float productValue72 = vectorValue4.x * intermediateValue252;
                                precise float productValue73 = vectorValue4.x * intermediateValue253;
                                precise float sumValue67 = sumValue59 + productValue72;
                                precise float sumValue68 = sumValue60 + productValue73;
                                float intermediateValue265;
                                float intermediateValue266;
                                if (productValue57)
                                {
                                    uint bitwiseValue45 = comparisonValue16 >> 15u;
                                    precise float bitwiseValue46 = float(bitwiseValue45 & 1u) * 2.0f;
                                    precise float sumValue69 = bitwiseValue46 + (-1.0f);
                                    precise float bitwiseValue47 = float(comparisonValue16 >> 31u) * 2.0f;
                                    precise float sumValue70 = bitwiseValue47 + (-1.0f);
                                    precise float bitwiseValue48 = float((comparisonValue16 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue49 = float(bitwiseValue45 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue74 = sumValue69 * 3.0517578125e-05f;
                                    precise float productValue75 = sumValue70 * 3.0517578125e-05f;
                                    precise float sumValue71 = bitwiseValue48 + productValue74;
                                    precise float sumValue72 = bitwiseValue49 + productValue75;
                                    intermediateValue265 = sumValue71;
                                    intermediateValue266 = sumValue72;
                                }
                                else
                                {
                                    precise float bitwiseValue50 = float(comparisonValue16 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue51 = float(comparisonValue16 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue76 = bitwiseValue50 * 16384.0f;
                                    precise float sumValue73 = productValue76 + 0.5f;
                                    precise float productValue77 = bitwiseValue51 * 16384.0f;
                                    precise float sumValue74 = productValue77 + 0.5f;
                                    precise float productValue78 = floor(sumValue73) * 6.103515625e-05f;
                                    precise float productValue79 = floor(sumValue74) * 6.103515625e-05f;
                                    intermediateValue265 = productValue78;
                                    intermediateValue266 = productValue79;
                                }
                                precise float productValue83 = vectorValue5.y * intermediateValue265;
                                precise float productValue84 = vectorValue5.y * intermediateValue266;
                                precise float sumValue75 = sumValue67 + productValue83;
                                precise float sumValue76 = sumValue68 + productValue84;
                                uint sumValue77 = productValue56 + 0u;
                                uint reinterpretedBits22;
                                if (rdByteLoad_objectInstances_uint16_t(0u, scalarValue20 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits22 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits22 = uint(rdByteLoad_objectInstances_uint16_t(0u, scalarValue20 * 2 + 0));
                                }
                                bool branchMergedValue20;
                                if (!(((rdByteLoad_objectInstances_uint16_t(0u, scalarValue20 * 2 + 0) != 65535u) ? textures[NonUniformResourceIndex(reinterpretedBits22 + 0u)].SampleLevel(defaultSampler, float2(sumValue75, sumValue76), min((float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue77), ((bitwiseValue29 * 8u) + 6u) * 2 + 0))) + 1.0f) + log2(abs(viewCbConstants[89u].z * scalarValue16)), float(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue77), ((bitwiseValue29 * 8u) + 7u) * 2 + 0)))).w : 1.0f) <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue55 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f)))
                                {
                                    branchMergedValue20 = true;
                                }
                                else
                                {
                                    branchMergedValue20 = false;
                                }
                                intermediateValue187 = branchMergedValue20;
                            }
                            else
                            {
                                intermediateValue187 = true;
                            }
                            if (intermediateValue187)
                            {
                                intermediateValue95.CommitNonOpaqueTriangleHit();
                            }
                        }
                        intermediateValue182 = intermediateValue95.Proceed();
                        if (intermediateValue182)
                        {
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                uint scalarValue21 = intermediateValue95.CommittedStatus();
                float intermediateValue98;
                float intermediateValue100;
                float intermediateValue102;
                uint bitwiseValue6;
                if (scalarValue21 == 1u)
                {
                    float2 vectorValue6 = intermediateValue95.CommittedTriangleBarycentrics();
                    float2 vectorValue7 = intermediateValue95.CommittedTriangleBarycentrics();
                    float scalarValue22 = intermediateValue95.CommittedRayT();
                    uint scalarValue23 = intermediateValue95.CommittedPrimitiveIndex();
                    uint scalarValue24 = intermediateValue95.CommittedInstanceID();
                    uint scalarValue25 = intermediateValue95.CommittedInstanceIndex();
                    intermediateValue98 = vectorValue6.x;
                    intermediateValue100 = vectorValue7.y;
                    intermediateValue102 = scalarValue22;
                    bitwiseValue6 = ((scalarValue24 << 30u) | ((scalarValue23 << 14u) & 1073725440u)) | (scalarValue25 & 16383u);
                }
                else
                {
                    intermediateValue98 = 0.0f;
                    intermediateValue100 = 0.0f;
                    intermediateValue102 = 10000.0f;
                    bitwiseValue6 = 1073741823u;
                }
                uint branchMergedValue15;
                float branchMergedValue25;
                float branchMergedValue26;
                float branchMergedValue27;
                if (intermediateValue102 < 10000.0f)
                {
                    uint branchMergedValue102;
                    float branchMergedValue103;
                    float branchMergedValue104;
                    float branchMergedValue105;
                    if (conditionValue)
                    {
                        precise float sumValue78 = intermediateValue86 - intermediateValue102;
                        bool comparisonValue19 = abs(sumValue78) <= 0.100000001490116119384765625f;
                        bool bitwiseValue52 = (comparisonValue6 && comparisonValue19) || ((intermediateValue86 > intermediateValue102) && (!comparisonValue19));
                        branchMergedValue102 = bitwiseValue52 ? bitwiseValue6 : bitwiseValue5;
                        branchMergedValue103 = bitwiseValue52 ? intermediateValue102 : intermediateValue86;
                        branchMergedValue104 = bitwiseValue52 ? intermediateValue100 : intermediateValue85;
                        branchMergedValue105 = bitwiseValue52 ? intermediateValue98 : intermediateValue84;
                    }
                    else
                    {
                        branchMergedValue102 = bitwiseValue6;
                        branchMergedValue103 = intermediateValue102;
                        branchMergedValue104 = intermediateValue100;
                        branchMergedValue105 = intermediateValue98;
                    }
                    branchMergedValue15 = branchMergedValue102;
                    branchMergedValue25 = branchMergedValue103;
                    branchMergedValue26 = branchMergedValue104;
                    branchMergedValue27 = branchMergedValue105;
                }
                else
                {
                    branchMergedValue15 = bitwiseValue5;
                    branchMergedValue25 = intermediateValue86;
                    branchMergedValue26 = intermediateValue85;
                    branchMergedValue27 = intermediateValue84;
                }
                intermediateValue97 = branchMergedValue27;
                intermediateValue99 = branchMergedValue26;
                intermediateValue101 = branchMergedValue25;
                intermediateValue103 = branchMergedValue15;
            }
            else
            {
                intermediateValue97 = intermediateValue84;
                intermediateValue99 = intermediateValue85;
                intermediateValue101 = intermediateValue86;
                intermediateValue103 = bitwiseValue5;
            }
            uint bitwiseValue53 = intermediateValue103 & 16383u;
            uint productValue85 = (bitwiseValue53 * 76u) + 58u;
            uint productValue86 = (bitwiseValue53 * 76u) + 59u;
            uint productValue87 = (bitwiseValue53 * 76u) + 60u;
            uint productValue88 = (bitwiseValue53 * 76u) + 61u;
            uint productValue89 = (bitwiseValue53 * 38u) + 32u;
            uint productValue90 = (bitwiseValue53 * 38u) + 33u;
            uint productValue91 = (bitwiseValue53 * 76u) + 75u;
            bool comparisonValue21 = (rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 1536u) != 0u;
            uint bitwiseValue32;
            float intermediateValue146;
            float intermediateValue148;
            float intermediateValue150;
            float intermediateValue155;
            float intermediateValue157;
            float intermediateValue159;
            float intermediateValue161;
            float intermediateValue163;
            float intermediateValue165;
            if (intermediateValue101 < 10000.0f)
            {
                uint productValue92 = bitwiseValue53 * 38u;
                float4 reinterpretedBits4 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue92 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue92 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue92 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue92 + 3u) * 4 + 0)));
                float scalarValue26 = reinterpretedBits4.x;
                float scalarValue27 = reinterpretedBits4.y;
                float scalarValue28 = reinterpretedBits4.z;
                uint productValue93 = (bitwiseValue53 * 38u) + 4u;
                float4 reinterpretedBits5 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue93 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue93 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue93 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue93 + 3u) * 4 + 0)));
                float scalarValue29 = reinterpretedBits5.x;
                float scalarValue30 = reinterpretedBits5.y;
                float scalarValue31 = reinterpretedBits5.z;
                uint productValue94 = (bitwiseValue53 * 38u) + 8u;
                float4 reinterpretedBits6 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue94 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue94 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue94 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue94 + 3u) * 4 + 0)));
                float scalarValue32 = reinterpretedBits6.x;
                float scalarValue33 = reinterpretedBits6.y;
                float scalarValue34 = reinterpretedBits6.z;
                uint productValue95 = (bitwiseValue53 * 38u) + 12u;
                float4 reinterpretedBits7 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue95 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue95 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue95 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue95 + 3u) * 4 + 0)));
                uint productValue96 = (bitwiseValue53 * 38u) + 16u;
                float4 reinterpretedBits8 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue96 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue96 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue96 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue96 + 3u) * 4 + 0)));
                uint productValue97 = (bitwiseValue53 * 38u) + 20u;
                float4 reinterpretedBits9 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue97 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue97 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue97 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue97 + 3u) * 4 + 0)));
                uint productValue98 = (bitwiseValue53 * 38u) + 24u;
                uint productValue99 = (bitwiseValue53 * 38u) + 25u;
                uint productValue100 = (bitwiseValue53 * 76u) + 72u;
                uint bitwiseValue54 = ((intermediateValue103 >> 13u) & 2u) | ((intermediateValue103 >> 13u) & 131068u);
                uint bitwiseValue55 = bitwiseValue54 | 1u;
                uint bitwiseValue56 = bitwiseValue54 ^ 2u;
                intermediateValue1[0u] = bitwiseValue54;
                intermediateValue1[1u] = bitwiseValue55;
                intermediateValue1[2u] = bitwiseValue56;
                uint productValue101 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue53 * 76u) + 54u) * 2 + 0));
                uint sumValue79 = productValue101 + 0u;
                uint bitwiseValue57 = (rdByteLoad_objectInstances_uint(0u, productValue99 * 4 + 0) >> 2u) + ((intermediateValue103 >> 15u) & 32767u);
                uint productValue102 = bitwiseValue57 * 4u;
                uint productValue103 = (bitwiseValue57 * 4u) + 1u;
                uint productValue104 = (bitwiseValue57 * 4u) + 2u;
                precise float bitwiseValue58 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue102 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue80 = bitwiseValue58 + (-1.0f);
                precise float bitwiseValue59 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue102 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue81 = bitwiseValue59 + (-1.0f);
                precise float bitwiseValue60 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue102 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue82 = bitwiseValue60 + (-1.0f);
                precise float bitwiseValue61 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue103 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue83 = bitwiseValue61 + (-1.0f);
                precise float bitwiseValue62 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue103 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue84 = bitwiseValue62 + (-1.0f);
                precise float bitwiseValue63 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue103 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue85 = bitwiseValue63 + (-1.0f);
                precise float bitwiseValue64 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue104 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue86 = bitwiseValue64 + (-1.0f);
                precise float bitwiseValue65 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue104 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue87 = bitwiseValue65 + (-1.0f);
                precise float bitwiseValue66 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue79), productValue104 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue88 = bitwiseValue66 + (-1.0f);
                precise float sumValue89 = 1.0f - intermediateValue97;
                precise float sumValue90 = sumValue89 - intermediateValue99;
                intermediateValue2[0u] = sumValue90;
                intermediateValue2[1u] = intermediateValue97;
                intermediateValue2[2u] = intermediateValue99;
                uint sumValue91 = productValue101 + 0u;
                uint productValue105 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue53 * 76u) + 56u) * 2 + 0));
                uint productValue106 = productValue105 * (rdByteLoad_objectInstances_uint(0u, productValue98 * 4 + 0) + bitwiseValue54);
                uint bitwiseValue67 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue53 * 76u) + 71u) * 2 + 0) & 255u);
                uint bitwiseValue68 = (bitwiseValue67 + productValue106) >> 1u;
                half3 productValue107 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), bitwiseValue68 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue68 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue68 + 2u) * 2 + 0)));
                uint bitwiseValue69 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue100 * 2 + 0) & 255u);
                uint bitwiseValue70 = (bitwiseValue69 + productValue106) >> 2u;
                precise float bitwiseValue71 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue70 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue72 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue70 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue73 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue70 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue74 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue70 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                uint bitwiseValue75 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue100 * 2 + 0) >> 8u);
                uint bitwiseValue76 = (bitwiseValue75 + productValue106) >> 2u;
                bool productValue108 = rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) < 0u;
                float intermediateValue183;
                float intermediateValue184;
                if (productValue108)
                {
                    uint bitwiseValue77 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue76 * 4 + 0) >> 15u;
                    precise float bitwiseValue78 = float(bitwiseValue77 & 1u) * 2.0f;
                    precise float sumValue92 = bitwiseValue78 + (-1.0f);
                    precise float bitwiseValue79 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue76 * 4 + 0) >> 31u) * 2.0f;
                    precise float sumValue93 = bitwiseValue79 + (-1.0f);
                    precise float bitwiseValue80 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue76 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue81 = float(bitwiseValue77 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue109 = sumValue92 * 3.0517578125e-05f;
                    precise float productValue110 = sumValue93 * 3.0517578125e-05f;
                    precise float sumValue94 = bitwiseValue80 + productValue109;
                    precise float sumValue95 = bitwiseValue81 + productValue110;
                    intermediateValue183 = sumValue94;
                    intermediateValue184 = sumValue95;
                }
                else
                {
                    precise float bitwiseValue82 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue76 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue83 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue76 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue111 = bitwiseValue82 * 16384.0f;
                    precise float sumValue96 = productValue111 + 0.5f;
                    precise float productValue112 = bitwiseValue83 * 16384.0f;
                    precise float sumValue97 = productValue112 + 0.5f;
                    precise float productValue113 = floor(sumValue96) * 6.103515625e-05f;
                    precise float productValue114 = floor(sumValue97) * 6.103515625e-05f;
                    intermediateValue183 = productValue113;
                    intermediateValue184 = productValue114;
                }
                uint16_t bitwiseValue84 = rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 2u;
                bool comparisonValue22 = bitwiseValue84 == 0u;
                float intermediateValue188;
                float intermediateValue189;
                float intermediateValue190;
                if (comparisonValue22)
                {
                    intermediateValue188 = 0.0f;
                    intermediateValue189 = 0.0f;
                    intermediateValue190 = 0.0f;
                }
                else
                {
                    uint bitwiseValue85 = (productValue106 + uint(rdByteLoad_objectInstances_uint16_t(0u, productValue91 * 2 + 0) & 255u)) >> 1u;
                    half3 productValue115 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), bitwiseValue85 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue85 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue85 + 2u) * 2 + 0)));
                    intermediateValue188 = float(productValue115.x) * sumValue90;
                    intermediateValue189 = float(productValue115.y) * sumValue90;
                    intermediateValue190 = float(productValue115.z) * sumValue90;
                }
                uint intermediateValue193;
                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 256u) == 0u)
                {
                    intermediateValue193 = 0u;
                }
                else
                {
                    intermediateValue193 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), ((uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue53 * 76u) + 74u) * 2 + 0) >> 8u) + productValue106) >> 2u) * 4 + 0) & 65535u;
                }
                precise float productValue116 = sumValue90 * float(productValue107.x);
                precise float productValue117 = sumValue90 * float(productValue107.y);
                precise float productValue118 = sumValue90 * float(productValue107.z);
                precise float sumValue98 = productValue116 + 0.0f;
                precise float sumValue99 = productValue117 + 0.0f;
                precise float sumValue100 = productValue118 + 0.0f;
                precise float productValue119 = sumValue90 * intermediateValue183;
                precise float productValue120 = sumValue90 * intermediateValue184;
                precise float sumValue101 = productValue119 + 0.0f;
                precise float sumValue102 = productValue120 + 0.0f;
                precise float productValue121 = sumValue90 * bitwiseValue71;
                precise float productValue122 = sumValue90 * bitwiseValue72;
                precise float productValue123 = sumValue90 * bitwiseValue73;
                precise float productValue124 = sumValue90 * bitwiseValue74;
                precise float sumValue103 = productValue121 + 0.0f;
                precise float sumValue104 = productValue122 + 0.0f;
                precise float sumValue105 = productValue123 + 0.0f;
                precise float sumValue106 = productValue124 + 0.0f;
                uint productValue125 = productValue105 * (rdByteLoad_objectInstances_uint(0u, productValue98 * 4 + 0) + bitwiseValue55);
                uint bitwiseValue86 = (bitwiseValue67 + productValue125) >> 1u;
                half3 productValue126 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), bitwiseValue86 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue86 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue86 + 2u) * 2 + 0)));
                uint bitwiseValue87 = (bitwiseValue69 + productValue125) >> 2u;
                precise float bitwiseValue88 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue87 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue89 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue87 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue90 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue87 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue91 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue87 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                uint bitwiseValue92 = (bitwiseValue75 + productValue125) >> 2u;
                float intermediateValue248;
                float intermediateValue249;
                if (productValue108)
                {
                    uint bitwiseValue93 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue92 * 4 + 0) >> 15u;
                    precise float bitwiseValue94 = float(bitwiseValue93 & 1u) * 2.0f;
                    precise float sumValue107 = bitwiseValue94 + (-1.0f);
                    precise float bitwiseValue95 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue92 * 4 + 0) >> 31u) * 2.0f;
                    precise float sumValue108 = bitwiseValue95 + (-1.0f);
                    precise float bitwiseValue96 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue92 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue97 = float(bitwiseValue93 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue127 = sumValue107 * 3.0517578125e-05f;
                    precise float productValue128 = sumValue108 * 3.0517578125e-05f;
                    precise float sumValue109 = bitwiseValue96 + productValue127;
                    precise float sumValue110 = bitwiseValue97 + productValue128;
                    intermediateValue248 = sumValue109;
                    intermediateValue249 = sumValue110;
                }
                else
                {
                    precise float bitwiseValue98 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue92 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue99 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue92 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue129 = bitwiseValue98 * 16384.0f;
                    precise float sumValue111 = productValue129 + 0.5f;
                    precise float productValue136 = bitwiseValue99 * 16384.0f;
                    precise float sumValue112 = productValue136 + 0.5f;
                    precise float productValue137 = floor(sumValue111) * 6.103515625e-05f;
                    precise float productValue138 = floor(sumValue112) * 6.103515625e-05f;
                    intermediateValue248 = productValue137;
                    intermediateValue249 = productValue138;
                }
                float intermediateValue254;
                float intermediateValue255;
                float intermediateValue256;
                if (comparisonValue22)
                {
                    intermediateValue254 = intermediateValue188;
                    intermediateValue255 = intermediateValue189;
                    intermediateValue256 = intermediateValue190;
                }
                else
                {
                    uint bitwiseValue100 = (productValue125 + uint(rdByteLoad_objectInstances_uint16_t(0u, productValue91 * 2 + 0) & 255u)) >> 1u;
                    half3 productValue139 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), bitwiseValue100 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue100 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue100 + 2u) * 2 + 0)));
                    intermediateValue254 = (float(productValue139.x) * intermediateValue97) + intermediateValue188;
                    intermediateValue255 = (float(productValue139.y) * intermediateValue97) + intermediateValue189;
                    intermediateValue256 = (float(productValue139.z) * intermediateValue97) + intermediateValue190;
                }
                precise float productValue140 = intermediateValue97 * float(productValue126.x);
                precise float productValue141 = intermediateValue97 * float(productValue126.y);
                precise float productValue142 = intermediateValue97 * float(productValue126.z);
                precise float sumValue113 = sumValue98 + productValue140;
                precise float sumValue114 = sumValue99 + productValue141;
                precise float sumValue115 = sumValue100 + productValue142;
                precise float productValue143 = intermediateValue97 * intermediateValue248;
                precise float productValue144 = intermediateValue97 * intermediateValue249;
                precise float sumValue116 = sumValue101 + productValue143;
                precise float sumValue117 = sumValue102 + productValue144;
                precise float productValue145 = intermediateValue97 * bitwiseValue88;
                precise float productValue146 = intermediateValue97 * bitwiseValue89;
                precise float productValue147 = intermediateValue97 * bitwiseValue90;
                precise float productValue148 = intermediateValue97 * bitwiseValue91;
                precise float sumValue118 = sumValue103 + productValue145;
                precise float sumValue119 = sumValue104 + productValue146;
                precise float sumValue120 = sumValue105 + productValue147;
                precise float sumValue121 = sumValue106 + productValue148;
                uint productValue149 = productValue105 * (rdByteLoad_objectInstances_uint(0u, productValue98 * 4 + 0) + bitwiseValue56);
                uint bitwiseValue101 = (bitwiseValue67 + productValue149) >> 1u;
                half3 productValue150 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), bitwiseValue101 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue101 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue101 + 2u) * 2 + 0)));
                uint bitwiseValue102 = (bitwiseValue69 + productValue149) >> 2u;
                precise float bitwiseValue103 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue102 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue104 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue102 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue105 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue102 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue106 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue102 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                uint bitwiseValue107 = (bitwiseValue75 + productValue149) >> 2u;
                float intermediateValue267;
                float intermediateValue268;
                if (productValue108)
                {
                    uint bitwiseValue108 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue107 * 4 + 0) >> 15u;
                    precise float bitwiseValue109 = float(bitwiseValue108 & 1u) * 2.0f;
                    precise float sumValue122 = bitwiseValue109 + (-1.0f);
                    precise float bitwiseValue110 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue107 * 4 + 0) >> 31u) * 2.0f;
                    precise float sumValue123 = bitwiseValue110 + (-1.0f);
                    precise float bitwiseValue111 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue107 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue112 = float(bitwiseValue108 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue151 = sumValue122 * 3.0517578125e-05f;
                    precise float productValue152 = sumValue123 * 3.0517578125e-05f;
                    precise float sumValue124 = bitwiseValue111 + productValue151;
                    precise float sumValue125 = bitwiseValue112 + productValue152;
                    intermediateValue267 = sumValue124;
                    intermediateValue268 = sumValue125;
                }
                else
                {
                    precise float bitwiseValue113 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue107 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue114 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue91), bitwiseValue107 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue153 = bitwiseValue113 * 16384.0f;
                    precise float sumValue126 = productValue153 + 0.5f;
                    precise float productValue154 = bitwiseValue114 * 16384.0f;
                    precise float sumValue127 = productValue154 + 0.5f;
                    precise float productValue155 = floor(sumValue126) * 6.103515625e-05f;
                    precise float productValue156 = floor(sumValue127) * 6.103515625e-05f;
                    intermediateValue267 = productValue155;
                    intermediateValue268 = productValue156;
                }
                float intermediateValue273;
                float intermediateValue274;
                float intermediateValue275;
                if (comparisonValue22)
                {
                    intermediateValue273 = intermediateValue254;
                    intermediateValue274 = intermediateValue255;
                    intermediateValue275 = intermediateValue256;
                }
                else
                {
                    uint bitwiseValue115 = (productValue149 + uint(rdByteLoad_objectInstances_uint16_t(0u, productValue91 * 2 + 0) & 255u)) >> 1u;
                    half3 productValue157 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), bitwiseValue115 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue115 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue91), (bitwiseValue115 + 2u) * 2 + 0)));
                    intermediateValue273 = (float(productValue157.x) * intermediateValue99) + intermediateValue254;
                    intermediateValue274 = (float(productValue157.y) * intermediateValue99) + intermediateValue255;
                    intermediateValue275 = (float(productValue157.z) * intermediateValue99) + intermediateValue256;
                }
                precise float productValue158 = intermediateValue99 * float(productValue150.x);
                precise float productValue159 = intermediateValue99 * float(productValue150.y);
                precise float productValue160 = intermediateValue99 * float(productValue150.z);
                precise float sumValue128 = sumValue113 + productValue158;
                precise float sumValue129 = sumValue114 + productValue159;
                precise float sumValue130 = sumValue115 + productValue160;
                precise float productValue161 = intermediateValue99 * intermediateValue267;
                precise float productValue162 = intermediateValue99 * intermediateValue268;
                precise float sumValue131 = sumValue116 + productValue161;
                precise float sumValue132 = sumValue117 + productValue162;
                precise float productValue163 = intermediateValue99 * bitwiseValue103;
                precise float productValue164 = intermediateValue99 * bitwiseValue104;
                precise float productValue165 = intermediateValue99 * bitwiseValue105;
                precise float productValue166 = intermediateValue99 * bitwiseValue106;
                precise float sumValue133 = sumValue118 + productValue163;
                precise float sumValue134 = sumValue119 + productValue164;
                precise float sumValue135 = sumValue120 + productValue165;
                precise float sumValue136 = sumValue121 + productValue166;
                precise float productValue167 = scalarValue26 * sumValue128;
                precise float productValue168 = sumValue129 * scalarValue27;
                precise float sumValue137 = productValue168 + productValue167;
                precise float productValue169 = sumValue130 * scalarValue28;
                precise float sumValue138 = productValue169 + sumValue137;
                precise float productValue170 = 1.0f * reinterpretedBits4.w;
                precise float sumValue139 = productValue170 + sumValue138;
                precise float productValue171 = scalarValue29 * sumValue128;
                precise float productValue172 = sumValue129 * scalarValue30;
                precise float sumValue140 = productValue172 + productValue171;
                precise float productValue173 = sumValue130 * scalarValue31;
                precise float sumValue141 = productValue173 + sumValue140;
                precise float productValue174 = 1.0f * reinterpretedBits5.w;
                precise float sumValue142 = productValue174 + sumValue141;
                precise float productValue175 = scalarValue32 * sumValue128;
                precise float productValue176 = sumValue129 * scalarValue33;
                precise float sumValue143 = productValue176 + productValue175;
                precise float productValue177 = sumValue130 * scalarValue34;
                precise float sumValue144 = productValue177 + sumValue143;
                precise float productValue178 = 1.0f * reinterpretedBits6.w;
                precise float sumValue145 = productValue178 + sumValue144;
                precise float productValue179 = scalarValue26 * sumValue80;
                precise float productValue180 = sumValue81 * scalarValue27;
                precise float sumValue146 = productValue180 + productValue179;
                precise float productValue181 = sumValue82 * scalarValue28;
                precise float sumValue147 = productValue181 + sumValue146;
                precise float productValue182 = scalarValue29 * sumValue80;
                precise float productValue183 = sumValue81 * scalarValue30;
                precise float sumValue148 = productValue183 + productValue182;
                precise float productValue184 = sumValue82 * scalarValue31;
                precise float sumValue149 = productValue184 + sumValue148;
                precise float productValue185 = scalarValue32 * sumValue80;
                precise float productValue186 = sumValue81 * scalarValue33;
                precise float sumValue150 = productValue186 + productValue185;
                precise float productValue187 = sumValue82 * scalarValue34;
                precise float sumValue151 = productValue187 + sumValue150;
                float inverseLengthValue1 = rsqrt(dot(float3(sumValue147, sumValue149, sumValue151), float3(sumValue147, sumValue149, sumValue151)));
                precise float productValue188 = sumValue147 * inverseLengthValue1;
                precise float productValue189 = sumValue149 * inverseLengthValue1;
                precise float productValue190 = sumValue151 * inverseLengthValue1;
                precise float productValue191 = scalarValue26 * sumValue83;
                precise float productValue192 = sumValue84 * scalarValue27;
                precise float sumValue152 = productValue192 + productValue191;
                precise float productValue193 = sumValue85 * scalarValue28;
                precise float sumValue153 = productValue193 + sumValue152;
                precise float productValue194 = scalarValue29 * sumValue83;
                precise float productValue195 = sumValue84 * scalarValue30;
                precise float sumValue154 = productValue195 + productValue194;
                precise float productValue196 = sumValue85 * scalarValue31;
                precise float sumValue155 = productValue196 + sumValue154;
                precise float productValue197 = scalarValue32 * sumValue83;
                precise float productValue198 = sumValue84 * scalarValue33;
                precise float sumValue156 = productValue198 + productValue197;
                precise float productValue199 = sumValue85 * scalarValue34;
                precise float sumValue157 = productValue199 + sumValue156;
                float inverseLengthValue2 = rsqrt(dot(float3(sumValue153, sumValue155, sumValue157), float3(sumValue153, sumValue155, sumValue157)));
                precise float productValue200 = sumValue153 * inverseLengthValue2;
                precise float productValue201 = sumValue155 * inverseLengthValue2;
                precise float productValue202 = sumValue157 * inverseLengthValue2;
                precise float productValue203 = scalarValue26 * sumValue86;
                precise float productValue204 = sumValue87 * scalarValue27;
                precise float sumValue158 = productValue204 + productValue203;
                precise float productValue205 = sumValue88 * scalarValue28;
                precise float sumValue159 = productValue205 + sumValue158;
                precise float productValue206 = scalarValue29 * sumValue86;
                precise float productValue207 = sumValue87 * scalarValue30;
                precise float sumValue160 = productValue207 + productValue206;
                precise float productValue208 = sumValue88 * scalarValue31;
                precise float sumValue161 = productValue208 + sumValue160;
                precise float productValue209 = scalarValue32 * sumValue86;
                precise float productValue210 = sumValue87 * scalarValue33;
                precise float sumValue162 = productValue210 + productValue209;
                precise float productValue211 = sumValue88 * scalarValue34;
                precise float sumValue163 = productValue211 + sumValue162;
                float inverseLengthValue3 = rsqrt(dot(float3(sumValue159, sumValue161, sumValue163), float3(sumValue159, sumValue161, sumValue163)));
                precise float productValue212 = sumValue159 * inverseLengthValue3;
                precise float productValue213 = sumValue161 * inverseLengthValue3;
                precise float productValue214 = sumValue163 * inverseLengthValue3;
                bool dotProductValue = dot(float3(intermediateValue36, intermediateValue38, intermediateValue40), float3(productValue188, productValue189, productValue190)) > 0.0f;
                precise float sumValue164 = (-0.0f) - productValue188;
                precise float sumValue165 = (-0.0f) - productValue189;
                precise float sumValue166 = (-0.0f) - productValue190;
                float comparisonValue23 = dotProductValue ? sumValue164 : productValue188;
                float comparisonValue24 = dotProductValue ? sumValue165 : productValue189;
                float comparisonValue25 = dotProductValue ? sumValue166 : productValue190;
                bool comparisonValue26 = bitwiseValue84 != 0u;
                float comparisonValue27 = comparisonValue26 ? intermediateValue273 : sumValue128;
                float comparisonValue28 = comparisonValue26 ? intermediateValue274 : sumValue129;
                float comparisonValue29 = comparisonValue26 ? intermediateValue275 : sumValue130;
                float intermediateValue117;
                float intermediateValue119;
                float intermediateValue121;
                if (((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 1u) != 0u) && (asuint(viewCbConstants[86u]).y != 0u))
                {
                    uint sumValue167 = productValue101 + 0u;
                    float sumValue198;
                    float sumValue199;
                    float sumValue200;
                    uint sumValue203;
                    float scalarValue35 = sumValue90;
                    uint scalarValue36 = bitwiseValue54;
                    float scalarValue37 = 0.0f;
                    float scalarValue38 = 0.0f;
                    float scalarValue39 = 0.0f;
                    uint scalarValue40 = 0u;
                    half3 productValue285;
                    half3 productValue287;
                    for (;;)
                    {
                        uint productValue215 = scalarValue36 + rdByteLoad_objectInstances_uint(0u, productValue99 * 4 + 0);
                        uint productValue216 = productValue215 * 8u;
                        productValue285 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue167), productValue216 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue167), (productValue216 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue167), (productValue216 + 2u) * 2 + 0)));
                        uint productValue217 = (productValue215 * 8u) + 4u;
                        productValue287 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue167), productValue217 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue167), (productValue217 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue167), (productValue217 + 2u) * 2 + 0)));
                        half intermediateValue292;
                        half intermediateValue293;
                        half intermediateValue294;
                        if (dotProductValue)
                        {
                            intermediateValue292 = productValue287.x;
                            intermediateValue293 = productValue287.y;
                            intermediateValue294 = productValue287.z;
                        }
                        else
                        {
                            intermediateValue292 = productValue285.x;
                            intermediateValue293 = productValue285.y;
                            intermediateValue294 = productValue285.z;
                        }
                        precise float productValue218 = float(intermediateValue294) * scalarValue35;
                        precise float productValue219 = float(intermediateValue293) * scalarValue35;
                        precise float productValue220 = float(intermediateValue292) * scalarValue35;
                        sumValue198 = productValue220 + scalarValue37;
                        sumValue199 = productValue219 + scalarValue38;
                        sumValue200 = productValue218 + scalarValue39;
                        sumValue203 = scalarValue40 + 1u;
                        if (sumValue203 == 3u)
                        {
                            break;
                        }
                        scalarValue35 = intermediateValue2[sumValue203];
                        scalarValue36 = intermediateValue1[sumValue203];
                        scalarValue37 = sumValue198;
                        scalarValue38 = sumValue199;
                        scalarValue39 = sumValue200;
                        scalarValue40 = sumValue203;
                        continue;
                    }
                    intermediateValue117 = sumValue198;
                    intermediateValue119 = sumValue199;
                    intermediateValue121 = sumValue200;
                }
                else
                {
                    intermediateValue117 = 0.0f;
                    intermediateValue119 = 0.0f;
                    intermediateValue121 = 0.0f;
                }
                precise float productValue221 = viewCbConstants[89u].y * 2.0f;
                float comparisonValue30 = (intermediateValue71 != 0u) ? productValue221 : viewCbConstants[89u].y;
                precise float productValue222 = intermediateValue54 * comparisonValue30;
                float2 reinterpretedBits10 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, (intermediateValue193 * 8u) * 8 + 0));
                float2 reinterpretedBits11 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue193 * 8u) + 1u) * 8 + 0));
                float2 reinterpretedBits12 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue193 * 8u) + 2u) * 8 + 0));
                float2 reinterpretedBits13 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue193 * 8u) + 3u) * 8 + 0));
                uint productValue223 = (intermediateValue193 * 16u) + 8u;
                float reinterpretedBits14 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue193 * 16u) + 13u) * 4 + 0));
                float reinterpretedBits15 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue193 * 16u) + 14u) * 4 + 0));
                float reinterpretedBits16 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue193 * 16u) + 15u) * 4 + 0));
                precise float productValue224 = intermediateValue101 * comparisonValue30;
                precise float sumValue168 = productValue224 + productValue222;
                precise float nonlinearValue = float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue79), ((bitwiseValue57 * 8u) + 6u) * 2 + 0))) + log2(abs(sumValue168));
                precise float dotProductValue1 = nonlinearValue - log2(abs(dot(float3(intermediateValue36, intermediateValue38, intermediateValue40), float3(comparisonValue23, comparisonValue24, comparisonValue25))));
                precise float sumValue169 = dotProductValue1 + viewCbConstants[86u].x;
                float scalarValue41 = max(0.0f, sumValue169);
                float scalarValue42 = min(scalarValue41, reinterpretedBits14);
                uint productValue225 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue85 * 2 + 0));
                bool productValue226 = rdByteLoad_objectInstances_uint16_t(0u, productValue85 * 2 + 0) > 4095u;
                uint reinterpretedBits30;
                if (productValue226)
                {
                    reinterpretedBits30 = asuint(viewCbConstants[98u]).w;
                }
                else
                {
                    reinterpretedBits30 = productValue225;
                }
                uint sumValue170 = reinterpretedBits30 + 0u;
                float intermediateValue287;
                float intermediateValue288;
                float intermediateValue289;
                float intermediateValue290;
                if (rdByteLoad_objectInstances_uint16_t(0u, productValue85 * 2 + 0) == 65535u)
                {
                    intermediateValue287 = 1.0f;
                    intermediateValue288 = 1.0f;
                    intermediateValue289 = 1.0f;
                    intermediateValue290 = 1.0f;
                }
                else
                {
                    float4 sampledTextureValue = textures[NonUniformResourceIndex(sumValue170)].SampleLevel(defaultSampler, float2(sumValue131, sumValue132), scalarValue42);
                    intermediateValue287 = sampledTextureValue.x;
                    intermediateValue288 = sampledTextureValue.y;
                    intermediateValue289 = sampledTextureValue.z;
                    intermediateValue290 = sampledTextureValue.w;
                }
                float intermediateValue128;
                float intermediateValue129;
                float intermediateValue130;
                float intermediateValue131;
                float intermediateValue132;
                float intermediateValue133;
                float intermediateValue134;
                float intermediateValue135;
                float intermediateValue136;
                float intermediateValue137;
                float intermediateValue138;
                float intermediateValue139;
                float intermediateValue300;
                float intermediateValue302;
                float intermediateValue304;
                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 1024u) == 0u)
                {
                    float branchMergedValue28;
                    float branchMergedValue48;
                    float branchMergedValue49;
                    float branchMergedValue50;
                    float branchMergedValue51;
                    float branchMergedValue52;
                    float branchMergedValue53;
                    float branchMergedValue54;
                    float branchMergedValue55;
                    float branchMergedValue56;
                    float branchMergedValue81;
                    float branchMergedValue82;
                    float branchMergedValue83;
                    float branchMergedValue84;
                    float branchMergedValue85;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 512u) == 0u)
                    {
                        bool comparisonValue31 = (rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 4u) == 0u;
                        float intermediateValue306;
                        float intermediateValue307;
                        float intermediateValue308;
                        float intermediateValue309;
                        if (comparisonValue31)
                        {
                            intermediateValue306 = intermediateValue290;
                            intermediateValue307 = sumValue133;
                            intermediateValue308 = sumValue134;
                            intermediateValue309 = sumValue135;
                        }
                        else
                        {
                            uint reinterpretedBits32;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue86 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits32 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits32 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue86 * 2 + 0));
                            }
                            float4 sampledTextureValue1 = textures[NonUniformResourceIndex(reinterpretedBits32 + 0u)].SampleLevel(defaultSampler, float2(sumValue133, sumValue134), 0.0f);
                            precise float productValue227 = sampledTextureValue1.x * 2.0f;
                            precise float productValue228 = sampledTextureValue1.y * 2.0f;
                            precise float productValue229 = sampledTextureValue1.z * 2.0f;
                            precise float sumValue171 = productValue227 + (-1.0f);
                            precise float sumValue172 = productValue228 + (-1.0f);
                            precise float sumValue173 = productValue229 + (-1.0f);
                            precise float productValue230 = sumValue135 * sumValue171;
                            precise float productValue231 = sumValue135 * sumValue172;
                            precise float productValue232 = sumValue135 * sumValue173;
                            precise float sumValue174 = productValue230 + 1.0f;
                            precise float sumValue175 = productValue231 + 1.0f;
                            precise float sumValue176 = productValue232 + 1.0f;
                            precise float productValue233 = sumValue136 * sumValue174;
                            precise float productValue234 = sumValue136 * sumValue175;
                            precise float productValue235 = sumValue136 * sumValue176;
                            intermediateValue306 = 1.0f;
                            intermediateValue307 = productValue233;
                            intermediateValue308 = productValue234;
                            intermediateValue309 = productValue235;
                        }
                        float intermediateValue313;
                        float intermediateValue314;
                        float intermediateValue315;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 8192u) == 0u)
                        {
                            intermediateValue313 = intermediateValue307;
                            intermediateValue314 = intermediateValue308;
                            intermediateValue315 = intermediateValue309;
                        }
                        else
                        {
                            precise float sumValue177 = 1.0f - intermediateValue307;
                            precise float sumValue178 = 1.0f - intermediateValue308;
                            precise float sumValue179 = 1.0f - intermediateValue309;
                            precise float productValue236 = intermediateValue306 * sumValue177;
                            precise float productValue237 = intermediateValue306 * sumValue178;
                            precise float productValue238 = intermediateValue306 * sumValue179;
                            precise float sumValue180 = intermediateValue307 + productValue236;
                            precise float sumValue181 = intermediateValue308 + productValue237;
                            precise float sumValue182 = intermediateValue309 + productValue238;
                            intermediateValue313 = sumValue180;
                            intermediateValue314 = sumValue181;
                            intermediateValue315 = sumValue182;
                        }
                        precise float productValue239 = intermediateValue287 * intermediateValue313;
                        precise float productValue240 = intermediateValue288 * intermediateValue314;
                        precise float productValue241 = intermediateValue289 * intermediateValue315;
                        float intermediateValue296;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 2048u) == 0u)
                        {
                            intermediateValue296 = intermediateValue306;
                        }
                        else
                        {
                            precise float productValue242 = intermediateValue306 * 2.0f;
                            precise float sumValue183 = productValue242 + (-1.0f);
                            intermediateValue296 = clamp(sumValue183, 0.0f, 1.0f);
                        }
                        precise float bitwiseValue116 = float(rdByteLoad_objectInstances_uint(0u, productValue89 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                        precise float bitwiseValue117 = float((rdByteLoad_objectInstances_uint(0u, productValue89 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                        precise float bitwiseValue118 = float((rdByteLoad_objectInstances_uint(0u, productValue89 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                        precise float sumValue184 = bitwiseValue116 + (-1.0f);
                        precise float sumValue185 = bitwiseValue117 + (-1.0f);
                        precise float sumValue186 = bitwiseValue118 + (-1.0f);
                        precise float productValue243 = sumValue184 * intermediateValue296;
                        precise float productValue244 = sumValue185 * intermediateValue296;
                        precise float productValue245 = sumValue186 * intermediateValue296;
                        precise float sumValue187 = productValue243 + 1.0f;
                        precise float sumValue188 = productValue244 + 1.0f;
                        precise float sumValue189 = productValue245 + 1.0f;
                        precise float productValue246 = productValue239 * sumValue187;
                        precise float productValue247 = productValue240 * sumValue188;
                        precise float productValue248 = productValue241 * sumValue189;
                        float intermediateValue316;
                        float intermediateValue318;
                        float intermediateValue320;
                        float intermediateValue322;
                        if (comparisonValue31)
                        {
                            float intermediateValue323;
                            float intermediateValue324;
                            float intermediateValue325;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue86 * 2 + 0) == 65535u)
                            {
                                intermediateValue323 = productValue246;
                                intermediateValue324 = productValue247;
                                intermediateValue325 = productValue248;
                            }
                            else
                            {
                                uint reinterpretedBits33;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue86 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits33 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits33 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue86 * 2 + 0));
                                }
                                float4 sampledTextureValue2 = textures[NonUniformResourceIndex(reinterpretedBits33 + 0u)].SampleLevel(defaultSampler, float2(sumValue131, sumValue132), scalarValue42);
                                float scalarValue43 = sampledTextureValue2.x;
                                float scalarValue44 = sampledTextureValue2.y;
                                float scalarValue45 = sampledTextureValue2.z;
                                float scalarValue46 = sampledTextureValue2.w;
                                float branchMergedValue31;
                                float branchMergedValue69;
                                float branchMergedValue70;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 8u) == 0u)
                                {
                                    float branchMergedValue110;
                                    float branchMergedValue131;
                                    float branchMergedValue132;
                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 16u) == 0u)
                                    {
                                        float branchMergedValue181;
                                        float branchMergedValue183;
                                        float branchMergedValue184;
                                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 32u) == 0u)
                                        {
                                            branchMergedValue181 = productValue247;
                                            branchMergedValue183 = productValue246;
                                            branchMergedValue184 = productValue248;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue119 = float(rdByteLoad_objectInstances_uint(0u, productValue90 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                                            precise float bitwiseValue120 = float((rdByteLoad_objectInstances_uint(0u, productValue90 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                                            precise float bitwiseValue121 = float((rdByteLoad_objectInstances_uint(0u, productValue90 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                                            precise float productValue249 = bitwiseValue119 * scalarValue43;
                                            precise float productValue250 = bitwiseValue120 * scalarValue44;
                                            precise float productValue251 = bitwiseValue121 * scalarValue45;
                                            precise float sumValue190 = productValue249 - productValue246;
                                            precise float sumValue191 = productValue250 - productValue247;
                                            precise float sumValue192 = productValue251 - productValue248;
                                            precise float productValue252 = scalarValue46 * sumValue190;
                                            precise float productValue253 = scalarValue46 * sumValue191;
                                            precise float productValue254 = scalarValue46 * sumValue192;
                                            precise float sumValue193 = productValue246 + productValue252;
                                            precise float sumValue194 = productValue247 + productValue253;
                                            precise float sumValue195 = productValue248 + productValue254;
                                            branchMergedValue181 = sumValue194;
                                            branchMergedValue183 = sumValue193;
                                            branchMergedValue184 = sumValue195;
                                        }
                                        branchMergedValue110 = branchMergedValue181;
                                        branchMergedValue131 = branchMergedValue183;
                                        branchMergedValue132 = branchMergedValue184;
                                    }
                                    else
                                    {
                                        precise float sumValue196 = scalarValue43 - productValue246;
                                        precise float sumValue197 = scalarValue44 - productValue247;
                                        precise float sumValue201 = scalarValue45 - productValue248;
                                        precise float productValue255 = scalarValue46 * sumValue196;
                                        precise float productValue256 = scalarValue46 * sumValue197;
                                        precise float productValue257 = scalarValue46 * sumValue201;
                                        precise float sumValue202 = productValue246 + productValue255;
                                        precise float sumValue204 = productValue247 + productValue256;
                                        precise float sumValue205 = productValue248 + productValue257;
                                        uint reinterpretedBits34;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue87 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits34 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits34 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue87 * 2 + 0));
                                        }
                                        float4 sampledTextureValue3 = textures[NonUniformResourceIndex(reinterpretedBits34 + 0u)].SampleLevel(defaultSampler, float2(sumValue131, sumValue132), scalarValue42);
                                        float scalarValue47 = sampledTextureValue3.w;
                                        precise float productValue258 = bitwiseValue116 * sampledTextureValue3.x;
                                        precise float productValue259 = bitwiseValue117 * sampledTextureValue3.y;
                                        precise float productValue260 = bitwiseValue118 * sampledTextureValue3.z;
                                        precise float sumValue206 = productValue258 - sumValue202;
                                        precise float sumValue207 = productValue259 - sumValue204;
                                        precise float sumValue208 = productValue260 - sumValue205;
                                        precise float productValue261 = scalarValue47 * sumValue206;
                                        precise float productValue262 = scalarValue47 * sumValue207;
                                        precise float productValue263 = scalarValue47 * sumValue208;
                                        precise float sumValue209 = sumValue202 + productValue261;
                                        precise float sumValue210 = sumValue204 + productValue262;
                                        precise float sumValue211 = sumValue205 + productValue263;
                                        branchMergedValue110 = sumValue210;
                                        branchMergedValue131 = sumValue209;
                                        branchMergedValue132 = sumValue211;
                                    }
                                    branchMergedValue31 = branchMergedValue110;
                                    branchMergedValue69 = branchMergedValue131;
                                    branchMergedValue70 = branchMergedValue132;
                                }
                                else
                                {
                                    precise float sumValue212 = 1.0f - scalarValue46;
                                    precise float dotProductValue2 = sumValue212 * dot(float3(scalarValue43, scalarValue44, scalarValue45), 1.0f.xxx);
                                    float clampedValue = clamp(ceil(dotProductValue2), 0.0f, 1.0f);
                                    precise float sumValue213 = productValue246 - scalarValue43;
                                    precise float sumValue214 = productValue247 - scalarValue44;
                                    precise float sumValue215 = productValue248 - scalarValue45;
                                    precise float productValue264 = sumValue213 * clampedValue;
                                    precise float productValue265 = sumValue214 * clampedValue;
                                    precise float productValue266 = sumValue215 * clampedValue;
                                    precise float sumValue216 = scalarValue43 + productValue264;
                                    precise float sumValue217 = scalarValue44 + productValue265;
                                    precise float sumValue218 = scalarValue45 + productValue266;
                                    branchMergedValue31 = sumValue217;
                                    branchMergedValue69 = sumValue216;
                                    branchMergedValue70 = sumValue218;
                                }
                                intermediateValue323 = branchMergedValue69;
                                intermediateValue324 = branchMergedValue31;
                                intermediateValue325 = branchMergedValue70;
                            }
                            float intermediateValue317;
                            float intermediateValue319;
                            float intermediateValue321;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 64u) == 0u)
                            {
                                intermediateValue317 = intermediateValue323;
                                intermediateValue319 = intermediateValue324;
                                intermediateValue321 = intermediateValue325;
                            }
                            else
                            {
                                precise float bitwiseValue122 = float(rdByteLoad_objectInstances_uint(0u, productValue90 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                                precise float bitwiseValue123 = float((rdByteLoad_objectInstances_uint(0u, productValue90 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                                precise float bitwiseValue124 = float((rdByteLoad_objectInstances_uint(0u, productValue90 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                                precise float bitwiseValue125 = float(rdByteLoad_objectInstances_uint(0u, productValue90 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                                precise float sumValue219 = bitwiseValue122 - intermediateValue323;
                                precise float sumValue220 = bitwiseValue123 - intermediateValue324;
                                precise float sumValue221 = bitwiseValue124 - intermediateValue325;
                                precise float productValue267 = bitwiseValue125 * sumValue219;
                                precise float productValue268 = bitwiseValue125 * sumValue220;
                                precise float productValue269 = bitwiseValue125 * sumValue221;
                                precise float sumValue222 = intermediateValue323 + productValue267;
                                precise float sumValue223 = intermediateValue324 + productValue268;
                                precise float sumValue224 = intermediateValue325 + productValue269;
                                intermediateValue317 = sumValue222;
                                intermediateValue319 = sumValue223;
                                intermediateValue321 = sumValue224;
                            }
                            float branchMergedValue30;
                            float branchMergedValue66;
                            float branchMergedValue67;
                            float branchMergedValue68;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) & 16384u) == 0u)
                            {
                                branchMergedValue30 = 0.0f;
                                branchMergedValue66 = intermediateValue321;
                                branchMergedValue67 = intermediateValue319;
                                branchMergedValue68 = intermediateValue317;
                            }
                            else
                            {
                                precise float sumValue225 = sumValue132 - sumValue131;
                                precise float productValue270 = sumValue225 * 8.0f;
                                precise float productValue271 = viewCbConstants[97u].z * 3.0f;
                                precise float sumValue226 = productValue271 + productValue270;
                                precise float wavePhaseValue = sin(sumValue226) * 0.5f;
                                precise float sumValue227 = wavePhaseValue + 0.5f;
                                float clampedValue1 = clamp(sumValue227, 0.0f, 1.0f);
                                precise float productValue272 = clampedValue1 * clampedValue1;
                                precise float productValue273 = 0.560000002384185791015625f * productValue272;
                                precise float sumValue228 = productValue273 + intermediateValue317;
                                precise float productValue274 = 0.2800000011920928955078125f * productValue272;
                                precise float sumValue229 = productValue274 + intermediateValue319;
                                precise float productValue275 = 0.699999988079071044921875f * productValue272;
                                precise float sumValue230 = productValue275 + intermediateValue321;
                                branchMergedValue30 = mad(productValue272, 0.00019999999494757503271102905273438f, 0.0f);
                                branchMergedValue66 = sumValue230;
                                branchMergedValue67 = sumValue229;
                                branchMergedValue68 = sumValue228;
                            }
                            intermediateValue316 = branchMergedValue68;
                            intermediateValue318 = branchMergedValue67;
                            intermediateValue320 = branchMergedValue66;
                            intermediateValue322 = branchMergedValue30;
                        }
                        else
                        {
                            intermediateValue316 = productValue246;
                            intermediateValue318 = productValue247;
                            intermediateValue320 = productValue248;
                            intermediateValue322 = 0.0f;
                        }
                        float intermediateValue301;
                        if (intermediateValue316 < 0.040449999272823333740234375f)
                        {
                            precise float productValue277 = intermediateValue316 * 0.077399380505084991455078125f;
                            intermediateValue301 = productValue277;
                        }
                        else
                        {
                            precise float sumValue231 = intermediateValue316 + 0.054999999701976776123046875f;
                            precise float productValue278 = sumValue231 * 0.947867333889007568359375f;
                            precise float nonlinearValue1 = log2(productValue278) * 2.400000095367431640625f;
                            intermediateValue301 = exp2(nonlinearValue1);
                        }
                        float intermediateValue303;
                        if (intermediateValue318 < 0.040449999272823333740234375f)
                        {
                            precise float productValue279 = intermediateValue318 * 0.077399380505084991455078125f;
                            intermediateValue303 = productValue279;
                        }
                        else
                        {
                            precise float sumValue232 = intermediateValue318 + 0.054999999701976776123046875f;
                            precise float productValue280 = sumValue232 * 0.947867333889007568359375f;
                            precise float nonlinearValue2 = log2(productValue280) * 2.400000095367431640625f;
                            intermediateValue303 = exp2(nonlinearValue2);
                        }
                        float intermediateValue305;
                        if (intermediateValue320 < 0.040449999272823333740234375f)
                        {
                            precise float productValue281 = intermediateValue320 * 0.077399380505084991455078125f;
                            intermediateValue305 = productValue281;
                        }
                        else
                        {
                            precise float sumValue233 = intermediateValue320 + 0.054999999701976776123046875f;
                            precise float productValue282 = sumValue233 * 0.947867333889007568359375f;
                            precise float nonlinearValue3 = log2(productValue282) * 2.400000095367431640625f;
                            intermediateValue305 = exp2(nonlinearValue3);
                        }
                        float reinterpretedBits31;
                        float reinterpretedBits35;
                        float reinterpretedBits36;
                        if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, productValue223 * 4 + 0) & 1u) == 0u)
                        {
                            reinterpretedBits35 = intermediateValue322 + asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue193 * 16u) + 10u) * 4 + 0));
                            reinterpretedBits31 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue193 * 16u) + 11u) * 4 + 0));
                            reinterpretedBits36 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue193 * 16u) + 9u) * 4 + 0));
                        }
                        else
                        {
                            precise float productValue283 = sumValue131 * reinterpretedBits10.x;
                            precise float sumValue234 = productValue283 + reinterpretedBits11.x;
                            precise float productValue284 = sumValue132 * reinterpretedBits10.y;
                            precise float sumValue235 = productValue284 + reinterpretedBits11.y;
                            precise float sumValue236 = reinterpretedBits15 + scalarValue41;
                            precise float sumValue237 = sumValue236 - reinterpretedBits14;
                            float4 sampledTextureValue4 = textures[NonUniformResourceIndex(sumValue170)].SampleLevel(defaultSampler, float2(sumValue234, sumValue235), min(sumValue237, reinterpretedBits15));
                            float scalarValue48 = sampledTextureValue4.y;
                            reinterpretedBits35 = mad(scalarValue48, scalarValue48, intermediateValue322);
                            reinterpretedBits31 = sampledTextureValue4.x;
                            reinterpretedBits36 = sampledTextureValue4.z;
                        }
                        precise float productValue286 = sumValue131 * reinterpretedBits12.x;
                        precise float sumValue238 = productValue286 + reinterpretedBits13.x;
                        precise float productValue288 = sumValue132 * reinterpretedBits12.y;
                        precise float sumValue239 = productValue288 + reinterpretedBits13.y;
                        precise float sumValue240 = reinterpretedBits16 + scalarValue41;
                        precise float sumValue241 = sumValue240 - reinterpretedBits14;
                        float scalarValue49 = min(sumValue241, reinterpretedBits16);
                        float intermediateValue333;
                        float intermediateValue334;
                        if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, productValue223 * 4 + 0) & 4u) == 0u)
                        {
                            float branchMergedValue32;
                            float branchMergedValue71;
                            if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, productValue223 * 4 + 0) & 16u) == 0u)
                            {
                                float branchMergedValue111;
                                float branchMergedValue133;
                                if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, productValue223 * 4 + 0) & 8u) == 0u)
                                {
                                    branchMergedValue111 = 0.0f;
                                    branchMergedValue133 = 0.0f;
                                }
                                else
                                {
                                    precise float productValue289 = scalarValue49 * (-1.0f);
                                    precise float sumValue242 = productValue289 + 2.0f;
                                    float clampedValue2 = clamp(sumValue242, 0.0f, 1.0f);
                                    float branchMergedValue182;
                                    float branchMergedValue185;
                                    if (clampedValue2 > 0.0f)
                                    {
                                        uint reinterpretedBits38;
                                        if (productValue226)
                                        {
                                            reinterpretedBits38 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits38 = productValue225;
                                        }
                                        uint unusedTextureMipCount3735;
                                        uint2 sumValue243 = rdTextureSize(textures[NonUniformResourceIndex(reinterpretedBits38 + 0u)], 0u, unusedTextureMipCount3735);
                                        precise float productValue290 = sumValue238 * float(int(uint(int(float(int(sumValue243.x))))));
                                        precise float productValue291 = sumValue239 * float(int(uint(int(float(int(sumValue243.y))))));
                                        float scalarValue50 = frac(productValue290);
                                        float scalarValue51 = frac(productValue291);
                                        precise float sumValue244 = scalarValue50 + (-0.5f);
                                        float intermediateValue339;
                                        if (abs(sumValue244) < 0.0625f)
                                        {
                                            precise float comparisonValue32 = sumValue238 + ((scalarValue50 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f));
                                            intermediateValue339 = comparisonValue32;
                                        }
                                        else
                                        {
                                            intermediateValue339 = sumValue238;
                                        }
                                        precise float sumValue245 = scalarValue51 + (-0.5f);
                                        float intermediateValue340;
                                        if (abs(sumValue245) < 0.0625f)
                                        {
                                            precise float comparisonValue33 = sumValue239 + ((scalarValue51 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f));
                                            intermediateValue340 = comparisonValue33;
                                        }
                                        else
                                        {
                                            intermediateValue340 = sumValue239;
                                        }
                                        float4 vectorValue8 = textures[NonUniformResourceIndex(sumValue170)].GatherRed(defaultSampler, float2(intermediateValue339, intermediateValue340));
                                        float scalarValue52 = vectorValue8.x;
                                        float scalarValue53 = vectorValue8.y;
                                        float scalarValue54 = vectorValue8.z;
                                        float scalarValue55 = vectorValue8.w;
                                        precise float sumValue246 = productValue290 + 0.5f;
                                        precise float sumValue247 = productValue291 + 0.5f;
                                        float scalarValue56 = frac(sumValue246);
                                        float scalarValue57 = frac(sumValue247);
                                        bool conditionValue2 = scalarValue57 > 0.5f;
                                        intermediateValue[0u] = conditionValue2 ? scalarValue52 : scalarValue55;
                                        intermediateValue[1u] = conditionValue2 ? scalarValue53 : scalarValue54;
                                        precise float clampedValue3 = intermediateValue[uint(int(clamp((scalarValue56 - viewCbConstants[89u].w) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((viewCbConstants[89u].w + scalarValue56) * 2.0f, 0.0f, 1.0f)))];
                                        bool conditionValue3 = scalarValue56 > 0.5f;
                                        float comparisonValue35 = conditionValue3 ? scalarValue54 : scalarValue55;
                                        float comparisonValue36 = conditionValue3 ? scalarValue53 : scalarValue52;
                                        intermediateValue[0u] = comparisonValue35;
                                        intermediateValue[1u] = comparisonValue36;
                                        precise float sumValue248 = (-0.0f) - viewCbConstants[89u].w;
                                        precise float comparisonValue37 = ((comparisonValue35 > comparisonValue36) ? viewCbConstants[89u].w : sumValue248) * 0.0f;
                                        precise float sumValue249 = scalarValue57 + comparisonValue37;
                                        precise float sumValue250 = sumValue249 - viewCbConstants[89u].w;
                                        precise float sumValue251 = viewCbConstants[89u].w + sumValue249;
                                        precise float productValue292 = sumValue250 * 2.0f;
                                        precise float productValue293 = sumValue251 * 2.0f;
                                        precise float clampedValue4 = intermediateValue[uint(int(clamp(productValue292, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp(productValue293, 0.0f, 1.0f)))];
                                        float inverseLengthValue4 = rsqrt(dot(float3(clampedValue3, clampedValue4, viewCbConstants[90u].x), float3(clampedValue3, clampedValue4, viewCbConstants[90u].x)));
                                        precise float productValue294 = clampedValue3 * inverseLengthValue4;
                                        precise float productValue295 = clampedValue4 * inverseLengthValue4;
                                        precise float productValue296 = clampedValue2 * productValue294;
                                        precise float productValue297 = clampedValue2 * productValue295;
                                        branchMergedValue182 = productValue297;
                                        branchMergedValue185 = productValue296;
                                    }
                                    else
                                    {
                                        branchMergedValue182 = 0.0f;
                                        branchMergedValue185 = 0.0f;
                                    }
                                    branchMergedValue111 = branchMergedValue182;
                                    branchMergedValue133 = branchMergedValue185;
                                }
                                branchMergedValue32 = branchMergedValue111;
                                branchMergedValue71 = branchMergedValue133;
                            }
                            else
                            {
                                precise float productValue298 = scalarValue49 * (-1.0f);
                                precise float sumValue252 = productValue298 + 2.0f;
                                float clampedValue5 = clamp(sumValue252, 0.0f, 1.0f);
                                float branchMergedValue112;
                                float branchMergedValue134;
                                if (clampedValue5 > 0.0f)
                                {
                                    uint reinterpretedBits37;
                                    if (productValue226)
                                    {
                                        reinterpretedBits37 = asuint(viewCbConstants[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits37 = productValue225;
                                    }
                                    uint unusedTextureMipCount3662;
                                    uint2 sumValue253 = rdTextureSize(textures[NonUniformResourceIndex(reinterpretedBits37 + 0u)], 0u, unusedTextureMipCount3662);
                                    precise float productValue299 = sumValue238 * float(int(uint(int(float(int(sumValue253.x))))));
                                    precise float productValue300 = sumValue239 * float(int(uint(int(float(int(sumValue253.y))))));
                                    float4 sampledTextureValue5 = textures[NonUniformResourceIndex(sumValue170)].SampleLevel(defaultSampler, float2(sumValue238, sumValue239), 0.0f);
                                    float scalarValue58 = frac(productValue299);
                                    float scalarValue59 = frac(productValue300);
                                    precise float sumValue254 = 1.0f - viewCbConstants[89u].w;
                                    precise float productValue301 = sampledTextureValue5.y * 2.0f;
                                    precise float sumValue255 = productValue301 + (-1.0f);
                                    precise float comparisonValue38 = sumValue255 * ((scalarValue58 < sumValue254) ? 0.0f : 1.0f);
                                    precise float productValue302 = sampledTextureValue5.w * 2.0f;
                                    precise float sumValue256 = productValue302 + (-1.0f);
                                    precise float comparisonValue39 = sumValue256 * ((viewCbConstants[89u].w < scalarValue58) ? 0.0f : 1.0f);
                                    precise float productValue303 = sampledTextureValue5.z * 2.0f;
                                    precise float sumValue257 = productValue303 + (-1.0f);
                                    precise float comparisonValue40 = sumValue257 * ((scalarValue59 < sumValue254) ? 0.0f : 1.0f);
                                    precise float productValue304 = sampledTextureValue5.x * 2.0f;
                                    precise float sumValue258 = productValue304 + (-1.0f);
                                    precise float comparisonValue41 = sumValue258 * ((viewCbConstants[89u].w < scalarValue59) ? 0.0f : 1.0f);
                                    precise float sumValue259 = comparisonValue38 - comparisonValue39;
                                    precise float sumValue260 = comparisonValue40 - comparisonValue41;
                                    precise float comparisonValue43 = ((abs(sumValue259) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * sumValue259;
                                    precise float comparisonValue44 = ((abs(sumValue260) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * sumValue260;
                                    float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue43, comparisonValue44, viewCbConstants[90u].x), float3(comparisonValue43, comparisonValue44, viewCbConstants[90u].x)));
                                    precise float productValue305 = inverseLengthValue5 * comparisonValue43;
                                    precise float productValue306 = inverseLengthValue5 * comparisonValue44;
                                    precise float productValue307 = clampedValue5 * productValue305;
                                    precise float productValue308 = clampedValue5 * productValue306;
                                    branchMergedValue112 = productValue308;
                                    branchMergedValue134 = productValue307;
                                }
                                else
                                {
                                    branchMergedValue112 = 0.0f;
                                    branchMergedValue134 = 0.0f;
                                }
                                branchMergedValue32 = branchMergedValue112;
                                branchMergedValue71 = branchMergedValue134;
                            }
                            intermediateValue333 = branchMergedValue71;
                            intermediateValue334 = branchMergedValue32;
                        }
                        else
                        {
                            float4 sampledTextureValue6 = textures[NonUniformResourceIndex(sumValue170)].SampleLevel(defaultSampler, float2(sumValue238, sumValue239), scalarValue49);
                            precise float productValue309 = sampledTextureValue6.x * 2.0f;
                            precise float productValue310 = sampledTextureValue6.y * 2.0f;
                            precise float sumValue261 = productValue309 + (-1.0f);
                            precise float sumValue262 = productValue310 + (-1.0f);
                            intermediateValue333 = sumValue261;
                            intermediateValue334 = sumValue262;
                        }
                        float dotProductValue3 = dot(float3(intermediateValue301, intermediateValue303, intermediateValue305), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                        float productValue311 = (reinterpretedBits35 * 5.0f) * viewCbConstants[84u].w;
                        bool comparisonValue45 = (intermediateValue103 & 3221225472u) == 2147483648u;
                        precise float productValue312 = intermediateValue333 * 0.25f;
                        precise float productValue313 = intermediateValue334 * 0.25f;
                        float comparisonValue46 = comparisonValue45 ? productValue312 : intermediateValue333;
                        float comparisonValue47 = comparisonValue45 ? productValue313 : intermediateValue334;
                        precise float sumValue263 = (-0.0f) - comparisonValue46;
                        precise float sumValue264 = (-0.0f) - comparisonValue47;
                        float comparisonValue48 = dotProductValue ? sumValue263 : comparisonValue46;
                        float comparisonValue49 = dotProductValue ? sumValue264 : comparisonValue47;
                        precise float productValue314 = comparisonValue48 * comparisonValue48;
                        precise float sumValue265 = 1.0f - productValue314;
                        precise float productValue315 = comparisonValue49 * comparisonValue49;
                        precise float sumValue266 = sumValue265 - productValue315;
                        precise float productValue316 = productValue200 * comparisonValue48;
                        precise float productValue317 = productValue201 * comparisonValue48;
                        precise float productValue318 = productValue202 * comparisonValue48;
                        precise float productValue319 = productValue212 * comparisonValue49;
                        precise float productValue320 = productValue213 * comparisonValue49;
                        precise float productValue321 = productValue214 * comparisonValue49;
                        precise float sumValue267 = productValue316 + productValue319;
                        precise float sumValue268 = productValue317 + productValue320;
                        precise float sumValue269 = productValue318 + productValue321;
                        float nonlinearValue4 = max(sqrt(sumValue266), 0.00999999977648258209228515625f);
                        precise float productValue322 = comparisonValue23 * nonlinearValue4;
                        precise float productValue323 = comparisonValue24 * nonlinearValue4;
                        precise float productValue324 = comparisonValue25 * nonlinearValue4;
                        precise float sumValue270 = sumValue267 + productValue322;
                        precise float sumValue271 = sumValue268 + productValue323;
                        precise float sumValue272 = sumValue269 + productValue324;
                        precise float dotProductValue4 = dot(float3(intermediateValue36, intermediateValue38, intermediateValue40), float3(sumValue270, sumValue271, sumValue272)) * 2.0f;
                        precise float productValue325 = dotProductValue4 * sumValue270;
                        precise float productValue326 = dotProductValue4 * sumValue271;
                        precise float productValue327 = dotProductValue4 * sumValue272;
                        precise float sumValue273 = intermediateValue36 - productValue325;
                        precise float sumValue274 = intermediateValue38 - productValue326;
                        precise float sumValue275 = intermediateValue40 - productValue327;
                        precise float dotProductValue5 = dot(float3(comparisonValue23, comparisonValue24, comparisonValue25), float3(sumValue273, sumValue274, sumValue275));
                        float intermediateValue297;
                        float intermediateValue298;
                        float intermediateValue299;
                        if (dotProductValue5 < 0.0f)
                        {
                            float dotProductValue6 = max(0.001000000047497451305389404296875f, dot(float3(sumValue270, sumValue271, sumValue272), float3(comparisonValue23, comparisonValue24, comparisonValue25)));
                            precise float productValue328 = sumValue270 * dotProductValue5;
                            precise float productValue329 = sumValue271 * dotProductValue5;
                            precise float productValue330 = sumValue272 * dotProductValue5;
                            precise float quotientValue3 = productValue328 / dotProductValue6;
                            precise float quotientValue4 = productValue329 / dotProductValue6;
                            precise float quotientValue5 = productValue330 / dotProductValue6;
                            precise float sumValue276 = sumValue273 - quotientValue3;
                            precise float sumValue277 = sumValue274 - quotientValue4;
                            precise float sumValue278 = sumValue275 - quotientValue5;
                            float inverseLengthValue6 = rsqrt(dot(float3(sumValue276, sumValue277, sumValue278), float3(sumValue276, sumValue277, sumValue278)));
                            precise float productValue331 = sumValue276 * inverseLengthValue6;
                            precise float productValue332 = sumValue277 * inverseLengthValue6;
                            precise float productValue333 = sumValue278 * inverseLengthValue6;
                            precise float sumValue279 = productValue331 - intermediateValue36;
                            precise float sumValue280 = productValue332 - intermediateValue38;
                            precise float sumValue281 = productValue333 - intermediateValue40;
                            float inverseLengthValue7 = rsqrt(dot(float3(sumValue279, sumValue280, sumValue281), float3(sumValue279, sumValue280, sumValue281)));
                            precise float productValue334 = sumValue279 * inverseLengthValue7;
                            precise float productValue335 = sumValue280 * inverseLengthValue7;
                            precise float productValue336 = sumValue281 * inverseLengthValue7;
                            intermediateValue297 = productValue334;
                            intermediateValue298 = productValue335;
                            intermediateValue299 = productValue336;
                        }
                        else
                        {
                            intermediateValue297 = sumValue270;
                            intermediateValue298 = sumValue271;
                            intermediateValue299 = sumValue272;
                        }
                        precise float sumValue282 = 0.0f - reinterpretedBits36;
                        precise float productValue337 = sumValue282 * viewCbConstants[85u].w;
                        precise float sumValue283 = reinterpretedBits36 + productValue337;
                        branchMergedValue28 = reinterpretedBits31;
                        branchMergedValue48 = intermediateValue296;
                        branchMergedValue49 = intermediateValue305;
                        branchMergedValue50 = intermediateValue303;
                        branchMergedValue51 = intermediateValue301;
                        branchMergedValue52 = (reinterpretedBits31 * (intermediateValue305 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                        branchMergedValue53 = (reinterpretedBits31 * (intermediateValue303 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                        branchMergedValue54 = (reinterpretedBits31 * (intermediateValue301 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
                        branchMergedValue55 = productValue311 * (((dotProductValue3 - intermediateValue305) * viewCbConstants[85u].x) + intermediateValue305);
                        branchMergedValue56 = productValue311 * (((dotProductValue3 - intermediateValue303) * viewCbConstants[85u].x) + intermediateValue303);
                        branchMergedValue81 = productValue311 * (((dotProductValue3 - intermediateValue301) * viewCbConstants[85u].x) + intermediateValue301);
                        branchMergedValue82 = intermediateValue299;
                        branchMergedValue83 = intermediateValue298;
                        branchMergedValue84 = intermediateValue297;
                        branchMergedValue85 = sumValue283;
                    }
                    else
                    {
                        branchMergedValue28 = intermediateValue14;
                        branchMergedValue48 = intermediateValue11;
                        branchMergedValue49 = exp2(log2(viewCbConstants[98u].y * intermediateValue289) * 1.39999997615814208984375f);
                        branchMergedValue50 = exp2(log2(viewCbConstants[98u].y * intermediateValue288) * 1.39999997615814208984375f);
                        branchMergedValue51 = exp2(log2(viewCbConstants[98u].y * intermediateValue287) * 1.39999997615814208984375f);
                        branchMergedValue52 = intermediateValue34;
                        branchMergedValue53 = intermediateValue32;
                        branchMergedValue54 = intermediateValue30;
                        branchMergedValue55 = intermediateValue28;
                        branchMergedValue56 = intermediateValue26;
                        branchMergedValue81 = intermediateValue24;
                        branchMergedValue82 = intermediateValue22;
                        branchMergedValue83 = intermediateValue20;
                        branchMergedValue84 = intermediateValue18;
                        branchMergedValue85 = intermediateValue16;
                    }
                    intermediateValue128 = branchMergedValue48;
                    intermediateValue129 = branchMergedValue28;
                    intermediateValue130 = branchMergedValue85;
                    intermediateValue131 = branchMergedValue84;
                    intermediateValue132 = branchMergedValue83;
                    intermediateValue133 = branchMergedValue82;
                    intermediateValue134 = branchMergedValue81;
                    intermediateValue135 = branchMergedValue56;
                    intermediateValue136 = branchMergedValue55;
                    intermediateValue137 = branchMergedValue54;
                    intermediateValue138 = branchMergedValue53;
                    intermediateValue139 = branchMergedValue52;
                    intermediateValue300 = branchMergedValue51;
                    intermediateValue302 = branchMergedValue50;
                    intermediateValue304 = branchMergedValue49;
                }
                else
                {
                    intermediateValue128 = intermediateValue11;
                    intermediateValue129 = intermediateValue14;
                    intermediateValue130 = intermediateValue16;
                    intermediateValue131 = intermediateValue18;
                    intermediateValue132 = intermediateValue20;
                    intermediateValue133 = intermediateValue22;
                    intermediateValue134 = intermediateValue24;
                    intermediateValue135 = intermediateValue26;
                    intermediateValue136 = intermediateValue28;
                    intermediateValue137 = intermediateValue30;
                    intermediateValue138 = intermediateValue32;
                    intermediateValue139 = intermediateValue34;
                    intermediateValue300 = exp2(log2(viewCbConstants[98u].x * intermediateValue287) * 1.7999999523162841796875f);
                    intermediateValue302 = exp2(log2(viewCbConstants[98u].x * intermediateValue288) * 1.7999999523162841796875f);
                    intermediateValue304 = exp2(log2(viewCbConstants[98u].x * intermediateValue289) * 1.7999999523162841796875f);
                }
                float comparisonValue50 = (int(intermediateValue103) > int(4294967295u)) ? 1.0f : intermediateValue128;
                float intermediateValue141;
                float intermediateValue143;
                float intermediateValue145;
                float intermediateValue147;
                float intermediateValue149;
                float intermediateValue151;
                float intermediateValue156;
                float intermediateValue158;
                float intermediateValue160;
                float intermediateValue162;
                float intermediateValue164;
                float intermediateValue166;
                if (intermediateValue103 > 3221225471u)
                {
                    precise float sumValue284 = sumValue139 - viewCbConstants[68u].x;
                    precise float sumValue285 = sumValue145 - viewCbConstants[68u].z;
                    precise float dotProductValue7 = sumValue168 / max(0.001000000047497451305389404296875f, abs(dot(float3(comparisonValue23, comparisonValue24, comparisonValue25), float3(intermediateValue36, intermediateValue38, intermediateValue40))));
                    precise float sumValue286 = dotProductValue7 + (-0.00999999977648258209228515625f);
                    precise float quotientValue6 = sumValue286 / 0.0199999995529651641845703125f;
                    float clampedValue6 = clamp(quotientValue6, 0.0f, 1.0f);
                    precise float productValue338 = clampedValue6 * 2.0f;
                    precise float sumValue287 = 3.0f - productValue338;
                    precise float productValue339 = clampedValue6 * sumValue287;
                    precise float productValue340 = clampedValue6 * productValue339;
                    precise float sumValue288 = 1.0f - productValue340;
                    float intermediateValue310;
                    float intermediateValue311;
                    float intermediateValue312;
                    if (sumValue288 == 0.0f)
                    {
                        intermediateValue310 = comparisonValue23;
                        intermediateValue311 = comparisonValue24;
                        intermediateValue312 = comparisonValue25;
                    }
                    else
                    {
                        precise float sumValue289 = sumValue142 - viewCbConstants[68u].y;
                        bool comparisonValue51 = abs(float(comparisonValue24 < 0.9900000095367431640625f)) != 0.0f;
                        precise float productValue341 = comparisonValue24 * 0.0f;
                        precise float sumValue290 = comparisonValue25 - productValue341;
                        precise float productValue342 = comparisonValue23 * 0.0f;
                        precise float productValue343 = comparisonValue25 * 0.0f;
                        precise float sumValue291 = productValue342 - productValue343;
                        precise float sumValue292 = productValue341 - comparisonValue23;
                        float inverseLengthValue8 = rsqrt(dot(float3(sumValue290, sumValue291, sumValue292), float3(sumValue290, sumValue291, sumValue292)));
                        precise float productValue344 = sumValue290 * inverseLengthValue8;
                        precise float productValue345 = sumValue291 * inverseLengthValue8;
                        precise float productValue346 = sumValue292 * inverseLengthValue8;
                        float comparisonValue52 = comparisonValue51 ? productValue344 : 1.0f;
                        float comparisonValue53 = comparisonValue51 ? productValue345 : 0.0f;
                        float comparisonValue54 = comparisonValue51 ? productValue346 : 0.0f;
                        precise float productValue347 = comparisonValue24 * comparisonValue54;
                        precise float productValue348 = comparisonValue25 * comparisonValue53;
                        precise float sumValue293 = productValue347 - productValue348;
                        precise float productValue349 = comparisonValue25 * comparisonValue52;
                        precise float productValue350 = comparisonValue23 * comparisonValue54;
                        precise float sumValue294 = productValue349 - productValue350;
                        precise float productValue351 = comparisonValue23 * comparisonValue53;
                        precise float productValue352 = comparisonValue24 * comparisonValue52;
                        precise float sumValue295 = productValue351 - productValue352;
                        precise float productValue353 = sumValue289 * 0.100000001490116119384765625f;
                        precise float dotProductValue8 = dot(float3(sumValue284, productValue353, sumValue285), float3(comparisonValue52, comparisonValue53, comparisonValue54));
                        precise float dotProductValue9 = dot(float3(sumValue284, productValue353, sumValue285), float3(sumValue293, sumValue294, sumValue295));
                        precise float productValue354 = dotProductValue8 * 0.60000002384185791015625f;
                        precise float productValue355 = dotProductValue9 * 0.60000002384185791015625f;
                        precise float productValue356 = viewCbConstants[97u].z * 0.00999999977648258209228515625f;
                        precise float productValue357 = viewCbConstants[97u].z * 0.0199999995529651641845703125f;
                        precise float productValue358 = productValue356 * 2.5f;
                        precise float productValue359 = productValue357 * 2.5f;
                        precise float sumValue296 = productValue354 + productValue358;
                        precise float sumValue297 = productValue355 + productValue359;
                        float4 sampledTextureValue7 = waterNormalsTexture.SampleLevel(linearWrapSampler, float2(sumValue296, sumValue297), 0.0f);
                        precise float productValue360 = sampledTextureValue7.x * 2.0f;
                        precise float productValue361 = sampledTextureValue7.y * 2.0f;
                        precise float sumValue298 = productValue360 + (-1.0f);
                        precise float sumValue299 = productValue361 + (-1.0f);
                        precise float productValue362 = sumValue298 * 0.300000011920928955078125f;
                        precise float productValue363 = sumValue299 * 0.300000011920928955078125f;
                        precise float productValue364 = dotProductValue8 * 0.300000011920928955078125f;
                        precise float productValue365 = dotProductValue9 * 0.300000011920928955078125f;
                        precise float productValue366 = viewCbConstants[97u].z * 0.0130000002682209014892578125f;
                        precise float productValue367 = viewCbConstants[97u].z * 0.01400000043213367462158203125f;
                        precise float productValue368 = productValue366 * 2.5f;
                        precise float productValue369 = productValue367 * 2.5f;
                        precise float sumValue300 = productValue364 + productValue368;
                        precise float sumValue301 = productValue365 + productValue369;
                        float4 sampledTextureValue8 = waterNormalsTexture.SampleLevel(linearWrapSampler, float2(sumValue300, sumValue301), 0.0f);
                        precise float productValue370 = sampledTextureValue8.x * 2.0f;
                        precise float productValue371 = sampledTextureValue8.y * 2.0f;
                        precise float sumValue302 = productValue370 + (-1.0f);
                        precise float sumValue303 = productValue371 + (-1.0f);
                        precise float productValue372 = sumValue302 * 0.5f;
                        precise float productValue373 = sumValue303 * 0.5f;
                        precise float productValue374 = dotProductValue8 * 0.61000001430511474609375f;
                        precise float productValue375 = dotProductValue9 * 0.61000001430511474609375f;
                        precise float productValue376 = viewCbConstants[97u].z * (-0.00999999977648258209228515625f);
                        precise float productValue377 = viewCbConstants[97u].z * (-0.0199999995529651641845703125f);
                        precise float productValue378 = productValue376 * 2.5f;
                        precise float productValue379 = productValue377 * 2.5f;
                        precise float sumValue304 = productValue374 + productValue378;
                        precise float sumValue305 = productValue375 + productValue379;
                        float4 sampledTextureValue9 = waterNormalsTexture.SampleLevel(linearWrapSampler, float2(sumValue304, sumValue305), 0.0f);
                        precise float productValue380 = sampledTextureValue9.x * 2.0f;
                        precise float productValue381 = sampledTextureValue9.y * 2.0f;
                        precise float sumValue306 = productValue380 + (-1.0f);
                        precise float sumValue307 = productValue381 + (-1.0f);
                        precise float productValue382 = sumValue306 * 0.300000011920928955078125f;
                        precise float productValue383 = sumValue307 * 0.300000011920928955078125f;
                        precise float sumValue308 = productValue362 + productValue372;
                        precise float sumValue309 = productValue363 + productValue373;
                        precise float sumValue310 = sampledTextureValue7.z + sampledTextureValue8.z;
                        precise float sumValue311 = sumValue308 + productValue382;
                        precise float sumValue312 = sumValue309 + productValue383;
                        precise float sumValue313 = sumValue310 + sampledTextureValue9.z;
                        precise float productValue384 = sumValue288 * sumValue311;
                        precise float productValue385 = sumValue288 * sumValue312;
                        float inverseLengthValue9 = rsqrt(dot(float3(productValue384, productValue385, sumValue313), float3(productValue384, productValue385, sumValue313)));
                        precise float productValue386 = inverseLengthValue9 * productValue384;
                        precise float productValue387 = inverseLengthValue9 * productValue385;
                        precise float productValue388 = sumValue313 * inverseLengthValue9;
                        precise float productValue389 = comparisonValue52 * productValue386;
                        precise float productValue390 = comparisonValue53 * productValue386;
                        precise float productValue391 = comparisonValue54 * productValue386;
                        precise float productValue392 = sumValue293 * productValue387;
                        precise float productValue393 = sumValue294 * productValue387;
                        precise float productValue394 = sumValue295 * productValue387;
                        precise float sumValue314 = productValue389 + productValue392;
                        precise float sumValue315 = productValue390 + productValue393;
                        precise float sumValue316 = productValue391 + productValue394;
                        precise float productValue395 = comparisonValue23 * productValue388;
                        precise float productValue396 = comparisonValue24 * productValue388;
                        precise float productValue397 = comparisonValue25 * productValue388;
                        precise float sumValue317 = productValue395 + sumValue314;
                        precise float sumValue318 = productValue396 + sumValue315;
                        precise float sumValue319 = productValue397 + sumValue316;
                        intermediateValue310 = sumValue317;
                        intermediateValue311 = sumValue318;
                        intermediateValue312 = sumValue319;
                    }
                    precise float productValue398 = comparisonValue50 * 0.5f;
                    float branchMergedValue29;
                    float branchMergedValue57;
                    float branchMergedValue58;
                    float branchMergedValue59;
                    float branchMergedValue60;
                    float branchMergedValue61;
                    float branchMergedValue62;
                    float branchMergedValue63;
                    float branchMergedValue64;
                    float branchMergedValue65;
                    float branchMergedValue86;
                    float branchMergedValue87;
                    if ((asuint(viewCbConstants[54u]).w != 0u) && (asuint(viewCbConstants[91u]).y == 2u))
                    {
                        precise float sumValue320 = (-0.0f) - intermediateValue310;
                        precise float sumValue321 = (-0.0f) - intermediateValue311;
                        precise float sumValue322 = (-0.0f) - intermediateValue312;
                        float branchMergedValue109;
                        float branchMergedValue122;
                        float branchMergedValue123;
                        float branchMergedValue124;
                        float branchMergedValue125;
                        float branchMergedValue126;
                        float branchMergedValue127;
                        float branchMergedValue128;
                        float branchMergedValue129;
                        float branchMergedValue130;
                        float branchMergedValue145;
                        float branchMergedValue146;
                        if (dot(float3(intermediateValue36, intermediateValue38, intermediateValue40), float3(sumValue320, sumValue321, sumValue322)) < 0.65939998626708984375f)
                        {
                            branchMergedValue109 = intermediateValue311;
                            branchMergedValue122 = 1.0f;
                            branchMergedValue123 = 1.0f;
                            branchMergedValue124 = 1.0f;
                            branchMergedValue125 = 1.0f;
                            branchMergedValue126 = 1.0f;
                            branchMergedValue127 = 1.0f;
                            branchMergedValue128 = 1.0f;
                            branchMergedValue129 = intermediateValue312;
                            branchMergedValue130 = 1.0f;
                            branchMergedValue145 = intermediateValue310;
                            branchMergedValue146 = 0.0f;
                        }
                        else
                        {
                            branchMergedValue109 = intermediateValue311;
                            branchMergedValue122 = intermediateValue129;
                            branchMergedValue123 = intermediateValue304;
                            branchMergedValue124 = intermediateValue302;
                            branchMergedValue125 = intermediateValue300;
                            branchMergedValue126 = intermediateValue139;
                            branchMergedValue127 = intermediateValue138;
                            branchMergedValue128 = intermediateValue137;
                            branchMergedValue129 = intermediateValue312;
                            branchMergedValue130 = comparisonValue50;
                            branchMergedValue145 = intermediateValue310;
                            branchMergedValue146 = productValue398;
                        }
                        branchMergedValue29 = branchMergedValue109;
                        branchMergedValue57 = branchMergedValue122;
                        branchMergedValue58 = branchMergedValue123;
                        branchMergedValue59 = branchMergedValue124;
                        branchMergedValue60 = branchMergedValue125;
                        branchMergedValue61 = branchMergedValue126;
                        branchMergedValue62 = branchMergedValue127;
                        branchMergedValue63 = branchMergedValue128;
                        branchMergedValue64 = branchMergedValue129;
                        branchMergedValue65 = branchMergedValue130;
                        branchMergedValue86 = branchMergedValue145;
                        branchMergedValue87 = branchMergedValue146;
                    }
                    else
                    {
                        branchMergedValue29 = intermediateValue311;
                        branchMergedValue57 = intermediateValue129;
                        branchMergedValue58 = intermediateValue304;
                        branchMergedValue59 = intermediateValue302;
                        branchMergedValue60 = intermediateValue300;
                        branchMergedValue61 = intermediateValue139;
                        branchMergedValue62 = intermediateValue138;
                        branchMergedValue63 = intermediateValue137;
                        branchMergedValue64 = intermediateValue312;
                        branchMergedValue65 = comparisonValue50;
                        branchMergedValue86 = intermediateValue310;
                        branchMergedValue87 = productValue398;
                    }
                    intermediateValue141 = branchMergedValue65;
                    intermediateValue143 = branchMergedValue57;
                    intermediateValue145 = branchMergedValue87;
                    intermediateValue147 = branchMergedValue86;
                    intermediateValue149 = branchMergedValue29;
                    intermediateValue151 = branchMergedValue64;
                    intermediateValue156 = branchMergedValue63;
                    intermediateValue158 = branchMergedValue62;
                    intermediateValue160 = branchMergedValue61;
                    intermediateValue162 = branchMergedValue60;
                    intermediateValue164 = branchMergedValue59;
                    intermediateValue166 = branchMergedValue58;
                }
                else
                {
                    intermediateValue141 = comparisonValue50;
                    intermediateValue143 = intermediateValue129;
                    intermediateValue145 = intermediateValue130;
                    intermediateValue147 = intermediateValue131;
                    intermediateValue149 = intermediateValue132;
                    intermediateValue151 = intermediateValue133;
                    intermediateValue156 = intermediateValue137;
                    intermediateValue158 = intermediateValue138;
                    intermediateValue160 = intermediateValue139;
                    intermediateValue162 = intermediateValue300;
                    intermediateValue164 = intermediateValue302;
                    intermediateValue166 = intermediateValue304;
                }
                bitwiseValue32 = uint(dotProductValue) ^ 1u;
                multiplyAddValue = (sumValue139 - reinterpretedBits7.w) - mad(comparisonValue29, reinterpretedBits7.z, mad(comparisonValue28, reinterpretedBits7.y, comparisonValue27 * reinterpretedBits7.x));
                multiplyAddValue1 = (sumValue142 - reinterpretedBits8.w) - mad(comparisonValue29, reinterpretedBits8.z, mad(comparisonValue28, reinterpretedBits8.y, comparisonValue27 * reinterpretedBits8.x));
                multiplyAddValue2 = (sumValue145 - reinterpretedBits9.w) - mad(comparisonValue29, reinterpretedBits9.z, mad(comparisonValue28, reinterpretedBits9.y, comparisonValue27 * reinterpretedBits9.x));
                intermediateValue116 = intermediateValue117;
                intermediateValue118 = intermediateValue119;
                intermediateValue120 = intermediateValue121;
                intermediateValue122 = comparisonValue23;
                intermediateValue123 = comparisonValue24;
                intermediateValue124 = comparisonValue25;
                intermediateValue125 = sumValue139;
                intermediateValue126 = sumValue142;
                intermediateValue127 = sumValue145;
                intermediateValue12 = intermediateValue128;
                intermediateValue15 = intermediateValue129;
                intermediateValue17 = intermediateValue130;
                intermediateValue19 = intermediateValue131;
                intermediateValue21 = intermediateValue132;
                intermediateValue23 = intermediateValue133;
                intermediateValue25 = intermediateValue134;
                intermediateValue27 = intermediateValue135;
                intermediateValue29 = intermediateValue136;
                intermediateValue31 = intermediateValue137;
                intermediateValue33 = intermediateValue138;
                intermediateValue35 = intermediateValue139;
                intermediateValue140 = intermediateValue141;
                intermediateValue142 = intermediateValue143;
                intermediateValue144 = intermediateValue145;
                intermediateValue146 = intermediateValue147;
                intermediateValue148 = intermediateValue149;
                intermediateValue150 = intermediateValue151;
                intermediateValue152 = intermediateValue134;
                intermediateValue153 = intermediateValue135;
                intermediateValue154 = intermediateValue136;
                intermediateValue155 = intermediateValue156;
                intermediateValue157 = intermediateValue158;
                intermediateValue159 = intermediateValue160;
                intermediateValue161 = intermediateValue162;
                intermediateValue163 = intermediateValue164;
                intermediateValue165 = intermediateValue166;
                bitwiseValue4 = uint(((rdByteLoad_objectInstances_uint16_t(0u, productValue88 * 2 + 0) >> 8u) & 1u) ^ 1u);
            }
            else
            {
                bitwiseValue32 = 1u;
                multiplyAddValue = 0.0f;
                multiplyAddValue1 = 0.0f;
                multiplyAddValue2 = 0.0f;
                intermediateValue116 = 0.0f;
                intermediateValue118 = 0.0f;
                intermediateValue120 = 0.0f;
                intermediateValue122 = 0.0f;
                intermediateValue123 = 0.0f;
                intermediateValue124 = 0.0f;
                intermediateValue125 = 0.0f;
                intermediateValue126 = 0.0f;
                intermediateValue127 = 0.0f;
                intermediateValue12 = intermediateValue11;
                intermediateValue15 = intermediateValue14;
                intermediateValue17 = intermediateValue16;
                intermediateValue19 = intermediateValue18;
                intermediateValue21 = intermediateValue20;
                intermediateValue23 = intermediateValue22;
                intermediateValue25 = intermediateValue24;
                intermediateValue27 = intermediateValue26;
                intermediateValue29 = intermediateValue28;
                intermediateValue31 = intermediateValue30;
                intermediateValue33 = intermediateValue32;
                intermediateValue35 = intermediateValue34;
                intermediateValue140 = 0.0f;
                intermediateValue142 = 0.0f;
                intermediateValue144 = 0.0f;
                intermediateValue146 = 0.0f;
                intermediateValue148 = 0.0f;
                intermediateValue150 = 0.0f;
                intermediateValue152 = 0.0f;
                intermediateValue153 = 0.0f;
                intermediateValue154 = 0.0f;
                intermediateValue155 = 0.0f;
                intermediateValue157 = 0.0f;
                intermediateValue159 = 0.0f;
                intermediateValue161 = 0.0f;
                intermediateValue163 = 0.0f;
                intermediateValue165 = 0.0f;
                bitwiseValue4 = intermediateValue52;
            }
            bool comparisonValue55 = intermediateValue67 != 1u;
            bool bitwiseValue126 = comparisonValue55 && comparisonValue7;
            if (!((!(intermediateValue101 < 10000.0f)) || comparisonValue21))
            {
                rdByteStore_outputVisibleBLASs_uint(0u, uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue53 * 76u) + 62u) * 2 + 0)) * 4 + 0, asuint(viewCbConstants[84u]).z);
                comparisonValue5 = (intermediateValue73 == 0u) ? intermediateValue101 : intermediateValue53;
                sumValue21 = intermediateValue54 + intermediateValue101;
                intermediateValue350 = comparisonValue5;
                intermediateValue351 = sumValue21;
                half exponentialValue3;
                half exponentialValue4;
                half exponentialValue5;
                if (bitwiseValue126)
                {
                    uint sumValue323 = intermediateValue67 + 63u;
                    float productValue399 = min(intermediateValue101, 50.0f) * (-1.44269502162933349609375f);
                    exponentialValue3 = half(exp2(productValue399 * viewCbConstants[sumValue323].x));
                    exponentialValue4 = half(exp2(productValue399 * viewCbConstants[sumValue323].y));
                    exponentialValue5 = half(exp2(productValue399 * viewCbConstants[sumValue323].z));
                }
                else
                {
                    exponentialValue3 = half(1.0);
                    exponentialValue4 = half(1.0);
                    exponentialValue5 = half(1.0);
                }
                uint16_t bitwiseValue127 = rdByteLoad_objectInstances_uint16_t(0u, productValue91 * 2 + 0) >> 8u;
                uint scalarValue60 = uint(bitwiseValue127);
                if (!((bitwiseValue127 != 3u) && (sumValue21 >= viewCbConstants[51u].z)))
                {
                    half productValue130;
                    half productValue132;
                    half productValue134;
                    half intermediateValue235;
                    half intermediateValue237;
                    half intermediateValue239;
                    uint intermediateValue241;
                    uint intermediateValue243;
                    uint intermediateValue244;
                    float intermediateValue245;
                    if ((intermediateValue142 == 1.0f) && (intermediateValue144 < 0.00999999977648258209228515625f))
                    {
                        intermediateValue197 = intermediateValue146;
                        intermediateValue199 = intermediateValue148;
                        intermediateValue201 = intermediateValue150;
                        intermediateValue203 = intermediateValue161;
                        intermediateValue205 = intermediateValue163;
                        intermediateValue207 = intermediateValue165;
                        intermediateValue49 = intermediateValue48;
                        intermediateValue51 = intermediateValue50;
                        productValue130 = half(intermediateValue155) * intermediateValue55;
                        productValue132 = half(intermediateValue157) * intermediateValue57;
                        productValue134 = half(intermediateValue159) * intermediateValue59;
                        intermediateValue72 = intermediateValue71;
                        intermediateValue235 = exponentialValue3;
                        intermediateValue237 = exponentialValue4;
                        intermediateValue239 = exponentialValue5;
                        intermediateValue241 = scalarValue60;
                        intermediateValue243 = 1u;
                        intermediateValue244 = intermediateValue67;
                        intermediateValue245 = float(intermediateValue69);
                    }
                    else
                    {
                        float intermediateValue226;
                        float intermediateValue227;
                        float intermediateValue228;
                        float intermediateValue229;
                        float intermediateValue230;
                        float intermediateValue231;
                        uint intermediateValue242;
                        if ((bitwiseValue127 == 1u) && (intermediateValue140 >= 1.0f))
                        {
                            intermediateValue226 = intermediateValue146;
                            intermediateValue227 = intermediateValue148;
                            intermediateValue228 = intermediateValue150;
                            intermediateValue229 = intermediateValue161;
                            intermediateValue230 = intermediateValue163;
                            intermediateValue231 = intermediateValue165;
                            intermediateValue242 = 4u;
                        }
                        else
                        {
                            uint branchMergedValue19;
                            float branchMergedValue33;
                            float branchMergedValue34;
                            float branchMergedValue35;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            float branchMergedValue38;
                            if (comparisonValue6 && (bitwiseValue127 == 0u))
                            {
                                branchMergedValue19 = scalarValue60;
                                branchMergedValue33 = intermediateValue165;
                                branchMergedValue34 = intermediateValue163;
                                branchMergedValue35 = intermediateValue161;
                                branchMergedValue36 = intermediateValue124;
                                branchMergedValue37 = intermediateValue123;
                                branchMergedValue38 = intermediateValue122;
                            }
                            else
                            {
                                bool comparisonValue56 = bitwiseValue127 == 3u;
                                branchMergedValue19 = scalarValue60;
                                branchMergedValue33 = comparisonValue56 ? 1.0f : intermediateValue165;
                                branchMergedValue34 = comparisonValue56 ? 1.0f : intermediateValue163;
                                branchMergedValue35 = comparisonValue56 ? 1.0f : intermediateValue161;
                                branchMergedValue36 = intermediateValue150;
                                branchMergedValue37 = intermediateValue148;
                                branchMergedValue38 = intermediateValue146;
                            }
                            intermediateValue226 = branchMergedValue38;
                            intermediateValue227 = branchMergedValue37;
                            intermediateValue228 = branchMergedValue36;
                            intermediateValue229 = branchMergedValue35;
                            intermediateValue230 = branchMergedValue34;
                            intermediateValue231 = branchMergedValue33;
                            intermediateValue242 = branchMergedValue19;
                        }
                        uint comparisonValue34;
                        if (intermediateValue67 == intermediateValue242)
                        {
                            comparisonValue34 = 2u;
                        }
                        else
                        {
                            comparisonValue34 = ((bitwiseValue32 == 0u) && (intermediateValue242 == 3u)) ? intermediateValue67 : intermediateValue242;
                        }
                        precise float sumValue324 = (-0.0f) - intermediateValue226;
                        precise float sumValue325 = (-0.0f) - intermediateValue227;
                        precise float sumValue326 = (-0.0f) - intermediateValue228;
                        precise float dotProductValue10 = dot(float3(intermediateValue36, intermediateValue38, intermediateValue40), float3(sumValue324, sumValue325, sumValue326));
                        uint productValue400 = comparisonValue34 + (intermediateValue67 * 5u);
                        float reinterpretedBits17 = asfloat(rdByteLoad_checkerboardActionsBuffer_uint(0u, ((productValue400 * 3u) + 2u) * 4 + 0));
                        float reinterpretedBits19 = asfloat(rdByteLoad_refractionIndicesBuffer_uint(0u, comparisonValue34 * 4 + 0));
                        uint16_t comparisonValue42;
                        if (!(dotProductValue10 <= reinterpretedBits17))
                        {
                            comparisonValue42 = (intermediateValue71 == 0u) ? (comparisonValue2 ? rdByteLoad_checkerboardActionsBuffer_uint16_t(0u, (productValue400 * 6u) * 2 + 0) : rdByteLoad_checkerboardActionsBuffer_uint16_t(0u, ((productValue400 * 6u) + 1u) * 2 + 0)) : rdByteLoad_checkerboardActionsBuffer_uint16_t(0u, ((productValue400 * 6u) + 2u) * 2 + 0);
                        }
                        else
                        {
                            comparisonValue42 = rdByteLoad_checkerboardActionsBuffer_uint16_t(0u, ((productValue400 * 6u) + 3u) * 2 + 0);
                        }
                        uint scalarValue61 = uint(comparisonValue42);
                        precise float sumValue327 = dotProductValue10 + (-1.0f);
                        precise float sumValue328 = 1.0f - reinterpretedBits17;
                        precise float quotientValue7 = sumValue327 / sumValue328;
                        precise float sumValue329 = quotientValue7 + 1.0f;
                        float scalarValue62 = float(intermediateValue69);
                        precise float sumValue330 = reinterpretedBits19 - scalarValue62;
                        precise float sumValue331 = scalarValue62 + reinterpretedBits19;
                        precise float quotientValue8 = sumValue330 / sumValue331;
                        precise float productValue401 = quotientValue8 * quotientValue8;
                        precise float sumValue332 = 1.0f - productValue401;
                        precise float clampedValue7 = 1.0f - clamp(sumValue329, 0.0f, 1.0f);
                        precise float nonlinearValue5 = log2(clampedValue7) * 5.0f;
                        precise float exponentialValue6 = sumValue332 * exp2(nonlinearValue5);
                        precise float sumValue333 = productValue401 + exponentialValue6;
                        float clampedValue8 = clamp(sumValue333, 0.0f, 1.0f);
                        uint intermediateValue234;
                        half intermediateValue269;
                        half intermediateValue270;
                        half intermediateValue271;
                        uint intermediateValue272;
                        if ((scalarValue61 & 16u) == 0u)
                        {
                            intermediateValue269 = intermediateValue55;
                            intermediateValue270 = intermediateValue57;
                            intermediateValue271 = intermediateValue59;
                            intermediateValue234 = intermediateValue71;
                            intermediateValue272 = scalarValue61;
                        }
                        else
                        {
                            precise float productValue402 = intermediateValue123 * intermediateValue123;
                            bool dotProductValue11 = productValue402 < dot(float2(intermediateValue122, intermediateValue124), float2(intermediateValue122, intermediateValue124));
                            uint intermediateValue280;
                            if (intermediateValue242 == 1u)
                            {
                                uint branchMergedValue23;
                                if (dotProductValue11)
                                {
                                    uint branchMergedValue108;
                                    if (intermediateValue140 > 0.20000000298023223876953125f)
                                    {
                                        branchMergedValue108 = 256u;
                                    }
                                    else
                                    {
                                        branchMergedValue108 = 512u;
                                    }
                                    branchMergedValue23 = branchMergedValue108;
                                }
                                else
                                {
                                    branchMergedValue23 = 0u;
                                }
                                intermediateValue280 = branchMergedValue23;
                            }
                            else
                            {
                                uint branchMergedValue24;
                                if ((comparisonValue34 == 3u) || (comparisonValue9 && (comparisonValue34 == 2u)))
                                {
                                    branchMergedValue24 = 512u;
                                }
                                else
                                {
                                    branchMergedValue24 = (comparisonValue34 == 0u) ? 768u : (dotProductValue11 ? 512u : 256u);
                                }
                                intermediateValue280 = branchMergedValue24;
                            }
                            intermediateValue269 = intermediateValue55 * half(2.0);
                            intermediateValue270 = intermediateValue57 * half(2.0);
                            intermediateValue271 = intermediateValue59 * half(2.0);
                            intermediateValue234 = intermediateValue280 | (intermediateValue73 + 1u);
                            intermediateValue272 = scalarValue61 & 65519u;
                        }
                        uint intermediateValue232;
                        float intermediateValue233;
                        half intermediateValue236;
                        half intermediateValue238;
                        half intermediateValue240;
                        uint intermediateValue276;
                        if ((intermediateValue272 & 32u) == 0u)
                        {
                            intermediateValue232 = intermediateValue48;
                            intermediateValue233 = intermediateValue50;
                            intermediateValue236 = exponentialValue3;
                            intermediateValue238 = exponentialValue4;
                            intermediateValue240 = exponentialValue5;
                            intermediateValue276 = intermediateValue272;
                        }
                        else
                        {
                            float productValue276;
                            if (intermediateValue50 > 0.0f)
                            {
                                productValue276 = 1.0f - (float(exponentialValue3) * (1.0f - intermediateValue50));
                            }
                            else
                            {
                                productValue276 = float(half(1.0) - exponentialValue3);
                            }
                            intermediateValue232 = 1u;
                            intermediateValue233 = productValue276;
                            intermediateValue236 = half(1.0);
                            intermediateValue238 = half(1.0);
                            intermediateValue240 = half(1.0);
                            intermediateValue276 = intermediateValue272 & 65503u;
                        }
                        uint intermediateValue279;
                        if (intermediateValue276 == 3u)
                        {
                            uint branchMergedValue22;
                            if (clampedValue8 > 0.5f)
                            {
                                branchMergedValue22 = 1u;
                            }
                            else
                            {
                                branchMergedValue22 = 2u;
                            }
                            intermediateValue279 = branchMergedValue22;
                        }
                        else
                        {
                            intermediateValue279 = intermediateValue276;
                        }
                        uint comparisonValue57 = (((intermediateValue142 < 1.0f) || (intermediateValue144 > 0.00999999977648258209228515625f)) && ((comparisonValue34 == 1u) && (comparisonValue55 && (intermediateValue279 == 1u)))) ? 0u : intermediateValue279;
                        bool comparisonValue58 = comparisonValue57 == 1u;
                        half productValue131;
                        half productValue133;
                        half productValue135;
                        if (((intermediateValue242 | intermediateValue67) == 0u) && comparisonValue58)
                        {
                            half productValue403 = half((intermediateValue144 * 4.0f) + 0.85000002384185791015625f);
                            productValue131 = intermediateValue269 * productValue403;
                            productValue133 = intermediateValue270 * productValue403;
                            productValue135 = intermediateValue271 * productValue403;
                        }
                        else
                        {
                            productValue131 = intermediateValue269;
                            productValue133 = intermediateValue270;
                            productValue135 = intermediateValue271;
                        }
                        uint branchMergedValue21;
                        float branchMergedValue39;
                        uint branchMergedValue40;
                        half branchMergedValue41;
                        uint branchMergedValue42;
                        half branchMergedValue43;
                        half branchMergedValue44;
                        half branchMergedValue45;
                        uint branchMergedValue46;
                        half branchMergedValue47;
                        half branchMergedValue72;
                        float branchMergedValue73;
                        uint branchMergedValue74;
                        float branchMergedValue75;
                        float branchMergedValue76;
                        float branchMergedValue77;
                        float branchMergedValue78;
                        float branchMergedValue79;
                        float branchMergedValue80;
                        if (comparisonValue58)
                        {
                            half scalarValue63 = half(clampedValue8);
                            branchMergedValue21 = 1u;
                            branchMergedValue39 = reinterpretedBits19;
                            branchMergedValue40 = comparisonValue34;
                            branchMergedValue41 = productValue131 * scalarValue63;
                            branchMergedValue42 = intermediateValue242;
                            branchMergedValue43 = intermediateValue240;
                            branchMergedValue44 = intermediateValue238;
                            branchMergedValue45 = intermediateValue236;
                            branchMergedValue46 = intermediateValue234;
                            branchMergedValue47 = productValue135 * scalarValue63;
                            branchMergedValue72 = productValue133 * scalarValue63;
                            branchMergedValue73 = intermediateValue233;
                            branchMergedValue74 = intermediateValue232;
                            branchMergedValue75 = intermediateValue231;
                            branchMergedValue76 = intermediateValue230;
                            branchMergedValue77 = intermediateValue229;
                            branchMergedValue78 = intermediateValue228;
                            branchMergedValue79 = intermediateValue227;
                            branchMergedValue80 = intermediateValue226;
                        }
                        else
                        {
                            uint branchMergedValue106;
                            float branchMergedValue113;
                            uint branchMergedValue114;
                            half branchMergedValue115;
                            uint branchMergedValue116;
                            half branchMergedValue117;
                            half branchMergedValue118;
                            half branchMergedValue119;
                            uint branchMergedValue120;
                            half branchMergedValue121;
                            half branchMergedValue135;
                            float branchMergedValue136;
                            uint branchMergedValue137;
                            float branchMergedValue138;
                            float branchMergedValue139;
                            float branchMergedValue140;
                            float branchMergedValue141;
                            float branchMergedValue142;
                            float branchMergedValue143;
                            if (comparisonValue57 == 2u)
                            {
                                half scalarValue64 = half(1.0f - clampedValue8);
                                branchMergedValue106 = 2u;
                                branchMergedValue113 = reinterpretedBits19;
                                branchMergedValue114 = comparisonValue34;
                                branchMergedValue115 = productValue131 * scalarValue64;
                                branchMergedValue116 = intermediateValue242;
                                branchMergedValue117 = intermediateValue240;
                                branchMergedValue118 = intermediateValue238;
                                branchMergedValue119 = intermediateValue236;
                                branchMergedValue120 = intermediateValue234;
                                branchMergedValue121 = productValue135 * scalarValue64;
                                branchMergedValue135 = productValue133 * scalarValue64;
                                branchMergedValue136 = intermediateValue233;
                                branchMergedValue137 = intermediateValue232;
                                branchMergedValue138 = intermediateValue231;
                                branchMergedValue139 = intermediateValue230;
                                branchMergedValue140 = intermediateValue229;
                                branchMergedValue141 = intermediateValue228;
                                branchMergedValue142 = intermediateValue227;
                                branchMergedValue143 = intermediateValue226;
                            }
                            else
                            {
                                branchMergedValue106 = comparisonValue57;
                                branchMergedValue113 = reinterpretedBits19;
                                branchMergedValue114 = comparisonValue34;
                                branchMergedValue115 = productValue131;
                                branchMergedValue116 = intermediateValue242;
                                branchMergedValue117 = intermediateValue240;
                                branchMergedValue118 = intermediateValue238;
                                branchMergedValue119 = intermediateValue236;
                                branchMergedValue120 = intermediateValue234;
                                branchMergedValue121 = productValue135;
                                branchMergedValue135 = productValue133;
                                branchMergedValue136 = intermediateValue233;
                                branchMergedValue137 = intermediateValue232;
                                branchMergedValue138 = intermediateValue231;
                                branchMergedValue139 = intermediateValue230;
                                branchMergedValue140 = intermediateValue229;
                                branchMergedValue141 = intermediateValue228;
                                branchMergedValue142 = intermediateValue227;
                                branchMergedValue143 = intermediateValue226;
                            }
                            branchMergedValue21 = branchMergedValue106;
                            branchMergedValue39 = branchMergedValue113;
                            branchMergedValue40 = branchMergedValue114;
                            branchMergedValue41 = branchMergedValue115;
                            branchMergedValue42 = branchMergedValue116;
                            branchMergedValue43 = branchMergedValue117;
                            branchMergedValue44 = branchMergedValue118;
                            branchMergedValue45 = branchMergedValue119;
                            branchMergedValue46 = branchMergedValue120;
                            branchMergedValue47 = branchMergedValue121;
                            branchMergedValue72 = branchMergedValue135;
                            branchMergedValue73 = branchMergedValue136;
                            branchMergedValue74 = branchMergedValue137;
                            branchMergedValue75 = branchMergedValue138;
                            branchMergedValue76 = branchMergedValue139;
                            branchMergedValue77 = branchMergedValue140;
                            branchMergedValue78 = branchMergedValue141;
                            branchMergedValue79 = branchMergedValue142;
                            branchMergedValue80 = branchMergedValue143;
                        }
                        intermediateValue197 = branchMergedValue80;
                        intermediateValue199 = branchMergedValue79;
                        intermediateValue201 = branchMergedValue78;
                        intermediateValue203 = branchMergedValue77;
                        intermediateValue205 = branchMergedValue76;
                        intermediateValue207 = branchMergedValue75;
                        intermediateValue49 = branchMergedValue74;
                        intermediateValue51 = branchMergedValue73;
                        productValue130 = branchMergedValue41;
                        productValue132 = branchMergedValue72;
                        productValue134 = branchMergedValue47;
                        intermediateValue72 = branchMergedValue46;
                        intermediateValue235 = branchMergedValue45;
                        intermediateValue237 = branchMergedValue44;
                        intermediateValue239 = branchMergedValue43;
                        intermediateValue241 = branchMergedValue42;
                        intermediateValue243 = branchMergedValue21;
                        intermediateValue244 = branchMergedValue40;
                        intermediateValue245 = branchMergedValue39;
                    }
                    half productValue404 = intermediateValue235 * productValue130;
                    half productValue405 = intermediateValue237 * productValue132;
                    half productValue406 = intermediateValue239 * productValue134;
                    float branchMergedValue;
                    float branchMergedValue1;
                    half branchMergedValue2;
                    uint branchMergedValue3;
                    half branchMergedValue4;
                    half branchMergedValue5;
                    half branchMergedValue6;
                    half branchMergedValue7;
                    half branchMergedValue8;
                    half branchMergedValue9;
                    float branchMergedValue11;
                    float branchMergedValue12;
                    float branchMergedValue13;
                    float branchMergedValue14;
                    if (intermediateValue243 == 1u)
                    {
                        float scalarValue65 = dot(float3(intermediateValue122, intermediateValue123, intermediateValue124), float3(intermediateValue36, intermediateValue38, intermediateValue40));
                        float sumValue334 = float(int(uint(scalarValue65 > 0.0f) - uint(scalarValue65 < 0.0f)));
                        float productValue407 = sumValue334 * intermediateValue122;
                        float productValue408 = sumValue334 * intermediateValue123;
                        float productValue409 = sumValue334 * intermediateValue124;
                        uint productValue410 = uint(int(productValue407 * (-256.0f)));
                        uint productValue411 = uint(int(productValue408 * (-256.0f)));
                        uint productValue412 = uint(int(productValue409 * (-256.0f)));
                        precise float dotProductValue12 = dot(float3(intermediateValue36, intermediateValue38, intermediateValue40), float3(intermediateValue197, intermediateValue199, intermediateValue201)) * 2.0f;
                        precise float productValue413 = intermediateValue197 * dotProductValue12;
                        precise float productValue414 = intermediateValue199 * dotProductValue12;
                        precise float productValue415 = intermediateValue201 * dotProductValue12;
                        precise float sumValue335 = intermediateValue36 - productValue413;
                        precise float sumValue336 = intermediateValue38 - productValue414;
                        precise float sumValue337 = intermediateValue40 - productValue415;
                        float inverseLengthValue10 = rsqrt(dot(float3(sumValue335, sumValue336, sumValue337), float3(sumValue335, sumValue336, sumValue337)));
                        precise float productValue416 = inverseLengthValue10 * sumValue335;
                        precise float productValue417 = inverseLengthValue10 * sumValue336;
                        precise float productValue418 = inverseLengthValue10 * sumValue337;
                        precise float dotProductValue13 = dot(float3(productValue416, productValue417, productValue418), float3(intermediateValue122, intermediateValue123, intermediateValue124));
                        float intermediateValue257;
                        float intermediateValue258;
                        float intermediateValue259;
                        if (!(dotProductValue13 <= 0.0f))
                        {
                            intermediateValue257 = productValue416;
                            intermediateValue258 = productValue417;
                            intermediateValue259 = productValue418;
                        }
                        else
                        {
                            precise float productValue419 = dotProductValue13 * 2.0f;
                            precise float productValue420 = intermediateValue122 * productValue419;
                            precise float productValue421 = intermediateValue123 * productValue419;
                            precise float productValue422 = intermediateValue124 * productValue419;
                            precise float sumValue338 = productValue416 - productValue420;
                            precise float sumValue339 = productValue417 - productValue421;
                            precise float sumValue340 = productValue418 - productValue422;
                            float inverseLengthValue11 = rsqrt(dot(float3(sumValue338, sumValue339, sumValue340), float3(sumValue338, sumValue339, sumValue340)));
                            precise float productValue423 = sumValue338 * inverseLengthValue11;
                            precise float productValue424 = sumValue339 * inverseLengthValue11;
                            precise float productValue425 = sumValue340 * inverseLengthValue11;
                            intermediateValue257 = productValue423;
                            intermediateValue258 = productValue424;
                            intermediateValue259 = productValue425;
                        }
                        branchMergedValue = intermediateValue258;
                        branchMergedValue1 = intermediateValue257;
                        branchMergedValue2 = intermediateValue69;
                        branchMergedValue3 = intermediateValue67;
                        branchMergedValue4 = half(1.0f - ((intermediateValue124 * intermediateValue124) * 2.0f)) * intermediateValue65;
                        branchMergedValue5 = half(1.0f - ((intermediateValue123 * intermediateValue123) * 2.0f)) * intermediateValue63;
                        branchMergedValue6 = half(1.0f - ((intermediateValue122 * intermediateValue122) * 2.0f)) * intermediateValue61;
                        branchMergedValue7 = productValue404;
                        branchMergedValue8 = productValue406;
                        branchMergedValue9 = productValue405;
                        branchMergedValue11 = (abs(intermediateValue127) < 0.03125f) ? (intermediateValue127 - (productValue409 * 1.52587890625e-05f)) : asfloat(((intermediateValue127 < 0.0f) ? (-productValue412) : productValue412) + asuint(intermediateValue127));
                        branchMergedValue12 = (abs(intermediateValue126) < 0.03125f) ? (intermediateValue126 - (productValue408 * 1.52587890625e-05f)) : asfloat(((intermediateValue126 < 0.0f) ? (-productValue411) : productValue411) + asuint(intermediateValue126));
                        branchMergedValue13 = (abs(intermediateValue125) < 0.03125f) ? (intermediateValue125 - (productValue407 * 1.52587890625e-05f)) : asfloat(((intermediateValue125 < 0.0f) ? (-productValue410) : productValue410) + asuint(intermediateValue125));
                        branchMergedValue14 = intermediateValue259;
                    }
                    else
                    {
                        float branchMergedValue88;
                        float branchMergedValue89;
                        half branchMergedValue90;
                        uint branchMergedValue91;
                        half branchMergedValue92;
                        half branchMergedValue93;
                        half branchMergedValue94;
                        half branchMergedValue95;
                        half branchMergedValue96;
                        half branchMergedValue97;
                        float branchMergedValue98;
                        float branchMergedValue99;
                        float branchMergedValue100;
                        float branchMergedValue101;
                        if (intermediateValue243 == 2u)
                        {
                            float scalarValue66 = dot(float3(intermediateValue122, intermediateValue123, intermediateValue124), float3(intermediateValue36, intermediateValue38, intermediateValue40));
                            float sumValue341 = float(int(uint(scalarValue66 > 0.0f) - uint(scalarValue66 < 0.0f)));
                            float comparisonValue59 = (((intermediateValue67 != 0u) && (intermediateValue241 == 1u)) && (intermediateValue244 != 0u)) ? ((-0.0f) - sumValue341) : sumValue341;
                            float productValue426 = comparisonValue59 * intermediateValue122;
                            float productValue427 = comparisonValue59 * intermediateValue123;
                            float productValue428 = comparisonValue59 * intermediateValue124;
                            uint productValue429 = uint(int(productValue426 * 256.0f));
                            uint productValue430 = uint(int(productValue427 * 256.0f));
                            uint productValue431 = uint(int(productValue428 * 256.0f));
                            float reinterpretedBits20 = (abs(intermediateValue125) < 0.03125f) ? ((productValue426 * 1.52587890625e-05f) + intermediateValue125) : asfloat(((intermediateValue125 < 0.0f) ? (-productValue429) : productValue429) + asuint(intermediateValue125));
                            float reinterpretedBits21 = (abs(intermediateValue126) < 0.03125f) ? ((productValue427 * 1.52587890625e-05f) + intermediateValue126) : asfloat(((intermediateValue126 < 0.0f) ? (-productValue430) : productValue430) + asuint(intermediateValue126));
                            float reinterpretedBits23 = (abs(intermediateValue127) < 0.03125f) ? ((productValue428 * 1.52587890625e-05f) + intermediateValue127) : asfloat(((intermediateValue127 < 0.0f) ? (-productValue431) : productValue431) + asuint(intermediateValue127));
                            precise float quotientValue9 = float(intermediateValue69) / intermediateValue245;
                            precise float dotProductValue14 = dot(float3(intermediateValue36, intermediateValue38, intermediateValue40), float3(intermediateValue197, intermediateValue199, intermediateValue201));
                            precise float productValue432 = quotientValue9 * quotientValue9;
                            precise float productValue433 = dotProductValue14 * dotProductValue14;
                            precise float sumValue342 = 1.0f - productValue433;
                            precise float productValue434 = productValue432 * sumValue342;
                            precise float sumValue343 = 1.0f - productValue434;
                            bool comparisonValue60 = sumValue343 >= 0.0f;
                            precise float productValue435 = intermediateValue36 * quotientValue9;
                            precise float productValue436 = intermediateValue38 * quotientValue9;
                            precise float productValue437 = intermediateValue40 * quotientValue9;
                            precise float productValue438 = quotientValue9 * dotProductValue14;
                            precise float nonlinearValue6 = productValue438 + sqrt(sumValue343);
                            precise float productValue439 = intermediateValue197 * nonlinearValue6;
                            precise float productValue440 = intermediateValue199 * nonlinearValue6;
                            precise float productValue441 = intermediateValue201 * nonlinearValue6;
                            precise float sumValue344 = productValue435 - productValue439;
                            precise float sumValue345 = productValue436 - productValue440;
                            precise float sumValue346 = productValue437 - productValue441;
                            float comparisonValue61 = comparisonValue60 ? sumValue344 : 0.0f;
                            float comparisonValue62 = comparisonValue60 ? sumValue345 : 0.0f;
                            float comparisonValue63 = comparisonValue60 ? sumValue346 : 0.0f;
                            float inverseLengthValue12 = rsqrt(dot(float3(comparisonValue61, comparisonValue62, comparisonValue63), float3(comparisonValue61, comparisonValue62, comparisonValue63)));
                            precise float productValue442 = inverseLengthValue12 * comparisonValue61;
                            precise float productValue443 = inverseLengthValue12 * comparisonValue62;
                            precise float productValue444 = inverseLengthValue12 * comparisonValue63;
                            half scalarValue67 = half(intermediateValue245);
                            float branchMergedValue144;
                            float branchMergedValue147;
                            half branchMergedValue148;
                            uint branchMergedValue149;
                            half branchMergedValue150;
                            half branchMergedValue151;
                            half branchMergedValue152;
                            half branchMergedValue153;
                            half branchMergedValue154;
                            half branchMergedValue155;
                            float branchMergedValue156;
                            float branchMergedValue157;
                            float branchMergedValue158;
                            float branchMergedValue159;
                            if (comparisonValue6 || (intermediateValue244 == 1u))
                            {
                                branchMergedValue144 = productValue443;
                                branchMergedValue147 = productValue442;
                                branchMergedValue148 = scalarValue67;
                                branchMergedValue149 = intermediateValue244;
                                branchMergedValue150 = intermediateValue65;
                                branchMergedValue151 = intermediateValue63;
                                branchMergedValue152 = intermediateValue61;
                                branchMergedValue153 = productValue404 * half(intermediateValue203 - (intermediateValue203 * intermediateValue140));
                                branchMergedValue154 = productValue406 * half(intermediateValue207 - (intermediateValue207 * intermediateValue140));
                                branchMergedValue155 = productValue405 * half(intermediateValue205 - (intermediateValue205 * intermediateValue140));
                                branchMergedValue156 = reinterpretedBits23;
                                branchMergedValue157 = reinterpretedBits21;
                                branchMergedValue158 = reinterpretedBits20;
                                branchMergedValue159 = productValue444;
                            }
                            else
                            {
                                branchMergedValue144 = productValue443;
                                branchMergedValue147 = productValue442;
                                branchMergedValue148 = scalarValue67;
                                branchMergedValue149 = intermediateValue244;
                                branchMergedValue150 = intermediateValue65;
                                branchMergedValue151 = intermediateValue63;
                                branchMergedValue152 = intermediateValue61;
                                branchMergedValue153 = productValue404;
                                branchMergedValue154 = productValue406;
                                branchMergedValue155 = productValue405;
                                branchMergedValue156 = reinterpretedBits23;
                                branchMergedValue157 = reinterpretedBits21;
                                branchMergedValue158 = reinterpretedBits20;
                                branchMergedValue159 = productValue444;
                            }
                            branchMergedValue88 = branchMergedValue144;
                            branchMergedValue89 = branchMergedValue147;
                            branchMergedValue90 = branchMergedValue148;
                            branchMergedValue91 = branchMergedValue149;
                            branchMergedValue92 = branchMergedValue150;
                            branchMergedValue93 = branchMergedValue151;
                            branchMergedValue94 = branchMergedValue152;
                            branchMergedValue95 = branchMergedValue153;
                            branchMergedValue96 = branchMergedValue154;
                            branchMergedValue97 = branchMergedValue155;
                            branchMergedValue98 = branchMergedValue156;
                            branchMergedValue99 = branchMergedValue157;
                            branchMergedValue100 = branchMergedValue158;
                            branchMergedValue101 = branchMergedValue159;
                        }
                        else
                        {
                            if (!(intermediateValue243 == 4u))
                            {
                                bool conditionValue4 = intermediateValue243 == 5u;
                                branchMergedValue107 = false;
                                branchMergedValue160 = true;
                                branchMergedValue161 = intermediateValue197;
                                branchMergedValue162 = intermediateValue73;
                                branchMergedValue163 = intermediateValue72;
                                branchMergedValue164 = intermediateValue67;
                                branchMergedValue165 = intermediateValue65;
                                branchMergedValue166 = intermediateValue63;
                                branchMergedValue167 = intermediateValue61;
                                branchMergedValue168 = productValue406;
                                branchMergedValue169 = productValue405;
                                branchMergedValue170 = productValue404;
                                branchMergedValue171 = conditionValue4 ? (-1.0f) : intermediateValue51;
                                branchMergedValue172 = conditionValue4 ? 1u : intermediateValue49;
                                branchMergedValue173 = intermediateValue40;
                                branchMergedValue174 = intermediateValue38;
                                branchMergedValue175 = intermediateValue36;
                                branchMergedValue176 = intermediateValue207;
                                branchMergedValue177 = intermediateValue205;
                                branchMergedValue178 = intermediateValue203;
                                branchMergedValue179 = intermediateValue201;
                                branchMergedValue180 = intermediateValue199;
                                break;
                            }
                            float dotProductValue15 = dot(float3(intermediateValue122, intermediateValue123, intermediateValue124), float3(intermediateValue36, intermediateValue38, intermediateValue40));
                            float sumValue347 = float(int(uint(dotProductValue15 > 0.0f) - uint(dotProductValue15 < 0.0f)));
                            float inverseLengthValue13 = rsqrt(dot(float3(intermediateValue36, intermediateValue38, intermediateValue40), float3(intermediateValue36, intermediateValue38, intermediateValue40)));
                            precise float productValue445 = intermediateValue36 * inverseLengthValue13;
                            precise float productValue446 = intermediateValue38 * inverseLengthValue13;
                            precise float productValue447 = intermediateValue40 * inverseLengthValue13;
                            branchMergedValue88 = productValue446;
                            branchMergedValue89 = productValue445;
                            branchMergedValue90 = half(intermediateValue245);
                            branchMergedValue91 = intermediateValue244;
                            branchMergedValue92 = intermediateValue65;
                            branchMergedValue93 = intermediateValue63;
                            branchMergedValue94 = intermediateValue61;
                            branchMergedValue95 = productValue404;
                            branchMergedValue96 = productValue406;
                            branchMergedValue97 = productValue405;
                            branchMergedValue98 = mad(sumValue347 * intermediateValue124, 0.00999999977648258209228515625f, intermediateValue127);
                            branchMergedValue99 = mad(sumValue347 * intermediateValue123, 0.00999999977648258209228515625f, intermediateValue126);
                            branchMergedValue100 = mad(sumValue347 * intermediateValue122, 0.00999999977648258209228515625f, intermediateValue125);
                            branchMergedValue101 = productValue447;
                        }
                        branchMergedValue = branchMergedValue88;
                        branchMergedValue1 = branchMergedValue89;
                        branchMergedValue2 = branchMergedValue90;
                        branchMergedValue3 = branchMergedValue91;
                        branchMergedValue4 = branchMergedValue92;
                        branchMergedValue5 = branchMergedValue93;
                        branchMergedValue6 = branchMergedValue94;
                        branchMergedValue7 = branchMergedValue95;
                        branchMergedValue8 = branchMergedValue96;
                        branchMergedValue9 = branchMergedValue97;
                        branchMergedValue11 = branchMergedValue98;
                        branchMergedValue12 = branchMergedValue99;
                        branchMergedValue13 = branchMergedValue100;
                        branchMergedValue14 = branchMergedValue101;
                    }
                    intermediateValue39 = branchMergedValue;
                    intermediateValue37 = branchMergedValue1;
                    intermediateValue70 = branchMergedValue2;
                    intermediateValue68 = branchMergedValue3;
                    intermediateValue66 = branchMergedValue4;
                    intermediateValue64 = branchMergedValue5;
                    intermediateValue62 = branchMergedValue6;
                    intermediateValue56 = branchMergedValue7;
                    intermediateValue60 = branchMergedValue8;
                    intermediateValue58 = branchMergedValue9;
                    intermediateValue47 = branchMergedValue11;
                    intermediateValue45 = branchMergedValue12;
                    intermediateValue43 = branchMergedValue13;
                    intermediateValue41 = branchMergedValue14;
                    uint sumValue348 = intermediateValue73 + 1u;
                    if (sumValue348 < 8u)
                    {
                        intermediateValue11 = intermediateValue12;
                        intermediateValue14 = intermediateValue15;
                        intermediateValue16 = intermediateValue17;
                        intermediateValue18 = intermediateValue19;
                        intermediateValue20 = intermediateValue21;
                        intermediateValue22 = intermediateValue23;
                        intermediateValue24 = intermediateValue25;
                        intermediateValue26 = intermediateValue27;
                        intermediateValue28 = intermediateValue29;
                        intermediateValue30 = intermediateValue31;
                        intermediateValue32 = intermediateValue33;
                        intermediateValue34 = intermediateValue35;
                        intermediateValue36 = intermediateValue37;
                        intermediateValue38 = intermediateValue39;
                        intermediateValue40 = intermediateValue41;
                        intermediateValue42 = intermediateValue43;
                        intermediateValue44 = intermediateValue45;
                        intermediateValue46 = intermediateValue47;
                        intermediateValue48 = intermediateValue49;
                        intermediateValue50 = intermediateValue51;
                        intermediateValue52 = bitwiseValue4;
                        intermediateValue53 = comparisonValue5;
                        intermediateValue54 = sumValue21;
                        intermediateValue55 = intermediateValue56;
                        intermediateValue57 = intermediateValue58;
                        intermediateValue59 = intermediateValue60;
                        intermediateValue61 = intermediateValue62;
                        intermediateValue63 = intermediateValue64;
                        intermediateValue65 = intermediateValue66;
                        intermediateValue67 = intermediateValue68;
                        intermediateValue69 = intermediateValue70;
                        intermediateValue71 = intermediateValue72;
                        intermediateValue73 = sumValue348;
                        continue;
                    }
                    else
                    {
                        branchMergedValue107 = false;
                        branchMergedValue160 = false;
                        branchMergedValue161 = intermediateValue197;
                        branchMergedValue162 = sumValue348;
                        branchMergedValue163 = intermediateValue72;
                        branchMergedValue164 = intermediateValue68;
                        branchMergedValue165 = intermediateValue66;
                        branchMergedValue166 = intermediateValue64;
                        branchMergedValue167 = intermediateValue62;
                        branchMergedValue168 = intermediateValue60;
                        branchMergedValue169 = intermediateValue58;
                        branchMergedValue170 = intermediateValue56;
                        branchMergedValue171 = intermediateValue51;
                        branchMergedValue172 = intermediateValue49;
                        branchMergedValue173 = intermediateValue41;
                        branchMergedValue174 = intermediateValue39;
                        branchMergedValue175 = intermediateValue37;
                        branchMergedValue176 = intermediateValue207;
                        branchMergedValue177 = intermediateValue205;
                        branchMergedValue178 = intermediateValue203;
                        branchMergedValue179 = intermediateValue201;
                        branchMergedValue180 = intermediateValue199;
                        break;
                    }
                }
                branchMergedValue107 = false;
                branchMergedValue160 = true;
                branchMergedValue161 = intermediateValue146;
                branchMergedValue162 = intermediateValue73;
                branchMergedValue163 = intermediateValue71;
                branchMergedValue164 = intermediateValue67;
                branchMergedValue165 = intermediateValue65;
                branchMergedValue166 = intermediateValue63;
                branchMergedValue167 = intermediateValue61;
                branchMergedValue168 = exponentialValue5 * intermediateValue59;
                branchMergedValue169 = exponentialValue4 * intermediateValue57;
                branchMergedValue170 = exponentialValue3 * intermediateValue55;
                branchMergedValue171 = intermediateValue50;
                branchMergedValue172 = intermediateValue48;
                branchMergedValue173 = intermediateValue40;
                branchMergedValue174 = intermediateValue38;
                branchMergedValue175 = intermediateValue36;
                branchMergedValue176 = intermediateValue165;
                branchMergedValue177 = intermediateValue163;
                branchMergedValue178 = intermediateValue161;
                branchMergedValue179 = intermediateValue150;
                branchMergedValue180 = intermediateValue148;
                break;
            }
            half exponentialValue;
            half exponentialValue1;
            half exponentialValue2;
            if (bitwiseValue126)
            {
                uint sumValue349 = intermediateValue67 + 63u;
                exponentialValue = half(exp2(viewCbConstants[sumValue349].x * (-72.1347503662109375f))) * intermediateValue55;
                exponentialValue1 = half(exp2(viewCbConstants[sumValue349].y * (-72.1347503662109375f))) * intermediateValue57;
                exponentialValue2 = half(exp2(viewCbConstants[sumValue349].z * (-72.1347503662109375f))) * intermediateValue59;
            }
            else
            {
                exponentialValue = intermediateValue55;
                exponentialValue1 = intermediateValue57;
                exponentialValue2 = intermediateValue59;
            }
            float productValue80;
            float productValue81;
            float productValue82;
            if (comparisonValue21)
            {
                float reinterpretedBits24 = asfloat(rdByteLoad_inputIncidentLight_uint(0u, 0));
                productValue80 = reinterpretedBits24 * intermediateValue161;
                productValue81 = reinterpretedBits24 * intermediateValue163;
                productValue82 = reinterpretedBits24 * intermediateValue165;
            }
            else
            {
                productValue80 = 0.0f;
                productValue81 = 0.0f;
                productValue82 = 0.0f;
            }
            float comparisonValue64 = (intermediateValue73 == 0u) ? 65504.0f : intermediateValue53;
            outputBufferPrimaryPathLength[uint2(bitwiseValue2, bitwiseValue3)] = 65504.0f.xxxx;
            float comparisonValue65 = ((intermediateValue73 & 1u) != 0u) ? ((-0.0f) - comparisonValue64) : comparisonValue64;
            outputPrimaryWorldPosition[uint2(bitwiseValue2, bitwiseValue3)] = float4(productValue80, productValue81, productValue82, comparisonValue65);
            outputBufferPrimaryPosLowPrecision[uint2(bitwiseValue2, bitwiseValue3)] = float4(productValue80, productValue81, productValue82, comparisonValue65);
            outputPrimaryViewDirection[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue36, intermediateValue38, intermediateValue40, float(int(intermediateValue67)));
            outputPrimaryThroughput[uint2(bitwiseValue2, bitwiseValue3)] = float4(float(exponentialValue), float(exponentialValue1), float(exponentialValue2), float((intermediateValue73 << 4u) | intermediateValue71));
            outputBufferIncomingIrradianceCache[uint2(bitwiseValue2, bitwiseValue3)] = float4(1.0f, 1.0f, 1.0f, (intermediateValue48 != 0u) ? intermediateValue50 : 0.5f);
            outputBufferEmissiveAndLinearRoughness[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 0.0f, 0.0f, 1.0f);
            outputPlaneIdentifier[uint2(bitwiseValue2, bitwiseValue3)] = int4(uint4(0u, 0u, 0u, 0u));
            float multiplyAddValue3 = mad(productValue27, viewCbConstants[6u].w, mad(productValue26, viewCbConstants[5u].w, viewCbConstants[4u].w * productValue25));
            float multiplyAddValue4 = mad(productValue27, viewCbConstants[26u].w, mad(productValue26, viewCbConstants[25u].w, viewCbConstants[24u].w * productValue25));
            float intermediateValue194;
            float intermediateValue195;
            if ((multiplyAddValue3 <= 0.0f) || (multiplyAddValue4 <= 0.0f))
            {
                intermediateValue194 = 0.0f;
                intermediateValue195 = 0.0f;
            }
            else
            {
                intermediateValue194 = ((mad(productValue27, viewCbConstants[26u].x, mad(productValue26, viewCbConstants[25u].x, viewCbConstants[24u].x * productValue25)) / multiplyAddValue4) - (mad(productValue27, viewCbConstants[6u].x, mad(productValue26, viewCbConstants[5u].x, viewCbConstants[4u].x * productValue25)) / multiplyAddValue3)) * 0.5f;
                intermediateValue195 = ((mad(productValue27, viewCbConstants[26u].y, mad(productValue26, viewCbConstants[25u].y, viewCbConstants[24u].y * productValue25)) / multiplyAddValue4) - (mad(productValue27, viewCbConstants[6u].y, mad(productValue26, viewCbConstants[5u].y, viewCbConstants[4u].y * productValue25)) / multiplyAddValue3)) * (-0.5f);
            }
            outputBufferMotionVectors[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue194, intermediateValue195, intermediateValue194, intermediateValue194);
            outputBufferReprojectedPathLength[uint2(bitwiseValue2, bitwiseValue3)] = 65504.0f.xxxx;
            branchMergedValue107 = true;
            branchMergedValue160 = intermediateValue352;
            branchMergedValue161 = intermediateValue353;
            branchMergedValue162 = intermediateValue354;
            branchMergedValue163 = intermediateValue355;
            branchMergedValue164 = intermediateValue356;
            branchMergedValue165 = intermediateValue357;
            branchMergedValue166 = intermediateValue358;
            branchMergedValue167 = intermediateValue359;
            branchMergedValue168 = intermediateValue360;
            branchMergedValue169 = intermediateValue361;
            branchMergedValue170 = intermediateValue362;
            branchMergedValue171 = intermediateValue363;
            branchMergedValue172 = intermediateValue364;
            branchMergedValue173 = intermediateValue365;
            branchMergedValue174 = intermediateValue366;
            branchMergedValue175 = intermediateValue367;
            branchMergedValue176 = intermediateValue368;
            branchMergedValue177 = intermediateValue369;
            branchMergedValue178 = intermediateValue370;
            branchMergedValue179 = intermediateValue371;
            branchMergedValue180 = intermediateValue372;
            break;
        }
        bool transposed_selector_ = branchMergedValue160;
        if (branchMergedValue107)
        {
            break;
        }
        float intermediateValue196;
        float intermediateValue198;
        float intermediateValue200;
        float intermediateValue202;
        float intermediateValue204;
        float intermediateValue206;
        float intermediateValue208;
        float intermediateValue209;
        float intermediateValue210;
        uint intermediateValue211;
        float intermediateValue212;
        half intermediateValue213;
        half intermediateValue214;
        half intermediateValue215;
        half intermediateValue216;
        half intermediateValue217;
        half intermediateValue218;
        uint intermediateValue219;
        uint intermediateValue220;
        uint intermediateValue221;
        if (transposed_selector_)
        {
            intermediateValue196 = branchMergedValue161;
            intermediateValue198 = branchMergedValue180;
            intermediateValue200 = branchMergedValue179;
            intermediateValue202 = branchMergedValue178;
            intermediateValue204 = branchMergedValue177;
            intermediateValue206 = branchMergedValue176;
            intermediateValue208 = branchMergedValue175;
            intermediateValue209 = branchMergedValue174;
            intermediateValue210 = branchMergedValue173;
            intermediateValue211 = branchMergedValue172;
            intermediateValue212 = branchMergedValue171;
            intermediateValue213 = branchMergedValue170;
            intermediateValue214 = branchMergedValue169;
            intermediateValue215 = branchMergedValue168;
            intermediateValue216 = branchMergedValue167;
            intermediateValue217 = branchMergedValue166;
            intermediateValue218 = branchMergedValue165;
            intermediateValue219 = branchMergedValue164;
            intermediateValue220 = branchMergedValue163;
            intermediateValue221 = branchMergedValue162;
        }
        else
        {
            intermediateValue196 = branchMergedValue161;
            intermediateValue198 = branchMergedValue180;
            intermediateValue200 = branchMergedValue179;
            intermediateValue202 = branchMergedValue178;
            intermediateValue204 = branchMergedValue177;
            intermediateValue206 = branchMergedValue176;
            intermediateValue208 = branchMergedValue175;
            intermediateValue209 = branchMergedValue174;
            intermediateValue210 = branchMergedValue173;
            intermediateValue211 = branchMergedValue172;
            intermediateValue212 = branchMergedValue171;
            intermediateValue213 = branchMergedValue170;
            intermediateValue214 = branchMergedValue169;
            intermediateValue215 = branchMergedValue168;
            intermediateValue216 = branchMergedValue167;
            intermediateValue217 = branchMergedValue166;
            intermediateValue218 = branchMergedValue165;
            intermediateValue219 = branchMergedValue164;
            intermediateValue220 = branchMergedValue163;
            intermediateValue221 = branchMergedValue162;
        }
        float reinterpretedBits25 = asfloat(rdByteLoad_inputIncidentLight_uint(0u, 0));
        float quotientValue10 = 1.0f / ((abs(intermediateValue198) + abs(intermediateValue196)) + abs(intermediateValue200));
        float productValue448 = quotientValue10 * intermediateValue196;
        float productValue449 = quotientValue10 * intermediateValue198;
        bool conditionValue5 = intermediateValue200 < 0.0f;
        float comparisonValue66 = conditionValue5 ? (((productValue448 >= 0.0f) ? 1.0f : (-1.0f)) * (1.0f - abs(productValue449))) : productValue448;
        outputBufferNormal[uint2(bitwiseValue2, bitwiseValue3)] = float4(comparisonValue66, conditionValue5 ? ((1.0f - abs(productValue448)) * ((productValue449 >= 0.0f) ? 1.0f : (-1.0f))) : productValue449, comparisonValue66, comparisonValue66);
        outputBufferColourAndMetallic[uint2(bitwiseValue2, bitwiseValue3)] = float4(sqrt(intermediateValue202), sqrt(intermediateValue204), sqrt(intermediateValue206), intermediateValue142);
        outputBufferEmissiveAndLinearRoughness[uint2(bitwiseValue2, bitwiseValue3)] = float4(reinterpretedBits25 * intermediateValue152, reinterpretedBits25 * intermediateValue153, reinterpretedBits25 * intermediateValue154, intermediateValue144);
        outputPlaneIdentifier[uint2(bitwiseValue2, bitwiseValue3)] = int4((((((uint(int(clamp(mad(intermediateValue122, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f)) << 22u) ^ (intermediateValue221 << 26u)) ^ ((uint(int(clamp(mad(intermediateValue123, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f)) << 18u) & 268173312u)) ^ ((uint(int(clamp(mad(intermediateValue124, 0.5f, 0.5f), 0.0f, 1.0f) * 1023.0f)) << 14u) & 16760832u)) + uint(int(dot(float3(intermediateValue122, intermediateValue123, intermediateValue124), float3(intermediateValue125, intermediateValue126, intermediateValue127)) * 1024.0f))).xxxx);
        outputBufferPrimaryPathLength[uint2(bitwiseValue2, bitwiseValue3)] = intermediateValue351.xxxx;
        outputBufferSurfaceOpacityAndObjectCategory[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue140, float((bitwiseValue4 << 7u) | (intermediateValue103 >> 30u)) * 0.0039215688593685626983642578125f, intermediateValue140, intermediateValue140);
        float comparisonValue67 = ((intermediateValue221 & 1u) != 0u) ? ((-0.0f) - intermediateValue350) : intermediateValue350;
        outputPrimaryWorldPosition[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue125, intermediateValue126, intermediateValue127, comparisonValue67);
        outputBufferPrimaryPosLowPrecision[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue125, intermediateValue126, intermediateValue127, comparisonValue67);
        outputPrimaryViewDirection[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue208, intermediateValue209, intermediateValue210, float(int(intermediateValue219)));
        outputPrimaryThroughput[uint2(bitwiseValue2, bitwiseValue3)] = float4(float(intermediateValue213), float(intermediateValue214), float(intermediateValue215), float((intermediateValue221 << 4u) | intermediateValue220));
        float productValue450 = viewCbConstants[72u].x + (intermediateValue351 * productValue25);
        float productValue451 = viewCbConstants[72u].y + (intermediateValue351 * productValue26);
        float productValue452 = viewCbConstants[72u].z + (intermediateValue351 * productValue27);
        float productValue453 = productValue450 - (((viewCbConstants[69u].x + multiplyAddValue) * float(intermediateValue216)) - viewCbConstants[69u].x);
        float productValue454 = productValue451 - (((viewCbConstants[69u].y + multiplyAddValue1) * float(intermediateValue217)) - viewCbConstants[69u].y);
        float productValue455 = productValue452 - (((viewCbConstants[69u].z + multiplyAddValue2) * float(intermediateValue218)) - viewCbConstants[69u].z);
        float multiplyAddValue5 = mad(productValue452, viewCbConstants[6u].w, mad(productValue451, viewCbConstants[5u].w, viewCbConstants[4u].w * productValue450)) + viewCbConstants[7u].w;
        float multiplyAddValue6 = mad(productValue455, viewCbConstants[26u].w, mad(productValue454, viewCbConstants[25u].w, viewCbConstants[24u].w * productValue453)) + viewCbConstants[27u].w;
        float sumValue350 = productValue453 - viewCbConstants[73u].x;
        float sumValue351 = productValue454 - viewCbConstants[73u].y;
        float sumValue352 = productValue455 - viewCbConstants[73u].z;
        float multiplyAddValue7 = (((mad(productValue455, viewCbConstants[26u].x, mad(productValue454, viewCbConstants[25u].x, viewCbConstants[24u].x * productValue453)) + viewCbConstants[27u].x) / multiplyAddValue6) - ((mad(productValue452, viewCbConstants[6u].x, mad(productValue451, viewCbConstants[5u].x, viewCbConstants[4u].x * productValue450)) + viewCbConstants[7u].x) / multiplyAddValue5)) * 0.5f;
        outputBufferMotionVectors[uint2(bitwiseValue2, bitwiseValue3)] = float4(multiplyAddValue7, (((mad(productValue455, viewCbConstants[26u].y, mad(productValue454, viewCbConstants[25u].y, viewCbConstants[24u].y * productValue453)) + viewCbConstants[27u].y) / multiplyAddValue6) - ((mad(productValue452, viewCbConstants[6u].y, mad(productValue451, viewCbConstants[5u].y, viewCbConstants[4u].y * productValue450)) + viewCbConstants[7u].y) / multiplyAddValue5)) * (-0.5f), multiplyAddValue7, multiplyAddValue7);
        outputBufferReprojectedPathLength[uint2(bitwiseValue2, bitwiseValue3)] = sqrt(((sumValue350 * sumValue350) + (sumValue351 * sumValue351)) + (sumValue352 * sumValue352)).xxxx;
        float productValue456 = reinterpretedBits25 * intermediateValue116;
        float productValue457 = reinterpretedBits25 * intermediateValue118;
        float productValue458 = reinterpretedBits25 * intermediateValue120;
        float comparisonValue68 = (intermediateValue211 != 0u) ? intermediateValue212 : 0.5f;
        uint reinterpretedBits26 = asuint(productValue456) & 2147483647u;
        uint reinterpretedBits27 = asuint(productValue457) & 2147483647u;
        uint reinterpretedBits28 = asuint(productValue458) & 2147483647u;
        uint reinterpretedBits29 = asuint(comparisonValue68) & 2147483647u;
        bool comparisonValue69 = ((reinterpretedBits29 > 2139095040u) || ((reinterpretedBits28 > 2139095040u) || ((reinterpretedBits26 > 2139095040u) || (reinterpretedBits27 > 2139095040u)))) || ((reinterpretedBits29 == 2139095040u) || ((reinterpretedBits28 == 2139095040u) || ((reinterpretedBits26 == 2139095040u) || (reinterpretedBits27 == 2139095040u))));
        bool intermediateValue225;
        if (comparisonValue69)
        {
            bool branchMergedValue18;
            if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
            {
                outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 1.0f, 1.0f, 1.0f).x;
                outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
                branchMergedValue18 = comparisonValue69;
            }
            else
            {
                branchMergedValue18 = comparisonValue69;
            }
            intermediateValue225 = branchMergedValue18;
        }
        else
        {
            intermediateValue225 = false;
        }
        if (!intermediateValue225)
        {
            outputBufferIncomingIrradianceCache[uint2(bitwiseValue2, bitwiseValue3)] = float4(productValue456, productValue457, productValue458, comparisonValue68);
        }
        outputBufferPreviousMedium[uint2(bitwiseValue2, bitwiseValue3)] = int4(intermediateValue219.xxxx);
        float quotientValue11 = 1.0f / ((abs(intermediateValue123) + abs(intermediateValue122)) + abs(intermediateValue124));
        float productValue459 = quotientValue11 * intermediateValue122;
        float productValue460 = quotientValue11 * intermediateValue123;
        bool conditionValue6 = intermediateValue124 < 0.0f;
        float comparisonValue70 = conditionValue6 ? (((productValue459 >= 0.0f) ? 1.0f : (-1.0f)) * (1.0f - abs(productValue460))) : productValue459;
        outputGeometryNormal[uint2(bitwiseValue2, bitwiseValue3)] = float4(comparisonValue70, conditionValue6 ? ((1.0f - abs(productValue459)) * ((productValue460 >= 0.0f) ? 1.0f : (-1.0f))) : productValue460, comparisonValue70, comparisonValue70);
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
