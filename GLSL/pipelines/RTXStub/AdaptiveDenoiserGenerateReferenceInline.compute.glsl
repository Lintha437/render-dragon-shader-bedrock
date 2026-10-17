#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / AdaptiveDenoiserGenerateReferenceInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
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
    uint bitwiseValue4 = bitwiseValue2 << 2u;
    uint bitwiseValue5 = bitwiseValue3 << 2u;
    vec4 sampledTextureValue = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue4, bitwiseValue5)), int(0u));
    float scalarValue1 = sampledTextureValue.x;
    float intermediateValue4;
    float intermediateValue5;
    if (scalarValue1 == 65504.0)
    {
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
    }
    else
    {
        vec4 sampledTextureValue1 = texelFetch(inputBufferNormal, ivec2(uvec2(bitwiseValue4, bitwiseValue5)), int(0u));
        float scalarValue2 = sampledTextureValue1.x;
        float scalarValue3 = sampledTextureValue1.y;
        float sumValue = 1.0 - abs(scalarValue2);
        float scalarValue4 = abs(scalarValue3);
        float sumValue1 = sumValue - scalarValue4;
        bool conditionValue = sumValue1 < 0.0;
        float comparisonValue1 = conditionValue ? ((1.0 - scalarValue4) * ((scalarValue2 >= 0.0) ? 1.0 : (-1.0))) : scalarValue2;
        float comparisonValue2 = conditionValue ? (((scalarValue3 >= 0.0) ? 1.0 : (-1.0)) * sumValue) : scalarValue3;
        float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue1, comparisonValue2, sumValue1), vec3(comparisonValue1, comparisonValue2, sumValue1)));
        float productValue = comparisonValue1 * inverseLengthValue;
        float productValue1 = comparisonValue2 * inverseLengthValue;
        float productValue2 = inverseLengthValue * sumValue1;
        float comparisonValue3 = ((productValue2 != 0.0) || ((productValue != 0.0) || (productValue1 != 0.0))) ? productValue2 : 1.0;
        float inverseLengthValue1 = inversesqrt(dot(vec3(productValue, productValue1, comparisonValue3), vec3(productValue, productValue1, comparisonValue3)));
        float productValue3 = productValue1 * inverseLengthValue1;
        vec4 sampledTextureValue2 = texelFetch(inputGeometryNormal, ivec2(uvec2(bitwiseValue4, bitwiseValue5)), int(0u));
        float scalarValue5 = sampledTextureValue2.x;
        float scalarValue6 = sampledTextureValue2.y;
        precise float sumValue2 = 1.0 - abs(scalarValue5);
        float scalarValue7 = abs(scalarValue6);
        precise float sumValue3 = sumValue2 - scalarValue7;
        bool conditionValue1 = sumValue3 < 0.0;
        precise float sumValue4 = 1.0 - scalarValue7;
        precise float comparisonValue4 = ((scalarValue5 >= 0.0) ? 1.0 : (-1.0)) * sumValue4;
        precise float comparisonValue5 = sumValue2 * ((scalarValue6 >= 0.0) ? 1.0 : (-1.0));
        float comparisonValue6 = conditionValue1 ? comparisonValue4 : scalarValue5;
        float comparisonValue7 = conditionValue1 ? comparisonValue5 : scalarValue6;
        float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, sumValue3), vec3(comparisonValue6, comparisonValue7, sumValue3)));
        precise float productValue4 = inverseLengthValue2 * comparisonValue7;
        vec4 sampledTextureValue3 = texelFetch(inputPrimaryWorldPosition, ivec2(uvec2(bitwiseValue4, bitwiseValue5)), int(0u));
        float scalarValue8 = sampledTextureValue3.y;
        float scalarValue9 = sampledTextureValue3.z;
        precise float sumValue5 = scalarValue8 + 0.0;
        uvec4 reinterpretedBits1 = floatBitsToUint(ViewCB.packedValues[84u]);
        uint scalarValue10 = reinterpretedBits1.z;
        float productValue5 = inverseLengthValue1 * productValue;
        float productValue6 = comparisonValue3 * inverseLengthValue1;
        precise float productValue7 = inverseLengthValue2 * comparisonValue6;
        precise float productValue8 = sumValue3 * inverseLengthValue2;
        float scalarValue11 = sampledTextureValue3.x;
        precise float sumValue6 = scalarValue11 + 0.0;
        precise float sumValue7 = scalarValue9 + 0.0;
        bool dotProductValue = dot(vec3(0.847100675106048583984375, 0.2079117000102996826171875, 0.489073812961578369140625), vec3(productValue5, productValue3, productValue6)) > 0.949999988079071044921875;
        float comparisonValue8 = dotProductValue ? (-0.639436304569244384765625) : 0.847100675106048583984375;
        float comparisonValue9 = dotProductValue ? (-0.3907311260700225830078125) : 0.2079117000102996826171875;
        float comparisonValue10 = dotProductValue ? 0.6621558666229248046875 : 0.489073812961578369140625;
        float dotProductValue1 = dot(vec3(comparisonValue8, comparisonValue9, comparisonValue10), vec3(productValue5, productValue3, productValue6));
        float productValue9 = comparisonValue8 - (dotProductValue1 * productValue5);
        float productValue10 = comparisonValue9 - (dotProductValue1 * productValue3);
        float productValue11 = comparisonValue10 - (dotProductValue1 * productValue6);
        float inverseLengthValue3 = inversesqrt(dot(vec3(productValue9, productValue10, productValue11), vec3(productValue9, productValue10, productValue11)));
        float productValue12 = productValue9 * inverseLengthValue3;
        float productValue13 = productValue10 * inverseLengthValue3;
        float productValue14 = productValue11 * inverseLengthValue3;
        uint productValue15 = uint(int(productValue7 * 256.0));
        uint productValue16 = uint(int(productValue4 * 256.0));
        uint productValue17 = uint(int(productValue8 * 256.0));
        float reinterpretedBits2 = (abs(sumValue6) < 0.03125) ? (scalarValue11 + (productValue7 * 1.52587890625e-05)) : uintBitsToFloat(((sumValue6 < 0.0) ? (-productValue15) : productValue15) + floatBitsToUint(sumValue6));
        float reinterpretedBits3 = (abs(sumValue5) < 0.03125) ? (scalarValue8 + (productValue4 * 1.52587890625e-05)) : uintBitsToFloat(((sumValue5 < 0.0) ? (-productValue16) : productValue16) + floatBitsToUint(sumValue5));
        float reinterpretedBits4 = (abs(sumValue7) < 0.03125) ? (scalarValue9 + (productValue8 * 1.52587890625e-05)) : uintBitsToFloat(((sumValue7 < 0.0) ? (-productValue17) : productValue17) + floatBitsToUint(sumValue7));
        vec4 sampledTextureValue4 = texelFetch(blueNoiseTexture, ivec3(uvec3(bitwiseValue4 & 252u, bitwiseValue5 & 252u, (scalarValue10 >> 1u) & 127u)), int(0u));
        bool comparisonValue11 = (scalarValue10 & 1u) == 0u;
        float comparisonValue12 = comparisonValue11 ? sampledTextureValue4.x : sampledTextureValue4.z;
        float nonlinearValue = sqrt(comparisonValue12);
        float comparisonValue13 = (comparisonValue11 ? sampledTextureValue4.y : sampledTextureValue4.w) * 6.283185482025146484375;
        float wavePhaseValue = cos(comparisonValue13) * nonlinearValue;
        float wavePhaseValue1 = sin(comparisonValue13) * nonlinearValue;
        float nonlinearValue1 = sqrt(1.0 - comparisonValue12);
        float multiplyAddValue = fma(nonlinearValue1, productValue5, fma(wavePhaseValue1, (productValue14 * productValue3) - (productValue13 * productValue6), wavePhaseValue * productValue12));
        float multiplyAddValue1 = fma(nonlinearValue1, productValue3, fma(wavePhaseValue1, (productValue12 * productValue6) - (productValue14 * productValue5), wavePhaseValue * productValue13));
        float multiplyAddValue2 = fma(nonlinearValue1, productValue6, fma(wavePhaseValue1, (productValue13 * productValue5) - (productValue12 * productValue3), wavePhaseValue * productValue14));
        rayQueryInitializeEXT(intermediateValue18, SceneBVH, 512u, 2u, vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4), 0.0, vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), 10.0);
        bool conditionValue2 = rayQueryProceedEXT(intermediateValue18);
        if (conditionValue2)
        {
            bool intermediateValue38;
            bool comparisonValue14;
            for (;;)
            {
                uint scalarValue12 = rayQueryGetIntersectionTypeEXT(intermediateValue18, bool(0u));
                comparisonValue14 = scalarValue12 == 0u;
                if (comparisonValue14)
                {
                    vec2 vectorValue = rayQueryGetIntersectionBarycentricsEXT(intermediateValue18, bool(0u));
                    vec2 vectorValue1 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue18, bool(0u));
                    uint scalarValue13 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue18, bool(0u));
                    uint scalarValue14 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue18, bool(0u));
                    uint scalarValue15 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue18, bool(0u));
                    uint productValue18 = (scalarValue15 * 76u) + 58u;
                    uint productValue19 = (scalarValue15 * 76u) + 61u;
                    precise float sumValue8 = 1.0 - vectorValue.x;
                    precise float sumValue9 = sumValue8 - vectorValue1.y;
                    uint bitwiseValue7 = (objectInstances_2.packedValues[(scalarValue15 * 38u) + 25u] >> 2u) + (scalarValue13 >> 1u);
                    uint productValue20 = uint(objectInstances.packedValues[(scalarValue15 * 76u) + 54u]) + 0u;
                    bool comparisonValue15 = (scalarValue13 & 1u) == 0u;
                    uint comparisonValue16 = comparisonValue15 ? faceUvBuffersRW[nonuniformEXT(productValue20)].packedValues[bitwiseValue7].z : faceUvBuffersRW[nonuniformEXT(productValue20)].packedValues[bitwiseValue7].x;
                    uint comparisonValue17 = comparisonValue15 ? faceUvBuffersRW[nonuniformEXT(productValue20)].packedValues[bitwiseValue7].y : faceUvBuffersRW[nonuniformEXT(productValue20)].packedValues[bitwiseValue7].w;
                    uint comparisonValue18 = comparisonValue15 ? faceUvBuffersRW[nonuniformEXT(productValue20)].packedValues[bitwiseValue7].x : faceUvBuffersRW[nonuniformEXT(productValue20)].packedValues[bitwiseValue7].z;
                    bool conditionValue3 = int16_t(objectInstances.packedValues[productValue19]) < int16_t(0us);
                    float intermediateValue52;
                    float intermediateValue53;
                    if (conditionValue3)
                    {
                        uint bitwiseValue8 = comparisonValue18 >> 15u;
                        precise float bitwiseValue9 = float(bitwiseValue8 & 1u) * 2.0;
                        precise float sumValue10 = bitwiseValue9 + (-1.0);
                        precise float bitwiseValue10 = float(comparisonValue18 >> 31u) * 2.0;
                        precise float sumValue11 = bitwiseValue10 + (-1.0);
                        precise float bitwiseValue11 = float((comparisonValue18 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue12 = float(bitwiseValue8 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue21 = sumValue10 * 3.0517578125e-05;
                        precise float productValue22 = sumValue11 * 3.0517578125e-05;
                        precise float sumValue12 = bitwiseValue11 + productValue21;
                        precise float sumValue13 = bitwiseValue12 + productValue22;
                        intermediateValue52 = sumValue12;
                        intermediateValue53 = sumValue13;
                    }
                    else
                    {
                        precise float bitwiseValue13 = float(comparisonValue18 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue14 = float(comparisonValue18 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue23 = bitwiseValue13 * 16384.0;
                        precise float sumValue14 = productValue23 + 0.5;
                        precise float productValue24 = bitwiseValue14 * 16384.0;
                        precise float sumValue15 = productValue24 + 0.5;
                        precise float productValue25 = floor(sumValue14) * 6.103515625e-05;
                        precise float productValue26 = floor(sumValue15) * 6.103515625e-05;
                        intermediateValue52 = productValue25;
                        intermediateValue53 = productValue26;
                    }
                    precise float productValue27 = sumValue9 * intermediateValue52;
                    precise float productValue28 = sumValue9 * intermediateValue53;
                    precise float sumValue16 = productValue27 + 0.0;
                    precise float sumValue17 = productValue28 + 0.0;
                    float intermediateValue69;
                    float intermediateValue70;
                    if (conditionValue3)
                    {
                        uint bitwiseValue15 = comparisonValue17 >> 15u;
                        precise float bitwiseValue16 = float(bitwiseValue15 & 1u) * 2.0;
                        precise float sumValue18 = bitwiseValue16 + (-1.0);
                        precise float bitwiseValue17 = float(comparisonValue17 >> 31u) * 2.0;
                        precise float sumValue19 = bitwiseValue17 + (-1.0);
                        precise float bitwiseValue18 = float((comparisonValue17 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue19 = float(bitwiseValue15 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue29 = sumValue18 * 3.0517578125e-05;
                        precise float productValue30 = sumValue19 * 3.0517578125e-05;
                        precise float sumValue20 = bitwiseValue18 + productValue29;
                        precise float sumValue21 = bitwiseValue19 + productValue30;
                        intermediateValue69 = sumValue20;
                        intermediateValue70 = sumValue21;
                    }
                    else
                    {
                        precise float bitwiseValue20 = float(comparisonValue17 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue21 = float(comparisonValue17 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue31 = bitwiseValue20 * 16384.0;
                        precise float sumValue22 = productValue31 + 0.5;
                        precise float productValue32 = bitwiseValue21 * 16384.0;
                        precise float sumValue23 = productValue32 + 0.5;
                        precise float productValue33 = floor(sumValue22) * 6.103515625e-05;
                        precise float productValue34 = floor(sumValue23) * 6.103515625e-05;
                        intermediateValue69 = productValue33;
                        intermediateValue70 = productValue34;
                    }
                    precise float productValue35 = vectorValue.x * intermediateValue69;
                    precise float productValue39 = vectorValue.x * intermediateValue70;
                    precise float sumValue24 = sumValue16 + productValue35;
                    precise float sumValue25 = sumValue17 + productValue39;
                    float intermediateValue78;
                    float intermediateValue79;
                    if (conditionValue3)
                    {
                        uint bitwiseValue22 = comparisonValue16 >> 15u;
                        precise float bitwiseValue23 = float(bitwiseValue22 & 1u) * 2.0;
                        precise float sumValue26 = bitwiseValue23 + (-1.0);
                        precise float bitwiseValue24 = float(comparisonValue16 >> 31u) * 2.0;
                        precise float sumValue27 = bitwiseValue24 + (-1.0);
                        precise float bitwiseValue25 = float((comparisonValue16 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue26 = float(bitwiseValue22 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue40 = sumValue26 * 3.0517578125e-05;
                        precise float productValue41 = sumValue27 * 3.0517578125e-05;
                        precise float sumValue28 = bitwiseValue25 + productValue40;
                        precise float sumValue29 = bitwiseValue26 + productValue41;
                        intermediateValue78 = sumValue28;
                        intermediateValue79 = sumValue29;
                    }
                    else
                    {
                        precise float bitwiseValue27 = float(comparisonValue16 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue28 = float(comparisonValue16 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue42 = bitwiseValue27 * 16384.0;
                        precise float sumValue30 = productValue42 + 0.5;
                        precise float productValue43 = bitwiseValue28 * 16384.0;
                        precise float sumValue31 = productValue43 + 0.5;
                        precise float productValue44 = floor(sumValue30) * 6.103515625e-05;
                        precise float productValue45 = floor(sumValue31) * 6.103515625e-05;
                        intermediateValue78 = productValue44;
                        intermediateValue79 = productValue45;
                    }
                    precise float productValue46 = vectorValue1.y * intermediateValue78;
                    precise float productValue47 = vectorValue1.y * intermediateValue79;
                    precise float sumValue32 = sumValue24 + productValue46;
                    precise float sumValue33 = sumValue25 + productValue47;
                    float intermediateValue89;
                    if (objectInstances.packedValues[productValue18] == 65535us)
                    {
                        intermediateValue89 = 1.0;
                    }
                    else
                    {
                        uint reinterpretedBits9;
                        if (objectInstances.packedValues[productValue18] > 4095us)
                        {
                            reinterpretedBits9 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits9 = uint(objectInstances.packedValues[productValue18]);
                        }
                        intermediateValue89 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits9 + 0u], defaultSampler)), vec2(sumValue32, sumValue33), -0.25).w;
                    }
                    uint comparisonValue33;
                    if (scalarValue14 == 2u)
                    {
                        comparisonValue33 = 0u;
                    }
                    else
                    {
                        comparisonValue33 = uint(intermediateValue89 <= (((objectInstances.packedValues[productValue19] & 4352us) != 0us) ? 0.5 : 0.0));
                    }
                    if (comparisonValue33 == 0u)
                    {
                        rayQueryConfirmIntersectionEXT(intermediateValue18);
                    }
                }
                intermediateValue38 = rayQueryProceedEXT(intermediateValue18);
                if (intermediateValue38)
                {
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        uint scalarValue16 = rayQueryGetIntersectionTypeEXT(intermediateValue18, bool(1u));
        float intermediateValue27;
        float intermediateValue28;
        float intermediateValue29;
        uint bitwiseValue6;
        if (scalarValue16 == 1u)
        {
            vec2 vectorValue2 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue18, bool(1u));
            vec2 vectorValue3 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue18, bool(1u));
            float scalarValue17 = rayQueryGetIntersectionTEXT(intermediateValue18, bool(1u));
            uint scalarValue18 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue18, bool(1u));
            uint scalarValue19 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue18, bool(1u));
            intermediateValue27 = vectorValue2.x;
            intermediateValue28 = vectorValue3.y;
            intermediateValue29 = scalarValue17;
            bitwiseValue6 = ((scalarValue18 << 14u) & 1073725440u) | (scalarValue19 & 16383u);
        }
        else
        {
            intermediateValue27 = 0.0;
            intermediateValue28 = 0.0;
            intermediateValue29 = 10000.0;
            bitwiseValue6 = 1073741823u;
        }
        rayQueryInitializeEXT(intermediateValue30, SceneBVH, 512u, 16u, vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4), 0.0, vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), intermediateValue29);
        bool conditionValue4 = rayQueryProceedEXT(intermediateValue30);
        float intermediateValue39;
        float intermediateValue41;
        float intermediateValue43;
        if (conditionValue4)
        {
            float intermediateValue40;
            float intermediateValue42;
            float intermediateValue44;
            float scalarValue20 = 1.0;
            float scalarValue21 = 1.0;
            float scalarValue22 = 1.0;
            bool comparisonValue23;
            for (;;)
            {
                uint scalarValue23 = rayQueryGetIntersectionTypeEXT(intermediateValue30, bool(0u));
                comparisonValue23 = scalarValue23 == 0u;
                float branchMergedValue;
                float branchMergedValue1;
                float branchMergedValue2;
                if (comparisonValue23)
                {
                    vec2 vectorValue4 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue30, bool(0u));
                    vec2 vectorValue5 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue30, bool(0u));
                    float scalarValue24 = rayQueryGetIntersectionTEXT(intermediateValue30, bool(0u));
                    uint scalarValue25 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue30, bool(0u));
                    uint scalarValue26 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue30, bool(0u));
                    uint scalarValue27 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue30, bool(0u));
                    uint productValue48 = (scalarValue27 * 76u) + 58u;
                    uint productValue49 = (scalarValue27 * 76u) + 61u;
                    precise float sumValue34 = 1.0 - vectorValue4.x;
                    precise float sumValue35 = sumValue34 - vectorValue5.y;
                    uint bitwiseValue29 = (objectInstances_2.packedValues[(scalarValue27 * 38u) + 25u] >> 2u) + (scalarValue25 >> 1u);
                    uint productValue50 = uint(objectInstances.packedValues[(scalarValue27 * 76u) + 54u]) + 0u;
                    bool comparisonValue19 = (scalarValue25 & 1u) == 0u;
                    uint comparisonValue20 = comparisonValue19 ? faceUvBuffersRW[nonuniformEXT(productValue50)].packedValues[bitwiseValue29].z : faceUvBuffersRW[nonuniformEXT(productValue50)].packedValues[bitwiseValue29].x;
                    uint comparisonValue21 = comparisonValue19 ? faceUvBuffersRW[nonuniformEXT(productValue50)].packedValues[bitwiseValue29].y : faceUvBuffersRW[nonuniformEXT(productValue50)].packedValues[bitwiseValue29].w;
                    uint comparisonValue22 = comparisonValue19 ? faceUvBuffersRW[nonuniformEXT(productValue50)].packedValues[bitwiseValue29].x : faceUvBuffersRW[nonuniformEXT(productValue50)].packedValues[bitwiseValue29].z;
                    bool conditionValue5 = int16_t(objectInstances.packedValues[productValue49]) < int16_t(0us);
                    float intermediateValue71;
                    float intermediateValue72;
                    if (conditionValue5)
                    {
                        uint bitwiseValue30 = comparisonValue22 >> 15u;
                        precise float bitwiseValue31 = float(bitwiseValue30 & 1u) * 2.0;
                        precise float sumValue36 = bitwiseValue31 + (-1.0);
                        precise float bitwiseValue32 = float(comparisonValue22 >> 31u) * 2.0;
                        precise float sumValue37 = bitwiseValue32 + (-1.0);
                        precise float bitwiseValue33 = float((comparisonValue22 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue34 = float(bitwiseValue30 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue51 = sumValue36 * 3.0517578125e-05;
                        precise float productValue52 = sumValue37 * 3.0517578125e-05;
                        precise float sumValue38 = bitwiseValue33 + productValue51;
                        precise float sumValue39 = bitwiseValue34 + productValue52;
                        intermediateValue71 = sumValue38;
                        intermediateValue72 = sumValue39;
                    }
                    else
                    {
                        precise float bitwiseValue35 = float(comparisonValue22 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue36 = float(comparisonValue22 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue53 = bitwiseValue35 * 16384.0;
                        precise float sumValue40 = productValue53 + 0.5;
                        precise float productValue54 = bitwiseValue36 * 16384.0;
                        precise float sumValue41 = productValue54 + 0.5;
                        precise float productValue55 = floor(sumValue40) * 6.103515625e-05;
                        precise float productValue56 = floor(sumValue41) * 6.103515625e-05;
                        intermediateValue71 = productValue55;
                        intermediateValue72 = productValue56;
                    }
                    precise float productValue57 = sumValue35 * intermediateValue71;
                    precise float productValue58 = sumValue35 * intermediateValue72;
                    precise float sumValue42 = productValue57 + 0.0;
                    precise float sumValue43 = productValue58 + 0.0;
                    float intermediateValue80;
                    float intermediateValue81;
                    if (conditionValue5)
                    {
                        uint bitwiseValue37 = comparisonValue21 >> 15u;
                        precise float bitwiseValue40 = float(bitwiseValue37 & 1u) * 2.0;
                        precise float sumValue44 = bitwiseValue40 + (-1.0);
                        precise float bitwiseValue41 = float(comparisonValue21 >> 31u) * 2.0;
                        precise float sumValue45 = bitwiseValue41 + (-1.0);
                        precise float bitwiseValue42 = float((comparisonValue21 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue43 = float(bitwiseValue37 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue59 = sumValue44 * 3.0517578125e-05;
                        precise float productValue60 = sumValue45 * 3.0517578125e-05;
                        precise float sumValue46 = bitwiseValue42 + productValue59;
                        precise float sumValue47 = bitwiseValue43 + productValue60;
                        intermediateValue80 = sumValue46;
                        intermediateValue81 = sumValue47;
                    }
                    else
                    {
                        precise float bitwiseValue44 = float(comparisonValue21 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue45 = float(comparisonValue21 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue61 = bitwiseValue44 * 16384.0;
                        precise float sumValue48 = productValue61 + 0.5;
                        precise float productValue62 = bitwiseValue45 * 16384.0;
                        precise float sumValue49 = productValue62 + 0.5;
                        precise float productValue63 = floor(sumValue48) * 6.103515625e-05;
                        precise float productValue64 = floor(sumValue49) * 6.103515625e-05;
                        intermediateValue80 = productValue63;
                        intermediateValue81 = productValue64;
                    }
                    precise float productValue65 = vectorValue4.x * intermediateValue80;
                    precise float productValue66 = vectorValue4.x * intermediateValue81;
                    precise float sumValue50 = sumValue42 + productValue65;
                    precise float sumValue51 = sumValue43 + productValue66;
                    float intermediateValue90;
                    float intermediateValue91;
                    if (conditionValue5)
                    {
                        uint bitwiseValue46 = comparisonValue20 >> 15u;
                        precise float bitwiseValue47 = float(bitwiseValue46 & 1u) * 2.0;
                        precise float sumValue52 = bitwiseValue47 + (-1.0);
                        precise float bitwiseValue48 = float(comparisonValue20 >> 31u) * 2.0;
                        precise float sumValue53 = bitwiseValue48 + (-1.0);
                        precise float bitwiseValue49 = float((comparisonValue20 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue50 = float(bitwiseValue46 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue67 = sumValue52 * 3.0517578125e-05;
                        precise float productValue68 = sumValue53 * 3.0517578125e-05;
                        precise float sumValue54 = bitwiseValue49 + productValue67;
                        precise float sumValue55 = bitwiseValue50 + productValue68;
                        intermediateValue90 = sumValue54;
                        intermediateValue91 = sumValue55;
                    }
                    else
                    {
                        precise float bitwiseValue51 = float(comparisonValue20 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue52 = float(comparisonValue20 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue69 = bitwiseValue51 * 16384.0;
                        precise float sumValue56 = productValue69 + 0.5;
                        precise float productValue70 = bitwiseValue52 * 16384.0;
                        precise float sumValue57 = productValue70 + 0.5;
                        precise float productValue71 = floor(sumValue56) * 6.103515625e-05;
                        precise float productValue72 = floor(sumValue57) * 6.103515625e-05;
                        intermediateValue90 = productValue71;
                        intermediateValue91 = productValue72;
                    }
                    precise float productValue73 = vectorValue5.y * intermediateValue90;
                    precise float productValue74 = vectorValue5.y * intermediateValue91;
                    precise float sumValue58 = sumValue50 + productValue73;
                    precise float sumValue59 = sumValue51 + productValue74;
                    float intermediateValue94;
                    float intermediateValue95;
                    float intermediateValue96;
                    float intermediateValue97;
                    if (objectInstances.packedValues[productValue48] == 65535us)
                    {
                        intermediateValue94 = 1.0;
                        intermediateValue95 = 1.0;
                        intermediateValue96 = 1.0;
                        intermediateValue97 = 1.0;
                    }
                    else
                    {
                        uint reinterpretedBits15;
                        if (objectInstances.packedValues[productValue48] > 4095us)
                        {
                            reinterpretedBits15 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits15 = uint(objectInstances.packedValues[productValue48]);
                        }
                        vec4 sampledTextureValue5 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits15 + 0u], defaultSampler)), vec2(sumValue58, sumValue59), spvNMin(fma(scalarValue24, 0.083333335816860198974609375, -0.25), 2.0));
                        intermediateValue94 = sampledTextureValue5.x;
                        intermediateValue95 = sampledTextureValue5.y;
                        intermediateValue96 = sampledTextureValue5.z;
                        intermediateValue97 = sampledTextureValue5.w;
                    }
                    float intermediateValue104;
                    float intermediateValue105;
                    float intermediateValue106;
                    if (scalarValue26 == 2u)
                    {
                        float branchMergedValue5;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        if ((objectInstances.packedValues[productValue49] & 128us) == 0us)
                        {
                            float intermediateValue108;
                            if ((objectInstances.packedValues[productValue49] & 2048us) == 0us)
                            {
                                intermediateValue108 = intermediateValue97;
                            }
                            else
                            {
                                intermediateValue108 = spvNClamp(fma(intermediateValue97, 2.0, -1.0), 0.0, 1.0);
                            }
                            branchMergedValue5 = intermediateValue96 - (intermediateValue108 * intermediateValue96);
                            branchMergedValue7 = intermediateValue95 - (intermediateValue108 * intermediateValue95);
                            branchMergedValue8 = intermediateValue94 - (intermediateValue108 * intermediateValue94);
                        }
                        else
                        {
                            branchMergedValue5 = 0.33399999141693115234375;
                            branchMergedValue7 = 0.33399999141693115234375;
                            branchMergedValue8 = 0.33399999141693115234375;
                        }
                        intermediateValue104 = branchMergedValue8;
                        intermediateValue105 = branchMergedValue7;
                        intermediateValue106 = branchMergedValue5;
                    }
                    else
                    {
                        float sumValue60 = 1.0 - intermediateValue97;
                        intermediateValue104 = sumValue60;
                        intermediateValue105 = sumValue60;
                        intermediateValue106 = sumValue60;
                    }
                    float productValue75 = intermediateValue104 * scalarValue20;
                    float productValue76 = intermediateValue105 * scalarValue21;
                    float productValue77 = intermediateValue106 * scalarValue22;
                    float intermediateValue61;
                    float intermediateValue62;
                    float intermediateValue63;
                    bool intermediateValue109;
                    if (!(dot(vec3(productValue75, productValue76, productValue77), vec3(1.0)) <= 0.00999999977648258209228515625))
                    {
                        intermediateValue109 = false;
                        intermediateValue61 = productValue75;
                        intermediateValue62 = productValue76;
                        intermediateValue63 = productValue77;
                    }
                    else
                    {
                        intermediateValue109 = true;
                        intermediateValue61 = 0.0;
                        intermediateValue62 = 0.0;
                        intermediateValue63 = 0.0;
                    }
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if (intermediateValue109)
                    {
                        rayQueryConfirmIntersectionEXT(intermediateValue30);
                        branchMergedValue9 = intermediateValue63;
                        branchMergedValue10 = intermediateValue62;
                        branchMergedValue11 = intermediateValue61;
                    }
                    else
                    {
                        branchMergedValue9 = intermediateValue63;
                        branchMergedValue10 = intermediateValue62;
                        branchMergedValue11 = intermediateValue61;
                    }
                    branchMergedValue = branchMergedValue9;
                    branchMergedValue1 = branchMergedValue10;
                    branchMergedValue2 = branchMergedValue11;
                }
                else
                {
                    branchMergedValue = scalarValue22;
                    branchMergedValue1 = scalarValue21;
                    branchMergedValue2 = scalarValue20;
                }
                intermediateValue44 = branchMergedValue;
                intermediateValue42 = branchMergedValue1;
                intermediateValue40 = branchMergedValue2;
                bool conditionValue6 = rayQueryProceedEXT(intermediateValue30);
                if (conditionValue6)
                {
                    scalarValue20 = intermediateValue40;
                    scalarValue21 = intermediateValue42;
                    scalarValue22 = intermediateValue44;
                    continue;
                }
                else
                {
                    break;
                }
            }
            intermediateValue39 = intermediateValue40;
            intermediateValue41 = intermediateValue42;
            intermediateValue43 = intermediateValue44;
        }
        else
        {
            intermediateValue39 = 1.0;
            intermediateValue41 = 1.0;
            intermediateValue43 = 1.0;
        }
        uint scalarValue28 = rayQueryGetIntersectionTypeEXT(intermediateValue30, bool(1u));
        bool comparisonValue24 = scalarValue28 == 1u;
        float comparisonValue25 = comparisonValue24 ? 0.0 : intermediateValue39;
        float comparisonValue26 = comparisonValue24 ? 0.0 : intermediateValue41;
        float comparisonValue27 = comparisonValue24 ? 0.0 : intermediateValue43;
        float productValue36;
        float productValue37;
        float productValue38;
        if (intermediateValue29 < 10000.0)
        {
            uint bitwiseValue53 = bitwiseValue6 & 16383u;
            uint productValue78 = (bitwiseValue53 * 76u) + 58u;
            uint productValue79 = (bitwiseValue53 * 76u) + 59u;
            uint productValue80 = (bitwiseValue53 * 76u) + 61u;
            uint productValue81 = (bitwiseValue53 * 38u) + 32u;
            uint productValue82 = (bitwiseValue53 * 38u) + 24u;
            uint productValue83 = (bitwiseValue53 * 76u) + 72u;
            uint bitwiseValue54 = ((bitwiseValue6 >> 13u) & 2u) | ((bitwiseValue6 >> 13u) & 131068u);
            uint productValue84 = uint(objectInstances.packedValues[(bitwiseValue53 * 76u) + 54u]);
            float sumValue61 = (1.0 - intermediateValue27) - intermediateValue28;
            uint sumValue62 = productValue84 + 0u;
            uint productValue85 = uint(objectInstances.packedValues[(bitwiseValue53 * 76u) + 56u]);
            uint productValue86 = productValue85 * (objectInstances_2.packedValues[productValue82] + bitwiseValue54);
            uint bitwiseValue55 = uint(objectInstances.packedValues[productValue83] & 255us);
            uint bitwiseValue56 = (bitwiseValue55 + productValue86) >> 2u;
            uint bitwiseValue57 = uint(objectInstances.packedValues[productValue83] >> 8us);
            uint bitwiseValue60 = (bitwiseValue57 + productValue86) >> 2u;
            bool conditionValue7 = int16_t(objectInstances.packedValues[productValue80]) < int16_t(0us);
            float bitwiseValue38;
            float bitwiseValue39;
            if (conditionValue7)
            {
                uint bitwiseValue61 = vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue60] >> 15u;
                bitwiseValue38 = ((float(bitwiseValue61 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue60] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                bitwiseValue39 = ((float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue60] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue61 & 65534u) * 1.525902189314365386962890625e-05);
            }
            else
            {
                bitwiseValue38 = floor(fma(float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue60] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                bitwiseValue39 = floor(fma(float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue60] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
            }
            uint intermediateValue73;
            if ((objectInstances.packedValues[productValue80] & 256us) == 0us)
            {
                intermediateValue73 = 0u;
            }
            else
            {
                intermediateValue73 = vertexBuffers[nonuniformEXT(sumValue62)].packedValues[(uint(objectInstances.packedValues[(bitwiseValue53 * 76u) + 74u] >> 8us) + productValue86) >> 2u] & 65535u;
            }
            uint bitwiseValue62 = productValue85 * (objectInstances_2.packedValues[productValue82] + (bitwiseValue54 | 1u));
            uint bitwiseValue63 = (bitwiseValue55 + bitwiseValue62) >> 2u;
            uint bitwiseValue64 = (bitwiseValue57 + bitwiseValue62) >> 2u;
            float bitwiseValue58;
            float bitwiseValue59;
            if (conditionValue7)
            {
                uint bitwiseValue65 = vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue64] >> 15u;
                bitwiseValue58 = ((float(bitwiseValue65 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue64] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                bitwiseValue59 = ((float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue64] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue65 & 65534u) * 1.525902189314365386962890625e-05);
            }
            else
            {
                bitwiseValue58 = floor(fma(float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue64] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                bitwiseValue59 = floor(fma(float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue64] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
            }
            uint bitwiseValue66 = productValue85 * (objectInstances_2.packedValues[productValue82] + (bitwiseValue54 ^ 2u));
            uint bitwiseValue67 = (bitwiseValue55 + bitwiseValue66) >> 2u;
            uint bitwiseValue68 = (bitwiseValue57 + bitwiseValue66) >> 2u;
            float bitwiseValue79;
            float bitwiseValue80;
            if (conditionValue7)
            {
                uint bitwiseValue69 = vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue68] >> 15u;
                bitwiseValue79 = ((float(bitwiseValue69 & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue68] << 1u) & 65534u) * 1.525902189314365386962890625e-05);
                bitwiseValue80 = ((float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue68] >> 31u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float(bitwiseValue69 & 65534u) * 1.525902189314365386962890625e-05);
            }
            else
            {
                bitwiseValue79 = floor(fma(float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue68] & 65535u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
                bitwiseValue80 = floor(fma(float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue68] >> 16u) * 1.525902189314365386962890625e-05, 16384.0, 0.5)) * 6.103515625e-05;
            }
            float productValue87 = ((bitwiseValue58 * intermediateValue27) + (bitwiseValue38 * sumValue61)) + (bitwiseValue79 * intermediateValue28);
            float productValue88 = ((bitwiseValue59 * intermediateValue27) + (bitwiseValue39 * sumValue61)) + (bitwiseValue80 * intermediateValue28);
            float bitwiseValue70 = (((float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue63] & 255u) * intermediateValue27) + (float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue56] & 255u) * sumValue61)) + (float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue67] & 255u) * intermediateValue28)) * 0.0039215688593685626983642578125;
            float bitwiseValue71 = (((float((vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue63] >> 8u) & 255u) * intermediateValue27) + (float((vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue56] >> 8u) & 255u) * sumValue61)) + (float((vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue67] >> 8u) & 255u) * intermediateValue28)) * 0.0039215688593685626983642578125;
            float bitwiseValue72 = (((float((vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue63] >> 16u) & 255u) * intermediateValue27) + (float((vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue56] >> 16u) & 255u) * sumValue61)) + (float((vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue67] >> 16u) & 255u) * intermediateValue28)) * 0.0039215688593685626983642578125;
            float bitwiseValue73 = (((float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue63] >> 24u) * intermediateValue27) + (float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue56] >> 24u) * sumValue61)) + (float(vertexBuffers[nonuniformEXT(sumValue62)].packedValues[bitwiseValue67] >> 24u) * intermediateValue28)) * 0.0039215688593685626983642578125;
            vec2 reinterpretedBits5 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[intermediateValue73 * 8u]);
            vec2 reinterpretedBits6 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue73 * 8u) + 1u]);
            float reinterpretedBits7 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue73 * 16u) + 13u]);
            float reinterpretedBits8 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue73 * 16u) + 14u]);
            float nonlinearValue2 = spvNMax(0.0, log2(abs((ViewCB.packedValues[89u].y * scalarValue1) + (intermediateValue29 * 0.100000001490116119384765625))) + float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(productValue84 + 0u)].packedValues[(((objectInstances_2.packedValues[(bitwiseValue53 * 38u) + 25u] >> 2u) + ((bitwiseValue6 >> 15u) & 32767u)) * 8u) + 6u])));
            uint reinterpretedBits14;
            if (objectInstances.packedValues[productValue78] > 4095us)
            {
                reinterpretedBits14 = floatBitsToUint(ViewCB.packedValues[98u]).w;
            }
            else
            {
                reinterpretedBits14 = uint(objectInstances.packedValues[productValue78]);
            }
            uint sumValue63 = reinterpretedBits14 + 0u;
            float intermediateValue98;
            float intermediateValue99;
            float intermediateValue100;
            float intermediateValue101;
            if (objectInstances.packedValues[productValue78] == 65535us)
            {
                intermediateValue98 = 1.0;
                intermediateValue99 = 1.0;
                intermediateValue100 = 1.0;
                intermediateValue101 = 1.0;
            }
            else
            {
                vec4 sampledTextureValue6 = textureLod(nonuniformEXT(sampler2D(textures[sumValue63], defaultSampler)), vec2(productValue87, productValue88), spvNMin(nonlinearValue2, reinterpretedBits7));
                intermediateValue98 = sampledTextureValue6.x;
                intermediateValue99 = sampledTextureValue6.y;
                intermediateValue100 = sampledTextureValue6.z;
                intermediateValue101 = sampledTextureValue6.w;
            }
            float productValue116;
            float productValue117;
            float productValue118;
            if ((objectInstances.packedValues[productValue80] & 1536us) == 0us)
            {
                float intermediateValue110;
                float intermediateValue111;
                float intermediateValue112;
                float intermediateValue113;
                if ((objectInstances.packedValues[productValue80] & 4us) == 0us)
                {
                    intermediateValue110 = intermediateValue101;
                    intermediateValue111 = bitwiseValue70;
                    intermediateValue112 = bitwiseValue71;
                    intermediateValue113 = bitwiseValue72;
                }
                else
                {
                    uint reinterpretedBits16;
                    if (objectInstances.packedValues[productValue79] > 4095us)
                    {
                        reinterpretedBits16 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits16 = uint(objectInstances.packedValues[productValue79]);
                    }
                    vec4 sampledTextureValue7 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits16 + 0u], defaultSampler)), vec2(bitwiseValue70, bitwiseValue71), 0.0);
                    intermediateValue110 = 1.0;
                    intermediateValue111 = ((((sampledTextureValue7.x * 2.0) + (-1.0)) * bitwiseValue72) + 1.0) * bitwiseValue73;
                    intermediateValue112 = ((((sampledTextureValue7.y * 2.0) + (-1.0)) * bitwiseValue72) + 1.0) * bitwiseValue73;
                    intermediateValue113 = ((((sampledTextureValue7.z * 2.0) + (-1.0)) * bitwiseValue72) + 1.0) * bitwiseValue73;
                }
                float intermediateValue116;
                float intermediateValue117;
                float intermediateValue118;
                if ((objectInstances.packedValues[productValue80] & 8192us) == 0us)
                {
                    intermediateValue116 = intermediateValue111;
                    intermediateValue117 = intermediateValue112;
                    intermediateValue118 = intermediateValue113;
                }
                else
                {
                    intermediateValue116 = ((1.0 - intermediateValue111) * intermediateValue110) + intermediateValue111;
                    intermediateValue117 = ((1.0 - intermediateValue112) * intermediateValue110) + intermediateValue112;
                    intermediateValue118 = ((1.0 - intermediateValue113) * intermediateValue110) + intermediateValue113;
                }
                float intermediateValue120;
                if ((objectInstances.packedValues[productValue80] & 2048us) == 0us)
                {
                    intermediateValue120 = intermediateValue110;
                }
                else
                {
                    intermediateValue120 = spvNClamp(fma(intermediateValue110, 2.0, -1.0), 0.0, 1.0);
                }
                float bitwiseValue74 = (intermediateValue116 * intermediateValue98) * ((intermediateValue120 * ((float(objectInstances_2.packedValues[productValue81] >> 24u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                float bitwiseValue75 = (intermediateValue117 * intermediateValue99) * ((intermediateValue120 * ((float((objectInstances_2.packedValues[productValue81] >> 16u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                float bitwiseValue76 = (intermediateValue118 * intermediateValue100) * ((intermediateValue120 * ((float((objectInstances_2.packedValues[productValue81] >> 8u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                float productValue127;
                if (bitwiseValue74 < 0.040449999272823333740234375)
                {
                    productValue127 = bitwiseValue74 * 0.077399380505084991455078125;
                }
                else
                {
                    productValue127 = exp2(log2((bitwiseValue74 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                }
                float productValue128;
                if (bitwiseValue75 < 0.040449999272823333740234375)
                {
                    productValue128 = bitwiseValue75 * 0.077399380505084991455078125;
                }
                else
                {
                    productValue128 = exp2(log2((bitwiseValue75 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                }
                float productValue129;
                if (bitwiseValue76 < 0.040449999272823333740234375)
                {
                    productValue129 = bitwiseValue76 * 0.077399380505084991455078125;
                }
                else
                {
                    productValue129 = exp2(log2((bitwiseValue76 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                }
                float reinterpretedBits18;
                if ((pbrTextureDataBuffer.packedValues[(intermediateValue73 * 16u) + 8u] & 1u) == 0u)
                {
                    reinterpretedBits18 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue73 * 16u) + 10u]);
                }
                else
                {
                    vec4 sampledTextureValue8 = textureLod(nonuniformEXT(sampler2D(textures[sumValue63], defaultSampler)), vec2(fma(productValue87, reinterpretedBits5.x, reinterpretedBits6.x), fma(productValue88, reinterpretedBits5.y, reinterpretedBits6.y)), spvNMin((reinterpretedBits8 - reinterpretedBits7) + nonlinearValue2, reinterpretedBits8));
                    float scalarValue29 = sampledTextureValue8.y;
                    reinterpretedBits18 = fma(scalarValue29, scalarValue29, 0.0);
                }
                float dotProductValue2 = dot(vec3(productValue127, productValue128, productValue129), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                float productValue89 = (reinterpretedBits18 * 5.0) * ViewCB.packedValues[84u].w;
                productValue116 = productValue89 * (((dotProductValue2 - productValue127) * ViewCB.packedValues[85u].x) + productValue127);
                productValue117 = productValue89 * (((dotProductValue2 - productValue128) * ViewCB.packedValues[85u].x) + productValue128);
                productValue118 = productValue89 * (((dotProductValue2 - productValue129) * ViewCB.packedValues[85u].x) + productValue129);
            }
            else
            {
                productValue116 = intermediateValue107;
                productValue117 = intermediateValue107;
                productValue118 = intermediateValue107;
            }
            productValue36 = (productValue116 * comparisonValue25) * ViewCB.packedValues[85u].y;
            productValue37 = (productValue117 * comparisonValue26) * ViewCB.packedValues[85u].y;
            productValue38 = (productValue118 * comparisonValue27) * ViewCB.packedValues[85u].y;
        }
        else
        {
            productValue36 = 0.0;
            productValue37 = 0.0;
            productValue38 = 0.0;
        }
        float dotProductValue3 = dot(vec3((ViewCB.packedValues[59u].x * comparisonValue25) + productValue36, (ViewCB.packedValues[59u].y * comparisonValue26) + productValue37, (ViewCB.packedValues[59u].z * comparisonValue27) + productValue38), vec3(0.066666670143604278564453125));
        uvec4 reinterpretedBits10 = floatBitsToUint(ViewCB.packedValues[84u]);
        uint scalarValue30 = reinterpretedBits10.z;
        vec4 sampledTextureValue9 = texelFetch(blueNoiseTexture, ivec3(uvec3(bitwiseValue2 & 255u, bitwiseValue3 & 255u, (scalarValue30 >> 2u) & 127u)), int(0u));
        uint bitwiseValue77 = scalarValue30 & 3u;
        float intermediateValue65;
        if (bitwiseValue77 == 0u)
        {
            intermediateValue65 = sampledTextureValue9.x;
        }
        else
        {
            float branchMergedValue4;
            if (bitwiseValue77 == 1u)
            {
                branchMergedValue4 = sampledTextureValue9.y;
            }
            else
            {
                branchMergedValue4 = (bitwiseValue77 == 2u) ? sampledTextureValue9.z : sampledTextureValue9.w;
            }
            intermediateValue65 = branchMergedValue4;
        }
        precise float productValue90 = intermediateValue65 * 32.0;
        uint scalarValue31 = min(uint(productValue90), 31u);
        uint productValue91 = scalarValue31 * 5u;
        vec3 reinterpretedBits11 = uintBitsToFloat(uvec3(inputTemporallyStableLights.packedValues[productValue91], inputTemporallyStableLights.packedValues[productValue91 + 1u], inputTemporallyStableLights.packedValues[productValue91 + 2u]));
        precise float productValue92 = productValue7 * 0.0199999995529651641845703125;
        precise float productValue93 = productValue4 * 0.0199999995529651641845703125;
        precise float productValue94 = productValue8 * 0.0199999995529651641845703125;
        precise float sumValue64 = productValue92 + sumValue6;
        precise float sumValue65 = productValue93 + sumValue5;
        precise float sumValue66 = productValue94 + sumValue7;
        precise float sumValue67 = reinterpretedBits11.x - sumValue64;
        precise float sumValue68 = reinterpretedBits11.y - sumValue65;
        precise float sumValue69 = reinterpretedBits11.z - sumValue66;
        precise float productValue95 = sumValue67 * sumValue67;
        precise float productValue96 = sumValue68 * sumValue68;
        precise float sumValue70 = productValue95 + productValue96;
        precise float productValue97 = sumValue69 * sumValue69;
        precise float sumValue71 = productValue97 + sumValue70;
        float nonlinearValue3 = sqrt(sumValue71);
        precise float quotientValue = sumValue67 / nonlinearValue3;
        precise float quotientValue1 = sumValue68 / nonlinearValue3;
        precise float quotientValue2 = sumValue69 / nonlinearValue3;
        float dotProductValue4 = spvNMax(dot(vec3(quotientValue, quotientValue1, quotientValue2), vec3(productValue7, productValue4, productValue8)), 0.0);
        float branchMergedValue3;
        float branchMergedValue6;
        if (dotProductValue4 > 0.00999999977648258209228515625)
        {
            rayQueryInitializeEXT(intermediateValue67, SceneBVH, 512u, 135u, vec3(sumValue64, sumValue65, sumValue66), 0.0, vec3(quotientValue, quotientValue1, quotientValue2), spvNMax(0.0, nonlinearValue3 + (-0.4000000059604644775390625)));
            bool conditionValue8 = rayQueryProceedEXT(intermediateValue67);
            if (conditionValue8)
            {
                bool intermediateValue88;
                bool comparisonValue28;
                for (;;)
                {
                    uint scalarValue32 = rayQueryGetIntersectionTypeEXT(intermediateValue67, bool(0u));
                    comparisonValue28 = scalarValue32 == 0u;
                    if (comparisonValue28)
                    {
                        vec2 vectorValue6 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue67, bool(0u));
                        vec2 vectorValue7 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue67, bool(0u));
                        uint scalarValue33 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue67, bool(0u));
                        uint scalarValue34 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue67, bool(0u));
                        uint scalarValue35 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue67, bool(0u));
                        uint productValue98 = (scalarValue35 * 76u) + 58u;
                        uint productValue99 = (scalarValue35 * 76u) + 61u;
                        precise float sumValue72 = 1.0 - vectorValue6.x;
                        precise float sumValue73 = sumValue72 - vectorValue7.y;
                        uint bitwiseValue78 = (objectInstances_2.packedValues[(scalarValue35 * 38u) + 25u] >> 2u) + (scalarValue33 >> 1u);
                        uint productValue100 = uint(objectInstances.packedValues[(scalarValue35 * 76u) + 54u]) + 0u;
                        bool comparisonValue29 = (scalarValue33 & 1u) == 0u;
                        uint comparisonValue30 = comparisonValue29 ? faceUvBuffersRW[nonuniformEXT(productValue100)].packedValues[bitwiseValue78].z : faceUvBuffersRW[nonuniformEXT(productValue100)].packedValues[bitwiseValue78].x;
                        uint comparisonValue31 = comparisonValue29 ? faceUvBuffersRW[nonuniformEXT(productValue100)].packedValues[bitwiseValue78].y : faceUvBuffersRW[nonuniformEXT(productValue100)].packedValues[bitwiseValue78].w;
                        uint comparisonValue32 = comparisonValue29 ? faceUvBuffersRW[nonuniformEXT(productValue100)].packedValues[bitwiseValue78].x : faceUvBuffersRW[nonuniformEXT(productValue100)].packedValues[bitwiseValue78].z;
                        bool conditionValue9 = int16_t(objectInstances.packedValues[productValue99]) < int16_t(0us);
                        float intermediateValue92;
                        float intermediateValue93;
                        if (conditionValue9)
                        {
                            uint bitwiseValue81 = comparisonValue32 >> 15u;
                            precise float bitwiseValue82 = float(bitwiseValue81 & 1u) * 2.0;
                            precise float sumValue74 = bitwiseValue82 + (-1.0);
                            precise float bitwiseValue83 = float(comparisonValue32 >> 31u) * 2.0;
                            precise float sumValue75 = bitwiseValue83 + (-1.0);
                            precise float bitwiseValue84 = float((comparisonValue32 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue85 = float(bitwiseValue81 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue101 = sumValue74 * 3.0517578125e-05;
                            precise float productValue102 = sumValue75 * 3.0517578125e-05;
                            precise float sumValue76 = bitwiseValue84 + productValue101;
                            precise float sumValue77 = bitwiseValue85 + productValue102;
                            intermediateValue92 = sumValue76;
                            intermediateValue93 = sumValue77;
                        }
                        else
                        {
                            precise float bitwiseValue86 = float(comparisonValue32 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue87 = float(comparisonValue32 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue103 = bitwiseValue86 * 16384.0;
                            precise float sumValue78 = productValue103 + 0.5;
                            precise float productValue104 = bitwiseValue87 * 16384.0;
                            precise float sumValue79 = productValue104 + 0.5;
                            precise float productValue105 = floor(sumValue78) * 6.103515625e-05;
                            precise float productValue106 = floor(sumValue79) * 6.103515625e-05;
                            intermediateValue92 = productValue105;
                            intermediateValue93 = productValue106;
                        }
                        precise float productValue107 = sumValue73 * intermediateValue92;
                        precise float productValue108 = sumValue73 * intermediateValue93;
                        precise float sumValue80 = productValue107 + 0.0;
                        precise float sumValue81 = productValue108 + 0.0;
                        float intermediateValue102;
                        float intermediateValue103;
                        if (conditionValue9)
                        {
                            uint bitwiseValue88 = comparisonValue31 >> 15u;
                            precise float bitwiseValue89 = float(bitwiseValue88 & 1u) * 2.0;
                            precise float sumValue82 = bitwiseValue89 + (-1.0);
                            precise float bitwiseValue90 = float(comparisonValue31 >> 31u) * 2.0;
                            precise float sumValue83 = bitwiseValue90 + (-1.0);
                            precise float bitwiseValue91 = float((comparisonValue31 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue92 = float(bitwiseValue88 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue109 = sumValue82 * 3.0517578125e-05;
                            precise float productValue110 = sumValue83 * 3.0517578125e-05;
                            precise float sumValue84 = bitwiseValue91 + productValue109;
                            precise float sumValue85 = bitwiseValue92 + productValue110;
                            intermediateValue102 = sumValue84;
                            intermediateValue103 = sumValue85;
                        }
                        else
                        {
                            precise float bitwiseValue93 = float(comparisonValue31 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue94 = float(comparisonValue31 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue111 = bitwiseValue93 * 16384.0;
                            precise float sumValue86 = productValue111 + 0.5;
                            precise float productValue112 = bitwiseValue94 * 16384.0;
                            precise float sumValue87 = productValue112 + 0.5;
                            precise float productValue113 = floor(sumValue86) * 6.103515625e-05;
                            precise float productValue114 = floor(sumValue87) * 6.103515625e-05;
                            intermediateValue102 = productValue113;
                            intermediateValue103 = productValue114;
                        }
                        precise float productValue115 = vectorValue6.x * intermediateValue102;
                        precise float productValue119 = vectorValue6.x * intermediateValue103;
                        precise float sumValue88 = sumValue80 + productValue115;
                        precise float sumValue89 = sumValue81 + productValue119;
                        float intermediateValue114;
                        float intermediateValue115;
                        if (conditionValue9)
                        {
                            uint bitwiseValue95 = comparisonValue30 >> 15u;
                            precise float bitwiseValue96 = float(bitwiseValue95 & 1u) * 2.0;
                            precise float sumValue90 = bitwiseValue96 + (-1.0);
                            precise float bitwiseValue97 = float(comparisonValue30 >> 31u) * 2.0;
                            precise float sumValue91 = bitwiseValue97 + (-1.0);
                            precise float bitwiseValue98 = float((comparisonValue30 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue99 = float(bitwiseValue95 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue120 = sumValue90 * 3.0517578125e-05;
                            precise float productValue121 = sumValue91 * 3.0517578125e-05;
                            precise float sumValue92 = bitwiseValue98 + productValue120;
                            precise float sumValue93 = bitwiseValue99 + productValue121;
                            intermediateValue114 = sumValue92;
                            intermediateValue115 = sumValue93;
                        }
                        else
                        {
                            precise float bitwiseValue100 = float(comparisonValue30 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue101 = float(comparisonValue30 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue122 = bitwiseValue100 * 16384.0;
                            precise float sumValue94 = productValue122 + 0.5;
                            precise float productValue123 = bitwiseValue101 * 16384.0;
                            precise float sumValue95 = productValue123 + 0.5;
                            precise float productValue124 = floor(sumValue94) * 6.103515625e-05;
                            precise float productValue125 = floor(sumValue95) * 6.103515625e-05;
                            intermediateValue114 = productValue124;
                            intermediateValue115 = productValue125;
                        }
                        precise float productValue126 = vectorValue7.y * intermediateValue114;
                        precise float productValue130 = vectorValue7.y * intermediateValue115;
                        precise float sumValue96 = sumValue88 + productValue126;
                        precise float sumValue97 = sumValue89 + productValue130;
                        float intermediateValue119;
                        if (objectInstances.packedValues[productValue98] == 65535us)
                        {
                            intermediateValue119 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits17;
                            if (objectInstances.packedValues[productValue98] > 4095us)
                            {
                                reinterpretedBits17 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits17 = uint(objectInstances.packedValues[productValue98]);
                            }
                            intermediateValue119 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits17 + 0u], defaultSampler)), vec2(sumValue96, sumValue97), -0.25).w;
                        }
                        uint comparisonValue34;
                        if (scalarValue34 == 2u)
                        {
                            comparisonValue34 = 0u;
                        }
                        else
                        {
                            comparisonValue34 = uint(intermediateValue119 <= (((objectInstances.packedValues[productValue99] & 4352us) != 0us) ? 0.5 : 0.0));
                        }
                        if (comparisonValue34 == 0u)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue67);
                        }
                    }
                    intermediateValue88 = rayQueryProceedEXT(intermediateValue67);
                    if (intermediateValue88)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint scalarValue36 = rayQueryGetIntersectionTypeEXT(intermediateValue67, bool(1u));
            bool intermediateValue77;
            if (scalarValue36 == 1u)
            {
                float scalarValue37 = rayQueryGetIntersectionTEXT(intermediateValue67, bool(1u));
                intermediateValue77 = scalarValue37 < 10000.0;
            }
            else
            {
                intermediateValue77 = false;
            }
            float branchMergedValue12;
            float branchMergedValue13;
            if (intermediateValue77)
            {
                branchMergedValue12 = dotProductValue3;
                branchMergedValue13 = 0.0;
            }
            else
            {
                branchMergedValue12 = dotProductValue3;
                branchMergedValue13 = ((uintBitsToFloat(inputTemporallyStableLights.packedValues[(scalarValue31 * 5u) + 3u]) * 32.0) * dotProductValue4) / (nonlinearValue3 * nonlinearValue3);
            }
            branchMergedValue3 = branchMergedValue12;
            branchMergedValue6 = branchMergedValue13;
        }
        else
        {
            branchMergedValue3 = dotProductValue3;
            branchMergedValue6 = 0.0;
        }
        intermediateValue4 = branchMergedValue3;
        intermediateValue5 = branchMergedValue6;
    }
    uint reinterpretedBits12 = floatBitsToUint(intermediateValue4) & 2147483647u;
    uint reinterpretedBits13 = floatBitsToUint(intermediateValue5) & 2147483647u;
    if (((reinterpretedBits12 > 2139095040u) || (reinterpretedBits13 > 2139095040u)) || ((reinterpretedBits12 == 2139095040u) || (reinterpretedBits13 == 2139095040u)))
    {
        if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue4, bitwiseValue5))).w == 0.0)
        {
            imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue4, bitwiseValue5)), vec4(1.0, 0.0, 1.0, 1.0));
            imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
        }
    }
    imageStore(outputAdaptiveDenoiserReference, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue4, intermediateValue5, intermediateValue4, intermediateValue4));
}
