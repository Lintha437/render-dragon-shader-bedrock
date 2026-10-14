#version 460
#extension GL_GOOGLE_include_directive : require
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
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_samplerless_texture_functions : require
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
    uvec4 reinterpretedBits1 = floatBitsToUint(ViewCB.packedValues[91u]);
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
        precise float productValue = ViewCB.packedValues[78u].x * 0.5;
        uint scalarValue2 = uint(productValue);
        bool comparisonValue1 = bitwiseValue2 >= scalarValue2;
        uint scalarValue3 = uint(comparisonValue1);
        uint reinterpretedBits2 = (((scalarValue1 == 0u) ? floatBitsToUint(ViewCB.packedValues[84u]).z : 0u) + bitwiseValue3) & 1u;
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
    precise float sumValue = float(intermediateValue9) + 0.5;
    precise float sumValue1 = float(bitwiseValue3) + 0.5;
    precise float productValue1 = sumValue * ViewCB.packedValues[78u].z;
    precise float productValue2 = sumValue1 * ViewCB.packedValues[78u].w;
    precise float productValue3 = productValue1 * 2.0;
    precise float productValue4 = productValue2 * 2.0;
    precise float sumValue2 = productValue3 + (-1.0);
    precise float sumValue3 = 1.0 - productValue4;
    precise float productValue5 = ViewCB.packedValues[78u].z * ViewCB.packedValues[81u].z;
    precise float productValue6 = ViewCB.packedValues[78u].w * ViewCB.packedValues[81u].w;
    precise float productValue7 = productValue5 * 2.0;
    precise float productValue8 = productValue6 * 2.0;
    precise float sumValue4 = sumValue2 + productValue7;
    precise float sumValue5 = sumValue3 - productValue8;
    precise float productValue9 = ViewCB.packedValues[20u].x * sumValue4;
    precise float productValue10 = sumValue5 * ViewCB.packedValues[21u].x;
    precise float sumValue6 = productValue10 + productValue9;
    precise float productValue11 = 0.5 * ViewCB.packedValues[22u].x;
    precise float sumValue7 = productValue11 + sumValue6;
    precise float productValue12 = 1.0 * ViewCB.packedValues[23u].x;
    precise float sumValue8 = productValue12 + sumValue7;
    precise float productValue13 = ViewCB.packedValues[20u].y * sumValue4;
    precise float productValue14 = sumValue5 * ViewCB.packedValues[21u].y;
    precise float sumValue9 = productValue14 + productValue13;
    precise float productValue15 = 0.5 * ViewCB.packedValues[22u].y;
    precise float sumValue10 = productValue15 + sumValue9;
    precise float productValue16 = 1.0 * ViewCB.packedValues[23u].y;
    precise float sumValue11 = productValue16 + sumValue10;
    precise float productValue17 = ViewCB.packedValues[20u].z * sumValue4;
    precise float productValue18 = sumValue5 * ViewCB.packedValues[21u].z;
    precise float sumValue12 = productValue18 + productValue17;
    precise float productValue19 = 0.5 * ViewCB.packedValues[22u].z;
    precise float sumValue13 = productValue19 + sumValue12;
    precise float productValue20 = 1.0 * ViewCB.packedValues[23u].z;
    precise float sumValue14 = productValue20 + sumValue13;
    precise float productValue21 = ViewCB.packedValues[20u].w * sumValue4;
    precise float productValue22 = sumValue5 * ViewCB.packedValues[21u].w;
    precise float sumValue15 = productValue22 + productValue21;
    precise float productValue23 = 0.5 * ViewCB.packedValues[22u].w;
    precise float sumValue16 = productValue23 + sumValue15;
    precise float productValue24 = 1.0 * ViewCB.packedValues[23u].w;
    precise float sumValue17 = productValue24 + sumValue16;
    precise float quotientValue = sumValue8 / sumValue17;
    precise float quotientValue1 = sumValue11 / sumValue17;
    precise float quotientValue2 = sumValue14 / sumValue17;
    precise float sumValue18 = quotientValue - ViewCB.packedValues[72u].x;
    precise float sumValue19 = quotientValue1 - ViewCB.packedValues[72u].y;
    precise float sumValue20 = quotientValue2 - ViewCB.packedValues[72u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(sumValue18, sumValue19, sumValue20), vec3(sumValue18, sumValue19, sumValue20)));
    precise float productValue25 = sumValue18 * inverseLengthValue;
    precise float productValue26 = sumValue19 * inverseLengthValue;
    precise float productValue27 = sumValue20 * inverseLengthValue;
    bool reinterpretedBits3 = floatBitsToUint(ViewCB.packedValues[54u]).w != 0u;
    uint comparisonValue3 = reinterpretedBits3 ? 0u : 2u;
    float16_t comparisonValue4 = reinterpretedBits3 ? float16_t(1.330078125) : float16_t(1.0);
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
    float16_t intermediateValue55;
    float16_t intermediateValue57;
    float16_t intermediateValue59;
    float16_t intermediateValue61;
    float16_t intermediateValue63;
    float16_t intermediateValue65;
    uint intermediateValue67;
    float16_t intermediateValue69;
    uint intermediateValue71;
    uint intermediateValue73;
    float intermediateValue360;
    float intermediateValue361;
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
        intermediateValue42 = ViewCB.packedValues[72u].x;
        intermediateValue44 = ViewCB.packedValues[72u].y;
        intermediateValue46 = ViewCB.packedValues[72u].z;
        intermediateValue48 = 0u;
        intermediateValue50 = 0.0;
        intermediateValue52 = 0u;
        intermediateValue53 = 65504.0;
        intermediateValue54 = 0.0;
        intermediateValue55 = float16_t(1.0);
        intermediateValue57 = float16_t(1.0);
        intermediateValue59 = float16_t(1.0);
        intermediateValue61 = float16_t(1.0);
        intermediateValue63 = float16_t(1.0);
        intermediateValue65 = float16_t(1.0);
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
        float16_t intermediateValue56;
        float16_t intermediateValue58;
        float16_t intermediateValue60;
        float16_t intermediateValue62;
        float16_t intermediateValue64;
        float16_t intermediateValue66;
        uint intermediateValue68;
        float16_t intermediateValue70;
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
        float intermediateValue118;
        float intermediateValue120;
        float intermediateValue122;
        float intermediateValue124;
        float intermediateValue125;
        float intermediateValue126;
        float intermediateValue127;
        float intermediateValue128;
        float intermediateValue129;
        float intermediateValue142;
        float intermediateValue144;
        float intermediateValue146;
        float intermediateValue154;
        float intermediateValue155;
        float intermediateValue156;
        float intermediateValue200;
        float intermediateValue202;
        float intermediateValue204;
        float intermediateValue206;
        float intermediateValue208;
        float intermediateValue210;
        bool branchMergedValue107;
        bool branchMergedValue160;
        float branchMergedValue161;
        uint branchMergedValue162;
        uint branchMergedValue163;
        uint branchMergedValue164;
        float16_t branchMergedValue165;
        float16_t branchMergedValue166;
        float16_t branchMergedValue167;
        float16_t branchMergedValue168;
        float16_t branchMergedValue169;
        float16_t branchMergedValue170;
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
            rayQueryInitializeEXT(intermediateValue74, SceneBVH, (comparisonValue6 ? 544u : ((intermediateValue67 == 3u) ? 512u : 528u)) | 512u, comparisonValue9 ? (comparisonValue8 & 63u) : comparisonValue8, vec3(intermediateValue42, intermediateValue44, intermediateValue46), 0.0, vec3(intermediateValue36, intermediateValue38, intermediateValue40), 10000.0);
            intermediateValue75 = rayQueryProceedEXT(intermediateValue74);
            if (intermediateValue75)
            {
                bool intermediateValue93;
                bool comparisonValue10;
                for (;;)
                {
                    uint scalarValue4 = rayQueryGetIntersectionTypeEXT(intermediateValue74, bool(0u));
                    comparisonValue10 = scalarValue4 == 0u;
                    if (comparisonValue10)
                    {
                        vec2 vectorValue = rayQueryGetIntersectionBarycentricsEXT(intermediateValue74, bool(0u));
                        vec2 vectorValue1 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue74, bool(0u));
                        float scalarValue5 = rayQueryGetIntersectionTEXT(intermediateValue74, bool(0u));
                        uint scalarValue6 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue74, bool(0u));
                        uint scalarValue7 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue74, bool(0u));
                        uint scalarValue8 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue74, bool(0u));
                        bool intermediateValue106;
                        if (scalarValue7 == 1u)
                        {
                            uint scalarValue9 = (scalarValue8 * 76u) + 58u;
                            uint productValue28 = (scalarValue8 * 76u) + 61u;
                            precise float sumValue22 = 1.0 - vectorValue.x;
                            precise float sumValue23 = sumValue22 - vectorValue1.y;
                            uint productValue29 = uint(objectInstances.packedValues[(scalarValue8 * 76u) + 54u]);
                            uint bitwiseValue7 = (objectInstances_2.packedValues[(scalarValue8 * 38u) + 25u] >> 2u) + (scalarValue6 >> 1u);
                            uint sumValue24 = productValue29 + 0u;
                            bool comparisonValue11 = (scalarValue6 & 1u) == 0u;
                            uint comparisonValue12 = comparisonValue11 ? faceUvBuffersRW[nonuniformEXT(sumValue24)].packedValues[bitwiseValue7].z : faceUvBuffersRW[nonuniformEXT(sumValue24)].packedValues[bitwiseValue7].x;
                            uint comparisonValue13 = comparisonValue11 ? faceUvBuffersRW[nonuniformEXT(sumValue24)].packedValues[bitwiseValue7].y : faceUvBuffersRW[nonuniformEXT(sumValue24)].packedValues[bitwiseValue7].w;
                            uint comparisonValue14 = comparisonValue11 ? faceUvBuffersRW[nonuniformEXT(sumValue24)].packedValues[bitwiseValue7].x : faceUvBuffersRW[nonuniformEXT(sumValue24)].packedValues[bitwiseValue7].z;
                            bool conditionValue = int16_t(objectInstances.packedValues[productValue28]) < int16_t(0us);
                            float intermediateValue176;
                            float intermediateValue177;
                            if (conditionValue)
                            {
                                uint bitwiseValue8 = comparisonValue14 >> 15u;
                                precise float bitwiseValue9 = float(bitwiseValue8 & 1u) * 2.0;
                                precise float sumValue25 = bitwiseValue9 + (-1.0);
                                precise float bitwiseValue10 = float(comparisonValue14 >> 31u) * 2.0;
                                precise float sumValue26 = bitwiseValue10 + (-1.0);
                                precise float bitwiseValue11 = float((comparisonValue14 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue12 = float(bitwiseValue8 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue30 = sumValue25 * 3.0517578125e-05;
                                precise float productValue31 = sumValue26 * 3.0517578125e-05;
                                precise float sumValue27 = bitwiseValue11 + productValue30;
                                precise float sumValue28 = bitwiseValue12 + productValue31;
                                intermediateValue176 = sumValue27;
                                intermediateValue177 = sumValue28;
                            }
                            else
                            {
                                precise float bitwiseValue13 = float(comparisonValue14 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue14 = float(comparisonValue14 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue32 = bitwiseValue13 * 16384.0;
                                precise float sumValue29 = productValue32 + 0.5;
                                precise float productValue33 = bitwiseValue14 * 16384.0;
                                precise float sumValue30 = productValue33 + 0.5;
                                precise float productValue34 = floor(sumValue29) * 6.103515625e-05;
                                precise float productValue35 = floor(sumValue30) * 6.103515625e-05;
                                intermediateValue176 = productValue34;
                                intermediateValue177 = productValue35;
                            }
                            precise float productValue36 = sumValue23 * intermediateValue176;
                            precise float productValue37 = sumValue23 * intermediateValue177;
                            precise float sumValue31 = productValue36 + 0.0;
                            precise float sumValue32 = productValue37 + 0.0;
                            float intermediateValue194;
                            float intermediateValue195;
                            if (conditionValue)
                            {
                                uint bitwiseValue15 = comparisonValue13 >> 15u;
                                precise float bitwiseValue16 = float(bitwiseValue15 & 1u) * 2.0;
                                precise float sumValue33 = bitwiseValue16 + (-1.0);
                                precise float bitwiseValue17 = float(comparisonValue13 >> 31u) * 2.0;
                                precise float sumValue34 = bitwiseValue17 + (-1.0);
                                precise float bitwiseValue18 = float((comparisonValue13 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue19 = float(bitwiseValue15 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue38 = sumValue33 * 3.0517578125e-05;
                                precise float productValue39 = sumValue34 * 3.0517578125e-05;
                                precise float sumValue35 = bitwiseValue18 + productValue38;
                                precise float sumValue36 = bitwiseValue19 + productValue39;
                                intermediateValue194 = sumValue35;
                                intermediateValue195 = sumValue36;
                            }
                            else
                            {
                                precise float bitwiseValue20 = float(comparisonValue13 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue21 = float(comparisonValue13 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue40 = bitwiseValue20 * 16384.0;
                                precise float sumValue37 = productValue40 + 0.5;
                                precise float productValue41 = bitwiseValue21 * 16384.0;
                                precise float sumValue38 = productValue41 + 0.5;
                                precise float productValue42 = floor(sumValue37) * 6.103515625e-05;
                                precise float productValue43 = floor(sumValue38) * 6.103515625e-05;
                                intermediateValue194 = productValue42;
                                intermediateValue195 = productValue43;
                            }
                            precise float productValue44 = vectorValue.x * intermediateValue194;
                            precise float productValue45 = vectorValue.x * intermediateValue195;
                            precise float sumValue40 = sumValue31 + productValue44;
                            precise float sumValue41 = sumValue32 + productValue45;
                            float intermediateValue249;
                            float intermediateValue250;
                            if (conditionValue)
                            {
                                uint bitwiseValue22 = comparisonValue12 >> 15u;
                                precise float bitwiseValue23 = float(bitwiseValue22 & 1u) * 2.0;
                                precise float sumValue42 = bitwiseValue23 + (-1.0);
                                precise float bitwiseValue24 = float(comparisonValue12 >> 31u) * 2.0;
                                precise float sumValue43 = bitwiseValue24 + (-1.0);
                                precise float bitwiseValue25 = float((comparisonValue12 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue26 = float(bitwiseValue22 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue46 = sumValue42 * 3.0517578125e-05;
                                precise float productValue47 = sumValue43 * 3.0517578125e-05;
                                precise float sumValue44 = bitwiseValue25 + productValue46;
                                precise float sumValue45 = bitwiseValue26 + productValue47;
                                intermediateValue249 = sumValue44;
                                intermediateValue250 = sumValue45;
                            }
                            else
                            {
                                precise float bitwiseValue27 = float(comparisonValue12 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue28 = float(comparisonValue12 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue48 = bitwiseValue27 * 16384.0;
                                precise float sumValue46 = productValue48 + 0.5;
                                precise float productValue49 = bitwiseValue28 * 16384.0;
                                precise float sumValue47 = productValue49 + 0.5;
                                precise float productValue50 = floor(sumValue46) * 6.103515625e-05;
                                precise float productValue51 = floor(sumValue47) * 6.103515625e-05;
                                intermediateValue249 = productValue50;
                                intermediateValue250 = productValue51;
                            }
                            precise float productValue52 = vectorValue1.y * intermediateValue249;
                            precise float productValue53 = vectorValue1.y * intermediateValue250;
                            precise float sumValue48 = sumValue40 + productValue52;
                            precise float sumValue49 = sumValue41 + productValue53;
                            uint sumValue50 = productValue29 + 0u;
                            uint reinterpretedBits18;
                            if (objectInstances.packedValues[scalarValue9] > 4095us)
                            {
                                reinterpretedBits18 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits18 = uint(objectInstances.packedValues[scalarValue9]);
                            }
                            bool branchMergedValue16;
                            if (!(((objectInstances.packedValues[scalarValue9] != 65535us) ? textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits18 + 0u], defaultSampler)), vec2(sumValue48, sumValue49), spvNMin((float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue50)].packedValues[(bitwiseValue7 * 8u) + 6u])) + 1.0) + log2(abs(ViewCB.packedValues[89u].z * scalarValue5)), float(faceDataBuffersRW[nonuniformEXT(sumValue50)].packedValues[(bitwiseValue7 * 8u) + 7u]))).w : 1.0) <= (((objectInstances.packedValues[productValue28] & 4352us) != 0us) ? 0.5 : 0.0)))
                            {
                                branchMergedValue16 = true;
                            }
                            else
                            {
                                branchMergedValue16 = false;
                            }
                            intermediateValue106 = branchMergedValue16;
                        }
                        else
                        {
                            intermediateValue106 = true;
                        }
                        if (intermediateValue106)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue74);
                        }
                    }
                    intermediateValue93 = rayQueryProceedEXT(intermediateValue74);
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
            uint scalarValue10 = rayQueryGetIntersectionTypeEXT(intermediateValue74, bool(1u));
            float intermediateValue84;
            float intermediateValue85;
            float intermediateValue86;
            uint bitwiseValue5;
            if (scalarValue10 == 1u)
            {
                vec2 vectorValue2 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue74, bool(1u));
                vec2 vectorValue3 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue74, bool(1u));
                float scalarValue11 = rayQueryGetIntersectionTEXT(intermediateValue74, bool(1u));
                uint scalarValue12 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue74, bool(1u));
                uint scalarValue13 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue74, bool(1u));
                uint scalarValue14 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue74, bool(1u));
                intermediateValue84 = vectorValue2.x;
                intermediateValue85 = vectorValue3.y;
                intermediateValue86 = scalarValue11;
                bitwiseValue5 = ((scalarValue13 << 30u) | ((scalarValue12 << 14u) & 1073725440u)) | (scalarValue14 & 16383u);
            }
            else
            {
                intermediateValue84 = 0.0;
                intermediateValue85 = 0.0;
                intermediateValue86 = 10000.0;
                bitwiseValue5 = 1073741823u;
            }
            float intermediateValue97;
            float intermediateValue99;
            float intermediateValue101;
            if (intermediateValue67 < 2u)
            {
                bool conditionValue1 = intermediateValue86 < 10000.0;
                rayQueryInitializeEXT(intermediateValue95, SceneBVH, 512u, 32u, vec3(intermediateValue42, intermediateValue44, intermediateValue46), 0.0, vec3(intermediateValue36, intermediateValue38, intermediateValue40), conditionValue1 ? (intermediateValue86 + 0.0500000007450580596923828125) : 10000.0);
                bool conditionValue2 = rayQueryProceedEXT(intermediateValue95);
                if (conditionValue2)
                {
                    bool intermediateValue184;
                    bool comparisonValue20;
                    for (;;)
                    {
                        uint scalarValue15 = rayQueryGetIntersectionTypeEXT(intermediateValue95, bool(0u));
                        comparisonValue20 = scalarValue15 == 0u;
                        if (comparisonValue20)
                        {
                            vec2 vectorValue4 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue95, bool(0u));
                            vec2 vectorValue5 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue95, bool(0u));
                            float scalarValue16 = rayQueryGetIntersectionTEXT(intermediateValue95, bool(0u));
                            uint scalarValue17 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue95, bool(0u));
                            uint scalarValue18 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue95, bool(0u));
                            uint scalarValue19 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue95, bool(0u));
                            bool intermediateValue190;
                            if (scalarValue18 == 1u)
                            {
                                uint scalarValue20 = (scalarValue19 * 76u) + 58u;
                                uint productValue54 = (scalarValue19 * 76u) + 61u;
                                precise float sumValue51 = 1.0 - vectorValue4.x;
                                precise float sumValue52 = sumValue51 - vectorValue5.y;
                                uint productValue55 = uint(objectInstances.packedValues[(scalarValue19 * 76u) + 54u]);
                                uint bitwiseValue29 = (objectInstances_2.packedValues[(scalarValue19 * 38u) + 25u] >> 2u) + (scalarValue17 >> 1u);
                                uint sumValue53 = productValue55 + 0u;
                                bool comparisonValue15 = (scalarValue17 & 1u) == 0u;
                                uint comparisonValue16 = comparisonValue15 ? faceUvBuffersRW[nonuniformEXT(sumValue53)].packedValues[bitwiseValue29].z : faceUvBuffersRW[nonuniformEXT(sumValue53)].packedValues[bitwiseValue29].x;
                                uint comparisonValue17 = comparisonValue15 ? faceUvBuffersRW[nonuniformEXT(sumValue53)].packedValues[bitwiseValue29].y : faceUvBuffersRW[nonuniformEXT(sumValue53)].packedValues[bitwiseValue29].w;
                                uint comparisonValue18 = comparisonValue15 ? faceUvBuffersRW[nonuniformEXT(sumValue53)].packedValues[bitwiseValue29].x : faceUvBuffersRW[nonuniformEXT(sumValue53)].packedValues[bitwiseValue29].z;
                                bool conditionValue3 = int16_t(objectInstances.packedValues[productValue54]) < int16_t(0us);
                                float intermediateValue226;
                                float intermediateValue227;
                                if (conditionValue3)
                                {
                                    uint bitwiseValue30 = comparisonValue18 >> 15u;
                                    precise float bitwiseValue31 = float(bitwiseValue30 & 1u) * 2.0;
                                    precise float sumValue54 = bitwiseValue31 + (-1.0);
                                    precise float bitwiseValue33 = float(comparisonValue18 >> 31u) * 2.0;
                                    precise float sumValue55 = bitwiseValue33 + (-1.0);
                                    precise float bitwiseValue34 = float((comparisonValue18 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue35 = float(bitwiseValue30 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue56 = sumValue54 * 3.0517578125e-05;
                                    precise float productValue57 = sumValue55 * 3.0517578125e-05;
                                    precise float sumValue56 = bitwiseValue34 + productValue56;
                                    precise float sumValue57 = bitwiseValue35 + productValue57;
                                    intermediateValue226 = sumValue56;
                                    intermediateValue227 = sumValue57;
                                }
                                else
                                {
                                    precise float bitwiseValue36 = float(comparisonValue18 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue37 = float(comparisonValue18 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue58 = bitwiseValue36 * 16384.0;
                                    precise float sumValue58 = productValue58 + 0.5;
                                    precise float productValue59 = bitwiseValue37 * 16384.0;
                                    precise float sumValue59 = productValue59 + 0.5;
                                    precise float productValue60 = floor(sumValue58) * 6.103515625e-05;
                                    precise float productValue61 = floor(sumValue59) * 6.103515625e-05;
                                    intermediateValue226 = productValue60;
                                    intermediateValue227 = productValue61;
                                }
                                precise float productValue62 = sumValue52 * intermediateValue226;
                                precise float productValue63 = sumValue52 * intermediateValue227;
                                precise float sumValue60 = productValue62 + 0.0;
                                precise float sumValue61 = productValue63 + 0.0;
                                float intermediateValue255;
                                float intermediateValue256;
                                if (conditionValue3)
                                {
                                    uint bitwiseValue38 = comparisonValue17 >> 15u;
                                    precise float bitwiseValue39 = float(bitwiseValue38 & 1u) * 2.0;
                                    precise float sumValue62 = bitwiseValue39 + (-1.0);
                                    precise float bitwiseValue40 = float(comparisonValue17 >> 31u) * 2.0;
                                    precise float sumValue63 = bitwiseValue40 + (-1.0);
                                    precise float bitwiseValue41 = float((comparisonValue17 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue42 = float(bitwiseValue38 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue64 = sumValue62 * 3.0517578125e-05;
                                    precise float productValue65 = sumValue63 * 3.0517578125e-05;
                                    precise float sumValue64 = bitwiseValue41 + productValue64;
                                    precise float sumValue65 = bitwiseValue42 + productValue65;
                                    intermediateValue255 = sumValue64;
                                    intermediateValue256 = sumValue65;
                                }
                                else
                                {
                                    precise float bitwiseValue43 = float(comparisonValue17 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue44 = float(comparisonValue17 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue66 = bitwiseValue43 * 16384.0;
                                    precise float sumValue66 = productValue66 + 0.5;
                                    precise float productValue67 = bitwiseValue44 * 16384.0;
                                    precise float sumValue67 = productValue67 + 0.5;
                                    precise float productValue68 = floor(sumValue66) * 6.103515625e-05;
                                    precise float productValue69 = floor(sumValue67) * 6.103515625e-05;
                                    intermediateValue255 = productValue68;
                                    intermediateValue256 = productValue69;
                                }
                                precise float productValue70 = vectorValue4.x * intermediateValue255;
                                precise float productValue71 = vectorValue4.x * intermediateValue256;
                                precise float sumValue68 = sumValue60 + productValue70;
                                precise float sumValue70 = sumValue61 + productValue71;
                                float intermediateValue269;
                                float intermediateValue270;
                                if (conditionValue3)
                                {
                                    uint bitwiseValue45 = comparisonValue16 >> 15u;
                                    precise float bitwiseValue46 = float(bitwiseValue45 & 1u) * 2.0;
                                    precise float sumValue71 = bitwiseValue46 + (-1.0);
                                    precise float bitwiseValue47 = float(comparisonValue16 >> 31u) * 2.0;
                                    precise float sumValue72 = bitwiseValue47 + (-1.0);
                                    precise float bitwiseValue48 = float((comparisonValue16 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue49 = float(bitwiseValue45 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue72 = sumValue71 * 3.0517578125e-05;
                                    precise float productValue73 = sumValue72 * 3.0517578125e-05;
                                    precise float sumValue73 = bitwiseValue48 + productValue72;
                                    precise float sumValue74 = bitwiseValue49 + productValue73;
                                    intermediateValue269 = sumValue73;
                                    intermediateValue270 = sumValue74;
                                }
                                else
                                {
                                    precise float bitwiseValue50 = float(comparisonValue16 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue51 = float(comparisonValue16 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue74 = bitwiseValue50 * 16384.0;
                                    precise float sumValue75 = productValue74 + 0.5;
                                    precise float productValue78 = bitwiseValue51 * 16384.0;
                                    precise float sumValue76 = productValue78 + 0.5;
                                    precise float productValue79 = floor(sumValue75) * 6.103515625e-05;
                                    precise float productValue80 = floor(sumValue76) * 6.103515625e-05;
                                    intermediateValue269 = productValue79;
                                    intermediateValue270 = productValue80;
                                }
                                precise float productValue81 = vectorValue5.y * intermediateValue269;
                                precise float productValue82 = vectorValue5.y * intermediateValue270;
                                precise float sumValue77 = sumValue68 + productValue81;
                                precise float sumValue78 = sumValue70 + productValue82;
                                uint sumValue79 = productValue55 + 0u;
                                uint reinterpretedBits22;
                                if (objectInstances.packedValues[scalarValue20] > 4095us)
                                {
                                    reinterpretedBits22 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits22 = uint(objectInstances.packedValues[scalarValue20]);
                                }
                                bool branchMergedValue20;
                                if (!(((objectInstances.packedValues[scalarValue20] != 65535us) ? textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits22 + 0u], defaultSampler)), vec2(sumValue77, sumValue78), spvNMin((float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue79)].packedValues[(bitwiseValue29 * 8u) + 6u])) + 1.0) + log2(abs(ViewCB.packedValues[89u].z * scalarValue16)), float(faceDataBuffersRW[nonuniformEXT(sumValue79)].packedValues[(bitwiseValue29 * 8u) + 7u]))).w : 1.0) <= (((objectInstances.packedValues[productValue54] & 4352us) != 0us) ? 0.5 : 0.0)))
                                {
                                    branchMergedValue20 = true;
                                }
                                else
                                {
                                    branchMergedValue20 = false;
                                }
                                intermediateValue190 = branchMergedValue20;
                            }
                            else
                            {
                                intermediateValue190 = true;
                            }
                            if (intermediateValue190)
                            {
                                rayQueryConfirmIntersectionEXT(intermediateValue95);
                            }
                        }
                        intermediateValue184 = rayQueryProceedEXT(intermediateValue95);
                        if (intermediateValue184)
                        {
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
                uint scalarValue21 = rayQueryGetIntersectionTypeEXT(intermediateValue95, bool(1u));
                float intermediateValue98;
                float intermediateValue100;
                float intermediateValue102;
                uint bitwiseValue6;
                if (scalarValue21 == 1u)
                {
                    vec2 vectorValue6 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue95, bool(1u));
                    vec2 vectorValue7 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue95, bool(1u));
                    float scalarValue22 = rayQueryGetIntersectionTEXT(intermediateValue95, bool(1u));
                    uint scalarValue23 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue95, bool(1u));
                    uint scalarValue24 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue95, bool(1u));
                    uint scalarValue25 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue95, bool(1u));
                    intermediateValue98 = vectorValue6.x;
                    intermediateValue100 = vectorValue7.y;
                    intermediateValue102 = scalarValue22;
                    bitwiseValue6 = ((scalarValue24 << 30u) | ((scalarValue23 << 14u) & 1073725440u)) | (scalarValue25 & 16383u);
                }
                else
                {
                    intermediateValue98 = 0.0;
                    intermediateValue100 = 0.0;
                    intermediateValue102 = 10000.0;
                    bitwiseValue6 = 1073741823u;
                }
                uint branchMergedValue15;
                float branchMergedValue25;
                float branchMergedValue26;
                float branchMergedValue27;
                if (intermediateValue102 < 10000.0)
                {
                    uint branchMergedValue102;
                    float branchMergedValue103;
                    float branchMergedValue104;
                    float branchMergedValue105;
                    if (conditionValue1)
                    {
                        precise float sumValue80 = intermediateValue86 - intermediateValue102;
                        bool comparisonValue19 = abs(sumValue80) <= 0.100000001490116119384765625;
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
            uint productValue83 = (bitwiseValue53 * 76u) + 58u;
            uint productValue84 = (bitwiseValue53 * 76u) + 59u;
            uint productValue85 = (bitwiseValue53 * 76u) + 60u;
            uint productValue86 = (bitwiseValue53 * 76u) + 61u;
            uint productValue87 = (bitwiseValue53 * 38u) + 32u;
            uint productValue88 = (bitwiseValue53 * 38u) + 33u;
            uint productValue89 = (bitwiseValue53 * 76u) + 75u;
            bool comparisonValue21 = (objectInstances.packedValues[productValue86] & 1536us) != 0us;
            uint bitwiseValue32;
            float intermediateValue148;
            float intermediateValue150;
            float intermediateValue152;
            float intermediateValue157;
            float intermediateValue159;
            float intermediateValue161;
            float intermediateValue163;
            float intermediateValue165;
            float intermediateValue167;
            if (intermediateValue101 < 10000.0)
            {
                uint productValue90 = bitwiseValue53 * 38u;
                vec4 reinterpretedBits4 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue90], objectInstances_2.packedValues[productValue90 + 1u], objectInstances_2.packedValues[productValue90 + 2u], objectInstances_2.packedValues[productValue90 + 3u]));
                float scalarValue26 = reinterpretedBits4.x;
                float scalarValue27 = reinterpretedBits4.y;
                float scalarValue28 = reinterpretedBits4.z;
                uint productValue91 = (bitwiseValue53 * 38u) + 4u;
                vec4 reinterpretedBits5 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue91], objectInstances_2.packedValues[productValue91 + 1u], objectInstances_2.packedValues[productValue91 + 2u], objectInstances_2.packedValues[productValue91 + 3u]));
                float scalarValue29 = reinterpretedBits5.x;
                float scalarValue30 = reinterpretedBits5.y;
                float scalarValue31 = reinterpretedBits5.z;
                uint productValue92 = (bitwiseValue53 * 38u) + 8u;
                vec4 reinterpretedBits6 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue92], objectInstances_2.packedValues[productValue92 + 1u], objectInstances_2.packedValues[productValue92 + 2u], objectInstances_2.packedValues[productValue92 + 3u]));
                float scalarValue32 = reinterpretedBits6.x;
                float scalarValue33 = reinterpretedBits6.y;
                float scalarValue34 = reinterpretedBits6.z;
                uint productValue93 = (bitwiseValue53 * 38u) + 12u;
                vec4 reinterpretedBits7 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue93], objectInstances_2.packedValues[productValue93 + 1u], objectInstances_2.packedValues[productValue93 + 2u], objectInstances_2.packedValues[productValue93 + 3u]));
                uint productValue94 = (bitwiseValue53 * 38u) + 16u;
                vec4 reinterpretedBits8 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue94], objectInstances_2.packedValues[productValue94 + 1u], objectInstances_2.packedValues[productValue94 + 2u], objectInstances_2.packedValues[productValue94 + 3u]));
                uint productValue95 = (bitwiseValue53 * 38u) + 20u;
                vec4 reinterpretedBits9 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue95], objectInstances_2.packedValues[productValue95 + 1u], objectInstances_2.packedValues[productValue95 + 2u], objectInstances_2.packedValues[productValue95 + 3u]));
                uint productValue96 = (bitwiseValue53 * 38u) + 24u;
                uint productValue97 = (bitwiseValue53 * 38u) + 25u;
                uint productValue98 = (bitwiseValue53 * 76u) + 72u;
                uint bitwiseValue54 = ((intermediateValue103 >> 13u) & 2u) | ((intermediateValue103 >> 13u) & 131068u);
                uint bitwiseValue55 = bitwiseValue54 | 1u;
                uint bitwiseValue56 = bitwiseValue54 ^ 2u;
                intermediateValue1[0u] = bitwiseValue54;
                intermediateValue1[1u] = bitwiseValue55;
                intermediateValue1[2u] = bitwiseValue56;
                uint productValue99 = uint(objectInstances.packedValues[(bitwiseValue53 * 76u) + 54u]);
                uint sumValue81 = productValue99 + 0u;
                uint bitwiseValue57 = (objectInstances_2.packedValues[productValue97] >> 2u) + ((intermediateValue103 >> 15u) & 32767u);
                uint productValue100 = bitwiseValue57 * 4u;
                uint productValue101 = (bitwiseValue57 * 4u) + 1u;
                uint productValue102 = (bitwiseValue57 * 4u) + 2u;
                precise float bitwiseValue58 = float(faceDataBuffersRW_2[nonuniformEXT(sumValue81)].packedValues[productValue100] & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue82 = bitwiseValue58 + (-1.0);
                precise float bitwiseValue59 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue81)].packedValues[productValue100] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue83 = bitwiseValue59 + (-1.0);
                precise float bitwiseValue60 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue81)].packedValues[productValue100] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue84 = bitwiseValue60 + (-1.0);
                precise float bitwiseValue61 = float(faceDataBuffersRW_2[nonuniformEXT(sumValue81)].packedValues[productValue101] & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue85 = bitwiseValue61 + (-1.0);
                precise float bitwiseValue62 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue81)].packedValues[productValue101] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue86 = bitwiseValue62 + (-1.0);
                precise float bitwiseValue63 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue81)].packedValues[productValue101] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue88 = bitwiseValue63 + (-1.0);
                precise float bitwiseValue64 = float(faceDataBuffersRW_2[nonuniformEXT(sumValue81)].packedValues[productValue102] & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue89 = bitwiseValue64 + (-1.0);
                precise float bitwiseValue65 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue81)].packedValues[productValue102] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue90 = bitwiseValue65 + (-1.0);
                precise float bitwiseValue66 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue81)].packedValues[productValue102] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue91 = bitwiseValue66 + (-1.0);
                precise float sumValue92 = 1.0 - intermediateValue97;
                precise float sumValue93 = sumValue92 - intermediateValue99;
                intermediateValue2[0u] = sumValue93;
                intermediateValue2[1u] = intermediateValue97;
                intermediateValue2[2u] = intermediateValue99;
                uint sumValue94 = productValue99 + 0u;
                uint productValue103 = uint(objectInstances.packedValues[(bitwiseValue53 * 76u) + 56u]);
                uint productValue104 = productValue103 * (objectInstances_2.packedValues[productValue96] + bitwiseValue54);
                uint bitwiseValue67 = uint(objectInstances.packedValues[(bitwiseValue53 * 76u) + 71u] & 255us);
                uint bitwiseValue68 = (bitwiseValue67 + productValue104) >> 1u;
                f16vec3 sumValue39 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue68], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue68 + 1u], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue68 + 2u]));
                uint bitwiseValue69 = uint(objectInstances.packedValues[productValue98] & 255us);
                uint bitwiseValue70 = (bitwiseValue69 + productValue104) >> 2u;
                precise float bitwiseValue71 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue70] & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue72 = float((vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue70] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue73 = float((vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue70] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue74 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue70] >> 24u) * 0.0039215688593685626983642578125;
                uint bitwiseValue75 = uint(objectInstances.packedValues[productValue98] >> 8us);
                uint bitwiseValue76 = (bitwiseValue75 + productValue104) >> 2u;
                bool conditionValue4 = int16_t(objectInstances.packedValues[productValue86]) < int16_t(0us);
                float intermediateValue185;
                float intermediateValue186;
                if (conditionValue4)
                {
                    uint bitwiseValue77 = vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue76] >> 15u;
                    precise float bitwiseValue78 = float(bitwiseValue77 & 1u) * 2.0;
                    precise float sumValue95 = bitwiseValue78 + (-1.0);
                    precise float bitwiseValue79 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue76] >> 31u) * 2.0;
                    precise float sumValue96 = bitwiseValue79 + (-1.0);
                    precise float bitwiseValue80 = float((vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue76] << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue81 = float(bitwiseValue77 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue105 = sumValue95 * 3.0517578125e-05;
                    precise float productValue106 = sumValue96 * 3.0517578125e-05;
                    precise float sumValue97 = bitwiseValue80 + productValue105;
                    precise float sumValue98 = bitwiseValue81 + productValue106;
                    intermediateValue185 = sumValue97;
                    intermediateValue186 = sumValue98;
                }
                else
                {
                    precise float bitwiseValue82 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue76] & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue83 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue76] >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue107 = bitwiseValue82 * 16384.0;
                    precise float sumValue99 = productValue107 + 0.5;
                    precise float productValue108 = bitwiseValue83 * 16384.0;
                    precise float sumValue100 = productValue108 + 0.5;
                    precise float productValue109 = floor(sumValue99) * 6.103515625e-05;
                    precise float productValue110 = floor(sumValue100) * 6.103515625e-05;
                    intermediateValue185 = productValue109;
                    intermediateValue186 = productValue110;
                }
                uint16_t bitwiseValue84 = objectInstances.packedValues[productValue86] & 2us;
                bool comparisonValue22 = bitwiseValue84 == 0us;
                float intermediateValue191;
                float intermediateValue192;
                float intermediateValue193;
                if (comparisonValue22)
                {
                    intermediateValue191 = 0.0;
                    intermediateValue192 = 0.0;
                    intermediateValue193 = 0.0;
                }
                else
                {
                    uint bitwiseValue85 = (productValue104 + uint(objectInstances.packedValues[productValue89] & 255us)) >> 1u;
                    f16vec3 sumValue69 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue85], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue85 + 1u], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue85 + 2u]));
                    intermediateValue191 = float(sumValue69.x) * sumValue93;
                    intermediateValue192 = float(sumValue69.y) * sumValue93;
                    intermediateValue193 = float(sumValue69.z) * sumValue93;
                }
                uint intermediateValue196;
                if ((objectInstances.packedValues[productValue86] & 256us) == 0us)
                {
                    intermediateValue196 = 0u;
                }
                else
                {
                    intermediateValue196 = vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[(uint(objectInstances.packedValues[(bitwiseValue53 * 76u) + 74u] >> 8us) + productValue104) >> 2u] & 65535u;
                }
                precise float productValue111 = sumValue93 * float(sumValue39.x);
                precise float productValue112 = sumValue93 * float(sumValue39.y);
                precise float productValue113 = sumValue93 * float(sumValue39.z);
                precise float sumValue101 = productValue111 + 0.0;
                precise float sumValue102 = productValue112 + 0.0;
                precise float sumValue103 = productValue113 + 0.0;
                precise float productValue114 = sumValue93 * intermediateValue185;
                precise float productValue115 = sumValue93 * intermediateValue186;
                precise float sumValue104 = productValue114 + 0.0;
                precise float sumValue105 = productValue115 + 0.0;
                precise float productValue116 = sumValue93 * bitwiseValue71;
                precise float productValue117 = sumValue93 * bitwiseValue72;
                precise float productValue118 = sumValue93 * bitwiseValue73;
                precise float productValue119 = sumValue93 * bitwiseValue74;
                precise float sumValue106 = productValue116 + 0.0;
                precise float sumValue107 = productValue117 + 0.0;
                precise float sumValue108 = productValue118 + 0.0;
                precise float sumValue109 = productValue119 + 0.0;
                uint productValue120 = productValue103 * (objectInstances_2.packedValues[productValue96] + bitwiseValue55);
                uint bitwiseValue86 = (bitwiseValue67 + productValue120) >> 1u;
                f16vec3 sumValue87 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue86], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue86 + 1u], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue86 + 2u]));
                uint bitwiseValue87 = (bitwiseValue69 + productValue120) >> 2u;
                precise float bitwiseValue88 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue87] & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue89 = float((vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue87] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue90 = float((vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue87] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue91 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue87] >> 24u) * 0.0039215688593685626983642578125;
                uint bitwiseValue92 = (bitwiseValue75 + productValue120) >> 2u;
                float intermediateValue251;
                float intermediateValue252;
                if (conditionValue4)
                {
                    uint bitwiseValue93 = vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue92] >> 15u;
                    precise float bitwiseValue94 = float(bitwiseValue93 & 1u) * 2.0;
                    precise float sumValue110 = bitwiseValue94 + (-1.0);
                    precise float bitwiseValue95 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue92] >> 31u) * 2.0;
                    precise float sumValue111 = bitwiseValue95 + (-1.0);
                    precise float bitwiseValue96 = float((vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue92] << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue97 = float(bitwiseValue93 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue121 = sumValue110 * 3.0517578125e-05;
                    precise float productValue122 = sumValue111 * 3.0517578125e-05;
                    precise float sumValue112 = bitwiseValue96 + productValue121;
                    precise float sumValue113 = bitwiseValue97 + productValue122;
                    intermediateValue251 = sumValue112;
                    intermediateValue252 = sumValue113;
                }
                else
                {
                    precise float bitwiseValue98 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue92] & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue99 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue92] >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue123 = bitwiseValue98 * 16384.0;
                    precise float sumValue114 = productValue123 + 0.5;
                    precise float productValue130 = bitwiseValue99 * 16384.0;
                    precise float sumValue115 = productValue130 + 0.5;
                    precise float productValue131 = floor(sumValue114) * 6.103515625e-05;
                    precise float productValue132 = floor(sumValue115) * 6.103515625e-05;
                    intermediateValue251 = productValue131;
                    intermediateValue252 = productValue132;
                }
                float intermediateValue257;
                float intermediateValue258;
                float intermediateValue259;
                if (comparisonValue22)
                {
                    intermediateValue257 = intermediateValue191;
                    intermediateValue258 = intermediateValue192;
                    intermediateValue259 = intermediateValue193;
                }
                else
                {
                    uint bitwiseValue100 = (productValue120 + uint(objectInstances.packedValues[productValue89] & 255us)) >> 1u;
                    f16vec3 sumValue133 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue100], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue100 + 1u], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue100 + 2u]));
                    intermediateValue257 = (float(sumValue133.x) * intermediateValue97) + intermediateValue191;
                    intermediateValue258 = (float(sumValue133.y) * intermediateValue97) + intermediateValue192;
                    intermediateValue259 = (float(sumValue133.z) * intermediateValue97) + intermediateValue193;
                }
                precise float productValue133 = intermediateValue97 * float(sumValue87.x);
                precise float productValue134 = intermediateValue97 * float(sumValue87.y);
                precise float productValue135 = intermediateValue97 * float(sumValue87.z);
                precise float sumValue116 = sumValue101 + productValue133;
                precise float sumValue117 = sumValue102 + productValue134;
                precise float sumValue118 = sumValue103 + productValue135;
                precise float productValue136 = intermediateValue97 * intermediateValue251;
                precise float productValue137 = intermediateValue97 * intermediateValue252;
                precise float sumValue119 = sumValue104 + productValue136;
                precise float sumValue120 = sumValue105 + productValue137;
                precise float productValue138 = intermediateValue97 * bitwiseValue88;
                precise float productValue139 = intermediateValue97 * bitwiseValue89;
                precise float productValue140 = intermediateValue97 * bitwiseValue90;
                precise float productValue141 = intermediateValue97 * bitwiseValue91;
                precise float sumValue121 = sumValue106 + productValue138;
                precise float sumValue122 = sumValue107 + productValue139;
                precise float sumValue123 = sumValue108 + productValue140;
                precise float sumValue124 = sumValue109 + productValue141;
                uint productValue142 = productValue103 * (objectInstances_2.packedValues[productValue96] + bitwiseValue56);
                uint bitwiseValue101 = (bitwiseValue67 + productValue142) >> 1u;
                f16vec3 sumValue132 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue101], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue101 + 1u], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue101 + 2u]));
                uint bitwiseValue102 = (bitwiseValue69 + productValue142) >> 2u;
                precise float bitwiseValue103 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue102] & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue104 = float((vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue102] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue105 = float((vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue102] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue106 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue102] >> 24u) * 0.0039215688593685626983642578125;
                uint bitwiseValue107 = (bitwiseValue75 + productValue142) >> 2u;
                float intermediateValue271;
                float intermediateValue272;
                if (conditionValue4)
                {
                    uint bitwiseValue108 = vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue107] >> 15u;
                    precise float bitwiseValue109 = float(bitwiseValue108 & 1u) * 2.0;
                    precise float sumValue125 = bitwiseValue109 + (-1.0);
                    precise float bitwiseValue110 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue107] >> 31u) * 2.0;
                    precise float sumValue126 = bitwiseValue110 + (-1.0);
                    precise float bitwiseValue111 = float((vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue107] << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue112 = float(bitwiseValue108 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue143 = sumValue125 * 3.0517578125e-05;
                    precise float productValue144 = sumValue126 * 3.0517578125e-05;
                    precise float sumValue127 = bitwiseValue111 + productValue143;
                    precise float sumValue128 = bitwiseValue112 + productValue144;
                    intermediateValue271 = sumValue127;
                    intermediateValue272 = sumValue128;
                }
                else
                {
                    precise float bitwiseValue113 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue107] & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue114 = float(vertexBuffers_2[nonuniformEXT(sumValue94)].packedValues[bitwiseValue107] >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue145 = bitwiseValue113 * 16384.0;
                    precise float sumValue129 = productValue145 + 0.5;
                    precise float productValue146 = bitwiseValue114 * 16384.0;
                    precise float sumValue130 = productValue146 + 0.5;
                    precise float productValue147 = floor(sumValue129) * 6.103515625e-05;
                    precise float productValue148 = floor(sumValue130) * 6.103515625e-05;
                    intermediateValue271 = productValue147;
                    intermediateValue272 = productValue148;
                }
                float intermediateValue277;
                float intermediateValue278;
                float intermediateValue279;
                if (comparisonValue22)
                {
                    intermediateValue277 = intermediateValue257;
                    intermediateValue278 = intermediateValue258;
                    intermediateValue279 = intermediateValue259;
                }
                else
                {
                    uint bitwiseValue115 = (productValue142 + uint(objectInstances.packedValues[productValue89] & 255us)) >> 1u;
                    f16vec3 sumValue203 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue115], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue115 + 1u], vertexBuffers[nonuniformEXT(sumValue94)].packedValues[bitwiseValue115 + 2u]));
                    intermediateValue277 = (float(sumValue203.x) * intermediateValue99) + intermediateValue257;
                    intermediateValue278 = (float(sumValue203.y) * intermediateValue99) + intermediateValue258;
                    intermediateValue279 = (float(sumValue203.z) * intermediateValue99) + intermediateValue259;
                }
                precise float productValue149 = intermediateValue99 * float(sumValue132.x);
                precise float productValue150 = intermediateValue99 * float(sumValue132.y);
                precise float productValue151 = intermediateValue99 * float(sumValue132.z);
                precise float sumValue131 = sumValue116 + productValue149;
                precise float sumValue134 = sumValue117 + productValue150;
                precise float sumValue135 = sumValue118 + productValue151;
                precise float productValue152 = intermediateValue99 * intermediateValue271;
                precise float productValue153 = intermediateValue99 * intermediateValue272;
                precise float sumValue136 = sumValue119 + productValue152;
                precise float sumValue137 = sumValue120 + productValue153;
                precise float productValue154 = intermediateValue99 * bitwiseValue103;
                precise float productValue155 = intermediateValue99 * bitwiseValue104;
                precise float productValue156 = intermediateValue99 * bitwiseValue105;
                precise float productValue157 = intermediateValue99 * bitwiseValue106;
                precise float sumValue138 = sumValue121 + productValue154;
                precise float sumValue139 = sumValue122 + productValue155;
                precise float sumValue140 = sumValue123 + productValue156;
                precise float sumValue141 = sumValue124 + productValue157;
                precise float productValue158 = scalarValue26 * sumValue131;
                precise float productValue159 = sumValue134 * scalarValue27;
                precise float sumValue142 = productValue159 + productValue158;
                precise float productValue160 = sumValue135 * scalarValue28;
                precise float sumValue143 = productValue160 + sumValue142;
                precise float productValue161 = 1.0 * reinterpretedBits4.w;
                precise float sumValue144 = productValue161 + sumValue143;
                precise float productValue162 = scalarValue29 * sumValue131;
                precise float productValue163 = sumValue134 * scalarValue30;
                precise float sumValue145 = productValue163 + productValue162;
                precise float productValue164 = sumValue135 * scalarValue31;
                precise float sumValue146 = productValue164 + sumValue145;
                precise float productValue165 = 1.0 * reinterpretedBits5.w;
                precise float sumValue147 = productValue165 + sumValue146;
                precise float productValue166 = scalarValue32 * sumValue131;
                precise float productValue167 = sumValue134 * scalarValue33;
                precise float sumValue148 = productValue167 + productValue166;
                precise float productValue168 = sumValue135 * scalarValue34;
                precise float sumValue149 = productValue168 + sumValue148;
                precise float productValue169 = 1.0 * reinterpretedBits6.w;
                precise float sumValue150 = productValue169 + sumValue149;
                precise float productValue170 = scalarValue26 * sumValue82;
                precise float productValue171 = sumValue83 * scalarValue27;
                precise float sumValue151 = productValue171 + productValue170;
                precise float productValue172 = sumValue84 * scalarValue28;
                precise float sumValue152 = productValue172 + sumValue151;
                precise float productValue173 = scalarValue29 * sumValue82;
                precise float productValue174 = sumValue83 * scalarValue30;
                precise float sumValue153 = productValue174 + productValue173;
                precise float productValue175 = sumValue84 * scalarValue31;
                precise float sumValue154 = productValue175 + sumValue153;
                precise float productValue176 = scalarValue32 * sumValue82;
                precise float productValue177 = sumValue83 * scalarValue33;
                precise float sumValue155 = productValue177 + productValue176;
                precise float productValue178 = sumValue84 * scalarValue34;
                precise float sumValue156 = productValue178 + sumValue155;
                float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue152, sumValue154, sumValue156), vec3(sumValue152, sumValue154, sumValue156)));
                precise float productValue179 = sumValue152 * inverseLengthValue1;
                precise float productValue180 = sumValue154 * inverseLengthValue1;
                precise float productValue181 = sumValue156 * inverseLengthValue1;
                precise float productValue182 = scalarValue26 * sumValue85;
                precise float productValue183 = sumValue86 * scalarValue27;
                precise float sumValue157 = productValue183 + productValue182;
                precise float productValue184 = sumValue88 * scalarValue28;
                precise float sumValue158 = productValue184 + sumValue157;
                precise float productValue185 = scalarValue29 * sumValue85;
                precise float productValue186 = sumValue86 * scalarValue30;
                precise float sumValue159 = productValue186 + productValue185;
                precise float productValue187 = sumValue88 * scalarValue31;
                precise float sumValue160 = productValue187 + sumValue159;
                precise float productValue188 = scalarValue32 * sumValue85;
                precise float productValue189 = sumValue86 * scalarValue33;
                precise float sumValue161 = productValue189 + productValue188;
                precise float productValue190 = sumValue88 * scalarValue34;
                precise float sumValue162 = productValue190 + sumValue161;
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue158, sumValue160, sumValue162), vec3(sumValue158, sumValue160, sumValue162)));
                precise float productValue191 = sumValue158 * inverseLengthValue2;
                precise float productValue192 = sumValue160 * inverseLengthValue2;
                precise float productValue193 = sumValue162 * inverseLengthValue2;
                precise float productValue194 = scalarValue26 * sumValue89;
                precise float productValue195 = sumValue90 * scalarValue27;
                precise float sumValue163 = productValue195 + productValue194;
                precise float productValue196 = sumValue91 * scalarValue28;
                precise float sumValue164 = productValue196 + sumValue163;
                precise float productValue197 = scalarValue29 * sumValue89;
                precise float productValue198 = sumValue90 * scalarValue30;
                precise float sumValue165 = productValue198 + productValue197;
                precise float productValue199 = sumValue91 * scalarValue31;
                precise float sumValue166 = productValue199 + sumValue165;
                precise float productValue200 = scalarValue32 * sumValue89;
                precise float productValue201 = sumValue90 * scalarValue33;
                precise float sumValue167 = productValue201 + productValue200;
                precise float productValue202 = sumValue91 * scalarValue34;
                precise float sumValue168 = productValue202 + sumValue167;
                float inverseLengthValue3 = inversesqrt(dot(vec3(sumValue164, sumValue166, sumValue168), vec3(sumValue164, sumValue166, sumValue168)));
                precise float productValue203 = sumValue164 * inverseLengthValue3;
                precise float productValue204 = sumValue166 * inverseLengthValue3;
                precise float productValue205 = sumValue168 * inverseLengthValue3;
                bool dotProductValue = dot(vec3(intermediateValue36, intermediateValue38, intermediateValue40), vec3(productValue179, productValue180, productValue181)) > 0.0;
                precise float sumValue169 = (-0.0) - productValue179;
                precise float sumValue170 = (-0.0) - productValue180;
                precise float sumValue171 = (-0.0) - productValue181;
                float comparisonValue23 = dotProductValue ? sumValue169 : productValue179;
                float comparisonValue24 = dotProductValue ? sumValue170 : productValue180;
                float comparisonValue25 = dotProductValue ? sumValue171 : productValue181;
                bool comparisonValue26 = bitwiseValue84 != 0us;
                float comparisonValue27 = comparisonValue26 ? intermediateValue277 : sumValue131;
                float comparisonValue28 = comparisonValue26 ? intermediateValue278 : sumValue134;
                float comparisonValue29 = comparisonValue26 ? intermediateValue279 : sumValue135;
                float intermediateValue119;
                float intermediateValue121;
                float intermediateValue123;
                if (((objectInstances.packedValues[productValue86] & 1us) != 0us) && (floatBitsToUint(ViewCB.packedValues[86u]).y != 0u))
                {
                    uint sumValue172 = productValue99 + 0u;
                    float sumValue205;
                    float sumValue206;
                    float sumValue207;
                    uint sumValue210;
                    float scalarValue35 = sumValue93;
                    uint scalarValue36 = bitwiseValue54;
                    float scalarValue37 = 0.0;
                    float scalarValue38 = 0.0;
                    float scalarValue39 = 0.0;
                    uint scalarValue40 = 0u;
                    f16vec3 sumValue212;
                    f16vec3 sumValue213;
                    for (;;)
                    {
                        uint sumValue173 = scalarValue36 + objectInstances_2.packedValues[productValue97];
                        uint productValue206 = sumValue173 * 8u;
                        sumValue212 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue172)].packedValues[productValue206], vertexIrradianceCache[nonuniformEXT(sumValue172)].packedValues[productValue206 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue172)].packedValues[productValue206 + 2u]));
                        uint productValue207 = (sumValue173 * 8u) + 4u;
                        sumValue213 = uint16BitsToFloat16(u16vec3(vertexIrradianceCache[nonuniformEXT(sumValue172)].packedValues[productValue207], vertexIrradianceCache[nonuniformEXT(sumValue172)].packedValues[productValue207 + 1u], vertexIrradianceCache[nonuniformEXT(sumValue172)].packedValues[productValue207 + 2u]));
                        float16_t intermediateValue298;
                        float16_t intermediateValue299;
                        float16_t intermediateValue300;
                        if (dotProductValue)
                        {
                            intermediateValue298 = sumValue213.x;
                            intermediateValue299 = sumValue213.y;
                            intermediateValue300 = sumValue213.z;
                        }
                        else
                        {
                            intermediateValue298 = sumValue212.x;
                            intermediateValue299 = sumValue212.y;
                            intermediateValue300 = sumValue212.z;
                        }
                        precise float productValue208 = float(intermediateValue300) * scalarValue35;
                        precise float productValue209 = float(intermediateValue299) * scalarValue35;
                        precise float productValue210 = float(intermediateValue298) * scalarValue35;
                        sumValue205 = productValue210 + scalarValue37;
                        sumValue206 = productValue209 + scalarValue38;
                        sumValue207 = productValue208 + scalarValue39;
                        sumValue210 = scalarValue40 + 1u;
                        if (sumValue210 == 3u)
                        {
                            break;
                        }
                        scalarValue35 = intermediateValue2[sumValue210];
                        scalarValue36 = intermediateValue1[sumValue210];
                        scalarValue37 = sumValue205;
                        scalarValue38 = sumValue206;
                        scalarValue39 = sumValue207;
                        scalarValue40 = sumValue210;
                        continue;
                    }
                    intermediateValue119 = sumValue205;
                    intermediateValue121 = sumValue206;
                    intermediateValue123 = sumValue207;
                }
                else
                {
                    intermediateValue119 = 0.0;
                    intermediateValue121 = 0.0;
                    intermediateValue123 = 0.0;
                }
                precise float productValue211 = ViewCB.packedValues[89u].y * 2.0;
                float comparisonValue30 = (intermediateValue71 != 0u) ? productValue211 : ViewCB.packedValues[89u].y;
                precise float productValue212 = intermediateValue54 * comparisonValue30;
                vec2 reinterpretedBits10 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[intermediateValue196 * 8u]);
                vec2 reinterpretedBits11 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue196 * 8u) + 1u]);
                vec2 reinterpretedBits12 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue196 * 8u) + 2u]);
                vec2 reinterpretedBits13 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue196 * 8u) + 3u]);
                uint productValue213 = (intermediateValue196 * 16u) + 8u;
                float reinterpretedBits14 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue196 * 16u) + 13u]);
                float reinterpretedBits15 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue196 * 16u) + 14u]);
                float reinterpretedBits16 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue196 * 16u) + 15u]);
                precise float productValue214 = intermediateValue101 * comparisonValue30;
                precise float sumValue174 = productValue214 + productValue212;
                precise float nonlinearValue = float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue81)].packedValues[(bitwiseValue57 * 8u) + 6u])) + log2(abs(sumValue174));
                precise float dotProductValue1 = nonlinearValue - log2(abs(dot(vec3(intermediateValue36, intermediateValue38, intermediateValue40), vec3(comparisonValue23, comparisonValue24, comparisonValue25))));
                precise float sumValue175 = dotProductValue1 + ViewCB.packedValues[86u].x;
                float scalarValue41 = spvNMax(0.0, sumValue175);
                float scalarValue42 = spvNMin(scalarValue41, reinterpretedBits14);
                uint scalarValue43 = uint(objectInstances.packedValues[productValue83]);
                bool conditionValue5 = objectInstances.packedValues[productValue83] > 4095us;
                uint reinterpretedBits30;
                if (conditionValue5)
                {
                    reinterpretedBits30 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                }
                else
                {
                    reinterpretedBits30 = scalarValue43;
                }
                uint sumValue176 = reinterpretedBits30 + 0u;
                float intermediateValue293;
                float intermediateValue294;
                float intermediateValue295;
                float intermediateValue296;
                if (objectInstances.packedValues[productValue83] == 65535us)
                {
                    intermediateValue293 = 1.0;
                    intermediateValue294 = 1.0;
                    intermediateValue295 = 1.0;
                    intermediateValue296 = 1.0;
                }
                else
                {
                    vec4 sampledTextureValue = textureLod(nonuniformEXT(sampler2D(textures[sumValue176], defaultSampler)), vec2(sumValue136, sumValue137), scalarValue42);
                    intermediateValue293 = sampledTextureValue.x;
                    intermediateValue294 = sampledTextureValue.y;
                    intermediateValue295 = sampledTextureValue.z;
                    intermediateValue296 = sampledTextureValue.w;
                }
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
                float intermediateValue140;
                float intermediateValue141;
                float intermediateValue306;
                float intermediateValue308;
                float intermediateValue310;
                if ((objectInstances.packedValues[productValue86] & 1024us) == 0us)
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
                    if ((objectInstances.packedValues[productValue86] & 512us) == 0us)
                    {
                        bool comparisonValue31 = (objectInstances.packedValues[productValue86] & 4us) == 0us;
                        float intermediateValue312;
                        float intermediateValue313;
                        float intermediateValue314;
                        float intermediateValue315;
                        if (comparisonValue31)
                        {
                            intermediateValue312 = intermediateValue296;
                            intermediateValue313 = sumValue138;
                            intermediateValue314 = sumValue139;
                            intermediateValue315 = sumValue140;
                        }
                        else
                        {
                            uint reinterpretedBits32;
                            if (objectInstances.packedValues[productValue84] > 4095us)
                            {
                                reinterpretedBits32 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits32 = uint(objectInstances.packedValues[productValue84]);
                            }
                            vec4 sampledTextureValue1 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits32 + 0u], defaultSampler)), vec2(sumValue138, sumValue139), 0.0);
                            precise float productValue215 = sampledTextureValue1.x * 2.0;
                            precise float productValue216 = sampledTextureValue1.y * 2.0;
                            precise float productValue217 = sampledTextureValue1.z * 2.0;
                            precise float sumValue177 = productValue215 + (-1.0);
                            precise float sumValue178 = productValue216 + (-1.0);
                            precise float sumValue179 = productValue217 + (-1.0);
                            precise float productValue218 = sumValue140 * sumValue177;
                            precise float productValue219 = sumValue140 * sumValue178;
                            precise float productValue220 = sumValue140 * sumValue179;
                            precise float sumValue180 = productValue218 + 1.0;
                            precise float sumValue181 = productValue219 + 1.0;
                            precise float sumValue182 = productValue220 + 1.0;
                            precise float productValue221 = sumValue141 * sumValue180;
                            precise float productValue222 = sumValue141 * sumValue181;
                            precise float productValue223 = sumValue141 * sumValue182;
                            intermediateValue312 = 1.0;
                            intermediateValue313 = productValue221;
                            intermediateValue314 = productValue222;
                            intermediateValue315 = productValue223;
                        }
                        float intermediateValue320;
                        float intermediateValue321;
                        float intermediateValue322;
                        if ((objectInstances.packedValues[productValue86] & 8192us) == 0us)
                        {
                            intermediateValue320 = intermediateValue313;
                            intermediateValue321 = intermediateValue314;
                            intermediateValue322 = intermediateValue315;
                        }
                        else
                        {
                            precise float sumValue183 = 1.0 - intermediateValue313;
                            precise float sumValue184 = 1.0 - intermediateValue314;
                            precise float sumValue185 = 1.0 - intermediateValue315;
                            precise float productValue224 = intermediateValue312 * sumValue183;
                            precise float productValue225 = intermediateValue312 * sumValue184;
                            precise float productValue226 = intermediateValue312 * sumValue185;
                            precise float sumValue186 = intermediateValue313 + productValue224;
                            precise float sumValue187 = intermediateValue314 + productValue225;
                            precise float sumValue188 = intermediateValue315 + productValue226;
                            intermediateValue320 = sumValue186;
                            intermediateValue321 = sumValue187;
                            intermediateValue322 = sumValue188;
                        }
                        precise float productValue227 = intermediateValue293 * intermediateValue320;
                        precise float productValue228 = intermediateValue294 * intermediateValue321;
                        precise float productValue229 = intermediateValue295 * intermediateValue322;
                        float intermediateValue302;
                        if ((objectInstances.packedValues[productValue86] & 2048us) == 0us)
                        {
                            intermediateValue302 = intermediateValue312;
                        }
                        else
                        {
                            precise float productValue230 = intermediateValue312 * 2.0;
                            precise float sumValue189 = productValue230 + (-1.0);
                            intermediateValue302 = spvNClamp(sumValue189, 0.0, 1.0);
                        }
                        precise float bitwiseValue116 = float(objectInstances_2.packedValues[productValue87] >> 24u) * 0.0039215688593685626983642578125;
                        precise float bitwiseValue117 = float((objectInstances_2.packedValues[productValue87] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                        precise float bitwiseValue118 = float((objectInstances_2.packedValues[productValue87] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                        precise float sumValue190 = bitwiseValue116 + (-1.0);
                        precise float sumValue191 = bitwiseValue117 + (-1.0);
                        precise float sumValue192 = bitwiseValue118 + (-1.0);
                        precise float productValue231 = sumValue190 * intermediateValue302;
                        precise float productValue232 = sumValue191 * intermediateValue302;
                        precise float productValue233 = sumValue192 * intermediateValue302;
                        precise float sumValue193 = productValue231 + 1.0;
                        precise float sumValue194 = productValue232 + 1.0;
                        precise float sumValue195 = productValue233 + 1.0;
                        precise float productValue234 = productValue227 * sumValue193;
                        precise float productValue235 = productValue228 * sumValue194;
                        precise float productValue236 = productValue229 * sumValue195;
                        float intermediateValue323;
                        float intermediateValue325;
                        float intermediateValue327;
                        float intermediateValue329;
                        if (comparisonValue31)
                        {
                            float intermediateValue330;
                            float intermediateValue331;
                            float intermediateValue332;
                            if (objectInstances.packedValues[productValue84] == 65535us)
                            {
                                intermediateValue330 = productValue234;
                                intermediateValue331 = productValue235;
                                intermediateValue332 = productValue236;
                            }
                            else
                            {
                                uint reinterpretedBits33;
                                if (objectInstances.packedValues[productValue84] > 4095us)
                                {
                                    reinterpretedBits33 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits33 = uint(objectInstances.packedValues[productValue84]);
                                }
                                vec4 sampledTextureValue2 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits33 + 0u], defaultSampler)), vec2(sumValue136, sumValue137), scalarValue42);
                                float scalarValue44 = sampledTextureValue2.x;
                                float scalarValue45 = sampledTextureValue2.y;
                                float scalarValue46 = sampledTextureValue2.z;
                                float scalarValue47 = sampledTextureValue2.w;
                                float branchMergedValue31;
                                float branchMergedValue69;
                                float branchMergedValue70;
                                if ((objectInstances.packedValues[productValue86] & 8us) == 0us)
                                {
                                    float branchMergedValue110;
                                    float branchMergedValue131;
                                    float branchMergedValue132;
                                    if ((objectInstances.packedValues[productValue86] & 16us) == 0us)
                                    {
                                        float branchMergedValue181;
                                        float branchMergedValue183;
                                        float branchMergedValue184;
                                        if ((objectInstances.packedValues[productValue86] & 32us) == 0us)
                                        {
                                            branchMergedValue181 = productValue235;
                                            branchMergedValue183 = productValue234;
                                            branchMergedValue184 = productValue236;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue119 = float(objectInstances_2.packedValues[productValue88] >> 24u) * 0.0039215688593685626983642578125;
                                            precise float bitwiseValue120 = float((objectInstances_2.packedValues[productValue88] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                                            precise float bitwiseValue121 = float((objectInstances_2.packedValues[productValue88] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                                            precise float productValue237 = bitwiseValue119 * scalarValue44;
                                            precise float productValue238 = bitwiseValue120 * scalarValue45;
                                            precise float productValue239 = bitwiseValue121 * scalarValue46;
                                            precise float sumValue196 = productValue237 - productValue234;
                                            precise float sumValue197 = productValue238 - productValue235;
                                            precise float sumValue198 = productValue239 - productValue236;
                                            precise float productValue240 = scalarValue47 * sumValue196;
                                            precise float productValue241 = scalarValue47 * sumValue197;
                                            precise float productValue242 = scalarValue47 * sumValue198;
                                            precise float sumValue199 = productValue234 + productValue240;
                                            precise float sumValue200 = productValue235 + productValue241;
                                            precise float sumValue201 = productValue236 + productValue242;
                                            branchMergedValue181 = sumValue200;
                                            branchMergedValue183 = sumValue199;
                                            branchMergedValue184 = sumValue201;
                                        }
                                        branchMergedValue110 = branchMergedValue181;
                                        branchMergedValue131 = branchMergedValue183;
                                        branchMergedValue132 = branchMergedValue184;
                                    }
                                    else
                                    {
                                        precise float sumValue202 = scalarValue44 - productValue234;
                                        precise float sumValue204 = scalarValue45 - productValue235;
                                        precise float sumValue208 = scalarValue46 - productValue236;
                                        precise float productValue243 = scalarValue47 * sumValue202;
                                        precise float productValue244 = scalarValue47 * sumValue204;
                                        precise float productValue245 = scalarValue47 * sumValue208;
                                        precise float sumValue209 = productValue234 + productValue243;
                                        precise float sumValue211 = productValue235 + productValue244;
                                        precise float sumValue214 = productValue236 + productValue245;
                                        uint reinterpretedBits34;
                                        if (objectInstances.packedValues[productValue85] > 4095us)
                                        {
                                            reinterpretedBits34 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits34 = uint(objectInstances.packedValues[productValue85]);
                                        }
                                        vec4 sampledTextureValue3 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits34 + 0u], defaultSampler)), vec2(sumValue136, sumValue137), scalarValue42);
                                        float scalarValue48 = sampledTextureValue3.w;
                                        precise float productValue246 = bitwiseValue116 * sampledTextureValue3.x;
                                        precise float productValue247 = bitwiseValue117 * sampledTextureValue3.y;
                                        precise float productValue248 = bitwiseValue118 * sampledTextureValue3.z;
                                        precise float sumValue215 = productValue246 - sumValue209;
                                        precise float sumValue216 = productValue247 - sumValue211;
                                        precise float sumValue217 = productValue248 - sumValue214;
                                        precise float productValue249 = scalarValue48 * sumValue215;
                                        precise float productValue250 = scalarValue48 * sumValue216;
                                        precise float productValue251 = scalarValue48 * sumValue217;
                                        precise float sumValue218 = sumValue209 + productValue249;
                                        precise float sumValue219 = sumValue211 + productValue250;
                                        precise float sumValue220 = sumValue214 + productValue251;
                                        branchMergedValue110 = sumValue219;
                                        branchMergedValue131 = sumValue218;
                                        branchMergedValue132 = sumValue220;
                                    }
                                    branchMergedValue31 = branchMergedValue110;
                                    branchMergedValue69 = branchMergedValue131;
                                    branchMergedValue70 = branchMergedValue132;
                                }
                                else
                                {
                                    precise float sumValue221 = 1.0 - scalarValue47;
                                    precise float dotProductValue2 = sumValue221 * dot(vec3(scalarValue44, scalarValue45, scalarValue46), vec3(1.0));
                                    float scalarValue49 = spvNClamp(ceil(dotProductValue2), 0.0, 1.0);
                                    precise float sumValue222 = productValue234 - scalarValue44;
                                    precise float sumValue223 = productValue235 - scalarValue45;
                                    precise float sumValue224 = productValue236 - scalarValue46;
                                    precise float productValue252 = sumValue222 * scalarValue49;
                                    precise float productValue253 = sumValue223 * scalarValue49;
                                    precise float productValue254 = sumValue224 * scalarValue49;
                                    precise float sumValue225 = scalarValue44 + productValue252;
                                    precise float sumValue226 = scalarValue45 + productValue253;
                                    precise float sumValue227 = scalarValue46 + productValue254;
                                    branchMergedValue31 = sumValue226;
                                    branchMergedValue69 = sumValue225;
                                    branchMergedValue70 = sumValue227;
                                }
                                intermediateValue330 = branchMergedValue69;
                                intermediateValue331 = branchMergedValue31;
                                intermediateValue332 = branchMergedValue70;
                            }
                            float intermediateValue324;
                            float intermediateValue326;
                            float intermediateValue328;
                            if ((objectInstances.packedValues[productValue86] & 64us) == 0us)
                            {
                                intermediateValue324 = intermediateValue330;
                                intermediateValue326 = intermediateValue331;
                                intermediateValue328 = intermediateValue332;
                            }
                            else
                            {
                                precise float bitwiseValue122 = float(objectInstances_2.packedValues[productValue88] >> 24u) * 0.0039215688593685626983642578125;
                                precise float bitwiseValue123 = float((objectInstances_2.packedValues[productValue88] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                                precise float bitwiseValue124 = float((objectInstances_2.packedValues[productValue88] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                                precise float bitwiseValue125 = float(objectInstances_2.packedValues[productValue88] & 255u) * 0.0039215688593685626983642578125;
                                precise float sumValue228 = bitwiseValue122 - intermediateValue330;
                                precise float sumValue229 = bitwiseValue123 - intermediateValue331;
                                precise float sumValue230 = bitwiseValue124 - intermediateValue332;
                                precise float productValue255 = bitwiseValue125 * sumValue228;
                                precise float productValue256 = bitwiseValue125 * sumValue229;
                                precise float productValue257 = bitwiseValue125 * sumValue230;
                                precise float sumValue231 = intermediateValue330 + productValue255;
                                precise float sumValue232 = intermediateValue331 + productValue256;
                                precise float sumValue233 = intermediateValue332 + productValue257;
                                intermediateValue324 = sumValue231;
                                intermediateValue326 = sumValue232;
                                intermediateValue328 = sumValue233;
                            }
                            float branchMergedValue30;
                            float branchMergedValue66;
                            float branchMergedValue67;
                            float branchMergedValue68;
                            if ((objectInstances.packedValues[productValue86] & 16384us) == 0us)
                            {
                                branchMergedValue30 = 0.0;
                                branchMergedValue66 = intermediateValue328;
                                branchMergedValue67 = intermediateValue326;
                                branchMergedValue68 = intermediateValue324;
                            }
                            else
                            {
                                precise float sumValue234 = sumValue137 - sumValue136;
                                precise float productValue258 = sumValue234 * 8.0;
                                precise float productValue259 = ViewCB.packedValues[97u].z * 3.0;
                                precise float sumValue235 = productValue259 + productValue258;
                                precise float wavePhaseValue = sin(sumValue235) * 0.5;
                                precise float sumValue236 = wavePhaseValue + 0.5;
                                float scalarValue50 = spvNClamp(sumValue236, 0.0, 1.0);
                                precise float productValue260 = scalarValue50 * scalarValue50;
                                precise float productValue261 = 0.560000002384185791015625 * productValue260;
                                precise float sumValue237 = productValue261 + intermediateValue324;
                                precise float productValue262 = 0.2800000011920928955078125 * productValue260;
                                precise float sumValue238 = productValue262 + intermediateValue326;
                                precise float productValue263 = 0.699999988079071044921875 * productValue260;
                                precise float sumValue239 = productValue263 + intermediateValue328;
                                branchMergedValue30 = fma(productValue260, 0.00019999999494757503271102905273438, 0.0);
                                branchMergedValue66 = sumValue239;
                                branchMergedValue67 = sumValue238;
                                branchMergedValue68 = sumValue237;
                            }
                            intermediateValue323 = branchMergedValue68;
                            intermediateValue325 = branchMergedValue67;
                            intermediateValue327 = branchMergedValue66;
                            intermediateValue329 = branchMergedValue30;
                        }
                        else
                        {
                            intermediateValue323 = productValue234;
                            intermediateValue325 = productValue235;
                            intermediateValue327 = productValue236;
                            intermediateValue329 = 0.0;
                        }
                        float intermediateValue307;
                        if (intermediateValue323 < 0.040449999272823333740234375)
                        {
                            precise float productValue264 = intermediateValue323 * 0.077399380505084991455078125;
                            intermediateValue307 = productValue264;
                        }
                        else
                        {
                            precise float sumValue240 = intermediateValue323 + 0.054999999701976776123046875;
                            precise float productValue265 = sumValue240 * 0.947867333889007568359375;
                            precise float nonlinearValue1 = log2(productValue265) * 2.400000095367431640625;
                            intermediateValue307 = exp2(nonlinearValue1);
                        }
                        float intermediateValue309;
                        if (intermediateValue325 < 0.040449999272823333740234375)
                        {
                            precise float productValue266 = intermediateValue325 * 0.077399380505084991455078125;
                            intermediateValue309 = productValue266;
                        }
                        else
                        {
                            precise float sumValue241 = intermediateValue325 + 0.054999999701976776123046875;
                            precise float productValue268 = sumValue241 * 0.947867333889007568359375;
                            precise float nonlinearValue2 = log2(productValue268) * 2.400000095367431640625;
                            intermediateValue309 = exp2(nonlinearValue2);
                        }
                        float intermediateValue311;
                        if (intermediateValue327 < 0.040449999272823333740234375)
                        {
                            precise float productValue269 = intermediateValue327 * 0.077399380505084991455078125;
                            intermediateValue311 = productValue269;
                        }
                        else
                        {
                            precise float sumValue242 = intermediateValue327 + 0.054999999701976776123046875;
                            precise float productValue270 = sumValue242 * 0.947867333889007568359375;
                            precise float nonlinearValue3 = log2(productValue270) * 2.400000095367431640625;
                            intermediateValue311 = exp2(nonlinearValue3);
                        }
                        float reinterpretedBits31;
                        float reinterpretedBits35;
                        float reinterpretedBits36;
                        if ((pbrTextureDataBuffer.packedValues[productValue213] & 1u) == 0u)
                        {
                            reinterpretedBits35 = intermediateValue329 + uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue196 * 16u) + 10u]);
                            reinterpretedBits31 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue196 * 16u) + 11u]);
                            reinterpretedBits36 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue196 * 16u) + 9u]);
                        }
                        else
                        {
                            precise float productValue271 = sumValue136 * reinterpretedBits10.x;
                            precise float sumValue243 = productValue271 + reinterpretedBits11.x;
                            precise float productValue272 = sumValue137 * reinterpretedBits10.y;
                            precise float sumValue244 = productValue272 + reinterpretedBits11.y;
                            precise float sumValue245 = reinterpretedBits15 + scalarValue41;
                            precise float sumValue246 = sumValue245 - reinterpretedBits14;
                            vec4 sampledTextureValue4 = textureLod(nonuniformEXT(sampler2D(textures[sumValue176], defaultSampler)), vec2(sumValue243, sumValue244), spvNMin(sumValue246, reinterpretedBits15));
                            float scalarValue51 = sampledTextureValue4.y;
                            reinterpretedBits35 = fma(scalarValue51, scalarValue51, intermediateValue329);
                            reinterpretedBits31 = sampledTextureValue4.x;
                            reinterpretedBits36 = sampledTextureValue4.z;
                        }
                        precise float productValue273 = sumValue136 * reinterpretedBits12.x;
                        precise float sumValue247 = productValue273 + reinterpretedBits13.x;
                        precise float productValue274 = sumValue137 * reinterpretedBits12.y;
                        precise float sumValue248 = productValue274 + reinterpretedBits13.y;
                        precise float sumValue249 = reinterpretedBits16 + scalarValue41;
                        precise float sumValue250 = sumValue249 - reinterpretedBits14;
                        float scalarValue52 = spvNMin(sumValue250, reinterpretedBits16);
                        float intermediateValue343;
                        float intermediateValue344;
                        if ((pbrTextureDataBuffer.packedValues[productValue213] & 4u) == 0u)
                        {
                            float branchMergedValue32;
                            float branchMergedValue71;
                            if ((pbrTextureDataBuffer.packedValues[productValue213] & 16u) == 0u)
                            {
                                float branchMergedValue111;
                                float branchMergedValue133;
                                if ((pbrTextureDataBuffer.packedValues[productValue213] & 8u) == 0u)
                                {
                                    branchMergedValue111 = 0.0;
                                    branchMergedValue133 = 0.0;
                                }
                                else
                                {
                                    precise float productValue275 = scalarValue52 * (-1.0);
                                    precise float sumValue251 = productValue275 + 2.0;
                                    float scalarValue53 = spvNClamp(sumValue251, 0.0, 1.0);
                                    float branchMergedValue182;
                                    float branchMergedValue185;
                                    if (scalarValue53 > 0.0)
                                    {
                                        uint reinterpretedBits38;
                                        if (conditionValue5)
                                        {
                                            reinterpretedBits38 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits38 = scalarValue43;
                                        }
                                        uvec2 sampledTextureValue5 = uvec2(textureSize(textures[nonuniformEXT(reinterpretedBits38 + 0u)], int(0u)));
                                        precise float productValue276 = sumValue247 * float(int(uint(int(float(int(sampledTextureValue5.x))))));
                                        precise float productValue277 = sumValue248 * float(int(uint(int(float(int(sampledTextureValue5.y))))));
                                        float scalarValue54 = fract(productValue276);
                                        float scalarValue55 = fract(productValue277);
                                        precise float sumValue252 = scalarValue54 + (-0.5);
                                        float intermediateValue350;
                                        if (abs(sumValue252) < 0.0625)
                                        {
                                            precise float comparisonValue32 = sumValue247 + ((scalarValue54 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06));
                                            intermediateValue350 = comparisonValue32;
                                        }
                                        else
                                        {
                                            intermediateValue350 = sumValue247;
                                        }
                                        precise float sumValue253 = scalarValue55 + (-0.5);
                                        float intermediateValue351;
                                        if (abs(sumValue253) < 0.0625)
                                        {
                                            precise float comparisonValue33 = sumValue248 + ((scalarValue55 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06));
                                            intermediateValue351 = comparisonValue33;
                                        }
                                        else
                                        {
                                            intermediateValue351 = sumValue248;
                                        }
                                        vec4 sampledTextureValue6 = textureGather(nonuniformEXT(sampler2D(textures[sumValue176], defaultSampler)), vec2(intermediateValue350, intermediateValue351));
                                        float scalarValue56 = sampledTextureValue6.x;
                                        float scalarValue57 = sampledTextureValue6.y;
                                        float scalarValue58 = sampledTextureValue6.z;
                                        float scalarValue59 = sampledTextureValue6.w;
                                        precise float sumValue254 = productValue276 + 0.5;
                                        precise float sumValue255 = productValue277 + 0.5;
                                        float scalarValue60 = fract(sumValue254);
                                        float scalarValue61 = fract(sumValue255);
                                        bool conditionValue6 = scalarValue61 > 0.5;
                                        intermediateValue[0u] = conditionValue6 ? scalarValue56 : scalarValue59;
                                        intermediateValue[1u] = conditionValue6 ? scalarValue57 : scalarValue58;
                                        precise float productValue278 = intermediateValue[uint(int(spvNClamp((scalarValue60 - ViewCB.packedValues[89u].w) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((ViewCB.packedValues[89u].w + scalarValue60) * 2.0, 0.0, 1.0)))];
                                        bool conditionValue7 = scalarValue60 > 0.5;
                                        float comparisonValue35 = conditionValue7 ? scalarValue58 : scalarValue59;
                                        float comparisonValue36 = conditionValue7 ? scalarValue57 : scalarValue56;
                                        intermediateValue[0u] = comparisonValue35;
                                        intermediateValue[1u] = comparisonValue36;
                                        precise float sumValue256 = (-0.0) - ViewCB.packedValues[89u].w;
                                        precise float comparisonValue37 = ((comparisonValue35 > comparisonValue36) ? ViewCB.packedValues[89u].w : sumValue256) * 0.0;
                                        precise float sumValue257 = scalarValue61 + comparisonValue37;
                                        precise float sumValue258 = sumValue257 - ViewCB.packedValues[89u].w;
                                        precise float sumValue259 = ViewCB.packedValues[89u].w + sumValue257;
                                        precise float productValue279 = sumValue258 * 2.0;
                                        precise float productValue280 = sumValue259 * 2.0;
                                        precise float sumValue260 = intermediateValue[uint(int(spvNClamp(productValue279, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp(productValue280, 0.0, 1.0)))];
                                        float inverseLengthValue4 = inversesqrt(dot(vec3(productValue278, sumValue260, ViewCB.packedValues[90u].x), vec3(productValue278, sumValue260, ViewCB.packedValues[90u].x)));
                                        precise float productValue281 = productValue278 * inverseLengthValue4;
                                        precise float productValue282 = sumValue260 * inverseLengthValue4;
                                        precise float productValue283 = scalarValue53 * productValue281;
                                        precise float productValue284 = scalarValue53 * productValue282;
                                        branchMergedValue182 = productValue284;
                                        branchMergedValue185 = productValue283;
                                    }
                                    else
                                    {
                                        branchMergedValue182 = 0.0;
                                        branchMergedValue185 = 0.0;
                                    }
                                    branchMergedValue111 = branchMergedValue182;
                                    branchMergedValue133 = branchMergedValue185;
                                }
                                branchMergedValue32 = branchMergedValue111;
                                branchMergedValue71 = branchMergedValue133;
                            }
                            else
                            {
                                precise float productValue285 = scalarValue52 * (-1.0);
                                precise float sumValue261 = productValue285 + 2.0;
                                float scalarValue62 = spvNClamp(sumValue261, 0.0, 1.0);
                                float branchMergedValue112;
                                float branchMergedValue134;
                                if (scalarValue62 > 0.0)
                                {
                                    uint reinterpretedBits37;
                                    if (conditionValue5)
                                    {
                                        reinterpretedBits37 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits37 = scalarValue43;
                                    }
                                    uvec2 sampledTextureValue7 = uvec2(textureSize(textures[nonuniformEXT(reinterpretedBits37 + 0u)], int(0u)));
                                    precise float productValue286 = sumValue247 * float(int(uint(int(float(int(sampledTextureValue7.x))))));
                                    precise float productValue287 = sumValue248 * float(int(uint(int(float(int(sampledTextureValue7.y))))));
                                    vec4 sampledTextureValue8 = textureLod(nonuniformEXT(sampler2D(textures[sumValue176], defaultSampler)), vec2(sumValue247, sumValue248), 0.0);
                                    float scalarValue63 = fract(productValue286);
                                    float scalarValue64 = fract(productValue287);
                                    precise float sumValue262 = 1.0 - ViewCB.packedValues[89u].w;
                                    precise float productValue288 = sampledTextureValue8.y * 2.0;
                                    precise float sumValue263 = productValue288 + (-1.0);
                                    precise float comparisonValue38 = sumValue263 * ((scalarValue63 < sumValue262) ? 0.0 : 1.0);
                                    precise float productValue289 = sampledTextureValue8.w * 2.0;
                                    precise float sumValue264 = productValue289 + (-1.0);
                                    precise float comparisonValue39 = sumValue264 * ((ViewCB.packedValues[89u].w < scalarValue63) ? 0.0 : 1.0);
                                    precise float productValue290 = sampledTextureValue8.z * 2.0;
                                    precise float sumValue265 = productValue290 + (-1.0);
                                    precise float comparisonValue40 = sumValue265 * ((scalarValue64 < sumValue262) ? 0.0 : 1.0);
                                    precise float productValue291 = sampledTextureValue8.x * 2.0;
                                    precise float sumValue266 = productValue291 + (-1.0);
                                    precise float comparisonValue41 = sumValue266 * ((ViewCB.packedValues[89u].w < scalarValue64) ? 0.0 : 1.0);
                                    precise float sumValue267 = comparisonValue38 - comparisonValue39;
                                    precise float sumValue268 = comparisonValue40 - comparisonValue41;
                                    precise float comparisonValue43 = ((abs(sumValue267) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * sumValue267;
                                    precise float comparisonValue44 = ((abs(sumValue268) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * sumValue268;
                                    float inverseLengthValue5 = inversesqrt(dot(vec3(comparisonValue43, comparisonValue44, ViewCB.packedValues[90u].x), vec3(comparisonValue43, comparisonValue44, ViewCB.packedValues[90u].x)));
                                    precise float productValue292 = inverseLengthValue5 * comparisonValue43;
                                    precise float productValue293 = inverseLengthValue5 * comparisonValue44;
                                    precise float productValue294 = scalarValue62 * productValue292;
                                    precise float productValue295 = scalarValue62 * productValue293;
                                    branchMergedValue112 = productValue295;
                                    branchMergedValue134 = productValue294;
                                }
                                else
                                {
                                    branchMergedValue112 = 0.0;
                                    branchMergedValue134 = 0.0;
                                }
                                branchMergedValue32 = branchMergedValue112;
                                branchMergedValue71 = branchMergedValue134;
                            }
                            intermediateValue343 = branchMergedValue71;
                            intermediateValue344 = branchMergedValue32;
                        }
                        else
                        {
                            vec4 sampledTextureValue9 = textureLod(nonuniformEXT(sampler2D(textures[sumValue176], defaultSampler)), vec2(sumValue247, sumValue248), scalarValue52);
                            precise float productValue296 = sampledTextureValue9.x * 2.0;
                            precise float productValue297 = sampledTextureValue9.y * 2.0;
                            precise float sumValue269 = productValue296 + (-1.0);
                            precise float sumValue270 = productValue297 + (-1.0);
                            intermediateValue343 = sumValue269;
                            intermediateValue344 = sumValue270;
                        }
                        float dotProductValue3 = dot(vec3(intermediateValue307, intermediateValue309, intermediateValue311), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                        float productValue298 = (reinterpretedBits35 * 5.0) * ViewCB.packedValues[84u].w;
                        bool comparisonValue45 = (intermediateValue103 & 3221225472u) == 2147483648u;
                        precise float productValue299 = intermediateValue343 * 0.25;
                        precise float productValue300 = intermediateValue344 * 0.25;
                        float comparisonValue46 = comparisonValue45 ? productValue299 : intermediateValue343;
                        float comparisonValue47 = comparisonValue45 ? productValue300 : intermediateValue344;
                        precise float sumValue271 = (-0.0) - comparisonValue46;
                        precise float sumValue272 = (-0.0) - comparisonValue47;
                        float comparisonValue48 = dotProductValue ? sumValue271 : comparisonValue46;
                        float comparisonValue49 = dotProductValue ? sumValue272 : comparisonValue47;
                        precise float productValue301 = comparisonValue48 * comparisonValue48;
                        precise float sumValue273 = 1.0 - productValue301;
                        precise float productValue302 = comparisonValue49 * comparisonValue49;
                        precise float sumValue274 = sumValue273 - productValue302;
                        precise float productValue303 = productValue191 * comparisonValue48;
                        precise float productValue304 = productValue192 * comparisonValue48;
                        precise float productValue305 = productValue193 * comparisonValue48;
                        precise float productValue306 = productValue203 * comparisonValue49;
                        precise float productValue307 = productValue204 * comparisonValue49;
                        precise float productValue308 = productValue205 * comparisonValue49;
                        precise float sumValue275 = productValue303 + productValue306;
                        precise float sumValue276 = productValue304 + productValue307;
                        precise float sumValue277 = productValue305 + productValue308;
                        float nonlinearValue4 = spvNMax(sqrt(sumValue274), 0.00999999977648258209228515625);
                        precise float productValue309 = comparisonValue23 * nonlinearValue4;
                        precise float productValue310 = comparisonValue24 * nonlinearValue4;
                        precise float productValue311 = comparisonValue25 * nonlinearValue4;
                        precise float sumValue278 = sumValue275 + productValue309;
                        precise float sumValue279 = sumValue276 + productValue310;
                        precise float sumValue280 = sumValue277 + productValue311;
                        precise float dotProductValue4 = dot(vec3(intermediateValue36, intermediateValue38, intermediateValue40), vec3(sumValue278, sumValue279, sumValue280)) * 2.0;
                        precise float productValue312 = dotProductValue4 * sumValue278;
                        precise float productValue313 = dotProductValue4 * sumValue279;
                        precise float productValue314 = dotProductValue4 * sumValue280;
                        precise float sumValue281 = intermediateValue36 - productValue312;
                        precise float sumValue282 = intermediateValue38 - productValue313;
                        precise float sumValue283 = intermediateValue40 - productValue314;
                        precise float dotProductValue5 = dot(vec3(comparisonValue23, comparisonValue24, comparisonValue25), vec3(sumValue281, sumValue282, sumValue283));
                        float intermediateValue303;
                        float intermediateValue304;
                        float intermediateValue305;
                        if (dotProductValue5 < 0.0)
                        {
                            float dotProductValue6 = spvNMax(0.001000000047497451305389404296875, dot(vec3(sumValue278, sumValue279, sumValue280), vec3(comparisonValue23, comparisonValue24, comparisonValue25)));
                            precise float productValue315 = sumValue278 * dotProductValue5;
                            precise float productValue316 = sumValue279 * dotProductValue5;
                            precise float productValue317 = sumValue280 * dotProductValue5;
                            precise float quotientValue3 = productValue315 / dotProductValue6;
                            precise float quotientValue4 = productValue316 / dotProductValue6;
                            precise float quotientValue5 = productValue317 / dotProductValue6;
                            precise float sumValue284 = sumValue281 - quotientValue3;
                            precise float sumValue285 = sumValue282 - quotientValue4;
                            precise float sumValue286 = sumValue283 - quotientValue5;
                            float inverseLengthValue6 = inversesqrt(dot(vec3(sumValue284, sumValue285, sumValue286), vec3(sumValue284, sumValue285, sumValue286)));
                            precise float productValue318 = sumValue284 * inverseLengthValue6;
                            precise float productValue319 = sumValue285 * inverseLengthValue6;
                            precise float productValue320 = sumValue286 * inverseLengthValue6;
                            precise float sumValue287 = productValue318 - intermediateValue36;
                            precise float sumValue288 = productValue319 - intermediateValue38;
                            precise float sumValue289 = productValue320 - intermediateValue40;
                            float inverseLengthValue7 = inversesqrt(dot(vec3(sumValue287, sumValue288, sumValue289), vec3(sumValue287, sumValue288, sumValue289)));
                            precise float productValue321 = sumValue287 * inverseLengthValue7;
                            precise float productValue322 = sumValue288 * inverseLengthValue7;
                            precise float productValue323 = sumValue289 * inverseLengthValue7;
                            intermediateValue303 = productValue321;
                            intermediateValue304 = productValue322;
                            intermediateValue305 = productValue323;
                        }
                        else
                        {
                            intermediateValue303 = sumValue278;
                            intermediateValue304 = sumValue279;
                            intermediateValue305 = sumValue280;
                        }
                        precise float sumValue290 = 0.0 - reinterpretedBits36;
                        precise float productValue324 = sumValue290 * ViewCB.packedValues[85u].w;
                        precise float sumValue291 = reinterpretedBits36 + productValue324;
                        branchMergedValue28 = reinterpretedBits31;
                        branchMergedValue48 = intermediateValue302;
                        branchMergedValue49 = intermediateValue311;
                        branchMergedValue50 = intermediateValue309;
                        branchMergedValue51 = intermediateValue307;
                        branchMergedValue52 = (reinterpretedBits31 * (intermediateValue311 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                        branchMergedValue53 = (reinterpretedBits31 * (intermediateValue309 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                        branchMergedValue54 = (reinterpretedBits31 * (intermediateValue307 + (-0.039999999105930328369140625))) + 0.039999999105930328369140625;
                        branchMergedValue55 = productValue298 * (((dotProductValue3 - intermediateValue311) * ViewCB.packedValues[85u].x) + intermediateValue311);
                        branchMergedValue56 = productValue298 * (((dotProductValue3 - intermediateValue309) * ViewCB.packedValues[85u].x) + intermediateValue309);
                        branchMergedValue81 = productValue298 * (((dotProductValue3 - intermediateValue307) * ViewCB.packedValues[85u].x) + intermediateValue307);
                        branchMergedValue82 = intermediateValue305;
                        branchMergedValue83 = intermediateValue304;
                        branchMergedValue84 = intermediateValue303;
                        branchMergedValue85 = sumValue291;
                    }
                    else
                    {
                        branchMergedValue28 = intermediateValue14;
                        branchMergedValue48 = intermediateValue11;
                        branchMergedValue49 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue295) * 1.39999997615814208984375);
                        branchMergedValue50 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue294) * 1.39999997615814208984375);
                        branchMergedValue51 = exp2(log2(ViewCB.packedValues[98u].y * intermediateValue293) * 1.39999997615814208984375);
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
                    intermediateValue130 = branchMergedValue48;
                    intermediateValue131 = branchMergedValue28;
                    intermediateValue132 = branchMergedValue85;
                    intermediateValue133 = branchMergedValue84;
                    intermediateValue134 = branchMergedValue83;
                    intermediateValue135 = branchMergedValue82;
                    intermediateValue136 = branchMergedValue81;
                    intermediateValue137 = branchMergedValue56;
                    intermediateValue138 = branchMergedValue55;
                    intermediateValue139 = branchMergedValue54;
                    intermediateValue140 = branchMergedValue53;
                    intermediateValue141 = branchMergedValue52;
                    intermediateValue306 = branchMergedValue51;
                    intermediateValue308 = branchMergedValue50;
                    intermediateValue310 = branchMergedValue49;
                }
                else
                {
                    intermediateValue130 = intermediateValue11;
                    intermediateValue131 = intermediateValue14;
                    intermediateValue132 = intermediateValue16;
                    intermediateValue133 = intermediateValue18;
                    intermediateValue134 = intermediateValue20;
                    intermediateValue135 = intermediateValue22;
                    intermediateValue136 = intermediateValue24;
                    intermediateValue137 = intermediateValue26;
                    intermediateValue138 = intermediateValue28;
                    intermediateValue139 = intermediateValue30;
                    intermediateValue140 = intermediateValue32;
                    intermediateValue141 = intermediateValue34;
                    intermediateValue306 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue293) * 1.7999999523162841796875);
                    intermediateValue308 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue294) * 1.7999999523162841796875);
                    intermediateValue310 = exp2(log2(ViewCB.packedValues[98u].x * intermediateValue295) * 1.7999999523162841796875);
                }
                float comparisonValue50 = (int(intermediateValue103) > int(4294967295u)) ? 1.0 : intermediateValue130;
                float intermediateValue143;
                float intermediateValue145;
                float intermediateValue147;
                float intermediateValue149;
                float intermediateValue151;
                float intermediateValue153;
                float intermediateValue158;
                float intermediateValue160;
                float intermediateValue162;
                float intermediateValue164;
                float intermediateValue166;
                float intermediateValue168;
                if (intermediateValue103 > 3221225471u)
                {
                    precise float sumValue292 = sumValue144 - ViewCB.packedValues[68u].x;
                    precise float sumValue293 = sumValue150 - ViewCB.packedValues[68u].z;
                    precise float dotProductValue7 = sumValue174 / spvNMax(0.001000000047497451305389404296875, abs(dot(vec3(comparisonValue23, comparisonValue24, comparisonValue25), vec3(intermediateValue36, intermediateValue38, intermediateValue40))));
                    precise float sumValue294 = dotProductValue7 + (-0.00999999977648258209228515625);
                    precise float quotientValue6 = sumValue294 / 0.0199999995529651641845703125;
                    float scalarValue65 = spvNClamp(quotientValue6, 0.0, 1.0);
                    precise float productValue325 = scalarValue65 * 2.0;
                    precise float sumValue295 = 3.0 - productValue325;
                    precise float productValue326 = scalarValue65 * sumValue295;
                    precise float productValue327 = scalarValue65 * productValue326;
                    precise float sumValue296 = 1.0 - productValue327;
                    float intermediateValue317;
                    float intermediateValue318;
                    float intermediateValue319;
                    if (sumValue296 == 0.0)
                    {
                        intermediateValue317 = comparisonValue23;
                        intermediateValue318 = comparisonValue24;
                        intermediateValue319 = comparisonValue25;
                    }
                    else
                    {
                        precise float sumValue297 = sumValue147 - ViewCB.packedValues[68u].y;
                        bool comparisonValue51 = abs(float(comparisonValue24 < 0.9900000095367431640625)) != 0.0;
                        precise float productValue328 = comparisonValue24 * 0.0;
                        precise float sumValue298 = comparisonValue25 - productValue328;
                        precise float productValue329 = comparisonValue23 * 0.0;
                        precise float productValue330 = comparisonValue25 * 0.0;
                        precise float sumValue299 = productValue329 - productValue330;
                        precise float sumValue300 = productValue328 - comparisonValue23;
                        float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue298, sumValue299, sumValue300), vec3(sumValue298, sumValue299, sumValue300)));
                        precise float productValue331 = sumValue298 * inverseLengthValue8;
                        precise float productValue332 = sumValue299 * inverseLengthValue8;
                        precise float productValue333 = sumValue300 * inverseLengthValue8;
                        float comparisonValue52 = comparisonValue51 ? productValue331 : 1.0;
                        float comparisonValue53 = comparisonValue51 ? productValue332 : 0.0;
                        float comparisonValue54 = comparisonValue51 ? productValue333 : 0.0;
                        precise float productValue334 = comparisonValue24 * comparisonValue54;
                        precise float productValue335 = comparisonValue25 * comparisonValue53;
                        precise float sumValue301 = productValue334 - productValue335;
                        precise float productValue336 = comparisonValue25 * comparisonValue52;
                        precise float productValue337 = comparisonValue23 * comparisonValue54;
                        precise float sumValue302 = productValue336 - productValue337;
                        precise float productValue338 = comparisonValue23 * comparisonValue53;
                        precise float productValue339 = comparisonValue24 * comparisonValue52;
                        precise float sumValue303 = productValue338 - productValue339;
                        precise float productValue340 = sumValue297 * 0.100000001490116119384765625;
                        precise float dotProductValue8 = dot(vec3(sumValue292, productValue340, sumValue293), vec3(comparisonValue52, comparisonValue53, comparisonValue54));
                        precise float dotProductValue9 = dot(vec3(sumValue292, productValue340, sumValue293), vec3(sumValue301, sumValue302, sumValue303));
                        precise float productValue341 = dotProductValue8 * 0.60000002384185791015625;
                        precise float productValue342 = dotProductValue9 * 0.60000002384185791015625;
                        precise float productValue343 = ViewCB.packedValues[97u].z * 0.00999999977648258209228515625;
                        precise float productValue344 = ViewCB.packedValues[97u].z * 0.0199999995529651641845703125;
                        precise float productValue345 = productValue343 * 2.5;
                        precise float productValue346 = productValue344 * 2.5;
                        precise float sumValue304 = productValue341 + productValue345;
                        precise float sumValue305 = productValue342 + productValue346;
                        vec4 sampledTextureValue10 = textureLod(sampler2D(waterNormalsTexture, linearWrapSampler), vec2(sumValue304, sumValue305), 0.0);
                        precise float productValue347 = sampledTextureValue10.x * 2.0;
                        precise float productValue348 = sampledTextureValue10.y * 2.0;
                        precise float sumValue306 = productValue347 + (-1.0);
                        precise float sumValue307 = productValue348 + (-1.0);
                        precise float productValue349 = sumValue306 * 0.300000011920928955078125;
                        precise float productValue350 = sumValue307 * 0.300000011920928955078125;
                        precise float productValue351 = dotProductValue8 * 0.300000011920928955078125;
                        precise float productValue352 = dotProductValue9 * 0.300000011920928955078125;
                        precise float productValue353 = ViewCB.packedValues[97u].z * 0.0130000002682209014892578125;
                        precise float productValue354 = ViewCB.packedValues[97u].z * 0.01400000043213367462158203125;
                        precise float productValue355 = productValue353 * 2.5;
                        precise float productValue356 = productValue354 * 2.5;
                        precise float sumValue308 = productValue351 + productValue355;
                        precise float sumValue309 = productValue352 + productValue356;
                        vec4 sampledTextureValue11 = textureLod(sampler2D(waterNormalsTexture, linearWrapSampler), vec2(sumValue308, sumValue309), 0.0);
                        precise float productValue357 = sampledTextureValue11.x * 2.0;
                        precise float productValue358 = sampledTextureValue11.y * 2.0;
                        precise float sumValue310 = productValue357 + (-1.0);
                        precise float sumValue311 = productValue358 + (-1.0);
                        precise float productValue359 = sumValue310 * 0.5;
                        precise float productValue360 = sumValue311 * 0.5;
                        precise float productValue361 = dotProductValue8 * 0.61000001430511474609375;
                        precise float productValue362 = dotProductValue9 * 0.61000001430511474609375;
                        precise float productValue363 = ViewCB.packedValues[97u].z * (-0.00999999977648258209228515625);
                        precise float productValue364 = ViewCB.packedValues[97u].z * (-0.0199999995529651641845703125);
                        precise float productValue365 = productValue363 * 2.5;
                        precise float productValue366 = productValue364 * 2.5;
                        precise float sumValue312 = productValue361 + productValue365;
                        precise float sumValue313 = productValue362 + productValue366;
                        vec4 sampledTextureValue12 = textureLod(sampler2D(waterNormalsTexture, linearWrapSampler), vec2(sumValue312, sumValue313), 0.0);
                        precise float productValue367 = sampledTextureValue12.x * 2.0;
                        precise float productValue368 = sampledTextureValue12.y * 2.0;
                        precise float sumValue314 = productValue367 + (-1.0);
                        precise float sumValue315 = productValue368 + (-1.0);
                        precise float productValue369 = sumValue314 * 0.300000011920928955078125;
                        precise float productValue370 = sumValue315 * 0.300000011920928955078125;
                        precise float sumValue316 = productValue349 + productValue359;
                        precise float sumValue317 = productValue350 + productValue360;
                        precise float sumValue318 = sampledTextureValue10.z + sampledTextureValue11.z;
                        precise float sumValue319 = sumValue316 + productValue369;
                        precise float sumValue320 = sumValue317 + productValue370;
                        precise float sumValue321 = sumValue318 + sampledTextureValue12.z;
                        precise float productValue371 = sumValue296 * sumValue319;
                        precise float productValue372 = sumValue296 * sumValue320;
                        float inverseLengthValue9 = inversesqrt(dot(vec3(productValue371, productValue372, sumValue321), vec3(productValue371, productValue372, sumValue321)));
                        precise float productValue373 = inverseLengthValue9 * productValue371;
                        precise float productValue374 = inverseLengthValue9 * productValue372;
                        precise float productValue375 = sumValue321 * inverseLengthValue9;
                        precise float productValue376 = comparisonValue52 * productValue373;
                        precise float productValue377 = comparisonValue53 * productValue373;
                        precise float productValue378 = comparisonValue54 * productValue373;
                        precise float productValue379 = sumValue301 * productValue374;
                        precise float productValue380 = sumValue302 * productValue374;
                        precise float productValue381 = sumValue303 * productValue374;
                        precise float sumValue322 = productValue376 + productValue379;
                        precise float sumValue323 = productValue377 + productValue380;
                        precise float sumValue324 = productValue378 + productValue381;
                        precise float productValue382 = comparisonValue23 * productValue375;
                        precise float productValue383 = comparisonValue24 * productValue375;
                        precise float productValue384 = comparisonValue25 * productValue375;
                        precise float sumValue325 = productValue382 + sumValue322;
                        precise float sumValue326 = productValue383 + sumValue323;
                        precise float sumValue327 = productValue384 + sumValue324;
                        intermediateValue317 = sumValue325;
                        intermediateValue318 = sumValue326;
                        intermediateValue319 = sumValue327;
                    }
                    precise float productValue385 = comparisonValue50 * 0.5;
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
                    if ((floatBitsToUint(ViewCB.packedValues[54u]).w != 0u) && (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u))
                    {
                        precise float sumValue328 = (-0.0) - intermediateValue317;
                        precise float sumValue329 = (-0.0) - intermediateValue318;
                        precise float sumValue330 = (-0.0) - intermediateValue319;
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
                        if (dot(vec3(intermediateValue36, intermediateValue38, intermediateValue40), vec3(sumValue328, sumValue329, sumValue330)) < 0.65939998626708984375)
                        {
                            branchMergedValue109 = intermediateValue318;
                            branchMergedValue122 = 1.0;
                            branchMergedValue123 = 1.0;
                            branchMergedValue124 = 1.0;
                            branchMergedValue125 = 1.0;
                            branchMergedValue126 = 1.0;
                            branchMergedValue127 = 1.0;
                            branchMergedValue128 = 1.0;
                            branchMergedValue129 = intermediateValue319;
                            branchMergedValue130 = 1.0;
                            branchMergedValue145 = intermediateValue317;
                            branchMergedValue146 = 0.0;
                        }
                        else
                        {
                            branchMergedValue109 = intermediateValue318;
                            branchMergedValue122 = intermediateValue131;
                            branchMergedValue123 = intermediateValue310;
                            branchMergedValue124 = intermediateValue308;
                            branchMergedValue125 = intermediateValue306;
                            branchMergedValue126 = intermediateValue141;
                            branchMergedValue127 = intermediateValue140;
                            branchMergedValue128 = intermediateValue139;
                            branchMergedValue129 = intermediateValue319;
                            branchMergedValue130 = comparisonValue50;
                            branchMergedValue145 = intermediateValue317;
                            branchMergedValue146 = productValue385;
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
                        branchMergedValue29 = intermediateValue318;
                        branchMergedValue57 = intermediateValue131;
                        branchMergedValue58 = intermediateValue310;
                        branchMergedValue59 = intermediateValue308;
                        branchMergedValue60 = intermediateValue306;
                        branchMergedValue61 = intermediateValue141;
                        branchMergedValue62 = intermediateValue140;
                        branchMergedValue63 = intermediateValue139;
                        branchMergedValue64 = intermediateValue319;
                        branchMergedValue65 = comparisonValue50;
                        branchMergedValue86 = intermediateValue317;
                        branchMergedValue87 = productValue385;
                    }
                    intermediateValue143 = branchMergedValue65;
                    intermediateValue145 = branchMergedValue57;
                    intermediateValue147 = branchMergedValue87;
                    intermediateValue149 = branchMergedValue86;
                    intermediateValue151 = branchMergedValue29;
                    intermediateValue153 = branchMergedValue64;
                    intermediateValue158 = branchMergedValue63;
                    intermediateValue160 = branchMergedValue62;
                    intermediateValue162 = branchMergedValue61;
                    intermediateValue164 = branchMergedValue60;
                    intermediateValue166 = branchMergedValue59;
                    intermediateValue168 = branchMergedValue58;
                }
                else
                {
                    intermediateValue143 = comparisonValue50;
                    intermediateValue145 = intermediateValue131;
                    intermediateValue147 = intermediateValue132;
                    intermediateValue149 = intermediateValue133;
                    intermediateValue151 = intermediateValue134;
                    intermediateValue153 = intermediateValue135;
                    intermediateValue158 = intermediateValue139;
                    intermediateValue160 = intermediateValue140;
                    intermediateValue162 = intermediateValue141;
                    intermediateValue164 = intermediateValue306;
                    intermediateValue166 = intermediateValue308;
                    intermediateValue168 = intermediateValue310;
                }
                bitwiseValue32 = uint(dotProductValue) ^ 1u;
                multiplyAddValue = (sumValue144 - reinterpretedBits7.w) - fma(comparisonValue29, reinterpretedBits7.z, fma(comparisonValue28, reinterpretedBits7.y, comparisonValue27 * reinterpretedBits7.x));
                multiplyAddValue1 = (sumValue147 - reinterpretedBits8.w) - fma(comparisonValue29, reinterpretedBits8.z, fma(comparisonValue28, reinterpretedBits8.y, comparisonValue27 * reinterpretedBits8.x));
                multiplyAddValue2 = (sumValue150 - reinterpretedBits9.w) - fma(comparisonValue29, reinterpretedBits9.z, fma(comparisonValue28, reinterpretedBits9.y, comparisonValue27 * reinterpretedBits9.x));
                intermediateValue118 = intermediateValue119;
                intermediateValue120 = intermediateValue121;
                intermediateValue122 = intermediateValue123;
                intermediateValue124 = comparisonValue23;
                intermediateValue125 = comparisonValue24;
                intermediateValue126 = comparisonValue25;
                intermediateValue127 = sumValue144;
                intermediateValue128 = sumValue147;
                intermediateValue129 = sumValue150;
                intermediateValue12 = intermediateValue130;
                intermediateValue15 = intermediateValue131;
                intermediateValue17 = intermediateValue132;
                intermediateValue19 = intermediateValue133;
                intermediateValue21 = intermediateValue134;
                intermediateValue23 = intermediateValue135;
                intermediateValue25 = intermediateValue136;
                intermediateValue27 = intermediateValue137;
                intermediateValue29 = intermediateValue138;
                intermediateValue31 = intermediateValue139;
                intermediateValue33 = intermediateValue140;
                intermediateValue35 = intermediateValue141;
                intermediateValue142 = intermediateValue143;
                intermediateValue144 = intermediateValue145;
                intermediateValue146 = intermediateValue147;
                intermediateValue148 = intermediateValue149;
                intermediateValue150 = intermediateValue151;
                intermediateValue152 = intermediateValue153;
                intermediateValue154 = intermediateValue136;
                intermediateValue155 = intermediateValue137;
                intermediateValue156 = intermediateValue138;
                intermediateValue157 = intermediateValue158;
                intermediateValue159 = intermediateValue160;
                intermediateValue161 = intermediateValue162;
                intermediateValue163 = intermediateValue164;
                intermediateValue165 = intermediateValue166;
                intermediateValue167 = intermediateValue168;
                bitwiseValue4 = uint(((objectInstances.packedValues[productValue86] >> 8us) & 1us) ^ 1us);
            }
            else
            {
                bitwiseValue32 = 1u;
                multiplyAddValue = 0.0;
                multiplyAddValue1 = 0.0;
                multiplyAddValue2 = 0.0;
                intermediateValue118 = 0.0;
                intermediateValue120 = 0.0;
                intermediateValue122 = 0.0;
                intermediateValue124 = 0.0;
                intermediateValue125 = 0.0;
                intermediateValue126 = 0.0;
                intermediateValue127 = 0.0;
                intermediateValue128 = 0.0;
                intermediateValue129 = 0.0;
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
                intermediateValue142 = 0.0;
                intermediateValue144 = 0.0;
                intermediateValue146 = 0.0;
                intermediateValue148 = 0.0;
                intermediateValue150 = 0.0;
                intermediateValue152 = 0.0;
                intermediateValue154 = 0.0;
                intermediateValue155 = 0.0;
                intermediateValue156 = 0.0;
                intermediateValue157 = 0.0;
                intermediateValue159 = 0.0;
                intermediateValue161 = 0.0;
                intermediateValue163 = 0.0;
                intermediateValue165 = 0.0;
                intermediateValue167 = 0.0;
                bitwiseValue4 = intermediateValue52;
            }
            bool comparisonValue55 = intermediateValue67 != 1u;
            bool bitwiseValue126 = comparisonValue55 && comparisonValue7;
            if (!((!(intermediateValue101 < 10000.0)) || comparisonValue21))
            {
                outputVisibleBLASs.packedValues[uint(objectInstances.packedValues[(bitwiseValue53 * 76u) + 62u])] = floatBitsToUint(ViewCB.packedValues[84u]).z;
                comparisonValue5 = (intermediateValue73 == 0u) ? intermediateValue101 : intermediateValue53;
                sumValue21 = intermediateValue54 + intermediateValue101;
                intermediateValue360 = comparisonValue5;
                intermediateValue361 = sumValue21;
                float16_t exponentialValue3;
                float16_t exponentialValue4;
                float16_t exponentialValue5;
                if (bitwiseValue126)
                {
                    uint sumValue331 = intermediateValue67 + 63u;
                    float productValue386 = spvNMin(intermediateValue101, 50.0) * (-1.44269502162933349609375);
                    exponentialValue3 = float16_t(exp2(productValue386 * ViewCB.packedValues[sumValue331].x));
                    exponentialValue4 = float16_t(exp2(productValue386 * ViewCB.packedValues[sumValue331].y));
                    exponentialValue5 = float16_t(exp2(productValue386 * ViewCB.packedValues[sumValue331].z));
                }
                else
                {
                    exponentialValue3 = float16_t(1.0);
                    exponentialValue4 = float16_t(1.0);
                    exponentialValue5 = float16_t(1.0);
                }
                uint16_t bitwiseValue127 = objectInstances.packedValues[productValue89] >> 8us;
                uint scalarValue66 = uint(bitwiseValue127);
                if (!((bitwiseValue127 != 3us) && (sumValue21 >= ViewCB.packedValues[51u].z)))
                {
                    float16_t productValue124;
                    float16_t productValue126;
                    float16_t productValue128;
                    float16_t intermediateValue238;
                    float16_t intermediateValue240;
                    float16_t intermediateValue242;
                    uint intermediateValue244;
                    uint intermediateValue246;
                    uint intermediateValue247;
                    float intermediateValue248;
                    if ((intermediateValue144 == 1.0) && (intermediateValue146 < 0.00999999977648258209228515625))
                    {
                        intermediateValue200 = intermediateValue148;
                        intermediateValue202 = intermediateValue150;
                        intermediateValue204 = intermediateValue152;
                        intermediateValue206 = intermediateValue163;
                        intermediateValue208 = intermediateValue165;
                        intermediateValue210 = intermediateValue167;
                        intermediateValue49 = intermediateValue48;
                        intermediateValue51 = intermediateValue50;
                        productValue124 = float16_t(intermediateValue157) * intermediateValue55;
                        productValue126 = float16_t(intermediateValue159) * intermediateValue57;
                        productValue128 = float16_t(intermediateValue161) * intermediateValue59;
                        intermediateValue72 = intermediateValue71;
                        intermediateValue238 = exponentialValue3;
                        intermediateValue240 = exponentialValue4;
                        intermediateValue242 = exponentialValue5;
                        intermediateValue244 = scalarValue66;
                        intermediateValue246 = 1u;
                        intermediateValue247 = intermediateValue67;
                        intermediateValue248 = float(intermediateValue69);
                    }
                    else
                    {
                        float intermediateValue229;
                        float intermediateValue230;
                        float intermediateValue231;
                        float intermediateValue232;
                        float intermediateValue233;
                        float intermediateValue234;
                        uint intermediateValue245;
                        if ((bitwiseValue127 == 1us) && (intermediateValue142 >= 1.0))
                        {
                            intermediateValue229 = intermediateValue148;
                            intermediateValue230 = intermediateValue150;
                            intermediateValue231 = intermediateValue152;
                            intermediateValue232 = intermediateValue163;
                            intermediateValue233 = intermediateValue165;
                            intermediateValue234 = intermediateValue167;
                            intermediateValue245 = 4u;
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
                            if (comparisonValue6 && (bitwiseValue127 == 0us))
                            {
                                branchMergedValue19 = scalarValue66;
                                branchMergedValue33 = intermediateValue167;
                                branchMergedValue34 = intermediateValue165;
                                branchMergedValue35 = intermediateValue163;
                                branchMergedValue36 = intermediateValue126;
                                branchMergedValue37 = intermediateValue125;
                                branchMergedValue38 = intermediateValue124;
                            }
                            else
                            {
                                bool comparisonValue56 = bitwiseValue127 == 3us;
                                branchMergedValue19 = scalarValue66;
                                branchMergedValue33 = comparisonValue56 ? 1.0 : intermediateValue167;
                                branchMergedValue34 = comparisonValue56 ? 1.0 : intermediateValue165;
                                branchMergedValue35 = comparisonValue56 ? 1.0 : intermediateValue163;
                                branchMergedValue36 = intermediateValue152;
                                branchMergedValue37 = intermediateValue150;
                                branchMergedValue38 = intermediateValue148;
                            }
                            intermediateValue229 = branchMergedValue38;
                            intermediateValue230 = branchMergedValue37;
                            intermediateValue231 = branchMergedValue36;
                            intermediateValue232 = branchMergedValue35;
                            intermediateValue233 = branchMergedValue34;
                            intermediateValue234 = branchMergedValue33;
                            intermediateValue245 = branchMergedValue19;
                        }
                        uint comparisonValue34;
                        if (intermediateValue67 == intermediateValue245)
                        {
                            comparisonValue34 = 2u;
                        }
                        else
                        {
                            comparisonValue34 = ((bitwiseValue32 == 0u) && (intermediateValue245 == 3u)) ? intermediateValue67 : intermediateValue245;
                        }
                        precise float sumValue332 = (-0.0) - intermediateValue229;
                        precise float sumValue333 = (-0.0) - intermediateValue230;
                        precise float sumValue334 = (-0.0) - intermediateValue231;
                        precise float dotProductValue10 = dot(vec3(intermediateValue36, intermediateValue38, intermediateValue40), vec3(sumValue332, sumValue333, sumValue334));
                        uint productValue387 = comparisonValue34 + (intermediateValue67 * 5u);
                        float reinterpretedBits17 = uintBitsToFloat(checkerboardActionsBuffer_2.packedValues[(productValue387 * 3u) + 2u]);
                        float reinterpretedBits19 = uintBitsToFloat(refractionIndicesBuffer.packedValues[comparisonValue34]);
                        uint16_t comparisonValue42;
                        if (!(dotProductValue10 <= reinterpretedBits17))
                        {
                            comparisonValue42 = (intermediateValue71 == 0u) ? (comparisonValue2 ? checkerboardActionsBuffer.packedValues[productValue387 * 6u] : checkerboardActionsBuffer.packedValues[(productValue387 * 6u) + 1u]) : checkerboardActionsBuffer.packedValues[(productValue387 * 6u) + 2u];
                        }
                        else
                        {
                            comparisonValue42 = checkerboardActionsBuffer.packedValues[(productValue387 * 6u) + 3u];
                        }
                        uint scalarValue67 = uint(comparisonValue42);
                        precise float sumValue335 = dotProductValue10 + (-1.0);
                        precise float sumValue336 = 1.0 - reinterpretedBits17;
                        precise float quotientValue7 = sumValue335 / sumValue336;
                        precise float sumValue337 = quotientValue7 + 1.0;
                        float scalarValue68 = float(intermediateValue69);
                        precise float sumValue338 = reinterpretedBits19 - scalarValue68;
                        precise float sumValue339 = scalarValue68 + reinterpretedBits19;
                        precise float quotientValue8 = sumValue338 / sumValue339;
                        precise float productValue388 = quotientValue8 * quotientValue8;
                        precise float sumValue340 = 1.0 - productValue388;
                        precise float sumValue341 = 1.0 - spvNClamp(sumValue337, 0.0, 1.0);
                        precise float nonlinearValue5 = log2(sumValue341) * 5.0;
                        precise float exponentialValue6 = sumValue340 * exp2(nonlinearValue5);
                        precise float sumValue342 = productValue388 + exponentialValue6;
                        float scalarValue69 = spvNClamp(sumValue342, 0.0, 1.0);
                        uint intermediateValue237;
                        float16_t intermediateValue273;
                        float16_t intermediateValue274;
                        float16_t intermediateValue275;
                        uint intermediateValue276;
                        if ((scalarValue67 & 16u) == 0u)
                        {
                            intermediateValue273 = intermediateValue55;
                            intermediateValue274 = intermediateValue57;
                            intermediateValue275 = intermediateValue59;
                            intermediateValue237 = intermediateValue71;
                            intermediateValue276 = scalarValue67;
                        }
                        else
                        {
                            precise float productValue389 = intermediateValue125 * intermediateValue125;
                            bool dotProductValue11 = productValue389 < dot(vec2(intermediateValue124, intermediateValue126), vec2(intermediateValue124, intermediateValue126));
                            uint intermediateValue286;
                            if (intermediateValue245 == 1u)
                            {
                                uint branchMergedValue23;
                                if (dotProductValue11)
                                {
                                    uint branchMergedValue108;
                                    if (intermediateValue142 > 0.20000000298023223876953125)
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
                                intermediateValue286 = branchMergedValue23;
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
                                intermediateValue286 = branchMergedValue24;
                            }
                            intermediateValue273 = intermediateValue55 * float16_t(2.0);
                            intermediateValue274 = intermediateValue57 * float16_t(2.0);
                            intermediateValue275 = intermediateValue59 * float16_t(2.0);
                            intermediateValue237 = intermediateValue286 | (intermediateValue73 + 1u);
                            intermediateValue276 = scalarValue67 & 65519u;
                        }
                        uint intermediateValue235;
                        float intermediateValue236;
                        float16_t intermediateValue239;
                        float16_t intermediateValue241;
                        float16_t intermediateValue243;
                        uint intermediateValue280;
                        if ((intermediateValue276 & 32u) == 0u)
                        {
                            intermediateValue235 = intermediateValue48;
                            intermediateValue236 = intermediateValue50;
                            intermediateValue239 = exponentialValue3;
                            intermediateValue241 = exponentialValue4;
                            intermediateValue243 = exponentialValue5;
                            intermediateValue280 = intermediateValue276;
                        }
                        else
                        {
                            float productValue267;
                            if (intermediateValue50 > 0.0)
                            {
                                productValue267 = 1.0 - (float(exponentialValue3) * (1.0 - intermediateValue50));
                            }
                            else
                            {
                                productValue267 = float(float16_t(1.0) - exponentialValue3);
                            }
                            intermediateValue235 = 1u;
                            intermediateValue236 = productValue267;
                            intermediateValue239 = float16_t(1.0);
                            intermediateValue241 = float16_t(1.0);
                            intermediateValue243 = float16_t(1.0);
                            intermediateValue280 = intermediateValue276 & 65503u;
                        }
                        uint intermediateValue285;
                        if (intermediateValue280 == 3u)
                        {
                            uint branchMergedValue22;
                            if (scalarValue69 > 0.5)
                            {
                                branchMergedValue22 = 1u;
                            }
                            else
                            {
                                branchMergedValue22 = 2u;
                            }
                            intermediateValue285 = branchMergedValue22;
                        }
                        else
                        {
                            intermediateValue285 = intermediateValue280;
                        }
                        uint comparisonValue57 = (((intermediateValue144 < 1.0) || (intermediateValue146 > 0.00999999977648258209228515625)) && ((comparisonValue34 == 1u) && (comparisonValue55 && (intermediateValue285 == 1u)))) ? 0u : intermediateValue285;
                        bool comparisonValue58 = comparisonValue57 == 1u;
                        float16_t productValue125;
                        float16_t productValue127;
                        float16_t productValue129;
                        if (((intermediateValue245 | intermediateValue67) == 0u) && comparisonValue58)
                        {
                            float16_t productValue390 = float16_t((intermediateValue146 * 4.0) + 0.85000002384185791015625);
                            productValue125 = intermediateValue273 * productValue390;
                            productValue127 = intermediateValue274 * productValue390;
                            productValue129 = intermediateValue275 * productValue390;
                        }
                        else
                        {
                            productValue125 = intermediateValue273;
                            productValue127 = intermediateValue274;
                            productValue129 = intermediateValue275;
                        }
                        uint branchMergedValue21;
                        float branchMergedValue39;
                        uint branchMergedValue40;
                        float16_t branchMergedValue41;
                        uint branchMergedValue42;
                        float16_t branchMergedValue43;
                        float16_t branchMergedValue44;
                        float16_t branchMergedValue45;
                        uint branchMergedValue46;
                        float16_t branchMergedValue47;
                        float16_t branchMergedValue72;
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
                            float16_t scalarValue70 = float16_t(scalarValue69);
                            branchMergedValue21 = 1u;
                            branchMergedValue39 = reinterpretedBits19;
                            branchMergedValue40 = comparisonValue34;
                            branchMergedValue41 = productValue125 * scalarValue70;
                            branchMergedValue42 = intermediateValue245;
                            branchMergedValue43 = intermediateValue243;
                            branchMergedValue44 = intermediateValue241;
                            branchMergedValue45 = intermediateValue239;
                            branchMergedValue46 = intermediateValue237;
                            branchMergedValue47 = productValue129 * scalarValue70;
                            branchMergedValue72 = productValue127 * scalarValue70;
                            branchMergedValue73 = intermediateValue236;
                            branchMergedValue74 = intermediateValue235;
                            branchMergedValue75 = intermediateValue234;
                            branchMergedValue76 = intermediateValue233;
                            branchMergedValue77 = intermediateValue232;
                            branchMergedValue78 = intermediateValue231;
                            branchMergedValue79 = intermediateValue230;
                            branchMergedValue80 = intermediateValue229;
                        }
                        else
                        {
                            uint branchMergedValue106;
                            float branchMergedValue113;
                            uint branchMergedValue114;
                            float16_t branchMergedValue115;
                            uint branchMergedValue116;
                            float16_t branchMergedValue117;
                            float16_t branchMergedValue118;
                            float16_t branchMergedValue119;
                            uint branchMergedValue120;
                            float16_t branchMergedValue121;
                            float16_t branchMergedValue135;
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
                                float16_t scalarValue71 = float16_t(1.0 - scalarValue69);
                                branchMergedValue106 = 2u;
                                branchMergedValue113 = reinterpretedBits19;
                                branchMergedValue114 = comparisonValue34;
                                branchMergedValue115 = productValue125 * scalarValue71;
                                branchMergedValue116 = intermediateValue245;
                                branchMergedValue117 = intermediateValue243;
                                branchMergedValue118 = intermediateValue241;
                                branchMergedValue119 = intermediateValue239;
                                branchMergedValue120 = intermediateValue237;
                                branchMergedValue121 = productValue129 * scalarValue71;
                                branchMergedValue135 = productValue127 * scalarValue71;
                                branchMergedValue136 = intermediateValue236;
                                branchMergedValue137 = intermediateValue235;
                                branchMergedValue138 = intermediateValue234;
                                branchMergedValue139 = intermediateValue233;
                                branchMergedValue140 = intermediateValue232;
                                branchMergedValue141 = intermediateValue231;
                                branchMergedValue142 = intermediateValue230;
                                branchMergedValue143 = intermediateValue229;
                            }
                            else
                            {
                                branchMergedValue106 = comparisonValue57;
                                branchMergedValue113 = reinterpretedBits19;
                                branchMergedValue114 = comparisonValue34;
                                branchMergedValue115 = productValue125;
                                branchMergedValue116 = intermediateValue245;
                                branchMergedValue117 = intermediateValue243;
                                branchMergedValue118 = intermediateValue241;
                                branchMergedValue119 = intermediateValue239;
                                branchMergedValue120 = intermediateValue237;
                                branchMergedValue121 = productValue129;
                                branchMergedValue135 = productValue127;
                                branchMergedValue136 = intermediateValue236;
                                branchMergedValue137 = intermediateValue235;
                                branchMergedValue138 = intermediateValue234;
                                branchMergedValue139 = intermediateValue233;
                                branchMergedValue140 = intermediateValue232;
                                branchMergedValue141 = intermediateValue231;
                                branchMergedValue142 = intermediateValue230;
                                branchMergedValue143 = intermediateValue229;
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
                        intermediateValue200 = branchMergedValue80;
                        intermediateValue202 = branchMergedValue79;
                        intermediateValue204 = branchMergedValue78;
                        intermediateValue206 = branchMergedValue77;
                        intermediateValue208 = branchMergedValue76;
                        intermediateValue210 = branchMergedValue75;
                        intermediateValue49 = branchMergedValue74;
                        intermediateValue51 = branchMergedValue73;
                        productValue124 = branchMergedValue41;
                        productValue126 = branchMergedValue72;
                        productValue128 = branchMergedValue47;
                        intermediateValue72 = branchMergedValue46;
                        intermediateValue238 = branchMergedValue45;
                        intermediateValue240 = branchMergedValue44;
                        intermediateValue242 = branchMergedValue43;
                        intermediateValue244 = branchMergedValue42;
                        intermediateValue246 = branchMergedValue21;
                        intermediateValue247 = branchMergedValue40;
                        intermediateValue248 = branchMergedValue39;
                    }
                    float16_t productValue391 = intermediateValue238 * productValue124;
                    float16_t productValue392 = intermediateValue240 * productValue126;
                    float16_t productValue393 = intermediateValue242 * productValue128;
                    float branchMergedValue;
                    float branchMergedValue1;
                    float16_t branchMergedValue2;
                    uint branchMergedValue3;
                    float16_t branchMergedValue4;
                    float16_t branchMergedValue5;
                    float16_t branchMergedValue6;
                    float16_t branchMergedValue7;
                    float16_t branchMergedValue8;
                    float16_t branchMergedValue9;
                    float branchMergedValue11;
                    float branchMergedValue12;
                    float branchMergedValue13;
                    float branchMergedValue14;
                    if (intermediateValue246 == 1u)
                    {
                        float scalarValue72 = dot(vec3(intermediateValue124, intermediateValue125, intermediateValue126), vec3(intermediateValue36, intermediateValue38, intermediateValue40));
                        float sumValue343 = float(int(uint(scalarValue72 > 0.0) - uint(scalarValue72 < 0.0)));
                        float productValue394 = sumValue343 * intermediateValue124;
                        float productValue395 = sumValue343 * intermediateValue125;
                        float productValue396 = sumValue343 * intermediateValue126;
                        uint productValue397 = uint(int(productValue394 * (-256.0)));
                        uint productValue398 = uint(int(productValue395 * (-256.0)));
                        uint productValue399 = uint(int(productValue396 * (-256.0)));
                        precise float dotProductValue12 = dot(vec3(intermediateValue36, intermediateValue38, intermediateValue40), vec3(intermediateValue200, intermediateValue202, intermediateValue204)) * 2.0;
                        precise float productValue400 = intermediateValue200 * dotProductValue12;
                        precise float productValue401 = intermediateValue202 * dotProductValue12;
                        precise float productValue402 = intermediateValue204 * dotProductValue12;
                        precise float sumValue344 = intermediateValue36 - productValue400;
                        precise float sumValue345 = intermediateValue38 - productValue401;
                        precise float sumValue346 = intermediateValue40 - productValue402;
                        float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue344, sumValue345, sumValue346), vec3(sumValue344, sumValue345, sumValue346)));
                        precise float productValue403 = inverseLengthValue10 * sumValue344;
                        precise float productValue404 = inverseLengthValue10 * sumValue345;
                        precise float productValue405 = inverseLengthValue10 * sumValue346;
                        precise float dotProductValue13 = dot(vec3(productValue403, productValue404, productValue405), vec3(intermediateValue124, intermediateValue125, intermediateValue126));
                        float intermediateValue260;
                        float intermediateValue261;
                        float intermediateValue262;
                        if (!(dotProductValue13 <= 0.0))
                        {
                            intermediateValue260 = productValue403;
                            intermediateValue261 = productValue404;
                            intermediateValue262 = productValue405;
                        }
                        else
                        {
                            precise float productValue406 = dotProductValue13 * 2.0;
                            precise float productValue407 = intermediateValue124 * productValue406;
                            precise float productValue408 = intermediateValue125 * productValue406;
                            precise float productValue409 = intermediateValue126 * productValue406;
                            precise float sumValue347 = productValue403 - productValue407;
                            precise float sumValue348 = productValue404 - productValue408;
                            precise float sumValue349 = productValue405 - productValue409;
                            float inverseLengthValue11 = inversesqrt(dot(vec3(sumValue347, sumValue348, sumValue349), vec3(sumValue347, sumValue348, sumValue349)));
                            precise float productValue410 = sumValue347 * inverseLengthValue11;
                            precise float productValue411 = sumValue348 * inverseLengthValue11;
                            precise float productValue412 = sumValue349 * inverseLengthValue11;
                            intermediateValue260 = productValue410;
                            intermediateValue261 = productValue411;
                            intermediateValue262 = productValue412;
                        }
                        branchMergedValue = intermediateValue261;
                        branchMergedValue1 = intermediateValue260;
                        branchMergedValue2 = intermediateValue69;
                        branchMergedValue3 = intermediateValue67;
                        branchMergedValue4 = float16_t(1.0 - ((intermediateValue126 * intermediateValue126) * 2.0)) * intermediateValue65;
                        branchMergedValue5 = float16_t(1.0 - ((intermediateValue125 * intermediateValue125) * 2.0)) * intermediateValue63;
                        branchMergedValue6 = float16_t(1.0 - ((intermediateValue124 * intermediateValue124) * 2.0)) * intermediateValue61;
                        branchMergedValue7 = productValue391;
                        branchMergedValue8 = productValue393;
                        branchMergedValue9 = productValue392;
                        branchMergedValue11 = (abs(intermediateValue129) < 0.03125) ? (intermediateValue129 - (productValue396 * 1.52587890625e-05)) : uintBitsToFloat(((intermediateValue129 < 0.0) ? (-productValue399) : productValue399) + floatBitsToUint(intermediateValue129));
                        branchMergedValue12 = (abs(intermediateValue128) < 0.03125) ? (intermediateValue128 - (productValue395 * 1.52587890625e-05)) : uintBitsToFloat(((intermediateValue128 < 0.0) ? (-productValue398) : productValue398) + floatBitsToUint(intermediateValue128));
                        branchMergedValue13 = (abs(intermediateValue127) < 0.03125) ? (intermediateValue127 - (productValue394 * 1.52587890625e-05)) : uintBitsToFloat(((intermediateValue127 < 0.0) ? (-productValue397) : productValue397) + floatBitsToUint(intermediateValue127));
                        branchMergedValue14 = intermediateValue262;
                    }
                    else
                    {
                        float branchMergedValue88;
                        float branchMergedValue89;
                        float16_t branchMergedValue90;
                        uint branchMergedValue91;
                        float16_t branchMergedValue92;
                        float16_t branchMergedValue93;
                        float16_t branchMergedValue94;
                        float16_t branchMergedValue95;
                        float16_t branchMergedValue96;
                        float16_t branchMergedValue97;
                        float branchMergedValue98;
                        float branchMergedValue99;
                        float branchMergedValue100;
                        float branchMergedValue101;
                        if (intermediateValue246 == 2u)
                        {
                            float scalarValue73 = dot(vec3(intermediateValue124, intermediateValue125, intermediateValue126), vec3(intermediateValue36, intermediateValue38, intermediateValue40));
                            float sumValue350 = float(int(uint(scalarValue73 > 0.0) - uint(scalarValue73 < 0.0)));
                            float comparisonValue59 = (((intermediateValue67 != 0u) && (intermediateValue244 == 1u)) && (intermediateValue247 != 0u)) ? ((-0.0) - sumValue350) : sumValue350;
                            float productValue413 = comparisonValue59 * intermediateValue124;
                            float productValue414 = comparisonValue59 * intermediateValue125;
                            float productValue415 = comparisonValue59 * intermediateValue126;
                            uint productValue416 = uint(int(productValue413 * 256.0));
                            uint productValue417 = uint(int(productValue414 * 256.0));
                            uint productValue418 = uint(int(productValue415 * 256.0));
                            float reinterpretedBits20 = (abs(intermediateValue127) < 0.03125) ? ((productValue413 * 1.52587890625e-05) + intermediateValue127) : uintBitsToFloat(((intermediateValue127 < 0.0) ? (-productValue416) : productValue416) + floatBitsToUint(intermediateValue127));
                            float reinterpretedBits21 = (abs(intermediateValue128) < 0.03125) ? ((productValue414 * 1.52587890625e-05) + intermediateValue128) : uintBitsToFloat(((intermediateValue128 < 0.0) ? (-productValue417) : productValue417) + floatBitsToUint(intermediateValue128));
                            float reinterpretedBits23 = (abs(intermediateValue129) < 0.03125) ? ((productValue415 * 1.52587890625e-05) + intermediateValue129) : uintBitsToFloat(((intermediateValue129 < 0.0) ? (-productValue418) : productValue418) + floatBitsToUint(intermediateValue129));
                            precise float quotientValue9 = float(intermediateValue69) / intermediateValue248;
                            precise float dotProductValue14 = dot(vec3(intermediateValue36, intermediateValue38, intermediateValue40), vec3(intermediateValue200, intermediateValue202, intermediateValue204));
                            precise float productValue419 = quotientValue9 * quotientValue9;
                            precise float productValue420 = dotProductValue14 * dotProductValue14;
                            precise float sumValue351 = 1.0 - productValue420;
                            precise float productValue421 = productValue419 * sumValue351;
                            precise float sumValue352 = 1.0 - productValue421;
                            bool comparisonValue60 = sumValue352 >= 0.0;
                            precise float productValue422 = intermediateValue36 * quotientValue9;
                            precise float productValue423 = intermediateValue38 * quotientValue9;
                            precise float productValue424 = intermediateValue40 * quotientValue9;
                            precise float productValue425 = quotientValue9 * dotProductValue14;
                            precise float nonlinearValue6 = productValue425 + sqrt(sumValue352);
                            precise float productValue426 = intermediateValue200 * nonlinearValue6;
                            precise float productValue427 = intermediateValue202 * nonlinearValue6;
                            precise float productValue428 = intermediateValue204 * nonlinearValue6;
                            precise float sumValue353 = productValue422 - productValue426;
                            precise float sumValue354 = productValue423 - productValue427;
                            precise float sumValue355 = productValue424 - productValue428;
                            float comparisonValue61 = comparisonValue60 ? sumValue353 : 0.0;
                            float comparisonValue62 = comparisonValue60 ? sumValue354 : 0.0;
                            float comparisonValue63 = comparisonValue60 ? sumValue355 : 0.0;
                            float inverseLengthValue12 = inversesqrt(dot(vec3(comparisonValue61, comparisonValue62, comparisonValue63), vec3(comparisonValue61, comparisonValue62, comparisonValue63)));
                            precise float productValue429 = inverseLengthValue12 * comparisonValue61;
                            precise float productValue430 = inverseLengthValue12 * comparisonValue62;
                            precise float productValue431 = inverseLengthValue12 * comparisonValue63;
                            float16_t scalarValue74 = float16_t(intermediateValue248);
                            float branchMergedValue144;
                            float branchMergedValue147;
                            float16_t branchMergedValue148;
                            uint branchMergedValue149;
                            float16_t branchMergedValue150;
                            float16_t branchMergedValue151;
                            float16_t branchMergedValue152;
                            float16_t branchMergedValue153;
                            float16_t branchMergedValue154;
                            float16_t branchMergedValue155;
                            float branchMergedValue156;
                            float branchMergedValue157;
                            float branchMergedValue158;
                            float branchMergedValue159;
                            if (comparisonValue6 || (intermediateValue247 == 1u))
                            {
                                branchMergedValue144 = productValue430;
                                branchMergedValue147 = productValue429;
                                branchMergedValue148 = scalarValue74;
                                branchMergedValue149 = intermediateValue247;
                                branchMergedValue150 = intermediateValue65;
                                branchMergedValue151 = intermediateValue63;
                                branchMergedValue152 = intermediateValue61;
                                branchMergedValue153 = productValue391 * float16_t(intermediateValue206 - (intermediateValue206 * intermediateValue142));
                                branchMergedValue154 = productValue393 * float16_t(intermediateValue210 - (intermediateValue210 * intermediateValue142));
                                branchMergedValue155 = productValue392 * float16_t(intermediateValue208 - (intermediateValue208 * intermediateValue142));
                                branchMergedValue156 = reinterpretedBits23;
                                branchMergedValue157 = reinterpretedBits21;
                                branchMergedValue158 = reinterpretedBits20;
                                branchMergedValue159 = productValue431;
                            }
                            else
                            {
                                branchMergedValue144 = productValue430;
                                branchMergedValue147 = productValue429;
                                branchMergedValue148 = scalarValue74;
                                branchMergedValue149 = intermediateValue247;
                                branchMergedValue150 = intermediateValue65;
                                branchMergedValue151 = intermediateValue63;
                                branchMergedValue152 = intermediateValue61;
                                branchMergedValue153 = productValue391;
                                branchMergedValue154 = productValue393;
                                branchMergedValue155 = productValue392;
                                branchMergedValue156 = reinterpretedBits23;
                                branchMergedValue157 = reinterpretedBits21;
                                branchMergedValue158 = reinterpretedBits20;
                                branchMergedValue159 = productValue431;
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
                            if (!(intermediateValue246 == 4u))
                            {
                                bool conditionValue8 = intermediateValue246 == 5u;
                                branchMergedValue107 = false;
                                branchMergedValue160 = true;
                                branchMergedValue161 = intermediateValue200;
                                branchMergedValue162 = intermediateValue73;
                                branchMergedValue163 = intermediateValue72;
                                branchMergedValue164 = intermediateValue67;
                                branchMergedValue165 = intermediateValue65;
                                branchMergedValue166 = intermediateValue63;
                                branchMergedValue167 = intermediateValue61;
                                branchMergedValue168 = productValue393;
                                branchMergedValue169 = productValue392;
                                branchMergedValue170 = productValue391;
                                branchMergedValue171 = conditionValue8 ? (-1.0) : intermediateValue51;
                                branchMergedValue172 = conditionValue8 ? 1u : intermediateValue49;
                                branchMergedValue173 = intermediateValue40;
                                branchMergedValue174 = intermediateValue38;
                                branchMergedValue175 = intermediateValue36;
                                branchMergedValue176 = intermediateValue210;
                                branchMergedValue177 = intermediateValue208;
                                branchMergedValue178 = intermediateValue206;
                                branchMergedValue179 = intermediateValue204;
                                branchMergedValue180 = intermediateValue202;
                                break;
                            }
                            float dotProductValue15 = dot(vec3(intermediateValue124, intermediateValue125, intermediateValue126), vec3(intermediateValue36, intermediateValue38, intermediateValue40));
                            float sumValue356 = float(int(uint(dotProductValue15 > 0.0) - uint(dotProductValue15 < 0.0)));
                            float inverseLengthValue13 = inversesqrt(dot(vec3(intermediateValue36, intermediateValue38, intermediateValue40), vec3(intermediateValue36, intermediateValue38, intermediateValue40)));
                            precise float productValue432 = intermediateValue36 * inverseLengthValue13;
                            precise float productValue433 = intermediateValue38 * inverseLengthValue13;
                            precise float productValue434 = intermediateValue40 * inverseLengthValue13;
                            branchMergedValue88 = productValue433;
                            branchMergedValue89 = productValue432;
                            branchMergedValue90 = float16_t(intermediateValue248);
                            branchMergedValue91 = intermediateValue247;
                            branchMergedValue92 = intermediateValue65;
                            branchMergedValue93 = intermediateValue63;
                            branchMergedValue94 = intermediateValue61;
                            branchMergedValue95 = productValue391;
                            branchMergedValue96 = productValue393;
                            branchMergedValue97 = productValue392;
                            branchMergedValue98 = fma(sumValue356 * intermediateValue126, 0.00999999977648258209228515625, intermediateValue129);
                            branchMergedValue99 = fma(sumValue356 * intermediateValue125, 0.00999999977648258209228515625, intermediateValue128);
                            branchMergedValue100 = fma(sumValue356 * intermediateValue124, 0.00999999977648258209228515625, intermediateValue127);
                            branchMergedValue101 = productValue434;
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
                    uint sumValue357 = intermediateValue73 + 1u;
                    if (sumValue357 < 8u)
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
                        intermediateValue73 = sumValue357;
                        continue;
                    }
                    else
                    {
                        branchMergedValue107 = false;
                        branchMergedValue160 = false;
                        branchMergedValue161 = intermediateValue200;
                        branchMergedValue162 = sumValue357;
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
                        branchMergedValue176 = intermediateValue210;
                        branchMergedValue177 = intermediateValue208;
                        branchMergedValue178 = intermediateValue206;
                        branchMergedValue179 = intermediateValue204;
                        branchMergedValue180 = intermediateValue202;
                        break;
                    }
                }
                branchMergedValue107 = false;
                branchMergedValue160 = true;
                branchMergedValue161 = intermediateValue148;
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
                branchMergedValue176 = intermediateValue167;
                branchMergedValue177 = intermediateValue165;
                branchMergedValue178 = intermediateValue163;
                branchMergedValue179 = intermediateValue152;
                branchMergedValue180 = intermediateValue150;
                break;
            }
            float16_t exponentialValue;
            float16_t exponentialValue1;
            float16_t exponentialValue2;
            if (bitwiseValue126)
            {
                uint sumValue358 = intermediateValue67 + 63u;
                exponentialValue = float16_t(exp2(ViewCB.packedValues[sumValue358].x * (-72.1347503662109375))) * intermediateValue55;
                exponentialValue1 = float16_t(exp2(ViewCB.packedValues[sumValue358].y * (-72.1347503662109375))) * intermediateValue57;
                exponentialValue2 = float16_t(exp2(ViewCB.packedValues[sumValue358].z * (-72.1347503662109375))) * intermediateValue59;
            }
            else
            {
                exponentialValue = intermediateValue55;
                exponentialValue1 = intermediateValue57;
                exponentialValue2 = intermediateValue59;
            }
            float productValue75;
            float productValue76;
            float productValue77;
            if (comparisonValue21)
            {
                float reinterpretedBits24 = uintBitsToFloat(inputIncidentLight.packedValues[0u]);
                productValue75 = reinterpretedBits24 * intermediateValue163;
                productValue76 = reinterpretedBits24 * intermediateValue165;
                productValue77 = reinterpretedBits24 * intermediateValue167;
            }
            else
            {
                productValue75 = 0.0;
                productValue76 = 0.0;
                productValue77 = 0.0;
            }
            float comparisonValue64 = (intermediateValue73 == 0u) ? 65504.0 : intermediateValue53;
            imageStore(outputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(65504.0));
            float comparisonValue65 = ((intermediateValue73 & 1u) != 0u) ? ((-0.0) - comparisonValue64) : comparisonValue64;
            imageStore(outputPrimaryWorldPosition, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(productValue75, productValue76, productValue77, comparisonValue65));
            imageStore(outputBufferPrimaryPosLowPrecision, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(productValue75, productValue76, productValue77, comparisonValue65));
            imageStore(outputPrimaryViewDirection, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue36, intermediateValue38, intermediateValue40, float(int(intermediateValue67))));
            imageStore(outputPrimaryThroughput, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(float(exponentialValue), float(exponentialValue1), float(exponentialValue2), float((intermediateValue73 << 4u) | intermediateValue71)));
            imageStore(outputBufferIncomingIrradianceCache, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(1.0, 1.0, 1.0, (intermediateValue48 != 0u) ? intermediateValue50 : 0.5));
            imageStore(outputBufferEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 0.0, 0.0, 1.0));
            imageStore(outputPlaneIdentifier, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), ivec4(uvec4(0u)));
            float multiplyAddValue3 = fma(productValue27, ViewCB.packedValues[6u].w, fma(productValue26, ViewCB.packedValues[5u].w, ViewCB.packedValues[4u].w * productValue25));
            float multiplyAddValue4 = fma(productValue27, ViewCB.packedValues[26u].w, fma(productValue26, ViewCB.packedValues[25u].w, ViewCB.packedValues[24u].w * productValue25));
            float intermediateValue197;
            float intermediateValue198;
            if ((multiplyAddValue3 <= 0.0) || (multiplyAddValue4 <= 0.0))
            {
                intermediateValue197 = 0.0;
                intermediateValue198 = 0.0;
            }
            else
            {
                intermediateValue197 = ((fma(productValue27, ViewCB.packedValues[26u].x, fma(productValue26, ViewCB.packedValues[25u].x, ViewCB.packedValues[24u].x * productValue25)) / multiplyAddValue4) - (fma(productValue27, ViewCB.packedValues[6u].x, fma(productValue26, ViewCB.packedValues[5u].x, ViewCB.packedValues[4u].x * productValue25)) / multiplyAddValue3)) * 0.5;
                intermediateValue198 = ((fma(productValue27, ViewCB.packedValues[26u].y, fma(productValue26, ViewCB.packedValues[25u].y, ViewCB.packedValues[24u].y * productValue25)) / multiplyAddValue4) - (fma(productValue27, ViewCB.packedValues[6u].y, fma(productValue26, ViewCB.packedValues[5u].y, ViewCB.packedValues[4u].y * productValue25)) / multiplyAddValue3)) * (-0.5);
            }
            imageStore(outputBufferMotionVectors, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue197, intermediateValue198, intermediateValue197, intermediateValue197));
            imageStore(outputBufferReprojectedPathLength, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(65504.0));
            branchMergedValue107 = true;
            branchMergedValue160 = intermediateValue362;
            branchMergedValue161 = intermediateValue363;
            branchMergedValue162 = intermediateValue364;
            branchMergedValue163 = intermediateValue365;
            branchMergedValue164 = intermediateValue366;
            branchMergedValue165 = intermediateValue367;
            branchMergedValue166 = intermediateValue368;
            branchMergedValue167 = intermediateValue369;
            branchMergedValue168 = intermediateValue370;
            branchMergedValue169 = intermediateValue371;
            branchMergedValue170 = intermediateValue372;
            branchMergedValue171 = intermediateValue373;
            branchMergedValue172 = intermediateValue374;
            branchMergedValue173 = intermediateValue375;
            branchMergedValue174 = intermediateValue376;
            branchMergedValue175 = intermediateValue377;
            branchMergedValue176 = intermediateValue378;
            branchMergedValue177 = intermediateValue379;
            branchMergedValue178 = intermediateValue380;
            branchMergedValue179 = intermediateValue381;
            branchMergedValue180 = intermediateValue382;
            break;
        }
        bool transposed_selector_ = branchMergedValue160;
        if (branchMergedValue107)
        {
            break;
        }
        float intermediateValue199;
        float intermediateValue201;
        float intermediateValue203;
        float intermediateValue205;
        float intermediateValue207;
        float intermediateValue209;
        float intermediateValue211;
        float intermediateValue212;
        float intermediateValue213;
        uint intermediateValue214;
        float intermediateValue215;
        float16_t intermediateValue216;
        float16_t intermediateValue217;
        float16_t intermediateValue218;
        float16_t intermediateValue219;
        float16_t intermediateValue220;
        float16_t intermediateValue221;
        uint intermediateValue222;
        uint intermediateValue223;
        uint intermediateValue224;
        if (transposed_selector_)
        {
            intermediateValue199 = branchMergedValue161;
            intermediateValue201 = branchMergedValue180;
            intermediateValue203 = branchMergedValue179;
            intermediateValue205 = branchMergedValue178;
            intermediateValue207 = branchMergedValue177;
            intermediateValue209 = branchMergedValue176;
            intermediateValue211 = branchMergedValue175;
            intermediateValue212 = branchMergedValue174;
            intermediateValue213 = branchMergedValue173;
            intermediateValue214 = branchMergedValue172;
            intermediateValue215 = branchMergedValue171;
            intermediateValue216 = branchMergedValue170;
            intermediateValue217 = branchMergedValue169;
            intermediateValue218 = branchMergedValue168;
            intermediateValue219 = branchMergedValue167;
            intermediateValue220 = branchMergedValue166;
            intermediateValue221 = branchMergedValue165;
            intermediateValue222 = branchMergedValue164;
            intermediateValue223 = branchMergedValue163;
            intermediateValue224 = branchMergedValue162;
        }
        else
        {
            intermediateValue199 = branchMergedValue161;
            intermediateValue201 = branchMergedValue180;
            intermediateValue203 = branchMergedValue179;
            intermediateValue205 = branchMergedValue178;
            intermediateValue207 = branchMergedValue177;
            intermediateValue209 = branchMergedValue176;
            intermediateValue211 = branchMergedValue175;
            intermediateValue212 = branchMergedValue174;
            intermediateValue213 = branchMergedValue173;
            intermediateValue214 = branchMergedValue172;
            intermediateValue215 = branchMergedValue171;
            intermediateValue216 = branchMergedValue170;
            intermediateValue217 = branchMergedValue169;
            intermediateValue218 = branchMergedValue168;
            intermediateValue219 = branchMergedValue167;
            intermediateValue220 = branchMergedValue166;
            intermediateValue221 = branchMergedValue165;
            intermediateValue222 = branchMergedValue164;
            intermediateValue223 = branchMergedValue163;
            intermediateValue224 = branchMergedValue162;
        }
        float reinterpretedBits25 = uintBitsToFloat(inputIncidentLight.packedValues[0u]);
        float quotientValue10 = 1.0 / ((abs(intermediateValue201) + abs(intermediateValue199)) + abs(intermediateValue203));
        float productValue435 = quotientValue10 * intermediateValue199;
        float productValue436 = quotientValue10 * intermediateValue201;
        bool conditionValue9 = intermediateValue203 < 0.0;
        float comparisonValue66 = conditionValue9 ? (((productValue435 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - abs(productValue436))) : productValue435;
        imageStore(outputBufferNormal, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(comparisonValue66, conditionValue9 ? ((1.0 - abs(productValue435)) * ((productValue436 >= 0.0) ? 1.0 : (-1.0))) : productValue436, comparisonValue66, comparisonValue66));
        imageStore(outputBufferColourAndMetallic, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(sqrt(intermediateValue205), sqrt(intermediateValue207), sqrt(intermediateValue209), intermediateValue144));
        imageStore(outputBufferEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(reinterpretedBits25 * intermediateValue154, reinterpretedBits25 * intermediateValue155, reinterpretedBits25 * intermediateValue156, intermediateValue146));
        imageStore(outputPlaneIdentifier, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), ivec4(uvec4(((((uint(int(spvNClamp(fma(intermediateValue124, 0.5, 0.5), 0.0, 1.0) * 1023.0)) << 22u) ^ (intermediateValue224 << 26u)) ^ ((uint(int(spvNClamp(fma(intermediateValue125, 0.5, 0.5), 0.0, 1.0) * 1023.0)) << 18u) & 268173312u)) ^ ((uint(int(spvNClamp(fma(intermediateValue126, 0.5, 0.5), 0.0, 1.0) * 1023.0)) << 14u) & 16760832u)) + uint(int(dot(vec3(intermediateValue124, intermediateValue125, intermediateValue126), vec3(intermediateValue127, intermediateValue128, intermediateValue129)) * 1024.0)))));
        imageStore(outputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue361));
        imageStore(outputBufferSurfaceOpacityAndObjectCategory, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue142, float((bitwiseValue4 << 7u) | (intermediateValue103 >> 30u)) * 0.0039215688593685626983642578125, intermediateValue142, intermediateValue142));
        float comparisonValue67 = ((intermediateValue224 & 1u) != 0u) ? ((-0.0) - intermediateValue360) : intermediateValue360;
        imageStore(outputPrimaryWorldPosition, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue127, intermediateValue128, intermediateValue129, comparisonValue67));
        imageStore(outputBufferPrimaryPosLowPrecision, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue127, intermediateValue128, intermediateValue129, comparisonValue67));
        imageStore(outputPrimaryViewDirection, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue211, intermediateValue212, intermediateValue213, float(int(intermediateValue222))));
        imageStore(outputPrimaryThroughput, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(float(intermediateValue216), float(intermediateValue217), float(intermediateValue218), float((intermediateValue224 << 4u) | intermediateValue223)));
        float productValue437 = ViewCB.packedValues[72u].x + (intermediateValue361 * productValue25);
        float productValue438 = ViewCB.packedValues[72u].y + (intermediateValue361 * productValue26);
        float productValue439 = ViewCB.packedValues[72u].z + (intermediateValue361 * productValue27);
        float productValue440 = productValue437 - (((ViewCB.packedValues[69u].x + multiplyAddValue) * float(intermediateValue219)) - ViewCB.packedValues[69u].x);
        float productValue441 = productValue438 - (((ViewCB.packedValues[69u].y + multiplyAddValue1) * float(intermediateValue220)) - ViewCB.packedValues[69u].y);
        float productValue442 = productValue439 - (((ViewCB.packedValues[69u].z + multiplyAddValue2) * float(intermediateValue221)) - ViewCB.packedValues[69u].z);
        float multiplyAddValue5 = fma(productValue439, ViewCB.packedValues[6u].w, fma(productValue438, ViewCB.packedValues[5u].w, ViewCB.packedValues[4u].w * productValue437)) + ViewCB.packedValues[7u].w;
        float multiplyAddValue6 = fma(productValue442, ViewCB.packedValues[26u].w, fma(productValue441, ViewCB.packedValues[25u].w, ViewCB.packedValues[24u].w * productValue440)) + ViewCB.packedValues[27u].w;
        float sumValue359 = productValue440 - ViewCB.packedValues[73u].x;
        float sumValue360 = productValue441 - ViewCB.packedValues[73u].y;
        float sumValue361 = productValue442 - ViewCB.packedValues[73u].z;
        float multiplyAddValue7 = (((fma(productValue442, ViewCB.packedValues[26u].x, fma(productValue441, ViewCB.packedValues[25u].x, ViewCB.packedValues[24u].x * productValue440)) + ViewCB.packedValues[27u].x) / multiplyAddValue6) - ((fma(productValue439, ViewCB.packedValues[6u].x, fma(productValue438, ViewCB.packedValues[5u].x, ViewCB.packedValues[4u].x * productValue437)) + ViewCB.packedValues[7u].x) / multiplyAddValue5)) * 0.5;
        imageStore(outputBufferMotionVectors, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(multiplyAddValue7, (((fma(productValue442, ViewCB.packedValues[26u].y, fma(productValue441, ViewCB.packedValues[25u].y, ViewCB.packedValues[24u].y * productValue440)) + ViewCB.packedValues[27u].y) / multiplyAddValue6) - ((fma(productValue439, ViewCB.packedValues[6u].y, fma(productValue438, ViewCB.packedValues[5u].y, ViewCB.packedValues[4u].y * productValue437)) + ViewCB.packedValues[7u].y) / multiplyAddValue5)) * (-0.5), multiplyAddValue7, multiplyAddValue7));
        imageStore(outputBufferReprojectedPathLength, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(sqrt(((sumValue359 * sumValue359) + (sumValue360 * sumValue360)) + (sumValue361 * sumValue361))));
        float productValue443 = reinterpretedBits25 * intermediateValue118;
        float productValue444 = reinterpretedBits25 * intermediateValue120;
        float productValue445 = reinterpretedBits25 * intermediateValue122;
        float comparisonValue68 = (intermediateValue214 != 0u) ? intermediateValue215 : 0.5;
        uint reinterpretedBits26 = floatBitsToUint(productValue443) & 2147483647u;
        uint reinterpretedBits27 = floatBitsToUint(productValue444) & 2147483647u;
        uint reinterpretedBits28 = floatBitsToUint(productValue445) & 2147483647u;
        uint reinterpretedBits29 = floatBitsToUint(comparisonValue68) & 2147483647u;
        bool comparisonValue69 = ((reinterpretedBits29 > 2139095040u) || ((reinterpretedBits28 > 2139095040u) || ((reinterpretedBits26 > 2139095040u) || (reinterpretedBits27 > 2139095040u)))) || ((reinterpretedBits29 == 2139095040u) || ((reinterpretedBits28 == 2139095040u) || ((reinterpretedBits26 == 2139095040u) || (reinterpretedBits27 == 2139095040u))));
        bool intermediateValue228;
        if (comparisonValue69)
        {
            bool branchMergedValue18;
            if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
            {
                imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 1.0, 1.0, 1.0));
                imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
                branchMergedValue18 = comparisonValue69;
            }
            else
            {
                branchMergedValue18 = comparisonValue69;
            }
            intermediateValue228 = branchMergedValue18;
        }
        else
        {
            intermediateValue228 = false;
        }
        if (!intermediateValue228)
        {
            imageStore(outputBufferIncomingIrradianceCache, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(productValue443, productValue444, productValue445, comparisonValue68));
        }
        imageStore(outputBufferPreviousMedium, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), ivec4(uvec4(intermediateValue222)));
        float quotientValue11 = 1.0 / ((abs(intermediateValue125) + abs(intermediateValue124)) + abs(intermediateValue126));
        float productValue446 = quotientValue11 * intermediateValue124;
        float productValue447 = quotientValue11 * intermediateValue125;
        bool conditionValue10 = intermediateValue126 < 0.0;
        float comparisonValue70 = conditionValue10 ? (((productValue446 >= 0.0) ? 1.0 : (-1.0)) * (1.0 - abs(productValue447))) : productValue446;
        imageStore(outputGeometryNormal, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(comparisonValue70, conditionValue10 ? ((1.0 - abs(productValue446)) * ((productValue447 >= 0.0) ? 1.0 : (-1.0))) : productValue447, comparisonValue70, comparisonValue70));
        break;
    }
}
