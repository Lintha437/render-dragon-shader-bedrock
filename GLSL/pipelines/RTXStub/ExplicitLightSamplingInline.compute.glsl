#version 460
#extension GL_GOOGLE_include_directive : require
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
#extension GL_EXT_scalar_block_layout : require
#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH [[dont_flatten]]
#define SPIRV_CROSS_UNROLL [[unroll]]
#define SPIRV_CROSS_LOOP [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#define RD_USE_DIVIDE_UNSIGNED_UINT_11 1
#define RD_USE_MODULO_UNSIGNED_UINT_10 1

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

#include "../../include/Math.glsli"
void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue = reinterpretedBits.z;
    uint bitwiseValue = gl_WorkGroupID.y >> 4u;
    uint bitwiseValue1 = ((scalarValue & 1023u) * (gl_WorkGroupID.y & 15u)) + gl_WorkGroupID.x;
    uint comparisonValue = (bitwiseValue == ((scalarValue >> 14u) & 63u)) ? ((scalarValue >> 10u) & 15u) : 16u;
    uint bitwiseValue2 = (rdDivideUnsigned(bitwiseValue1, comparisonValue) << 2u) + gl_LocalInvocationID.x;
    uint bitwiseValue3 = ((rdModuloUnsigned(bitwiseValue1, comparisonValue) + (bitwiseValue << 4u)) << 3u) + gl_LocalInvocationID.y;
    bool reinterpretedBits1 = floatBitsToUint(ViewCB.packedValues[96u]).x != 0u;
    float reinterpretedBits2 = uintBitsToFloat(inputIncidentLight.packedValues[0u]);
    imageStore(outputBufferIndirectSpecular, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0));
    if (!(texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u)).x == 65504.0))
    {
        vec4 sampledTextureValue = texelFetch(inputBufferColourAndMetallic, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue1 = sampledTextureValue.y;
        float scalarValue2 = sampledTextureValue.z;
        float scalarValue3 = sampledTextureValue.w;
        vec4 sampledTextureValue1 = texelFetch(inputBufferNormal, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue4 = sampledTextureValue1.x;
        float scalarValue5 = sampledTextureValue1.y;
        float sumValue = 1.0 - abs(scalarValue4);
        float scalarValue6 = abs(scalarValue5);
        float sumValue1 = sumValue - scalarValue6;
        bool conditionValue = sumValue1 < 0.0;
        float comparisonValue1 = conditionValue ? ((1.0 - scalarValue6) * ((scalarValue4 >= 0.0) ? 1.0 : (-1.0))) : scalarValue4;
        float comparisonValue2 = conditionValue ? (((scalarValue5 >= 0.0) ? 1.0 : (-1.0)) * sumValue) : scalarValue5;
        float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue1, comparisonValue2, sumValue1), vec3(comparisonValue1, comparisonValue2, sumValue1)));
        float productValue = comparisonValue1 * inverseLengthValue;
        float productValue1 = comparisonValue2 * inverseLengthValue;
        float productValue2 = inverseLengthValue * sumValue1;
        float comparisonValue3 = ((productValue2 != 0.0) || ((productValue != 0.0) || (productValue1 != 0.0))) ? productValue2 : 1.0;
        float inverseLengthValue1 = inversesqrt(dot(vec3(productValue, productValue1, comparisonValue3), vec3(productValue, productValue1, comparisonValue3)));
        vec4 sampledTextureValue2 = texelFetch(inputEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue7 = sampledTextureValue2.w;
        float productValue3 = (((scalarValue1 * scalarValue1) + (-0.039999999105930328369140625)) * scalarValue3) + 0.039999999105930328369140625;
        vec4 sampledTextureValue3 = texelFetch(inputGeometryNormal, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue8 = sampledTextureValue3.x;
        float scalarValue9 = sampledTextureValue3.y;
        precise float sumValue2 = 1.0 - abs(scalarValue8);
        float scalarValue10 = abs(scalarValue9);
        precise float sumValue3 = sumValue2 - scalarValue10;
        bool conditionValue1 = sumValue3 < 0.0;
        precise float sumValue4 = 1.0 - scalarValue10;
        precise float comparisonValue4 = ((scalarValue8 >= 0.0) ? 1.0 : (-1.0)) * sumValue4;
        precise float comparisonValue5 = sumValue2 * ((scalarValue9 >= 0.0) ? 1.0 : (-1.0));
        float comparisonValue6 = conditionValue1 ? comparisonValue4 : scalarValue8;
        float comparisonValue7 = conditionValue1 ? comparisonValue5 : scalarValue9;
        float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, sumValue3), vec3(comparisonValue6, comparisonValue7, sumValue3)));
        precise float productValue4 = inverseLengthValue2 * comparisonValue7;
        vec4 sampledTextureValue4 = texelFetch(inputPrimaryWorldPosition, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue11 = sampledTextureValue4.y;
        float scalarValue12 = sampledTextureValue4.z;
        precise float sumValue5 = scalarValue11 + 0.0;
        vec4 sampledTextureValue5 = texelFetch(inputPrimaryViewDirection, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue13 = sampledTextureValue5.x;
        float scalarValue14 = sampledTextureValue5.z;
        float sumValue6 = (-0.0) - scalarValue13;
        float sumValue7 = (-0.0) - scalarValue14;
        float comparisonValue8 = reinterpretedBits1 ? productValue4 : (productValue1 * inverseLengthValue1);
        uint productValue5 = (uint(ViewCB.packedValues[78u].x) * bitwiseValue3) + bitwiseValue2;
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
        uvec4 reinterpretedBits3 = floatBitsToUint(ViewCB.packedValues[84u]);
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
        float scalarValue16 = sampledTextureValue.x;
        float productValue6 = (((scalarValue16 * scalarValue16) + (-0.039999999105930328369140625)) * scalarValue3) + 0.039999999105930328369140625;
        float productValue7 = (((scalarValue2 * scalarValue2) + (-0.039999999105930328369140625)) * scalarValue3) + 0.039999999105930328369140625;
        precise float productValue8 = inverseLengthValue2 * comparisonValue6;
        precise float productValue9 = sumValue3 * inverseLengthValue2;
        float scalarValue17 = sampledTextureValue4.x;
        precise float sumValue10 = scalarValue17 + 0.0;
        precise float sumValue11 = scalarValue12 + 0.0;
        float scalarValue18 = sampledTextureValue5.y;
        float sumValue12 = (-0.0) - scalarValue18;
        float comparisonValue9 = reinterpretedBits1 ? productValue8 : (inverseLengthValue1 * productValue);
        float comparisonValue10 = reinterpretedBits1 ? productValue9 : (comparisonValue3 * inverseLengthValue1);
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
        uint intermediateValue29;
        float intermediateValue31;
        float intermediateValue32;
        float intermediateValue33;
        if (floatBitsToUint(ViewCB.packedValues[92u]).w == 0u)
        {
            intermediateValue26 = 0.0;
            intermediateValue27 = 0.0;
            intermediateValue28 = 0.0;
            intermediateValue29 = 0u;
            intermediateValue31 = 0.0;
            intermediateValue32 = 0.0;
            intermediateValue33 = 0.0;
        }
        else
        {
            uint intermediateValue[8];
            intermediateValue[0u] = 0u;
            uint bitwiseValue20 = bitwiseValue2 & 255u;
            uint bitwiseValue21 = bitwiseValue3 & 255u;
            uint bitwiseValue22 = (scalarValue15 << 1u) & 126u;
            vec4 sampledTextureValue6 = texelFetch(blueNoiseTexture, ivec3(uvec3(bitwiseValue20, bitwiseValue21, bitwiseValue22)), int(0u));
            uvec4 reinterpretedBits4 = floatBitsToUint(ViewCB.packedValues[96u]);
            uint scalarValue19 = reinterpretedBits4.w;
            uint sumValue13 = scalarValue19 + 4294967295u;
            float scalarValue20 = float(scalarValue19);
            precise float productValue10 = sampledTextureValue6.x * scalarValue20;
            uint scalarValue21 = min(uint(int(productValue10)), sumValue13);
            f16vec3 productValue14 = uint16BitsToFloat16(inputReducedLightsBuffer.packedValues[scalarValue21 * 2u]);
            precise float sumValue14 = float(productValue14.x) - sumValue10;
            precise float sumValue15 = float(productValue14.y) - sumValue5;
            precise float sumValue16 = float(productValue14.z) - sumValue11;
            precise float dotProductValue = dot(vec3(sumValue14, sumValue15, sumValue16), vec3(sumValue14, sumValue15, sumValue16));
            precise float quotientValue = 1.0 / dotProductValue;
            float comparisonValue11 = (int(inputReducedLightsBuffer_2.packedValues[(scalarValue21 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
            precise float productValue11 = comparisonValue11 * comparisonValue11;
            float intermediateValue37;
            if (dotProductValue > productValue11)
            {
                float inverseLengthValue3 = inversesqrt(dotProductValue);
                precise float productValue12 = sumValue14 * inverseLengthValue3;
                precise float productValue13 = sumValue15 * inverseLengthValue3;
                precise float productValue15 = sumValue16 * inverseLengthValue3;
                precise float dotProductValue1 = quotientValue * spvNMax(0.0, dot(vec3(productValue8, productValue4, productValue9), vec3(productValue12, productValue13, productValue15)));
                intermediateValue37 = dotProductValue1;
            }
            else
            {
                intermediateValue37 = quotientValue;
            }
            float intermediateValue42;
            uint intermediateValue43;
            float intermediateValue44;
            if (intermediateValue37 > 0.0)
            {
                intermediateValue[0u] = scalarValue21;
                intermediateValue42 = intermediateValue37;
                intermediateValue43 = 1u;
                intermediateValue44 = intermediateValue37;
            }
            else
            {
                intermediateValue42 = -1.0;
                intermediateValue43 = 0u;
                intermediateValue44 = 0.0;
            }
            intermediateValue[1u] = 0u;
            precise float productValue16 = sampledTextureValue6.y * scalarValue20;
            uint scalarValue22 = min(uint(int(productValue16)), sumValue13);
            f16vec3 productValue40 = uint16BitsToFloat16(inputReducedLightsBuffer.packedValues[scalarValue22 * 2u]);
            precise float sumValue17 = float(productValue40.x) - sumValue10;
            precise float sumValue18 = float(productValue40.y) - sumValue5;
            precise float sumValue19 = float(productValue40.z) - sumValue11;
            precise float dotProductValue2 = dot(vec3(sumValue17, sumValue18, sumValue19), vec3(sumValue17, sumValue18, sumValue19));
            precise float quotientValue1 = 1.0 / dotProductValue2;
            float comparisonValue12 = (int(inputReducedLightsBuffer_2.packedValues[(scalarValue22 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
            precise float productValue17 = comparisonValue12 * comparisonValue12;
            float intermediateValue47;
            if (dotProductValue2 > productValue17)
            {
                float inverseLengthValue4 = inversesqrt(dotProductValue2);
                precise float productValue18 = sumValue17 * inverseLengthValue4;
                precise float productValue19 = sumValue18 * inverseLengthValue4;
                precise float productValue20 = sumValue19 * inverseLengthValue4;
                precise float dotProductValue3 = quotientValue1 * spvNMax(0.0, dot(vec3(productValue8, productValue4, productValue9), vec3(productValue18, productValue19, productValue20)));
                intermediateValue47 = dotProductValue3;
            }
            else
            {
                intermediateValue47 = quotientValue1;
            }
            float intermediateValue49;
            uint sumValue30;
            float intermediateValue50;
            if (intermediateValue47 > 0.0)
            {
                float sumValue20 = intermediateValue47 + intermediateValue44;
                intermediateValue[1u] = scalarValue22;
                intermediateValue49 = sumValue20;
                sumValue30 = intermediateValue43 + 1u;
                intermediateValue50 = sumValue20;
            }
            else
            {
                intermediateValue49 = -1.0;
                sumValue30 = intermediateValue43;
                intermediateValue50 = intermediateValue44;
            }
            intermediateValue[2u] = 0u;
            precise float productValue21 = sampledTextureValue6.z * scalarValue20;
            uint scalarValue23 = min(uint(int(productValue21)), sumValue13);
            f16vec3 productValue55 = uint16BitsToFloat16(inputReducedLightsBuffer.packedValues[scalarValue23 * 2u]);
            precise float sumValue21 = float(productValue55.x) - sumValue10;
            precise float sumValue22 = float(productValue55.y) - sumValue5;
            precise float sumValue23 = float(productValue55.z) - sumValue11;
            precise float dotProductValue4 = dot(vec3(sumValue21, sumValue22, sumValue23), vec3(sumValue21, sumValue22, sumValue23));
            precise float quotientValue2 = 1.0 / dotProductValue4;
            float comparisonValue13 = (int(inputReducedLightsBuffer_2.packedValues[(scalarValue23 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
            precise float productValue22 = comparisonValue13 * comparisonValue13;
            float intermediateValue52;
            if (dotProductValue4 > productValue22)
            {
                float inverseLengthValue5 = inversesqrt(dotProductValue4);
                precise float productValue23 = sumValue21 * inverseLengthValue5;
                precise float productValue24 = sumValue22 * inverseLengthValue5;
                precise float productValue25 = sumValue23 * inverseLengthValue5;
                precise float dotProductValue5 = quotientValue2 * spvNMax(0.0, dot(vec3(productValue8, productValue4, productValue9), vec3(productValue23, productValue24, productValue25)));
                intermediateValue52 = dotProductValue5;
            }
            else
            {
                intermediateValue52 = quotientValue2;
            }
            float intermediateValue54;
            uint sumValue35;
            float intermediateValue55;
            if (intermediateValue52 > 0.0)
            {
                float sumValue24 = intermediateValue52 + intermediateValue50;
                intermediateValue[2u] = scalarValue23;
                intermediateValue54 = sumValue24;
                sumValue35 = sumValue30 + 1u;
                intermediateValue55 = sumValue24;
            }
            else
            {
                intermediateValue54 = -1.0;
                sumValue35 = sumValue30;
                intermediateValue55 = intermediateValue50;
            }
            intermediateValue[3u] = 0u;
            precise float productValue26 = sampledTextureValue6.w * scalarValue20;
            uint scalarValue24 = min(uint(int(productValue26)), sumValue13);
            f16vec3 productValue64 = uint16BitsToFloat16(inputReducedLightsBuffer.packedValues[scalarValue24 * 2u]);
            precise float sumValue25 = float(productValue64.x) - sumValue10;
            precise float sumValue26 = float(productValue64.y) - sumValue5;
            precise float sumValue27 = float(productValue64.z) - sumValue11;
            precise float dotProductValue6 = dot(vec3(sumValue25, sumValue26, sumValue27), vec3(sumValue25, sumValue26, sumValue27));
            precise float quotientValue3 = 1.0 / dotProductValue6;
            float comparisonValue14 = (int(inputReducedLightsBuffer_2.packedValues[(scalarValue24 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
            precise float productValue27 = comparisonValue14 * comparisonValue14;
            float intermediateValue57;
            if (dotProductValue6 > productValue27)
            {
                float inverseLengthValue6 = inversesqrt(dotProductValue6);
                precise float productValue34 = sumValue25 * inverseLengthValue6;
                precise float productValue35 = sumValue26 * inverseLengthValue6;
                precise float productValue36 = sumValue27 * inverseLengthValue6;
                precise float dotProductValue7 = quotientValue3 * spvNMax(0.0, dot(vec3(productValue8, productValue4, productValue9), vec3(productValue34, productValue35, productValue36)));
                intermediateValue57 = dotProductValue7;
            }
            else
            {
                intermediateValue57 = quotientValue3;
            }
            float intermediateValue58;
            uint sumValue40;
            float intermediateValue59;
            if (intermediateValue57 > 0.0)
            {
                float sumValue28 = intermediateValue57 + intermediateValue55;
                intermediateValue[3u] = scalarValue24;
                intermediateValue58 = sumValue28;
                sumValue40 = sumValue35 + 1u;
                intermediateValue59 = sumValue28;
            }
            else
            {
                intermediateValue58 = -1.0;
                sumValue40 = sumValue35;
                intermediateValue59 = intermediateValue55;
            }
            intermediateValue[4u] = 0u;
            vec4 sampledTextureValue7 = texelFetch(blueNoiseTexture, ivec3(uvec3(bitwiseValue20, bitwiseValue21, bitwiseValue22 | 1u)), int(0u));
            precise float productValue37 = scalarValue20 * sampledTextureValue7.x;
            uint scalarValue25 = min(uint(int(productValue37)), sumValue13);
            f16vec3 productValue70 = uint16BitsToFloat16(inputReducedLightsBuffer.packedValues[scalarValue25 * 2u]);
            precise float sumValue29 = float(productValue70.x) - sumValue10;
            precise float sumValue31 = float(productValue70.y) - sumValue5;
            precise float sumValue32 = float(productValue70.z) - sumValue11;
            precise float dotProductValue8 = dot(vec3(sumValue29, sumValue31, sumValue32), vec3(sumValue29, sumValue31, sumValue32));
            precise float quotientValue4 = 1.0 / dotProductValue8;
            float comparisonValue15 = (int(inputReducedLightsBuffer_2.packedValues[(scalarValue25 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
            precise float productValue38 = comparisonValue15 * comparisonValue15;
            float intermediateValue61;
            if (dotProductValue8 > productValue38)
            {
                float inverseLengthValue7 = inversesqrt(dotProductValue8);
                precise float productValue39 = sumValue29 * inverseLengthValue7;
                precise float productValue41 = sumValue31 * inverseLengthValue7;
                precise float productValue42 = sumValue32 * inverseLengthValue7;
                precise float dotProductValue9 = quotientValue4 * spvNMax(0.0, dot(vec3(productValue8, productValue4, productValue9), vec3(productValue39, productValue41, productValue42)));
                intermediateValue61 = dotProductValue9;
            }
            else
            {
                intermediateValue61 = quotientValue4;
            }
            float intermediateValue62;
            uint sumValue45;
            float intermediateValue63;
            if (intermediateValue61 > 0.0)
            {
                float sumValue33 = intermediateValue61 + intermediateValue59;
                intermediateValue[4u] = scalarValue25;
                intermediateValue62 = sumValue33;
                sumValue45 = sumValue40 + 1u;
                intermediateValue63 = sumValue33;
            }
            else
            {
                intermediateValue62 = -1.0;
                sumValue45 = sumValue40;
                intermediateValue63 = intermediateValue59;
            }
            intermediateValue[5u] = 0u;
            precise float productValue43 = scalarValue20 * sampledTextureValue7.y;
            uint scalarValue26 = min(uint(int(productValue43)), sumValue13);
            f16vec3 productValue76 = uint16BitsToFloat16(inputReducedLightsBuffer.packedValues[scalarValue26 * 2u]);
            precise float sumValue34 = float(productValue76.x) - sumValue10;
            precise float sumValue36 = float(productValue76.y) - sumValue5;
            precise float sumValue37 = float(productValue76.z) - sumValue11;
            precise float dotProductValue10 = dot(vec3(sumValue34, sumValue36, sumValue37), vec3(sumValue34, sumValue36, sumValue37));
            precise float quotientValue5 = 1.0 / dotProductValue10;
            float comparisonValue16 = (int(inputReducedLightsBuffer_2.packedValues[(scalarValue26 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
            precise float productValue44 = comparisonValue16 * comparisonValue16;
            float intermediateValue65;
            if (dotProductValue10 > productValue44)
            {
                float inverseLengthValue8 = inversesqrt(dotProductValue10);
                precise float productValue45 = sumValue34 * inverseLengthValue8;
                precise float productValue46 = sumValue36 * inverseLengthValue8;
                precise float productValue47 = sumValue37 * inverseLengthValue8;
                precise float dotProductValue11 = quotientValue5 * spvNMax(0.0, dot(vec3(productValue8, productValue4, productValue9), vec3(productValue45, productValue46, productValue47)));
                intermediateValue65 = dotProductValue11;
            }
            else
            {
                intermediateValue65 = quotientValue5;
            }
            float intermediateValue66;
            uint sumValue50;
            float intermediateValue67;
            if (intermediateValue65 > 0.0)
            {
                float sumValue38 = intermediateValue65 + intermediateValue63;
                intermediateValue[5u] = scalarValue26;
                intermediateValue66 = sumValue38;
                sumValue50 = sumValue45 + 1u;
                intermediateValue67 = sumValue38;
            }
            else
            {
                intermediateValue66 = -1.0;
                sumValue50 = sumValue45;
                intermediateValue67 = intermediateValue63;
            }
            intermediateValue[6u] = 0u;
            precise float productValue48 = scalarValue20 * sampledTextureValue7.z;
            uint scalarValue27 = min(uint(int(productValue48)), sumValue13);
            f16vec3 productValue82 = uint16BitsToFloat16(inputReducedLightsBuffer.packedValues[scalarValue27 * 2u]);
            precise float sumValue39 = float(productValue82.x) - sumValue10;
            precise float sumValue41 = float(productValue82.y) - sumValue5;
            precise float sumValue42 = float(productValue82.z) - sumValue11;
            precise float dotProductValue12 = dot(vec3(sumValue39, sumValue41, sumValue42), vec3(sumValue39, sumValue41, sumValue42));
            precise float quotientValue6 = 1.0 / dotProductValue12;
            float comparisonValue17 = (int(inputReducedLightsBuffer_2.packedValues[(scalarValue27 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
            precise float productValue49 = comparisonValue17 * comparisonValue17;
            float intermediateValue69;
            if (dotProductValue12 > productValue49)
            {
                float inverseLengthValue9 = inversesqrt(dotProductValue12);
                precise float productValue50 = sumValue39 * inverseLengthValue9;
                precise float productValue51 = sumValue41 * inverseLengthValue9;
                precise float productValue52 = sumValue42 * inverseLengthValue9;
                precise float dotProductValue13 = quotientValue6 * spvNMax(0.0, dot(vec3(productValue8, productValue4, productValue9), vec3(productValue50, productValue51, productValue52)));
                intermediateValue69 = dotProductValue13;
            }
            else
            {
                intermediateValue69 = quotientValue6;
            }
            float intermediateValue70;
            uint sumValue55;
            float intermediateValue71;
            if (intermediateValue69 > 0.0)
            {
                float sumValue43 = intermediateValue69 + intermediateValue67;
                intermediateValue[6u] = scalarValue27;
                intermediateValue70 = sumValue43;
                sumValue55 = sumValue50 + 1u;
                intermediateValue71 = sumValue43;
            }
            else
            {
                intermediateValue70 = -1.0;
                sumValue55 = sumValue50;
                intermediateValue71 = intermediateValue67;
            }
            intermediateValue[7u] = 0u;
            precise float productValue53 = scalarValue20 * sampledTextureValue7.w;
            uint scalarValue28 = min(uint(int(productValue53)), sumValue13);
            f16vec3 productValue88 = uint16BitsToFloat16(inputReducedLightsBuffer.packedValues[scalarValue28 * 2u]);
            precise float sumValue44 = float(productValue88.x) - sumValue10;
            precise float sumValue46 = float(productValue88.y) - sumValue5;
            precise float sumValue47 = float(productValue88.z) - sumValue11;
            precise float dotProductValue14 = dot(vec3(sumValue44, sumValue46, sumValue47), vec3(sumValue44, sumValue46, sumValue47));
            precise float quotientValue7 = 1.0 / dotProductValue14;
            float comparisonValue18 = (int(inputReducedLightsBuffer_2.packedValues[(scalarValue28 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
            precise float productValue54 = comparisonValue18 * comparisonValue18;
            float intermediateValue73;
            if (dotProductValue14 > productValue54)
            {
                float inverseLengthValue10 = inversesqrt(dotProductValue14);
                precise float productValue56 = sumValue44 * inverseLengthValue10;
                precise float productValue57 = sumValue46 * inverseLengthValue10;
                precise float productValue58 = sumValue47 * inverseLengthValue10;
                precise float dotProductValue15 = quotientValue7 * spvNMax(0.0, dot(vec3(productValue8, productValue4, productValue9), vec3(productValue56, productValue57, productValue58)));
                intermediateValue73 = dotProductValue15;
            }
            else
            {
                intermediateValue73 = quotientValue7;
            }
            float intermediateValue74;
            uint sumValue60;
            float intermediateValue75;
            if (intermediateValue73 > 0.0)
            {
                float sumValue48 = intermediateValue73 + intermediateValue71;
                intermediateValue[7u] = scalarValue28;
                intermediateValue74 = sumValue48;
                sumValue60 = sumValue55 + 1u;
                intermediateValue75 = sumValue48;
            }
            else
            {
                intermediateValue74 = -1.0;
                sumValue60 = sumValue55;
                intermediateValue75 = intermediateValue71;
            }
            bool comparisonValue19 = sumValue60 == 0u;
            float intermediateValue76;
            uint intermediateValue78;
            uint intermediateValue79;
            float16_t intermediateValue80;
            float16_t intermediateValue82;
            float16_t intermediateValue84;
            if (comparisonValue19)
            {
                intermediateValue76 = intermediateValue77;
                intermediateValue78 = bitwiseValue18;
                intermediateValue79 = 0u;
                intermediateValue80 = float16_t(0.0);
                intermediateValue82 = float16_t(0.0);
                intermediateValue84 = float16_t(0.0);
            }
            else
            {
                uint intermediateValue91;
                uint productValue93;
                float bitwiseValue23;
                bool intermediateValue86;
                for (;;)
                {
                    productValue93 = (bitwiseValue18 * 1664525u) + 1013904223u;
                    bitwiseValue23 = (float(productValue93 & 16777215u) * 5.9604584379258085391484200954437e-08) * intermediateValue75;
                    intermediateValue86 = intermediateValue42 > bitwiseValue23;
                    uint intermediateValue89;
                    if (intermediateValue86)
                    {
                        intermediateValue89 = 0u;
                    }
                    else
                    {
                        uint branchMergedValue3;
                        if (intermediateValue49 > bitwiseValue23)
                        {
                            branchMergedValue3 = 1u;
                        }
                        else
                        {
                            uint branchMergedValue11;
                            if (intermediateValue54 > bitwiseValue23)
                            {
                                branchMergedValue11 = 2u;
                            }
                            else
                            {
                                uint branchMergedValue18;
                                if (intermediateValue58 > bitwiseValue23)
                                {
                                    branchMergedValue18 = 3u;
                                }
                                else
                                {
                                    uint branchMergedValue19;
                                    if (intermediateValue62 > bitwiseValue23)
                                    {
                                        branchMergedValue19 = 4u;
                                    }
                                    else
                                    {
                                        uint branchMergedValue20;
                                        if (intermediateValue66 > bitwiseValue23)
                                        {
                                            branchMergedValue20 = 5u;
                                        }
                                        else
                                        {
                                            uint branchMergedValue21;
                                            if (intermediateValue70 > bitwiseValue23)
                                            {
                                                branchMergedValue21 = 6u;
                                            }
                                            else
                                            {
                                                if (!(intermediateValue74 > bitwiseValue23))
                                                {
                                                    intermediateValue91 = 0u;
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
                        intermediateValue89 = branchMergedValue3;
                    }
                    intermediateValue91 = intermediateValue[intermediateValue89];
                    break;
                }
                f16vec3 productValue101 = uint16BitsToFloat16(inputReducedLightsBuffer.packedValues[intermediateValue91 * 2u]);
                float16_t scalarValue29 = productValue101.x;
                float16_t scalarValue30 = productValue101.y;
                float16_t scalarValue31 = productValue101.z;
                float sumValue49 = float(scalarValue29) - scalarValue17;
                float sumValue51 = float(scalarValue30) - scalarValue11;
                float sumValue52 = float(scalarValue31) - scalarValue12;
                intermediateValue76 = 1.0 / (ViewCB.packedValues[96u].z * dot(vec3(sumValue49, sumValue51, sumValue52), vec3(sumValue49, sumValue51, sumValue52)));
                intermediateValue78 = productValue93;
                intermediateValue79 = inputReducedLightsBuffer_2.packedValues[(intermediateValue91 * 3u) + 2u];
                intermediateValue80 = scalarValue29;
                intermediateValue82 = scalarValue30;
                intermediateValue84 = scalarValue31;
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
                branchMergedValue = 0.0;
                branchMergedValue4 = 0.0;
                branchMergedValue5 = 0.0;
                branchMergedValue6 = 0u;
                branchMergedValue7 = 0.0;
                branchMergedValue8 = 0.0;
                branchMergedValue9 = 0.0;
            }
            else
            {
                float comparisonValue20 = (int(intermediateValue79) < int(0u)) ? 0.23000000417232513427734375 : 0.115000002086162567138671875;
                float bitwiseValue24 = float(((intermediateValue78 * 1664525u) + 7271263u) & 16777215u);
                float productValue59 = bitwiseValue24 * 0.002414158545434474945068359375;
                float productValue60 = (productValue59 - floor(productValue59)) * 6.283185482025146484375;
                float productValue61 = 0.9999847412109375 - (bitwiseValue24 * 1.1920928955078125e-07);
                float nonlinearValue = sqrt(spvNClamp(1.0 - (productValue61 * productValue61), 0.0, 1.0)) * comparisonValue20;
                float wavePhaseValue = nonlinearValue * cos(productValue60);
                float wavePhaseValue1 = sin(productValue60) * nonlinearValue;
                float productValue62 = productValue61 * comparisonValue20;
                bool dotProductValue16 = dot(vec3(wavePhaseValue, wavePhaseValue1, productValue62), vec3(float(intermediateValue80) - scalarValue17, float(intermediateValue82) - scalarValue11, float(intermediateValue84) - scalarValue12)) > 0.0;
                float comparisonValue21 = float(float16_t(dotProductValue16 ? ((-0.0) - wavePhaseValue) : wavePhaseValue) + intermediateValue80) - scalarValue17;
                float comparisonValue22 = float(float16_t(dotProductValue16 ? ((-0.0) - wavePhaseValue1) : wavePhaseValue1) + intermediateValue82) - scalarValue11;
                float comparisonValue23 = float(float16_t(dotProductValue16 ? ((-0.0) - productValue62) : productValue62) + intermediateValue84) - scalarValue12;
                float inverseLengthValue11 = inversesqrt(dot(vec3(comparisonValue21, comparisonValue22, comparisonValue23), vec3(comparisonValue21, comparisonValue22, comparisonValue23)));
                float productValue63 = comparisonValue21 * inverseLengthValue11;
                float productValue65 = comparisonValue22 * inverseLengthValue11;
                float productValue66 = comparisonValue23 * inverseLengthValue11;
                uint productValue67 = uint(int(productValue8 * 256.0));
                uint productValue68 = uint(int(productValue4 * 256.0));
                uint productValue69 = uint(int(productValue9 * 256.0));
                rayQueryInitializeEXT(intermediateValue87, SceneBVH, 512u, 2u, vec3((abs(sumValue10) < 0.03125) ? (scalarValue17 + (productValue8 * 1.52587890625e-05)) : uintBitsToFloat(((sumValue10 < 0.0) ? (-productValue67) : productValue67) + floatBitsToUint(sumValue10)), (abs(sumValue5) < 0.03125) ? (scalarValue11 + (productValue4 * 1.52587890625e-05)) : uintBitsToFloat(((sumValue5 < 0.0) ? (-productValue68) : productValue68) + floatBitsToUint(sumValue5)), (abs(sumValue11) < 0.03125) ? (scalarValue12 + (productValue9 * 1.52587890625e-05)) : uintBitsToFloat(((sumValue11 < 0.0) ? (-productValue69) : productValue69) + floatBitsToUint(sumValue11))), 0.0, vec3(productValue63, productValue65, productValue66), sqrt(((comparisonValue21 * comparisonValue21) + (comparisonValue22 * comparisonValue22)) + (comparisonValue23 * comparisonValue23)) + (-0.00999999977648258209228515625));
                bool conditionValue2 = rayQueryProceedEXT(intermediateValue87);
                if (conditionValue2)
                {
                    bool intermediateValue101;
                    bool comparisonValue29;
                    for (;;)
                    {
                        uint scalarValue32 = rayQueryGetIntersectionTypeEXT(intermediateValue87, bool(0u));
                        comparisonValue29 = scalarValue32 == 0u;
                        if (comparisonValue29)
                        {
                            vec2 vectorValue = rayQueryGetIntersectionBarycentricsEXT(intermediateValue87, bool(0u));
                            vec2 vectorValue1 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue87, bool(0u));
                            uint scalarValue33 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue87, bool(0u));
                            uint scalarValue34 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue87, bool(0u));
                            uint scalarValue35 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue87, bool(0u));
                            uint productValue71 = (scalarValue35 * 76u) + 58u;
                            uint productValue72 = (scalarValue35 * 76u) + 61u;
                            precise float sumValue53 = 1.0 - vectorValue.x;
                            precise float sumValue54 = sumValue53 - vectorValue1.y;
                            uint bitwiseValue25 = (objectInstances_2.packedValues[(scalarValue35 * 38u) + 25u] >> 2u) + (scalarValue33 >> 1u);
                            uint productValue73 = uint(objectInstances.packedValues[(scalarValue35 * 76u) + 54u]) + 0u;
                            bool comparisonValue24 = (scalarValue33 & 1u) == 0u;
                            uint comparisonValue25 = comparisonValue24 ? faceUvBuffersRW[nonuniformEXT(productValue73)].packedValues[bitwiseValue25].z : faceUvBuffersRW[nonuniformEXT(productValue73)].packedValues[bitwiseValue25].x;
                            uint comparisonValue26 = comparisonValue24 ? faceUvBuffersRW[nonuniformEXT(productValue73)].packedValues[bitwiseValue25].y : faceUvBuffersRW[nonuniformEXT(productValue73)].packedValues[bitwiseValue25].w;
                            uint comparisonValue27 = comparisonValue24 ? faceUvBuffersRW[nonuniformEXT(productValue73)].packedValues[bitwiseValue25].x : faceUvBuffersRW[nonuniformEXT(productValue73)].packedValues[bitwiseValue25].z;
                            bool conditionValue3 = int16_t(objectInstances.packedValues[productValue72]) < int16_t(0us);
                            float intermediateValue102;
                            float intermediateValue103;
                            if (conditionValue3)
                            {
                                uint bitwiseValue26 = comparisonValue27 >> 15u;
                                precise float bitwiseValue27 = float(bitwiseValue26 & 1u) * 2.0;
                                precise float sumValue56 = bitwiseValue27 + (-1.0);
                                precise float bitwiseValue28 = float(comparisonValue27 >> 31u) * 2.0;
                                precise float sumValue57 = bitwiseValue28 + (-1.0);
                                precise float bitwiseValue29 = float((comparisonValue27 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue30 = float(bitwiseValue26 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue74 = sumValue56 * 3.0517578125e-05;
                                precise float productValue75 = sumValue57 * 3.0517578125e-05;
                                precise float sumValue58 = bitwiseValue29 + productValue74;
                                precise float sumValue59 = bitwiseValue30 + productValue75;
                                intermediateValue102 = sumValue58;
                                intermediateValue103 = sumValue59;
                            }
                            else
                            {
                                precise float bitwiseValue31 = float(comparisonValue27 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue32 = float(comparisonValue27 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue77 = bitwiseValue31 * 16384.0;
                                precise float sumValue61 = productValue77 + 0.5;
                                precise float productValue78 = bitwiseValue32 * 16384.0;
                                precise float sumValue62 = productValue78 + 0.5;
                                precise float productValue79 = floor(sumValue61) * 6.103515625e-05;
                                precise float productValue80 = floor(sumValue62) * 6.103515625e-05;
                                intermediateValue102 = productValue79;
                                intermediateValue103 = productValue80;
                            }
                            precise float productValue81 = sumValue54 * intermediateValue102;
                            precise float productValue83 = sumValue54 * intermediateValue103;
                            precise float sumValue63 = productValue81 + 0.0;
                            precise float sumValue64 = productValue83 + 0.0;
                            float intermediateValue104;
                            float intermediateValue105;
                            if (conditionValue3)
                            {
                                uint bitwiseValue33 = comparisonValue26 >> 15u;
                                precise float bitwiseValue34 = float(bitwiseValue33 & 1u) * 2.0;
                                precise float sumValue65 = bitwiseValue34 + (-1.0);
                                precise float bitwiseValue35 = float(comparisonValue26 >> 31u) * 2.0;
                                precise float sumValue66 = bitwiseValue35 + (-1.0);
                                precise float bitwiseValue36 = float((comparisonValue26 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue37 = float(bitwiseValue33 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue84 = sumValue65 * 3.0517578125e-05;
                                precise float productValue85 = sumValue66 * 3.0517578125e-05;
                                precise float sumValue67 = bitwiseValue36 + productValue84;
                                precise float sumValue68 = bitwiseValue37 + productValue85;
                                intermediateValue104 = sumValue67;
                                intermediateValue105 = sumValue68;
                            }
                            else
                            {
                                precise float bitwiseValue38 = float(comparisonValue26 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue39 = float(comparisonValue26 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue86 = bitwiseValue38 * 16384.0;
                                precise float sumValue69 = productValue86 + 0.5;
                                precise float productValue87 = bitwiseValue39 * 16384.0;
                                precise float sumValue70 = productValue87 + 0.5;
                                precise float productValue89 = floor(sumValue69) * 6.103515625e-05;
                                precise float productValue90 = floor(sumValue70) * 6.103515625e-05;
                                intermediateValue104 = productValue89;
                                intermediateValue105 = productValue90;
                            }
                            precise float productValue91 = vectorValue.x * intermediateValue104;
                            precise float productValue92 = vectorValue.x * intermediateValue105;
                            precise float sumValue71 = sumValue63 + productValue91;
                            precise float sumValue72 = sumValue64 + productValue92;
                            float intermediateValue106;
                            float intermediateValue107;
                            if (conditionValue3)
                            {
                                uint bitwiseValue40 = comparisonValue25 >> 15u;
                                precise float bitwiseValue41 = float(bitwiseValue40 & 1u) * 2.0;
                                precise float sumValue73 = bitwiseValue41 + (-1.0);
                                precise float bitwiseValue42 = float(comparisonValue25 >> 31u) * 2.0;
                                precise float sumValue74 = bitwiseValue42 + (-1.0);
                                precise float bitwiseValue43 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue44 = float(bitwiseValue40 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue94 = sumValue73 * 3.0517578125e-05;
                                precise float productValue95 = sumValue74 * 3.0517578125e-05;
                                precise float sumValue75 = bitwiseValue43 + productValue94;
                                precise float sumValue76 = bitwiseValue44 + productValue95;
                                intermediateValue106 = sumValue75;
                                intermediateValue107 = sumValue76;
                            }
                            else
                            {
                                precise float bitwiseValue45 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue46 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue96 = bitwiseValue45 * 16384.0;
                                precise float sumValue77 = productValue96 + 0.5;
                                precise float productValue97 = bitwiseValue46 * 16384.0;
                                precise float sumValue78 = productValue97 + 0.5;
                                precise float productValue98 = floor(sumValue77) * 6.103515625e-05;
                                precise float productValue99 = floor(sumValue78) * 6.103515625e-05;
                                intermediateValue106 = productValue98;
                                intermediateValue107 = productValue99;
                            }
                            precise float productValue100 = vectorValue1.y * intermediateValue106;
                            precise float productValue102 = vectorValue1.y * intermediateValue107;
                            precise float sumValue79 = sumValue71 + productValue100;
                            precise float sumValue80 = sumValue72 + productValue102;
                            float intermediateValue108;
                            if (objectInstances.packedValues[productValue71] == 65535us)
                            {
                                intermediateValue108 = 1.0;
                            }
                            else
                            {
                                uint reinterpretedBits19;
                                if (objectInstances.packedValues[productValue71] > 4095us)
                                {
                                    reinterpretedBits19 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits19 = uint(objectInstances.packedValues[productValue71]);
                                }
                                intermediateValue108 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits19 + 0u], defaultSampler)), vec2(sumValue79, sumValue80), -0.25).w;
                            }
                            uint comparisonValue34;
                            if (scalarValue34 == 2u)
                            {
                                comparisonValue34 = 0u;
                            }
                            else
                            {
                                comparisonValue34 = uint(intermediateValue108 <= (((objectInstances.packedValues[productValue72] & 4352us) != 0us) ? 0.5 : 0.0));
                            }
                            if (comparisonValue34 == 0u)
                            {
                                rayQueryConfirmIntersectionEXT(intermediateValue87);
                            }
                        }
                        intermediateValue101 = rayQueryProceedEXT(intermediateValue87);
                        if (intermediateValue101)
                        {
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                uint scalarValue36 = rayQueryGetIntersectionTypeEXT(intermediateValue87, bool(1u));
                bool intermediateValue94;
                if (scalarValue36 == 1u)
                {
                    float scalarValue37 = rayQueryGetIntersectionTEXT(intermediateValue87, bool(1u));
                    intermediateValue94 = !(scalarValue37 < 10000.0);
                }
                else
                {
                    intermediateValue94 = true;
                }
                uint scalarValue38 = uint(intermediateValue94);
                float branchMergedValue10;
                float branchMergedValue12;
                float branchMergedValue13;
                uint branchMergedValue14;
                float branchMergedValue15;
                float branchMergedValue16;
                float branchMergedValue17;
                if (intermediateValue94)
                {
                    float bitwiseValue47 = (intermediateValue76 * 0.0392156876623630523681640625) * float(intermediateValue79 & 255u);
                    float productValue103 = bitwiseValue47 * 0.00117647065781056880950927734375;
                    branchMergedValue10 = productValue103 * float((intermediateValue79 >> 8u) & 255u);
                    branchMergedValue12 = productValue103 * float((intermediateValue79 >> 16u) & 255u);
                    branchMergedValue13 = (float((intermediateValue79 >> 24u) & 127u) * 0.00236220471560955047607421875) * bitwiseValue47;
                    branchMergedValue14 = scalarValue38;
                    branchMergedValue15 = productValue66;
                    branchMergedValue16 = productValue65;
                    branchMergedValue17 = productValue63;
                }
                else
                {
                    branchMergedValue10 = 0.0;
                    branchMergedValue12 = 0.0;
                    branchMergedValue13 = 0.0;
                    branchMergedValue14 = scalarValue38;
                    branchMergedValue15 = productValue66;
                    branchMergedValue16 = productValue65;
                    branchMergedValue17 = productValue63;
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
        float productValue28;
        float productValue29;
        float productValue30;
        float productValue31;
        float productValue32;
        float productValue33;
        if (comparisonValue28)
        {
            float productValue104 = spvNMax((((1.0 - scalarValue7) * 0.5) * spvNClamp(scalarValue7 * 1.5, 0.0, 1.0)) + scalarValue7, 0.00999999977648258209228515625);
            float sumValue81 = intermediateValue26 - scalarValue13;
            float sumValue82 = intermediateValue27 - scalarValue18;
            float sumValue83 = intermediateValue28 - scalarValue14;
            float inverseLengthValue12 = inversesqrt(dot(vec3(sumValue81, sumValue82, sumValue83), vec3(sumValue81, sumValue82, sumValue83)));
            float productValue105 = inverseLengthValue12 * sumValue81;
            float productValue106 = inverseLengthValue12 * sumValue82;
            float productValue107 = inverseLengthValue12 * sumValue83;
            float dotProductValue17 = spvNClamp(dot(vec3(comparisonValue9, comparisonValue8, comparisonValue10), vec3(intermediateValue26, intermediateValue27, intermediateValue28)), 0.0, 1.0);
            float dotProductValue18 = spvNClamp(dot(vec3(comparisonValue9, comparisonValue8, comparisonValue10), vec3(sumValue6, sumValue12, sumValue7)), 0.0, 1.0);
            float dotProductValue19 = spvNClamp(dot(vec3(comparisonValue9, comparisonValue8, comparisonValue10), vec3(productValue105, productValue106, productValue107)), 0.0, 1.0);
            float dotProductValue20 = spvNClamp(dot(vec3(sumValue6, sumValue12, sumValue7), vec3(productValue105, productValue106, productValue107)), 0.0, 1.0);
            float productValue108 = productValue104 * productValue104;
            float productValue109 = productValue108 * productValue108;
            float productValue110 = (((dotProductValue19 * productValue109) - dotProductValue19) * dotProductValue19) + 1.0;
            float productValue111 = productValue108 * 0.5;
            float sumValue84 = 1.0 - productValue111;
            float dotProductValue21 = spvNClamp(dot(vec3(productValue6, productValue3, productValue7), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
            float exponentialValue = exp2(log2(spvNClamp(1.0 - dotProductValue20, 0.0, 1.0)) * 5.0);
            float productValue112 = (exponentialValue * (dotProductValue21 - productValue6)) + productValue6;
            float productValue113 = (exponentialValue * (dotProductValue21 - productValue3)) + productValue3;
            float productValue114 = (exponentialValue * (dotProductValue21 - productValue7)) + productValue7;
            float productValue115 = ((dotProductValue20 * dotProductValue20) * (productValue104 * 2.0)) + (-0.5);
            float exponentialValue1 = ((dotProductValue17 * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - dotProductValue18, 0.0, 1.0)) * 5.0) * productValue115) + 1.0)) * ((exp2(log2(spvNClamp(1.0 - dotProductValue17, 0.0, 1.0)) * 5.0) * productValue115) + 1.0);
            float quotientValue8 = (((productValue109 / ((productValue110 * productValue110) + 1.0000000133514319600180897396058e-10)) * 0.3183098733425140380859375) * (0.25 / ((((dotProductValue18 * sumValue84) + productValue111) * ((dotProductValue17 * sumValue84) + productValue111)) + 1.0000000133514319600180897396058e-10))) * dotProductValue17;
            productValue28 = ((1.0 - productValue112) * intermediateValue31) * exponentialValue1;
            productValue29 = ((1.0 - productValue113) * intermediateValue32) * exponentialValue1;
            productValue30 = ((1.0 - productValue114) * intermediateValue33) * exponentialValue1;
            productValue31 = (quotientValue8 * intermediateValue31) * productValue112;
            productValue32 = (quotientValue8 * intermediateValue32) * productValue113;
            productValue33 = (quotientValue8 * intermediateValue33) * productValue114;
        }
        else
        {
            productValue28 = 0.0;
            productValue29 = 0.0;
            productValue30 = 0.0;
            productValue31 = 0.0;
            productValue32 = 0.0;
            productValue33 = 0.0;
        }
        if (comparisonValue28)
        {
            vec4 loadedBufferValue = imageLoad(outputBufferIndirectDiffuse, ivec2(uvec2(bitwiseValue2, bitwiseValue3)));
            float scalarValue39 = loadedBufferValue.x;
            float scalarValue40 = loadedBufferValue.y;
            float scalarValue41 = loadedBufferValue.z;
            float scalarValue42 = loadedBufferValue.w;
            float productValue116 = productValue29 * reinterpretedBits2;
            float productValue117 = productValue30 * reinterpretedBits2;
            if (reinterpretedBits1)
            {
                vec4 loadedBufferValue1 = imageLoad(outputBufferIndirectDiffuseChroma, ivec2(uvec2(bitwiseValue2, bitwiseValue3)));
                float scalarValue43 = loadedBufferValue1.z;
                float productValue118 = (productValue28 - productValue30) * reinterpretedBits2;
                float productValue119 = (productValue118 * 0.5) + productValue117;
                float sumValue85 = productValue116 - productValue119;
                float productValue120 = spvNMax((sumValue85 * 0.5) + productValue119, 0.0);
                float productValue121 = productValue120 * 0.48860299587249755859375;
                float productValue122 = (productValue121 * intermediateValue26) + scalarValue39;
                float productValue123 = (productValue121 * intermediateValue27) + scalarValue40;
                float productValue124 = (productValue121 * intermediateValue28) + scalarValue41;
                float productValue125 = (productValue120 * 0.2820949852466583251953125) + scalarValue42;
                float sumValue86 = loadedBufferValue1.x + productValue118;
                float sumValue87 = loadedBufferValue1.y + sumValue85;
                uint reinterpretedBits5 = floatBitsToUint(productValue122) & 2147483647u;
                uint reinterpretedBits6 = floatBitsToUint(productValue123) & 2147483647u;
                uint reinterpretedBits7 = floatBitsToUint(productValue124) & 2147483647u;
                uint reinterpretedBits8 = floatBitsToUint(productValue125) & 2147483647u;
                bool comparisonValue30 = ((reinterpretedBits8 > 2139095040u) || ((reinterpretedBits7 > 2139095040u) || ((reinterpretedBits5 > 2139095040u) || (reinterpretedBits6 > 2139095040u)))) || ((reinterpretedBits8 == 2139095040u) || ((reinterpretedBits7 == 2139095040u) || ((reinterpretedBits5 == 2139095040u) || (reinterpretedBits6 == 2139095040u))));
                if (comparisonValue30)
                {
                    if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
                    {
                        imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 1.0, 0.0, 1.0));
                        imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
                    }
                }
                uint reinterpretedBits9 = floatBitsToUint(sumValue86) & 2147483647u;
                uint reinterpretedBits10 = floatBitsToUint(sumValue87) & 2147483647u;
                uint reinterpretedBits11 = floatBitsToUint(scalarValue43) & 2147483647u;
                bool comparisonValue31 = ((reinterpretedBits11 > 2139095040u) || ((reinterpretedBits9 > 2139095040u) || (reinterpretedBits10 > 2139095040u))) || ((reinterpretedBits11 == 2139095040u) || ((reinterpretedBits9 == 2139095040u) || (reinterpretedBits10 == 2139095040u)));
                if (comparisonValue31)
                {
                    if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
                    {
                        imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 1.0, 0.0, 1.0));
                        imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
                    }
                }
                if (!comparisonValue30)
                {
                    imageStore(outputBufferIndirectDiffuse, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(productValue122, productValue123, productValue124, productValue125));
                }
                if (!comparisonValue31)
                {
                    imageStore(outputBufferIndirectDiffuseChroma, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(sumValue86, sumValue87, scalarValue43, sumValue86));
                }
            }
            else
            {
                float productValue126 = scalarValue39 + (productValue28 * reinterpretedBits2);
                float sumValue88 = scalarValue40 + productValue116;
                float sumValue89 = scalarValue41 + productValue117;
                uint reinterpretedBits12 = floatBitsToUint(productValue126) & 2147483647u;
                uint reinterpretedBits13 = floatBitsToUint(sumValue88) & 2147483647u;
                uint reinterpretedBits14 = floatBitsToUint(sumValue89) & 2147483647u;
                uint reinterpretedBits15 = floatBitsToUint(scalarValue42) & 2147483647u;
                bool comparisonValue32 = ((reinterpretedBits15 > 2139095040u) || ((reinterpretedBits14 > 2139095040u) || ((reinterpretedBits12 > 2139095040u) || (reinterpretedBits13 > 2139095040u)))) || ((reinterpretedBits15 == 2139095040u) || ((reinterpretedBits14 == 2139095040u) || ((reinterpretedBits12 == 2139095040u) || (reinterpretedBits13 == 2139095040u))));
                bool intermediateValue48;
                if (comparisonValue32)
                {
                    bool branchMergedValue1;
                    if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
                    {
                        imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 1.0, 0.0, 1.0));
                        imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
                        branchMergedValue1 = comparisonValue32;
                    }
                    else
                    {
                        branchMergedValue1 = comparisonValue32;
                    }
                    intermediateValue48 = branchMergedValue1;
                }
                else
                {
                    intermediateValue48 = false;
                }
                if (!intermediateValue48)
                {
                    imageStore(outputBufferIndirectDiffuse, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(productValue126, sumValue88, sumValue89, scalarValue42));
                }
            }
            float productValue127 = productValue31 * reinterpretedBits2;
            float productValue128 = productValue32 * reinterpretedBits2;
            float productValue129 = productValue33 * reinterpretedBits2;
            uint reinterpretedBits16 = floatBitsToUint(productValue127) & 2147483647u;
            uint reinterpretedBits17 = floatBitsToUint(productValue128) & 2147483647u;
            uint reinterpretedBits18 = floatBitsToUint(productValue129) & 2147483647u;
            bool comparisonValue33 = (((reinterpretedBits16 > 2139095040u) || (reinterpretedBits17 > 2139095040u)) || (reinterpretedBits18 > 2139095040u)) || (((reinterpretedBits16 == 2139095040u) || (reinterpretedBits17 == 2139095040u)) || (reinterpretedBits18 == 2139095040u));
            bool intermediateValue53;
            if (comparisonValue33)
            {
                bool branchMergedValue2;
                if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
                {
                    imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 1.0, 0.0, 1.0));
                    imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
                    branchMergedValue2 = comparisonValue33;
                }
                else
                {
                    branchMergedValue2 = comparisonValue33;
                }
                intermediateValue53 = branchMergedValue2;
            }
            else
            {
                intermediateValue53 = false;
            }
            if (!intermediateValue53)
            {
                imageStore(outputBufferIndirectSpecular, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(productValue127, productValue128, productValue129, 1.0));
            }
        }
    }
}
