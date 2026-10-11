#version 460
#extension GL_GOOGLE_include_directive : require
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
    uint intermediateValue[3];
    float intermediateValue1[3];
    uint bitwiseValue2;
    uint bitwiseValue3;
    bool reinterpretedBits1;
    for (;;)
    {
        uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
        uint scalarValue = reinterpretedBits.z;
        uint bitwiseValue = gl_WorkGroupID.y >> 4u;
        uint bitwiseValue1 = ((scalarValue & 1023u) * (gl_WorkGroupID.y & 15u)) + gl_WorkGroupID.x;
        uint comparisonValue = (bitwiseValue == ((scalarValue >> 14u) & 63u)) ? ((scalarValue >> 10u) & 15u) : 16u;
        bitwiseValue2 = (rdDivideUnsigned(bitwiseValue1, comparisonValue) << 2u) + gl_LocalInvocationID.x;
        bitwiseValue3 = ((rdModuloUnsigned(bitwiseValue1, comparisonValue) + (bitwiseValue << 4u)) << 3u) + gl_LocalInvocationID.y;
        reinterpretedBits1 = floatBitsToUint(ViewCB.packedValues[91u]).y == 2u;
        if (!reinterpretedBits1)
        {
            uint sampledTextureValue = uint(texelFetch(inputPrimaryThroughput, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u)).w);
            if ((sampledTextureValue & 15u) > ((sampledTextureValue >> 4u) & 15u))
            {
                break;
            }
        }
        vec4 sampledTextureValue1 = texelFetch(inputBufferSurfaceOpacityAndObjectCategory, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue1 = sampledTextureValue1.x;
        precise float productValue = sampledTextureValue1.y * 255.0;
        uint scalarValue2 = uint(productValue);
        if (scalarValue1 == 1.0)
        {
            break;
        }
        vec4 sampledTextureValue2 = texelFetch(inputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue3 = sampledTextureValue2.x;
        if (scalarValue3 == 65504.0)
        {
            break;
        }
        uint bitwiseValue4 = scalarValue2 << 30u;
        vec4 sampledTextureValue3 = texelFetch(inputBufferColourAndMetallic, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue4 = sampledTextureValue3.x;
        float scalarValue5 = sampledTextureValue3.y;
        float scalarValue6 = sampledTextureValue3.z;
        float productValue1 = scalarValue4 * scalarValue4;
        float productValue2 = scalarValue5 * scalarValue5;
        float productValue3 = scalarValue6 * scalarValue6;
        vec4 sampledTextureValue4 = texelFetch(inputGeometryNormal, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue7 = sampledTextureValue4.x;
        float scalarValue8 = sampledTextureValue4.y;
        precise float sumValue = 1.0 - abs(scalarValue7);
        float scalarValue9 = abs(scalarValue8);
        precise float sumValue1 = sumValue - scalarValue9;
        bool conditionValue = sumValue1 < 0.0;
        precise float sumValue2 = 1.0 - scalarValue9;
        precise float comparisonValue1 = ((scalarValue7 >= 0.0) ? 1.0 : (-1.0)) * sumValue2;
        precise float comparisonValue2 = sumValue * ((scalarValue8 >= 0.0) ? 1.0 : (-1.0));
        float comparisonValue3 = conditionValue ? comparisonValue1 : scalarValue7;
        float comparisonValue4 = conditionValue ? comparisonValue2 : scalarValue8;
        float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue3, comparisonValue4, sumValue1), vec3(comparisonValue3, comparisonValue4, sumValue1)));
        precise float productValue4 = inverseLengthValue * comparisonValue3;
        precise float productValue5 = inverseLengthValue * comparisonValue4;
        precise float productValue6 = sumValue1 * inverseLengthValue;
        vec4 sampledTextureValue5 = texelFetch(inputPrimaryWorldPosition, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        precise float sumValue3 = sampledTextureValue5.x + 0.0;
        precise float sumValue4 = sampledTextureValue5.y + 0.0;
        precise float sumValue5 = sampledTextureValue5.z + 0.0;
        vec4 sampledTextureValue6 = texelFetch(inputPrimaryViewDirection, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
        float scalarValue10 = sampledTextureValue6.x;
        float scalarValue11 = sampledTextureValue6.y;
        float scalarValue12 = sampledTextureValue6.z;
        float reinterpretedBits2 = uintBitsToFloat(inputIncidentLight.packedValues[0u]);
        precise float productValue7 = scalarValue3 * ViewCB.packedValues[89u].y;
        bool reinterpretedBits3 = floatBitsToUint(ViewCB.packedValues[54u]).w != 0u;
        uint comparisonValue5 = reinterpretedBits3 ? 0u : 2u;
        float comparisonValue6 = reinterpretedBits3 ? 1.33000004291534423828125 : 1.0;
        uint comparisonValue7 = uint((scalarValue2 & 3u) != 3u);
        uint intermediateValue19;
        float intermediateValue21;
        float intermediateValue23;
        float intermediateValue25;
        float intermediateValue27;
        float intermediateValue29;
        float intermediateValue31;
        float intermediateValue33;
        float intermediateValue35;
        float intermediateValue37;
        float intermediateValue39;
        float intermediateValue41;
        float intermediateValue43;
        float intermediateValue45;
        float intermediateValue47;
        float intermediateValue49;
        float intermediateValue51;
        float intermediateValue54;
        float intermediateValue56;
        float intermediateValue58;
        float intermediateValue60;
        float intermediateValue62;
        float reinterpretedBits4;
        float reinterpretedBits5;
        float reinterpretedBits6;
        uint comparisonValue8;
        float comparisonValue9;
        uint intermediateValue78;
        uint sumValue6;
        float comparisonValue10;
        bool intermediateValue138;
        float intermediateValue64;
        float intermediateValue66;
        float intermediateValue68;
        float productValue8;
        float productValue9;
        float productValue10;
        float intermediateValue80;
        uint intermediateValue82;
        uint scalarValue13 = 0u;
        float scalarValue14 = 0.0;
        float scalarValue15 = 0.0;
        float scalarValue16 = 0.0;
        float scalarValue17 = 0.0;
        float scalarValue18 = 0.0;
        float scalarValue19 = 0.0;
        float scalarValue20 = 0.0;
        float scalarValue21 = 0.0;
        float scalarValue22 = productValue4;
        float scalarValue23 = productValue5;
        float scalarValue24 = productValue6;
        float scalarValue25 = 0.0;
        float scalarValue26 = 0.0;
        float scalarValue27 = sumValue3;
        float scalarValue28 = sumValue4;
        float scalarValue29 = sumValue5;
        float intermediateValue52;
        float scalarValue30 = scalarValue1;
        float scalarValue31 = productValue1;
        float scalarValue32 = productValue2;
        float scalarValue33 = productValue3;
        float scalarValue34 = scalarValue10;
        float scalarValue35 = scalarValue11;
        float scalarValue36 = scalarValue12;
        float scalarValue37 = sumValue3;
        float scalarValue38 = sumValue4;
        float scalarValue39 = sumValue5;
        float scalarValue40 = reinterpretedBits2;
        float scalarValue41 = reinterpretedBits2;
        float scalarValue42 = reinterpretedBits2;
        uint scalarValue43 = comparisonValue5;
        float scalarValue44 = comparisonValue6;
        uint scalarValue45 = comparisonValue7;
        float scalarValue46 = scalarValue3;
        uint scalarValue47 = bitwiseValue4;
        float scalarValue48 = 1.0;
        uint scalarValue49 = 0u;
        float scalarValue50 = 0.0;
        bool comparisonValue11;
        bool comparisonValue12;
        bool comparisonValue13;
        for (;;)
        {
            comparisonValue11 = scalarValue45 == 1u;
            comparisonValue12 = (scalarValue43 != 1u) && comparisonValue11;
            comparisonValue13 = scalarValue45 == 0u;
            uint comparisonValue16;
            float comparisonValue17;
            if (comparisonValue13)
            {
                bool comparisonValue14 = scalarValue43 == 0u;
                comparisonValue16 = comparisonValue14 ? 2u : 0u;
                comparisonValue17 = comparisonValue14 ? 1.0 : 1.33000004291534423828125;
            }
            else
            {
                bool comparisonValue15 = scalarValue43 == 1u;
                comparisonValue16 = comparisonValue15 ? 6u : 1u;
                comparisonValue17 = comparisonValue15 ? scalarValue48 : 1.5;
            }
            uint comparisonValue18;
            float comparisonValue19;
            if (comparisonValue16 == 6u)
            {
                rayQueryInitializeEXT(intermediateValue86, SceneBVH, 512u, 32u, vec3(scalarValue37, scalarValue38, scalarValue39), scalarValue46 + (-0.0500000007450580596923828125), vec3(scalarValue34, scalarValue35, scalarValue36), scalarValue46 + 0.0500000007450580596923828125);
                bool conditionValue1 = rayQueryProceedEXT(intermediateValue86);
                if (conditionValue1)
                {
                    bool intermediateValue103;
                    bool comparisonValue20;
                    for (;;)
                    {
                        uint scalarValue51 = rayQueryGetIntersectionTypeEXT(intermediateValue86, bool(0u));
                        comparisonValue20 = scalarValue51 == 0u;
                        if (comparisonValue20)
                        {
                            vec2 vectorValue = rayQueryGetIntersectionBarycentricsEXT(intermediateValue86, bool(0u));
                            vec2 vectorValue1 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue86, bool(0u));
                            float scalarValue52 = rayQueryGetIntersectionTEXT(intermediateValue86, bool(0u));
                            uint scalarValue53 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue86, bool(0u));
                            uint scalarValue54 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue86, bool(0u));
                            uint scalarValue55 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue86, bool(0u));
                            bool intermediateValue107;
                            if (scalarValue54 == 1u)
                            {
                                uint scalarValue56 = (scalarValue55 * 76u) + 58u;
                                uint productValue11 = (scalarValue55 * 76u) + 61u;
                                precise float sumValue7 = 1.0 - vectorValue.x;
                                precise float sumValue8 = sumValue7 - vectorValue1.y;
                                uint productValue12 = uint(objectInstances.packedValues[(scalarValue55 * 76u) + 54u]);
                                uint bitwiseValue5 = (objectInstances_2.packedValues[(scalarValue55 * 38u) + 25u] >> 2u) + (scalarValue53 >> 1u);
                                uint sumValue9 = productValue12 + 0u;
                                bool comparisonValue21 = (scalarValue53 & 1u) == 0u;
                                uint comparisonValue22 = comparisonValue21 ? faceUvBuffersRW[nonuniformEXT(sumValue9)].packedValues[bitwiseValue5].z : faceUvBuffersRW[nonuniformEXT(sumValue9)].packedValues[bitwiseValue5].x;
                                uint comparisonValue23 = comparisonValue21 ? faceUvBuffersRW[nonuniformEXT(sumValue9)].packedValues[bitwiseValue5].y : faceUvBuffersRW[nonuniformEXT(sumValue9)].packedValues[bitwiseValue5].w;
                                uint comparisonValue24 = comparisonValue21 ? faceUvBuffersRW[nonuniformEXT(sumValue9)].packedValues[bitwiseValue5].x : faceUvBuffersRW[nonuniformEXT(sumValue9)].packedValues[bitwiseValue5].z;
                                bool conditionValue2 = int16_t(objectInstances.packedValues[productValue11]) < int16_t(0us);
                                float intermediateValue125;
                                float intermediateValue126;
                                if (conditionValue2)
                                {
                                    uint bitwiseValue6 = comparisonValue24 >> 15u;
                                    precise float bitwiseValue7 = float(bitwiseValue6 & 1u) * 2.0;
                                    precise float sumValue10 = bitwiseValue7 + (-1.0);
                                    precise float bitwiseValue8 = float(comparisonValue24 >> 31u) * 2.0;
                                    precise float sumValue11 = bitwiseValue8 + (-1.0);
                                    precise float bitwiseValue9 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue10 = float(bitwiseValue6 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue13 = sumValue10 * 3.0517578125e-05;
                                    precise float productValue14 = sumValue11 * 3.0517578125e-05;
                                    precise float sumValue12 = bitwiseValue9 + productValue13;
                                    precise float sumValue13 = bitwiseValue10 + productValue14;
                                    intermediateValue125 = sumValue12;
                                    intermediateValue126 = sumValue13;
                                }
                                else
                                {
                                    precise float bitwiseValue11 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue12 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue15 = bitwiseValue11 * 16384.0;
                                    precise float sumValue14 = productValue15 + 0.5;
                                    precise float productValue16 = bitwiseValue12 * 16384.0;
                                    precise float sumValue15 = productValue16 + 0.5;
                                    precise float productValue17 = floor(sumValue14) * 6.103515625e-05;
                                    precise float productValue18 = floor(sumValue15) * 6.103515625e-05;
                                    intermediateValue125 = productValue17;
                                    intermediateValue126 = productValue18;
                                }
                                precise float productValue19 = sumValue8 * intermediateValue125;
                                precise float productValue20 = sumValue8 * intermediateValue126;
                                precise float sumValue16 = productValue19 + 0.0;
                                precise float sumValue17 = productValue20 + 0.0;
                                float intermediateValue140;
                                float intermediateValue141;
                                if (conditionValue2)
                                {
                                    uint bitwiseValue14 = comparisonValue23 >> 15u;
                                    precise float bitwiseValue16 = float(bitwiseValue14 & 1u) * 2.0;
                                    precise float sumValue18 = bitwiseValue16 + (-1.0);
                                    precise float bitwiseValue17 = float(comparisonValue23 >> 31u) * 2.0;
                                    precise float sumValue19 = bitwiseValue17 + (-1.0);
                                    precise float bitwiseValue18 = float((comparisonValue23 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue19 = float(bitwiseValue14 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue21 = sumValue18 * 3.0517578125e-05;
                                    precise float productValue22 = sumValue19 * 3.0517578125e-05;
                                    precise float sumValue20 = bitwiseValue18 + productValue21;
                                    precise float sumValue21 = bitwiseValue19 + productValue22;
                                    intermediateValue140 = sumValue20;
                                    intermediateValue141 = sumValue21;
                                }
                                else
                                {
                                    precise float bitwiseValue20 = float(comparisonValue23 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue21 = float(comparisonValue23 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue23 = bitwiseValue20 * 16384.0;
                                    precise float sumValue22 = productValue23 + 0.5;
                                    precise float productValue24 = bitwiseValue21 * 16384.0;
                                    precise float sumValue23 = productValue24 + 0.5;
                                    precise float productValue25 = floor(sumValue22) * 6.103515625e-05;
                                    precise float productValue26 = floor(sumValue23) * 6.103515625e-05;
                                    intermediateValue140 = productValue25;
                                    intermediateValue141 = productValue26;
                                }
                                precise float productValue27 = vectorValue.x * intermediateValue140;
                                precise float productValue28 = vectorValue.x * intermediateValue141;
                                precise float sumValue24 = sumValue16 + productValue27;
                                precise float sumValue25 = sumValue17 + productValue28;
                                float intermediateValue176;
                                float intermediateValue177;
                                if (conditionValue2)
                                {
                                    uint bitwiseValue22 = comparisonValue22 >> 15u;
                                    precise float bitwiseValue23 = float(bitwiseValue22 & 1u) * 2.0;
                                    precise float sumValue26 = bitwiseValue23 + (-1.0);
                                    precise float bitwiseValue24 = float(comparisonValue22 >> 31u) * 2.0;
                                    precise float sumValue27 = bitwiseValue24 + (-1.0);
                                    precise float bitwiseValue25 = float((comparisonValue22 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue26 = float(bitwiseValue22 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue29 = sumValue26 * 3.0517578125e-05;
                                    precise float productValue30 = sumValue27 * 3.0517578125e-05;
                                    precise float sumValue28 = bitwiseValue25 + productValue29;
                                    precise float sumValue29 = bitwiseValue26 + productValue30;
                                    intermediateValue176 = sumValue28;
                                    intermediateValue177 = sumValue29;
                                }
                                else
                                {
                                    precise float bitwiseValue27 = float(comparisonValue22 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue28 = float(comparisonValue22 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue31 = bitwiseValue27 * 16384.0;
                                    precise float sumValue30 = productValue31 + 0.5;
                                    precise float productValue32 = bitwiseValue28 * 16384.0;
                                    precise float sumValue31 = productValue32 + 0.5;
                                    precise float productValue33 = floor(sumValue30) * 6.103515625e-05;
                                    precise float productValue34 = floor(sumValue31) * 6.103515625e-05;
                                    intermediateValue176 = productValue33;
                                    intermediateValue177 = productValue34;
                                }
                                precise float productValue35 = vectorValue1.y * intermediateValue176;
                                precise float productValue36 = vectorValue1.y * intermediateValue177;
                                precise float sumValue32 = sumValue24 + productValue35;
                                precise float sumValue33 = sumValue25 + productValue36;
                                uint sumValue34 = productValue12 + 0u;
                                uint reinterpretedBits10;
                                if (objectInstances.packedValues[scalarValue56] > 4095us)
                                {
                                    reinterpretedBits10 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits10 = uint(objectInstances.packedValues[scalarValue56]);
                                }
                                bool branchMergedValue32;
                                if (!(((objectInstances.packedValues[scalarValue56] != 65535us) ? textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits10 + 0u], defaultSampler)), vec2(sumValue32, sumValue33), spvNMin((float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue34)].packedValues[(bitwiseValue5 * 8u) + 6u])) + 1.0) + log2(abs(ViewCB.packedValues[89u].z * scalarValue52)), float(faceDataBuffersRW[nonuniformEXT(sumValue34)].packedValues[(bitwiseValue5 * 8u) + 7u]))).w : 1.0) <= (((objectInstances.packedValues[productValue11] & 4352us) != 0us) ? 0.5 : 0.0)))
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
                                rayQueryConfirmIntersectionEXT(intermediateValue86);
                            }
                        }
                        intermediateValue103 = rayQueryProceedEXT(intermediateValue86);
                        if (intermediateValue103)
                        {
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                uint scalarValue57 = rayQueryGetIntersectionTypeEXT(intermediateValue86, bool(1u));
                float intermediateValue92;
                if (scalarValue57 == 1u)
                {
                    float scalarValue58 = rayQueryGetIntersectionTEXT(intermediateValue86, bool(1u));
                    intermediateValue92 = scalarValue58;
                }
                else
                {
                    intermediateValue92 = 10000.0;
                }
                bool conditionValue3 = intermediateValue92 < 10000.0;
                comparisonValue18 = conditionValue3 ? 0u : 2u;
                comparisonValue19 = conditionValue3 ? 1.33000004291534423828125 : 1.0;
            }
            else
            {
                comparisonValue18 = comparisonValue16;
                comparisonValue19 = comparisonValue17;
            }
            precise float dotProductValue = dot(vec3(scalarValue34, scalarValue35, scalarValue36), vec3(scalarValue22, scalarValue23, scalarValue24));
            precise float sumValue35 = (-0.0) - dotProductValue;
            precise float quotientValue = scalarValue44 / comparisonValue19;
            precise float productValue37 = quotientValue * quotientValue;
            precise float productValue38 = dotProductValue * dotProductValue;
            precise float sumValue36 = 1.0 - productValue38;
            precise float productValue39 = productValue37 * sumValue36;
            bool conditionValue4 = productValue39 > 1.0;
            float intermediateValue94;
            if (conditionValue4)
            {
                precise float productValue40 = dotProductValue * (-2.0);
                precise float productValue41 = scalarValue22 * productValue40;
                precise float productValue42 = scalarValue23 * productValue40;
                precise float productValue43 = scalarValue24 * productValue40;
                precise float sumValue37 = scalarValue34 + productValue41;
                precise float sumValue38 = scalarValue35 + productValue42;
                precise float sumValue39 = scalarValue36 + productValue43;
                intermediateValue64 = sumValue37;
                intermediateValue66 = sumValue38;
                intermediateValue68 = sumValue39;
                intermediateValue94 = 1.0;
            }
            else
            {
                precise float sumValue40 = 1.0 - productValue39;
                float nonlinearValue = sqrt(sumValue40);
                precise float productValue44 = scalarValue34 * quotientValue;
                precise float productValue45 = scalarValue35 * quotientValue;
                precise float productValue46 = scalarValue36 * quotientValue;
                precise float productValue47 = quotientValue * sumValue35;
                precise float sumValue41 = productValue47 - nonlinearValue;
                precise float productValue48 = scalarValue22 * sumValue41;
                precise float productValue49 = scalarValue23 * sumValue41;
                precise float productValue50 = scalarValue24 * sumValue41;
                precise float sumValue42 = productValue44 + productValue48;
                precise float sumValue43 = productValue45 + productValue49;
                precise float sumValue44 = productValue46 + productValue50;
                float quotientValue1 = (scalarValue44 - comparisonValue19) / (comparisonValue19 + scalarValue44);
                float productValue51 = 1.0 - (quotientValue1 * quotientValue1);
                intermediateValue64 = sumValue42;
                intermediateValue66 = sumValue43;
                intermediateValue68 = sumValue44;
                intermediateValue94 = productValue51 - (productValue51 * exp2(log2(1.0 - ((scalarValue44 <= comparisonValue19) ? sumValue35 : nonlinearValue)) * 5.0));
            }
            float comparisonValue25 = conditionValue4 ? scalarValue22 : ((-0.0) - scalarValue22);
            float comparisonValue26 = conditionValue4 ? scalarValue23 : ((-0.0) - scalarValue23);
            float comparisonValue27 = conditionValue4 ? scalarValue24 : ((-0.0) - scalarValue24);
            uint productValue52 = uint(int(comparisonValue25 * 256.0));
            uint productValue53 = uint(int(comparisonValue26 * 256.0));
            uint productValue54 = uint(int(comparisonValue27 * 256.0));
            reinterpretedBits4 = (abs(scalarValue27) < 0.03125) ? ((comparisonValue25 * 1.52587890625e-05) + scalarValue27) : uintBitsToFloat(((scalarValue27 < 0.0) ? (-productValue52) : productValue52) + floatBitsToUint(scalarValue27));
            reinterpretedBits5 = (abs(scalarValue28) < 0.03125) ? ((comparisonValue26 * 1.52587890625e-05) + scalarValue28) : uintBitsToFloat(((scalarValue28 < 0.0) ? (-productValue53) : productValue53) + floatBitsToUint(scalarValue28));
            reinterpretedBits6 = (abs(scalarValue29) < 0.03125) ? ((comparisonValue27 * 1.52587890625e-05) + scalarValue29) : uintBitsToFloat(((scalarValue29 < 0.0) ? (-productValue54) : productValue54) + floatBitsToUint(scalarValue29));
            comparisonValue8 = conditionValue4 ? scalarValue43 : comparisonValue18;
            comparisonValue9 = conditionValue4 ? scalarValue44 : comparisonValue19;
            rayQueryInitializeEXT(intermediateValue95, SceneBVH, (comparisonValue12 ? 544u : 528u) | 512u, 109u, vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6), 0.0, vec3(intermediateValue64, intermediateValue66, intermediateValue68), 10000.0);
            bool conditionValue5 = rayQueryProceedEXT(intermediateValue95);
            if (conditionValue5)
            {
                bool intermediateValue121;
                bool comparisonValue28;
                for (;;)
                {
                    uint scalarValue59 = rayQueryGetIntersectionTypeEXT(intermediateValue95, bool(0u));
                    comparisonValue28 = scalarValue59 == 0u;
                    if (comparisonValue28)
                    {
                        vec2 vectorValue2 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue95, bool(0u));
                        vec2 vectorValue3 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue95, bool(0u));
                        float scalarValue60 = rayQueryGetIntersectionTEXT(intermediateValue95, bool(0u));
                        uint scalarValue61 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue95, bool(0u));
                        uint scalarValue62 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue95, bool(0u));
                        uint scalarValue63 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue95, bool(0u));
                        bool intermediateValue129;
                        if (scalarValue62 == 1u)
                        {
                            uint scalarValue64 = (scalarValue63 * 76u) + 58u;
                            uint productValue55 = (scalarValue63 * 76u) + 61u;
                            precise float sumValue45 = 1.0 - vectorValue2.x;
                            precise float sumValue46 = sumValue45 - vectorValue3.y;
                            uint productValue56 = uint(objectInstances.packedValues[(scalarValue63 * 76u) + 54u]);
                            uint bitwiseValue29 = (objectInstances_2.packedValues[(scalarValue63 * 38u) + 25u] >> 2u) + (scalarValue61 >> 1u);
                            uint sumValue47 = productValue56 + 0u;
                            bool comparisonValue29 = (scalarValue61 & 1u) == 0u;
                            uint comparisonValue30 = comparisonValue29 ? faceUvBuffersRW[nonuniformEXT(sumValue47)].packedValues[bitwiseValue29].z : faceUvBuffersRW[nonuniformEXT(sumValue47)].packedValues[bitwiseValue29].x;
                            uint comparisonValue31 = comparisonValue29 ? faceUvBuffersRW[nonuniformEXT(sumValue47)].packedValues[bitwiseValue29].y : faceUvBuffersRW[nonuniformEXT(sumValue47)].packedValues[bitwiseValue29].w;
                            uint comparisonValue32 = comparisonValue29 ? faceUvBuffersRW[nonuniformEXT(sumValue47)].packedValues[bitwiseValue29].x : faceUvBuffersRW[nonuniformEXT(sumValue47)].packedValues[bitwiseValue29].z;
                            bool conditionValue6 = int16_t(objectInstances.packedValues[productValue55]) < int16_t(0us);
                            float intermediateValue142;
                            float intermediateValue143;
                            if (conditionValue6)
                            {
                                uint bitwiseValue30 = comparisonValue32 >> 15u;
                                precise float bitwiseValue31 = float(bitwiseValue30 & 1u) * 2.0;
                                precise float sumValue48 = bitwiseValue31 + (-1.0);
                                precise float bitwiseValue32 = float(comparisonValue32 >> 31u) * 2.0;
                                precise float sumValue49 = bitwiseValue32 + (-1.0);
                                precise float bitwiseValue33 = float((comparisonValue32 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue34 = float(bitwiseValue30 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue57 = sumValue48 * 3.0517578125e-05;
                                precise float productValue58 = sumValue49 * 3.0517578125e-05;
                                precise float sumValue50 = bitwiseValue33 + productValue57;
                                precise float sumValue51 = bitwiseValue34 + productValue58;
                                intermediateValue142 = sumValue50;
                                intermediateValue143 = sumValue51;
                            }
                            else
                            {
                                precise float bitwiseValue35 = float(comparisonValue32 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue36 = float(comparisonValue32 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue59 = bitwiseValue35 * 16384.0;
                                precise float sumValue52 = productValue59 + 0.5;
                                precise float productValue60 = bitwiseValue36 * 16384.0;
                                precise float sumValue53 = productValue60 + 0.5;
                                precise float productValue61 = floor(sumValue52) * 6.103515625e-05;
                                precise float productValue62 = floor(sumValue53) * 6.103515625e-05;
                                intermediateValue142 = productValue61;
                                intermediateValue143 = productValue62;
                            }
                            precise float productValue63 = sumValue46 * intermediateValue142;
                            precise float productValue64 = sumValue46 * intermediateValue143;
                            precise float sumValue54 = productValue63 + 0.0;
                            precise float sumValue56 = productValue64 + 0.0;
                            float intermediateValue178;
                            float intermediateValue179;
                            if (conditionValue6)
                            {
                                uint bitwiseValue37 = comparisonValue31 >> 15u;
                                precise float bitwiseValue38 = float(bitwiseValue37 & 1u) * 2.0;
                                precise float sumValue57 = bitwiseValue38 + (-1.0);
                                precise float bitwiseValue39 = float(comparisonValue31 >> 31u) * 2.0;
                                precise float sumValue58 = bitwiseValue39 + (-1.0);
                                precise float bitwiseValue40 = float((comparisonValue31 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue41 = float(bitwiseValue37 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue65 = sumValue57 * 3.0517578125e-05;
                                precise float productValue66 = sumValue58 * 3.0517578125e-05;
                                precise float sumValue59 = bitwiseValue40 + productValue65;
                                precise float sumValue60 = bitwiseValue41 + productValue66;
                                intermediateValue178 = sumValue59;
                                intermediateValue179 = sumValue60;
                            }
                            else
                            {
                                precise float bitwiseValue42 = float(comparisonValue31 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue43 = float(comparisonValue31 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue67 = bitwiseValue42 * 16384.0;
                                precise float sumValue61 = productValue67 + 0.5;
                                precise float productValue68 = bitwiseValue43 * 16384.0;
                                precise float sumValue62 = productValue68 + 0.5;
                                precise float productValue69 = floor(sumValue61) * 6.103515625e-05;
                                precise float productValue70 = floor(sumValue62) * 6.103515625e-05;
                                intermediateValue178 = productValue69;
                                intermediateValue179 = productValue70;
                            }
                            precise float productValue71 = vectorValue2.x * intermediateValue178;
                            precise float productValue72 = vectorValue2.x * intermediateValue179;
                            precise float sumValue63 = sumValue54 + productValue71;
                            precise float sumValue64 = sumValue56 + productValue72;
                            float intermediateValue195;
                            float intermediateValue196;
                            if (conditionValue6)
                            {
                                uint bitwiseValue44 = comparisonValue30 >> 15u;
                                precise float bitwiseValue45 = float(bitwiseValue44 & 1u) * 2.0;
                                precise float sumValue65 = bitwiseValue45 + (-1.0);
                                precise float bitwiseValue46 = float(comparisonValue30 >> 31u) * 2.0;
                                precise float sumValue66 = bitwiseValue46 + (-1.0);
                                precise float bitwiseValue47 = float((comparisonValue30 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue48 = float(bitwiseValue44 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue73 = sumValue65 * 3.0517578125e-05;
                                precise float productValue74 = sumValue66 * 3.0517578125e-05;
                                precise float sumValue67 = bitwiseValue47 + productValue73;
                                precise float sumValue68 = bitwiseValue48 + productValue74;
                                intermediateValue195 = sumValue67;
                                intermediateValue196 = sumValue68;
                            }
                            else
                            {
                                precise float bitwiseValue49 = float(comparisonValue30 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue50 = float(comparisonValue30 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue75 = bitwiseValue49 * 16384.0;
                                precise float sumValue69 = productValue75 + 0.5;
                                precise float productValue76 = bitwiseValue50 * 16384.0;
                                precise float sumValue70 = productValue76 + 0.5;
                                precise float productValue77 = floor(sumValue69) * 6.103515625e-05;
                                precise float productValue78 = floor(sumValue70) * 6.103515625e-05;
                                intermediateValue195 = productValue77;
                                intermediateValue196 = productValue78;
                            }
                            precise float productValue79 = vectorValue3.y * intermediateValue195;
                            precise float productValue80 = vectorValue3.y * intermediateValue196;
                            precise float sumValue71 = sumValue63 + productValue79;
                            precise float sumValue72 = sumValue64 + productValue80;
                            uint sumValue73 = productValue56 + 0u;
                            uint reinterpretedBits17;
                            if (objectInstances.packedValues[scalarValue64] > 4095us)
                            {
                                reinterpretedBits17 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits17 = uint(objectInstances.packedValues[scalarValue64]);
                            }
                            bool branchMergedValue33;
                            if (!(((objectInstances.packedValues[scalarValue64] != 65535us) ? textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits17 + 0u], defaultSampler)), vec2(sumValue71, sumValue72), spvNMin((float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue73)].packedValues[(bitwiseValue29 * 8u) + 6u])) + 1.0) + log2(abs(ViewCB.packedValues[89u].z * scalarValue60)), float(faceDataBuffersRW[nonuniformEXT(sumValue73)].packedValues[(bitwiseValue29 * 8u) + 7u]))).w : 1.0) <= (((objectInstances.packedValues[productValue55] & 4352us) != 0us) ? 0.5 : 0.0)))
                            {
                                branchMergedValue33 = true;
                            }
                            else
                            {
                                branchMergedValue33 = false;
                            }
                            intermediateValue129 = branchMergedValue33;
                        }
                        else
                        {
                            intermediateValue129 = true;
                        }
                        if (intermediateValue129)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue95);
                        }
                    }
                    intermediateValue121 = rayQueryProceedEXT(intermediateValue95);
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
            uint scalarValue65 = rayQueryGetIntersectionTypeEXT(intermediateValue95, bool(1u));
            float intermediateValue122;
            float intermediateValue123;
            float intermediateValue124;
            uint bitwiseValue13;
            if (scalarValue65 == 1u)
            {
                vec2 vectorValue4 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue95, bool(1u));
                vec2 vectorValue5 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue95, bool(1u));
                float scalarValue66 = rayQueryGetIntersectionTEXT(intermediateValue95, bool(1u));
                uint scalarValue67 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue95, bool(1u));
                uint scalarValue68 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue95, bool(1u));
                uint scalarValue69 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue95, bool(1u));
                intermediateValue122 = vectorValue4.x;
                intermediateValue123 = vectorValue5.y;
                intermediateValue124 = scalarValue66;
                bitwiseValue13 = ((scalarValue68 << 30u) | ((scalarValue67 << 14u) & 1073725440u)) | (scalarValue69 & 16383u);
            }
            else
            {
                intermediateValue122 = 0.0;
                intermediateValue123 = 0.0;
                intermediateValue124 = 10000.0;
                bitwiseValue13 = scalarValue47 | 1073741823u;
            }
            sumValue6 = scalarValue49 + 1u;
            float intermediateValue133;
            float intermediateValue135;
            if (comparisonValue8 == 0u)
            {
                bool conditionValue7 = intermediateValue124 < 10000.0;
                rayQueryInitializeEXT(intermediateValue131, SceneBVH, 512u, 32u, vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6), 0.0, vec3(intermediateValue64, intermediateValue66, intermediateValue68), conditionValue7 ? (intermediateValue124 + 0.0500000007450580596923828125) : 10000.0);
                bool conditionValue8 = rayQueryProceedEXT(intermediateValue131);
                if (conditionValue8)
                {
                    bool intermediateValue175;
                    bool comparisonValue34;
                    for (;;)
                    {
                        uint scalarValue70 = rayQueryGetIntersectionTypeEXT(intermediateValue131, bool(0u));
                        comparisonValue34 = scalarValue70 == 0u;
                        if (comparisonValue34)
                        {
                            vec2 vectorValue6 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue131, bool(0u));
                            vec2 vectorValue7 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue131, bool(0u));
                            float scalarValue71 = rayQueryGetIntersectionTEXT(intermediateValue131, bool(0u));
                            uint scalarValue72 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue131, bool(0u));
                            uint scalarValue73 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue131, bool(0u));
                            uint scalarValue74 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue131, bool(0u));
                            bool intermediateValue182;
                            if (scalarValue73 == 1u)
                            {
                                uint scalarValue75 = (scalarValue74 * 76u) + 58u;
                                uint productValue81 = (scalarValue74 * 76u) + 61u;
                                precise float sumValue74 = 1.0 - vectorValue6.x;
                                precise float sumValue75 = sumValue74 - vectorValue7.y;
                                uint productValue82 = uint(objectInstances.packedValues[(scalarValue74 * 76u) + 54u]);
                                uint bitwiseValue51 = (objectInstances_2.packedValues[(scalarValue74 * 38u) + 25u] >> 2u) + (scalarValue72 >> 1u);
                                uint sumValue76 = productValue82 + 0u;
                                bool comparisonValue33 = (scalarValue72 & 1u) == 0u;
                                uint comparisonValue35 = comparisonValue33 ? faceUvBuffersRW[nonuniformEXT(sumValue76)].packedValues[bitwiseValue51].z : faceUvBuffersRW[nonuniformEXT(sumValue76)].packedValues[bitwiseValue51].x;
                                uint comparisonValue36 = comparisonValue33 ? faceUvBuffersRW[nonuniformEXT(sumValue76)].packedValues[bitwiseValue51].y : faceUvBuffersRW[nonuniformEXT(sumValue76)].packedValues[bitwiseValue51].w;
                                uint comparisonValue37 = comparisonValue33 ? faceUvBuffersRW[nonuniformEXT(sumValue76)].packedValues[bitwiseValue51].x : faceUvBuffersRW[nonuniformEXT(sumValue76)].packedValues[bitwiseValue51].z;
                                bool conditionValue9 = int16_t(objectInstances.packedValues[productValue81]) < int16_t(0us);
                                float intermediateValue197;
                                float intermediateValue198;
                                if (conditionValue9)
                                {
                                    uint bitwiseValue52 = comparisonValue37 >> 15u;
                                    precise float bitwiseValue53 = float(bitwiseValue52 & 1u) * 2.0;
                                    precise float sumValue77 = bitwiseValue53 + (-1.0);
                                    precise float bitwiseValue54 = float(comparisonValue37 >> 31u) * 2.0;
                                    precise float sumValue78 = bitwiseValue54 + (-1.0);
                                    precise float bitwiseValue55 = float((comparisonValue37 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue56 = float(bitwiseValue52 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue83 = sumValue77 * 3.0517578125e-05;
                                    precise float productValue84 = sumValue78 * 3.0517578125e-05;
                                    precise float sumValue79 = bitwiseValue55 + productValue83;
                                    precise float sumValue80 = bitwiseValue56 + productValue84;
                                    intermediateValue197 = sumValue79;
                                    intermediateValue198 = sumValue80;
                                }
                                else
                                {
                                    precise float bitwiseValue57 = float(comparisonValue37 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue58 = float(comparisonValue37 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue85 = bitwiseValue57 * 16384.0;
                                    precise float sumValue81 = productValue85 + 0.5;
                                    precise float productValue86 = bitwiseValue58 * 16384.0;
                                    precise float sumValue82 = productValue86 + 0.5;
                                    precise float productValue87 = floor(sumValue81) * 6.103515625e-05;
                                    precise float productValue88 = floor(sumValue82) * 6.103515625e-05;
                                    intermediateValue197 = productValue87;
                                    intermediateValue198 = productValue88;
                                }
                                precise float productValue89 = sumValue75 * intermediateValue197;
                                precise float productValue90 = sumValue75 * intermediateValue198;
                                precise float sumValue83 = productValue89 + 0.0;
                                precise float sumValue84 = productValue90 + 0.0;
                                float intermediateValue206;
                                float intermediateValue207;
                                if (conditionValue9)
                                {
                                    uint bitwiseValue59 = comparisonValue36 >> 15u;
                                    precise float bitwiseValue60 = float(bitwiseValue59 & 1u) * 2.0;
                                    precise float sumValue85 = bitwiseValue60 + (-1.0);
                                    precise float bitwiseValue61 = float(comparisonValue36 >> 31u) * 2.0;
                                    precise float sumValue86 = bitwiseValue61 + (-1.0);
                                    precise float bitwiseValue62 = float((comparisonValue36 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue63 = float(bitwiseValue59 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue91 = sumValue85 * 3.0517578125e-05;
                                    precise float productValue92 = sumValue86 * 3.0517578125e-05;
                                    precise float sumValue87 = bitwiseValue62 + productValue91;
                                    precise float sumValue88 = bitwiseValue63 + productValue92;
                                    intermediateValue206 = sumValue87;
                                    intermediateValue207 = sumValue88;
                                }
                                else
                                {
                                    precise float bitwiseValue64 = float(comparisonValue36 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue65 = float(comparisonValue36 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue93 = bitwiseValue64 * 16384.0;
                                    precise float sumValue89 = productValue93 + 0.5;
                                    precise float productValue94 = bitwiseValue65 * 16384.0;
                                    precise float sumValue90 = productValue94 + 0.5;
                                    precise float productValue95 = floor(sumValue89) * 6.103515625e-05;
                                    precise float productValue96 = floor(sumValue90) * 6.103515625e-05;
                                    intermediateValue206 = productValue95;
                                    intermediateValue207 = productValue96;
                                }
                                precise float productValue97 = vectorValue6.x * intermediateValue206;
                                precise float productValue98 = vectorValue6.x * intermediateValue207;
                                precise float sumValue91 = sumValue83 + productValue97;
                                precise float sumValue92 = sumValue84 + productValue98;
                                float intermediateValue230;
                                float intermediateValue231;
                                if (conditionValue9)
                                {
                                    uint bitwiseValue66 = comparisonValue35 >> 15u;
                                    precise float bitwiseValue67 = float(bitwiseValue66 & 1u) * 2.0;
                                    precise float sumValue93 = bitwiseValue67 + (-1.0);
                                    precise float bitwiseValue68 = float(comparisonValue35 >> 31u) * 2.0;
                                    precise float sumValue94 = bitwiseValue68 + (-1.0);
                                    precise float bitwiseValue69 = float((comparisonValue35 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue70 = float(bitwiseValue66 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue99 = sumValue93 * 3.0517578125e-05;
                                    precise float productValue100 = sumValue94 * 3.0517578125e-05;
                                    precise float sumValue95 = bitwiseValue69 + productValue99;
                                    precise float sumValue96 = bitwiseValue70 + productValue100;
                                    intermediateValue230 = sumValue95;
                                    intermediateValue231 = sumValue96;
                                }
                                else
                                {
                                    precise float bitwiseValue71 = float(comparisonValue35 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue72 = float(comparisonValue35 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue101 = bitwiseValue71 * 16384.0;
                                    precise float sumValue97 = productValue101 + 0.5;
                                    precise float productValue102 = bitwiseValue72 * 16384.0;
                                    precise float sumValue98 = productValue102 + 0.5;
                                    precise float productValue103 = floor(sumValue97) * 6.103515625e-05;
                                    precise float productValue104 = floor(sumValue98) * 6.103515625e-05;
                                    intermediateValue230 = productValue103;
                                    intermediateValue231 = productValue104;
                                }
                                precise float productValue105 = vectorValue7.y * intermediateValue230;
                                precise float productValue106 = vectorValue7.y * intermediateValue231;
                                precise float sumValue99 = sumValue91 + productValue105;
                                precise float sumValue100 = sumValue92 + productValue106;
                                uint sumValue101 = productValue82 + 0u;
                                uint reinterpretedBits26;
                                if (objectInstances.packedValues[scalarValue75] > 4095us)
                                {
                                    reinterpretedBits26 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits26 = uint(objectInstances.packedValues[scalarValue75]);
                                }
                                bool branchMergedValue35;
                                if (!(((objectInstances.packedValues[scalarValue75] != 65535us) ? textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits26 + 0u], defaultSampler)), vec2(sumValue99, sumValue100), spvNMin((float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue101)].packedValues[(bitwiseValue51 * 8u) + 6u])) + 1.0) + log2(abs(ViewCB.packedValues[89u].z * scalarValue71)), float(faceDataBuffersRW[nonuniformEXT(sumValue101)].packedValues[(bitwiseValue51 * 8u) + 7u]))).w : 1.0) <= (((objectInstances.packedValues[productValue81] & 4352us) != 0us) ? 0.5 : 0.0)))
                                {
                                    branchMergedValue35 = true;
                                }
                                else
                                {
                                    branchMergedValue35 = false;
                                }
                                intermediateValue182 = branchMergedValue35;
                            }
                            else
                            {
                                intermediateValue182 = true;
                            }
                            if (intermediateValue182)
                            {
                                rayQueryConfirmIntersectionEXT(intermediateValue131);
                            }
                        }
                        intermediateValue175 = rayQueryProceedEXT(intermediateValue131);
                        if (intermediateValue175)
                        {
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                uint scalarValue76 = rayQueryGetIntersectionTypeEXT(intermediateValue131, bool(1u));
                float intermediateValue134;
                float intermediateValue136;
                float intermediateValue137;
                uint bitwiseValue15;
                if (scalarValue76 == 1u)
                {
                    vec2 vectorValue8 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue131, bool(1u));
                    vec2 vectorValue9 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue131, bool(1u));
                    float scalarValue77 = rayQueryGetIntersectionTEXT(intermediateValue131, bool(1u));
                    uint scalarValue78 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue131, bool(1u));
                    uint scalarValue79 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue131, bool(1u));
                    uint scalarValue80 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue131, bool(1u));
                    intermediateValue134 = vectorValue8.x;
                    intermediateValue136 = vectorValue9.y;
                    intermediateValue137 = scalarValue77;
                    bitwiseValue15 = ((scalarValue79 << 30u) | ((scalarValue78 << 14u) & 1073725440u)) | (scalarValue80 & 16383u);
                }
                else
                {
                    intermediateValue134 = 0.0;
                    intermediateValue136 = 0.0;
                    intermediateValue137 = 10000.0;
                    bitwiseValue15 = 1073741823u;
                }
                uint branchMergedValue34;
                float branchMergedValue45;
                float branchMergedValue46;
                float branchMergedValue47;
                if (intermediateValue137 < 10000.0)
                {
                    uint branchMergedValue113;
                    float branchMergedValue114;
                    float branchMergedValue115;
                    float branchMergedValue116;
                    if (conditionValue7)
                    {
                        precise float sumValue102 = intermediateValue124 - intermediateValue137;
                        bool bitwiseValue73 = (intermediateValue124 > intermediateValue137) && (abs(sumValue102) > 0.100000001490116119384765625);
                        branchMergedValue113 = bitwiseValue73 ? bitwiseValue15 : bitwiseValue13;
                        branchMergedValue114 = bitwiseValue73 ? intermediateValue137 : intermediateValue124;
                        branchMergedValue115 = bitwiseValue73 ? intermediateValue136 : intermediateValue123;
                        branchMergedValue116 = bitwiseValue73 ? intermediateValue134 : intermediateValue122;
                    }
                    else
                    {
                        branchMergedValue113 = bitwiseValue15;
                        branchMergedValue114 = intermediateValue137;
                        branchMergedValue115 = intermediateValue136;
                        branchMergedValue116 = intermediateValue134;
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
                intermediateValue133 = branchMergedValue47;
                intermediateValue135 = branchMergedValue46;
                intermediateValue80 = branchMergedValue45;
                intermediateValue82 = branchMergedValue34;
            }
            else
            {
                intermediateValue133 = intermediateValue122;
                intermediateValue135 = intermediateValue123;
                intermediateValue80 = intermediateValue124;
                intermediateValue82 = bitwiseValue13;
            }
            intermediateValue138 = intermediateValue80 < 10000.0;
            float comparisonValue38 = intermediateValue138 ? intermediateValue80 : 10000.0;
            uint sumValue103 = comparisonValue8 + 63u;
            float productValue107 = spvNMin(comparisonValue38, 50.0) * (-1.44269502162933349609375);
            float exponentialValue = (intermediateValue94 * scalarValue40) * exp2(productValue107 * ViewCB.packedValues[sumValue103].x);
            float exponentialValue1 = (intermediateValue94 * scalarValue41) * exp2(productValue107 * ViewCB.packedValues[sumValue103].y);
            float exponentialValue2 = (intermediateValue94 * scalarValue42) * exp2(productValue107 * ViewCB.packedValues[sumValue103].z);
            comparisonValue10 = (comparisonValue8 == 2u) ? (comparisonValue38 + scalarValue50) : scalarValue50;
            if (comparisonValue11)
            {
                productValue8 = exponentialValue * (scalarValue31 - (scalarValue31 * scalarValue30));
                productValue9 = exponentialValue1 * (scalarValue32 - (scalarValue32 * scalarValue30));
                productValue10 = exponentialValue2 * (scalarValue33 - (scalarValue33 * scalarValue30));
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
            if (intermediateValue138)
            {
                uint bitwiseValue74 = intermediateValue82 & 16383u;
                uint productValue108 = bitwiseValue74 * 38u;
                vec4 reinterpretedBits7 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue108], objectInstances_2.packedValues[productValue108 + 1u], objectInstances_2.packedValues[productValue108 + 2u], objectInstances_2.packedValues[productValue108 + 3u]));
                float scalarValue81 = reinterpretedBits7.x;
                float scalarValue82 = reinterpretedBits7.y;
                float scalarValue83 = reinterpretedBits7.z;
                uint productValue109 = (bitwiseValue74 * 38u) + 4u;
                vec4 reinterpretedBits8 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue109], objectInstances_2.packedValues[productValue109 + 1u], objectInstances_2.packedValues[productValue109 + 2u], objectInstances_2.packedValues[productValue109 + 3u]));
                float scalarValue84 = reinterpretedBits8.x;
                float scalarValue85 = reinterpretedBits8.y;
                float scalarValue86 = reinterpretedBits8.z;
                uint productValue110 = (bitwiseValue74 * 38u) + 8u;
                vec4 reinterpretedBits9 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue110], objectInstances_2.packedValues[productValue110 + 1u], objectInstances_2.packedValues[productValue110 + 2u], objectInstances_2.packedValues[productValue110 + 3u]));
                float scalarValue87 = reinterpretedBits9.x;
                float scalarValue88 = reinterpretedBits9.y;
                float scalarValue89 = reinterpretedBits9.z;
                uint productValue111 = (bitwiseValue74 * 38u) + 24u;
                uint productValue112 = (bitwiseValue74 * 38u) + 25u;
                uint productValue113 = (bitwiseValue74 * 76u) + 61u;
                uint productValue114 = (bitwiseValue74 * 76u) + 72u;
                uint bitwiseValue75 = ((intermediateValue82 >> 13u) & 2u) | ((intermediateValue82 >> 13u) & 131068u);
                uint bitwiseValue76 = bitwiseValue75 | 1u;
                uint bitwiseValue77 = bitwiseValue75 ^ 2u;
                intermediateValue[0u] = bitwiseValue75;
                intermediateValue[1u] = bitwiseValue76;
                intermediateValue[2u] = bitwiseValue77;
                uint productValue115 = uint(objectInstances.packedValues[(bitwiseValue74 * 76u) + 54u]);
                uint sumValue104 = productValue115 + 0u;
                uint bitwiseValue78 = (objectInstances_2.packedValues[productValue112] >> 2u) + ((intermediateValue82 >> 15u) & 32767u);
                uint productValue116 = bitwiseValue78 * 4u;
                float productValue117 = float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue104)].packedValues[(bitwiseValue78 * 8u) + 6u]));
                precise float bitwiseValue79 = float(faceDataBuffersRW_2[nonuniformEXT(sumValue104)].packedValues[productValue116] & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue105 = bitwiseValue79 + (-1.0);
                precise float bitwiseValue80 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue104)].packedValues[productValue116] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue106 = bitwiseValue80 + (-1.0);
                precise float bitwiseValue81 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue104)].packedValues[productValue116] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue107 = bitwiseValue81 + (-1.0);
                precise float sumValue108 = 1.0 - intermediateValue133;
                precise float sumValue109 = sumValue108 - intermediateValue135;
                intermediateValue1[0u] = sumValue109;
                intermediateValue1[1u] = intermediateValue133;
                intermediateValue1[2u] = intermediateValue135;
                uint sumValue110 = productValue115 + 0u;
                uint productValue118 = uint(objectInstances.packedValues[(bitwiseValue74 * 76u) + 56u]);
                uint productValue119 = productValue118 * (objectInstances_2.packedValues[productValue111] + bitwiseValue75);
                uint bitwiseValue82 = uint(objectInstances.packedValues[(bitwiseValue74 * 76u) + 71u] & 255us);
                uint bitwiseValue83 = (bitwiseValue82 + productValue119) >> 1u;
                f16vec3 sumValue55 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue110)].packedValues[bitwiseValue83], vertexBuffers[nonuniformEXT(sumValue110)].packedValues[bitwiseValue83 + 1u], vertexBuffers[nonuniformEXT(sumValue110)].packedValues[bitwiseValue83 + 2u]));
                uint bitwiseValue84 = uint(objectInstances.packedValues[productValue114] & 255us);
                uint bitwiseValue85 = (bitwiseValue84 + productValue119) >> 2u;
                precise float bitwiseValue86 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue85] & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue87 = float((vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue85] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue88 = float((vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue85] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue89 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue85] >> 24u) * 0.0039215688593685626983642578125;
                uint bitwiseValue90 = uint(objectInstances.packedValues[productValue114] >> 8us);
                uint bitwiseValue91 = (bitwiseValue90 + productValue119) >> 2u;
                bool conditionValue10 = int16_t(objectInstances.packedValues[productValue113]) < int16_t(0us);
                float intermediateValue183;
                float intermediateValue184;
                if (conditionValue10)
                {
                    uint bitwiseValue92 = vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue91] >> 15u;
                    precise float bitwiseValue93 = float(bitwiseValue92 & 1u) * 2.0;
                    precise float sumValue111 = bitwiseValue93 + (-1.0);
                    precise float bitwiseValue94 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue91] >> 31u) * 2.0;
                    precise float sumValue112 = bitwiseValue94 + (-1.0);
                    precise float bitwiseValue95 = float((vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue91] << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue96 = float(bitwiseValue92 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue120 = sumValue111 * 3.0517578125e-05;
                    precise float productValue121 = sumValue112 * 3.0517578125e-05;
                    precise float sumValue114 = bitwiseValue95 + productValue120;
                    precise float sumValue115 = bitwiseValue96 + productValue121;
                    intermediateValue183 = sumValue114;
                    intermediateValue184 = sumValue115;
                }
                else
                {
                    precise float bitwiseValue97 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue91] & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue98 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue91] >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue122 = bitwiseValue97 * 16384.0;
                    precise float sumValue116 = productValue122 + 0.5;
                    precise float productValue123 = bitwiseValue98 * 16384.0;
                    precise float sumValue117 = productValue123 + 0.5;
                    precise float productValue124 = floor(sumValue116) * 6.103515625e-05;
                    precise float productValue125 = floor(sumValue117) * 6.103515625e-05;
                    intermediateValue183 = productValue124;
                    intermediateValue184 = productValue125;
                }
                uint intermediateValue161;
                if ((objectInstances.packedValues[productValue113] & 256us) == 0us)
                {
                    intermediateValue161 = 0u;
                }
                else
                {
                    intermediateValue161 = vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[(uint(objectInstances.packedValues[(bitwiseValue74 * 76u) + 74u] >> 8us) + productValue119) >> 2u] & 65535u;
                }
                precise float productValue126 = sumValue109 * float(sumValue55.x);
                precise float productValue127 = sumValue109 * float(sumValue55.y);
                precise float productValue128 = sumValue109 * float(sumValue55.z);
                precise float sumValue118 = productValue126 + 0.0;
                precise float sumValue119 = productValue127 + 0.0;
                precise float sumValue120 = productValue128 + 0.0;
                precise float productValue129 = sumValue109 * intermediateValue183;
                precise float productValue130 = sumValue109 * intermediateValue184;
                precise float sumValue121 = productValue129 + 0.0;
                precise float sumValue122 = productValue130 + 0.0;
                precise float productValue131 = sumValue109 * bitwiseValue86;
                precise float productValue132 = sumValue109 * bitwiseValue87;
                precise float productValue133 = sumValue109 * bitwiseValue88;
                precise float productValue134 = sumValue109 * bitwiseValue89;
                precise float sumValue123 = productValue131 + 0.0;
                precise float sumValue124 = productValue132 + 0.0;
                precise float sumValue125 = productValue133 + 0.0;
                precise float sumValue126 = productValue134 + 0.0;
                uint productValue135 = productValue118 * (objectInstances_2.packedValues[productValue111] + bitwiseValue76);
                uint bitwiseValue99 = (bitwiseValue82 + productValue135) >> 1u;
                f16vec3 sumValue113 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue110)].packedValues[bitwiseValue99], vertexBuffers[nonuniformEXT(sumValue110)].packedValues[bitwiseValue99 + 1u], vertexBuffers[nonuniformEXT(sumValue110)].packedValues[bitwiseValue99 + 2u]));
                uint bitwiseValue100 = (bitwiseValue84 + productValue135) >> 2u;
                precise float bitwiseValue101 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue100] & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue102 = float((vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue100] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue103 = float((vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue100] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue104 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue100] >> 24u) * 0.0039215688593685626983642578125;
                uint bitwiseValue105 = (bitwiseValue90 + productValue135) >> 2u;
                float intermediateValue200;
                float intermediateValue201;
                if (conditionValue10)
                {
                    uint bitwiseValue106 = vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue105] >> 15u;
                    precise float bitwiseValue107 = float(bitwiseValue106 & 1u) * 2.0;
                    precise float sumValue127 = bitwiseValue107 + (-1.0);
                    precise float bitwiseValue108 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue105] >> 31u) * 2.0;
                    precise float sumValue128 = bitwiseValue108 + (-1.0);
                    precise float bitwiseValue109 = float((vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue105] << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue110 = float(bitwiseValue106 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue136 = sumValue127 * 3.0517578125e-05;
                    precise float productValue137 = sumValue128 * 3.0517578125e-05;
                    precise float sumValue129 = bitwiseValue109 + productValue136;
                    precise float sumValue130 = bitwiseValue110 + productValue137;
                    intermediateValue200 = sumValue129;
                    intermediateValue201 = sumValue130;
                }
                else
                {
                    precise float bitwiseValue111 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue105] & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue112 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue105] >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue138 = bitwiseValue111 * 16384.0;
                    precise float sumValue131 = productValue138 + 0.5;
                    precise float productValue139 = bitwiseValue112 * 16384.0;
                    precise float sumValue132 = productValue139 + 0.5;
                    precise float productValue140 = floor(sumValue131) * 6.103515625e-05;
                    precise float productValue141 = floor(sumValue132) * 6.103515625e-05;
                    intermediateValue200 = productValue140;
                    intermediateValue201 = productValue141;
                }
                precise float productValue142 = intermediateValue133 * float(sumValue113.x);
                precise float productValue143 = intermediateValue133 * float(sumValue113.y);
                precise float productValue144 = intermediateValue133 * float(sumValue113.z);
                precise float sumValue133 = sumValue118 + productValue142;
                precise float sumValue134 = sumValue119 + productValue143;
                precise float sumValue135 = sumValue120 + productValue144;
                precise float productValue145 = intermediateValue133 * intermediateValue200;
                precise float productValue146 = intermediateValue133 * intermediateValue201;
                precise float sumValue136 = sumValue121 + productValue145;
                precise float sumValue137 = sumValue122 + productValue146;
                precise float productValue147 = intermediateValue133 * bitwiseValue101;
                precise float productValue148 = intermediateValue133 * bitwiseValue102;
                precise float productValue149 = intermediateValue133 * bitwiseValue103;
                precise float productValue150 = intermediateValue133 * bitwiseValue104;
                precise float sumValue138 = sumValue123 + productValue147;
                precise float sumValue139 = sumValue124 + productValue148;
                precise float sumValue140 = sumValue125 + productValue149;
                precise float sumValue142 = sumValue126 + productValue150;
                uint productValue151 = productValue118 * (objectInstances_2.packedValues[productValue111] + bitwiseValue77);
                uint bitwiseValue113 = (bitwiseValue82 + productValue151) >> 1u;
                f16vec3 sumValue141 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue110)].packedValues[bitwiseValue113], vertexBuffers[nonuniformEXT(sumValue110)].packedValues[bitwiseValue113 + 1u], vertexBuffers[nonuniformEXT(sumValue110)].packedValues[bitwiseValue113 + 2u]));
                uint bitwiseValue114 = (bitwiseValue84 + productValue151) >> 2u;
                precise float bitwiseValue115 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue114] & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue116 = float((vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue114] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue117 = float((vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue114] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue118 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue114] >> 24u) * 0.0039215688593685626983642578125;
                uint bitwiseValue119 = (bitwiseValue90 + productValue151) >> 2u;
                float intermediateValue214;
                float intermediateValue215;
                if (conditionValue10)
                {
                    uint bitwiseValue120 = vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue119] >> 15u;
                    precise float bitwiseValue121 = float(bitwiseValue120 & 1u) * 2.0;
                    precise float sumValue143 = bitwiseValue121 + (-1.0);
                    precise float bitwiseValue122 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue119] >> 31u) * 2.0;
                    precise float sumValue144 = bitwiseValue122 + (-1.0);
                    precise float bitwiseValue123 = float((vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue119] << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue124 = float(bitwiseValue120 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue152 = sumValue143 * 3.0517578125e-05;
                    precise float productValue153 = sumValue144 * 3.0517578125e-05;
                    precise float sumValue145 = bitwiseValue123 + productValue152;
                    precise float sumValue146 = bitwiseValue124 + productValue153;
                    intermediateValue214 = sumValue145;
                    intermediateValue215 = sumValue146;
                }
                else
                {
                    precise float bitwiseValue125 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue119] & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue126 = float(vertexBuffers_2[nonuniformEXT(sumValue110)].packedValues[bitwiseValue119] >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue154 = bitwiseValue125 * 16384.0;
                    precise float sumValue147 = productValue154 + 0.5;
                    precise float productValue155 = bitwiseValue126 * 16384.0;
                    precise float sumValue148 = productValue155 + 0.5;
                    precise float productValue156 = floor(sumValue147) * 6.103515625e-05;
                    precise float productValue157 = floor(sumValue148) * 6.103515625e-05;
                    intermediateValue214 = productValue156;
                    intermediateValue215 = productValue157;
                }
                precise float productValue158 = intermediateValue135 * float(sumValue141.x);
                precise float productValue159 = intermediateValue135 * float(sumValue141.y);
                precise float productValue160 = intermediateValue135 * float(sumValue141.z);
                precise float sumValue149 = sumValue133 + productValue158;
                precise float sumValue150 = sumValue134 + productValue159;
                precise float sumValue151 = sumValue135 + productValue160;
                precise float productValue161 = intermediateValue135 * intermediateValue214;
                precise float productValue162 = intermediateValue135 * intermediateValue215;
                precise float sumValue152 = sumValue136 + productValue161;
                precise float sumValue153 = sumValue137 + productValue162;
                precise float productValue163 = intermediateValue135 * bitwiseValue115;
                precise float productValue164 = intermediateValue135 * bitwiseValue116;
                precise float productValue165 = intermediateValue135 * bitwiseValue117;
                precise float productValue166 = intermediateValue135 * bitwiseValue118;
                precise float sumValue154 = sumValue138 + productValue163;
                precise float sumValue155 = sumValue139 + productValue164;
                precise float sumValue156 = sumValue140 + productValue165;
                precise float sumValue157 = sumValue142 + productValue166;
                precise float productValue167 = scalarValue81 * sumValue149;
                precise float productValue168 = sumValue150 * scalarValue82;
                precise float sumValue158 = productValue168 + productValue167;
                precise float productValue169 = sumValue151 * scalarValue83;
                precise float sumValue159 = productValue169 + sumValue158;
                precise float productValue170 = 1.0 * reinterpretedBits7.w;
                precise float sumValue160 = productValue170 + sumValue159;
                precise float productValue171 = scalarValue84 * sumValue149;
                precise float productValue172 = sumValue150 * scalarValue85;
                precise float sumValue161 = productValue172 + productValue171;
                precise float productValue173 = sumValue151 * scalarValue86;
                precise float sumValue162 = productValue173 + sumValue161;
                precise float productValue174 = 1.0 * reinterpretedBits8.w;
                precise float sumValue163 = productValue174 + sumValue162;
                precise float productValue175 = scalarValue87 * sumValue149;
                precise float productValue176 = sumValue150 * scalarValue88;
                precise float sumValue164 = productValue176 + productValue175;
                precise float productValue177 = sumValue151 * scalarValue89;
                precise float sumValue165 = productValue177 + sumValue164;
                precise float productValue178 = 1.0 * reinterpretedBits9.w;
                precise float sumValue166 = productValue178 + sumValue165;
                precise float productValue179 = scalarValue81 * sumValue105;
                precise float productValue180 = sumValue106 * scalarValue82;
                precise float sumValue167 = productValue180 + productValue179;
                precise float productValue181 = sumValue107 * scalarValue83;
                precise float sumValue168 = productValue181 + sumValue167;
                precise float productValue182 = scalarValue84 * sumValue105;
                precise float productValue183 = sumValue106 * scalarValue85;
                precise float sumValue169 = productValue183 + productValue182;
                precise float productValue184 = sumValue107 * scalarValue86;
                precise float sumValue170 = productValue184 + sumValue169;
                precise float productValue185 = scalarValue87 * sumValue105;
                precise float productValue186 = sumValue106 * scalarValue88;
                precise float sumValue171 = productValue186 + productValue185;
                precise float productValue187 = sumValue107 * scalarValue89;
                precise float sumValue172 = productValue187 + sumValue171;
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue168, sumValue170, sumValue172), vec3(sumValue168, sumValue170, sumValue172)));
                precise float productValue188 = sumValue168 * inverseLengthValue1;
                precise float productValue189 = sumValue170 * inverseLengthValue1;
                precise float productValue190 = sumValue172 * inverseLengthValue1;
                bool dotProductValue1 = dot(vec3(intermediateValue64, intermediateValue66, intermediateValue68), vec3(productValue188, productValue189, productValue190)) > 0.0;
                precise float sumValue173 = (-0.0) - productValue188;
                precise float sumValue174 = (-0.0) - productValue189;
                precise float sumValue175 = (-0.0) - productValue190;
                float comparisonValue39 = dotProductValue1 ? sumValue173 : productValue188;
                float comparisonValue40 = dotProductValue1 ? sumValue174 : productValue189;
                float comparisonValue41 = dotProductValue1 ? sumValue175 : productValue190;
                float intermediateValue162;
                float intermediateValue163;
                float intermediateValue164;
                if (((objectInstances.packedValues[productValue113] & 1us) != 0us) && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u))
                {
                    uint sumValue176 = productValue115 + 0u;
                    float sumValue178;
                    float sumValue179;
                    float sumValue180;
                    uint sumValue188;
                    float scalarValue90 = sumValue109;
                    uint scalarValue91 = bitwiseValue75;
                    float scalarValue92 = 0.0;
                    float scalarValue93 = 0.0;
                    float scalarValue94 = 0.0;
                    uint scalarValue95 = 0u;
                    f16vec3 sumValue190;
                    f16vec3 sumValue191;
                    for (;;)
                    {
                        uint sumValue177 = scalarValue91 + objectInstances_2.packedValues[productValue112];
                        uint productValue191 = sumValue177 * 8u;
                        sumValue190 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue176)].packedValues[productValue191], vertexIrradianceCache[nonuniformEXT(sumValue176)].packedValues[productValue191 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue176)].packedValues[productValue191 + 2u]));
                        uint productValue192 = (sumValue177 * 8u) + 4u;
                        sumValue191 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue176)].packedValues[productValue192], vertexIrradianceCache[nonuniformEXT(sumValue176)].packedValues[productValue192 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue176)].packedValues[productValue192 + 2u]));
                        float16_t intermediateValue268;
                        float16_t intermediateValue269;
                        float16_t intermediateValue270;
                        if (dotProductValue1)
                        {
                            intermediateValue268 = sumValue191.x;
                            intermediateValue269 = sumValue191.y;
                            intermediateValue270 = sumValue191.z;
                        }
                        else
                        {
                            intermediateValue268 = sumValue190.x;
                            intermediateValue269 = sumValue190.y;
                            intermediateValue270 = sumValue190.z;
                        }
                        precise float productValue193 = float(intermediateValue270) * scalarValue90;
                        precise float productValue194 = float(intermediateValue269) * scalarValue90;
                        precise float productValue195 = float(intermediateValue268) * scalarValue90;
                        sumValue178 = productValue195 + scalarValue92;
                        sumValue179 = productValue194 + scalarValue93;
                        sumValue180 = productValue193 + scalarValue94;
                        sumValue188 = scalarValue95 + 1u;
                        if (sumValue188 == 3u)
                        {
                            break;
                        }
                        scalarValue90 = intermediateValue1[sumValue188];
                        scalarValue91 = intermediateValue[sumValue188];
                        scalarValue92 = sumValue178;
                        scalarValue93 = sumValue179;
                        scalarValue94 = sumValue180;
                        scalarValue95 = sumValue188;
                        continue;
                    }
                    intermediateValue162 = sumValue178;
                    intermediateValue163 = sumValue179;
                    intermediateValue164 = sumValue180;
                }
                else
                {
                    intermediateValue162 = 0.0;
                    intermediateValue163 = 0.0;
                    intermediateValue164 = 0.0;
                }
                uint bitwiseValue127 = intermediateValue82 >> 30u;
                uint productValue196 = (bitwiseValue74 * 76u) + 58u;
                uint productValue197 = (bitwiseValue74 * 76u) + 59u;
                uint productValue198 = (bitwiseValue74 * 76u) + 61u;
                uint productValue202 = (bitwiseValue74 * 38u) + 32u;
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
                if (((bitwiseValue127 & 2u) == 0u) || ((objectInstances.packedValues[productValue198] & 1536us) != 0us))
                {
                    branchMergedValue81 = intermediateValue163;
                    branchMergedValue85 = intermediateValue164;
                    branchMergedValue86 = sumValue154;
                    branchMergedValue87 = sumValue155;
                    branchMergedValue88 = sumValue156;
                    branchMergedValue89 = sumValue157;
                    branchMergedValue90 = comparisonValue39;
                    branchMergedValue91 = comparisonValue40;
                    branchMergedValue92 = comparisonValue41;
                    branchMergedValue93 = sumValue152;
                    branchMergedValue100 = sumValue153;
                    branchMergedValue101 = sumValue160;
                    branchMergedValue102 = sumValue163;
                    branchMergedValue103 = sumValue166;
                    branchMergedValue104 = intermediateValue52;
                    branchMergedValue105 = scalarValue30;
                    branchMergedValue106 = scalarValue31;
                    branchMergedValue107 = scalarValue32;
                    branchMergedValue108 = scalarValue33;
                    branchMergedValue109 = 4u;
                    branchMergedValue110 = intermediateValue161;
                    branchMergedValue111 = productValue117;
                    branchMergedValue112 = intermediateValue162;
                }
                else
                {
                    precise float sumValue181 = ViewCB.packedValues[89u].y + productValue7;
                    precise float nonlinearValue1 = productValue117 + log2(abs(sumValue181));
                    uint reinterpretedBits28;
                    if (objectInstances.packedValues[productValue196] > 4095us)
                    {
                        reinterpretedBits28 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits28 = uint(objectInstances.packedValues[productValue196]);
                    }
                    float intermediateValue271;
                    float intermediateValue272;
                    float intermediateValue273;
                    float intermediateValue274;
                    if (objectInstances.packedValues[productValue196] == 65535us)
                    {
                        intermediateValue271 = 1.0;
                        intermediateValue272 = 1.0;
                        intermediateValue273 = 1.0;
                        intermediateValue274 = 1.0;
                    }
                    else
                    {
                        vec4 sampledTextureValue7 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits28 + 0u], defaultSampler)), vec2(sumValue152, sumValue153), spvNMin(spvNMax(0.0, nonlinearValue1), uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue161 * 16u) + 13u])));
                        intermediateValue271 = sampledTextureValue7.x;
                        intermediateValue272 = sampledTextureValue7.y;
                        intermediateValue273 = sampledTextureValue7.z;
                        intermediateValue274 = sampledTextureValue7.w;
                    }
                    float intermediateValue165;
                    float intermediateValue166;
                    float intermediateValue167;
                    float intermediateValue168;
                    if ((objectInstances.packedValues[productValue198] & 1024us) == 0us)
                    {
                        float branchMergedValue41;
                        float branchMergedValue69;
                        float branchMergedValue70;
                        float branchMergedValue71;
                        if ((objectInstances.packedValues[productValue198] & 512us) == 0us)
                        {
                            float intermediateValue309;
                            float intermediateValue310;
                            float intermediateValue311;
                            float intermediateValue312;
                            if ((objectInstances.packedValues[productValue198] & 4us) == 0us)
                            {
                                intermediateValue309 = intermediateValue274;
                                intermediateValue310 = sumValue154;
                                intermediateValue311 = sumValue155;
                                intermediateValue312 = sumValue156;
                            }
                            else
                            {
                                uint reinterpretedBits29;
                                if (objectInstances.packedValues[productValue197] > 4095us)
                                {
                                    reinterpretedBits29 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits29 = uint(objectInstances.packedValues[productValue197]);
                                }
                                vec4 sampledTextureValue8 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits29 + 0u], defaultSampler)), vec2(sumValue154, sumValue155), 0.0);
                                precise float productValue203 = sampledTextureValue8.x * 2.0;
                                precise float productValue204 = sampledTextureValue8.y * 2.0;
                                precise float productValue205 = sampledTextureValue8.z * 2.0;
                                precise float sumValue182 = productValue203 + (-1.0);
                                precise float sumValue183 = productValue204 + (-1.0);
                                precise float sumValue184 = productValue205 + (-1.0);
                                precise float productValue206 = sumValue156 * sumValue182;
                                precise float productValue207 = sumValue156 * sumValue183;
                                precise float productValue208 = sumValue156 * sumValue184;
                                precise float sumValue185 = productValue206 + 1.0;
                                precise float sumValue186 = productValue207 + 1.0;
                                precise float sumValue187 = productValue208 + 1.0;
                                precise float productValue209 = sumValue157 * sumValue185;
                                precise float productValue210 = sumValue157 * sumValue186;
                                precise float productValue211 = sumValue157 * sumValue187;
                                intermediateValue309 = 1.0;
                                intermediateValue310 = productValue209;
                                intermediateValue311 = productValue210;
                                intermediateValue312 = productValue211;
                            }
                            float intermediateValue325;
                            float intermediateValue326;
                            float intermediateValue327;
                            if ((objectInstances.packedValues[productValue198] & 8192us) == 0us)
                            {
                                intermediateValue325 = intermediateValue310;
                                intermediateValue326 = intermediateValue311;
                                intermediateValue327 = intermediateValue312;
                            }
                            else
                            {
                                precise float sumValue189 = 1.0 - intermediateValue310;
                                precise float sumValue192 = 1.0 - intermediateValue311;
                                precise float sumValue194 = 1.0 - intermediateValue312;
                                precise float productValue212 = intermediateValue309 * sumValue189;
                                precise float productValue213 = intermediateValue309 * sumValue192;
                                precise float productValue214 = intermediateValue309 * sumValue194;
                                precise float sumValue195 = intermediateValue310 + productValue212;
                                precise float sumValue196 = intermediateValue311 + productValue213;
                                precise float sumValue197 = intermediateValue312 + productValue214;
                                intermediateValue325 = sumValue195;
                                intermediateValue326 = sumValue196;
                                intermediateValue327 = sumValue197;
                            }
                            precise float productValue215 = intermediateValue271 * intermediateValue325;
                            precise float productValue216 = intermediateValue272 * intermediateValue326;
                            precise float productValue217 = intermediateValue273 * intermediateValue327;
                            float intermediateValue292;
                            if ((objectInstances.packedValues[productValue198] & 2048us) == 0us)
                            {
                                intermediateValue292 = intermediateValue309;
                            }
                            else
                            {
                                precise float productValue218 = intermediateValue309 * 2.0;
                                precise float sumValue198 = productValue218 + (-1.0);
                                intermediateValue292 = spvNClamp(sumValue198, 0.0, 1.0);
                            }
                            precise float bitwiseValue128 = float(objectInstances_2.packedValues[productValue202] >> 24u) * 0.0039215688593685626983642578125;
                            precise float bitwiseValue129 = float((objectInstances_2.packedValues[productValue202] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                            precise float bitwiseValue130 = float((objectInstances_2.packedValues[productValue202] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                            precise float sumValue199 = bitwiseValue128 + (-1.0);
                            precise float sumValue200 = bitwiseValue129 + (-1.0);
                            precise float sumValue201 = bitwiseValue130 + (-1.0);
                            precise float productValue219 = sumValue199 * intermediateValue292;
                            precise float productValue220 = sumValue200 * intermediateValue292;
                            precise float productValue221 = sumValue201 * intermediateValue292;
                            precise float sumValue202 = productValue219 + 1.0;
                            precise float sumValue203 = productValue220 + 1.0;
                            precise float sumValue204 = productValue221 + 1.0;
                            precise float productValue222 = productValue215 * sumValue202;
                            precise float productValue223 = productValue216 * sumValue203;
                            precise float productValue224 = productValue217 * sumValue204;
                            float intermediateValue293;
                            if (productValue222 < 0.040449999272823333740234375)
                            {
                                precise float productValue225 = productValue222 * 0.077399380505084991455078125;
                                intermediateValue293 = productValue225;
                            }
                            else
                            {
                                precise float sumValue205 = productValue222 + 0.054999999701976776123046875;
                                precise float productValue226 = sumValue205 * 0.947867333889007568359375;
                                precise float nonlinearValue2 = log2(productValue226) * 2.400000095367431640625;
                                intermediateValue293 = exp2(nonlinearValue2);
                            }
                            float intermediateValue294;
                            if (productValue223 < 0.040449999272823333740234375)
                            {
                                precise float productValue227 = productValue223 * 0.077399380505084991455078125;
                                intermediateValue294 = productValue227;
                            }
                            else
                            {
                                precise float sumValue206 = productValue223 + 0.054999999701976776123046875;
                                precise float productValue228 = sumValue206 * 0.947867333889007568359375;
                                precise float nonlinearValue3 = log2(productValue228) * 2.400000095367431640625;
                                intermediateValue294 = exp2(nonlinearValue3);
                            }
                            float branchMergedValue120;
                            float branchMergedValue131;
                            float branchMergedValue132;
                            float branchMergedValue133;
                            if (productValue224 < 0.040449999272823333740234375)
                            {
                                precise float productValue229 = productValue224 * 0.077399380505084991455078125;
                                branchMergedValue120 = productValue229;
                                branchMergedValue131 = intermediateValue294;
                                branchMergedValue132 = intermediateValue293;
                                branchMergedValue133 = intermediateValue292;
                            }
                            else
                            {
                                precise float sumValue207 = productValue224 + 0.054999999701976776123046875;
                                precise float productValue230 = sumValue207 * 0.947867333889007568359375;
                                precise float nonlinearValue4 = log2(productValue230) * 2.400000095367431640625;
                                branchMergedValue120 = exp2(nonlinearValue4);
                                branchMergedValue131 = intermediateValue294;
                                branchMergedValue132 = intermediateValue293;
                                branchMergedValue133 = intermediateValue292;
                            }
                            branchMergedValue41 = branchMergedValue120;
                            branchMergedValue69 = branchMergedValue131;
                            branchMergedValue70 = branchMergedValue132;
                            branchMergedValue71 = branchMergedValue133;
                        }
                        else
                        {
                            branchMergedValue41 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue273) * 1.39999997615814208984375);
                            branchMergedValue69 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue272) * 1.39999997615814208984375);
                            branchMergedValue70 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue271) * 1.39999997615814208984375);
                            branchMergedValue71 = intermediateValue52;
                        }
                        intermediateValue165 = branchMergedValue71;
                        intermediateValue166 = branchMergedValue70;
                        intermediateValue167 = branchMergedValue69;
                        intermediateValue168 = branchMergedValue41;
                    }
                    else
                    {
                        intermediateValue165 = intermediateValue52;
                        intermediateValue166 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue271) * 1.7999999523162841796875);
                        intermediateValue167 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue272) * 1.7999999523162841796875);
                        intermediateValue168 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue273) * 1.7999999523162841796875);
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
                    if (intermediateValue165 > (((scalarValue49 == 0u) || (bitwiseValue127 == 3u)) ? 0.949999988079071044921875 : 0.5))
                    {
                        branchMergedValue134 = intermediateValue163;
                        branchMergedValue135 = intermediateValue164;
                        branchMergedValue136 = sumValue154;
                        branchMergedValue137 = sumValue155;
                        branchMergedValue138 = sumValue156;
                        branchMergedValue139 = sumValue157;
                        branchMergedValue140 = comparisonValue39;
                        branchMergedValue141 = comparisonValue40;
                        branchMergedValue142 = comparisonValue41;
                        branchMergedValue143 = sumValue152;
                        branchMergedValue144 = sumValue153;
                        branchMergedValue145 = sumValue160;
                        branchMergedValue146 = sumValue163;
                        branchMergedValue147 = sumValue166;
                        branchMergedValue148 = intermediateValue165;
                        branchMergedValue149 = intermediateValue165;
                        branchMergedValue150 = intermediateValue166;
                        branchMergedValue151 = intermediateValue167;
                        branchMergedValue152 = intermediateValue168;
                        branchMergedValue153 = 4u;
                        branchMergedValue154 = intermediateValue161;
                        branchMergedValue155 = productValue117;
                        branchMergedValue156 = intermediateValue162;
                    }
                    else
                    {
                        branchMergedValue134 = intermediateValue163;
                        branchMergedValue135 = intermediateValue164;
                        branchMergedValue136 = sumValue154;
                        branchMergedValue137 = sumValue155;
                        branchMergedValue138 = sumValue156;
                        branchMergedValue139 = sumValue157;
                        branchMergedValue140 = comparisonValue39;
                        branchMergedValue141 = comparisonValue40;
                        branchMergedValue142 = comparisonValue41;
                        branchMergedValue143 = sumValue152;
                        branchMergedValue144 = sumValue153;
                        branchMergedValue145 = sumValue160;
                        branchMergedValue146 = sumValue163;
                        branchMergedValue147 = sumValue166;
                        branchMergedValue148 = intermediateValue165;
                        branchMergedValue149 = intermediateValue165;
                        branchMergedValue150 = intermediateValue166;
                        branchMergedValue151 = intermediateValue167;
                        branchMergedValue152 = intermediateValue168;
                        branchMergedValue153 = uint(bitwiseValue127 != 3u);
                        branchMergedValue154 = intermediateValue161;
                        branchMergedValue155 = productValue117;
                        branchMergedValue156 = intermediateValue162;
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
                branchMergedValue23 = intermediateValue52;
                branchMergedValue24 = scalarValue30;
                branchMergedValue25 = scalarValue31;
                branchMergedValue26 = scalarValue32;
                branchMergedValue27 = scalarValue33;
                branchMergedValue28 = 4u;
                branchMergedValue29 = scalarValue13;
                branchMergedValue30 = scalarValue14;
                branchMergedValue31 = scalarValue15;
            }
            intermediateValue25 = branchMergedValue;
            intermediateValue27 = branchMergedValue4;
            intermediateValue29 = branchMergedValue5;
            intermediateValue31 = branchMergedValue6;
            intermediateValue33 = branchMergedValue7;
            intermediateValue35 = branchMergedValue8;
            intermediateValue37 = branchMergedValue9;
            intermediateValue39 = branchMergedValue10;
            intermediateValue41 = branchMergedValue11;
            intermediateValue43 = branchMergedValue12;
            intermediateValue45 = branchMergedValue19;
            intermediateValue47 = branchMergedValue20;
            intermediateValue49 = branchMergedValue21;
            intermediateValue51 = branchMergedValue22;
            intermediateValue54 = branchMergedValue23;
            intermediateValue56 = branchMergedValue24;
            intermediateValue58 = branchMergedValue25;
            intermediateValue60 = branchMergedValue26;
            intermediateValue62 = branchMergedValue27;
            intermediateValue78 = branchMergedValue28;
            intermediateValue19 = branchMergedValue29;
            intermediateValue21 = branchMergedValue30;
            intermediateValue23 = branchMergedValue31;
            if ((sumValue6 < 8u) && (intermediateValue78 != 4u))
            {
                scalarValue13 = intermediateValue19;
                scalarValue14 = intermediateValue21;
                scalarValue15 = intermediateValue23;
                scalarValue16 = intermediateValue25;
                scalarValue17 = intermediateValue27;
                scalarValue18 = intermediateValue29;
                scalarValue19 = intermediateValue31;
                scalarValue20 = intermediateValue33;
                scalarValue21 = intermediateValue35;
                scalarValue22 = intermediateValue37;
                scalarValue23 = intermediateValue39;
                scalarValue24 = intermediateValue41;
                scalarValue25 = intermediateValue43;
                scalarValue26 = intermediateValue45;
                scalarValue27 = intermediateValue47;
                scalarValue28 = intermediateValue49;
                scalarValue29 = intermediateValue51;
                intermediateValue52 = intermediateValue54;
                scalarValue30 = intermediateValue56;
                scalarValue31 = intermediateValue58;
                scalarValue32 = intermediateValue60;
                scalarValue33 = intermediateValue62;
                scalarValue34 = intermediateValue64;
                scalarValue35 = intermediateValue66;
                scalarValue36 = intermediateValue68;
                scalarValue37 = reinterpretedBits4;
                scalarValue38 = reinterpretedBits5;
                scalarValue39 = reinterpretedBits6;
                scalarValue40 = productValue8;
                scalarValue41 = productValue9;
                scalarValue42 = productValue10;
                scalarValue43 = comparisonValue8;
                scalarValue44 = comparisonValue9;
                scalarValue45 = intermediateValue78;
                scalarValue46 = intermediateValue80;
                scalarValue47 = intermediateValue82;
                scalarValue48 = comparisonValue9;
                scalarValue49 = sumValue6;
                scalarValue50 = comparisonValue10;
                continue;
            }
            else
            {
                break;
            }
        }
        if (!(intermediateValue78 == 4u))
        {
            break;
        }
        float intermediateValue185;
        float intermediateValue186;
        float intermediateValue187;
        float intermediateValue188;
        float intermediateValue189;
        float intermediateValue191;
        float intermediateValue193;
        if (intermediateValue138)
        {
            uint bitwiseValue131 = intermediateValue82 & 16383u;
            uint productValue231 = (bitwiseValue131 * 76u) + 58u;
            uint productValue232 = (bitwiseValue131 * 76u) + 59u;
            uint productValue233 = (bitwiseValue131 * 76u) + 61u;
            uint productValue234 = (bitwiseValue131 * 38u) + 32u;
            vec2 reinterpretedBits11 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[intermediateValue19 * 8u]);
            vec2 reinterpretedBits12 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue19 * 8u) + 1u]);
            float reinterpretedBits13 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue19 * 16u) + 13u]);
            float reinterpretedBits14 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue19 * 16u) + 14u]);
            float nonlinearValue5 = spvNMax(0.0, log2(abs(productValue7 + ViewCB.packedValues[89u].y)) + intermediateValue21);
            uint reinterpretedBits15;
            if (objectInstances.packedValues[productValue231] > 4095us)
            {
                reinterpretedBits15 = floatBitsToUint(ViewCB.packedValues[98u]).w;
            }
            else
            {
                reinterpretedBits15 = uint(objectInstances.packedValues[productValue231]);
            }
            uint sumValue208 = reinterpretedBits15 + 0u;
            float intermediateValue202;
            float intermediateValue203;
            float intermediateValue204;
            float intermediateValue205;
            if (objectInstances.packedValues[productValue231] == 65535us)
            {
                intermediateValue202 = 1.0;
                intermediateValue203 = 1.0;
                intermediateValue204 = 1.0;
                intermediateValue205 = 1.0;
            }
            else
            {
                vec4 sampledTextureValue9 = textureLod(nonuniformEXT(sampler2D(textures[sumValue208], defaultSampler)), vec2(intermediateValue43, intermediateValue45), spvNMin(nonlinearValue5, reinterpretedBits13));
                intermediateValue202 = sampledTextureValue9.x;
                intermediateValue203 = sampledTextureValue9.y;
                intermediateValue204 = sampledTextureValue9.z;
                intermediateValue205 = sampledTextureValue9.w;
            }
            float intermediateValue190;
            float intermediateValue192;
            float intermediateValue194;
            float intermediateValue216;
            float intermediateValue217;
            float intermediateValue218;
            float intermediateValue219;
            float intermediateValue220;
            float intermediateValue221;
            float intermediateValue222;
            float intermediateValue223;
            float intermediateValue224;
            float intermediateValue225;
            if ((objectInstances.packedValues[productValue233] & 1024us) == 0us)
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
                if ((objectInstances.packedValues[productValue233] & 512us) == 0us)
                {
                    float intermediateValue232;
                    float intermediateValue233;
                    float intermediateValue234;
                    float intermediateValue235;
                    if ((objectInstances.packedValues[productValue233] & 4us) == 0us)
                    {
                        intermediateValue232 = intermediateValue205;
                        intermediateValue233 = intermediateValue29;
                        intermediateValue234 = intermediateValue31;
                        intermediateValue235 = intermediateValue33;
                    }
                    else
                    {
                        uint reinterpretedBits27;
                        if (objectInstances.packedValues[productValue232] > 4095us)
                        {
                            reinterpretedBits27 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits27 = uint(objectInstances.packedValues[productValue232]);
                        }
                        vec4 sampledTextureValue10 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits27 + 0u], defaultSampler)), vec2(intermediateValue29, intermediateValue31), 0.0);
                        intermediateValue232 = 1.0;
                        intermediateValue233 = ((((sampledTextureValue10.x * 2.0) + (-1.0)) * intermediateValue33) + 1.0) * intermediateValue35;
                        intermediateValue234 = ((((sampledTextureValue10.y * 2.0) + (-1.0)) * intermediateValue33) + 1.0) * intermediateValue35;
                        intermediateValue235 = ((((sampledTextureValue10.z * 2.0) + (-1.0)) * intermediateValue33) + 1.0) * intermediateValue35;
                    }
                    float intermediateValue256;
                    float intermediateValue257;
                    float intermediateValue258;
                    if ((objectInstances.packedValues[productValue233] & 8192us) == 0us)
                    {
                        intermediateValue256 = intermediateValue233;
                        intermediateValue257 = intermediateValue234;
                        intermediateValue258 = intermediateValue235;
                    }
                    else
                    {
                        intermediateValue256 = ((1.0 - intermediateValue233) * intermediateValue232) + intermediateValue233;
                        intermediateValue257 = ((1.0 - intermediateValue234) * intermediateValue232) + intermediateValue234;
                        intermediateValue258 = ((1.0 - intermediateValue235) * intermediateValue232) + intermediateValue235;
                    }
                    float intermediateValue265;
                    if ((objectInstances.packedValues[productValue233] & 2048us) == 0us)
                    {
                        intermediateValue265 = intermediateValue232;
                    }
                    else
                    {
                        intermediateValue265 = spvNClamp(fma(intermediateValue232, 2.0, -1.0), 0.0, 1.0);
                    }
                    float bitwiseValue132 = (intermediateValue256 * intermediateValue202) * ((intermediateValue265 * ((float(objectInstances_2.packedValues[productValue234] >> 24u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                    float bitwiseValue133 = (intermediateValue257 * intermediateValue203) * ((intermediateValue265 * ((float((objectInstances_2.packedValues[productValue234] >> 16u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                    float bitwiseValue134 = (intermediateValue258 * intermediateValue204) * ((intermediateValue265 * ((float((objectInstances_2.packedValues[productValue234] >> 8u) & 255u) * 0.0039215688593685626983642578125) + (-1.0))) + 1.0);
                    float productValue199;
                    if (bitwiseValue132 < 0.040449999272823333740234375)
                    {
                        productValue199 = bitwiseValue132 * 0.077399380505084991455078125;
                    }
                    else
                    {
                        productValue199 = exp2(log2((bitwiseValue132 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                    }
                    float productValue200;
                    if (bitwiseValue133 < 0.040449999272823333740234375)
                    {
                        productValue200 = bitwiseValue133 * 0.077399380505084991455078125;
                    }
                    else
                    {
                        productValue200 = exp2(log2((bitwiseValue133 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                    }
                    float productValue201;
                    if (bitwiseValue134 < 0.040449999272823333740234375)
                    {
                        productValue201 = bitwiseValue134 * 0.077399380505084991455078125;
                    }
                    else
                    {
                        productValue201 = exp2(log2((bitwiseValue134 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
                    }
                    float reinterpretedBits30;
                    float reinterpretedBits31;
                    float reinterpretedBits32;
                    if ((pbrTextureDataBuffer.packedValues[(intermediateValue19 * 16u) + 8u] & 1u) == 0u)
                    {
                        reinterpretedBits30 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue19 * 16u) + 11u]);
                        reinterpretedBits31 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue19 * 16u) + 9u]);
                        reinterpretedBits32 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue19 * 16u) + 10u]);
                    }
                    else
                    {
                        vec4 sampledTextureValue11 = textureLod(nonuniformEXT(sampler2D(textures[sumValue208], defaultSampler)), vec2(fma(intermediateValue43, reinterpretedBits11.x, reinterpretedBits12.x), fma(intermediateValue45, reinterpretedBits11.y, reinterpretedBits12.y)), spvNMin((reinterpretedBits14 - reinterpretedBits13) + nonlinearValue5, reinterpretedBits14));
                        float scalarValue96 = sampledTextureValue11.y;
                        reinterpretedBits30 = sampledTextureValue11.x;
                        reinterpretedBits31 = sampledTextureValue11.z;
                        reinterpretedBits32 = fma(scalarValue96, scalarValue96, 0.0);
                    }
                    float sumValue209 = 1.0 - reinterpretedBits30;
                    float productValue235 = sumValue209 * productValue199;
                    float productValue236 = sumValue209 * productValue200;
                    float productValue237 = sumValue209 * productValue201;
                    float dotProductValue2 = dot(vec3(productValue199, productValue200, productValue201), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                    float productValue238 = (reinterpretedBits32 * 5.0) * ViewCB.packedValues[84u].w;
                    branchMergedValue38 = productValue201;
                    branchMergedValue56 = productValue238 * (((dotProductValue2 - productValue201) * ViewCB.packedValues[85u].x) + productValue201);
                    branchMergedValue57 = reinterpretedBits31 - (ViewCB.packedValues[85u].w * reinterpretedBits31);
                    branchMergedValue58 = productValue238 * (((dotProductValue2 - productValue199) * ViewCB.packedValues[85u].x) + productValue199);
                    branchMergedValue59 = productValue238 * (((dotProductValue2 - productValue200) * ViewCB.packedValues[85u].x) + productValue200);
                    branchMergedValue60 = (reinterpretedBits30 * (productValue199 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                    branchMergedValue61 = (reinterpretedBits30 * (productValue200 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                    branchMergedValue62 = (reinterpretedBits30 * (productValue201 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                    branchMergedValue63 = productValue235 - (productValue235 * reinterpretedBits32);
                    branchMergedValue64 = productValue236 - (productValue236 * reinterpretedBits32);
                    branchMergedValue78 = productValue237 - (productValue237 * reinterpretedBits32);
                    branchMergedValue79 = productValue199;
                    branchMergedValue80 = productValue200;
                }
                else
                {
                    branchMergedValue38 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue204) * 1.39999997615814208984375);
                    branchMergedValue56 = intermediateValue53;
                    branchMergedValue57 = intermediateValue53;
                    branchMergedValue58 = intermediateValue53;
                    branchMergedValue59 = intermediateValue53;
                    branchMergedValue60 = intermediateValue53;
                    branchMergedValue61 = intermediateValue53;
                    branchMergedValue62 = intermediateValue53;
                    branchMergedValue63 = intermediateValue53;
                    branchMergedValue64 = intermediateValue53;
                    branchMergedValue78 = intermediateValue53;
                    branchMergedValue79 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue202) * 1.39999997615814208984375);
                    branchMergedValue80 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue203) * 1.39999997615814208984375);
                }
                intermediateValue216 = branchMergedValue57;
                intermediateValue217 = branchMergedValue58;
                intermediateValue218 = branchMergedValue59;
                intermediateValue219 = branchMergedValue56;
                intermediateValue220 = branchMergedValue60;
                intermediateValue221 = branchMergedValue61;
                intermediateValue222 = branchMergedValue62;
                intermediateValue223 = branchMergedValue63;
                intermediateValue224 = branchMergedValue64;
                intermediateValue225 = branchMergedValue78;
                intermediateValue190 = branchMergedValue79;
                intermediateValue192 = branchMergedValue80;
                intermediateValue194 = branchMergedValue38;
            }
            else
            {
                intermediateValue216 = intermediateValue53;
                intermediateValue217 = intermediateValue53;
                intermediateValue218 = intermediateValue53;
                intermediateValue219 = intermediateValue53;
                intermediateValue220 = intermediateValue53;
                intermediateValue221 = intermediateValue53;
                intermediateValue222 = intermediateValue53;
                intermediateValue223 = intermediateValue53;
                intermediateValue224 = intermediateValue53;
                intermediateValue225 = intermediateValue53;
                intermediateValue190 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue202) * 1.7999999523162841796875);
                intermediateValue192 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue203) * 1.7999999523162841796875);
                intermediateValue194 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue204) * 1.7999999523162841796875);
            }
            float branchMergedValue36;
            float branchMergedValue48;
            float branchMergedValue49;
            float branchMergedValue50;
            float branchMergedValue51;
            float branchMergedValue52;
            float branchMergedValue53;
            if ((objectInstances.packedValues[productValue233] & 1536us) == 0us)
            {
                outputVisibleBLASs.packedValues[uint(objectInstances.packedValues[(bitwiseValue131 * 76u) + 62u])] = floatBitsToUint(ViewCB.packedValues[84u]).z;
                float productValue239 = (intermediateValue223 * intermediateValue23) + intermediateValue217;
                float productValue240 = (intermediateValue224 * intermediateValue25) + intermediateValue218;
                float productValue241 = (intermediateValue225 * intermediateValue27) + intermediateValue219;
                precise float sumValue210 = (-0.0) - intermediateValue37;
                precise float sumValue211 = (-0.0) - intermediateValue39;
                precise float sumValue212 = (-0.0) - intermediateValue41;
                float comparisonValue42 = comparisonValue12 ? sumValue210 : intermediateValue37;
                float comparisonValue43 = comparisonValue12 ? sumValue211 : intermediateValue39;
                float comparisonValue44 = comparisonValue12 ? sumValue212 : intermediateValue41;
                precise float productValue242 = comparisonValue42 * 256.0;
                uint scalarValue97 = uint(int(productValue242));
                precise float productValue243 = comparisonValue43 * 256.0;
                uint scalarValue98 = uint(int(productValue243));
                precise float productValue244 = comparisonValue44 * 256.0;
                uint scalarValue99 = uint(int(productValue244));
                precise float productValue245 = comparisonValue42 * 1.52587890625e-05;
                precise float sumValue213 = productValue245 + intermediateValue47;
                float reinterpretedBits16 = (abs(intermediateValue47) < 0.03125) ? sumValue213 : uintBitsToFloat(((intermediateValue47 < 0.0) ? (-scalarValue97) : scalarValue97) + floatBitsToUint(intermediateValue47));
                precise float productValue246 = comparisonValue43 * 1.52587890625e-05;
                precise float sumValue214 = productValue246 + intermediateValue49;
                float reinterpretedBits18 = (abs(intermediateValue49) < 0.03125) ? sumValue214 : uintBitsToFloat(((intermediateValue49 < 0.0) ? (-scalarValue98) : scalarValue98) + floatBitsToUint(intermediateValue49));
                precise float productValue247 = comparisonValue44 * 1.52587890625e-05;
                precise float sumValue215 = productValue247 + intermediateValue51;
                float reinterpretedBits19 = (abs(intermediateValue51) < 0.03125) ? sumValue215 : uintBitsToFloat(((intermediateValue51 < 0.0) ? (-scalarValue99) : scalarValue99) + floatBitsToUint(intermediateValue51));
                float intermediateValue259;
                float intermediateValue260;
                float intermediateValue261;
                if (dot(vec3(ViewCB.packedValues[52u].xyz), vec3(comparisonValue42, comparisonValue43, comparisonValue44)) < 0.0)
                {
                    intermediateValue259 = 0.0;
                    intermediateValue260 = 0.0;
                    intermediateValue261 = 0.0;
                }
                else
                {
                    rayQueryInitializeEXT(intermediateValue262, SceneBVH, 512u, 32u, vec3(reinterpretedBits16, reinterpretedBits18, reinterpretedBits19), 0.0, vec3(ViewCB.packedValues[53u].xyz), 10000.0);
                    bool conditionValue11 = rayQueryProceedEXT(intermediateValue262);
                    if (conditionValue11)
                    {
                        bool intermediateValue284;
                        bool comparisonValue52;
                        for (;;)
                        {
                            uint scalarValue100 = rayQueryGetIntersectionTypeEXT(intermediateValue262, bool(0u));
                            comparisonValue52 = scalarValue100 == 0u;
                            if (comparisonValue52)
                            {
                                vec2 vectorValue10 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue262, bool(0u));
                                vec2 vectorValue11 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue262, bool(0u));
                                uint scalarValue101 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue262, bool(0u));
                                uint scalarValue102 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue262, bool(0u));
                                uint scalarValue103 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue262, bool(0u));
                                uint productValue248 = (scalarValue103 * 76u) + 58u;
                                uint productValue249 = (scalarValue103 * 76u) + 61u;
                                precise float sumValue216 = 1.0 - vectorValue10.x;
                                precise float sumValue217 = sumValue216 - vectorValue11.y;
                                uint bitwiseValue135 = (objectInstances_2.packedValues[(scalarValue103 * 38u) + 25u] >> 2u) + (scalarValue101 >> 1u);
                                uint productValue250 = uint(objectInstances.packedValues[(scalarValue103 * 76u) + 54u]) + 0u;
                                bool comparisonValue45 = (scalarValue101 & 1u) == 0u;
                                uint comparisonValue46 = comparisonValue45 ? faceUvBuffersRW[nonuniformEXT(productValue250)].packedValues[bitwiseValue135].z : faceUvBuffersRW[nonuniformEXT(productValue250)].packedValues[bitwiseValue135].x;
                                uint comparisonValue48 = comparisonValue45 ? faceUvBuffersRW[nonuniformEXT(productValue250)].packedValues[bitwiseValue135].y : faceUvBuffersRW[nonuniformEXT(productValue250)].packedValues[bitwiseValue135].w;
                                uint comparisonValue49 = comparisonValue45 ? faceUvBuffersRW[nonuniformEXT(productValue250)].packedValues[bitwiseValue135].x : faceUvBuffersRW[nonuniformEXT(productValue250)].packedValues[bitwiseValue135].z;
                                bool conditionValue12 = int16_t(objectInstances.packedValues[productValue249]) < int16_t(0us);
                                float intermediateValue313;
                                float intermediateValue314;
                                if (conditionValue12)
                                {
                                    uint bitwiseValue136 = comparisonValue49 >> 15u;
                                    precise float bitwiseValue137 = float(bitwiseValue136 & 1u) * 2.0;
                                    precise float sumValue218 = bitwiseValue137 + (-1.0);
                                    precise float bitwiseValue138 = float(comparisonValue49 >> 31u) * 2.0;
                                    precise float sumValue219 = bitwiseValue138 + (-1.0);
                                    precise float bitwiseValue139 = float((comparisonValue49 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue140 = float(bitwiseValue136 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue251 = sumValue218 * 3.0517578125e-05;
                                    precise float productValue252 = sumValue219 * 3.0517578125e-05;
                                    precise float sumValue220 = bitwiseValue139 + productValue251;
                                    precise float sumValue221 = bitwiseValue140 + productValue252;
                                    intermediateValue313 = sumValue220;
                                    intermediateValue314 = sumValue221;
                                }
                                else
                                {
                                    precise float bitwiseValue141 = float(comparisonValue49 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue142 = float(comparisonValue49 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue253 = bitwiseValue141 * 16384.0;
                                    precise float sumValue222 = productValue253 + 0.5;
                                    precise float productValue254 = bitwiseValue142 * 16384.0;
                                    precise float sumValue223 = productValue254 + 0.5;
                                    precise float productValue255 = floor(sumValue222) * 6.103515625e-05;
                                    precise float productValue256 = floor(sumValue223) * 6.103515625e-05;
                                    intermediateValue313 = productValue255;
                                    intermediateValue314 = productValue256;
                                }
                                precise float productValue257 = sumValue217 * intermediateValue313;
                                precise float productValue258 = sumValue217 * intermediateValue314;
                                precise float sumValue224 = productValue257 + 0.0;
                                precise float sumValue225 = productValue258 + 0.0;
                                float intermediateValue357;
                                float intermediateValue358;
                                if (conditionValue12)
                                {
                                    uint bitwiseValue143 = comparisonValue48 >> 15u;
                                    precise float bitwiseValue144 = float(bitwiseValue143 & 1u) * 2.0;
                                    precise float sumValue226 = bitwiseValue144 + (-1.0);
                                    precise float bitwiseValue145 = float(comparisonValue48 >> 31u) * 2.0;
                                    precise float sumValue227 = bitwiseValue145 + (-1.0);
                                    precise float bitwiseValue146 = float((comparisonValue48 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue147 = float(bitwiseValue143 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue259 = sumValue226 * 3.0517578125e-05;
                                    precise float productValue260 = sumValue227 * 3.0517578125e-05;
                                    precise float sumValue228 = bitwiseValue146 + productValue259;
                                    precise float sumValue229 = bitwiseValue147 + productValue260;
                                    intermediateValue357 = sumValue228;
                                    intermediateValue358 = sumValue229;
                                }
                                else
                                {
                                    precise float bitwiseValue148 = float(comparisonValue48 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue149 = float(comparisonValue48 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue261 = bitwiseValue148 * 16384.0;
                                    precise float sumValue230 = productValue261 + 0.5;
                                    precise float productValue262 = bitwiseValue149 * 16384.0;
                                    precise float sumValue231 = productValue262 + 0.5;
                                    precise float productValue263 = floor(sumValue230) * 6.103515625e-05;
                                    precise float productValue264 = floor(sumValue231) * 6.103515625e-05;
                                    intermediateValue357 = productValue263;
                                    intermediateValue358 = productValue264;
                                }
                                precise float productValue265 = vectorValue10.x * intermediateValue357;
                                precise float productValue266 = vectorValue10.x * intermediateValue358;
                                precise float sumValue232 = sumValue224 + productValue265;
                                precise float sumValue233 = sumValue225 + productValue266;
                                float intermediateValue379;
                                float intermediateValue380;
                                if (conditionValue12)
                                {
                                    uint bitwiseValue150 = comparisonValue46 >> 15u;
                                    precise float bitwiseValue151 = float(bitwiseValue150 & 1u) * 2.0;
                                    precise float sumValue234 = bitwiseValue151 + (-1.0);
                                    precise float bitwiseValue152 = float(comparisonValue46 >> 31u) * 2.0;
                                    precise float sumValue235 = bitwiseValue152 + (-1.0);
                                    precise float bitwiseValue153 = float((comparisonValue46 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue154 = float(bitwiseValue150 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue267 = sumValue234 * 3.0517578125e-05;
                                    precise float productValue268 = sumValue235 * 3.0517578125e-05;
                                    precise float sumValue236 = bitwiseValue153 + productValue267;
                                    precise float sumValue237 = bitwiseValue154 + productValue268;
                                    intermediateValue379 = sumValue236;
                                    intermediateValue380 = sumValue237;
                                }
                                else
                                {
                                    precise float bitwiseValue155 = float(comparisonValue46 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue156 = float(comparisonValue46 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue269 = bitwiseValue155 * 16384.0;
                                    precise float sumValue238 = productValue269 + 0.5;
                                    precise float productValue270 = bitwiseValue156 * 16384.0;
                                    precise float sumValue239 = productValue270 + 0.5;
                                    precise float productValue271 = floor(sumValue238) * 6.103515625e-05;
                                    precise float productValue272 = floor(sumValue239) * 6.103515625e-05;
                                    intermediateValue379 = productValue271;
                                    intermediateValue380 = productValue272;
                                }
                                precise float productValue273 = vectorValue11.y * intermediateValue379;
                                precise float productValue274 = vectorValue11.y * intermediateValue380;
                                precise float sumValue240 = sumValue232 + productValue273;
                                precise float sumValue241 = sumValue233 + productValue274;
                                float intermediateValue381;
                                if (objectInstances.packedValues[productValue248] == 65535us)
                                {
                                    intermediateValue381 = 1.0;
                                }
                                else
                                {
                                    uint reinterpretedBits33;
                                    if (objectInstances.packedValues[productValue248] > 4095us)
                                    {
                                        reinterpretedBits33 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits33 = uint(objectInstances.packedValues[productValue248]);
                                    }
                                    intermediateValue381 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits33 + 0u], defaultSampler)), vec2(sumValue240, sumValue241), -0.25).w;
                                }
                                uint comparisonValue76;
                                if (scalarValue102 == 2u)
                                {
                                    comparisonValue76 = 0u;
                                }
                                else
                                {
                                    comparisonValue76 = uint(intermediateValue381 <= (((objectInstances.packedValues[productValue249] & 4352us) != 0us) ? 0.5 : 0.0));
                                }
                                if (comparisonValue76 == 0u)
                                {
                                    rayQueryConfirmIntersectionEXT(intermediateValue262);
                                }
                            }
                            intermediateValue284 = rayQueryProceedEXT(intermediateValue262);
                            if (intermediateValue284)
                            {
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    uint scalarValue104 = rayQueryGetIntersectionTypeEXT(intermediateValue262, bool(1u));
                    float intermediateValue277;
                    if (scalarValue104 == 1u)
                    {
                        float scalarValue105 = rayQueryGetIntersectionTEXT(intermediateValue262, bool(1u));
                        intermediateValue277 = scalarValue105;
                    }
                    else
                    {
                        intermediateValue277 = 10000.0;
                    }
                    float branchMergedValue39;
                    float branchMergedValue65;
                    float branchMergedValue66;
                    if (intermediateValue277 < 10000.0)
                    {
                        precise float productValue275 = intermediateValue277 * ViewCB.packedValues[63u].x;
                        precise float productValue276 = intermediateValue277 * ViewCB.packedValues[63u].y;
                        precise float productValue277 = intermediateValue277 * ViewCB.packedValues[63u].z;
                        precise float productValue278 = productValue275 * (-1.44269502162933349609375);
                        precise float productValue279 = productValue276 * (-1.44269502162933349609375);
                        precise float productValue280 = productValue277 * (-1.44269502162933349609375);
                        precise float productValue281 = ViewCB.packedValues[53u].x * intermediateValue277;
                        precise float sumValue242 = productValue281 + reinterpretedBits16;
                        precise float productValue282 = ViewCB.packedValues[53u].z * intermediateValue277;
                        precise float sumValue243 = productValue282 + reinterpretedBits19;
                        precise float productValue283 = sumValue242 * ViewCB.packedValues[83u].z;
                        precise float sumValue244 = productValue283 + ViewCB.packedValues[84u].x;
                        precise float productValue284 = sumValue243 * ViewCB.packedValues[83u].w;
                        precise float sumValue245 = productValue284 + ViewCB.packedValues[84u].y;
                        vec4 sampledTextureValue12 = textureLod(sampler2D(wibblyTexture, linearWrapSampler), vec2(sumValue244, sumValue245), 0.0);
                        precise float sumValue246 = sampledTextureValue12.x + (-0.5);
                        precise float sumValue247 = sampledTextureValue12.y + (-0.5);
                        precise float productValue285 = sumValue242 * ViewCB.packedValues[82u].z;
                        precise float sumValue248 = productValue285 + ViewCB.packedValues[83u].x;
                        precise float productValue286 = sumValue243 * ViewCB.packedValues[82u].w;
                        precise float sumValue249 = productValue286 + ViewCB.packedValues[83u].y;
                        precise float productValue287 = sumValue246 * 0.4000000059604644775390625;
                        precise float productValue288 = sumValue247 * 0.4000000059604644775390625;
                        precise float sumValue250 = sumValue248 + productValue287;
                        precise float sumValue251 = productValue288 + sumValue249;
                        precise float productValue289 = ViewCB.packedValues[68u].w * 63.0;
                        uint scalarValue106 = uint(int(floor(productValue289)));
                        precise float productValue290 = float(int(scalarValue106 + 1u)) * 0.015625;
                        precise float sumValue252 = (-0.0) - productValue290;
                        float scalarValue107 = fract(abs(productValue290));
                        precise float sumValue253 = (-0.0) - scalarValue107;
                        precise float comparisonValue50 = ((productValue290 >= sumValue252) ? scalarValue107 : sumValue253) * 64.0;
                        vec4 sampledTextureValue13 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue250, sumValue251, float(int(scalarValue106))), 0.0);
                        float scalarValue108 = sampledTextureValue13.x;
                        precise float sampledTextureValue14 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue250, sumValue251, float(int(uint(int(comparisonValue50))))), 0.0).x - scalarValue108;
                        precise float productValue291 = fract(productValue289) * sampledTextureValue14;
                        precise float sumValue254 = scalarValue108 + productValue291;
                        precise float productValue292 = sumValue254 * 7.0;
                        precise float sumValue255 = productValue292 + 0.800000011920928955078125;
                        precise float productValue293 = intermediateValue277 * (-0.100000001490116119384765625);
                        precise float sumValue256 = sumValue255 + (-1.0);
                        precise float exponentialValue3 = exp2(productValue293) * sumValue256;
                        precise float sumValue257 = exponentialValue3 + 1.0;
                        precise float exponentialValue4 = exp2(productValue278) * sumValue257;
                        precise float exponentialValue5 = exp2(productValue279) * sumValue257;
                        precise float exponentialValue6 = exp2(productValue280) * sumValue257;
                        rayQueryInitializeEXT(intermediateValue288, SceneBVH, 512u, 223u, vec3(reinterpretedBits16, reinterpretedBits18, reinterpretedBits19), 0.0, vec3(ViewCB.packedValues[53u].xyz), intermediateValue277);
                        bool conditionValue13 = rayQueryProceedEXT(intermediateValue288);
                        float intermediateValue295;
                        float intermediateValue297;
                        float intermediateValue299;
                        if (conditionValue13)
                        {
                            float intermediateValue296;
                            float intermediateValue298;
                            float intermediateValue300;
                            float scalarValue109 = exponentialValue4;
                            float scalarValue110 = exponentialValue5;
                            float scalarValue111 = exponentialValue6;
                            bool comparisonValue60;
                            for (;;)
                            {
                                uint scalarValue112 = rayQueryGetIntersectionTypeEXT(intermediateValue288, bool(0u));
                                comparisonValue60 = scalarValue112 == 0u;
                                float branchMergedValue1;
                                float branchMergedValue13;
                                float branchMergedValue14;
                                if (comparisonValue60)
                                {
                                    vec2 vectorValue12 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue288, bool(0u));
                                    vec2 vectorValue13 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue288, bool(0u));
                                    float scalarValue113 = rayQueryGetIntersectionTEXT(intermediateValue288, bool(0u));
                                    uint scalarValue114 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue288, bool(0u));
                                    uint scalarValue115 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue288, bool(0u));
                                    uint scalarValue116 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue288, bool(0u));
                                    uint productValue294 = (scalarValue116 * 76u) + 58u;
                                    uint productValue295 = (scalarValue116 * 76u) + 61u;
                                    precise float sumValue258 = 1.0 - vectorValue12.x;
                                    precise float sumValue259 = sumValue258 - vectorValue13.y;
                                    uint bitwiseValue157 = (objectInstances_2.packedValues[(scalarValue116 * 38u) + 25u] >> 2u) + (scalarValue114 >> 1u);
                                    uint productValue296 = uint(objectInstances.packedValues[(scalarValue116 * 76u) + 54u]) + 0u;
                                    bool comparisonValue53 = (scalarValue114 & 1u) == 0u;
                                    uint comparisonValue54 = comparisonValue53 ? faceUvBuffersRW[nonuniformEXT(productValue296)].packedValues[bitwiseValue157].z : faceUvBuffersRW[nonuniformEXT(productValue296)].packedValues[bitwiseValue157].x;
                                    uint comparisonValue55 = comparisonValue53 ? faceUvBuffersRW[nonuniformEXT(productValue296)].packedValues[bitwiseValue157].y : faceUvBuffersRW[nonuniformEXT(productValue296)].packedValues[bitwiseValue157].w;
                                    uint comparisonValue56 = comparisonValue53 ? faceUvBuffersRW[nonuniformEXT(productValue296)].packedValues[bitwiseValue157].x : faceUvBuffersRW[nonuniformEXT(productValue296)].packedValues[bitwiseValue157].z;
                                    bool conditionValue14 = int16_t(objectInstances.packedValues[productValue295]) < int16_t(0us);
                                    float intermediateValue364;
                                    float intermediateValue365;
                                    if (conditionValue14)
                                    {
                                        uint bitwiseValue158 = comparisonValue56 >> 15u;
                                        precise float bitwiseValue159 = float(bitwiseValue158 & 1u) * 2.0;
                                        precise float sumValue260 = bitwiseValue159 + (-1.0);
                                        precise float bitwiseValue160 = float(comparisonValue56 >> 31u) * 2.0;
                                        precise float sumValue261 = bitwiseValue160 + (-1.0);
                                        precise float bitwiseValue161 = float((comparisonValue56 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue162 = float(bitwiseValue158 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue297 = sumValue260 * 3.0517578125e-05;
                                        precise float productValue298 = sumValue261 * 3.0517578125e-05;
                                        precise float sumValue262 = bitwiseValue161 + productValue297;
                                        precise float sumValue263 = bitwiseValue162 + productValue298;
                                        intermediateValue364 = sumValue262;
                                        intermediateValue365 = sumValue263;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue163 = float(comparisonValue56 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue164 = float(comparisonValue56 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue299 = bitwiseValue163 * 16384.0;
                                        precise float sumValue264 = productValue299 + 0.5;
                                        precise float productValue300 = bitwiseValue164 * 16384.0;
                                        precise float sumValue265 = productValue300 + 0.5;
                                        precise float productValue301 = floor(sumValue264) * 6.103515625e-05;
                                        precise float productValue302 = floor(sumValue265) * 6.103515625e-05;
                                        intermediateValue364 = productValue301;
                                        intermediateValue365 = productValue302;
                                    }
                                    precise float productValue303 = sumValue259 * intermediateValue364;
                                    precise float productValue304 = sumValue259 * intermediateValue365;
                                    precise float sumValue266 = productValue303 + 0.0;
                                    precise float sumValue267 = productValue304 + 0.0;
                                    float intermediateValue382;
                                    float intermediateValue383;
                                    if (conditionValue14)
                                    {
                                        uint bitwiseValue165 = comparisonValue55 >> 15u;
                                        precise float bitwiseValue166 = float(bitwiseValue165 & 1u) * 2.0;
                                        precise float sumValue268 = bitwiseValue166 + (-1.0);
                                        precise float bitwiseValue167 = float(comparisonValue55 >> 31u) * 2.0;
                                        precise float sumValue269 = bitwiseValue167 + (-1.0);
                                        precise float bitwiseValue168 = float((comparisonValue55 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue169 = float(bitwiseValue165 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue305 = sumValue268 * 3.0517578125e-05;
                                        precise float productValue306 = sumValue269 * 3.0517578125e-05;
                                        precise float sumValue270 = bitwiseValue168 + productValue305;
                                        precise float sumValue271 = bitwiseValue169 + productValue306;
                                        intermediateValue382 = sumValue270;
                                        intermediateValue383 = sumValue271;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue170 = float(comparisonValue55 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue171 = float(comparisonValue55 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue307 = bitwiseValue170 * 16384.0;
                                        precise float sumValue272 = productValue307 + 0.5;
                                        precise float productValue308 = bitwiseValue171 * 16384.0;
                                        precise float sumValue273 = productValue308 + 0.5;
                                        precise float productValue309 = floor(sumValue272) * 6.103515625e-05;
                                        precise float productValue310 = floor(sumValue273) * 6.103515625e-05;
                                        intermediateValue382 = productValue309;
                                        intermediateValue383 = productValue310;
                                    }
                                    precise float productValue311 = vectorValue12.x * intermediateValue382;
                                    precise float productValue312 = vectorValue12.x * intermediateValue383;
                                    precise float sumValue274 = sumValue266 + productValue311;
                                    precise float sumValue275 = sumValue267 + productValue312;
                                    float intermediateValue388;
                                    float intermediateValue389;
                                    if (conditionValue14)
                                    {
                                        uint bitwiseValue172 = comparisonValue54 >> 15u;
                                        precise float bitwiseValue173 = float(bitwiseValue172 & 1u) * 2.0;
                                        precise float sumValue276 = bitwiseValue173 + (-1.0);
                                        precise float bitwiseValue174 = float(comparisonValue54 >> 31u) * 2.0;
                                        precise float sumValue277 = bitwiseValue174 + (-1.0);
                                        precise float bitwiseValue175 = float((comparisonValue54 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue176 = float(bitwiseValue172 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue313 = sumValue276 * 3.0517578125e-05;
                                        precise float productValue314 = sumValue277 * 3.0517578125e-05;
                                        precise float sumValue278 = bitwiseValue175 + productValue313;
                                        precise float sumValue279 = bitwiseValue176 + productValue314;
                                        intermediateValue388 = sumValue278;
                                        intermediateValue389 = sumValue279;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue177 = float(comparisonValue54 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue178 = float(comparisonValue54 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue315 = bitwiseValue177 * 16384.0;
                                        precise float sumValue280 = productValue315 + 0.5;
                                        precise float productValue316 = bitwiseValue178 * 16384.0;
                                        precise float sumValue281 = productValue316 + 0.5;
                                        precise float productValue317 = floor(sumValue280) * 6.103515625e-05;
                                        precise float productValue318 = floor(sumValue281) * 6.103515625e-05;
                                        intermediateValue388 = productValue317;
                                        intermediateValue389 = productValue318;
                                    }
                                    precise float productValue319 = vectorValue13.y * intermediateValue388;
                                    precise float productValue320 = vectorValue13.y * intermediateValue389;
                                    precise float sumValue282 = sumValue274 + productValue319;
                                    precise float sumValue283 = sumValue275 + productValue320;
                                    precise float productValue321 = scalarValue113 * 0.083333335816860198974609375;
                                    precise float sumValue284 = productValue321 + (-0.25);
                                    float intermediateValue394;
                                    float intermediateValue395;
                                    float intermediateValue396;
                                    float intermediateValue397;
                                    if (objectInstances.packedValues[productValue294] == 65535us)
                                    {
                                        intermediateValue394 = 1.0;
                                        intermediateValue395 = 1.0;
                                        intermediateValue396 = 1.0;
                                        intermediateValue397 = 1.0;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits34;
                                        if (objectInstances.packedValues[productValue294] > 4095us)
                                        {
                                            reinterpretedBits34 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits34 = uint(objectInstances.packedValues[productValue294]);
                                        }
                                        vec4 sampledTextureValue15 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits34 + 0u], defaultSampler)), vec2(sumValue282, sumValue283), spvNMin(sumValue284, 2.0));
                                        intermediateValue394 = sampledTextureValue15.x;
                                        intermediateValue395 = sampledTextureValue15.y;
                                        intermediateValue396 = sampledTextureValue15.z;
                                        intermediateValue397 = sampledTextureValue15.w;
                                    }
                                    float intermediateValue404;
                                    float intermediateValue405;
                                    float intermediateValue406;
                                    if (scalarValue115 == 2u)
                                    {
                                        float branchMergedValue42;
                                        float branchMergedValue72;
                                        float branchMergedValue73;
                                        if ((objectInstances.packedValues[productValue295] & 128us) == 0us)
                                        {
                                            float intermediateValue414;
                                            if ((objectInstances.packedValues[productValue295] & 2048us) == 0us)
                                            {
                                                intermediateValue414 = intermediateValue397;
                                            }
                                            else
                                            {
                                                precise float productValue322 = intermediateValue397 * 2.0;
                                                precise float sumValue285 = productValue322 + (-1.0);
                                                intermediateValue414 = spvNClamp(sumValue285, 0.0, 1.0);
                                            }
                                            precise float sumValue286 = 0.0 - intermediateValue394;
                                            precise float sumValue287 = 0.0 - intermediateValue395;
                                            precise float sumValue288 = 0.0 - intermediateValue396;
                                            precise float productValue323 = sumValue286 * intermediateValue414;
                                            precise float productValue324 = sumValue287 * intermediateValue414;
                                            precise float productValue325 = sumValue288 * intermediateValue414;
                                            precise float sumValue289 = intermediateValue394 + productValue323;
                                            precise float sumValue290 = intermediateValue395 + productValue324;
                                            precise float sumValue291 = intermediateValue396 + productValue325;
                                            branchMergedValue42 = sumValue289;
                                            branchMergedValue72 = sumValue290;
                                            branchMergedValue73 = sumValue291;
                                        }
                                        else
                                        {
                                            branchMergedValue42 = 0.33399999141693115234375;
                                            branchMergedValue72 = 0.33399999141693115234375;
                                            branchMergedValue73 = 0.33399999141693115234375;
                                        }
                                        intermediateValue404 = branchMergedValue42;
                                        intermediateValue405 = branchMergedValue72;
                                        intermediateValue406 = branchMergedValue73;
                                    }
                                    else
                                    {
                                        precise float sumValue292 = 1.0 - intermediateValue397;
                                        intermediateValue404 = sumValue292;
                                        intermediateValue405 = sumValue292;
                                        intermediateValue406 = sumValue292;
                                    }
                                    precise float productValue326 = scalarValue109 * intermediateValue404;
                                    precise float productValue327 = scalarValue110 * intermediateValue405;
                                    precise float productValue328 = scalarValue111 * intermediateValue406;
                                    float intermediateValue335;
                                    float intermediateValue336;
                                    float intermediateValue337;
                                    bool intermediateValue415;
                                    if (!(dot(vec3(productValue326, productValue327, productValue328), vec3(1.0)) <= 0.00999999977648258209228515625))
                                    {
                                        intermediateValue415 = false;
                                        intermediateValue335 = productValue326;
                                        intermediateValue336 = productValue327;
                                        intermediateValue337 = productValue328;
                                    }
                                    else
                                    {
                                        intermediateValue415 = true;
                                        intermediateValue335 = 0.0;
                                        intermediateValue336 = 0.0;
                                        intermediateValue337 = 0.0;
                                    }
                                    float branchMergedValue82;
                                    float branchMergedValue94;
                                    float branchMergedValue95;
                                    if (intermediateValue415)
                                    {
                                        rayQueryConfirmIntersectionEXT(intermediateValue288);
                                        branchMergedValue82 = intermediateValue337;
                                        branchMergedValue94 = intermediateValue336;
                                        branchMergedValue95 = intermediateValue335;
                                    }
                                    else
                                    {
                                        branchMergedValue82 = intermediateValue337;
                                        branchMergedValue94 = intermediateValue336;
                                        branchMergedValue95 = intermediateValue335;
                                    }
                                    branchMergedValue1 = branchMergedValue82;
                                    branchMergedValue13 = branchMergedValue94;
                                    branchMergedValue14 = branchMergedValue95;
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue111;
                                    branchMergedValue13 = scalarValue110;
                                    branchMergedValue14 = scalarValue109;
                                }
                                intermediateValue300 = branchMergedValue1;
                                intermediateValue298 = branchMergedValue13;
                                intermediateValue296 = branchMergedValue14;
                                bool conditionValue15 = rayQueryProceedEXT(intermediateValue288);
                                if (conditionValue15)
                                {
                                    scalarValue109 = intermediateValue296;
                                    scalarValue110 = intermediateValue298;
                                    scalarValue111 = intermediateValue300;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            intermediateValue295 = intermediateValue296;
                            intermediateValue297 = intermediateValue298;
                            intermediateValue299 = intermediateValue300;
                        }
                        else
                        {
                            intermediateValue295 = exponentialValue4;
                            intermediateValue297 = exponentialValue5;
                            intermediateValue299 = exponentialValue6;
                        }
                        uint scalarValue117 = rayQueryGetIntersectionTypeEXT(intermediateValue288, bool(1u));
                        bool comparisonValue57 = scalarValue117 == 1u;
                        float comparisonValue58 = comparisonValue57 ? 0.0 : intermediateValue295;
                        float comparisonValue59 = comparisonValue57 ? 0.0 : intermediateValue297;
                        float comparisonValue62 = comparisonValue57 ? 0.0 : intermediateValue299;
                        float branchMergedValue119;
                        float branchMergedValue129;
                        float branchMergedValue130;
                        if (dot(vec3(comparisonValue58, comparisonValue59, comparisonValue62), vec3(1.0)) > 0.00999999977648258209228515625)
                        {
                            rayQueryInitializeEXT(intermediateValue319, SceneBVH, 512u, 223u, vec3(sumValue242, fma(ViewCB.packedValues[53u].y, intermediateValue277, reinterpretedBits18), sumValue243), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                            bool conditionValue16 = rayQueryProceedEXT(intermediateValue319);
                            float intermediateValue339;
                            float intermediateValue341;
                            float intermediateValue343;
                            if (conditionValue16)
                            {
                                float intermediateValue340;
                                float intermediateValue342;
                                float intermediateValue344;
                                float scalarValue118 = comparisonValue58;
                                float scalarValue119 = comparisonValue59;
                                float scalarValue120 = comparisonValue62;
                                bool comparisonValue71;
                                for (;;)
                                {
                                    uint scalarValue121 = rayQueryGetIntersectionTypeEXT(intermediateValue319, bool(0u));
                                    comparisonValue71 = scalarValue121 == 0u;
                                    float branchMergedValue3;
                                    float branchMergedValue17;
                                    float branchMergedValue18;
                                    if (comparisonValue71)
                                    {
                                        vec2 vectorValue14 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue319, bool(0u));
                                        vec2 vectorValue15 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue319, bool(0u));
                                        float scalarValue122 = rayQueryGetIntersectionTEXT(intermediateValue319, bool(0u));
                                        uint scalarValue123 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue319, bool(0u));
                                        uint scalarValue124 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue319, bool(0u));
                                        uint scalarValue125 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue319, bool(0u));
                                        uint productValue329 = (scalarValue125 * 76u) + 58u;
                                        uint productValue330 = (scalarValue125 * 76u) + 61u;
                                        precise float sumValue293 = 1.0 - vectorValue14.x;
                                        precise float sumValue294 = sumValue293 - vectorValue15.y;
                                        uint bitwiseValue179 = (objectInstances_2.packedValues[(scalarValue125 * 38u) + 25u] >> 2u) + (scalarValue123 >> 1u);
                                        uint productValue331 = uint(objectInstances.packedValues[(scalarValue125 * 76u) + 54u]) + 0u;
                                        bool comparisonValue63 = (scalarValue123 & 1u) == 0u;
                                        uint comparisonValue64 = comparisonValue63 ? faceUvBuffersRW[nonuniformEXT(productValue331)].packedValues[bitwiseValue179].z : faceUvBuffersRW[nonuniformEXT(productValue331)].packedValues[bitwiseValue179].x;
                                        uint comparisonValue65 = comparisonValue63 ? faceUvBuffersRW[nonuniformEXT(productValue331)].packedValues[bitwiseValue179].y : faceUvBuffersRW[nonuniformEXT(productValue331)].packedValues[bitwiseValue179].w;
                                        uint comparisonValue66 = comparisonValue63 ? faceUvBuffersRW[nonuniformEXT(productValue331)].packedValues[bitwiseValue179].x : faceUvBuffersRW[nonuniformEXT(productValue331)].packedValues[bitwiseValue179].z;
                                        bool conditionValue17 = int16_t(objectInstances.packedValues[productValue330]) < int16_t(0us);
                                        float intermediateValue384;
                                        float intermediateValue385;
                                        if (conditionValue17)
                                        {
                                            uint bitwiseValue180 = comparisonValue66 >> 15u;
                                            precise float bitwiseValue181 = float(bitwiseValue180 & 1u) * 2.0;
                                            precise float sumValue295 = bitwiseValue181 + (-1.0);
                                            precise float bitwiseValue182 = float(comparisonValue66 >> 31u) * 2.0;
                                            precise float sumValue296 = bitwiseValue182 + (-1.0);
                                            precise float bitwiseValue183 = float((comparisonValue66 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue184 = float(bitwiseValue180 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue332 = sumValue295 * 3.0517578125e-05;
                                            precise float productValue333 = sumValue296 * 3.0517578125e-05;
                                            precise float sumValue297 = bitwiseValue183 + productValue332;
                                            precise float sumValue298 = bitwiseValue184 + productValue333;
                                            intermediateValue384 = sumValue297;
                                            intermediateValue385 = sumValue298;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue185 = float(comparisonValue66 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue186 = float(comparisonValue66 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue334 = bitwiseValue185 * 16384.0;
                                            precise float sumValue299 = productValue334 + 0.5;
                                            precise float productValue335 = bitwiseValue186 * 16384.0;
                                            precise float sumValue300 = productValue335 + 0.5;
                                            precise float productValue336 = floor(sumValue299) * 6.103515625e-05;
                                            precise float productValue337 = floor(sumValue300) * 6.103515625e-05;
                                            intermediateValue384 = productValue336;
                                            intermediateValue385 = productValue337;
                                        }
                                        precise float productValue338 = sumValue294 * intermediateValue384;
                                        precise float productValue339 = sumValue294 * intermediateValue385;
                                        precise float sumValue301 = productValue338 + 0.0;
                                        precise float sumValue302 = productValue339 + 0.0;
                                        float intermediateValue390;
                                        float intermediateValue391;
                                        if (conditionValue17)
                                        {
                                            uint bitwiseValue187 = comparisonValue65 >> 15u;
                                            precise float bitwiseValue188 = float(bitwiseValue187 & 1u) * 2.0;
                                            precise float sumValue303 = bitwiseValue188 + (-1.0);
                                            precise float bitwiseValue189 = float(comparisonValue65 >> 31u) * 2.0;
                                            precise float sumValue304 = bitwiseValue189 + (-1.0);
                                            precise float bitwiseValue190 = float((comparisonValue65 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue191 = float(bitwiseValue187 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue340 = sumValue303 * 3.0517578125e-05;
                                            precise float productValue341 = sumValue304 * 3.0517578125e-05;
                                            precise float sumValue305 = bitwiseValue190 + productValue340;
                                            precise float sumValue306 = bitwiseValue191 + productValue341;
                                            intermediateValue390 = sumValue305;
                                            intermediateValue391 = sumValue306;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue192 = float(comparisonValue65 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue193 = float(comparisonValue65 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue342 = bitwiseValue192 * 16384.0;
                                            precise float sumValue307 = productValue342 + 0.5;
                                            precise float productValue343 = bitwiseValue193 * 16384.0;
                                            precise float sumValue308 = productValue343 + 0.5;
                                            precise float productValue344 = floor(sumValue307) * 6.103515625e-05;
                                            precise float productValue345 = floor(sumValue308) * 6.103515625e-05;
                                            intermediateValue390 = productValue344;
                                            intermediateValue391 = productValue345;
                                        }
                                        precise float productValue346 = vectorValue14.x * intermediateValue390;
                                        precise float productValue347 = vectorValue14.x * intermediateValue391;
                                        precise float sumValue309 = sumValue301 + productValue346;
                                        precise float sumValue310 = sumValue302 + productValue347;
                                        float intermediateValue402;
                                        float intermediateValue403;
                                        if (conditionValue17)
                                        {
                                            uint bitwiseValue194 = comparisonValue64 >> 15u;
                                            precise float bitwiseValue195 = float(bitwiseValue194 & 1u) * 2.0;
                                            precise float sumValue311 = bitwiseValue195 + (-1.0);
                                            precise float bitwiseValue196 = float(comparisonValue64 >> 31u) * 2.0;
                                            precise float sumValue312 = bitwiseValue196 + (-1.0);
                                            precise float bitwiseValue197 = float((comparisonValue64 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue198 = float(bitwiseValue194 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue348 = sumValue311 * 3.0517578125e-05;
                                            precise float productValue349 = sumValue312 * 3.0517578125e-05;
                                            precise float sumValue313 = bitwiseValue197 + productValue348;
                                            precise float sumValue314 = bitwiseValue198 + productValue349;
                                            intermediateValue402 = sumValue313;
                                            intermediateValue403 = sumValue314;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue199 = float(comparisonValue64 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue200 = float(comparisonValue64 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue350 = bitwiseValue199 * 16384.0;
                                            precise float sumValue315 = productValue350 + 0.5;
                                            precise float productValue351 = bitwiseValue200 * 16384.0;
                                            precise float sumValue316 = productValue351 + 0.5;
                                            precise float productValue352 = floor(sumValue315) * 6.103515625e-05;
                                            precise float productValue353 = floor(sumValue316) * 6.103515625e-05;
                                            intermediateValue402 = productValue352;
                                            intermediateValue403 = productValue353;
                                        }
                                        precise float productValue354 = vectorValue15.y * intermediateValue402;
                                        precise float productValue355 = vectorValue15.y * intermediateValue403;
                                        precise float sumValue317 = sumValue309 + productValue354;
                                        precise float sumValue318 = sumValue310 + productValue355;
                                        float intermediateValue407;
                                        float intermediateValue408;
                                        float intermediateValue409;
                                        float intermediateValue410;
                                        if (objectInstances.packedValues[productValue329] == 65535us)
                                        {
                                            intermediateValue407 = 1.0;
                                            intermediateValue408 = 1.0;
                                            intermediateValue409 = 1.0;
                                            intermediateValue410 = 1.0;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits36;
                                            if (objectInstances.packedValues[productValue329] > 4095us)
                                            {
                                                reinterpretedBits36 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits36 = uint(objectInstances.packedValues[productValue329]);
                                            }
                                            vec4 sampledTextureValue16 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits36 + 0u], defaultSampler)), vec2(sumValue317, sumValue318), spvNMin(fma(scalarValue122, 0.083333335816860198974609375, -0.25), 2.0));
                                            intermediateValue407 = sampledTextureValue16.x;
                                            intermediateValue408 = sampledTextureValue16.y;
                                            intermediateValue409 = sampledTextureValue16.z;
                                            intermediateValue410 = sampledTextureValue16.w;
                                        }
                                        float intermediateValue418;
                                        float intermediateValue419;
                                        float intermediateValue420;
                                        if (scalarValue124 == 2u)
                                        {
                                            float branchMergedValue44;
                                            float branchMergedValue76;
                                            float branchMergedValue77;
                                            if ((objectInstances.packedValues[productValue330] & 128us) == 0us)
                                            {
                                                float intermediateValue421;
                                                if ((objectInstances.packedValues[productValue330] & 2048us) == 0us)
                                                {
                                                    intermediateValue421 = intermediateValue410;
                                                }
                                                else
                                                {
                                                    intermediateValue421 = spvNClamp(fma(intermediateValue410, 2.0, -1.0), 0.0, 1.0);
                                                }
                                                branchMergedValue44 = intermediateValue407 - (intermediateValue421 * intermediateValue407);
                                                branchMergedValue76 = intermediateValue409 - (intermediateValue421 * intermediateValue409);
                                                branchMergedValue77 = intermediateValue408 - (intermediateValue421 * intermediateValue408);
                                            }
                                            else
                                            {
                                                branchMergedValue44 = 0.33399999141693115234375;
                                                branchMergedValue76 = 0.33399999141693115234375;
                                                branchMergedValue77 = 0.33399999141693115234375;
                                            }
                                            intermediateValue418 = branchMergedValue44;
                                            intermediateValue419 = branchMergedValue77;
                                            intermediateValue420 = branchMergedValue76;
                                        }
                                        else
                                        {
                                            float sumValue319 = 1.0 - intermediateValue410;
                                            intermediateValue418 = sumValue319;
                                            intermediateValue419 = sumValue319;
                                            intermediateValue420 = sumValue319;
                                        }
                                        float productValue356 = intermediateValue418 * scalarValue118;
                                        float productValue357 = intermediateValue419 * scalarValue119;
                                        float productValue358 = intermediateValue420 * scalarValue120;
                                        float intermediateValue373;
                                        float intermediateValue374;
                                        float intermediateValue375;
                                        bool intermediateValue422;
                                        if (!(dot(vec3(productValue356, productValue357, productValue358), vec3(1.0)) <= 0.00999999977648258209228515625))
                                        {
                                            intermediateValue422 = false;
                                            intermediateValue373 = productValue356;
                                            intermediateValue374 = productValue357;
                                            intermediateValue375 = productValue358;
                                        }
                                        else
                                        {
                                            intermediateValue422 = true;
                                            intermediateValue373 = 0.0;
                                            intermediateValue374 = 0.0;
                                            intermediateValue375 = 0.0;
                                        }
                                        float branchMergedValue84;
                                        float branchMergedValue98;
                                        float branchMergedValue99;
                                        if (intermediateValue422)
                                        {
                                            rayQueryConfirmIntersectionEXT(intermediateValue319);
                                            branchMergedValue84 = intermediateValue375;
                                            branchMergedValue98 = intermediateValue374;
                                            branchMergedValue99 = intermediateValue373;
                                        }
                                        else
                                        {
                                            branchMergedValue84 = intermediateValue375;
                                            branchMergedValue98 = intermediateValue374;
                                            branchMergedValue99 = intermediateValue373;
                                        }
                                        branchMergedValue3 = branchMergedValue84;
                                        branchMergedValue17 = branchMergedValue98;
                                        branchMergedValue18 = branchMergedValue99;
                                    }
                                    else
                                    {
                                        branchMergedValue3 = scalarValue120;
                                        branchMergedValue17 = scalarValue119;
                                        branchMergedValue18 = scalarValue118;
                                    }
                                    intermediateValue344 = branchMergedValue3;
                                    intermediateValue342 = branchMergedValue17;
                                    intermediateValue340 = branchMergedValue18;
                                    bool conditionValue18 = rayQueryProceedEXT(intermediateValue319);
                                    if (conditionValue18)
                                    {
                                        scalarValue118 = intermediateValue340;
                                        scalarValue119 = intermediateValue342;
                                        scalarValue120 = intermediateValue344;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue339 = intermediateValue340;
                                intermediateValue341 = intermediateValue342;
                                intermediateValue343 = intermediateValue344;
                            }
                            else
                            {
                                intermediateValue339 = comparisonValue58;
                                intermediateValue341 = comparisonValue59;
                                intermediateValue343 = comparisonValue62;
                            }
                            uint scalarValue126 = rayQueryGetIntersectionTypeEXT(intermediateValue319, bool(1u));
                            bool comparisonValue67 = scalarValue126 == 1u;
                            branchMergedValue119 = comparisonValue67 ? 0.0 : intermediateValue339;
                            branchMergedValue129 = comparisonValue67 ? 0.0 : intermediateValue341;
                            branchMergedValue130 = comparisonValue67 ? 0.0 : intermediateValue343;
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
                        rayQueryInitializeEXT(intermediateValue290, SceneBVH, 512u, 223u, vec3(reinterpretedBits16, reinterpretedBits18, reinterpretedBits19), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                        bool conditionValue19 = rayQueryProceedEXT(intermediateValue290);
                        float intermediateValue302;
                        float intermediateValue304;
                        float intermediateValue306;
                        if (conditionValue19)
                        {
                            float intermediateValue303;
                            float intermediateValue305;
                            float intermediateValue307;
                            float scalarValue127 = 1.0;
                            float scalarValue128 = 1.0;
                            float scalarValue129 = 1.0;
                            bool comparisonValue61;
                            for (;;)
                            {
                                uint scalarValue130 = rayQueryGetIntersectionTypeEXT(intermediateValue290, bool(0u));
                                comparisonValue61 = scalarValue130 == 0u;
                                float branchMergedValue2;
                                float branchMergedValue15;
                                float branchMergedValue16;
                                if (comparisonValue61)
                                {
                                    vec2 vectorValue16 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue290, bool(0u));
                                    vec2 vectorValue17 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue290, bool(0u));
                                    float scalarValue131 = rayQueryGetIntersectionTEXT(intermediateValue290, bool(0u));
                                    uint scalarValue132 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue290, bool(0u));
                                    uint scalarValue133 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue290, bool(0u));
                                    uint scalarValue134 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue290, bool(0u));
                                    uint productValue359 = (scalarValue134 * 76u) + 58u;
                                    uint productValue360 = (scalarValue134 * 76u) + 61u;
                                    precise float sumValue320 = 1.0 - vectorValue16.x;
                                    precise float sumValue321 = sumValue320 - vectorValue17.y;
                                    uint bitwiseValue201 = (objectInstances_2.packedValues[(scalarValue134 * 38u) + 25u] >> 2u) + (scalarValue132 >> 1u);
                                    uint productValue361 = uint(objectInstances.packedValues[(scalarValue134 * 76u) + 54u]) + 0u;
                                    bool comparisonValue68 = (scalarValue132 & 1u) == 0u;
                                    uint comparisonValue69 = comparisonValue68 ? faceUvBuffersRW[nonuniformEXT(productValue361)].packedValues[bitwiseValue201].z : faceUvBuffersRW[nonuniformEXT(productValue361)].packedValues[bitwiseValue201].x;
                                    uint comparisonValue70 = comparisonValue68 ? faceUvBuffersRW[nonuniformEXT(productValue361)].packedValues[bitwiseValue201].y : faceUvBuffersRW[nonuniformEXT(productValue361)].packedValues[bitwiseValue201].w;
                                    uint comparisonValue72 = comparisonValue68 ? faceUvBuffersRW[nonuniformEXT(productValue361)].packedValues[bitwiseValue201].x : faceUvBuffersRW[nonuniformEXT(productValue361)].packedValues[bitwiseValue201].z;
                                    bool conditionValue20 = int16_t(objectInstances.packedValues[productValue360]) < int16_t(0us);
                                    float intermediateValue377;
                                    float intermediateValue378;
                                    if (conditionValue20)
                                    {
                                        uint bitwiseValue202 = comparisonValue72 >> 15u;
                                        precise float bitwiseValue203 = float(bitwiseValue202 & 1u) * 2.0;
                                        precise float sumValue322 = bitwiseValue203 + (-1.0);
                                        precise float bitwiseValue204 = float(comparisonValue72 >> 31u) * 2.0;
                                        precise float sumValue323 = bitwiseValue204 + (-1.0);
                                        precise float bitwiseValue205 = float((comparisonValue72 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue206 = float(bitwiseValue202 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue362 = sumValue322 * 3.0517578125e-05;
                                        precise float productValue363 = sumValue323 * 3.0517578125e-05;
                                        precise float sumValue324 = bitwiseValue205 + productValue362;
                                        precise float sumValue325 = bitwiseValue206 + productValue363;
                                        intermediateValue377 = sumValue324;
                                        intermediateValue378 = sumValue325;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue207 = float(comparisonValue72 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue208 = float(comparisonValue72 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue364 = bitwiseValue207 * 16384.0;
                                        precise float sumValue326 = productValue364 + 0.5;
                                        precise float productValue365 = bitwiseValue208 * 16384.0;
                                        precise float sumValue327 = productValue365 + 0.5;
                                        precise float productValue366 = floor(sumValue326) * 6.103515625e-05;
                                        precise float productValue367 = floor(sumValue327) * 6.103515625e-05;
                                        intermediateValue377 = productValue366;
                                        intermediateValue378 = productValue367;
                                    }
                                    precise float productValue368 = sumValue321 * intermediateValue377;
                                    precise float productValue369 = sumValue321 * intermediateValue378;
                                    precise float sumValue328 = productValue368 + 0.0;
                                    precise float sumValue329 = productValue369 + 0.0;
                                    float intermediateValue386;
                                    float intermediateValue387;
                                    if (conditionValue20)
                                    {
                                        uint bitwiseValue209 = comparisonValue70 >> 15u;
                                        precise float bitwiseValue210 = float(bitwiseValue209 & 1u) * 2.0;
                                        precise float sumValue330 = bitwiseValue210 + (-1.0);
                                        precise float bitwiseValue211 = float(comparisonValue70 >> 31u) * 2.0;
                                        precise float sumValue331 = bitwiseValue211 + (-1.0);
                                        precise float bitwiseValue212 = float((comparisonValue70 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue213 = float(bitwiseValue209 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue370 = sumValue330 * 3.0517578125e-05;
                                        precise float productValue371 = sumValue331 * 3.0517578125e-05;
                                        precise float sumValue332 = bitwiseValue212 + productValue370;
                                        precise float sumValue333 = bitwiseValue213 + productValue371;
                                        intermediateValue386 = sumValue332;
                                        intermediateValue387 = sumValue333;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue214 = float(comparisonValue70 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue215 = float(comparisonValue70 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue372 = bitwiseValue214 * 16384.0;
                                        precise float sumValue334 = productValue372 + 0.5;
                                        precise float productValue373 = bitwiseValue215 * 16384.0;
                                        precise float sumValue335 = productValue373 + 0.5;
                                        precise float productValue374 = floor(sumValue334) * 6.103515625e-05;
                                        precise float productValue375 = floor(sumValue335) * 6.103515625e-05;
                                        intermediateValue386 = productValue374;
                                        intermediateValue387 = productValue375;
                                    }
                                    precise float productValue376 = vectorValue16.x * intermediateValue386;
                                    precise float productValue377 = vectorValue16.x * intermediateValue387;
                                    precise float sumValue336 = sumValue328 + productValue376;
                                    precise float sumValue337 = sumValue329 + productValue377;
                                    float intermediateValue392;
                                    float intermediateValue393;
                                    if (conditionValue20)
                                    {
                                        uint bitwiseValue216 = comparisonValue69 >> 15u;
                                        precise float bitwiseValue217 = float(bitwiseValue216 & 1u) * 2.0;
                                        precise float sumValue338 = bitwiseValue217 + (-1.0);
                                        precise float bitwiseValue218 = float(comparisonValue69 >> 31u) * 2.0;
                                        precise float sumValue339 = bitwiseValue218 + (-1.0);
                                        precise float bitwiseValue219 = float((comparisonValue69 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue220 = float(bitwiseValue216 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue378 = sumValue338 * 3.0517578125e-05;
                                        precise float productValue379 = sumValue339 * 3.0517578125e-05;
                                        precise float sumValue340 = bitwiseValue219 + productValue378;
                                        precise float sumValue341 = bitwiseValue220 + productValue379;
                                        intermediateValue392 = sumValue340;
                                        intermediateValue393 = sumValue341;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue221 = float(comparisonValue69 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue222 = float(comparisonValue69 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue380 = bitwiseValue221 * 16384.0;
                                        precise float sumValue342 = productValue380 + 0.5;
                                        precise float productValue381 = bitwiseValue222 * 16384.0;
                                        precise float sumValue343 = productValue381 + 0.5;
                                        precise float productValue382 = floor(sumValue342) * 6.103515625e-05;
                                        precise float productValue383 = floor(sumValue343) * 6.103515625e-05;
                                        intermediateValue392 = productValue382;
                                        intermediateValue393 = productValue383;
                                    }
                                    precise float productValue384 = vectorValue17.y * intermediateValue392;
                                    precise float productValue385 = vectorValue17.y * intermediateValue393;
                                    precise float sumValue344 = sumValue336 + productValue384;
                                    precise float sumValue345 = sumValue337 + productValue385;
                                    float intermediateValue398;
                                    float intermediateValue399;
                                    float intermediateValue400;
                                    float intermediateValue401;
                                    if (objectInstances.packedValues[productValue359] == 65535us)
                                    {
                                        intermediateValue398 = 1.0;
                                        intermediateValue399 = 1.0;
                                        intermediateValue400 = 1.0;
                                        intermediateValue401 = 1.0;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits35;
                                        if (objectInstances.packedValues[productValue359] > 4095us)
                                        {
                                            reinterpretedBits35 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits35 = uint(objectInstances.packedValues[productValue359]);
                                        }
                                        vec4 sampledTextureValue17 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits35 + 0u], defaultSampler)), vec2(sumValue344, sumValue345), spvNMin(fma(scalarValue131, 0.083333335816860198974609375, -0.25), 2.0));
                                        intermediateValue398 = sampledTextureValue17.x;
                                        intermediateValue399 = sampledTextureValue17.y;
                                        intermediateValue400 = sampledTextureValue17.z;
                                        intermediateValue401 = sampledTextureValue17.w;
                                    }
                                    float intermediateValue411;
                                    float intermediateValue412;
                                    float intermediateValue413;
                                    if (scalarValue133 == 2u)
                                    {
                                        float branchMergedValue43;
                                        float branchMergedValue74;
                                        float branchMergedValue75;
                                        if ((objectInstances.packedValues[productValue360] & 128us) == 0us)
                                        {
                                            float intermediateValue416;
                                            if ((objectInstances.packedValues[productValue360] & 2048us) == 0us)
                                            {
                                                intermediateValue416 = intermediateValue401;
                                            }
                                            else
                                            {
                                                intermediateValue416 = spvNClamp(fma(intermediateValue401, 2.0, -1.0), 0.0, 1.0);
                                            }
                                            branchMergedValue43 = intermediateValue398 - (intermediateValue416 * intermediateValue398);
                                            branchMergedValue74 = intermediateValue400 - (intermediateValue416 * intermediateValue400);
                                            branchMergedValue75 = intermediateValue399 - (intermediateValue416 * intermediateValue399);
                                        }
                                        else
                                        {
                                            branchMergedValue43 = 0.33399999141693115234375;
                                            branchMergedValue74 = 0.33399999141693115234375;
                                            branchMergedValue75 = 0.33399999141693115234375;
                                        }
                                        intermediateValue411 = branchMergedValue43;
                                        intermediateValue412 = branchMergedValue75;
                                        intermediateValue413 = branchMergedValue74;
                                    }
                                    else
                                    {
                                        float sumValue346 = 1.0 - intermediateValue401;
                                        intermediateValue411 = sumValue346;
                                        intermediateValue412 = sumValue346;
                                        intermediateValue413 = sumValue346;
                                    }
                                    float productValue386 = intermediateValue411 * scalarValue127;
                                    float productValue387 = intermediateValue412 * scalarValue128;
                                    float productValue388 = intermediateValue413 * scalarValue129;
                                    float intermediateValue353;
                                    float intermediateValue354;
                                    float intermediateValue355;
                                    bool intermediateValue417;
                                    if (!(dot(vec3(productValue386, productValue387, productValue388), vec3(1.0)) <= 0.00999999977648258209228515625))
                                    {
                                        intermediateValue417 = false;
                                        intermediateValue353 = productValue386;
                                        intermediateValue354 = productValue387;
                                        intermediateValue355 = productValue388;
                                    }
                                    else
                                    {
                                        intermediateValue417 = true;
                                        intermediateValue353 = 0.0;
                                        intermediateValue354 = 0.0;
                                        intermediateValue355 = 0.0;
                                    }
                                    float branchMergedValue83;
                                    float branchMergedValue96;
                                    float branchMergedValue97;
                                    if (intermediateValue417)
                                    {
                                        rayQueryConfirmIntersectionEXT(intermediateValue290);
                                        branchMergedValue83 = intermediateValue354;
                                        branchMergedValue96 = intermediateValue353;
                                        branchMergedValue97 = intermediateValue355;
                                    }
                                    else
                                    {
                                        branchMergedValue83 = intermediateValue354;
                                        branchMergedValue96 = intermediateValue353;
                                        branchMergedValue97 = intermediateValue355;
                                    }
                                    branchMergedValue2 = branchMergedValue83;
                                    branchMergedValue15 = branchMergedValue96;
                                    branchMergedValue16 = branchMergedValue97;
                                }
                                else
                                {
                                    branchMergedValue2 = scalarValue128;
                                    branchMergedValue15 = scalarValue127;
                                    branchMergedValue16 = scalarValue129;
                                }
                                intermediateValue305 = branchMergedValue2;
                                intermediateValue303 = branchMergedValue15;
                                intermediateValue307 = branchMergedValue16;
                                bool conditionValue21 = rayQueryProceedEXT(intermediateValue290);
                                if (conditionValue21)
                                {
                                    scalarValue127 = intermediateValue303;
                                    scalarValue128 = intermediateValue305;
                                    scalarValue129 = intermediateValue307;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            intermediateValue302 = intermediateValue303;
                            intermediateValue304 = intermediateValue305;
                            intermediateValue306 = intermediateValue307;
                        }
                        else
                        {
                            intermediateValue302 = 1.0;
                            intermediateValue304 = 1.0;
                            intermediateValue306 = 1.0;
                        }
                        uint scalarValue135 = rayQueryGetIntersectionTypeEXT(intermediateValue290, bool(1u));
                        bool comparisonValue73 = scalarValue135 == 1u;
                        branchMergedValue39 = comparisonValue73 ? 0.0 : intermediateValue302;
                        branchMergedValue65 = comparisonValue73 ? 0.0 : intermediateValue304;
                        branchMergedValue66 = comparisonValue73 ? 0.0 : intermediateValue306;
                    }
                    intermediateValue259 = branchMergedValue39;
                    intermediateValue260 = branchMergedValue65;
                    intermediateValue261 = branchMergedValue66;
                }
                float branchMergedValue117;
                float branchMergedValue121;
                float branchMergedValue122;
                float branchMergedValue123;
                float branchMergedValue124;
                float branchMergedValue125;
                float branchMergedValue126;
                if (dot(vec3(intermediateValue259, intermediateValue260, intermediateValue261), vec3(1.0)) > 0.0)
                {
                    float sumValue347 = (-0.0) - intermediateValue64;
                    float sumValue348 = (-0.0) - intermediateValue66;
                    float sumValue349 = (-0.0) - intermediateValue68;
                    float scalarValue136 = spvNMax(intermediateValue216, 0.00999999977648258209228515625);
                    float sumValue350 = ViewCB.packedValues[52u].x - intermediateValue64;
                    float sumValue351 = ViewCB.packedValues[52u].y - intermediateValue66;
                    float sumValue352 = ViewCB.packedValues[52u].z - intermediateValue68;
                    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue350, sumValue351, sumValue352), vec3(sumValue350, sumValue351, sumValue352)));
                    float productValue389 = inverseLengthValue2 * sumValue350;
                    float productValue390 = inverseLengthValue2 * sumValue351;
                    float productValue391 = inverseLengthValue2 * sumValue352;
                    float dotProductValue3 = spvNClamp(dot(vec3(intermediateValue37, intermediateValue39, intermediateValue41), vec3(ViewCB.packedValues[52u].xyz)), 0.0, 1.0);
                    float dotProductValue4 = spvNClamp(dot(vec3(intermediateValue37, intermediateValue39, intermediateValue41), vec3(sumValue347, sumValue348, sumValue349)), 0.0, 1.0);
                    float dotProductValue5 = spvNClamp(dot(vec3(intermediateValue37, intermediateValue39, intermediateValue41), vec3(productValue389, productValue390, productValue391)), 0.0, 1.0);
                    float dotProductValue6 = spvNClamp(dot(vec3(sumValue347, sumValue348, sumValue349), vec3(productValue389, productValue390, productValue391)), 0.0, 1.0);
                    float productValue392 = scalarValue136 * scalarValue136;
                    float productValue393 = productValue392 * productValue392;
                    float productValue394 = (((dotProductValue5 * productValue393) - dotProductValue5) * dotProductValue5) + 1.0;
                    float productValue395 = productValue392 * 0.5;
                    float sumValue353 = 1.0 - productValue395;
                    float dotProductValue7 = spvNClamp(dot(vec3(intermediateValue220, intermediateValue221, intermediateValue222), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
                    float exponentialValue7 = exp2(log2(spvNClamp(1.0 - dotProductValue6, 0.0, 1.0)) * 5.0);
                    float productValue396 = (exponentialValue7 * (dotProductValue7 - intermediateValue220)) + intermediateValue220;
                    float productValue397 = (exponentialValue7 * (dotProductValue7 - intermediateValue221)) + intermediateValue221;
                    float productValue398 = (exponentialValue7 * (dotProductValue7 - intermediateValue222)) + intermediateValue222;
                    float productValue399 = ((dotProductValue6 * dotProductValue6) * (scalarValue136 * 2.0)) + (-0.5);
                    float exponentialValue8 = (((exp2(log2(spvNClamp(1.0 - dotProductValue4, 0.0, 1.0)) * 5.0) * productValue399) + 1.0) * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - dotProductValue3, 0.0, 1.0)) * 5.0) * productValue399) + 1.0);
                    float quotientValue2 = ((productValue393 / ((productValue394 * productValue394) + 1.0000000133514319600180897396058e-10)) * 0.3183098733425140380859375) * (0.25 / ((((dotProductValue4 * sumValue353) + productValue395) * ((dotProductValue3 * sumValue353) + productValue395)) + 1.0000000133514319600180897396058e-10));
                    branchMergedValue117 = (((ViewCB.packedValues[50u].x * intermediateValue259) * dotProductValue3) * ((((1.0 - productValue396) * intermediateValue223) * exponentialValue8) + (productValue396 * quotientValue2))) + productValue239;
                    branchMergedValue121 = (((ViewCB.packedValues[50u].z * intermediateValue261) * dotProductValue3) * ((((1.0 - productValue398) * intermediateValue225) * exponentialValue8) + (productValue398 * quotientValue2))) + productValue241;
                    branchMergedValue122 = 1.0;
                    branchMergedValue123 = 0.0;
                    branchMergedValue124 = 0.0;
                    branchMergedValue125 = 0.0;
                    branchMergedValue126 = (((ViewCB.packedValues[50u].y * intermediateValue260) * dotProductValue3) * ((((1.0 - productValue397) * intermediateValue224) * exponentialValue8) + (productValue397 * quotientValue2))) + productValue240;
                }
                else
                {
                    branchMergedValue117 = productValue239;
                    branchMergedValue121 = productValue241;
                    branchMergedValue122 = 1.0;
                    branchMergedValue123 = 0.0;
                    branchMergedValue124 = 0.0;
                    branchMergedValue125 = 0.0;
                    branchMergedValue126 = productValue240;
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
                branchMergedValue36 = 0.0;
                branchMergedValue48 = 0.0;
                branchMergedValue49 = 0.0;
                branchMergedValue50 = intermediateValue190;
                branchMergedValue51 = intermediateValue192;
                branchMergedValue52 = intermediateValue194;
                branchMergedValue53 = 0.0;
            }
            intermediateValue185 = branchMergedValue36;
            intermediateValue186 = branchMergedValue53;
            intermediateValue187 = branchMergedValue48;
            intermediateValue188 = branchMergedValue49;
            intermediateValue189 = branchMergedValue50;
            intermediateValue191 = branchMergedValue51;
            intermediateValue193 = branchMergedValue52;
        }
        else
        {
            intermediateValue185 = 0.0;
            intermediateValue186 = 0.0;
            intermediateValue187 = 0.0;
            intermediateValue188 = 0.0;
            intermediateValue189 = 0.0;
            intermediateValue191 = 0.0;
            intermediateValue193 = 0.0;
        }
        float multiplyAddValue;
        if (comparisonValue10 > 0.0)
        {
            multiplyAddValue = (1.0 - spvNClamp(fma(comparisonValue10, ViewCB.packedValues[51u].x, ViewCB.packedValues[51u].y), 0.0, 1.0)) * intermediateValue188;
        }
        else
        {
            multiplyAddValue = intermediateValue188;
        }
        uvec4 reinterpretedBits20 = floatBitsToUint(ViewCB.packedValues[76u]);
        uint scalarValue137 = reinterpretedBits20.w;
        float intermediateValue208;
        float intermediateValue209;
        float intermediateValue210;
        if (scalarValue137 == 1u)
        {
            intermediateValue208 = ViewCB.packedValues[58u].x;
            intermediateValue209 = ViewCB.packedValues[58u].y;
            intermediateValue210 = ViewCB.packedValues[58u].z;
        }
        else
        {
            float branchMergedValue37;
            float branchMergedValue54;
            float branchMergedValue55;
            if (scalarValue137 == 2u)
            {
                uvec4 vectorValue18 = floatBitsToUint(ViewCB.packedValues[74u]);
                uint scalarValue138 = vectorValue18.z;
                uint reinterpretedBits22;
                if (scalarValue138 > 4095u)
                {
                    reinterpretedBits22 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                }
                else
                {
                    reinterpretedBits22 = scalarValue138;
                }
                float scalarValue139 = abs(intermediateValue64);
                float scalarValue140 = abs(intermediateValue66);
                float scalarValue141 = abs(intermediateValue68);
                float intermediateValue264;
                float comparisonValue51;
                float sumValue193;
                if ((scalarValue139 >= scalarValue140) && (scalarValue139 >= scalarValue141))
                {
                    intermediateValue264 = scalarValue139;
                    comparisonValue51 = (intermediateValue64 < 0.0) ? ((-0.0) - intermediateValue68) : intermediateValue68;
                    sumValue193 = (-0.0) - intermediateValue66;
                }
                else
                {
                    float sumValue354 = (-0.0) - intermediateValue64;
                    float branchMergedValue40;
                    float branchMergedValue67;
                    float branchMergedValue68;
                    if (!(scalarValue140 >= scalarValue141))
                    {
                        branchMergedValue40 = scalarValue141;
                        branchMergedValue67 = (intermediateValue68 < 0.0) ? intermediateValue64 : sumValue354;
                        branchMergedValue68 = (-0.0) - intermediateValue66;
                    }
                    else
                    {
                        branchMergedValue40 = scalarValue140;
                        branchMergedValue67 = sumValue354;
                        branchMergedValue68 = (intermediateValue66 < 0.0) ? ((-0.0) - intermediateValue68) : intermediateValue68;
                    }
                    intermediateValue264 = branchMergedValue40;
                    comparisonValue51 = branchMergedValue67;
                    sumValue193 = branchMergedValue68;
                }
                precise float quotientValue3 = 0.5 / intermediateValue264;
                vec4 sampledTextureValue18 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits22 + 0u], linearSampler)), vec2(fract(fma(comparisonValue51, quotientValue3, 0.5) * ViewCB.packedValues[74u].x), fract(fma(sumValue193, quotientValue3, 0.5) * ViewCB.packedValues[74u].y)), 0.0);
                branchMergedValue37 = (ViewCB.packedValues[58u].z * sampledTextureValue18.z) * ViewCB.packedValues[97u].w;
                branchMergedValue54 = (ViewCB.packedValues[58u].x * sampledTextureValue18.x) * ViewCB.packedValues[97u].w;
                branchMergedValue55 = (ViewCB.packedValues[58u].y * sampledTextureValue18.y) * ViewCB.packedValues[97u].w;
            }
            else
            {
                float branchMergedValue118;
                float branchMergedValue127;
                float branchMergedValue128;
                if (scalarValue137 == 4u)
                {
                    float scalarValue142 = (dot(vec3(intermediateValue64, intermediateValue66, intermediateValue68), vec3(ViewCB.packedValues[52u].xyz)) * 0.5) + 0.5;
                    branchMergedValue118 = ((ViewCB.packedValues[75u].z - ViewCB.packedValues[76u].z) * scalarValue142) + ViewCB.packedValues[76u].z;
                    branchMergedValue127 = ((ViewCB.packedValues[75u].x - ViewCB.packedValues[76u].x) * scalarValue142) + ViewCB.packedValues[76u].x;
                    branchMergedValue128 = ((ViewCB.packedValues[75u].y - ViewCB.packedValues[76u].y) * scalarValue142) + ViewCB.packedValues[76u].y;
                }
                else
                {
                    float comparisonValue47;
                    if (abs(intermediateValue66) < 1.0)
                    {
                        float quotientValue4 = atan(intermediateValue68 / intermediateValue64);
                        bool conditionValue22 = intermediateValue64 < 0.0;
                        bool comparisonValue74 = intermediateValue64 == 0.0;
                        bool comparisonValue75 = intermediateValue68 >= 0.0;
                        bool conditionValue23 = intermediateValue68 < 0.0;
                        comparisonValue47 = (comparisonValue74 && comparisonValue75) ? 1.57079637050628662109375 : ((comparisonValue74 && conditionValue23) ? (-1.57079637050628662109375) : ((conditionValue22 && conditionValue23) ? (quotientValue4 + (-3.1415927410125732421875)) : ((conditionValue22 && comparisonValue75) ? (quotientValue4 + 3.1415927410125732421875) : quotientValue4)));
                    }
                    else
                    {
                        comparisonValue47 = 0.0;
                    }
                    float multiplyAddValue1 = fma(abs((fract((comparisonValue47 - ViewCB.packedValues[50u].w) * 0.15915493667125701904296875) * 2.0) + (-1.0)), 0.984375, 0.0078125);
                    float multiplyAddValue2 = fma(0.5 - (asin(intermediateValue66) * 0.3183098733425140380859375), 0.96875, 0.015625);
                    float productValue400 = ViewCB.packedValues[51u].w * 7.0;
                    float scalarValue143 = fract(productValue400);
                    uint scalarValue144 = uint(int(floor(productValue400)));
                    float productValue401 = float(int(scalarValue144 + 1u)) * 0.125;
                    float scalarValue145 = fract(abs(productValue401));
                    vec4 sampledTextureValue19 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue1, multiplyAddValue2, float(int(scalarValue144))), 0.0);
                    float scalarValue146 = sampledTextureValue19.x;
                    float scalarValue147 = sampledTextureValue19.y;
                    float scalarValue148 = sampledTextureValue19.z;
                    float productValue402 = scalarValue146 * scalarValue146;
                    float productValue403 = scalarValue147 * scalarValue147;
                    float productValue404 = scalarValue148 * scalarValue148;
                    vec4 sampledTextureValue20 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue1, multiplyAddValue2, float(int(uint(int(((productValue401 >= ((-0.0) - productValue401)) ? scalarValue145 : ((-0.0) - scalarValue145)) * 8.0))))), 0.0);
                    float scalarValue149 = sampledTextureValue20.x;
                    float scalarValue150 = sampledTextureValue20.y;
                    float scalarValue151 = sampledTextureValue20.z;
                    float dotProductValue8 = exp2(log2(spvNMax(dot(vec3(intermediateValue64, intermediateValue66, intermediateValue68), vec3(ViewCB.packedValues[52u].xyz)), 0.0)) * 7.0);
                    float productValue405 = dotProductValue8 * 0.0500000007450580596923828125;
                    float productValue406 = ((((scalarValue149 * scalarValue149) - productValue402) * scalarValue143) + productValue402) + (productValue405 * ViewCB.packedValues[50u].x);
                    float productValue407 = ((((scalarValue150 * scalarValue150) - productValue403) * scalarValue143) + productValue403) + (productValue405 * ViewCB.packedValues[50u].y);
                    float productValue408 = ((((scalarValue151 * scalarValue151) - productValue404) * scalarValue143) + productValue404) + (productValue405 * ViewCB.packedValues[50u].z);
                    float productValue409 = (dotProductValue8 * 0.64999997615814208984375) + 0.3499999940395355224609375;
                    branchMergedValue118 = ((((ViewCB.packedValues[58u].z * productValue409) - productValue408) * ViewCB.packedValues[58u].w) + productValue408) * ViewCB.packedValues[97u].w;
                    branchMergedValue127 = ((((ViewCB.packedValues[58u].x * productValue409) - productValue406) * ViewCB.packedValues[58u].w) + productValue406) * ViewCB.packedValues[97u].w;
                    branchMergedValue128 = ((((ViewCB.packedValues[58u].y * productValue409) - productValue407) * ViewCB.packedValues[58u].w) + productValue407) * ViewCB.packedValues[97u].w;
                }
                branchMergedValue37 = branchMergedValue118;
                branchMergedValue54 = branchMergedValue127;
                branchMergedValue55 = branchMergedValue128;
            }
            intermediateValue208 = branchMergedValue54;
            intermediateValue209 = branchMergedValue55;
            intermediateValue210 = branchMergedValue37;
        }
        vec4 loadedBufferValue = imageLoad(outputBufferEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)));
        float scalarValue152 = loadedBufferValue.w;
        float productValue410 = loadedBufferValue.x + spvNMax(0.0, ((intermediateValue208 + intermediateValue189) + ((intermediateValue185 - intermediateValue208) * multiplyAddValue)) * productValue8);
        float productValue411 = loadedBufferValue.y + spvNMax(0.0, ((intermediateValue209 + intermediateValue191) + ((intermediateValue186 - intermediateValue209) * multiplyAddValue)) * productValue9);
        float productValue412 = loadedBufferValue.z + spvNMax(0.0, ((intermediateValue210 + intermediateValue193) + ((intermediateValue187 - intermediateValue210) * multiplyAddValue)) * productValue10);
        uint reinterpretedBits21 = floatBitsToUint(productValue410) & 2147483647u;
        uint reinterpretedBits23 = floatBitsToUint(productValue411) & 2147483647u;
        uint reinterpretedBits24 = floatBitsToUint(productValue412) & 2147483647u;
        uint reinterpretedBits25 = floatBitsToUint(scalarValue152) & 2147483647u;
        if (((reinterpretedBits25 > 2139095040u) || ((reinterpretedBits24 > 2139095040u) || ((reinterpretedBits21 > 2139095040u) || (reinterpretedBits23 > 2139095040u)))) || ((reinterpretedBits25 == 2139095040u) || ((reinterpretedBits24 == 2139095040u) || ((reinterpretedBits21 == 2139095040u) || (reinterpretedBits23 == 2139095040u)))))
        {
            break;
        }
        imageStore(outputBufferEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(productValue410, productValue411, productValue412, scalarValue152));
        break;
    }
}
