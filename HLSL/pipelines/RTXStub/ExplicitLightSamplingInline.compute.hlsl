// RTXStub / ExplicitLightSamplingInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 33
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
    bool reinterpretedBits1 = asuint(viewCbConstants[96u]).x != 0u;
    float reinterpretedBits2 = asfloat(rdByteLoad_inputIncidentLight_uint(0u, 0));
    outputBufferIndirectSpecular[uint2(bitwiseValue2, bitwiseValue3)] = 0.0f.xxxx;
    if (!(inputBufferPrimaryPathLength.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u)).x == 65504.0f))
    {
        float4 loadedBufferValue = inputBufferColourAndMetallic.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue1 = loadedBufferValue.y;
        float scalarValue2 = loadedBufferValue.z;
        float scalarValue3 = loadedBufferValue.w;
        float4 loadedBufferValue1 = inputBufferNormal.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue4 = loadedBufferValue1.x;
        float scalarValue5 = loadedBufferValue1.y;
        float sumValue = 1.0f - abs(scalarValue4);
        float scalarValue6 = abs(scalarValue5);
        float sumValue1 = sumValue - scalarValue6;
        bool conditionValue = sumValue1 < 0.0f;
        float comparisonValue1 = conditionValue ? ((1.0f - scalarValue6) * ((scalarValue4 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue4;
        float comparisonValue2 = conditionValue ? (((scalarValue5 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue) : scalarValue5;
        float inverseLengthValue = rsqrt(dot(float3(comparisonValue1, comparisonValue2, sumValue1), float3(comparisonValue1, comparisonValue2, sumValue1)));
        float productValue = comparisonValue1 * inverseLengthValue;
        float productValue1 = comparisonValue2 * inverseLengthValue;
        float productValue2 = inverseLengthValue * sumValue1;
        float comparisonValue3 = ((productValue2 != 0.0f) || ((productValue != 0.0f) || (productValue1 != 0.0f))) ? productValue2 : 1.0f;
        float inverseLengthValue1 = rsqrt(dot(float3(productValue, productValue1, comparisonValue3), float3(productValue, productValue1, comparisonValue3)));
        float4 loadedBufferValue2 = inputEmissiveAndLinearRoughness.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue7 = loadedBufferValue2.w;
        float productValue3 = (((scalarValue1 * scalarValue1) + (-0.039999999105930328369140625f)) * scalarValue3) + 0.039999999105930328369140625f;
        float4 loadedBufferValue3 = inputGeometryNormal.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue8 = loadedBufferValue3.x;
        float scalarValue9 = loadedBufferValue3.y;
        precise float sumValue2 = 1.0f - abs(scalarValue8);
        float scalarValue10 = abs(scalarValue9);
        precise float sumValue3 = sumValue2 - scalarValue10;
        bool conditionValue1 = sumValue3 < 0.0f;
        precise float sumValue4 = 1.0f - scalarValue10;
        precise float comparisonValue4 = ((scalarValue8 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue4;
        precise float comparisonValue5 = sumValue2 * ((scalarValue9 >= 0.0f) ? 1.0f : (-1.0f));
        float comparisonValue6 = conditionValue1 ? comparisonValue4 : scalarValue8;
        float comparisonValue7 = conditionValue1 ? comparisonValue5 : scalarValue9;
        float inverseLengthValue2 = rsqrt(dot(float3(comparisonValue6, comparisonValue7, sumValue3), float3(comparisonValue6, comparisonValue7, sumValue3)));
        precise float productValue4 = inverseLengthValue2 * comparisonValue7;
        float4 loadedBufferValue4 = inputPrimaryWorldPosition.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue11 = loadedBufferValue4.y;
        float scalarValue12 = loadedBufferValue4.z;
        precise float sumValue5 = scalarValue11 + 0.0f;
        float4 loadedBufferValue5 = inputPrimaryViewDirection.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u));
        float scalarValue13 = loadedBufferValue5.x;
        float scalarValue14 = loadedBufferValue5.z;
        float sumValue6 = (-0.0f) - scalarValue13;
        float sumValue7 = (-0.0f) - scalarValue14;
        float comparisonValue8 = reinterpretedBits1 ? productValue4 : (productValue1 * inverseLengthValue1);
        uint productValue5 = (uint(viewCbConstants[78u].x) * bitwiseValue3) + bitwiseValue2;
        uint bitwiseValue4 = (productValue5 + 2127912214u) + (productValue5 << 12u);
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
        uint4 reinterpretedBits3 = asuint(viewCbConstants[84u]);
        uint scalarValue15 = reinterpretedBits3.z;
        uint bitwiseValue17;
        uint bitwiseValue19;
        uint intermediateValue21;
        uint intermediateValue22;
        bitwiseValue17 = scalarValue15 + (((((bitwiseValue16 << 1u) | bitwiseValue16) << 1u) & 2863311530u) | (((bitwiseValue13 << 1u) | bitwiseValue13) & 1431655765u));
        bitwiseValue19 = (bitwiseValue8 ^ 3042594569u) ^ (bitwiseValue8 >> 16u);
        intermediateValue21 = 0u;
        intermediateValue22 = 0u;
        uint bitwiseValue18;
        for (;;)
        {
            uint sumValue8 = intermediateValue21 + 2654435769u;
            bitwiseValue18 = ((((bitwiseValue19 >> 5u) + 3355524772u) ^ ((bitwiseValue19 << 4u) + 2738958700u)) ^ (sumValue8 + bitwiseValue19)) + bitwiseValue17;
            uint sumValue9 = intermediateValue22 + 1u;
            if (sumValue9 == 16u)
            {
                break;
            }
            else
            {
                bitwiseValue17 = bitwiseValue18;
                bitwiseValue19 = ((((bitwiseValue18 << 4u) + 2911926141u) ^ (bitwiseValue18 + sumValue8)) ^ ((bitwiseValue18 >> 5u) + 2123724318u)) + bitwiseValue19;
                intermediateValue21 = sumValue8;
                intermediateValue22 = sumValue9;
            }
        }
        float scalarValue16 = loadedBufferValue.x;
        float productValue6 = (((scalarValue16 * scalarValue16) + (-0.039999999105930328369140625f)) * scalarValue3) + 0.039999999105930328369140625f;
        float productValue7 = (((scalarValue2 * scalarValue2) + (-0.039999999105930328369140625f)) * scalarValue3) + 0.039999999105930328369140625f;
        precise float productValue8 = inverseLengthValue2 * comparisonValue6;
        precise float productValue9 = sumValue3 * inverseLengthValue2;
        float scalarValue17 = loadedBufferValue4.x;
        precise float sumValue10 = scalarValue17 + 0.0f;
        precise float sumValue11 = scalarValue12 + 0.0f;
        float scalarValue18 = loadedBufferValue5.y;
        float sumValue12 = (-0.0f) - scalarValue18;
        float comparisonValue9 = reinterpretedBits1 ? productValue8 : (inverseLengthValue1 * productValue);
        float comparisonValue10 = reinterpretedBits1 ? productValue9 : (comparisonValue3 * inverseLengthValue1);
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
        uint intermediateValue29;
        float intermediateValue31;
        float intermediateValue32;
        float intermediateValue33;
        if (asuint(viewCbConstants[92u]).w == 0u)
        {
            intermediateValue26 = 0.0f;
            intermediateValue27 = 0.0f;
            intermediateValue28 = 0.0f;
            intermediateValue29 = 0u;
            intermediateValue31 = 0.0f;
            intermediateValue32 = 0.0f;
            intermediateValue33 = 0.0f;
        }
        else
        {
            uint intermediateValue[8];
            intermediateValue[0u] = 0u;
            uint bitwiseValue20 = bitwiseValue2 & 255u;
            uint bitwiseValue21 = bitwiseValue3 & 255u;
            uint bitwiseValue22 = (scalarValue15 << 1u) & 126u;
            float4 loadedBufferValue6 = blueNoiseTexture.Load(int4(uint3(bitwiseValue20, bitwiseValue21, bitwiseValue22), 0u));
            uint4 reinterpretedBits4 = asuint(viewCbConstants[96u]);
            uint scalarValue19 = reinterpretedBits4.w;
            uint sumValue13 = scalarValue19 + 4294967295u;
            float scalarValue20 = float(scalarValue19);
            precise float productValue10 = loadedBufferValue6.x * scalarValue20;
            uint scalarValue21 = min(uint(int(productValue10)), sumValue13);
            half3 productValue11 = (half3)f16tof32(rdByteLoad_inputReducedLightsBuffer_uint16_t3(0u, (scalarValue21 * 2u) * 6 + 0));
            precise float sumValue14 = float(productValue11.x) - sumValue10;
            precise float sumValue15 = float(productValue11.y) - sumValue5;
            precise float sumValue16 = float(productValue11.z) - sumValue11;
            precise float dotProductValue = dot(float3(sumValue14, sumValue15, sumValue16), float3(sumValue14, sumValue15, sumValue16));
            precise float quotientValue = 1.0f / dotProductValue;
            float comparisonValue11 = (int(rdByteLoad_inputReducedLightsBuffer_uint(0u, ((scalarValue21 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
            precise float productValue12 = comparisonValue11 * comparisonValue11;
            float intermediateValue37;
            if (dotProductValue > productValue12)
            {
                float inverseLengthValue3 = rsqrt(dotProductValue);
                precise float productValue13 = sumValue14 * inverseLengthValue3;
                precise float productValue14 = sumValue15 * inverseLengthValue3;
                precise float productValue15 = sumValue16 * inverseLengthValue3;
                precise float dotProductValue1 = quotientValue * max(0.0f, dot(float3(productValue8, productValue4, productValue9), float3(productValue13, productValue14, productValue15)));
                intermediateValue37 = dotProductValue1;
            }
            else
            {
                intermediateValue37 = quotientValue;
            }
            float intermediateValue43;
            uint intermediateValue44;
            float intermediateValue45;
            if (intermediateValue37 > 0.0f)
            {
                intermediateValue[0u] = scalarValue21;
                intermediateValue43 = intermediateValue37;
                intermediateValue44 = 1u;
                intermediateValue45 = intermediateValue37;
            }
            else
            {
                intermediateValue43 = -1.0f;
                intermediateValue44 = 0u;
                intermediateValue45 = 0.0f;
            }
            intermediateValue[1u] = 0u;
            precise float productValue16 = loadedBufferValue6.y * scalarValue20;
            uint scalarValue22 = min(uint(int(productValue16)), sumValue13);
            half3 productValue17 = (half3)f16tof32(rdByteLoad_inputReducedLightsBuffer_uint16_t3(0u, (scalarValue22 * 2u) * 6 + 0));
            precise float sumValue17 = float(productValue17.x) - sumValue10;
            precise float sumValue18 = float(productValue17.y) - sumValue5;
            precise float sumValue19 = float(productValue17.z) - sumValue11;
            precise float dotProductValue2 = dot(float3(sumValue17, sumValue18, sumValue19), float3(sumValue17, sumValue18, sumValue19));
            precise float quotientValue1 = 1.0f / dotProductValue2;
            float comparisonValue12 = (int(rdByteLoad_inputReducedLightsBuffer_uint(0u, ((scalarValue22 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
            precise float productValue18 = comparisonValue12 * comparisonValue12;
            float intermediateValue49;
            if (dotProductValue2 > productValue18)
            {
                float inverseLengthValue4 = rsqrt(dotProductValue2);
                precise float productValue19 = sumValue17 * inverseLengthValue4;
                precise float productValue20 = sumValue18 * inverseLengthValue4;
                precise float productValue21 = sumValue19 * inverseLengthValue4;
                precise float dotProductValue3 = quotientValue1 * max(0.0f, dot(float3(productValue8, productValue4, productValue9), float3(productValue19, productValue20, productValue21)));
                intermediateValue49 = dotProductValue3;
            }
            else
            {
                intermediateValue49 = quotientValue1;
            }
            float intermediateValue51;
            uint sumValue30;
            float intermediateValue52;
            if (intermediateValue49 > 0.0f)
            {
                float sumValue20 = intermediateValue49 + intermediateValue45;
                intermediateValue[1u] = scalarValue22;
                intermediateValue51 = sumValue20;
                sumValue30 = intermediateValue44 + 1u;
                intermediateValue52 = sumValue20;
            }
            else
            {
                intermediateValue51 = -1.0f;
                sumValue30 = intermediateValue44;
                intermediateValue52 = intermediateValue45;
            }
            intermediateValue[2u] = 0u;
            precise float productValue22 = loadedBufferValue6.z * scalarValue20;
            uint scalarValue23 = min(uint(int(productValue22)), sumValue13);
            half3 productValue23 = (half3)f16tof32(rdByteLoad_inputReducedLightsBuffer_uint16_t3(0u, (scalarValue23 * 2u) * 6 + 0));
            precise float sumValue21 = float(productValue23.x) - sumValue10;
            precise float sumValue22 = float(productValue23.y) - sumValue5;
            precise float sumValue23 = float(productValue23.z) - sumValue11;
            precise float dotProductValue4 = dot(float3(sumValue21, sumValue22, sumValue23), float3(sumValue21, sumValue22, sumValue23));
            precise float quotientValue2 = 1.0f / dotProductValue4;
            float comparisonValue13 = (int(rdByteLoad_inputReducedLightsBuffer_uint(0u, ((scalarValue23 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
            precise float productValue24 = comparisonValue13 * comparisonValue13;
            float intermediateValue54;
            if (dotProductValue4 > productValue24)
            {
                float inverseLengthValue5 = rsqrt(dotProductValue4);
                precise float productValue25 = sumValue21 * inverseLengthValue5;
                precise float productValue26 = sumValue22 * inverseLengthValue5;
                precise float productValue33 = sumValue23 * inverseLengthValue5;
                precise float dotProductValue5 = quotientValue2 * max(0.0f, dot(float3(productValue8, productValue4, productValue9), float3(productValue25, productValue26, productValue33)));
                intermediateValue54 = dotProductValue5;
            }
            else
            {
                intermediateValue54 = quotientValue2;
            }
            float intermediateValue56;
            uint sumValue35;
            float intermediateValue57;
            if (intermediateValue54 > 0.0f)
            {
                float sumValue24 = intermediateValue54 + intermediateValue52;
                intermediateValue[2u] = scalarValue23;
                intermediateValue56 = sumValue24;
                sumValue35 = sumValue30 + 1u;
                intermediateValue57 = sumValue24;
            }
            else
            {
                intermediateValue56 = -1.0f;
                sumValue35 = sumValue30;
                intermediateValue57 = intermediateValue52;
            }
            intermediateValue[3u] = 0u;
            precise float productValue34 = loadedBufferValue6.w * scalarValue20;
            uint scalarValue24 = min(uint(int(productValue34)), sumValue13);
            half3 productValue35 = (half3)f16tof32(rdByteLoad_inputReducedLightsBuffer_uint16_t3(0u, (scalarValue24 * 2u) * 6 + 0));
            precise float sumValue25 = float(productValue35.x) - sumValue10;
            precise float sumValue26 = float(productValue35.y) - sumValue5;
            precise float sumValue27 = float(productValue35.z) - sumValue11;
            precise float dotProductValue6 = dot(float3(sumValue25, sumValue26, sumValue27), float3(sumValue25, sumValue26, sumValue27));
            precise float quotientValue3 = 1.0f / dotProductValue6;
            float comparisonValue14 = (int(rdByteLoad_inputReducedLightsBuffer_uint(0u, ((scalarValue24 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
            precise float productValue36 = comparisonValue14 * comparisonValue14;
            float intermediateValue59;
            if (dotProductValue6 > productValue36)
            {
                float inverseLengthValue6 = rsqrt(dotProductValue6);
                precise float productValue37 = sumValue25 * inverseLengthValue6;
                precise float productValue38 = sumValue26 * inverseLengthValue6;
                precise float productValue39 = sumValue27 * inverseLengthValue6;
                precise float dotProductValue7 = quotientValue3 * max(0.0f, dot(float3(productValue8, productValue4, productValue9), float3(productValue37, productValue38, productValue39)));
                intermediateValue59 = dotProductValue7;
            }
            else
            {
                intermediateValue59 = quotientValue3;
            }
            float intermediateValue60;
            uint sumValue40;
            float intermediateValue61;
            if (intermediateValue59 > 0.0f)
            {
                float sumValue28 = intermediateValue59 + intermediateValue57;
                intermediateValue[3u] = scalarValue24;
                intermediateValue60 = sumValue28;
                sumValue40 = sumValue35 + 1u;
                intermediateValue61 = sumValue28;
            }
            else
            {
                intermediateValue60 = -1.0f;
                sumValue40 = sumValue35;
                intermediateValue61 = intermediateValue57;
            }
            intermediateValue[4u] = 0u;
            float4 loadedBufferValue7 = blueNoiseTexture.Load(int4(uint3(bitwiseValue20, bitwiseValue21, bitwiseValue22 | 1u), 0u));
            precise float productValue40 = scalarValue20 * loadedBufferValue7.x;
            uint scalarValue25 = min(uint(int(productValue40)), sumValue13);
            half3 productValue41 = (half3)f16tof32(rdByteLoad_inputReducedLightsBuffer_uint16_t3(0u, (scalarValue25 * 2u) * 6 + 0));
            precise float sumValue29 = float(productValue41.x) - sumValue10;
            precise float sumValue31 = float(productValue41.y) - sumValue5;
            precise float sumValue32 = float(productValue41.z) - sumValue11;
            precise float dotProductValue8 = dot(float3(sumValue29, sumValue31, sumValue32), float3(sumValue29, sumValue31, sumValue32));
            precise float quotientValue4 = 1.0f / dotProductValue8;
            float comparisonValue15 = (int(rdByteLoad_inputReducedLightsBuffer_uint(0u, ((scalarValue25 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
            precise float productValue42 = comparisonValue15 * comparisonValue15;
            float intermediateValue63;
            if (dotProductValue8 > productValue42)
            {
                float inverseLengthValue7 = rsqrt(dotProductValue8);
                precise float productValue43 = sumValue29 * inverseLengthValue7;
                precise float productValue44 = sumValue31 * inverseLengthValue7;
                precise float productValue45 = sumValue32 * inverseLengthValue7;
                precise float dotProductValue9 = quotientValue4 * max(0.0f, dot(float3(productValue8, productValue4, productValue9), float3(productValue43, productValue44, productValue45)));
                intermediateValue63 = dotProductValue9;
            }
            else
            {
                intermediateValue63 = quotientValue4;
            }
            float intermediateValue64;
            uint sumValue45;
            float intermediateValue65;
            if (intermediateValue63 > 0.0f)
            {
                float sumValue33 = intermediateValue63 + intermediateValue61;
                intermediateValue[4u] = scalarValue25;
                intermediateValue64 = sumValue33;
                sumValue45 = sumValue40 + 1u;
                intermediateValue65 = sumValue33;
            }
            else
            {
                intermediateValue64 = -1.0f;
                sumValue45 = sumValue40;
                intermediateValue65 = intermediateValue61;
            }
            intermediateValue[5u] = 0u;
            precise float productValue46 = scalarValue20 * loadedBufferValue7.y;
            uint scalarValue26 = min(uint(int(productValue46)), sumValue13);
            half3 productValue47 = (half3)f16tof32(rdByteLoad_inputReducedLightsBuffer_uint16_t3(0u, (scalarValue26 * 2u) * 6 + 0));
            precise float sumValue34 = float(productValue47.x) - sumValue10;
            precise float sumValue36 = float(productValue47.y) - sumValue5;
            precise float sumValue37 = float(productValue47.z) - sumValue11;
            precise float dotProductValue10 = dot(float3(sumValue34, sumValue36, sumValue37), float3(sumValue34, sumValue36, sumValue37));
            precise float quotientValue5 = 1.0f / dotProductValue10;
            float comparisonValue16 = (int(rdByteLoad_inputReducedLightsBuffer_uint(0u, ((scalarValue26 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
            precise float productValue48 = comparisonValue16 * comparisonValue16;
            float intermediateValue67;
            if (dotProductValue10 > productValue48)
            {
                float inverseLengthValue8 = rsqrt(dotProductValue10);
                precise float productValue49 = sumValue34 * inverseLengthValue8;
                precise float productValue50 = sumValue36 * inverseLengthValue8;
                precise float productValue51 = sumValue37 * inverseLengthValue8;
                precise float dotProductValue11 = quotientValue5 * max(0.0f, dot(float3(productValue8, productValue4, productValue9), float3(productValue49, productValue50, productValue51)));
                intermediateValue67 = dotProductValue11;
            }
            else
            {
                intermediateValue67 = quotientValue5;
            }
            float intermediateValue68;
            uint sumValue50;
            float intermediateValue69;
            if (intermediateValue67 > 0.0f)
            {
                float sumValue38 = intermediateValue67 + intermediateValue65;
                intermediateValue[5u] = scalarValue26;
                intermediateValue68 = sumValue38;
                sumValue50 = sumValue45 + 1u;
                intermediateValue69 = sumValue38;
            }
            else
            {
                intermediateValue68 = -1.0f;
                sumValue50 = sumValue45;
                intermediateValue69 = intermediateValue65;
            }
            intermediateValue[6u] = 0u;
            precise float productValue52 = scalarValue20 * loadedBufferValue7.z;
            uint scalarValue27 = min(uint(int(productValue52)), sumValue13);
            half3 productValue53 = (half3)f16tof32(rdByteLoad_inputReducedLightsBuffer_uint16_t3(0u, (scalarValue27 * 2u) * 6 + 0));
            precise float sumValue39 = float(productValue53.x) - sumValue10;
            precise float sumValue41 = float(productValue53.y) - sumValue5;
            precise float sumValue42 = float(productValue53.z) - sumValue11;
            precise float dotProductValue12 = dot(float3(sumValue39, sumValue41, sumValue42), float3(sumValue39, sumValue41, sumValue42));
            precise float quotientValue6 = 1.0f / dotProductValue12;
            float comparisonValue17 = (int(rdByteLoad_inputReducedLightsBuffer_uint(0u, ((scalarValue27 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
            precise float productValue54 = comparisonValue17 * comparisonValue17;
            float intermediateValue71;
            if (dotProductValue12 > productValue54)
            {
                float inverseLengthValue9 = rsqrt(dotProductValue12);
                precise float productValue55 = sumValue39 * inverseLengthValue9;
                precise float productValue56 = sumValue41 * inverseLengthValue9;
                precise float productValue57 = sumValue42 * inverseLengthValue9;
                precise float dotProductValue13 = quotientValue6 * max(0.0f, dot(float3(productValue8, productValue4, productValue9), float3(productValue55, productValue56, productValue57)));
                intermediateValue71 = dotProductValue13;
            }
            else
            {
                intermediateValue71 = quotientValue6;
            }
            float intermediateValue72;
            uint sumValue55;
            float intermediateValue73;
            if (intermediateValue71 > 0.0f)
            {
                float sumValue43 = intermediateValue71 + intermediateValue69;
                intermediateValue[6u] = scalarValue27;
                intermediateValue72 = sumValue43;
                sumValue55 = sumValue50 + 1u;
                intermediateValue73 = sumValue43;
            }
            else
            {
                intermediateValue72 = -1.0f;
                sumValue55 = sumValue50;
                intermediateValue73 = intermediateValue69;
            }
            intermediateValue[7u] = 0u;
            precise float productValue58 = scalarValue20 * loadedBufferValue7.w;
            uint scalarValue28 = min(uint(int(productValue58)), sumValue13);
            half3 productValue59 = (half3)f16tof32(rdByteLoad_inputReducedLightsBuffer_uint16_t3(0u, (scalarValue28 * 2u) * 6 + 0));
            precise float sumValue44 = float(productValue59.x) - sumValue10;
            precise float sumValue46 = float(productValue59.y) - sumValue5;
            precise float sumValue47 = float(productValue59.z) - sumValue11;
            precise float dotProductValue14 = dot(float3(sumValue44, sumValue46, sumValue47), float3(sumValue44, sumValue46, sumValue47));
            precise float quotientValue7 = 1.0f / dotProductValue14;
            float comparisonValue18 = (int(rdByteLoad_inputReducedLightsBuffer_uint(0u, ((scalarValue28 * 3u) + 2u) * 4 + 0)) < int(0u)) ? 0.4600000083446502685546875f : 0.23000000417232513427734375f;
            precise float productValue60 = comparisonValue18 * comparisonValue18;
            float intermediateValue75;
            if (dotProductValue14 > productValue60)
            {
                float inverseLengthValue10 = rsqrt(dotProductValue14);
                precise float productValue61 = sumValue44 * inverseLengthValue10;
                precise float productValue62 = sumValue46 * inverseLengthValue10;
                precise float productValue63 = sumValue47 * inverseLengthValue10;
                precise float dotProductValue15 = quotientValue7 * max(0.0f, dot(float3(productValue8, productValue4, productValue9), float3(productValue61, productValue62, productValue63)));
                intermediateValue75 = dotProductValue15;
            }
            else
            {
                intermediateValue75 = quotientValue7;
            }
            float intermediateValue76;
            uint sumValue60;
            float intermediateValue77;
            if (intermediateValue75 > 0.0f)
            {
                float sumValue48 = intermediateValue75 + intermediateValue73;
                intermediateValue[7u] = scalarValue28;
                intermediateValue76 = sumValue48;
                sumValue60 = sumValue55 + 1u;
                intermediateValue77 = sumValue48;
            }
            else
            {
                intermediateValue76 = -1.0f;
                sumValue60 = sumValue55;
                intermediateValue77 = intermediateValue73;
            }
            bool comparisonValue19 = sumValue60 == 0u;
            float intermediateValue78;
            uint intermediateValue80;
            uint intermediateValue81;
            half intermediateValue82;
            half intermediateValue84;
            half intermediateValue86;
            if (comparisonValue19)
            {
                intermediateValue78 = intermediateValue79;
                intermediateValue80 = bitwiseValue18;
                intermediateValue81 = 0u;
                intermediateValue82 = half(0.0);
                intermediateValue84 = half(0.0);
                intermediateValue86 = half(0.0);
            }
            else
            {
                uint intermediateValue93;
                uint productValue92;
                float bitwiseValue23;
                bool intermediateValue88;
                for (;;)
                {
                    productValue92 = (bitwiseValue18 * 1664525u) + 1013904223u;
                    bitwiseValue23 = (float(productValue92 & 16777215u) * 5.9604584379258085391484200954437e-08f) * intermediateValue77;
                    intermediateValue88 = intermediateValue43 > bitwiseValue23;
                    uint intermediateValue91;
                    if (intermediateValue88)
                    {
                        intermediateValue91 = 0u;
                    }
                    else
                    {
                        uint branchMergedValue3;
                        if (intermediateValue51 > bitwiseValue23)
                        {
                            branchMergedValue3 = 1u;
                        }
                        else
                        {
                            uint branchMergedValue11;
                            if (intermediateValue56 > bitwiseValue23)
                            {
                                branchMergedValue11 = 2u;
                            }
                            else
                            {
                                uint branchMergedValue18;
                                if (intermediateValue60 > bitwiseValue23)
                                {
                                    branchMergedValue18 = 3u;
                                }
                                else
                                {
                                    uint branchMergedValue19;
                                    if (intermediateValue64 > bitwiseValue23)
                                    {
                                        branchMergedValue19 = 4u;
                                    }
                                    else
                                    {
                                        uint branchMergedValue20;
                                        if (intermediateValue68 > bitwiseValue23)
                                        {
                                            branchMergedValue20 = 5u;
                                        }
                                        else
                                        {
                                            uint branchMergedValue21;
                                            if (intermediateValue72 > bitwiseValue23)
                                            {
                                                branchMergedValue21 = 6u;
                                            }
                                            else
                                            {
                                                if (!(intermediateValue76 > bitwiseValue23))
                                                {
                                                    intermediateValue93 = 0u;
                                                    break;
                                                }
                                                branchMergedValue21 = 7u;
                                            }
                                            branchMergedValue20 = branchMergedValue21;
                                        }
                                        branchMergedValue19 = branchMergedValue20;
                                    }
                                    branchMergedValue18 = branchMergedValue19;
                                }
                                branchMergedValue11 = branchMergedValue18;
                            }
                            branchMergedValue3 = branchMergedValue11;
                        }
                        intermediateValue91 = branchMergedValue3;
                    }
                    intermediateValue93 = intermediateValue[intermediateValue91];
                    break;
                }
                half3 productValue64 = (half3)f16tof32(rdByteLoad_inputReducedLightsBuffer_uint16_t3(0u, (intermediateValue93 * 2u) * 6 + 0));
                half scalarValue29 = productValue64.x;
                half scalarValue30 = productValue64.y;
                half scalarValue31 = productValue64.z;
                float sumValue49 = float(scalarValue29) - scalarValue17;
                float sumValue51 = float(scalarValue30) - scalarValue11;
                float sumValue52 = float(scalarValue31) - scalarValue12;
                intermediateValue78 = 1.0f / (viewCbConstants[96u].z * dot(float3(sumValue49, sumValue51, sumValue52), float3(sumValue49, sumValue51, sumValue52)));
                intermediateValue80 = productValue92;
                intermediateValue81 = rdByteLoad_inputReducedLightsBuffer_uint(0u, ((intermediateValue93 * 3u) + 2u) * 4 + 0);
                intermediateValue82 = scalarValue29;
                intermediateValue84 = scalarValue30;
                intermediateValue86 = scalarValue31;
            }
            float branchMergedValue;
            float branchMergedValue4;
            float branchMergedValue5;
            uint branchMergedValue6;
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            if (comparisonValue19)
            {
                branchMergedValue = 0.0f;
                branchMergedValue4 = 0.0f;
                branchMergedValue5 = 0.0f;
                branchMergedValue6 = 0u;
                branchMergedValue7 = 0.0f;
                branchMergedValue8 = 0.0f;
                branchMergedValue9 = 0.0f;
            }
            else
            {
                float comparisonValue20 = (int(intermediateValue81) < int(0u)) ? 0.23000000417232513427734375f : 0.115000002086162567138671875f;
                float bitwiseValue24 = float(((intermediateValue80 * 1664525u) + 7271263u) & 16777215u);
                float productValue65 = bitwiseValue24 * 0.002414158545434474945068359375f;
                float productValue66 = (productValue65 - floor(productValue65)) * 6.283185482025146484375f;
                float productValue67 = 0.9999847412109375f - (bitwiseValue24 * 1.1920928955078125e-07f);
                float clampedValue = sqrt(clamp(1.0f - (productValue67 * productValue67), 0.0f, 1.0f)) * comparisonValue20;
                float wavePhaseValue = clampedValue * cos(productValue66);
                float wavePhaseValue1 = sin(productValue66) * clampedValue;
                float productValue68 = productValue67 * comparisonValue20;
                bool dotProductValue16 = dot(float3(wavePhaseValue, wavePhaseValue1, productValue68), float3(float(intermediateValue82) - scalarValue17, float(intermediateValue84) - scalarValue11, float(intermediateValue86) - scalarValue12)) > 0.0f;
                float comparisonValue21 = float(half(dotProductValue16 ? ((-0.0f) - wavePhaseValue) : wavePhaseValue) + intermediateValue82) - scalarValue17;
                float comparisonValue22 = float(half(dotProductValue16 ? ((-0.0f) - wavePhaseValue1) : wavePhaseValue1) + intermediateValue84) - scalarValue11;
                float comparisonValue23 = float(half(dotProductValue16 ? ((-0.0f) - productValue68) : productValue68) + intermediateValue86) - scalarValue12;
                float inverseLengthValue11 = rsqrt(dot(float3(comparisonValue21, comparisonValue22, comparisonValue23), float3(comparisonValue21, comparisonValue22, comparisonValue23)));
                float productValue69 = comparisonValue21 * inverseLengthValue11;
                float productValue70 = comparisonValue22 * inverseLengthValue11;
                float productValue71 = comparisonValue23 * inverseLengthValue11;
                uint productValue72 = uint(int(productValue8 * 256.0f));
                uint productValue73 = uint(int(productValue4 * 256.0f));
                uint productValue74 = uint(int(productValue9 * 256.0f));
                RayDesc _2ident = {float3((abs(sumValue10) < 0.03125f) ? (scalarValue17 + (productValue8 * 1.52587890625e-05f)) : asfloat(((sumValue10 < 0.0f) ? (-productValue72) : productValue72) + asuint(sumValue10)), (abs(sumValue5) < 0.03125f) ? (scalarValue11 + (productValue4 * 1.52587890625e-05f)) : asfloat(((sumValue5 < 0.0f) ? (-productValue73) : productValue73) + asuint(sumValue5)), (abs(sumValue11) < 0.03125f) ? (scalarValue12 + (productValue9 * 1.52587890625e-05f)) : asfloat(((sumValue11 < 0.0f) ? (-productValue74) : productValue74) + asuint(sumValue11))), 0.0f, float3(productValue69, productValue70, productValue71), sqrt(((comparisonValue21 * comparisonValue21) + (comparisonValue22 * comparisonValue22)) + (comparisonValue23 * comparisonValue23)) + (-0.00999999977648258209228515625f)};
                intermediateValue89.TraceRayInline(SceneBVH, 512u, 2u, _2ident);
                bool conditionValue2 = intermediateValue89.Proceed();
                if (conditionValue2)
                {
                    bool intermediateValue102;
                    bool comparisonValue29;
                    for (;;)
                    {
                        uint scalarValue32 = intermediateValue89.CandidateType();
                        comparisonValue29 = scalarValue32 == 0u;
                        if (comparisonValue29)
                        {
                            float2 vectorValue = intermediateValue89.CandidateTriangleBarycentrics();
                            float2 vectorValue1 = intermediateValue89.CandidateTriangleBarycentrics();
                            uint scalarValue33 = intermediateValue89.CandidatePrimitiveIndex();
                            uint scalarValue34 = intermediateValue89.CandidateInstanceID();
                            uint scalarValue35 = intermediateValue89.CandidateInstanceIndex();
                            uint productValue75 = (scalarValue35 * 76u) + 58u;
                            uint productValue76 = (scalarValue35 * 76u) + 61u;
                            precise float sumValue53 = 1.0f - vectorValue.x;
                            precise float sumValue54 = sumValue53 - vectorValue1.y;
                            uint bitwiseValue25 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue35 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue33 >> 1u);
                            uint productValue77 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue35 * 76u) + 54u) * 2 + 0)) + 0u;
                            bool comparisonValue24 = (scalarValue33 & 1u) == 0u;
                            uint comparisonValue25 = comparisonValue24 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue25 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue25 * 16 + 0).x;
                            uint comparisonValue26 = comparisonValue24 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue25 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue25 * 16 + 0).w;
                            uint comparisonValue27 = comparisonValue24 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue25 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue25 * 16 + 0).z;
                            bool productValue78 = rdByteLoad_objectInstances_uint16_t(0u, productValue76 * 2 + 0) < 0u;
                            float intermediateValue103;
                            float intermediateValue104;
                            if (productValue78)
                            {
                                uint bitwiseValue26 = comparisonValue27 >> 15u;
                                precise float bitwiseValue27 = float(bitwiseValue26 & 1u) * 2.0f;
                                precise float sumValue56 = bitwiseValue27 + (-1.0f);
                                precise float bitwiseValue28 = float(comparisonValue27 >> 31u) * 2.0f;
                                precise float sumValue57 = bitwiseValue28 + (-1.0f);
                                precise float bitwiseValue29 = float((comparisonValue27 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue30 = float(bitwiseValue26 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue79 = sumValue56 * 3.0517578125e-05f;
                                precise float productValue80 = sumValue57 * 3.0517578125e-05f;
                                precise float sumValue58 = bitwiseValue29 + productValue79;
                                precise float sumValue59 = bitwiseValue30 + productValue80;
                                intermediateValue103 = sumValue58;
                                intermediateValue104 = sumValue59;
                            }
                            else
                            {
                                precise float bitwiseValue31 = float(comparisonValue27 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue32 = float(comparisonValue27 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue81 = bitwiseValue31 * 16384.0f;
                                precise float sumValue61 = productValue81 + 0.5f;
                                precise float productValue82 = bitwiseValue32 * 16384.0f;
                                precise float sumValue62 = productValue82 + 0.5f;
                                precise float productValue83 = floor(sumValue61) * 6.103515625e-05f;
                                precise float productValue84 = floor(sumValue62) * 6.103515625e-05f;
                                intermediateValue103 = productValue83;
                                intermediateValue104 = productValue84;
                            }
                            precise float productValue85 = sumValue54 * intermediateValue103;
                            precise float productValue86 = sumValue54 * intermediateValue104;
                            precise float sumValue63 = productValue85 + 0.0f;
                            precise float sumValue64 = productValue86 + 0.0f;
                            float intermediateValue105;
                            float intermediateValue106;
                            if (productValue78)
                            {
                                uint bitwiseValue33 = comparisonValue26 >> 15u;
                                precise float bitwiseValue34 = float(bitwiseValue33 & 1u) * 2.0f;
                                precise float sumValue65 = bitwiseValue34 + (-1.0f);
                                precise float bitwiseValue35 = float(comparisonValue26 >> 31u) * 2.0f;
                                precise float sumValue66 = bitwiseValue35 + (-1.0f);
                                precise float bitwiseValue36 = float((comparisonValue26 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue37 = float(bitwiseValue33 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue87 = sumValue65 * 3.0517578125e-05f;
                                precise float productValue88 = sumValue66 * 3.0517578125e-05f;
                                precise float sumValue67 = bitwiseValue36 + productValue87;
                                precise float sumValue68 = bitwiseValue37 + productValue88;
                                intermediateValue105 = sumValue67;
                                intermediateValue106 = sumValue68;
                            }
                            else
                            {
                                precise float bitwiseValue38 = float(comparisonValue26 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue39 = float(comparisonValue26 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue89 = bitwiseValue38 * 16384.0f;
                                precise float sumValue69 = productValue89 + 0.5f;
                                precise float productValue90 = bitwiseValue39 * 16384.0f;
                                precise float sumValue70 = productValue90 + 0.5f;
                                precise float productValue91 = floor(sumValue69) * 6.103515625e-05f;
                                precise float productValue93 = floor(sumValue70) * 6.103515625e-05f;
                                intermediateValue105 = productValue91;
                                intermediateValue106 = productValue93;
                            }
                            precise float productValue94 = vectorValue.x * intermediateValue105;
                            precise float productValue95 = vectorValue.x * intermediateValue106;
                            precise float sumValue71 = sumValue63 + productValue94;
                            precise float sumValue72 = sumValue64 + productValue95;
                            float intermediateValue107;
                            float intermediateValue108;
                            if (productValue78)
                            {
                                uint bitwiseValue40 = comparisonValue25 >> 15u;
                                precise float bitwiseValue41 = float(bitwiseValue40 & 1u) * 2.0f;
                                precise float sumValue73 = bitwiseValue41 + (-1.0f);
                                precise float bitwiseValue42 = float(comparisonValue25 >> 31u) * 2.0f;
                                precise float sumValue74 = bitwiseValue42 + (-1.0f);
                                precise float bitwiseValue43 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue44 = float(bitwiseValue40 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue96 = sumValue73 * 3.0517578125e-05f;
                                precise float productValue97 = sumValue74 * 3.0517578125e-05f;
                                precise float sumValue75 = bitwiseValue43 + productValue96;
                                precise float sumValue76 = bitwiseValue44 + productValue97;
                                intermediateValue107 = sumValue75;
                                intermediateValue108 = sumValue76;
                            }
                            else
                            {
                                precise float bitwiseValue45 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue46 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue98 = bitwiseValue45 * 16384.0f;
                                precise float sumValue77 = productValue98 + 0.5f;
                                precise float productValue99 = bitwiseValue46 * 16384.0f;
                                precise float sumValue78 = productValue99 + 0.5f;
                                precise float productValue100 = floor(sumValue77) * 6.103515625e-05f;
                                precise float productValue101 = floor(sumValue78) * 6.103515625e-05f;
                                intermediateValue107 = productValue100;
                                intermediateValue108 = productValue101;
                            }
                            precise float productValue102 = vectorValue1.y * intermediateValue107;
                            precise float productValue103 = vectorValue1.y * intermediateValue108;
                            precise float sumValue79 = sumValue71 + productValue102;
                            precise float sumValue80 = sumValue72 + productValue103;
                            float intermediateValue109;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue75 * 2 + 0) == 65535u)
                            {
                                intermediateValue109 = 1.0f;
                            }
                            else
                            {
                                uint reinterpretedBits19;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue75 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits19 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits19 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue75 * 2 + 0));
                                }
                                intermediateValue109 = textures[NonUniformResourceIndex(reinterpretedBits19 + 0u)].SampleLevel(defaultSampler, float2(sumValue79, sumValue80), -0.25f).w;
                            }
                            uint comparisonValue34;
                            if (scalarValue34 == 2u)
                            {
                                comparisonValue34 = 0u;
                            }
                            else
                            {
                                comparisonValue34 = uint(intermediateValue109 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue76 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                            }
                            if (comparisonValue34 == 0u)
                            {
                                intermediateValue89.CommitNonOpaqueTriangleHit();
                            }
                        }
                        intermediateValue102 = intermediateValue89.Proceed();
                        if (intermediateValue102)
                        {
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                uint scalarValue36 = intermediateValue89.CommittedStatus();
                bool intermediateValue96;
                if (scalarValue36 == 1u)
                {
                    float scalarValue37 = intermediateValue89.CommittedRayT();
                    intermediateValue96 = !(scalarValue37 < 10000.0f);
                }
                else
                {
                    intermediateValue96 = true;
                }
                uint scalarValue38 = uint(intermediateValue96);
                float branchMergedValue10;
                float branchMergedValue12;
                float branchMergedValue13;
                uint branchMergedValue14;
                float branchMergedValue15;
                float branchMergedValue16;
                float branchMergedValue17;
                if (intermediateValue96)
                {
                    float bitwiseValue47 = (intermediateValue78 * 0.0392156876623630523681640625f) * float(intermediateValue81 & 255u);
                    float productValue104 = bitwiseValue47 * 0.00117647065781056880950927734375f;
                    branchMergedValue10 = productValue104 * float((intermediateValue81 >> 8u) & 255u);
                    branchMergedValue12 = productValue104 * float((intermediateValue81 >> 16u) & 255u);
                    branchMergedValue13 = (float((intermediateValue81 >> 24u) & 127u) * 0.00236220471560955047607421875f) * bitwiseValue47;
                    branchMergedValue14 = scalarValue38;
                    branchMergedValue15 = productValue71;
                    branchMergedValue16 = productValue70;
                    branchMergedValue17 = productValue69;
                }
                else
                {
                    branchMergedValue10 = 0.0f;
                    branchMergedValue12 = 0.0f;
                    branchMergedValue13 = 0.0f;
                    branchMergedValue14 = scalarValue38;
                    branchMergedValue15 = productValue71;
                    branchMergedValue16 = productValue70;
                    branchMergedValue17 = productValue69;
                }
                branchMergedValue = branchMergedValue10;
                branchMergedValue4 = branchMergedValue12;
                branchMergedValue5 = branchMergedValue13;
                branchMergedValue6 = branchMergedValue14;
                branchMergedValue7 = branchMergedValue15;
                branchMergedValue8 = branchMergedValue16;
                branchMergedValue9 = branchMergedValue17;
            }
            intermediateValue26 = branchMergedValue9;
            intermediateValue27 = branchMergedValue8;
            intermediateValue28 = branchMergedValue7;
            intermediateValue29 = branchMergedValue6;
            intermediateValue31 = branchMergedValue5;
            intermediateValue32 = branchMergedValue4;
            intermediateValue33 = branchMergedValue;
        }
        bool comparisonValue28 = intermediateValue29 != 0u;
        float productValue27;
        float productValue28;
        float productValue29;
        float productValue30;
        float productValue31;
        float productValue32;
        if (comparisonValue28)
        {
            float clampedValue1 = max((((1.0f - scalarValue7) * 0.5f) * clamp(scalarValue7 * 1.5f, 0.0f, 1.0f)) + scalarValue7, 0.00999999977648258209228515625f);
            float sumValue81 = intermediateValue26 - scalarValue13;
            float sumValue82 = intermediateValue27 - scalarValue18;
            float sumValue83 = intermediateValue28 - scalarValue14;
            float inverseLengthValue12 = rsqrt(dot(float3(sumValue81, sumValue82, sumValue83), float3(sumValue81, sumValue82, sumValue83)));
            float productValue105 = inverseLengthValue12 * sumValue81;
            float productValue106 = inverseLengthValue12 * sumValue82;
            float productValue107 = inverseLengthValue12 * sumValue83;
            float clampedValue2 = clamp(dot(float3(comparisonValue9, comparisonValue8, comparisonValue10), float3(intermediateValue26, intermediateValue27, intermediateValue28)), 0.0f, 1.0f);
            float clampedValue3 = clamp(dot(float3(comparisonValue9, comparisonValue8, comparisonValue10), float3(sumValue6, sumValue12, sumValue7)), 0.0f, 1.0f);
            float clampedValue4 = clamp(dot(float3(comparisonValue9, comparisonValue8, comparisonValue10), float3(productValue105, productValue106, productValue107)), 0.0f, 1.0f);
            float clampedValue5 = clamp(dot(float3(sumValue6, sumValue12, sumValue7), float3(productValue105, productValue106, productValue107)), 0.0f, 1.0f);
            float productValue108 = clampedValue1 * clampedValue1;
            float productValue109 = productValue108 * productValue108;
            float productValue110 = (((clampedValue4 * productValue109) - clampedValue4) * clampedValue4) + 1.0f;
            float productValue111 = productValue108 * 0.5f;
            float sumValue84 = 1.0f - productValue111;
            float clampedValue6 = clamp(dot(float3(productValue6, productValue3, productValue7), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
            float clampedValue7 = exp2(log2(clamp(1.0f - clampedValue5, 0.0f, 1.0f)) * 5.0f);
            float productValue112 = (clampedValue7 * (clampedValue6 - productValue6)) + productValue6;
            float productValue113 = (clampedValue7 * (clampedValue6 - productValue3)) + productValue3;
            float productValue114 = (clampedValue7 * (clampedValue6 - productValue7)) + productValue7;
            float productValue115 = ((clampedValue5 * clampedValue5) * (clampedValue1 * 2.0f)) + (-0.5f);
            float clampedValue8 = ((clampedValue2 * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue3, 0.0f, 1.0f)) * 5.0f) * productValue115) + 1.0f)) * ((exp2(log2(clamp(1.0f - clampedValue2, 0.0f, 1.0f)) * 5.0f) * productValue115) + 1.0f);
            float quotientValue8 = (((productValue109 / ((productValue110 * productValue110) + 1.0000000133514319600180897396058e-10f)) * 0.3183098733425140380859375f) * (0.25f / ((((clampedValue3 * sumValue84) + productValue111) * ((clampedValue2 * sumValue84) + productValue111)) + 1.0000000133514319600180897396058e-10f))) * clampedValue2;
            productValue27 = ((1.0f - productValue112) * intermediateValue31) * clampedValue8;
            productValue28 = ((1.0f - productValue113) * intermediateValue32) * clampedValue8;
            productValue29 = ((1.0f - productValue114) * intermediateValue33) * clampedValue8;
            productValue30 = (quotientValue8 * intermediateValue31) * productValue112;
            productValue31 = (quotientValue8 * intermediateValue32) * productValue113;
            productValue32 = (quotientValue8 * intermediateValue33) * productValue114;
        }
        else
        {
            productValue27 = 0.0f;
            productValue28 = 0.0f;
            productValue29 = 0.0f;
            productValue30 = 0.0f;
            productValue31 = 0.0f;
            productValue32 = 0.0f;
        }
        if (comparisonValue28)
        {
            float4 vectorValue2 = outputBufferIndirectDiffuse[uint2(bitwiseValue2, bitwiseValue3)].xxxx;
            float scalarValue39 = vectorValue2.x;
            float scalarValue40 = vectorValue2.y;
            float scalarValue41 = vectorValue2.z;
            float scalarValue42 = vectorValue2.w;
            float productValue116 = productValue28 * reinterpretedBits2;
            float productValue117 = productValue29 * reinterpretedBits2;
            if (reinterpretedBits1)
            {
                float4 vectorValue3 = outputBufferIndirectDiffuseChroma[uint2(bitwiseValue2, bitwiseValue3)].xxxx;
                float scalarValue43 = vectorValue3.z;
                float productValue118 = (productValue27 - productValue29) * reinterpretedBits2;
                float productValue119 = (productValue118 * 0.5f) + productValue117;
                float sumValue85 = productValue116 - productValue119;
                float productValue120 = max((sumValue85 * 0.5f) + productValue119, 0.0f);
                float productValue121 = productValue120 * 0.48860299587249755859375f;
                float productValue122 = (productValue121 * intermediateValue26) + scalarValue39;
                float productValue123 = (productValue121 * intermediateValue27) + scalarValue40;
                float productValue124 = (productValue121 * intermediateValue28) + scalarValue41;
                float productValue125 = (productValue120 * 0.2820949852466583251953125f) + scalarValue42;
                float sumValue86 = vectorValue3.x + productValue118;
                float sumValue87 = vectorValue3.y + sumValue85;
                uint reinterpretedBits5 = asuint(productValue122) & 2147483647u;
                uint reinterpretedBits6 = asuint(productValue123) & 2147483647u;
                uint reinterpretedBits7 = asuint(productValue124) & 2147483647u;
                uint reinterpretedBits8 = asuint(productValue125) & 2147483647u;
                bool comparisonValue30 = ((reinterpretedBits8 > 2139095040u) || ((reinterpretedBits7 > 2139095040u) || ((reinterpretedBits5 > 2139095040u) || (reinterpretedBits6 > 2139095040u)))) || ((reinterpretedBits8 == 2139095040u) || ((reinterpretedBits7 == 2139095040u) || ((reinterpretedBits5 == 2139095040u) || (reinterpretedBits6 == 2139095040u))));
                if (comparisonValue30)
                {
                    if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
                    {
                        outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 1.0f, 0.0f, 1.0f).x;
                        outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
                    }
                }
                uint reinterpretedBits9 = asuint(sumValue86) & 2147483647u;
                uint reinterpretedBits10 = asuint(sumValue87) & 2147483647u;
                uint reinterpretedBits11 = asuint(scalarValue43) & 2147483647u;
                bool comparisonValue31 = ((reinterpretedBits11 > 2139095040u) || ((reinterpretedBits9 > 2139095040u) || (reinterpretedBits10 > 2139095040u))) || ((reinterpretedBits11 == 2139095040u) || ((reinterpretedBits9 == 2139095040u) || (reinterpretedBits10 == 2139095040u)));
                if (comparisonValue31)
                {
                    if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
                    {
                        outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 1.0f, 0.0f, 1.0f).x;
                        outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
                    }
                }
                if (!comparisonValue30)
                {
                    outputBufferIndirectDiffuse[uint2(bitwiseValue2, bitwiseValue3)] = float4(productValue122, productValue123, productValue124, productValue125).x;
                }
                if (!comparisonValue31)
                {
                    outputBufferIndirectDiffuseChroma[uint2(bitwiseValue2, bitwiseValue3)] = float4(sumValue86, sumValue87, scalarValue43, sumValue86).x;
                }
            }
            else
            {
                float productValue126 = scalarValue39 + (productValue27 * reinterpretedBits2);
                float sumValue88 = scalarValue40 + productValue116;
                float sumValue89 = scalarValue41 + productValue117;
                uint reinterpretedBits12 = asuint(productValue126) & 2147483647u;
                uint reinterpretedBits13 = asuint(sumValue88) & 2147483647u;
                uint reinterpretedBits14 = asuint(sumValue89) & 2147483647u;
                uint reinterpretedBits15 = asuint(scalarValue42) & 2147483647u;
                bool comparisonValue32 = ((reinterpretedBits15 > 2139095040u) || ((reinterpretedBits14 > 2139095040u) || ((reinterpretedBits12 > 2139095040u) || (reinterpretedBits13 > 2139095040u)))) || ((reinterpretedBits15 == 2139095040u) || ((reinterpretedBits14 == 2139095040u) || ((reinterpretedBits12 == 2139095040u) || (reinterpretedBits13 == 2139095040u))));
                bool intermediateValue50;
                if (comparisonValue32)
                {
                    bool branchMergedValue1;
                    if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
                    {
                        outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 1.0f, 0.0f, 1.0f).x;
                        outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
                        branchMergedValue1 = comparisonValue32;
                    }
                    else
                    {
                        branchMergedValue1 = comparisonValue32;
                    }
                    intermediateValue50 = branchMergedValue1;
                }
                else
                {
                    intermediateValue50 = false;
                }
                if (!intermediateValue50)
                {
                    outputBufferIndirectDiffuse[uint2(bitwiseValue2, bitwiseValue3)] = float4(productValue126, sumValue88, sumValue89, scalarValue42).x;
                }
            }
            float productValue127 = productValue30 * reinterpretedBits2;
            float productValue128 = productValue31 * reinterpretedBits2;
            float productValue129 = productValue32 * reinterpretedBits2;
            uint reinterpretedBits16 = asuint(productValue127) & 2147483647u;
            uint reinterpretedBits17 = asuint(productValue128) & 2147483647u;
            uint reinterpretedBits18 = asuint(productValue129) & 2147483647u;
            bool comparisonValue33 = (((reinterpretedBits16 > 2139095040u) || (reinterpretedBits17 > 2139095040u)) || (reinterpretedBits18 > 2139095040u)) || (((reinterpretedBits16 == 2139095040u) || (reinterpretedBits17 == 2139095040u)) || (reinterpretedBits18 == 2139095040u));
            bool intermediateValue55;
            if (comparisonValue33)
            {
                bool branchMergedValue2;
                if (outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)].xxxx.w == 0.0f)
                {
                    outputBufferDebug[uint2(bitwiseValue2, bitwiseValue3)] = float4(0.0f, 1.0f, 0.0f, 1.0f).x;
                    outputBufferDebug[uint2(0u, 0u)] = float4(outputBufferDebug[uint2(0u, 0u)].xxx, 1.0f).x;
                    branchMergedValue2 = comparisonValue33;
                }
                else
                {
                    branchMergedValue2 = comparisonValue33;
                }
                intermediateValue55 = branchMergedValue2;
            }
            else
            {
                intermediateValue55 = false;
            }
            if (!intermediateValue55)
            {
                outputBufferIndirectSpecular[uint2(bitwiseValue2, bitwiseValue3)] = float4(productValue127, productValue128, productValue129, 1.0f);
            }
        }
    }
}
[numthreads(4, 8, 1)]
void main(ComputeStageInput stage_input)
{
    workgroupId = stage_input.workgroupId;
    localThreadId = stage_input.localThreadId;
    executeComputeStage();
}
