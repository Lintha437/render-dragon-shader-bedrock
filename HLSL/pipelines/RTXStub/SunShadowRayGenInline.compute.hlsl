// RTXStub / SunShadowRayGenInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 43
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
    uint4 reinterpretedBits1 = asuint(viewCbConstants[84u]);
    uint scalarValue1 = reinterpretedBits1.z;
    float4 loadedBufferValue = inputGeometryNormal.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
    float scalarValue2 = loadedBufferValue.x;
    float scalarValue3 = loadedBufferValue.y;
    precise float sumValue = 1.0f - abs(scalarValue2);
    float scalarValue4 = abs(scalarValue3);
    precise float sumValue1 = sumValue - scalarValue4;
    bool conditionValue = sumValue1 < 0.0f;
    precise float sumValue2 = 1.0f - scalarValue4;
    precise float comparisonValue1 = ((scalarValue2 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue2;
    precise float comparisonValue2 = sumValue * ((scalarValue3 >= 0.0f) ? 1.0f : (-1.0f));
    float comparisonValue3 = conditionValue ? comparisonValue1 : scalarValue2;
    float comparisonValue4 = conditionValue ? comparisonValue2 : scalarValue3;
    float inverseLengthValue = rsqrt(dot(float3(comparisonValue3, comparisonValue4, sumValue1), float3(comparisonValue3, comparisonValue4, sumValue1)));
    precise float productValue = inverseLengthValue * comparisonValue3;
    precise float productValue1 = inverseLengthValue * comparisonValue4;
    precise float productValue2 = sumValue1 * inverseLengthValue;
    float4 loadedBufferValue1 = inputPrimaryWorldPosition.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
    float scalarValue5 = loadedBufferValue1.x;
    float scalarValue6 = loadedBufferValue1.y;
    float scalarValue7 = loadedBufferValue1.z;
    precise float productValue3 = productValue * 256.0f;
    uint scalarValue8 = uint(int(productValue3));
    precise float productValue4 = productValue1 * 256.0f;
    uint scalarValue9 = uint(int(productValue4));
    precise float productValue5 = productValue2 * 256.0f;
    uint scalarValue10 = uint(int(productValue5));
    precise float productValue6 = productValue * 1.52587890625e-05f;
    precise float sumValue3 = productValue6 + scalarValue5;
    float reinterpretedBits2 = (abs(scalarValue5) < 0.03125f) ? sumValue3 : asfloat(((scalarValue5 < 0.0f) ? (-scalarValue8) : scalarValue8) + asuint(scalarValue5));
    precise float productValue7 = productValue1 * 1.52587890625e-05f;
    precise float sumValue4 = productValue7 + scalarValue6;
    float reinterpretedBits3 = (abs(scalarValue6) < 0.03125f) ? sumValue4 : asfloat(((scalarValue6 < 0.0f) ? (-scalarValue9) : scalarValue9) + asuint(scalarValue6));
    precise float productValue8 = productValue2 * 1.52587890625e-05f;
    precise float sumValue5 = productValue8 + scalarValue7;
    float reinterpretedBits4 = (abs(scalarValue7) < 0.03125f) ? sumValue5 : asfloat(((scalarValue7 < 0.0f) ? (-scalarValue10) : scalarValue10) + asuint(scalarValue7));
    bool dotProductValue = dot(float3(0.847100675106048583984375f, 0.2079117000102996826171875f, 0.489073812961578369140625f), float3(viewCbConstants[52u].xyz)) > 0.949999988079071044921875f;
    float comparisonValue5 = dotProductValue ? (-0.639436304569244384765625f) : 0.847100675106048583984375f;
    float comparisonValue6 = dotProductValue ? (-0.3907311260700225830078125f) : 0.2079117000102996826171875f;
    float comparisonValue7 = dotProductValue ? 0.6621558666229248046875f : 0.489073812961578369140625f;
    precise float dotProductValue1 = dot(float3(comparisonValue5, comparisonValue6, comparisonValue7), float3(viewCbConstants[52u].xyz));
    precise float productValue9 = viewCbConstants[52u].x * dotProductValue1;
    precise float productValue10 = viewCbConstants[52u].y * dotProductValue1;
    precise float productValue11 = viewCbConstants[52u].z * dotProductValue1;
    precise float sumValue6 = comparisonValue5 - productValue9;
    precise float sumValue7 = comparisonValue6 - productValue10;
    precise float sumValue8 = comparisonValue7 - productValue11;
    float inverseLengthValue1 = rsqrt(dot(float3(sumValue6, sumValue7, sumValue8), float3(sumValue6, sumValue7, sumValue8)));
    precise float productValue12 = sumValue6 * inverseLengthValue1;
    precise float productValue13 = sumValue7 * inverseLengthValue1;
    precise float productValue14 = sumValue8 * inverseLengthValue1;
    precise float productValue15 = viewCbConstants[52u].y * productValue14;
    precise float productValue16 = viewCbConstants[52u].z * productValue13;
    precise float sumValue9 = productValue15 - productValue16;
    precise float productValue17 = viewCbConstants[52u].z * productValue12;
    precise float productValue18 = viewCbConstants[52u].x * productValue14;
    precise float sumValue10 = productValue17 - productValue18;
    precise float productValue19 = viewCbConstants[52u].x * productValue13;
    precise float productValue20 = viewCbConstants[52u].y * productValue12;
    precise float sumValue11 = productValue19 - productValue20;
    float4 loadedBufferValue2 = blueNoiseTexture.Load(int4(uint3(bitwiseValue2 & 255u, bitwiseValue3 & 255u, (scalarValue1 >> 1u) & 127u), 0u));
    bool comparisonValue8 = (scalarValue1 & 1u) == 0u;
    float nonlinearValue = sqrt(comparisonValue8 ? loadedBufferValue2.x : loadedBufferValue2.z);
    precise float comparisonValue9 = (comparisonValue8 ? loadedBufferValue2.y : loadedBufferValue2.w) * 6.283185482025146484375f;
    precise float wavePhaseValue = nonlinearValue * cos(comparisonValue9);
    precise float wavePhaseValue1 = nonlinearValue * sin(comparisonValue9);
    precise float productValue21 = wavePhaseValue * 0.01860214583575725555419921875f;
    precise float productValue22 = wavePhaseValue1 * 0.01860214583575725555419921875f;
    precise float productValue23 = productValue12 * productValue21;
    precise float productValue24 = productValue13 * productValue21;
    precise float productValue25 = productValue14 * productValue21;
    precise float productValue26 = sumValue9 * productValue22;
    precise float productValue27 = sumValue10 * productValue22;
    precise float productValue28 = sumValue11 * productValue22;
    precise float sumValue12 = productValue23 + productValue26;
    precise float sumValue13 = productValue24 + productValue27;
    precise float sumValue14 = productValue25 + productValue28;
    precise float sumValue15 = viewCbConstants[52u].x + sumValue12;
    precise float sumValue16 = viewCbConstants[52u].y + sumValue13;
    precise float sumValue17 = viewCbConstants[52u].z + sumValue14;
    float intermediateValue14;
    float intermediateValue18;
    float intermediateValue22;
    float intermediateValue26;
    if (dot(float3(sumValue15, sumValue16, sumValue17), float3(productValue, productValue1, productValue2)) < 0.0f)
    {
        intermediateValue14 = 0.0f;
        intermediateValue18 = 0.0f;
        intermediateValue22 = 0.0f;
        intermediateValue26 = 0.0f;
    }
    else
    {
        float inverseLengthValue2 = rsqrt(dot(float3(sumValue15, sumValue16, sumValue17), float3(sumValue15, sumValue16, sumValue17)));
        float productValue29 = inverseLengthValue2 * sumValue15;
        float productValue30 = inverseLengthValue2 * sumValue16;
        float productValue31 = inverseLengthValue2 * sumValue17;
        RayDesc _4ident = {float3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4), 0.0f, float3(viewCbConstants[53u].xyz), 10000.0f};
        intermediateValue29.TraceRayInline(SceneBVH, 512u, 32u, _4ident);
        bool conditionValue1 = intermediateValue29.Proceed();
        if (conditionValue1)
        {
            bool intermediateValue41;
            bool comparisonValue11;
            for (;;)
            {
                uint scalarValue11 = intermediateValue29.CandidateType();
                comparisonValue11 = scalarValue11 == 0u;
                if (comparisonValue11)
                {
                    float2 vectorValue = intermediateValue29.CandidateTriangleBarycentrics();
                    float2 vectorValue1 = intermediateValue29.CandidateTriangleBarycentrics();
                    uint scalarValue12 = intermediateValue29.CandidatePrimitiveIndex();
                    uint scalarValue13 = intermediateValue29.CandidateInstanceID();
                    uint scalarValue14 = intermediateValue29.CandidateInstanceIndex();
                    uint productValue32 = (scalarValue14 * 76u) + 58u;
                    uint productValue33 = (scalarValue14 * 76u) + 61u;
                    precise float sumValue18 = 1.0f - vectorValue.x;
                    precise float sumValue19 = sumValue18 - vectorValue1.y;
                    uint bitwiseValue4 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue14 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue12 >> 1u);
                    uint productValue34 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue14 * 76u) + 54u) * 2 + 0)) + 0u;
                    bool comparisonValue10 = (scalarValue12 & 1u) == 0u;
                    uint comparisonValue12 = comparisonValue10 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue34), bitwiseValue4 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue34), bitwiseValue4 * 16 + 0).x;
                    uint comparisonValue13 = comparisonValue10 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue34), bitwiseValue4 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue34), bitwiseValue4 * 16 + 0).w;
                    uint comparisonValue14 = comparisonValue10 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue34), bitwiseValue4 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue34), bitwiseValue4 * 16 + 0).z;
                    bool productValue35 = rdByteLoad_objectInstances_uint16_t(0u, productValue33 * 2 + 0) < 0u;
                    float intermediateValue56;
                    float intermediateValue57;
                    if (productValue35)
                    {
                        uint bitwiseValue5 = comparisonValue14 >> 15u;
                        precise float bitwiseValue6 = float(bitwiseValue5 & 1u) * 2.0f;
                        precise float sumValue20 = bitwiseValue6 + (-1.0f);
                        precise float bitwiseValue7 = float(comparisonValue14 >> 31u) * 2.0f;
                        precise float sumValue21 = bitwiseValue7 + (-1.0f);
                        precise float bitwiseValue8 = float((comparisonValue14 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue9 = float(bitwiseValue5 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue36 = sumValue20 * 3.0517578125e-05f;
                        precise float productValue37 = sumValue21 * 3.0517578125e-05f;
                        precise float sumValue22 = bitwiseValue8 + productValue36;
                        precise float sumValue23 = bitwiseValue9 + productValue37;
                        intermediateValue56 = sumValue22;
                        intermediateValue57 = sumValue23;
                    }
                    else
                    {
                        precise float bitwiseValue10 = float(comparisonValue14 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue11 = float(comparisonValue14 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue38 = bitwiseValue10 * 16384.0f;
                        precise float sumValue24 = productValue38 + 0.5f;
                        precise float productValue39 = bitwiseValue11 * 16384.0f;
                        precise float sumValue25 = productValue39 + 0.5f;
                        precise float productValue40 = floor(sumValue24) * 6.103515625e-05f;
                        precise float productValue41 = floor(sumValue25) * 6.103515625e-05f;
                        intermediateValue56 = productValue40;
                        intermediateValue57 = productValue41;
                    }
                    precise float productValue42 = sumValue19 * intermediateValue56;
                    precise float productValue43 = sumValue19 * intermediateValue57;
                    precise float sumValue26 = productValue42 + 0.0f;
                    precise float sumValue27 = productValue43 + 0.0f;
                    float intermediateValue83;
                    float intermediateValue84;
                    if (productValue35)
                    {
                        uint bitwiseValue12 = comparisonValue13 >> 15u;
                        precise float bitwiseValue13 = float(bitwiseValue12 & 1u) * 2.0f;
                        precise float sumValue28 = bitwiseValue13 + (-1.0f);
                        precise float bitwiseValue14 = float(comparisonValue13 >> 31u) * 2.0f;
                        precise float sumValue29 = bitwiseValue14 + (-1.0f);
                        precise float bitwiseValue15 = float((comparisonValue13 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue16 = float(bitwiseValue12 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue44 = sumValue28 * 3.0517578125e-05f;
                        precise float productValue45 = sumValue29 * 3.0517578125e-05f;
                        precise float sumValue30 = bitwiseValue15 + productValue44;
                        precise float sumValue31 = bitwiseValue16 + productValue45;
                        intermediateValue83 = sumValue30;
                        intermediateValue84 = sumValue31;
                    }
                    else
                    {
                        precise float bitwiseValue17 = float(comparisonValue13 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue18 = float(comparisonValue13 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue46 = bitwiseValue17 * 16384.0f;
                        precise float sumValue32 = productValue46 + 0.5f;
                        precise float productValue47 = bitwiseValue18 * 16384.0f;
                        precise float sumValue33 = productValue47 + 0.5f;
                        precise float productValue48 = floor(sumValue32) * 6.103515625e-05f;
                        precise float productValue49 = floor(sumValue33) * 6.103515625e-05f;
                        intermediateValue83 = productValue48;
                        intermediateValue84 = productValue49;
                    }
                    precise float productValue50 = vectorValue.x * intermediateValue83;
                    precise float productValue51 = vectorValue.x * intermediateValue84;
                    precise float sumValue34 = sumValue26 + productValue50;
                    precise float sumValue35 = sumValue27 + productValue51;
                    float intermediateValue110;
                    float intermediateValue111;
                    if (productValue35)
                    {
                        uint bitwiseValue19 = comparisonValue12 >> 15u;
                        precise float bitwiseValue20 = float(bitwiseValue19 & 1u) * 2.0f;
                        precise float sumValue36 = bitwiseValue20 + (-1.0f);
                        precise float bitwiseValue21 = float(comparisonValue12 >> 31u) * 2.0f;
                        precise float sumValue37 = bitwiseValue21 + (-1.0f);
                        precise float bitwiseValue22 = float((comparisonValue12 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue23 = float(bitwiseValue19 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue52 = sumValue36 * 3.0517578125e-05f;
                        precise float productValue53 = sumValue37 * 3.0517578125e-05f;
                        precise float sumValue38 = bitwiseValue22 + productValue52;
                        precise float sumValue39 = bitwiseValue23 + productValue53;
                        intermediateValue110 = sumValue38;
                        intermediateValue111 = sumValue39;
                    }
                    else
                    {
                        precise float bitwiseValue24 = float(comparisonValue12 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue25 = float(comparisonValue12 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue54 = bitwiseValue24 * 16384.0f;
                        precise float sumValue40 = productValue54 + 0.5f;
                        precise float productValue55 = bitwiseValue25 * 16384.0f;
                        precise float sumValue41 = productValue55 + 0.5f;
                        precise float productValue56 = floor(sumValue40) * 6.103515625e-05f;
                        precise float productValue57 = floor(sumValue41) * 6.103515625e-05f;
                        intermediateValue110 = productValue56;
                        intermediateValue111 = productValue57;
                    }
                    precise float productValue58 = vectorValue1.y * intermediateValue110;
                    precise float productValue59 = vectorValue1.y * intermediateValue111;
                    precise float sumValue42 = sumValue34 + productValue58;
                    precise float sumValue43 = sumValue35 + productValue59;
                    float intermediateValue124;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue32 * 2 + 0) == 65535u)
                    {
                        intermediateValue124 = 1.0f;
                    }
                    else
                    {
                        uint reinterpretedBits9;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue32 * 2 + 0) > 4095u)
                        {
                            reinterpretedBits9 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits9 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue32 * 2 + 0));
                        }
                        intermediateValue124 = textures[NonUniformResourceIndex(reinterpretedBits9 + 0u)].SampleLevel(defaultSampler, float2(sumValue42, sumValue43), -0.25f).w;
                    }
                    uint comparisonValue32;
                    if (scalarValue13 == 2u)
                    {
                        comparisonValue32 = 0u;
                    }
                    else
                    {
                        comparisonValue32 = uint(intermediateValue124 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue33 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                    }
                    if (comparisonValue32 == 0u)
                    {
                        intermediateValue29.CommitNonOpaqueTriangleHit();
                    }
                }
                intermediateValue41 = intermediateValue29.Proceed();
                if (intermediateValue41)
                {
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        uint scalarValue15 = intermediateValue29.CommittedStatus();
        float intermediateValue35;
        if (scalarValue15 == 1u)
        {
            float scalarValue16 = intermediateValue29.CommittedRayT();
            intermediateValue35 = scalarValue16;
        }
        else
        {
            intermediateValue35 = 10000.0f;
        }
        float branchMergedValue10;
        float branchMergedValue13;
        float branchMergedValue14;
        float branchMergedValue15;
        if (intermediateValue35 < 10000.0f)
        {
            precise float productValue60 = intermediateValue35 * viewCbConstants[63u].x;
            precise float productValue61 = intermediateValue35 * viewCbConstants[63u].y;
            precise float productValue62 = intermediateValue35 * viewCbConstants[63u].z;
            precise float productValue63 = productValue60 * (-1.44269502162933349609375f);
            precise float productValue64 = productValue61 * (-1.44269502162933349609375f);
            precise float productValue65 = productValue62 * (-1.44269502162933349609375f);
            precise float productValue66 = viewCbConstants[53u].x * intermediateValue35;
            precise float sumValue44 = productValue66 + reinterpretedBits2;
            precise float productValue67 = viewCbConstants[53u].z * intermediateValue35;
            precise float sumValue45 = productValue67 + reinterpretedBits4;
            precise float productValue68 = sumValue44 * viewCbConstants[83u].z;
            precise float sumValue46 = productValue68 + viewCbConstants[84u].x;
            precise float productValue69 = sumValue45 * viewCbConstants[83u].w;
            precise float sumValue47 = productValue69 + viewCbConstants[84u].y;
            float4 sampledTextureValue = wibblyTexture.SampleLevel(linearWrapSampler, float2(sumValue46, sumValue47), 0.0f);
            precise float sumValue48 = sampledTextureValue.x + (-0.5f);
            precise float sumValue49 = sampledTextureValue.y + (-0.5f);
            precise float productValue70 = sumValue44 * viewCbConstants[82u].z;
            precise float sumValue50 = productValue70 + viewCbConstants[83u].x;
            precise float productValue71 = sumValue45 * viewCbConstants[82u].w;
            precise float sumValue51 = productValue71 + viewCbConstants[83u].y;
            precise float productValue72 = sumValue48 * 0.4000000059604644775390625f;
            precise float productValue73 = sumValue49 * 0.4000000059604644775390625f;
            precise float sumValue52 = sumValue50 + productValue72;
            precise float sumValue53 = productValue73 + sumValue51;
            precise float productValue74 = viewCbConstants[68u].w * 63.0f;
            uint scalarValue17 = uint(int(floor(productValue74)));
            precise float productValue75 = float(int(scalarValue17 + 1u)) * 0.015625f;
            precise float sumValue54 = (-0.0f) - productValue75;
            float scalarValue18 = frac(abs(productValue75));
            precise float sumValue55 = (-0.0f) - scalarValue18;
            precise float comparisonValue15 = ((productValue75 >= sumValue54) ? scalarValue18 : sumValue55) * 64.0f;
            float4 sampledTextureValue1 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue52, sumValue53, float(int(scalarValue17))), 0.0f);
            float scalarValue19 = sampledTextureValue1.x;
            precise float sampledTextureValue2 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue52, sumValue53, float(int(uint(int(comparisonValue15))))), 0.0f).x - scalarValue19;
            precise float productValue76 = frac(productValue74) * sampledTextureValue2;
            precise float sumValue56 = scalarValue19 + productValue76;
            precise float productValue77 = sumValue56 * 7.0f;
            precise float sumValue57 = productValue77 + 0.800000011920928955078125f;
            precise float productValue78 = intermediateValue35 * (-0.100000001490116119384765625f);
            precise float sumValue58 = sumValue57 + (-1.0f);
            precise float exponentialValue = exp2(productValue78) * sumValue58;
            precise float sumValue59 = exponentialValue + 1.0f;
            precise float exponentialValue1 = exp2(productValue63) * sumValue59;
            precise float exponentialValue2 = exp2(productValue64) * sumValue59;
            precise float exponentialValue3 = exp2(productValue65) * sumValue59;
            RayDesc _5ident = {float3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4), 0.0f, float3(viewCbConstants[53u].xyz), intermediateValue35};
            intermediateValue45.TraceRayInline(SceneBVH, 512u, 22u, _5ident);
            bool conditionValue2 = intermediateValue45.Proceed();
            float intermediateValue47;
            float intermediateValue49;
            float intermediateValue51;
            if (conditionValue2)
            {
                float intermediateValue48;
                float intermediateValue50;
                float intermediateValue52;
                float scalarValue20 = exponentialValue1;
                float scalarValue21 = exponentialValue2;
                float scalarValue22 = exponentialValue3;
                bool comparisonValue17;
                for (;;)
                {
                    uint scalarValue23 = intermediateValue45.CandidateType();
                    comparisonValue17 = scalarValue23 == 0u;
                    float branchMergedValue;
                    float branchMergedValue3;
                    float branchMergedValue4;
                    if (comparisonValue17)
                    {
                        float2 vectorValue2 = intermediateValue45.CandidateTriangleBarycentrics();
                        float2 vectorValue3 = intermediateValue45.CandidateTriangleBarycentrics();
                        float scalarValue24 = intermediateValue45.CandidateTriangleRayT();
                        uint scalarValue25 = intermediateValue45.CandidatePrimitiveIndex();
                        uint scalarValue26 = intermediateValue45.CandidateInstanceID();
                        uint scalarValue27 = intermediateValue45.CandidateInstanceIndex();
                        uint productValue79 = (scalarValue27 * 76u) + 58u;
                        uint productValue80 = (scalarValue27 * 76u) + 61u;
                        precise float sumValue60 = 1.0f - vectorValue2.x;
                        precise float sumValue61 = sumValue60 - vectorValue3.y;
                        uint bitwiseValue26 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue27 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue25 >> 1u);
                        uint productValue81 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue27 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue16 = (scalarValue25 & 1u) == 0u;
                        uint comparisonValue18 = comparisonValue16 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue81), bitwiseValue26 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue81), bitwiseValue26 * 16 + 0).x;
                        uint comparisonValue19 = comparisonValue16 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue81), bitwiseValue26 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue81), bitwiseValue26 * 16 + 0).w;
                        uint comparisonValue20 = comparisonValue16 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue81), bitwiseValue26 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue81), bitwiseValue26 * 16 + 0).z;
                        bool productValue82 = rdByteLoad_objectInstances_uint16_t(0u, productValue80 * 2 + 0) < 0u;
                        float intermediateValue102;
                        float intermediateValue103;
                        if (productValue82)
                        {
                            uint bitwiseValue27 = comparisonValue20 >> 15u;
                            precise float bitwiseValue28 = float(bitwiseValue27 & 1u) * 2.0f;
                            precise float sumValue62 = bitwiseValue28 + (-1.0f);
                            precise float bitwiseValue29 = float(comparisonValue20 >> 31u) * 2.0f;
                            precise float sumValue63 = bitwiseValue29 + (-1.0f);
                            precise float bitwiseValue30 = float((comparisonValue20 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue31 = float(bitwiseValue27 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue83 = sumValue62 * 3.0517578125e-05f;
                            precise float productValue84 = sumValue63 * 3.0517578125e-05f;
                            precise float sumValue64 = bitwiseValue30 + productValue83;
                            precise float sumValue65 = bitwiseValue31 + productValue84;
                            intermediateValue102 = sumValue64;
                            intermediateValue103 = sumValue65;
                        }
                        else
                        {
                            precise float bitwiseValue32 = float(comparisonValue20 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue33 = float(comparisonValue20 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue85 = bitwiseValue32 * 16384.0f;
                            precise float sumValue66 = productValue85 + 0.5f;
                            precise float productValue86 = bitwiseValue33 * 16384.0f;
                            precise float sumValue67 = productValue86 + 0.5f;
                            precise float productValue87 = floor(sumValue66) * 6.103515625e-05f;
                            precise float productValue88 = floor(sumValue67) * 6.103515625e-05f;
                            intermediateValue102 = productValue87;
                            intermediateValue103 = productValue88;
                        }
                        precise float productValue89 = sumValue61 * intermediateValue102;
                        precise float productValue90 = sumValue61 * intermediateValue103;
                        precise float sumValue68 = productValue89 + 0.0f;
                        precise float sumValue69 = productValue90 + 0.0f;
                        float intermediateValue125;
                        float intermediateValue126;
                        if (productValue82)
                        {
                            uint bitwiseValue34 = comparisonValue19 >> 15u;
                            precise float bitwiseValue35 = float(bitwiseValue34 & 1u) * 2.0f;
                            precise float sumValue70 = bitwiseValue35 + (-1.0f);
                            precise float bitwiseValue36 = float(comparisonValue19 >> 31u) * 2.0f;
                            precise float sumValue71 = bitwiseValue36 + (-1.0f);
                            precise float bitwiseValue37 = float((comparisonValue19 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue38 = float(bitwiseValue34 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue91 = sumValue70 * 3.0517578125e-05f;
                            precise float productValue92 = sumValue71 * 3.0517578125e-05f;
                            precise float sumValue72 = bitwiseValue37 + productValue91;
                            precise float sumValue73 = bitwiseValue38 + productValue92;
                            intermediateValue125 = sumValue72;
                            intermediateValue126 = sumValue73;
                        }
                        else
                        {
                            precise float bitwiseValue39 = float(comparisonValue19 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue40 = float(comparisonValue19 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue93 = bitwiseValue39 * 16384.0f;
                            precise float sumValue74 = productValue93 + 0.5f;
                            precise float productValue94 = bitwiseValue40 * 16384.0f;
                            precise float sumValue75 = productValue94 + 0.5f;
                            precise float productValue95 = floor(sumValue74) * 6.103515625e-05f;
                            precise float productValue96 = floor(sumValue75) * 6.103515625e-05f;
                            intermediateValue125 = productValue95;
                            intermediateValue126 = productValue96;
                        }
                        precise float productValue97 = vectorValue2.x * intermediateValue125;
                        precise float productValue98 = vectorValue2.x * intermediateValue126;
                        precise float sumValue76 = sumValue68 + productValue97;
                        precise float sumValue77 = sumValue69 + productValue98;
                        float intermediateValue131;
                        float intermediateValue132;
                        if (productValue82)
                        {
                            uint bitwiseValue41 = comparisonValue18 >> 15u;
                            precise float bitwiseValue42 = float(bitwiseValue41 & 1u) * 2.0f;
                            precise float sumValue78 = bitwiseValue42 + (-1.0f);
                            precise float bitwiseValue43 = float(comparisonValue18 >> 31u) * 2.0f;
                            precise float sumValue79 = bitwiseValue43 + (-1.0f);
                            precise float bitwiseValue44 = float((comparisonValue18 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue45 = float(bitwiseValue41 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue99 = sumValue78 * 3.0517578125e-05f;
                            precise float productValue100 = sumValue79 * 3.0517578125e-05f;
                            precise float sumValue80 = bitwiseValue44 + productValue99;
                            precise float sumValue81 = bitwiseValue45 + productValue100;
                            intermediateValue131 = sumValue80;
                            intermediateValue132 = sumValue81;
                        }
                        else
                        {
                            precise float bitwiseValue46 = float(comparisonValue18 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue47 = float(comparisonValue18 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue101 = bitwiseValue46 * 16384.0f;
                            precise float sumValue82 = productValue101 + 0.5f;
                            precise float productValue102 = bitwiseValue47 * 16384.0f;
                            precise float sumValue83 = productValue102 + 0.5f;
                            precise float productValue103 = floor(sumValue82) * 6.103515625e-05f;
                            precise float productValue104 = floor(sumValue83) * 6.103515625e-05f;
                            intermediateValue131 = productValue103;
                            intermediateValue132 = productValue104;
                        }
                        precise float productValue105 = vectorValue3.y * intermediateValue131;
                        precise float productValue106 = vectorValue3.y * intermediateValue132;
                        precise float sumValue84 = sumValue76 + productValue105;
                        precise float sumValue85 = sumValue77 + productValue106;
                        precise float productValue107 = scalarValue24 * 0.083333335816860198974609375f;
                        precise float sumValue86 = productValue107 + (-0.25f);
                        float intermediateValue133;
                        float intermediateValue134;
                        float intermediateValue135;
                        float intermediateValue136;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue79 * 2 + 0) == 65535u)
                        {
                            intermediateValue133 = 1.0f;
                            intermediateValue134 = 1.0f;
                            intermediateValue135 = 1.0f;
                            intermediateValue136 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits10;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue79 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits10 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits10 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue79 * 2 + 0));
                            }
                            float4 sampledTextureValue3 = textures[NonUniformResourceIndex(reinterpretedBits10 + 0u)].SampleLevel(defaultSampler, float2(sumValue84, sumValue85), min(sumValue86, 2.0f));
                            intermediateValue133 = sampledTextureValue3.x;
                            intermediateValue134 = sampledTextureValue3.y;
                            intermediateValue135 = sampledTextureValue3.z;
                            intermediateValue136 = sampledTextureValue3.w;
                        }
                        float intermediateValue145;
                        float intermediateValue146;
                        float intermediateValue147;
                        if (scalarValue26 == 2u)
                        {
                            float branchMergedValue11;
                            float branchMergedValue17;
                            float branchMergedValue18;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue80 * 2 + 0) & 128u) == 0u)
                            {
                                float intermediateValue150;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue80 * 2 + 0) & 2048u) == 0u)
                                {
                                    intermediateValue150 = intermediateValue136;
                                }
                                else
                                {
                                    precise float productValue108 = intermediateValue136 * 2.0f;
                                    precise float sumValue87 = productValue108 + (-1.0f);
                                    intermediateValue150 = clamp(sumValue87, 0.0f, 1.0f);
                                }
                                precise float sumValue88 = 0.0f - intermediateValue133;
                                precise float sumValue89 = 0.0f - intermediateValue134;
                                precise float sumValue90 = 0.0f - intermediateValue135;
                                precise float productValue109 = sumValue88 * intermediateValue150;
                                precise float productValue110 = sumValue89 * intermediateValue150;
                                precise float productValue111 = sumValue90 * intermediateValue150;
                                precise float sumValue91 = intermediateValue133 + productValue109;
                                precise float sumValue92 = intermediateValue134 + productValue110;
                                precise float sumValue93 = intermediateValue135 + productValue111;
                                branchMergedValue11 = sumValue93;
                                branchMergedValue17 = sumValue91;
                                branchMergedValue18 = sumValue92;
                            }
                            else
                            {
                                branchMergedValue11 = 0.33399999141693115234375f;
                                branchMergedValue17 = 0.33399999141693115234375f;
                                branchMergedValue18 = 0.33399999141693115234375f;
                            }
                            intermediateValue145 = branchMergedValue17;
                            intermediateValue146 = branchMergedValue18;
                            intermediateValue147 = branchMergedValue11;
                        }
                        else
                        {
                            precise float sumValue94 = 1.0f - intermediateValue136;
                            intermediateValue145 = sumValue94;
                            intermediateValue146 = sumValue94;
                            intermediateValue147 = sumValue94;
                        }
                        precise float productValue112 = scalarValue20 * intermediateValue145;
                        precise float productValue113 = scalarValue21 * intermediateValue146;
                        precise float productValue114 = scalarValue22 * intermediateValue147;
                        float intermediateValue73;
                        float intermediateValue74;
                        float intermediateValue75;
                        bool intermediateValue151;
                        if (!(dot(float3(productValue112, productValue113, productValue114), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                        {
                            intermediateValue151 = false;
                            intermediateValue73 = productValue112;
                            intermediateValue74 = productValue113;
                            intermediateValue75 = productValue114;
                        }
                        else
                        {
                            intermediateValue151 = true;
                            intermediateValue73 = 0.0f;
                            intermediateValue74 = 0.0f;
                            intermediateValue75 = 0.0f;
                        }
                        float branchMergedValue23;
                        float branchMergedValue26;
                        float branchMergedValue27;
                        if (intermediateValue151)
                        {
                            intermediateValue45.CommitNonOpaqueTriangleHit();
                            branchMergedValue23 = intermediateValue75;
                            branchMergedValue26 = intermediateValue74;
                            branchMergedValue27 = intermediateValue73;
                        }
                        else
                        {
                            branchMergedValue23 = intermediateValue75;
                            branchMergedValue26 = intermediateValue74;
                            branchMergedValue27 = intermediateValue73;
                        }
                        branchMergedValue = branchMergedValue23;
                        branchMergedValue3 = branchMergedValue26;
                        branchMergedValue4 = branchMergedValue27;
                    }
                    else
                    {
                        branchMergedValue = scalarValue22;
                        branchMergedValue3 = scalarValue21;
                        branchMergedValue4 = scalarValue20;
                    }
                    intermediateValue52 = branchMergedValue;
                    intermediateValue50 = branchMergedValue3;
                    intermediateValue48 = branchMergedValue4;
                    bool conditionValue3 = intermediateValue45.Proceed();
                    if (conditionValue3)
                    {
                        scalarValue20 = intermediateValue48;
                        scalarValue21 = intermediateValue50;
                        scalarValue22 = intermediateValue52;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue47 = intermediateValue48;
                intermediateValue49 = intermediateValue50;
                intermediateValue51 = intermediateValue52;
            }
            else
            {
                intermediateValue47 = exponentialValue1;
                intermediateValue49 = exponentialValue2;
                intermediateValue51 = exponentialValue3;
            }
            uint scalarValue28 = intermediateValue45.CommittedStatus();
            float intermediateValue16;
            float intermediateValue20;
            float intermediateValue24;
            float intermediateValue27;
            if (scalarValue28 == 1u)
            {
                float scalarValue29 = intermediateValue45.CommittedRayT();
                intermediateValue16 = 0.0f;
                intermediateValue20 = 0.0f;
                intermediateValue24 = 0.0f;
                intermediateValue27 = scalarValue29;
            }
            else
            {
                intermediateValue16 = intermediateValue47;
                intermediateValue20 = intermediateValue49;
                intermediateValue24 = intermediateValue51;
                intermediateValue27 = 10000.0f;
            }
            float branchMergedValue33;
            float branchMergedValue37;
            float branchMergedValue38;
            float branchMergedValue39;
            if (dot(float3(intermediateValue16, intermediateValue20, intermediateValue24), 1.0f.xxx) > 0.00999999977648258209228515625f)
            {
                RayDesc _6ident = {float3(sumValue44, mad(viewCbConstants[53u].y, intermediateValue35, reinterpretedBits3), sumValue45), 0.0f, float3(productValue29, productValue30, productValue31), 10000.0f};
                intermediateValue77.TraceRayInline(SceneBVH, 512u, 22u, _6ident);
                bool conditionValue4 = intermediateValue77.Proceed();
                float intermediateValue85;
                float intermediateValue87;
                float intermediateValue89;
                if (conditionValue4)
                {
                    float intermediateValue86;
                    float intermediateValue88;
                    float intermediateValue90;
                    float scalarValue30 = intermediateValue16;
                    float scalarValue31 = intermediateValue20;
                    float scalarValue32 = intermediateValue24;
                    bool comparisonValue27;
                    for (;;)
                    {
                        uint scalarValue33 = intermediateValue77.CandidateType();
                        comparisonValue27 = scalarValue33 == 0u;
                        float branchMergedValue2;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        if (comparisonValue27)
                        {
                            float2 vectorValue4 = intermediateValue77.CandidateTriangleBarycentrics();
                            float2 vectorValue5 = intermediateValue77.CandidateTriangleBarycentrics();
                            float scalarValue34 = intermediateValue77.CandidateTriangleRayT();
                            uint scalarValue35 = intermediateValue77.CandidatePrimitiveIndex();
                            uint scalarValue36 = intermediateValue77.CandidateInstanceID();
                            uint scalarValue37 = intermediateValue77.CandidateInstanceIndex();
                            uint productValue115 = (scalarValue37 * 76u) + 58u;
                            uint productValue116 = (scalarValue37 * 76u) + 61u;
                            precise float sumValue95 = 1.0f - vectorValue4.x;
                            precise float sumValue96 = sumValue95 - vectorValue5.y;
                            uint bitwiseValue48 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue37 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue35 >> 1u);
                            uint productValue117 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue37 * 76u) + 54u) * 2 + 0)) + 0u;
                            bool comparisonValue21 = (scalarValue35 & 1u) == 0u;
                            uint comparisonValue23 = comparisonValue21 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue117), bitwiseValue48 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue117), bitwiseValue48 * 16 + 0).x;
                            uint comparisonValue24 = comparisonValue21 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue117), bitwiseValue48 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue117), bitwiseValue48 * 16 + 0).w;
                            uint comparisonValue25 = comparisonValue21 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue117), bitwiseValue48 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue117), bitwiseValue48 * 16 + 0).z;
                            bool productValue118 = rdByteLoad_objectInstances_uint16_t(0u, productValue116 * 2 + 0) < 0u;
                            float intermediateValue127;
                            float intermediateValue128;
                            if (productValue118)
                            {
                                uint bitwiseValue49 = comparisonValue25 >> 15u;
                                precise float bitwiseValue50 = float(bitwiseValue49 & 1u) * 2.0f;
                                precise float sumValue97 = bitwiseValue50 + (-1.0f);
                                precise float bitwiseValue51 = float(comparisonValue25 >> 31u) * 2.0f;
                                precise float sumValue98 = bitwiseValue51 + (-1.0f);
                                precise float bitwiseValue52 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue53 = float(bitwiseValue49 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue119 = sumValue97 * 3.0517578125e-05f;
                                precise float productValue120 = sumValue98 * 3.0517578125e-05f;
                                precise float sumValue99 = bitwiseValue52 + productValue119;
                                precise float sumValue100 = bitwiseValue53 + productValue120;
                                intermediateValue127 = sumValue99;
                                intermediateValue128 = sumValue100;
                            }
                            else
                            {
                                precise float bitwiseValue54 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue55 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue121 = bitwiseValue54 * 16384.0f;
                                precise float sumValue101 = productValue121 + 0.5f;
                                precise float productValue122 = bitwiseValue55 * 16384.0f;
                                precise float sumValue102 = productValue122 + 0.5f;
                                precise float productValue123 = floor(sumValue101) * 6.103515625e-05f;
                                precise float productValue124 = floor(sumValue102) * 6.103515625e-05f;
                                intermediateValue127 = productValue123;
                                intermediateValue128 = productValue124;
                            }
                            precise float productValue125 = sumValue96 * intermediateValue127;
                            precise float productValue126 = sumValue96 * intermediateValue128;
                            precise float sumValue103 = productValue125 + 0.0f;
                            precise float sumValue104 = productValue126 + 0.0f;
                            float intermediateValue137;
                            float intermediateValue138;
                            if (productValue118)
                            {
                                uint bitwiseValue56 = comparisonValue24 >> 15u;
                                precise float bitwiseValue57 = float(bitwiseValue56 & 1u) * 2.0f;
                                precise float sumValue105 = bitwiseValue57 + (-1.0f);
                                precise float bitwiseValue58 = float(comparisonValue24 >> 31u) * 2.0f;
                                precise float sumValue106 = bitwiseValue58 + (-1.0f);
                                precise float bitwiseValue59 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue60 = float(bitwiseValue56 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue127 = sumValue105 * 3.0517578125e-05f;
                                precise float productValue128 = sumValue106 * 3.0517578125e-05f;
                                precise float sumValue107 = bitwiseValue59 + productValue127;
                                precise float sumValue108 = bitwiseValue60 + productValue128;
                                intermediateValue137 = sumValue107;
                                intermediateValue138 = sumValue108;
                            }
                            else
                            {
                                precise float bitwiseValue61 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue62 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue129 = bitwiseValue61 * 16384.0f;
                                precise float sumValue109 = productValue129 + 0.5f;
                                precise float productValue130 = bitwiseValue62 * 16384.0f;
                                precise float sumValue110 = productValue130 + 0.5f;
                                precise float productValue131 = floor(sumValue109) * 6.103515625e-05f;
                                precise float productValue132 = floor(sumValue110) * 6.103515625e-05f;
                                intermediateValue137 = productValue131;
                                intermediateValue138 = productValue132;
                            }
                            precise float productValue133 = vectorValue4.x * intermediateValue137;
                            precise float productValue134 = vectorValue4.x * intermediateValue138;
                            precise float sumValue111 = sumValue103 + productValue133;
                            precise float sumValue112 = sumValue104 + productValue134;
                            float intermediateValue148;
                            float intermediateValue149;
                            if (productValue118)
                            {
                                uint bitwiseValue63 = comparisonValue23 >> 15u;
                                precise float bitwiseValue64 = float(bitwiseValue63 & 1u) * 2.0f;
                                precise float sumValue113 = bitwiseValue64 + (-1.0f);
                                precise float bitwiseValue65 = float(comparisonValue23 >> 31u) * 2.0f;
                                precise float sumValue114 = bitwiseValue65 + (-1.0f);
                                precise float bitwiseValue66 = float((comparisonValue23 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue67 = float(bitwiseValue63 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue135 = sumValue113 * 3.0517578125e-05f;
                                precise float productValue136 = sumValue114 * 3.0517578125e-05f;
                                precise float sumValue115 = bitwiseValue66 + productValue135;
                                precise float sumValue116 = bitwiseValue67 + productValue136;
                                intermediateValue148 = sumValue115;
                                intermediateValue149 = sumValue116;
                            }
                            else
                            {
                                precise float bitwiseValue68 = float(comparisonValue23 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue69 = float(comparisonValue23 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue137 = bitwiseValue68 * 16384.0f;
                                precise float sumValue117 = productValue137 + 0.5f;
                                precise float productValue138 = bitwiseValue69 * 16384.0f;
                                precise float sumValue118 = productValue138 + 0.5f;
                                precise float productValue139 = floor(sumValue117) * 6.103515625e-05f;
                                precise float productValue140 = floor(sumValue118) * 6.103515625e-05f;
                                intermediateValue148 = productValue139;
                                intermediateValue149 = productValue140;
                            }
                            precise float productValue141 = vectorValue5.y * intermediateValue148;
                            precise float productValue142 = vectorValue5.y * intermediateValue149;
                            precise float sumValue119 = sumValue111 + productValue141;
                            precise float sumValue120 = sumValue112 + productValue142;
                            float intermediateValue152;
                            float intermediateValue153;
                            float intermediateValue154;
                            float intermediateValue155;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue115 * 2 + 0) == 65535u)
                            {
                                intermediateValue152 = 1.0f;
                                intermediateValue153 = 1.0f;
                                intermediateValue154 = 1.0f;
                                intermediateValue155 = 1.0f;
                            }
                            else
                            {
                                uint reinterpretedBits12;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue115 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits12 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits12 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue115 * 2 + 0));
                                }
                                float4 sampledTextureValue4 = textures[NonUniformResourceIndex(reinterpretedBits12 + 0u)].SampleLevel(defaultSampler, float2(sumValue119, sumValue120), min(mad(scalarValue34, 0.083333335816860198974609375f, -0.25f), 2.0f));
                                intermediateValue152 = sampledTextureValue4.x;
                                intermediateValue153 = sampledTextureValue4.y;
                                intermediateValue154 = sampledTextureValue4.z;
                                intermediateValue155 = sampledTextureValue4.w;
                            }
                            float intermediateValue161;
                            float intermediateValue162;
                            float intermediateValue163;
                            if (scalarValue36 == 2u)
                            {
                                float branchMergedValue16;
                                float branchMergedValue21;
                                float branchMergedValue22;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue116 * 2 + 0) & 128u) == 0u)
                                {
                                    float intermediateValue164;
                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue116 * 2 + 0) & 2048u) == 0u)
                                    {
                                        intermediateValue164 = intermediateValue155;
                                    }
                                    else
                                    {
                                        intermediateValue164 = clamp(mad(intermediateValue155, 2.0f, -1.0f), 0.0f, 1.0f);
                                    }
                                    branchMergedValue16 = intermediateValue153 - (intermediateValue164 * intermediateValue153);
                                    branchMergedValue21 = intermediateValue152 - (intermediateValue164 * intermediateValue152);
                                    branchMergedValue22 = intermediateValue154 - (intermediateValue164 * intermediateValue154);
                                }
                                else
                                {
                                    branchMergedValue16 = 0.33399999141693115234375f;
                                    branchMergedValue21 = 0.33399999141693115234375f;
                                    branchMergedValue22 = 0.33399999141693115234375f;
                                }
                                intermediateValue161 = branchMergedValue21;
                                intermediateValue162 = branchMergedValue16;
                                intermediateValue163 = branchMergedValue22;
                            }
                            else
                            {
                                float sumValue121 = 1.0f - intermediateValue155;
                                intermediateValue161 = sumValue121;
                                intermediateValue162 = sumValue121;
                                intermediateValue163 = sumValue121;
                            }
                            float productValue143 = intermediateValue161 * scalarValue30;
                            float productValue144 = intermediateValue162 * scalarValue31;
                            float productValue145 = intermediateValue163 * scalarValue32;
                            float intermediateValue118;
                            float intermediateValue119;
                            float intermediateValue120;
                            bool intermediateValue165;
                            if (!(dot(float3(productValue143, productValue144, productValue145), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                            {
                                intermediateValue165 = false;
                                intermediateValue118 = productValue143;
                                intermediateValue119 = productValue144;
                                intermediateValue120 = productValue145;
                            }
                            else
                            {
                                intermediateValue165 = true;
                                intermediateValue118 = 0.0f;
                                intermediateValue119 = 0.0f;
                                intermediateValue120 = 0.0f;
                            }
                            float branchMergedValue25;
                            float branchMergedValue30;
                            float branchMergedValue31;
                            if (intermediateValue165)
                            {
                                intermediateValue77.CommitNonOpaqueTriangleHit();
                                branchMergedValue25 = intermediateValue120;
                                branchMergedValue30 = intermediateValue118;
                                branchMergedValue31 = intermediateValue119;
                            }
                            else
                            {
                                branchMergedValue25 = intermediateValue120;
                                branchMergedValue30 = intermediateValue118;
                                branchMergedValue31 = intermediateValue119;
                            }
                            branchMergedValue2 = branchMergedValue25;
                            branchMergedValue7 = branchMergedValue30;
                            branchMergedValue8 = branchMergedValue31;
                        }
                        else
                        {
                            branchMergedValue2 = scalarValue32;
                            branchMergedValue7 = scalarValue30;
                            branchMergedValue8 = scalarValue31;
                        }
                        intermediateValue90 = branchMergedValue2;
                        intermediateValue86 = branchMergedValue7;
                        intermediateValue88 = branchMergedValue8;
                        bool conditionValue5 = intermediateValue77.Proceed();
                        if (conditionValue5)
                        {
                            scalarValue30 = intermediateValue86;
                            scalarValue31 = intermediateValue88;
                            scalarValue32 = intermediateValue90;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue85 = intermediateValue86;
                    intermediateValue87 = intermediateValue88;
                    intermediateValue89 = intermediateValue90;
                }
                else
                {
                    intermediateValue85 = intermediateValue16;
                    intermediateValue87 = intermediateValue20;
                    intermediateValue89 = intermediateValue24;
                }
                uint scalarValue38 = intermediateValue77.CommittedStatus();
                float intermediateValue15;
                float intermediateValue19;
                float intermediateValue23;
                float intermediateValue109;
                if (scalarValue38 == 1u)
                {
                    float scalarValue39 = intermediateValue77.CommittedRayT();
                    intermediateValue15 = 0.0f;
                    intermediateValue19 = 0.0f;
                    intermediateValue23 = 0.0f;
                    intermediateValue109 = scalarValue39;
                }
                else
                {
                    intermediateValue15 = intermediateValue85;
                    intermediateValue19 = intermediateValue87;
                    intermediateValue23 = intermediateValue89;
                    intermediateValue109 = 10000.0f;
                }
                branchMergedValue33 = intermediateValue23;
                branchMergedValue37 = intermediateValue19;
                branchMergedValue38 = intermediateValue15;
                branchMergedValue39 = intermediateValue109 + intermediateValue27;
            }
            else
            {
                branchMergedValue33 = intermediateValue24;
                branchMergedValue37 = intermediateValue20;
                branchMergedValue38 = intermediateValue16;
                branchMergedValue39 = intermediateValue27;
            }
            branchMergedValue10 = branchMergedValue33;
            branchMergedValue13 = branchMergedValue37;
            branchMergedValue14 = branchMergedValue38;
            branchMergedValue15 = branchMergedValue39;
        }
        else
        {
            float branchMergedValue32;
            float branchMergedValue34;
            float branchMergedValue35;
            float branchMergedValue36;
            if (uint4(inputBufferPreviousMedium.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u))).x == 0u)
            {
                branchMergedValue32 = 0.0f;
                branchMergedValue34 = 0.0f;
                branchMergedValue35 = 0.0f;
                branchMergedValue36 = -1.0f;
            }
            else
            {
                RayDesc _7ident = {float3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4), 0.0f, float3(productValue29, productValue30, productValue31), 10000.0f};
                intermediateValue54.TraceRayInline(SceneBVH, 512u, 22u, _7ident);
                bool conditionValue6 = intermediateValue54.Proceed();
                float intermediateValue17;
                float intermediateValue21;
                float intermediateValue25;
                if (conditionValue6)
                {
                    float intermediateValue63;
                    float intermediateValue64;
                    float intermediateValue65;
                    float scalarValue40 = 1.0f;
                    float scalarValue41 = 1.0f;
                    float scalarValue42 = 1.0f;
                    bool comparisonValue22;
                    for (;;)
                    {
                        uint scalarValue43 = intermediateValue54.CandidateType();
                        comparisonValue22 = scalarValue43 == 0u;
                        float branchMergedValue1;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (comparisonValue22)
                        {
                            float2 vectorValue6 = intermediateValue54.CandidateTriangleBarycentrics();
                            float2 vectorValue7 = intermediateValue54.CandidateTriangleBarycentrics();
                            float scalarValue44 = intermediateValue54.CandidateTriangleRayT();
                            uint scalarValue45 = intermediateValue54.CandidatePrimitiveIndex();
                            uint scalarValue46 = intermediateValue54.CandidateInstanceID();
                            uint scalarValue47 = intermediateValue54.CandidateInstanceIndex();
                            uint productValue146 = (scalarValue47 * 76u) + 58u;
                            uint productValue147 = (scalarValue47 * 76u) + 61u;
                            precise float sumValue122 = 1.0f - vectorValue6.x;
                            precise float sumValue123 = sumValue122 - vectorValue7.y;
                            uint bitwiseValue70 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue47 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue45 >> 1u);
                            uint productValue148 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue47 * 76u) + 54u) * 2 + 0)) + 0u;
                            bool comparisonValue26 = (scalarValue45 & 1u) == 0u;
                            uint comparisonValue28 = comparisonValue26 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue148), bitwiseValue70 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue148), bitwiseValue70 * 16 + 0).x;
                            uint comparisonValue29 = comparisonValue26 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue148), bitwiseValue70 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue148), bitwiseValue70 * 16 + 0).w;
                            uint comparisonValue30 = comparisonValue26 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue148), bitwiseValue70 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue148), bitwiseValue70 * 16 + 0).z;
                            bool productValue149 = rdByteLoad_objectInstances_uint16_t(0u, productValue147 * 2 + 0) < 0u;
                            float intermediateValue122;
                            float intermediateValue123;
                            if (productValue149)
                            {
                                uint bitwiseValue71 = comparisonValue30 >> 15u;
                                precise float bitwiseValue72 = float(bitwiseValue71 & 1u) * 2.0f;
                                precise float sumValue124 = bitwiseValue72 + (-1.0f);
                                precise float bitwiseValue73 = float(comparisonValue30 >> 31u) * 2.0f;
                                precise float sumValue125 = bitwiseValue73 + (-1.0f);
                                precise float bitwiseValue74 = float((comparisonValue30 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue75 = float(bitwiseValue71 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue150 = sumValue124 * 3.0517578125e-05f;
                                precise float productValue151 = sumValue125 * 3.0517578125e-05f;
                                precise float sumValue126 = bitwiseValue74 + productValue150;
                                precise float sumValue127 = bitwiseValue75 + productValue151;
                                intermediateValue122 = sumValue126;
                                intermediateValue123 = sumValue127;
                            }
                            else
                            {
                                precise float bitwiseValue76 = float(comparisonValue30 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue77 = float(comparisonValue30 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue152 = bitwiseValue76 * 16384.0f;
                                precise float sumValue128 = productValue152 + 0.5f;
                                precise float productValue153 = bitwiseValue77 * 16384.0f;
                                precise float sumValue129 = productValue153 + 0.5f;
                                precise float productValue154 = floor(sumValue128) * 6.103515625e-05f;
                                precise float productValue155 = floor(sumValue129) * 6.103515625e-05f;
                                intermediateValue122 = productValue154;
                                intermediateValue123 = productValue155;
                            }
                            precise float productValue156 = sumValue123 * intermediateValue122;
                            precise float productValue157 = sumValue123 * intermediateValue123;
                            precise float sumValue130 = productValue156 + 0.0f;
                            precise float sumValue131 = productValue157 + 0.0f;
                            float intermediateValue129;
                            float intermediateValue130;
                            if (productValue149)
                            {
                                uint bitwiseValue78 = comparisonValue29 >> 15u;
                                precise float bitwiseValue79 = float(bitwiseValue78 & 1u) * 2.0f;
                                precise float sumValue132 = bitwiseValue79 + (-1.0f);
                                precise float bitwiseValue80 = float(comparisonValue29 >> 31u) * 2.0f;
                                precise float sumValue133 = bitwiseValue80 + (-1.0f);
                                precise float bitwiseValue81 = float((comparisonValue29 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue82 = float(bitwiseValue78 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue158 = sumValue132 * 3.0517578125e-05f;
                                precise float productValue159 = sumValue133 * 3.0517578125e-05f;
                                precise float sumValue134 = bitwiseValue81 + productValue158;
                                precise float sumValue135 = bitwiseValue82 + productValue159;
                                intermediateValue129 = sumValue134;
                                intermediateValue130 = sumValue135;
                            }
                            else
                            {
                                precise float bitwiseValue83 = float(comparisonValue29 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue84 = float(comparisonValue29 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue160 = bitwiseValue83 * 16384.0f;
                                precise float sumValue136 = productValue160 + 0.5f;
                                precise float productValue161 = bitwiseValue84 * 16384.0f;
                                precise float sumValue137 = productValue161 + 0.5f;
                                precise float productValue162 = floor(sumValue136) * 6.103515625e-05f;
                                precise float productValue163 = floor(sumValue137) * 6.103515625e-05f;
                                intermediateValue129 = productValue162;
                                intermediateValue130 = productValue163;
                            }
                            precise float productValue164 = vectorValue6.x * intermediateValue129;
                            precise float productValue165 = vectorValue6.x * intermediateValue130;
                            precise float sumValue138 = sumValue130 + productValue164;
                            precise float sumValue139 = sumValue131 + productValue165;
                            float intermediateValue139;
                            float intermediateValue140;
                            if (productValue149)
                            {
                                uint bitwiseValue85 = comparisonValue28 >> 15u;
                                precise float bitwiseValue86 = float(bitwiseValue85 & 1u) * 2.0f;
                                precise float sumValue140 = bitwiseValue86 + (-1.0f);
                                precise float bitwiseValue87 = float(comparisonValue28 >> 31u) * 2.0f;
                                precise float sumValue141 = bitwiseValue87 + (-1.0f);
                                precise float bitwiseValue88 = float((comparisonValue28 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue89 = float(bitwiseValue85 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue166 = sumValue140 * 3.0517578125e-05f;
                                precise float productValue167 = sumValue141 * 3.0517578125e-05f;
                                precise float sumValue142 = bitwiseValue88 + productValue166;
                                precise float sumValue143 = bitwiseValue89 + productValue167;
                                intermediateValue139 = sumValue142;
                                intermediateValue140 = sumValue143;
                            }
                            else
                            {
                                precise float bitwiseValue90 = float(comparisonValue28 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue91 = float(comparisonValue28 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue168 = bitwiseValue90 * 16384.0f;
                                precise float sumValue144 = productValue168 + 0.5f;
                                precise float productValue169 = bitwiseValue91 * 16384.0f;
                                precise float sumValue145 = productValue169 + 0.5f;
                                precise float productValue170 = floor(sumValue144) * 6.103515625e-05f;
                                precise float productValue171 = floor(sumValue145) * 6.103515625e-05f;
                                intermediateValue139 = productValue170;
                                intermediateValue140 = productValue171;
                            }
                            precise float productValue172 = vectorValue7.y * intermediateValue139;
                            precise float productValue173 = vectorValue7.y * intermediateValue140;
                            precise float sumValue146 = sumValue138 + productValue172;
                            precise float sumValue147 = sumValue139 + productValue173;
                            float intermediateValue141;
                            float intermediateValue142;
                            float intermediateValue143;
                            float intermediateValue144;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue146 * 2 + 0) == 65535u)
                            {
                                intermediateValue141 = 1.0f;
                                intermediateValue142 = 1.0f;
                                intermediateValue143 = 1.0f;
                                intermediateValue144 = 1.0f;
                            }
                            else
                            {
                                uint reinterpretedBits11;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue146 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits11 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits11 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue146 * 2 + 0));
                                }
                                float4 sampledTextureValue5 = textures[NonUniformResourceIndex(reinterpretedBits11 + 0u)].SampleLevel(defaultSampler, float2(sumValue146, sumValue147), min(mad(scalarValue44, 0.083333335816860198974609375f, -0.25f), 2.0f));
                                intermediateValue141 = sampledTextureValue5.x;
                                intermediateValue142 = sampledTextureValue5.y;
                                intermediateValue143 = sampledTextureValue5.z;
                                intermediateValue144 = sampledTextureValue5.w;
                            }
                            float intermediateValue156;
                            float intermediateValue157;
                            float intermediateValue158;
                            if (scalarValue46 == 2u)
                            {
                                float branchMergedValue12;
                                float branchMergedValue19;
                                float branchMergedValue20;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue147 * 2 + 0) & 128u) == 0u)
                                {
                                    float intermediateValue159;
                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue147 * 2 + 0) & 2048u) == 0u)
                                    {
                                        intermediateValue159 = intermediateValue144;
                                    }
                                    else
                                    {
                                        intermediateValue159 = clamp(mad(intermediateValue144, 2.0f, -1.0f), 0.0f, 1.0f);
                                    }
                                    branchMergedValue12 = intermediateValue143 - (intermediateValue159 * intermediateValue143);
                                    branchMergedValue19 = intermediateValue141 - (intermediateValue159 * intermediateValue141);
                                    branchMergedValue20 = intermediateValue142 - (intermediateValue159 * intermediateValue142);
                                }
                                else
                                {
                                    branchMergedValue12 = 0.33399999141693115234375f;
                                    branchMergedValue19 = 0.33399999141693115234375f;
                                    branchMergedValue20 = 0.33399999141693115234375f;
                                }
                                intermediateValue156 = branchMergedValue19;
                                intermediateValue157 = branchMergedValue20;
                                intermediateValue158 = branchMergedValue12;
                            }
                            else
                            {
                                float sumValue148 = 1.0f - intermediateValue144;
                                intermediateValue156 = sumValue148;
                                intermediateValue157 = sumValue148;
                                intermediateValue158 = sumValue148;
                            }
                            float productValue174 = intermediateValue156 * scalarValue40;
                            float productValue175 = intermediateValue157 * scalarValue41;
                            float productValue176 = intermediateValue158 * scalarValue42;
                            float intermediateValue98;
                            float intermediateValue99;
                            float intermediateValue100;
                            bool intermediateValue160;
                            if (!(dot(float3(productValue174, productValue175, productValue176), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                            {
                                intermediateValue160 = false;
                                intermediateValue98 = productValue174;
                                intermediateValue99 = productValue175;
                                intermediateValue100 = productValue176;
                            }
                            else
                            {
                                intermediateValue160 = true;
                                intermediateValue98 = 0.0f;
                                intermediateValue99 = 0.0f;
                                intermediateValue100 = 0.0f;
                            }
                            float branchMergedValue24;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            if (intermediateValue160)
                            {
                                intermediateValue54.CommitNonOpaqueTriangleHit();
                                branchMergedValue24 = intermediateValue98;
                                branchMergedValue28 = intermediateValue100;
                                branchMergedValue29 = intermediateValue99;
                            }
                            else
                            {
                                branchMergedValue24 = intermediateValue98;
                                branchMergedValue28 = intermediateValue100;
                                branchMergedValue29 = intermediateValue99;
                            }
                            branchMergedValue1 = branchMergedValue24;
                            branchMergedValue5 = branchMergedValue28;
                            branchMergedValue6 = branchMergedValue29;
                        }
                        else
                        {
                            branchMergedValue1 = scalarValue40;
                            branchMergedValue5 = scalarValue42;
                            branchMergedValue6 = scalarValue41;
                        }
                        intermediateValue63 = branchMergedValue1;
                        intermediateValue65 = branchMergedValue5;
                        intermediateValue64 = branchMergedValue6;
                        bool conditionValue7 = intermediateValue54.Proceed();
                        if (conditionValue7)
                        {
                            scalarValue40 = intermediateValue63;
                            scalarValue41 = intermediateValue64;
                            scalarValue42 = intermediateValue65;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue17 = intermediateValue63;
                    intermediateValue21 = intermediateValue64;
                    intermediateValue25 = intermediateValue65;
                }
                else
                {
                    intermediateValue17 = 1.0f;
                    intermediateValue21 = 1.0f;
                    intermediateValue25 = 1.0f;
                }
                uint scalarValue48 = intermediateValue54.CommittedStatus();
                float branchMergedValue40;
                float branchMergedValue41;
                float branchMergedValue42;
                float branchMergedValue43;
                if (scalarValue48 == 1u)
                {
                    float scalarValue49 = intermediateValue54.CommittedRayT();
                    branchMergedValue40 = 0.0f;
                    branchMergedValue41 = 0.0f;
                    branchMergedValue42 = 0.0f;
                    branchMergedValue43 = scalarValue49;
                }
                else
                {
                    branchMergedValue40 = intermediateValue25;
                    branchMergedValue41 = intermediateValue21;
                    branchMergedValue42 = intermediateValue17;
                    branchMergedValue43 = 10000.0f;
                }
                branchMergedValue32 = branchMergedValue40;
                branchMergedValue34 = branchMergedValue41;
                branchMergedValue35 = branchMergedValue42;
                branchMergedValue36 = branchMergedValue43;
            }
            branchMergedValue10 = branchMergedValue32;
            branchMergedValue13 = branchMergedValue34;
            branchMergedValue14 = branchMergedValue35;
            branchMergedValue15 = branchMergedValue36;
        }
        intermediateValue14 = branchMergedValue14;
        intermediateValue18 = branchMergedValue13;
        intermediateValue22 = branchMergedValue10;
        intermediateValue26 = branchMergedValue15;
    }
    uint reinterpretedBits5 = asuint(intermediateValue14) & 2147483647u;
    uint reinterpretedBits6 = asuint(intermediateValue18) & 2147483647u;
    uint reinterpretedBits7 = asuint(intermediateValue22) & 2147483647u;
    uint reinterpretedBits8 = asuint(intermediateValue26) & 2147483647u;
    bool comparisonValue31 = ((((reinterpretedBits5 > 2139095040u) || (reinterpretedBits6 > 2139095040u)) || (reinterpretedBits7 > 2139095040u)) || (reinterpretedBits8 > 2139095040u)) || ((((reinterpretedBits5 == 2139095040u) || (reinterpretedBits6 == 2139095040u)) || (reinterpretedBits7 == 2139095040u)) || (reinterpretedBits8 == 2139095040u));
    bool intermediateValue31;
    if (comparisonValue31)
    {
        bool branchMergedValue9;
        if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
        {
            outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(1.0f, 0.0f, 0.0f, 1.0f).x;
            outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
            branchMergedValue9 = comparisonValue31;
        }
        else
        {
            branchMergedValue9 = comparisonValue31;
        }
        intermediateValue31 = branchMergedValue9;
    }
    else
    {
        intermediateValue31 = false;
    }
    if (!intermediateValue31)
    {
        outputBufferSunLightShadow[uint2(bitwiseValue2, bitwiseValue3)] = float4(intermediateValue14, intermediateValue18, intermediateValue22, intermediateValue26);
    }
}
[numthreads(4, 8, 1)]
void main(ComputeStageInput stage_input)
{
    workgroupId = stage_input.workgroupId;
    localThreadId = stage_input.localThreadId;
    executeComputeStage();
}
