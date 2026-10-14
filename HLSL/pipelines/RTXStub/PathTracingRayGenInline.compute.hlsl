// RTXStub / PathTracingRayGenInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 40
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
    uint productValue = (bitwiseValue3 * uint(viewCbConstants[78u].x)) + bitwiseValue2;
    uint bitwiseValue4 = (productValue + 2127912214u) + (productValue << 12u);
    uint bitwiseValue5 = (bitwiseValue4 ^ 3345072700u) ^ (bitwiseValue4 >> 19u);
    uint bitwiseValue6 = (bitwiseValue5 + 374761393u) + (bitwiseValue5 << 5u);
    uint bitwiseValue7 = (bitwiseValue6 + 3550635116u) ^ (bitwiseValue6 << 9u);
    uint bitwiseValue8 = (bitwiseValue7 + 4251993797u) + (bitwiseValue7 << 3u);
    uint bitwiseValue9 = bitwiseValue2 & 65535u;
    uint bitwiseValue10 = bitwiseValue3 & 65535u;
    uint bitwiseValue11 = ((bitwiseValue9 << 8u) | bitwiseValue9) & 16711935u;
    uint bitwiseValue12 = ((bitwiseValue11 << 4u) | bitwiseValue11) & 252645135u;
    uint bitwiseValue13 = ((bitwiseValue12 << 2u) | bitwiseValue12) & 858993459u;
    uint bitwiseValue14 = ((bitwiseValue10 << 8u) | bitwiseValue10) & 16711935u;
    uint bitwiseValue15 = ((bitwiseValue14 << 4u) | bitwiseValue14) & 252645135u;
    uint bitwiseValue16 = ((bitwiseValue15 << 2u) | bitwiseValue15) & 858993459u;
    uint reinterpretedBits1;
    uint bitwiseValue18;
    uint intermediateValue5;
    uint intermediateValue6;
    reinterpretedBits1 = (((((bitwiseValue16 << 1u) | bitwiseValue16) << 1u) & 2863311530u) | (((bitwiseValue13 << 1u) | bitwiseValue13) & 1431655765u)) + asuint(viewCbConstants[84u]).z;
    bitwiseValue18 = (bitwiseValue8 ^ 3042594569u) ^ (bitwiseValue8 >> 16u);
    intermediateValue5 = 0u;
    intermediateValue6 = 0u;
    uint bitwiseValue17;
    for (;;)
    {
        uint sumValue = intermediateValue5 + 2654435769u;
        bitwiseValue17 = ((((bitwiseValue18 >> 5u) + 3355524772u) ^ ((bitwiseValue18 << 4u) + 2738958700u)) ^ (sumValue + bitwiseValue18)) + reinterpretedBits1;
        uint sumValue1 = intermediateValue6 + 1u;
        if (sumValue1 == 16u)
        {
            break;
        }
        else
        {
            reinterpretedBits1 = bitwiseValue17;
            bitwiseValue18 = ((((bitwiseValue17 << 4u) + 2911926141u) ^ (bitwiseValue17 + sumValue)) ^ ((bitwiseValue17 >> 5u) + 2123724318u)) + bitwiseValue18;
            intermediateValue5 = sumValue;
            intermediateValue6 = sumValue1;
        }
    }
    precise float sumValue2 = float(bitwiseValue2) + 0.5f;
    precise float sumValue3 = float(bitwiseValue3) + 0.5f;
    uint productValue1 = (bitwiseValue17 * 1664525u) + 1013904223u;
    precise float bitwiseValue19 = float(productValue1 & 16777215u) * 5.9604644775390625e-08f;
    uint productValue2 = (productValue1 * 1664525u) + 1013904223u;
    precise float bitwiseValue20 = float(productValue2 & 16777215u) * 5.9604644775390625e-08f;
    precise float sumValue4 = bitwiseValue19 + (-0.5f);
    precise float sumValue5 = bitwiseValue20 + (-0.5f);
    precise float sumValue6 = sumValue2 + sumValue4;
    precise float sumValue7 = sumValue3 + sumValue5;
    precise float quotientValue = sumValue6 / viewCbConstants[78u].x;
    precise float quotientValue1 = sumValue7 / viewCbConstants[78u].y;
    precise float productValue3 = quotientValue * 2.0f;
    precise float productValue4 = quotientValue1 * 2.0f;
    precise float sumValue8 = productValue3 + (-1.0f);
    precise float sumValue9 = 1.0f - productValue4;
    float reinterpretedBits2 = asfloat(rdByteLoad_inputIncidentLight_uint(0u, 0));
    uint reinterpretedBits3 = uint(asuint(viewCbConstants[54u]).w != 0u);
    precise float productValue5 = viewCbConstants[78u].z * viewCbConstants[81u].z;
    precise float productValue6 = viewCbConstants[78u].w * viewCbConstants[81u].w;
    precise float productValue7 = productValue5 * 2.0f;
    precise float productValue8 = productValue6 * 2.0f;
    precise float sumValue10 = sumValue8 + productValue7;
    precise float sumValue11 = sumValue9 - productValue8;
    precise float productValue9 = viewCbConstants[20u].x * sumValue10;
    precise float productValue10 = sumValue11 * viewCbConstants[21u].x;
    precise float sumValue12 = productValue10 + productValue9;
    precise float productValue11 = 0.5f * viewCbConstants[22u].x;
    precise float sumValue13 = productValue11 + sumValue12;
    precise float productValue12 = 1.0f * viewCbConstants[23u].x;
    precise float sumValue14 = productValue12 + sumValue13;
    precise float productValue13 = viewCbConstants[20u].y * sumValue10;
    precise float productValue14 = sumValue11 * viewCbConstants[21u].y;
    precise float sumValue15 = productValue14 + productValue13;
    precise float productValue15 = 0.5f * viewCbConstants[22u].y;
    precise float sumValue16 = productValue15 + sumValue15;
    precise float productValue16 = 1.0f * viewCbConstants[23u].y;
    precise float sumValue17 = productValue16 + sumValue16;
    precise float productValue17 = viewCbConstants[20u].z * sumValue10;
    precise float productValue18 = sumValue11 * viewCbConstants[21u].z;
    precise float sumValue18 = productValue18 + productValue17;
    precise float productValue19 = 0.5f * viewCbConstants[22u].z;
    precise float sumValue19 = productValue19 + sumValue18;
    precise float productValue20 = 1.0f * viewCbConstants[23u].z;
    precise float sumValue20 = productValue20 + sumValue19;
    precise float productValue21 = viewCbConstants[20u].w * sumValue10;
    precise float productValue22 = sumValue11 * viewCbConstants[21u].w;
    precise float sumValue21 = productValue22 + productValue21;
    precise float productValue23 = 0.5f * viewCbConstants[22u].w;
    precise float sumValue22 = productValue23 + sumValue21;
    precise float productValue24 = 1.0f * viewCbConstants[23u].w;
    precise float sumValue23 = productValue24 + sumValue22;
    precise float quotientValue2 = sumValue14 / sumValue23;
    precise float quotientValue3 = sumValue17 / sumValue23;
    precise float quotientValue4 = sumValue20 / sumValue23;
    precise float sumValue24 = quotientValue2 - viewCbConstants[72u].x;
    precise float sumValue25 = quotientValue3 - viewCbConstants[72u].y;
    precise float sumValue26 = quotientValue4 - viewCbConstants[72u].z;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    uint intermediateValue13;
    if (viewCbConstants[93u].z == 0.0f)
    {
        intermediateValue7 = sumValue24;
        intermediateValue8 = sumValue25;
        intermediateValue9 = sumValue26;
        intermediateValue10 = viewCbConstants[72u].x;
        intermediateValue11 = viewCbConstants[72u].y;
        intermediateValue12 = viewCbConstants[72u].z;
        intermediateValue13 = productValue2;
    }
    else
    {
        float inverseLengthValue = rsqrt(dot(float3(sumValue24, sumValue25, sumValue26), float3(sumValue24, sumValue25, sumValue26)));
        precise float productValue25 = sumValue25 * inverseLengthValue;
        precise float productValue26 = viewCbConstants[78u].x * 0.5f;
        precise float productValue27 = viewCbConstants[78u].y * 0.5f;
        uint scalarValue1 = uint(int(productValue27));
        uint sumValue27 = uint(int(productValue26)) + 4294967290u;
        uint sumValue28 = scalarValue1 + 4294967294u;
        float intermediateValue18;
        uint intermediateValue19;
        intermediateValue18 = 0.0f;
        intermediateValue19 = 0u;
        float comparisonValue1;
        for (;;)
        {
            uint bitwiseValue21 = sumValue27 + (intermediateValue19 << 1u);
            float4 vectorValue = outputBufferPrimaryPathLength[uint2(bitwiseValue21, sumValue28)].xxxx;
            float scalarValue2 = vectorValue.x;
            float comparisonValue2 = (scalarValue2 < intermediateValue18) ? scalarValue2 : intermediateValue18;
            float4 vectorValue1 = outputBufferPrimaryPathLength[uint2(bitwiseValue21, scalarValue1)].xxxx;
            float scalarValue3 = vectorValue1.x;
            float comparisonValue3 = (scalarValue3 < comparisonValue2) ? scalarValue3 : comparisonValue2;
            float4 sumValue29 = outputBufferPrimaryPathLength[uint2(bitwiseValue21, scalarValue1 + 2u)].xxxx;
            float scalarValue4 = sumValue29.x;
            comparisonValue1 = (scalarValue4 < comparisonValue3) ? scalarValue4 : comparisonValue3;
            uint sumValue30 = intermediateValue19 + 1u;
            if (sumValue30 == 7u)
            {
                break;
            }
            else
            {
                intermediateValue18 = comparisonValue1;
                intermediateValue19 = sumValue30;
            }
        }
        precise float productValue28 = sumValue24 * inverseLengthValue;
        precise float productValue29 = sumValue26 * inverseLengthValue;
        float comparisonValue5 = (viewCbConstants[93u].y <= 0.0f) ? ((comparisonValue1 == 65504.0f) ? 10000.0f : comparisonValue1) : viewCbConstants[93u].y;
        precise float productValue30 = productValue28 * comparisonValue5;
        precise float productValue31 = productValue25 * comparisonValue5;
        precise float productValue32 = productValue29 * comparisonValue5;
        precise float sumValue31 = viewCbConstants[72u].x + productValue30;
        precise float sumValue32 = viewCbConstants[72u].y + productValue31;
        precise float sumValue33 = viewCbConstants[72u].z + productValue32;
        precise float sumValue34 = productValue7 + 0.0f;
        precise float sumValue35 = 0.0f - productValue8;
        precise float productValue33 = viewCbConstants[20u].x * sumValue34;
        precise float productValue34 = sumValue35 * viewCbConstants[21u].x;
        precise float sumValue36 = productValue34 + productValue33;
        precise float productValue35 = 0.5f * viewCbConstants[22u].x;
        precise float sumValue37 = productValue35 + sumValue36;
        precise float productValue36 = 1.0f * viewCbConstants[23u].x;
        precise float sumValue38 = productValue36 + sumValue37;
        precise float productValue37 = viewCbConstants[20u].y * sumValue34;
        precise float productValue38 = sumValue35 * viewCbConstants[21u].y;
        precise float sumValue39 = productValue38 + productValue37;
        precise float productValue39 = 0.5f * viewCbConstants[22u].y;
        precise float sumValue40 = productValue39 + sumValue39;
        precise float productValue40 = 1.0f * viewCbConstants[23u].y;
        precise float sumValue41 = productValue40 + sumValue40;
        precise float productValue41 = viewCbConstants[20u].z * sumValue34;
        precise float productValue42 = sumValue35 * viewCbConstants[21u].z;
        precise float sumValue42 = productValue42 + productValue41;
        precise float productValue43 = 0.5f * viewCbConstants[22u].z;
        precise float sumValue43 = productValue43 + sumValue42;
        precise float productValue44 = 1.0f * viewCbConstants[23u].z;
        precise float sumValue44 = productValue44 + sumValue43;
        precise float productValue45 = viewCbConstants[20u].w * sumValue34;
        precise float productValue46 = sumValue35 * viewCbConstants[21u].w;
        precise float sumValue45 = productValue46 + productValue45;
        precise float productValue47 = 0.5f * viewCbConstants[22u].w;
        precise float sumValue46 = productValue47 + sumValue45;
        precise float productValue48 = 1.0f * viewCbConstants[23u].w;
        precise float sumValue47 = productValue48 + sumValue46;
        precise float quotientValue5 = sumValue38 / sumValue47;
        precise float quotientValue6 = sumValue41 / sumValue47;
        precise float quotientValue7 = sumValue44 / sumValue47;
        precise float sumValue48 = quotientValue5 - viewCbConstants[72u].x;
        precise float sumValue49 = quotientValue6 - viewCbConstants[72u].y;
        precise float sumValue50 = quotientValue7 - viewCbConstants[72u].z;
        float inverseLengthValue1 = rsqrt(dot(float3(sumValue48, sumValue49, sumValue50), float3(sumValue48, sumValue49, sumValue50)));
        precise float productValue49 = sumValue48 * inverseLengthValue1;
        precise float productValue50 = sumValue49 * inverseLengthValue1;
        precise float productValue51 = sumValue50 * inverseLengthValue1;
        precise float productValue52 = productValue50 * 0.0f;
        precise float productValue53 = productValue51 * 0.0f;
        precise float sumValue51 = productValue52 - productValue53;
        precise float productValue54 = productValue49 * 0.0f;
        precise float sumValue52 = productValue51 - productValue54;
        precise float sumValue53 = productValue54 - productValue50;
        precise float productValue55 = productValue51 * sumValue52;
        precise float productValue56 = productValue50 * sumValue53;
        precise float sumValue54 = productValue55 - productValue56;
        precise float productValue57 = productValue49 * sumValue53;
        precise float productValue58 = productValue51 * sumValue51;
        precise float sumValue55 = productValue57 - productValue58;
        precise float productValue59 = productValue50 * sumValue51;
        precise float productValue60 = productValue49 * sumValue52;
        precise float sumValue56 = productValue59 - productValue60;
        uint4 reinterpretedBits4 = asuint(viewCbConstants[93u]);
        uint scalarValue5 = reinterpretedBits4.w;
        uint productValue61 = (productValue2 * 1664525u) + 1013904223u;
        precise float bitwiseValue23 = float(productValue61 & 16777215u) * 5.9604644775390625e-08f;
        uint productValue62 = (productValue61 * 1664525u) + 1013904223u;
        precise float bitwiseValue24 = float(productValue62 & 16777215u) * 5.9604644775390625e-08f;
        precise float productValue63 = bitwiseValue23 * 2.0f;
        precise float sumValue57 = productValue63 + (-1.0f);
        precise float productValue64 = bitwiseValue24 * 2.0f;
        precise float sumValue58 = productValue64 + (-1.0f);
        precise float productValue65 = sumValue57 * sumValue57;
        precise float productValue66 = sumValue58 * sumValue58;
        bool conditionValue = productValue65 > productValue66;
        float intermediateValue135;
        float intermediateValue136;
        if (scalarValue5 < 5u)
        {
            float intermediateValue125;
            float intermediateValue126;
            if (conditionValue)
            {
                precise float quotientValue8 = sumValue58 / sumValue57;
                precise float productValue67 = quotientValue8 * 0.785398185253143310546875f;
                intermediateValue125 = productValue67;
                intermediateValue126 = sumValue57;
            }
            else
            {
                precise float quotientValue9 = sumValue57 / sumValue58;
                precise float productValue68 = quotientValue9 * 0.785398185253143310546875f;
                precise float sumValue59 = 1.57079637050628662109375f - productValue68;
                intermediateValue125 = sumValue59;
                intermediateValue126 = sumValue58;
            }
            precise float wavePhaseValue = intermediateValue126 * cos(intermediateValue125);
            precise float wavePhaseValue1 = intermediateValue126 * sin(intermediateValue125);
            intermediateValue135 = wavePhaseValue;
            intermediateValue136 = wavePhaseValue1;
        }
        else
        {
            float intermediateValue127;
            float intermediateValue128;
            if (conditionValue)
            {
                precise float quotientValue10 = sumValue58 / sumValue57;
                precise float productValue69 = quotientValue10 * 0.785398185253143310546875f;
                intermediateValue127 = productValue69;
                intermediateValue128 = sumValue57;
            }
            else
            {
                precise float quotientValue11 = sumValue57 / sumValue58;
                precise float productValue70 = quotientValue11 * 0.785398185253143310546875f;
                precise float sumValue60 = 1.57079637050628662109375f - productValue70;
                intermediateValue127 = sumValue60;
                intermediateValue128 = sumValue58;
            }
            precise float wavePhaseValue2 = intermediateValue128 * cos(intermediateValue127);
            precise float wavePhaseValue3 = intermediateValue128 * sin(intermediateValue127);
            precise float quotientValue12 = 6.283185482025146484375f / float(int(scalarValue5));
            precise float productValue71 = wavePhaseValue2 * wavePhaseValue2;
            precise float productValue72 = wavePhaseValue3 * wavePhaseValue3;
            precise float sumValue61 = productValue71 + productValue72;
            float nonlinearValue = sqrt(sumValue61);
            float inverseLengthValue2 = rsqrt(dot(float2(wavePhaseValue2, wavePhaseValue3), float2(wavePhaseValue2, wavePhaseValue3)));
            precise float productValue73 = wavePhaseValue2 * inverseLengthValue2;
            precise float productValue74 = wavePhaseValue3 * inverseLengthValue2;
            precise float dotProductValue = acos(dot(float2(0.0f, 1.0f), float2(productValue73, productValue74))) / quotientValue12;
            precise float sumValue62 = (-0.0f) - dotProductValue;
            float scalarValue6 = frac(abs(dotProductValue));
            precise float sumValue63 = (-0.0f) - scalarValue6;
            precise float comparisonValue6 = quotientValue12 * ((dotProductValue >= sumValue62) ? scalarValue6 : sumValue63);
            float wavePhaseValue4 = sin(quotientValue12);
            float wavePhaseValue5 = cos(quotientValue12);
            precise float wavePhaseValue6 = nonlinearValue * sin(comparisonValue6);
            precise float wavePhaseValue7 = nonlinearValue * cos(comparisonValue6);
            precise float sumValue64 = wavePhaseValue7 - wavePhaseValue5;
            precise float productValue75 = wavePhaseValue4 * sumValue64;
            precise float sumValue65 = wavePhaseValue4 - wavePhaseValue6;
            precise float sumValue66 = 1.0f - wavePhaseValue5;
            precise float productValue76 = sumValue66 * sumValue65;
            precise float sumValue67 = productValue75 - productValue76;
            precise float productValue77 = sumValue66 * wavePhaseValue6;
            precise float sumValue68 = 0.0f - wavePhaseValue7;
            precise float productValue78 = wavePhaseValue4 * sumValue68;
            precise float sumValue69 = productValue77 - productValue78;
            precise float quotientValue13 = sumValue67 / sumValue69;
            precise float productValue79 = wavePhaseValue6 * quotientValue13;
            precise float productValue80 = quotientValue13 * sumValue68;
            precise float sumValue70 = productValue79 - wavePhaseValue6;
            precise float sumValue71 = wavePhaseValue7 + productValue80;
            precise float productValue81 = sumValue70 * sumValue70;
            precise float productValue82 = sumValue71 * sumValue71;
            precise float sumValue72 = productValue81 + productValue82;
            float nonlinearValue1 = sqrt(sumValue72);
            float branchMergedValue24;
            float branchMergedValue47;
            if (nonlinearValue1 < nonlinearValue)
            {
                precise float sumValue73 = 1.0f - nonlinearValue1;
                precise float sumValue74 = nonlinearValue - nonlinearValue1;
                precise float quotientValue14 = sumValue74 / sumValue73;
                precise float productValue83 = nonlinearValue1 * quotientValue14;
                precise float productValue84 = productValue73 * productValue83;
                precise float productValue85 = productValue74 * productValue83;
                branchMergedValue24 = productValue85;
                branchMergedValue47 = productValue84;
            }
            else
            {
                branchMergedValue24 = wavePhaseValue3;
                branchMergedValue47 = wavePhaseValue2;
            }
            intermediateValue135 = branchMergedValue47;
            intermediateValue136 = branchMergedValue24;
        }
        precise float productValue86 = viewCbConstants[93u].z * intermediateValue135;
        precise float productValue87 = viewCbConstants[93u].z * intermediateValue136;
        precise float productValue88 = sumValue54 * productValue86;
        precise float productValue89 = sumValue55 * productValue86;
        precise float productValue90 = sumValue56 * productValue86;
        precise float sumValue75 = viewCbConstants[72u].x + productValue88;
        precise float sumValue76 = viewCbConstants[72u].y + productValue89;
        precise float sumValue77 = viewCbConstants[72u].z + productValue90;
        precise float productValue91 = sumValue51 * productValue87;
        precise float productValue92 = sumValue52 * productValue87;
        precise float productValue93 = sumValue53 * productValue87;
        precise float sumValue78 = productValue91 + sumValue75;
        precise float sumValue79 = productValue92 + sumValue76;
        precise float sumValue80 = productValue93 + sumValue77;
        precise float sumValue81 = sumValue31 - sumValue78;
        precise float sumValue82 = sumValue32 - sumValue79;
        precise float sumValue83 = sumValue33 - sumValue80;
        intermediateValue7 = sumValue81;
        intermediateValue8 = sumValue82;
        intermediateValue9 = sumValue83;
        intermediateValue10 = sumValue78;
        intermediateValue11 = sumValue79;
        intermediateValue12 = sumValue80;
        intermediateValue13 = productValue62;
    }
    float inverseLengthValue3 = rsqrt(dot(float3(intermediateValue7, intermediateValue8, intermediateValue9), float3(intermediateValue7, intermediateValue8, intermediateValue9)));
    precise float productValue94 = intermediateValue7 * inverseLengthValue3;
    precise float productValue95 = intermediateValue8 * inverseLengthValue3;
    precise float productValue96 = intermediateValue9 * inverseLengthValue3;
    RayDesc _10ident = {float3(intermediateValue10, intermediateValue11, intermediateValue12), 0.001000000047497451305389404296875f, float3(productValue94, productValue95, productValue96), 10000.0f};
    intermediateValue14.TraceRayInline(SceneBVH, 512u, 109u, _10ident);
    bool conditionValue1 = intermediateValue14.Proceed();
    if (conditionValue1)
    {
        bool intermediateValue42;
        bool comparisonValue4;
        for (;;)
        {
            uint scalarValue7 = intermediateValue14.CandidateType();
            comparisonValue4 = scalarValue7 == 0u;
            if (comparisonValue4)
            {
                float2 vectorValue2 = intermediateValue14.CandidateTriangleBarycentrics();
                float2 vectorValue3 = intermediateValue14.CandidateTriangleBarycentrics();
                uint scalarValue8 = intermediateValue14.CandidatePrimitiveIndex();
                uint scalarValue9 = intermediateValue14.CandidateInstanceID();
                uint scalarValue10 = intermediateValue14.CandidateInstanceIndex();
                uint productValue97 = (scalarValue10 * 76u) + 58u;
                uint productValue98 = (scalarValue10 * 76u) + 61u;
                precise float sumValue84 = 1.0f - vectorValue2.x;
                precise float sumValue85 = sumValue84 - vectorValue3.y;
                uint bitwiseValue25 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue10 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue8 >> 1u);
                uint productValue99 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue10 * 76u) + 54u) * 2 + 0)) + 0u;
                bool comparisonValue7 = (scalarValue8 & 1u) == 0u;
                uint comparisonValue8 = comparisonValue7 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue99), bitwiseValue25 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue99), bitwiseValue25 * 16 + 0).x;
                uint comparisonValue9 = comparisonValue7 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue99), bitwiseValue25 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue99), bitwiseValue25 * 16 + 0).w;
                uint comparisonValue10 = comparisonValue7 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue99), bitwiseValue25 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue99), bitwiseValue25 * 16 + 0).z;
                bool productValue100 = rdByteLoad_objectInstances_uint16_t(0u, productValue98 * 2 + 0) < 0u;
                float intermediateValue113;
                float intermediateValue114;
                if (productValue100)
                {
                    uint bitwiseValue26 = comparisonValue10 >> 15u;
                    precise float bitwiseValue27 = float(bitwiseValue26 & 1u) * 2.0f;
                    precise float sumValue86 = bitwiseValue27 + (-1.0f);
                    precise float bitwiseValue28 = float(comparisonValue10 >> 31u) * 2.0f;
                    precise float sumValue87 = bitwiseValue28 + (-1.0f);
                    precise float bitwiseValue29 = float((comparisonValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue30 = float(bitwiseValue26 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue101 = sumValue86 * 3.0517578125e-05f;
                    precise float productValue102 = sumValue87 * 3.0517578125e-05f;
                    precise float sumValue88 = bitwiseValue29 + productValue101;
                    precise float sumValue89 = bitwiseValue30 + productValue102;
                    intermediateValue113 = sumValue88;
                    intermediateValue114 = sumValue89;
                }
                else
                {
                    precise float bitwiseValue31 = float(comparisonValue10 & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue32 = float(comparisonValue10 >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue103 = bitwiseValue31 * 16384.0f;
                    precise float sumValue90 = productValue103 + 0.5f;
                    precise float productValue104 = bitwiseValue32 * 16384.0f;
                    precise float sumValue91 = productValue104 + 0.5f;
                    precise float productValue105 = floor(sumValue90) * 6.103515625e-05f;
                    precise float productValue106 = floor(sumValue91) * 6.103515625e-05f;
                    intermediateValue113 = productValue105;
                    intermediateValue114 = productValue106;
                }
                precise float productValue107 = sumValue85 * intermediateValue113;
                precise float productValue108 = sumValue85 * intermediateValue114;
                precise float sumValue92 = productValue107 + 0.0f;
                precise float sumValue93 = productValue108 + 0.0f;
                float intermediateValue137;
                float intermediateValue138;
                if (productValue100)
                {
                    uint bitwiseValue33 = comparisonValue9 >> 15u;
                    precise float bitwiseValue34 = float(bitwiseValue33 & 1u) * 2.0f;
                    precise float sumValue94 = bitwiseValue34 + (-1.0f);
                    precise float bitwiseValue35 = float(comparisonValue9 >> 31u) * 2.0f;
                    precise float sumValue95 = bitwiseValue35 + (-1.0f);
                    precise float bitwiseValue36 = float((comparisonValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue37 = float(bitwiseValue33 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue109 = sumValue94 * 3.0517578125e-05f;
                    precise float productValue110 = sumValue95 * 3.0517578125e-05f;
                    precise float sumValue96 = bitwiseValue36 + productValue109;
                    precise float sumValue97 = bitwiseValue37 + productValue110;
                    intermediateValue137 = sumValue96;
                    intermediateValue138 = sumValue97;
                }
                else
                {
                    precise float bitwiseValue38 = float(comparisonValue9 & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue39 = float(comparisonValue9 >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue111 = bitwiseValue38 * 16384.0f;
                    precise float sumValue98 = productValue111 + 0.5f;
                    precise float productValue112 = bitwiseValue39 * 16384.0f;
                    precise float sumValue99 = productValue112 + 0.5f;
                    precise float productValue113 = floor(sumValue98) * 6.103515625e-05f;
                    precise float productValue114 = floor(sumValue99) * 6.103515625e-05f;
                    intermediateValue137 = productValue113;
                    intermediateValue138 = productValue114;
                }
                precise float productValue115 = vectorValue2.x * intermediateValue137;
                precise float productValue116 = vectorValue2.x * intermediateValue138;
                precise float sumValue100 = sumValue92 + productValue115;
                precise float sumValue101 = sumValue93 + productValue116;
                float intermediateValue173;
                float intermediateValue174;
                if (productValue100)
                {
                    uint bitwiseValue40 = comparisonValue8 >> 15u;
                    precise float bitwiseValue41 = float(bitwiseValue40 & 1u) * 2.0f;
                    precise float sumValue102 = bitwiseValue41 + (-1.0f);
                    precise float bitwiseValue42 = float(comparisonValue8 >> 31u) * 2.0f;
                    precise float sumValue103 = bitwiseValue42 + (-1.0f);
                    precise float bitwiseValue43 = float((comparisonValue8 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue44 = float(bitwiseValue40 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue117 = sumValue102 * 3.0517578125e-05f;
                    precise float productValue118 = sumValue103 * 3.0517578125e-05f;
                    precise float sumValue104 = bitwiseValue43 + productValue117;
                    precise float sumValue105 = bitwiseValue44 + productValue118;
                    intermediateValue173 = sumValue104;
                    intermediateValue174 = sumValue105;
                }
                else
                {
                    precise float bitwiseValue45 = float(comparisonValue8 & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue46 = float(comparisonValue8 >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue119 = bitwiseValue45 * 16384.0f;
                    precise float sumValue106 = productValue119 + 0.5f;
                    precise float productValue120 = bitwiseValue46 * 16384.0f;
                    precise float sumValue107 = productValue120 + 0.5f;
                    precise float productValue121 = floor(sumValue106) * 6.103515625e-05f;
                    precise float productValue122 = floor(sumValue107) * 6.103515625e-05f;
                    intermediateValue173 = productValue121;
                    intermediateValue174 = productValue122;
                }
                precise float productValue123 = vectorValue3.y * intermediateValue173;
                precise float productValue124 = vectorValue3.y * intermediateValue174;
                precise float sumValue108 = sumValue100 + productValue123;
                precise float sumValue109 = sumValue101 + productValue124;
                float intermediateValue188;
                if (rdByteLoad_objectInstances_uint16_t(0u, productValue97 * 2 + 0) == 65535u)
                {
                    intermediateValue188 = 1.0f;
                }
                else
                {
                    uint reinterpretedBits15;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue97 * 2 + 0) > 4095u)
                    {
                        reinterpretedBits15 = asuint(viewCbConstants[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits15 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue97 * 2 + 0));
                    }
                    intermediateValue188 = textures[NonUniformResourceIndex(reinterpretedBits15 + 0u)].SampleLevel(defaultSampler, float2(sumValue108, sumValue109), -0.25f).w;
                }
                uint comparisonValue23;
                if (scalarValue9 == 2u)
                {
                    comparisonValue23 = 0u;
                }
                else
                {
                    comparisonValue23 = uint(intermediateValue188 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue98 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                }
                if (comparisonValue23 == 0u)
                {
                    intermediateValue14.CommitNonOpaqueTriangleHit();
                }
            }
            intermediateValue42 = intermediateValue14.Proceed();
            if (intermediateValue42)
            {
                continue;
            }
            else
            {
                break;
            }
        }
    }
    uint scalarValue11 = intermediateValue14.CommittedStatus();
    float intermediateValue32;
    float intermediateValue33;
    float intermediateValue34;
    uint bitwiseValue22;
    if (scalarValue11 == 1u)
    {
        float2 vectorValue4 = intermediateValue14.CommittedTriangleBarycentrics();
        float2 vectorValue5 = intermediateValue14.CommittedTriangleBarycentrics();
        float scalarValue12 = intermediateValue14.CommittedRayT();
        uint scalarValue13 = intermediateValue14.CommittedPrimitiveIndex();
        uint scalarValue14 = intermediateValue14.CommittedInstanceID();
        uint scalarValue15 = intermediateValue14.CommittedInstanceIndex();
        intermediateValue32 = vectorValue4.x;
        intermediateValue33 = vectorValue5.y;
        intermediateValue34 = scalarValue12;
        bitwiseValue22 = ((scalarValue14 << 30u) | ((scalarValue13 << 14u) & 1073725440u)) | (scalarValue15 & 16383u);
    }
    else
    {
        intermediateValue32 = 0.0f;
        intermediateValue33 = 0.0f;
        intermediateValue34 = 10000.0f;
        bitwiseValue22 = 1073741823u;
    }
    if (asuint(viewCbConstants[91u]).y == 2u)
    {
        outputBufferPrimaryPathLength[uint2(bitwiseValue2, bitwiseValue3)] = intermediateValue34.x;
        outputPrimaryWorldPosition[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 0.0f, 0.0f, intermediateValue34);
        outputBufferPrimaryPosLowPrecision[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 0.0f, 0.0f, intermediateValue34);
        if (!(intermediateValue34 < 10000.0f))
        {
            uint4 reinterpretedBits5 = asuint(viewCbConstants[76u]);
            uint scalarValue16 = reinterpretedBits5.w;
            float intermediateValue130;
            float intermediateValue131;
            float intermediateValue132;
            if (scalarValue16 == 1u)
            {
                intermediateValue130 = viewCbConstants[58u].x;
                intermediateValue131 = viewCbConstants[58u].y;
                intermediateValue132 = viewCbConstants[58u].z;
            }
            else
            {
                float branchMergedValue23;
                float branchMergedValue42;
                float branchMergedValue43;
                if (scalarValue16 == 2u)
                {
                    uint4 vectorValue6 = asuint(viewCbConstants[74u]);
                    uint scalarValue17 = vectorValue6.z;
                    uint reinterpretedBits13;
                    if (scalarValue17 > 4095u)
                    {
                        reinterpretedBits13 = asuint(viewCbConstants[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits13 = scalarValue17;
                    }
                    float scalarValue18 = abs(productValue94);
                    float scalarValue19 = abs(productValue95);
                    float scalarValue20 = abs(productValue96);
                    float intermediateValue175;
                    float comparisonValue18;
                    float intermediateValue176;
                    if ((scalarValue18 >= scalarValue19) && (scalarValue18 >= scalarValue20))
                    {
                        precise float sumValue110 = (-0.0f) - productValue96;
                        precise float sumValue111 = (-0.0f) - productValue95;
                        intermediateValue175 = scalarValue18;
                        comparisonValue18 = (productValue94 < 0.0f) ? sumValue110 : productValue96;
                        intermediateValue176 = sumValue111;
                    }
                    else
                    {
                        precise float sumValue112 = (-0.0f) - productValue94;
                        float branchMergedValue26;
                        float branchMergedValue52;
                        float branchMergedValue53;
                        if (!(scalarValue19 >= scalarValue20))
                        {
                            precise float sumValue113 = (-0.0f) - productValue95;
                            branchMergedValue26 = sumValue113;
                            branchMergedValue52 = (productValue96 < 0.0f) ? productValue94 : sumValue112;
                            branchMergedValue53 = scalarValue20;
                        }
                        else
                        {
                            precise float sumValue114 = (-0.0f) - productValue96;
                            branchMergedValue26 = (productValue95 < 0.0f) ? sumValue114 : productValue96;
                            branchMergedValue52 = sumValue112;
                            branchMergedValue53 = scalarValue19;
                        }
                        intermediateValue175 = branchMergedValue53;
                        comparisonValue18 = branchMergedValue52;
                        intermediateValue176 = branchMergedValue26;
                    }
                    precise float quotientValue15 = 0.5f / intermediateValue175;
                    precise float productValue125 = comparisonValue18 * quotientValue15;
                    precise float sumValue115 = productValue125 + 0.5f;
                    precise float productValue126 = intermediateValue176 * quotientValue15;
                    precise float sumValue116 = productValue126 + 0.5f;
                    precise float productValue127 = viewCbConstants[74u].x * sumValue115;
                    precise float productValue128 = viewCbConstants[74u].y * sumValue116;
                    float4 sampledTextureValue = textures[NonUniformResourceIndex(reinterpretedBits13 + 0u)].SampleLevel(linearSampler, float2(frac(productValue127), frac(productValue128)), 0.0f);
                    precise float productValue129 = sampledTextureValue.x * viewCbConstants[58u].x;
                    precise float productValue130 = sampledTextureValue.y * viewCbConstants[58u].y;
                    precise float productValue131 = sampledTextureValue.z * viewCbConstants[58u].z;
                    precise float productValue132 = productValue129 * viewCbConstants[97u].w;
                    precise float productValue133 = productValue130 * viewCbConstants[97u].w;
                    precise float productValue134 = productValue131 * viewCbConstants[97u].w;
                    branchMergedValue23 = productValue134;
                    branchMergedValue42 = productValue133;
                    branchMergedValue43 = productValue132;
                }
                else
                {
                    float branchMergedValue174;
                    float branchMergedValue176;
                    float branchMergedValue177;
                    if (scalarValue16 == 4u)
                    {
                        precise float scalarValue21 = dot(float3(productValue94, productValue95, productValue96), float3(viewCbConstants[52u].xyz)) * 0.5f;
                        precise float sumValue117 = scalarValue21 + 0.5f;
                        precise float sumValue118 = viewCbConstants[75u].x - viewCbConstants[76u].x;
                        precise float sumValue119 = viewCbConstants[75u].y - viewCbConstants[76u].y;
                        precise float sumValue120 = viewCbConstants[75u].z - viewCbConstants[76u].z;
                        precise float productValue135 = sumValue117 * sumValue118;
                        precise float productValue136 = sumValue117 * sumValue119;
                        precise float productValue137 = sumValue117 * sumValue120;
                        precise float sumValue121 = viewCbConstants[76u].x + productValue135;
                        precise float sumValue122 = viewCbConstants[76u].y + productValue136;
                        precise float sumValue123 = viewCbConstants[76u].z + productValue137;
                        branchMergedValue174 = sumValue123;
                        branchMergedValue176 = sumValue122;
                        branchMergedValue177 = sumValue121;
                    }
                    else
                    {
                        float comparisonValue13;
                        if (abs(productValue95) < 1.0f)
                        {
                            precise float quotientValue16 = productValue96 / productValue94;
                            float scalarValue22 = atan(quotientValue16);
                            precise float sumValue124 = scalarValue22 + 3.1415927410125732421875f;
                            precise float sumValue125 = scalarValue22 + (-3.1415927410125732421875f);
                            bool conditionValue2 = productValue94 < 0.0f;
                            bool comparisonValue11 = productValue94 == 0.0f;
                            bool comparisonValue12 = productValue96 >= 0.0f;
                            bool conditionValue3 = productValue96 < 0.0f;
                            comparisonValue13 = (comparisonValue11 && comparisonValue12) ? 1.57079637050628662109375f : ((comparisonValue11 && conditionValue3) ? (-1.57079637050628662109375f) : ((conditionValue2 && conditionValue3) ? sumValue125 : ((conditionValue2 && comparisonValue12) ? sumValue124 : scalarValue22)));
                        }
                        else
                        {
                            comparisonValue13 = 0.0f;
                        }
                        precise float sumValue126 = comparisonValue13 - viewCbConstants[50u].w;
                        precise float productValue138 = sumValue126 * 0.15915493667125701904296875f;
                        precise float productValue139 = frac(productValue138) * 2.0f;
                        precise float sumValue127 = productValue139 + (-1.0f);
                        precise float quotientValue17 = asin(productValue95) / 3.1415927410125732421875f;
                        precise float sumValue128 = 0.5f - quotientValue17;
                        precise float productValue140 = abs(sumValue127) * 0.984375f;
                        precise float sumValue129 = productValue140 + 0.0078125f;
                        precise float productValue141 = sumValue128 * 0.96875f;
                        precise float sumValue130 = productValue141 + 0.015625f;
                        precise float productValue142 = viewCbConstants[51u].w * 7.0f;
                        float scalarValue23 = frac(productValue142);
                        uint scalarValue24 = uint(int(floor(productValue142)));
                        precise float productValue143 = float(int(scalarValue24 + 1u)) * 0.125f;
                        precise float sumValue131 = (-0.0f) - productValue143;
                        float scalarValue25 = frac(abs(productValue143));
                        precise float sumValue132 = (-0.0f) - scalarValue25;
                        precise float comparisonValue14 = ((productValue143 >= sumValue131) ? scalarValue25 : sumValue132) * 8.0f;
                        float4 sampledTextureValue1 = skyTexture.SampleLevel(linearSampler, float3(sumValue129, sumValue130, float(int(scalarValue24))), 0.0f);
                        float scalarValue26 = sampledTextureValue1.x;
                        float scalarValue27 = sampledTextureValue1.y;
                        float scalarValue28 = sampledTextureValue1.z;
                        precise float productValue144 = scalarValue26 * scalarValue26;
                        precise float productValue145 = scalarValue27 * scalarValue27;
                        precise float productValue146 = scalarValue28 * scalarValue28;
                        float4 sampledTextureValue2 = skyTexture.SampleLevel(linearSampler, float3(sumValue129, sumValue130, float(int(uint(int(comparisonValue14))))), 0.0f);
                        float scalarValue29 = sampledTextureValue2.x;
                        float scalarValue30 = sampledTextureValue2.y;
                        float scalarValue31 = sampledTextureValue2.z;
                        precise float productValue147 = scalarValue29 * scalarValue29;
                        precise float productValue148 = scalarValue30 * scalarValue30;
                        precise float productValue149 = scalarValue31 * scalarValue31;
                        precise float sumValue133 = productValue147 - productValue144;
                        precise float sumValue134 = productValue148 - productValue145;
                        precise float sumValue135 = productValue149 - productValue146;
                        precise float productValue150 = scalarValue23 * sumValue133;
                        precise float productValue151 = scalarValue23 * sumValue134;
                        precise float productValue152 = scalarValue23 * sumValue135;
                        precise float sumValue136 = productValue144 + productValue150;
                        precise float sumValue137 = productValue145 + productValue151;
                        precise float sumValue138 = productValue146 + productValue152;
                        precise float dotProductValue1 = log2(max(dot(float3(productValue94, productValue95, productValue96), float3(viewCbConstants[52u].xyz)), 0.0f)) * 7.0f;
                        float exponentialValue = exp2(dotProductValue1);
                        precise float productValue153 = viewCbConstants[50u].x * exponentialValue;
                        precise float productValue154 = viewCbConstants[50u].y * exponentialValue;
                        precise float productValue155 = viewCbConstants[50u].z * exponentialValue;
                        precise float productValue156 = productValue153 * 0.0500000007450580596923828125f;
                        precise float productValue157 = productValue154 * 0.0500000007450580596923828125f;
                        precise float productValue158 = productValue155 * 0.0500000007450580596923828125f;
                        precise float sumValue139 = sumValue136 + productValue156;
                        precise float sumValue140 = sumValue137 + productValue157;
                        precise float sumValue141 = sumValue138 + productValue158;
                        precise float productValue159 = exponentialValue * 0.64999997615814208984375f;
                        precise float sumValue142 = productValue159 + 0.3499999940395355224609375f;
                        precise float productValue160 = sumValue142 * viewCbConstants[58u].x;
                        precise float productValue161 = sumValue142 * viewCbConstants[58u].y;
                        precise float productValue162 = sumValue142 * viewCbConstants[58u].z;
                        precise float sumValue143 = productValue160 - sumValue139;
                        precise float sumValue144 = productValue161 - sumValue140;
                        precise float sumValue145 = productValue162 - sumValue141;
                        precise float productValue163 = viewCbConstants[58u].w * sumValue143;
                        precise float productValue164 = viewCbConstants[58u].w * sumValue144;
                        precise float productValue165 = viewCbConstants[58u].w * sumValue145;
                        precise float sumValue146 = sumValue139 + productValue163;
                        precise float sumValue147 = sumValue140 + productValue164;
                        precise float sumValue148 = sumValue141 + productValue165;
                        precise float productValue166 = viewCbConstants[97u].w * sumValue146;
                        precise float productValue167 = viewCbConstants[97u].w * sumValue147;
                        precise float productValue168 = viewCbConstants[97u].w * sumValue148;
                        branchMergedValue174 = productValue168;
                        branchMergedValue176 = productValue167;
                        branchMergedValue177 = productValue166;
                    }
                    branchMergedValue23 = branchMergedValue174;
                    branchMergedValue42 = branchMergedValue176;
                    branchMergedValue43 = branchMergedValue177;
                }
                intermediateValue130 = branchMergedValue43;
                intermediateValue131 = branchMergedValue42;
                intermediateValue132 = branchMergedValue23;
            }
            precise float productValue169 = reinterpretedBits2 * intermediateValue130;
            precise float productValue170 = reinterpretedBits2 * intermediateValue131;
            precise float productValue171 = reinterpretedBits2 * intermediateValue132;
            uint reinterpretedBits6 = asuint(productValue169) & 2147483647u;
            uint reinterpretedBits7 = asuint(productValue170) & 2147483647u;
            uint reinterpretedBits8 = asuint(productValue171) & 2147483647u;
            if (!((((reinterpretedBits6 > 2139095040u) || (reinterpretedBits7 > 2139095040u)) || (reinterpretedBits8 > 2139095040u)) || (((reinterpretedBits6 == 2139095040u) || (reinterpretedBits7 == 2139095040u)) || (reinterpretedBits8 == 2139095040u))))
            {
                outputBufferEmissiveAndLinearRoughness[uint2(bitwiseValue2, bitwiseValue3)] = float4(productValue169, productValue170, productValue171, 1.0f);
            }
        }
    }
    uint intermediateValue[8];
    float intermediateValue1[2];
    float intermediateValue44;
    float intermediateValue47;
    float intermediateValue49;
    float intermediateValue51;
    float intermediateValue53;
    float intermediateValue55;
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
    float intermediateValue81;
    float intermediateValue83;
    float intermediateValue85;
    float intermediateValue87;
    uint intermediateValue89;
    uint intermediateValue91;
    float intermediateValue93;
    float intermediateValue95;
    float intermediateValue97;
    float intermediateValue99;
    float intermediateValue101;
    float intermediateValue103;
    uint intermediateValue105;
    uint intermediateValue107;
    uint intermediateValue109;
    uint intermediateValue111;
    float intermediateValue163;
    float intermediateValue165;
    float intermediateValue167;
    for (;;)
    {
        intermediateValue44 = intermediateValue46;
        intermediateValue47 = intermediateValue46;
        intermediateValue49 = intermediateValue46;
        intermediateValue51 = intermediateValue46;
        intermediateValue53 = intermediateValue46;
        intermediateValue55 = intermediateValue46;
        intermediateValue57 = intermediateValue46;
        intermediateValue59 = intermediateValue46;
        intermediateValue61 = intermediateValue46;
        intermediateValue63 = intermediateValue46;
        intermediateValue65 = intermediateValue46;
        intermediateValue67 = intermediateValue46;
        intermediateValue69 = intermediateValue46;
        intermediateValue71 = intermediateValue46;
        intermediateValue73 = intermediateValue46;
        intermediateValue75 = intermediateValue46;
        intermediateValue77 = productValue94;
        intermediateValue79 = productValue95;
        intermediateValue81 = productValue96;
        intermediateValue83 = intermediateValue32;
        intermediateValue85 = intermediateValue33;
        intermediateValue87 = intermediateValue34;
        intermediateValue89 = bitwiseValue22;
        intermediateValue91 = intermediateValue13;
        intermediateValue93 = 0.0f;
        intermediateValue95 = 0.0f;
        intermediateValue97 = 0.0f;
        intermediateValue99 = 1.0f;
        intermediateValue101 = 1.0f;
        intermediateValue103 = 1.0f;
        intermediateValue105 = reinterpretedBits3;
        intermediateValue107 = reinterpretedBits3;
        intermediateValue109 = 0u;
        intermediateValue111 = 0u;
        uint intermediateValue92;
        float intermediateValue100;
        float intermediateValue102;
        float intermediateValue104;
        float intermediateValue45;
        float intermediateValue48;
        float intermediateValue50;
        float intermediateValue52;
        float intermediateValue54;
        float intermediateValue56;
        float intermediateValue58;
        float intermediateValue60;
        float intermediateValue62;
        float intermediateValue64;
        float intermediateValue66;
        float intermediateValue68;
        float intermediateValue70;
        float intermediateValue72;
        float intermediateValue74;
        float intermediateValue76;
        float intermediateValue78;
        float intermediateValue80;
        float intermediateValue82;
        float intermediateValue84;
        float intermediateValue86;
        float intermediateValue88;
        uint intermediateValue90;
        float intermediateValue94;
        float intermediateValue96;
        float intermediateValue98;
        uint intermediateValue106;
        uint intermediateValue108;
        uint intermediateValue110;
        bool branchMergedValue;
        float branchMergedValue3;
        float branchMergedValue11;
        float branchMergedValue12;
        float branchMergedValue13;
        float branchMergedValue14;
        float branchMergedValue15;
        bool intermediateValue112;
        for (;;)
        {
            intermediateValue112 = intermediateValue87 < 10000.0f;
            if (intermediateValue112)
            {
                uint bitwiseValue47 = intermediateValue89 & 16383u;
                uint productValue172 = (bitwiseValue47 * 76u) + 58u;
                uint productValue173 = (bitwiseValue47 * 76u) + 59u;
                uint productValue174 = (bitwiseValue47 * 76u) + 60u;
                uint productValue175 = (bitwiseValue47 * 76u) + 61u;
                uint productValue176 = (bitwiseValue47 * 38u) + 32u;
                uint productValue177 = (bitwiseValue47 * 38u) + 33u;
                uint productValue178 = bitwiseValue47 * 38u;
                float4 reinterpretedBits9 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue178 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue178 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue178 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue178 + 3u) * 4 + 0)));
                float scalarValue32 = reinterpretedBits9.x;
                float scalarValue33 = reinterpretedBits9.y;
                float scalarValue34 = reinterpretedBits9.z;
                uint productValue179 = (bitwiseValue47 * 38u) + 4u;
                float4 reinterpretedBits10 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue179 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue179 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue179 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue179 + 3u) * 4 + 0)));
                float scalarValue35 = reinterpretedBits10.x;
                float scalarValue36 = reinterpretedBits10.y;
                float scalarValue37 = reinterpretedBits10.z;
                uint productValue180 = (bitwiseValue47 * 38u) + 8u;
                float4 reinterpretedBits11 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue180 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue180 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue180 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue180 + 3u) * 4 + 0)));
                float scalarValue38 = reinterpretedBits11.x;
                float scalarValue39 = reinterpretedBits11.y;
                float scalarValue40 = reinterpretedBits11.z;
                uint productValue181 = (bitwiseValue47 * 38u) + 24u;
                uint productValue182 = (bitwiseValue47 * 76u) + 72u;
                uint bitwiseValue48 = ((intermediateValue89 >> 13u) & 2u) | ((intermediateValue89 >> 13u) & 131068u);
                uint productValue183 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue47 * 76u) + 54u) * 2 + 0));
                uint sumValue149 = productValue183 + 0u;
                uint bitwiseValue49 = (rdByteLoad_objectInstances_uint(0u, ((bitwiseValue47 * 38u) + 25u) * 4 + 0) >> 2u) + ((intermediateValue89 >> 15u) & 32767u);
                uint productValue184 = bitwiseValue49 * 4u;
                uint productValue185 = (bitwiseValue49 * 4u) + 1u;
                uint productValue186 = (bitwiseValue49 * 4u) + 2u;
                precise float bitwiseValue50 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue149), productValue184 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue150 = bitwiseValue50 + (-1.0f);
                precise float bitwiseValue51 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue149), productValue184 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue151 = bitwiseValue51 + (-1.0f);
                precise float bitwiseValue52 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue149), productValue184 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue152 = bitwiseValue52 + (-1.0f);
                precise float bitwiseValue53 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue149), productValue185 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue153 = bitwiseValue53 + (-1.0f);
                precise float bitwiseValue54 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue149), productValue185 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue154 = bitwiseValue54 + (-1.0f);
                precise float bitwiseValue55 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue149), productValue185 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue155 = bitwiseValue55 + (-1.0f);
                precise float bitwiseValue56 = float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue149), productValue186 * 4 + 0) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue156 = bitwiseValue56 + (-1.0f);
                precise float bitwiseValue57 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue149), productValue186 * 4 + 0) >> 10u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue157 = bitwiseValue57 + (-1.0f);
                precise float bitwiseValue58 = float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue149), productValue186 * 4 + 0) >> 20u) & 1023u) * 0.00195503421127796173095703125f;
                precise float sumValue158 = bitwiseValue58 + (-1.0f);
                precise float sumValue159 = 1.0f - intermediateValue83;
                precise float sumValue160 = sumValue159 - intermediateValue85;
                uint sumValue161 = productValue183 + 0u;
                uint productValue187 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue47 * 76u) + 56u) * 2 + 0));
                uint productValue188 = productValue187 * (rdByteLoad_objectInstances_uint(0u, productValue181 * 4 + 0) + bitwiseValue48);
                uint bitwiseValue59 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue47 * 76u) + 71u) * 2 + 0) & 255u);
                uint bitwiseValue60 = (bitwiseValue59 + productValue188) >> 1u;
                half3 productValue189 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue161), bitwiseValue60 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue161), (bitwiseValue60 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue161), (bitwiseValue60 + 2u) * 2 + 0)));
                uint bitwiseValue61 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue182 * 2 + 0) & 255u);
                uint bitwiseValue62 = (bitwiseValue61 + productValue188) >> 2u;
                precise float bitwiseValue63 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue62 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue64 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue62 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue65 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue62 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue66 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue62 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                uint bitwiseValue67 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue182 * 2 + 0) >> 8u);
                uint bitwiseValue68 = (bitwiseValue67 + productValue188) >> 2u;
                bool productValue190 = rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) < 0u;
                float intermediateValue143;
                float intermediateValue144;
                if (productValue190)
                {
                    uint bitwiseValue69 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue68 * 4 + 0) >> 15u;
                    precise float bitwiseValue70 = float(bitwiseValue69 & 1u) * 2.0f;
                    precise float sumValue162 = bitwiseValue70 + (-1.0f);
                    precise float bitwiseValue71 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue68 * 4 + 0) >> 31u) * 2.0f;
                    precise float sumValue163 = bitwiseValue71 + (-1.0f);
                    precise float bitwiseValue72 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue68 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue73 = float(bitwiseValue69 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue191 = sumValue162 * 3.0517578125e-05f;
                    precise float productValue192 = sumValue163 * 3.0517578125e-05f;
                    precise float sumValue164 = bitwiseValue72 + productValue191;
                    precise float sumValue165 = bitwiseValue73 + productValue192;
                    intermediateValue143 = sumValue164;
                    intermediateValue144 = sumValue165;
                }
                else
                {
                    precise float bitwiseValue74 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue68 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue75 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue68 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue193 = bitwiseValue74 * 16384.0f;
                    precise float sumValue166 = productValue193 + 0.5f;
                    precise float productValue194 = bitwiseValue75 * 16384.0f;
                    precise float sumValue167 = productValue194 + 0.5f;
                    precise float productValue195 = floor(sumValue166) * 6.103515625e-05f;
                    precise float productValue196 = floor(sumValue167) * 6.103515625e-05f;
                    intermediateValue143 = productValue195;
                    intermediateValue144 = productValue196;
                }
                uint intermediateValue162;
                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 256u) == 0u)
                {
                    intermediateValue162 = 0u;
                }
                else
                {
                    intermediateValue162 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), ((uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue47 * 76u) + 74u) * 2 + 0) >> 8u) + productValue188) >> 2u) * 4 + 0) & 65535u;
                }
                precise float productValue197 = sumValue160 * float(productValue189.x);
                precise float productValue198 = sumValue160 * float(productValue189.y);
                precise float productValue199 = sumValue160 * float(productValue189.z);
                precise float sumValue168 = productValue197 + 0.0f;
                precise float sumValue169 = productValue198 + 0.0f;
                precise float sumValue170 = productValue199 + 0.0f;
                precise float productValue200 = sumValue160 * intermediateValue143;
                precise float productValue201 = sumValue160 * intermediateValue144;
                precise float sumValue171 = productValue200 + 0.0f;
                precise float sumValue172 = productValue201 + 0.0f;
                precise float productValue202 = sumValue160 * bitwiseValue63;
                precise float productValue203 = sumValue160 * bitwiseValue64;
                precise float productValue204 = sumValue160 * bitwiseValue65;
                precise float productValue205 = sumValue160 * bitwiseValue66;
                precise float sumValue173 = productValue202 + 0.0f;
                precise float sumValue174 = productValue203 + 0.0f;
                precise float sumValue175 = productValue204 + 0.0f;
                precise float sumValue176 = productValue205 + 0.0f;
                uint bitwiseValue76 = productValue187 * (rdByteLoad_objectInstances_uint(0u, productValue181 * 4 + 0) + (bitwiseValue48 | 1u));
                uint bitwiseValue77 = (bitwiseValue59 + bitwiseValue76) >> 1u;
                half3 productValue206 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue161), bitwiseValue77 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue161), (bitwiseValue77 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue161), (bitwiseValue77 + 2u) * 2 + 0)));
                uint bitwiseValue78 = (bitwiseValue61 + bitwiseValue76) >> 2u;
                precise float bitwiseValue79 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue78 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue80 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue78 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue81 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue78 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue82 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue78 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                uint bitwiseValue83 = (bitwiseValue67 + bitwiseValue76) >> 2u;
                float intermediateValue189;
                float intermediateValue190;
                if (productValue190)
                {
                    uint bitwiseValue84 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue83 * 4 + 0) >> 15u;
                    precise float bitwiseValue85 = float(bitwiseValue84 & 1u) * 2.0f;
                    precise float sumValue177 = bitwiseValue85 + (-1.0f);
                    precise float bitwiseValue86 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue83 * 4 + 0) >> 31u) * 2.0f;
                    precise float sumValue178 = bitwiseValue86 + (-1.0f);
                    precise float bitwiseValue87 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue83 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue88 = float(bitwiseValue84 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue207 = sumValue177 * 3.0517578125e-05f;
                    precise float productValue208 = sumValue178 * 3.0517578125e-05f;
                    precise float sumValue179 = bitwiseValue87 + productValue207;
                    precise float sumValue180 = bitwiseValue88 + productValue208;
                    intermediateValue189 = sumValue179;
                    intermediateValue190 = sumValue180;
                }
                else
                {
                    precise float bitwiseValue89 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue83 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue90 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue83 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue209 = bitwiseValue89 * 16384.0f;
                    precise float sumValue181 = productValue209 + 0.5f;
                    precise float productValue210 = bitwiseValue90 * 16384.0f;
                    precise float sumValue182 = productValue210 + 0.5f;
                    precise float productValue211 = floor(sumValue181) * 6.103515625e-05f;
                    precise float productValue212 = floor(sumValue182) * 6.103515625e-05f;
                    intermediateValue189 = productValue211;
                    intermediateValue190 = productValue212;
                }
                precise float productValue213 = intermediateValue83 * float(productValue206.x);
                precise float productValue214 = intermediateValue83 * float(productValue206.y);
                precise float productValue215 = intermediateValue83 * float(productValue206.z);
                precise float sumValue183 = sumValue168 + productValue213;
                precise float sumValue184 = sumValue169 + productValue214;
                precise float sumValue185 = sumValue170 + productValue215;
                precise float productValue216 = intermediateValue83 * intermediateValue189;
                precise float productValue217 = intermediateValue83 * intermediateValue190;
                precise float sumValue186 = sumValue171 + productValue216;
                precise float sumValue187 = sumValue172 + productValue217;
                precise float productValue218 = intermediateValue83 * bitwiseValue79;
                precise float productValue219 = intermediateValue83 * bitwiseValue80;
                precise float productValue220 = intermediateValue83 * bitwiseValue81;
                precise float productValue221 = intermediateValue83 * bitwiseValue82;
                precise float sumValue188 = sumValue173 + productValue218;
                precise float sumValue189 = sumValue174 + productValue219;
                precise float sumValue190 = sumValue175 + productValue220;
                precise float sumValue191 = sumValue176 + productValue221;
                uint bitwiseValue91 = productValue187 * (rdByteLoad_objectInstances_uint(0u, productValue181 * 4 + 0) + (bitwiseValue48 ^ 2u));
                uint bitwiseValue92 = (bitwiseValue59 + bitwiseValue91) >> 1u;
                half3 productValue222 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue161), bitwiseValue92 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue161), (bitwiseValue92 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue161), (bitwiseValue92 + 2u) * 2 + 0)));
                uint bitwiseValue93 = (bitwiseValue61 + bitwiseValue91) >> 2u;
                precise float bitwiseValue94 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue93 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue95 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue93 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue96 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue93 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                precise float bitwiseValue97 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue93 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                uint bitwiseValue98 = (bitwiseValue67 + bitwiseValue91) >> 2u;
                float intermediateValue193;
                float intermediateValue194;
                if (productValue190)
                {
                    uint bitwiseValue99 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue98 * 4 + 0) >> 15u;
                    precise float bitwiseValue100 = float(bitwiseValue99 & 1u) * 2.0f;
                    precise float sumValue192 = bitwiseValue100 + (-1.0f);
                    precise float bitwiseValue101 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue98 * 4 + 0) >> 31u) * 2.0f;
                    precise float sumValue193 = bitwiseValue101 + (-1.0f);
                    precise float bitwiseValue102 = float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue98 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue103 = float(bitwiseValue99 & 65534u) * 1.525902189314365386962890625e-05f;
                    precise float productValue223 = sumValue192 * 3.0517578125e-05f;
                    precise float productValue224 = sumValue193 * 3.0517578125e-05f;
                    precise float sumValue194 = bitwiseValue102 + productValue223;
                    precise float sumValue195 = bitwiseValue103 + productValue224;
                    intermediateValue193 = sumValue194;
                    intermediateValue194 = sumValue195;
                }
                else
                {
                    precise float bitwiseValue104 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue98 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f;
                    precise float bitwiseValue105 = float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue161), bitwiseValue98 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f;
                    precise float productValue225 = bitwiseValue104 * 16384.0f;
                    precise float sumValue196 = productValue225 + 0.5f;
                    precise float productValue226 = bitwiseValue105 * 16384.0f;
                    precise float sumValue197 = productValue226 + 0.5f;
                    precise float productValue227 = floor(sumValue196) * 6.103515625e-05f;
                    precise float productValue228 = floor(sumValue197) * 6.103515625e-05f;
                    intermediateValue193 = productValue227;
                    intermediateValue194 = productValue228;
                }
                precise float productValue229 = intermediateValue85 * float(productValue222.x);
                precise float productValue230 = intermediateValue85 * float(productValue222.y);
                precise float productValue231 = intermediateValue85 * float(productValue222.z);
                precise float sumValue198 = sumValue183 + productValue229;
                precise float sumValue199 = sumValue184 + productValue230;
                precise float sumValue200 = sumValue185 + productValue231;
                precise float productValue232 = intermediateValue85 * intermediateValue193;
                precise float productValue233 = intermediateValue85 * intermediateValue194;
                precise float sumValue201 = sumValue186 + productValue232;
                precise float sumValue202 = sumValue187 + productValue233;
                precise float productValue234 = intermediateValue85 * bitwiseValue94;
                precise float productValue235 = intermediateValue85 * bitwiseValue95;
                precise float productValue236 = intermediateValue85 * bitwiseValue96;
                precise float productValue237 = intermediateValue85 * bitwiseValue97;
                precise float sumValue203 = sumValue188 + productValue234;
                precise float sumValue204 = sumValue189 + productValue235;
                precise float sumValue205 = sumValue190 + productValue236;
                precise float sumValue206 = sumValue191 + productValue237;
                precise float productValue238 = scalarValue32 * sumValue198;
                precise float productValue239 = sumValue199 * scalarValue33;
                precise float sumValue207 = productValue239 + productValue238;
                precise float productValue240 = sumValue200 * scalarValue34;
                precise float sumValue208 = productValue240 + sumValue207;
                precise float productValue241 = 1.0f * reinterpretedBits9.w;
                precise float sumValue209 = productValue241 + sumValue208;
                precise float productValue242 = scalarValue35 * sumValue198;
                precise float productValue243 = sumValue199 * scalarValue36;
                precise float sumValue210 = productValue243 + productValue242;
                precise float productValue244 = sumValue200 * scalarValue37;
                precise float sumValue211 = productValue244 + sumValue210;
                precise float productValue245 = 1.0f * reinterpretedBits10.w;
                precise float sumValue212 = productValue245 + sumValue211;
                precise float productValue246 = scalarValue38 * sumValue198;
                precise float productValue247 = sumValue199 * scalarValue39;
                precise float sumValue213 = productValue247 + productValue246;
                precise float productValue248 = sumValue200 * scalarValue40;
                precise float sumValue214 = productValue248 + sumValue213;
                precise float productValue249 = 1.0f * reinterpretedBits11.w;
                precise float sumValue215 = productValue249 + sumValue214;
                precise float productValue250 = scalarValue32 * sumValue150;
                precise float productValue251 = sumValue151 * scalarValue33;
                precise float sumValue216 = productValue251 + productValue250;
                precise float productValue252 = sumValue152 * scalarValue34;
                precise float sumValue217 = productValue252 + sumValue216;
                precise float productValue253 = scalarValue35 * sumValue150;
                precise float productValue254 = sumValue151 * scalarValue36;
                precise float sumValue218 = productValue254 + productValue253;
                precise float productValue255 = sumValue152 * scalarValue37;
                precise float sumValue219 = productValue255 + sumValue218;
                precise float productValue256 = scalarValue38 * sumValue150;
                precise float productValue257 = sumValue151 * scalarValue39;
                precise float sumValue220 = productValue257 + productValue256;
                precise float productValue258 = sumValue152 * scalarValue40;
                precise float sumValue221 = productValue258 + sumValue220;
                float inverseLengthValue4 = rsqrt(dot(float3(sumValue217, sumValue219, sumValue221), float3(sumValue217, sumValue219, sumValue221)));
                precise float productValue259 = sumValue217 * inverseLengthValue4;
                precise float productValue260 = sumValue219 * inverseLengthValue4;
                precise float productValue261 = sumValue221 * inverseLengthValue4;
                precise float productValue262 = scalarValue32 * sumValue153;
                precise float productValue263 = sumValue154 * scalarValue33;
                precise float sumValue222 = productValue263 + productValue262;
                precise float productValue264 = sumValue155 * scalarValue34;
                precise float sumValue223 = productValue264 + sumValue222;
                precise float productValue265 = scalarValue35 * sumValue153;
                precise float productValue266 = sumValue154 * scalarValue36;
                precise float sumValue224 = productValue266 + productValue265;
                precise float productValue267 = sumValue155 * scalarValue37;
                precise float sumValue225 = productValue267 + sumValue224;
                precise float productValue268 = scalarValue38 * sumValue153;
                precise float productValue269 = sumValue154 * scalarValue39;
                precise float sumValue226 = productValue269 + productValue268;
                precise float productValue270 = sumValue155 * scalarValue40;
                precise float sumValue227 = productValue270 + sumValue226;
                float inverseLengthValue5 = rsqrt(dot(float3(sumValue223, sumValue225, sumValue227), float3(sumValue223, sumValue225, sumValue227)));
                precise float productValue271 = sumValue223 * inverseLengthValue5;
                precise float productValue272 = sumValue225 * inverseLengthValue5;
                precise float productValue273 = sumValue227 * inverseLengthValue5;
                precise float productValue274 = scalarValue32 * sumValue156;
                precise float productValue275 = sumValue157 * scalarValue33;
                precise float sumValue228 = productValue275 + productValue274;
                precise float productValue276 = sumValue158 * scalarValue34;
                precise float sumValue229 = productValue276 + sumValue228;
                precise float productValue277 = scalarValue35 * sumValue156;
                precise float productValue278 = sumValue157 * scalarValue36;
                precise float sumValue230 = productValue278 + productValue277;
                precise float productValue279 = sumValue158 * scalarValue37;
                precise float sumValue231 = productValue279 + sumValue230;
                precise float productValue280 = scalarValue38 * sumValue156;
                precise float productValue281 = sumValue157 * scalarValue39;
                precise float sumValue232 = productValue281 + productValue280;
                precise float productValue282 = sumValue158 * scalarValue40;
                precise float sumValue233 = productValue282 + sumValue232;
                float inverseLengthValue6 = rsqrt(dot(float3(sumValue229, sumValue231, sumValue233), float3(sumValue229, sumValue231, sumValue233)));
                precise float productValue283 = sumValue229 * inverseLengthValue6;
                precise float productValue284 = sumValue231 * inverseLengthValue6;
                precise float productValue285 = sumValue233 * inverseLengthValue6;
                bool dotProductValue2 = dot(float3(intermediateValue77, intermediateValue79, intermediateValue81), float3(productValue259, productValue260, productValue261)) > 0.0f;
                precise float sumValue234 = (-0.0f) - productValue259;
                precise float sumValue235 = (-0.0f) - productValue260;
                precise float sumValue236 = (-0.0f) - productValue261;
                float comparisonValue15 = dotProductValue2 ? sumValue234 : productValue259;
                float comparisonValue16 = dotProductValue2 ? sumValue235 : productValue260;
                float comparisonValue17 = dotProductValue2 ? sumValue236 : productValue261;
                bool conditionValue4 = intermediateValue89 > 3221225471u;
                float2 reinterpretedBits12 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, (intermediateValue162 * 8u) * 8 + 0));
                float2 reinterpretedBits16 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue162 * 8u) + 1u) * 8 + 0));
                float2 reinterpretedBits17 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue162 * 8u) + 2u) * 8 + 0));
                float2 reinterpretedBits18 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue162 * 8u) + 3u) * 8 + 0));
                uint productValue286 = (intermediateValue162 * 16u) + 8u;
                float reinterpretedBits19 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue162 * 16u) + 13u) * 4 + 0));
                float reinterpretedBits20 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue162 * 16u) + 14u) * 4 + 0));
                float reinterpretedBits21 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue162 * 16u) + 15u) * 4 + 0));
                precise float productValue287 = viewCbConstants[89u].y * intermediateValue87;
                precise float sumValue237 = productValue287 + 0.0f;
                precise float dotProductValue3 = dot(float3(intermediateValue77, intermediateValue79, intermediateValue81), float3(comparisonValue15, comparisonValue16, comparisonValue17));
                precise float nonlinearValue2 = float((half)f16tof32(rdByteLoad_faceDataBuffersRW_uint16_t(NonUniformResourceIndex(sumValue149), ((bitwiseValue49 * 8u) + 6u) * 2 + 0))) + log2(abs(sumValue237));
                precise float nonlinearValue3 = nonlinearValue2 - log2(abs(dotProductValue3));
                precise float sumValue238 = nonlinearValue3 + viewCbConstants[86u].x;
                float scalarValue41 = max(0.0f, sumValue238);
                float scalarValue42 = min(scalarValue41, reinterpretedBits19);
                uint productValue288 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue172 * 2 + 0));
                bool productValue289 = rdByteLoad_objectInstances_uint16_t(0u, productValue172 * 2 + 0) > 4095u;
                uint reinterpretedBits23;
                if (productValue289)
                {
                    reinterpretedBits23 = asuint(viewCbConstants[98u]).w;
                }
                else
                {
                    reinterpretedBits23 = productValue288;
                }
                uint sumValue239 = reinterpretedBits23 + 0u;
                float intermediateValue198;
                float intermediateValue199;
                float intermediateValue200;
                float intermediateValue201;
                if (rdByteLoad_objectInstances_uint16_t(0u, productValue172 * 2 + 0) == 65535u)
                {
                    intermediateValue198 = 1.0f;
                    intermediateValue199 = 1.0f;
                    intermediateValue200 = 1.0f;
                    intermediateValue201 = 1.0f;
                }
                else
                {
                    float4 sampledTextureValue3 = textures[NonUniformResourceIndex(sumValue239)].SampleLevel(defaultSampler, float2(sumValue201, sumValue202), scalarValue42);
                    intermediateValue198 = sampledTextureValue3.x;
                    intermediateValue199 = sampledTextureValue3.y;
                    intermediateValue200 = sampledTextureValue3.z;
                    intermediateValue201 = sampledTextureValue3.w;
                }
                float intermediateValue206;
                float intermediateValue208;
                float intermediateValue210;
                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 1024u) == 0u)
                {
                    float branchMergedValue28;
                    float branchMergedValue56;
                    float branchMergedValue57;
                    float branchMergedValue58;
                    float branchMergedValue59;
                    float branchMergedValue60;
                    float branchMergedValue61;
                    float branchMergedValue62;
                    float branchMergedValue63;
                    float branchMergedValue64;
                    float branchMergedValue65;
                    float branchMergedValue66;
                    float branchMergedValue67;
                    float branchMergedValue68;
                    float branchMergedValue69;
                    float branchMergedValue70;
                    float branchMergedValue71;
                    float branchMergedValue72;
                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 512u) == 0u)
                    {
                        bool comparisonValue19 = (rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 4u) == 0u;
                        float intermediateValue212;
                        float intermediateValue213;
                        float intermediateValue214;
                        float intermediateValue215;
                        if (comparisonValue19)
                        {
                            intermediateValue212 = intermediateValue201;
                            intermediateValue213 = sumValue203;
                            intermediateValue214 = sumValue204;
                            intermediateValue215 = sumValue205;
                        }
                        else
                        {
                            uint reinterpretedBits25;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue173 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits25 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits25 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue173 * 2 + 0));
                            }
                            float4 sampledTextureValue4 = textures[NonUniformResourceIndex(reinterpretedBits25 + 0u)].SampleLevel(defaultSampler, float2(sumValue203, sumValue204), 0.0f);
                            precise float productValue290 = sampledTextureValue4.x * 2.0f;
                            precise float productValue291 = sampledTextureValue4.y * 2.0f;
                            precise float productValue292 = sampledTextureValue4.z * 2.0f;
                            precise float sumValue240 = productValue290 + (-1.0f);
                            precise float sumValue241 = productValue291 + (-1.0f);
                            precise float sumValue242 = productValue292 + (-1.0f);
                            precise float productValue293 = sumValue205 * sumValue240;
                            precise float productValue294 = sumValue205 * sumValue241;
                            precise float productValue295 = sumValue205 * sumValue242;
                            precise float sumValue243 = productValue293 + 1.0f;
                            precise float sumValue244 = productValue294 + 1.0f;
                            precise float sumValue245 = productValue295 + 1.0f;
                            precise float productValue296 = sumValue206 * sumValue243;
                            precise float productValue297 = sumValue206 * sumValue244;
                            precise float productValue298 = sumValue206 * sumValue245;
                            intermediateValue212 = 1.0f;
                            intermediateValue213 = productValue296;
                            intermediateValue214 = productValue297;
                            intermediateValue215 = productValue298;
                        }
                        float intermediateValue234;
                        float intermediateValue235;
                        float intermediateValue236;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 8192u) == 0u)
                        {
                            intermediateValue234 = intermediateValue213;
                            intermediateValue235 = intermediateValue214;
                            intermediateValue236 = intermediateValue215;
                        }
                        else
                        {
                            precise float sumValue246 = 1.0f - intermediateValue213;
                            precise float sumValue247 = 1.0f - intermediateValue214;
                            precise float sumValue248 = 1.0f - intermediateValue215;
                            precise float productValue299 = intermediateValue212 * sumValue246;
                            precise float productValue300 = intermediateValue212 * sumValue247;
                            precise float productValue301 = intermediateValue212 * sumValue248;
                            precise float sumValue249 = intermediateValue213 + productValue299;
                            precise float sumValue250 = intermediateValue214 + productValue300;
                            precise float sumValue251 = intermediateValue215 + productValue301;
                            intermediateValue234 = sumValue249;
                            intermediateValue235 = sumValue250;
                            intermediateValue236 = sumValue251;
                        }
                        precise float productValue302 = intermediateValue198 * intermediateValue234;
                        precise float productValue303 = intermediateValue199 * intermediateValue235;
                        precise float productValue304 = intermediateValue200 * intermediateValue236;
                        float intermediateValue202;
                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 2048u) == 0u)
                        {
                            intermediateValue202 = intermediateValue212;
                        }
                        else
                        {
                            precise float productValue305 = intermediateValue212 * 2.0f;
                            precise float sumValue252 = productValue305 + (-1.0f);
                            intermediateValue202 = clamp(sumValue252, 0.0f, 1.0f);
                        }
                        precise float bitwiseValue106 = float(rdByteLoad_objectInstances_uint(0u, productValue176 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                        precise float bitwiseValue107 = float((rdByteLoad_objectInstances_uint(0u, productValue176 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                        precise float bitwiseValue108 = float((rdByteLoad_objectInstances_uint(0u, productValue176 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                        precise float sumValue253 = bitwiseValue106 + (-1.0f);
                        precise float sumValue254 = bitwiseValue107 + (-1.0f);
                        precise float sumValue255 = bitwiseValue108 + (-1.0f);
                        precise float productValue306 = sumValue253 * intermediateValue202;
                        precise float productValue307 = sumValue254 * intermediateValue202;
                        precise float productValue308 = sumValue255 * intermediateValue202;
                        precise float sumValue256 = productValue306 + 1.0f;
                        precise float sumValue257 = productValue307 + 1.0f;
                        precise float sumValue258 = productValue308 + 1.0f;
                        precise float productValue309 = productValue302 * sumValue256;
                        precise float productValue310 = productValue303 * sumValue257;
                        precise float productValue311 = productValue304 * sumValue258;
                        float intermediateValue255;
                        float intermediateValue257;
                        float intermediateValue259;
                        float intermediateValue261;
                        if (comparisonValue19)
                        {
                            float intermediateValue266;
                            float intermediateValue267;
                            float intermediateValue268;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue173 * 2 + 0) == 65535u)
                            {
                                intermediateValue266 = productValue309;
                                intermediateValue267 = productValue310;
                                intermediateValue268 = productValue311;
                            }
                            else
                            {
                                uint reinterpretedBits34;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue173 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits34 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits34 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue173 * 2 + 0));
                                }
                                float4 sampledTextureValue5 = textures[NonUniformResourceIndex(reinterpretedBits34 + 0u)].SampleLevel(defaultSampler, float2(sumValue201, sumValue202), scalarValue42);
                                float scalarValue43 = sampledTextureValue5.x;
                                float scalarValue44 = sampledTextureValue5.y;
                                float scalarValue45 = sampledTextureValue5.z;
                                float scalarValue46 = sampledTextureValue5.w;
                                float branchMergedValue32;
                                float branchMergedValue87;
                                float branchMergedValue88;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 8u) == 0u)
                                {
                                    float branchMergedValue182;
                                    float branchMergedValue201;
                                    float branchMergedValue202;
                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 16u) == 0u)
                                    {
                                        float branchMergedValue238;
                                        float branchMergedValue241;
                                        float branchMergedValue242;
                                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 32u) == 0u)
                                        {
                                            branchMergedValue238 = productValue311;
                                            branchMergedValue241 = productValue310;
                                            branchMergedValue242 = productValue309;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue109 = float(rdByteLoad_objectInstances_uint(0u, productValue177 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                                            precise float bitwiseValue110 = float((rdByteLoad_objectInstances_uint(0u, productValue177 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                                            precise float bitwiseValue111 = float((rdByteLoad_objectInstances_uint(0u, productValue177 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                                            precise float productValue312 = bitwiseValue109 * scalarValue43;
                                            precise float productValue313 = bitwiseValue110 * scalarValue44;
                                            precise float productValue314 = bitwiseValue111 * scalarValue45;
                                            precise float sumValue259 = productValue312 - productValue309;
                                            precise float sumValue260 = productValue313 - productValue310;
                                            precise float sumValue261 = productValue314 - productValue311;
                                            precise float productValue315 = scalarValue46 * sumValue259;
                                            precise float productValue316 = scalarValue46 * sumValue260;
                                            precise float productValue317 = scalarValue46 * sumValue261;
                                            precise float sumValue262 = productValue309 + productValue315;
                                            precise float sumValue263 = productValue310 + productValue316;
                                            precise float sumValue264 = productValue311 + productValue317;
                                            branchMergedValue238 = sumValue264;
                                            branchMergedValue241 = sumValue263;
                                            branchMergedValue242 = sumValue262;
                                        }
                                        branchMergedValue182 = branchMergedValue238;
                                        branchMergedValue201 = branchMergedValue241;
                                        branchMergedValue202 = branchMergedValue242;
                                    }
                                    else
                                    {
                                        precise float sumValue265 = scalarValue43 - productValue309;
                                        precise float sumValue266 = scalarValue44 - productValue310;
                                        precise float sumValue267 = scalarValue45 - productValue311;
                                        precise float productValue318 = scalarValue46 * sumValue265;
                                        precise float productValue319 = scalarValue46 * sumValue266;
                                        precise float productValue320 = scalarValue46 * sumValue267;
                                        precise float sumValue268 = productValue309 + productValue318;
                                        precise float sumValue269 = productValue310 + productValue319;
                                        precise float sumValue270 = productValue311 + productValue320;
                                        uint reinterpretedBits36;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue174 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits36 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits36 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue174 * 2 + 0));
                                        }
                                        float4 sampledTextureValue6 = textures[NonUniformResourceIndex(reinterpretedBits36 + 0u)].SampleLevel(defaultSampler, float2(sumValue201, sumValue202), scalarValue42);
                                        float scalarValue47 = sampledTextureValue6.w;
                                        precise float productValue321 = bitwiseValue106 * sampledTextureValue6.x;
                                        precise float productValue322 = bitwiseValue107 * sampledTextureValue6.y;
                                        precise float productValue323 = bitwiseValue108 * sampledTextureValue6.z;
                                        precise float sumValue271 = productValue321 - sumValue268;
                                        precise float sumValue272 = productValue322 - sumValue269;
                                        precise float sumValue273 = productValue323 - sumValue270;
                                        precise float productValue324 = scalarValue47 * sumValue271;
                                        precise float productValue325 = scalarValue47 * sumValue272;
                                        precise float productValue326 = scalarValue47 * sumValue273;
                                        precise float sumValue274 = sumValue268 + productValue324;
                                        precise float sumValue275 = sumValue269 + productValue325;
                                        precise float sumValue276 = sumValue270 + productValue326;
                                        branchMergedValue182 = sumValue276;
                                        branchMergedValue201 = sumValue275;
                                        branchMergedValue202 = sumValue274;
                                    }
                                    branchMergedValue32 = branchMergedValue182;
                                    branchMergedValue87 = branchMergedValue201;
                                    branchMergedValue88 = branchMergedValue202;
                                }
                                else
                                {
                                    precise float sumValue277 = 1.0f - scalarValue46;
                                    precise float dotProductValue4 = sumValue277 * dot(float3(scalarValue43, scalarValue44, scalarValue45), 1.0f.xxx);
                                    float clampedValue = clamp(ceil(dotProductValue4), 0.0f, 1.0f);
                                    precise float sumValue278 = productValue309 - scalarValue43;
                                    precise float sumValue279 = productValue310 - scalarValue44;
                                    precise float sumValue280 = productValue311 - scalarValue45;
                                    precise float productValue327 = sumValue278 * clampedValue;
                                    precise float productValue328 = sumValue279 * clampedValue;
                                    precise float productValue329 = sumValue280 * clampedValue;
                                    precise float sumValue281 = scalarValue43 + productValue327;
                                    precise float sumValue282 = scalarValue44 + productValue328;
                                    precise float sumValue283 = scalarValue45 + productValue329;
                                    branchMergedValue32 = sumValue283;
                                    branchMergedValue87 = sumValue282;
                                    branchMergedValue88 = sumValue281;
                                }
                                intermediateValue266 = branchMergedValue88;
                                intermediateValue267 = branchMergedValue87;
                                intermediateValue268 = branchMergedValue32;
                            }
                            float intermediateValue256;
                            float intermediateValue258;
                            float intermediateValue260;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 64u) == 0u)
                            {
                                intermediateValue256 = intermediateValue266;
                                intermediateValue258 = intermediateValue267;
                                intermediateValue260 = intermediateValue268;
                            }
                            else
                            {
                                precise float bitwiseValue112 = float(rdByteLoad_objectInstances_uint(0u, productValue177 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f;
                                precise float bitwiseValue113 = float((rdByteLoad_objectInstances_uint(0u, productValue177 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f;
                                precise float bitwiseValue114 = float((rdByteLoad_objectInstances_uint(0u, productValue177 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f;
                                precise float bitwiseValue115 = float(rdByteLoad_objectInstances_uint(0u, productValue177 * 4 + 0) & 255u) * 0.0039215688593685626983642578125f;
                                precise float sumValue284 = bitwiseValue112 - intermediateValue266;
                                precise float sumValue285 = bitwiseValue113 - intermediateValue267;
                                precise float sumValue286 = bitwiseValue114 - intermediateValue268;
                                precise float productValue330 = bitwiseValue115 * sumValue284;
                                precise float productValue331 = bitwiseValue115 * sumValue285;
                                precise float productValue332 = bitwiseValue115 * sumValue286;
                                precise float sumValue287 = intermediateValue266 + productValue330;
                                precise float sumValue288 = intermediateValue267 + productValue331;
                                precise float sumValue289 = intermediateValue268 + productValue332;
                                intermediateValue256 = sumValue287;
                                intermediateValue258 = sumValue288;
                                intermediateValue260 = sumValue289;
                            }
                            float branchMergedValue31;
                            float branchMergedValue84;
                            float branchMergedValue85;
                            float branchMergedValue86;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue175 * 2 + 0) & 16384u) == 0u)
                            {
                                branchMergedValue31 = 0.0f;
                                branchMergedValue84 = intermediateValue260;
                                branchMergedValue85 = intermediateValue258;
                                branchMergedValue86 = intermediateValue256;
                            }
                            else
                            {
                                precise float sumValue290 = sumValue202 - sumValue201;
                                precise float productValue333 = sumValue290 * 8.0f;
                                precise float productValue334 = viewCbConstants[97u].z * 3.0f;
                                precise float sumValue291 = productValue334 + productValue333;
                                precise float wavePhaseValue8 = sin(sumValue291) * 0.5f;
                                precise float sumValue292 = wavePhaseValue8 + 0.5f;
                                float clampedValue1 = clamp(sumValue292, 0.0f, 1.0f);
                                precise float productValue335 = clampedValue1 * clampedValue1;
                                precise float productValue336 = 0.560000002384185791015625f * productValue335;
                                precise float sumValue293 = productValue336 + intermediateValue256;
                                precise float productValue337 = 0.2800000011920928955078125f * productValue335;
                                precise float sumValue294 = productValue337 + intermediateValue258;
                                precise float productValue338 = 0.699999988079071044921875f * productValue335;
                                precise float sumValue295 = productValue338 + intermediateValue260;
                                branchMergedValue31 = mad(productValue335, 0.00019999999494757503271102905273438f, 0.0f);
                                branchMergedValue84 = sumValue295;
                                branchMergedValue85 = sumValue294;
                                branchMergedValue86 = sumValue293;
                            }
                            intermediateValue255 = branchMergedValue86;
                            intermediateValue257 = branchMergedValue85;
                            intermediateValue259 = branchMergedValue84;
                            intermediateValue261 = branchMergedValue31;
                        }
                        else
                        {
                            intermediateValue255 = productValue309;
                            intermediateValue257 = productValue310;
                            intermediateValue259 = productValue311;
                            intermediateValue261 = 0.0f;
                        }
                        float intermediateValue207;
                        if (intermediateValue255 < 0.040449999272823333740234375f)
                        {
                            precise float productValue339 = intermediateValue255 * 0.077399380505084991455078125f;
                            intermediateValue207 = productValue339;
                        }
                        else
                        {
                            precise float sumValue296 = intermediateValue255 + 0.054999999701976776123046875f;
                            precise float productValue340 = sumValue296 * 0.947867333889007568359375f;
                            precise float nonlinearValue4 = log2(productValue340) * 2.400000095367431640625f;
                            intermediateValue207 = exp2(nonlinearValue4);
                        }
                        float intermediateValue209;
                        if (intermediateValue257 < 0.040449999272823333740234375f)
                        {
                            precise float productValue341 = intermediateValue257 * 0.077399380505084991455078125f;
                            intermediateValue209 = productValue341;
                        }
                        else
                        {
                            precise float sumValue297 = intermediateValue257 + 0.054999999701976776123046875f;
                            precise float productValue342 = sumValue297 * 0.947867333889007568359375f;
                            precise float nonlinearValue5 = log2(productValue342) * 2.400000095367431640625f;
                            intermediateValue209 = exp2(nonlinearValue5);
                        }
                        float intermediateValue211;
                        if (intermediateValue259 < 0.040449999272823333740234375f)
                        {
                            precise float productValue343 = intermediateValue259 * 0.077399380505084991455078125f;
                            intermediateValue211 = productValue343;
                        }
                        else
                        {
                            precise float sumValue298 = intermediateValue259 + 0.054999999701976776123046875f;
                            precise float productValue344 = sumValue298 * 0.947867333889007568359375f;
                            precise float nonlinearValue6 = log2(productValue344) * 2.400000095367431640625f;
                            intermediateValue211 = exp2(nonlinearValue6);
                        }
                        float reinterpretedBits24;
                        float reinterpretedBits37;
                        float reinterpretedBits38;
                        if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, productValue286 * 4 + 0) & 1u) == 0u)
                        {
                            reinterpretedBits24 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue162 * 16u) + 11u) * 4 + 0));
                            reinterpretedBits37 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue162 * 16u) + 9u) * 4 + 0));
                            reinterpretedBits38 = intermediateValue261 + asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue162 * 16u) + 10u) * 4 + 0));
                        }
                        else
                        {
                            precise float productValue345 = sumValue201 * reinterpretedBits12.x;
                            precise float sumValue299 = productValue345 + reinterpretedBits16.x;
                            precise float productValue346 = sumValue202 * reinterpretedBits12.y;
                            precise float sumValue300 = productValue346 + reinterpretedBits16.y;
                            precise float sumValue301 = reinterpretedBits20 + scalarValue41;
                            precise float sumValue302 = sumValue301 - reinterpretedBits19;
                            float4 sampledTextureValue7 = textures[NonUniformResourceIndex(sumValue239)].SampleLevel(defaultSampler, float2(sumValue299, sumValue300), min(sumValue302, reinterpretedBits20));
                            float scalarValue48 = sampledTextureValue7.y;
                            reinterpretedBits24 = sampledTextureValue7.x;
                            reinterpretedBits37 = sampledTextureValue7.z;
                            reinterpretedBits38 = mad(scalarValue48, scalarValue48, intermediateValue261);
                        }
                        precise float productValue347 = sumValue201 * reinterpretedBits17.x;
                        precise float sumValue303 = productValue347 + reinterpretedBits18.x;
                        precise float productValue348 = sumValue202 * reinterpretedBits17.y;
                        precise float sumValue304 = productValue348 + reinterpretedBits18.y;
                        precise float sumValue305 = reinterpretedBits21 + scalarValue41;
                        precise float sumValue306 = sumValue305 - reinterpretedBits19;
                        float scalarValue49 = min(sumValue306, reinterpretedBits21);
                        float intermediateValue487;
                        float intermediateValue488;
                        if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, productValue286 * 4 + 0) & 4u) == 0u)
                        {
                            float branchMergedValue39;
                            float branchMergedValue121;
                            if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, productValue286 * 4 + 0) & 16u) == 0u)
                            {
                                float branchMergedValue186;
                                float branchMergedValue218;
                                if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, productValue286 * 4 + 0) & 8u) == 0u)
                                {
                                    branchMergedValue186 = 0.0f;
                                    branchMergedValue218 = 0.0f;
                                }
                                else
                                {
                                    precise float productValue349 = scalarValue49 * (-1.0f);
                                    precise float sumValue307 = productValue349 + 2.0f;
                                    float clampedValue2 = clamp(sumValue307, 0.0f, 1.0f);
                                    float branchMergedValue239;
                                    float branchMergedValue243;
                                    if (clampedValue2 > 0.0f)
                                    {
                                        uint reinterpretedBits44;
                                        if (productValue289)
                                        {
                                            reinterpretedBits44 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits44 = productValue288;
                                        }
                                        uint unusedTextureMipCount5844;
                                        uint2 sumValue308 = rdTextureSize(textures[NonUniformResourceIndex(reinterpretedBits44 + 0u)], 0u, unusedTextureMipCount5844);
                                        precise float productValue350 = sumValue303 * float(int(uint(int(float(int(sumValue308.x))))));
                                        precise float productValue351 = sumValue304 * float(int(uint(int(float(int(sumValue308.y))))));
                                        float scalarValue50 = frac(productValue350);
                                        float scalarValue51 = frac(productValue351);
                                        precise float sumValue309 = scalarValue50 + (-0.5f);
                                        float intermediateValue572;
                                        if (abs(sumValue309) < 0.0625f)
                                        {
                                            precise float comparisonValue20 = sumValue303 + ((scalarValue50 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f));
                                            intermediateValue572 = comparisonValue20;
                                        }
                                        else
                                        {
                                            intermediateValue572 = sumValue303;
                                        }
                                        precise float sumValue310 = scalarValue51 + (-0.5f);
                                        float intermediateValue588;
                                        if (abs(sumValue310) < 0.0625f)
                                        {
                                            precise float comparisonValue24 = sumValue304 + ((scalarValue51 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f));
                                            intermediateValue588 = comparisonValue24;
                                        }
                                        else
                                        {
                                            intermediateValue588 = sumValue304;
                                        }
                                        float4 vectorValue7 = textures[NonUniformResourceIndex(sumValue239)].GatherRed(defaultSampler, float2(intermediateValue572, intermediateValue588));
                                        float scalarValue52 = vectorValue7.x;
                                        float scalarValue53 = vectorValue7.y;
                                        float scalarValue54 = vectorValue7.z;
                                        float scalarValue55 = vectorValue7.w;
                                        precise float sumValue311 = productValue350 + 0.5f;
                                        precise float sumValue312 = productValue351 + 0.5f;
                                        float scalarValue56 = frac(sumValue311);
                                        float scalarValue57 = frac(sumValue312);
                                        bool conditionValue5 = scalarValue57 > 0.5f;
                                        intermediateValue1[0u] = conditionValue5 ? scalarValue52 : scalarValue55;
                                        intermediateValue1[1u] = conditionValue5 ? scalarValue53 : scalarValue54;
                                        precise float clampedValue3 = intermediateValue1[uint(int(clamp((scalarValue56 - viewCbConstants[89u].w) * 2.0f, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp((viewCbConstants[89u].w + scalarValue56) * 2.0f, 0.0f, 1.0f)))];
                                        bool conditionValue6 = scalarValue56 > 0.5f;
                                        float comparisonValue25 = conditionValue6 ? scalarValue54 : scalarValue55;
                                        float comparisonValue26 = conditionValue6 ? scalarValue53 : scalarValue52;
                                        intermediateValue1[0u] = comparisonValue25;
                                        intermediateValue1[1u] = comparisonValue26;
                                        precise float sumValue313 = (-0.0f) - viewCbConstants[89u].w;
                                        precise float comparisonValue27 = ((comparisonValue25 > comparisonValue26) ? viewCbConstants[89u].w : sumValue313) * 0.0f;
                                        precise float sumValue314 = scalarValue57 + comparisonValue27;
                                        precise float sumValue315 = sumValue314 - viewCbConstants[89u].w;
                                        precise float sumValue316 = viewCbConstants[89u].w + sumValue314;
                                        precise float productValue352 = sumValue315 * 2.0f;
                                        precise float productValue353 = sumValue316 * 2.0f;
                                        precise float clampedValue4 = intermediateValue1[uint(int(clamp(productValue352, 0.0f, 1.0f)))] - intermediateValue1[uint(int(clamp(productValue353, 0.0f, 1.0f)))];
                                        float inverseLengthValue7 = rsqrt(dot(float3(clampedValue3, clampedValue4, viewCbConstants[90u].x), float3(clampedValue3, clampedValue4, viewCbConstants[90u].x)));
                                        precise float productValue354 = clampedValue3 * inverseLengthValue7;
                                        precise float productValue355 = clampedValue4 * inverseLengthValue7;
                                        precise float productValue356 = clampedValue2 * productValue354;
                                        precise float productValue357 = clampedValue2 * productValue355;
                                        branchMergedValue239 = productValue357;
                                        branchMergedValue243 = productValue356;
                                    }
                                    else
                                    {
                                        branchMergedValue239 = 0.0f;
                                        branchMergedValue243 = 0.0f;
                                    }
                                    branchMergedValue186 = branchMergedValue239;
                                    branchMergedValue218 = branchMergedValue243;
                                }
                                branchMergedValue39 = branchMergedValue186;
                                branchMergedValue121 = branchMergedValue218;
                            }
                            else
                            {
                                precise float productValue358 = scalarValue49 * (-1.0f);
                                precise float sumValue317 = productValue358 + 2.0f;
                                float clampedValue5 = clamp(sumValue317, 0.0f, 1.0f);
                                float branchMergedValue187;
                                float branchMergedValue219;
                                if (clampedValue5 > 0.0f)
                                {
                                    uint reinterpretedBits43;
                                    if (productValue289)
                                    {
                                        reinterpretedBits43 = asuint(viewCbConstants[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits43 = productValue288;
                                    }
                                    uint unusedTextureMipCount5642;
                                    uint2 sumValue318 = rdTextureSize(textures[NonUniformResourceIndex(reinterpretedBits43 + 0u)], 0u, unusedTextureMipCount5642);
                                    precise float productValue359 = sumValue303 * float(int(uint(int(float(int(sumValue318.x))))));
                                    precise float productValue360 = sumValue304 * float(int(uint(int(float(int(sumValue318.y))))));
                                    float4 sampledTextureValue8 = textures[NonUniformResourceIndex(sumValue239)].SampleLevel(defaultSampler, float2(sumValue303, sumValue304), 0.0f);
                                    float scalarValue58 = frac(productValue359);
                                    float scalarValue59 = frac(productValue360);
                                    precise float sumValue319 = 1.0f - viewCbConstants[89u].w;
                                    precise float productValue361 = sampledTextureValue8.y * 2.0f;
                                    precise float sumValue320 = productValue361 + (-1.0f);
                                    precise float comparisonValue28 = sumValue320 * ((scalarValue58 < sumValue319) ? 0.0f : 1.0f);
                                    precise float productValue362 = sampledTextureValue8.w * 2.0f;
                                    precise float sumValue321 = productValue362 + (-1.0f);
                                    precise float comparisonValue29 = sumValue321 * ((viewCbConstants[89u].w < scalarValue58) ? 0.0f : 1.0f);
                                    precise float productValue363 = sampledTextureValue8.z * 2.0f;
                                    precise float sumValue322 = productValue363 + (-1.0f);
                                    precise float comparisonValue30 = sumValue322 * ((scalarValue59 < sumValue319) ? 0.0f : 1.0f);
                                    precise float productValue364 = sampledTextureValue8.x * 2.0f;
                                    precise float sumValue323 = productValue364 + (-1.0f);
                                    precise float comparisonValue31 = sumValue323 * ((viewCbConstants[89u].w < scalarValue59) ? 0.0f : 1.0f);
                                    precise float sumValue324 = comparisonValue28 - comparisonValue29;
                                    precise float sumValue325 = comparisonValue30 - comparisonValue31;
                                    precise float comparisonValue32 = ((abs(sumValue324) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * sumValue324;
                                    precise float comparisonValue33 = ((abs(sumValue325) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * sumValue325;
                                    float inverseLengthValue8 = rsqrt(dot(float3(comparisonValue32, comparisonValue33, viewCbConstants[90u].x), float3(comparisonValue32, comparisonValue33, viewCbConstants[90u].x)));
                                    precise float productValue365 = inverseLengthValue8 * comparisonValue32;
                                    precise float productValue366 = inverseLengthValue8 * comparisonValue33;
                                    precise float productValue367 = clampedValue5 * productValue365;
                                    precise float productValue368 = clampedValue5 * productValue366;
                                    branchMergedValue187 = productValue368;
                                    branchMergedValue219 = productValue367;
                                }
                                else
                                {
                                    branchMergedValue187 = 0.0f;
                                    branchMergedValue219 = 0.0f;
                                }
                                branchMergedValue39 = branchMergedValue187;
                                branchMergedValue121 = branchMergedValue219;
                            }
                            intermediateValue487 = branchMergedValue121;
                            intermediateValue488 = branchMergedValue39;
                        }
                        else
                        {
                            float4 sampledTextureValue9 = textures[NonUniformResourceIndex(sumValue239)].SampleLevel(defaultSampler, float2(sumValue303, sumValue304), scalarValue49);
                            precise float productValue369 = sampledTextureValue9.x * 2.0f;
                            precise float productValue370 = sampledTextureValue9.y * 2.0f;
                            precise float sumValue326 = productValue369 + (-1.0f);
                            precise float sumValue327 = productValue370 + (-1.0f);
                            intermediateValue487 = sumValue326;
                            intermediateValue488 = sumValue327;
                        }
                        precise float sumValue328 = intermediateValue207 + (-0.039999999105930328369140625f);
                        precise float sumValue329 = intermediateValue209 + (-0.039999999105930328369140625f);
                        precise float sumValue330 = intermediateValue211 + (-0.039999999105930328369140625f);
                        precise float productValue371 = sumValue328 * reinterpretedBits24;
                        precise float productValue372 = sumValue329 * reinterpretedBits24;
                        precise float productValue373 = sumValue330 * reinterpretedBits24;
                        precise float sumValue331 = productValue371 + 0.039999999105930328369140625f;
                        precise float sumValue332 = productValue372 + 0.039999999105930328369140625f;
                        precise float sumValue333 = productValue373 + 0.039999999105930328369140625f;
                        float sumValue334 = 1.0f - reinterpretedBits24;
                        float productValue374 = sumValue334 * intermediateValue207;
                        float productValue375 = sumValue334 * intermediateValue209;
                        float productValue376 = sumValue334 * intermediateValue211;
                        float dotProductValue5 = dot(float3(intermediateValue207, intermediateValue209, intermediateValue211), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                        float productValue377 = (reinterpretedBits38 * 5.0f) * viewCbConstants[84u].w;
                        bool comparisonValue34 = (intermediateValue89 & 3221225472u) == 2147483648u;
                        precise float productValue378 = intermediateValue487 * 0.25f;
                        precise float productValue379 = intermediateValue488 * 0.25f;
                        float comparisonValue35 = comparisonValue34 ? productValue378 : intermediateValue487;
                        float comparisonValue36 = comparisonValue34 ? productValue379 : intermediateValue488;
                        precise float sumValue335 = (-0.0f) - comparisonValue35;
                        precise float sumValue336 = (-0.0f) - comparisonValue36;
                        float comparisonValue37 = dotProductValue2 ? sumValue335 : comparisonValue35;
                        float comparisonValue38 = dotProductValue2 ? sumValue336 : comparisonValue36;
                        precise float productValue380 = comparisonValue37 * comparisonValue37;
                        precise float sumValue337 = 1.0f - productValue380;
                        precise float productValue381 = comparisonValue38 * comparisonValue38;
                        precise float sumValue338 = sumValue337 - productValue381;
                        precise float productValue382 = productValue271 * comparisonValue37;
                        precise float productValue383 = productValue272 * comparisonValue37;
                        precise float productValue384 = productValue273 * comparisonValue37;
                        precise float productValue385 = productValue283 * comparisonValue38;
                        precise float productValue386 = productValue284 * comparisonValue38;
                        precise float productValue387 = productValue285 * comparisonValue38;
                        precise float sumValue339 = productValue382 + productValue385;
                        precise float sumValue340 = productValue383 + productValue386;
                        precise float sumValue341 = productValue384 + productValue387;
                        float nonlinearValue7 = max(sqrt(sumValue338), 0.00999999977648258209228515625f);
                        precise float productValue388 = comparisonValue15 * nonlinearValue7;
                        precise float productValue389 = comparisonValue16 * nonlinearValue7;
                        precise float productValue390 = comparisonValue17 * nonlinearValue7;
                        precise float sumValue342 = sumValue339 + productValue388;
                        precise float sumValue343 = sumValue340 + productValue389;
                        precise float sumValue344 = sumValue341 + productValue390;
                        precise float dotProductValue6 = dot(float3(intermediateValue77, intermediateValue79, intermediateValue81), float3(sumValue342, sumValue343, sumValue344)) * 2.0f;
                        precise float productValue391 = dotProductValue6 * sumValue342;
                        precise float productValue392 = dotProductValue6 * sumValue343;
                        precise float productValue393 = dotProductValue6 * sumValue344;
                        precise float sumValue345 = intermediateValue77 - productValue391;
                        precise float sumValue346 = intermediateValue79 - productValue392;
                        precise float sumValue347 = intermediateValue81 - productValue393;
                        precise float dotProductValue7 = dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(sumValue345, sumValue346, sumValue347));
                        float intermediateValue203;
                        float intermediateValue204;
                        float intermediateValue205;
                        if (dotProductValue7 < 0.0f)
                        {
                            float dotProductValue8 = max(0.001000000047497451305389404296875f, dot(float3(sumValue342, sumValue343, sumValue344), float3(comparisonValue15, comparisonValue16, comparisonValue17)));
                            precise float productValue394 = sumValue342 * dotProductValue7;
                            precise float productValue395 = sumValue343 * dotProductValue7;
                            precise float productValue396 = sumValue344 * dotProductValue7;
                            precise float quotientValue18 = productValue394 / dotProductValue8;
                            precise float quotientValue19 = productValue395 / dotProductValue8;
                            precise float quotientValue20 = productValue396 / dotProductValue8;
                            precise float sumValue348 = sumValue345 - quotientValue18;
                            precise float sumValue349 = sumValue346 - quotientValue19;
                            precise float sumValue350 = sumValue347 - quotientValue20;
                            float inverseLengthValue9 = rsqrt(dot(float3(sumValue348, sumValue349, sumValue350), float3(sumValue348, sumValue349, sumValue350)));
                            precise float productValue397 = sumValue348 * inverseLengthValue9;
                            precise float productValue398 = sumValue349 * inverseLengthValue9;
                            precise float productValue399 = sumValue350 * inverseLengthValue9;
                            precise float sumValue351 = productValue397 - intermediateValue77;
                            precise float sumValue352 = productValue398 - intermediateValue79;
                            precise float sumValue353 = productValue399 - intermediateValue81;
                            float inverseLengthValue10 = rsqrt(dot(float3(sumValue351, sumValue352, sumValue353), float3(sumValue351, sumValue352, sumValue353)));
                            precise float productValue400 = sumValue351 * inverseLengthValue10;
                            precise float productValue401 = sumValue352 * inverseLengthValue10;
                            precise float productValue402 = sumValue353 * inverseLengthValue10;
                            intermediateValue203 = productValue400;
                            intermediateValue204 = productValue401;
                            intermediateValue205 = productValue402;
                        }
                        else
                        {
                            intermediateValue203 = sumValue342;
                            intermediateValue204 = sumValue343;
                            intermediateValue205 = sumValue344;
                        }
                        precise float sumValue354 = 0.0f - reinterpretedBits37;
                        precise float productValue403 = sumValue354 * viewCbConstants[85u].w;
                        precise float sumValue355 = reinterpretedBits37 + productValue403;
                        branchMergedValue28 = intermediateValue211;
                        branchMergedValue56 = intermediateValue209;
                        branchMergedValue57 = intermediateValue207;
                        branchMergedValue58 = productValue376 - (productValue376 * reinterpretedBits38);
                        branchMergedValue59 = productValue374 - (productValue374 * reinterpretedBits38);
                        branchMergedValue60 = sumValue333;
                        branchMergedValue61 = sumValue332;
                        branchMergedValue62 = sumValue331;
                        branchMergedValue63 = productValue377 * (((dotProductValue5 - intermediateValue211) * viewCbConstants[85u].x) + intermediateValue211);
                        branchMergedValue64 = productValue377 * (((dotProductValue5 - intermediateValue209) * viewCbConstants[85u].x) + intermediateValue209);
                        branchMergedValue65 = productValue377 * (((dotProductValue5 - intermediateValue207) * viewCbConstants[85u].x) + intermediateValue207);
                        branchMergedValue66 = intermediateValue205;
                        branchMergedValue67 = intermediateValue204;
                        branchMergedValue68 = intermediateValue203;
                        branchMergedValue69 = sumValue355;
                        branchMergedValue70 = reinterpretedBits24;
                        branchMergedValue71 = intermediateValue202;
                        branchMergedValue72 = productValue375 - (productValue375 * reinterpretedBits38);
                    }
                    else
                    {
                        precise float productValue404 = intermediateValue198 * viewCbConstants[98u].y;
                        precise float productValue405 = intermediateValue199 * viewCbConstants[98u].y;
                        precise float productValue406 = intermediateValue200 * viewCbConstants[98u].y;
                        precise float nonlinearValue8 = log2(productValue404) * 1.39999997615814208984375f;
                        precise float nonlinearValue9 = log2(productValue405) * 1.39999997615814208984375f;
                        precise float nonlinearValue10 = log2(productValue406) * 1.39999997615814208984375f;
                        branchMergedValue28 = exp2(nonlinearValue10);
                        branchMergedValue56 = exp2(nonlinearValue9);
                        branchMergedValue57 = exp2(nonlinearValue8);
                        branchMergedValue58 = intermediateValue75;
                        branchMergedValue59 = intermediateValue71;
                        branchMergedValue60 = intermediateValue69;
                        branchMergedValue61 = intermediateValue67;
                        branchMergedValue62 = intermediateValue65;
                        branchMergedValue63 = intermediateValue63;
                        branchMergedValue64 = intermediateValue61;
                        branchMergedValue65 = intermediateValue59;
                        branchMergedValue66 = intermediateValue57;
                        branchMergedValue67 = intermediateValue55;
                        branchMergedValue68 = intermediateValue53;
                        branchMergedValue69 = intermediateValue51;
                        branchMergedValue70 = intermediateValue49;
                        branchMergedValue71 = intermediateValue47;
                        branchMergedValue72 = intermediateValue73;
                    }
                    intermediateValue48 = branchMergedValue71;
                    intermediateValue50 = branchMergedValue70;
                    intermediateValue52 = branchMergedValue69;
                    intermediateValue54 = branchMergedValue68;
                    intermediateValue56 = branchMergedValue67;
                    intermediateValue58 = branchMergedValue66;
                    intermediateValue60 = branchMergedValue65;
                    intermediateValue62 = branchMergedValue64;
                    intermediateValue64 = branchMergedValue63;
                    intermediateValue66 = branchMergedValue62;
                    intermediateValue68 = branchMergedValue61;
                    intermediateValue70 = branchMergedValue60;
                    intermediateValue72 = branchMergedValue59;
                    intermediateValue74 = branchMergedValue72;
                    intermediateValue76 = branchMergedValue58;
                    intermediateValue206 = branchMergedValue57;
                    intermediateValue208 = branchMergedValue56;
                    intermediateValue210 = branchMergedValue28;
                }
                else
                {
                    precise float productValue407 = intermediateValue198 * viewCbConstants[98u].x;
                    precise float productValue408 = intermediateValue199 * viewCbConstants[98u].x;
                    precise float productValue409 = intermediateValue200 * viewCbConstants[98u].x;
                    precise float nonlinearValue11 = log2(productValue407) * 1.7999999523162841796875f;
                    precise float nonlinearValue12 = log2(productValue408) * 1.7999999523162841796875f;
                    precise float nonlinearValue13 = log2(productValue409) * 1.7999999523162841796875f;
                    intermediateValue48 = intermediateValue47;
                    intermediateValue50 = intermediateValue49;
                    intermediateValue52 = intermediateValue51;
                    intermediateValue54 = intermediateValue53;
                    intermediateValue56 = intermediateValue55;
                    intermediateValue58 = intermediateValue57;
                    intermediateValue60 = intermediateValue59;
                    intermediateValue62 = intermediateValue61;
                    intermediateValue64 = intermediateValue63;
                    intermediateValue66 = intermediateValue65;
                    intermediateValue68 = intermediateValue67;
                    intermediateValue70 = intermediateValue69;
                    intermediateValue72 = intermediateValue71;
                    intermediateValue74 = intermediateValue73;
                    intermediateValue76 = intermediateValue75;
                    intermediateValue206 = exp2(nonlinearValue11);
                    intermediateValue208 = exp2(nonlinearValue12);
                    intermediateValue210 = exp2(nonlinearValue13);
                }
                float comparisonValue39 = (int(intermediateValue89) > int(4294967295u)) ? 1.0f : intermediateValue48;
                float intermediateValue216;
                float intermediateValue217;
                float intermediateValue218;
                float intermediateValue219;
                float intermediateValue221;
                float intermediateValue223;
                float intermediateValue225;
                float intermediateValue226;
                float intermediateValue227;
                float intermediateValue228;
                float intermediateValue229;
                float intermediateValue230;
                float intermediateValue231;
                float intermediateValue232;
                float intermediateValue233;
                if (conditionValue4)
                {
                    precise float sumValue356 = sumValue209 - viewCbConstants[68u].x;
                    precise float sumValue357 = sumValue215 - viewCbConstants[68u].z;
                    precise float dotProductValue9 = sumValue237 / max(0.001000000047497451305389404296875f, abs(dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(intermediateValue77, intermediateValue79, intermediateValue81))));
                    precise float sumValue358 = dotProductValue9 + (-0.00999999977648258209228515625f);
                    precise float quotientValue21 = sumValue358 / 0.0199999995529651641845703125f;
                    float clampedValue6 = clamp(quotientValue21, 0.0f, 1.0f);
                    precise float productValue410 = clampedValue6 * 2.0f;
                    precise float sumValue359 = 3.0f - productValue410;
                    precise float productValue411 = clampedValue6 * sumValue359;
                    precise float productValue412 = clampedValue6 * productValue411;
                    precise float sumValue360 = 1.0f - productValue412;
                    float intermediateValue220;
                    float intermediateValue222;
                    float intermediateValue224;
                    if (sumValue360 == 0.0f)
                    {
                        intermediateValue220 = comparisonValue15;
                        intermediateValue222 = comparisonValue16;
                        intermediateValue224 = comparisonValue17;
                    }
                    else
                    {
                        precise float sumValue361 = sumValue212 - viewCbConstants[68u].y;
                        bool comparisonValue40 = abs(float(comparisonValue16 < 0.9900000095367431640625f)) != 0.0f;
                        precise float productValue413 = comparisonValue16 * 0.0f;
                        precise float sumValue362 = comparisonValue17 - productValue413;
                        precise float productValue414 = comparisonValue15 * 0.0f;
                        precise float productValue415 = comparisonValue17 * 0.0f;
                        precise float sumValue363 = productValue414 - productValue415;
                        precise float sumValue364 = productValue413 - comparisonValue15;
                        float inverseLengthValue11 = rsqrt(dot(float3(sumValue362, sumValue363, sumValue364), float3(sumValue362, sumValue363, sumValue364)));
                        precise float productValue416 = sumValue362 * inverseLengthValue11;
                        precise float productValue417 = sumValue363 * inverseLengthValue11;
                        precise float productValue418 = sumValue364 * inverseLengthValue11;
                        float comparisonValue41 = comparisonValue40 ? productValue416 : 1.0f;
                        float comparisonValue43 = comparisonValue40 ? productValue417 : 0.0f;
                        float comparisonValue44 = comparisonValue40 ? productValue418 : 0.0f;
                        precise float productValue419 = comparisonValue16 * comparisonValue44;
                        precise float productValue420 = comparisonValue17 * comparisonValue43;
                        precise float sumValue365 = productValue419 - productValue420;
                        precise float productValue421 = comparisonValue17 * comparisonValue41;
                        precise float productValue422 = comparisonValue15 * comparisonValue44;
                        precise float sumValue366 = productValue421 - productValue422;
                        precise float productValue423 = comparisonValue15 * comparisonValue43;
                        precise float productValue424 = comparisonValue16 * comparisonValue41;
                        precise float sumValue367 = productValue423 - productValue424;
                        precise float productValue425 = sumValue361 * 0.100000001490116119384765625f;
                        precise float dotProductValue10 = dot(float3(sumValue356, productValue425, sumValue357), float3(comparisonValue41, comparisonValue43, comparisonValue44));
                        precise float dotProductValue11 = dot(float3(sumValue356, productValue425, sumValue357), float3(sumValue365, sumValue366, sumValue367));
                        precise float productValue426 = dotProductValue10 * 0.60000002384185791015625f;
                        precise float productValue427 = dotProductValue11 * 0.60000002384185791015625f;
                        precise float productValue428 = viewCbConstants[97u].z * 0.00999999977648258209228515625f;
                        precise float productValue429 = viewCbConstants[97u].z * 0.0199999995529651641845703125f;
                        precise float productValue430 = productValue428 * 2.5f;
                        precise float productValue431 = productValue429 * 2.5f;
                        precise float sumValue368 = productValue426 + productValue430;
                        precise float sumValue369 = productValue427 + productValue431;
                        float4 sampledTextureValue10 = waterNormalsTexture.SampleLevel(linearWrapSampler, float2(sumValue368, sumValue369), 0.0f);
                        precise float productValue432 = sampledTextureValue10.x * 2.0f;
                        precise float productValue433 = sampledTextureValue10.y * 2.0f;
                        precise float sumValue370 = productValue432 + (-1.0f);
                        precise float sumValue371 = productValue433 + (-1.0f);
                        precise float productValue437 = sumValue370 * 0.300000011920928955078125f;
                        precise float productValue438 = sumValue371 * 0.300000011920928955078125f;
                        precise float productValue439 = dotProductValue10 * 0.300000011920928955078125f;
                        precise float productValue440 = dotProductValue11 * 0.300000011920928955078125f;
                        precise float productValue441 = viewCbConstants[97u].z * 0.0130000002682209014892578125f;
                        precise float productValue442 = viewCbConstants[97u].z * 0.01400000043213367462158203125f;
                        precise float productValue443 = productValue441 * 2.5f;
                        precise float productValue444 = productValue442 * 2.5f;
                        precise float sumValue372 = productValue439 + productValue443;
                        precise float sumValue373 = productValue440 + productValue444;
                        float4 sampledTextureValue11 = waterNormalsTexture.SampleLevel(linearWrapSampler, float2(sumValue372, sumValue373), 0.0f);
                        precise float productValue445 = sampledTextureValue11.x * 2.0f;
                        precise float productValue446 = sampledTextureValue11.y * 2.0f;
                        precise float sumValue374 = productValue445 + (-1.0f);
                        precise float sumValue375 = productValue446 + (-1.0f);
                        precise float productValue447 = sumValue374 * 0.5f;
                        precise float productValue448 = sumValue375 * 0.5f;
                        precise float productValue449 = dotProductValue10 * 0.61000001430511474609375f;
                        precise float productValue450 = dotProductValue11 * 0.61000001430511474609375f;
                        precise float productValue451 = viewCbConstants[97u].z * (-0.00999999977648258209228515625f);
                        precise float productValue452 = viewCbConstants[97u].z * (-0.0199999995529651641845703125f);
                        precise float productValue453 = productValue451 * 2.5f;
                        precise float productValue454 = productValue452 * 2.5f;
                        precise float sumValue376 = productValue449 + productValue453;
                        precise float sumValue377 = productValue450 + productValue454;
                        float4 sampledTextureValue12 = waterNormalsTexture.SampleLevel(linearWrapSampler, float2(sumValue376, sumValue377), 0.0f);
                        precise float productValue455 = sampledTextureValue12.x * 2.0f;
                        precise float productValue456 = sampledTextureValue12.y * 2.0f;
                        precise float sumValue378 = productValue455 + (-1.0f);
                        precise float sumValue379 = productValue456 + (-1.0f);
                        precise float productValue457 = sumValue378 * 0.300000011920928955078125f;
                        precise float productValue458 = sumValue379 * 0.300000011920928955078125f;
                        precise float sumValue380 = productValue437 + productValue447;
                        precise float sumValue381 = productValue438 + productValue448;
                        precise float sumValue382 = sampledTextureValue10.z + sampledTextureValue11.z;
                        precise float sumValue383 = sumValue380 + productValue457;
                        precise float sumValue384 = sumValue381 + productValue458;
                        precise float sumValue385 = sumValue382 + sampledTextureValue12.z;
                        precise float productValue459 = sumValue360 * sumValue383;
                        precise float productValue460 = sumValue360 * sumValue384;
                        float inverseLengthValue12 = rsqrt(dot(float3(productValue459, productValue460, sumValue385), float3(productValue459, productValue460, sumValue385)));
                        precise float productValue461 = inverseLengthValue12 * productValue459;
                        precise float productValue462 = inverseLengthValue12 * productValue460;
                        precise float productValue463 = sumValue385 * inverseLengthValue12;
                        precise float productValue464 = comparisonValue41 * productValue461;
                        precise float productValue465 = comparisonValue43 * productValue461;
                        precise float productValue466 = comparisonValue44 * productValue461;
                        precise float productValue467 = sumValue365 * productValue462;
                        precise float productValue468 = sumValue366 * productValue462;
                        precise float productValue469 = sumValue367 * productValue462;
                        precise float sumValue386 = productValue464 + productValue467;
                        precise float sumValue387 = productValue465 + productValue468;
                        precise float sumValue388 = productValue466 + productValue469;
                        precise float productValue470 = comparisonValue15 * productValue463;
                        precise float productValue471 = comparisonValue16 * productValue463;
                        precise float productValue472 = comparisonValue17 * productValue463;
                        precise float sumValue389 = productValue470 + sumValue386;
                        precise float sumValue390 = productValue471 + sumValue387;
                        precise float sumValue391 = productValue472 + sumValue388;
                        intermediateValue220 = sumValue389;
                        intermediateValue222 = sumValue390;
                        intermediateValue224 = sumValue391;
                    }
                    precise float productValue473 = comparisonValue39 * 0.5f;
                    float branchMergedValue29;
                    float branchMergedValue73;
                    float branchMergedValue74;
                    float branchMergedValue75;
                    float branchMergedValue76;
                    float branchMergedValue77;
                    float branchMergedValue78;
                    float branchMergedValue79;
                    float branchMergedValue80;
                    float branchMergedValue81;
                    float branchMergedValue148;
                    float branchMergedValue149;
                    float branchMergedValue150;
                    float branchMergedValue151;
                    float branchMergedValue152;
                    if ((asuint(viewCbConstants[54u]).w != 0u) && (asuint(viewCbConstants[91u]).y == 2u))
                    {
                        precise float sumValue392 = (-0.0f) - intermediateValue220;
                        precise float sumValue393 = (-0.0f) - intermediateValue222;
                        precise float sumValue394 = (-0.0f) - intermediateValue224;
                        float branchMergedValue180;
                        float branchMergedValue190;
                        float branchMergedValue191;
                        float branchMergedValue192;
                        float branchMergedValue193;
                        float branchMergedValue194;
                        float branchMergedValue195;
                        float branchMergedValue196;
                        float branchMergedValue197;
                        float branchMergedValue198;
                        float branchMergedValue229;
                        float branchMergedValue230;
                        float branchMergedValue231;
                        float branchMergedValue232;
                        float branchMergedValue233;
                        if (dot(float3(intermediateValue77, intermediateValue79, intermediateValue81), float3(sumValue392, sumValue393, sumValue394)) < 0.65939998626708984375f)
                        {
                            branchMergedValue180 = 1.0f;
                            branchMergedValue190 = 1.0f;
                            branchMergedValue191 = 1.0f;
                            branchMergedValue192 = 0.0f;
                            branchMergedValue193 = 0.0f;
                            branchMergedValue194 = 0.0f;
                            branchMergedValue195 = 1.0f;
                            branchMergedValue196 = 1.0f;
                            branchMergedValue197 = intermediateValue224;
                            branchMergedValue198 = intermediateValue222;
                            branchMergedValue229 = intermediateValue220;
                            branchMergedValue230 = 0.0f;
                            branchMergedValue231 = 1.0f;
                            branchMergedValue232 = 1.0f;
                            branchMergedValue233 = 1.0f;
                        }
                        else
                        {
                            branchMergedValue180 = intermediateValue210;
                            branchMergedValue190 = intermediateValue208;
                            branchMergedValue191 = intermediateValue206;
                            branchMergedValue192 = intermediateValue76;
                            branchMergedValue193 = intermediateValue74;
                            branchMergedValue194 = intermediateValue72;
                            branchMergedValue195 = intermediateValue70;
                            branchMergedValue196 = intermediateValue68;
                            branchMergedValue197 = intermediateValue224;
                            branchMergedValue198 = intermediateValue222;
                            branchMergedValue229 = intermediateValue220;
                            branchMergedValue230 = productValue473;
                            branchMergedValue231 = intermediateValue50;
                            branchMergedValue232 = comparisonValue39;
                            branchMergedValue233 = intermediateValue66;
                        }
                        branchMergedValue29 = branchMergedValue180;
                        branchMergedValue73 = branchMergedValue190;
                        branchMergedValue74 = branchMergedValue191;
                        branchMergedValue75 = branchMergedValue192;
                        branchMergedValue76 = branchMergedValue193;
                        branchMergedValue77 = branchMergedValue194;
                        branchMergedValue78 = branchMergedValue195;
                        branchMergedValue79 = branchMergedValue196;
                        branchMergedValue80 = branchMergedValue197;
                        branchMergedValue81 = branchMergedValue198;
                        branchMergedValue148 = branchMergedValue229;
                        branchMergedValue149 = branchMergedValue230;
                        branchMergedValue150 = branchMergedValue231;
                        branchMergedValue151 = branchMergedValue232;
                        branchMergedValue152 = branchMergedValue233;
                    }
                    else
                    {
                        branchMergedValue29 = intermediateValue210;
                        branchMergedValue73 = intermediateValue208;
                        branchMergedValue74 = intermediateValue206;
                        branchMergedValue75 = intermediateValue76;
                        branchMergedValue76 = intermediateValue74;
                        branchMergedValue77 = intermediateValue72;
                        branchMergedValue78 = intermediateValue70;
                        branchMergedValue79 = intermediateValue68;
                        branchMergedValue80 = intermediateValue224;
                        branchMergedValue81 = intermediateValue222;
                        branchMergedValue148 = intermediateValue220;
                        branchMergedValue149 = productValue473;
                        branchMergedValue150 = intermediateValue50;
                        branchMergedValue151 = comparisonValue39;
                        branchMergedValue152 = intermediateValue66;
                    }
                    intermediateValue216 = branchMergedValue151;
                    intermediateValue217 = branchMergedValue150;
                    intermediateValue218 = branchMergedValue149;
                    intermediateValue219 = branchMergedValue148;
                    intermediateValue221 = branchMergedValue81;
                    intermediateValue223 = branchMergedValue80;
                    intermediateValue225 = branchMergedValue152;
                    intermediateValue226 = branchMergedValue79;
                    intermediateValue227 = branchMergedValue78;
                    intermediateValue228 = branchMergedValue77;
                    intermediateValue229 = branchMergedValue76;
                    intermediateValue230 = branchMergedValue75;
                    intermediateValue231 = branchMergedValue74;
                    intermediateValue232 = branchMergedValue73;
                    intermediateValue233 = branchMergedValue29;
                }
                else
                {
                    intermediateValue216 = comparisonValue39;
                    intermediateValue217 = intermediateValue50;
                    intermediateValue218 = intermediateValue52;
                    intermediateValue219 = intermediateValue54;
                    intermediateValue221 = intermediateValue56;
                    intermediateValue223 = intermediateValue58;
                    intermediateValue225 = intermediateValue66;
                    intermediateValue226 = intermediateValue68;
                    intermediateValue227 = intermediateValue70;
                    intermediateValue228 = intermediateValue72;
                    intermediateValue229 = intermediateValue74;
                    intermediateValue230 = intermediateValue76;
                    intermediateValue231 = intermediateValue206;
                    intermediateValue232 = intermediateValue208;
                    intermediateValue233 = intermediateValue210;
                }
                precise float sumValue395 = 0.0f - intermediateValue231;
                precise float sumValue396 = 0.0f - intermediateValue232;
                precise float sumValue397 = 0.0f - intermediateValue233;
                precise float productValue474 = intermediateValue216 * sumValue395;
                precise float productValue475 = intermediateValue216 * sumValue396;
                precise float productValue476 = intermediateValue216 * sumValue397;
                precise float sumValue398 = intermediateValue231 + productValue474;
                precise float sumValue399 = intermediateValue232 + productValue475;
                precise float sumValue400 = intermediateValue233 + productValue476;
                float intermediateValue237;
                float intermediateValue238;
                float intermediateValue239;
                if (intermediateValue105 == 0u)
                {
                    intermediateValue237 = intermediateValue99;
                    intermediateValue238 = intermediateValue101;
                    intermediateValue239 = intermediateValue103;
                }
                else
                {
                    precise float sumValue401 = (-0.0f) - intermediateValue87;
                    precise float productValue477 = viewCbConstants[63u].x * sumValue401;
                    precise float productValue478 = viewCbConstants[63u].y * sumValue401;
                    precise float productValue479 = viewCbConstants[63u].z * sumValue401;
                    precise float productValue480 = productValue477 * 1.44269502162933349609375f;
                    precise float productValue481 = productValue478 * 1.44269502162933349609375f;
                    precise float productValue482 = productValue479 * 1.44269502162933349609375f;
                    precise float exponentialValue1 = intermediateValue99 * exp2(productValue480);
                    precise float exponentialValue2 = intermediateValue101 * exp2(productValue481);
                    precise float exponentialValue3 = intermediateValue103 * exp2(productValue482);
                    intermediateValue237 = exponentialValue1;
                    intermediateValue238 = exponentialValue2;
                    intermediateValue239 = exponentialValue3;
                }
                float productValue483 = (intermediateValue237 * intermediateValue60) + intermediateValue93;
                float productValue484 = (intermediateValue238 * intermediateValue62) + intermediateValue95;
                float productValue485 = (intermediateValue239 * intermediateValue64) + intermediateValue97;
                precise float sumValue402 = (-0.0f) - intermediateValue77;
                precise float sumValue403 = (-0.0f) - intermediateValue79;
                precise float sumValue404 = (-0.0f) - intermediateValue81;
                precise float productValue486 = comparisonValue15 * 256.0f;
                uint scalarValue60 = uint(int(productValue486));
                precise float productValue487 = comparisonValue16 * 256.0f;
                uint scalarValue61 = uint(int(productValue487));
                precise float productValue488 = comparisonValue17 * 256.0f;
                uint scalarValue62 = uint(int(productValue488));
                uint reinterpretedBits22 = asuint(sumValue209);
                bool conditionValue7 = sumValue209 < 0.0f;
                uint reinterpretedBits26 = asuint(sumValue212);
                bool conditionValue8 = sumValue212 < 0.0f;
                uint reinterpretedBits27 = asuint(sumValue215);
                bool conditionValue9 = sumValue215 < 0.0f;
                bool conditionValue10 = abs(sumValue209) < 0.03125f;
                precise float productValue489 = comparisonValue15 * 1.52587890625e-05f;
                precise float sumValue405 = sumValue209 + productValue489;
                float reinterpretedBits28 = conditionValue10 ? sumValue405 : asfloat((conditionValue7 ? (-scalarValue60) : scalarValue60) + reinterpretedBits22);
                bool conditionValue11 = abs(sumValue212) < 0.03125f;
                precise float productValue490 = comparisonValue16 * 1.52587890625e-05f;
                precise float sumValue406 = sumValue212 + productValue490;
                float reinterpretedBits29 = conditionValue11 ? sumValue406 : asfloat((conditionValue8 ? (-scalarValue61) : scalarValue61) + reinterpretedBits26);
                bool conditionValue12 = abs(sumValue215) < 0.03125f;
                precise float productValue491 = comparisonValue17 * 1.52587890625e-05f;
                precise float sumValue407 = sumValue215 + productValue491;
                float reinterpretedBits30 = conditionValue12 ? sumValue407 : asfloat((conditionValue9 ? (-scalarValue62) : scalarValue62) + reinterpretedBits27);
                bool dotProductValue12 = dot(float3(0.847100675106048583984375f, 0.2079117000102996826171875f, 0.489073812961578369140625f), float3(viewCbConstants[52u].xyz)) > 0.949999988079071044921875f;
                float comparisonValue45 = dotProductValue12 ? (-0.639436304569244384765625f) : 0.847100675106048583984375f;
                float comparisonValue46 = dotProductValue12 ? (-0.3907311260700225830078125f) : 0.2079117000102996826171875f;
                float comparisonValue47 = dotProductValue12 ? 0.6621558666229248046875f : 0.489073812961578369140625f;
                precise float dotProductValue13 = dot(float3(comparisonValue45, comparisonValue46, comparisonValue47), float3(viewCbConstants[52u].xyz));
                precise float productValue492 = viewCbConstants[52u].x * dotProductValue13;
                precise float productValue493 = viewCbConstants[52u].y * dotProductValue13;
                precise float productValue494 = viewCbConstants[52u].z * dotProductValue13;
                precise float sumValue408 = comparisonValue45 - productValue492;
                precise float sumValue409 = comparisonValue46 - productValue493;
                precise float sumValue410 = comparisonValue47 - productValue494;
                float inverseLengthValue13 = rsqrt(dot(float3(sumValue408, sumValue409, sumValue410), float3(sumValue408, sumValue409, sumValue410)));
                precise float productValue495 = sumValue408 * inverseLengthValue13;
                precise float productValue496 = sumValue409 * inverseLengthValue13;
                precise float productValue497 = sumValue410 * inverseLengthValue13;
                precise float productValue498 = viewCbConstants[52u].y * productValue497;
                precise float productValue499 = viewCbConstants[52u].z * productValue496;
                precise float sumValue411 = productValue498 - productValue499;
                precise float productValue500 = viewCbConstants[52u].z * productValue495;
                precise float productValue501 = viewCbConstants[52u].x * productValue497;
                precise float sumValue412 = productValue500 - productValue501;
                precise float productValue502 = viewCbConstants[52u].x * productValue496;
                precise float productValue503 = viewCbConstants[52u].y * productValue495;
                precise float sumValue413 = productValue502 - productValue503;
                uint4 reinterpretedBits31 = asuint(viewCbConstants[84u]);
                uint scalarValue63 = reinterpretedBits31.z;
                float4 loadedBufferValue = blueNoiseTexture.Load(int4(uint3(bitwiseValue2 & 255u, bitwiseValue3 & 255u, (scalarValue63 >> 1u) & 127u), 0u));
                bool comparisonValue48 = (scalarValue63 & 1u) == 0u;
                float nonlinearValue14 = sqrt(comparisonValue48 ? loadedBufferValue.x : loadedBufferValue.z);
                precise float comparisonValue49 = (comparisonValue48 ? loadedBufferValue.y : loadedBufferValue.w) * 6.283185482025146484375f;
                precise float wavePhaseValue9 = nonlinearValue14 * cos(comparisonValue49);
                precise float wavePhaseValue10 = nonlinearValue14 * sin(comparisonValue49);
                precise float productValue504 = wavePhaseValue9 * 0.01860214583575725555419921875f;
                precise float productValue505 = wavePhaseValue10 * 0.01860214583575725555419921875f;
                precise float productValue506 = productValue495 * productValue504;
                precise float productValue507 = productValue496 * productValue504;
                precise float productValue508 = productValue497 * productValue504;
                precise float productValue509 = sumValue411 * productValue505;
                precise float productValue510 = sumValue412 * productValue505;
                precise float productValue511 = sumValue413 * productValue505;
                precise float sumValue414 = productValue506 + productValue509;
                precise float sumValue415 = productValue507 + productValue510;
                precise float sumValue416 = productValue508 + productValue511;
                precise float sumValue417 = viewCbConstants[52u].x + sumValue414;
                precise float sumValue418 = viewCbConstants[52u].y + sumValue415;
                precise float sumValue419 = viewCbConstants[52u].z + sumValue416;
                float intermediateValue250;
                float intermediateValue251;
                float intermediateValue252;
                if (dot(float3(sumValue417, sumValue418, sumValue419), float3(comparisonValue15, comparisonValue16, comparisonValue17)) < 0.0f)
                {
                    intermediateValue250 = 0.0f;
                    intermediateValue251 = 0.0f;
                    intermediateValue252 = 0.0f;
                }
                else
                {
                    float inverseLengthValue14 = rsqrt(dot(float3(sumValue417, sumValue418, sumValue419), float3(sumValue417, sumValue418, sumValue419)));
                    float productValue512 = inverseLengthValue14 * sumValue417;
                    float productValue513 = inverseLengthValue14 * sumValue418;
                    float productValue514 = inverseLengthValue14 * sumValue419;
                    RayDesc _11ident = {float3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0f, float3(viewCbConstants[53u].xyz), 10000.0f};
                    intermediateValue253.TraceRayInline(SceneBVH, 512u, 32u, _11ident);
                    bool conditionValue13 = intermediateValue253.Proceed();
                    if (conditionValue13)
                    {
                        bool intermediateValue301;
                        bool comparisonValue42;
                        for (;;)
                        {
                            uint scalarValue64 = intermediateValue253.CandidateType();
                            comparisonValue42 = scalarValue64 == 0u;
                            if (comparisonValue42)
                            {
                                float2 vectorValue8 = intermediateValue253.CandidateTriangleBarycentrics();
                                float2 vectorValue9 = intermediateValue253.CandidateTriangleBarycentrics();
                                uint scalarValue65 = intermediateValue253.CandidatePrimitiveIndex();
                                uint scalarValue66 = intermediateValue253.CandidateInstanceID();
                                uint scalarValue67 = intermediateValue253.CandidateInstanceIndex();
                                uint productValue515 = (scalarValue67 * 76u) + 58u;
                                uint productValue516 = (scalarValue67 * 76u) + 61u;
                                precise float sumValue420 = 1.0f - vectorValue8.x;
                                precise float sumValue421 = sumValue420 - vectorValue9.y;
                                uint bitwiseValue116 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue67 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue65 >> 1u);
                                uint productValue517 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue67 * 76u) + 54u) * 2 + 0)) + 0u;
                                bool comparisonValue50 = (scalarValue65 & 1u) == 0u;
                                uint comparisonValue51 = comparisonValue50 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue517), bitwiseValue116 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue517), bitwiseValue116 * 16 + 0).x;
                                uint comparisonValue52 = comparisonValue50 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue517), bitwiseValue116 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue517), bitwiseValue116 * 16 + 0).w;
                                uint comparisonValue53 = comparisonValue50 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue517), bitwiseValue116 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue517), bitwiseValue116 * 16 + 0).z;
                                bool productValue518 = rdByteLoad_objectInstances_uint16_t(0u, productValue516 * 2 + 0) < 0u;
                                float intermediateValue334;
                                float intermediateValue335;
                                if (productValue518)
                                {
                                    uint bitwiseValue117 = comparisonValue53 >> 15u;
                                    precise float bitwiseValue118 = float(bitwiseValue117 & 1u) * 2.0f;
                                    precise float sumValue422 = bitwiseValue118 + (-1.0f);
                                    precise float bitwiseValue119 = float(comparisonValue53 >> 31u) * 2.0f;
                                    precise float sumValue423 = bitwiseValue119 + (-1.0f);
                                    precise float bitwiseValue120 = float((comparisonValue53 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue121 = float(bitwiseValue117 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue519 = sumValue422 * 3.0517578125e-05f;
                                    precise float productValue520 = sumValue423 * 3.0517578125e-05f;
                                    precise float sumValue424 = bitwiseValue120 + productValue519;
                                    precise float sumValue425 = bitwiseValue121 + productValue520;
                                    intermediateValue334 = sumValue424;
                                    intermediateValue335 = sumValue425;
                                }
                                else
                                {
                                    precise float bitwiseValue122 = float(comparisonValue53 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue123 = float(comparisonValue53 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue521 = bitwiseValue122 * 16384.0f;
                                    precise float sumValue426 = productValue521 + 0.5f;
                                    precise float productValue522 = bitwiseValue123 * 16384.0f;
                                    precise float sumValue427 = productValue522 + 0.5f;
                                    precise float productValue523 = floor(sumValue426) * 6.103515625e-05f;
                                    precise float productValue524 = floor(sumValue427) * 6.103515625e-05f;
                                    intermediateValue334 = productValue523;
                                    intermediateValue335 = productValue524;
                                }
                                precise float productValue525 = sumValue421 * intermediateValue334;
                                precise float productValue526 = sumValue421 * intermediateValue335;
                                precise float sumValue428 = productValue525 + 0.0f;
                                precise float sumValue429 = productValue526 + 0.0f;
                                float intermediateValue399;
                                float intermediateValue400;
                                if (productValue518)
                                {
                                    uint bitwiseValue124 = comparisonValue52 >> 15u;
                                    precise float bitwiseValue125 = float(bitwiseValue124 & 1u) * 2.0f;
                                    precise float sumValue430 = bitwiseValue125 + (-1.0f);
                                    precise float bitwiseValue126 = float(comparisonValue52 >> 31u) * 2.0f;
                                    precise float sumValue431 = bitwiseValue126 + (-1.0f);
                                    precise float bitwiseValue127 = float((comparisonValue52 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue128 = float(bitwiseValue124 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue527 = sumValue430 * 3.0517578125e-05f;
                                    precise float productValue528 = sumValue431 * 3.0517578125e-05f;
                                    precise float sumValue432 = bitwiseValue127 + productValue527;
                                    precise float sumValue433 = bitwiseValue128 + productValue528;
                                    intermediateValue399 = sumValue432;
                                    intermediateValue400 = sumValue433;
                                }
                                else
                                {
                                    precise float bitwiseValue129 = float(comparisonValue52 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue130 = float(comparisonValue52 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue529 = bitwiseValue129 * 16384.0f;
                                    precise float sumValue434 = productValue529 + 0.5f;
                                    precise float productValue530 = bitwiseValue130 * 16384.0f;
                                    precise float sumValue435 = productValue530 + 0.5f;
                                    precise float productValue531 = floor(sumValue434) * 6.103515625e-05f;
                                    precise float productValue532 = floor(sumValue435) * 6.103515625e-05f;
                                    intermediateValue399 = productValue531;
                                    intermediateValue400 = productValue532;
                                }
                                precise float productValue533 = vectorValue8.x * intermediateValue399;
                                precise float productValue534 = vectorValue8.x * intermediateValue400;
                                precise float sumValue436 = sumValue428 + productValue533;
                                precise float sumValue437 = sumValue429 + productValue534;
                                float intermediateValue453;
                                float intermediateValue454;
                                if (productValue518)
                                {
                                    uint bitwiseValue131 = comparisonValue51 >> 15u;
                                    precise float bitwiseValue132 = float(bitwiseValue131 & 1u) * 2.0f;
                                    precise float sumValue438 = bitwiseValue132 + (-1.0f);
                                    precise float bitwiseValue133 = float(comparisonValue51 >> 31u) * 2.0f;
                                    precise float sumValue439 = bitwiseValue133 + (-1.0f);
                                    precise float bitwiseValue134 = float((comparisonValue51 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue135 = float(bitwiseValue131 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue535 = sumValue438 * 3.0517578125e-05f;
                                    precise float productValue536 = sumValue439 * 3.0517578125e-05f;
                                    precise float sumValue440 = bitwiseValue134 + productValue535;
                                    precise float sumValue441 = bitwiseValue135 + productValue536;
                                    intermediateValue453 = sumValue440;
                                    intermediateValue454 = sumValue441;
                                }
                                else
                                {
                                    precise float bitwiseValue136 = float(comparisonValue51 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue137 = float(comparisonValue51 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue537 = bitwiseValue136 * 16384.0f;
                                    precise float sumValue442 = productValue537 + 0.5f;
                                    precise float productValue538 = bitwiseValue137 * 16384.0f;
                                    precise float sumValue443 = productValue538 + 0.5f;
                                    precise float productValue539 = floor(sumValue442) * 6.103515625e-05f;
                                    precise float productValue540 = floor(sumValue443) * 6.103515625e-05f;
                                    intermediateValue453 = productValue539;
                                    intermediateValue454 = productValue540;
                                }
                                precise float productValue541 = vectorValue9.y * intermediateValue453;
                                precise float productValue542 = vectorValue9.y * intermediateValue454;
                                precise float sumValue444 = sumValue436 + productValue541;
                                precise float sumValue445 = sumValue437 + productValue542;
                                float intermediateValue480;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue515 * 2 + 0) == 65535u)
                                {
                                    intermediateValue480 = 1.0f;
                                }
                                else
                                {
                                    uint reinterpretedBits42;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue515 * 2 + 0) > 4095u)
                                    {
                                        reinterpretedBits42 = asuint(viewCbConstants[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits42 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue515 * 2 + 0));
                                    }
                                    intermediateValue480 = textures[NonUniformResourceIndex(reinterpretedBits42 + 0u)].SampleLevel(defaultSampler, float2(sumValue444, sumValue445), -0.25f).w;
                                }
                                uint comparisonValue107;
                                if (scalarValue66 == 2u)
                                {
                                    comparisonValue107 = 0u;
                                }
                                else
                                {
                                    comparisonValue107 = uint(intermediateValue480 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue516 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                }
                                if (comparisonValue107 == 0u)
                                {
                                    intermediateValue253.CommitNonOpaqueTriangleHit();
                                }
                            }
                            intermediateValue301 = intermediateValue253.Proceed();
                            if (intermediateValue301)
                            {
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    uint scalarValue68 = intermediateValue253.CommittedStatus();
                    float intermediateValue285;
                    if (scalarValue68 == 1u)
                    {
                        float scalarValue69 = intermediateValue253.CommittedRayT();
                        intermediateValue285 = scalarValue69;
                    }
                    else
                    {
                        intermediateValue285 = 10000.0f;
                    }
                    float branchMergedValue30;
                    float branchMergedValue82;
                    float branchMergedValue83;
                    if (intermediateValue285 < 10000.0f)
                    {
                        precise float productValue543 = intermediateValue285 * viewCbConstants[63u].x;
                        precise float productValue544 = intermediateValue285 * viewCbConstants[63u].y;
                        precise float productValue545 = intermediateValue285 * viewCbConstants[63u].z;
                        precise float productValue546 = productValue543 * (-1.44269502162933349609375f);
                        precise float productValue547 = productValue544 * (-1.44269502162933349609375f);
                        precise float productValue548 = productValue545 * (-1.44269502162933349609375f);
                        precise float productValue549 = viewCbConstants[53u].x * intermediateValue285;
                        precise float sumValue446 = productValue549 + reinterpretedBits28;
                        precise float productValue550 = viewCbConstants[53u].z * intermediateValue285;
                        precise float sumValue447 = productValue550 + reinterpretedBits30;
                        precise float productValue551 = sumValue446 * viewCbConstants[83u].z;
                        precise float sumValue448 = productValue551 + viewCbConstants[84u].x;
                        precise float productValue552 = sumValue447 * viewCbConstants[83u].w;
                        precise float sumValue449 = productValue552 + viewCbConstants[84u].y;
                        float4 sampledTextureValue13 = wibblyTexture.SampleLevel(linearWrapSampler, float2(sumValue448, sumValue449), 0.0f);
                        precise float sumValue450 = sampledTextureValue13.x + (-0.5f);
                        precise float sumValue451 = sampledTextureValue13.y + (-0.5f);
                        precise float productValue553 = sumValue446 * viewCbConstants[82u].z;
                        precise float sumValue452 = productValue553 + viewCbConstants[83u].x;
                        precise float productValue554 = sumValue447 * viewCbConstants[82u].w;
                        precise float sumValue453 = productValue554 + viewCbConstants[83u].y;
                        precise float productValue555 = sumValue450 * 0.4000000059604644775390625f;
                        precise float productValue556 = sumValue451 * 0.4000000059604644775390625f;
                        precise float sumValue454 = sumValue452 + productValue555;
                        precise float sumValue455 = productValue556 + sumValue453;
                        precise float productValue557 = viewCbConstants[68u].w * 63.0f;
                        uint scalarValue70 = uint(int(floor(productValue557)));
                        precise float productValue558 = float(int(scalarValue70 + 1u)) * 0.015625f;
                        precise float sumValue456 = (-0.0f) - productValue558;
                        float scalarValue71 = frac(abs(productValue558));
                        precise float sumValue457 = (-0.0f) - scalarValue71;
                        precise float comparisonValue56 = ((productValue558 >= sumValue456) ? scalarValue71 : sumValue457) * 64.0f;
                        float4 sampledTextureValue14 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue454, sumValue455, float(int(scalarValue70))), 0.0f);
                        float scalarValue72 = sampledTextureValue14.x;
                        precise float sampledTextureValue15 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue454, sumValue455, float(int(uint(int(comparisonValue56))))), 0.0f).x - scalarValue72;
                        precise float productValue559 = frac(productValue557) * sampledTextureValue15;
                        precise float sumValue458 = scalarValue72 + productValue559;
                        precise float productValue560 = sumValue458 * 7.0f;
                        precise float sumValue460 = productValue560 + 0.800000011920928955078125f;
                        precise float productValue561 = intermediateValue285 * (-0.100000001490116119384765625f);
                        precise float sumValue461 = sumValue460 + (-1.0f);
                        precise float exponentialValue4 = exp2(productValue561) * sumValue461;
                        precise float sumValue462 = exponentialValue4 + 1.0f;
                        precise float exponentialValue5 = exp2(productValue546) * sumValue462;
                        precise float exponentialValue6 = exp2(productValue547) * sumValue462;
                        precise float exponentialValue7 = exp2(productValue548) * sumValue462;
                        RayDesc _12ident = {float3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0f, float3(viewCbConstants[53u].xyz), intermediateValue285};
                        intermediateValue305.TraceRayInline(SceneBVH, 512u, 22u, _12ident);
                        bool conditionValue14 = intermediateValue305.Proceed();
                        float intermediateValue319;
                        float intermediateValue321;
                        float intermediateValue323;
                        if (conditionValue14)
                        {
                            float intermediateValue320;
                            float intermediateValue322;
                            float intermediateValue324;
                            float scalarValue73 = exponentialValue5;
                            float scalarValue74 = exponentialValue6;
                            float scalarValue75 = exponentialValue7;
                            bool comparisonValue54;
                            for (;;)
                            {
                                uint scalarValue76 = intermediateValue305.CandidateType();
                                comparisonValue54 = scalarValue76 == 0u;
                                float branchMergedValue1;
                                float branchMergedValue7;
                                float branchMergedValue8;
                                if (comparisonValue54)
                                {
                                    float2 vectorValue10 = intermediateValue305.CandidateTriangleBarycentrics();
                                    float2 vectorValue11 = intermediateValue305.CandidateTriangleBarycentrics();
                                    float scalarValue77 = intermediateValue305.CandidateTriangleRayT();
                                    uint scalarValue78 = intermediateValue305.CandidatePrimitiveIndex();
                                    uint scalarValue79 = intermediateValue305.CandidateInstanceID();
                                    uint scalarValue80 = intermediateValue305.CandidateInstanceIndex();
                                    uint productValue562 = (scalarValue80 * 76u) + 58u;
                                    uint productValue563 = (scalarValue80 * 76u) + 61u;
                                    precise float sumValue463 = 1.0f - vectorValue10.x;
                                    precise float sumValue464 = sumValue463 - vectorValue11.y;
                                    uint bitwiseValue138 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue80 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue78 >> 1u);
                                    uint productValue564 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue80 * 76u) + 54u) * 2 + 0)) + 0u;
                                    bool comparisonValue57 = (scalarValue78 & 1u) == 0u;
                                    uint comparisonValue58 = comparisonValue57 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue564), bitwiseValue138 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue564), bitwiseValue138 * 16 + 0).x;
                                    uint comparisonValue59 = comparisonValue57 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue564), bitwiseValue138 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue564), bitwiseValue138 * 16 + 0).w;
                                    uint comparisonValue60 = comparisonValue57 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue564), bitwiseValue138 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue564), bitwiseValue138 * 16 + 0).z;
                                    bool productValue565 = rdByteLoad_objectInstances_uint16_t(0u, productValue563 * 2 + 0) < 0u;
                                    float intermediateValue418;
                                    float intermediateValue419;
                                    if (productValue565)
                                    {
                                        uint bitwiseValue139 = comparisonValue60 >> 15u;
                                        precise float bitwiseValue140 = float(bitwiseValue139 & 1u) * 2.0f;
                                        precise float sumValue465 = bitwiseValue140 + (-1.0f);
                                        precise float bitwiseValue141 = float(comparisonValue60 >> 31u) * 2.0f;
                                        precise float sumValue466 = bitwiseValue141 + (-1.0f);
                                        precise float bitwiseValue142 = float((comparisonValue60 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue143 = float(bitwiseValue139 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue566 = sumValue465 * 3.0517578125e-05f;
                                        precise float productValue567 = sumValue466 * 3.0517578125e-05f;
                                        precise float sumValue467 = bitwiseValue142 + productValue566;
                                        precise float sumValue468 = bitwiseValue143 + productValue567;
                                        intermediateValue418 = sumValue467;
                                        intermediateValue419 = sumValue468;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue144 = float(comparisonValue60 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue145 = float(comparisonValue60 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue568 = bitwiseValue144 * 16384.0f;
                                        precise float sumValue469 = productValue568 + 0.5f;
                                        precise float productValue569 = bitwiseValue145 * 16384.0f;
                                        precise float sumValue470 = productValue569 + 0.5f;
                                        precise float productValue570 = floor(sumValue469) * 6.103515625e-05f;
                                        precise float productValue571 = floor(sumValue470) * 6.103515625e-05f;
                                        intermediateValue418 = productValue570;
                                        intermediateValue419 = productValue571;
                                    }
                                    precise float productValue572 = sumValue464 * intermediateValue418;
                                    precise float productValue573 = sumValue464 * intermediateValue419;
                                    precise float sumValue471 = productValue572 + 0.0f;
                                    precise float sumValue472 = productValue573 + 0.0f;
                                    float intermediateValue481;
                                    float intermediateValue482;
                                    if (productValue565)
                                    {
                                        uint bitwiseValue146 = comparisonValue59 >> 15u;
                                        precise float bitwiseValue147 = float(bitwiseValue146 & 1u) * 2.0f;
                                        precise float sumValue473 = bitwiseValue147 + (-1.0f);
                                        precise float bitwiseValue148 = float(comparisonValue59 >> 31u) * 2.0f;
                                        precise float sumValue474 = bitwiseValue148 + (-1.0f);
                                        precise float bitwiseValue149 = float((comparisonValue59 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue150 = float(bitwiseValue146 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue574 = sumValue473 * 3.0517578125e-05f;
                                        precise float productValue575 = sumValue474 * 3.0517578125e-05f;
                                        precise float sumValue475 = bitwiseValue149 + productValue574;
                                        precise float sumValue476 = bitwiseValue150 + productValue575;
                                        intermediateValue481 = sumValue475;
                                        intermediateValue482 = sumValue476;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue151 = float(comparisonValue59 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue152 = float(comparisonValue59 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue576 = bitwiseValue151 * 16384.0f;
                                        precise float sumValue477 = productValue576 + 0.5f;
                                        precise float productValue577 = bitwiseValue152 * 16384.0f;
                                        precise float sumValue478 = productValue577 + 0.5f;
                                        precise float productValue578 = floor(sumValue477) * 6.103515625e-05f;
                                        precise float productValue579 = floor(sumValue478) * 6.103515625e-05f;
                                        intermediateValue481 = productValue578;
                                        intermediateValue482 = productValue579;
                                    }
                                    precise float productValue580 = vectorValue10.x * intermediateValue481;
                                    precise float productValue581 = vectorValue10.x * intermediateValue482;
                                    precise float sumValue479 = sumValue471 + productValue580;
                                    precise float sumValue480 = sumValue472 + productValue581;
                                    float intermediateValue529;
                                    float intermediateValue530;
                                    if (productValue565)
                                    {
                                        uint bitwiseValue153 = comparisonValue58 >> 15u;
                                        precise float bitwiseValue154 = float(bitwiseValue153 & 1u) * 2.0f;
                                        precise float sumValue481 = bitwiseValue154 + (-1.0f);
                                        precise float bitwiseValue155 = float(comparisonValue58 >> 31u) * 2.0f;
                                        precise float sumValue482 = bitwiseValue155 + (-1.0f);
                                        precise float bitwiseValue156 = float((comparisonValue58 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue157 = float(bitwiseValue153 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue582 = sumValue481 * 3.0517578125e-05f;
                                        precise float productValue583 = sumValue482 * 3.0517578125e-05f;
                                        precise float sumValue483 = bitwiseValue156 + productValue582;
                                        precise float sumValue484 = bitwiseValue157 + productValue583;
                                        intermediateValue529 = sumValue483;
                                        intermediateValue530 = sumValue484;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue158 = float(comparisonValue58 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue159 = float(comparisonValue58 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue584 = bitwiseValue158 * 16384.0f;
                                        precise float sumValue485 = productValue584 + 0.5f;
                                        precise float productValue585 = bitwiseValue159 * 16384.0f;
                                        precise float sumValue486 = productValue585 + 0.5f;
                                        precise float productValue586 = floor(sumValue485) * 6.103515625e-05f;
                                        precise float productValue587 = floor(sumValue486) * 6.103515625e-05f;
                                        intermediateValue529 = productValue586;
                                        intermediateValue530 = productValue587;
                                    }
                                    precise float productValue588 = vectorValue11.y * intermediateValue529;
                                    precise float productValue589 = vectorValue11.y * intermediateValue530;
                                    precise float sumValue487 = sumValue479 + productValue588;
                                    precise float sumValue488 = sumValue480 + productValue589;
                                    precise float productValue590 = scalarValue77 * 0.083333335816860198974609375f;
                                    precise float sumValue489 = productValue590 + (-0.25f);
                                    float intermediateValue549;
                                    float intermediateValue550;
                                    float intermediateValue551;
                                    float intermediateValue552;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue562 * 2 + 0) == 65535u)
                                    {
                                        intermediateValue549 = 1.0f;
                                        intermediateValue550 = 1.0f;
                                        intermediateValue551 = 1.0f;
                                        intermediateValue552 = 1.0f;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits45;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue562 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits45 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits45 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue562 * 2 + 0));
                                        }
                                        float4 sampledTextureValue16 = textures[NonUniformResourceIndex(reinterpretedBits45 + 0u)].SampleLevel(defaultSampler, float2(sumValue487, sumValue488), min(sumValue489, 2.0f));
                                        intermediateValue549 = sampledTextureValue16.x;
                                        intermediateValue550 = sampledTextureValue16.y;
                                        intermediateValue551 = sampledTextureValue16.z;
                                        intermediateValue552 = sampledTextureValue16.w;
                                    }
                                    float intermediateValue578;
                                    float intermediateValue579;
                                    float intermediateValue580;
                                    if (scalarValue79 == 2u)
                                    {
                                        float branchMergedValue44;
                                        float branchMergedValue140;
                                        float branchMergedValue141;
                                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue563 * 2 + 0) & 128u) == 0u)
                                        {
                                            float intermediateValue606;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue563 * 2 + 0) & 2048u) == 0u)
                                            {
                                                intermediateValue606 = intermediateValue552;
                                            }
                                            else
                                            {
                                                precise float productValue591 = intermediateValue552 * 2.0f;
                                                precise float sumValue490 = productValue591 + (-1.0f);
                                                intermediateValue606 = clamp(sumValue490, 0.0f, 1.0f);
                                            }
                                            precise float sumValue491 = 0.0f - intermediateValue549;
                                            precise float sumValue492 = 0.0f - intermediateValue550;
                                            precise float sumValue493 = 0.0f - intermediateValue551;
                                            precise float productValue592 = sumValue491 * intermediateValue606;
                                            precise float productValue593 = sumValue492 * intermediateValue606;
                                            precise float productValue594 = sumValue493 * intermediateValue606;
                                            precise float sumValue494 = intermediateValue549 + productValue592;
                                            precise float sumValue495 = intermediateValue550 + productValue593;
                                            precise float sumValue496 = intermediateValue551 + productValue594;
                                            branchMergedValue44 = sumValue495;
                                            branchMergedValue140 = sumValue494;
                                            branchMergedValue141 = sumValue496;
                                        }
                                        else
                                        {
                                            branchMergedValue44 = 0.33399999141693115234375f;
                                            branchMergedValue140 = 0.33399999141693115234375f;
                                            branchMergedValue141 = 0.33399999141693115234375f;
                                        }
                                        intermediateValue578 = branchMergedValue140;
                                        intermediateValue579 = branchMergedValue44;
                                        intermediateValue580 = branchMergedValue141;
                                    }
                                    else
                                    {
                                        precise float sumValue497 = 1.0f - intermediateValue552;
                                        intermediateValue578 = sumValue497;
                                        intermediateValue579 = sumValue497;
                                        intermediateValue580 = sumValue497;
                                    }
                                    precise float productValue595 = scalarValue73 * intermediateValue578;
                                    precise float productValue596 = scalarValue74 * intermediateValue579;
                                    precise float productValue597 = scalarValue75 * intermediateValue580;
                                    float intermediateValue361;
                                    float intermediateValue362;
                                    float intermediateValue363;
                                    bool intermediateValue607;
                                    if (!(dot(float3(productValue595, productValue596, productValue597), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                    {
                                        intermediateValue607 = false;
                                        intermediateValue361 = productValue595;
                                        intermediateValue362 = productValue596;
                                        intermediateValue363 = productValue597;
                                    }
                                    else
                                    {
                                        intermediateValue607 = true;
                                        intermediateValue361 = 0.0f;
                                        intermediateValue362 = 0.0f;
                                        intermediateValue363 = 0.0f;
                                    }
                                    float branchMergedValue162;
                                    float branchMergedValue166;
                                    float branchMergedValue167;
                                    if (intermediateValue607)
                                    {
                                        intermediateValue305.CommitNonOpaqueTriangleHit();
                                        branchMergedValue162 = intermediateValue362;
                                        branchMergedValue166 = intermediateValue363;
                                        branchMergedValue167 = intermediateValue361;
                                    }
                                    else
                                    {
                                        branchMergedValue162 = intermediateValue362;
                                        branchMergedValue166 = intermediateValue363;
                                        branchMergedValue167 = intermediateValue361;
                                    }
                                    branchMergedValue1 = branchMergedValue162;
                                    branchMergedValue7 = branchMergedValue166;
                                    branchMergedValue8 = branchMergedValue167;
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue74;
                                    branchMergedValue7 = scalarValue75;
                                    branchMergedValue8 = scalarValue73;
                                }
                                intermediateValue322 = branchMergedValue1;
                                intermediateValue324 = branchMergedValue7;
                                intermediateValue320 = branchMergedValue8;
                                bool conditionValue15 = intermediateValue305.Proceed();
                                if (conditionValue15)
                                {
                                    scalarValue73 = intermediateValue320;
                                    scalarValue74 = intermediateValue322;
                                    scalarValue75 = intermediateValue324;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            intermediateValue319 = intermediateValue320;
                            intermediateValue321 = intermediateValue322;
                            intermediateValue323 = intermediateValue324;
                        }
                        else
                        {
                            intermediateValue319 = exponentialValue5;
                            intermediateValue321 = exponentialValue6;
                            intermediateValue323 = exponentialValue7;
                        }
                        uint scalarValue81 = intermediateValue305.CommittedStatus();
                        bool comparisonValue61 = scalarValue81 == 1u;
                        float comparisonValue62 = comparisonValue61 ? 0.0f : intermediateValue319;
                        float comparisonValue63 = comparisonValue61 ? 0.0f : intermediateValue321;
                        float comparisonValue64 = comparisonValue61 ? 0.0f : intermediateValue323;
                        float branchMergedValue181;
                        float branchMergedValue199;
                        float branchMergedValue200;
                        if (dot(float3(comparisonValue62, comparisonValue63, comparisonValue64), 1.0f.xxx) > 0.00999999977648258209228515625f)
                        {
                            RayDesc _13ident = {float3(sumValue446, mad(viewCbConstants[53u].y, intermediateValue285, reinterpretedBits29), sumValue447), 0.0f, float3(productValue512, productValue513, productValue514), 10000.0f};
                            intermediateValue340.TraceRayInline(SceneBVH, 512u, 22u, _13ident);
                            bool conditionValue16 = intermediateValue340.Proceed();
                            float intermediateValue365;
                            float intermediateValue367;
                            float intermediateValue369;
                            if (conditionValue16)
                            {
                                float intermediateValue366;
                                float intermediateValue368;
                                float intermediateValue370;
                                float scalarValue82 = comparisonValue62;
                                float scalarValue83 = comparisonValue63;
                                float scalarValue84 = comparisonValue64;
                                bool comparisonValue76;
                                for (;;)
                                {
                                    uint scalarValue85 = intermediateValue340.CandidateType();
                                    comparisonValue76 = scalarValue85 == 0u;
                                    float branchMergedValue4;
                                    float branchMergedValue16;
                                    float branchMergedValue17;
                                    if (comparisonValue76)
                                    {
                                        float2 vectorValue12 = intermediateValue340.CandidateTriangleBarycentrics();
                                        float2 vectorValue13 = intermediateValue340.CandidateTriangleBarycentrics();
                                        float scalarValue86 = intermediateValue340.CandidateTriangleRayT();
                                        uint scalarValue87 = intermediateValue340.CandidatePrimitiveIndex();
                                        uint scalarValue88 = intermediateValue340.CandidateInstanceID();
                                        uint scalarValue89 = intermediateValue340.CandidateInstanceIndex();
                                        uint productValue598 = (scalarValue89 * 76u) + 58u;
                                        uint productValue599 = (scalarValue89 * 76u) + 61u;
                                        precise float sumValue498 = 1.0f - vectorValue12.x;
                                        precise float sumValue499 = sumValue498 - vectorValue13.y;
                                        uint bitwiseValue160 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue89 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue87 >> 1u);
                                        uint productValue600 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue89 * 76u) + 54u) * 2 + 0)) + 0u;
                                        bool comparisonValue65 = (scalarValue87 & 1u) == 0u;
                                        uint comparisonValue66 = comparisonValue65 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue600), bitwiseValue160 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue600), bitwiseValue160 * 16 + 0).x;
                                        uint comparisonValue67 = comparisonValue65 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue600), bitwiseValue160 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue600), bitwiseValue160 * 16 + 0).w;
                                        uint comparisonValue68 = comparisonValue65 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue600), bitwiseValue160 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue600), bitwiseValue160 * 16 + 0).z;
                                        bool productValue601 = rdByteLoad_objectInstances_uint16_t(0u, productValue599 * 2 + 0) < 0u;
                                        float intermediateValue483;
                                        float intermediateValue484;
                                        if (productValue601)
                                        {
                                            uint bitwiseValue161 = comparisonValue68 >> 15u;
                                            precise float bitwiseValue162 = float(bitwiseValue161 & 1u) * 2.0f;
                                            precise float sumValue500 = bitwiseValue162 + (-1.0f);
                                            precise float bitwiseValue163 = float(comparisonValue68 >> 31u) * 2.0f;
                                            precise float sumValue501 = bitwiseValue163 + (-1.0f);
                                            precise float bitwiseValue164 = float((comparisonValue68 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue165 = float(bitwiseValue161 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue602 = sumValue500 * 3.0517578125e-05f;
                                            precise float productValue603 = sumValue501 * 3.0517578125e-05f;
                                            precise float sumValue502 = bitwiseValue164 + productValue602;
                                            precise float sumValue503 = bitwiseValue165 + productValue603;
                                            intermediateValue483 = sumValue502;
                                            intermediateValue484 = sumValue503;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue166 = float(comparisonValue68 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue168 = float(comparisonValue68 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue604 = bitwiseValue166 * 16384.0f;
                                            precise float sumValue504 = productValue604 + 0.5f;
                                            precise float productValue605 = bitwiseValue168 * 16384.0f;
                                            precise float sumValue505 = productValue605 + 0.5f;
                                            precise float productValue606 = floor(sumValue504) * 6.103515625e-05f;
                                            precise float productValue607 = floor(sumValue505) * 6.103515625e-05f;
                                            intermediateValue483 = productValue606;
                                            intermediateValue484 = productValue607;
                                        }
                                        precise float productValue608 = sumValue499 * intermediateValue483;
                                        precise float productValue609 = sumValue499 * intermediateValue484;
                                        precise float sumValue506 = productValue608 + 0.0f;
                                        precise float sumValue507 = productValue609 + 0.0f;
                                        float intermediateValue531;
                                        float intermediateValue532;
                                        if (productValue601)
                                        {
                                            uint bitwiseValue169 = comparisonValue67 >> 15u;
                                            precise float bitwiseValue170 = float(bitwiseValue169 & 1u) * 2.0f;
                                            precise float sumValue508 = bitwiseValue170 + (-1.0f);
                                            precise float bitwiseValue171 = float(comparisonValue67 >> 31u) * 2.0f;
                                            precise float sumValue509 = bitwiseValue171 + (-1.0f);
                                            precise float bitwiseValue172 = float((comparisonValue67 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue173 = float(bitwiseValue169 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue610 = sumValue508 * 3.0517578125e-05f;
                                            precise float productValue611 = sumValue509 * 3.0517578125e-05f;
                                            precise float sumValue510 = bitwiseValue172 + productValue610;
                                            precise float sumValue511 = bitwiseValue173 + productValue611;
                                            intermediateValue531 = sumValue510;
                                            intermediateValue532 = sumValue511;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue174 = float(comparisonValue67 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue175 = float(comparisonValue67 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue612 = bitwiseValue174 * 16384.0f;
                                            precise float sumValue512 = productValue612 + 0.5f;
                                            precise float productValue613 = bitwiseValue175 * 16384.0f;
                                            precise float sumValue513 = productValue613 + 0.5f;
                                            precise float productValue614 = floor(sumValue512) * 6.103515625e-05f;
                                            precise float productValue615 = floor(sumValue513) * 6.103515625e-05f;
                                            intermediateValue531 = productValue614;
                                            intermediateValue532 = productValue615;
                                        }
                                        precise float productValue616 = vectorValue12.x * intermediateValue531;
                                        precise float productValue617 = vectorValue12.x * intermediateValue532;
                                        precise float sumValue514 = sumValue506 + productValue616;
                                        precise float sumValue515 = sumValue507 + productValue617;
                                        float intermediateValue570;
                                        float intermediateValue571;
                                        if (productValue601)
                                        {
                                            uint bitwiseValue176 = comparisonValue66 >> 15u;
                                            precise float bitwiseValue177 = float(bitwiseValue176 & 1u) * 2.0f;
                                            precise float sumValue516 = bitwiseValue177 + (-1.0f);
                                            precise float bitwiseValue178 = float(comparisonValue66 >> 31u) * 2.0f;
                                            precise float sumValue517 = bitwiseValue178 + (-1.0f);
                                            precise float bitwiseValue179 = float((comparisonValue66 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue180 = float(bitwiseValue176 & 65534u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue618 = sumValue516 * 3.0517578125e-05f;
                                            precise float productValue619 = sumValue517 * 3.0517578125e-05f;
                                            precise float sumValue518 = bitwiseValue179 + productValue618;
                                            precise float sumValue519 = bitwiseValue180 + productValue619;
                                            intermediateValue570 = sumValue518;
                                            intermediateValue571 = sumValue519;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue181 = float(comparisonValue66 & 65535u) * 1.525902189314365386962890625e-05f;
                                            precise float bitwiseValue182 = float(comparisonValue66 >> 16u) * 1.525902189314365386962890625e-05f;
                                            precise float productValue620 = bitwiseValue181 * 16384.0f;
                                            precise float sumValue520 = productValue620 + 0.5f;
                                            precise float productValue621 = bitwiseValue182 * 16384.0f;
                                            precise float sumValue521 = productValue621 + 0.5f;
                                            precise float productValue622 = floor(sumValue520) * 6.103515625e-05f;
                                            precise float productValue623 = floor(sumValue521) * 6.103515625e-05f;
                                            intermediateValue570 = productValue622;
                                            intermediateValue571 = productValue623;
                                        }
                                        precise float productValue624 = vectorValue13.y * intermediateValue570;
                                        precise float productValue625 = vectorValue13.y * intermediateValue571;
                                        precise float sumValue522 = sumValue514 + productValue624;
                                        precise float sumValue523 = sumValue515 + productValue625;
                                        precise float productValue626 = scalarValue86 * 0.083333335816860198974609375f;
                                        precise float sumValue524 = productValue626 + (-0.25f);
                                        float intermediateValue581;
                                        float intermediateValue582;
                                        float intermediateValue583;
                                        float intermediateValue584;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue598 * 2 + 0) == 65535u)
                                        {
                                            intermediateValue581 = 1.0f;
                                            intermediateValue582 = 1.0f;
                                            intermediateValue583 = 1.0f;
                                            intermediateValue584 = 1.0f;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits47;
                                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue598 * 2 + 0) > 4095u)
                                            {
                                                reinterpretedBits47 = asuint(viewCbConstants[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits47 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue598 * 2 + 0));
                                            }
                                            float4 sampledTextureValue17 = textures[NonUniformResourceIndex(reinterpretedBits47 + 0u)].SampleLevel(defaultSampler, float2(sumValue522, sumValue523), min(sumValue524, 2.0f));
                                            intermediateValue581 = sampledTextureValue17.x;
                                            intermediateValue582 = sampledTextureValue17.y;
                                            intermediateValue583 = sampledTextureValue17.z;
                                            intermediateValue584 = sampledTextureValue17.w;
                                        }
                                        float intermediateValue613;
                                        float intermediateValue614;
                                        float intermediateValue615;
                                        if (scalarValue88 == 2u)
                                        {
                                            float branchMergedValue46;
                                            float branchMergedValue144;
                                            float branchMergedValue145;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue599 * 2 + 0) & 128u) == 0u)
                                            {
                                                float intermediateValue623;
                                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue599 * 2 + 0) & 2048u) == 0u)
                                                {
                                                    intermediateValue623 = intermediateValue584;
                                                }
                                                else
                                                {
                                                    precise float productValue627 = intermediateValue584 * 2.0f;
                                                    precise float sumValue525 = productValue627 + (-1.0f);
                                                    intermediateValue623 = clamp(sumValue525, 0.0f, 1.0f);
                                                }
                                                precise float sumValue526 = 0.0f - intermediateValue581;
                                                precise float sumValue527 = 0.0f - intermediateValue582;
                                                precise float sumValue528 = 0.0f - intermediateValue583;
                                                precise float productValue628 = sumValue526 * intermediateValue623;
                                                precise float productValue629 = sumValue527 * intermediateValue623;
                                                precise float productValue630 = sumValue528 * intermediateValue623;
                                                precise float sumValue529 = intermediateValue581 + productValue628;
                                                precise float sumValue530 = intermediateValue582 + productValue629;
                                                precise float sumValue531 = intermediateValue583 + productValue630;
                                                branchMergedValue46 = sumValue531;
                                                branchMergedValue144 = sumValue530;
                                                branchMergedValue145 = sumValue529;
                                            }
                                            else
                                            {
                                                branchMergedValue46 = 0.33399999141693115234375f;
                                                branchMergedValue144 = 0.33399999141693115234375f;
                                                branchMergedValue145 = 0.33399999141693115234375f;
                                            }
                                            intermediateValue613 = branchMergedValue145;
                                            intermediateValue614 = branchMergedValue144;
                                            intermediateValue615 = branchMergedValue46;
                                        }
                                        else
                                        {
                                            precise float sumValue532 = 1.0f - intermediateValue584;
                                            intermediateValue613 = sumValue532;
                                            intermediateValue614 = sumValue532;
                                            intermediateValue615 = sumValue532;
                                        }
                                        precise float productValue631 = scalarValue82 * intermediateValue613;
                                        precise float productValue632 = scalarValue83 * intermediateValue614;
                                        precise float productValue633 = scalarValue84 * intermediateValue615;
                                        float intermediateValue426;
                                        float intermediateValue427;
                                        float intermediateValue428;
                                        bool intermediateValue624;
                                        if (!(dot(float3(productValue631, productValue632, productValue633), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                        {
                                            intermediateValue624 = false;
                                            intermediateValue426 = productValue631;
                                            intermediateValue427 = productValue632;
                                            intermediateValue428 = productValue633;
                                        }
                                        else
                                        {
                                            intermediateValue624 = true;
                                            intermediateValue426 = 0.0f;
                                            intermediateValue427 = 0.0f;
                                            intermediateValue428 = 0.0f;
                                        }
                                        float branchMergedValue164;
                                        float branchMergedValue170;
                                        float branchMergedValue171;
                                        if (intermediateValue624)
                                        {
                                            intermediateValue340.CommitNonOpaqueTriangleHit();
                                            branchMergedValue164 = intermediateValue428;
                                            branchMergedValue170 = intermediateValue427;
                                            branchMergedValue171 = intermediateValue426;
                                        }
                                        else
                                        {
                                            branchMergedValue164 = intermediateValue428;
                                            branchMergedValue170 = intermediateValue427;
                                            branchMergedValue171 = intermediateValue426;
                                        }
                                        branchMergedValue4 = branchMergedValue164;
                                        branchMergedValue16 = branchMergedValue170;
                                        branchMergedValue17 = branchMergedValue171;
                                    }
                                    else
                                    {
                                        branchMergedValue4 = scalarValue84;
                                        branchMergedValue16 = scalarValue83;
                                        branchMergedValue17 = scalarValue82;
                                    }
                                    intermediateValue370 = branchMergedValue4;
                                    intermediateValue368 = branchMergedValue16;
                                    intermediateValue366 = branchMergedValue17;
                                    bool conditionValue17 = intermediateValue340.Proceed();
                                    if (conditionValue17)
                                    {
                                        scalarValue82 = intermediateValue366;
                                        scalarValue83 = intermediateValue368;
                                        scalarValue84 = intermediateValue370;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue365 = intermediateValue366;
                                intermediateValue367 = intermediateValue368;
                                intermediateValue369 = intermediateValue370;
                            }
                            else
                            {
                                intermediateValue365 = comparisonValue62;
                                intermediateValue367 = comparisonValue63;
                                intermediateValue369 = comparisonValue64;
                            }
                            uint scalarValue90 = intermediateValue340.CommittedStatus();
                            bool comparisonValue69 = scalarValue90 == 1u;
                            branchMergedValue181 = comparisonValue69 ? 0.0f : intermediateValue367;
                            branchMergedValue199 = comparisonValue69 ? 0.0f : intermediateValue365;
                            branchMergedValue200 = comparisonValue69 ? 0.0f : intermediateValue369;
                        }
                        else
                        {
                            branchMergedValue181 = comparisonValue63;
                            branchMergedValue199 = comparisonValue62;
                            branchMergedValue200 = comparisonValue64;
                        }
                        branchMergedValue30 = branchMergedValue181;
                        branchMergedValue82 = branchMergedValue199;
                        branchMergedValue83 = branchMergedValue200;
                    }
                    else
                    {
                        RayDesc _14ident = {float3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0f, float3(productValue512, productValue513, productValue514), 10000.0f};
                        intermediateValue307.TraceRayInline(SceneBVH, 512u, 22u, _14ident);
                        bool conditionValue18 = intermediateValue307.Proceed();
                        float intermediateValue326;
                        float intermediateValue328;
                        float intermediateValue330;
                        if (conditionValue18)
                        {
                            float intermediateValue327;
                            float intermediateValue329;
                            float intermediateValue331;
                            float scalarValue91 = 1.0f;
                            float scalarValue92 = 1.0f;
                            float scalarValue93 = 1.0f;
                            bool comparisonValue55;
                            for (;;)
                            {
                                uint scalarValue94 = intermediateValue307.CandidateType();
                                comparisonValue55 = scalarValue94 == 0u;
                                float branchMergedValue2;
                                float branchMergedValue9;
                                float branchMergedValue10;
                                if (comparisonValue55)
                                {
                                    float2 vectorValue14 = intermediateValue307.CandidateTriangleBarycentrics();
                                    float2 vectorValue15 = intermediateValue307.CandidateTriangleBarycentrics();
                                    float scalarValue95 = intermediateValue307.CandidateTriangleRayT();
                                    uint scalarValue96 = intermediateValue307.CandidatePrimitiveIndex();
                                    uint scalarValue97 = intermediateValue307.CandidateInstanceID();
                                    uint scalarValue98 = intermediateValue307.CandidateInstanceIndex();
                                    uint productValue634 = (scalarValue98 * 76u) + 58u;
                                    uint productValue635 = (scalarValue98 * 76u) + 61u;
                                    precise float sumValue533 = 1.0f - vectorValue14.x;
                                    precise float sumValue534 = sumValue533 - vectorValue15.y;
                                    uint bitwiseValue183 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue98 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue96 >> 1u);
                                    uint productValue636 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue98 * 76u) + 54u) * 2 + 0)) + 0u;
                                    bool comparisonValue70 = (scalarValue96 & 1u) == 0u;
                                    uint comparisonValue71 = comparisonValue70 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue636), bitwiseValue183 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue636), bitwiseValue183 * 16 + 0).x;
                                    uint comparisonValue72 = comparisonValue70 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue636), bitwiseValue183 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue636), bitwiseValue183 * 16 + 0).w;
                                    uint comparisonValue73 = comparisonValue70 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue636), bitwiseValue183 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue636), bitwiseValue183 * 16 + 0).z;
                                    bool productValue637 = rdByteLoad_objectInstances_uint16_t(0u, productValue635 * 2 + 0) < 0u;
                                    float intermediateValue430;
                                    float intermediateValue431;
                                    if (productValue637)
                                    {
                                        uint bitwiseValue184 = comparisonValue73 >> 15u;
                                        precise float bitwiseValue185 = float(bitwiseValue184 & 1u) * 2.0f;
                                        precise float sumValue535 = bitwiseValue185 + (-1.0f);
                                        precise float bitwiseValue186 = float(comparisonValue73 >> 31u) * 2.0f;
                                        precise float sumValue536 = bitwiseValue186 + (-1.0f);
                                        precise float bitwiseValue187 = float((comparisonValue73 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue188 = float(bitwiseValue184 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue638 = sumValue535 * 3.0517578125e-05f;
                                        precise float productValue639 = sumValue536 * 3.0517578125e-05f;
                                        precise float sumValue537 = bitwiseValue187 + productValue638;
                                        precise float sumValue538 = bitwiseValue188 + productValue639;
                                        intermediateValue430 = sumValue537;
                                        intermediateValue431 = sumValue538;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue189 = float(comparisonValue73 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue190 = float(comparisonValue73 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue640 = bitwiseValue189 * 16384.0f;
                                        precise float sumValue539 = productValue640 + 0.5f;
                                        precise float productValue641 = bitwiseValue190 * 16384.0f;
                                        precise float sumValue540 = productValue641 + 0.5f;
                                        precise float productValue642 = floor(sumValue539) * 6.103515625e-05f;
                                        precise float productValue643 = floor(sumValue540) * 6.103515625e-05f;
                                        intermediateValue430 = productValue642;
                                        intermediateValue431 = productValue643;
                                    }
                                    precise float productValue644 = sumValue534 * intermediateValue430;
                                    precise float productValue645 = sumValue534 * intermediateValue431;
                                    precise float sumValue541 = productValue644 + 0.0f;
                                    precise float sumValue542 = productValue645 + 0.0f;
                                    float intermediateValue485;
                                    float intermediateValue486;
                                    if (productValue637)
                                    {
                                        uint bitwiseValue191 = comparisonValue72 >> 15u;
                                        precise float bitwiseValue192 = float(bitwiseValue191 & 1u) * 2.0f;
                                        precise float sumValue543 = bitwiseValue192 + (-1.0f);
                                        precise float bitwiseValue193 = float(comparisonValue72 >> 31u) * 2.0f;
                                        precise float sumValue544 = bitwiseValue193 + (-1.0f);
                                        precise float bitwiseValue194 = float((comparisonValue72 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue195 = float(bitwiseValue191 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue646 = sumValue543 * 3.0517578125e-05f;
                                        precise float productValue647 = sumValue544 * 3.0517578125e-05f;
                                        precise float sumValue545 = bitwiseValue194 + productValue646;
                                        precise float sumValue546 = bitwiseValue195 + productValue647;
                                        intermediateValue485 = sumValue545;
                                        intermediateValue486 = sumValue546;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue196 = float(comparisonValue72 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue197 = float(comparisonValue72 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue648 = bitwiseValue196 * 16384.0f;
                                        precise float sumValue547 = productValue648 + 0.5f;
                                        precise float productValue649 = bitwiseValue197 * 16384.0f;
                                        precise float sumValue548 = productValue649 + 0.5f;
                                        precise float productValue650 = floor(sumValue547) * 6.103515625e-05f;
                                        precise float productValue651 = floor(sumValue548) * 6.103515625e-05f;
                                        intermediateValue485 = productValue650;
                                        intermediateValue486 = productValue651;
                                    }
                                    precise float productValue652 = vectorValue14.x * intermediateValue485;
                                    precise float productValue653 = vectorValue14.x * intermediateValue486;
                                    precise float sumValue549 = sumValue541 + productValue652;
                                    precise float sumValue550 = sumValue542 + productValue653;
                                    float intermediateValue533;
                                    float intermediateValue534;
                                    if (productValue637)
                                    {
                                        uint bitwiseValue199 = comparisonValue71 >> 15u;
                                        precise float bitwiseValue200 = float(bitwiseValue199 & 1u) * 2.0f;
                                        precise float sumValue551 = bitwiseValue200 + (-1.0f);
                                        precise float bitwiseValue201 = float(comparisonValue71 >> 31u) * 2.0f;
                                        precise float sumValue552 = bitwiseValue201 + (-1.0f);
                                        precise float bitwiseValue202 = float((comparisonValue71 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue203 = float(bitwiseValue199 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue654 = sumValue551 * 3.0517578125e-05f;
                                        precise float productValue655 = sumValue552 * 3.0517578125e-05f;
                                        precise float sumValue553 = bitwiseValue202 + productValue654;
                                        precise float sumValue554 = bitwiseValue203 + productValue655;
                                        intermediateValue533 = sumValue553;
                                        intermediateValue534 = sumValue554;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue204 = float(comparisonValue71 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue205 = float(comparisonValue71 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue656 = bitwiseValue204 * 16384.0f;
                                        precise float sumValue555 = productValue656 + 0.5f;
                                        precise float productValue657 = bitwiseValue205 * 16384.0f;
                                        precise float sumValue556 = productValue657 + 0.5f;
                                        precise float productValue658 = floor(sumValue555) * 6.103515625e-05f;
                                        precise float productValue659 = floor(sumValue556) * 6.103515625e-05f;
                                        intermediateValue533 = productValue658;
                                        intermediateValue534 = productValue659;
                                    }
                                    precise float productValue660 = vectorValue15.y * intermediateValue533;
                                    precise float productValue661 = vectorValue15.y * intermediateValue534;
                                    precise float sumValue557 = sumValue549 + productValue660;
                                    precise float sumValue558 = sumValue550 + productValue661;
                                    precise float productValue662 = scalarValue95 * 0.083333335816860198974609375f;
                                    precise float sumValue559 = productValue662 + (-0.25f);
                                    float intermediateValue553;
                                    float intermediateValue554;
                                    float intermediateValue555;
                                    float intermediateValue556;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue634 * 2 + 0) == 65535u)
                                    {
                                        intermediateValue553 = 1.0f;
                                        intermediateValue554 = 1.0f;
                                        intermediateValue555 = 1.0f;
                                        intermediateValue556 = 1.0f;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits46;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue634 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits46 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits46 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue634 * 2 + 0));
                                        }
                                        float4 sampledTextureValue18 = textures[NonUniformResourceIndex(reinterpretedBits46 + 0u)].SampleLevel(defaultSampler, float2(sumValue557, sumValue558), min(sumValue559, 2.0f));
                                        intermediateValue553 = sampledTextureValue18.x;
                                        intermediateValue554 = sampledTextureValue18.y;
                                        intermediateValue555 = sampledTextureValue18.z;
                                        intermediateValue556 = sampledTextureValue18.w;
                                    }
                                    float intermediateValue585;
                                    float intermediateValue586;
                                    float intermediateValue587;
                                    if (scalarValue97 == 2u)
                                    {
                                        float branchMergedValue45;
                                        float branchMergedValue142;
                                        float branchMergedValue143;
                                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue635 * 2 + 0) & 128u) == 0u)
                                        {
                                            float intermediateValue608;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue635 * 2 + 0) & 2048u) == 0u)
                                            {
                                                intermediateValue608 = intermediateValue556;
                                            }
                                            else
                                            {
                                                precise float productValue663 = intermediateValue556 * 2.0f;
                                                precise float sumValue560 = productValue663 + (-1.0f);
                                                intermediateValue608 = clamp(sumValue560, 0.0f, 1.0f);
                                            }
                                            precise float sumValue561 = 0.0f - intermediateValue553;
                                            precise float sumValue562 = 0.0f - intermediateValue554;
                                            precise float sumValue563 = 0.0f - intermediateValue555;
                                            precise float productValue664 = sumValue561 * intermediateValue608;
                                            precise float productValue665 = sumValue562 * intermediateValue608;
                                            precise float productValue666 = sumValue563 * intermediateValue608;
                                            precise float sumValue564 = intermediateValue553 + productValue664;
                                            precise float sumValue565 = intermediateValue554 + productValue665;
                                            precise float sumValue566 = intermediateValue555 + productValue666;
                                            branchMergedValue45 = sumValue566;
                                            branchMergedValue142 = sumValue565;
                                            branchMergedValue143 = sumValue564;
                                        }
                                        else
                                        {
                                            branchMergedValue45 = 0.33399999141693115234375f;
                                            branchMergedValue142 = 0.33399999141693115234375f;
                                            branchMergedValue143 = 0.33399999141693115234375f;
                                        }
                                        intermediateValue585 = branchMergedValue143;
                                        intermediateValue586 = branchMergedValue142;
                                        intermediateValue587 = branchMergedValue45;
                                    }
                                    else
                                    {
                                        precise float sumValue567 = 1.0f - intermediateValue556;
                                        intermediateValue585 = sumValue567;
                                        intermediateValue586 = sumValue567;
                                        intermediateValue587 = sumValue567;
                                    }
                                    precise float productValue667 = scalarValue91 * intermediateValue585;
                                    precise float productValue668 = scalarValue92 * intermediateValue586;
                                    precise float productValue669 = scalarValue93 * intermediateValue587;
                                    float intermediateValue378;
                                    float intermediateValue379;
                                    float intermediateValue380;
                                    bool intermediateValue609;
                                    if (!(dot(float3(productValue667, productValue668, productValue669), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                    {
                                        intermediateValue609 = false;
                                        intermediateValue378 = productValue667;
                                        intermediateValue379 = productValue668;
                                        intermediateValue380 = productValue669;
                                    }
                                    else
                                    {
                                        intermediateValue609 = true;
                                        intermediateValue378 = 0.0f;
                                        intermediateValue379 = 0.0f;
                                        intermediateValue380 = 0.0f;
                                    }
                                    float branchMergedValue163;
                                    float branchMergedValue168;
                                    float branchMergedValue169;
                                    if (intermediateValue609)
                                    {
                                        intermediateValue307.CommitNonOpaqueTriangleHit();
                                        branchMergedValue163 = intermediateValue379;
                                        branchMergedValue168 = intermediateValue378;
                                        branchMergedValue169 = intermediateValue380;
                                    }
                                    else
                                    {
                                        branchMergedValue163 = intermediateValue379;
                                        branchMergedValue168 = intermediateValue378;
                                        branchMergedValue169 = intermediateValue380;
                                    }
                                    branchMergedValue2 = branchMergedValue163;
                                    branchMergedValue9 = branchMergedValue168;
                                    branchMergedValue10 = branchMergedValue169;
                                }
                                else
                                {
                                    branchMergedValue2 = scalarValue92;
                                    branchMergedValue9 = scalarValue91;
                                    branchMergedValue10 = scalarValue93;
                                }
                                intermediateValue329 = branchMergedValue2;
                                intermediateValue327 = branchMergedValue9;
                                intermediateValue331 = branchMergedValue10;
                                bool conditionValue19 = intermediateValue307.Proceed();
                                if (conditionValue19)
                                {
                                    scalarValue91 = intermediateValue327;
                                    scalarValue92 = intermediateValue329;
                                    scalarValue93 = intermediateValue331;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            intermediateValue326 = intermediateValue327;
                            intermediateValue328 = intermediateValue329;
                            intermediateValue330 = intermediateValue331;
                        }
                        else
                        {
                            intermediateValue326 = 1.0f;
                            intermediateValue328 = 1.0f;
                            intermediateValue330 = 1.0f;
                        }
                        uint scalarValue99 = intermediateValue307.CommittedStatus();
                        bool comparisonValue74 = scalarValue99 == 1u;
                        branchMergedValue30 = comparisonValue74 ? 0.0f : intermediateValue328;
                        branchMergedValue82 = comparisonValue74 ? 0.0f : intermediateValue326;
                        branchMergedValue83 = comparisonValue74 ? 0.0f : intermediateValue330;
                    }
                    intermediateValue250 = branchMergedValue82;
                    intermediateValue251 = branchMergedValue30;
                    intermediateValue252 = branchMergedValue83;
                }
                float intermediateValue262;
                float productValue434;
                float productValue435;
                float productValue436;
                if (dot(float3(intermediateValue250, intermediateValue251, intermediateValue252), 1.0f.xxx) > 0.0f)
                {
                    float intermediateValue263;
                    if (asuint(viewCbConstants[92u]).x == 0u)
                    {
                        intermediateValue263 = intermediateValue218;
                    }
                    else
                    {
                        float branchMergedValue33;
                        if (intermediateValue109 == 2u)
                        {
                            precise float scalarValue100 = intermediateValue218 * 1.5f;
                            precise float clampedValue7 = clamp(scalarValue100, 0.0f, 1.0f) * 0.5f;
                            precise float sumValue568 = 1.0f - intermediateValue218;
                            precise float productValue670 = sumValue568 * clampedValue7;
                            precise float sumValue569 = intermediateValue218 + productValue670;
                            branchMergedValue33 = sumValue569;
                        }
                        else
                        {
                            float branchMergedValue183;
                            if (intermediateValue109 == 1u)
                            {
                                branchMergedValue183 = max(intermediateValue218, 0.25f);
                            }
                            else
                            {
                                branchMergedValue183 = intermediateValue218;
                            }
                            branchMergedValue33 = branchMergedValue183;
                        }
                        intermediateValue263 = branchMergedValue33;
                    }
                    float scalarValue101 = max(intermediateValue263, 0.00999999977648258209228515625f);
                    float sumValue570 = viewCbConstants[52u].x - intermediateValue77;
                    float sumValue571 = viewCbConstants[52u].y - intermediateValue79;
                    float sumValue572 = viewCbConstants[52u].z - intermediateValue81;
                    float inverseLengthValue15 = rsqrt(dot(float3(sumValue570, sumValue571, sumValue572), float3(sumValue570, sumValue571, sumValue572)));
                    float productValue671 = inverseLengthValue15 * sumValue570;
                    float productValue672 = inverseLengthValue15 * sumValue571;
                    float productValue673 = inverseLengthValue15 * sumValue572;
                    float clampedValue8 = clamp(dot(float3(intermediateValue219, intermediateValue221, intermediateValue223), float3(viewCbConstants[52u].xyz)), 0.0f, 1.0f);
                    float clampedValue9 = clamp(dot(float3(intermediateValue219, intermediateValue221, intermediateValue223), float3(sumValue402, sumValue403, sumValue404)), 0.0f, 1.0f);
                    float clampedValue10 = clamp(dot(float3(intermediateValue219, intermediateValue221, intermediateValue223), float3(productValue671, productValue672, productValue673)), 0.0f, 1.0f);
                    float clampedValue11 = clamp(dot(float3(sumValue402, sumValue403, sumValue404), float3(productValue671, productValue672, productValue673)), 0.0f, 1.0f);
                    float productValue674 = scalarValue101 * scalarValue101;
                    float productValue675 = productValue674 * productValue674;
                    float productValue676 = (((clampedValue10 * productValue675) - clampedValue10) * clampedValue10) + 1.0f;
                    float productValue677 = productValue674 * 0.5f;
                    float sumValue573 = 1.0f - productValue677;
                    float clampedValue12 = clamp(dot(float3(intermediateValue225, intermediateValue226, intermediateValue227), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
                    float clampedValue13 = exp2(log2(clamp(1.0f - clampedValue11, 0.0f, 1.0f)) * 5.0f);
                    float productValue678 = (clampedValue13 * (clampedValue12 - intermediateValue225)) + intermediateValue225;
                    float productValue679 = (clampedValue13 * (clampedValue12 - intermediateValue226)) + intermediateValue226;
                    float productValue680 = (clampedValue13 * (clampedValue12 - intermediateValue227)) + intermediateValue227;
                    float productValue681 = ((clampedValue11 * clampedValue11) * (scalarValue101 * 2.0f)) + (-0.5f);
                    float quotientValue22 = ((productValue675 / ((productValue676 * productValue676) + 1.0000000133514319600180897396058e-10f)) * 0.3183098733425140380859375f) * (0.25f / ((((clampedValue9 * sumValue573) + productValue677) * ((clampedValue8 * sumValue573) + productValue677)) + 1.0000000133514319600180897396058e-10f));
                    float clampedValue14 = ((intermediateValue216 * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue9, 0.0f, 1.0f)) * 5.0f) * productValue681) + 1.0f)) * ((exp2(log2(clamp(1.0f - clampedValue8, 0.0f, 1.0f)) * 5.0f) * productValue681) + 1.0f);
                    intermediateValue262 = intermediateValue263;
                    productValue434 = ((((intermediateValue250 * intermediateValue237) * clampedValue8) * viewCbConstants[50u].x) * ((((1.0f - productValue678) * intermediateValue228) * clampedValue14) + (productValue678 * quotientValue22))) + productValue483;
                    productValue435 = ((((intermediateValue251 * intermediateValue238) * clampedValue8) * viewCbConstants[50u].y) * ((((1.0f - productValue679) * intermediateValue229) * clampedValue14) + (productValue679 * quotientValue22))) + productValue484;
                    productValue436 = ((((intermediateValue252 * intermediateValue239) * clampedValue8) * viewCbConstants[50u].z) * ((((1.0f - productValue680) * intermediateValue230) * clampedValue14) + (productValue680 * quotientValue22))) + productValue485;
                }
                else
                {
                    intermediateValue262 = intermediateValue218;
                    productValue434 = productValue483;
                    productValue435 = productValue484;
                    productValue436 = productValue485;
                }
                uint4 reinterpretedBits32 = asuint(viewCbConstants[92u]);
                uint scalarValue102 = reinterpretedBits32.w;
                float intermediateValue270;
                float intermediateValue271;
                float intermediateValue272;
                uint intermediateValue273;
                float intermediateValue275;
                float intermediateValue276;
                float intermediateValue277;
                uint intermediateValue279;
                if (scalarValue102 == 0u)
                {
                    intermediateValue270 = 0.0f;
                    intermediateValue271 = 0.0f;
                    intermediateValue272 = 0.0f;
                    intermediateValue273 = 0u;
                    intermediateValue275 = 0.0f;
                    intermediateValue276 = 0.0f;
                    intermediateValue277 = 0.0f;
                    intermediateValue45 = intermediateValue44;
                    intermediateValue279 = intermediateValue91;
                }
                else
                {
                    intermediateValue[0u] = 0u;
                    uint sumValue575 = scalarValue102 + 4294967295u;
                    uint productValue682 = (intermediateValue91 * 1664525u) + 1013904223u;
                    precise float bitwiseValue206 = float(productValue682 & 16777215u) * 5.9604644775390625e-08f;
                    float scalarValue103 = float(int(scalarValue102));
                    precise float productValue683 = bitwiseValue206 * scalarValue103;
                    uint scalarValue104 = uint(min(int(uint(int(productValue683))), int(sumValue575)));
                    half3 productValue684 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (scalarValue104 * 2u) * 6 + 0));
                    precise float sumValue576 = float(productValue684.x) - sumValue209;
                    precise float sumValue577 = float(productValue684.y) - sumValue212;
                    precise float sumValue578 = float(productValue684.z) - sumValue215;
                    precise float dotProductValue14 = dot(float3(sumValue576, sumValue577, sumValue578), float3(sumValue576, sumValue577, sumValue578));
                    precise float quotientValue23 = 1.0f / dotProductValue14;
                    float comparisonValue75 = (int(rdByteLoad_inputLightsBuffer_uint(0u, ((scalarValue104 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
                    precise float productValue685 = comparisonValue75 * comparisonValue75;
                    float intermediateValue295;
                    if (dotProductValue14 > productValue685)
                    {
                        float inverseLengthValue16 = rsqrt(dotProductValue14);
                        precise float productValue686 = sumValue576 * inverseLengthValue16;
                        precise float productValue687 = sumValue577 * inverseLengthValue16;
                        precise float productValue688 = sumValue578 * inverseLengthValue16;
                        precise float dotProductValue15 = quotientValue23 * max(0.0f, dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(productValue686, productValue687, productValue688)));
                        intermediateValue295 = dotProductValue15;
                    }
                    else
                    {
                        intermediateValue295 = quotientValue23;
                    }
                    float intermediateValue315;
                    uint intermediateValue316;
                    float intermediateValue317;
                    if (intermediateValue295 > 0.0f)
                    {
                        intermediateValue[0u] = scalarValue104;
                        intermediateValue315 = intermediateValue295;
                        intermediateValue316 = 1u;
                        intermediateValue317 = intermediateValue295;
                    }
                    else
                    {
                        intermediateValue315 = -1.0f;
                        intermediateValue316 = 0u;
                        intermediateValue317 = 0.0f;
                    }
                    intermediateValue[1u] = 0u;
                    uint productValue689 = (productValue682 * 1664525u) + 1013904223u;
                    precise float bitwiseValue207 = float(productValue689 & 16777215u) * 5.9604644775390625e-08f;
                    precise float productValue690 = bitwiseValue207 * scalarValue103;
                    uint scalarValue105 = uint(min(int(uint(int(productValue690))), int(sumValue575)));
                    half3 productValue691 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (scalarValue105 * 2u) * 6 + 0));
                    precise float sumValue579 = float(productValue691.x) - sumValue209;
                    precise float sumValue580 = float(productValue691.y) - sumValue212;
                    precise float sumValue581 = float(productValue691.z) - sumValue215;
                    precise float dotProductValue16 = dot(float3(sumValue579, sumValue580, sumValue581), float3(sumValue579, sumValue580, sumValue581));
                    precise float quotientValue24 = 1.0f / dotProductValue16;
                    float comparisonValue78 = (int(rdByteLoad_inputLightsBuffer_uint(0u, ((scalarValue105 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
                    precise float productValue692 = comparisonValue78 * comparisonValue78;
                    float intermediateValue333;
                    if (dotProductValue16 > productValue692)
                    {
                        float inverseLengthValue17 = rsqrt(dotProductValue16);
                        precise float productValue693 = sumValue579 * inverseLengthValue17;
                        precise float productValue694 = sumValue580 * inverseLengthValue17;
                        precise float productValue695 = sumValue581 * inverseLengthValue17;
                        precise float dotProductValue17 = quotientValue24 * max(0.0f, dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(productValue693, productValue694, productValue695)));
                        intermediateValue333 = dotProductValue17;
                    }
                    else
                    {
                        intermediateValue333 = quotientValue24;
                    }
                    float intermediateValue352;
                    uint sumValue459;
                    float intermediateValue353;
                    if (intermediateValue333 > 0.0f)
                    {
                        float sumValue582 = intermediateValue333 + intermediateValue317;
                        intermediateValue[1u] = scalarValue105;
                        intermediateValue352 = sumValue582;
                        sumValue459 = intermediateValue316 + 1u;
                        intermediateValue353 = sumValue582;
                    }
                    else
                    {
                        intermediateValue352 = -1.0f;
                        sumValue459 = intermediateValue316;
                        intermediateValue353 = intermediateValue317;
                    }
                    intermediateValue[2u] = 0u;
                    uint productValue696 = (productValue689 * 1664525u) + 1013904223u;
                    precise float bitwiseValue208 = float(productValue696 & 16777215u) * 5.9604644775390625e-08f;
                    precise float productValue697 = bitwiseValue208 * scalarValue103;
                    uint scalarValue106 = uint(min(int(uint(int(productValue697))), int(sumValue575)));
                    half3 productValue698 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (scalarValue106 * 2u) * 6 + 0));
                    precise float sumValue583 = float(productValue698.x) - sumValue209;
                    precise float sumValue584 = float(productValue698.y) - sumValue212;
                    precise float sumValue585 = float(productValue698.z) - sumValue215;
                    precise float dotProductValue18 = dot(float3(sumValue583, sumValue584, sumValue585), float3(sumValue583, sumValue584, sumValue585));
                    precise float quotientValue25 = 1.0f / dotProductValue18;
                    float comparisonValue79 = (int(rdByteLoad_inputLightsBuffer_uint(0u, ((scalarValue106 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
                    precise float productValue699 = comparisonValue79 * comparisonValue79;
                    float intermediateValue398;
                    if (dotProductValue18 > productValue699)
                    {
                        float inverseLengthValue18 = rsqrt(dotProductValue18);
                        precise float productValue700 = sumValue583 * inverseLengthValue18;
                        precise float productValue701 = sumValue584 * inverseLengthValue18;
                        precise float productValue702 = sumValue585 * inverseLengthValue18;
                        precise float dotProductValue19 = quotientValue25 * max(0.0f, dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(productValue700, productValue701, productValue702)));
                        intermediateValue398 = dotProductValue19;
                    }
                    else
                    {
                        intermediateValue398 = quotientValue25;
                    }
                    float intermediateValue415;
                    uint sumValue574;
                    float intermediateValue416;
                    if (intermediateValue398 > 0.0f)
                    {
                        float sumValue586 = intermediateValue398 + intermediateValue353;
                        intermediateValue[2u] = scalarValue106;
                        intermediateValue415 = sumValue586;
                        sumValue574 = sumValue459 + 1u;
                        intermediateValue416 = sumValue586;
                    }
                    else
                    {
                        intermediateValue415 = -1.0f;
                        sumValue574 = sumValue459;
                        intermediateValue416 = intermediateValue353;
                    }
                    intermediateValue[3u] = 0u;
                    uint productValue703 = (productValue696 * 1664525u) + 1013904223u;
                    precise float bitwiseValue209 = float(productValue703 & 16777215u) * 5.9604644775390625e-08f;
                    precise float productValue704 = bitwiseValue209 * scalarValue103;
                    uint scalarValue107 = uint(min(int(uint(int(productValue704))), int(sumValue575)));
                    half3 productValue705 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (scalarValue107 * 2u) * 6 + 0));
                    precise float sumValue587 = float(productValue705.x) - sumValue209;
                    precise float sumValue588 = float(productValue705.y) - sumValue212;
                    precise float sumValue589 = float(productValue705.z) - sumValue215;
                    precise float dotProductValue20 = dot(float3(sumValue587, sumValue588, sumValue589), float3(sumValue587, sumValue588, sumValue589));
                    precise float quotientValue26 = 1.0f / dotProductValue20;
                    float comparisonValue80 = (int(rdByteLoad_inputLightsBuffer_uint(0u, ((scalarValue107 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
                    precise float productValue706 = comparisonValue80 * comparisonValue80;
                    float intermediateValue452;
                    if (dotProductValue20 > productValue706)
                    {
                        float inverseLengthValue19 = rsqrt(dotProductValue20);
                        precise float productValue707 = sumValue587 * inverseLengthValue19;
                        precise float productValue708 = sumValue588 * inverseLengthValue19;
                        precise float productValue709 = sumValue589 * inverseLengthValue19;
                        precise float dotProductValue21 = quotientValue26 * max(0.0f, dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(productValue707, productValue708, productValue709)));
                        intermediateValue452 = dotProductValue21;
                    }
                    else
                    {
                        intermediateValue452 = quotientValue26;
                    }
                    float intermediateValue477;
                    uint sumValue632;
                    float intermediateValue478;
                    if (intermediateValue452 > 0.0f)
                    {
                        float sumValue590 = intermediateValue452 + intermediateValue416;
                        intermediateValue[3u] = scalarValue107;
                        intermediateValue477 = sumValue590;
                        sumValue632 = sumValue574 + 1u;
                        intermediateValue478 = sumValue590;
                    }
                    else
                    {
                        intermediateValue477 = -1.0f;
                        sumValue632 = sumValue574;
                        intermediateValue478 = intermediateValue416;
                    }
                    intermediateValue[4u] = 0u;
                    uint productValue710 = (productValue703 * 1664525u) + 1013904223u;
                    precise float bitwiseValue210 = float(productValue710 & 16777215u) * 5.9604644775390625e-08f;
                    precise float productValue711 = bitwiseValue210 * scalarValue103;
                    uint scalarValue108 = uint(min(int(uint(int(productValue711))), int(sumValue575)));
                    half3 productValue712 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (scalarValue108 * 2u) * 6 + 0));
                    precise float sumValue591 = float(productValue712.x) - sumValue209;
                    precise float sumValue592 = float(productValue712.y) - sumValue212;
                    precise float sumValue593 = float(productValue712.z) - sumValue215;
                    precise float dotProductValue22 = dot(float3(sumValue591, sumValue592, sumValue593), float3(sumValue591, sumValue592, sumValue593));
                    precise float quotientValue27 = 1.0f / dotProductValue22;
                    float comparisonValue81 = (int(rdByteLoad_inputLightsBuffer_uint(0u, ((scalarValue108 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
                    precise float productValue713 = comparisonValue81 * comparisonValue81;
                    float intermediateValue513;
                    if (dotProductValue22 > productValue713)
                    {
                        float inverseLengthValue20 = rsqrt(dotProductValue22);
                        precise float productValue714 = sumValue591 * inverseLengthValue20;
                        precise float productValue715 = sumValue592 * inverseLengthValue20;
                        precise float productValue716 = sumValue593 * inverseLengthValue20;
                        precise float dotProductValue23 = quotientValue27 * max(0.0f, dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(productValue714, productValue715, productValue716)));
                        intermediateValue513 = dotProductValue23;
                    }
                    else
                    {
                        intermediateValue513 = quotientValue27;
                    }
                    float intermediateValue526;
                    uint sumValue711;
                    float intermediateValue527;
                    if (intermediateValue513 > 0.0f)
                    {
                        float sumValue594 = intermediateValue513 + intermediateValue478;
                        intermediateValue[4u] = scalarValue108;
                        intermediateValue526 = sumValue594;
                        sumValue711 = sumValue632 + 1u;
                        intermediateValue527 = sumValue594;
                    }
                    else
                    {
                        intermediateValue526 = -1.0f;
                        sumValue711 = sumValue632;
                        intermediateValue527 = intermediateValue478;
                    }
                    intermediateValue[5u] = 0u;
                    uint productValue717 = (productValue710 * 1664525u) + 1013904223u;
                    precise float bitwiseValue211 = float(productValue717 & 16777215u) * 5.9604644775390625e-08f;
                    precise float productValue718 = bitwiseValue211 * scalarValue103;
                    uint scalarValue109 = uint(min(int(uint(int(productValue718))), int(sumValue575)));
                    half3 productValue719 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (scalarValue109 * 2u) * 6 + 0));
                    precise float sumValue595 = float(productValue719.x) - sumValue209;
                    precise float sumValue596 = float(productValue719.y) - sumValue212;
                    precise float sumValue597 = float(productValue719.z) - sumValue215;
                    precise float dotProductValue24 = dot(float3(sumValue595, sumValue596, sumValue597), float3(sumValue595, sumValue596, sumValue597));
                    precise float quotientValue28 = 1.0f / dotProductValue24;
                    float comparisonValue82 = (int(rdByteLoad_inputLightsBuffer_uint(0u, ((scalarValue109 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
                    precise float productValue720 = comparisonValue82 * comparisonValue82;
                    float intermediateValue548;
                    if (dotProductValue24 > productValue720)
                    {
                        float inverseLengthValue21 = rsqrt(dotProductValue24);
                        precise float productValue721 = sumValue595 * inverseLengthValue21;
                        precise float productValue722 = sumValue596 * inverseLengthValue21;
                        precise float productValue723 = sumValue597 * inverseLengthValue21;
                        precise float dotProductValue25 = quotientValue28 * max(0.0f, dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(productValue721, productValue722, productValue723)));
                        intermediateValue548 = dotProductValue25;
                    }
                    else
                    {
                        intermediateValue548 = quotientValue28;
                    }
                    float intermediateValue567;
                    uint sumValue766;
                    float intermediateValue568;
                    if (intermediateValue548 > 0.0f)
                    {
                        float sumValue598 = intermediateValue548 + intermediateValue527;
                        intermediateValue[5u] = scalarValue109;
                        intermediateValue567 = sumValue598;
                        sumValue766 = sumValue711 + 1u;
                        intermediateValue568 = sumValue598;
                    }
                    else
                    {
                        intermediateValue567 = -1.0f;
                        sumValue766 = sumValue711;
                        intermediateValue568 = intermediateValue527;
                    }
                    intermediateValue[6u] = 0u;
                    uint productValue724 = (productValue717 * 1664525u) + 1013904223u;
                    precise float bitwiseValue212 = float(productValue724 & 16777215u) * 5.9604644775390625e-08f;
                    precise float productValue725 = bitwiseValue212 * scalarValue103;
                    uint scalarValue110 = uint(min(int(uint(int(productValue725))), int(sumValue575)));
                    half3 productValue726 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (scalarValue110 * 2u) * 6 + 0));
                    precise float sumValue599 = float(productValue726.x) - sumValue209;
                    precise float sumValue600 = float(productValue726.y) - sumValue212;
                    precise float sumValue601 = float(productValue726.z) - sumValue215;
                    precise float dotProductValue26 = dot(float3(sumValue599, sumValue600, sumValue601), float3(sumValue599, sumValue600, sumValue601));
                    precise float quotientValue29 = 1.0f / dotProductValue26;
                    float comparisonValue83 = (int(rdByteLoad_inputLightsBuffer_uint(0u, ((scalarValue110 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
                    precise float productValue727 = comparisonValue83 * comparisonValue83;
                    float intermediateValue577;
                    if (dotProductValue26 > productValue727)
                    {
                        float inverseLengthValue22 = rsqrt(dotProductValue26);
                        precise float productValue728 = sumValue599 * inverseLengthValue22;
                        precise float productValue729 = sumValue600 * inverseLengthValue22;
                        precise float productValue730 = sumValue601 * inverseLengthValue22;
                        precise float dotProductValue27 = quotientValue29 * max(0.0f, dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(productValue728, productValue729, productValue730)));
                        intermediateValue577 = dotProductValue27;
                    }
                    else
                    {
                        intermediateValue577 = quotientValue29;
                    }
                    float intermediateValue603;
                    uint sumValue815;
                    float intermediateValue604;
                    if (intermediateValue577 > 0.0f)
                    {
                        float sumValue602 = intermediateValue577 + intermediateValue568;
                        intermediateValue[6u] = scalarValue110;
                        intermediateValue603 = sumValue602;
                        sumValue815 = sumValue766 + 1u;
                        intermediateValue604 = sumValue602;
                    }
                    else
                    {
                        intermediateValue603 = -1.0f;
                        sumValue815 = sumValue766;
                        intermediateValue604 = intermediateValue568;
                    }
                    intermediateValue[7u] = 0u;
                    uint productValue731 = (productValue724 * 1664525u) + 1013904223u;
                    precise float bitwiseValue213 = float(productValue731 & 16777215u) * 5.9604644775390625e-08f;
                    precise float productValue732 = bitwiseValue213 * scalarValue103;
                    uint scalarValue111 = uint(min(int(uint(int(productValue732))), int(sumValue575)));
                    half3 productValue733 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (scalarValue111 * 2u) * 6 + 0));
                    precise float sumValue603 = float(productValue733.x) - sumValue209;
                    precise float sumValue604 = float(productValue733.y) - sumValue212;
                    precise float sumValue605 = float(productValue733.z) - sumValue215;
                    precise float dotProductValue28 = dot(float3(sumValue603, sumValue604, sumValue605), float3(sumValue603, sumValue604, sumValue605));
                    precise float quotientValue30 = 1.0f / dotProductValue28;
                    float comparisonValue84 = (int(rdByteLoad_inputLightsBuffer_uint(0u, ((scalarValue111 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
                    precise float productValue734 = comparisonValue84 * comparisonValue84;
                    float intermediateValue612;
                    if (dotProductValue28 > productValue734)
                    {
                        float inverseLengthValue23 = rsqrt(dotProductValue28);
                        precise float productValue735 = sumValue603 * inverseLengthValue23;
                        precise float productValue736 = sumValue604 * inverseLengthValue23;
                        precise float productValue737 = sumValue605 * inverseLengthValue23;
                        precise float dotProductValue29 = quotientValue30 * max(0.0f, dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(productValue735, productValue736, productValue737)));
                        intermediateValue612 = dotProductValue29;
                    }
                    else
                    {
                        intermediateValue612 = quotientValue30;
                    }
                    float intermediateValue621;
                    uint sumValue851;
                    float intermediateValue622;
                    if (intermediateValue612 > 0.0f)
                    {
                        float sumValue606 = intermediateValue612 + intermediateValue604;
                        intermediateValue[7u] = scalarValue111;
                        intermediateValue621 = sumValue606;
                        sumValue851 = sumValue815 + 1u;
                        intermediateValue622 = sumValue606;
                    }
                    else
                    {
                        intermediateValue621 = -1.0f;
                        sumValue851 = sumValue815;
                        intermediateValue622 = intermediateValue604;
                    }
                    bool comparisonValue85 = sumValue851 == 0u;
                    float intermediateValue278;
                    uint intermediateValue280;
                    uint intermediateValue629;
                    half intermediateValue630;
                    half intermediateValue632;
                    half intermediateValue634;
                    if (comparisonValue85)
                    {
                        intermediateValue278 = intermediateValue44;
                        intermediateValue280 = productValue731;
                        intermediateValue629 = 0u;
                        intermediateValue630 = half(0.0);
                        intermediateValue632 = half(0.0);
                        intermediateValue634 = half(0.0);
                    }
                    else
                    {
                        uint intermediateValue647;
                        uint productValue1076;
                        float bitwiseValue310;
                        bool intermediateValue636;
                        for (;;)
                        {
                            productValue1076 = (productValue731 * 1664525u) + 1013904223u;
                            bitwiseValue310 = (float(productValue1076 & 16777215u) * 5.9604584379258085391484200954437e-08f) * intermediateValue622;
                            intermediateValue636 = intermediateValue315 > bitwiseValue310;
                            uint intermediateValue641;
                            if (intermediateValue636)
                            {
                                intermediateValue641 = 0u;
                            }
                            else
                            {
                                uint branchMergedValue48;
                                if (intermediateValue352 > bitwiseValue310)
                                {
                                    branchMergedValue48 = 1u;
                                }
                                else
                                {
                                    uint branchMergedValue189;
                                    if (intermediateValue415 > bitwiseValue310)
                                    {
                                        branchMergedValue189 = 2u;
                                    }
                                    else
                                    {
                                        uint branchMergedValue240;
                                        if (intermediateValue477 > bitwiseValue310)
                                        {
                                            branchMergedValue240 = 3u;
                                        }
                                        else
                                        {
                                            uint branchMergedValue244;
                                            if (intermediateValue526 > bitwiseValue310)
                                            {
                                                branchMergedValue244 = 4u;
                                            }
                                            else
                                            {
                                                uint branchMergedValue245;
                                                if (intermediateValue567 > bitwiseValue310)
                                                {
                                                    branchMergedValue245 = 5u;
                                                }
                                                else
                                                {
                                                    uint branchMergedValue246;
                                                    if (intermediateValue603 > bitwiseValue310)
                                                    {
                                                        branchMergedValue246 = 6u;
                                                    }
                                                    else
                                                    {
                                                        if (!(intermediateValue621 > bitwiseValue310))
                                                        {
                                                            intermediateValue647 = 0u;
                                                            break;
                                                        }
                                                        branchMergedValue246 = 7u;
                                                    }
                                                    branchMergedValue245 = branchMergedValue246;
                                                }
                                                branchMergedValue244 = branchMergedValue245;
                                            }
                                            branchMergedValue240 = branchMergedValue244;
                                        }
                                        branchMergedValue189 = branchMergedValue240;
                                    }
                                    branchMergedValue48 = branchMergedValue189;
                                }
                                intermediateValue641 = branchMergedValue48;
                            }
                            intermediateValue647 = intermediateValue[intermediateValue641];
                            break;
                        }
                        half3 productValue738 = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (intermediateValue647 * 2u) * 6 + 0));
                        half scalarValue112 = productValue738.x;
                        half scalarValue113 = productValue738.y;
                        half scalarValue114 = productValue738.z;
                        float sumValue607 = float(scalarValue112) - sumValue209;
                        float sumValue608 = float(scalarValue113) - sumValue212;
                        float sumValue609 = float(scalarValue114) - sumValue215;
                        intermediateValue278 = 1.0f / (viewCbConstants[96u].z * dot(float3(sumValue607, sumValue608, sumValue609), float3(sumValue607, sumValue608, sumValue609)));
                        intermediateValue280 = productValue1076;
                        intermediateValue629 = rdByteLoad_inputLightsBuffer_uint(0u, ((intermediateValue647 * 3u) + 2u) * 4 + 0);
                        intermediateValue630 = scalarValue112;
                        intermediateValue632 = scalarValue113;
                        intermediateValue634 = scalarValue114;
                    }
                    float branchMergedValue34;
                    float branchMergedValue89;
                    float branchMergedValue90;
                    float branchMergedValue91;
                    uint branchMergedValue92;
                    float branchMergedValue93;
                    float branchMergedValue94;
                    float branchMergedValue95;
                    uint branchMergedValue96;
                    if (comparisonValue85)
                    {
                        branchMergedValue34 = intermediateValue278;
                        branchMergedValue89 = 0.0f;
                        branchMergedValue90 = 0.0f;
                        branchMergedValue91 = 0.0f;
                        branchMergedValue92 = 0u;
                        branchMergedValue93 = 0.0f;
                        branchMergedValue94 = 0.0f;
                        branchMergedValue95 = 0.0f;
                        branchMergedValue96 = intermediateValue280;
                    }
                    else
                    {
                        float comparisonValue86 = (int(intermediateValue629) < int(0u)) ? 0.23000000417232513427734375f : 0.115000002086162567138671875f;
                        uint productValue739 = (intermediateValue280 * 1664525u) + 1013904223u;
                        float bitwiseValue214 = float(productValue739 & 16777215u);
                        float productValue740 = bitwiseValue214 * 0.002414158545434474945068359375f;
                        float productValue741 = (productValue740 - floor(productValue740)) * 6.283185482025146484375f;
                        float productValue742 = 0.9999847412109375f - (bitwiseValue214 * 1.1920928955078125e-07f);
                        float clampedValue15 = sqrt(clamp(1.0f - (productValue742 * productValue742), 0.0f, 1.0f)) * comparisonValue86;
                        float wavePhaseValue11 = clampedValue15 * cos(productValue741);
                        float wavePhaseValue12 = sin(productValue741) * clampedValue15;
                        float productValue743 = productValue742 * comparisonValue86;
                        bool dotProductValue30 = dot(float3(wavePhaseValue11, wavePhaseValue12, productValue743), float3(float(intermediateValue630) - sumValue209, float(intermediateValue632) - sumValue212, float(intermediateValue634) - sumValue215)) > 0.0f;
                        float comparisonValue88 = float(half(dotProductValue30 ? ((-0.0f) - wavePhaseValue11) : wavePhaseValue11) + intermediateValue630) - sumValue209;
                        float comparisonValue89 = float(half(dotProductValue30 ? ((-0.0f) - wavePhaseValue12) : wavePhaseValue12) + intermediateValue632) - sumValue212;
                        float comparisonValue90 = float(half(dotProductValue30 ? ((-0.0f) - productValue743) : productValue743) + intermediateValue634) - sumValue215;
                        float inverseLengthValue24 = rsqrt(dot(float3(comparisonValue88, comparisonValue89, comparisonValue90), float3(comparisonValue88, comparisonValue89, comparisonValue90)));
                        float productValue744 = comparisonValue88 * inverseLengthValue24;
                        float productValue745 = comparisonValue89 * inverseLengthValue24;
                        float productValue746 = comparisonValue90 * inverseLengthValue24;
                        RayDesc _15ident = {float3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0f, float3(productValue744, productValue745, productValue746), sqrt(((comparisonValue88 * comparisonValue88) + (comparisonValue89 * comparisonValue89)) + (comparisonValue90 * comparisonValue90)) + (-0.00999999977648258209228515625f)};
                        intermediateValue639.TraceRayInline(SceneBVH, 512u, 2u, _15ident);
                        bool conditionValue20 = intermediateValue639.Proceed();
                        if (conditionValue20)
                        {
                            bool intermediateValue659;
                            bool comparisonValue139;
                            for (;;)
                            {
                                uint scalarValue115 = intermediateValue639.CandidateType();
                                comparisonValue139 = scalarValue115 == 0u;
                                if (comparisonValue139)
                                {
                                    float2 vectorValue16 = intermediateValue639.CandidateTriangleBarycentrics();
                                    float2 vectorValue17 = intermediateValue639.CandidateTriangleBarycentrics();
                                    uint scalarValue116 = intermediateValue639.CandidatePrimitiveIndex();
                                    uint scalarValue117 = intermediateValue639.CandidateInstanceID();
                                    uint scalarValue118 = intermediateValue639.CandidateInstanceIndex();
                                    uint productValue747 = (scalarValue118 * 76u) + 58u;
                                    uint productValue748 = (scalarValue118 * 76u) + 61u;
                                    precise float sumValue610 = 1.0f - vectorValue16.x;
                                    precise float sumValue611 = sumValue610 - vectorValue17.y;
                                    uint bitwiseValue215 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue118 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue116 >> 1u);
                                    uint productValue749 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue118 * 76u) + 54u) * 2 + 0)) + 0u;
                                    bool comparisonValue91 = (scalarValue116 & 1u) == 0u;
                                    uint comparisonValue92 = comparisonValue91 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue749), bitwiseValue215 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue749), bitwiseValue215 * 16 + 0).x;
                                    uint comparisonValue93 = comparisonValue91 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue749), bitwiseValue215 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue749), bitwiseValue215 * 16 + 0).w;
                                    uint comparisonValue94 = comparisonValue91 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue749), bitwiseValue215 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue749), bitwiseValue215 * 16 + 0).z;
                                    bool productValue750 = rdByteLoad_objectInstances_uint16_t(0u, productValue748 * 2 + 0) < 0u;
                                    float intermediateValue660;
                                    float intermediateValue661;
                                    if (productValue750)
                                    {
                                        uint bitwiseValue216 = comparisonValue94 >> 15u;
                                        precise float bitwiseValue217 = float(bitwiseValue216 & 1u) * 2.0f;
                                        precise float sumValue612 = bitwiseValue217 + (-1.0f);
                                        precise float bitwiseValue218 = float(comparisonValue94 >> 31u) * 2.0f;
                                        precise float sumValue613 = bitwiseValue218 + (-1.0f);
                                        precise float bitwiseValue219 = float((comparisonValue94 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue220 = float(bitwiseValue216 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue751 = sumValue612 * 3.0517578125e-05f;
                                        precise float productValue752 = sumValue613 * 3.0517578125e-05f;
                                        precise float sumValue614 = bitwiseValue219 + productValue751;
                                        precise float sumValue615 = bitwiseValue220 + productValue752;
                                        intermediateValue660 = sumValue614;
                                        intermediateValue661 = sumValue615;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue221 = float(comparisonValue94 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue222 = float(comparisonValue94 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue753 = bitwiseValue221 * 16384.0f;
                                        precise float sumValue616 = productValue753 + 0.5f;
                                        precise float productValue754 = bitwiseValue222 * 16384.0f;
                                        precise float sumValue617 = productValue754 + 0.5f;
                                        precise float productValue755 = floor(sumValue616) * 6.103515625e-05f;
                                        precise float productValue756 = floor(sumValue617) * 6.103515625e-05f;
                                        intermediateValue660 = productValue755;
                                        intermediateValue661 = productValue756;
                                    }
                                    precise float productValue757 = sumValue611 * intermediateValue660;
                                    precise float productValue758 = sumValue611 * intermediateValue661;
                                    precise float sumValue618 = productValue757 + 0.0f;
                                    precise float sumValue619 = productValue758 + 0.0f;
                                    float intermediateValue662;
                                    float intermediateValue663;
                                    if (productValue750)
                                    {
                                        uint bitwiseValue223 = comparisonValue93 >> 15u;
                                        precise float bitwiseValue224 = float(bitwiseValue223 & 1u) * 2.0f;
                                        precise float sumValue620 = bitwiseValue224 + (-1.0f);
                                        precise float bitwiseValue225 = float(comparisonValue93 >> 31u) * 2.0f;
                                        precise float sumValue621 = bitwiseValue225 + (-1.0f);
                                        precise float bitwiseValue226 = float((comparisonValue93 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue227 = float(bitwiseValue223 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue759 = sumValue620 * 3.0517578125e-05f;
                                        precise float productValue760 = sumValue621 * 3.0517578125e-05f;
                                        precise float sumValue622 = bitwiseValue226 + productValue759;
                                        precise float sumValue623 = bitwiseValue227 + productValue760;
                                        intermediateValue662 = sumValue622;
                                        intermediateValue663 = sumValue623;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue228 = float(comparisonValue93 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue229 = float(comparisonValue93 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue761 = bitwiseValue228 * 16384.0f;
                                        precise float sumValue624 = productValue761 + 0.5f;
                                        precise float productValue762 = bitwiseValue229 * 16384.0f;
                                        precise float sumValue625 = productValue762 + 0.5f;
                                        precise float productValue763 = floor(sumValue624) * 6.103515625e-05f;
                                        precise float productValue764 = floor(sumValue625) * 6.103515625e-05f;
                                        intermediateValue662 = productValue763;
                                        intermediateValue663 = productValue764;
                                    }
                                    precise float productValue765 = vectorValue16.x * intermediateValue662;
                                    precise float productValue766 = vectorValue16.x * intermediateValue663;
                                    precise float sumValue626 = sumValue618 + productValue765;
                                    precise float sumValue627 = sumValue619 + productValue766;
                                    float intermediateValue664;
                                    float intermediateValue665;
                                    if (productValue750)
                                    {
                                        uint bitwiseValue230 = comparisonValue92 >> 15u;
                                        precise float bitwiseValue231 = float(bitwiseValue230 & 1u) * 2.0f;
                                        precise float sumValue628 = bitwiseValue231 + (-1.0f);
                                        precise float bitwiseValue232 = float(comparisonValue92 >> 31u) * 2.0f;
                                        precise float sumValue629 = bitwiseValue232 + (-1.0f);
                                        precise float bitwiseValue233 = float((comparisonValue92 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue234 = float(bitwiseValue230 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue767 = sumValue628 * 3.0517578125e-05f;
                                        precise float productValue768 = sumValue629 * 3.0517578125e-05f;
                                        precise float sumValue630 = bitwiseValue233 + productValue767;
                                        precise float sumValue631 = bitwiseValue234 + productValue768;
                                        intermediateValue664 = sumValue630;
                                        intermediateValue665 = sumValue631;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue235 = float(comparisonValue92 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue236 = float(comparisonValue92 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue769 = bitwiseValue235 * 16384.0f;
                                        precise float sumValue633 = productValue769 + 0.5f;
                                        precise float productValue770 = bitwiseValue236 * 16384.0f;
                                        precise float sumValue634 = productValue770 + 0.5f;
                                        precise float productValue771 = floor(sumValue633) * 6.103515625e-05f;
                                        precise float productValue772 = floor(sumValue634) * 6.103515625e-05f;
                                        intermediateValue664 = productValue771;
                                        intermediateValue665 = productValue772;
                                    }
                                    precise float productValue773 = vectorValue17.y * intermediateValue664;
                                    precise float productValue774 = vectorValue17.y * intermediateValue665;
                                    precise float sumValue635 = sumValue626 + productValue773;
                                    precise float sumValue636 = sumValue627 + productValue774;
                                    float intermediateValue666;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue747 * 2 + 0) == 65535u)
                                    {
                                        intermediateValue666 = 1.0f;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits52;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue747 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits52 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits52 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue747 * 2 + 0));
                                        }
                                        intermediateValue666 = textures[NonUniformResourceIndex(reinterpretedBits52 + 0u)].SampleLevel(defaultSampler, float2(sumValue635, sumValue636), -0.25f).w;
                                    }
                                    uint comparisonValue144;
                                    if (scalarValue117 == 2u)
                                    {
                                        comparisonValue144 = 0u;
                                    }
                                    else
                                    {
                                        comparisonValue144 = uint(intermediateValue666 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue748 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                    }
                                    if (comparisonValue144 == 0u)
                                    {
                                        intermediateValue639.CommitNonOpaqueTriangleHit();
                                    }
                                }
                                intermediateValue659 = intermediateValue639.Proceed();
                                if (intermediateValue659)
                                {
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        uint scalarValue119 = intermediateValue639.CommittedStatus();
                        float intermediateValue652;
                        if (scalarValue119 == 1u)
                        {
                            float scalarValue120 = intermediateValue639.CommittedRayT();
                            intermediateValue652 = scalarValue120;
                        }
                        else
                        {
                            intermediateValue652 = 10000.0f;
                        }
                        bool conditionValue21 = !(intermediateValue652 < 10000.0f);
                        uint scalarValue121 = uint(conditionValue21);
                        float branchMergedValue184;
                        float branchMergedValue203;
                        float branchMergedValue204;
                        float branchMergedValue205;
                        uint branchMergedValue206;
                        float branchMergedValue207;
                        float branchMergedValue208;
                        float branchMergedValue209;
                        uint branchMergedValue210;
                        if (conditionValue21)
                        {
                            float bitwiseValue237 = (intermediateValue278 * 0.0392156876623630523681640625f) * float(intermediateValue629 & 255u);
                            float productValue775 = bitwiseValue237 * 0.00117647065781056880950927734375f;
                            branchMergedValue184 = intermediateValue278;
                            branchMergedValue203 = productValue775 * float((intermediateValue629 >> 8u) & 255u);
                            branchMergedValue204 = productValue775 * float((intermediateValue629 >> 16u) & 255u);
                            branchMergedValue205 = (float((intermediateValue629 >> 24u) & 127u) * 0.00236220471560955047607421875f) * bitwiseValue237;
                            branchMergedValue206 = scalarValue121;
                            branchMergedValue207 = productValue746;
                            branchMergedValue208 = productValue745;
                            branchMergedValue209 = productValue744;
                            branchMergedValue210 = productValue739;
                        }
                        else
                        {
                            branchMergedValue184 = intermediateValue278;
                            branchMergedValue203 = 0.0f;
                            branchMergedValue204 = 0.0f;
                            branchMergedValue205 = 0.0f;
                            branchMergedValue206 = scalarValue121;
                            branchMergedValue207 = productValue746;
                            branchMergedValue208 = productValue745;
                            branchMergedValue209 = productValue744;
                            branchMergedValue210 = productValue739;
                        }
                        branchMergedValue34 = branchMergedValue184;
                        branchMergedValue89 = branchMergedValue203;
                        branchMergedValue90 = branchMergedValue204;
                        branchMergedValue91 = branchMergedValue205;
                        branchMergedValue92 = branchMergedValue206;
                        branchMergedValue93 = branchMergedValue207;
                        branchMergedValue94 = branchMergedValue208;
                        branchMergedValue95 = branchMergedValue209;
                        branchMergedValue96 = branchMergedValue210;
                    }
                    intermediateValue270 = branchMergedValue95;
                    intermediateValue271 = branchMergedValue94;
                    intermediateValue272 = branchMergedValue93;
                    intermediateValue273 = branchMergedValue92;
                    intermediateValue275 = branchMergedValue91;
                    intermediateValue276 = branchMergedValue90;
                    intermediateValue277 = branchMergedValue89;
                    intermediateValue45 = branchMergedValue34;
                    intermediateValue279 = branchMergedValue96;
                }
                float intermediateValue291;
                float intermediateValue292;
                float intermediateValue293;
                if (intermediateValue273 == 0u)
                {
                    intermediateValue291 = productValue434;
                    intermediateValue292 = productValue435;
                    intermediateValue293 = productValue436;
                }
                else
                {
                    float branchMergedValue35;
                    float branchMergedValue97;
                    float branchMergedValue98;
                    if (dot(float3(comparisonValue15, comparisonValue16, comparisonValue17), float3(intermediateValue270, intermediateValue271, intermediateValue272)) > 0.0f)
                    {
                        float scalarValue122 = max(intermediateValue262, 0.00999999977648258209228515625f);
                        float sumValue637 = intermediateValue270 - intermediateValue77;
                        float sumValue638 = intermediateValue271 - intermediateValue79;
                        float sumValue639 = intermediateValue272 - intermediateValue81;
                        float inverseLengthValue25 = rsqrt(dot(float3(sumValue637, sumValue638, sumValue639), float3(sumValue637, sumValue638, sumValue639)));
                        float productValue776 = inverseLengthValue25 * sumValue637;
                        float productValue777 = inverseLengthValue25 * sumValue638;
                        float productValue778 = inverseLengthValue25 * sumValue639;
                        float clampedValue16 = clamp(dot(float3(intermediateValue219, intermediateValue221, intermediateValue223), float3(intermediateValue270, intermediateValue271, intermediateValue272)), 0.0f, 1.0f);
                        float clampedValue17 = clamp(dot(float3(intermediateValue219, intermediateValue221, intermediateValue223), float3(sumValue402, sumValue403, sumValue404)), 0.0f, 1.0f);
                        float clampedValue18 = clamp(dot(float3(intermediateValue219, intermediateValue221, intermediateValue223), float3(productValue776, productValue777, productValue778)), 0.0f, 1.0f);
                        float clampedValue19 = clamp(dot(float3(sumValue402, sumValue403, sumValue404), float3(productValue776, productValue777, productValue778)), 0.0f, 1.0f);
                        float productValue779 = scalarValue122 * scalarValue122;
                        float productValue780 = productValue779 * productValue779;
                        float productValue781 = (((clampedValue18 * productValue780) - clampedValue18) * clampedValue18) + 1.0f;
                        float productValue782 = productValue779 * 0.5f;
                        float sumValue640 = 1.0f - productValue782;
                        float clampedValue20 = clamp(dot(float3(intermediateValue225, intermediateValue226, intermediateValue227), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
                        float clampedValue21 = exp2(log2(clamp(1.0f - clampedValue19, 0.0f, 1.0f)) * 5.0f);
                        float productValue783 = (clampedValue21 * (clampedValue20 - intermediateValue225)) + intermediateValue225;
                        float productValue784 = (clampedValue21 * (clampedValue20 - intermediateValue226)) + intermediateValue226;
                        float productValue785 = (clampedValue21 * (clampedValue20 - intermediateValue227)) + intermediateValue227;
                        float productValue786 = ((clampedValue19 * clampedValue19) * (scalarValue122 * 2.0f)) + (-0.5f);
                        float quotientValue31 = ((productValue780 / ((productValue781 * productValue781) + 1.0000000133514319600180897396058e-10f)) * 0.3183098733425140380859375f) * (0.25f / ((((clampedValue17 * sumValue640) + productValue782) * ((clampedValue16 * sumValue640) + productValue782)) + 1.0000000133514319600180897396058e-10f));
                        float clampedValue22 = ((intermediateValue216 * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue17, 0.0f, 1.0f)) * 5.0f) * productValue786) + 1.0f)) * ((exp2(log2(clamp(1.0f - clampedValue16, 0.0f, 1.0f)) * 5.0f) * productValue786) + 1.0f);
                        branchMergedValue35 = (((intermediateValue277 * intermediateValue239) * clampedValue16) * ((((1.0f - productValue785) * intermediateValue230) * clampedValue22) + (productValue785 * quotientValue31))) + productValue436;
                        branchMergedValue97 = (((intermediateValue276 * intermediateValue238) * clampedValue16) * ((((1.0f - productValue784) * intermediateValue229) * clampedValue22) + (productValue784 * quotientValue31))) + productValue435;
                        branchMergedValue98 = (((intermediateValue275 * intermediateValue237) * clampedValue16) * ((((1.0f - productValue783) * intermediateValue228) * clampedValue22) + (productValue783 * quotientValue31))) + productValue434;
                    }
                    else
                    {
                        branchMergedValue35 = productValue436;
                        branchMergedValue97 = productValue435;
                        branchMergedValue98 = productValue434;
                    }
                    intermediateValue291 = branchMergedValue98;
                    intermediateValue292 = branchMergedValue97;
                    intermediateValue293 = branchMergedValue35;
                }
                bool dotProductValue31 = dot(float3(0.847100675106048583984375f, 0.2079117000102996826171875f, 0.489073812961578369140625f), float3(intermediateValue219, intermediateValue221, intermediateValue223)) > 0.949999988079071044921875f;
                float comparisonValue95 = dotProductValue31 ? (-0.639436304569244384765625f) : 0.847100675106048583984375f;
                float comparisonValue96 = dotProductValue31 ? (-0.3907311260700225830078125f) : 0.2079117000102996826171875f;
                float comparisonValue97 = dotProductValue31 ? 0.6621558666229248046875f : 0.489073812961578369140625f;
                precise float dotProductValue32 = dot(float3(comparisonValue95, comparisonValue96, comparisonValue97), float3(intermediateValue219, intermediateValue221, intermediateValue223));
                precise float productValue787 = intermediateValue219 * dotProductValue32;
                precise float productValue788 = intermediateValue221 * dotProductValue32;
                precise float productValue789 = intermediateValue223 * dotProductValue32;
                precise float sumValue641 = comparisonValue95 - productValue787;
                precise float sumValue642 = comparisonValue96 - productValue788;
                precise float sumValue643 = comparisonValue97 - productValue789;
                float inverseLengthValue26 = rsqrt(dot(float3(sumValue641, sumValue642, sumValue643), float3(sumValue641, sumValue642, sumValue643)));
                precise float productValue790 = sumValue641 * inverseLengthValue26;
                precise float productValue791 = sumValue642 * inverseLengthValue26;
                precise float productValue792 = sumValue643 * inverseLengthValue26;
                precise float productValue793 = intermediateValue221 * productValue792;
                precise float productValue794 = intermediateValue223 * productValue791;
                precise float sumValue644 = productValue793 - productValue794;
                precise float productValue795 = intermediateValue223 * productValue790;
                precise float productValue796 = intermediateValue219 * productValue792;
                precise float sumValue645 = productValue795 - productValue796;
                precise float productValue797 = intermediateValue219 * productValue791;
                precise float productValue798 = intermediateValue221 * productValue790;
                precise float sumValue646 = productValue797 - productValue798;
                precise float productValue799 = intermediateValue262 * intermediateValue262;
                precise float sumValue647 = intermediateValue219 - intermediateValue77;
                precise float sumValue648 = intermediateValue221 - intermediateValue79;
                precise float sumValue649 = intermediateValue223 - intermediateValue81;
                precise float sumValue650 = sumValue647 - intermediateValue219;
                precise float sumValue651 = sumValue648 - intermediateValue221;
                precise float sumValue652 = sumValue649 - intermediateValue223;
                precise float productValue800 = sumValue650 * productValue799;
                precise float productValue801 = sumValue651 * productValue799;
                precise float productValue802 = sumValue652 * productValue799;
                precise float sumValue653 = intermediateValue219 + productValue800;
                precise float sumValue654 = intermediateValue221 + productValue801;
                precise float sumValue655 = intermediateValue223 + productValue802;
                float inverseLengthValue27 = rsqrt(dot(float3(sumValue653, sumValue654, sumValue655), float3(sumValue653, sumValue654, sumValue655)));
                precise float productValue803 = sumValue653 * inverseLengthValue27;
                precise float productValue804 = sumValue654 * inverseLengthValue27;
                precise float productValue805 = sumValue655 * inverseLengthValue27;
                precise float sumValue656 = intermediateValue231 + (-0.039999999105930328369140625f);
                precise float sumValue657 = intermediateValue232 + (-0.039999999105930328369140625f);
                precise float sumValue658 = intermediateValue233 + (-0.039999999105930328369140625f);
                precise float productValue806 = intermediateValue217 * sumValue656;
                precise float productValue807 = intermediateValue217 * sumValue657;
                precise float productValue808 = intermediateValue217 * sumValue658;
                precise float sumValue659 = productValue806 + 0.039999999105930328369140625f;
                precise float sumValue660 = productValue807 + 0.039999999105930328369140625f;
                precise float sumValue661 = productValue808 + 0.039999999105930328369140625f;
                precise float dotProductValue33 = dot(float3(sumValue659, sumValue660, sumValue661), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f;
                float clampedValue23 = clamp(dotProductValue33, 0.0f, 1.0f);
                precise float sumValue662 = clampedValue23 - sumValue659;
                precise float sumValue663 = clampedValue23 - sumValue660;
                precise float sumValue664 = clampedValue23 - sumValue661;
                precise float dotProductValue34 = 1.0f - dot(float3(sumValue402, sumValue403, sumValue404), float3(productValue803, productValue804, productValue805));
                precise float clampedValue24 = log2(clamp(dotProductValue34, 0.0f, 1.0f)) * 5.0f;
                float exponentialValue8 = exp2(clampedValue24);
                precise float productValue809 = sumValue662 * exponentialValue8;
                precise float productValue810 = sumValue663 * exponentialValue8;
                precise float productValue811 = sumValue664 * exponentialValue8;
                precise float sumValue665 = sumValue659 + productValue809;
                precise float sumValue666 = sumValue660 + productValue810;
                precise float sumValue667 = sumValue661 + productValue811;
                precise float dotProductValue35 = dot(float3(sumValue665, sumValue666, sumValue667), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                precise float dotProductValue36 = dot(float3(sumValue398, sumValue399, sumValue400), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                uint4 reinterpretedBits33 = asuint(viewCbConstants[91u]);
                uint scalarValue123 = reinterpretedBits33.z;
                float intermediateValue309;
                float intermediateValue310;
                float intermediateValue311;
                float intermediateValue312;
                float intermediateValue313;
                if ((intermediateValue111 == 0u) && (scalarValue123 != 0u))
                {
                    float branchMergedValue36;
                    float branchMergedValue99;
                    float branchMergedValue100;
                    float branchMergedValue101;
                    float branchMergedValue102;
                    float branchMergedValue103;
                    float branchMergedValue104;
                    float branchMergedValue105;
                    if (scalarValue123 == 3u)
                    {
                        branchMergedValue36 = 1.0f;
                        branchMergedValue99 = dotProductValue35;
                        branchMergedValue100 = 1.0f;
                        branchMergedValue101 = 1.0f;
                        branchMergedValue102 = 1.0f;
                        branchMergedValue103 = 0.0f;
                        branchMergedValue104 = 0.0f;
                        branchMergedValue105 = 0.0f;
                    }
                    else
                    {
                        float branchMergedValue185;
                        float branchMergedValue211;
                        float branchMergedValue212;
                        float branchMergedValue213;
                        float branchMergedValue214;
                        float branchMergedValue215;
                        float branchMergedValue216;
                        float branchMergedValue217;
                        if (scalarValue123 == 1u)
                        {
                            branchMergedValue185 = 0.0f;
                            branchMergedValue211 = 0.0f;
                            branchMergedValue212 = 1.0f;
                            branchMergedValue213 = 1.0f;
                            branchMergedValue214 = 1.0f;
                            branchMergedValue215 = 0.0f;
                            branchMergedValue216 = 0.0f;
                            branchMergedValue217 = 0.0f;
                        }
                        else
                        {
                            bool comparisonValue98 = scalarValue123 == 2u;
                            branchMergedValue185 = comparisonValue98 ? 0.0f : dotProductValue36;
                            branchMergedValue211 = comparisonValue98 ? 1.0f : dotProductValue35;
                            branchMergedValue212 = 1.0f;
                            branchMergedValue213 = 1.0f;
                            branchMergedValue214 = 1.0f;
                            branchMergedValue215 = 0.0f;
                            branchMergedValue216 = 0.0f;
                            branchMergedValue217 = 0.0f;
                        }
                        branchMergedValue36 = branchMergedValue185;
                        branchMergedValue99 = branchMergedValue211;
                        branchMergedValue100 = branchMergedValue212;
                        branchMergedValue101 = branchMergedValue213;
                        branchMergedValue102 = branchMergedValue214;
                        branchMergedValue103 = branchMergedValue215;
                        branchMergedValue104 = branchMergedValue216;
                        branchMergedValue105 = branchMergedValue217;
                    }
                    intermediateValue94 = branchMergedValue105;
                    intermediateValue96 = branchMergedValue104;
                    intermediateValue98 = branchMergedValue103;
                    intermediateValue309 = branchMergedValue102;
                    intermediateValue310 = branchMergedValue101;
                    intermediateValue311 = branchMergedValue100;
                    intermediateValue312 = branchMergedValue99;
                    intermediateValue313 = branchMergedValue36;
                }
                else
                {
                    intermediateValue94 = intermediateValue291;
                    intermediateValue96 = intermediateValue292;
                    intermediateValue98 = intermediateValue293;
                    intermediateValue309 = intermediateValue237;
                    intermediateValue310 = intermediateValue238;
                    intermediateValue311 = intermediateValue239;
                    intermediateValue312 = dotProductValue35;
                    intermediateValue313 = dotProductValue36;
                }
                uint productValue812 = (intermediateValue279 * 1664525u) + 1013904223u;
                precise float bitwiseValue238 = float(productValue812 & 16777215u) * 5.9604644775390625e-08f;
                uint productValue813 = (productValue812 * 1664525u) + 1013904223u;
                precise float bitwiseValue239 = float(productValue813 & 16777215u) * 5.9604644775390625e-08f;
                uint intermediateValue498;
                float intermediateValue499;
                float intermediateValue500;
                float intermediateValue501;
                if (!(intermediateValue312 <= bitwiseValue238))
                {
                    precise float quotientValue32 = intermediateValue309 / intermediateValue312;
                    precise float quotientValue33 = intermediateValue310 / intermediateValue312;
                    precise float quotientValue34 = intermediateValue311 / intermediateValue312;
                    uint productValue814 = (productValue813 * 1664525u) + 1013904223u;
                    precise float bitwiseValue240 = float(productValue814 & 16777215u) * 5.9604644775390625e-08f;
                    float intermediateValue382;
                    float intermediateValue383;
                    float intermediateValue384;
                    float intermediateValue385;
                    float intermediateValue386;
                    float intermediateValue387;
                    bool intermediateValue388;
                    if (intermediateValue218 == 0.0f)
                    {
                        precise float scalarValue124 = dot(float3(intermediateValue77, intermediateValue79, intermediateValue81), float3(intermediateValue219, intermediateValue221, intermediateValue223)) * 2.0f;
                        precise float productValue815 = intermediateValue219 * scalarValue124;
                        precise float productValue816 = intermediateValue221 * scalarValue124;
                        precise float productValue817 = intermediateValue223 * scalarValue124;
                        precise float sumValue668 = intermediateValue77 - productValue815;
                        precise float sumValue669 = intermediateValue79 - productValue816;
                        precise float sumValue670 = intermediateValue81 - productValue817;
                        intermediateValue382 = sumValue668;
                        intermediateValue383 = sumValue669;
                        intermediateValue384 = sumValue670;
                        intermediateValue385 = sumValue665;
                        intermediateValue386 = sumValue666;
                        intermediateValue387 = sumValue667;
                        intermediateValue388 = false;
                    }
                    else
                    {
                        precise float productValue818 = intermediateValue218 * intermediateValue218;
                        float scalarValue125 = max(0.001000000047497451305389404296875f, productValue818);
                        precise float dotProductValue37 = dot(float3(0.0f, 0.0f, 1.0f), float3(intermediateValue219, intermediateValue221, intermediateValue223));
                        bool conditionValue22 = dotProductValue37 < 0.0f;
                        float comparisonValue99 = conditionValue22 ? (-0.0f) : 0.0f;
                        float comparisonValue100 = conditionValue22 ? (-1.0f) : 1.0f;
                        precise float productValue819 = intermediateValue223 * comparisonValue99;
                        precise float productValue820 = intermediateValue221 * comparisonValue100;
                        precise float sumValue671 = productValue819 - productValue820;
                        precise float productValue821 = intermediateValue219 * comparisonValue100;
                        precise float productValue822 = intermediateValue223 * 0.0f;
                        precise float sumValue672 = productValue821 - productValue822;
                        precise float productValue823 = intermediateValue221 * 0.0f;
                        precise float productValue824 = intermediateValue219 * comparisonValue99;
                        precise float sumValue673 = productValue823 - productValue824;
                        precise float sumValue674 = abs(dotProductValue37) + 1.0f;
                        precise float productValue825 = sumValue674 * 0.5f;
                        float nonlinearValue15 = sqrt(productValue825);
                        precise float productValue826 = nonlinearValue15 * 2.0f;
                        precise float quotientValue35 = sumValue671 / productValue826;
                        precise float quotientValue36 = sumValue672 / productValue826;
                        precise float quotientValue37 = sumValue673 / productValue826;
                        float intermediateValue389;
                        float intermediateValue390;
                        float intermediateValue391;
                        float intermediateValue392;
                        if (conditionValue22)
                        {
                            precise float sumValue675 = (-0.0f) - quotientValue36;
                            precise float sumValue676 = (-0.0f) - quotientValue35;
                            intermediateValue389 = nonlinearValue15;
                            intermediateValue390 = quotientValue37;
                            intermediateValue391 = sumValue675;
                            intermediateValue392 = sumValue676;
                        }
                        else
                        {
                            intermediateValue389 = quotientValue35;
                            intermediateValue390 = quotientValue36;
                            intermediateValue391 = quotientValue37;
                            intermediateValue392 = nonlinearValue15;
                        }
                        precise float sumValue677 = (-0.0f) - intermediateValue389;
                        precise float sumValue678 = (-0.0f) - intermediateValue390;
                        precise float sumValue679 = (-0.0f) - intermediateValue391;
                        precise float productValue827 = intermediateValue81 * intermediateValue390;
                        precise float productValue828 = intermediateValue79 * intermediateValue391;
                        precise float sumValue680 = productValue827 - productValue828;
                        precise float productValue829 = intermediateValue77 * intermediateValue391;
                        precise float productValue830 = intermediateValue81 * intermediateValue389;
                        precise float sumValue681 = productValue829 - productValue830;
                        precise float productValue831 = intermediateValue79 * intermediateValue389;
                        precise float productValue832 = intermediateValue77 * intermediateValue390;
                        precise float sumValue682 = productValue831 - productValue832;
                        precise float productValue833 = intermediateValue392 * sumValue402;
                        precise float productValue834 = intermediateValue392 * sumValue403;
                        precise float productValue835 = intermediateValue392 * sumValue404;
                        precise float sumValue683 = sumValue680 + productValue833;
                        precise float sumValue684 = sumValue681 + productValue834;
                        precise float sumValue685 = sumValue682 + productValue835;
                        precise float productValue836 = sumValue685 * sumValue678;
                        precise float productValue837 = sumValue684 * sumValue679;
                        precise float sumValue686 = productValue836 - productValue837;
                        precise float productValue838 = sumValue683 * sumValue679;
                        precise float productValue839 = sumValue685 * sumValue677;
                        precise float sumValue687 = productValue838 - productValue839;
                        precise float productValue840 = sumValue684 * sumValue677;
                        precise float productValue841 = sumValue683 * sumValue678;
                        precise float sumValue688 = productValue840 - productValue841;
                        precise float productValue842 = sumValue686 * 2.0f;
                        precise float productValue843 = sumValue687 * 2.0f;
                        precise float productValue844 = sumValue688 * 2.0f;
                        precise float sumValue689 = productValue842 - intermediateValue77;
                        precise float sumValue690 = productValue843 - intermediateValue79;
                        precise float sumValue691 = productValue844 - intermediateValue81;
                        precise float productValue845 = scalarValue125 * sumValue689;
                        precise float productValue846 = scalarValue125 * sumValue690;
                        float inverseLengthValue28 = rsqrt(dot(float3(productValue845, productValue846, sumValue691), float3(productValue845, productValue846, sumValue691)));
                        precise float productValue847 = inverseLengthValue28 * productValue845;
                        precise float productValue848 = inverseLengthValue28 * productValue846;
                        precise float productValue849 = inverseLengthValue28 * sumValue691;
                        bool conditionValue23 = productValue849 < 0.99989998340606689453125f;
                        precise float productValue850 = productValue849 * 0.0f;
                        precise float sumValue692 = productValue850 - productValue848;
                        precise float sumValue693 = productValue847 - productValue850;
                        precise float productValue851 = productValue848 * 0.0f;
                        precise float productValue852 = productValue847 * 0.0f;
                        precise float sumValue694 = productValue851 - productValue852;
                        float inverseLengthValue29 = rsqrt(dot(float3(sumValue692, sumValue693, sumValue694), float3(sumValue692, sumValue693, sumValue694)));
                        precise float productValue853 = inverseLengthValue29 * sumValue692;
                        precise float productValue854 = inverseLengthValue29 * sumValue693;
                        precise float productValue855 = inverseLengthValue29 * sumValue694;
                        float comparisonValue101 = conditionValue23 ? productValue853 : 1.0f;
                        float comparisonValue102 = conditionValue23 ? productValue854 : 0.0f;
                        float comparisonValue103 = conditionValue23 ? productValue855 : 0.0f;
                        precise float productValue856 = productValue848 * comparisonValue103;
                        precise float productValue857 = productValue849 * comparisonValue102;
                        precise float sumValue695 = productValue856 - productValue857;
                        precise float productValue858 = productValue849 * comparisonValue101;
                        precise float productValue859 = productValue847 * comparisonValue103;
                        precise float sumValue696 = productValue858 - productValue859;
                        precise float productValue860 = productValue847 * comparisonValue102;
                        precise float productValue861 = productValue848 * comparisonValue101;
                        precise float sumValue697 = productValue860 - productValue861;
                        float nonlinearValue16 = sqrt(bitwiseValue239);
                        precise float productValue862 = bitwiseValue240 * 6.283185482025146484375f;
                        precise float wavePhaseValue13 = nonlinearValue16 * cos(productValue862);
                        precise float wavePhaseValue14 = nonlinearValue16 * sin(productValue862);
                        precise float sumValue698 = productValue849 + 1.0f;
                        precise float productValue863 = sumValue698 * 0.5f;
                        precise float sumValue699 = (-0.0f) - wavePhaseValue13;
                        precise float productValue864 = sumValue699 * wavePhaseValue13;
                        precise float sumValue700 = productValue864 + 1.0f;
                        float nonlinearValue17 = sqrt(max(sumValue700, 0.0f));
                        precise float sumValue701 = wavePhaseValue14 - nonlinearValue17;
                        precise float productValue865 = productValue863 * sumValue701;
                        precise float sumValue702 = nonlinearValue17 + productValue865;
                        precise float productValue866 = wavePhaseValue13 * comparisonValue101;
                        precise float productValue867 = wavePhaseValue13 * comparisonValue102;
                        precise float productValue868 = wavePhaseValue13 * comparisonValue103;
                        precise float productValue869 = sumValue702 * sumValue695;
                        precise float productValue870 = sumValue702 * sumValue696;
                        precise float productValue871 = sumValue702 * sumValue697;
                        precise float sumValue703 = productValue866 + productValue869;
                        precise float sumValue704 = productValue867 + productValue870;
                        precise float sumValue705 = productValue868 + productValue871;
                        precise float sumValue706 = (-0.0f) - sumValue702;
                        precise float productValue872 = sumValue706 * sumValue702;
                        precise float sumValue707 = productValue872 + 1.0f;
                        precise float productValue873 = sumValue699 * wavePhaseValue13;
                        precise float sumValue708 = productValue873 + sumValue707;
                        float nonlinearValue18 = sqrt(max(0.0f, sumValue708));
                        precise float productValue874 = productValue847 * nonlinearValue18;
                        precise float productValue875 = productValue848 * nonlinearValue18;
                        precise float productValue876 = productValue849 * nonlinearValue18;
                        precise float sumValue709 = productValue874 + sumValue703;
                        precise float sumValue710 = productValue875 + sumValue704;
                        precise float sumValue712 = sumValue705 + productValue876;
                        precise float productValue877 = scalarValue125 * sumValue709;
                        precise float productValue878 = scalarValue125 * sumValue710;
                        float scalarValue126 = max(0.0f, sumValue712);
                        float inverseLengthValue30 = rsqrt(dot(float3(productValue877, productValue878, scalarValue126), float3(productValue877, productValue878, scalarValue126)));
                        precise float productValue879 = inverseLengthValue30 * productValue877;
                        precise float productValue880 = inverseLengthValue30 * productValue878;
                        precise float productValue881 = scalarValue126 * inverseLengthValue30;
                        precise float sumValue713 = (-0.0f) - sumValue689;
                        precise float sumValue714 = (-0.0f) - sumValue690;
                        precise float sumValue715 = (-0.0f) - sumValue691;
                        precise float dotProductValue38 = dot(float3(sumValue713, sumValue714, sumValue715), float3(productValue879, productValue880, productValue881)) * 2.0f;
                        precise float productValue882 = dotProductValue38 * productValue879;
                        precise float productValue883 = dotProductValue38 * productValue880;
                        precise float productValue884 = productValue881 * dotProductValue38;
                        precise float sumValue716 = sumValue713 - productValue882;
                        precise float sumValue717 = sumValue714 - productValue883;
                        precise float sumValue718 = sumValue715 - productValue884;
                        float clampedValue25 = clamp(dot(float3(productValue879, productValue880, productValue881), float3(sumValue716, sumValue717, sumValue718)), 0.0f, 1.0f);
                        bool branchMergedValue37;
                        float branchMergedValue106;
                        float branchMergedValue107;
                        float branchMergedValue108;
                        float branchMergedValue109;
                        float branchMergedValue110;
                        float branchMergedValue111;
                        if (clampedValue25 < 9.9999997473787516355514526367188e-06f)
                        {
                            branchMergedValue37 = true;
                            branchMergedValue106 = 0.0f;
                            branchMergedValue107 = 0.0f;
                            branchMergedValue108 = 0.0f;
                            branchMergedValue109 = 0.0f;
                            branchMergedValue110 = 0.0f;
                            branchMergedValue111 = 0.0f;
                        }
                        else
                        {
                            precise float productValue885 = scalarValue125 * scalarValue125;
                            precise float sumValue719 = 1.0f - intermediateValue225;
                            precise float sumValue720 = 1.0f - intermediateValue226;
                            precise float sumValue721 = 1.0f - intermediateValue227;
                            precise float sumValue722 = 1.0f - max(0.0f, clampedValue25);
                            precise float nonlinearValue19 = log2(sumValue722) * 5.0f;
                            float exponentialValue9 = exp2(nonlinearValue19);
                            precise float productValue886 = sumValue719 * exponentialValue9;
                            precise float productValue887 = sumValue720 * exponentialValue9;
                            precise float productValue888 = sumValue721 * exponentialValue9;
                            precise float sumValue723 = intermediateValue225 + productValue886;
                            precise float sumValue724 = intermediateValue226 + productValue887;
                            precise float sumValue725 = intermediateValue227 + productValue888;
                            precise float productValue889 = sumValue689 * sumValue689;
                            precise float productValue890 = sumValue690 * sumValue690;
                            precise float productValue891 = sumValue691 * sumValue691;
                            precise float dotProductValue39 = dot(productValue885.xx, float2(productValue889, productValue890)) / productValue891;
                            precise float sumValue726 = dotProductValue39 + 1.0f;
                            precise float nonlinearValue20 = sqrt(sumValue726) * 0.5f;
                            precise float sumValue727 = nonlinearValue20 + 0.5f;
                            precise float quotientValue38 = 1.0f / sumValue727;
                            precise float productValue892 = sumValue716 * sumValue716;
                            precise float productValue893 = sumValue717 * sumValue717;
                            precise float productValue894 = sumValue718 * sumValue718;
                            precise float dotProductValue40 = dot(productValue885.xx, float2(productValue892, productValue893)) / productValue894;
                            precise float sumValue728 = dotProductValue40 + 1.0f;
                            precise float nonlinearValue21 = sqrt(sumValue728) * 0.5f;
                            precise float sumValue729 = nonlinearValue21 + 0.5f;
                            precise float quotientValue39 = 1.0f / sumValue729;
                            precise float sumValue730 = quotientValue38 + quotientValue39;
                            precise float productValue895 = quotientValue38 * quotientValue39;
                            precise float sumValue731 = sumValue730 - productValue895;
                            precise float quotientValue40 = quotientValue39 / sumValue731;
                            precise float productValue896 = sumValue723 * quotientValue40;
                            precise float productValue897 = sumValue724 * quotientValue40;
                            precise float productValue898 = sumValue725 * quotientValue40;
                            precise float productValue899 = intermediateValue390 * sumValue718;
                            precise float productValue900 = intermediateValue391 * sumValue717;
                            precise float sumValue732 = productValue899 - productValue900;
                            precise float productValue901 = intermediateValue391 * sumValue716;
                            precise float productValue902 = intermediateValue389 * sumValue718;
                            precise float sumValue733 = productValue901 - productValue902;
                            precise float productValue903 = intermediateValue389 * sumValue717;
                            precise float productValue904 = intermediateValue390 * sumValue716;
                            precise float sumValue734 = productValue903 - productValue904;
                            precise float productValue905 = intermediateValue392 * sumValue716;
                            precise float productValue906 = intermediateValue392 * sumValue717;
                            precise float productValue907 = intermediateValue392 * sumValue718;
                            precise float sumValue735 = productValue905 + sumValue732;
                            precise float sumValue736 = productValue906 + sumValue733;
                            precise float sumValue737 = productValue907 + sumValue734;
                            precise float productValue908 = intermediateValue390 * sumValue737;
                            precise float productValue909 = intermediateValue391 * sumValue736;
                            precise float sumValue738 = productValue908 - productValue909;
                            precise float productValue910 = intermediateValue391 * sumValue735;
                            precise float productValue911 = intermediateValue389 * sumValue737;
                            precise float sumValue739 = productValue910 - productValue911;
                            precise float productValue912 = intermediateValue389 * sumValue736;
                            precise float productValue913 = intermediateValue390 * sumValue735;
                            precise float sumValue740 = productValue912 - productValue913;
                            precise float productValue914 = sumValue738 * 2.0f;
                            precise float productValue915 = sumValue739 * 2.0f;
                            precise float productValue916 = sumValue740 * 2.0f;
                            precise float sumValue741 = sumValue716 + productValue914;
                            precise float sumValue742 = sumValue717 + productValue915;
                            precise float sumValue743 = sumValue718 + productValue916;
                            branchMergedValue37 = false;
                            branchMergedValue106 = productValue898;
                            branchMergedValue107 = productValue897;
                            branchMergedValue108 = productValue896;
                            branchMergedValue109 = sumValue743;
                            branchMergedValue110 = sumValue742;
                            branchMergedValue111 = sumValue741;
                        }
                        intermediateValue382 = branchMergedValue111;
                        intermediateValue383 = branchMergedValue110;
                        intermediateValue384 = branchMergedValue109;
                        intermediateValue385 = branchMergedValue108;
                        intermediateValue386 = branchMergedValue107;
                        intermediateValue387 = branchMergedValue106;
                        intermediateValue388 = branchMergedValue37;
                    }
                    bool comparisonValue104 = (int(intermediateValue111) > int(0u)) || (scalarValue123 == 0u);
                    precise float productValue917 = quotientValue32 * intermediateValue385;
                    precise float productValue918 = quotientValue33 * intermediateValue386;
                    precise float productValue919 = quotientValue34 * intermediateValue387;
                    float comparisonValue105 = comparisonValue104 ? productValue917 : quotientValue32;
                    float comparisonValue108 = comparisonValue104 ? productValue918 : quotientValue33;
                    float comparisonValue109 = comparisonValue104 ? productValue919 : quotientValue34;
                    if (intermediateValue388)
                    {
                        branchMergedValue = false;
                        branchMergedValue3 = 0.0f;
                        branchMergedValue11 = 0.0f;
                        branchMergedValue12 = 0.0f;
                        branchMergedValue13 = intermediateValue670;
                        branchMergedValue14 = intermediateValue673;
                        branchMergedValue15 = intermediateValue676;
                        break;
                    }
                    RayDesc _16ident = {float3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0f, float3(intermediateValue382, intermediateValue383, intermediateValue384), 10000.0f};
                    intermediateValue406.TraceRayInline(SceneBVH, 512u, 109u, _16ident);
                    bool conditionValue24 = intermediateValue406.Proceed();
                    if (conditionValue24)
                    {
                        bool intermediateValue494;
                        bool comparisonValue87;
                        for (;;)
                        {
                            uint scalarValue127 = intermediateValue406.CandidateType();
                            comparisonValue87 = scalarValue127 == 0u;
                            if (comparisonValue87)
                            {
                                float2 vectorValue18 = intermediateValue406.CandidateTriangleBarycentrics();
                                float2 vectorValue19 = intermediateValue406.CandidateTriangleBarycentrics();
                                uint scalarValue128 = intermediateValue406.CandidatePrimitiveIndex();
                                uint scalarValue129 = intermediateValue406.CandidateInstanceID();
                                uint scalarValue130 = intermediateValue406.CandidateInstanceIndex();
                                uint productValue920 = (scalarValue130 * 76u) + 58u;
                                uint productValue921 = (scalarValue130 * 76u) + 61u;
                                precise float sumValue744 = 1.0f - vectorValue18.x;
                                precise float sumValue745 = sumValue744 - vectorValue19.y;
                                uint bitwiseValue241 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue130 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue128 >> 1u);
                                uint productValue922 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue130 * 76u) + 54u) * 2 + 0)) + 0u;
                                bool comparisonValue110 = (scalarValue128 & 1u) == 0u;
                                uint comparisonValue111 = comparisonValue110 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue922), bitwiseValue241 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue922), bitwiseValue241 * 16 + 0).x;
                                uint comparisonValue112 = comparisonValue110 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue922), bitwiseValue241 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue922), bitwiseValue241 * 16 + 0).w;
                                uint comparisonValue113 = comparisonValue110 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue922), bitwiseValue241 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue922), bitwiseValue241 * 16 + 0).z;
                                bool productValue923 = rdByteLoad_objectInstances_uint16_t(0u, productValue921 * 2 + 0) < 0u;
                                float intermediateValue537;
                                float intermediateValue538;
                                if (productValue923)
                                {
                                    uint bitwiseValue242 = comparisonValue113 >> 15u;
                                    precise float bitwiseValue243 = float(bitwiseValue242 & 1u) * 2.0f;
                                    precise float sumValue746 = bitwiseValue243 + (-1.0f);
                                    precise float bitwiseValue244 = float(comparisonValue113 >> 31u) * 2.0f;
                                    precise float sumValue747 = bitwiseValue244 + (-1.0f);
                                    precise float bitwiseValue245 = float((comparisonValue113 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue246 = float(bitwiseValue242 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue924 = sumValue746 * 3.0517578125e-05f;
                                    precise float productValue925 = sumValue747 * 3.0517578125e-05f;
                                    precise float sumValue748 = bitwiseValue245 + productValue924;
                                    precise float sumValue749 = bitwiseValue246 + productValue925;
                                    intermediateValue537 = sumValue748;
                                    intermediateValue538 = sumValue749;
                                }
                                else
                                {
                                    precise float bitwiseValue247 = float(comparisonValue113 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue248 = float(comparisonValue113 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue926 = bitwiseValue247 * 16384.0f;
                                    precise float sumValue750 = productValue926 + 0.5f;
                                    precise float productValue927 = bitwiseValue248 * 16384.0f;
                                    precise float sumValue751 = productValue927 + 0.5f;
                                    precise float productValue928 = floor(sumValue750) * 6.103515625e-05f;
                                    precise float productValue929 = floor(sumValue751) * 6.103515625e-05f;
                                    intermediateValue537 = productValue928;
                                    intermediateValue538 = productValue929;
                                }
                                precise float productValue930 = sumValue745 * intermediateValue537;
                                precise float productValue931 = sumValue745 * intermediateValue538;
                                precise float sumValue752 = productValue930 + 0.0f;
                                precise float sumValue753 = productValue931 + 0.0f;
                                float intermediateValue573;
                                float intermediateValue574;
                                if (productValue923)
                                {
                                    uint bitwiseValue249 = comparisonValue112 >> 15u;
                                    precise float bitwiseValue250 = float(bitwiseValue249 & 1u) * 2.0f;
                                    precise float sumValue754 = bitwiseValue250 + (-1.0f);
                                    precise float bitwiseValue251 = float(comparisonValue112 >> 31u) * 2.0f;
                                    precise float sumValue755 = bitwiseValue251 + (-1.0f);
                                    precise float bitwiseValue252 = float((comparisonValue112 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue253 = float(bitwiseValue249 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue932 = sumValue754 * 3.0517578125e-05f;
                                    precise float productValue933 = sumValue755 * 3.0517578125e-05f;
                                    precise float sumValue756 = bitwiseValue252 + productValue932;
                                    precise float sumValue757 = bitwiseValue253 + productValue933;
                                    intermediateValue573 = sumValue756;
                                    intermediateValue574 = sumValue757;
                                }
                                else
                                {
                                    precise float bitwiseValue254 = float(comparisonValue112 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue255 = float(comparisonValue112 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue934 = bitwiseValue254 * 16384.0f;
                                    precise float sumValue758 = productValue934 + 0.5f;
                                    precise float productValue935 = bitwiseValue255 * 16384.0f;
                                    precise float sumValue759 = productValue935 + 0.5f;
                                    precise float productValue936 = floor(sumValue758) * 6.103515625e-05f;
                                    precise float productValue937 = floor(sumValue759) * 6.103515625e-05f;
                                    intermediateValue573 = productValue936;
                                    intermediateValue574 = productValue937;
                                }
                                precise float productValue938 = vectorValue18.x * intermediateValue573;
                                precise float productValue939 = vectorValue18.x * intermediateValue574;
                                precise float sumValue760 = sumValue752 + productValue938;
                                precise float sumValue761 = sumValue753 + productValue939;
                                float intermediateValue610;
                                float intermediateValue611;
                                if (productValue923)
                                {
                                    uint bitwiseValue256 = comparisonValue111 >> 15u;
                                    precise float bitwiseValue257 = float(bitwiseValue256 & 1u) * 2.0f;
                                    precise float sumValue762 = bitwiseValue257 + (-1.0f);
                                    precise float bitwiseValue258 = float(comparisonValue111 >> 31u) * 2.0f;
                                    precise float sumValue763 = bitwiseValue258 + (-1.0f);
                                    precise float bitwiseValue259 = float((comparisonValue111 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue260 = float(bitwiseValue256 & 65534u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue940 = sumValue762 * 3.0517578125e-05f;
                                    precise float productValue941 = sumValue763 * 3.0517578125e-05f;
                                    precise float sumValue764 = bitwiseValue259 + productValue940;
                                    precise float sumValue765 = bitwiseValue260 + productValue941;
                                    intermediateValue610 = sumValue764;
                                    intermediateValue611 = sumValue765;
                                }
                                else
                                {
                                    precise float bitwiseValue261 = float(comparisonValue111 & 65535u) * 1.525902189314365386962890625e-05f;
                                    precise float bitwiseValue262 = float(comparisonValue111 >> 16u) * 1.525902189314365386962890625e-05f;
                                    precise float productValue942 = bitwiseValue261 * 16384.0f;
                                    precise float sumValue767 = productValue942 + 0.5f;
                                    precise float productValue943 = bitwiseValue262 * 16384.0f;
                                    precise float sumValue768 = productValue943 + 0.5f;
                                    precise float productValue944 = floor(sumValue767) * 6.103515625e-05f;
                                    precise float productValue945 = floor(sumValue768) * 6.103515625e-05f;
                                    intermediateValue610 = productValue944;
                                    intermediateValue611 = productValue945;
                                }
                                precise float productValue946 = vectorValue19.y * intermediateValue610;
                                precise float productValue947 = vectorValue19.y * intermediateValue611;
                                precise float sumValue769 = sumValue760 + productValue946;
                                precise float sumValue770 = sumValue761 + productValue947;
                                float intermediateValue616;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue920 * 2 + 0) == 65535u)
                                {
                                    intermediateValue616 = 1.0f;
                                }
                                else
                                {
                                    uint reinterpretedBits49;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue920 * 2 + 0) > 4095u)
                                    {
                                        reinterpretedBits49 = asuint(viewCbConstants[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits49 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue920 * 2 + 0));
                                    }
                                    intermediateValue616 = textures[NonUniformResourceIndex(reinterpretedBits49 + 0u)].SampleLevel(defaultSampler, float2(sumValue769, sumValue770), -0.25f).w;
                                }
                                uint comparisonValue133;
                                if (scalarValue129 == 2u)
                                {
                                    comparisonValue133 = 0u;
                                }
                                else
                                {
                                    comparisonValue133 = uint(intermediateValue616 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue921 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                }
                                if (comparisonValue133 == 0u)
                                {
                                    intermediateValue406.CommitNonOpaqueTriangleHit();
                                }
                            }
                            intermediateValue494 = intermediateValue406.Proceed();
                            if (intermediateValue494)
                            {
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    uint scalarValue131 = intermediateValue406.CommittedStatus();
                    uint branchMergedValue41;
                    uint branchMergedValue131;
                    float branchMergedValue132;
                    float branchMergedValue133;
                    float branchMergedValue134;
                    uint branchMergedValue135;
                    uint branchMergedValue136;
                    float branchMergedValue137;
                    float branchMergedValue138;
                    float branchMergedValue139;
                    uint branchMergedValue158;
                    float branchMergedValue159;
                    float branchMergedValue160;
                    float branchMergedValue161;
                    if (scalarValue131 == 1u)
                    {
                        float2 vectorValue20 = intermediateValue406.CommittedTriangleBarycentrics();
                        float2 vectorValue21 = intermediateValue406.CommittedTriangleBarycentrics();
                        float scalarValue132 = intermediateValue406.CommittedRayT();
                        uint scalarValue133 = intermediateValue406.CommittedPrimitiveIndex();
                        uint scalarValue134 = intermediateValue406.CommittedInstanceID();
                        uint scalarValue135 = intermediateValue406.CommittedInstanceIndex();
                        branchMergedValue41 = intermediateValue107;
                        branchMergedValue131 = intermediateValue105;
                        branchMergedValue132 = comparisonValue109;
                        branchMergedValue133 = comparisonValue108;
                        branchMergedValue134 = comparisonValue105;
                        branchMergedValue135 = productValue814;
                        branchMergedValue136 = ((scalarValue134 << 30u) | ((scalarValue133 << 14u) & 1073725440u)) | (scalarValue135 & 16383u);
                        branchMergedValue137 = scalarValue132;
                        branchMergedValue138 = vectorValue21.y;
                        branchMergedValue139 = vectorValue20.x;
                        branchMergedValue158 = 2u;
                        branchMergedValue159 = intermediateValue383;
                        branchMergedValue160 = intermediateValue382;
                        branchMergedValue161 = intermediateValue384;
                    }
                    else
                    {
                        branchMergedValue41 = intermediateValue107;
                        branchMergedValue131 = intermediateValue105;
                        branchMergedValue132 = comparisonValue109;
                        branchMergedValue133 = comparisonValue108;
                        branchMergedValue134 = comparisonValue105;
                        branchMergedValue135 = productValue814;
                        branchMergedValue136 = intermediateValue89 | 1073741823u;
                        branchMergedValue137 = 10000.0f;
                        branchMergedValue138 = 0.0f;
                        branchMergedValue139 = 0.0f;
                        branchMergedValue158 = 2u;
                        branchMergedValue159 = intermediateValue383;
                        branchMergedValue160 = intermediateValue382;
                        branchMergedValue161 = intermediateValue384;
                    }
                    intermediateValue78 = branchMergedValue160;
                    intermediateValue80 = branchMergedValue159;
                    intermediateValue82 = branchMergedValue161;
                    intermediateValue84 = branchMergedValue139;
                    intermediateValue86 = branchMergedValue138;
                    intermediateValue88 = branchMergedValue137;
                    intermediateValue90 = branchMergedValue136;
                    intermediateValue498 = branchMergedValue135;
                    intermediateValue499 = branchMergedValue134;
                    intermediateValue500 = branchMergedValue133;
                    intermediateValue501 = branchMergedValue132;
                    intermediateValue106 = branchMergedValue131;
                    intermediateValue108 = branchMergedValue41;
                    intermediateValue110 = branchMergedValue158;
                }
                else
                {
                    precise float sumValue771 = 1.0f - intermediateValue312;
                    precise float quotientValue41 = intermediateValue309 / sumValue771;
                    precise float quotientValue42 = intermediateValue310 / sumValue771;
                    precise float quotientValue43 = intermediateValue311 / sumValue771;
                    uint branchMergedValue40;
                    uint branchMergedValue122;
                    float branchMergedValue123;
                    float branchMergedValue124;
                    float branchMergedValue125;
                    uint branchMergedValue126;
                    uint branchMergedValue127;
                    float branchMergedValue128;
                    float branchMergedValue129;
                    float branchMergedValue130;
                    uint branchMergedValue154;
                    float branchMergedValue155;
                    float branchMergedValue156;
                    float branchMergedValue157;
                    if (!(intermediateValue313 <= bitwiseValue239))
                    {
                        precise float quotientValue44 = quotientValue41 / intermediateValue313;
                        precise float quotientValue45 = quotientValue42 / intermediateValue313;
                        precise float quotientValue46 = quotientValue43 / intermediateValue313;
                        precise float productValue948 = dotProductValue3 * dotProductValue3;
                        precise float sumValue772 = 1.0f - productValue948;
                        float intermediateValue462;
                        float intermediateValue463;
                        float intermediateValue464;
                        float reinterpretedBits39;
                        float reinterpretedBits40;
                        float reinterpretedBits41;
                        uint intermediateValue465;
                        uint intermediateValue466;
                        uint intermediateValue467;
                        bool intermediateValue468;
                        float intermediateValue469;
                        if (intermediateValue107 == 0u)
                        {
                            precise float scalarValue136 = (-0.0f) - dotProductValue3;
                            precise float productValue949 = sumValue772 * 0.565323054790496826171875f;
                            float intermediateValue434;
                            float intermediateValue435;
                            float intermediateValue436;
                            if (productValue949 > 1.0f)
                            {
                                precise float productValue950 = dotProductValue3 * (-2.0f);
                                precise float productValue951 = comparisonValue15 * productValue950;
                                precise float productValue952 = comparisonValue16 * productValue950;
                                precise float productValue953 = comparisonValue17 * productValue950;
                                precise float sumValue773 = intermediateValue77 + productValue951;
                                precise float sumValue774 = intermediateValue79 + productValue952;
                                precise float sumValue775 = intermediateValue81 + productValue953;
                                intermediateValue434 = sumValue773;
                                intermediateValue435 = sumValue774;
                                intermediateValue436 = sumValue775;
                            }
                            else
                            {
                                precise float sumValue776 = 1.0f - productValue949;
                                precise float productValue954 = intermediateValue77 * 0.75187969207763671875f;
                                precise float productValue955 = intermediateValue79 * 0.75187969207763671875f;
                                precise float productValue956 = intermediateValue81 * 0.75187969207763671875f;
                                precise float productValue957 = dotProductValue3 * (-0.75187969207763671875f);
                                precise float nonlinearValue22 = productValue957 - sqrt(sumValue776);
                                precise float productValue958 = comparisonValue15 * nonlinearValue22;
                                precise float productValue959 = comparisonValue16 * nonlinearValue22;
                                precise float productValue960 = comparisonValue17 * nonlinearValue22;
                                precise float sumValue777 = productValue954 + productValue958;
                                precise float sumValue778 = productValue955 + productValue959;
                                precise float sumValue779 = productValue956 + productValue960;
                                intermediateValue434 = sumValue777;
                                intermediateValue435 = sumValue778;
                                intermediateValue436 = sumValue779;
                            }
                            uint productValue961 = uint(int(comparisonValue15 * (-256.0f)));
                            uint productValue962 = uint(int(comparisonValue16 * (-256.0f)));
                            uint productValue963 = uint(int(comparisonValue17 * (-256.0f)));
                            intermediateValue462 = intermediateValue434;
                            intermediateValue463 = intermediateValue435;
                            intermediateValue464 = intermediateValue436;
                            reinterpretedBits39 = conditionValue10 ? (sumValue209 - productValue489) : asfloat((conditionValue7 ? (-productValue961) : productValue961) + reinterpretedBits22);
                            reinterpretedBits40 = conditionValue11 ? (sumValue212 - productValue490) : asfloat((conditionValue8 ? (-productValue962) : productValue962) + reinterpretedBits26);
                            reinterpretedBits41 = conditionValue12 ? (sumValue215 - productValue491) : asfloat((conditionValue9 ? (-productValue963) : productValue963) + reinterpretedBits27);
                            intermediateValue465 = uint(conditionValue4);
                            intermediateValue466 = 1u;
                            intermediateValue467 = 0u;
                            intermediateValue468 = true;
                            intermediateValue469 = scalarValue136;
                        }
                        else
                        {
                            precise float productValue964 = sumValue772 * 1.7689001560211181640625f;
                            bool conditionValue25 = productValue964 > 1.0f;
                            float intermediateValue437;
                            float intermediateValue438;
                            float intermediateValue439;
                            if (conditionValue25)
                            {
                                precise float productValue965 = dotProductValue3 * (-2.0f);
                                precise float productValue966 = comparisonValue15 * productValue965;
                                precise float productValue967 = comparisonValue16 * productValue965;
                                precise float productValue968 = comparisonValue17 * productValue965;
                                precise float sumValue780 = intermediateValue77 + productValue966;
                                precise float sumValue781 = intermediateValue79 + productValue967;
                                precise float sumValue782 = intermediateValue81 + productValue968;
                                intermediateValue437 = sumValue780;
                                intermediateValue438 = sumValue781;
                                intermediateValue439 = sumValue782;
                            }
                            else
                            {
                                precise float sumValue783 = 1.0f - productValue964;
                                precise float productValue969 = intermediateValue77 * 1.33000004291534423828125f;
                                precise float productValue970 = intermediateValue79 * 1.33000004291534423828125f;
                                precise float productValue971 = intermediateValue81 * 1.33000004291534423828125f;
                                precise float productValue972 = dotProductValue3 * (-1.33000004291534423828125f);
                                precise float nonlinearValue23 = productValue972 - sqrt(sumValue783);
                                precise float productValue973 = comparisonValue15 * nonlinearValue23;
                                precise float productValue974 = comparisonValue16 * nonlinearValue23;
                                precise float productValue975 = comparisonValue17 * nonlinearValue23;
                                precise float sumValue784 = productValue969 + productValue973;
                                precise float sumValue785 = productValue970 + productValue974;
                                precise float sumValue786 = productValue971 + productValue975;
                                intermediateValue437 = sumValue784;
                                intermediateValue438 = sumValue785;
                                intermediateValue439 = sumValue786;
                            }
                            uint scalarValue137 = uint(conditionValue25);
                            float branchMergedValue38;
                            bool branchMergedValue112;
                            uint branchMergedValue113;
                            uint branchMergedValue114;
                            float branchMergedValue115;
                            float branchMergedValue116;
                            float branchMergedValue117;
                            float branchMergedValue118;
                            uint branchMergedValue119;
                            float branchMergedValue120;
                            float branchMergedValue153;
                            if (conditionValue25)
                            {
                                precise float dotProductValue41 = dot(float3(sumValue402, sumValue403, sumValue404), float3(comparisonValue15, comparisonValue16, comparisonValue17)) * 2.0f;
                                precise float productValue976 = comparisonValue15 * dotProductValue41;
                                precise float productValue977 = comparisonValue16 * dotProductValue41;
                                precise float productValue978 = comparisonValue17 * dotProductValue41;
                                precise float sumValue787 = sumValue402 - productValue976;
                                precise float sumValue788 = sumValue403 - productValue977;
                                precise float sumValue789 = sumValue404 - productValue978;
                                precise float sumValue790 = (-0.0f) - sumValue787;
                                precise float sumValue791 = (-0.0f) - sumValue788;
                                precise float sumValue792 = (-0.0f) - sumValue789;
                                branchMergedValue38 = 0.0f;
                                branchMergedValue112 = false;
                                branchMergedValue113 = intermediateValue107;
                                branchMergedValue114 = intermediateValue105;
                                branchMergedValue115 = reinterpretedBits30;
                                branchMergedValue116 = reinterpretedBits29;
                                branchMergedValue117 = reinterpretedBits28;
                                branchMergedValue118 = sumValue792;
                                branchMergedValue119 = scalarValue137;
                                branchMergedValue120 = sumValue790;
                                branchMergedValue153 = sumValue791;
                            }
                            else
                            {
                                uint productValue979 = uint(int(comparisonValue15 * (-256.0f)));
                                uint productValue980 = uint(int(comparisonValue16 * (-256.0f)));
                                uint productValue981 = uint(int(comparisonValue17 * (-256.0f)));
                                precise float dotProductValue42 = (-0.0f) - dot(float3(intermediateValue437, intermediateValue438, intermediateValue439), float3(comparisonValue15, comparisonValue16, comparisonValue17));
                                branchMergedValue38 = dotProductValue42;
                                branchMergedValue112 = true;
                                branchMergedValue113 = 0u;
                                branchMergedValue114 = 0u;
                                branchMergedValue115 = conditionValue12 ? (sumValue215 - productValue491) : asfloat((conditionValue9 ? (-productValue981) : productValue981) + reinterpretedBits27);
                                branchMergedValue116 = conditionValue11 ? (sumValue212 - productValue490) : asfloat((conditionValue8 ? (-productValue980) : productValue980) + reinterpretedBits26);
                                branchMergedValue117 = conditionValue10 ? (sumValue209 - productValue489) : asfloat((conditionValue7 ? (-productValue979) : productValue979) + reinterpretedBits22);
                                branchMergedValue118 = intermediateValue439;
                                branchMergedValue119 = scalarValue137;
                                branchMergedValue120 = intermediateValue437;
                                branchMergedValue153 = intermediateValue438;
                            }
                            intermediateValue462 = branchMergedValue120;
                            intermediateValue463 = branchMergedValue153;
                            intermediateValue464 = branchMergedValue118;
                            reinterpretedBits39 = branchMergedValue117;
                            reinterpretedBits40 = branchMergedValue116;
                            reinterpretedBits41 = branchMergedValue115;
                            intermediateValue465 = branchMergedValue114;
                            intermediateValue466 = branchMergedValue113;
                            intermediateValue467 = branchMergedValue119;
                            intermediateValue468 = branchMergedValue112;
                            intermediateValue469 = branchMergedValue38;
                        }
                        bool comparisonValue114 = intermediateValue467 != 0u;
                        float comparisonValue115 = comparisonValue114 ? 1.0f : sumValue398;
                        float comparisonValue116 = comparisonValue114 ? 1.0f : sumValue399;
                        float comparisonValue117 = comparisonValue114 ? 1.0f : sumValue400;
                        float intermediateValue502;
                        float intermediateValue503;
                        float intermediateValue504;
                        if (intermediateValue468)
                        {
                            precise float sumValue793 = 1.0f - intermediateValue469;
                            precise float clampedValue26 = log2(clamp(sumValue793, 0.0f, 1.0f)) * 5.0f;
                            precise float exponentialValue10 = exp2(clampedValue26) * 0.980000019073486328125f;
                            precise float sumValue794 = exponentialValue10 + 0.0199999995529651641845703125f;
                            precise float sumValue795 = 1.0f - sumValue794;
                            precise float productValue982 = comparisonValue115 * sumValue795;
                            precise float productValue983 = comparisonValue116 * sumValue795;
                            precise float productValue984 = comparisonValue117 * sumValue795;
                            intermediateValue502 = productValue982;
                            intermediateValue503 = productValue983;
                            intermediateValue504 = productValue984;
                        }
                        else
                        {
                            intermediateValue502 = comparisonValue115;
                            intermediateValue503 = comparisonValue116;
                            intermediateValue504 = comparisonValue117;
                        }
                        RayDesc _17ident = {float3(reinterpretedBits39, reinterpretedBits40, reinterpretedBits41), 0.0f, float3(intermediateValue462, intermediateValue463, intermediateValue464), 10000.0f};
                        intermediateValue505.TraceRayInline(SceneBVH, 512u, 109u, _17ident);
                        bool conditionValue26 = intermediateValue505.Proceed();
                        if (conditionValue26)
                        {
                            bool intermediateValue564;
                            bool comparisonValue119;
                            for (;;)
                            {
                                uint scalarValue138 = intermediateValue505.CandidateType();
                                comparisonValue119 = scalarValue138 == 0u;
                                if (comparisonValue119)
                                {
                                    float2 vectorValue22 = intermediateValue505.CandidateTriangleBarycentrics();
                                    float2 vectorValue23 = intermediateValue505.CandidateTriangleBarycentrics();
                                    uint scalarValue139 = intermediateValue505.CandidatePrimitiveIndex();
                                    uint scalarValue140 = intermediateValue505.CandidateInstanceID();
                                    uint scalarValue141 = intermediateValue505.CandidateInstanceIndex();
                                    uint productValue985 = (scalarValue141 * 76u) + 58u;
                                    uint productValue986 = (scalarValue141 * 76u) + 61u;
                                    precise float sumValue796 = 1.0f - vectorValue22.x;
                                    precise float sumValue797 = sumValue796 - vectorValue23.y;
                                    uint bitwiseValue263 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue141 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue139 >> 1u);
                                    uint productValue987 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue141 * 76u) + 54u) * 2 + 0)) + 0u;
                                    bool comparisonValue118 = (scalarValue139 & 1u) == 0u;
                                    uint comparisonValue120 = comparisonValue118 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue987), bitwiseValue263 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue987), bitwiseValue263 * 16 + 0).x;
                                    uint comparisonValue121 = comparisonValue118 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue987), bitwiseValue263 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue987), bitwiseValue263 * 16 + 0).w;
                                    uint comparisonValue122 = comparisonValue118 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue987), bitwiseValue263 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue987), bitwiseValue263 * 16 + 0).z;
                                    bool productValue988 = rdByteLoad_objectInstances_uint16_t(0u, productValue986 * 2 + 0) < 0u;
                                    float intermediateValue598;
                                    float intermediateValue599;
                                    if (productValue988)
                                    {
                                        uint bitwiseValue264 = comparisonValue122 >> 15u;
                                        precise float bitwiseValue265 = float(bitwiseValue264 & 1u) * 2.0f;
                                        precise float sumValue798 = bitwiseValue265 + (-1.0f);
                                        precise float bitwiseValue266 = float(comparisonValue122 >> 31u) * 2.0f;
                                        precise float sumValue799 = bitwiseValue266 + (-1.0f);
                                        precise float bitwiseValue267 = float((comparisonValue122 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue268 = float(bitwiseValue264 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue989 = sumValue798 * 3.0517578125e-05f;
                                        precise float productValue990 = sumValue799 * 3.0517578125e-05f;
                                        precise float sumValue800 = bitwiseValue267 + productValue989;
                                        precise float sumValue801 = bitwiseValue268 + productValue990;
                                        intermediateValue598 = sumValue800;
                                        intermediateValue599 = sumValue801;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue269 = float(comparisonValue122 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue270 = float(comparisonValue122 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue991 = bitwiseValue269 * 16384.0f;
                                        precise float sumValue802 = productValue991 + 0.5f;
                                        precise float productValue992 = bitwiseValue270 * 16384.0f;
                                        precise float sumValue803 = productValue992 + 0.5f;
                                        precise float productValue993 = floor(sumValue802) * 6.103515625e-05f;
                                        precise float productValue994 = floor(sumValue803) * 6.103515625e-05f;
                                        intermediateValue598 = productValue993;
                                        intermediateValue599 = productValue994;
                                    }
                                    precise float productValue995 = sumValue797 * intermediateValue598;
                                    precise float productValue996 = sumValue797 * intermediateValue599;
                                    precise float sumValue804 = productValue995 + 0.0f;
                                    precise float sumValue805 = productValue996 + 0.0f;
                                    float intermediateValue617;
                                    float intermediateValue618;
                                    if (productValue988)
                                    {
                                        uint bitwiseValue271 = comparisonValue121 >> 15u;
                                        precise float bitwiseValue272 = float(bitwiseValue271 & 1u) * 2.0f;
                                        precise float sumValue806 = bitwiseValue272 + (-1.0f);
                                        precise float bitwiseValue273 = float(comparisonValue121 >> 31u) * 2.0f;
                                        precise float sumValue807 = bitwiseValue273 + (-1.0f);
                                        precise float bitwiseValue274 = float((comparisonValue121 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue275 = float(bitwiseValue271 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue997 = sumValue806 * 3.0517578125e-05f;
                                        precise float productValue998 = sumValue807 * 3.0517578125e-05f;
                                        precise float sumValue808 = bitwiseValue274 + productValue997;
                                        precise float sumValue809 = bitwiseValue275 + productValue998;
                                        intermediateValue617 = sumValue808;
                                        intermediateValue618 = sumValue809;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue276 = float(comparisonValue121 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue277 = float(comparisonValue121 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue999 = bitwiseValue276 * 16384.0f;
                                        precise float sumValue810 = productValue999 + 0.5f;
                                        precise float productValue1000 = bitwiseValue277 * 16384.0f;
                                        precise float sumValue811 = productValue1000 + 0.5f;
                                        precise float productValue1001 = floor(sumValue810) * 6.103515625e-05f;
                                        precise float productValue1002 = floor(sumValue811) * 6.103515625e-05f;
                                        intermediateValue617 = productValue1001;
                                        intermediateValue618 = productValue1002;
                                    }
                                    precise float productValue1003 = vectorValue22.x * intermediateValue617;
                                    precise float productValue1004 = vectorValue22.x * intermediateValue618;
                                    precise float sumValue812 = sumValue804 + productValue1003;
                                    precise float sumValue813 = sumValue805 + productValue1004;
                                    float intermediateValue637;
                                    float intermediateValue638;
                                    if (productValue988)
                                    {
                                        uint bitwiseValue278 = comparisonValue120 >> 15u;
                                        precise float bitwiseValue279 = float(bitwiseValue278 & 1u) * 2.0f;
                                        precise float sumValue814 = bitwiseValue279 + (-1.0f);
                                        precise float bitwiseValue280 = float(comparisonValue120 >> 31u) * 2.0f;
                                        precise float sumValue816 = bitwiseValue280 + (-1.0f);
                                        precise float bitwiseValue281 = float((comparisonValue120 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue282 = float(bitwiseValue278 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1005 = sumValue814 * 3.0517578125e-05f;
                                        precise float productValue1006 = sumValue816 * 3.0517578125e-05f;
                                        precise float sumValue817 = bitwiseValue281 + productValue1005;
                                        precise float sumValue818 = bitwiseValue282 + productValue1006;
                                        intermediateValue637 = sumValue817;
                                        intermediateValue638 = sumValue818;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue283 = float(comparisonValue120 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue284 = float(comparisonValue120 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1007 = bitwiseValue283 * 16384.0f;
                                        precise float sumValue819 = productValue1007 + 0.5f;
                                        precise float productValue1008 = bitwiseValue284 * 16384.0f;
                                        precise float sumValue820 = productValue1008 + 0.5f;
                                        precise float productValue1009 = floor(sumValue819) * 6.103515625e-05f;
                                        precise float productValue1010 = floor(sumValue820) * 6.103515625e-05f;
                                        intermediateValue637 = productValue1009;
                                        intermediateValue638 = productValue1010;
                                    }
                                    precise float productValue1011 = vectorValue23.y * intermediateValue637;
                                    precise float productValue1012 = vectorValue23.y * intermediateValue638;
                                    precise float sumValue821 = sumValue812 + productValue1011;
                                    precise float sumValue822 = sumValue813 + productValue1012;
                                    float intermediateValue642;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue985 * 2 + 0) == 65535u)
                                    {
                                        intermediateValue642 = 1.0f;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits51;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue985 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits51 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits51 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue985 * 2 + 0));
                                        }
                                        intermediateValue642 = textures[NonUniformResourceIndex(reinterpretedBits51 + 0u)].SampleLevel(defaultSampler, float2(sumValue821, sumValue822), -0.25f).w;
                                    }
                                    uint comparisonValue138;
                                    if (scalarValue140 == 2u)
                                    {
                                        comparisonValue138 = 0u;
                                    }
                                    else
                                    {
                                        comparisonValue138 = uint(intermediateValue642 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue986 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                    }
                                    if (comparisonValue138 == 0u)
                                    {
                                        intermediateValue505.CommitNonOpaqueTriangleHit();
                                    }
                                }
                                intermediateValue564 = intermediateValue505.Proceed();
                                if (intermediateValue564)
                                {
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        uint scalarValue142 = intermediateValue505.CommittedStatus();
                        float intermediateValue495;
                        float intermediateValue496;
                        float intermediateValue497;
                        uint bitwiseValue198;
                        if (scalarValue142 == 1u)
                        {
                            float2 vectorValue24 = intermediateValue505.CommittedTriangleBarycentrics();
                            float2 vectorValue25 = intermediateValue505.CommittedTriangleBarycentrics();
                            float scalarValue143 = intermediateValue505.CommittedRayT();
                            uint scalarValue144 = intermediateValue505.CommittedPrimitiveIndex();
                            uint scalarValue145 = intermediateValue505.CommittedInstanceID();
                            uint scalarValue146 = intermediateValue505.CommittedInstanceIndex();
                            intermediateValue495 = vectorValue24.x;
                            intermediateValue496 = vectorValue25.y;
                            intermediateValue497 = scalarValue143;
                            bitwiseValue198 = ((scalarValue145 << 30u) | ((scalarValue144 << 14u) & 1073725440u)) | (scalarValue146 & 16383u);
                        }
                        else
                        {
                            intermediateValue495 = 0.0f;
                            intermediateValue496 = 0.0f;
                            intermediateValue497 = 10000.0f;
                            bitwiseValue198 = intermediateValue89 | 1073741823u;
                        }
                        precise float productValue1013 = quotientValue44 * intermediateValue502;
                        precise float productValue1014 = quotientValue45 * intermediateValue503;
                        precise float productValue1015 = quotientValue46 * intermediateValue504;
                        branchMergedValue40 = intermediateValue466;
                        branchMergedValue122 = intermediateValue465;
                        branchMergedValue123 = productValue1015;
                        branchMergedValue124 = productValue1014;
                        branchMergedValue125 = productValue1013;
                        branchMergedValue126 = productValue813;
                        branchMergedValue127 = bitwiseValue198;
                        branchMergedValue128 = intermediateValue497;
                        branchMergedValue129 = intermediateValue496;
                        branchMergedValue130 = intermediateValue495;
                        branchMergedValue154 = 3u;
                        branchMergedValue155 = intermediateValue463;
                        branchMergedValue156 = intermediateValue462;
                        branchMergedValue157 = intermediateValue464;
                    }
                    else
                    {
                        precise float sumValue823 = 1.0f - intermediateValue313;
                        precise float quotientValue47 = quotientValue41 / sumValue823;
                        precise float quotientValue48 = quotientValue42 / sumValue823;
                        precise float quotientValue49 = quotientValue43 / sumValue823;
                        precise float productValue1016 = intermediateValue216 * quotientValue47;
                        precise float productValue1017 = intermediateValue216 * quotientValue48;
                        precise float productValue1018 = intermediateValue216 * quotientValue49;
                        uint productValue1019 = (productValue813 * 1664525u) + 1013904223u;
                        precise float bitwiseValue285 = float(productValue1019 & 16777215u) * 5.9604644775390625e-08f;
                        uint productValue1020 = (productValue1019 * 1664525u) + 1013904223u;
                        precise float bitwiseValue286 = float(productValue1020 & 16777215u) * 5.9604644775390625e-08f;
                        float nonlinearValue24 = sqrt(bitwiseValue285);
                        precise float productValue1021 = bitwiseValue286 * 6.283185482025146484375f;
                        precise float wavePhaseValue15 = nonlinearValue24 * cos(productValue1021);
                        precise float wavePhaseValue16 = nonlinearValue24 * sin(productValue1021);
                        precise float sumValue824 = 1.0f - bitwiseValue285;
                        float nonlinearValue25 = sqrt(sumValue824);
                        precise float productValue1022 = productValue790 * wavePhaseValue15;
                        precise float productValue1023 = wavePhaseValue16 * sumValue644;
                        precise float sumValue825 = productValue1023 + productValue1022;
                        precise float productValue1024 = nonlinearValue25 * intermediateValue219;
                        precise float sumValue826 = productValue1024 + sumValue825;
                        precise float productValue1025 = productValue791 * wavePhaseValue15;
                        precise float productValue1026 = wavePhaseValue16 * sumValue645;
                        precise float sumValue827 = productValue1026 + productValue1025;
                        precise float productValue1027 = nonlinearValue25 * intermediateValue221;
                        precise float sumValue828 = productValue1027 + sumValue827;
                        precise float productValue1028 = productValue792 * wavePhaseValue15;
                        precise float productValue1029 = wavePhaseValue16 * sumValue646;
                        precise float sumValue829 = productValue1029 + productValue1028;
                        precise float productValue1030 = nonlinearValue25 * intermediateValue223;
                        precise float sumValue830 = productValue1030 + sumValue829;
                        RayDesc _18ident = {float3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0f, float3(sumValue826, sumValue828, sumValue830), 10000.0f};
                        intermediateValue350.TraceRayInline(SceneBVH, 512u, 69u, _18ident);
                        bool conditionValue27 = intermediateValue350.Proceed();
                        if (conditionValue27)
                        {
                            bool intermediateValue446;
                            bool comparisonValue77;
                            for (;;)
                            {
                                uint scalarValue147 = intermediateValue350.CandidateType();
                                comparisonValue77 = scalarValue147 == 0u;
                                if (comparisonValue77)
                                {
                                    float2 vectorValue26 = intermediateValue350.CandidateTriangleBarycentrics();
                                    float2 vectorValue27 = intermediateValue350.CandidateTriangleBarycentrics();
                                    uint scalarValue148 = intermediateValue350.CandidatePrimitiveIndex();
                                    uint scalarValue149 = intermediateValue350.CandidateInstanceID();
                                    uint scalarValue150 = intermediateValue350.CandidateInstanceIndex();
                                    uint productValue1031 = (scalarValue150 * 76u) + 58u;
                                    uint productValue1032 = (scalarValue150 * 76u) + 61u;
                                    precise float sumValue831 = 1.0f - vectorValue26.x;
                                    precise float sumValue832 = sumValue831 - vectorValue27.y;
                                    uint bitwiseValue287 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue150 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue148 >> 1u);
                                    uint productValue1033 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue150 * 76u) + 54u) * 2 + 0)) + 0u;
                                    bool comparisonValue123 = (scalarValue148 & 1u) == 0u;
                                    uint comparisonValue124 = comparisonValue123 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1033), bitwiseValue287 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1033), bitwiseValue287 * 16 + 0).x;
                                    uint comparisonValue125 = comparisonValue123 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1033), bitwiseValue287 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1033), bitwiseValue287 * 16 + 0).w;
                                    uint comparisonValue126 = comparisonValue123 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1033), bitwiseValue287 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1033), bitwiseValue287 * 16 + 0).z;
                                    bool productValue1034 = rdByteLoad_objectInstances_uint16_t(0u, productValue1032 * 2 + 0) < 0u;
                                    float intermediateValue507;
                                    float intermediateValue508;
                                    if (productValue1034)
                                    {
                                        uint bitwiseValue288 = comparisonValue126 >> 15u;
                                        precise float bitwiseValue289 = float(bitwiseValue288 & 1u) * 2.0f;
                                        precise float sumValue833 = bitwiseValue289 + (-1.0f);
                                        precise float bitwiseValue290 = float(comparisonValue126 >> 31u) * 2.0f;
                                        precise float sumValue834 = bitwiseValue290 + (-1.0f);
                                        precise float bitwiseValue291 = float((comparisonValue126 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue292 = float(bitwiseValue288 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1035 = sumValue833 * 3.0517578125e-05f;
                                        precise float productValue1036 = sumValue834 * 3.0517578125e-05f;
                                        precise float sumValue835 = bitwiseValue291 + productValue1035;
                                        precise float sumValue836 = bitwiseValue292 + productValue1036;
                                        intermediateValue507 = sumValue835;
                                        intermediateValue508 = sumValue836;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue293 = float(comparisonValue126 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue294 = float(comparisonValue126 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1037 = bitwiseValue293 * 16384.0f;
                                        precise float sumValue837 = productValue1037 + 0.5f;
                                        precise float productValue1038 = bitwiseValue294 * 16384.0f;
                                        precise float sumValue838 = productValue1038 + 0.5f;
                                        precise float productValue1039 = floor(sumValue837) * 6.103515625e-05f;
                                        precise float productValue1040 = floor(sumValue838) * 6.103515625e-05f;
                                        intermediateValue507 = productValue1039;
                                        intermediateValue508 = productValue1040;
                                    }
                                    precise float productValue1041 = sumValue832 * intermediateValue507;
                                    precise float productValue1042 = sumValue832 * intermediateValue508;
                                    precise float sumValue839 = productValue1041 + 0.0f;
                                    precise float sumValue840 = productValue1042 + 0.0f;
                                    float intermediateValue546;
                                    float intermediateValue547;
                                    if (productValue1034)
                                    {
                                        uint bitwiseValue295 = comparisonValue125 >> 15u;
                                        precise float bitwiseValue296 = float(bitwiseValue295 & 1u) * 2.0f;
                                        precise float sumValue841 = bitwiseValue296 + (-1.0f);
                                        precise float bitwiseValue297 = float(comparisonValue125 >> 31u) * 2.0f;
                                        precise float sumValue842 = bitwiseValue297 + (-1.0f);
                                        precise float bitwiseValue298 = float((comparisonValue125 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue299 = float(bitwiseValue295 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1043 = sumValue841 * 3.0517578125e-05f;
                                        precise float productValue1044 = sumValue842 * 3.0517578125e-05f;
                                        precise float sumValue843 = bitwiseValue298 + productValue1043;
                                        precise float sumValue844 = bitwiseValue299 + productValue1044;
                                        intermediateValue546 = sumValue843;
                                        intermediateValue547 = sumValue844;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue300 = float(comparisonValue125 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue301 = float(comparisonValue125 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1045 = bitwiseValue300 * 16384.0f;
                                        precise float sumValue845 = productValue1045 + 0.5f;
                                        precise float productValue1046 = bitwiseValue301 * 16384.0f;
                                        precise float sumValue846 = productValue1046 + 0.5f;
                                        precise float productValue1047 = floor(sumValue845) * 6.103515625e-05f;
                                        precise float productValue1048 = floor(sumValue846) * 6.103515625e-05f;
                                        intermediateValue546 = productValue1047;
                                        intermediateValue547 = productValue1048;
                                    }
                                    precise float productValue1049 = vectorValue26.x * intermediateValue546;
                                    precise float productValue1050 = vectorValue26.x * intermediateValue547;
                                    precise float sumValue847 = sumValue839 + productValue1049;
                                    precise float sumValue848 = sumValue840 + productValue1050;
                                    float intermediateValue575;
                                    float intermediateValue576;
                                    if (productValue1034)
                                    {
                                        uint bitwiseValue302 = comparisonValue124 >> 15u;
                                        precise float bitwiseValue303 = float(bitwiseValue302 & 1u) * 2.0f;
                                        precise float sumValue849 = bitwiseValue303 + (-1.0f);
                                        precise float bitwiseValue304 = float(comparisonValue124 >> 31u) * 2.0f;
                                        precise float sumValue850 = bitwiseValue304 + (-1.0f);
                                        precise float bitwiseValue305 = float((comparisonValue124 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue306 = float(bitwiseValue302 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1051 = sumValue849 * 3.0517578125e-05f;
                                        precise float productValue1052 = sumValue850 * 3.0517578125e-05f;
                                        precise float sumValue852 = bitwiseValue305 + productValue1051;
                                        precise float sumValue853 = bitwiseValue306 + productValue1052;
                                        intermediateValue575 = sumValue852;
                                        intermediateValue576 = sumValue853;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue307 = float(comparisonValue124 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue308 = float(comparisonValue124 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1053 = bitwiseValue307 * 16384.0f;
                                        precise float sumValue854 = productValue1053 + 0.5f;
                                        precise float productValue1054 = bitwiseValue308 * 16384.0f;
                                        precise float sumValue855 = productValue1054 + 0.5f;
                                        precise float productValue1055 = floor(sumValue854) * 6.103515625e-05f;
                                        precise float productValue1056 = floor(sumValue855) * 6.103515625e-05f;
                                        intermediateValue575 = productValue1055;
                                        intermediateValue576 = productValue1056;
                                    }
                                    precise float productValue1057 = vectorValue27.y * intermediateValue575;
                                    precise float productValue1058 = vectorValue27.y * intermediateValue576;
                                    precise float sumValue856 = sumValue847 + productValue1057;
                                    precise float sumValue857 = sumValue848 + productValue1058;
                                    float intermediateValue600;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue1031 * 2 + 0) == 65535u)
                                    {
                                        intermediateValue600 = 1.0f;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits48;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue1031 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits48 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits48 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue1031 * 2 + 0));
                                        }
                                        intermediateValue600 = textures[NonUniformResourceIndex(reinterpretedBits48 + 0u)].SampleLevel(defaultSampler, float2(sumValue856, sumValue857), -0.25f).w;
                                    }
                                    uint comparisonValue131;
                                    if (scalarValue149 == 2u)
                                    {
                                        comparisonValue131 = 0u;
                                    }
                                    else
                                    {
                                        comparisonValue131 = uint(intermediateValue600 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue1032 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                                    }
                                    if (comparisonValue131 == 0u)
                                    {
                                        intermediateValue350.CommitNonOpaqueTriangleHit();
                                    }
                                }
                                intermediateValue446 = intermediateValue350.Proceed();
                                if (intermediateValue446)
                                {
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        uint scalarValue151 = intermediateValue350.CommittedStatus();
                        float intermediateValue447;
                        float intermediateValue448;
                        float intermediateValue449;
                        uint bitwiseValue167;
                        if (scalarValue151 == 1u)
                        {
                            float2 vectorValue28 = intermediateValue350.CommittedTriangleBarycentrics();
                            float2 vectorValue29 = intermediateValue350.CommittedTriangleBarycentrics();
                            float scalarValue152 = intermediateValue350.CommittedRayT();
                            uint scalarValue153 = intermediateValue350.CommittedPrimitiveIndex();
                            uint scalarValue154 = intermediateValue350.CommittedInstanceID();
                            uint scalarValue155 = intermediateValue350.CommittedInstanceIndex();
                            intermediateValue447 = vectorValue28.x;
                            intermediateValue448 = vectorValue29.y;
                            intermediateValue449 = scalarValue152;
                            bitwiseValue167 = ((scalarValue154 << 30u) | ((scalarValue153 << 14u) & 1073725440u)) | (scalarValue155 & 16383u);
                        }
                        else
                        {
                            intermediateValue447 = 0.0f;
                            intermediateValue448 = 0.0f;
                            intermediateValue449 = 10000.0f;
                            bitwiseValue167 = intermediateValue89 | 1073741823u;
                        }
                        RayDesc _19ident = {float3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0f, float3(sumValue826, sumValue828, sumValue830), intermediateValue449};
                        intermediateValue450.TraceRayInline(SceneBVH, 512u, 16u, _19ident);
                        bool conditionValue28 = intermediateValue450.Proceed();
                        float intermediateValue470;
                        float intermediateValue472;
                        float intermediateValue474;
                        if (conditionValue28)
                        {
                            float intermediateValue471;
                            float intermediateValue473;
                            float intermediateValue475;
                            float scalarValue156 = 1.0f;
                            float scalarValue157 = 1.0f;
                            float scalarValue158 = 1.0f;
                            bool comparisonValue106;
                            for (;;)
                            {
                                uint scalarValue159 = intermediateValue450.CandidateType();
                                comparisonValue106 = scalarValue159 == 0u;
                                float branchMergedValue6;
                                float branchMergedValue21;
                                float branchMergedValue22;
                                if (comparisonValue106)
                                {
                                    float2 vectorValue30 = intermediateValue450.CandidateTriangleBarycentrics();
                                    float2 vectorValue31 = intermediateValue450.CandidateTriangleBarycentrics();
                                    float scalarValue160 = intermediateValue450.CandidateTriangleRayT();
                                    uint scalarValue161 = intermediateValue450.CandidatePrimitiveIndex();
                                    uint scalarValue162 = intermediateValue450.CandidateInstanceID();
                                    uint scalarValue163 = intermediateValue450.CandidateInstanceIndex();
                                    uint productValue1059 = (scalarValue163 * 76u) + 58u;
                                    uint productValue1060 = (scalarValue163 * 76u) + 61u;
                                    precise float sumValue858 = 1.0f - vectorValue30.x;
                                    precise float sumValue859 = sumValue858 - vectorValue31.y;
                                    uint bitwiseValue309 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue163 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue161 >> 1u);
                                    uint productValue1061 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue163 * 76u) + 54u) * 2 + 0)) + 0u;
                                    bool comparisonValue127 = (scalarValue161 & 1u) == 0u;
                                    uint comparisonValue128 = comparisonValue127 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1061), bitwiseValue309 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1061), bitwiseValue309 * 16 + 0).x;
                                    uint comparisonValue129 = comparisonValue127 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1061), bitwiseValue309 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1061), bitwiseValue309 * 16 + 0).w;
                                    uint comparisonValue130 = comparisonValue127 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1061), bitwiseValue309 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue1061), bitwiseValue309 * 16 + 0).z;
                                    bool productValue1062 = rdByteLoad_objectInstances_uint16_t(0u, productValue1060 * 2 + 0) < 0u;
                                    float intermediateValue565;
                                    float intermediateValue566;
                                    if (productValue1062)
                                    {
                                        uint bitwiseValue311 = comparisonValue130 >> 15u;
                                        precise float bitwiseValue312 = float(bitwiseValue311 & 1u) * 2.0f;
                                        precise float sumValue860 = bitwiseValue312 + (-1.0f);
                                        precise float bitwiseValue313 = float(comparisonValue130 >> 31u) * 2.0f;
                                        precise float sumValue861 = bitwiseValue313 + (-1.0f);
                                        precise float bitwiseValue314 = float((comparisonValue130 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue315 = float(bitwiseValue311 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1063 = sumValue860 * 3.0517578125e-05f;
                                        precise float productValue1064 = sumValue861 * 3.0517578125e-05f;
                                        precise float sumValue862 = bitwiseValue314 + productValue1063;
                                        precise float sumValue863 = bitwiseValue315 + productValue1064;
                                        intermediateValue565 = sumValue862;
                                        intermediateValue566 = sumValue863;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue316 = float(comparisonValue130 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue317 = float(comparisonValue130 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1065 = bitwiseValue316 * 16384.0f;
                                        precise float sumValue864 = productValue1065 + 0.5f;
                                        precise float productValue1066 = bitwiseValue317 * 16384.0f;
                                        precise float sumValue865 = productValue1066 + 0.5f;
                                        precise float productValue1067 = floor(sumValue864) * 6.103515625e-05f;
                                        precise float productValue1068 = floor(sumValue865) * 6.103515625e-05f;
                                        intermediateValue565 = productValue1067;
                                        intermediateValue566 = productValue1068;
                                    }
                                    precise float productValue1069 = sumValue859 * intermediateValue565;
                                    precise float productValue1070 = sumValue859 * intermediateValue566;
                                    precise float sumValue866 = productValue1069 + 0.0f;
                                    precise float sumValue867 = productValue1070 + 0.0f;
                                    float intermediateValue601;
                                    float intermediateValue602;
                                    if (productValue1062)
                                    {
                                        uint bitwiseValue318 = comparisonValue129 >> 15u;
                                        precise float bitwiseValue319 = float(bitwiseValue318 & 1u) * 2.0f;
                                        precise float sumValue868 = bitwiseValue319 + (-1.0f);
                                        precise float bitwiseValue320 = float(comparisonValue129 >> 31u) * 2.0f;
                                        precise float sumValue869 = bitwiseValue320 + (-1.0f);
                                        precise float bitwiseValue321 = float((comparisonValue129 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue322 = float(bitwiseValue318 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1071 = sumValue868 * 3.0517578125e-05f;
                                        precise float productValue1072 = sumValue869 * 3.0517578125e-05f;
                                        precise float sumValue870 = bitwiseValue321 + productValue1071;
                                        precise float sumValue871 = bitwiseValue322 + productValue1072;
                                        intermediateValue601 = sumValue870;
                                        intermediateValue602 = sumValue871;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue323 = float(comparisonValue129 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue324 = float(comparisonValue129 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1073 = bitwiseValue323 * 16384.0f;
                                        precise float sumValue872 = productValue1073 + 0.5f;
                                        precise float productValue1074 = bitwiseValue324 * 16384.0f;
                                        precise float sumValue873 = productValue1074 + 0.5f;
                                        precise float productValue1075 = floor(sumValue872) * 6.103515625e-05f;
                                        precise float productValue1077 = floor(sumValue873) * 6.103515625e-05f;
                                        intermediateValue601 = productValue1075;
                                        intermediateValue602 = productValue1077;
                                    }
                                    precise float productValue1078 = vectorValue30.x * intermediateValue601;
                                    precise float productValue1079 = vectorValue30.x * intermediateValue602;
                                    precise float sumValue874 = sumValue866 + productValue1078;
                                    precise float sumValue875 = sumValue867 + productValue1079;
                                    float intermediateValue619;
                                    float intermediateValue620;
                                    if (productValue1062)
                                    {
                                        uint bitwiseValue325 = comparisonValue128 >> 15u;
                                        precise float bitwiseValue326 = float(bitwiseValue325 & 1u) * 2.0f;
                                        precise float sumValue876 = bitwiseValue326 + (-1.0f);
                                        precise float bitwiseValue327 = float(comparisonValue128 >> 31u) * 2.0f;
                                        precise float sumValue877 = bitwiseValue327 + (-1.0f);
                                        precise float bitwiseValue328 = float((comparisonValue128 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue329 = float(bitwiseValue325 & 65534u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1080 = sumValue876 * 3.0517578125e-05f;
                                        precise float productValue1081 = sumValue877 * 3.0517578125e-05f;
                                        precise float sumValue878 = bitwiseValue328 + productValue1080;
                                        precise float sumValue879 = bitwiseValue329 + productValue1081;
                                        intermediateValue619 = sumValue878;
                                        intermediateValue620 = sumValue879;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue330 = float(comparisonValue128 & 65535u) * 1.525902189314365386962890625e-05f;
                                        precise float bitwiseValue331 = float(comparisonValue128 >> 16u) * 1.525902189314365386962890625e-05f;
                                        precise float productValue1082 = bitwiseValue330 * 16384.0f;
                                        precise float sumValue880 = productValue1082 + 0.5f;
                                        precise float productValue1083 = bitwiseValue331 * 16384.0f;
                                        precise float sumValue881 = productValue1083 + 0.5f;
                                        precise float productValue1084 = floor(sumValue880) * 6.103515625e-05f;
                                        precise float productValue1085 = floor(sumValue881) * 6.103515625e-05f;
                                        intermediateValue619 = productValue1084;
                                        intermediateValue620 = productValue1085;
                                    }
                                    precise float productValue1086 = vectorValue31.y * intermediateValue619;
                                    precise float productValue1087 = vectorValue31.y * intermediateValue620;
                                    precise float sumValue882 = sumValue874 + productValue1086;
                                    precise float sumValue883 = sumValue875 + productValue1087;
                                    precise float productValue1088 = scalarValue160 * 0.083333335816860198974609375f;
                                    precise float sumValue884 = productValue1088 + (-0.25f);
                                    float intermediateValue625;
                                    float intermediateValue626;
                                    float intermediateValue627;
                                    float intermediateValue628;
                                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue1059 * 2 + 0) == 65535u)
                                    {
                                        intermediateValue625 = 1.0f;
                                        intermediateValue626 = 1.0f;
                                        intermediateValue627 = 1.0f;
                                        intermediateValue628 = 1.0f;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits50;
                                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue1059 * 2 + 0) > 4095u)
                                        {
                                            reinterpretedBits50 = asuint(viewCbConstants[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits50 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue1059 * 2 + 0));
                                        }
                                        float4 sampledTextureValue19 = textures[NonUniformResourceIndex(reinterpretedBits50 + 0u)].SampleLevel(defaultSampler, float2(sumValue882, sumValue883), min(sumValue884, 2.0f));
                                        intermediateValue625 = sampledTextureValue19.x;
                                        intermediateValue626 = sampledTextureValue19.y;
                                        intermediateValue627 = sampledTextureValue19.z;
                                        intermediateValue628 = sampledTextureValue19.w;
                                    }
                                    float intermediateValue643;
                                    float intermediateValue644;
                                    float intermediateValue645;
                                    if (scalarValue162 == 2u)
                                    {
                                        float branchMergedValue49;
                                        float branchMergedValue146;
                                        float branchMergedValue147;
                                        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue1060 * 2 + 0) & 128u) == 0u)
                                        {
                                            float intermediateValue648;
                                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue1060 * 2 + 0) & 2048u) == 0u)
                                            {
                                                intermediateValue648 = intermediateValue628;
                                            }
                                            else
                                            {
                                                precise float productValue1089 = intermediateValue628 * 2.0f;
                                                precise float sumValue885 = productValue1089 + (-1.0f);
                                                intermediateValue648 = clamp(sumValue885, 0.0f, 1.0f);
                                            }
                                            precise float sumValue886 = 0.0f - intermediateValue625;
                                            precise float sumValue887 = 0.0f - intermediateValue626;
                                            precise float sumValue888 = 0.0f - intermediateValue627;
                                            precise float productValue1090 = sumValue886 * intermediateValue648;
                                            precise float productValue1091 = sumValue887 * intermediateValue648;
                                            precise float productValue1092 = sumValue888 * intermediateValue648;
                                            precise float sumValue889 = intermediateValue625 + productValue1090;
                                            precise float sumValue890 = intermediateValue626 + productValue1091;
                                            precise float sumValue891 = intermediateValue627 + productValue1092;
                                            branchMergedValue49 = sumValue891;
                                            branchMergedValue146 = sumValue890;
                                            branchMergedValue147 = sumValue889;
                                        }
                                        else
                                        {
                                            branchMergedValue49 = 0.33399999141693115234375f;
                                            branchMergedValue146 = 0.33399999141693115234375f;
                                            branchMergedValue147 = 0.33399999141693115234375f;
                                        }
                                        intermediateValue643 = branchMergedValue147;
                                        intermediateValue644 = branchMergedValue146;
                                        intermediateValue645 = branchMergedValue49;
                                    }
                                    else
                                    {
                                        precise float sumValue892 = 1.0f - intermediateValue628;
                                        intermediateValue643 = sumValue892;
                                        intermediateValue644 = sumValue892;
                                        intermediateValue645 = sumValue892;
                                    }
                                    precise float productValue1093 = scalarValue156 * intermediateValue643;
                                    precise float productValue1094 = scalarValue157 * intermediateValue644;
                                    precise float productValue1095 = scalarValue158 * intermediateValue645;
                                    float intermediateValue522;
                                    float intermediateValue523;
                                    float intermediateValue524;
                                    bool intermediateValue649;
                                    if (!(dot(float3(productValue1093, productValue1094, productValue1095), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                                    {
                                        intermediateValue649 = false;
                                        intermediateValue522 = productValue1093;
                                        intermediateValue523 = productValue1094;
                                        intermediateValue524 = productValue1095;
                                    }
                                    else
                                    {
                                        intermediateValue649 = true;
                                        intermediateValue522 = 0.0f;
                                        intermediateValue523 = 0.0f;
                                        intermediateValue524 = 0.0f;
                                    }
                                    float branchMergedValue165;
                                    float branchMergedValue172;
                                    float branchMergedValue173;
                                    if (intermediateValue649)
                                    {
                                        intermediateValue450.CommitNonOpaqueTriangleHit();
                                        branchMergedValue165 = intermediateValue523;
                                        branchMergedValue172 = intermediateValue522;
                                        branchMergedValue173 = intermediateValue524;
                                    }
                                    else
                                    {
                                        branchMergedValue165 = intermediateValue523;
                                        branchMergedValue172 = intermediateValue522;
                                        branchMergedValue173 = intermediateValue524;
                                    }
                                    branchMergedValue6 = branchMergedValue165;
                                    branchMergedValue21 = branchMergedValue172;
                                    branchMergedValue22 = branchMergedValue173;
                                }
                                else
                                {
                                    branchMergedValue6 = scalarValue157;
                                    branchMergedValue21 = scalarValue156;
                                    branchMergedValue22 = scalarValue158;
                                }
                                intermediateValue473 = branchMergedValue6;
                                intermediateValue471 = branchMergedValue21;
                                intermediateValue475 = branchMergedValue22;
                                bool conditionValue29 = intermediateValue450.Proceed();
                                if (conditionValue29)
                                {
                                    scalarValue156 = intermediateValue471;
                                    scalarValue157 = intermediateValue473;
                                    scalarValue158 = intermediateValue475;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            intermediateValue470 = intermediateValue471;
                            intermediateValue472 = intermediateValue473;
                            intermediateValue474 = intermediateValue475;
                        }
                        else
                        {
                            intermediateValue470 = 1.0f;
                            intermediateValue472 = 1.0f;
                            intermediateValue474 = 1.0f;
                        }
                        uint scalarValue164 = intermediateValue450.CommittedStatus();
                        bool comparisonValue132 = scalarValue164 == 1u;
                        precise float comparisonValue134 = productValue1016 * (comparisonValue132 ? 0.0f : intermediateValue470);
                        precise float comparisonValue135 = productValue1017 * (comparisonValue132 ? 0.0f : intermediateValue472);
                        precise float comparisonValue136 = productValue1018 * (comparisonValue132 ? 0.0f : intermediateValue474);
                        precise float sumValue893 = 1.0f - intermediateValue217;
                        uint branchMergedValue188;
                        uint branchMergedValue220;
                        float branchMergedValue221;
                        float branchMergedValue222;
                        float branchMergedValue223;
                        uint branchMergedValue224;
                        uint branchMergedValue225;
                        float branchMergedValue226;
                        float branchMergedValue227;
                        float branchMergedValue228;
                        uint branchMergedValue234;
                        float branchMergedValue235;
                        float branchMergedValue236;
                        float branchMergedValue237;
                        if ((int(intermediateValue111) > int(0u)) || (asuint(viewCbConstants[91u]).z == 0u))
                        {
                            precise float productValue1096 = sumValue893 * intermediateValue233;
                            precise float productValue1097 = sumValue893 * intermediateValue232;
                            precise float productValue1098 = sumValue893 * intermediateValue231;
                            precise float sumValue894 = 1.0f - sumValue665;
                            precise float sumValue895 = 1.0f - sumValue666;
                            precise float sumValue896 = 1.0f - sumValue667;
                            precise float productValue1099 = productValue1098 * sumValue894;
                            precise float productValue1100 = productValue1097 * sumValue895;
                            precise float productValue1101 = productValue1096 * sumValue896;
                            precise float productValue1102 = productValue1099 * comparisonValue134;
                            precise float productValue1103 = productValue1100 * comparisonValue135;
                            precise float productValue1104 = productValue1101 * comparisonValue136;
                            branchMergedValue188 = intermediateValue107;
                            branchMergedValue220 = intermediateValue105;
                            branchMergedValue221 = productValue1104;
                            branchMergedValue222 = productValue1103;
                            branchMergedValue223 = productValue1102;
                            branchMergedValue224 = productValue1020;
                            branchMergedValue225 = bitwiseValue167;
                            branchMergedValue226 = intermediateValue449;
                            branchMergedValue227 = intermediateValue448;
                            branchMergedValue228 = intermediateValue447;
                            branchMergedValue234 = 1u;
                            branchMergedValue235 = sumValue828;
                            branchMergedValue236 = sumValue826;
                            branchMergedValue237 = sumValue830;
                        }
                        else
                        {
                            branchMergedValue188 = intermediateValue107;
                            branchMergedValue220 = intermediateValue105;
                            branchMergedValue221 = comparisonValue136;
                            branchMergedValue222 = comparisonValue135;
                            branchMergedValue223 = comparisonValue134;
                            branchMergedValue224 = productValue1020;
                            branchMergedValue225 = bitwiseValue167;
                            branchMergedValue226 = intermediateValue449;
                            branchMergedValue227 = intermediateValue448;
                            branchMergedValue228 = intermediateValue447;
                            branchMergedValue234 = 1u;
                            branchMergedValue235 = sumValue828;
                            branchMergedValue236 = sumValue826;
                            branchMergedValue237 = sumValue830;
                        }
                        branchMergedValue40 = branchMergedValue188;
                        branchMergedValue122 = branchMergedValue220;
                        branchMergedValue123 = branchMergedValue221;
                        branchMergedValue124 = branchMergedValue222;
                        branchMergedValue125 = branchMergedValue223;
                        branchMergedValue126 = branchMergedValue224;
                        branchMergedValue127 = branchMergedValue225;
                        branchMergedValue128 = branchMergedValue226;
                        branchMergedValue129 = branchMergedValue227;
                        branchMergedValue130 = branchMergedValue228;
                        branchMergedValue154 = branchMergedValue234;
                        branchMergedValue155 = branchMergedValue235;
                        branchMergedValue156 = branchMergedValue236;
                        branchMergedValue157 = branchMergedValue237;
                    }
                    intermediateValue78 = branchMergedValue156;
                    intermediateValue80 = branchMergedValue155;
                    intermediateValue82 = branchMergedValue157;
                    intermediateValue84 = branchMergedValue130;
                    intermediateValue86 = branchMergedValue129;
                    intermediateValue88 = branchMergedValue128;
                    intermediateValue90 = branchMergedValue127;
                    intermediateValue498 = branchMergedValue126;
                    intermediateValue499 = branchMergedValue125;
                    intermediateValue500 = branchMergedValue124;
                    intermediateValue501 = branchMergedValue123;
                    intermediateValue106 = branchMergedValue122;
                    intermediateValue108 = branchMergedValue40;
                    intermediateValue110 = branchMergedValue154;
                }
                float branchMergedValue5;
                float branchMergedValue18;
                float branchMergedValue19;
                uint branchMergedValue20;
                if (int(intermediateValue111) > int(3u))
                {
                    float scalarValue165 = max(intermediateValue499, max(intermediateValue500, intermediateValue501));
                    uint productValue1105 = (intermediateValue498 * 1664525u) + 1013904223u;
                    precise float bitwiseValue332 = float(productValue1105 & 16777215u) * 5.9604644775390625e-08f;
                    if (bitwiseValue332 > scalarValue165)
                    {
                        branchMergedValue = false;
                        branchMergedValue3 = intermediateValue96;
                        branchMergedValue11 = intermediateValue94;
                        branchMergedValue12 = intermediateValue98;
                        branchMergedValue13 = intermediateValue671;
                        branchMergedValue14 = intermediateValue674;
                        branchMergedValue15 = intermediateValue677;
                        break;
                    }
                    precise float quotientValue50 = intermediateValue499 / scalarValue165;
                    precise float quotientValue51 = intermediateValue500 / scalarValue165;
                    precise float quotientValue52 = intermediateValue501 / scalarValue165;
                    branchMergedValue5 = quotientValue52;
                    branchMergedValue18 = quotientValue51;
                    branchMergedValue19 = quotientValue50;
                    branchMergedValue20 = productValue1105;
                }
                else
                {
                    branchMergedValue5 = intermediateValue501;
                    branchMergedValue18 = intermediateValue500;
                    branchMergedValue19 = intermediateValue499;
                    branchMergedValue20 = intermediateValue498;
                }
                intermediateValue104 = branchMergedValue5;
                intermediateValue102 = branchMergedValue18;
                intermediateValue100 = branchMergedValue19;
                intermediateValue92 = branchMergedValue20;
                uint sumValue897 = intermediateValue111 + 1u;
                if (int(sumValue897) < int(9u))
                {
                    intermediateValue44 = intermediateValue45;
                    intermediateValue47 = intermediateValue48;
                    intermediateValue49 = intermediateValue50;
                    intermediateValue51 = intermediateValue52;
                    intermediateValue53 = intermediateValue54;
                    intermediateValue55 = intermediateValue56;
                    intermediateValue57 = intermediateValue58;
                    intermediateValue59 = intermediateValue60;
                    intermediateValue61 = intermediateValue62;
                    intermediateValue63 = intermediateValue64;
                    intermediateValue65 = intermediateValue66;
                    intermediateValue67 = intermediateValue68;
                    intermediateValue69 = intermediateValue70;
                    intermediateValue71 = intermediateValue72;
                    intermediateValue73 = intermediateValue74;
                    intermediateValue75 = intermediateValue76;
                    intermediateValue77 = intermediateValue78;
                    intermediateValue79 = intermediateValue80;
                    intermediateValue81 = intermediateValue82;
                    intermediateValue83 = intermediateValue84;
                    intermediateValue85 = intermediateValue86;
                    intermediateValue87 = intermediateValue88;
                    intermediateValue89 = intermediateValue90;
                    intermediateValue91 = intermediateValue92;
                    intermediateValue93 = intermediateValue94;
                    intermediateValue95 = intermediateValue96;
                    intermediateValue97 = intermediateValue98;
                    intermediateValue99 = intermediateValue100;
                    intermediateValue101 = intermediateValue102;
                    intermediateValue103 = intermediateValue104;
                    intermediateValue105 = intermediateValue106;
                    intermediateValue107 = intermediateValue108;
                    intermediateValue109 = intermediateValue110;
                    intermediateValue111 = sumValue897;
                    continue;
                }
                else
                {
                    branchMergedValue = false;
                    branchMergedValue3 = intermediateValue96;
                    branchMergedValue11 = intermediateValue94;
                    branchMergedValue12 = intermediateValue98;
                    branchMergedValue13 = intermediateValue672;
                    branchMergedValue14 = intermediateValue675;
                    branchMergedValue15 = intermediateValue678;
                    break;
                }
            }
            else
            {
                uint4 reinterpretedBits35 = asuint(viewCbConstants[76u]);
                uint scalarValue166 = reinterpretedBits35.w;
                float sumValue898 = (-0.0f) - intermediateValue77;
                float sumValue899 = (-0.0f) - intermediateValue79;
                float sumValue900 = (-0.0f) - intermediateValue81;
                float productValue1106 = viewCbConstants[60u].w * viewCbConstants[60u].w;
                float clampedValue27 = (clamp(viewCbConstants[90u].w, 0.0f, 1.0f) * 15.9154567718505859375f) * ((1.0f - productValue1106) / exp2(log2(abs((productValue1106 + 1.0f) - ((viewCbConstants[60u].w * 2.0f) * min(max((-0.0f) - dot(float3(viewCbConstants[52u].xyz), float3(sumValue898, sumValue899, sumValue900)), -1.0f), 1.0f)))) * 1.5f));
                float intermediateValue145;
                float intermediateValue146;
                float intermediateValue147;
                if (scalarValue166 == 1u)
                {
                    intermediateValue145 = viewCbConstants[58u].x;
                    intermediateValue146 = viewCbConstants[58u].y;
                    intermediateValue147 = viewCbConstants[58u].z;
                }
                else
                {
                    float branchMergedValue25;
                    float branchMergedValue50;
                    float branchMergedValue51;
                    if (scalarValue166 == 2u)
                    {
                        uint4 vectorValue32 = asuint(viewCbConstants[74u]);
                        uint scalarValue167 = vectorValue32.z;
                        uint reinterpretedBits14;
                        if (scalarValue167 > 4095u)
                        {
                            reinterpretedBits14 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits14 = scalarValue167;
                        }
                        float scalarValue168 = abs(intermediateValue77);
                        float scalarValue169 = abs(intermediateValue79);
                        float scalarValue170 = abs(intermediateValue81);
                        float intermediateValue191;
                        float comparisonValue22;
                        float intermediateValue192;
                        if ((scalarValue168 >= scalarValue169) && (scalarValue168 >= scalarValue170))
                        {
                            intermediateValue191 = scalarValue168;
                            comparisonValue22 = (intermediateValue77 < 0.0f) ? sumValue900 : intermediateValue81;
                            intermediateValue192 = sumValue899;
                        }
                        else
                        {
                            float branchMergedValue27;
                            float branchMergedValue54;
                            float branchMergedValue55;
                            if (!(scalarValue169 >= scalarValue170))
                            {
                                branchMergedValue27 = sumValue899;
                                branchMergedValue54 = (intermediateValue81 < 0.0f) ? intermediateValue77 : sumValue898;
                                branchMergedValue55 = scalarValue170;
                            }
                            else
                            {
                                branchMergedValue27 = (intermediateValue79 < 0.0f) ? sumValue900 : intermediateValue81;
                                branchMergedValue54 = sumValue898;
                                branchMergedValue55 = scalarValue169;
                            }
                            intermediateValue191 = branchMergedValue55;
                            comparisonValue22 = branchMergedValue54;
                            intermediateValue192 = branchMergedValue27;
                        }
                        precise float quotientValue53 = 0.5f / intermediateValue191;
                        float4 sampledTextureValue20 = textures[NonUniformResourceIndex(reinterpretedBits14 + 0u)].SampleLevel(linearSampler, float2(frac(mad(comparisonValue22, quotientValue53, 0.5f) * viewCbConstants[74u].x), frac(mad(intermediateValue192, quotientValue53, 0.5f) * viewCbConstants[74u].y)), 0.0f);
                        branchMergedValue25 = (viewCbConstants[58u].z * sampledTextureValue20.z) * viewCbConstants[97u].w;
                        branchMergedValue50 = (viewCbConstants[58u].y * sampledTextureValue20.y) * viewCbConstants[97u].w;
                        branchMergedValue51 = (viewCbConstants[58u].x * sampledTextureValue20.x) * viewCbConstants[97u].w;
                    }
                    else
                    {
                        float branchMergedValue175;
                        float branchMergedValue178;
                        float branchMergedValue179;
                        if (scalarValue166 == 4u)
                        {
                            float scalarValue171 = (dot(float3(intermediateValue77, intermediateValue79, intermediateValue81), float3(viewCbConstants[52u].xyz)) * 0.5f) + 0.5f;
                            branchMergedValue175 = ((viewCbConstants[75u].z - viewCbConstants[76u].z) * scalarValue171) + viewCbConstants[76u].z;
                            branchMergedValue178 = ((viewCbConstants[75u].y - viewCbConstants[76u].y) * scalarValue171) + viewCbConstants[76u].y;
                            branchMergedValue179 = ((viewCbConstants[75u].x - viewCbConstants[76u].x) * scalarValue171) + viewCbConstants[76u].x;
                        }
                        else
                        {
                            float comparisonValue21;
                            if (abs(intermediateValue79) < 1.0f)
                            {
                                float quotientValue54 = atan(intermediateValue81 / intermediateValue77);
                                bool conditionValue30 = intermediateValue77 < 0.0f;
                                bool comparisonValue137 = intermediateValue77 == 0.0f;
                                bool comparisonValue140 = intermediateValue81 >= 0.0f;
                                bool conditionValue31 = intermediateValue81 < 0.0f;
                                comparisonValue21 = (comparisonValue137 && comparisonValue140) ? 1.57079637050628662109375f : ((comparisonValue137 && conditionValue31) ? (-1.57079637050628662109375f) : ((conditionValue30 && conditionValue31) ? (quotientValue54 + (-3.1415927410125732421875f)) : ((conditionValue30 && comparisonValue140) ? (quotientValue54 + 3.1415927410125732421875f) : quotientValue54)));
                            }
                            else
                            {
                                comparisonValue21 = 0.0f;
                            }
                            float multiplyAddValue = mad(abs((frac((comparisonValue21 - viewCbConstants[50u].w) * 0.15915493667125701904296875f) * 2.0f) + (-1.0f)), 0.984375f, 0.0078125f);
                            float multiplyAddValue1 = mad(0.5f - (asin(intermediateValue79) * 0.3183098733425140380859375f), 0.96875f, 0.015625f);
                            float productValue1107 = viewCbConstants[51u].w * 7.0f;
                            float scalarValue172 = frac(productValue1107);
                            uint scalarValue173 = uint(int(floor(productValue1107)));
                            float productValue1108 = float(int(scalarValue173 + 1u)) * 0.125f;
                            float scalarValue174 = frac(abs(productValue1108));
                            float4 sampledTextureValue21 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue, multiplyAddValue1, float(int(scalarValue173))), 0.0f);
                            float scalarValue175 = sampledTextureValue21.x;
                            float scalarValue176 = sampledTextureValue21.y;
                            float scalarValue177 = sampledTextureValue21.z;
                            float productValue1109 = scalarValue175 * scalarValue175;
                            float productValue1110 = scalarValue176 * scalarValue176;
                            float productValue1111 = scalarValue177 * scalarValue177;
                            float4 sampledTextureValue22 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue, multiplyAddValue1, float(int(uint(int(((productValue1108 >= ((-0.0f) - productValue1108)) ? scalarValue174 : ((-0.0f) - scalarValue174)) * 8.0f))))), 0.0f);
                            float scalarValue178 = sampledTextureValue22.x;
                            float scalarValue179 = sampledTextureValue22.y;
                            float scalarValue180 = sampledTextureValue22.z;
                            float dotProductValue43 = exp2(log2(max(dot(float3(intermediateValue77, intermediateValue79, intermediateValue81), float3(viewCbConstants[52u].xyz)), 0.0f)) * 7.0f);
                            float productValue1112 = dotProductValue43 * 0.0500000007450580596923828125f;
                            float productValue1113 = ((((scalarValue178 * scalarValue178) - productValue1109) * scalarValue172) + productValue1109) + (productValue1112 * viewCbConstants[50u].x);
                            float productValue1114 = ((((scalarValue179 * scalarValue179) - productValue1110) * scalarValue172) + productValue1110) + (productValue1112 * viewCbConstants[50u].y);
                            float productValue1115 = ((((scalarValue180 * scalarValue180) - productValue1111) * scalarValue172) + productValue1111) + (productValue1112 * viewCbConstants[50u].z);
                            float productValue1116 = (dotProductValue43 * 0.64999997615814208984375f) + 0.3499999940395355224609375f;
                            branchMergedValue175 = ((((viewCbConstants[58u].z * productValue1116) - productValue1115) * viewCbConstants[58u].w) + productValue1115) * viewCbConstants[97u].w;
                            branchMergedValue178 = ((((viewCbConstants[58u].y * productValue1116) - productValue1114) * viewCbConstants[58u].w) + productValue1114) * viewCbConstants[97u].w;
                            branchMergedValue179 = ((((viewCbConstants[58u].x * productValue1116) - productValue1113) * viewCbConstants[58u].w) + productValue1113) * viewCbConstants[97u].w;
                        }
                        branchMergedValue25 = branchMergedValue175;
                        branchMergedValue50 = branchMergedValue178;
                        branchMergedValue51 = branchMergedValue179;
                    }
                    intermediateValue145 = branchMergedValue51;
                    intermediateValue146 = branchMergedValue50;
                    intermediateValue147 = branchMergedValue25;
                }
                branchMergedValue = true;
                branchMergedValue3 = intermediateValue667;
                branchMergedValue11 = intermediateValue668;
                branchMergedValue12 = intermediateValue669;
                branchMergedValue13 = ((intermediateValue147 + (((viewCbConstants[50u].z * clampedValue27) * viewCbConstants[61u].z) * exp2(viewCbConstants[62u].z * (-72.1347503662109375f)))) * intermediateValue103) + intermediateValue97;
                branchMergedValue14 = ((intermediateValue146 + (((viewCbConstants[50u].y * clampedValue27) * viewCbConstants[61u].y) * exp2(viewCbConstants[62u].y * (-72.1347503662109375f)))) * intermediateValue101) + intermediateValue95;
                branchMergedValue15 = ((intermediateValue145 + (((viewCbConstants[50u].x * clampedValue27) * viewCbConstants[61u].x) * exp2(viewCbConstants[62u].x * (-72.1347503662109375f)))) * intermediateValue99) + intermediateValue93;
                break;
            }
        }
        float scalarValue181 = branchMergedValue3;
        float scalarValue182 = branchMergedValue11;
        float scalarValue183 = branchMergedValue12;
        if (branchMergedValue)
        {
            intermediateValue163 = branchMergedValue15;
            intermediateValue165 = branchMergedValue14;
            intermediateValue167 = branchMergedValue13;
            break;
        }
        intermediateValue163 = scalarValue182;
        intermediateValue165 = scalarValue181;
        intermediateValue167 = scalarValue183;
        break;
    }
    float productValue1117 = intermediateValue163 * reinterpretedBits2;
    float productValue1118 = intermediateValue165 * reinterpretedBits2;
    float productValue1119 = intermediateValue167 * reinterpretedBits2;
    bool bitwiseValue333 = ((productValue1117 < 0.0f) || (productValue1118 < 0.0f)) || (productValue1119 < 0.0f);
    float comparisonValue141 = bitwiseValue333 ? 0.0f : productValue1117;
    float comparisonValue142 = bitwiseValue333 ? 0.0f : productValue1118;
    float comparisonValue143 = bitwiseValue333 ? 0.0f : productValue1119;
    bool bitwiseValue334 = (isnan(comparisonValue141) || isnan(comparisonValue142)) || isnan(comparisonValue143);
    outputBufferEmissiveAndLinearRoughness[uint2(bitwiseValue2, bitwiseValue3)] = float4(bitwiseValue334 ? 0.0f : comparisonValue141, bitwiseValue334 ? 0.0f : comparisonValue142, bitwiseValue334 ? 0.0f : comparisonValue143, 0.0f);
}
[numthreads(4, 8, 1)]
void main(ComputeStageInput stage_input)
{
    workgroupId = stage_input.workgroupId;
    localThreadId = stage_input.localThreadId;
    executeComputeStage();
}
