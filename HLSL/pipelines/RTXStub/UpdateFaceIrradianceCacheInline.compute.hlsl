// RTXStub / UpdateFaceIrradianceCacheInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 48
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint bitwiseValue = dispatchThreadId.x >> 4u;
    uint productValue = bitwiseValue * 2u;
    uint bitwiseValue1 = dispatchThreadId.x & 15u;
    uint bitwiseValue2 = rdByteLoad_faceIrradianceCacheUpdateChunks_uint(0u, productValue * 4 + 0) & 65535u;
    if (bitwiseValue1 < (rdByteLoad_faceIrradianceCacheUpdateChunks_uint(0u, productValue * 4 + 0) >> 16u))
    {
        uint productValue1 = (bitwiseValue2 * 76u) + 58u;
        uint productValue2 = (bitwiseValue2 * 76u) + 59u;
        uint productValue3 = (bitwiseValue2 * 76u) + 61u;
        uint productValue4 = (bitwiseValue2 * 38u) + 32u;
        uint productValue5 = rdByteLoad_faceIrradianceCacheUpdateChunks_uint(0u, ((bitwiseValue * 2u) + 1u) * 4 + 0) + bitwiseValue1;
        uint bitwiseValue3 = (rdByteLoad_objectInstances_uint(0u, ((bitwiseValue2 * 38u) + 25u) * 4 + 0) >> 2u) + productValue5;
        uint bitwiseValue4 = bitwiseValue3 ^ (dispatchThreadId.x << 6u);
        uint bitwiseValue5 = (bitwiseValue4 + 2127912214u) + (bitwiseValue4 << 12u);
        uint bitwiseValue6 = (bitwiseValue5 ^ 3345072700u) ^ (bitwiseValue5 >> 19u);
        uint bitwiseValue7 = (bitwiseValue6 + 374761393u) + (bitwiseValue6 << 5u);
        uint bitwiseValue8 = (bitwiseValue7 + 3550635116u) ^ (bitwiseValue7 << 9u);
        uint bitwiseValue9 = (bitwiseValue8 + 4251993797u) + (bitwiseValue8 << 3u);
        uint bitwiseValue10 = bitwiseValue4 & 65535u;
        uint bitwiseValue11 = ((bitwiseValue10 << 8u) | bitwiseValue10) & 16711935u;
        uint bitwiseValue12 = ((bitwiseValue11 << 4u) | bitwiseValue11) & 252645135u;
        uint bitwiseValue13 = ((bitwiseValue12 << 2u) | bitwiseValue12) & 858993459u;
        uint reinterpretedBits;
        uint bitwiseValue15;
        uint intermediateValue2;
        uint intermediateValue3;
        reinterpretedBits = (((bitwiseValue13 << 1u) | bitwiseValue13) & 1431655765u) + asuint(viewCbConstants[84u]).z;
        bitwiseValue15 = (bitwiseValue9 ^ 3042594569u) ^ (bitwiseValue9 >> 16u);
        intermediateValue2 = 0u;
        intermediateValue3 = 0u;
        uint bitwiseValue14;
        for (;;)
        {
            uint sumValue = intermediateValue2 + 2654435769u;
            bitwiseValue14 = ((((bitwiseValue15 >> 5u) + 3355524772u) ^ ((bitwiseValue15 << 4u) + 2738958700u)) ^ (sumValue + bitwiseValue15)) + reinterpretedBits;
            uint sumValue1 = intermediateValue3 + 1u;
            if (sumValue1 == 16u)
            {
                break;
            }
            else
            {
                reinterpretedBits = bitwiseValue14;
                bitwiseValue15 = ((((bitwiseValue14 << 4u) + 2911926141u) ^ (bitwiseValue14 + sumValue)) ^ ((bitwiseValue14 >> 5u) + 2123724318u)) + bitwiseValue15;
                intermediateValue2 = sumValue;
                intermediateValue3 = sumValue1;
            }
        }
        uint productValue6 = (bitwiseValue14 * 1664525u) + 1013904223u;
        precise float bitwiseValue16 = float(productValue6 & 16777215u) * 5.9604644775390625e-08f;
        uint productValue7 = (productValue6 * 1664525u) + 1013904223u;
        precise float bitwiseValue17 = float(productValue7 & 16777215u) * 5.9604644775390625e-08f;
        float nonlinearValue = sqrt(bitwiseValue16);
        precise float sumValue2 = 1.0f - nonlinearValue;
        precise float sumValue3 = 1.0f - bitwiseValue17;
        precise float productValue8 = sumValue3 * nonlinearValue;
        uint bitwiseValue18 = rdByteLoad_faceIrradianceCacheUpdateChunks_uint(0u, productValue * 4 + 0) & 16383u;
        uint productValue9 = bitwiseValue18 * 38u;
        float4 reinterpretedBits1 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue9 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue9 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue9 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue9 + 3u) * 4 + 0)));
        float scalarValue = reinterpretedBits1.x;
        float scalarValue1 = reinterpretedBits1.y;
        float scalarValue2 = reinterpretedBits1.z;
        uint productValue10 = (bitwiseValue18 * 38u) + 4u;
        float4 reinterpretedBits2 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue10 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue10 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue10 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue10 + 3u) * 4 + 0)));
        float scalarValue3 = reinterpretedBits2.x;
        float scalarValue4 = reinterpretedBits2.y;
        float scalarValue5 = reinterpretedBits2.z;
        uint productValue11 = (bitwiseValue18 * 38u) + 8u;
        float4 reinterpretedBits3 = asfloat(uint4(rdByteLoad_objectInstances_uint(0u, productValue11 * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue11 + 1u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue11 + 2u) * 4 + 0), rdByteLoad_objectInstances_uint(0u, (productValue11 + 3u) * 4 + 0)));
        float scalarValue6 = reinterpretedBits3.x;
        float scalarValue7 = reinterpretedBits3.y;
        float scalarValue8 = reinterpretedBits3.z;
        uint productValue12 = (bitwiseValue18 * 38u) + 24u;
        uint productValue13 = (bitwiseValue18 * 38u) + 25u;
        uint productValue14 = (bitwiseValue18 * 76u) + 61u;
        uint productValue15 = (bitwiseValue18 * 76u) + 72u;
        uint bitwiseValue19 = ((productValue7 << 1u) & 2u) | ((productValue5 << 2u) & 131068u);
        uint bitwiseValue20 = bitwiseValue19 | 1u;
        uint bitwiseValue21 = bitwiseValue19 ^ 2u;
        uint intermediateValue[3];
        intermediateValue[0u] = bitwiseValue19;
        intermediateValue[1u] = bitwiseValue20;
        intermediateValue[2u] = bitwiseValue21;
        uint productValue16 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue18 * 76u) + 54u) * 2 + 0));
        uint sumValue4 = productValue16 + 0u;
        uint bitwiseValue22 = ((rdByteLoad_objectInstances_uint(0u, productValue13 * 4 + 0) >> 2u) + (productValue5 & 32767u)) * 4u;
        float multiplyAddValue = mad(float(rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue4), bitwiseValue22 * 4 + 0) & 1023u), 0.00195503421127796173095703125f, -1.0f);
        float multiplyAddValue1 = mad(float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue4), bitwiseValue22 * 4 + 0) >> 10u) & 1023u), 0.00195503421127796173095703125f, -1.0f);
        float multiplyAddValue2 = mad(float((rdByteLoad_faceDataBuffersRW_uint(NonUniformResourceIndex(sumValue4), bitwiseValue22 * 4 + 0) >> 20u) & 1023u), 0.00195503421127796173095703125f, -1.0f);
        precise float sumValue5 = 1.0f - sumValue2;
        precise float sumValue6 = sumValue5 - productValue8;
        float intermediateValue1[3];
        intermediateValue1[0u] = sumValue6;
        intermediateValue1[1u] = sumValue2;
        intermediateValue1[2u] = productValue8;
        uint sumValue7 = productValue16 + 0u;
        uint productValue17 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue18 * 76u) + 56u) * 2 + 0));
        uint productValue18 = productValue17 * (rdByteLoad_objectInstances_uint(0u, productValue12 * 4 + 0) + bitwiseValue19);
        uint bitwiseValue23 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue18 * 76u) + 71u) * 2 + 0) & 255u);
        uint bitwiseValue24 = (bitwiseValue23 + productValue18) >> 1u;
        half3 productValue19 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue7), bitwiseValue24 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue7), (bitwiseValue24 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue7), (bitwiseValue24 + 2u) * 2 + 0)));
        uint bitwiseValue25 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue15 * 2 + 0) & 255u);
        uint bitwiseValue26 = (bitwiseValue25 + productValue18) >> 2u;
        uint bitwiseValue27 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue15 * 2 + 0) >> 8u);
        uint bitwiseValue28 = (bitwiseValue27 + productValue18) >> 2u;
        bool productValue20 = rdByteLoad_objectInstances_uint16_t(0u, productValue14 * 2 + 0) < 0u;
        float bitwiseValue30;
        float bitwiseValue31;
        if (productValue20)
        {
            uint bitwiseValue29 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue28 * 4 + 0) >> 15u;
            bitwiseValue30 = ((float(bitwiseValue29 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue28 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
            bitwiseValue31 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue28 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue29 & 65534u) * 1.525902189314365386962890625e-05f);
        }
        else
        {
            bitwiseValue30 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue28 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
            bitwiseValue31 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue28 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
        }
        uint intermediateValue13;
        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue14 * 2 + 0) & 256u) == 0u)
        {
            intermediateValue13 = 0u;
        }
        else
        {
            intermediateValue13 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), ((uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue18 * 76u) + 74u) * 2 + 0) >> 8u) + productValue18) >> 2u) * 4 + 0) & 65535u;
        }
        precise float productValue21 = sumValue6 * float(productValue19.x);
        precise float productValue22 = sumValue6 * float(productValue19.y);
        precise float productValue23 = sumValue6 * float(productValue19.z);
        precise float sumValue8 = productValue21 + 0.0f;
        precise float sumValue9 = productValue22 + 0.0f;
        precise float sumValue10 = productValue23 + 0.0f;
        uint productValue24 = productValue17 * (rdByteLoad_objectInstances_uint(0u, productValue12 * 4 + 0) + bitwiseValue20);
        uint bitwiseValue32 = (bitwiseValue23 + productValue24) >> 1u;
        half3 productValue25 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue7), bitwiseValue32 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue7), (bitwiseValue32 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue7), (bitwiseValue32 + 2u) * 2 + 0)));
        uint bitwiseValue33 = (bitwiseValue25 + productValue24) >> 2u;
        uint bitwiseValue34 = (bitwiseValue27 + productValue24) >> 2u;
        float bitwiseValue36;
        float bitwiseValue37;
        if (productValue20)
        {
            uint bitwiseValue35 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue34 * 4 + 0) >> 15u;
            bitwiseValue36 = ((float(bitwiseValue35 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue34 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
            bitwiseValue37 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue34 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue35 & 65534u) * 1.525902189314365386962890625e-05f);
        }
        else
        {
            bitwiseValue36 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue34 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
            bitwiseValue37 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue34 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
        }
        precise float productValue26 = sumValue2 * float(productValue25.x);
        precise float productValue27 = sumValue2 * float(productValue25.y);
        precise float productValue28 = sumValue2 * float(productValue25.z);
        precise float sumValue11 = sumValue8 + productValue26;
        precise float sumValue12 = sumValue9 + productValue27;
        precise float sumValue13 = sumValue10 + productValue28;
        uint productValue29 = productValue17 * (rdByteLoad_objectInstances_uint(0u, productValue12 * 4 + 0) + bitwiseValue21);
        uint bitwiseValue38 = (bitwiseValue23 + productValue29) >> 1u;
        half3 productValue30 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue7), bitwiseValue38 * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue7), (bitwiseValue38 + 1u) * 2 + 0), rdByteLoad_vertexBuffers_uint16_t(NonUniformResourceIndex(sumValue7), (bitwiseValue38 + 2u) * 2 + 0)));
        uint bitwiseValue39 = (bitwiseValue25 + productValue29) >> 2u;
        uint bitwiseValue40 = (bitwiseValue27 + productValue29) >> 2u;
        float bitwiseValue42;
        float bitwiseValue43;
        if (productValue20)
        {
            uint bitwiseValue41 = rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue40 * 4 + 0) >> 15u;
            bitwiseValue42 = ((float(bitwiseValue41 & 1u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue40 * 4 + 0) << 1u) & 65534u) * 1.525902189314365386962890625e-05f);
            bitwiseValue43 = ((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue40 * 4 + 0) >> 31u) * 6.103515625e-05f) + (-3.0517578125e-05f)) + (float(bitwiseValue41 & 65534u) * 1.525902189314365386962890625e-05f);
        }
        else
        {
            bitwiseValue42 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue40 * 4 + 0) & 65535u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
            bitwiseValue43 = floor(mad(float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue40 * 4 + 0) >> 16u) * 1.525902189314365386962890625e-05f, 16384.0f, 0.5f)) * 6.103515625e-05f;
        }
        precise float productValue31 = productValue8 * float(productValue30.x);
        precise float productValue32 = productValue8 * float(productValue30.y);
        precise float productValue33 = productValue8 * float(productValue30.z);
        precise float sumValue14 = sumValue11 + productValue31;
        precise float sumValue15 = sumValue12 + productValue32;
        precise float sumValue16 = sumValue13 + productValue33;
        float productValue34 = ((bitwiseValue36 * sumValue2) + (bitwiseValue30 * sumValue6)) + (bitwiseValue42 * productValue8);
        float productValue35 = ((bitwiseValue37 * sumValue2) + (bitwiseValue31 * sumValue6)) + (bitwiseValue43 * productValue8);
        float bitwiseValue44 = (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue33 * 4 + 0) & 255u) * sumValue2) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue26 * 4 + 0) & 255u) * sumValue6)) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue39 * 4 + 0) & 255u) * productValue8)) * 0.0039215688593685626983642578125f;
        float bitwiseValue45 = (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue33 * 4 + 0) >> 8u) & 255u) * sumValue2) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue26 * 4 + 0) >> 8u) & 255u) * sumValue6)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue39 * 4 + 0) >> 8u) & 255u) * productValue8)) * 0.0039215688593685626983642578125f;
        float bitwiseValue46 = (((float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue33 * 4 + 0) >> 16u) & 255u) * sumValue2) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue26 * 4 + 0) >> 16u) & 255u) * sumValue6)) + (float((rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue39 * 4 + 0) >> 16u) & 255u) * productValue8)) * 0.0039215688593685626983642578125f;
        float bitwiseValue47 = (((float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue33 * 4 + 0) >> 24u) * sumValue2) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue26 * 4 + 0) >> 24u) * sumValue6)) + (float(rdByteLoad_vertexBuffers_uint(NonUniformResourceIndex(sumValue7), bitwiseValue39 * 4 + 0) >> 24u) * productValue8)) * 0.0039215688593685626983642578125f;
        precise float productValue36 = scalarValue * sumValue14;
        precise float productValue37 = sumValue15 * scalarValue1;
        precise float sumValue17 = productValue37 + productValue36;
        precise float productValue38 = sumValue16 * scalarValue2;
        precise float sumValue18 = productValue38 + sumValue17;
        precise float productValue39 = 1.0f * reinterpretedBits1.w;
        precise float sumValue19 = productValue39 + sumValue18;
        precise float productValue40 = scalarValue3 * sumValue14;
        precise float productValue41 = sumValue15 * scalarValue4;
        precise float sumValue20 = productValue41 + productValue40;
        precise float productValue42 = sumValue16 * scalarValue5;
        precise float sumValue21 = productValue42 + sumValue20;
        precise float productValue43 = 1.0f * reinterpretedBits2.w;
        precise float sumValue22 = productValue43 + sumValue21;
        precise float productValue44 = scalarValue6 * sumValue14;
        precise float productValue45 = sumValue15 * scalarValue7;
        precise float sumValue23 = productValue45 + productValue44;
        precise float productValue46 = sumValue16 * scalarValue8;
        precise float sumValue24 = productValue46 + sumValue23;
        precise float productValue47 = 1.0f * reinterpretedBits3.w;
        precise float sumValue25 = productValue47 + sumValue24;
        float multiplyAddValue3 = mad(multiplyAddValue2, scalarValue2, mad(multiplyAddValue1, scalarValue1, multiplyAddValue * scalarValue));
        float multiplyAddValue4 = mad(multiplyAddValue2, scalarValue5, mad(multiplyAddValue1, scalarValue4, multiplyAddValue * scalarValue3));
        float multiplyAddValue5 = mad(multiplyAddValue2, scalarValue8, mad(multiplyAddValue1, scalarValue7, multiplyAddValue * scalarValue6));
        float inverseLengthValue = rsqrt(dot(float3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5), float3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5)));
        float productValue48 = inverseLengthValue * multiplyAddValue3;
        float productValue49 = inverseLengthValue * multiplyAddValue4;
        float productValue50 = inverseLengthValue * multiplyAddValue5;
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        if (((rdByteLoad_objectInstances_uint16_t(0u, productValue14 * 2 + 0) & 1u) != 0u) && (asuint(viewCbConstants[86u]).y != 0u))
        {
            uint sumValue26 = productValue16 + 0u;
            float intermediateValue20;
            uint intermediateValue21;
            float intermediateValue22;
            float intermediateValue23;
            float intermediateValue24;
            float intermediateValue25;
            float intermediateValue26;
            float intermediateValue27;
            uint intermediateValue28;
            intermediateValue20 = sumValue6;
            intermediateValue21 = bitwiseValue19;
            intermediateValue22 = 0.0f;
            intermediateValue23 = 0.0f;
            intermediateValue24 = 0.0f;
            intermediateValue25 = 0.0f;
            intermediateValue26 = 0.0f;
            intermediateValue27 = 0.0f;
            intermediateValue28 = 0u;
            float sumValue27;
            float sumValue28;
            float sumValue29;
            float sumValue30;
            float sumValue31;
            float sumValue32;
            uint sumValue33;
            for (;;)
            {
                uint productValue51 = intermediateValue21 + rdByteLoad_objectInstances_uint(0u, productValue13 * 4 + 0);
                uint productValue52 = productValue51 * 8u;
                half3 productValue53 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue26), productValue52 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue26), (productValue52 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue26), (productValue52 + 2u) * 2 + 0)));
                uint productValue54 = (productValue51 * 8u) + 4u;
                half3 productValue55 = (half3)f16tof32(uint16_t3(rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue26), productValue54 * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue26), (productValue54 + 1u) * 2 + 0), rdByteLoad_vertexIrradianceCache_uint16_t(NonUniformResourceIndex(sumValue26), (productValue54 + 2u) * 2 + 0)));
                float productValue56 = float(productValue53.x) * intermediateValue20;
                float productValue57 = float(productValue53.y) * intermediateValue20;
                float productValue58 = float(productValue53.z) * intermediateValue20;
                sumValue27 = productValue56 + intermediateValue22;
                sumValue28 = productValue57 + intermediateValue23;
                sumValue29 = productValue58 + intermediateValue24;
                float productValue59 = float(productValue55.x) * intermediateValue20;
                float productValue60 = float(productValue55.y) * intermediateValue20;
                float productValue61 = float(productValue55.z) * intermediateValue20;
                sumValue30 = productValue59 + intermediateValue25;
                sumValue31 = productValue60 + intermediateValue26;
                sumValue32 = productValue61 + intermediateValue27;
                sumValue33 = intermediateValue28 + 1u;
                if (sumValue33 == 3u)
                {
                    break;
                }
                else
                {
                    intermediateValue20 = intermediateValue1[sumValue33];
                    intermediateValue21 = intermediateValue[sumValue33];
                    intermediateValue22 = sumValue27;
                    intermediateValue23 = sumValue28;
                    intermediateValue24 = sumValue29;
                    intermediateValue25 = sumValue30;
                    intermediateValue26 = sumValue31;
                    intermediateValue27 = sumValue32;
                    intermediateValue28 = sumValue33;
                    continue;
                }
            }
            intermediateValue14 = sumValue27;
            intermediateValue15 = sumValue28;
            intermediateValue16 = sumValue29;
            intermediateValue17 = sumValue30;
            intermediateValue18 = sumValue31;
            intermediateValue19 = sumValue32;
        }
        else
        {
            intermediateValue14 = 0.0f;
            intermediateValue15 = 0.0f;
            intermediateValue16 = 0.0f;
            intermediateValue17 = 0.0f;
            intermediateValue18 = 0.0f;
            intermediateValue19 = 0.0f;
        }
        float2 reinterpretedBits4 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, (intermediateValue13 * 8u) * 8 + 0));
        float2 reinterpretedBits5 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint2(0u, ((intermediateValue13 * 8u) + 1u) * 8 + 0));
        float reinterpretedBits6 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue13 * 16u) + 13u) * 4 + 0));
        float reinterpretedBits7 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue13 * 16u) + 14u) * 4 + 0));
        uint reinterpretedBits8;
        if (rdByteLoad_objectInstances_uint16_t(0u, productValue1 * 2 + 0) > 4095u)
        {
            reinterpretedBits8 = asuint(viewCbConstants[98u]).w;
        }
        else
        {
            reinterpretedBits8 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue1 * 2 + 0));
        }
        uint sumValue34 = reinterpretedBits8 + 0u;
        float intermediateValue29;
        float intermediateValue30;
        float intermediateValue31;
        float intermediateValue32;
        if (rdByteLoad_objectInstances_uint16_t(0u, productValue1 * 2 + 0) == 65535u)
        {
            intermediateValue29 = 1.0f;
            intermediateValue30 = 1.0f;
            intermediateValue31 = 1.0f;
            intermediateValue32 = 1.0f;
        }
        else
        {
            float4 sampledTextureValue = textures[NonUniformResourceIndex(sumValue34)].SampleLevel(defaultSampler, float2(productValue34, productValue35), min(100.0f, reinterpretedBits6));
            intermediateValue29 = sampledTextureValue.x;
            intermediateValue30 = sampledTextureValue.y;
            intermediateValue31 = sampledTextureValue.z;
            intermediateValue32 = sampledTextureValue.w;
        }
        float productValue62;
        float productValue63;
        float productValue64;
        float productValue65;
        float productValue66;
        float productValue67;
        float productValue68;
        float productValue69;
        float productValue70;
        if ((rdByteLoad_objectInstances_uint16_t(0u, productValue3 * 2 + 0) & 1536u) == 0u)
        {
            float intermediateValue36;
            float intermediateValue37;
            float intermediateValue38;
            float intermediateValue39;
            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue3 * 2 + 0) & 4u) == 0u)
            {
                intermediateValue36 = intermediateValue32;
                intermediateValue37 = bitwiseValue44;
                intermediateValue38 = bitwiseValue45;
                intermediateValue39 = bitwiseValue46;
            }
            else
            {
                uint reinterpretedBits9;
                if (rdByteLoad_objectInstances_uint16_t(0u, productValue2 * 2 + 0) > 4095u)
                {
                    reinterpretedBits9 = asuint(viewCbConstants[98u]).w;
                }
                else
                {
                    reinterpretedBits9 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue2 * 2 + 0));
                }
                float4 sampledTextureValue1 = textures[NonUniformResourceIndex(reinterpretedBits9 + 0u)].SampleLevel(defaultSampler, float2(bitwiseValue44, bitwiseValue45), 0.0f);
                intermediateValue36 = 1.0f;
                intermediateValue37 = ((((sampledTextureValue1.x * 2.0f) + (-1.0f)) * bitwiseValue46) + 1.0f) * bitwiseValue47;
                intermediateValue38 = ((((sampledTextureValue1.y * 2.0f) + (-1.0f)) * bitwiseValue46) + 1.0f) * bitwiseValue47;
                intermediateValue39 = ((((sampledTextureValue1.z * 2.0f) + (-1.0f)) * bitwiseValue46) + 1.0f) * bitwiseValue47;
            }
            float intermediateValue41;
            float intermediateValue42;
            float intermediateValue43;
            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue3 * 2 + 0) & 8192u) == 0u)
            {
                intermediateValue41 = intermediateValue37;
                intermediateValue42 = intermediateValue38;
                intermediateValue43 = intermediateValue39;
            }
            else
            {
                intermediateValue41 = ((1.0f - intermediateValue37) * intermediateValue36) + intermediateValue37;
                intermediateValue42 = ((1.0f - intermediateValue38) * intermediateValue36) + intermediateValue38;
                intermediateValue43 = ((1.0f - intermediateValue39) * intermediateValue36) + intermediateValue39;
            }
            float intermediateValue47;
            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue3 * 2 + 0) & 2048u) == 0u)
            {
                intermediateValue47 = intermediateValue36;
            }
            else
            {
                intermediateValue47 = clamp(mad(intermediateValue36, 2.0f, -1.0f), 0.0f, 1.0f);
            }
            float bitwiseValue48 = (intermediateValue41 * intermediateValue29) * ((intermediateValue47 * ((float(rdByteLoad_objectInstances_uint(0u, productValue4 * 4 + 0) >> 24u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
            float bitwiseValue49 = (intermediateValue42 * intermediateValue30) * ((intermediateValue47 * ((float((rdByteLoad_objectInstances_uint(0u, productValue4 * 4 + 0) >> 16u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
            float bitwiseValue50 = (intermediateValue43 * intermediateValue31) * ((intermediateValue47 * ((float((rdByteLoad_objectInstances_uint(0u, productValue4 * 4 + 0) >> 8u) & 255u) * 0.0039215688593685626983642578125f) + (-1.0f))) + 1.0f);
            float productValue100;
            if (bitwiseValue48 < 0.040449999272823333740234375f)
            {
                productValue100 = bitwiseValue48 * 0.077399380505084991455078125f;
            }
            else
            {
                productValue100 = exp2(log2((bitwiseValue48 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
            }
            float productValue124;
            if (bitwiseValue49 < 0.040449999272823333740234375f)
            {
                productValue124 = bitwiseValue49 * 0.077399380505084991455078125f;
            }
            else
            {
                productValue124 = exp2(log2((bitwiseValue49 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
            }
            float productValue175;
            if (bitwiseValue50 < 0.040449999272823333740234375f)
            {
                productValue175 = bitwiseValue50 * 0.077399380505084991455078125f;
            }
            else
            {
                productValue175 = exp2(log2((bitwiseValue50 + 0.054999999701976776123046875f) * 0.947867333889007568359375f) * 2.400000095367431640625f);
            }
            float reinterpretedBits10;
            float reinterpretedBits11;
            if ((rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue13 * 16u) + 8u) * 4 + 0) & 1u) == 0u)
            {
                reinterpretedBits10 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue13 * 16u) + 11u) * 4 + 0));
                reinterpretedBits11 = asfloat(rdByteLoad_pbrTextureDataBuffer_uint(0u, ((intermediateValue13 * 16u) + 10u) * 4 + 0));
            }
            else
            {
                float4 sampledTextureValue2 = textures[NonUniformResourceIndex(sumValue34)].SampleLevel(defaultSampler, float2(mad(productValue34, reinterpretedBits4.x, reinterpretedBits5.x), mad(productValue35, reinterpretedBits4.y, reinterpretedBits5.y)), min((100.0f - reinterpretedBits6) + reinterpretedBits7, reinterpretedBits7));
                float scalarValue9 = sampledTextureValue2.y;
                reinterpretedBits10 = sampledTextureValue2.x;
                reinterpretedBits11 = mad(scalarValue9, scalarValue9, 0.0f);
            }
            float sumValue35 = 1.0f - reinterpretedBits10;
            float productValue71 = sumValue35 * productValue100;
            float productValue72 = sumValue35 * productValue124;
            float productValue73 = sumValue35 * productValue175;
            float dotProductValue = dot(float3(productValue100, productValue124, productValue175), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float productValue74 = (reinterpretedBits11 * 5.0f) * viewCbConstants[84u].w;
            productValue62 = productValue74 * (((dotProductValue - productValue100) * viewCbConstants[85u].x) + productValue100);
            productValue63 = productValue74 * (((dotProductValue - productValue124) * viewCbConstants[85u].x) + productValue124);
            productValue64 = productValue74 * (((dotProductValue - productValue175) * viewCbConstants[85u].x) + productValue175);
            productValue65 = (reinterpretedBits10 * (productValue100 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
            productValue66 = (reinterpretedBits10 * (productValue124 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
            productValue67 = (reinterpretedBits10 * (productValue175 + (-0.039999999105930328369140625f))) + 0.039999999105930328369140625f;
            productValue68 = productValue71 - (productValue71 * reinterpretedBits11);
            productValue69 = productValue72 - (productValue72 * reinterpretedBits11);
            productValue70 = productValue73 - (productValue73 * reinterpretedBits11);
        }
        else
        {
            productValue62 = intermediateValue33;
            productValue63 = intermediateValue33;
            productValue64 = intermediateValue33;
            productValue65 = intermediateValue33;
            productValue66 = intermediateValue33;
            productValue67 = intermediateValue33;
            productValue68 = intermediateValue33;
            productValue69 = intermediateValue33;
            productValue70 = intermediateValue33;
        }
        RayDesc _8ident = {float3(sumValue19, sumValue22, sumValue25), 0.004999999888241291046142578125f, float3(viewCbConstants[53u].xyz), 10000.0f};
        intermediateValue34.TraceRayInline(SceneBVH, 512u, 32u, _8ident);
        bool conditionValue = intermediateValue34.Proceed();
        if (conditionValue)
        {
            bool intermediateValue53;
            bool comparisonValue;
            for (;;)
            {
                uint scalarValue10 = intermediateValue34.CandidateType();
                comparisonValue = scalarValue10 == 0u;
                if (comparisonValue)
                {
                    float2 vectorValue = intermediateValue34.CandidateTriangleBarycentrics();
                    float2 vectorValue1 = intermediateValue34.CandidateTriangleBarycentrics();
                    uint scalarValue11 = intermediateValue34.CandidatePrimitiveIndex();
                    uint scalarValue12 = intermediateValue34.CandidateInstanceID();
                    uint scalarValue13 = intermediateValue34.CandidateInstanceIndex();
                    uint productValue75 = (scalarValue13 * 76u) + 58u;
                    uint productValue76 = (scalarValue13 * 76u) + 61u;
                    precise float sumValue36 = 1.0f - vectorValue.x;
                    precise float sumValue37 = sumValue36 - vectorValue1.y;
                    uint bitwiseValue51 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue13 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue11 >> 1u);
                    uint productValue77 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue13 * 76u) + 54u) * 2 + 0)) + 0u;
                    bool comparisonValue1 = (scalarValue11 & 1u) == 0u;
                    uint comparisonValue2 = comparisonValue1 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue51 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue51 * 16 + 0).x;
                    uint comparisonValue3 = comparisonValue1 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue51 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue51 * 16 + 0).w;
                    uint comparisonValue4 = comparisonValue1 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue51 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue77), bitwiseValue51 * 16 + 0).z;
                    bool productValue78 = rdByteLoad_objectInstances_uint16_t(0u, productValue76 * 2 + 0) < 0u;
                    float intermediateValue75;
                    float intermediateValue76;
                    if (productValue78)
                    {
                        uint bitwiseValue52 = comparisonValue4 >> 15u;
                        precise float bitwiseValue53 = float(bitwiseValue52 & 1u) * 2.0f;
                        precise float sumValue38 = bitwiseValue53 + (-1.0f);
                        precise float bitwiseValue54 = float(comparisonValue4 >> 31u) * 2.0f;
                        precise float sumValue39 = bitwiseValue54 + (-1.0f);
                        precise float bitwiseValue55 = float((comparisonValue4 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue56 = float(bitwiseValue52 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue79 = sumValue38 * 3.0517578125e-05f;
                        precise float productValue80 = sumValue39 * 3.0517578125e-05f;
                        precise float sumValue40 = bitwiseValue55 + productValue79;
                        precise float sumValue41 = bitwiseValue56 + productValue80;
                        intermediateValue75 = sumValue40;
                        intermediateValue76 = sumValue41;
                    }
                    else
                    {
                        precise float bitwiseValue57 = float(comparisonValue4 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue58 = float(comparisonValue4 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue81 = bitwiseValue57 * 16384.0f;
                        precise float sumValue42 = productValue81 + 0.5f;
                        precise float productValue82 = bitwiseValue58 * 16384.0f;
                        precise float sumValue43 = productValue82 + 0.5f;
                        precise float productValue83 = floor(sumValue42) * 6.103515625e-05f;
                        precise float productValue84 = floor(sumValue43) * 6.103515625e-05f;
                        intermediateValue75 = productValue83;
                        intermediateValue76 = productValue84;
                    }
                    precise float productValue85 = sumValue37 * intermediateValue75;
                    precise float productValue86 = sumValue37 * intermediateValue76;
                    precise float sumValue44 = productValue85 + 0.0f;
                    precise float sumValue45 = productValue86 + 0.0f;
                    float intermediateValue117;
                    float intermediateValue118;
                    if (productValue78)
                    {
                        uint bitwiseValue59 = comparisonValue3 >> 15u;
                        precise float bitwiseValue60 = float(bitwiseValue59 & 1u) * 2.0f;
                        precise float sumValue46 = bitwiseValue60 + (-1.0f);
                        precise float bitwiseValue61 = float(comparisonValue3 >> 31u) * 2.0f;
                        precise float sumValue47 = bitwiseValue61 + (-1.0f);
                        precise float bitwiseValue62 = float((comparisonValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue63 = float(bitwiseValue59 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue87 = sumValue46 * 3.0517578125e-05f;
                        precise float productValue88 = sumValue47 * 3.0517578125e-05f;
                        precise float sumValue48 = bitwiseValue62 + productValue87;
                        precise float sumValue49 = bitwiseValue63 + productValue88;
                        intermediateValue117 = sumValue48;
                        intermediateValue118 = sumValue49;
                    }
                    else
                    {
                        precise float bitwiseValue64 = float(comparisonValue3 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue65 = float(comparisonValue3 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue89 = bitwiseValue64 * 16384.0f;
                        precise float sumValue50 = productValue89 + 0.5f;
                        precise float productValue90 = bitwiseValue65 * 16384.0f;
                        precise float sumValue51 = productValue90 + 0.5f;
                        precise float productValue91 = floor(sumValue50) * 6.103515625e-05f;
                        precise float productValue92 = floor(sumValue51) * 6.103515625e-05f;
                        intermediateValue117 = productValue91;
                        intermediateValue118 = productValue92;
                    }
                    precise float productValue93 = vectorValue.x * intermediateValue117;
                    precise float productValue94 = vectorValue.x * intermediateValue118;
                    precise float sumValue52 = sumValue44 + productValue93;
                    precise float sumValue53 = sumValue45 + productValue94;
                    float intermediateValue145;
                    float intermediateValue146;
                    if (productValue78)
                    {
                        uint bitwiseValue66 = comparisonValue2 >> 15u;
                        precise float bitwiseValue67 = float(bitwiseValue66 & 1u) * 2.0f;
                        precise float sumValue54 = bitwiseValue67 + (-1.0f);
                        precise float bitwiseValue68 = float(comparisonValue2 >> 31u) * 2.0f;
                        precise float sumValue55 = bitwiseValue68 + (-1.0f);
                        precise float bitwiseValue69 = float((comparisonValue2 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue70 = float(bitwiseValue66 & 65534u) * 1.525902189314365386962890625e-05f;
                        precise float productValue95 = sumValue54 * 3.0517578125e-05f;
                        precise float productValue96 = sumValue55 * 3.0517578125e-05f;
                        precise float sumValue56 = bitwiseValue69 + productValue95;
                        precise float sumValue57 = bitwiseValue70 + productValue96;
                        intermediateValue145 = sumValue56;
                        intermediateValue146 = sumValue57;
                    }
                    else
                    {
                        precise float bitwiseValue71 = float(comparisonValue2 & 65535u) * 1.525902189314365386962890625e-05f;
                        precise float bitwiseValue72 = float(comparisonValue2 >> 16u) * 1.525902189314365386962890625e-05f;
                        precise float productValue97 = bitwiseValue71 * 16384.0f;
                        precise float sumValue58 = productValue97 + 0.5f;
                        precise float productValue98 = bitwiseValue72 * 16384.0f;
                        precise float sumValue59 = productValue98 + 0.5f;
                        precise float productValue99 = floor(sumValue58) * 6.103515625e-05f;
                        precise float productValue101 = floor(sumValue59) * 6.103515625e-05f;
                        intermediateValue145 = productValue99;
                        intermediateValue146 = productValue101;
                    }
                    precise float productValue102 = vectorValue1.y * intermediateValue145;
                    precise float productValue103 = vectorValue1.y * intermediateValue146;
                    precise float sumValue60 = sumValue52 + productValue102;
                    precise float sumValue61 = sumValue53 + productValue103;
                    float intermediateValue148;
                    if (rdByteLoad_objectInstances_uint16_t(0u, productValue75 * 2 + 0) == 65535u)
                    {
                        intermediateValue148 = 1.0f;
                    }
                    else
                    {
                        uint reinterpretedBits12;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue75 * 2 + 0) > 4095u)
                        {
                            reinterpretedBits12 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits12 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue75 * 2 + 0));
                        }
                        intermediateValue148 = textures[NonUniformResourceIndex(reinterpretedBits12 + 0u)].SampleLevel(defaultSampler, float2(sumValue60, sumValue61), -0.25f).w;
                    }
                    uint comparisonValue27;
                    if (scalarValue12 == 2u)
                    {
                        comparisonValue27 = 0u;
                    }
                    else
                    {
                        comparisonValue27 = uint(intermediateValue148 <= (((rdByteLoad_objectInstances_uint16_t(0u, productValue76 * 2 + 0) & 4352u) != 0u) ? 0.5f : 0.0f));
                    }
                    if (comparisonValue27 == 0u)
                    {
                        intermediateValue34.CommitNonOpaqueTriangleHit();
                    }
                }
                intermediateValue53 = intermediateValue34.Proceed();
                if (intermediateValue53)
                {
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        uint scalarValue14 = intermediateValue34.CommittedStatus();
        float intermediateValue46;
        if (scalarValue14 == 1u)
        {
            float scalarValue15 = intermediateValue34.CommittedRayT();
            intermediateValue46 = scalarValue15;
        }
        else
        {
            intermediateValue46 = 10000.0f;
        }
        float intermediateValue83;
        float intermediateValue84;
        float intermediateValue85;
        if (intermediateValue46 < 10000.0f)
        {
            precise float productValue104 = intermediateValue46 * viewCbConstants[63u].x;
            precise float productValue105 = intermediateValue46 * viewCbConstants[63u].y;
            precise float productValue106 = intermediateValue46 * viewCbConstants[63u].z;
            precise float productValue107 = productValue104 * (-1.44269502162933349609375f);
            precise float productValue108 = productValue105 * (-1.44269502162933349609375f);
            precise float productValue109 = productValue106 * (-1.44269502162933349609375f);
            precise float productValue110 = viewCbConstants[53u].x * intermediateValue46;
            precise float sumValue62 = productValue110 + sumValue19;
            precise float productValue111 = viewCbConstants[53u].z * intermediateValue46;
            precise float sumValue63 = productValue111 + sumValue25;
            precise float productValue112 = sumValue62 * viewCbConstants[83u].z;
            precise float sumValue64 = productValue112 + viewCbConstants[84u].x;
            precise float productValue113 = sumValue63 * viewCbConstants[83u].w;
            precise float sumValue65 = productValue113 + viewCbConstants[84u].y;
            float4 sampledTextureValue3 = wibblyTexture.SampleLevel(linearWrapSampler, float2(sumValue64, sumValue65), 0.0f);
            precise float sumValue66 = sampledTextureValue3.x + (-0.5f);
            precise float sumValue67 = sampledTextureValue3.y + (-0.5f);
            precise float productValue114 = sumValue62 * viewCbConstants[82u].z;
            precise float sumValue68 = productValue114 + viewCbConstants[83u].x;
            precise float productValue115 = sumValue63 * viewCbConstants[82u].w;
            precise float sumValue69 = productValue115 + viewCbConstants[83u].y;
            precise float productValue116 = sumValue66 * 0.4000000059604644775390625f;
            precise float productValue120 = sumValue67 * 0.4000000059604644775390625f;
            precise float sumValue70 = sumValue68 + productValue116;
            precise float sumValue71 = productValue120 + sumValue69;
            precise float productValue121 = viewCbConstants[68u].w * 63.0f;
            uint scalarValue16 = uint(int(floor(productValue121)));
            precise float productValue122 = float(int(scalarValue16 + 1u)) * 0.015625f;
            precise float sumValue72 = (-0.0f) - productValue122;
            float scalarValue17 = frac(abs(productValue122));
            precise float sumValue73 = (-0.0f) - scalarValue17;
            precise float comparisonValue5 = ((productValue122 >= sumValue72) ? scalarValue17 : sumValue73) * 64.0f;
            float4 sampledTextureValue4 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue70, sumValue71, float(int(scalarValue16))), 0.0f);
            float scalarValue18 = sampledTextureValue4.x;
            precise float sampledTextureValue5 = causticsTexture.SampleLevel(linearWrapSampler, float3(sumValue70, sumValue71, float(int(uint(int(comparisonValue5))))), 0.0f).x - scalarValue18;
            precise float productValue123 = frac(productValue121) * sampledTextureValue5;
            precise float sumValue74 = scalarValue18 + productValue123;
            precise float productValue125 = sumValue74 * 7.0f;
            precise float sumValue75 = productValue125 + 0.800000011920928955078125f;
            precise float productValue126 = intermediateValue46 * (-0.100000001490116119384765625f);
            precise float sumValue76 = sumValue75 + (-1.0f);
            precise float exponentialValue = exp2(productValue126) * sumValue76;
            precise float sumValue77 = exponentialValue + 1.0f;
            precise float exponentialValue1 = exp2(productValue107) * sumValue77;
            precise float exponentialValue2 = exp2(productValue108) * sumValue77;
            precise float exponentialValue3 = exp2(productValue109) * sumValue77;
            RayDesc _9ident = {float3(sumValue19, sumValue22, sumValue25), 0.004999999888241291046142578125f, float3(viewCbConstants[53u].xyz), intermediateValue46};
            intermediateValue57.TraceRayInline(SceneBVH, 512u, 4294967199u, _9ident);
            bool conditionValue1 = intermediateValue57.Proceed();
            float intermediateValue61;
            float intermediateValue63;
            float intermediateValue65;
            if (conditionValue1)
            {
                float intermediateValue62;
                float intermediateValue64;
                float intermediateValue66;
                float scalarValue19 = exponentialValue1;
                float scalarValue20 = exponentialValue2;
                float scalarValue21 = exponentialValue3;
                bool comparisonValue11;
                for (;;)
                {
                    uint scalarValue22 = intermediateValue57.CandidateType();
                    comparisonValue11 = scalarValue22 == 0u;
                    float branchMergedValue;
                    float branchMergedValue3;
                    float branchMergedValue4;
                    if (comparisonValue11)
                    {
                        float2 vectorValue2 = intermediateValue57.CandidateTriangleBarycentrics();
                        float2 vectorValue3 = intermediateValue57.CandidateTriangleBarycentrics();
                        float scalarValue23 = intermediateValue57.CandidateTriangleRayT();
                        uint scalarValue24 = intermediateValue57.CandidatePrimitiveIndex();
                        uint scalarValue25 = intermediateValue57.CandidateInstanceID();
                        uint scalarValue26 = intermediateValue57.CandidateInstanceIndex();
                        uint productValue127 = (scalarValue26 * 76u) + 58u;
                        uint productValue128 = (scalarValue26 * 76u) + 61u;
                        precise float sumValue78 = 1.0f - vectorValue2.x;
                        precise float sumValue79 = sumValue78 - vectorValue3.y;
                        uint bitwiseValue73 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue26 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue24 >> 1u);
                        uint productValue129 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue26 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue6 = (scalarValue24 & 1u) == 0u;
                        uint comparisonValue7 = comparisonValue6 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue129), bitwiseValue73 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue129), bitwiseValue73 * 16 + 0).x;
                        uint comparisonValue8 = comparisonValue6 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue129), bitwiseValue73 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue129), bitwiseValue73 * 16 + 0).w;
                        uint comparisonValue9 = comparisonValue6 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue129), bitwiseValue73 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue129), bitwiseValue73 * 16 + 0).z;
                        bool productValue130 = rdByteLoad_objectInstances_uint16_t(0u, productValue128 * 2 + 0) < 0u;
                        float intermediateValue125;
                        float intermediateValue126;
                        if (productValue130)
                        {
                            uint bitwiseValue74 = comparisonValue9 >> 15u;
                            precise float bitwiseValue75 = float(bitwiseValue74 & 1u) * 2.0f;
                            precise float sumValue80 = bitwiseValue75 + (-1.0f);
                            precise float bitwiseValue76 = float(comparisonValue9 >> 31u) * 2.0f;
                            precise float sumValue81 = bitwiseValue76 + (-1.0f);
                            precise float bitwiseValue77 = float((comparisonValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue78 = float(bitwiseValue74 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue131 = sumValue80 * 3.0517578125e-05f;
                            precise float productValue132 = sumValue81 * 3.0517578125e-05f;
                            precise float sumValue82 = bitwiseValue77 + productValue131;
                            precise float sumValue83 = bitwiseValue78 + productValue132;
                            intermediateValue125 = sumValue82;
                            intermediateValue126 = sumValue83;
                        }
                        else
                        {
                            precise float bitwiseValue79 = float(comparisonValue9 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue80 = float(comparisonValue9 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue133 = bitwiseValue79 * 16384.0f;
                            precise float sumValue84 = productValue133 + 0.5f;
                            precise float productValue134 = bitwiseValue80 * 16384.0f;
                            precise float sumValue85 = productValue134 + 0.5f;
                            precise float productValue135 = floor(sumValue84) * 6.103515625e-05f;
                            precise float productValue136 = floor(sumValue85) * 6.103515625e-05f;
                            intermediateValue125 = productValue135;
                            intermediateValue126 = productValue136;
                        }
                        precise float productValue140 = sumValue79 * intermediateValue125;
                        precise float productValue141 = sumValue79 * intermediateValue126;
                        precise float sumValue86 = productValue140 + 0.0f;
                        precise float sumValue87 = productValue141 + 0.0f;
                        float intermediateValue149;
                        float intermediateValue150;
                        if (productValue130)
                        {
                            uint bitwiseValue81 = comparisonValue8 >> 15u;
                            precise float bitwiseValue82 = float(bitwiseValue81 & 1u) * 2.0f;
                            precise float sumValue88 = bitwiseValue82 + (-1.0f);
                            precise float bitwiseValue83 = float(comparisonValue8 >> 31u) * 2.0f;
                            precise float sumValue89 = bitwiseValue83 + (-1.0f);
                            precise float bitwiseValue84 = float((comparisonValue8 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue85 = float(bitwiseValue81 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue142 = sumValue88 * 3.0517578125e-05f;
                            precise float productValue143 = sumValue89 * 3.0517578125e-05f;
                            precise float sumValue90 = bitwiseValue84 + productValue142;
                            precise float sumValue91 = bitwiseValue85 + productValue143;
                            intermediateValue149 = sumValue90;
                            intermediateValue150 = sumValue91;
                        }
                        else
                        {
                            precise float bitwiseValue86 = float(comparisonValue8 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue87 = float(comparisonValue8 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue144 = bitwiseValue86 * 16384.0f;
                            precise float sumValue92 = productValue144 + 0.5f;
                            precise float productValue145 = bitwiseValue87 * 16384.0f;
                            precise float sumValue93 = productValue145 + 0.5f;
                            precise float productValue146 = floor(sumValue92) * 6.103515625e-05f;
                            precise float productValue147 = floor(sumValue93) * 6.103515625e-05f;
                            intermediateValue149 = productValue146;
                            intermediateValue150 = productValue147;
                        }
                        precise float productValue148 = vectorValue2.x * intermediateValue149;
                        precise float productValue149 = vectorValue2.x * intermediateValue150;
                        precise float sumValue94 = sumValue86 + productValue148;
                        precise float sumValue95 = sumValue87 + productValue149;
                        float intermediateValue155;
                        float intermediateValue156;
                        if (productValue130)
                        {
                            uint bitwiseValue88 = comparisonValue7 >> 15u;
                            precise float bitwiseValue89 = float(bitwiseValue88 & 1u) * 2.0f;
                            precise float sumValue96 = bitwiseValue89 + (-1.0f);
                            precise float bitwiseValue90 = float(comparisonValue7 >> 31u) * 2.0f;
                            precise float sumValue97 = bitwiseValue90 + (-1.0f);
                            precise float bitwiseValue91 = float((comparisonValue7 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue92 = float(bitwiseValue88 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue150 = sumValue96 * 3.0517578125e-05f;
                            precise float productValue151 = sumValue97 * 3.0517578125e-05f;
                            precise float sumValue98 = bitwiseValue91 + productValue150;
                            precise float sumValue99 = bitwiseValue92 + productValue151;
                            intermediateValue155 = sumValue98;
                            intermediateValue156 = sumValue99;
                        }
                        else
                        {
                            precise float bitwiseValue93 = float(comparisonValue7 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue94 = float(comparisonValue7 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue152 = bitwiseValue93 * 16384.0f;
                            precise float sumValue100 = productValue152 + 0.5f;
                            precise float productValue153 = bitwiseValue94 * 16384.0f;
                            precise float sumValue101 = productValue153 + 0.5f;
                            precise float productValue154 = floor(sumValue100) * 6.103515625e-05f;
                            precise float productValue155 = floor(sumValue101) * 6.103515625e-05f;
                            intermediateValue155 = productValue154;
                            intermediateValue156 = productValue155;
                        }
                        precise float productValue156 = vectorValue3.y * intermediateValue155;
                        precise float productValue157 = vectorValue3.y * intermediateValue156;
                        precise float sumValue102 = sumValue94 + productValue156;
                        precise float sumValue103 = sumValue95 + productValue157;
                        precise float productValue158 = scalarValue23 * 0.083333335816860198974609375f;
                        precise float sumValue104 = productValue158 + (-0.25f);
                        float intermediateValue161;
                        float intermediateValue162;
                        float intermediateValue163;
                        float intermediateValue164;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue127 * 2 + 0) == 65535u)
                        {
                            intermediateValue161 = 1.0f;
                            intermediateValue162 = 1.0f;
                            intermediateValue163 = 1.0f;
                            intermediateValue164 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits13;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue127 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits13 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits13 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue127 * 2 + 0));
                            }
                            float4 sampledTextureValue6 = textures[NonUniformResourceIndex(reinterpretedBits13 + 0u)].SampleLevel(defaultSampler, float2(sumValue102, sumValue103), min(sumValue104, 2.0f));
                            intermediateValue161 = sampledTextureValue6.x;
                            intermediateValue162 = sampledTextureValue6.y;
                            intermediateValue163 = sampledTextureValue6.z;
                            intermediateValue164 = sampledTextureValue6.w;
                        }
                        float intermediateValue171;
                        float intermediateValue172;
                        float intermediateValue173;
                        if (scalarValue25 == 2u)
                        {
                            float branchMergedValue10;
                            float branchMergedValue15;
                            float branchMergedValue16;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue128 * 2 + 0) & 128u) == 0u)
                            {
                                float intermediateValue181;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue128 * 2 + 0) & 2048u) == 0u)
                                {
                                    intermediateValue181 = intermediateValue164;
                                }
                                else
                                {
                                    precise float productValue159 = intermediateValue164 * 2.0f;
                                    precise float sumValue105 = productValue159 + (-1.0f);
                                    intermediateValue181 = clamp(sumValue105, 0.0f, 1.0f);
                                }
                                precise float sumValue106 = 0.0f - intermediateValue161;
                                precise float sumValue107 = 0.0f - intermediateValue162;
                                precise float sumValue108 = 0.0f - intermediateValue163;
                                precise float productValue160 = sumValue106 * intermediateValue181;
                                precise float productValue161 = sumValue107 * intermediateValue181;
                                precise float productValue162 = sumValue108 * intermediateValue181;
                                precise float sumValue109 = intermediateValue161 + productValue160;
                                precise float sumValue110 = intermediateValue162 + productValue161;
                                precise float sumValue111 = intermediateValue163 + productValue162;
                                branchMergedValue10 = sumValue111;
                                branchMergedValue15 = sumValue110;
                                branchMergedValue16 = sumValue109;
                            }
                            else
                            {
                                branchMergedValue10 = 0.33399999141693115234375f;
                                branchMergedValue15 = 0.33399999141693115234375f;
                                branchMergedValue16 = 0.33399999141693115234375f;
                            }
                            intermediateValue171 = branchMergedValue16;
                            intermediateValue172 = branchMergedValue15;
                            intermediateValue173 = branchMergedValue10;
                        }
                        else
                        {
                            precise float sumValue112 = 1.0f - intermediateValue164;
                            intermediateValue171 = sumValue112;
                            intermediateValue172 = sumValue112;
                            intermediateValue173 = sumValue112;
                        }
                        precise float productValue163 = scalarValue19 * intermediateValue171;
                        precise float productValue164 = scalarValue20 * intermediateValue172;
                        precise float productValue165 = scalarValue21 * intermediateValue173;
                        float intermediateValue96;
                        float intermediateValue97;
                        float intermediateValue98;
                        bool intermediateValue182;
                        if (!(dot(float3(productValue163, productValue164, productValue165), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                        {
                            intermediateValue182 = false;
                            intermediateValue96 = productValue163;
                            intermediateValue97 = productValue164;
                            intermediateValue98 = productValue165;
                        }
                        else
                        {
                            intermediateValue182 = true;
                            intermediateValue96 = 0.0f;
                            intermediateValue97 = 0.0f;
                            intermediateValue98 = 0.0f;
                        }
                        float branchMergedValue21;
                        float branchMergedValue24;
                        float branchMergedValue25;
                        if (intermediateValue182)
                        {
                            intermediateValue57.CommitNonOpaqueTriangleHit();
                            branchMergedValue21 = intermediateValue98;
                            branchMergedValue24 = intermediateValue97;
                            branchMergedValue25 = intermediateValue96;
                        }
                        else
                        {
                            branchMergedValue21 = intermediateValue98;
                            branchMergedValue24 = intermediateValue97;
                            branchMergedValue25 = intermediateValue96;
                        }
                        branchMergedValue = branchMergedValue21;
                        branchMergedValue3 = branchMergedValue24;
                        branchMergedValue4 = branchMergedValue25;
                    }
                    else
                    {
                        branchMergedValue = scalarValue21;
                        branchMergedValue3 = scalarValue20;
                        branchMergedValue4 = scalarValue19;
                    }
                    intermediateValue66 = branchMergedValue;
                    intermediateValue64 = branchMergedValue3;
                    intermediateValue62 = branchMergedValue4;
                    bool conditionValue2 = intermediateValue57.Proceed();
                    if (conditionValue2)
                    {
                        scalarValue19 = intermediateValue62;
                        scalarValue20 = intermediateValue64;
                        scalarValue21 = intermediateValue66;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue61 = intermediateValue62;
                intermediateValue63 = intermediateValue64;
                intermediateValue65 = intermediateValue66;
            }
            else
            {
                intermediateValue61 = exponentialValue1;
                intermediateValue63 = exponentialValue2;
                intermediateValue65 = exponentialValue3;
            }
            uint scalarValue27 = intermediateValue57.CommittedStatus();
            bool comparisonValue10 = scalarValue27 == 1u;
            float comparisonValue13 = comparisonValue10 ? 0.0f : intermediateValue61;
            float comparisonValue14 = comparisonValue10 ? 0.0f : intermediateValue63;
            float comparisonValue15 = comparisonValue10 ? 0.0f : intermediateValue65;
            float branchMergedValue9;
            float branchMergedValue13;
            float branchMergedValue14;
            if (dot(float3(comparisonValue13, comparisonValue14, comparisonValue15), 1.0f.xxx) > 0.00999999977648258209228515625f)
            {
                RayDesc _10ident = {float3(sumValue62, mad(viewCbConstants[53u].y, intermediateValue46, sumValue22), sumValue63), 0.004999999888241291046142578125f, float3(viewCbConstants[52u].xyz), 10000.0f};
                intermediateValue81.TraceRayInline(SceneBVH, 512u, 4294967199u, _10ident);
                bool conditionValue3 = intermediateValue81.Proceed();
                float intermediateValue100;
                float intermediateValue102;
                float intermediateValue104;
                if (conditionValue3)
                {
                    float intermediateValue101;
                    float intermediateValue103;
                    float intermediateValue105;
                    float scalarValue28 = comparisonValue13;
                    float scalarValue29 = comparisonValue14;
                    float scalarValue30 = comparisonValue15;
                    bool comparisonValue22;
                    for (;;)
                    {
                        uint scalarValue31 = intermediateValue81.CandidateType();
                        comparisonValue22 = scalarValue31 == 0u;
                        float branchMergedValue2;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        if (comparisonValue22)
                        {
                            float2 vectorValue4 = intermediateValue81.CandidateTriangleBarycentrics();
                            float2 vectorValue5 = intermediateValue81.CandidateTriangleBarycentrics();
                            float scalarValue32 = intermediateValue81.CandidateTriangleRayT();
                            uint scalarValue33 = intermediateValue81.CandidatePrimitiveIndex();
                            uint scalarValue34 = intermediateValue81.CandidateInstanceID();
                            uint scalarValue35 = intermediateValue81.CandidateInstanceIndex();
                            uint productValue166 = (scalarValue35 * 76u) + 58u;
                            uint productValue167 = (scalarValue35 * 76u) + 61u;
                            precise float sumValue113 = 1.0f - vectorValue4.x;
                            precise float sumValue114 = sumValue113 - vectorValue5.y;
                            uint bitwiseValue95 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue35 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue33 >> 1u);
                            uint productValue168 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue35 * 76u) + 54u) * 2 + 0)) + 0u;
                            bool comparisonValue16 = (scalarValue33 & 1u) == 0u;
                            uint comparisonValue17 = comparisonValue16 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue168), bitwiseValue95 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue168), bitwiseValue95 * 16 + 0).x;
                            uint comparisonValue18 = comparisonValue16 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue168), bitwiseValue95 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue168), bitwiseValue95 * 16 + 0).w;
                            uint comparisonValue19 = comparisonValue16 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue168), bitwiseValue95 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue168), bitwiseValue95 * 16 + 0).z;
                            bool productValue169 = rdByteLoad_objectInstances_uint16_t(0u, productValue167 * 2 + 0) < 0u;
                            float intermediateValue151;
                            float intermediateValue152;
                            if (productValue169)
                            {
                                uint bitwiseValue96 = comparisonValue19 >> 15u;
                                precise float bitwiseValue97 = float(bitwiseValue96 & 1u) * 2.0f;
                                precise float sumValue115 = bitwiseValue97 + (-1.0f);
                                precise float bitwiseValue98 = float(comparisonValue19 >> 31u) * 2.0f;
                                precise float sumValue116 = bitwiseValue98 + (-1.0f);
                                precise float bitwiseValue99 = float((comparisonValue19 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue100 = float(bitwiseValue96 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue170 = sumValue115 * 3.0517578125e-05f;
                                precise float productValue171 = sumValue116 * 3.0517578125e-05f;
                                precise float sumValue117 = bitwiseValue99 + productValue170;
                                precise float sumValue118 = bitwiseValue100 + productValue171;
                                intermediateValue151 = sumValue117;
                                intermediateValue152 = sumValue118;
                            }
                            else
                            {
                                precise float bitwiseValue101 = float(comparisonValue19 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue102 = float(comparisonValue19 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue172 = bitwiseValue101 * 16384.0f;
                                precise float sumValue119 = productValue172 + 0.5f;
                                precise float productValue173 = bitwiseValue102 * 16384.0f;
                                precise float sumValue120 = productValue173 + 0.5f;
                                precise float productValue174 = floor(sumValue119) * 6.103515625e-05f;
                                precise float productValue176 = floor(sumValue120) * 6.103515625e-05f;
                                intermediateValue151 = productValue174;
                                intermediateValue152 = productValue176;
                            }
                            precise float productValue177 = sumValue114 * intermediateValue151;
                            precise float productValue178 = sumValue114 * intermediateValue152;
                            precise float sumValue121 = productValue177 + 0.0f;
                            precise float sumValue122 = productValue178 + 0.0f;
                            float intermediateValue157;
                            float intermediateValue158;
                            if (productValue169)
                            {
                                uint bitwiseValue103 = comparisonValue18 >> 15u;
                                precise float bitwiseValue104 = float(bitwiseValue103 & 1u) * 2.0f;
                                precise float sumValue123 = bitwiseValue104 + (-1.0f);
                                precise float bitwiseValue105 = float(comparisonValue18 >> 31u) * 2.0f;
                                precise float sumValue124 = bitwiseValue105 + (-1.0f);
                                precise float bitwiseValue106 = float((comparisonValue18 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue107 = float(bitwiseValue103 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue179 = sumValue123 * 3.0517578125e-05f;
                                precise float productValue180 = sumValue124 * 3.0517578125e-05f;
                                precise float sumValue125 = bitwiseValue106 + productValue179;
                                precise float sumValue126 = bitwiseValue107 + productValue180;
                                intermediateValue157 = sumValue125;
                                intermediateValue158 = sumValue126;
                            }
                            else
                            {
                                precise float bitwiseValue108 = float(comparisonValue18 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue109 = float(comparisonValue18 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue181 = bitwiseValue108 * 16384.0f;
                                precise float sumValue127 = productValue181 + 0.5f;
                                precise float productValue182 = bitwiseValue109 * 16384.0f;
                                precise float sumValue128 = productValue182 + 0.5f;
                                precise float productValue183 = floor(sumValue127) * 6.103515625e-05f;
                                precise float productValue184 = floor(sumValue128) * 6.103515625e-05f;
                                intermediateValue157 = productValue183;
                                intermediateValue158 = productValue184;
                            }
                            precise float productValue185 = vectorValue4.x * intermediateValue157;
                            precise float productValue186 = vectorValue4.x * intermediateValue158;
                            precise float sumValue129 = sumValue121 + productValue185;
                            precise float sumValue130 = sumValue122 + productValue186;
                            float intermediateValue169;
                            float intermediateValue170;
                            if (productValue169)
                            {
                                uint bitwiseValue110 = comparisonValue17 >> 15u;
                                precise float bitwiseValue111 = float(bitwiseValue110 & 1u) * 2.0f;
                                precise float sumValue131 = bitwiseValue111 + (-1.0f);
                                precise float bitwiseValue112 = float(comparisonValue17 >> 31u) * 2.0f;
                                precise float sumValue132 = bitwiseValue112 + (-1.0f);
                                precise float bitwiseValue113 = float((comparisonValue17 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue114 = float(bitwiseValue110 & 65534u) * 1.525902189314365386962890625e-05f;
                                precise float productValue187 = sumValue131 * 3.0517578125e-05f;
                                precise float productValue188 = sumValue132 * 3.0517578125e-05f;
                                precise float sumValue133 = bitwiseValue113 + productValue187;
                                precise float sumValue134 = bitwiseValue114 + productValue188;
                                intermediateValue169 = sumValue133;
                                intermediateValue170 = sumValue134;
                            }
                            else
                            {
                                precise float bitwiseValue115 = float(comparisonValue17 & 65535u) * 1.525902189314365386962890625e-05f;
                                precise float bitwiseValue116 = float(comparisonValue17 >> 16u) * 1.525902189314365386962890625e-05f;
                                precise float productValue189 = bitwiseValue115 * 16384.0f;
                                precise float sumValue135 = productValue189 + 0.5f;
                                precise float productValue190 = bitwiseValue116 * 16384.0f;
                                precise float sumValue136 = productValue190 + 0.5f;
                                precise float productValue191 = floor(sumValue135) * 6.103515625e-05f;
                                precise float productValue192 = floor(sumValue136) * 6.103515625e-05f;
                                intermediateValue169 = productValue191;
                                intermediateValue170 = productValue192;
                            }
                            precise float productValue193 = vectorValue5.y * intermediateValue169;
                            precise float productValue194 = vectorValue5.y * intermediateValue170;
                            precise float sumValue137 = sumValue129 + productValue193;
                            precise float sumValue138 = sumValue130 + productValue194;
                            float intermediateValue174;
                            float intermediateValue175;
                            float intermediateValue176;
                            float intermediateValue177;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue166 * 2 + 0) == 65535u)
                            {
                                intermediateValue174 = 1.0f;
                                intermediateValue175 = 1.0f;
                                intermediateValue176 = 1.0f;
                                intermediateValue177 = 1.0f;
                            }
                            else
                            {
                                uint reinterpretedBits15;
                                if (rdByteLoad_objectInstances_uint16_t(0u, productValue166 * 2 + 0) > 4095u)
                                {
                                    reinterpretedBits15 = asuint(viewCbConstants[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits15 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue166 * 2 + 0));
                                }
                                float4 sampledTextureValue7 = textures[NonUniformResourceIndex(reinterpretedBits15 + 0u)].SampleLevel(defaultSampler, float2(sumValue137, sumValue138), min(mad(scalarValue32, 0.083333335816860198974609375f, -0.25f), 2.0f));
                                intermediateValue174 = sampledTextureValue7.x;
                                intermediateValue175 = sampledTextureValue7.y;
                                intermediateValue176 = sampledTextureValue7.z;
                                intermediateValue177 = sampledTextureValue7.w;
                            }
                            float intermediateValue185;
                            float intermediateValue186;
                            float intermediateValue187;
                            if (scalarValue34 == 2u)
                            {
                                float branchMergedValue12;
                                float branchMergedValue19;
                                float branchMergedValue20;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue167 * 2 + 0) & 128u) == 0u)
                                {
                                    float intermediateValue188;
                                    if ((rdByteLoad_objectInstances_uint16_t(0u, productValue167 * 2 + 0) & 2048u) == 0u)
                                    {
                                        intermediateValue188 = intermediateValue177;
                                    }
                                    else
                                    {
                                        intermediateValue188 = clamp(mad(intermediateValue177, 2.0f, -1.0f), 0.0f, 1.0f);
                                    }
                                    branchMergedValue12 = intermediateValue176 - (intermediateValue188 * intermediateValue176);
                                    branchMergedValue19 = intermediateValue175 - (intermediateValue188 * intermediateValue175);
                                    branchMergedValue20 = intermediateValue174 - (intermediateValue188 * intermediateValue174);
                                }
                                else
                                {
                                    branchMergedValue12 = 0.33399999141693115234375f;
                                    branchMergedValue19 = 0.33399999141693115234375f;
                                    branchMergedValue20 = 0.33399999141693115234375f;
                                }
                                intermediateValue185 = branchMergedValue20;
                                intermediateValue186 = branchMergedValue19;
                                intermediateValue187 = branchMergedValue12;
                            }
                            else
                            {
                                float sumValue139 = 1.0f - intermediateValue177;
                                intermediateValue185 = sumValue139;
                                intermediateValue186 = sumValue139;
                                intermediateValue187 = sumValue139;
                            }
                            float productValue195 = intermediateValue185 * scalarValue28;
                            float productValue196 = intermediateValue186 * scalarValue29;
                            float productValue197 = intermediateValue187 * scalarValue30;
                            float intermediateValue133;
                            float intermediateValue134;
                            float intermediateValue135;
                            bool intermediateValue189;
                            if (!(dot(float3(productValue195, productValue196, productValue197), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                            {
                                intermediateValue189 = false;
                                intermediateValue133 = productValue195;
                                intermediateValue134 = productValue196;
                                intermediateValue135 = productValue197;
                            }
                            else
                            {
                                intermediateValue189 = true;
                                intermediateValue133 = 0.0f;
                                intermediateValue134 = 0.0f;
                                intermediateValue135 = 0.0f;
                            }
                            float branchMergedValue23;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            if (intermediateValue189)
                            {
                                intermediateValue81.CommitNonOpaqueTriangleHit();
                                branchMergedValue23 = intermediateValue135;
                                branchMergedValue28 = intermediateValue134;
                                branchMergedValue29 = intermediateValue133;
                            }
                            else
                            {
                                branchMergedValue23 = intermediateValue135;
                                branchMergedValue28 = intermediateValue134;
                                branchMergedValue29 = intermediateValue133;
                            }
                            branchMergedValue2 = branchMergedValue23;
                            branchMergedValue7 = branchMergedValue28;
                            branchMergedValue8 = branchMergedValue29;
                        }
                        else
                        {
                            branchMergedValue2 = scalarValue30;
                            branchMergedValue7 = scalarValue29;
                            branchMergedValue8 = scalarValue28;
                        }
                        intermediateValue105 = branchMergedValue2;
                        intermediateValue103 = branchMergedValue7;
                        intermediateValue101 = branchMergedValue8;
                        bool conditionValue4 = intermediateValue81.Proceed();
                        if (conditionValue4)
                        {
                            scalarValue28 = intermediateValue101;
                            scalarValue29 = intermediateValue103;
                            scalarValue30 = intermediateValue105;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue100 = intermediateValue101;
                    intermediateValue102 = intermediateValue103;
                    intermediateValue104 = intermediateValue105;
                }
                else
                {
                    intermediateValue100 = comparisonValue13;
                    intermediateValue102 = comparisonValue14;
                    intermediateValue104 = comparisonValue15;
                }
                uint scalarValue36 = intermediateValue81.CommittedStatus();
                bool comparisonValue20 = scalarValue36 == 1u;
                branchMergedValue9 = comparisonValue20 ? 0.0f : intermediateValue104;
                branchMergedValue13 = comparisonValue20 ? 0.0f : intermediateValue102;
                branchMergedValue14 = comparisonValue20 ? 0.0f : intermediateValue100;
            }
            else
            {
                branchMergedValue9 = comparisonValue15;
                branchMergedValue13 = comparisonValue14;
                branchMergedValue14 = comparisonValue13;
            }
            intermediateValue83 = branchMergedValue14;
            intermediateValue84 = branchMergedValue13;
            intermediateValue85 = branchMergedValue9;
        }
        else
        {
            RayDesc _11ident = {float3(sumValue19, sumValue22, sumValue25), 0.004999999888241291046142578125f, float3(viewCbConstants[52u].xyz), 10000.0f};
            intermediateValue59.TraceRayInline(SceneBVH, 512u, 4294967199u, _11ident);
            bool conditionValue5 = intermediateValue59.Proceed();
            float intermediateValue68;
            float intermediateValue70;
            float intermediateValue72;
            if (conditionValue5)
            {
                float intermediateValue69;
                float intermediateValue71;
                float intermediateValue73;
                float scalarValue37 = 1.0f;
                float scalarValue38 = 1.0f;
                float scalarValue39 = 1.0f;
                bool comparisonValue12;
                for (;;)
                {
                    uint scalarValue40 = intermediateValue59.CandidateType();
                    comparisonValue12 = scalarValue40 == 0u;
                    float branchMergedValue1;
                    float branchMergedValue5;
                    float branchMergedValue6;
                    if (comparisonValue12)
                    {
                        float2 vectorValue6 = intermediateValue59.CandidateTriangleBarycentrics();
                        float2 vectorValue7 = intermediateValue59.CandidateTriangleBarycentrics();
                        float scalarValue41 = intermediateValue59.CandidateTriangleRayT();
                        uint scalarValue42 = intermediateValue59.CandidatePrimitiveIndex();
                        uint scalarValue43 = intermediateValue59.CandidateInstanceID();
                        uint scalarValue44 = intermediateValue59.CandidateInstanceIndex();
                        uint productValue198 = (scalarValue44 * 76u) + 58u;
                        uint productValue199 = (scalarValue44 * 76u) + 61u;
                        precise float sumValue140 = 1.0f - vectorValue6.x;
                        precise float sumValue141 = sumValue140 - vectorValue7.y;
                        uint bitwiseValue117 = (rdByteLoad_objectInstances_uint(0u, ((scalarValue44 * 38u) + 25u) * 4 + 0) >> 2u) + (scalarValue42 >> 1u);
                        uint productValue200 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((scalarValue44 * 76u) + 54u) * 2 + 0)) + 0u;
                        bool comparisonValue21 = (scalarValue42 & 1u) == 0u;
                        uint comparisonValue23 = comparisonValue21 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue200), bitwiseValue117 * 16 + 0).z : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue200), bitwiseValue117 * 16 + 0).x;
                        uint comparisonValue24 = comparisonValue21 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue200), bitwiseValue117 * 16 + 0).y : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue200), bitwiseValue117 * 16 + 0).w;
                        uint comparisonValue25 = comparisonValue21 ? rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue200), bitwiseValue117 * 16 + 0).x : rdByteLoad_faceUvBuffersRW_uint4(NonUniformResourceIndex(productValue200), bitwiseValue117 * 16 + 0).z;
                        bool productValue201 = rdByteLoad_objectInstances_uint16_t(0u, productValue199 * 2 + 0) < 0u;
                        float intermediateValue143;
                        float intermediateValue144;
                        if (productValue201)
                        {
                            uint bitwiseValue118 = comparisonValue25 >> 15u;
                            precise float bitwiseValue119 = float(bitwiseValue118 & 1u) * 2.0f;
                            precise float sumValue142 = bitwiseValue119 + (-1.0f);
                            precise float bitwiseValue120 = float(comparisonValue25 >> 31u) * 2.0f;
                            precise float sumValue143 = bitwiseValue120 + (-1.0f);
                            precise float bitwiseValue121 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue122 = float(bitwiseValue118 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue202 = sumValue142 * 3.0517578125e-05f;
                            precise float productValue203 = sumValue143 * 3.0517578125e-05f;
                            precise float sumValue144 = bitwiseValue121 + productValue202;
                            precise float sumValue145 = bitwiseValue122 + productValue203;
                            intermediateValue143 = sumValue144;
                            intermediateValue144 = sumValue145;
                        }
                        else
                        {
                            precise float bitwiseValue123 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue124 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue204 = bitwiseValue123 * 16384.0f;
                            precise float sumValue146 = productValue204 + 0.5f;
                            precise float productValue205 = bitwiseValue124 * 16384.0f;
                            precise float sumValue147 = productValue205 + 0.5f;
                            precise float productValue206 = floor(sumValue146) * 6.103515625e-05f;
                            precise float productValue207 = floor(sumValue147) * 6.103515625e-05f;
                            intermediateValue143 = productValue206;
                            intermediateValue144 = productValue207;
                        }
                        precise float productValue208 = sumValue141 * intermediateValue143;
                        precise float productValue209 = sumValue141 * intermediateValue144;
                        precise float sumValue148 = productValue208 + 0.0f;
                        precise float sumValue149 = productValue209 + 0.0f;
                        float intermediateValue153;
                        float intermediateValue154;
                        if (productValue201)
                        {
                            uint bitwiseValue125 = comparisonValue24 >> 15u;
                            precise float bitwiseValue126 = float(bitwiseValue125 & 1u) * 2.0f;
                            precise float sumValue150 = bitwiseValue126 + (-1.0f);
                            precise float bitwiseValue127 = float(comparisonValue24 >> 31u) * 2.0f;
                            precise float sumValue151 = bitwiseValue127 + (-1.0f);
                            precise float bitwiseValue128 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue129 = float(bitwiseValue125 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue210 = sumValue150 * 3.0517578125e-05f;
                            precise float productValue211 = sumValue151 * 3.0517578125e-05f;
                            precise float sumValue152 = bitwiseValue128 + productValue210;
                            precise float sumValue153 = bitwiseValue129 + productValue211;
                            intermediateValue153 = sumValue152;
                            intermediateValue154 = sumValue153;
                        }
                        else
                        {
                            precise float bitwiseValue130 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue131 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue212 = bitwiseValue130 * 16384.0f;
                            precise float sumValue154 = productValue212 + 0.5f;
                            precise float productValue213 = bitwiseValue131 * 16384.0f;
                            precise float sumValue155 = productValue213 + 0.5f;
                            precise float productValue214 = floor(sumValue154) * 6.103515625e-05f;
                            precise float productValue215 = floor(sumValue155) * 6.103515625e-05f;
                            intermediateValue153 = productValue214;
                            intermediateValue154 = productValue215;
                        }
                        precise float productValue216 = vectorValue6.x * intermediateValue153;
                        precise float productValue217 = vectorValue6.x * intermediateValue154;
                        precise float sumValue156 = sumValue148 + productValue216;
                        precise float sumValue157 = sumValue149 + productValue217;
                        float intermediateValue159;
                        float intermediateValue160;
                        if (productValue201)
                        {
                            uint bitwiseValue132 = comparisonValue23 >> 15u;
                            precise float bitwiseValue133 = float(bitwiseValue132 & 1u) * 2.0f;
                            precise float sumValue158 = bitwiseValue133 + (-1.0f);
                            precise float bitwiseValue134 = float(comparisonValue23 >> 31u) * 2.0f;
                            precise float sumValue159 = bitwiseValue134 + (-1.0f);
                            precise float bitwiseValue135 = float((comparisonValue23 << 1u) & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue136 = float(bitwiseValue132 & 65534u) * 1.525902189314365386962890625e-05f;
                            precise float productValue218 = sumValue158 * 3.0517578125e-05f;
                            precise float productValue219 = sumValue159 * 3.0517578125e-05f;
                            precise float sumValue160 = bitwiseValue135 + productValue218;
                            precise float sumValue161 = bitwiseValue136 + productValue219;
                            intermediateValue159 = sumValue160;
                            intermediateValue160 = sumValue161;
                        }
                        else
                        {
                            precise float bitwiseValue137 = float(comparisonValue23 & 65535u) * 1.525902189314365386962890625e-05f;
                            precise float bitwiseValue138 = float(comparisonValue23 >> 16u) * 1.525902189314365386962890625e-05f;
                            precise float productValue220 = bitwiseValue137 * 16384.0f;
                            precise float sumValue162 = productValue220 + 0.5f;
                            precise float productValue221 = bitwiseValue138 * 16384.0f;
                            precise float sumValue163 = productValue221 + 0.5f;
                            precise float productValue222 = floor(sumValue162) * 6.103515625e-05f;
                            precise float productValue223 = floor(sumValue163) * 6.103515625e-05f;
                            intermediateValue159 = productValue222;
                            intermediateValue160 = productValue223;
                        }
                        precise float productValue224 = vectorValue7.y * intermediateValue159;
                        precise float productValue225 = vectorValue7.y * intermediateValue160;
                        precise float sumValue164 = sumValue156 + productValue224;
                        precise float sumValue165 = sumValue157 + productValue225;
                        float intermediateValue165;
                        float intermediateValue166;
                        float intermediateValue167;
                        float intermediateValue168;
                        if (rdByteLoad_objectInstances_uint16_t(0u, productValue198 * 2 + 0) == 65535u)
                        {
                            intermediateValue165 = 1.0f;
                            intermediateValue166 = 1.0f;
                            intermediateValue167 = 1.0f;
                            intermediateValue168 = 1.0f;
                        }
                        else
                        {
                            uint reinterpretedBits14;
                            if (rdByteLoad_objectInstances_uint16_t(0u, productValue198 * 2 + 0) > 4095u)
                            {
                                reinterpretedBits14 = asuint(viewCbConstants[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits14 = uint(rdByteLoad_objectInstances_uint16_t(0u, productValue198 * 2 + 0));
                            }
                            float4 sampledTextureValue8 = textures[NonUniformResourceIndex(reinterpretedBits14 + 0u)].SampleLevel(defaultSampler, float2(sumValue164, sumValue165), min(mad(scalarValue41, 0.083333335816860198974609375f, -0.25f), 2.0f));
                            intermediateValue165 = sampledTextureValue8.x;
                            intermediateValue166 = sampledTextureValue8.y;
                            intermediateValue167 = sampledTextureValue8.z;
                            intermediateValue168 = sampledTextureValue8.w;
                        }
                        float intermediateValue178;
                        float intermediateValue179;
                        float intermediateValue180;
                        if (scalarValue43 == 2u)
                        {
                            float branchMergedValue11;
                            float branchMergedValue17;
                            float branchMergedValue18;
                            if ((rdByteLoad_objectInstances_uint16_t(0u, productValue199 * 2 + 0) & 128u) == 0u)
                            {
                                float intermediateValue183;
                                if ((rdByteLoad_objectInstances_uint16_t(0u, productValue199 * 2 + 0) & 2048u) == 0u)
                                {
                                    intermediateValue183 = intermediateValue168;
                                }
                                else
                                {
                                    intermediateValue183 = clamp(mad(intermediateValue168, 2.0f, -1.0f), 0.0f, 1.0f);
                                }
                                branchMergedValue11 = intermediateValue167 - (intermediateValue183 * intermediateValue167);
                                branchMergedValue17 = intermediateValue166 - (intermediateValue183 * intermediateValue166);
                                branchMergedValue18 = intermediateValue165 - (intermediateValue183 * intermediateValue165);
                            }
                            else
                            {
                                branchMergedValue11 = 0.33399999141693115234375f;
                                branchMergedValue17 = 0.33399999141693115234375f;
                                branchMergedValue18 = 0.33399999141693115234375f;
                            }
                            intermediateValue178 = branchMergedValue18;
                            intermediateValue179 = branchMergedValue17;
                            intermediateValue180 = branchMergedValue11;
                        }
                        else
                        {
                            float sumValue166 = 1.0f - intermediateValue168;
                            intermediateValue178 = sumValue166;
                            intermediateValue179 = sumValue166;
                            intermediateValue180 = sumValue166;
                        }
                        float productValue226 = intermediateValue178 * scalarValue37;
                        float productValue227 = intermediateValue179 * scalarValue38;
                        float productValue228 = intermediateValue180 * scalarValue39;
                        float intermediateValue113;
                        float intermediateValue114;
                        float intermediateValue115;
                        bool intermediateValue184;
                        if (!(dot(float3(productValue226, productValue227, productValue228), 1.0f.xxx) <= 0.00999999977648258209228515625f))
                        {
                            intermediateValue184 = false;
                            intermediateValue113 = productValue226;
                            intermediateValue114 = productValue227;
                            intermediateValue115 = productValue228;
                        }
                        else
                        {
                            intermediateValue184 = true;
                            intermediateValue113 = 0.0f;
                            intermediateValue114 = 0.0f;
                            intermediateValue115 = 0.0f;
                        }
                        float branchMergedValue22;
                        float branchMergedValue26;
                        float branchMergedValue27;
                        if (intermediateValue184)
                        {
                            intermediateValue59.CommitNonOpaqueTriangleHit();
                            branchMergedValue22 = intermediateValue115;
                            branchMergedValue26 = intermediateValue114;
                            branchMergedValue27 = intermediateValue113;
                        }
                        else
                        {
                            branchMergedValue22 = intermediateValue115;
                            branchMergedValue26 = intermediateValue114;
                            branchMergedValue27 = intermediateValue113;
                        }
                        branchMergedValue1 = branchMergedValue22;
                        branchMergedValue5 = branchMergedValue26;
                        branchMergedValue6 = branchMergedValue27;
                    }
                    else
                    {
                        branchMergedValue1 = scalarValue39;
                        branchMergedValue5 = scalarValue38;
                        branchMergedValue6 = scalarValue37;
                    }
                    intermediateValue73 = branchMergedValue1;
                    intermediateValue71 = branchMergedValue5;
                    intermediateValue69 = branchMergedValue6;
                    bool conditionValue6 = intermediateValue59.Proceed();
                    if (conditionValue6)
                    {
                        scalarValue37 = intermediateValue69;
                        scalarValue38 = intermediateValue71;
                        scalarValue39 = intermediateValue73;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue68 = intermediateValue69;
                intermediateValue70 = intermediateValue71;
                intermediateValue72 = intermediateValue73;
            }
            else
            {
                intermediateValue68 = 1.0f;
                intermediateValue70 = 1.0f;
                intermediateValue72 = 1.0f;
            }
            uint scalarValue45 = intermediateValue59.CommittedStatus();
            bool comparisonValue26 = scalarValue45 == 1u;
            intermediateValue83 = comparisonValue26 ? 0.0f : intermediateValue68;
            intermediateValue84 = comparisonValue26 ? 0.0f : intermediateValue70;
            intermediateValue85 = comparisonValue26 ? 0.0f : intermediateValue72;
        }
        float dotProductValue1 = dot(float3(productValue48, productValue49, productValue50), float3(viewCbConstants[52u].xyz));
        float dotProductValue2 = dotProductValue1 * dot(float3(intermediateValue83, intermediateValue84, intermediateValue85), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        float productValue117;
        float productValue118;
        float productValue119;
        if (dotProductValue2 > 0.0f)
        {
            float sumValue167 = viewCbConstants[52u].x + productValue48;
            float sumValue168 = viewCbConstants[52u].y + productValue49;
            float sumValue169 = viewCbConstants[52u].z + productValue50;
            float inverseLengthValue1 = rsqrt(dot(float3(sumValue167, sumValue168, sumValue169), float3(sumValue167, sumValue168, sumValue169)));
            float clampedValue = clamp(dotProductValue1, 0.0f, 1.0f);
            float clampedValue1 = clamp(dot(float3(productValue48, productValue49, productValue50), float3(productValue48, productValue49, productValue50)), 0.0f, 1.0f);
            float clampedValue2 = clamp(dot(float3(productValue48, productValue49, productValue50), float3(inverseLengthValue1 * sumValue167, inverseLengthValue1 * sumValue168, inverseLengthValue1 * sumValue169)), 0.0f, 1.0f);
            float clampedValue3 = clamp(dot(float3(productValue65, productValue66, productValue67), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
            float clampedValue4 = exp2(log2(clamp(1.0f - clampedValue2, 0.0f, 1.0f)) * 5.0f);
            float productValue229 = (clampedValue4 * (clampedValue3 - productValue65)) + productValue65;
            float productValue230 = (clampedValue4 * (clampedValue3 - productValue66)) + productValue66;
            float productValue231 = (clampedValue4 * (clampedValue3 - productValue67)) + productValue67;
            float productValue232 = ((clampedValue2 * clampedValue2) * 2.0f) + (-0.5f);
            float clampedValue5 = (((exp2(log2(clamp(1.0f - clampedValue1, 0.0f, 1.0f)) * 5.0f) * productValue232) + 1.0f) * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue, 0.0f, 1.0f)) * 5.0f) * productValue232) + 1.0f);
            float quotientValue = 0.079577468335628509521484375f / ((((clampedValue1 * 0.5f) + 0.5f) * ((clampedValue * 0.5f) + 0.5f)) + 1.0000000133514319600180897396058e-10f);
            productValue117 = ((viewCbConstants[50u].x * intermediateValue83) * clampedValue) * ((((1.0f - productValue229) * productValue68) * clampedValue5) + (productValue229 * quotientValue));
            productValue118 = ((viewCbConstants[50u].y * intermediateValue84) * clampedValue) * ((((1.0f - productValue230) * productValue69) * clampedValue5) + (productValue230 * quotientValue));
            productValue119 = ((viewCbConstants[50u].z * intermediateValue85) * clampedValue) * ((((1.0f - productValue231) * productValue70) * clampedValue5) + (productValue231 * quotientValue));
        }
        else
        {
            productValue117 = 0.0f;
            productValue118 = 0.0f;
            productValue119 = 0.0f;
        }
        float productValue137;
        float productValue138;
        float productValue139;
        if (dotProductValue2 < (-0.0f))
        {
            float sumValue170 = (-0.0f) - productValue48;
            float sumValue171 = (-0.0f) - productValue49;
            float sumValue172 = (-0.0f) - productValue50;
            float sumValue173 = viewCbConstants[52u].x + productValue48;
            float sumValue174 = viewCbConstants[52u].y + productValue49;
            float sumValue175 = viewCbConstants[52u].z + productValue50;
            float inverseLengthValue2 = rsqrt(dot(float3(sumValue173, sumValue174, sumValue175), float3(sumValue173, sumValue174, sumValue175)));
            float clampedValue6 = clamp(dot(float3(sumValue170, sumValue171, sumValue172), float3(viewCbConstants[52u].xyz)), 0.0f, 1.0f);
            float clampedValue7 = clamp(dot(float3(sumValue170, sumValue171, sumValue172), float3(productValue48, productValue49, productValue50)), 0.0f, 1.0f);
            float clampedValue8 = clamp(dot(float3(productValue48, productValue49, productValue50), float3(inverseLengthValue2 * sumValue173, inverseLengthValue2 * sumValue174, inverseLengthValue2 * sumValue175)), 0.0f, 1.0f);
            float clampedValue9 = clamp(dot(float3(productValue65, productValue66, productValue67), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
            float clampedValue10 = exp2(log2(clamp(1.0f - clampedValue8, 0.0f, 1.0f)) * 5.0f);
            float productValue233 = (clampedValue10 * (clampedValue9 - productValue65)) + productValue65;
            float productValue234 = (clampedValue10 * (clampedValue9 - productValue66)) + productValue66;
            float productValue235 = (clampedValue10 * (clampedValue9 - productValue67)) + productValue67;
            float productValue236 = ((clampedValue8 * clampedValue8) * 2.0f) + (-0.5f);
            float clampedValue11 = (((exp2(log2(clamp(1.0f - clampedValue7, 0.0f, 1.0f)) * 5.0f) * productValue236) + 1.0f) * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue6, 0.0f, 1.0f)) * 5.0f) * productValue236) + 1.0f);
            float quotientValue1 = 0.079577468335628509521484375f / ((((clampedValue7 * 0.5f) + 0.5f) * ((clampedValue6 * 0.5f) + 0.5f)) + 1.0000000133514319600180897396058e-10f);
            productValue137 = ((viewCbConstants[50u].x * intermediateValue83) * clampedValue6) * ((((1.0f - productValue233) * productValue68) * clampedValue11) + (productValue233 * quotientValue1));
            productValue138 = ((viewCbConstants[50u].y * intermediateValue84) * clampedValue6) * ((((1.0f - productValue234) * productValue69) * clampedValue11) + (productValue234 * quotientValue1));
            productValue139 = ((viewCbConstants[50u].z * intermediateValue85) * clampedValue6) * ((((1.0f - productValue235) * productValue70) * clampedValue11) + (productValue235 * quotientValue1));
        }
        else
        {
            productValue137 = 0.0f;
            productValue138 = 0.0f;
            productValue139 = 0.0f;
        }
        float productValue237 = viewCbConstants[85u].y * productValue62;
        float productValue238 = viewCbConstants[85u].y * productValue63;
        float productValue239 = viewCbConstants[85u].y * productValue64;
        float productValue240 = (productValue117 + (productValue68 * intermediateValue14)) + productValue237;
        float productValue241 = (productValue118 + (productValue69 * intermediateValue15)) + productValue238;
        float productValue242 = (productValue119 + (productValue70 * intermediateValue16)) + productValue239;
        float productValue243 = (productValue137 + (productValue68 * intermediateValue17)) + productValue237;
        float productValue244 = (productValue138 + (productValue69 * intermediateValue18)) + productValue238;
        float productValue245 = (productValue139 + (productValue70 * intermediateValue19)) + productValue239;
        uint productValue246 = uint(rdByteLoad_objectInstances_uint16_t(0u, ((bitwiseValue2 * 76u) + 54u) * 2 + 0)) + 0u;
        uint productValue247 = (bitwiseValue3 * 8u) + 4u;
        if (!((((asuint(productValue242) & 2147483647u) > 2139095040u) || (((asuint(productValue240) & 2147483647u) > 2139095040u) || ((asuint(productValue241) & 2147483647u) > 2139095040u))) || (((asuint(productValue245) & 2147483647u) > 2139095040u) || (((asuint(productValue243) & 2147483647u) > 2139095040u) || ((asuint(productValue244) & 2147483647u) > 2139095040u)))))
        {
            uint16_t4 productValue248 = rdByteLoad_faceIrradianceCache_uint16_t4(NonUniformResourceIndex(productValue246), (bitwiseValue3 * 2u) * 8 + 0);
            half4 vectorValue8 = (half4)f16tof32(productValue248);
            uint16_t productValue249 = rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue246), productValue247 * 2 + 0);
            uint16_t productValue250 = rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue246), (productValue247 + 1u) * 2 + 0);
            uint16_t productValue251 = rdByteLoad_faceIrradianceCache_uint16_t(NonUniformResourceIndex(productValue246), (productValue247 + 2u) * 2 + 0);
            half3 vectorValue9 = (half3)f16tof32(uint16_t3(productValue249, productValue250, productValue251));
            float sumValue176 = float(min((uint(vectorValue8.w) + 1u), 4u));
            float quotientValue2 = 1.0f / sumValue176;
            float scalarValue46 = float(vectorValue8.x);
            float scalarValue47 = float(vectorValue8.y);
            float scalarValue48 = float(vectorValue8.z);
            float scalarValue49 = float(vectorValue9.x);
            float scalarValue50 = float(vectorValue9.y);
            float scalarValue51 = float(vectorValue9.z);
            rdByteStore_faceIrradianceCache_uint16_t4(NonUniformResourceIndex(productValue246), (bitwiseValue3 * 2u) * 8 + 0, uint16_t4((uint16_t)f32tof16(half((quotientValue2 * (productValue240 - scalarValue46)) + scalarValue46)), (uint16_t)f32tof16(half((quotientValue2 * (productValue241 - scalarValue47)) + scalarValue47)), (uint16_t)f32tof16(half((quotientValue2 * (productValue242 - scalarValue48)) + scalarValue48)), (uint16_t)f32tof16(half(uint(sumValue176)))));
            rdByteStore_faceIrradianceCache_uint16_t4(NonUniformResourceIndex(productValue246), ((bitwiseValue3 * 2u) + 1u) * 8 + 0, uint16_t4((uint16_t)f32tof16(half((quotientValue2 * (productValue243 - scalarValue49)) + scalarValue49)), (uint16_t)f32tof16(half((quotientValue2 * (productValue244 - scalarValue50)) + scalarValue50)), (uint16_t)f32tof16(half((quotientValue2 * (productValue245 - scalarValue51)) + scalarValue51)), (uint16_t)f32tof16(half(0.0))));
        }
    }
}
[numthreads(32, 1, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
