#version 460
#extension GL_GOOGLE_include_directive : require
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

#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
#extension GL_EXT_shader_16bit_storage : require
#if defined(GL_AMD_gpu_shader_half_float)
#extension GL_AMD_gpu_shader_half_float : require
#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
#else
#error No extension available for FP16.
#endif
#extension GL_EXT_ray_query : require
#extension GL_EXT_ray_flags_primitive_culling : require
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uint bitwiseValue = gl_GlobalInvocationID.x >> 4u;
    uint productValue = bitwiseValue * 2u;
    uint bitwiseValue1 = gl_GlobalInvocationID.x & 15u;
    uint bitwiseValue2 = faceIrradianceCacheUpdateChunks.packedValues[productValue] & 65535u;
    if (bitwiseValue1 < (faceIrradianceCacheUpdateChunks.packedValues[productValue] >> 16u))
    {
        uint productValue1 = (bitwiseValue2 * 76u) + 58u;
        uint productValue2 = (bitwiseValue2 * 76u) + 59u;
        uint productValue3 = (bitwiseValue2 * 76u) + 61u;
        uint productValue4 = (bitwiseValue2 * 38u) + 32u;
        uint productValue5 = faceIrradianceCacheUpdateChunks.packedValues[(bitwiseValue * 2u) + 1u] + bitwiseValue1;
        uint bitwiseValue3 = (objectInstances_2.packedValues[(bitwiseValue2 * 38u) + 25u] >> 2u) + productValue5;
        uint bitwiseValue4 = bitwiseValue3 ^ (gl_GlobalInvocationID.x << 6u);
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
        reinterpretedBits = (((bitwiseValue13 << 1u) | bitwiseValue13) & 1431655765u) + floatBitsToUint(ViewCB.packedValues[84u]).z;
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
        precise float bitwiseValue16 = float(productValue6 & 16777215u) * 5.9604644775390625e-08;
        uint productValue7 = (productValue6 * 1664525u) + 1013904223u;
        precise float bitwiseValue17 = float(productValue7 & 16777215u) * 5.9604644775390625e-08;
        float nonlinearValue = sqrt(bitwiseValue16);
        precise float sumValue2 = 1.0 - nonlinearValue;
        precise float sumValue3 = 1.0 - bitwiseValue17;
        precise float productValue8 = sumValue3 * nonlinearValue;
        uint bitwiseValue18 = faceIrradianceCacheUpdateChunks.packedValues[productValue] & 16383u;
        uint productValue9 = bitwiseValue18 * 38u;
        vec4 reinterpretedBits1 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue9], objectInstances_2.packedValues[productValue9 + 1u], objectInstances_2.packedValues[productValue9 + 2u], objectInstances_2.packedValues[productValue9 + 3u]));
        float scalarValue = reinterpretedBits1.x;
        float scalarValue1 = reinterpretedBits1.y;
        float scalarValue2 = reinterpretedBits1.z;
        uint productValue10 = (bitwiseValue18 * 38u) + 4u;
        vec4 reinterpretedBits2 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue10], objectInstances_2.packedValues[productValue10 + 1u], objectInstances_2.packedValues[productValue10 + 2u], objectInstances_2.packedValues[productValue10 + 3u]));
        float scalarValue3 = reinterpretedBits2.x;
        float scalarValue4 = reinterpretedBits2.y;
        float scalarValue5 = reinterpretedBits2.z;
        uint productValue11 = (bitwiseValue18 * 38u) + 8u;
        vec4 reinterpretedBits3 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue11], objectInstances_2.packedValues[productValue11 + 1u], objectInstances_2.packedValues[productValue11 + 2u], objectInstances_2.packedValues[productValue11 + 3u]));
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
        uint productValue16 = uint(objectInstances.packedValues[(bitwiseValue18 * 76u) + 54u]);
        uint sumValue4 = productValue16 + 0u;
        uint bitwiseValue22 = ((objectInstances_2.packedValues[productValue13] >> 2u) + (productValue5 & 32767u)) * 4u;
        float multiplyAddValue = fma(float(faceDataBuffersRW[nonuniformEXT(sumValue4)].packedValues[bitwiseValue22] & 1023u), 0.00195503421127796173095703125, -1.0);
        float multiplyAddValue1 = fma(float((faceDataBuffersRW[nonuniformEXT(sumValue4)].packedValues[bitwiseValue22] >> 10u) & 1023u), 0.00195503421127796173095703125, -1.0);
        float multiplyAddValue2 = fma(float((faceDataBuffersRW[nonuniformEXT(sumValue4)].packedValues[bitwiseValue22] >> 20u) & 1023u), 0.00195503421127796173095703125, -1.0);
        precise float sumValue5 = 1.0 - sumValue2;
        precise float sumValue6 = sumValue5 - productValue8;
        float intermediateValue1[3];
        intermediateValue1[0u] = sumValue6;
        intermediateValue1[1u] = sumValue2;
        intermediateValue1[2u] = productValue8;
        uint sumValue7 = productValue16 + 0u;
        uint productValue17 = uint(objectInstances.packedValues[(bitwiseValue18 * 76u) + 56u]);
        uint productValue18 = productValue17 * (objectInstances_2.packedValues[productValue12] + bitwiseValue19);
        uint bitwiseValue23 = uint(objectInstances.packedValues[(bitwiseValue18 * 76u) + 71u] & 255us);
        uint bitwiseValue24 = (bitwiseValue23 + productValue18) >> 1u;
        f16vec3 sumValue8 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue7)].packedValues[bitwiseValue24], vertexBuffers[nonuniformEXT(sumValue7)].packedValues[bitwiseValue24 + 1u], vertexBuffers[nonuniformEXT(sumValue7)].packedValues[bitwiseValue24 + 2u]));
        uint bitwiseValue25 = uint(objectInstances.packedValues[productValue15] & 255us);
        uint bitwiseValue26 = (bitwiseValue25 + productValue18) >> 2u;
        uint bitwiseValue27 = uint(objectInstances.packedValues[productValue15] >> 8us);
        uint bitwiseValue28 = (bitwiseValue27 + productValue18) >> 2u;
        bool conditionValue = int16_t(objectInstances.packedValues[productValue14]) < int16_t(0us);
        float bitwiseValue30;
        float bitwiseValue31;
        if (conditionValue)
        {
            uint bitwiseValue29 = vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue28] >> 15u;
            bitwiseValue30 = ((float(bitwiseValue29 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue28] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
            bitwiseValue31 = ((float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue28] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue29 & 65534u) * 1.525902189314365386962890625e-05);
        }
        else
        {
            bitwiseValue30 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue28] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
            bitwiseValue31 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue28] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
        }
        uint intermediateValue14;
        if ((objectInstances.packedValues[productValue14] & 256us) == 0us)
        {
            intermediateValue14 = 0u;
        }
        else
        {
            intermediateValue14 = vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[(uint(objectInstances.packedValues[(bitwiseValue18 * 76u) + 74u] >> 8us) + productValue18) >> 2u] & 65535u;
        }
        precise float productValue19 = sumValue6 * float(sumValue8.x);
        precise float productValue20 = sumValue6 * float(sumValue8.y);
        precise float productValue21 = sumValue6 * float(sumValue8.z);
        precise float sumValue9 = productValue19 + 0.0;
        precise float sumValue10 = productValue20 + 0.0;
        precise float sumValue11 = productValue21 + 0.0;
        uint productValue22 = productValue17 * (objectInstances_2.packedValues[productValue12] + bitwiseValue20);
        uint bitwiseValue32 = (bitwiseValue23 + productValue22) >> 1u;
        f16vec3 sumValue12 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue7)].packedValues[bitwiseValue32], vertexBuffers[nonuniformEXT(sumValue7)].packedValues[bitwiseValue32 + 1u], vertexBuffers[nonuniformEXT(sumValue7)].packedValues[bitwiseValue32 + 2u]));
        uint bitwiseValue33 = (bitwiseValue25 + productValue22) >> 2u;
        uint bitwiseValue34 = (bitwiseValue27 + productValue22) >> 2u;
        float bitwiseValue36;
        float bitwiseValue37;
        if (conditionValue)
        {
            uint bitwiseValue35 = vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue34] >> 15u;
            bitwiseValue36 = ((float(bitwiseValue35 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue34] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
            bitwiseValue37 = ((float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue34] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue35 & 65534u) * 1.525902189314365386962890625e-05);
        }
        else
        {
            bitwiseValue36 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue34] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
            bitwiseValue37 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue34] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
        }
        precise float productValue23 = sumValue2 * float(sumValue12.x);
        precise float productValue24 = sumValue2 * float(sumValue12.y);
        precise float productValue25 = sumValue2 * float(sumValue12.z);
        precise float sumValue13 = sumValue9 + productValue23;
        precise float sumValue14 = sumValue10 + productValue24;
        precise float sumValue15 = sumValue11 + productValue25;
        uint productValue26 = productValue17 * (objectInstances_2.packedValues[productValue12] + bitwiseValue21);
        uint bitwiseValue38 = (bitwiseValue23 + productValue26) >> 1u;
        f16vec3 sumValue16 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue7)].packedValues[bitwiseValue38], vertexBuffers[nonuniformEXT(sumValue7)].packedValues[bitwiseValue38 + 1u], vertexBuffers[nonuniformEXT(sumValue7)].packedValues[bitwiseValue38 + 2u]));
        uint bitwiseValue39 = (bitwiseValue25 + productValue26) >> 2u;
        uint bitwiseValue40 = (bitwiseValue27 + productValue26) >> 2u;
        float bitwiseValue42;
        float bitwiseValue43;
        if (conditionValue)
        {
            uint bitwiseValue41 = vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue40] >> 15u;
            bitwiseValue42 = ((float(bitwiseValue41 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue40] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
            bitwiseValue43 = ((float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue40] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue41 & 65534u) * 1.525902189314365386962890625e-05);
        }
        else
        {
            bitwiseValue42 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue40] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
            bitwiseValue43 = floor(fma(float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue40] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
        }
        precise float productValue27 = productValue8 * float(sumValue16.x);
        precise float productValue28 = productValue8 * float(sumValue16.y);
        precise float productValue29 = productValue8 * float(sumValue16.z);
        precise float sumValue17 = sumValue13 + productValue27;
        precise float sumValue18 = sumValue14 + productValue28;
        precise float sumValue19 = sumValue15 + productValue29;
        float productValue30 = ((bitwiseValue36 * sumValue2) + (bitwiseValue30 * sumValue6)) + (bitwiseValue42 * productValue8);
        float productValue31 = ((bitwiseValue37 * sumValue2) + (bitwiseValue31 * sumValue6)) + (bitwiseValue43 * productValue8);
        float bitwiseValue44 = (((float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue33] & 255u) * sumValue2) + (float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue26] & 255u) * sumValue6)) + (float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue39] & 255u) * productValue8)) * 0.0039215688593685626983642578125;
        float bitwiseValue45 = (((float((vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue33] >> 8u) & 255u) * sumValue2) + (float((vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue26] >> 8u) & 255u) * sumValue6)) + (float((vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue39] >> 8u) & 255u) * productValue8)) * 0.0039215688593685626983642578125;
        float bitwiseValue46 = (((float((vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue33] >> 16u) & 255u) * sumValue2) + (float((vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue26] >> 16u) & 255u) * sumValue6)) + (float((vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue39] >> 16u) & 255u) * productValue8)) * 0.0039215688593685626983642578125;
        float bitwiseValue47 = (((float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue33] >> 24u) * sumValue2) + (float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue26] >> 24u) * sumValue6)) + (float(vertexBuffers_2[nonuniformEXT(sumValue7)].packedValues[bitwiseValue39] >> 24u) * productValue8)) * 0.0039215688593685626983642578125;
        precise float productValue32 = scalarValue * sumValue17;
        precise float productValue33 = sumValue18 * scalarValue1;
        precise float sumValue20 = productValue33 + productValue32;
        precise float productValue34 = sumValue19 * scalarValue2;
        precise float sumValue21 = productValue34 + sumValue20;
        precise float productValue35 = 1.0 * reinterpretedBits1.w;
        precise float sumValue22 = productValue35 + sumValue21;
        precise float productValue36 = scalarValue3 * sumValue17;
        precise float productValue37 = sumValue18 * scalarValue4;
        precise float sumValue23 = productValue37 + productValue36;
        precise float productValue38 = sumValue19 * scalarValue5;
        precise float sumValue24 = productValue38 + sumValue23;
        precise float productValue39 = 1.0 * reinterpretedBits2.w;
        precise float sumValue25 = productValue39 + sumValue24;
        precise float productValue40 = scalarValue6 * sumValue17;
        precise float productValue41 = sumValue18 * scalarValue7;
        precise float sumValue26 = productValue41 + productValue40;
        precise float productValue42 = sumValue19 * scalarValue8;
        precise float sumValue27 = productValue42 + sumValue26;
        precise float productValue43 = 1.0 * reinterpretedBits3.w;
        precise float sumValue28 = productValue43 + sumValue27;
        float multiplyAddValue3 = fma(multiplyAddValue2, scalarValue2, fma(multiplyAddValue1, scalarValue1, multiplyAddValue * scalarValue));
        float multiplyAddValue4 = fma(multiplyAddValue2, scalarValue5, fma(multiplyAddValue1, scalarValue4, multiplyAddValue * scalarValue3));
        float multiplyAddValue5 = fma(multiplyAddValue2, scalarValue8, fma(multiplyAddValue1, scalarValue7, multiplyAddValue * scalarValue6));
        float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5), vec3(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5)));
        float productValue44 = inverseLengthValue * multiplyAddValue3;
        float productValue45 = inverseLengthValue * multiplyAddValue4;
        float productValue46 = inverseLengthValue * multiplyAddValue5;
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if (((objectInstances.packedValues[productValue14] & 1us) != 0us) && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u))
        {
            uint sumValue29 = productValue16 + 0u;
            float intermediateValue21;
            uint intermediateValue22;
            float intermediateValue23;
            float intermediateValue24;
            float intermediateValue25;
            float intermediateValue26;
            float intermediateValue27;
            float intermediateValue28;
            uint intermediateValue29;
            intermediateValue21 = sumValue6;
            intermediateValue22 = bitwiseValue19;
            intermediateValue23 = 0.0;
            intermediateValue24 = 0.0;
            intermediateValue25 = 0.0;
            intermediateValue26 = 0.0;
            intermediateValue27 = 0.0;
            intermediateValue28 = 0.0;
            intermediateValue29 = 0u;
            float sumValue30;
            float sumValue31;
            float sumValue32;
            float sumValue33;
            float sumValue34;
            float sumValue35;
            uint sumValue36;
            for (;;)
            {
                uint sumValue37 = intermediateValue22 + objectInstances_2.packedValues[productValue13];
                uint productValue47 = sumValue37 * 8u;
                f16vec3 sumValue38 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue29)].packedValues[productValue47], vertexIrradianceCache[nonuniformEXT(sumValue29)].packedValues[productValue47 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue29)].packedValues[productValue47 + 2u]));
                uint productValue48 = (sumValue37 * 8u) + 4u;
                f16vec3 sumValue39 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue29)].packedValues[productValue48], vertexIrradianceCache[nonuniformEXT(sumValue29)].packedValues[productValue48 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue29)].packedValues[productValue48 + 2u]));
                float productValue49 = float(sumValue38.x) * intermediateValue21;
                float productValue50 = float(sumValue38.y) * intermediateValue21;
                float productValue51 = float(sumValue38.z) * intermediateValue21;
                sumValue30 = productValue49 + intermediateValue23;
                sumValue31 = productValue50 + intermediateValue24;
                sumValue32 = productValue51 + intermediateValue25;
                float productValue52 = float(sumValue39.x) * intermediateValue21;
                float productValue53 = float(sumValue39.y) * intermediateValue21;
                float productValue54 = float(sumValue39.z) * intermediateValue21;
                sumValue33 = productValue52 + intermediateValue26;
                sumValue34 = productValue53 + intermediateValue27;
                sumValue35 = productValue54 + intermediateValue28;
                sumValue36 = intermediateValue29 + 1u;
                if (sumValue36 == 3u)
                {
                    break;
                }
                else
                {
                    intermediateValue21 = intermediateValue1[sumValue36];
                    intermediateValue22 = intermediateValue[sumValue36];
                    intermediateValue23 = sumValue30;
                    intermediateValue24 = sumValue31;
                    intermediateValue25 = sumValue32;
                    intermediateValue26 = sumValue33;
                    intermediateValue27 = sumValue34;
                    intermediateValue28 = sumValue35;
                    intermediateValue29 = sumValue36;
                    continue;
                }
            }
            intermediateValue15 = sumValue30;
            intermediateValue16 = sumValue31;
            intermediateValue17 = sumValue32;
            intermediateValue18 = sumValue33;
            intermediateValue19 = sumValue34;
            intermediateValue20 = sumValue35;
        }
        else
        {
            intermediateValue15 = 0.0;
            intermediateValue16 = 0.0;
            intermediateValue17 = 0.0;
            intermediateValue18 = 0.0;
            intermediateValue19 = 0.0;
            intermediateValue20 = 0.0;
        }
        vec2 reinterpretedBits4 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[intermediateValue14 * 8u]);
        vec2 reinterpretedBits5 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue14 * 8u) + 1u]);
        float reinterpretedBits6 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue14 * 16u) + 13u]);
        float reinterpretedBits7 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue14 * 16u) + 14u]);
        uint reinterpretedBits8;
        if (objectInstances.packedValues[productValue1] > 4095us)
        {
            reinterpretedBits8 = floatBitsToUint(ViewCB.packedValues[98u]).w;
        }
        else
        {
            reinterpretedBits8 = uint(objectInstances.packedValues[productValue1]);
        }
        uint sumValue40 = reinterpretedBits8 + 0u;
        float intermediateValue30;
        float intermediateValue31;
        float intermediateValue32;
        float intermediateValue33;
        if (objectInstances.packedValues[productValue1] == 65535us)
        {
            intermediateValue30 = 1.0;
            intermediateValue31 = 1.0;
            intermediateValue32 = 1.0;
            intermediateValue33 = 1.0;
        }
        else
        {
            vec4 sampledTextureValue = textureLod(nonuniformEXT(sampler2D(textures[sumValue40], defaultSampler)), vec2(productValue30, productValue31), spvNMin(100.0, reinterpretedBits6));
            intermediateValue30 = sampledTextureValue.x;
            intermediateValue31 = sampledTextureValue.y;
            intermediateValue32 = sampledTextureValue.z;
            intermediateValue33 = sampledTextureValue.w;
        }
        float productValue55;
        float productValue56;
        float productValue57;
        float productValue58;
        float productValue59;
        float productValue60;
        float productValue61;
        float productValue62;
        float productValue63;
        if ((objectInstances.packedValues[productValue3] & 1536us) == 0us)
        {
            float intermediateValue37;
            float intermediateValue38;
            float intermediateValue39;
            float intermediateValue40;
            if ((objectInstances.packedValues[productValue3] & 4us) == 0us)
            {
                intermediateValue37 = intermediateValue33;
                intermediateValue38 = bitwiseValue44;
                intermediateValue39 = bitwiseValue45;
                intermediateValue40 = bitwiseValue46;
            }
            else
            {
                uint reinterpretedBits9;
                if (objectInstances.packedValues[productValue2] > 4095us)
                {
                    reinterpretedBits9 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                }
                else
                {
                    reinterpretedBits9 = uint(objectInstances.packedValues[productValue2]);
                }
                vec4 sampledTextureValue1 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits9 + 0u], defaultSampler)), vec2(bitwiseValue44, bitwiseValue45), 0.0);
                intermediateValue37 = 1.0;
                intermediateValue38 = ((((sampledTextureValue1.x * 2.0) + (-1.0)) * bitwiseValue46) + 1.0) * bitwiseValue47;
                intermediateValue39 = ((((sampledTextureValue1.y * 2.0) + (-1.0)) * bitwiseValue46) + 1.0) * bitwiseValue47;
                intermediateValue40 = ((((sampledTextureValue1.z * 2.0) + (-1.0)) * bitwiseValue46) + 1.0) * bitwiseValue47;
            }
            float intermediateValue42;
            float intermediateValue43;
            float intermediateValue44;
            if ((objectInstances.packedValues[productValue3] & 8192us) == 0us)
            {
                intermediateValue42 = intermediateValue38;
                intermediateValue43 = intermediateValue39;
                intermediateValue44 = intermediateValue40;
            }
            else
            {
                intermediateValue42 = ((1.0 - intermediateValue38) * intermediateValue37) + intermediateValue38;
                intermediateValue43 = ((1.0 - intermediateValue39) * intermediateValue37) + intermediateValue39;
                intermediateValue44 = ((1.0 - intermediateValue40) * intermediateValue37) + intermediateValue40;
            }
            float intermediateValue48;
            if ((objectInstances.packedValues[productValue3] & 2048us) == 0us)
            {
                intermediateValue48 = intermediateValue37;
            }
            else
            {
                intermediateValue48 = spvNClamp(fma(intermediateValue37, 2.0, -1.0), 0.0, 1.0);
            }
            float bitwiseValue48 = (intermediateValue42 * intermediateValue30) * ((intermediateValue48 * ((float(objectInstances_2.packedValues[productValue4] >> 24u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
            float bitwiseValue49 = (intermediateValue43 * intermediateValue31) * ((intermediateValue48 * ((float((objectInstances_2.packedValues[productValue4] >> 16u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
            float bitwiseValue50 = (intermediateValue44 * intermediateValue32) * ((intermediateValue48 * ((float((objectInstances_2.packedValues[productValue4] >> 8u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
            float productValue92;
            if (bitwiseValue48 < 0.040449999272823333740234375)
            {
                productValue92 = bitwiseValue48 * 0.077399380505084991455078125;
            }
            else
            {
                productValue92 = exp2(log2((bitwiseValue48 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
            }
            float productValue114;
            if (bitwiseValue49 < 0.040449999272823333740234375)
            {
                productValue114 = bitwiseValue49 * 0.077399380505084991455078125;
            }
            else
            {
                productValue114 = exp2(log2((bitwiseValue49 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
            }
            float productValue161;
            if (bitwiseValue50 < 0.040449999272823333740234375)
            {
                productValue161 = bitwiseValue50 * 0.077399380505084991455078125;
            }
            else
            {
                productValue161 = exp2(log2((bitwiseValue50 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
            }
            float reinterpretedBits10;
            float reinterpretedBits11;
            if ((pbrTextureDataBuffer.packedValues[(intermediateValue14 * 16u) + 8u] & 1u) == 0u)
            {
                reinterpretedBits10 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue14 * 16u) + 11u]);
                reinterpretedBits11 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue14 * 16u) + 10u]);
            }
            else
            {
                vec4 sampledTextureValue2 = textureLod(nonuniformEXT(sampler2D(textures[sumValue40], defaultSampler)), vec2(fma(productValue30, reinterpretedBits4.x, reinterpretedBits5.x), fma(productValue31, reinterpretedBits4.y, reinterpretedBits5.y)), spvNMin((100.0 - reinterpretedBits6) + reinterpretedBits7, reinterpretedBits7));
                float scalarValue9 = sampledTextureValue2.y;
                reinterpretedBits10 = sampledTextureValue2.x;
                reinterpretedBits11 = fma(scalarValue9, scalarValue9, 0.0);
            }
            float sumValue41 = 1.0 - reinterpretedBits10;
            float productValue64 = sumValue41 * productValue92;
            float productValue65 = sumValue41 * productValue114;
            float productValue66 = sumValue41 * productValue161;
            float dotProductValue = dot(vec3(productValue92, productValue114, productValue161), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
            float productValue67 = (reinterpretedBits11 * 5.0) * ViewCB.packedValues[84u].w;
            productValue55 = productValue67 * (((dotProductValue - productValue92) * ViewCB.packedValues[85u].x) + productValue92);
            productValue56 = productValue67 * (((dotProductValue - productValue114) * ViewCB.packedValues[85u].x) + productValue114);
            productValue57 = productValue67 * (((dotProductValue - productValue161) * ViewCB.packedValues[85u].x) + productValue161);
            productValue58 = (reinterpretedBits10 * (productValue92 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
            productValue59 = (reinterpretedBits10 * (productValue114 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
            productValue60 = (reinterpretedBits10 * (productValue161 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
            productValue61 = productValue64 - (productValue64 * reinterpretedBits11);
            productValue62 = productValue65 - (productValue65 * reinterpretedBits11);
            productValue63 = productValue66 - (productValue66 * reinterpretedBits11);
        }
        else
        {
            productValue55 = intermediateValue34;
            productValue56 = intermediateValue34;
            productValue57 = intermediateValue34;
            productValue58 = intermediateValue34;
            productValue59 = intermediateValue34;
            productValue60 = intermediateValue34;
            productValue61 = intermediateValue34;
            productValue62 = intermediateValue34;
            productValue63 = intermediateValue34;
        }
        rayQueryInitializeEXT(intermediateValue35, SceneBVH, 512u, 32u, vec3(sumValue22, sumValue25, sumValue28), 0.004999999888241291046142578125, vec3(ViewCB.packedValues[53u].xyz), 10000.0);
        bool conditionValue1 = rayQueryProceedEXT(intermediateValue35);
        if (conditionValue1)
        {
            bool intermediateValue55;
            bool comparisonValue;
            for (;;)
            {
                uint scalarValue10 = rayQueryGetIntersectionTypeEXT(intermediateValue35, bool(0u));
                comparisonValue = scalarValue10 == 0u;
                if (comparisonValue)
                {
                    vec2 vectorValue = rayQueryGetIntersectionBarycentricsEXT(intermediateValue35, bool(0u));
                    vec2 vectorValue1 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue35, bool(0u));
                    uint scalarValue11 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue35, bool(0u));
                    uint scalarValue12 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue35, bool(0u));
                    uint scalarValue13 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue35, bool(0u));
                    uint productValue68 = (scalarValue13 * 76u) + 58u;
                    uint productValue69 = (scalarValue13 * 76u) + 61u;
                    precise float sumValue42 = 1.0 - vectorValue.x;
                    precise float sumValue43 = sumValue42 - vectorValue1.y;
                    uint bitwiseValue51 = (objectInstances_2.packedValues[(scalarValue13 * 38u) + 25u] >> 2u) + (scalarValue11 >> 1u);
                    uint productValue70 = uint(objectInstances.packedValues[(scalarValue13 * 76u) + 54u]) + 0u;
                    bool comparisonValue1 = (scalarValue11 & 1u) == 0u;
                    uint comparisonValue2 = comparisonValue1 ? faceUvBuffersRW[nonuniformEXT(productValue70)].packedValues[bitwiseValue51].z : faceUvBuffersRW[nonuniformEXT(productValue70)].packedValues[bitwiseValue51].x;
                    uint comparisonValue3 = comparisonValue1 ? faceUvBuffersRW[nonuniformEXT(productValue70)].packedValues[bitwiseValue51].y : faceUvBuffersRW[nonuniformEXT(productValue70)].packedValues[bitwiseValue51].w;
                    uint comparisonValue4 = comparisonValue1 ? faceUvBuffersRW[nonuniformEXT(productValue70)].packedValues[bitwiseValue51].x : faceUvBuffersRW[nonuniformEXT(productValue70)].packedValues[bitwiseValue51].z;
                    bool conditionValue2 = int16_t(objectInstances.packedValues[productValue69]) < int16_t(0us);
                    float intermediateValue77;
                    float intermediateValue78;
                    if (conditionValue2)
                    {
                        uint bitwiseValue52 = comparisonValue4 >> 15u;
                        precise float bitwiseValue53 = float(bitwiseValue52 & 1u) * 2.0;
                        precise float sumValue44 = bitwiseValue53 + (-1.0);
                        precise float bitwiseValue54 = float(comparisonValue4 >> 31u) * 2.0;
                        precise float sumValue45 = bitwiseValue54 + (-1.0);
                        precise float bitwiseValue55 = float((comparisonValue4 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue56 = float(bitwiseValue52 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue71 = sumValue44 * 3.0517578125e-05;
                        precise float productValue72 = sumValue45 * 3.0517578125e-05;
                        precise float sumValue46 = bitwiseValue55 + productValue71;
                        precise float sumValue47 = bitwiseValue56 + productValue72;
                        intermediateValue77 = sumValue46;
                        intermediateValue78 = sumValue47;
                    }
                    else
                    {
                        precise float bitwiseValue57 = float(comparisonValue4 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue58 = float(comparisonValue4 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue73 = bitwiseValue57 * 16384.0;
                        precise float sumValue48 = productValue73 + 0.5;
                        precise float productValue74 = bitwiseValue58 * 16384.0;
                        precise float sumValue49 = productValue74 + 0.5;
                        precise float productValue75 = floor(sumValue48) * 6.103515625e-05;
                        precise float productValue76 = floor(sumValue49) * 6.103515625e-05;
                        intermediateValue77 = productValue75;
                        intermediateValue78 = productValue76;
                    }
                    precise float productValue77 = sumValue43 * intermediateValue77;
                    precise float productValue78 = sumValue43 * intermediateValue78;
                    precise float sumValue50 = productValue77 + 0.0;
                    precise float sumValue51 = productValue78 + 0.0;
                    float intermediateValue122;
                    float intermediateValue123;
                    if (conditionValue2)
                    {
                        uint bitwiseValue59 = comparisonValue3 >> 15u;
                        precise float bitwiseValue60 = float(bitwiseValue59 & 1u) * 2.0;
                        precise float sumValue52 = bitwiseValue60 + (-1.0);
                        precise float bitwiseValue61 = float(comparisonValue3 >> 31u) * 2.0;
                        precise float sumValue53 = bitwiseValue61 + (-1.0);
                        precise float bitwiseValue62 = float((comparisonValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue63 = float(bitwiseValue59 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue79 = sumValue52 * 3.0517578125e-05;
                        precise float productValue80 = sumValue53 * 3.0517578125e-05;
                        precise float sumValue54 = bitwiseValue62 + productValue79;
                        precise float sumValue55 = bitwiseValue63 + productValue80;
                        intermediateValue122 = sumValue54;
                        intermediateValue123 = sumValue55;
                    }
                    else
                    {
                        precise float bitwiseValue64 = float(comparisonValue3 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue65 = float(comparisonValue3 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue81 = bitwiseValue64 * 16384.0;
                        precise float sumValue56 = productValue81 + 0.5;
                        precise float productValue82 = bitwiseValue65 * 16384.0;
                        precise float sumValue57 = productValue82 + 0.5;
                        precise float productValue83 = floor(sumValue56) * 6.103515625e-05;
                        precise float productValue84 = floor(sumValue57) * 6.103515625e-05;
                        intermediateValue122 = productValue83;
                        intermediateValue123 = productValue84;
                    }
                    precise float productValue85 = vectorValue.x * intermediateValue122;
                    precise float productValue86 = vectorValue.x * intermediateValue123;
                    precise float sumValue58 = sumValue50 + productValue85;
                    precise float sumValue59 = sumValue51 + productValue86;
                    float intermediateValue152;
                    float intermediateValue153;
                    if (conditionValue2)
                    {
                        uint bitwiseValue66 = comparisonValue2 >> 15u;
                        precise float bitwiseValue67 = float(bitwiseValue66 & 1u) * 2.0;
                        precise float sumValue60 = bitwiseValue67 + (-1.0);
                        precise float bitwiseValue68 = float(comparisonValue2 >> 31u) * 2.0;
                        precise float sumValue61 = bitwiseValue68 + (-1.0);
                        precise float bitwiseValue69 = float((comparisonValue2 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue70 = float(bitwiseValue66 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue87 = sumValue60 * 3.0517578125e-05;
                        precise float productValue88 = sumValue61 * 3.0517578125e-05;
                        precise float sumValue62 = bitwiseValue69 + productValue87;
                        precise float sumValue63 = bitwiseValue70 + productValue88;
                        intermediateValue152 = sumValue62;
                        intermediateValue153 = sumValue63;
                    }
                    else
                    {
                        precise float bitwiseValue71 = float(comparisonValue2 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue72 = float(comparisonValue2 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue89 = bitwiseValue71 * 16384.0;
                        precise float sumValue64 = productValue89 + 0.5;
                        precise float productValue90 = bitwiseValue72 * 16384.0;
                        precise float sumValue65 = productValue90 + 0.5;
                        precise float productValue91 = floor(sumValue64) * 6.103515625e-05;
                        precise float productValue93 = floor(sumValue65) * 6.103515625e-05;
                        intermediateValue152 = productValue91;
                        intermediateValue153 = productValue93;
                    }
                    precise float productValue94 = vectorValue1.y * intermediateValue152;
                    precise float productValue95 = vectorValue1.y * intermediateValue153;
                    precise float sumValue66 = sumValue58 + productValue94;
                    precise float sumValue67 = sumValue59 + productValue95;
                    float intermediateValue155;
                    if (objectInstances.packedValues[productValue68] == 65535us)
                    {
                        intermediateValue155 = 1.0;
                    }
                    else
                    {
                        uint reinterpretedBits12;
                        if (objectInstances.packedValues[productValue68] > 4095us)
                        {
                            reinterpretedBits12 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits12 = uint(objectInstances.packedValues[productValue68]);
                        }
                        intermediateValue155 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits12 + 0u], defaultSampler)), vec2(sumValue66, sumValue67), -0.25).w;
                    }
                    uint comparisonValue27;
                    if (scalarValue12 == 2u)
                    {
                        comparisonValue27 = 0u;
                    }
                    else
                    {
                        comparisonValue27 = uint(intermediateValue155 <= (((objectInstances.packedValues[productValue69] & 4352us) != 0us) ? 0.5 : 0.0));
                    }
                    if (comparisonValue27 == 0u)
                    {
                        rayQueryConfirmIntersectionEXT(intermediateValue35);
                    }
                }
                intermediateValue55 = rayQueryProceedEXT(intermediateValue35);
                if (intermediateValue55)
                {
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        uint scalarValue14 = rayQueryGetIntersectionTypeEXT(intermediateValue35, bool(1u));
        float intermediateValue47;
        if (scalarValue14 == 1u)
        {
            float scalarValue15 = rayQueryGetIntersectionTEXT(intermediateValue35, bool(1u));
            intermediateValue47 = scalarValue15;
        }
        else
        {
            intermediateValue47 = 10000.0;
        }
        float intermediateValue85;
        float intermediateValue86;
        float intermediateValue87;
        if (intermediateValue47 < 10000.0)
        {
            precise float productValue96 = intermediateValue47 * ViewCB.packedValues[63u].x;
            precise float productValue97 = intermediateValue47 * ViewCB.packedValues[63u].y;
            precise float productValue98 = intermediateValue47 * ViewCB.packedValues[63u].z;
            precise float productValue99 = productValue96 * (-1.44269502162933349609375);
            precise float productValue100 = productValue97 * (-1.44269502162933349609375);
            precise float productValue101 = productValue98 * (-1.44269502162933349609375);
            precise float productValue102 = ViewCB.packedValues[53u].x * intermediateValue47;
            precise float sumValue68 = productValue102 + sumValue22;
            precise float productValue103 = ViewCB.packedValues[53u].z * intermediateValue47;
            precise float sumValue69 = productValue103 + sumValue28;
            precise float productValue104 = sumValue68 * ViewCB.packedValues[83u].z;
            precise float sumValue70 = productValue104 + ViewCB.packedValues[84u].x;
            precise float productValue105 = sumValue69 * ViewCB.packedValues[83u].w;
            precise float sumValue71 = productValue105 + ViewCB.packedValues[84u].y;
            vec4 sampledTextureValue3 = textureLod(sampler2D(wibblyTexture, linearWrapSampler), vec2(sumValue70, sumValue71), 0.0);
            precise float sumValue72 = sampledTextureValue3.x + (-0.5);
            precise float sumValue73 = sampledTextureValue3.y + (-0.5);
            precise float productValue106 = sumValue68 * ViewCB.packedValues[82u].z;
            precise float sumValue74 = productValue106 + ViewCB.packedValues[83u].x;
            precise float productValue107 = sumValue69 * ViewCB.packedValues[82u].w;
            precise float sumValue75 = productValue107 + ViewCB.packedValues[83u].y;
            precise float productValue111 = sumValue72 * 0.4000000059604644775390625;
            precise float productValue112 = sumValue73 * 0.4000000059604644775390625;
            precise float sumValue76 = sumValue74 + productValue111;
            precise float sumValue77 = productValue112 + sumValue75;
            precise float productValue113 = ViewCB.packedValues[68u].w * 63.0;
            uint scalarValue16 = uint(int(floor(productValue113)));
            precise float productValue115 = float(int(scalarValue16 + 1u)) * 0.015625;
            precise float sumValue78 = (-0.0) - productValue115;
            float scalarValue17 = fract(abs(productValue115));
            precise float sumValue79 = (-0.0) - scalarValue17;
            precise float comparisonValue5 = ((productValue115 >= sumValue78) ? scalarValue17 : sumValue79) * 64.0;
            vec4 sampledTextureValue4 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue76, sumValue77, float(int(scalarValue16))), 0.0);
            float scalarValue18 = sampledTextureValue4.x;
            precise float sampledTextureValue5 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue76, sumValue77, float(int(uint(int(comparisonValue5))))), 0.0).x - scalarValue18;
            precise float productValue116 = fract(productValue113) * sampledTextureValue5;
            precise float sumValue80 = scalarValue18 + productValue116;
            precise float productValue117 = sumValue80 * 7.0;
            precise float sumValue81 = productValue117 + 0.800000011920928955078125;
            precise float productValue118 = intermediateValue47 * (-0.100000001490116119384765625);
            precise float sumValue82 = sumValue81 + (-1.0);
            precise float exponentialValue = exp2(productValue118) * sumValue82;
            precise float sumValue83 = exponentialValue + 1.0;
            precise float exponentialValue1 = exp2(productValue99) * sumValue83;
            precise float exponentialValue2 = exp2(productValue100) * sumValue83;
            precise float exponentialValue3 = exp2(productValue101) * sumValue83;
            rayQueryInitializeEXT(intermediateValue59, SceneBVH, 512u, 4294967199u, vec3(sumValue22, sumValue25, sumValue28), 0.004999999888241291046142578125, vec3(ViewCB.packedValues[53u].xyz), intermediateValue47);
            bool conditionValue3 = rayQueryProceedEXT(intermediateValue59);
            float intermediateValue63;
            float intermediateValue65;
            float intermediateValue67;
            if (conditionValue3)
            {
                float intermediateValue64;
                float intermediateValue66;
                float intermediateValue68;
                float scalarValue19 = exponentialValue1;
                float scalarValue20 = exponentialValue2;
                float scalarValue21 = exponentialValue3;
                bool comparisonValue11;
                for (;;)
                {
                    uint scalarValue22 = rayQueryGetIntersectionTypeEXT(intermediateValue59, bool(0u));
                    comparisonValue11 = scalarValue22 == 0u;
                    float branchMergedValue;
                    float branchMergedValue3;
                    float branchMergedValue4;
                    if (comparisonValue11)
                    {
                        vec2 vectorValue2 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue59, bool(0u));
                        vec2 vectorValue3 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue59, bool(0u));
                        float scalarValue23 = rayQueryGetIntersectionTEXT(intermediateValue59, bool(0u));
                        uint scalarValue24 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue59, bool(0u));
                        uint scalarValue25 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue59, bool(0u));
                        uint scalarValue26 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue59, bool(0u));
                        uint productValue119 = (scalarValue26 * 76u) + 58u;
                        uint productValue120 = (scalarValue26 * 76u) + 61u;
                        precise float sumValue84 = 1.0 - vectorValue2.x;
                        precise float sumValue85 = sumValue84 - vectorValue3.y;
                        uint bitwiseValue73 = (objectInstances_2.packedValues[(scalarValue26 * 38u) + 25u] >> 2u) + (scalarValue24 >> 1u);
                        uint productValue121 = uint(objectInstances.packedValues[(scalarValue26 * 76u) + 54u]) + 0u;
                        bool comparisonValue6 = (scalarValue24 & 1u) == 0u;
                        uint comparisonValue7 = comparisonValue6 ? faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue73].z : faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue73].x;
                        uint comparisonValue8 = comparisonValue6 ? faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue73].y : faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue73].w;
                        uint comparisonValue9 = comparisonValue6 ? faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue73].x : faceUvBuffersRW[nonuniformEXT(productValue121)].packedValues[bitwiseValue73].z;
                        bool conditionValue4 = int16_t(objectInstances.packedValues[productValue120]) < int16_t(0us);
                        float intermediateValue131;
                        float intermediateValue132;
                        if (conditionValue4)
                        {
                            uint bitwiseValue74 = comparisonValue9 >> 15u;
                            precise float bitwiseValue75 = float(bitwiseValue74 & 1u) * 2.0;
                            precise float sumValue86 = bitwiseValue75 + (-1.0);
                            precise float bitwiseValue76 = float(comparisonValue9 >> 31u) * 2.0;
                            precise float sumValue87 = bitwiseValue76 + (-1.0);
                            precise float bitwiseValue77 = float((comparisonValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue78 = float(bitwiseValue74 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue122 = sumValue86 * 3.0517578125e-05;
                            precise float productValue123 = sumValue87 * 3.0517578125e-05;
                            precise float sumValue88 = bitwiseValue77 + productValue122;
                            precise float sumValue89 = bitwiseValue78 + productValue123;
                            intermediateValue131 = sumValue88;
                            intermediateValue132 = sumValue89;
                        }
                        else
                        {
                            precise float bitwiseValue79 = float(comparisonValue9 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue80 = float(comparisonValue9 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue124 = bitwiseValue79 * 16384.0;
                            precise float sumValue90 = productValue124 + 0.5;
                            precise float productValue125 = bitwiseValue80 * 16384.0;
                            precise float sumValue91 = productValue125 + 0.5;
                            precise float productValue126 = floor(sumValue90) * 6.103515625e-05;
                            precise float productValue130 = floor(sumValue91) * 6.103515625e-05;
                            intermediateValue131 = productValue126;
                            intermediateValue132 = productValue130;
                        }
                        precise float productValue131 = sumValue85 * intermediateValue131;
                        precise float productValue132 = sumValue85 * intermediateValue132;
                        precise float sumValue92 = productValue131 + 0.0;
                        precise float sumValue93 = productValue132 + 0.0;
                        float intermediateValue156;
                        float intermediateValue157;
                        if (conditionValue4)
                        {
                            uint bitwiseValue81 = comparisonValue8 >> 15u;
                            precise float bitwiseValue82 = float(bitwiseValue81 & 1u) * 2.0;
                            precise float sumValue94 = bitwiseValue82 + (-1.0);
                            precise float bitwiseValue83 = float(comparisonValue8 >> 31u) * 2.0;
                            precise float sumValue95 = bitwiseValue83 + (-1.0);
                            precise float bitwiseValue84 = float((comparisonValue8 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue85 = float(bitwiseValue81 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue133 = sumValue94 * 3.0517578125e-05;
                            precise float productValue134 = sumValue95 * 3.0517578125e-05;
                            precise float sumValue96 = bitwiseValue84 + productValue133;
                            precise float sumValue97 = bitwiseValue85 + productValue134;
                            intermediateValue156 = sumValue96;
                            intermediateValue157 = sumValue97;
                        }
                        else
                        {
                            precise float bitwiseValue86 = float(comparisonValue8 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue87 = float(comparisonValue8 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue135 = bitwiseValue86 * 16384.0;
                            precise float sumValue98 = productValue135 + 0.5;
                            precise float productValue136 = bitwiseValue87 * 16384.0;
                            precise float sumValue99 = productValue136 + 0.5;
                            precise float productValue137 = floor(sumValue98) * 6.103515625e-05;
                            precise float productValue138 = floor(sumValue99) * 6.103515625e-05;
                            intermediateValue156 = productValue137;
                            intermediateValue157 = productValue138;
                        }
                        precise float productValue139 = vectorValue2.x * intermediateValue156;
                        precise float productValue141 = vectorValue2.x * intermediateValue157;
                        precise float sumValue100 = sumValue92 + productValue139;
                        precise float sumValue101 = sumValue93 + productValue141;
                        float intermediateValue162;
                        float intermediateValue163;
                        if (conditionValue4)
                        {
                            uint bitwiseValue88 = comparisonValue7 >> 15u;
                            precise float bitwiseValue89 = float(bitwiseValue88 & 1u) * 2.0;
                            precise float sumValue102 = bitwiseValue89 + (-1.0);
                            precise float bitwiseValue90 = float(comparisonValue7 >> 31u) * 2.0;
                            precise float sumValue103 = bitwiseValue90 + (-1.0);
                            precise float bitwiseValue91 = float((comparisonValue7 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue92 = float(bitwiseValue88 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue142 = sumValue102 * 3.0517578125e-05;
                            precise float productValue143 = sumValue103 * 3.0517578125e-05;
                            precise float sumValue104 = bitwiseValue91 + productValue142;
                            precise float sumValue105 = bitwiseValue92 + productValue143;
                            intermediateValue162 = sumValue104;
                            intermediateValue163 = sumValue105;
                        }
                        else
                        {
                            precise float bitwiseValue93 = float(comparisonValue7 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue94 = float(comparisonValue7 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue144 = bitwiseValue93 * 16384.0;
                            precise float sumValue106 = productValue144 + 0.5;
                            precise float productValue145 = bitwiseValue94 * 16384.0;
                            precise float sumValue107 = productValue145 + 0.5;
                            precise float productValue146 = floor(sumValue106) * 6.103515625e-05;
                            precise float productValue147 = floor(sumValue107) * 6.103515625e-05;
                            intermediateValue162 = productValue146;
                            intermediateValue163 = productValue147;
                        }
                        precise float productValue148 = vectorValue3.y * intermediateValue162;
                        precise float productValue149 = vectorValue3.y * intermediateValue163;
                        precise float sumValue108 = sumValue100 + productValue148;
                        precise float sumValue109 = sumValue101 + productValue149;
                        precise float productValue150 = scalarValue23 * 0.083333335816860198974609375;
                        precise float sumValue110 = productValue150 + (-0.25);
                        float intermediateValue168;
                        float intermediateValue169;
                        float intermediateValue170;
                        float intermediateValue171;
                        if (objectInstances.packedValues[productValue119] == 65535us)
                        {
                            intermediateValue168 = 1.0;
                            intermediateValue169 = 1.0;
                            intermediateValue170 = 1.0;
                            intermediateValue171 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits13;
                            if (objectInstances.packedValues[productValue119] > 4095us)
                            {
                                reinterpretedBits13 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits13 = uint(objectInstances.packedValues[productValue119]);
                            }
                            vec4 sampledTextureValue6 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits13 + 0u], defaultSampler)), vec2(sumValue108, sumValue109), spvNMin(sumValue110, 2.0));
                            intermediateValue168 = sampledTextureValue6.x;
                            intermediateValue169 = sampledTextureValue6.y;
                            intermediateValue170 = sampledTextureValue6.z;
                            intermediateValue171 = sampledTextureValue6.w;
                        }
                        float intermediateValue178;
                        float intermediateValue179;
                        float intermediateValue180;
                        if (scalarValue25 == 2u)
                        {
                            float branchMergedValue10;
                            float branchMergedValue15;
                            float branchMergedValue16;
                            if ((objectInstances.packedValues[productValue120] & 128us) == 0us)
                            {
                                float intermediateValue188;
                                if ((objectInstances.packedValues[productValue120] & 2048us) == 0us)
                                {
                                    intermediateValue188 = intermediateValue171;
                                }
                                else
                                {
                                    precise float productValue151 = intermediateValue171 * 2.0;
                                    precise float sumValue111 = productValue151 + (-1.0);
                                    intermediateValue188 = spvNClamp(sumValue111, 0.0, 1.0);
                                }
                                precise float sumValue112 = 0.0 - intermediateValue168;
                                precise float sumValue113 = 0.0 - intermediateValue169;
                                precise float sumValue114 = 0.0 - intermediateValue170;
                                precise float productValue152 = sumValue112 * intermediateValue188;
                                precise float productValue153 = sumValue113 * intermediateValue188;
                                precise float productValue154 = sumValue114 * intermediateValue188;
                                precise float sumValue115 = intermediateValue168 + productValue152;
                                precise float sumValue116 = intermediateValue169 + productValue153;
                                precise float sumValue117 = intermediateValue170 + productValue154;
                                branchMergedValue10 = sumValue117;
                                branchMergedValue15 = sumValue116;
                                branchMergedValue16 = sumValue115;
                            }
                            else
                            {
                                branchMergedValue10 = 0.33399999141693115234375;
                                branchMergedValue15 = 0.33399999141693115234375;
                                branchMergedValue16 = 0.33399999141693115234375;
                            }
                            intermediateValue178 = branchMergedValue16;
                            intermediateValue179 = branchMergedValue15;
                            intermediateValue180 = branchMergedValue10;
                        }
                        else
                        {
                            precise float sumValue118 = 1.0 - intermediateValue171;
                            intermediateValue178 = sumValue118;
                            intermediateValue179 = sumValue118;
                            intermediateValue180 = sumValue118;
                        }
                        precise float productValue155 = scalarValue19 * intermediateValue178;
                        precise float productValue156 = scalarValue20 * intermediateValue179;
                        precise float productValue157 = scalarValue21 * intermediateValue180;
                        float intermediateValue99;
                        float intermediateValue100;
                        float intermediateValue101;
                        bool intermediateValue189;
                        if (!(dot(vec3(productValue155, productValue156, productValue157), vec3(1.0)) <= 0.00999999977648258209228515625))
                        {
                            intermediateValue189 = false;
                            intermediateValue99 = productValue155;
                            intermediateValue100 = productValue156;
                            intermediateValue101 = productValue157;
                        }
                        else
                        {
                            intermediateValue189 = true;
                            intermediateValue99 = 0.0;
                            intermediateValue100 = 0.0;
                            intermediateValue101 = 0.0;
                        }
                        float branchMergedValue21;
                        float branchMergedValue24;
                        float branchMergedValue25;
                        if (intermediateValue189)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue59);
                            branchMergedValue21 = intermediateValue101;
                            branchMergedValue24 = intermediateValue100;
                            branchMergedValue25 = intermediateValue99;
                        }
                        else
                        {
                            branchMergedValue21 = intermediateValue101;
                            branchMergedValue24 = intermediateValue100;
                            branchMergedValue25 = intermediateValue99;
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
                    intermediateValue68 = branchMergedValue;
                    intermediateValue66 = branchMergedValue3;
                    intermediateValue64 = branchMergedValue4;
                    bool conditionValue5 = rayQueryProceedEXT(intermediateValue59);
                    if (conditionValue5)
                    {
                        scalarValue19 = intermediateValue64;
                        scalarValue20 = intermediateValue66;
                        scalarValue21 = intermediateValue68;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue63 = intermediateValue64;
                intermediateValue65 = intermediateValue66;
                intermediateValue67 = intermediateValue68;
            }
            else
            {
                intermediateValue63 = exponentialValue1;
                intermediateValue65 = exponentialValue2;
                intermediateValue67 = exponentialValue3;
            }
            uint scalarValue27 = rayQueryGetIntersectionTypeEXT(intermediateValue59, bool(1u));
            bool comparisonValue10 = scalarValue27 == 1u;
            float comparisonValue13 = comparisonValue10 ? 0.0 : intermediateValue63;
            float comparisonValue14 = comparisonValue10 ? 0.0 : intermediateValue65;
            float comparisonValue15 = comparisonValue10 ? 0.0 : intermediateValue67;
            float branchMergedValue9;
            float branchMergedValue13;
            float branchMergedValue14;
            if (dot(vec3(comparisonValue13, comparisonValue14, comparisonValue15), vec3(1.0)) > 0.00999999977648258209228515625)
            {
                rayQueryInitializeEXT(intermediateValue83, SceneBVH, 512u, 4294967199u, vec3(sumValue68, fma(ViewCB.packedValues[53u].y, intermediateValue47, sumValue25), sumValue69), 0.004999999888241291046142578125, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                bool conditionValue6 = rayQueryProceedEXT(intermediateValue83);
                float intermediateValue103;
                float intermediateValue105;
                float intermediateValue107;
                if (conditionValue6)
                {
                    float intermediateValue104;
                    float intermediateValue106;
                    float intermediateValue108;
                    float scalarValue28 = comparisonValue13;
                    float scalarValue29 = comparisonValue14;
                    float scalarValue30 = comparisonValue15;
                    bool comparisonValue22;
                    for (;;)
                    {
                        uint scalarValue31 = rayQueryGetIntersectionTypeEXT(intermediateValue83, bool(0u));
                        comparisonValue22 = scalarValue31 == 0u;
                        float branchMergedValue2;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        if (comparisonValue22)
                        {
                            vec2 vectorValue4 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue83, bool(0u));
                            vec2 vectorValue5 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue83, bool(0u));
                            float scalarValue32 = rayQueryGetIntersectionTEXT(intermediateValue83, bool(0u));
                            uint scalarValue33 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue83, bool(0u));
                            uint scalarValue34 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue83, bool(0u));
                            uint scalarValue35 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue83, bool(0u));
                            uint productValue158 = (scalarValue35 * 76u) + 58u;
                            uint productValue159 = (scalarValue35 * 76u) + 61u;
                            precise float sumValue119 = 1.0 - vectorValue4.x;
                            precise float sumValue120 = sumValue119 - vectorValue5.y;
                            uint bitwiseValue95 = (objectInstances_2.packedValues[(scalarValue35 * 38u) + 25u] >> 2u) + (scalarValue33 >> 1u);
                            uint productValue160 = uint(objectInstances.packedValues[(scalarValue35 * 76u) + 54u]) + 0u;
                            bool comparisonValue16 = (scalarValue33 & 1u) == 0u;
                            uint comparisonValue17 = comparisonValue16 ? faceUvBuffersRW[nonuniformEXT(productValue160)].packedValues[bitwiseValue95].z : faceUvBuffersRW[nonuniformEXT(productValue160)].packedValues[bitwiseValue95].x;
                            uint comparisonValue18 = comparisonValue16 ? faceUvBuffersRW[nonuniformEXT(productValue160)].packedValues[bitwiseValue95].y : faceUvBuffersRW[nonuniformEXT(productValue160)].packedValues[bitwiseValue95].w;
                            uint comparisonValue19 = comparisonValue16 ? faceUvBuffersRW[nonuniformEXT(productValue160)].packedValues[bitwiseValue95].x : faceUvBuffersRW[nonuniformEXT(productValue160)].packedValues[bitwiseValue95].z;
                            bool conditionValue7 = int16_t(objectInstances.packedValues[productValue159]) < int16_t(0us);
                            float intermediateValue158;
                            float intermediateValue159;
                            if (conditionValue7)
                            {
                                uint bitwiseValue96 = comparisonValue19 >> 15u;
                                precise float bitwiseValue97 = float(bitwiseValue96 & 1u) * 2.0;
                                precise float sumValue121 = bitwiseValue97 + (-1.0);
                                precise float bitwiseValue98 = float(comparisonValue19 >> 31u) * 2.0;
                                precise float sumValue122 = bitwiseValue98 + (-1.0);
                                precise float bitwiseValue99 = float((comparisonValue19 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue100 = float(bitwiseValue96 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue162 = sumValue121 * 3.0517578125e-05;
                                precise float productValue163 = sumValue122 * 3.0517578125e-05;
                                precise float sumValue123 = bitwiseValue99 + productValue162;
                                precise float sumValue124 = bitwiseValue100 + productValue163;
                                intermediateValue158 = sumValue123;
                                intermediateValue159 = sumValue124;
                            }
                            else
                            {
                                precise float bitwiseValue101 = float(comparisonValue19 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue102 = float(comparisonValue19 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue164 = bitwiseValue101 * 16384.0;
                                precise float sumValue125 = productValue164 + 0.5;
                                precise float productValue165 = bitwiseValue102 * 16384.0;
                                precise float sumValue126 = productValue165 + 0.5;
                                precise float productValue166 = floor(sumValue125) * 6.103515625e-05;
                                precise float productValue167 = floor(sumValue126) * 6.103515625e-05;
                                intermediateValue158 = productValue166;
                                intermediateValue159 = productValue167;
                            }
                            precise float productValue168 = sumValue120 * intermediateValue158;
                            precise float productValue169 = sumValue120 * intermediateValue159;
                            precise float sumValue127 = productValue168 + 0.0;
                            precise float sumValue128 = productValue169 + 0.0;
                            float intermediateValue164;
                            float intermediateValue165;
                            if (conditionValue7)
                            {
                                uint bitwiseValue103 = comparisonValue18 >> 15u;
                                precise float bitwiseValue104 = float(bitwiseValue103 & 1u) * 2.0;
                                precise float sumValue129 = bitwiseValue104 + (-1.0);
                                precise float bitwiseValue105 = float(comparisonValue18 >> 31u) * 2.0;
                                precise float sumValue130 = bitwiseValue105 + (-1.0);
                                precise float bitwiseValue106 = float((comparisonValue18 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue107 = float(bitwiseValue103 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue170 = sumValue129 * 3.0517578125e-05;
                                precise float productValue171 = sumValue130 * 3.0517578125e-05;
                                precise float sumValue131 = bitwiseValue106 + productValue170;
                                precise float sumValue132 = bitwiseValue107 + productValue171;
                                intermediateValue164 = sumValue131;
                                intermediateValue165 = sumValue132;
                            }
                            else
                            {
                                precise float bitwiseValue108 = float(comparisonValue18 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue109 = float(comparisonValue18 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue172 = bitwiseValue108 * 16384.0;
                                precise float sumValue133 = productValue172 + 0.5;
                                precise float productValue173 = bitwiseValue109 * 16384.0;
                                precise float sumValue134 = productValue173 + 0.5;
                                precise float productValue174 = floor(sumValue133) * 6.103515625e-05;
                                precise float productValue175 = floor(sumValue134) * 6.103515625e-05;
                                intermediateValue164 = productValue174;
                                intermediateValue165 = productValue175;
                            }
                            precise float productValue176 = vectorValue4.x * intermediateValue164;
                            precise float productValue177 = vectorValue4.x * intermediateValue165;
                            precise float sumValue135 = sumValue127 + productValue176;
                            precise float sumValue136 = sumValue128 + productValue177;
                            float intermediateValue176;
                            float intermediateValue177;
                            if (conditionValue7)
                            {
                                uint bitwiseValue110 = comparisonValue17 >> 15u;
                                precise float bitwiseValue111 = float(bitwiseValue110 & 1u) * 2.0;
                                precise float sumValue137 = bitwiseValue111 + (-1.0);
                                precise float bitwiseValue112 = float(comparisonValue17 >> 31u) * 2.0;
                                precise float sumValue138 = bitwiseValue112 + (-1.0);
                                precise float bitwiseValue113 = float((comparisonValue17 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue114 = float(bitwiseValue110 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue178 = sumValue137 * 3.0517578125e-05;
                                precise float productValue179 = sumValue138 * 3.0517578125e-05;
                                precise float sumValue139 = bitwiseValue113 + productValue178;
                                precise float sumValue140 = bitwiseValue114 + productValue179;
                                intermediateValue176 = sumValue139;
                                intermediateValue177 = sumValue140;
                            }
                            else
                            {
                                precise float bitwiseValue115 = float(comparisonValue17 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue116 = float(comparisonValue17 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue180 = bitwiseValue115 * 16384.0;
                                precise float sumValue141 = productValue180 + 0.5;
                                precise float productValue181 = bitwiseValue116 * 16384.0;
                                precise float sumValue142 = productValue181 + 0.5;
                                precise float productValue182 = floor(sumValue141) * 6.103515625e-05;
                                precise float productValue183 = floor(sumValue142) * 6.103515625e-05;
                                intermediateValue176 = productValue182;
                                intermediateValue177 = productValue183;
                            }
                            precise float productValue184 = vectorValue5.y * intermediateValue176;
                            precise float productValue185 = vectorValue5.y * intermediateValue177;
                            precise float sumValue143 = sumValue135 + productValue184;
                            precise float sumValue144 = sumValue136 + productValue185;
                            float intermediateValue181;
                            float intermediateValue182;
                            float intermediateValue183;
                            float intermediateValue184;
                            if (objectInstances.packedValues[productValue158] == 65535us)
                            {
                                intermediateValue181 = 1.0;
                                intermediateValue182 = 1.0;
                                intermediateValue183 = 1.0;
                                intermediateValue184 = 1.0;
                            }
                            else
                            {
                                uint reinterpretedBits15;
                                if (objectInstances.packedValues[productValue158] > 4095us)
                                {
                                    reinterpretedBits15 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits15 = uint(objectInstances.packedValues[productValue158]);
                                }
                                vec4 sampledTextureValue7 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits15 + 0u], defaultSampler)), vec2(sumValue143, sumValue144), spvNMin(fma(scalarValue32, 0.083333335816860198974609375, -0.25), 2.0));
                                intermediateValue181 = sampledTextureValue7.x;
                                intermediateValue182 = sampledTextureValue7.y;
                                intermediateValue183 = sampledTextureValue7.z;
                                intermediateValue184 = sampledTextureValue7.w;
                            }
                            float intermediateValue192;
                            float intermediateValue193;
                            float intermediateValue194;
                            if (scalarValue34 == 2u)
                            {
                                float branchMergedValue12;
                                float branchMergedValue19;
                                float branchMergedValue20;
                                if ((objectInstances.packedValues[productValue159] & 128us) == 0us)
                                {
                                    float intermediateValue195;
                                    if ((objectInstances.packedValues[productValue159] & 2048us) == 0us)
                                    {
                                        intermediateValue195 = intermediateValue184;
                                    }
                                    else
                                    {
                                        intermediateValue195 = spvNClamp(fma(intermediateValue184, 2.0, -1.0), 0.0, 1.0);
                                    }
                                    branchMergedValue12 = intermediateValue183 - (intermediateValue195 * intermediateValue183);
                                    branchMergedValue19 = intermediateValue182 - (intermediateValue195 * intermediateValue182);
                                    branchMergedValue20 = intermediateValue181 - (intermediateValue195 * intermediateValue181);
                                }
                                else
                                {
                                    branchMergedValue12 = 0.33399999141693115234375;
                                    branchMergedValue19 = 0.33399999141693115234375;
                                    branchMergedValue20 = 0.33399999141693115234375;
                                }
                                intermediateValue192 = branchMergedValue20;
                                intermediateValue193 = branchMergedValue19;
                                intermediateValue194 = branchMergedValue12;
                            }
                            else
                            {
                                float sumValue145 = 1.0 - intermediateValue184;
                                intermediateValue192 = sumValue145;
                                intermediateValue193 = sumValue145;
                                intermediateValue194 = sumValue145;
                            }
                            float productValue186 = intermediateValue192 * scalarValue28;
                            float productValue187 = intermediateValue193 * scalarValue29;
                            float productValue188 = intermediateValue194 * scalarValue30;
                            float intermediateValue140;
                            float intermediateValue141;
                            float intermediateValue142;
                            bool intermediateValue196;
                            if (!(dot(vec3(productValue186, productValue187, productValue188), vec3(1.0)) <= 0.00999999977648258209228515625))
                            {
                                intermediateValue196 = false;
                                intermediateValue140 = productValue186;
                                intermediateValue141 = productValue187;
                                intermediateValue142 = productValue188;
                            }
                            else
                            {
                                intermediateValue196 = true;
                                intermediateValue140 = 0.0;
                                intermediateValue141 = 0.0;
                                intermediateValue142 = 0.0;
                            }
                            float branchMergedValue23;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            if (intermediateValue196)
                            {
                                rayQueryConfirmIntersectionEXT(intermediateValue83);
                                branchMergedValue23 = intermediateValue142;
                                branchMergedValue28 = intermediateValue141;
                                branchMergedValue29 = intermediateValue140;
                            }
                            else
                            {
                                branchMergedValue23 = intermediateValue142;
                                branchMergedValue28 = intermediateValue141;
                                branchMergedValue29 = intermediateValue140;
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
                        intermediateValue108 = branchMergedValue2;
                        intermediateValue106 = branchMergedValue7;
                        intermediateValue104 = branchMergedValue8;
                        bool conditionValue8 = rayQueryProceedEXT(intermediateValue83);
                        if (conditionValue8)
                        {
                            scalarValue28 = intermediateValue104;
                            scalarValue29 = intermediateValue106;
                            scalarValue30 = intermediateValue108;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue103 = intermediateValue104;
                    intermediateValue105 = intermediateValue106;
                    intermediateValue107 = intermediateValue108;
                }
                else
                {
                    intermediateValue103 = comparisonValue13;
                    intermediateValue105 = comparisonValue14;
                    intermediateValue107 = comparisonValue15;
                }
                uint scalarValue36 = rayQueryGetIntersectionTypeEXT(intermediateValue83, bool(1u));
                bool comparisonValue20 = scalarValue36 == 1u;
                branchMergedValue9 = comparisonValue20 ? 0.0 : intermediateValue107;
                branchMergedValue13 = comparisonValue20 ? 0.0 : intermediateValue105;
                branchMergedValue14 = comparisonValue20 ? 0.0 : intermediateValue103;
            }
            else
            {
                branchMergedValue9 = comparisonValue15;
                branchMergedValue13 = comparisonValue14;
                branchMergedValue14 = comparisonValue13;
            }
            intermediateValue85 = branchMergedValue14;
            intermediateValue86 = branchMergedValue13;
            intermediateValue87 = branchMergedValue9;
        }
        else
        {
            rayQueryInitializeEXT(intermediateValue61, SceneBVH, 512u, 4294967199u, vec3(sumValue22, sumValue25, sumValue28), 0.004999999888241291046142578125, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
            bool conditionValue9 = rayQueryProceedEXT(intermediateValue61);
            float intermediateValue70;
            float intermediateValue72;
            float intermediateValue74;
            if (conditionValue9)
            {
                float intermediateValue71;
                float intermediateValue73;
                float intermediateValue75;
                float scalarValue37 = 1.0;
                float scalarValue38 = 1.0;
                float scalarValue39 = 1.0;
                bool comparisonValue12;
                for (;;)
                {
                    uint scalarValue40 = rayQueryGetIntersectionTypeEXT(intermediateValue61, bool(0u));
                    comparisonValue12 = scalarValue40 == 0u;
                    float branchMergedValue1;
                    float branchMergedValue5;
                    float branchMergedValue6;
                    if (comparisonValue12)
                    {
                        vec2 vectorValue6 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue61, bool(0u));
                        vec2 vectorValue7 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue61, bool(0u));
                        float scalarValue41 = rayQueryGetIntersectionTEXT(intermediateValue61, bool(0u));
                        uint scalarValue42 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue61, bool(0u));
                        uint scalarValue43 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue61, bool(0u));
                        uint scalarValue44 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue61, bool(0u));
                        uint productValue189 = (scalarValue44 * 76u) + 58u;
                        uint productValue190 = (scalarValue44 * 76u) + 61u;
                        precise float sumValue146 = 1.0 - vectorValue6.x;
                        precise float sumValue147 = sumValue146 - vectorValue7.y;
                        uint bitwiseValue117 = (objectInstances_2.packedValues[(scalarValue44 * 38u) + 25u] >> 2u) + (scalarValue42 >> 1u);
                        uint productValue191 = uint(objectInstances.packedValues[(scalarValue44 * 76u) + 54u]) + 0u;
                        bool comparisonValue21 = (scalarValue42 & 1u) == 0u;
                        uint comparisonValue23 = comparisonValue21 ? faceUvBuffersRW[nonuniformEXT(productValue191)].packedValues[bitwiseValue117].z : faceUvBuffersRW[nonuniformEXT(productValue191)].packedValues[bitwiseValue117].x;
                        uint comparisonValue24 = comparisonValue21 ? faceUvBuffersRW[nonuniformEXT(productValue191)].packedValues[bitwiseValue117].y : faceUvBuffersRW[nonuniformEXT(productValue191)].packedValues[bitwiseValue117].w;
                        uint comparisonValue25 = comparisonValue21 ? faceUvBuffersRW[nonuniformEXT(productValue191)].packedValues[bitwiseValue117].x : faceUvBuffersRW[nonuniformEXT(productValue191)].packedValues[bitwiseValue117].z;
                        bool conditionValue10 = int16_t(objectInstances.packedValues[productValue190]) < int16_t(0us);
                        float intermediateValue150;
                        float intermediateValue151;
                        if (conditionValue10)
                        {
                            uint bitwiseValue118 = comparisonValue25 >> 15u;
                            precise float bitwiseValue119 = float(bitwiseValue118 & 1u) * 2.0;
                            precise float sumValue148 = bitwiseValue119 + (-1.0);
                            precise float bitwiseValue120 = float(comparisonValue25 >> 31u) * 2.0;
                            precise float sumValue149 = bitwiseValue120 + (-1.0);
                            precise float bitwiseValue121 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue122 = float(bitwiseValue118 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue192 = sumValue148 * 3.0517578125e-05;
                            precise float productValue193 = sumValue149 * 3.0517578125e-05;
                            precise float sumValue150 = bitwiseValue121 + productValue192;
                            precise float sumValue151 = bitwiseValue122 + productValue193;
                            intermediateValue150 = sumValue150;
                            intermediateValue151 = sumValue151;
                        }
                        else
                        {
                            precise float bitwiseValue123 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue124 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue194 = bitwiseValue123 * 16384.0;
                            precise float sumValue152 = productValue194 + 0.5;
                            precise float productValue195 = bitwiseValue124 * 16384.0;
                            precise float sumValue153 = productValue195 + 0.5;
                            precise float productValue196 = floor(sumValue152) * 6.103515625e-05;
                            precise float productValue197 = floor(sumValue153) * 6.103515625e-05;
                            intermediateValue150 = productValue196;
                            intermediateValue151 = productValue197;
                        }
                        precise float productValue198 = sumValue147 * intermediateValue150;
                        precise float productValue199 = sumValue147 * intermediateValue151;
                        precise float sumValue154 = productValue198 + 0.0;
                        precise float sumValue155 = productValue199 + 0.0;
                        float intermediateValue160;
                        float intermediateValue161;
                        if (conditionValue10)
                        {
                            uint bitwiseValue125 = comparisonValue24 >> 15u;
                            precise float bitwiseValue126 = float(bitwiseValue125 & 1u) * 2.0;
                            precise float sumValue156 = bitwiseValue126 + (-1.0);
                            precise float bitwiseValue127 = float(comparisonValue24 >> 31u) * 2.0;
                            precise float sumValue157 = bitwiseValue127 + (-1.0);
                            precise float bitwiseValue128 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue129 = float(bitwiseValue125 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue200 = sumValue156 * 3.0517578125e-05;
                            precise float productValue201 = sumValue157 * 3.0517578125e-05;
                            precise float sumValue158 = bitwiseValue128 + productValue200;
                            precise float sumValue159 = bitwiseValue129 + productValue201;
                            intermediateValue160 = sumValue158;
                            intermediateValue161 = sumValue159;
                        }
                        else
                        {
                            precise float bitwiseValue130 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue131 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue202 = bitwiseValue130 * 16384.0;
                            precise float sumValue160 = productValue202 + 0.5;
                            precise float productValue203 = bitwiseValue131 * 16384.0;
                            precise float sumValue161 = productValue203 + 0.5;
                            precise float productValue204 = floor(sumValue160) * 6.103515625e-05;
                            precise float productValue205 = floor(sumValue161) * 6.103515625e-05;
                            intermediateValue160 = productValue204;
                            intermediateValue161 = productValue205;
                        }
                        precise float productValue206 = vectorValue6.x * intermediateValue160;
                        precise float productValue207 = vectorValue6.x * intermediateValue161;
                        precise float sumValue162 = sumValue154 + productValue206;
                        precise float sumValue163 = sumValue155 + productValue207;
                        float intermediateValue166;
                        float intermediateValue167;
                        if (conditionValue10)
                        {
                            uint bitwiseValue132 = comparisonValue23 >> 15u;
                            precise float bitwiseValue133 = float(bitwiseValue132 & 1u) * 2.0;
                            precise float sumValue164 = bitwiseValue133 + (-1.0);
                            precise float bitwiseValue134 = float(comparisonValue23 >> 31u) * 2.0;
                            precise float sumValue165 = bitwiseValue134 + (-1.0);
                            precise float bitwiseValue135 = float((comparisonValue23 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue136 = float(bitwiseValue132 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue208 = sumValue164 * 3.0517578125e-05;
                            precise float productValue209 = sumValue165 * 3.0517578125e-05;
                            precise float sumValue166 = bitwiseValue135 + productValue208;
                            precise float sumValue167 = bitwiseValue136 + productValue209;
                            intermediateValue166 = sumValue166;
                            intermediateValue167 = sumValue167;
                        }
                        else
                        {
                            precise float bitwiseValue137 = float(comparisonValue23 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue138 = float(comparisonValue23 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue210 = bitwiseValue137 * 16384.0;
                            precise float sumValue168 = productValue210 + 0.5;
                            precise float productValue211 = bitwiseValue138 * 16384.0;
                            precise float sumValue169 = productValue211 + 0.5;
                            precise float productValue212 = floor(sumValue168) * 6.103515625e-05;
                            precise float productValue213 = floor(sumValue169) * 6.103515625e-05;
                            intermediateValue166 = productValue212;
                            intermediateValue167 = productValue213;
                        }
                        precise float productValue214 = vectorValue7.y * intermediateValue166;
                        precise float productValue215 = vectorValue7.y * intermediateValue167;
                        precise float sumValue170 = sumValue162 + productValue214;
                        precise float sumValue171 = sumValue163 + productValue215;
                        float intermediateValue172;
                        float intermediateValue173;
                        float intermediateValue174;
                        float intermediateValue175;
                        if (objectInstances.packedValues[productValue189] == 65535us)
                        {
                            intermediateValue172 = 1.0;
                            intermediateValue173 = 1.0;
                            intermediateValue174 = 1.0;
                            intermediateValue175 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits14;
                            if (objectInstances.packedValues[productValue189] > 4095us)
                            {
                                reinterpretedBits14 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits14 = uint(objectInstances.packedValues[productValue189]);
                            }
                            vec4 sampledTextureValue8 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits14 + 0u], defaultSampler)), vec2(sumValue170, sumValue171), spvNMin(fma(scalarValue41, 0.083333335816860198974609375, -0.25), 2.0));
                            intermediateValue172 = sampledTextureValue8.x;
                            intermediateValue173 = sampledTextureValue8.y;
                            intermediateValue174 = sampledTextureValue8.z;
                            intermediateValue175 = sampledTextureValue8.w;
                        }
                        float intermediateValue185;
                        float intermediateValue186;
                        float intermediateValue187;
                        if (scalarValue43 == 2u)
                        {
                            float branchMergedValue11;
                            float branchMergedValue17;
                            float branchMergedValue18;
                            if ((objectInstances.packedValues[productValue190] & 128us) == 0us)
                            {
                                float intermediateValue190;
                                if ((objectInstances.packedValues[productValue190] & 2048us) == 0us)
                                {
                                    intermediateValue190 = intermediateValue175;
                                }
                                else
                                {
                                    intermediateValue190 = spvNClamp(fma(intermediateValue175, 2.0, -1.0), 0.0, 1.0);
                                }
                                branchMergedValue11 = intermediateValue174 - (intermediateValue190 * intermediateValue174);
                                branchMergedValue17 = intermediateValue173 - (intermediateValue190 * intermediateValue173);
                                branchMergedValue18 = intermediateValue172 - (intermediateValue190 * intermediateValue172);
                            }
                            else
                            {
                                branchMergedValue11 = 0.33399999141693115234375;
                                branchMergedValue17 = 0.33399999141693115234375;
                                branchMergedValue18 = 0.33399999141693115234375;
                            }
                            intermediateValue185 = branchMergedValue18;
                            intermediateValue186 = branchMergedValue17;
                            intermediateValue187 = branchMergedValue11;
                        }
                        else
                        {
                            float sumValue172 = 1.0 - intermediateValue175;
                            intermediateValue185 = sumValue172;
                            intermediateValue186 = sumValue172;
                            intermediateValue187 = sumValue172;
                        }
                        float productValue216 = intermediateValue185 * scalarValue37;
                        float productValue217 = intermediateValue186 * scalarValue38;
                        float productValue218 = intermediateValue187 * scalarValue39;
                        float intermediateValue118;
                        float intermediateValue119;
                        float intermediateValue120;
                        bool intermediateValue191;
                        if (!(dot(vec3(productValue216, productValue217, productValue218), vec3(1.0)) <= 0.00999999977648258209228515625))
                        {
                            intermediateValue191 = false;
                            intermediateValue118 = productValue216;
                            intermediateValue119 = productValue217;
                            intermediateValue120 = productValue218;
                        }
                        else
                        {
                            intermediateValue191 = true;
                            intermediateValue118 = 0.0;
                            intermediateValue119 = 0.0;
                            intermediateValue120 = 0.0;
                        }
                        float branchMergedValue22;
                        float branchMergedValue26;
                        float branchMergedValue27;
                        if (intermediateValue191)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue61);
                            branchMergedValue22 = intermediateValue120;
                            branchMergedValue26 = intermediateValue119;
                            branchMergedValue27 = intermediateValue118;
                        }
                        else
                        {
                            branchMergedValue22 = intermediateValue120;
                            branchMergedValue26 = intermediateValue119;
                            branchMergedValue27 = intermediateValue118;
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
                    intermediateValue75 = branchMergedValue1;
                    intermediateValue73 = branchMergedValue5;
                    intermediateValue71 = branchMergedValue6;
                    bool conditionValue11 = rayQueryProceedEXT(intermediateValue61);
                    if (conditionValue11)
                    {
                        scalarValue37 = intermediateValue71;
                        scalarValue38 = intermediateValue73;
                        scalarValue39 = intermediateValue75;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue70 = intermediateValue71;
                intermediateValue72 = intermediateValue73;
                intermediateValue74 = intermediateValue75;
            }
            else
            {
                intermediateValue70 = 1.0;
                intermediateValue72 = 1.0;
                intermediateValue74 = 1.0;
            }
            uint scalarValue45 = rayQueryGetIntersectionTypeEXT(intermediateValue61, bool(1u));
            bool comparisonValue26 = scalarValue45 == 1u;
            intermediateValue85 = comparisonValue26 ? 0.0 : intermediateValue70;
            intermediateValue86 = comparisonValue26 ? 0.0 : intermediateValue72;
            intermediateValue87 = comparisonValue26 ? 0.0 : intermediateValue74;
        }
        float dotProductValue1 = dot(vec3(productValue44, productValue45, productValue46), vec3(ViewCB.packedValues[52u].xyz));
        float dotProductValue2 = dotProductValue1 * dot(vec3(intermediateValue85, intermediateValue86, intermediateValue87), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float productValue108;
        float productValue109;
        float productValue110;
        if (dotProductValue2 > 0.0)
        {
            float sumValue173 = ViewCB.packedValues[52u].x + productValue44;
            float sumValue174 = ViewCB.packedValues[52u].y + productValue45;
            float sumValue175 = ViewCB.packedValues[52u].z + productValue46;
            float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue173, sumValue174, sumValue175), vec3(sumValue173, sumValue174, sumValue175)));
            float scalarValue46 = spvNClamp(dotProductValue1, 0.0, 1.0);
            float dotProductValue3 = spvNClamp(dot(vec3(productValue44, productValue45, productValue46), vec3(productValue44, productValue45, productValue46)), 0.0, 1.0);
            float dotProductValue4 = spvNClamp(dot(vec3(productValue44, productValue45, productValue46), vec3(inverseLengthValue1 * sumValue173, inverseLengthValue1 * sumValue174, inverseLengthValue1 * sumValue175)), 0.0, 1.0);
            float dotProductValue5 = spvNClamp(dot(vec3(productValue58, productValue59, productValue60), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
            float exponentialValue4 = exp2(log2(spvNClamp(1.0 - dotProductValue4, 0.0, 1.0)) * 5.0);
            float productValue219 = (exponentialValue4 * (dotProductValue5 - productValue58)) + productValue58;
            float productValue220 = (exponentialValue4 * (dotProductValue5 - productValue59)) + productValue59;
            float productValue221 = (exponentialValue4 * (dotProductValue5 - productValue60)) + productValue60;
            float productValue222 = ((dotProductValue4 * dotProductValue4) * 2.0) + (-0.5);
            float exponentialValue5 = (((exp2(log2(spvNClamp(1.0 - dotProductValue3, 0.0, 1.0)) * 5.0) * productValue222) + 1.0) * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - scalarValue46, 0.0, 1.0)) * 5.0) * productValue222) + 1.0);
            float quotientValue = 0.079577468335628509521484375 / ((((dotProductValue3 * 0.5) + 0.5) * ((scalarValue46 * 0.5) + 0.5)) + 1.0000000133514319600180897396058e-10);
            productValue108 = ((ViewCB.packedValues[50u].x * intermediateValue85) * scalarValue46) * ((((1.0 - productValue219) * productValue61) * exponentialValue5) + (productValue219 * quotientValue));
            productValue109 = ((ViewCB.packedValues[50u].y * intermediateValue86) * scalarValue46) * ((((1.0 - productValue220) * productValue62) * exponentialValue5) + (productValue220 * quotientValue));
            productValue110 = ((ViewCB.packedValues[50u].z * intermediateValue87) * scalarValue46) * ((((1.0 - productValue221) * productValue63) * exponentialValue5) + (productValue221 * quotientValue));
        }
        else
        {
            productValue108 = 0.0;
            productValue109 = 0.0;
            productValue110 = 0.0;
        }
        float productValue127;
        float productValue128;
        float productValue129;
        if (dotProductValue2 < (-0.0))
        {
            float sumValue176 = (-0.0) - productValue44;
            float sumValue177 = (-0.0) - productValue45;
            float sumValue178 = (-0.0) - productValue46;
            float sumValue179 = ViewCB.packedValues[52u].x + productValue44;
            float sumValue180 = ViewCB.packedValues[52u].y + productValue45;
            float sumValue181 = ViewCB.packedValues[52u].z + productValue46;
            float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue179, sumValue180, sumValue181), vec3(sumValue179, sumValue180, sumValue181)));
            float dotProductValue6 = spvNClamp(dot(vec3(sumValue176, sumValue177, sumValue178), vec3(ViewCB.packedValues[52u].xyz)), 0.0, 1.0);
            float dotProductValue7 = spvNClamp(dot(vec3(sumValue176, sumValue177, sumValue178), vec3(productValue44, productValue45, productValue46)), 0.0, 1.0);
            float dotProductValue8 = spvNClamp(dot(vec3(productValue44, productValue45, productValue46), vec3(inverseLengthValue2 * sumValue179, inverseLengthValue2 * sumValue180, inverseLengthValue2 * sumValue181)), 0.0, 1.0);
            float dotProductValue9 = spvNClamp(dot(vec3(productValue58, productValue59, productValue60), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
            float exponentialValue6 = exp2(log2(spvNClamp(1.0 - dotProductValue8, 0.0, 1.0)) * 5.0);
            float productValue223 = (exponentialValue6 * (dotProductValue9 - productValue58)) + productValue58;
            float productValue224 = (exponentialValue6 * (dotProductValue9 - productValue59)) + productValue59;
            float productValue225 = (exponentialValue6 * (dotProductValue9 - productValue60)) + productValue60;
            float productValue226 = ((dotProductValue8 * dotProductValue8) * 2.0) + (-0.5);
            float exponentialValue7 = (((exp2(log2(spvNClamp(1.0 - dotProductValue7, 0.0, 1.0)) * 5.0) * productValue226) + 1.0) * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - dotProductValue6, 0.0, 1.0)) * 5.0) * productValue226) + 1.0);
            float quotientValue1 = 0.079577468335628509521484375 / ((((dotProductValue7 * 0.5) + 0.5) * ((dotProductValue6 * 0.5) + 0.5)) + 1.0000000133514319600180897396058e-10);
            productValue127 = ((ViewCB.packedValues[50u].x * intermediateValue85) * dotProductValue6) * ((((1.0 - productValue223) * productValue61) * exponentialValue7) + (productValue223 * quotientValue1));
            productValue128 = ((ViewCB.packedValues[50u].y * intermediateValue86) * dotProductValue6) * ((((1.0 - productValue224) * productValue62) * exponentialValue7) + (productValue224 * quotientValue1));
            productValue129 = ((ViewCB.packedValues[50u].z * intermediateValue87) * dotProductValue6) * ((((1.0 - productValue225) * productValue63) * exponentialValue7) + (productValue225 * quotientValue1));
        }
        else
        {
            productValue127 = 0.0;
            productValue128 = 0.0;
            productValue129 = 0.0;
        }
        float productValue227 = ViewCB.packedValues[85u].y * productValue55;
        float productValue228 = ViewCB.packedValues[85u].y * productValue56;
        float productValue229 = ViewCB.packedValues[85u].y * productValue57;
        float productValue230 = (productValue108 + (productValue61 * intermediateValue15)) + productValue227;
        float productValue231 = (productValue109 + (productValue62 * intermediateValue16)) + productValue228;
        float productValue232 = (productValue110 + (productValue63 * intermediateValue17)) + productValue229;
        float productValue233 = (productValue127 + (productValue61 * intermediateValue18)) + productValue227;
        float productValue234 = (productValue128 + (productValue62 * intermediateValue19)) + productValue228;
        float productValue235 = (productValue129 + (productValue63 * intermediateValue20)) + productValue229;
        uint productValue236 = uint(objectInstances.packedValues[(bitwiseValue2 * 76u) + 54u]) + 0u;
        uint productValue237 = (bitwiseValue3 * 8u) + 4u;
        if (!((((floatBitsToUint(productValue232) & 2147483647u) > 2139095040u) || (((floatBitsToUint(productValue230) & 2147483647u) > 2139095040u) || ((floatBitsToUint(productValue231) & 2147483647u) > 2139095040u))) || (((floatBitsToUint(productValue235) & 2147483647u) > 2139095040u) || (((floatBitsToUint(productValue233) & 2147483647u) > 2139095040u) || ((floatBitsToUint(productValue234) & 2147483647u) > 2139095040u)))))
        {
            u16vec4 productValue140 = faceIrradianceCache_2[nonuniformEXT(productValue236)].packedValues[bitwiseValue3 * 2u];
            f16vec4 intermediateValue128 = uint16BitsToFloat16(productValue140);
            uint16_t scalarValue47 = faceIrradianceCache[nonuniformEXT(productValue236)].packedValues[productValue237];
            uint16_t sumValue182 = faceIrradianceCache[nonuniformEXT(productValue236)].packedValues[productValue237 + 1u];
            uint16_t sumValue183 = faceIrradianceCache[nonuniformEXT(productValue236)].packedValues[productValue237 + 2u];
            f16vec3 intermediateValue130 = uint16BitsToFloat16(u16vec3(scalarValue47, sumValue182, sumValue183));
            float sumValue184 = float(min((uint(intermediateValue128.w) + 1u), 4u));
            float quotientValue2 = 1.0 / sumValue184;
            float scalarValue48 = float(intermediateValue128.x);
            float scalarValue49 = float(intermediateValue128.y);
            float scalarValue50 = float(intermediateValue128.z);
            float scalarValue51 = float(intermediateValue130.x);
            float scalarValue52 = float(intermediateValue130.y);
            float scalarValue53 = float(intermediateValue130.z);
            faceIrradianceCache_2[nonuniformEXT(productValue236)].packedValues[bitwiseValue3 * 2u] = u16vec4(float16BitsToUint16(float16_t((quotientValue2 * (productValue230 - scalarValue48)) + scalarValue48)), float16BitsToUint16(float16_t((quotientValue2 * (productValue231 - scalarValue49)) + scalarValue49)), float16BitsToUint16(float16_t((quotientValue2 * (productValue232 - scalarValue50)) + scalarValue50)), float16BitsToUint16(float16_t(uint(sumValue184))));
            faceIrradianceCache_2[nonuniformEXT(productValue236)].packedValues[(bitwiseValue3 * 2u) + 1u] = u16vec4(float16BitsToUint16(float16_t((quotientValue2 * (productValue233 - scalarValue51)) + scalarValue51)), float16BitsToUint16(float16_t((quotientValue2 * (productValue234 - scalarValue52)) + scalarValue52)), float16BitsToUint16(float16_t((quotientValue2 * (productValue235 - scalarValue53)) + scalarValue53)), float16BitsToUint16(float16_t(0.0)));
        }
    }
}
