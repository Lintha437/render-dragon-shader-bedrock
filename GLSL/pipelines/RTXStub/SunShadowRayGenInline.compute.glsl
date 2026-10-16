#version 460
#extension GL_GOOGLE_include_directive : require
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

#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
#extension GL_EXT_shader_16bit_storage : require
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
    uvec4 reinterpretedBits1 = floatBitsToUint(ViewCB.packedValues[84u]);
    uint scalarValue1 = reinterpretedBits1.z;
    vec4 sampledTextureValue = texelFetch(inputGeometryNormal, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
    float scalarValue2 = sampledTextureValue.x;
    float scalarValue3 = sampledTextureValue.y;
    precise float sumValue = 1.0 - abs(scalarValue2);
    float scalarValue4 = abs(scalarValue3);
    precise float sumValue1 = sumValue - scalarValue4;
    bool conditionValue = sumValue1 < 0.0;
    precise float sumValue2 = 1.0 - scalarValue4;
    precise float comparisonValue1 = ((scalarValue2 >= 0.0) ? 1.0 : (-1.0)) * sumValue2;
    precise float comparisonValue2 = sumValue * ((scalarValue3 >= 0.0) ? 1.0 : (-1.0));
    float comparisonValue3 = conditionValue ? comparisonValue1 : scalarValue2;
    float comparisonValue4 = conditionValue ? comparisonValue2 : scalarValue3;
    float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue3, comparisonValue4, sumValue1), vec3(comparisonValue3, comparisonValue4, sumValue1)));
    precise float productValue = inverseLengthValue * comparisonValue3;
    precise float productValue1 = inverseLengthValue * comparisonValue4;
    precise float productValue2 = sumValue1 * inverseLengthValue;
    vec4 sampledTextureValue1 = texelFetch(inputPrimaryWorldPosition, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    precise float productValue3 = productValue * 256.0;
    uint scalarValue8 = uint(int(productValue3));
    precise float productValue4 = productValue1 * 256.0;
    uint scalarValue9 = uint(int(productValue4));
    precise float productValue5 = productValue2 * 256.0;
    uint scalarValue10 = uint(int(productValue5));
    precise float productValue6 = productValue * 1.52587890625e-05;
    precise float sumValue3 = productValue6 + scalarValue5;
    float reinterpretedBits2 = (abs(scalarValue5) < 0.03125) ? sumValue3 : uintBitsToFloat(((scalarValue5 < 0.0) ? (-scalarValue8) : scalarValue8) + floatBitsToUint(scalarValue5));
    precise float productValue7 = productValue1 * 1.52587890625e-05;
    precise float sumValue4 = productValue7 + scalarValue6;
    float reinterpretedBits3 = (abs(scalarValue6) < 0.03125) ? sumValue4 : uintBitsToFloat(((scalarValue6 < 0.0) ? (-scalarValue9) : scalarValue9) + floatBitsToUint(scalarValue6));
    precise float productValue8 = productValue2 * 1.52587890625e-05;
    precise float sumValue5 = productValue8 + scalarValue7;
    float reinterpretedBits4 = (abs(scalarValue7) < 0.03125) ? sumValue5 : uintBitsToFloat(((scalarValue7 < 0.0) ? (-scalarValue10) : scalarValue10) + floatBitsToUint(scalarValue7));
    bool dotProductValue = dot(vec3(0.847100675106048583984375, 0.2079117000102996826171875, 0.489073812961578369140625), vec3(ViewCB.packedValues[52u].xyz)) > 0.949999988079071044921875;
    float comparisonValue5 = dotProductValue ? (-0.639436304569244384765625) : 0.847100675106048583984375;
    float comparisonValue6 = dotProductValue ? (-0.3907311260700225830078125) : 0.2079117000102996826171875;
    float comparisonValue7 = dotProductValue ? 0.6621558666229248046875 : 0.489073812961578369140625;
    precise float dotProductValue1 = dot(vec3(comparisonValue5, comparisonValue6, comparisonValue7), vec3(ViewCB.packedValues[52u].xyz));
    precise float productValue9 = ViewCB.packedValues[52u].x * dotProductValue1;
    precise float productValue10 = ViewCB.packedValues[52u].y * dotProductValue1;
    precise float productValue11 = ViewCB.packedValues[52u].z * dotProductValue1;
    precise float sumValue6 = comparisonValue5 - productValue9;
    precise float sumValue7 = comparisonValue6 - productValue10;
    precise float sumValue8 = comparisonValue7 - productValue11;
    float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue6, sumValue7, sumValue8), vec3(sumValue6, sumValue7, sumValue8)));
    precise float productValue12 = sumValue6 * inverseLengthValue1;
    precise float productValue13 = sumValue7 * inverseLengthValue1;
    precise float productValue14 = sumValue8 * inverseLengthValue1;
    precise float productValue15 = ViewCB.packedValues[52u].y * productValue14;
    precise float productValue16 = ViewCB.packedValues[52u].z * productValue13;
    precise float sumValue9 = productValue15 - productValue16;
    precise float productValue17 = ViewCB.packedValues[52u].z * productValue12;
    precise float productValue18 = ViewCB.packedValues[52u].x * productValue14;
    precise float sumValue10 = productValue17 - productValue18;
    precise float productValue19 = ViewCB.packedValues[52u].x * productValue13;
    precise float productValue20 = ViewCB.packedValues[52u].y * productValue12;
    precise float sumValue11 = productValue19 - productValue20;
    vec4 sampledTextureValue2 = texelFetch(blueNoiseTexture, ivec3(uvec3(bitwiseValue2 & 255u, bitwiseValue3 & 255u, (scalarValue1 >> 1u) & 127u)), int(0u));
    bool comparisonValue8 = (scalarValue1 & 1u) == 0u;
    float nonlinearValue = sqrt(comparisonValue8 ? sampledTextureValue2.x : sampledTextureValue2.z);
    precise float comparisonValue9 = (comparisonValue8 ? sampledTextureValue2.y : sampledTextureValue2.w) * 6.283185482025146484375;
    precise float wavePhaseValue = nonlinearValue * cos(comparisonValue9);
    precise float wavePhaseValue1 = nonlinearValue * sin(comparisonValue9);
    precise float productValue21 = wavePhaseValue * 0.01860214583575725555419921875;
    precise float productValue22 = wavePhaseValue1 * 0.01860214583575725555419921875;
    precise float productValue23 = productValue12 * productValue21;
    precise float productValue24 = productValue13 * productValue21;
    precise float productValue25 = productValue14 * productValue21;
    precise float productValue26 = sumValue9 * productValue22;
    precise float productValue27 = sumValue10 * productValue22;
    precise float productValue28 = sumValue11 * productValue22;
    precise float sumValue12 = productValue23 + productValue26;
    precise float sumValue13 = productValue24 + productValue27;
    precise float sumValue14 = productValue25 + productValue28;
    precise float sumValue15 = ViewCB.packedValues[52u].x + sumValue12;
    precise float sumValue16 = ViewCB.packedValues[52u].y + sumValue13;
    precise float sumValue17 = ViewCB.packedValues[52u].z + sumValue14;
    float intermediateValue14;
    float intermediateValue18;
    float intermediateValue22;
    float intermediateValue26;
    if (dot(vec3(sumValue15, sumValue16, sumValue17), vec3(productValue, productValue1, productValue2)) < 0.0)
    {
        intermediateValue14 = 0.0;
        intermediateValue18 = 0.0;
        intermediateValue22 = 0.0;
        intermediateValue26 = 0.0;
    }
    else
    {
        float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue15, sumValue16, sumValue17), vec3(sumValue15, sumValue16, sumValue17)));
        float productValue29 = inverseLengthValue2 * sumValue15;
        float productValue30 = inverseLengthValue2 * sumValue16;
        float productValue31 = inverseLengthValue2 * sumValue17;
        rayQueryInitializeEXT(intermediateValue29, SceneBVH, 512u, 32u, vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4), 0.0, vec3(ViewCB.packedValues[53u].xyz), 10000.0);
        bool conditionValue1 = rayQueryProceedEXT(intermediateValue29);
        if (conditionValue1)
        {
            bool intermediateValue42;
            bool comparisonValue11;
            for (;;)
            {
                uint scalarValue11 = rayQueryGetIntersectionTypeEXT(intermediateValue29, bool(0u));
                comparisonValue11 = scalarValue11 == 0u;
                if (comparisonValue11)
                {
                    vec2 vectorValue = rayQueryGetIntersectionBarycentricsEXT(intermediateValue29, bool(0u));
                    vec2 vectorValue1 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue29, bool(0u));
                    uint scalarValue12 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue29, bool(0u));
                    uint scalarValue13 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue29, bool(0u));
                    uint scalarValue14 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue29, bool(0u));
                    uint productValue32 = (scalarValue14 * 76u) + 58u;
                    uint productValue33 = (scalarValue14 * 76u) + 61u;
                    precise float sumValue18 = 1.0 - vectorValue.x;
                    precise float sumValue19 = sumValue18 - vectorValue1.y;
                    uint bitwiseValue4 = (objectInstances_2.packedValues[(scalarValue14 * 38u) + 25u] >> 2u) + (scalarValue12 >> 1u);
                    uint productValue34 = uint(objectInstances.packedValues[(scalarValue14 * 76u) + 54u]) + 0u;
                    bool comparisonValue10 = (scalarValue12 & 1u) == 0u;
                    uint comparisonValue12 = comparisonValue10 ? faceUvBuffersRW[nonuniformEXT(productValue34)].packedValues[bitwiseValue4].z : faceUvBuffersRW[nonuniformEXT(productValue34)].packedValues[bitwiseValue4].x;
                    uint comparisonValue13 = comparisonValue10 ? faceUvBuffersRW[nonuniformEXT(productValue34)].packedValues[bitwiseValue4].y : faceUvBuffersRW[nonuniformEXT(productValue34)].packedValues[bitwiseValue4].w;
                    uint comparisonValue14 = comparisonValue10 ? faceUvBuffersRW[nonuniformEXT(productValue34)].packedValues[bitwiseValue4].x : faceUvBuffersRW[nonuniformEXT(productValue34)].packedValues[bitwiseValue4].z;
                    bool conditionValue2 = int16_t(objectInstances.packedValues[productValue33]) < int16_t(0us);
                    float intermediateValue57;
                    float intermediateValue58;
                    if (conditionValue2)
                    {
                        uint bitwiseValue5 = comparisonValue14 >> 15u;
                        precise float bitwiseValue6 = float(bitwiseValue5 & 1u) * 2.0;
                        precise float sumValue20 = bitwiseValue6 + (-1.0);
                        precise float bitwiseValue7 = float(comparisonValue14 >> 31u) * 2.0;
                        precise float sumValue21 = bitwiseValue7 + (-1.0);
                        precise float bitwiseValue8 = float((comparisonValue14 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue9 = float(bitwiseValue5 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue35 = sumValue20 * 3.0517578125e-05;
                        precise float productValue36 = sumValue21 * 3.0517578125e-05;
                        precise float sumValue22 = bitwiseValue8 + productValue35;
                        precise float sumValue23 = bitwiseValue9 + productValue36;
                        intermediateValue57 = sumValue22;
                        intermediateValue58 = sumValue23;
                    }
                    else
                    {
                        precise float bitwiseValue10 = float(comparisonValue14 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue11 = float(comparisonValue14 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue37 = bitwiseValue10 * 16384.0;
                        precise float sumValue24 = productValue37 + 0.5;
                        precise float productValue38 = bitwiseValue11 * 16384.0;
                        precise float sumValue25 = productValue38 + 0.5;
                        precise float productValue39 = floor(sumValue24) * 6.103515625e-05;
                        precise float productValue40 = floor(sumValue25) * 6.103515625e-05;
                        intermediateValue57 = productValue39;
                        intermediateValue58 = productValue40;
                    }
                    precise float productValue41 = sumValue19 * intermediateValue57;
                    precise float productValue42 = sumValue19 * intermediateValue58;
                    precise float sumValue26 = productValue41 + 0.0;
                    precise float sumValue27 = productValue42 + 0.0;
                    float intermediateValue85;
                    float intermediateValue86;
                    if (conditionValue2)
                    {
                        uint bitwiseValue12 = comparisonValue13 >> 15u;
                        precise float bitwiseValue13 = float(bitwiseValue12 & 1u) * 2.0;
                        precise float sumValue28 = bitwiseValue13 + (-1.0);
                        precise float bitwiseValue14 = float(comparisonValue13 >> 31u) * 2.0;
                        precise float sumValue29 = bitwiseValue14 + (-1.0);
                        precise float bitwiseValue15 = float((comparisonValue13 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue16 = float(bitwiseValue12 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue43 = sumValue28 * 3.0517578125e-05;
                        precise float productValue44 = sumValue29 * 3.0517578125e-05;
                        precise float sumValue30 = bitwiseValue15 + productValue43;
                        precise float sumValue31 = bitwiseValue16 + productValue44;
                        intermediateValue85 = sumValue30;
                        intermediateValue86 = sumValue31;
                    }
                    else
                    {
                        precise float bitwiseValue17 = float(comparisonValue13 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue18 = float(comparisonValue13 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue45 = bitwiseValue17 * 16384.0;
                        precise float sumValue32 = productValue45 + 0.5;
                        precise float productValue46 = bitwiseValue18 * 16384.0;
                        precise float sumValue33 = productValue46 + 0.5;
                        precise float productValue47 = floor(sumValue32) * 6.103515625e-05;
                        precise float productValue48 = floor(sumValue33) * 6.103515625e-05;
                        intermediateValue85 = productValue47;
                        intermediateValue86 = productValue48;
                    }
                    precise float productValue49 = vectorValue.x * intermediateValue85;
                    precise float productValue50 = vectorValue.x * intermediateValue86;
                    precise float sumValue34 = sumValue26 + productValue49;
                    precise float sumValue35 = sumValue27 + productValue50;
                    float intermediateValue113;
                    float intermediateValue114;
                    if (conditionValue2)
                    {
                        uint bitwiseValue19 = comparisonValue12 >> 15u;
                        precise float bitwiseValue20 = float(bitwiseValue19 & 1u) * 2.0;
                        precise float sumValue36 = bitwiseValue20 + (-1.0);
                        precise float bitwiseValue21 = float(comparisonValue12 >> 31u) * 2.0;
                        precise float sumValue37 = bitwiseValue21 + (-1.0);
                        precise float bitwiseValue22 = float((comparisonValue12 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue23 = float(bitwiseValue19 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue51 = sumValue36 * 3.0517578125e-05;
                        precise float productValue52 = sumValue37 * 3.0517578125e-05;
                        precise float sumValue38 = bitwiseValue22 + productValue51;
                        precise float sumValue39 = bitwiseValue23 + productValue52;
                        intermediateValue113 = sumValue38;
                        intermediateValue114 = sumValue39;
                    }
                    else
                    {
                        precise float bitwiseValue24 = float(comparisonValue12 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue25 = float(comparisonValue12 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue53 = bitwiseValue24 * 16384.0;
                        precise float sumValue40 = productValue53 + 0.5;
                        precise float productValue54 = bitwiseValue25 * 16384.0;
                        precise float sumValue41 = productValue54 + 0.5;
                        precise float productValue55 = floor(sumValue40) * 6.103515625e-05;
                        precise float productValue56 = floor(sumValue41) * 6.103515625e-05;
                        intermediateValue113 = productValue55;
                        intermediateValue114 = productValue56;
                    }
                    precise float productValue57 = vectorValue1.y * intermediateValue113;
                    precise float productValue58 = vectorValue1.y * intermediateValue114;
                    precise float sumValue42 = sumValue34 + productValue57;
                    precise float sumValue43 = sumValue35 + productValue58;
                    float intermediateValue128;
                    if (objectInstances.packedValues[productValue32] == 65535us)
                    {
                        intermediateValue128 = 1.0;
                    }
                    else
                    {
                        uint reinterpretedBits9;
                        if (objectInstances.packedValues[productValue32] > 4095us)
                        {
                            reinterpretedBits9 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits9 = uint(objectInstances.packedValues[productValue32]);
                        }
                        intermediateValue128 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits9 + 0u], defaultSampler)), vec2(sumValue42, sumValue43), -0.25).w;
                    }
                    uint comparisonValue32;
                    if (scalarValue13 == 2u)
                    {
                        comparisonValue32 = 0u;
                    }
                    else
                    {
                        comparisonValue32 = uint(intermediateValue128 <= (((objectInstances.packedValues[productValue33] & 4352us) != 0us) ? 0.5 : 0.0));
                    }
                    if (comparisonValue32 == 0u)
                    {
                        rayQueryConfirmIntersectionEXT(intermediateValue29);
                    }
                }
                intermediateValue42 = rayQueryProceedEXT(intermediateValue29);
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
        uint scalarValue15 = rayQueryGetIntersectionTypeEXT(intermediateValue29, bool(1u));
        float intermediateValue35;
        if (scalarValue15 == 1u)
        {
            float scalarValue16 = rayQueryGetIntersectionTEXT(intermediateValue29, bool(1u));
            intermediateValue35 = scalarValue16;
        }
        else
        {
            intermediateValue35 = 10000.0;
        }
        float branchMergedValue10;
        float branchMergedValue13;
        float branchMergedValue14;
        float branchMergedValue15;
        if (intermediateValue35 < 10000.0)
        {
            precise float productValue59 = intermediateValue35 * ViewCB.packedValues[63u].x;
            precise float productValue60 = intermediateValue35 * ViewCB.packedValues[63u].y;
            precise float productValue61 = intermediateValue35 * ViewCB.packedValues[63u].z;
            precise float productValue62 = productValue59 * (-1.44269502162933349609375);
            precise float productValue63 = productValue60 * (-1.44269502162933349609375);
            precise float productValue64 = productValue61 * (-1.44269502162933349609375);
            precise float productValue65 = ViewCB.packedValues[53u].x * intermediateValue35;
            precise float sumValue44 = productValue65 + reinterpretedBits2;
            precise float productValue66 = ViewCB.packedValues[53u].z * intermediateValue35;
            precise float sumValue45 = productValue66 + reinterpretedBits4;
            precise float productValue67 = sumValue44 * ViewCB.packedValues[83u].z;
            precise float sumValue46 = productValue67 + ViewCB.packedValues[84u].x;
            precise float productValue68 = sumValue45 * ViewCB.packedValues[83u].w;
            precise float sumValue47 = productValue68 + ViewCB.packedValues[84u].y;
            vec4 sampledTextureValue3 = textureLod(sampler2D(wibblyTexture, linearWrapSampler), vec2(sumValue46, sumValue47), 0.0);
            precise float sumValue48 = sampledTextureValue3.x + (-0.5);
            precise float sumValue49 = sampledTextureValue3.y + (-0.5);
            precise float productValue69 = sumValue44 * ViewCB.packedValues[82u].z;
            precise float sumValue50 = productValue69 + ViewCB.packedValues[83u].x;
            precise float productValue70 = sumValue45 * ViewCB.packedValues[82u].w;
            precise float sumValue51 = productValue70 + ViewCB.packedValues[83u].y;
            precise float productValue71 = sumValue48 * 0.4000000059604644775390625;
            precise float productValue72 = sumValue49 * 0.4000000059604644775390625;
            precise float sumValue52 = sumValue50 + productValue71;
            precise float sumValue53 = productValue72 + sumValue51;
            precise float productValue73 = ViewCB.packedValues[68u].w * 63.0;
            uint scalarValue17 = uint(int(floor(productValue73)));
            precise float productValue74 = float(int(scalarValue17 + 1u)) * 0.015625;
            precise float sumValue54 = (-0.0) - productValue74;
            float scalarValue18 = fract(abs(productValue74));
            precise float sumValue55 = (-0.0) - scalarValue18;
            precise float comparisonValue15 = ((productValue74 >= sumValue54) ? scalarValue18 : sumValue55) * 64.0;
            vec4 sampledTextureValue4 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue52, sumValue53, float(int(scalarValue17))), 0.0);
            float scalarValue19 = sampledTextureValue4.x;
            precise float sampledTextureValue5 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue52, sumValue53, float(int(uint(int(comparisonValue15))))), 0.0).x - scalarValue19;
            precise float productValue75 = fract(productValue73) * sampledTextureValue5;
            precise float sumValue56 = scalarValue19 + productValue75;
            precise float productValue76 = sumValue56 * 7.0;
            precise float sumValue57 = productValue76 + 0.800000011920928955078125;
            precise float productValue77 = intermediateValue35 * (-0.100000001490116119384765625);
            precise float sumValue58 = sumValue57 + (-1.0);
            precise float exponentialValue = exp2(productValue77) * sumValue58;
            precise float sumValue59 = exponentialValue + 1.0;
            precise float exponentialValue1 = exp2(productValue62) * sumValue59;
            precise float exponentialValue2 = exp2(productValue63) * sumValue59;
            precise float exponentialValue3 = exp2(productValue64) * sumValue59;
            rayQueryInitializeEXT(intermediateValue46, SceneBVH, 512u, 22u, vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4), 0.0, vec3(ViewCB.packedValues[53u].xyz), intermediateValue35);
            bool conditionValue3 = rayQueryProceedEXT(intermediateValue46);
            float intermediateValue48;
            float intermediateValue50;
            float intermediateValue52;
            if (conditionValue3)
            {
                float intermediateValue49;
                float intermediateValue51;
                float intermediateValue53;
                float scalarValue20 = exponentialValue1;
                float scalarValue21 = exponentialValue2;
                float scalarValue22 = exponentialValue3;
                bool comparisonValue17;
                for (;;)
                {
                    uint scalarValue23 = rayQueryGetIntersectionTypeEXT(intermediateValue46, bool(0u));
                    comparisonValue17 = scalarValue23 == 0u;
                    float branchMergedValue;
                    float branchMergedValue3;
                    float branchMergedValue4;
                    if (comparisonValue17)
                    {
                        vec2 vectorValue2 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue46, bool(0u));
                        vec2 vectorValue3 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue46, bool(0u));
                        float scalarValue24 = rayQueryGetIntersectionTEXT(intermediateValue46, bool(0u));
                        uint scalarValue25 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue46, bool(0u));
                        uint scalarValue26 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue46, bool(0u));
                        uint scalarValue27 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue46, bool(0u));
                        uint productValue78 = (scalarValue27 * 76u) + 58u;
                        uint productValue79 = (scalarValue27 * 76u) + 61u;
                        precise float sumValue60 = 1.0 - vectorValue2.x;
                        precise float sumValue61 = sumValue60 - vectorValue3.y;
                        uint bitwiseValue26 = (objectInstances_2.packedValues[(scalarValue27 * 38u) + 25u] >> 2u) + (scalarValue25 >> 1u);
                        uint productValue80 = uint(objectInstances.packedValues[(scalarValue27 * 76u) + 54u]) + 0u;
                        bool comparisonValue16 = (scalarValue25 & 1u) == 0u;
                        uint comparisonValue18 = comparisonValue16 ? faceUvBuffersRW[nonuniformEXT(productValue80)].packedValues[bitwiseValue26].z : faceUvBuffersRW[nonuniformEXT(productValue80)].packedValues[bitwiseValue26].x;
                        uint comparisonValue19 = comparisonValue16 ? faceUvBuffersRW[nonuniformEXT(productValue80)].packedValues[bitwiseValue26].y : faceUvBuffersRW[nonuniformEXT(productValue80)].packedValues[bitwiseValue26].w;
                        uint comparisonValue20 = comparisonValue16 ? faceUvBuffersRW[nonuniformEXT(productValue80)].packedValues[bitwiseValue26].x : faceUvBuffersRW[nonuniformEXT(productValue80)].packedValues[bitwiseValue26].z;
                        bool conditionValue4 = int16_t(objectInstances.packedValues[productValue79]) < int16_t(0us);
                        float intermediateValue105;
                        float intermediateValue106;
                        if (conditionValue4)
                        {
                            uint bitwiseValue27 = comparisonValue20 >> 15u;
                            precise float bitwiseValue28 = float(bitwiseValue27 & 1u) * 2.0;
                            precise float sumValue62 = bitwiseValue28 + (-1.0);
                            precise float bitwiseValue29 = float(comparisonValue20 >> 31u) * 2.0;
                            precise float sumValue63 = bitwiseValue29 + (-1.0);
                            precise float bitwiseValue30 = float((comparisonValue20 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue31 = float(bitwiseValue27 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue81 = sumValue62 * 3.0517578125e-05;
                            precise float productValue82 = sumValue63 * 3.0517578125e-05;
                            precise float sumValue64 = bitwiseValue30 + productValue81;
                            precise float sumValue65 = bitwiseValue31 + productValue82;
                            intermediateValue105 = sumValue64;
                            intermediateValue106 = sumValue65;
                        }
                        else
                        {
                            precise float bitwiseValue32 = float(comparisonValue20 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue33 = float(comparisonValue20 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue83 = bitwiseValue32 * 16384.0;
                            precise float sumValue66 = productValue83 + 0.5;
                            precise float productValue84 = bitwiseValue33 * 16384.0;
                            precise float sumValue67 = productValue84 + 0.5;
                            precise float productValue85 = floor(sumValue66) * 6.103515625e-05;
                            precise float productValue86 = floor(sumValue67) * 6.103515625e-05;
                            intermediateValue105 = productValue85;
                            intermediateValue106 = productValue86;
                        }
                        precise float productValue87 = sumValue61 * intermediateValue105;
                        precise float productValue88 = sumValue61 * intermediateValue106;
                        precise float sumValue68 = productValue87 + 0.0;
                        precise float sumValue69 = productValue88 + 0.0;
                        float intermediateValue129;
                        float intermediateValue130;
                        if (conditionValue4)
                        {
                            uint bitwiseValue34 = comparisonValue19 >> 15u;
                            precise float bitwiseValue35 = float(bitwiseValue34 & 1u) * 2.0;
                            precise float sumValue70 = bitwiseValue35 + (-1.0);
                            precise float bitwiseValue36 = float(comparisonValue19 >> 31u) * 2.0;
                            precise float sumValue71 = bitwiseValue36 + (-1.0);
                            precise float bitwiseValue37 = float((comparisonValue19 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue38 = float(bitwiseValue34 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue89 = sumValue70 * 3.0517578125e-05;
                            precise float productValue90 = sumValue71 * 3.0517578125e-05;
                            precise float sumValue72 = bitwiseValue37 + productValue89;
                            precise float sumValue73 = bitwiseValue38 + productValue90;
                            intermediateValue129 = sumValue72;
                            intermediateValue130 = sumValue73;
                        }
                        else
                        {
                            precise float bitwiseValue39 = float(comparisonValue19 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue40 = float(comparisonValue19 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue91 = bitwiseValue39 * 16384.0;
                            precise float sumValue74 = productValue91 + 0.5;
                            precise float productValue92 = bitwiseValue40 * 16384.0;
                            precise float sumValue75 = productValue92 + 0.5;
                            precise float productValue93 = floor(sumValue74) * 6.103515625e-05;
                            precise float productValue94 = floor(sumValue75) * 6.103515625e-05;
                            intermediateValue129 = productValue93;
                            intermediateValue130 = productValue94;
                        }
                        precise float productValue95 = vectorValue2.x * intermediateValue129;
                        precise float productValue96 = vectorValue2.x * intermediateValue130;
                        precise float sumValue76 = sumValue68 + productValue95;
                        precise float sumValue77 = sumValue69 + productValue96;
                        float intermediateValue135;
                        float intermediateValue136;
                        if (conditionValue4)
                        {
                            uint bitwiseValue41 = comparisonValue18 >> 15u;
                            precise float bitwiseValue42 = float(bitwiseValue41 & 1u) * 2.0;
                            precise float sumValue78 = bitwiseValue42 + (-1.0);
                            precise float bitwiseValue43 = float(comparisonValue18 >> 31u) * 2.0;
                            precise float sumValue79 = bitwiseValue43 + (-1.0);
                            precise float bitwiseValue44 = float((comparisonValue18 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue45 = float(bitwiseValue41 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue97 = sumValue78 * 3.0517578125e-05;
                            precise float productValue98 = sumValue79 * 3.0517578125e-05;
                            precise float sumValue80 = bitwiseValue44 + productValue97;
                            precise float sumValue81 = bitwiseValue45 + productValue98;
                            intermediateValue135 = sumValue80;
                            intermediateValue136 = sumValue81;
                        }
                        else
                        {
                            precise float bitwiseValue46 = float(comparisonValue18 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue47 = float(comparisonValue18 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue99 = bitwiseValue46 * 16384.0;
                            precise float sumValue82 = productValue99 + 0.5;
                            precise float productValue100 = bitwiseValue47 * 16384.0;
                            precise float sumValue83 = productValue100 + 0.5;
                            precise float productValue101 = floor(sumValue82) * 6.103515625e-05;
                            precise float productValue102 = floor(sumValue83) * 6.103515625e-05;
                            intermediateValue135 = productValue101;
                            intermediateValue136 = productValue102;
                        }
                        precise float productValue103 = vectorValue3.y * intermediateValue135;
                        precise float productValue104 = vectorValue3.y * intermediateValue136;
                        precise float sumValue84 = sumValue76 + productValue103;
                        precise float sumValue85 = sumValue77 + productValue104;
                        precise float productValue105 = scalarValue24 * 0.083333335816860198974609375;
                        precise float sumValue86 = productValue105 + (-0.25);
                        float intermediateValue137;
                        float intermediateValue138;
                        float intermediateValue139;
                        float intermediateValue140;
                        if (objectInstances.packedValues[productValue78] == 65535us)
                        {
                            intermediateValue137 = 1.0;
                            intermediateValue138 = 1.0;
                            intermediateValue139 = 1.0;
                            intermediateValue140 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits10;
                            if (objectInstances.packedValues[productValue78] > 4095us)
                            {
                                reinterpretedBits10 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits10 = uint(objectInstances.packedValues[productValue78]);
                            }
                            vec4 sampledTextureValue6 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits10 + 0u], defaultSampler)), vec2(sumValue84, sumValue85), spvNMin(sumValue86, 2.0));
                            intermediateValue137 = sampledTextureValue6.x;
                            intermediateValue138 = sampledTextureValue6.y;
                            intermediateValue139 = sampledTextureValue6.z;
                            intermediateValue140 = sampledTextureValue6.w;
                        }
                        float intermediateValue149;
                        float intermediateValue150;
                        float intermediateValue151;
                        if (scalarValue26 == 2u)
                        {
                            float branchMergedValue11;
                            float branchMergedValue17;
                            float branchMergedValue18;
                            if ((objectInstances.packedValues[productValue79] & 128us) == 0us)
                            {
                                float intermediateValue154;
                                if ((objectInstances.packedValues[productValue79] & 2048us) == 0us)
                                {
                                    intermediateValue154 = intermediateValue140;
                                }
                                else
                                {
                                    precise float productValue106 = intermediateValue140 * 2.0;
                                    precise float sumValue87 = productValue106 + (-1.0);
                                    intermediateValue154 = spvNClamp(sumValue87, 0.0, 1.0);
                                }
                                precise float sumValue88 = 0.0 - intermediateValue137;
                                precise float sumValue89 = 0.0 - intermediateValue138;
                                precise float sumValue90 = 0.0 - intermediateValue139;
                                precise float productValue107 = sumValue88 * intermediateValue154;
                                precise float productValue108 = sumValue89 * intermediateValue154;
                                precise float productValue109 = sumValue90 * intermediateValue154;
                                precise float sumValue91 = intermediateValue137 + productValue107;
                                precise float sumValue92 = intermediateValue138 + productValue108;
                                precise float sumValue93 = intermediateValue139 + productValue109;
                                branchMergedValue11 = sumValue93;
                                branchMergedValue17 = sumValue91;
                                branchMergedValue18 = sumValue92;
                            }
                            else
                            {
                                branchMergedValue11 = 0.33399999141693115234375;
                                branchMergedValue17 = 0.33399999141693115234375;
                                branchMergedValue18 = 0.33399999141693115234375;
                            }
                            intermediateValue149 = branchMergedValue17;
                            intermediateValue150 = branchMergedValue18;
                            intermediateValue151 = branchMergedValue11;
                        }
                        else
                        {
                            precise float sumValue94 = 1.0 - intermediateValue140;
                            intermediateValue149 = sumValue94;
                            intermediateValue150 = sumValue94;
                            intermediateValue151 = sumValue94;
                        }
                        precise float productValue110 = scalarValue20 * intermediateValue149;
                        precise float productValue111 = scalarValue21 * intermediateValue150;
                        precise float productValue112 = scalarValue22 * intermediateValue151;
                        float intermediateValue75;
                        float intermediateValue76;
                        float intermediateValue77;
                        bool intermediateValue155;
                        if (!(dot(vec3(productValue110, productValue111, productValue112), vec3(1.0)) <= 0.00999999977648258209228515625))
                        {
                            intermediateValue155 = false;
                            intermediateValue75 = productValue110;
                            intermediateValue76 = productValue111;
                            intermediateValue77 = productValue112;
                        }
                        else
                        {
                            intermediateValue155 = true;
                            intermediateValue75 = 0.0;
                            intermediateValue76 = 0.0;
                            intermediateValue77 = 0.0;
                        }
                        float branchMergedValue23;
                        float branchMergedValue26;
                        float branchMergedValue27;
                        if (intermediateValue155)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue46);
                            branchMergedValue23 = intermediateValue77;
                            branchMergedValue26 = intermediateValue76;
                            branchMergedValue27 = intermediateValue75;
                        }
                        else
                        {
                            branchMergedValue23 = intermediateValue77;
                            branchMergedValue26 = intermediateValue76;
                            branchMergedValue27 = intermediateValue75;
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
                    intermediateValue53 = branchMergedValue;
                    intermediateValue51 = branchMergedValue3;
                    intermediateValue49 = branchMergedValue4;
                    bool conditionValue5 = rayQueryProceedEXT(intermediateValue46);
                    if (conditionValue5)
                    {
                        scalarValue20 = intermediateValue49;
                        scalarValue21 = intermediateValue51;
                        scalarValue22 = intermediateValue53;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue48 = intermediateValue49;
                intermediateValue50 = intermediateValue51;
                intermediateValue52 = intermediateValue53;
            }
            else
            {
                intermediateValue48 = exponentialValue1;
                intermediateValue50 = exponentialValue2;
                intermediateValue52 = exponentialValue3;
            }
            uint scalarValue28 = rayQueryGetIntersectionTypeEXT(intermediateValue46, bool(1u));
            float intermediateValue16;
            float intermediateValue20;
            float intermediateValue24;
            float intermediateValue27;
            if (scalarValue28 == 1u)
            {
                float scalarValue29 = rayQueryGetIntersectionTEXT(intermediateValue46, bool(1u));
                intermediateValue16 = 0.0;
                intermediateValue20 = 0.0;
                intermediateValue24 = 0.0;
                intermediateValue27 = scalarValue29;
            }
            else
            {
                intermediateValue16 = intermediateValue48;
                intermediateValue20 = intermediateValue50;
                intermediateValue24 = intermediateValue52;
                intermediateValue27 = 10000.0;
            }
            float branchMergedValue33;
            float branchMergedValue37;
            float branchMergedValue38;
            float branchMergedValue39;
            if (dot(vec3(intermediateValue16, intermediateValue20, intermediateValue24), vec3(1.0)) > 0.00999999977648258209228515625)
            {
                rayQueryInitializeEXT(intermediateValue79, SceneBVH, 512u, 22u, vec3(sumValue44, fma(ViewCB.packedValues[53u].y, intermediateValue35, reinterpretedBits3), sumValue45), 0.0, vec3(productValue29, productValue30, productValue31), 10000.0);
                bool conditionValue6 = rayQueryProceedEXT(intermediateValue79);
                float intermediateValue87;
                float intermediateValue89;
                float intermediateValue91;
                if (conditionValue6)
                {
                    float intermediateValue88;
                    float intermediateValue90;
                    float intermediateValue92;
                    float scalarValue30 = intermediateValue16;
                    float scalarValue31 = intermediateValue20;
                    float scalarValue32 = intermediateValue24;
                    bool comparisonValue27;
                    for (;;)
                    {
                        uint scalarValue33 = rayQueryGetIntersectionTypeEXT(intermediateValue79, bool(0u));
                        comparisonValue27 = scalarValue33 == 0u;
                        float branchMergedValue2;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        if (comparisonValue27)
                        {
                            vec2 vectorValue4 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue79, bool(0u));
                            vec2 vectorValue5 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue79, bool(0u));
                            float scalarValue34 = rayQueryGetIntersectionTEXT(intermediateValue79, bool(0u));
                            uint scalarValue35 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue79, bool(0u));
                            uint scalarValue36 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue79, bool(0u));
                            uint scalarValue37 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue79, bool(0u));
                            uint productValue113 = (scalarValue37 * 76u) + 58u;
                            uint productValue114 = (scalarValue37 * 76u) + 61u;
                            precise float sumValue95 = 1.0 - vectorValue4.x;
                            precise float sumValue96 = sumValue95 - vectorValue5.y;
                            uint bitwiseValue48 = (objectInstances_2.packedValues[(scalarValue37 * 38u) + 25u] >> 2u) + (scalarValue35 >> 1u);
                            uint productValue115 = uint(objectInstances.packedValues[(scalarValue37 * 76u) + 54u]) + 0u;
                            bool comparisonValue21 = (scalarValue35 & 1u) == 0u;
                            uint comparisonValue23 = comparisonValue21 ? faceUvBuffersRW[nonuniformEXT(productValue115)].packedValues[bitwiseValue48].z : faceUvBuffersRW[nonuniformEXT(productValue115)].packedValues[bitwiseValue48].x;
                            uint comparisonValue24 = comparisonValue21 ? faceUvBuffersRW[nonuniformEXT(productValue115)].packedValues[bitwiseValue48].y : faceUvBuffersRW[nonuniformEXT(productValue115)].packedValues[bitwiseValue48].w;
                            uint comparisonValue25 = comparisonValue21 ? faceUvBuffersRW[nonuniformEXT(productValue115)].packedValues[bitwiseValue48].x : faceUvBuffersRW[nonuniformEXT(productValue115)].packedValues[bitwiseValue48].z;
                            bool conditionValue7 = int16_t(objectInstances.packedValues[productValue114]) < int16_t(0us);
                            float intermediateValue131;
                            float intermediateValue132;
                            if (conditionValue7)
                            {
                                uint bitwiseValue49 = comparisonValue25 >> 15u;
                                precise float bitwiseValue50 = float(bitwiseValue49 & 1u) * 2.0;
                                precise float sumValue97 = bitwiseValue50 + (-1.0);
                                precise float bitwiseValue51 = float(comparisonValue25 >> 31u) * 2.0;
                                precise float sumValue98 = bitwiseValue51 + (-1.0);
                                precise float bitwiseValue52 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue53 = float(bitwiseValue49 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue116 = sumValue97 * 3.0517578125e-05;
                                precise float productValue117 = sumValue98 * 3.0517578125e-05;
                                precise float sumValue99 = bitwiseValue52 + productValue116;
                                precise float sumValue100 = bitwiseValue53 + productValue117;
                                intermediateValue131 = sumValue99;
                                intermediateValue132 = sumValue100;
                            }
                            else
                            {
                                precise float bitwiseValue54 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue55 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue118 = bitwiseValue54 * 16384.0;
                                precise float sumValue101 = productValue118 + 0.5;
                                precise float productValue119 = bitwiseValue55 * 16384.0;
                                precise float sumValue102 = productValue119 + 0.5;
                                precise float productValue120 = floor(sumValue101) * 6.103515625e-05;
                                precise float productValue121 = floor(sumValue102) * 6.103515625e-05;
                                intermediateValue131 = productValue120;
                                intermediateValue132 = productValue121;
                            }
                            precise float productValue122 = sumValue96 * intermediateValue131;
                            precise float productValue123 = sumValue96 * intermediateValue132;
                            precise float sumValue103 = productValue122 + 0.0;
                            precise float sumValue104 = productValue123 + 0.0;
                            float intermediateValue141;
                            float intermediateValue142;
                            if (conditionValue7)
                            {
                                uint bitwiseValue56 = comparisonValue24 >> 15u;
                                precise float bitwiseValue57 = float(bitwiseValue56 & 1u) * 2.0;
                                precise float sumValue105 = bitwiseValue57 + (-1.0);
                                precise float bitwiseValue58 = float(comparisonValue24 >> 31u) * 2.0;
                                precise float sumValue106 = bitwiseValue58 + (-1.0);
                                precise float bitwiseValue59 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue60 = float(bitwiseValue56 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue124 = sumValue105 * 3.0517578125e-05;
                                precise float productValue125 = sumValue106 * 3.0517578125e-05;
                                precise float sumValue107 = bitwiseValue59 + productValue124;
                                precise float sumValue108 = bitwiseValue60 + productValue125;
                                intermediateValue141 = sumValue107;
                                intermediateValue142 = sumValue108;
                            }
                            else
                            {
                                precise float bitwiseValue61 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue62 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue126 = bitwiseValue61 * 16384.0;
                                precise float sumValue109 = productValue126 + 0.5;
                                precise float productValue127 = bitwiseValue62 * 16384.0;
                                precise float sumValue110 = productValue127 + 0.5;
                                precise float productValue128 = floor(sumValue109) * 6.103515625e-05;
                                precise float productValue129 = floor(sumValue110) * 6.103515625e-05;
                                intermediateValue141 = productValue128;
                                intermediateValue142 = productValue129;
                            }
                            precise float productValue130 = vectorValue4.x * intermediateValue141;
                            precise float productValue131 = vectorValue4.x * intermediateValue142;
                            precise float sumValue111 = sumValue103 + productValue130;
                            precise float sumValue112 = sumValue104 + productValue131;
                            float intermediateValue152;
                            float intermediateValue153;
                            if (conditionValue7)
                            {
                                uint bitwiseValue63 = comparisonValue23 >> 15u;
                                precise float bitwiseValue64 = float(bitwiseValue63 & 1u) * 2.0;
                                precise float sumValue113 = bitwiseValue64 + (-1.0);
                                precise float bitwiseValue65 = float(comparisonValue23 >> 31u) * 2.0;
                                precise float sumValue114 = bitwiseValue65 + (-1.0);
                                precise float bitwiseValue66 = float((comparisonValue23 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue67 = float(bitwiseValue63 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue132 = sumValue113 * 3.0517578125e-05;
                                precise float productValue133 = sumValue114 * 3.0517578125e-05;
                                precise float sumValue115 = bitwiseValue66 + productValue132;
                                precise float sumValue116 = bitwiseValue67 + productValue133;
                                intermediateValue152 = sumValue115;
                                intermediateValue153 = sumValue116;
                            }
                            else
                            {
                                precise float bitwiseValue68 = float(comparisonValue23 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue69 = float(comparisonValue23 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue134 = bitwiseValue68 * 16384.0;
                                precise float sumValue117 = productValue134 + 0.5;
                                precise float productValue135 = bitwiseValue69 * 16384.0;
                                precise float sumValue118 = productValue135 + 0.5;
                                precise float productValue136 = floor(sumValue117) * 6.103515625e-05;
                                precise float productValue137 = floor(sumValue118) * 6.103515625e-05;
                                intermediateValue152 = productValue136;
                                intermediateValue153 = productValue137;
                            }
                            precise float productValue138 = vectorValue5.y * intermediateValue152;
                            precise float productValue139 = vectorValue5.y * intermediateValue153;
                            precise float sumValue119 = sumValue111 + productValue138;
                            precise float sumValue120 = sumValue112 + productValue139;
                            float intermediateValue156;
                            float intermediateValue157;
                            float intermediateValue158;
                            float intermediateValue159;
                            if (objectInstances.packedValues[productValue113] == 65535us)
                            {
                                intermediateValue156 = 1.0;
                                intermediateValue157 = 1.0;
                                intermediateValue158 = 1.0;
                                intermediateValue159 = 1.0;
                            }
                            else
                            {
                                uint reinterpretedBits12;
                                if (objectInstances.packedValues[productValue113] > 4095us)
                                {
                                    reinterpretedBits12 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits12 = uint(objectInstances.packedValues[productValue113]);
                                }
                                vec4 sampledTextureValue7 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits12 + 0u], defaultSampler)), vec2(sumValue119, sumValue120), spvNMin(fma(scalarValue34, 0.083333335816860198974609375, -0.25), 2.0));
                                intermediateValue156 = sampledTextureValue7.x;
                                intermediateValue157 = sampledTextureValue7.y;
                                intermediateValue158 = sampledTextureValue7.z;
                                intermediateValue159 = sampledTextureValue7.w;
                            }
                            float intermediateValue165;
                            float intermediateValue166;
                            float intermediateValue167;
                            if (scalarValue36 == 2u)
                            {
                                float branchMergedValue16;
                                float branchMergedValue21;
                                float branchMergedValue22;
                                if ((objectInstances.packedValues[productValue114] & 128us) == 0us)
                                {
                                    float intermediateValue168;
                                    if ((objectInstances.packedValues[productValue114] & 2048us) == 0us)
                                    {
                                        intermediateValue168 = intermediateValue159;
                                    }
                                    else
                                    {
                                        intermediateValue168 = spvNClamp(fma(intermediateValue159, 2.0, -1.0), 0.0, 1.0);
                                    }
                                    branchMergedValue16 = intermediateValue157 - (intermediateValue168 * intermediateValue157);
                                    branchMergedValue21 = intermediateValue156 - (intermediateValue168 * intermediateValue156);
                                    branchMergedValue22 = intermediateValue158 - (intermediateValue168 * intermediateValue158);
                                }
                                else
                                {
                                    branchMergedValue16 = 0.33399999141693115234375;
                                    branchMergedValue21 = 0.33399999141693115234375;
                                    branchMergedValue22 = 0.33399999141693115234375;
                                }
                                intermediateValue165 = branchMergedValue21;
                                intermediateValue166 = branchMergedValue16;
                                intermediateValue167 = branchMergedValue22;
                            }
                            else
                            {
                                float sumValue121 = 1.0 - intermediateValue159;
                                intermediateValue165 = sumValue121;
                                intermediateValue166 = sumValue121;
                                intermediateValue167 = sumValue121;
                            }
                            float productValue140 = intermediateValue165 * scalarValue30;
                            float productValue141 = intermediateValue166 * scalarValue31;
                            float productValue142 = intermediateValue167 * scalarValue32;
                            float intermediateValue122;
                            float intermediateValue123;
                            float intermediateValue124;
                            bool intermediateValue169;
                            if (!(dot(vec3(productValue140, productValue141, productValue142), vec3(1.0)) <= 0.00999999977648258209228515625))
                            {
                                intermediateValue169 = false;
                                intermediateValue122 = productValue140;
                                intermediateValue123 = productValue141;
                                intermediateValue124 = productValue142;
                            }
                            else
                            {
                                intermediateValue169 = true;
                                intermediateValue122 = 0.0;
                                intermediateValue123 = 0.0;
                                intermediateValue124 = 0.0;
                            }
                            float branchMergedValue25;
                            float branchMergedValue30;
                            float branchMergedValue31;
                            if (intermediateValue169)
                            {
                                rayQueryConfirmIntersectionEXT(intermediateValue79);
                                branchMergedValue25 = intermediateValue124;
                                branchMergedValue30 = intermediateValue122;
                                branchMergedValue31 = intermediateValue123;
                            }
                            else
                            {
                                branchMergedValue25 = intermediateValue124;
                                branchMergedValue30 = intermediateValue122;
                                branchMergedValue31 = intermediateValue123;
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
                        intermediateValue92 = branchMergedValue2;
                        intermediateValue88 = branchMergedValue7;
                        intermediateValue90 = branchMergedValue8;
                        bool conditionValue8 = rayQueryProceedEXT(intermediateValue79);
                        if (conditionValue8)
                        {
                            scalarValue30 = intermediateValue88;
                            scalarValue31 = intermediateValue90;
                            scalarValue32 = intermediateValue92;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue87 = intermediateValue88;
                    intermediateValue89 = intermediateValue90;
                    intermediateValue91 = intermediateValue92;
                }
                else
                {
                    intermediateValue87 = intermediateValue16;
                    intermediateValue89 = intermediateValue20;
                    intermediateValue91 = intermediateValue24;
                }
                uint scalarValue38 = rayQueryGetIntersectionTypeEXT(intermediateValue79, bool(1u));
                float intermediateValue15;
                float intermediateValue19;
                float intermediateValue23;
                float intermediateValue112;
                if (scalarValue38 == 1u)
                {
                    float scalarValue39 = rayQueryGetIntersectionTEXT(intermediateValue79, bool(1u));
                    intermediateValue15 = 0.0;
                    intermediateValue19 = 0.0;
                    intermediateValue23 = 0.0;
                    intermediateValue112 = scalarValue39;
                }
                else
                {
                    intermediateValue15 = intermediateValue87;
                    intermediateValue19 = intermediateValue89;
                    intermediateValue23 = intermediateValue91;
                    intermediateValue112 = 10000.0;
                }
                branchMergedValue33 = intermediateValue23;
                branchMergedValue37 = intermediateValue19;
                branchMergedValue38 = intermediateValue15;
                branchMergedValue39 = intermediateValue112 + intermediateValue27;
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
            if (uvec4(texelFetch(inputBufferPreviousMedium, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), int(0u))).x == 0u)
            {
                branchMergedValue32 = 0.0;
                branchMergedValue34 = 0.0;
                branchMergedValue35 = 0.0;
                branchMergedValue36 = -1.0;
            }
            else
            {
                rayQueryInitializeEXT(intermediateValue55, SceneBVH, 512u, 22u, vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4), 0.0, vec3(productValue29, productValue30, productValue31), 10000.0);
                bool conditionValue9 = rayQueryProceedEXT(intermediateValue55);
                float intermediateValue17;
                float intermediateValue21;
                float intermediateValue25;
                if (conditionValue9)
                {
                    float intermediateValue64;
                    float intermediateValue65;
                    float intermediateValue66;
                    float scalarValue40 = 1.0;
                    float scalarValue41 = 1.0;
                    float scalarValue42 = 1.0;
                    bool comparisonValue22;
                    for (;;)
                    {
                        uint scalarValue43 = rayQueryGetIntersectionTypeEXT(intermediateValue55, bool(0u));
                        comparisonValue22 = scalarValue43 == 0u;
                        float branchMergedValue1;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (comparisonValue22)
                        {
                            vec2 vectorValue6 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue55, bool(0u));
                            vec2 vectorValue7 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue55, bool(0u));
                            float scalarValue44 = rayQueryGetIntersectionTEXT(intermediateValue55, bool(0u));
                            uint scalarValue45 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue55, bool(0u));
                            uint scalarValue46 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue55, bool(0u));
                            uint scalarValue47 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue55, bool(0u));
                            uint productValue143 = (scalarValue47 * 76u) + 58u;
                            uint productValue144 = (scalarValue47 * 76u) + 61u;
                            precise float sumValue122 = 1.0 - vectorValue6.x;
                            precise float sumValue123 = sumValue122 - vectorValue7.y;
                            uint bitwiseValue70 = (objectInstances_2.packedValues[(scalarValue47 * 38u) + 25u] >> 2u) + (scalarValue45 >> 1u);
                            uint productValue145 = uint(objectInstances.packedValues[(scalarValue47 * 76u) + 54u]) + 0u;
                            bool comparisonValue26 = (scalarValue45 & 1u) == 0u;
                            uint comparisonValue28 = comparisonValue26 ? faceUvBuffersRW[nonuniformEXT(productValue145)].packedValues[bitwiseValue70].z : faceUvBuffersRW[nonuniformEXT(productValue145)].packedValues[bitwiseValue70].x;
                            uint comparisonValue29 = comparisonValue26 ? faceUvBuffersRW[nonuniformEXT(productValue145)].packedValues[bitwiseValue70].y : faceUvBuffersRW[nonuniformEXT(productValue145)].packedValues[bitwiseValue70].w;
                            uint comparisonValue30 = comparisonValue26 ? faceUvBuffersRW[nonuniformEXT(productValue145)].packedValues[bitwiseValue70].x : faceUvBuffersRW[nonuniformEXT(productValue145)].packedValues[bitwiseValue70].z;
                            bool conditionValue10 = int16_t(objectInstances.packedValues[productValue144]) < int16_t(0us);
                            float intermediateValue126;
                            float intermediateValue127;
                            if (conditionValue10)
                            {
                                uint bitwiseValue71 = comparisonValue30 >> 15u;
                                precise float bitwiseValue72 = float(bitwiseValue71 & 1u) * 2.0;
                                precise float sumValue124 = bitwiseValue72 + (-1.0);
                                precise float bitwiseValue73 = float(comparisonValue30 >> 31u) * 2.0;
                                precise float sumValue125 = bitwiseValue73 + (-1.0);
                                precise float bitwiseValue74 = float((comparisonValue30 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue75 = float(bitwiseValue71 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue146 = sumValue124 * 3.0517578125e-05;
                                precise float productValue147 = sumValue125 * 3.0517578125e-05;
                                precise float sumValue126 = bitwiseValue74 + productValue146;
                                precise float sumValue127 = bitwiseValue75 + productValue147;
                                intermediateValue126 = sumValue126;
                                intermediateValue127 = sumValue127;
                            }
                            else
                            {
                                precise float bitwiseValue76 = float(comparisonValue30 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue77 = float(comparisonValue30 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue148 = bitwiseValue76 * 16384.0;
                                precise float sumValue128 = productValue148 + 0.5;
                                precise float productValue149 = bitwiseValue77 * 16384.0;
                                precise float sumValue129 = productValue149 + 0.5;
                                precise float productValue150 = floor(sumValue128) * 6.103515625e-05;
                                precise float productValue151 = floor(sumValue129) * 6.103515625e-05;
                                intermediateValue126 = productValue150;
                                intermediateValue127 = productValue151;
                            }
                            precise float productValue152 = sumValue123 * intermediateValue126;
                            precise float productValue153 = sumValue123 * intermediateValue127;
                            precise float sumValue130 = productValue152 + 0.0;
                            precise float sumValue131 = productValue153 + 0.0;
                            float intermediateValue133;
                            float intermediateValue134;
                            if (conditionValue10)
                            {
                                uint bitwiseValue78 = comparisonValue29 >> 15u;
                                precise float bitwiseValue79 = float(bitwiseValue78 & 1u) * 2.0;
                                precise float sumValue132 = bitwiseValue79 + (-1.0);
                                precise float bitwiseValue80 = float(comparisonValue29 >> 31u) * 2.0;
                                precise float sumValue133 = bitwiseValue80 + (-1.0);
                                precise float bitwiseValue81 = float((comparisonValue29 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue82 = float(bitwiseValue78 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue154 = sumValue132 * 3.0517578125e-05;
                                precise float productValue155 = sumValue133 * 3.0517578125e-05;
                                precise float sumValue134 = bitwiseValue81 + productValue154;
                                precise float sumValue135 = bitwiseValue82 + productValue155;
                                intermediateValue133 = sumValue134;
                                intermediateValue134 = sumValue135;
                            }
                            else
                            {
                                precise float bitwiseValue83 = float(comparisonValue29 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue84 = float(comparisonValue29 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue156 = bitwiseValue83 * 16384.0;
                                precise float sumValue136 = productValue156 + 0.5;
                                precise float productValue157 = bitwiseValue84 * 16384.0;
                                precise float sumValue137 = productValue157 + 0.5;
                                precise float productValue158 = floor(sumValue136) * 6.103515625e-05;
                                precise float productValue159 = floor(sumValue137) * 6.103515625e-05;
                                intermediateValue133 = productValue158;
                                intermediateValue134 = productValue159;
                            }
                            precise float productValue160 = vectorValue6.x * intermediateValue133;
                            precise float productValue161 = vectorValue6.x * intermediateValue134;
                            precise float sumValue138 = sumValue130 + productValue160;
                            precise float sumValue139 = sumValue131 + productValue161;
                            float intermediateValue143;
                            float intermediateValue144;
                            if (conditionValue10)
                            {
                                uint bitwiseValue85 = comparisonValue28 >> 15u;
                                precise float bitwiseValue86 = float(bitwiseValue85 & 1u) * 2.0;
                                precise float sumValue140 = bitwiseValue86 + (-1.0);
                                precise float bitwiseValue87 = float(comparisonValue28 >> 31u) * 2.0;
                                precise float sumValue141 = bitwiseValue87 + (-1.0);
                                precise float bitwiseValue88 = float((comparisonValue28 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue89 = float(bitwiseValue85 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue162 = sumValue140 * 3.0517578125e-05;
                                precise float productValue163 = sumValue141 * 3.0517578125e-05;
                                precise float sumValue142 = bitwiseValue88 + productValue162;
                                precise float sumValue143 = bitwiseValue89 + productValue163;
                                intermediateValue143 = sumValue142;
                                intermediateValue144 = sumValue143;
                            }
                            else
                            {
                                precise float bitwiseValue90 = float(comparisonValue28 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue91 = float(comparisonValue28 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue164 = bitwiseValue90 * 16384.0;
                                precise float sumValue144 = productValue164 + 0.5;
                                precise float productValue165 = bitwiseValue91 * 16384.0;
                                precise float sumValue145 = productValue165 + 0.5;
                                precise float productValue166 = floor(sumValue144) * 6.103515625e-05;
                                precise float productValue167 = floor(sumValue145) * 6.103515625e-05;
                                intermediateValue143 = productValue166;
                                intermediateValue144 = productValue167;
                            }
                            precise float productValue168 = vectorValue7.y * intermediateValue143;
                            precise float productValue169 = vectorValue7.y * intermediateValue144;
                            precise float sumValue146 = sumValue138 + productValue168;
                            precise float sumValue147 = sumValue139 + productValue169;
                            float intermediateValue145;
                            float intermediateValue146;
                            float intermediateValue147;
                            float intermediateValue148;
                            if (objectInstances.packedValues[productValue143] == 65535us)
                            {
                                intermediateValue145 = 1.0;
                                intermediateValue146 = 1.0;
                                intermediateValue147 = 1.0;
                                intermediateValue148 = 1.0;
                            }
                            else
                            {
                                uint reinterpretedBits11;
                                if (objectInstances.packedValues[productValue143] > 4095us)
                                {
                                    reinterpretedBits11 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits11 = uint(objectInstances.packedValues[productValue143]);
                                }
                                vec4 sampledTextureValue8 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits11 + 0u], defaultSampler)), vec2(sumValue146, sumValue147), spvNMin(fma(scalarValue44, 0.083333335816860198974609375, -0.25), 2.0));
                                intermediateValue145 = sampledTextureValue8.x;
                                intermediateValue146 = sampledTextureValue8.y;
                                intermediateValue147 = sampledTextureValue8.z;
                                intermediateValue148 = sampledTextureValue8.w;
                            }
                            float intermediateValue160;
                            float intermediateValue161;
                            float intermediateValue162;
                            if (scalarValue46 == 2u)
                            {
                                float branchMergedValue12;
                                float branchMergedValue19;
                                float branchMergedValue20;
                                if ((objectInstances.packedValues[productValue144] & 128us) == 0us)
                                {
                                    float intermediateValue163;
                                    if ((objectInstances.packedValues[productValue144] & 2048us) == 0us)
                                    {
                                        intermediateValue163 = intermediateValue148;
                                    }
                                    else
                                    {
                                        intermediateValue163 = spvNClamp(fma(intermediateValue148, 2.0, -1.0), 0.0, 1.0);
                                    }
                                    branchMergedValue12 = intermediateValue147 - (intermediateValue163 * intermediateValue147);
                                    branchMergedValue19 = intermediateValue145 - (intermediateValue163 * intermediateValue145);
                                    branchMergedValue20 = intermediateValue146 - (intermediateValue163 * intermediateValue146);
                                }
                                else
                                {
                                    branchMergedValue12 = 0.33399999141693115234375;
                                    branchMergedValue19 = 0.33399999141693115234375;
                                    branchMergedValue20 = 0.33399999141693115234375;
                                }
                                intermediateValue160 = branchMergedValue19;
                                intermediateValue161 = branchMergedValue20;
                                intermediateValue162 = branchMergedValue12;
                            }
                            else
                            {
                                float sumValue148 = 1.0 - intermediateValue148;
                                intermediateValue160 = sumValue148;
                                intermediateValue161 = sumValue148;
                                intermediateValue162 = sumValue148;
                            }
                            float productValue170 = intermediateValue160 * scalarValue40;
                            float productValue171 = intermediateValue161 * scalarValue41;
                            float productValue172 = intermediateValue162 * scalarValue42;
                            float intermediateValue101;
                            float intermediateValue102;
                            float intermediateValue103;
                            bool intermediateValue164;
                            if (!(dot(vec3(productValue170, productValue171, productValue172), vec3(1.0)) <= 0.00999999977648258209228515625))
                            {
                                intermediateValue164 = false;
                                intermediateValue101 = productValue170;
                                intermediateValue102 = productValue171;
                                intermediateValue103 = productValue172;
                            }
                            else
                            {
                                intermediateValue164 = true;
                                intermediateValue101 = 0.0;
                                intermediateValue102 = 0.0;
                                intermediateValue103 = 0.0;
                            }
                            float branchMergedValue24;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            if (intermediateValue164)
                            {
                                rayQueryConfirmIntersectionEXT(intermediateValue55);
                                branchMergedValue24 = intermediateValue101;
                                branchMergedValue28 = intermediateValue103;
                                branchMergedValue29 = intermediateValue102;
                            }
                            else
                            {
                                branchMergedValue24 = intermediateValue101;
                                branchMergedValue28 = intermediateValue103;
                                branchMergedValue29 = intermediateValue102;
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
                        intermediateValue64 = branchMergedValue1;
                        intermediateValue66 = branchMergedValue5;
                        intermediateValue65 = branchMergedValue6;
                        bool conditionValue11 = rayQueryProceedEXT(intermediateValue55);
                        if (conditionValue11)
                        {
                            scalarValue40 = intermediateValue64;
                            scalarValue41 = intermediateValue65;
                            scalarValue42 = intermediateValue66;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue17 = intermediateValue64;
                    intermediateValue21 = intermediateValue65;
                    intermediateValue25 = intermediateValue66;
                }
                else
                {
                    intermediateValue17 = 1.0;
                    intermediateValue21 = 1.0;
                    intermediateValue25 = 1.0;
                }
                uint scalarValue48 = rayQueryGetIntersectionTypeEXT(intermediateValue55, bool(1u));
                float branchMergedValue40;
                float branchMergedValue41;
                float branchMergedValue42;
                float branchMergedValue43;
                if (scalarValue48 == 1u)
                {
                    float scalarValue49 = rayQueryGetIntersectionTEXT(intermediateValue55, bool(1u));
                    branchMergedValue40 = 0.0;
                    branchMergedValue41 = 0.0;
                    branchMergedValue42 = 0.0;
                    branchMergedValue43 = scalarValue49;
                }
                else
                {
                    branchMergedValue40 = intermediateValue25;
                    branchMergedValue41 = intermediateValue21;
                    branchMergedValue42 = intermediateValue17;
                    branchMergedValue43 = 10000.0;
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
    uint reinterpretedBits5 = floatBitsToUint(intermediateValue14) & 2147483647u;
    uint reinterpretedBits6 = floatBitsToUint(intermediateValue18) & 2147483647u;
    uint reinterpretedBits7 = floatBitsToUint(intermediateValue22) & 2147483647u;
    uint reinterpretedBits8 = floatBitsToUint(intermediateValue26) & 2147483647u;
    bool comparisonValue31 = ((((reinterpretedBits5 > 2139095040u) || (reinterpretedBits6 > 2139095040u)) || (reinterpretedBits7 > 2139095040u)) || (reinterpretedBits8 > 2139095040u)) || ((((reinterpretedBits5 == 2139095040u) || (reinterpretedBits6 == 2139095040u)) || (reinterpretedBits7 == 2139095040u)) || (reinterpretedBits8 == 2139095040u));
    bool intermediateValue31;
    if (comparisonValue31)
    {
        bool branchMergedValue9;
        if (imageLoad(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3))).w == 0.0)
        {
            imageStore(outputBufferDebug, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(1.0, 0.0, 0.0, 1.0));
            imageStore(outputBufferDebug, ivec2(uvec2(0u)), vec4(imageLoad(outputBufferDebug, ivec2(uvec2(0u))).xyz, 1.0));
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
        imageStore(outputBufferSunLightShadow, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue14, intermediateValue18, intermediateValue22, intermediateValue26));
    }
}
