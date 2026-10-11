#version 460
#extension GL_GOOGLE_include_directive : require
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
    uint productValue = (bitwiseValue3 * uint(ViewCB.packedValues[78u].x)) + bitwiseValue2;
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
    reinterpretedBits1 = (((((bitwiseValue16 << 1u) | bitwiseValue16) << 1u) & 2863311530u) | (((bitwiseValue13 << 1u) | bitwiseValue13) & 1431655765u)) + floatBitsToUint(ViewCB.packedValues[84u]).z;
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
    precise float sumValue2 = float(bitwiseValue2) + 0.5;
    precise float sumValue3 = float(bitwiseValue3) + 0.5;
    uint productValue1 = (bitwiseValue17 * 1664525u) + 1013904223u;
    precise float bitwiseValue19 = float(productValue1 & 16777215u) * 5.9604644775390625e-08;
    uint productValue2 = (productValue1 * 1664525u) + 1013904223u;
    precise float bitwiseValue20 = float(productValue2 & 16777215u) * 5.9604644775390625e-08;
    precise float sumValue4 = bitwiseValue19 + (-0.5);
    precise float sumValue5 = bitwiseValue20 + (-0.5);
    precise float sumValue6 = sumValue2 + sumValue4;
    precise float sumValue7 = sumValue3 + sumValue5;
    precise float quotientValue = sumValue6 / ViewCB.packedValues[78u].x;
    precise float quotientValue1 = sumValue7 / ViewCB.packedValues[78u].y;
    precise float productValue3 = quotientValue * 2.0;
    precise float productValue4 = quotientValue1 * 2.0;
    precise float sumValue8 = productValue3 + (-1.0);
    precise float sumValue9 = 1.0 - productValue4;
    float reinterpretedBits2 = uintBitsToFloat(inputIncidentLight.packedValues[0u]);
    uint reinterpretedBits3 = uint(floatBitsToUint(ViewCB.packedValues[54u]).w != 0u);
    precise float productValue5 = ViewCB.packedValues[78u].z * ViewCB.packedValues[81u].z;
    precise float productValue6 = ViewCB.packedValues[78u].w * ViewCB.packedValues[81u].w;
    precise float productValue7 = productValue5 * 2.0;
    precise float productValue8 = productValue6 * 2.0;
    precise float sumValue10 = sumValue8 + productValue7;
    precise float sumValue11 = sumValue9 - productValue8;
    precise float productValue9 = ViewCB.packedValues[20u].x * sumValue10;
    precise float productValue10 = sumValue11 * ViewCB.packedValues[21u].x;
    precise float sumValue12 = productValue10 + productValue9;
    precise float productValue11 = 0.5 * ViewCB.packedValues[22u].x;
    precise float sumValue13 = productValue11 + sumValue12;
    precise float productValue12 = 1.0 * ViewCB.packedValues[23u].x;
    precise float sumValue14 = productValue12 + sumValue13;
    precise float productValue13 = ViewCB.packedValues[20u].y * sumValue10;
    precise float productValue14 = sumValue11 * ViewCB.packedValues[21u].y;
    precise float sumValue15 = productValue14 + productValue13;
    precise float productValue15 = 0.5 * ViewCB.packedValues[22u].y;
    precise float sumValue16 = productValue15 + sumValue15;
    precise float productValue16 = 1.0 * ViewCB.packedValues[23u].y;
    precise float sumValue17 = productValue16 + sumValue16;
    precise float productValue17 = ViewCB.packedValues[20u].z * sumValue10;
    precise float productValue18 = sumValue11 * ViewCB.packedValues[21u].z;
    precise float sumValue18 = productValue18 + productValue17;
    precise float productValue19 = 0.5 * ViewCB.packedValues[22u].z;
    precise float sumValue19 = productValue19 + sumValue18;
    precise float productValue20 = 1.0 * ViewCB.packedValues[23u].z;
    precise float sumValue20 = productValue20 + sumValue19;
    precise float productValue21 = ViewCB.packedValues[20u].w * sumValue10;
    precise float productValue22 = sumValue11 * ViewCB.packedValues[21u].w;
    precise float sumValue21 = productValue22 + productValue21;
    precise float productValue23 = 0.5 * ViewCB.packedValues[22u].w;
    precise float sumValue22 = productValue23 + sumValue21;
    precise float productValue24 = 1.0 * ViewCB.packedValues[23u].w;
    precise float sumValue23 = productValue24 + sumValue22;
    precise float quotientValue2 = sumValue14 / sumValue23;
    precise float quotientValue3 = sumValue17 / sumValue23;
    precise float quotientValue4 = sumValue20 / sumValue23;
    precise float sumValue24 = quotientValue2 - ViewCB.packedValues[72u].x;
    precise float sumValue25 = quotientValue3 - ViewCB.packedValues[72u].y;
    precise float sumValue26 = quotientValue4 - ViewCB.packedValues[72u].z;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    uint intermediateValue13;
    if (ViewCB.packedValues[93u].z == 0.0)
    {
        intermediateValue7 = sumValue24;
        intermediateValue8 = sumValue25;
        intermediateValue9 = sumValue26;
        intermediateValue10 = ViewCB.packedValues[72u].x;
        intermediateValue11 = ViewCB.packedValues[72u].y;
        intermediateValue12 = ViewCB.packedValues[72u].z;
        intermediateValue13 = productValue2;
    }
    else
    {
        float inverseLengthValue = inversesqrt(dot(vec3(sumValue24, sumValue25, sumValue26), vec3(sumValue24, sumValue25, sumValue26)));
        precise float productValue25 = sumValue25 * inverseLengthValue;
        precise float productValue26 = ViewCB.packedValues[78u].x * 0.5;
        precise float productValue27 = ViewCB.packedValues[78u].y * 0.5;
        uint scalarValue1 = uint(int(productValue27));
        uint sumValue27 = uint(int(productValue26)) + 4294967290u;
        uint sumValue28 = scalarValue1 + 4294967294u;
        float intermediateValue18;
        uint intermediateValue19;
        intermediateValue18 = 0.0;
        intermediateValue19 = 0u;
        float comparisonValue1;
        for (;;)
        {
            uint bitwiseValue21 = sumValue27 + (intermediateValue19 << 1u);
            vec4 loadedBufferValue = imageLoad(outputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue21, sumValue28)));
            float scalarValue2 = loadedBufferValue.x;
            float comparisonValue2 = (scalarValue2 < intermediateValue18) ? scalarValue2 : intermediateValue18;
            vec4 loadedBufferValue1 = imageLoad(outputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue21, scalarValue1)));
            float scalarValue3 = loadedBufferValue1.x;
            float comparisonValue3 = (scalarValue3 < comparisonValue2) ? scalarValue3 : comparisonValue2;
            vec4 loadedBufferValue2 = imageLoad(outputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue21, scalarValue1 + 2u)));
            float scalarValue4 = loadedBufferValue2.x;
            comparisonValue1 = (scalarValue4 < comparisonValue3) ? scalarValue4 : comparisonValue3;
            uint sumValue29 = intermediateValue19 + 1u;
            if (sumValue29 == 7u)
            {
                break;
            }
            else
            {
                intermediateValue18 = comparisonValue1;
                intermediateValue19 = sumValue29;
            }
        }
        precise float productValue28 = sumValue24 * inverseLengthValue;
        precise float productValue29 = sumValue26 * inverseLengthValue;
        float comparisonValue5 = (ViewCB.packedValues[93u].y <= 0.0) ? ((comparisonValue1 == 65504.0) ? 10000.0 : comparisonValue1) : ViewCB.packedValues[93u].y;
        precise float productValue30 = productValue28 * comparisonValue5;
        precise float productValue31 = productValue25 * comparisonValue5;
        precise float productValue32 = productValue29 * comparisonValue5;
        precise float sumValue30 = ViewCB.packedValues[72u].x + productValue30;
        precise float sumValue31 = ViewCB.packedValues[72u].y + productValue31;
        precise float sumValue32 = ViewCB.packedValues[72u].z + productValue32;
        precise float sumValue33 = productValue7 + 0.0;
        precise float sumValue34 = 0.0 - productValue8;
        precise float productValue33 = ViewCB.packedValues[20u].x * sumValue33;
        precise float productValue34 = sumValue34 * ViewCB.packedValues[21u].x;
        precise float sumValue35 = productValue34 + productValue33;
        precise float productValue35 = 0.5 * ViewCB.packedValues[22u].x;
        precise float sumValue36 = productValue35 + sumValue35;
        precise float productValue36 = 1.0 * ViewCB.packedValues[23u].x;
        precise float sumValue37 = productValue36 + sumValue36;
        precise float productValue37 = ViewCB.packedValues[20u].y * sumValue33;
        precise float productValue38 = sumValue34 * ViewCB.packedValues[21u].y;
        precise float sumValue38 = productValue38 + productValue37;
        precise float productValue39 = 0.5 * ViewCB.packedValues[22u].y;
        precise float sumValue39 = productValue39 + sumValue38;
        precise float productValue40 = 1.0 * ViewCB.packedValues[23u].y;
        precise float sumValue40 = productValue40 + sumValue39;
        precise float productValue41 = ViewCB.packedValues[20u].z * sumValue33;
        precise float productValue42 = sumValue34 * ViewCB.packedValues[21u].z;
        precise float sumValue41 = productValue42 + productValue41;
        precise float productValue43 = 0.5 * ViewCB.packedValues[22u].z;
        precise float sumValue42 = productValue43 + sumValue41;
        precise float productValue44 = 1.0 * ViewCB.packedValues[23u].z;
        precise float sumValue43 = productValue44 + sumValue42;
        precise float productValue45 = ViewCB.packedValues[20u].w * sumValue33;
        precise float productValue46 = sumValue34 * ViewCB.packedValues[21u].w;
        precise float sumValue44 = productValue46 + productValue45;
        precise float productValue47 = 0.5 * ViewCB.packedValues[22u].w;
        precise float sumValue45 = productValue47 + sumValue44;
        precise float productValue48 = 1.0 * ViewCB.packedValues[23u].w;
        precise float sumValue46 = productValue48 + sumValue45;
        precise float quotientValue5 = sumValue37 / sumValue46;
        precise float quotientValue6 = sumValue40 / sumValue46;
        precise float quotientValue7 = sumValue43 / sumValue46;
        precise float sumValue47 = quotientValue5 - ViewCB.packedValues[72u].x;
        precise float sumValue48 = quotientValue6 - ViewCB.packedValues[72u].y;
        precise float sumValue49 = quotientValue7 - ViewCB.packedValues[72u].z;
        float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue47, sumValue48, sumValue49), vec3(sumValue47, sumValue48, sumValue49)));
        precise float productValue49 = sumValue47 * inverseLengthValue1;
        precise float productValue50 = sumValue48 * inverseLengthValue1;
        precise float productValue51 = sumValue49 * inverseLengthValue1;
        precise float productValue52 = productValue50 * 0.0;
        precise float productValue53 = productValue51 * 0.0;
        precise float sumValue50 = productValue52 - productValue53;
        precise float productValue54 = productValue49 * 0.0;
        precise float sumValue51 = productValue51 - productValue54;
        precise float sumValue52 = productValue54 - productValue50;
        precise float productValue55 = productValue51 * sumValue51;
        precise float productValue56 = productValue50 * sumValue52;
        precise float sumValue53 = productValue55 - productValue56;
        precise float productValue57 = productValue49 * sumValue52;
        precise float productValue58 = productValue51 * sumValue50;
        precise float sumValue54 = productValue57 - productValue58;
        precise float productValue59 = productValue50 * sumValue50;
        precise float productValue60 = productValue49 * sumValue51;
        precise float sumValue55 = productValue59 - productValue60;
        uvec4 reinterpretedBits4 = floatBitsToUint(ViewCB.packedValues[93u]);
        uint scalarValue5 = reinterpretedBits4.w;
        uint productValue61 = (productValue2 * 1664525u) + 1013904223u;
        precise float bitwiseValue23 = float(productValue61 & 16777215u) * 5.9604644775390625e-08;
        uint productValue62 = (productValue61 * 1664525u) + 1013904223u;
        precise float bitwiseValue24 = float(productValue62 & 16777215u) * 5.9604644775390625e-08;
        precise float productValue63 = bitwiseValue23 * 2.0;
        precise float sumValue56 = productValue63 + (-1.0);
        precise float productValue64 = bitwiseValue24 * 2.0;
        precise float sumValue57 = productValue64 + (-1.0);
        precise float productValue65 = sumValue56 * sumValue56;
        precise float productValue66 = sumValue57 * sumValue57;
        bool conditionValue = productValue65 > productValue66;
        float intermediateValue135;
        float intermediateValue136;
        if (scalarValue5 < 5u)
        {
            float intermediateValue125;
            float intermediateValue126;
            if (conditionValue)
            {
                precise float quotientValue8 = sumValue57 / sumValue56;
                precise float productValue67 = quotientValue8 * 0.785398185253143310546875;
                intermediateValue125 = productValue67;
                intermediateValue126 = sumValue56;
            }
            else
            {
                precise float quotientValue9 = sumValue56 / sumValue57;
                precise float productValue68 = quotientValue9 * 0.785398185253143310546875;
                precise float sumValue58 = 1.57079637050628662109375 - productValue68;
                intermediateValue125 = sumValue58;
                intermediateValue126 = sumValue57;
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
                precise float quotientValue10 = sumValue57 / sumValue56;
                precise float productValue69 = quotientValue10 * 0.785398185253143310546875;
                intermediateValue127 = productValue69;
                intermediateValue128 = sumValue56;
            }
            else
            {
                precise float quotientValue11 = sumValue56 / sumValue57;
                precise float productValue70 = quotientValue11 * 0.785398185253143310546875;
                precise float sumValue59 = 1.57079637050628662109375 - productValue70;
                intermediateValue127 = sumValue59;
                intermediateValue128 = sumValue57;
            }
            precise float wavePhaseValue2 = intermediateValue128 * cos(intermediateValue127);
            precise float wavePhaseValue3 = intermediateValue128 * sin(intermediateValue127);
            precise float quotientValue12 = 6.283185482025146484375 / float(int(scalarValue5));
            precise float productValue71 = wavePhaseValue2 * wavePhaseValue2;
            precise float productValue72 = wavePhaseValue3 * wavePhaseValue3;
            precise float sumValue60 = productValue71 + productValue72;
            float nonlinearValue = sqrt(sumValue60);
            float inverseLengthValue2 = inversesqrt(dot(vec2(wavePhaseValue2, wavePhaseValue3), vec2(wavePhaseValue2, wavePhaseValue3)));
            precise float productValue73 = wavePhaseValue2 * inverseLengthValue2;
            precise float productValue74 = wavePhaseValue3 * inverseLengthValue2;
            precise float dotProductValue = acos(dot(vec2(0.0, 1.0), vec2(productValue73, productValue74))) / quotientValue12;
            precise float sumValue61 = (-0.0) - dotProductValue;
            float scalarValue6 = fract(abs(dotProductValue));
            precise float sumValue62 = (-0.0) - scalarValue6;
            precise float comparisonValue6 = quotientValue12 * ((dotProductValue >= sumValue61) ? scalarValue6 : sumValue62);
            float wavePhaseValue4 = sin(quotientValue12);
            float wavePhaseValue5 = cos(quotientValue12);
            precise float wavePhaseValue6 = nonlinearValue * sin(comparisonValue6);
            precise float wavePhaseValue7 = nonlinearValue * cos(comparisonValue6);
            precise float sumValue63 = wavePhaseValue7 - wavePhaseValue5;
            precise float productValue75 = wavePhaseValue4 * sumValue63;
            precise float sumValue64 = wavePhaseValue4 - wavePhaseValue6;
            precise float sumValue65 = 1.0 - wavePhaseValue5;
            precise float productValue76 = sumValue65 * sumValue64;
            precise float sumValue66 = productValue75 - productValue76;
            precise float productValue77 = sumValue65 * wavePhaseValue6;
            precise float sumValue67 = 0.0 - wavePhaseValue7;
            precise float productValue78 = wavePhaseValue4 * sumValue67;
            precise float sumValue68 = productValue77 - productValue78;
            precise float quotientValue13 = sumValue66 / sumValue68;
            precise float productValue79 = wavePhaseValue6 * quotientValue13;
            precise float productValue80 = quotientValue13 * sumValue67;
            precise float sumValue69 = productValue79 - wavePhaseValue6;
            precise float sumValue70 = wavePhaseValue7 + productValue80;
            precise float productValue81 = sumValue69 * sumValue69;
            precise float productValue82 = sumValue70 * sumValue70;
            precise float sumValue71 = productValue81 + productValue82;
            float nonlinearValue1 = sqrt(sumValue71);
            float branchMergedValue24;
            float branchMergedValue47;
            if (nonlinearValue1 < nonlinearValue)
            {
                precise float sumValue72 = 1.0 - nonlinearValue1;
                precise float sumValue73 = nonlinearValue - nonlinearValue1;
                precise float quotientValue14 = sumValue73 / sumValue72;
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
        precise float productValue86 = ViewCB.packedValues[93u].z * intermediateValue135;
        precise float productValue87 = ViewCB.packedValues[93u].z * intermediateValue136;
        precise float productValue88 = sumValue53 * productValue86;
        precise float productValue89 = sumValue54 * productValue86;
        precise float productValue90 = sumValue55 * productValue86;
        precise float sumValue74 = ViewCB.packedValues[72u].x + productValue88;
        precise float sumValue75 = ViewCB.packedValues[72u].y + productValue89;
        precise float sumValue76 = ViewCB.packedValues[72u].z + productValue90;
        precise float productValue91 = sumValue50 * productValue87;
        precise float productValue92 = sumValue51 * productValue87;
        precise float productValue93 = sumValue52 * productValue87;
        precise float sumValue77 = productValue91 + sumValue74;
        precise float sumValue78 = productValue92 + sumValue75;
        precise float sumValue79 = productValue93 + sumValue76;
        precise float sumValue80 = sumValue30 - sumValue77;
        precise float sumValue81 = sumValue31 - sumValue78;
        precise float sumValue82 = sumValue32 - sumValue79;
        intermediateValue7 = sumValue80;
        intermediateValue8 = sumValue81;
        intermediateValue9 = sumValue82;
        intermediateValue10 = sumValue77;
        intermediateValue11 = sumValue78;
        intermediateValue12 = sumValue79;
        intermediateValue13 = productValue62;
    }
    float inverseLengthValue3 = inversesqrt(dot(vec3(intermediateValue7, intermediateValue8, intermediateValue9), vec3(intermediateValue7, intermediateValue8, intermediateValue9)));
    precise float productValue94 = intermediateValue7 * inverseLengthValue3;
    precise float productValue95 = intermediateValue8 * inverseLengthValue3;
    precise float productValue96 = intermediateValue9 * inverseLengthValue3;
    rayQueryInitializeEXT(intermediateValue14, SceneBVH, 512u, 109u, vec3(intermediateValue10, intermediateValue11, intermediateValue12), 0.001000000047497451305389404296875, vec3(productValue94, productValue95, productValue96), 10000.0);
    bool conditionValue1 = rayQueryProceedEXT(intermediateValue14);
    if (conditionValue1)
    {
        bool intermediateValue41;
        bool comparisonValue4;
        for (;;)
        {
            uint scalarValue7 = rayQueryGetIntersectionTypeEXT(intermediateValue14, bool(0u));
            comparisonValue4 = scalarValue7 == 0u;
            if (comparisonValue4)
            {
                vec2 vectorValue = rayQueryGetIntersectionBarycentricsEXT(intermediateValue14, bool(0u));
                vec2 vectorValue1 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue14, bool(0u));
                uint scalarValue8 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue14, bool(0u));
                uint scalarValue9 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue14, bool(0u));
                uint scalarValue10 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue14, bool(0u));
                uint productValue97 = (scalarValue10 * 76u) + 58u;
                uint productValue98 = (scalarValue10 * 76u) + 61u;
                precise float sumValue83 = 1.0 - vectorValue.x;
                precise float sumValue84 = sumValue83 - vectorValue1.y;
                uint bitwiseValue25 = (objectInstances_2.packedValues[(scalarValue10 * 38u) + 25u] >> 2u) + (scalarValue8 >> 1u);
                uint productValue99 = uint(objectInstances.packedValues[(scalarValue10 * 76u) + 54u]) + 0u;
                bool comparisonValue7 = (scalarValue8 & 1u) == 0u;
                uint comparisonValue8 = comparisonValue7 ? faceUvBuffersRW[nonuniformEXT(productValue99)].packedValues[bitwiseValue25].z : faceUvBuffersRW[nonuniformEXT(productValue99)].packedValues[bitwiseValue25].x;
                uint comparisonValue9 = comparisonValue7 ? faceUvBuffersRW[nonuniformEXT(productValue99)].packedValues[bitwiseValue25].y : faceUvBuffersRW[nonuniformEXT(productValue99)].packedValues[bitwiseValue25].w;
                uint comparisonValue10 = comparisonValue7 ? faceUvBuffersRW[nonuniformEXT(productValue99)].packedValues[bitwiseValue25].x : faceUvBuffersRW[nonuniformEXT(productValue99)].packedValues[bitwiseValue25].z;
                bool conditionValue2 = int16_t(objectInstances.packedValues[productValue98]) < int16_t(0us);
                float intermediateValue112;
                float intermediateValue113;
                if (conditionValue2)
                {
                    uint bitwiseValue26 = comparisonValue10 >> 15u;
                    precise float bitwiseValue27 = float(bitwiseValue26 & 1u) * 2.0;
                    precise float sumValue85 = bitwiseValue27 + (-1.0);
                    precise float bitwiseValue28 = float(comparisonValue10 >> 31u) * 2.0;
                    precise float sumValue86 = bitwiseValue28 + (-1.0);
                    precise float bitwiseValue29 = float((comparisonValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue30 = float(bitwiseValue26 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue100 = sumValue85 * 3.0517578125e-05;
                    precise float productValue101 = sumValue86 * 3.0517578125e-05;
                    precise float sumValue87 = bitwiseValue29 + productValue100;
                    precise float sumValue88 = bitwiseValue30 + productValue101;
                    intermediateValue112 = sumValue87;
                    intermediateValue113 = sumValue88;
                }
                else
                {
                    precise float bitwiseValue31 = float(comparisonValue10 & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue32 = float(comparisonValue10 >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue102 = bitwiseValue31 * 16384.0;
                    precise float sumValue89 = productValue102 + 0.5;
                    precise float productValue103 = bitwiseValue32 * 16384.0;
                    precise float sumValue91 = productValue103 + 0.5;
                    precise float productValue104 = floor(sumValue89) * 6.103515625e-05;
                    precise float productValue105 = floor(sumValue91) * 6.103515625e-05;
                    intermediateValue112 = productValue104;
                    intermediateValue113 = productValue105;
                }
                precise float productValue106 = sumValue84 * intermediateValue112;
                precise float productValue107 = sumValue84 * intermediateValue113;
                precise float sumValue92 = productValue106 + 0.0;
                precise float sumValue93 = productValue107 + 0.0;
                float intermediateValue137;
                float intermediateValue138;
                if (conditionValue2)
                {
                    uint bitwiseValue33 = comparisonValue9 >> 15u;
                    precise float bitwiseValue34 = float(bitwiseValue33 & 1u) * 2.0;
                    precise float sumValue94 = bitwiseValue34 + (-1.0);
                    precise float bitwiseValue35 = float(comparisonValue9 >> 31u) * 2.0;
                    precise float sumValue95 = bitwiseValue35 + (-1.0);
                    precise float bitwiseValue36 = float((comparisonValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue37 = float(bitwiseValue33 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue108 = sumValue94 * 3.0517578125e-05;
                    precise float productValue109 = sumValue95 * 3.0517578125e-05;
                    precise float sumValue96 = bitwiseValue36 + productValue108;
                    precise float sumValue97 = bitwiseValue37 + productValue109;
                    intermediateValue137 = sumValue96;
                    intermediateValue138 = sumValue97;
                }
                else
                {
                    precise float bitwiseValue38 = float(comparisonValue9 & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue39 = float(comparisonValue9 >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue110 = bitwiseValue38 * 16384.0;
                    precise float sumValue98 = productValue110 + 0.5;
                    precise float productValue111 = bitwiseValue39 * 16384.0;
                    precise float sumValue99 = productValue111 + 0.5;
                    precise float productValue112 = floor(sumValue98) * 6.103515625e-05;
                    precise float productValue113 = floor(sumValue99) * 6.103515625e-05;
                    intermediateValue137 = productValue112;
                    intermediateValue138 = productValue113;
                }
                precise float productValue114 = vectorValue.x * intermediateValue137;
                precise float productValue115 = vectorValue.x * intermediateValue138;
                precise float sumValue100 = sumValue92 + productValue114;
                precise float sumValue101 = sumValue93 + productValue115;
                float intermediateValue173;
                float intermediateValue174;
                if (conditionValue2)
                {
                    uint bitwiseValue40 = comparisonValue8 >> 15u;
                    precise float bitwiseValue41 = float(bitwiseValue40 & 1u) * 2.0;
                    precise float sumValue102 = bitwiseValue41 + (-1.0);
                    precise float bitwiseValue42 = float(comparisonValue8 >> 31u) * 2.0;
                    precise float sumValue103 = bitwiseValue42 + (-1.0);
                    precise float bitwiseValue43 = float((comparisonValue8 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue44 = float(bitwiseValue40 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue116 = sumValue102 * 3.0517578125e-05;
                    precise float productValue117 = sumValue103 * 3.0517578125e-05;
                    precise float sumValue104 = bitwiseValue43 + productValue116;
                    precise float sumValue105 = bitwiseValue44 + productValue117;
                    intermediateValue173 = sumValue104;
                    intermediateValue174 = sumValue105;
                }
                else
                {
                    precise float bitwiseValue45 = float(comparisonValue8 & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue46 = float(comparisonValue8 >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue118 = bitwiseValue45 * 16384.0;
                    precise float sumValue106 = productValue118 + 0.5;
                    precise float productValue119 = bitwiseValue46 * 16384.0;
                    precise float sumValue107 = productValue119 + 0.5;
                    precise float productValue120 = floor(sumValue106) * 6.103515625e-05;
                    precise float productValue121 = floor(sumValue107) * 6.103515625e-05;
                    intermediateValue173 = productValue120;
                    intermediateValue174 = productValue121;
                }
                precise float productValue122 = vectorValue1.y * intermediateValue173;
                precise float productValue123 = vectorValue1.y * intermediateValue174;
                precise float sumValue108 = sumValue100 + productValue122;
                precise float sumValue109 = sumValue101 + productValue123;
                float intermediateValue188;
                if (objectInstances.packedValues[productValue97] == 65535us)
                {
                    intermediateValue188 = 1.0;
                }
                else
                {
                    uint reinterpretedBits15;
                    if (objectInstances.packedValues[productValue97] > 4095us)
                    {
                        reinterpretedBits15 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                    }
                    else
                    {
                        reinterpretedBits15 = uint(objectInstances.packedValues[productValue97]);
                    }
                    intermediateValue188 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits15 + 0u], defaultSampler)), vec2(sumValue108, sumValue109), -0.25).w;
                }
                uint comparisonValue23;
                if (scalarValue9 == 2u)
                {
                    comparisonValue23 = 0u;
                }
                else
                {
                    comparisonValue23 = uint(intermediateValue188 <= (((objectInstances.packedValues[productValue98] & 4352us) != 0us) ? 0.5 : 0.0));
                }
                if (comparisonValue23 == 0u)
                {
                    rayQueryConfirmIntersectionEXT(intermediateValue14);
                }
            }
            intermediateValue41 = rayQueryProceedEXT(intermediateValue14);
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
    uint scalarValue11 = rayQueryGetIntersectionTypeEXT(intermediateValue14, bool(1u));
    float intermediateValue30;
    float intermediateValue31;
    float intermediateValue32;
    uint bitwiseValue22;
    if (scalarValue11 == 1u)
    {
        vec2 vectorValue2 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue14, bool(1u));
        vec2 vectorValue3 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue14, bool(1u));
        float scalarValue12 = rayQueryGetIntersectionTEXT(intermediateValue14, bool(1u));
        uint scalarValue13 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue14, bool(1u));
        uint scalarValue14 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue14, bool(1u));
        uint scalarValue15 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue14, bool(1u));
        intermediateValue30 = vectorValue2.x;
        intermediateValue31 = vectorValue3.y;
        intermediateValue32 = scalarValue12;
        bitwiseValue22 = ((scalarValue14 << 30u) | ((scalarValue13 << 14u) & 1073725440u)) | (scalarValue15 & 16383u);
    }
    else
    {
        intermediateValue30 = 0.0;
        intermediateValue31 = 0.0;
        intermediateValue32 = 10000.0;
        bitwiseValue22 = 1073741823u;
    }
    if (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u)
    {
        imageStore(outputBufferPrimaryPathLength, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(intermediateValue32));
        imageStore(outputPrimaryWorldPosition, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 0.0, 0.0, intermediateValue32));
        imageStore(outputBufferPrimaryPosLowPrecision, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(0.0, 0.0, 0.0, intermediateValue32));
        if (!(intermediateValue32 < 10000.0))
        {
            uvec4 reinterpretedBits5 = floatBitsToUint(ViewCB.packedValues[76u]);
            uint scalarValue16 = reinterpretedBits5.w;
            float intermediateValue130;
            float intermediateValue131;
            float intermediateValue132;
            if (scalarValue16 == 1u)
            {
                intermediateValue130 = ViewCB.packedValues[58u].x;
                intermediateValue131 = ViewCB.packedValues[58u].y;
                intermediateValue132 = ViewCB.packedValues[58u].z;
            }
            else
            {
                float branchMergedValue23;
                float branchMergedValue42;
                float branchMergedValue43;
                if (scalarValue16 == 2u)
                {
                    uvec4 vectorValue4 = floatBitsToUint(ViewCB.packedValues[74u]);
                    uint scalarValue17 = vectorValue4.z;
                    uint reinterpretedBits13;
                    if (scalarValue17 > 4095u)
                    {
                        reinterpretedBits13 = floatBitsToUint(ViewCB.packedValues[98u]).w;
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
                        precise float sumValue110 = (-0.0) - productValue96;
                        precise float sumValue111 = (-0.0) - productValue95;
                        intermediateValue175 = scalarValue18;
                        comparisonValue18 = (productValue94 < 0.0) ? sumValue110 : productValue96;
                        intermediateValue176 = sumValue111;
                    }
                    else
                    {
                        precise float sumValue112 = (-0.0) - productValue94;
                        float branchMergedValue26;
                        float branchMergedValue52;
                        float branchMergedValue53;
                        if (!(scalarValue19 >= scalarValue20))
                        {
                            precise float sumValue113 = (-0.0) - productValue95;
                            branchMergedValue26 = sumValue113;
                            branchMergedValue52 = (productValue96 < 0.0) ? productValue94 : sumValue112;
                            branchMergedValue53 = scalarValue20;
                        }
                        else
                        {
                            precise float sumValue114 = (-0.0) - productValue96;
                            branchMergedValue26 = (productValue95 < 0.0) ? sumValue114 : productValue96;
                            branchMergedValue52 = sumValue112;
                            branchMergedValue53 = scalarValue19;
                        }
                        intermediateValue175 = branchMergedValue53;
                        comparisonValue18 = branchMergedValue52;
                        intermediateValue176 = branchMergedValue26;
                    }
                    precise float quotientValue15 = 0.5 / intermediateValue175;
                    precise float productValue124 = comparisonValue18 * quotientValue15;
                    precise float sumValue115 = productValue124 + 0.5;
                    precise float productValue125 = intermediateValue176 * quotientValue15;
                    precise float sumValue116 = productValue125 + 0.5;
                    precise float productValue126 = ViewCB.packedValues[74u].x * sumValue115;
                    precise float productValue127 = ViewCB.packedValues[74u].y * sumValue116;
                    vec4 sampledTextureValue = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits13 + 0u], linearSampler)), vec2(fract(productValue126), fract(productValue127)), 0.0);
                    precise float productValue128 = sampledTextureValue.x * ViewCB.packedValues[58u].x;
                    precise float productValue129 = sampledTextureValue.y * ViewCB.packedValues[58u].y;
                    precise float productValue130 = sampledTextureValue.z * ViewCB.packedValues[58u].z;
                    precise float productValue131 = productValue128 * ViewCB.packedValues[97u].w;
                    precise float productValue132 = productValue129 * ViewCB.packedValues[97u].w;
                    precise float productValue133 = productValue130 * ViewCB.packedValues[97u].w;
                    branchMergedValue23 = productValue133;
                    branchMergedValue42 = productValue132;
                    branchMergedValue43 = productValue131;
                }
                else
                {
                    float branchMergedValue174;
                    float branchMergedValue176;
                    float branchMergedValue177;
                    if (scalarValue16 == 4u)
                    {
                        precise float scalarValue21 = dot(vec3(productValue94, productValue95, productValue96), vec3(ViewCB.packedValues[52u].xyz)) * 0.5;
                        precise float sumValue117 = scalarValue21 + 0.5;
                        precise float sumValue118 = ViewCB.packedValues[75u].x - ViewCB.packedValues[76u].x;
                        precise float sumValue119 = ViewCB.packedValues[75u].y - ViewCB.packedValues[76u].y;
                        precise float sumValue120 = ViewCB.packedValues[75u].z - ViewCB.packedValues[76u].z;
                        precise float productValue134 = sumValue117 * sumValue118;
                        precise float productValue135 = sumValue117 * sumValue119;
                        precise float productValue136 = sumValue117 * sumValue120;
                        precise float sumValue121 = ViewCB.packedValues[76u].x + productValue134;
                        precise float sumValue122 = ViewCB.packedValues[76u].y + productValue135;
                        precise float sumValue123 = ViewCB.packedValues[76u].z + productValue136;
                        branchMergedValue174 = sumValue123;
                        branchMergedValue176 = sumValue122;
                        branchMergedValue177 = sumValue121;
                    }
                    else
                    {
                        float comparisonValue13;
                        if (abs(productValue95) < 1.0)
                        {
                            precise float quotientValue16 = productValue96 / productValue94;
                            float scalarValue22 = atan(quotientValue16);
                            precise float sumValue124 = scalarValue22 + 3.1415927410125732421875;
                            precise float sumValue125 = scalarValue22 + (-3.1415927410125732421875);
                            bool conditionValue3 = productValue94 < 0.0;
                            bool comparisonValue11 = productValue94 == 0.0;
                            bool comparisonValue12 = productValue96 >= 0.0;
                            bool conditionValue4 = productValue96 < 0.0;
                            comparisonValue13 = (comparisonValue11 && comparisonValue12) ? 1.57079637050628662109375 : ((comparisonValue11 && conditionValue4) ? (-1.57079637050628662109375) : ((conditionValue3 && conditionValue4) ? sumValue125 : ((conditionValue3 && comparisonValue12) ? sumValue124 : scalarValue22)));
                        }
                        else
                        {
                            comparisonValue13 = 0.0;
                        }
                        precise float sumValue126 = comparisonValue13 - ViewCB.packedValues[50u].w;
                        precise float productValue137 = sumValue126 * 0.15915493667125701904296875;
                        precise float productValue138 = fract(productValue137) * 2.0;
                        precise float sumValue127 = productValue138 + (-1.0);
                        precise float quotientValue17 = asin(productValue95) / 3.1415927410125732421875;
                        precise float sumValue128 = 0.5 - quotientValue17;
                        precise float productValue139 = abs(sumValue127) * 0.984375;
                        precise float sumValue129 = productValue139 + 0.0078125;
                        precise float productValue140 = sumValue128 * 0.96875;
                        precise float sumValue130 = productValue140 + 0.015625;
                        precise float productValue141 = ViewCB.packedValues[51u].w * 7.0;
                        float scalarValue23 = fract(productValue141);
                        uint scalarValue24 = uint(int(floor(productValue141)));
                        precise float productValue142 = float(int(scalarValue24 + 1u)) * 0.125;
                        precise float sumValue131 = (-0.0) - productValue142;
                        float scalarValue25 = fract(abs(productValue142));
                        precise float sumValue132 = (-0.0) - scalarValue25;
                        precise float comparisonValue14 = ((productValue142 >= sumValue131) ? scalarValue25 : sumValue132) * 8.0;
                        vec4 sampledTextureValue1 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(sumValue129, sumValue130, float(int(scalarValue24))), 0.0);
                        float scalarValue26 = sampledTextureValue1.x;
                        float scalarValue27 = sampledTextureValue1.y;
                        float scalarValue28 = sampledTextureValue1.z;
                        precise float productValue143 = scalarValue26 * scalarValue26;
                        precise float productValue144 = scalarValue27 * scalarValue27;
                        precise float productValue145 = scalarValue28 * scalarValue28;
                        vec4 sampledTextureValue2 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(sumValue129, sumValue130, float(int(uint(int(comparisonValue14))))), 0.0);
                        float scalarValue29 = sampledTextureValue2.x;
                        float scalarValue30 = sampledTextureValue2.y;
                        float scalarValue31 = sampledTextureValue2.z;
                        precise float productValue146 = scalarValue29 * scalarValue29;
                        precise float productValue147 = scalarValue30 * scalarValue30;
                        precise float productValue148 = scalarValue31 * scalarValue31;
                        precise float sumValue133 = productValue146 - productValue143;
                        precise float sumValue134 = productValue147 - productValue144;
                        precise float sumValue135 = productValue148 - productValue145;
                        precise float productValue149 = scalarValue23 * sumValue133;
                        precise float productValue150 = scalarValue23 * sumValue134;
                        precise float productValue151 = scalarValue23 * sumValue135;
                        precise float sumValue136 = productValue143 + productValue149;
                        precise float sumValue137 = productValue144 + productValue150;
                        precise float sumValue138 = productValue145 + productValue151;
                        precise float dotProductValue1 = log2(spvNMax(dot(vec3(productValue94, productValue95, productValue96), vec3(ViewCB.packedValues[52u].xyz)), 0.0)) * 7.0;
                        float exponentialValue = exp2(dotProductValue1);
                        precise float productValue152 = ViewCB.packedValues[50u].x * exponentialValue;
                        precise float productValue153 = ViewCB.packedValues[50u].y * exponentialValue;
                        precise float productValue154 = ViewCB.packedValues[50u].z * exponentialValue;
                        precise float productValue155 = productValue152 * 0.0500000007450580596923828125;
                        precise float productValue156 = productValue153 * 0.0500000007450580596923828125;
                        precise float productValue157 = productValue154 * 0.0500000007450580596923828125;
                        precise float sumValue139 = sumValue136 + productValue155;
                        precise float sumValue140 = sumValue137 + productValue156;
                        precise float sumValue141 = sumValue138 + productValue157;
                        precise float productValue158 = exponentialValue * 0.64999997615814208984375;
                        precise float sumValue142 = productValue158 + 0.3499999940395355224609375;
                        precise float productValue159 = sumValue142 * ViewCB.packedValues[58u].x;
                        precise float productValue160 = sumValue142 * ViewCB.packedValues[58u].y;
                        precise float productValue161 = sumValue142 * ViewCB.packedValues[58u].z;
                        precise float sumValue143 = productValue159 - sumValue139;
                        precise float sumValue144 = productValue160 - sumValue140;
                        precise float sumValue145 = productValue161 - sumValue141;
                        precise float productValue162 = ViewCB.packedValues[58u].w * sumValue143;
                        precise float productValue163 = ViewCB.packedValues[58u].w * sumValue144;
                        precise float productValue164 = ViewCB.packedValues[58u].w * sumValue145;
                        precise float sumValue146 = sumValue139 + productValue162;
                        precise float sumValue147 = sumValue140 + productValue163;
                        precise float sumValue148 = sumValue141 + productValue164;
                        precise float productValue165 = ViewCB.packedValues[97u].w * sumValue146;
                        precise float productValue166 = ViewCB.packedValues[97u].w * sumValue147;
                        precise float productValue167 = ViewCB.packedValues[97u].w * sumValue148;
                        branchMergedValue174 = productValue167;
                        branchMergedValue176 = productValue166;
                        branchMergedValue177 = productValue165;
                    }
                    branchMergedValue23 = branchMergedValue174;
                    branchMergedValue42 = branchMergedValue176;
                    branchMergedValue43 = branchMergedValue177;
                }
                intermediateValue130 = branchMergedValue43;
                intermediateValue131 = branchMergedValue42;
                intermediateValue132 = branchMergedValue23;
            }
            precise float productValue168 = reinterpretedBits2 * intermediateValue130;
            precise float productValue169 = reinterpretedBits2 * intermediateValue131;
            precise float productValue170 = reinterpretedBits2 * intermediateValue132;
            uint reinterpretedBits6 = floatBitsToUint(productValue168) & 2147483647u;
            uint reinterpretedBits7 = floatBitsToUint(productValue169) & 2147483647u;
            uint reinterpretedBits8 = floatBitsToUint(productValue170) & 2147483647u;
            if (!((((reinterpretedBits6 > 2139095040u) || (reinterpretedBits7 > 2139095040u)) || (reinterpretedBits8 > 2139095040u)) || (((reinterpretedBits6 == 2139095040u) || (reinterpretedBits7 == 2139095040u)) || (reinterpretedBits8 == 2139095040u))))
            {
                imageStore(outputBufferEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(productValue168, productValue169, productValue170, 1.0));
            }
        }
    }
    uint intermediateValue[8];
    float intermediateValue1[2];
    float intermediateValue43;
    float intermediateValue46;
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
    uint intermediateValue88;
    uint intermediateValue90;
    float intermediateValue92;
    float intermediateValue94;
    float intermediateValue96;
    float intermediateValue98;
    float intermediateValue100;
    float intermediateValue102;
    uint intermediateValue104;
    uint intermediateValue106;
    uint intermediateValue108;
    uint intermediateValue110;
    float intermediateValue163;
    float intermediateValue165;
    float intermediateValue167;
    for (;;)
    {
        intermediateValue43 = intermediateValue45;
        intermediateValue46 = intermediateValue45;
        intermediateValue48 = intermediateValue45;
        intermediateValue50 = intermediateValue45;
        intermediateValue52 = intermediateValue45;
        intermediateValue54 = intermediateValue45;
        intermediateValue56 = intermediateValue45;
        intermediateValue58 = intermediateValue45;
        intermediateValue60 = intermediateValue45;
        intermediateValue62 = intermediateValue45;
        intermediateValue64 = intermediateValue45;
        intermediateValue66 = intermediateValue45;
        intermediateValue68 = intermediateValue45;
        intermediateValue70 = intermediateValue45;
        intermediateValue72 = intermediateValue45;
        intermediateValue74 = intermediateValue45;
        intermediateValue76 = productValue94;
        intermediateValue78 = productValue95;
        intermediateValue80 = productValue96;
        intermediateValue82 = intermediateValue30;
        intermediateValue84 = intermediateValue31;
        intermediateValue86 = intermediateValue32;
        intermediateValue88 = bitwiseValue22;
        intermediateValue90 = intermediateValue13;
        intermediateValue92 = 0.0;
        intermediateValue94 = 0.0;
        intermediateValue96 = 0.0;
        intermediateValue98 = 1.0;
        intermediateValue100 = 1.0;
        intermediateValue102 = 1.0;
        intermediateValue104 = reinterpretedBits3;
        intermediateValue106 = reinterpretedBits3;
        intermediateValue108 = 0u;
        intermediateValue110 = 0u;
        uint intermediateValue91;
        float intermediateValue99;
        float intermediateValue101;
        float intermediateValue103;
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
        float intermediateValue93;
        float intermediateValue95;
        float intermediateValue97;
        uint intermediateValue105;
        uint intermediateValue107;
        uint intermediateValue109;
        bool branchMergedValue;
        float branchMergedValue3;
        float branchMergedValue11;
        float branchMergedValue12;
        float branchMergedValue13;
        float branchMergedValue14;
        float branchMergedValue15;
        bool intermediateValue111;
        for (;;)
        {
            intermediateValue111 = intermediateValue86 < 10000.0;
            if (intermediateValue111)
            {
                uint bitwiseValue47 = intermediateValue88 & 16383u;
                uint productValue171 = (bitwiseValue47 * 76u) + 58u;
                uint productValue172 = (bitwiseValue47 * 76u) + 59u;
                uint productValue173 = (bitwiseValue47 * 76u) + 60u;
                uint productValue174 = (bitwiseValue47 * 76u) + 61u;
                uint productValue175 = (bitwiseValue47 * 38u) + 32u;
                uint productValue176 = (bitwiseValue47 * 38u) + 33u;
                uint productValue177 = bitwiseValue47 * 38u;
                vec4 reinterpretedBits9 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue177], objectInstances_2.packedValues[productValue177 + 1u], objectInstances_2.packedValues[productValue177 + 2u], objectInstances_2.packedValues[productValue177 + 3u]));
                float scalarValue32 = reinterpretedBits9.x;
                float scalarValue33 = reinterpretedBits9.y;
                float scalarValue34 = reinterpretedBits9.z;
                uint productValue178 = (bitwiseValue47 * 38u) + 4u;
                vec4 reinterpretedBits10 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue178], objectInstances_2.packedValues[productValue178 + 1u], objectInstances_2.packedValues[productValue178 + 2u], objectInstances_2.packedValues[productValue178 + 3u]));
                float scalarValue35 = reinterpretedBits10.x;
                float scalarValue36 = reinterpretedBits10.y;
                float scalarValue37 = reinterpretedBits10.z;
                uint productValue179 = (bitwiseValue47 * 38u) + 8u;
                vec4 reinterpretedBits11 = uintBitsToFloat(uvec4(objectInstances_2.packedValues[productValue179], objectInstances_2.packedValues[productValue179 + 1u], objectInstances_2.packedValues[productValue179 + 2u], objectInstances_2.packedValues[productValue179 + 3u]));
                float scalarValue38 = reinterpretedBits11.x;
                float scalarValue39 = reinterpretedBits11.y;
                float scalarValue40 = reinterpretedBits11.z;
                uint productValue180 = (bitwiseValue47 * 38u) + 24u;
                uint productValue181 = (bitwiseValue47 * 76u) + 72u;
                uint bitwiseValue48 = ((intermediateValue88 >> 13u) & 2u) | ((intermediateValue88 >> 13u) & 131068u);
                uint productValue182 = uint(objectInstances.packedValues[(bitwiseValue47 * 76u) + 54u]);
                uint sumValue149 = productValue182 + 0u;
                uint bitwiseValue49 = (objectInstances_2.packedValues[(bitwiseValue47 * 38u) + 25u] >> 2u) + ((intermediateValue88 >> 15u) & 32767u);
                uint productValue183 = bitwiseValue49 * 4u;
                uint productValue184 = (bitwiseValue49 * 4u) + 1u;
                uint productValue185 = (bitwiseValue49 * 4u) + 2u;
                precise float bitwiseValue50 = float(faceDataBuffersRW_2[nonuniformEXT(sumValue149)].packedValues[productValue183] & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue150 = bitwiseValue50 + (-1.0);
                precise float bitwiseValue51 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue149)].packedValues[productValue183] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue151 = bitwiseValue51 + (-1.0);
                precise float bitwiseValue52 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue149)].packedValues[productValue183] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue152 = bitwiseValue52 + (-1.0);
                precise float bitwiseValue53 = float(faceDataBuffersRW_2[nonuniformEXT(sumValue149)].packedValues[productValue184] & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue153 = bitwiseValue53 + (-1.0);
                precise float bitwiseValue54 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue149)].packedValues[productValue184] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue154 = bitwiseValue54 + (-1.0);
                precise float bitwiseValue55 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue149)].packedValues[productValue184] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue155 = bitwiseValue55 + (-1.0);
                precise float bitwiseValue56 = float(faceDataBuffersRW_2[nonuniformEXT(sumValue149)].packedValues[productValue185] & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue156 = bitwiseValue56 + (-1.0);
                precise float bitwiseValue57 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue149)].packedValues[productValue185] >> 10u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue157 = bitwiseValue57 + (-1.0);
                precise float bitwiseValue58 = float((faceDataBuffersRW_2[nonuniformEXT(sumValue149)].packedValues[productValue185] >> 20u) & 1023u) * 0.00195503421127796173095703125;
                precise float sumValue158 = bitwiseValue58 + (-1.0);
                precise float sumValue159 = 1.0 - intermediateValue82;
                precise float sumValue160 = sumValue159 - intermediateValue84;
                uint sumValue161 = productValue182 + 0u;
                uint productValue186 = uint(objectInstances.packedValues[(bitwiseValue47 * 76u) + 56u]);
                uint productValue187 = productValue186 * (objectInstances_2.packedValues[productValue180] + bitwiseValue48);
                uint bitwiseValue59 = uint(objectInstances.packedValues[(bitwiseValue47 * 76u) + 71u] & 255us);
                uint bitwiseValue60 = (bitwiseValue59 + productValue187) >> 1u;
                f16vec3 sumValue90 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue161)].packedValues[bitwiseValue60], vertexBuffers[nonuniformEXT(sumValue161)].packedValues[bitwiseValue60 + 1u], vertexBuffers[nonuniformEXT(sumValue161)].packedValues[bitwiseValue60 + 2u]));
                uint bitwiseValue61 = uint(objectInstances.packedValues[productValue181] & 255us);
                uint bitwiseValue62 = (bitwiseValue61 + productValue187) >> 2u;
                precise float bitwiseValue63 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue62] & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue64 = float((vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue62] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue65 = float((vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue62] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue66 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue62] >> 24u) * 0.0039215688593685626983642578125;
                uint bitwiseValue67 = uint(objectInstances.packedValues[productValue181] >> 8us);
                uint bitwiseValue68 = (bitwiseValue67 + productValue187) >> 2u;
                bool conditionValue5 = int16_t(objectInstances.packedValues[productValue174]) < int16_t(0us);
                float intermediateValue143;
                float intermediateValue144;
                if (conditionValue5)
                {
                    uint bitwiseValue69 = vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue68] >> 15u;
                    precise float bitwiseValue70 = float(bitwiseValue69 & 1u) * 2.0;
                    precise float sumValue162 = bitwiseValue70 + (-1.0);
                    precise float bitwiseValue71 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue68] >> 31u) * 2.0;
                    precise float sumValue163 = bitwiseValue71 + (-1.0);
                    precise float bitwiseValue72 = float((vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue68] << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue73 = float(bitwiseValue69 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue188 = sumValue162 * 3.0517578125e-05;
                    precise float productValue189 = sumValue163 * 3.0517578125e-05;
                    precise float sumValue164 = bitwiseValue72 + productValue188;
                    precise float sumValue165 = bitwiseValue73 + productValue189;
                    intermediateValue143 = sumValue164;
                    intermediateValue144 = sumValue165;
                }
                else
                {
                    precise float bitwiseValue74 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue68] & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue75 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue68] >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue190 = bitwiseValue74 * 16384.0;
                    precise float sumValue166 = productValue190 + 0.5;
                    precise float productValue191 = bitwiseValue75 * 16384.0;
                    precise float sumValue167 = productValue191 + 0.5;
                    precise float productValue192 = floor(sumValue166) * 6.103515625e-05;
                    precise float productValue193 = floor(sumValue167) * 6.103515625e-05;
                    intermediateValue143 = productValue192;
                    intermediateValue144 = productValue193;
                }
                uint intermediateValue162;
                if ((objectInstances.packedValues[productValue174] & 256us) == 0us)
                {
                    intermediateValue162 = 0u;
                }
                else
                {
                    intermediateValue162 = vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[(uint(objectInstances.packedValues[(bitwiseValue47 * 76u) + 74u] >> 8us) + productValue187) >> 2u] & 65535u;
                }
                precise float productValue194 = sumValue160 * float(sumValue90.x);
                precise float productValue195 = sumValue160 * float(sumValue90.y);
                precise float productValue196 = sumValue160 * float(sumValue90.z);
                precise float sumValue168 = productValue194 + 0.0;
                precise float sumValue169 = productValue195 + 0.0;
                precise float sumValue170 = productValue196 + 0.0;
                precise float productValue197 = sumValue160 * intermediateValue143;
                precise float productValue198 = sumValue160 * intermediateValue144;
                precise float sumValue171 = productValue197 + 0.0;
                precise float sumValue172 = productValue198 + 0.0;
                precise float productValue199 = sumValue160 * bitwiseValue63;
                precise float productValue200 = sumValue160 * bitwiseValue64;
                precise float productValue201 = sumValue160 * bitwiseValue65;
                precise float productValue202 = sumValue160 * bitwiseValue66;
                precise float sumValue173 = productValue199 + 0.0;
                precise float sumValue174 = productValue200 + 0.0;
                precise float sumValue176 = productValue201 + 0.0;
                precise float sumValue177 = productValue202 + 0.0;
                uint bitwiseValue76 = productValue186 * (objectInstances_2.packedValues[productValue180] + (bitwiseValue48 | 1u));
                uint bitwiseValue77 = (bitwiseValue59 + bitwiseValue76) >> 1u;
                f16vec3 sumValue175 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue161)].packedValues[bitwiseValue77], vertexBuffers[nonuniformEXT(sumValue161)].packedValues[bitwiseValue77 + 1u], vertexBuffers[nonuniformEXT(sumValue161)].packedValues[bitwiseValue77 + 2u]));
                uint bitwiseValue78 = (bitwiseValue61 + bitwiseValue76) >> 2u;
                precise float bitwiseValue79 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue78] & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue80 = float((vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue78] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue81 = float((vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue78] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue82 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue78] >> 24u) * 0.0039215688593685626983642578125;
                uint bitwiseValue83 = (bitwiseValue67 + bitwiseValue76) >> 2u;
                float intermediateValue189;
                float intermediateValue190;
                if (conditionValue5)
                {
                    uint bitwiseValue84 = vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue83] >> 15u;
                    precise float bitwiseValue85 = float(bitwiseValue84 & 1u) * 2.0;
                    precise float sumValue178 = bitwiseValue85 + (-1.0);
                    precise float bitwiseValue86 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue83] >> 31u) * 2.0;
                    precise float sumValue179 = bitwiseValue86 + (-1.0);
                    precise float bitwiseValue87 = float((vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue83] << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue88 = float(bitwiseValue84 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue203 = sumValue178 * 3.0517578125e-05;
                    precise float productValue204 = sumValue179 * 3.0517578125e-05;
                    precise float sumValue180 = bitwiseValue87 + productValue203;
                    precise float sumValue181 = bitwiseValue88 + productValue204;
                    intermediateValue189 = sumValue180;
                    intermediateValue190 = sumValue181;
                }
                else
                {
                    precise float bitwiseValue89 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue83] & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue90 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue83] >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue205 = bitwiseValue89 * 16384.0;
                    precise float sumValue182 = productValue205 + 0.5;
                    precise float productValue206 = bitwiseValue90 * 16384.0;
                    precise float sumValue183 = productValue206 + 0.5;
                    precise float productValue207 = floor(sumValue182) * 6.103515625e-05;
                    precise float productValue208 = floor(sumValue183) * 6.103515625e-05;
                    intermediateValue189 = productValue207;
                    intermediateValue190 = productValue208;
                }
                precise float productValue209 = intermediateValue82 * float(sumValue175.x);
                precise float productValue210 = intermediateValue82 * float(sumValue175.y);
                precise float productValue211 = intermediateValue82 * float(sumValue175.z);
                precise float sumValue184 = sumValue168 + productValue209;
                precise float sumValue185 = sumValue169 + productValue210;
                precise float sumValue186 = sumValue170 + productValue211;
                precise float productValue212 = intermediateValue82 * intermediateValue189;
                precise float productValue213 = intermediateValue82 * intermediateValue190;
                precise float sumValue187 = sumValue171 + productValue212;
                precise float sumValue188 = sumValue172 + productValue213;
                precise float productValue214 = intermediateValue82 * bitwiseValue79;
                precise float productValue215 = intermediateValue82 * bitwiseValue80;
                precise float productValue216 = intermediateValue82 * bitwiseValue81;
                precise float productValue217 = intermediateValue82 * bitwiseValue82;
                precise float sumValue189 = sumValue173 + productValue214;
                precise float sumValue190 = sumValue174 + productValue215;
                precise float sumValue191 = sumValue176 + productValue216;
                precise float sumValue192 = sumValue177 + productValue217;
                uint bitwiseValue91 = productValue186 * (objectInstances_2.packedValues[productValue180] + (bitwiseValue48 ^ 2u));
                uint bitwiseValue92 = (bitwiseValue59 + bitwiseValue91) >> 1u;
                f16vec3 sumValue197 = uint16BitsToFloat16(u16vec3(vertexBuffers[nonuniformEXT(sumValue161)].packedValues[bitwiseValue92], vertexBuffers[nonuniformEXT(sumValue161)].packedValues[bitwiseValue92 + 1u], vertexBuffers[nonuniformEXT(sumValue161)].packedValues[bitwiseValue92 + 2u]));
                uint bitwiseValue93 = (bitwiseValue61 + bitwiseValue91) >> 2u;
                precise float bitwiseValue94 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue93] & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue95 = float((vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue93] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue96 = float((vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue93] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                precise float bitwiseValue97 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue93] >> 24u) * 0.0039215688593685626983642578125;
                uint bitwiseValue98 = (bitwiseValue67 + bitwiseValue91) >> 2u;
                float intermediateValue193;
                float intermediateValue194;
                if (conditionValue5)
                {
                    uint bitwiseValue99 = vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue98] >> 15u;
                    precise float bitwiseValue100 = float(bitwiseValue99 & 1u) * 2.0;
                    precise float sumValue193 = bitwiseValue100 + (-1.0);
                    precise float bitwiseValue101 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue98] >> 31u) * 2.0;
                    precise float sumValue194 = bitwiseValue101 + (-1.0);
                    precise float bitwiseValue102 = float((vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue98] << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue103 = float(bitwiseValue99 & 65534u) * 1.525902189314365386962890625e-05;
                    precise float productValue218 = sumValue193 * 3.0517578125e-05;
                    precise float productValue219 = sumValue194 * 3.0517578125e-05;
                    precise float sumValue195 = bitwiseValue102 + productValue218;
                    precise float sumValue196 = bitwiseValue103 + productValue219;
                    intermediateValue193 = sumValue195;
                    intermediateValue194 = sumValue196;
                }
                else
                {
                    precise float bitwiseValue104 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue98] & 65535u) * 1.525902189314365386962890625e-05;
                    precise float bitwiseValue105 = float(vertexBuffers_2[nonuniformEXT(sumValue161)].packedValues[bitwiseValue98] >> 16u) * 1.525902189314365386962890625e-05;
                    precise float productValue220 = bitwiseValue104 * 16384.0;
                    precise float sumValue198 = productValue220 + 0.5;
                    precise float productValue221 = bitwiseValue105 * 16384.0;
                    precise float sumValue199 = productValue221 + 0.5;
                    precise float productValue222 = floor(sumValue198) * 6.103515625e-05;
                    precise float productValue223 = floor(sumValue199) * 6.103515625e-05;
                    intermediateValue193 = productValue222;
                    intermediateValue194 = productValue223;
                }
                precise float productValue224 = intermediateValue84 * float(sumValue197.x);
                precise float productValue225 = intermediateValue84 * float(sumValue197.y);
                precise float productValue226 = intermediateValue84 * float(sumValue197.z);
                precise float sumValue200 = sumValue184 + productValue224;
                precise float sumValue201 = sumValue185 + productValue225;
                precise float sumValue202 = sumValue186 + productValue226;
                precise float productValue227 = intermediateValue84 * intermediateValue193;
                precise float productValue228 = intermediateValue84 * intermediateValue194;
                precise float sumValue203 = sumValue187 + productValue227;
                precise float sumValue204 = sumValue188 + productValue228;
                precise float productValue229 = intermediateValue84 * bitwiseValue94;
                precise float productValue230 = intermediateValue84 * bitwiseValue95;
                precise float productValue231 = intermediateValue84 * bitwiseValue96;
                precise float productValue232 = intermediateValue84 * bitwiseValue97;
                precise float sumValue205 = sumValue189 + productValue229;
                precise float sumValue206 = sumValue190 + productValue230;
                precise float sumValue207 = sumValue191 + productValue231;
                precise float sumValue208 = sumValue192 + productValue232;
                precise float productValue233 = scalarValue32 * sumValue200;
                precise float productValue234 = sumValue201 * scalarValue33;
                precise float sumValue209 = productValue234 + productValue233;
                precise float productValue235 = sumValue202 * scalarValue34;
                precise float sumValue210 = productValue235 + sumValue209;
                precise float productValue236 = 1.0 * reinterpretedBits9.w;
                precise float sumValue211 = productValue236 + sumValue210;
                precise float productValue237 = scalarValue35 * sumValue200;
                precise float productValue238 = sumValue201 * scalarValue36;
                precise float sumValue212 = productValue238 + productValue237;
                precise float productValue239 = sumValue202 * scalarValue37;
                precise float sumValue213 = productValue239 + sumValue212;
                precise float productValue240 = 1.0 * reinterpretedBits10.w;
                precise float sumValue214 = productValue240 + sumValue213;
                precise float productValue241 = scalarValue38 * sumValue200;
                precise float productValue242 = sumValue201 * scalarValue39;
                precise float sumValue215 = productValue242 + productValue241;
                precise float productValue243 = sumValue202 * scalarValue40;
                precise float sumValue216 = productValue243 + sumValue215;
                precise float productValue244 = 1.0 * reinterpretedBits11.w;
                precise float sumValue217 = productValue244 + sumValue216;
                precise float productValue245 = scalarValue32 * sumValue150;
                precise float productValue246 = sumValue151 * scalarValue33;
                precise float sumValue218 = productValue246 + productValue245;
                precise float productValue247 = sumValue152 * scalarValue34;
                precise float sumValue219 = productValue247 + sumValue218;
                precise float productValue248 = scalarValue35 * sumValue150;
                precise float productValue249 = sumValue151 * scalarValue36;
                precise float sumValue220 = productValue249 + productValue248;
                precise float productValue250 = sumValue152 * scalarValue37;
                precise float sumValue221 = productValue250 + sumValue220;
                precise float productValue251 = scalarValue38 * sumValue150;
                precise float productValue252 = sumValue151 * scalarValue39;
                precise float sumValue222 = productValue252 + productValue251;
                precise float productValue253 = sumValue152 * scalarValue40;
                precise float sumValue223 = productValue253 + sumValue222;
                float inverseLengthValue4 = inversesqrt(dot(vec3(sumValue219, sumValue221, sumValue223), vec3(sumValue219, sumValue221, sumValue223)));
                precise float productValue254 = sumValue219 * inverseLengthValue4;
                precise float productValue255 = sumValue221 * inverseLengthValue4;
                precise float productValue256 = sumValue223 * inverseLengthValue4;
                precise float productValue257 = scalarValue32 * sumValue153;
                precise float productValue258 = sumValue154 * scalarValue33;
                precise float sumValue224 = productValue258 + productValue257;
                precise float productValue259 = sumValue155 * scalarValue34;
                precise float sumValue225 = productValue259 + sumValue224;
                precise float productValue260 = scalarValue35 * sumValue153;
                precise float productValue261 = sumValue154 * scalarValue36;
                precise float sumValue226 = productValue261 + productValue260;
                precise float productValue262 = sumValue155 * scalarValue37;
                precise float sumValue227 = productValue262 + sumValue226;
                precise float productValue263 = scalarValue38 * sumValue153;
                precise float productValue264 = sumValue154 * scalarValue39;
                precise float sumValue228 = productValue264 + productValue263;
                precise float productValue265 = sumValue155 * scalarValue40;
                precise float sumValue229 = productValue265 + sumValue228;
                float inverseLengthValue5 = inversesqrt(dot(vec3(sumValue225, sumValue227, sumValue229), vec3(sumValue225, sumValue227, sumValue229)));
                precise float productValue266 = sumValue225 * inverseLengthValue5;
                precise float productValue267 = sumValue227 * inverseLengthValue5;
                precise float productValue268 = sumValue229 * inverseLengthValue5;
                precise float productValue269 = scalarValue32 * sumValue156;
                precise float productValue270 = sumValue157 * scalarValue33;
                precise float sumValue230 = productValue270 + productValue269;
                precise float productValue271 = sumValue158 * scalarValue34;
                precise float sumValue231 = productValue271 + sumValue230;
                precise float productValue272 = scalarValue35 * sumValue156;
                precise float productValue273 = sumValue157 * scalarValue36;
                precise float sumValue232 = productValue273 + productValue272;
                precise float productValue274 = sumValue158 * scalarValue37;
                precise float sumValue233 = productValue274 + sumValue232;
                precise float productValue275 = scalarValue38 * sumValue156;
                precise float productValue276 = sumValue157 * scalarValue39;
                precise float sumValue234 = productValue276 + productValue275;
                precise float productValue277 = sumValue158 * scalarValue40;
                precise float sumValue235 = productValue277 + sumValue234;
                float inverseLengthValue6 = inversesqrt(dot(vec3(sumValue231, sumValue233, sumValue235), vec3(sumValue231, sumValue233, sumValue235)));
                precise float productValue278 = sumValue231 * inverseLengthValue6;
                precise float productValue279 = sumValue233 * inverseLengthValue6;
                precise float productValue280 = sumValue235 * inverseLengthValue6;
                bool dotProductValue2 = dot(vec3(intermediateValue76, intermediateValue78, intermediateValue80), vec3(productValue254, productValue255, productValue256)) > 0.0;
                precise float sumValue236 = (-0.0) - productValue254;
                precise float sumValue237 = (-0.0) - productValue255;
                precise float sumValue238 = (-0.0) - productValue256;
                float comparisonValue15 = dotProductValue2 ? sumValue236 : productValue254;
                float comparisonValue16 = dotProductValue2 ? sumValue237 : productValue255;
                float comparisonValue17 = dotProductValue2 ? sumValue238 : productValue256;
                bool conditionValue6 = intermediateValue88 > 3221225471u;
                vec2 reinterpretedBits12 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[intermediateValue162 * 8u]);
                vec2 reinterpretedBits16 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue162 * 8u) + 1u]);
                vec2 reinterpretedBits17 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue162 * 8u) + 2u]);
                vec2 reinterpretedBits18 = uintBitsToFloat(pbrTextureDataBuffer_2.packedValues[(intermediateValue162 * 8u) + 3u]);
                uint productValue281 = (intermediateValue162 * 16u) + 8u;
                float reinterpretedBits19 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue162 * 16u) + 13u]);
                float reinterpretedBits20 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue162 * 16u) + 14u]);
                float reinterpretedBits21 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue162 * 16u) + 15u]);
                precise float productValue282 = ViewCB.packedValues[89u].y * intermediateValue86;
                precise float sumValue239 = productValue282 + 0.0;
                precise float dotProductValue3 = dot(vec3(intermediateValue76, intermediateValue78, intermediateValue80), vec3(comparisonValue15, comparisonValue16, comparisonValue17));
                precise float nonlinearValue2 = float(uint16BitsToFloat16(faceDataBuffersRW[nonuniformEXT(sumValue149)].packedValues[(bitwiseValue49 * 8u) + 6u])) + log2(abs(sumValue239));
                precise float nonlinearValue3 = nonlinearValue2 - log2(abs(dotProductValue3));
                precise float sumValue240 = nonlinearValue3 + ViewCB.packedValues[86u].x;
                float scalarValue41 = spvNMax(0.0, sumValue240);
                float scalarValue42 = spvNMin(scalarValue41, reinterpretedBits19);
                uint scalarValue43 = uint(objectInstances.packedValues[productValue171]);
                bool conditionValue7 = objectInstances.packedValues[productValue171] > 4095us;
                uint reinterpretedBits23;
                if (conditionValue7)
                {
                    reinterpretedBits23 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                }
                else
                {
                    reinterpretedBits23 = scalarValue43;
                }
                uint sumValue241 = reinterpretedBits23 + 0u;
                float intermediateValue200;
                float intermediateValue201;
                float intermediateValue202;
                float intermediateValue203;
                if (objectInstances.packedValues[productValue171] == 65535us)
                {
                    intermediateValue200 = 1.0;
                    intermediateValue201 = 1.0;
                    intermediateValue202 = 1.0;
                    intermediateValue203 = 1.0;
                }
                else
                {
                    vec4 sampledTextureValue3 = textureLod(nonuniformEXT(sampler2D(textures[sumValue241], defaultSampler)), vec2(sumValue203, sumValue204), scalarValue42);
                    intermediateValue200 = sampledTextureValue3.x;
                    intermediateValue201 = sampledTextureValue3.y;
                    intermediateValue202 = sampledTextureValue3.z;
                    intermediateValue203 = sampledTextureValue3.w;
                }
                float intermediateValue208;
                float intermediateValue210;
                float intermediateValue212;
                if ((objectInstances.packedValues[productValue174] & 1024us) == 0us)
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
                    if ((objectInstances.packedValues[productValue174] & 512us) == 0us)
                    {
                        bool comparisonValue19 = (objectInstances.packedValues[productValue174] & 4us) == 0us;
                        float intermediateValue214;
                        float intermediateValue215;
                        float intermediateValue216;
                        float intermediateValue217;
                        if (comparisonValue19)
                        {
                            intermediateValue214 = intermediateValue203;
                            intermediateValue215 = sumValue205;
                            intermediateValue216 = sumValue206;
                            intermediateValue217 = sumValue207;
                        }
                        else
                        {
                            uint reinterpretedBits25;
                            if (objectInstances.packedValues[productValue172] > 4095us)
                            {
                                reinterpretedBits25 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits25 = uint(objectInstances.packedValues[productValue172]);
                            }
                            vec4 sampledTextureValue4 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits25 + 0u], defaultSampler)), vec2(sumValue205, sumValue206), 0.0);
                            precise float productValue283 = sampledTextureValue4.x * 2.0;
                            precise float productValue284 = sampledTextureValue4.y * 2.0;
                            precise float productValue285 = sampledTextureValue4.z * 2.0;
                            precise float sumValue242 = productValue283 + (-1.0);
                            precise float sumValue243 = productValue284 + (-1.0);
                            precise float sumValue244 = productValue285 + (-1.0);
                            precise float productValue286 = sumValue207 * sumValue242;
                            precise float productValue287 = sumValue207 * sumValue243;
                            precise float productValue288 = sumValue207 * sumValue244;
                            precise float sumValue245 = productValue286 + 1.0;
                            precise float sumValue246 = productValue287 + 1.0;
                            precise float sumValue247 = productValue288 + 1.0;
                            precise float productValue289 = sumValue208 * sumValue245;
                            precise float productValue290 = sumValue208 * sumValue246;
                            precise float productValue291 = sumValue208 * sumValue247;
                            intermediateValue214 = 1.0;
                            intermediateValue215 = productValue289;
                            intermediateValue216 = productValue290;
                            intermediateValue217 = productValue291;
                        }
                        float intermediateValue237;
                        float intermediateValue238;
                        float intermediateValue239;
                        if ((objectInstances.packedValues[productValue174] & 8192us) == 0us)
                        {
                            intermediateValue237 = intermediateValue215;
                            intermediateValue238 = intermediateValue216;
                            intermediateValue239 = intermediateValue217;
                        }
                        else
                        {
                            precise float sumValue248 = 1.0 - intermediateValue215;
                            precise float sumValue249 = 1.0 - intermediateValue216;
                            precise float sumValue250 = 1.0 - intermediateValue217;
                            precise float productValue292 = intermediateValue214 * sumValue248;
                            precise float productValue293 = intermediateValue214 * sumValue249;
                            precise float productValue294 = intermediateValue214 * sumValue250;
                            precise float sumValue251 = intermediateValue215 + productValue292;
                            precise float sumValue252 = intermediateValue216 + productValue293;
                            precise float sumValue253 = intermediateValue217 + productValue294;
                            intermediateValue237 = sumValue251;
                            intermediateValue238 = sumValue252;
                            intermediateValue239 = sumValue253;
                        }
                        precise float productValue295 = intermediateValue200 * intermediateValue237;
                        precise float productValue296 = intermediateValue201 * intermediateValue238;
                        precise float productValue297 = intermediateValue202 * intermediateValue239;
                        float intermediateValue204;
                        if ((objectInstances.packedValues[productValue174] & 2048us) == 0us)
                        {
                            intermediateValue204 = intermediateValue214;
                        }
                        else
                        {
                            precise float productValue298 = intermediateValue214 * 2.0;
                            precise float sumValue254 = productValue298 + (-1.0);
                            intermediateValue204 = spvNClamp(sumValue254, 0.0, 1.0);
                        }
                        precise float bitwiseValue106 = float(objectInstances_2.packedValues[productValue175] >> 24u) * 0.0039215688593685626983642578125;
                        precise float bitwiseValue107 = float((objectInstances_2.packedValues[productValue175] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                        precise float bitwiseValue108 = float((objectInstances_2.packedValues[productValue175] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                        precise float sumValue255 = bitwiseValue106 + (-1.0);
                        precise float sumValue256 = bitwiseValue107 + (-1.0);
                        precise float sumValue257 = bitwiseValue108 + (-1.0);
                        precise float productValue299 = sumValue255 * intermediateValue204;
                        precise float productValue300 = sumValue256 * intermediateValue204;
                        precise float productValue301 = sumValue257 * intermediateValue204;
                        precise float sumValue258 = productValue299 + 1.0;
                        precise float sumValue259 = productValue300 + 1.0;
                        precise float sumValue260 = productValue301 + 1.0;
                        precise float productValue302 = productValue295 * sumValue258;
                        precise float productValue303 = productValue296 * sumValue259;
                        precise float productValue304 = productValue297 * sumValue260;
                        float intermediateValue258;
                        float intermediateValue260;
                        float intermediateValue262;
                        float intermediateValue264;
                        if (comparisonValue19)
                        {
                            float intermediateValue269;
                            float intermediateValue270;
                            float intermediateValue271;
                            if (objectInstances.packedValues[productValue172] == 65535us)
                            {
                                intermediateValue269 = productValue302;
                                intermediateValue270 = productValue303;
                                intermediateValue271 = productValue304;
                            }
                            else
                            {
                                uint reinterpretedBits34;
                                if (objectInstances.packedValues[productValue172] > 4095us)
                                {
                                    reinterpretedBits34 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits34 = uint(objectInstances.packedValues[productValue172]);
                                }
                                vec4 sampledTextureValue5 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits34 + 0u], defaultSampler)), vec2(sumValue203, sumValue204), scalarValue42);
                                float scalarValue44 = sampledTextureValue5.x;
                                float scalarValue45 = sampledTextureValue5.y;
                                float scalarValue46 = sampledTextureValue5.z;
                                float scalarValue47 = sampledTextureValue5.w;
                                float branchMergedValue32;
                                float branchMergedValue87;
                                float branchMergedValue88;
                                if ((objectInstances.packedValues[productValue174] & 8us) == 0us)
                                {
                                    float branchMergedValue182;
                                    float branchMergedValue201;
                                    float branchMergedValue202;
                                    if ((objectInstances.packedValues[productValue174] & 16us) == 0us)
                                    {
                                        float branchMergedValue238;
                                        float branchMergedValue241;
                                        float branchMergedValue242;
                                        if ((objectInstances.packedValues[productValue174] & 32us) == 0us)
                                        {
                                            branchMergedValue238 = productValue304;
                                            branchMergedValue241 = productValue303;
                                            branchMergedValue242 = productValue302;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue109 = float(objectInstances_2.packedValues[productValue176] >> 24u) * 0.0039215688593685626983642578125;
                                            precise float bitwiseValue110 = float((objectInstances_2.packedValues[productValue176] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                                            precise float bitwiseValue111 = float((objectInstances_2.packedValues[productValue176] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                                            precise float productValue305 = bitwiseValue109 * scalarValue44;
                                            precise float productValue306 = bitwiseValue110 * scalarValue45;
                                            precise float productValue307 = bitwiseValue111 * scalarValue46;
                                            precise float sumValue261 = productValue305 - productValue302;
                                            precise float sumValue262 = productValue306 - productValue303;
                                            precise float sumValue263 = productValue307 - productValue304;
                                            precise float productValue308 = scalarValue47 * sumValue261;
                                            precise float productValue309 = scalarValue47 * sumValue262;
                                            precise float productValue310 = scalarValue47 * sumValue263;
                                            precise float sumValue264 = productValue302 + productValue308;
                                            precise float sumValue265 = productValue303 + productValue309;
                                            precise float sumValue266 = productValue304 + productValue310;
                                            branchMergedValue238 = sumValue266;
                                            branchMergedValue241 = sumValue265;
                                            branchMergedValue242 = sumValue264;
                                        }
                                        branchMergedValue182 = branchMergedValue238;
                                        branchMergedValue201 = branchMergedValue241;
                                        branchMergedValue202 = branchMergedValue242;
                                    }
                                    else
                                    {
                                        precise float sumValue267 = scalarValue44 - productValue302;
                                        precise float sumValue268 = scalarValue45 - productValue303;
                                        precise float sumValue269 = scalarValue46 - productValue304;
                                        precise float productValue311 = scalarValue47 * sumValue267;
                                        precise float productValue312 = scalarValue47 * sumValue268;
                                        precise float productValue313 = scalarValue47 * sumValue269;
                                        precise float sumValue270 = productValue302 + productValue311;
                                        precise float sumValue271 = productValue303 + productValue312;
                                        precise float sumValue272 = productValue304 + productValue313;
                                        uint reinterpretedBits36;
                                        if (objectInstances.packedValues[productValue173] > 4095us)
                                        {
                                            reinterpretedBits36 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits36 = uint(objectInstances.packedValues[productValue173]);
                                        }
                                        vec4 sampledTextureValue6 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits36 + 0u], defaultSampler)), vec2(sumValue203, sumValue204), scalarValue42);
                                        float scalarValue48 = sampledTextureValue6.w;
                                        precise float productValue314 = bitwiseValue106 * sampledTextureValue6.x;
                                        precise float productValue315 = bitwiseValue107 * sampledTextureValue6.y;
                                        precise float productValue316 = bitwiseValue108 * sampledTextureValue6.z;
                                        precise float sumValue273 = productValue314 - sumValue270;
                                        precise float sumValue274 = productValue315 - sumValue271;
                                        precise float sumValue275 = productValue316 - sumValue272;
                                        precise float productValue317 = scalarValue48 * sumValue273;
                                        precise float productValue318 = scalarValue48 * sumValue274;
                                        precise float productValue319 = scalarValue48 * sumValue275;
                                        precise float sumValue276 = sumValue270 + productValue317;
                                        precise float sumValue277 = sumValue271 + productValue318;
                                        precise float sumValue278 = sumValue272 + productValue319;
                                        branchMergedValue182 = sumValue278;
                                        branchMergedValue201 = sumValue277;
                                        branchMergedValue202 = sumValue276;
                                    }
                                    branchMergedValue32 = branchMergedValue182;
                                    branchMergedValue87 = branchMergedValue201;
                                    branchMergedValue88 = branchMergedValue202;
                                }
                                else
                                {
                                    precise float sumValue279 = 1.0 - scalarValue47;
                                    precise float dotProductValue4 = sumValue279 * dot(vec3(scalarValue44, scalarValue45, scalarValue46), vec3(1.0));
                                    float scalarValue49 = spvNClamp(ceil(dotProductValue4), 0.0, 1.0);
                                    precise float sumValue280 = productValue302 - scalarValue44;
                                    precise float sumValue281 = productValue303 - scalarValue45;
                                    precise float sumValue282 = productValue304 - scalarValue46;
                                    precise float productValue320 = sumValue280 * scalarValue49;
                                    precise float productValue321 = sumValue281 * scalarValue49;
                                    precise float productValue322 = sumValue282 * scalarValue49;
                                    precise float sumValue283 = scalarValue44 + productValue320;
                                    precise float sumValue284 = scalarValue45 + productValue321;
                                    precise float sumValue285 = scalarValue46 + productValue322;
                                    branchMergedValue32 = sumValue285;
                                    branchMergedValue87 = sumValue284;
                                    branchMergedValue88 = sumValue283;
                                }
                                intermediateValue269 = branchMergedValue88;
                                intermediateValue270 = branchMergedValue87;
                                intermediateValue271 = branchMergedValue32;
                            }
                            float intermediateValue259;
                            float intermediateValue261;
                            float intermediateValue263;
                            if ((objectInstances.packedValues[productValue174] & 64us) == 0us)
                            {
                                intermediateValue259 = intermediateValue269;
                                intermediateValue261 = intermediateValue270;
                                intermediateValue263 = intermediateValue271;
                            }
                            else
                            {
                                precise float bitwiseValue112 = float(objectInstances_2.packedValues[productValue176] >> 24u) * 0.0039215688593685626983642578125;
                                precise float bitwiseValue113 = float((objectInstances_2.packedValues[productValue176] >> 16u) & 255u) * 0.0039215688593685626983642578125;
                                precise float bitwiseValue114 = float((objectInstances_2.packedValues[productValue176] >> 8u) & 255u) * 0.0039215688593685626983642578125;
                                precise float bitwiseValue115 = float(objectInstances_2.packedValues[productValue176] & 255u) * 0.0039215688593685626983642578125;
                                precise float sumValue286 = bitwiseValue112 - intermediateValue269;
                                precise float sumValue287 = bitwiseValue113 - intermediateValue270;
                                precise float sumValue288 = bitwiseValue114 - intermediateValue271;
                                precise float productValue323 = bitwiseValue115 * sumValue286;
                                precise float productValue324 = bitwiseValue115 * sumValue287;
                                precise float productValue325 = bitwiseValue115 * sumValue288;
                                precise float sumValue289 = intermediateValue269 + productValue323;
                                precise float sumValue290 = intermediateValue270 + productValue324;
                                precise float sumValue291 = intermediateValue271 + productValue325;
                                intermediateValue259 = sumValue289;
                                intermediateValue261 = sumValue290;
                                intermediateValue263 = sumValue291;
                            }
                            float branchMergedValue31;
                            float branchMergedValue84;
                            float branchMergedValue85;
                            float branchMergedValue86;
                            if ((objectInstances.packedValues[productValue174] & 16384us) == 0us)
                            {
                                branchMergedValue31 = 0.0;
                                branchMergedValue84 = intermediateValue263;
                                branchMergedValue85 = intermediateValue261;
                                branchMergedValue86 = intermediateValue259;
                            }
                            else
                            {
                                precise float sumValue292 = sumValue204 - sumValue203;
                                precise float productValue326 = sumValue292 * 8.0;
                                precise float productValue327 = ViewCB.packedValues[97u].z * 3.0;
                                precise float sumValue293 = productValue327 + productValue326;
                                precise float wavePhaseValue8 = sin(sumValue293) * 0.5;
                                precise float sumValue294 = wavePhaseValue8 + 0.5;
                                float scalarValue50 = spvNClamp(sumValue294, 0.0, 1.0);
                                precise float productValue328 = scalarValue50 * scalarValue50;
                                precise float productValue329 = 0.560000002384185791015625 * productValue328;
                                precise float sumValue295 = productValue329 + intermediateValue259;
                                precise float productValue330 = 0.2800000011920928955078125 * productValue328;
                                precise float sumValue296 = productValue330 + intermediateValue261;
                                precise float productValue331 = 0.699999988079071044921875 * productValue328;
                                precise float sumValue297 = productValue331 + intermediateValue263;
                                branchMergedValue31 = fma(productValue328, 0.00019999999494757503271102905273438, 0.0);
                                branchMergedValue84 = sumValue297;
                                branchMergedValue85 = sumValue296;
                                branchMergedValue86 = sumValue295;
                            }
                            intermediateValue258 = branchMergedValue86;
                            intermediateValue260 = branchMergedValue85;
                            intermediateValue262 = branchMergedValue84;
                            intermediateValue264 = branchMergedValue31;
                        }
                        else
                        {
                            intermediateValue258 = productValue302;
                            intermediateValue260 = productValue303;
                            intermediateValue262 = productValue304;
                            intermediateValue264 = 0.0;
                        }
                        float intermediateValue209;
                        if (intermediateValue258 < 0.040449999272823333740234375)
                        {
                            precise float productValue332 = intermediateValue258 * 0.077399380505084991455078125;
                            intermediateValue209 = productValue332;
                        }
                        else
                        {
                            precise float sumValue298 = intermediateValue258 + 0.054999999701976776123046875;
                            precise float productValue333 = sumValue298 * 0.947867333889007568359375;
                            precise float nonlinearValue4 = log2(productValue333) * 2.400000095367431640625;
                            intermediateValue209 = exp2(nonlinearValue4);
                        }
                        float intermediateValue211;
                        if (intermediateValue260 < 0.040449999272823333740234375)
                        {
                            precise float productValue334 = intermediateValue260 * 0.077399380505084991455078125;
                            intermediateValue211 = productValue334;
                        }
                        else
                        {
                            precise float sumValue299 = intermediateValue260 + 0.054999999701976776123046875;
                            precise float productValue335 = sumValue299 * 0.947867333889007568359375;
                            precise float nonlinearValue5 = log2(productValue335) * 2.400000095367431640625;
                            intermediateValue211 = exp2(nonlinearValue5);
                        }
                        float intermediateValue213;
                        if (intermediateValue262 < 0.040449999272823333740234375)
                        {
                            precise float productValue336 = intermediateValue262 * 0.077399380505084991455078125;
                            intermediateValue213 = productValue336;
                        }
                        else
                        {
                            precise float sumValue300 = intermediateValue262 + 0.054999999701976776123046875;
                            precise float productValue337 = sumValue300 * 0.947867333889007568359375;
                            precise float nonlinearValue6 = log2(productValue337) * 2.400000095367431640625;
                            intermediateValue213 = exp2(nonlinearValue6);
                        }
                        float reinterpretedBits24;
                        float reinterpretedBits37;
                        float reinterpretedBits38;
                        if ((pbrTextureDataBuffer.packedValues[productValue281] & 1u) == 0u)
                        {
                            reinterpretedBits24 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue162 * 16u) + 11u]);
                            reinterpretedBits37 = uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue162 * 16u) + 9u]);
                            reinterpretedBits38 = intermediateValue264 + uintBitsToFloat(pbrTextureDataBuffer.packedValues[(intermediateValue162 * 16u) + 10u]);
                        }
                        else
                        {
                            precise float productValue338 = sumValue203 * reinterpretedBits12.x;
                            precise float sumValue301 = productValue338 + reinterpretedBits16.x;
                            precise float productValue339 = sumValue204 * reinterpretedBits12.y;
                            precise float sumValue302 = productValue339 + reinterpretedBits16.y;
                            precise float sumValue303 = reinterpretedBits20 + scalarValue41;
                            precise float sumValue304 = sumValue303 - reinterpretedBits19;
                            vec4 sampledTextureValue7 = textureLod(nonuniformEXT(sampler2D(textures[sumValue241], defaultSampler)), vec2(sumValue301, sumValue302), spvNMin(sumValue304, reinterpretedBits20));
                            float scalarValue51 = sampledTextureValue7.y;
                            reinterpretedBits24 = sampledTextureValue7.x;
                            reinterpretedBits37 = sampledTextureValue7.z;
                            reinterpretedBits38 = fma(scalarValue51, scalarValue51, intermediateValue264);
                        }
                        precise float productValue340 = sumValue203 * reinterpretedBits17.x;
                        precise float sumValue305 = productValue340 + reinterpretedBits18.x;
                        precise float productValue341 = sumValue204 * reinterpretedBits17.y;
                        precise float sumValue306 = productValue341 + reinterpretedBits18.y;
                        precise float sumValue307 = reinterpretedBits21 + scalarValue41;
                        precise float sumValue308 = sumValue307 - reinterpretedBits19;
                        float scalarValue52 = spvNMin(sumValue308, reinterpretedBits21);
                        float intermediateValue499;
                        float intermediateValue500;
                        if ((pbrTextureDataBuffer.packedValues[productValue281] & 4u) == 0u)
                        {
                            float branchMergedValue39;
                            float branchMergedValue121;
                            if ((pbrTextureDataBuffer.packedValues[productValue281] & 16u) == 0u)
                            {
                                float branchMergedValue186;
                                float branchMergedValue218;
                                if ((pbrTextureDataBuffer.packedValues[productValue281] & 8u) == 0u)
                                {
                                    branchMergedValue186 = 0.0;
                                    branchMergedValue218 = 0.0;
                                }
                                else
                                {
                                    precise float productValue342 = scalarValue52 * (-1.0);
                                    precise float sumValue309 = productValue342 + 2.0;
                                    float scalarValue53 = spvNClamp(sumValue309, 0.0, 1.0);
                                    float branchMergedValue239;
                                    float branchMergedValue243;
                                    if (scalarValue53 > 0.0)
                                    {
                                        uint reinterpretedBits44;
                                        if (conditionValue7)
                                        {
                                            reinterpretedBits44 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits44 = scalarValue43;
                                        }
                                        uvec2 sampledTextureValue8 = uvec2(textureSize(textures[nonuniformEXT(reinterpretedBits44 + 0u)], int(0u)));
                                        precise float productValue343 = sumValue305 * float(int(uint(int(float(int(sampledTextureValue8.x))))));
                                        precise float productValue344 = sumValue306 * float(int(uint(int(float(int(sampledTextureValue8.y))))));
                                        float scalarValue54 = fract(productValue343);
                                        float scalarValue55 = fract(productValue344);
                                        precise float sumValue310 = scalarValue54 + (-0.5);
                                        float intermediateValue588;
                                        if (abs(sumValue310) < 0.0625)
                                        {
                                            precise float comparisonValue20 = sumValue305 + ((scalarValue54 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06));
                                            intermediateValue588 = comparisonValue20;
                                        }
                                        else
                                        {
                                            intermediateValue588 = sumValue305;
                                        }
                                        precise float sumValue311 = scalarValue55 + (-0.5);
                                        float intermediateValue604;
                                        if (abs(sumValue311) < 0.0625)
                                        {
                                            precise float comparisonValue24 = sumValue306 + ((scalarValue55 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06));
                                            intermediateValue604 = comparisonValue24;
                                        }
                                        else
                                        {
                                            intermediateValue604 = sumValue306;
                                        }
                                        vec4 sampledTextureValue9 = textureGather(nonuniformEXT(sampler2D(textures[sumValue241], defaultSampler)), vec2(intermediateValue588, intermediateValue604));
                                        float scalarValue56 = sampledTextureValue9.x;
                                        float scalarValue57 = sampledTextureValue9.y;
                                        float scalarValue58 = sampledTextureValue9.z;
                                        float scalarValue59 = sampledTextureValue9.w;
                                        precise float sumValue312 = productValue343 + 0.5;
                                        precise float sumValue313 = productValue344 + 0.5;
                                        float scalarValue60 = fract(sumValue312);
                                        float scalarValue61 = fract(sumValue313);
                                        bool conditionValue8 = scalarValue61 > 0.5;
                                        intermediateValue1[0u] = conditionValue8 ? scalarValue56 : scalarValue59;
                                        intermediateValue1[1u] = conditionValue8 ? scalarValue57 : scalarValue58;
                                        precise float productValue345 = intermediateValue1[uint(int(spvNClamp((scalarValue60 - ViewCB.packedValues[89u].w) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((ViewCB.packedValues[89u].w + scalarValue60) * 2.0, 0.0, 1.0)))];
                                        bool conditionValue9 = scalarValue60 > 0.5;
                                        float comparisonValue25 = conditionValue9 ? scalarValue58 : scalarValue59;
                                        float comparisonValue26 = conditionValue9 ? scalarValue57 : scalarValue56;
                                        intermediateValue1[0u] = comparisonValue25;
                                        intermediateValue1[1u] = comparisonValue26;
                                        precise float sumValue314 = (-0.0) - ViewCB.packedValues[89u].w;
                                        precise float comparisonValue27 = ((comparisonValue25 > comparisonValue26) ? ViewCB.packedValues[89u].w : sumValue314) * 0.0;
                                        precise float sumValue315 = scalarValue61 + comparisonValue27;
                                        precise float sumValue316 = sumValue315 - ViewCB.packedValues[89u].w;
                                        precise float sumValue317 = ViewCB.packedValues[89u].w + sumValue315;
                                        precise float productValue346 = sumValue316 * 2.0;
                                        precise float productValue347 = sumValue317 * 2.0;
                                        precise float sumValue318 = intermediateValue1[uint(int(spvNClamp(productValue346, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp(productValue347, 0.0, 1.0)))];
                                        float inverseLengthValue7 = inversesqrt(dot(vec3(productValue345, sumValue318, ViewCB.packedValues[90u].x), vec3(productValue345, sumValue318, ViewCB.packedValues[90u].x)));
                                        precise float productValue348 = productValue345 * inverseLengthValue7;
                                        precise float productValue349 = sumValue318 * inverseLengthValue7;
                                        precise float productValue350 = scalarValue53 * productValue348;
                                        precise float productValue351 = scalarValue53 * productValue349;
                                        branchMergedValue239 = productValue351;
                                        branchMergedValue243 = productValue350;
                                    }
                                    else
                                    {
                                        branchMergedValue239 = 0.0;
                                        branchMergedValue243 = 0.0;
                                    }
                                    branchMergedValue186 = branchMergedValue239;
                                    branchMergedValue218 = branchMergedValue243;
                                }
                                branchMergedValue39 = branchMergedValue186;
                                branchMergedValue121 = branchMergedValue218;
                            }
                            else
                            {
                                precise float productValue352 = scalarValue52 * (-1.0);
                                precise float sumValue319 = productValue352 + 2.0;
                                float scalarValue62 = spvNClamp(sumValue319, 0.0, 1.0);
                                float branchMergedValue187;
                                float branchMergedValue219;
                                if (scalarValue62 > 0.0)
                                {
                                    uint reinterpretedBits43;
                                    if (conditionValue7)
                                    {
                                        reinterpretedBits43 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits43 = scalarValue43;
                                    }
                                    uvec2 sampledTextureValue10 = uvec2(textureSize(textures[nonuniformEXT(reinterpretedBits43 + 0u)], int(0u)));
                                    precise float productValue353 = sumValue305 * float(int(uint(int(float(int(sampledTextureValue10.x))))));
                                    precise float productValue354 = sumValue306 * float(int(uint(int(float(int(sampledTextureValue10.y))))));
                                    vec4 sampledTextureValue11 = textureLod(nonuniformEXT(sampler2D(textures[sumValue241], defaultSampler)), vec2(sumValue305, sumValue306), 0.0);
                                    float scalarValue63 = fract(productValue353);
                                    float scalarValue64 = fract(productValue354);
                                    precise float sumValue320 = 1.0 - ViewCB.packedValues[89u].w;
                                    precise float productValue355 = sampledTextureValue11.y * 2.0;
                                    precise float sumValue321 = productValue355 + (-1.0);
                                    precise float comparisonValue28 = sumValue321 * ((scalarValue63 < sumValue320) ? 0.0 : 1.0);
                                    precise float productValue356 = sampledTextureValue11.w * 2.0;
                                    precise float sumValue322 = productValue356 + (-1.0);
                                    precise float comparisonValue29 = sumValue322 * ((ViewCB.packedValues[89u].w < scalarValue63) ? 0.0 : 1.0);
                                    precise float productValue357 = sampledTextureValue11.z * 2.0;
                                    precise float sumValue323 = productValue357 + (-1.0);
                                    precise float comparisonValue30 = sumValue323 * ((scalarValue64 < sumValue320) ? 0.0 : 1.0);
                                    precise float productValue358 = sampledTextureValue11.x * 2.0;
                                    precise float sumValue324 = productValue358 + (-1.0);
                                    precise float comparisonValue31 = sumValue324 * ((ViewCB.packedValues[89u].w < scalarValue64) ? 0.0 : 1.0);
                                    precise float sumValue325 = comparisonValue28 - comparisonValue29;
                                    precise float sumValue326 = comparisonValue30 - comparisonValue31;
                                    precise float comparisonValue32 = ((abs(sumValue325) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * sumValue325;
                                    precise float comparisonValue33 = ((abs(sumValue326) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * sumValue326;
                                    float inverseLengthValue8 = inversesqrt(dot(vec3(comparisonValue32, comparisonValue33, ViewCB.packedValues[90u].x), vec3(comparisonValue32, comparisonValue33, ViewCB.packedValues[90u].x)));
                                    precise float productValue359 = inverseLengthValue8 * comparisonValue32;
                                    precise float productValue360 = inverseLengthValue8 * comparisonValue33;
                                    precise float productValue361 = scalarValue62 * productValue359;
                                    precise float productValue362 = scalarValue62 * productValue360;
                                    branchMergedValue187 = productValue362;
                                    branchMergedValue219 = productValue361;
                                }
                                else
                                {
                                    branchMergedValue187 = 0.0;
                                    branchMergedValue219 = 0.0;
                                }
                                branchMergedValue39 = branchMergedValue187;
                                branchMergedValue121 = branchMergedValue219;
                            }
                            intermediateValue499 = branchMergedValue121;
                            intermediateValue500 = branchMergedValue39;
                        }
                        else
                        {
                            vec4 sampledTextureValue12 = textureLod(nonuniformEXT(sampler2D(textures[sumValue241], defaultSampler)), vec2(sumValue305, sumValue306), scalarValue52);
                            precise float productValue363 = sampledTextureValue12.x * 2.0;
                            precise float productValue364 = sampledTextureValue12.y * 2.0;
                            precise float sumValue327 = productValue363 + (-1.0);
                            precise float sumValue328 = productValue364 + (-1.0);
                            intermediateValue499 = sumValue327;
                            intermediateValue500 = sumValue328;
                        }
                        precise float sumValue329 = intermediateValue209 + (-0.039999999105930328369140625);
                        precise float sumValue330 = intermediateValue211 + (-0.039999999105930328369140625);
                        precise float sumValue331 = intermediateValue213 + (-0.039999999105930328369140625);
                        precise float productValue365 = sumValue329 * reinterpretedBits24;
                        precise float productValue366 = sumValue330 * reinterpretedBits24;
                        precise float productValue367 = sumValue331 * reinterpretedBits24;
                        precise float sumValue332 = productValue365 + 0.039999999105930328369140625;
                        precise float sumValue333 = productValue366 + 0.039999999105930328369140625;
                        precise float sumValue334 = productValue367 + 0.039999999105930328369140625;
                        float sumValue335 = 1.0 - reinterpretedBits24;
                        float productValue368 = sumValue335 * intermediateValue209;
                        float productValue369 = sumValue335 * intermediateValue211;
                        float productValue370 = sumValue335 * intermediateValue213;
                        float dotProductValue5 = dot(vec3(intermediateValue209, intermediateValue211, intermediateValue213), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                        float productValue371 = (reinterpretedBits38 * 5.0) * ViewCB.packedValues[84u].w;
                        bool comparisonValue34 = (intermediateValue88 & 3221225472u) == 2147483648u;
                        precise float productValue372 = intermediateValue499 * 0.25;
                        precise float productValue373 = intermediateValue500 * 0.25;
                        float comparisonValue35 = comparisonValue34 ? productValue372 : intermediateValue499;
                        float comparisonValue36 = comparisonValue34 ? productValue373 : intermediateValue500;
                        precise float sumValue336 = (-0.0) - comparisonValue35;
                        precise float sumValue337 = (-0.0) - comparisonValue36;
                        float comparisonValue37 = dotProductValue2 ? sumValue336 : comparisonValue35;
                        float comparisonValue38 = dotProductValue2 ? sumValue337 : comparisonValue36;
                        precise float productValue374 = comparisonValue37 * comparisonValue37;
                        precise float sumValue338 = 1.0 - productValue374;
                        precise float productValue375 = comparisonValue38 * comparisonValue38;
                        precise float sumValue339 = sumValue338 - productValue375;
                        precise float productValue376 = productValue266 * comparisonValue37;
                        precise float productValue377 = productValue267 * comparisonValue37;
                        precise float productValue378 = productValue268 * comparisonValue37;
                        precise float productValue379 = productValue278 * comparisonValue38;
                        precise float productValue380 = productValue279 * comparisonValue38;
                        precise float productValue381 = productValue280 * comparisonValue38;
                        precise float sumValue340 = productValue376 + productValue379;
                        precise float sumValue341 = productValue377 + productValue380;
                        precise float sumValue342 = productValue378 + productValue381;
                        float nonlinearValue7 = spvNMax(sqrt(sumValue339), 0.00999999977648258209228515625);
                        precise float productValue382 = comparisonValue15 * nonlinearValue7;
                        precise float productValue383 = comparisonValue16 * nonlinearValue7;
                        precise float productValue384 = comparisonValue17 * nonlinearValue7;
                        precise float sumValue343 = sumValue340 + productValue382;
                        precise float sumValue344 = sumValue341 + productValue383;
                        precise float sumValue345 = sumValue342 + productValue384;
                        precise float dotProductValue6 = dot(vec3(intermediateValue76, intermediateValue78, intermediateValue80), vec3(sumValue343, sumValue344, sumValue345)) * 2.0;
                        precise float productValue385 = dotProductValue6 * sumValue343;
                        precise float productValue386 = dotProductValue6 * sumValue344;
                        precise float productValue387 = dotProductValue6 * sumValue345;
                        precise float sumValue346 = intermediateValue76 - productValue385;
                        precise float sumValue347 = intermediateValue78 - productValue386;
                        precise float sumValue348 = intermediateValue80 - productValue387;
                        precise float dotProductValue7 = dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(sumValue346, sumValue347, sumValue348));
                        float intermediateValue205;
                        float intermediateValue206;
                        float intermediateValue207;
                        if (dotProductValue7 < 0.0)
                        {
                            float dotProductValue8 = spvNMax(0.001000000047497451305389404296875, dot(vec3(sumValue343, sumValue344, sumValue345), vec3(comparisonValue15, comparisonValue16, comparisonValue17)));
                            precise float productValue388 = sumValue343 * dotProductValue7;
                            precise float productValue389 = sumValue344 * dotProductValue7;
                            precise float productValue390 = sumValue345 * dotProductValue7;
                            precise float quotientValue18 = productValue388 / dotProductValue8;
                            precise float quotientValue19 = productValue389 / dotProductValue8;
                            precise float quotientValue20 = productValue390 / dotProductValue8;
                            precise float sumValue349 = sumValue346 - quotientValue18;
                            precise float sumValue350 = sumValue347 - quotientValue19;
                            precise float sumValue351 = sumValue348 - quotientValue20;
                            float inverseLengthValue9 = inversesqrt(dot(vec3(sumValue349, sumValue350, sumValue351), vec3(sumValue349, sumValue350, sumValue351)));
                            precise float productValue391 = sumValue349 * inverseLengthValue9;
                            precise float productValue392 = sumValue350 * inverseLengthValue9;
                            precise float productValue393 = sumValue351 * inverseLengthValue9;
                            precise float sumValue352 = productValue391 - intermediateValue76;
                            precise float sumValue353 = productValue392 - intermediateValue78;
                            precise float sumValue354 = productValue393 - intermediateValue80;
                            float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue352, sumValue353, sumValue354), vec3(sumValue352, sumValue353, sumValue354)));
                            precise float productValue394 = sumValue352 * inverseLengthValue10;
                            precise float productValue395 = sumValue353 * inverseLengthValue10;
                            precise float productValue396 = sumValue354 * inverseLengthValue10;
                            intermediateValue205 = productValue394;
                            intermediateValue206 = productValue395;
                            intermediateValue207 = productValue396;
                        }
                        else
                        {
                            intermediateValue205 = sumValue343;
                            intermediateValue206 = sumValue344;
                            intermediateValue207 = sumValue345;
                        }
                        precise float sumValue355 = 0.0 - reinterpretedBits37;
                        precise float productValue397 = sumValue355 * ViewCB.packedValues[85u].w;
                        precise float sumValue356 = reinterpretedBits37 + productValue397;
                        branchMergedValue28 = intermediateValue213;
                        branchMergedValue56 = intermediateValue211;
                        branchMergedValue57 = intermediateValue209;
                        branchMergedValue58 = productValue370 - (productValue370 * reinterpretedBits38);
                        branchMergedValue59 = productValue368 - (productValue368 * reinterpretedBits38);
                        branchMergedValue60 = sumValue334;
                        branchMergedValue61 = sumValue333;
                        branchMergedValue62 = sumValue332;
                        branchMergedValue63 = productValue371 * (((dotProductValue5 - intermediateValue213) * ViewCB.packedValues[85u].x) + intermediateValue213);
                        branchMergedValue64 = productValue371 * (((dotProductValue5 - intermediateValue211) * ViewCB.packedValues[85u].x) + intermediateValue211);
                        branchMergedValue65 = productValue371 * (((dotProductValue5 - intermediateValue209) * ViewCB.packedValues[85u].x) + intermediateValue209);
                        branchMergedValue66 = intermediateValue207;
                        branchMergedValue67 = intermediateValue206;
                        branchMergedValue68 = intermediateValue205;
                        branchMergedValue69 = sumValue356;
                        branchMergedValue70 = reinterpretedBits24;
                        branchMergedValue71 = intermediateValue204;
                        branchMergedValue72 = productValue369 - (productValue369 * reinterpretedBits38);
                    }
                    else
                    {
                        precise float productValue398 = intermediateValue200 * ViewCB.packedValues[98u].y;
                        precise float productValue399 = intermediateValue201 * ViewCB.packedValues[98u].y;
                        precise float productValue400 = intermediateValue202 * ViewCB.packedValues[98u].y;
                        precise float nonlinearValue8 = log2(productValue398) * 1.39999997615814208984375;
                        precise float nonlinearValue9 = log2(productValue399) * 1.39999997615814208984375;
                        precise float nonlinearValue10 = log2(productValue400) * 1.39999997615814208984375;
                        branchMergedValue28 = exp2(nonlinearValue10);
                        branchMergedValue56 = exp2(nonlinearValue9);
                        branchMergedValue57 = exp2(nonlinearValue8);
                        branchMergedValue58 = intermediateValue74;
                        branchMergedValue59 = intermediateValue70;
                        branchMergedValue60 = intermediateValue68;
                        branchMergedValue61 = intermediateValue66;
                        branchMergedValue62 = intermediateValue64;
                        branchMergedValue63 = intermediateValue62;
                        branchMergedValue64 = intermediateValue60;
                        branchMergedValue65 = intermediateValue58;
                        branchMergedValue66 = intermediateValue56;
                        branchMergedValue67 = intermediateValue54;
                        branchMergedValue68 = intermediateValue52;
                        branchMergedValue69 = intermediateValue50;
                        branchMergedValue70 = intermediateValue48;
                        branchMergedValue71 = intermediateValue46;
                        branchMergedValue72 = intermediateValue72;
                    }
                    intermediateValue47 = branchMergedValue71;
                    intermediateValue49 = branchMergedValue70;
                    intermediateValue51 = branchMergedValue69;
                    intermediateValue53 = branchMergedValue68;
                    intermediateValue55 = branchMergedValue67;
                    intermediateValue57 = branchMergedValue66;
                    intermediateValue59 = branchMergedValue65;
                    intermediateValue61 = branchMergedValue64;
                    intermediateValue63 = branchMergedValue63;
                    intermediateValue65 = branchMergedValue62;
                    intermediateValue67 = branchMergedValue61;
                    intermediateValue69 = branchMergedValue60;
                    intermediateValue71 = branchMergedValue59;
                    intermediateValue73 = branchMergedValue72;
                    intermediateValue75 = branchMergedValue58;
                    intermediateValue208 = branchMergedValue57;
                    intermediateValue210 = branchMergedValue56;
                    intermediateValue212 = branchMergedValue28;
                }
                else
                {
                    precise float productValue401 = intermediateValue200 * ViewCB.packedValues[98u].x;
                    precise float productValue402 = intermediateValue201 * ViewCB.packedValues[98u].x;
                    precise float productValue403 = intermediateValue202 * ViewCB.packedValues[98u].x;
                    precise float nonlinearValue11 = log2(productValue401) * 1.7999999523162841796875;
                    precise float nonlinearValue12 = log2(productValue402) * 1.7999999523162841796875;
                    precise float nonlinearValue13 = log2(productValue403) * 1.7999999523162841796875;
                    intermediateValue47 = intermediateValue46;
                    intermediateValue49 = intermediateValue48;
                    intermediateValue51 = intermediateValue50;
                    intermediateValue53 = intermediateValue52;
                    intermediateValue55 = intermediateValue54;
                    intermediateValue57 = intermediateValue56;
                    intermediateValue59 = intermediateValue58;
                    intermediateValue61 = intermediateValue60;
                    intermediateValue63 = intermediateValue62;
                    intermediateValue65 = intermediateValue64;
                    intermediateValue67 = intermediateValue66;
                    intermediateValue69 = intermediateValue68;
                    intermediateValue71 = intermediateValue70;
                    intermediateValue73 = intermediateValue72;
                    intermediateValue75 = intermediateValue74;
                    intermediateValue208 = exp2(nonlinearValue11);
                    intermediateValue210 = exp2(nonlinearValue12);
                    intermediateValue212 = exp2(nonlinearValue13);
                }
                float comparisonValue39 = (int(intermediateValue88) > int(4294967295u)) ? 1.0 : intermediateValue47;
                float intermediateValue219;
                float intermediateValue220;
                float intermediateValue221;
                float intermediateValue222;
                float intermediateValue224;
                float intermediateValue226;
                float intermediateValue228;
                float intermediateValue229;
                float intermediateValue230;
                float intermediateValue231;
                float intermediateValue232;
                float intermediateValue233;
                float intermediateValue234;
                float intermediateValue235;
                float intermediateValue236;
                if (conditionValue6)
                {
                    precise float sumValue357 = sumValue211 - ViewCB.packedValues[68u].x;
                    precise float sumValue358 = sumValue217 - ViewCB.packedValues[68u].z;
                    precise float dotProductValue9 = sumValue239 / spvNMax(0.001000000047497451305389404296875, abs(dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(intermediateValue76, intermediateValue78, intermediateValue80))));
                    precise float sumValue359 = dotProductValue9 + (-0.00999999977648258209228515625);
                    precise float quotientValue21 = sumValue359 / 0.0199999995529651641845703125;
                    float scalarValue65 = spvNClamp(quotientValue21, 0.0, 1.0);
                    precise float productValue404 = scalarValue65 * 2.0;
                    precise float sumValue360 = 3.0 - productValue404;
                    precise float productValue405 = scalarValue65 * sumValue360;
                    precise float productValue406 = scalarValue65 * productValue405;
                    precise float sumValue361 = 1.0 - productValue406;
                    float intermediateValue223;
                    float intermediateValue225;
                    float intermediateValue227;
                    if (sumValue361 == 0.0)
                    {
                        intermediateValue223 = comparisonValue15;
                        intermediateValue225 = comparisonValue16;
                        intermediateValue227 = comparisonValue17;
                    }
                    else
                    {
                        precise float sumValue362 = sumValue214 - ViewCB.packedValues[68u].y;
                        bool comparisonValue40 = abs(float(comparisonValue16 < 0.9900000095367431640625)) != 0.0;
                        precise float productValue407 = comparisonValue16 * 0.0;
                        precise float sumValue363 = comparisonValue17 - productValue407;
                        precise float productValue408 = comparisonValue15 * 0.0;
                        precise float productValue409 = comparisonValue17 * 0.0;
                        precise float sumValue364 = productValue408 - productValue409;
                        precise float sumValue365 = productValue407 - comparisonValue15;
                        float inverseLengthValue11 = inversesqrt(dot(vec3(sumValue363, sumValue364, sumValue365), vec3(sumValue363, sumValue364, sumValue365)));
                        precise float productValue410 = sumValue363 * inverseLengthValue11;
                        precise float productValue411 = sumValue364 * inverseLengthValue11;
                        precise float productValue412 = sumValue365 * inverseLengthValue11;
                        float comparisonValue41 = comparisonValue40 ? productValue410 : 1.0;
                        float comparisonValue43 = comparisonValue40 ? productValue411 : 0.0;
                        float comparisonValue44 = comparisonValue40 ? productValue412 : 0.0;
                        precise float productValue413 = comparisonValue16 * comparisonValue44;
                        precise float productValue414 = comparisonValue17 * comparisonValue43;
                        precise float sumValue366 = productValue413 - productValue414;
                        precise float productValue415 = comparisonValue17 * comparisonValue41;
                        precise float productValue416 = comparisonValue15 * comparisonValue44;
                        precise float sumValue367 = productValue415 - productValue416;
                        precise float productValue417 = comparisonValue15 * comparisonValue43;
                        precise float productValue418 = comparisonValue16 * comparisonValue41;
                        precise float sumValue368 = productValue417 - productValue418;
                        precise float productValue419 = sumValue362 * 0.100000001490116119384765625;
                        precise float dotProductValue10 = dot(vec3(sumValue357, productValue419, sumValue358), vec3(comparisonValue41, comparisonValue43, comparisonValue44));
                        precise float dotProductValue11 = dot(vec3(sumValue357, productValue419, sumValue358), vec3(sumValue366, sumValue367, sumValue368));
                        precise float productValue420 = dotProductValue10 * 0.60000002384185791015625;
                        precise float productValue421 = dotProductValue11 * 0.60000002384185791015625;
                        precise float productValue422 = ViewCB.packedValues[97u].z * 0.00999999977648258209228515625;
                        precise float productValue423 = ViewCB.packedValues[97u].z * 0.0199999995529651641845703125;
                        precise float productValue424 = productValue422 * 2.5;
                        precise float productValue425 = productValue423 * 2.5;
                        precise float sumValue369 = productValue420 + productValue424;
                        precise float sumValue370 = productValue421 + productValue425;
                        vec4 sampledTextureValue13 = textureLod(sampler2D(waterNormalsTexture, linearWrapSampler), vec2(sumValue369, sumValue370), 0.0);
                        precise float productValue426 = sampledTextureValue13.x * 2.0;
                        precise float productValue430 = sampledTextureValue13.y * 2.0;
                        precise float sumValue371 = productValue426 + (-1.0);
                        precise float sumValue372 = productValue430 + (-1.0);
                        precise float productValue431 = sumValue371 * 0.300000011920928955078125;
                        precise float productValue432 = sumValue372 * 0.300000011920928955078125;
                        precise float productValue433 = dotProductValue10 * 0.300000011920928955078125;
                        precise float productValue434 = dotProductValue11 * 0.300000011920928955078125;
                        precise float productValue435 = ViewCB.packedValues[97u].z * 0.0130000002682209014892578125;
                        precise float productValue436 = ViewCB.packedValues[97u].z * 0.01400000043213367462158203125;
                        precise float productValue437 = productValue435 * 2.5;
                        precise float productValue438 = productValue436 * 2.5;
                        precise float sumValue373 = productValue433 + productValue437;
                        precise float sumValue374 = productValue434 + productValue438;
                        vec4 sampledTextureValue14 = textureLod(sampler2D(waterNormalsTexture, linearWrapSampler), vec2(sumValue373, sumValue374), 0.0);
                        precise float productValue439 = sampledTextureValue14.x * 2.0;
                        precise float productValue440 = sampledTextureValue14.y * 2.0;
                        precise float sumValue375 = productValue439 + (-1.0);
                        precise float sumValue376 = productValue440 + (-1.0);
                        precise float productValue441 = sumValue375 * 0.5;
                        precise float productValue442 = sumValue376 * 0.5;
                        precise float productValue443 = dotProductValue10 * 0.61000001430511474609375;
                        precise float productValue444 = dotProductValue11 * 0.61000001430511474609375;
                        precise float productValue445 = ViewCB.packedValues[97u].z * (-0.00999999977648258209228515625);
                        precise float productValue446 = ViewCB.packedValues[97u].z * (-0.0199999995529651641845703125);
                        precise float productValue447 = productValue445 * 2.5;
                        precise float productValue448 = productValue446 * 2.5;
                        precise float sumValue377 = productValue443 + productValue447;
                        precise float sumValue378 = productValue444 + productValue448;
                        vec4 sampledTextureValue15 = textureLod(sampler2D(waterNormalsTexture, linearWrapSampler), vec2(sumValue377, sumValue378), 0.0);
                        precise float productValue450 = sampledTextureValue15.x * 2.0;
                        precise float productValue451 = sampledTextureValue15.y * 2.0;
                        precise float sumValue379 = productValue450 + (-1.0);
                        precise float sumValue380 = productValue451 + (-1.0);
                        precise float productValue452 = sumValue379 * 0.300000011920928955078125;
                        precise float productValue453 = sumValue380 * 0.300000011920928955078125;
                        precise float sumValue381 = productValue431 + productValue441;
                        precise float sumValue382 = productValue432 + productValue442;
                        precise float sumValue383 = sampledTextureValue13.z + sampledTextureValue14.z;
                        precise float sumValue384 = sumValue381 + productValue452;
                        precise float sumValue385 = sumValue382 + productValue453;
                        precise float sumValue386 = sumValue383 + sampledTextureValue15.z;
                        precise float productValue454 = sumValue361 * sumValue384;
                        precise float productValue455 = sumValue361 * sumValue385;
                        float inverseLengthValue12 = inversesqrt(dot(vec3(productValue454, productValue455, sumValue386), vec3(productValue454, productValue455, sumValue386)));
                        precise float productValue456 = inverseLengthValue12 * productValue454;
                        precise float productValue457 = inverseLengthValue12 * productValue455;
                        precise float productValue458 = sumValue386 * inverseLengthValue12;
                        precise float productValue459 = comparisonValue41 * productValue456;
                        precise float productValue460 = comparisonValue43 * productValue456;
                        precise float productValue461 = comparisonValue44 * productValue456;
                        precise float productValue462 = sumValue366 * productValue457;
                        precise float productValue463 = sumValue367 * productValue457;
                        precise float productValue464 = sumValue368 * productValue457;
                        precise float sumValue387 = productValue459 + productValue462;
                        precise float sumValue388 = productValue460 + productValue463;
                        precise float sumValue389 = productValue461 + productValue464;
                        precise float productValue465 = comparisonValue15 * productValue458;
                        precise float productValue466 = comparisonValue16 * productValue458;
                        precise float productValue467 = comparisonValue17 * productValue458;
                        precise float sumValue390 = productValue465 + sumValue387;
                        precise float sumValue391 = productValue466 + sumValue388;
                        precise float sumValue392 = productValue467 + sumValue389;
                        intermediateValue223 = sumValue390;
                        intermediateValue225 = sumValue391;
                        intermediateValue227 = sumValue392;
                    }
                    precise float productValue468 = comparisonValue39 * 0.5;
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
                    if ((floatBitsToUint(ViewCB.packedValues[54u]).w != 0u) && (floatBitsToUint(ViewCB.packedValues[91u]).y == 2u))
                    {
                        precise float sumValue393 = (-0.0) - intermediateValue223;
                        precise float sumValue394 = (-0.0) - intermediateValue225;
                        precise float sumValue395 = (-0.0) - intermediateValue227;
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
                        if (dot(vec3(intermediateValue76, intermediateValue78, intermediateValue80), vec3(sumValue393, sumValue394, sumValue395)) < 0.65939998626708984375)
                        {
                            branchMergedValue180 = 1.0;
                            branchMergedValue190 = 1.0;
                            branchMergedValue191 = 1.0;
                            branchMergedValue192 = 0.0;
                            branchMergedValue193 = 0.0;
                            branchMergedValue194 = 0.0;
                            branchMergedValue195 = 1.0;
                            branchMergedValue196 = 1.0;
                            branchMergedValue197 = intermediateValue227;
                            branchMergedValue198 = intermediateValue225;
                            branchMergedValue229 = intermediateValue223;
                            branchMergedValue230 = 0.0;
                            branchMergedValue231 = 1.0;
                            branchMergedValue232 = 1.0;
                            branchMergedValue233 = 1.0;
                        }
                        else
                        {
                            branchMergedValue180 = intermediateValue212;
                            branchMergedValue190 = intermediateValue210;
                            branchMergedValue191 = intermediateValue208;
                            branchMergedValue192 = intermediateValue75;
                            branchMergedValue193 = intermediateValue73;
                            branchMergedValue194 = intermediateValue71;
                            branchMergedValue195 = intermediateValue69;
                            branchMergedValue196 = intermediateValue67;
                            branchMergedValue197 = intermediateValue227;
                            branchMergedValue198 = intermediateValue225;
                            branchMergedValue229 = intermediateValue223;
                            branchMergedValue230 = productValue468;
                            branchMergedValue231 = intermediateValue49;
                            branchMergedValue232 = comparisonValue39;
                            branchMergedValue233 = intermediateValue65;
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
                        branchMergedValue29 = intermediateValue212;
                        branchMergedValue73 = intermediateValue210;
                        branchMergedValue74 = intermediateValue208;
                        branchMergedValue75 = intermediateValue75;
                        branchMergedValue76 = intermediateValue73;
                        branchMergedValue77 = intermediateValue71;
                        branchMergedValue78 = intermediateValue69;
                        branchMergedValue79 = intermediateValue67;
                        branchMergedValue80 = intermediateValue227;
                        branchMergedValue81 = intermediateValue225;
                        branchMergedValue148 = intermediateValue223;
                        branchMergedValue149 = productValue468;
                        branchMergedValue150 = intermediateValue49;
                        branchMergedValue151 = comparisonValue39;
                        branchMergedValue152 = intermediateValue65;
                    }
                    intermediateValue219 = branchMergedValue151;
                    intermediateValue220 = branchMergedValue150;
                    intermediateValue221 = branchMergedValue149;
                    intermediateValue222 = branchMergedValue148;
                    intermediateValue224 = branchMergedValue81;
                    intermediateValue226 = branchMergedValue80;
                    intermediateValue228 = branchMergedValue152;
                    intermediateValue229 = branchMergedValue79;
                    intermediateValue230 = branchMergedValue78;
                    intermediateValue231 = branchMergedValue77;
                    intermediateValue232 = branchMergedValue76;
                    intermediateValue233 = branchMergedValue75;
                    intermediateValue234 = branchMergedValue74;
                    intermediateValue235 = branchMergedValue73;
                    intermediateValue236 = branchMergedValue29;
                }
                else
                {
                    intermediateValue219 = comparisonValue39;
                    intermediateValue220 = intermediateValue49;
                    intermediateValue221 = intermediateValue51;
                    intermediateValue222 = intermediateValue53;
                    intermediateValue224 = intermediateValue55;
                    intermediateValue226 = intermediateValue57;
                    intermediateValue228 = intermediateValue65;
                    intermediateValue229 = intermediateValue67;
                    intermediateValue230 = intermediateValue69;
                    intermediateValue231 = intermediateValue71;
                    intermediateValue232 = intermediateValue73;
                    intermediateValue233 = intermediateValue75;
                    intermediateValue234 = intermediateValue208;
                    intermediateValue235 = intermediateValue210;
                    intermediateValue236 = intermediateValue212;
                }
                precise float sumValue396 = 0.0 - intermediateValue234;
                precise float sumValue397 = 0.0 - intermediateValue235;
                precise float sumValue398 = 0.0 - intermediateValue236;
                precise float productValue469 = intermediateValue219 * sumValue396;
                precise float productValue470 = intermediateValue219 * sumValue397;
                precise float productValue471 = intermediateValue219 * sumValue398;
                precise float sumValue399 = intermediateValue234 + productValue469;
                precise float sumValue400 = intermediateValue235 + productValue470;
                precise float sumValue401 = intermediateValue236 + productValue471;
                float intermediateValue240;
                float intermediateValue241;
                float intermediateValue242;
                if (intermediateValue104 == 0u)
                {
                    intermediateValue240 = intermediateValue98;
                    intermediateValue241 = intermediateValue100;
                    intermediateValue242 = intermediateValue102;
                }
                else
                {
                    precise float sumValue402 = (-0.0) - intermediateValue86;
                    precise float productValue472 = ViewCB.packedValues[63u].x * sumValue402;
                    precise float productValue473 = ViewCB.packedValues[63u].y * sumValue402;
                    precise float productValue474 = ViewCB.packedValues[63u].z * sumValue402;
                    precise float productValue475 = productValue472 * 1.44269502162933349609375;
                    precise float productValue476 = productValue473 * 1.44269502162933349609375;
                    precise float productValue477 = productValue474 * 1.44269502162933349609375;
                    precise float exponentialValue1 = intermediateValue98 * exp2(productValue475);
                    precise float exponentialValue2 = intermediateValue100 * exp2(productValue476);
                    precise float exponentialValue3 = intermediateValue102 * exp2(productValue477);
                    intermediateValue240 = exponentialValue1;
                    intermediateValue241 = exponentialValue2;
                    intermediateValue242 = exponentialValue3;
                }
                float productValue478 = (intermediateValue240 * intermediateValue59) + intermediateValue92;
                float productValue479 = (intermediateValue241 * intermediateValue61) + intermediateValue94;
                float productValue480 = (intermediateValue242 * intermediateValue63) + intermediateValue96;
                precise float sumValue403 = (-0.0) - intermediateValue76;
                precise float sumValue404 = (-0.0) - intermediateValue78;
                precise float sumValue405 = (-0.0) - intermediateValue80;
                precise float productValue481 = comparisonValue15 * 256.0;
                uint scalarValue66 = uint(int(productValue481));
                precise float productValue482 = comparisonValue16 * 256.0;
                uint scalarValue67 = uint(int(productValue482));
                precise float productValue483 = comparisonValue17 * 256.0;
                uint scalarValue68 = uint(int(productValue483));
                uint reinterpretedBits22 = floatBitsToUint(sumValue211);
                bool conditionValue10 = sumValue211 < 0.0;
                uint reinterpretedBits26 = floatBitsToUint(sumValue214);
                bool conditionValue11 = sumValue214 < 0.0;
                uint reinterpretedBits27 = floatBitsToUint(sumValue217);
                bool conditionValue12 = sumValue217 < 0.0;
                bool conditionValue13 = abs(sumValue211) < 0.03125;
                precise float productValue484 = comparisonValue15 * 1.52587890625e-05;
                precise float sumValue406 = sumValue211 + productValue484;
                float reinterpretedBits28 = conditionValue13 ? sumValue406 : uintBitsToFloat((conditionValue10 ? (-scalarValue66) : scalarValue66) + reinterpretedBits22);
                bool conditionValue14 = abs(sumValue214) < 0.03125;
                precise float productValue485 = comparisonValue16 * 1.52587890625e-05;
                precise float sumValue407 = sumValue214 + productValue485;
                float reinterpretedBits29 = conditionValue14 ? sumValue407 : uintBitsToFloat((conditionValue11 ? (-scalarValue67) : scalarValue67) + reinterpretedBits26);
                bool conditionValue15 = abs(sumValue217) < 0.03125;
                precise float productValue486 = comparisonValue17 * 1.52587890625e-05;
                precise float sumValue408 = sumValue217 + productValue486;
                float reinterpretedBits30 = conditionValue15 ? sumValue408 : uintBitsToFloat((conditionValue12 ? (-scalarValue68) : scalarValue68) + reinterpretedBits27);
                bool dotProductValue12 = dot(vec3(0.847100675106048583984375, 0.2079117000102996826171875, 0.489073812961578369140625), vec3(ViewCB.packedValues[52u].xyz)) > 0.949999988079071044921875;
                float comparisonValue45 = dotProductValue12 ? (-0.639436304569244384765625) : 0.847100675106048583984375;
                float comparisonValue46 = dotProductValue12 ? (-0.3907311260700225830078125) : 0.2079117000102996826171875;
                float comparisonValue47 = dotProductValue12 ? 0.6621558666229248046875 : 0.489073812961578369140625;
                precise float dotProductValue13 = dot(vec3(comparisonValue45, comparisonValue46, comparisonValue47), vec3(ViewCB.packedValues[52u].xyz));
                precise float productValue487 = ViewCB.packedValues[52u].x * dotProductValue13;
                precise float productValue488 = ViewCB.packedValues[52u].y * dotProductValue13;
                precise float productValue489 = ViewCB.packedValues[52u].z * dotProductValue13;
                precise float sumValue409 = comparisonValue45 - productValue487;
                precise float sumValue410 = comparisonValue46 - productValue488;
                precise float sumValue411 = comparisonValue47 - productValue489;
                float inverseLengthValue13 = inversesqrt(dot(vec3(sumValue409, sumValue410, sumValue411), vec3(sumValue409, sumValue410, sumValue411)));
                precise float productValue490 = sumValue409 * inverseLengthValue13;
                precise float productValue491 = sumValue410 * inverseLengthValue13;
                precise float productValue492 = sumValue411 * inverseLengthValue13;
                precise float productValue493 = ViewCB.packedValues[52u].y * productValue492;
                precise float productValue494 = ViewCB.packedValues[52u].z * productValue491;
                precise float sumValue412 = productValue493 - productValue494;
                precise float productValue495 = ViewCB.packedValues[52u].z * productValue490;
                precise float productValue496 = ViewCB.packedValues[52u].x * productValue492;
                precise float sumValue413 = productValue495 - productValue496;
                precise float productValue497 = ViewCB.packedValues[52u].x * productValue491;
                precise float productValue498 = ViewCB.packedValues[52u].y * productValue490;
                precise float sumValue414 = productValue497 - productValue498;
                uvec4 reinterpretedBits31 = floatBitsToUint(ViewCB.packedValues[84u]);
                uint scalarValue69 = reinterpretedBits31.z;
                vec4 sampledTextureValue16 = texelFetch(blueNoiseTexture, ivec3(uvec3(bitwiseValue2 & 255u, bitwiseValue3 & 255u, (scalarValue69 >> 1u) & 127u)), int(0u));
                bool comparisonValue48 = (scalarValue69 & 1u) == 0u;
                float nonlinearValue14 = sqrt(comparisonValue48 ? sampledTextureValue16.x : sampledTextureValue16.z);
                precise float comparisonValue49 = (comparisonValue48 ? sampledTextureValue16.y : sampledTextureValue16.w) * 6.283185482025146484375;
                precise float wavePhaseValue9 = nonlinearValue14 * cos(comparisonValue49);
                precise float wavePhaseValue10 = nonlinearValue14 * sin(comparisonValue49);
                precise float productValue499 = wavePhaseValue9 * 0.01860214583575725555419921875;
                precise float productValue500 = wavePhaseValue10 * 0.01860214583575725555419921875;
                precise float productValue501 = productValue490 * productValue499;
                precise float productValue502 = productValue491 * productValue499;
                precise float productValue503 = productValue492 * productValue499;
                precise float productValue504 = sumValue412 * productValue500;
                precise float productValue505 = sumValue413 * productValue500;
                precise float productValue506 = sumValue414 * productValue500;
                precise float sumValue415 = productValue501 + productValue504;
                precise float sumValue416 = productValue502 + productValue505;
                precise float sumValue417 = productValue503 + productValue506;
                precise float sumValue418 = ViewCB.packedValues[52u].x + sumValue415;
                precise float sumValue419 = ViewCB.packedValues[52u].y + sumValue416;
                precise float sumValue420 = ViewCB.packedValues[52u].z + sumValue417;
                float intermediateValue253;
                float intermediateValue254;
                float intermediateValue255;
                if (dot(vec3(sumValue418, sumValue419, sumValue420), vec3(comparisonValue15, comparisonValue16, comparisonValue17)) < 0.0)
                {
                    intermediateValue253 = 0.0;
                    intermediateValue254 = 0.0;
                    intermediateValue255 = 0.0;
                }
                else
                {
                    float inverseLengthValue14 = inversesqrt(dot(vec3(sumValue418, sumValue419, sumValue420), vec3(sumValue418, sumValue419, sumValue420)));
                    float productValue507 = inverseLengthValue14 * sumValue418;
                    float productValue508 = inverseLengthValue14 * sumValue419;
                    float productValue509 = inverseLengthValue14 * sumValue420;
                    rayQueryInitializeEXT(intermediateValue256, SceneBVH, 512u, 32u, vec3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0, vec3(ViewCB.packedValues[53u].xyz), 10000.0);
                    bool conditionValue16 = rayQueryProceedEXT(intermediateValue256);
                    if (conditionValue16)
                    {
                        bool intermediateValue306;
                        bool comparisonValue42;
                        for (;;)
                        {
                            uint scalarValue70 = rayQueryGetIntersectionTypeEXT(intermediateValue256, bool(0u));
                            comparisonValue42 = scalarValue70 == 0u;
                            if (comparisonValue42)
                            {
                                vec2 vectorValue5 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue256, bool(0u));
                                vec2 vectorValue6 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue256, bool(0u));
                                uint scalarValue71 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue256, bool(0u));
                                uint scalarValue72 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue256, bool(0u));
                                uint scalarValue73 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue256, bool(0u));
                                uint productValue510 = (scalarValue73 * 76u) + 58u;
                                uint productValue511 = (scalarValue73 * 76u) + 61u;
                                precise float sumValue421 = 1.0 - vectorValue5.x;
                                precise float sumValue422 = sumValue421 - vectorValue6.y;
                                uint bitwiseValue116 = (objectInstances_2.packedValues[(scalarValue73 * 38u) + 25u] >> 2u) + (scalarValue71 >> 1u);
                                uint productValue512 = uint(objectInstances.packedValues[(scalarValue73 * 76u) + 54u]) + 0u;
                                bool comparisonValue50 = (scalarValue71 & 1u) == 0u;
                                uint comparisonValue51 = comparisonValue50 ? faceUvBuffersRW[nonuniformEXT(productValue512)].packedValues[bitwiseValue116].z : faceUvBuffersRW[nonuniformEXT(productValue512)].packedValues[bitwiseValue116].x;
                                uint comparisonValue52 = comparisonValue50 ? faceUvBuffersRW[nonuniformEXT(productValue512)].packedValues[bitwiseValue116].y : faceUvBuffersRW[nonuniformEXT(productValue512)].packedValues[bitwiseValue116].w;
                                uint comparisonValue53 = comparisonValue50 ? faceUvBuffersRW[nonuniformEXT(productValue512)].packedValues[bitwiseValue116].x : faceUvBuffersRW[nonuniformEXT(productValue512)].packedValues[bitwiseValue116].z;
                                bool conditionValue17 = int16_t(objectInstances.packedValues[productValue511]) < int16_t(0us);
                                float intermediateValue341;
                                float intermediateValue342;
                                if (conditionValue17)
                                {
                                    uint bitwiseValue117 = comparisonValue53 >> 15u;
                                    precise float bitwiseValue118 = float(bitwiseValue117 & 1u) * 2.0;
                                    precise float sumValue423 = bitwiseValue118 + (-1.0);
                                    precise float bitwiseValue119 = float(comparisonValue53 >> 31u) * 2.0;
                                    precise float sumValue424 = bitwiseValue119 + (-1.0);
                                    precise float bitwiseValue120 = float((comparisonValue53 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue121 = float(bitwiseValue117 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue513 = sumValue423 * 3.0517578125e-05;
                                    precise float productValue514 = sumValue424 * 3.0517578125e-05;
                                    precise float sumValue425 = bitwiseValue120 + productValue513;
                                    precise float sumValue426 = bitwiseValue121 + productValue514;
                                    intermediateValue341 = sumValue425;
                                    intermediateValue342 = sumValue426;
                                }
                                else
                                {
                                    precise float bitwiseValue122 = float(comparisonValue53 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue123 = float(comparisonValue53 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue515 = bitwiseValue122 * 16384.0;
                                    precise float sumValue427 = productValue515 + 0.5;
                                    precise float productValue516 = bitwiseValue123 * 16384.0;
                                    precise float sumValue428 = productValue516 + 0.5;
                                    precise float productValue517 = floor(sumValue427) * 6.103515625e-05;
                                    precise float productValue518 = floor(sumValue428) * 6.103515625e-05;
                                    intermediateValue341 = productValue517;
                                    intermediateValue342 = productValue518;
                                }
                                precise float productValue519 = sumValue422 * intermediateValue341;
                                precise float productValue520 = sumValue422 * intermediateValue342;
                                precise float sumValue429 = productValue519 + 0.0;
                                precise float sumValue430 = productValue520 + 0.0;
                                float intermediateValue408;
                                float intermediateValue409;
                                if (conditionValue17)
                                {
                                    uint bitwiseValue124 = comparisonValue52 >> 15u;
                                    precise float bitwiseValue125 = float(bitwiseValue124 & 1u) * 2.0;
                                    precise float sumValue431 = bitwiseValue125 + (-1.0);
                                    precise float bitwiseValue126 = float(comparisonValue52 >> 31u) * 2.0;
                                    precise float sumValue432 = bitwiseValue126 + (-1.0);
                                    precise float bitwiseValue127 = float((comparisonValue52 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue128 = float(bitwiseValue124 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue521 = sumValue431 * 3.0517578125e-05;
                                    precise float productValue522 = sumValue432 * 3.0517578125e-05;
                                    precise float sumValue433 = bitwiseValue127 + productValue521;
                                    precise float sumValue434 = bitwiseValue128 + productValue522;
                                    intermediateValue408 = sumValue433;
                                    intermediateValue409 = sumValue434;
                                }
                                else
                                {
                                    precise float bitwiseValue129 = float(comparisonValue52 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue130 = float(comparisonValue52 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue523 = bitwiseValue129 * 16384.0;
                                    precise float sumValue435 = productValue523 + 0.5;
                                    precise float productValue524 = bitwiseValue130 * 16384.0;
                                    precise float sumValue436 = productValue524 + 0.5;
                                    precise float productValue525 = floor(sumValue435) * 6.103515625e-05;
                                    precise float productValue526 = floor(sumValue436) * 6.103515625e-05;
                                    intermediateValue408 = productValue525;
                                    intermediateValue409 = productValue526;
                                }
                                precise float productValue527 = vectorValue5.x * intermediateValue408;
                                precise float productValue528 = vectorValue5.x * intermediateValue409;
                                precise float sumValue437 = sumValue429 + productValue527;
                                precise float sumValue438 = sumValue430 + productValue528;
                                float intermediateValue464;
                                float intermediateValue465;
                                if (conditionValue17)
                                {
                                    uint bitwiseValue131 = comparisonValue51 >> 15u;
                                    precise float bitwiseValue132 = float(bitwiseValue131 & 1u) * 2.0;
                                    precise float sumValue439 = bitwiseValue132 + (-1.0);
                                    precise float bitwiseValue133 = float(comparisonValue51 >> 31u) * 2.0;
                                    precise float sumValue440 = bitwiseValue133 + (-1.0);
                                    precise float bitwiseValue134 = float((comparisonValue51 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue135 = float(bitwiseValue131 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue529 = sumValue439 * 3.0517578125e-05;
                                    precise float productValue530 = sumValue440 * 3.0517578125e-05;
                                    precise float sumValue441 = bitwiseValue134 + productValue529;
                                    precise float sumValue442 = bitwiseValue135 + productValue530;
                                    intermediateValue464 = sumValue441;
                                    intermediateValue465 = sumValue442;
                                }
                                else
                                {
                                    precise float bitwiseValue136 = float(comparisonValue51 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue137 = float(comparisonValue51 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue531 = bitwiseValue136 * 16384.0;
                                    precise float sumValue443 = productValue531 + 0.5;
                                    precise float productValue533 = bitwiseValue137 * 16384.0;
                                    precise float sumValue444 = productValue533 + 0.5;
                                    precise float productValue534 = floor(sumValue443) * 6.103515625e-05;
                                    precise float productValue535 = floor(sumValue444) * 6.103515625e-05;
                                    intermediateValue464 = productValue534;
                                    intermediateValue465 = productValue535;
                                }
                                precise float productValue536 = vectorValue6.y * intermediateValue464;
                                precise float productValue537 = vectorValue6.y * intermediateValue465;
                                precise float sumValue445 = sumValue437 + productValue536;
                                precise float sumValue446 = sumValue438 + productValue537;
                                float intermediateValue491;
                                if (objectInstances.packedValues[productValue510] == 65535us)
                                {
                                    intermediateValue491 = 1.0;
                                }
                                else
                                {
                                    uint reinterpretedBits42;
                                    if (objectInstances.packedValues[productValue510] > 4095us)
                                    {
                                        reinterpretedBits42 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits42 = uint(objectInstances.packedValues[productValue510]);
                                    }
                                    intermediateValue491 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits42 + 0u], defaultSampler)), vec2(sumValue445, sumValue446), -0.25).w;
                                }
                                uint comparisonValue107;
                                if (scalarValue72 == 2u)
                                {
                                    comparisonValue107 = 0u;
                                }
                                else
                                {
                                    comparisonValue107 = uint(intermediateValue491 <= (((objectInstances.packedValues[productValue511] & 4352us) != 0us) ? 0.5 : 0.0));
                                }
                                if (comparisonValue107 == 0u)
                                {
                                    rayQueryConfirmIntersectionEXT(intermediateValue256);
                                }
                            }
                            intermediateValue306 = rayQueryProceedEXT(intermediateValue256);
                            if (intermediateValue306)
                            {
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    uint scalarValue74 = rayQueryGetIntersectionTypeEXT(intermediateValue256, bool(1u));
                    float intermediateValue288;
                    if (scalarValue74 == 1u)
                    {
                        float scalarValue75 = rayQueryGetIntersectionTEXT(intermediateValue256, bool(1u));
                        intermediateValue288 = scalarValue75;
                    }
                    else
                    {
                        intermediateValue288 = 10000.0;
                    }
                    float branchMergedValue30;
                    float branchMergedValue82;
                    float branchMergedValue83;
                    if (intermediateValue288 < 10000.0)
                    {
                        precise float productValue538 = intermediateValue288 * ViewCB.packedValues[63u].x;
                        precise float productValue539 = intermediateValue288 * ViewCB.packedValues[63u].y;
                        precise float productValue540 = intermediateValue288 * ViewCB.packedValues[63u].z;
                        precise float productValue541 = productValue538 * (-1.44269502162933349609375);
                        precise float productValue542 = productValue539 * (-1.44269502162933349609375);
                        precise float productValue543 = productValue540 * (-1.44269502162933349609375);
                        precise float productValue544 = ViewCB.packedValues[53u].x * intermediateValue288;
                        precise float sumValue447 = productValue544 + reinterpretedBits28;
                        precise float productValue545 = ViewCB.packedValues[53u].z * intermediateValue288;
                        precise float sumValue448 = productValue545 + reinterpretedBits30;
                        precise float productValue546 = sumValue447 * ViewCB.packedValues[83u].z;
                        precise float sumValue449 = productValue546 + ViewCB.packedValues[84u].x;
                        precise float productValue547 = sumValue448 * ViewCB.packedValues[83u].w;
                        precise float sumValue450 = productValue547 + ViewCB.packedValues[84u].y;
                        vec4 sampledTextureValue17 = textureLod(sampler2D(wibblyTexture, linearWrapSampler), vec2(sumValue449, sumValue450), 0.0);
                        precise float sumValue451 = sampledTextureValue17.x + (-0.5);
                        precise float sumValue452 = sampledTextureValue17.y + (-0.5);
                        precise float productValue548 = sumValue447 * ViewCB.packedValues[82u].z;
                        precise float sumValue453 = productValue548 + ViewCB.packedValues[83u].x;
                        precise float productValue549 = sumValue448 * ViewCB.packedValues[82u].w;
                        precise float sumValue454 = productValue549 + ViewCB.packedValues[83u].y;
                        precise float productValue550 = sumValue451 * 0.4000000059604644775390625;
                        precise float productValue551 = sumValue452 * 0.4000000059604644775390625;
                        precise float sumValue455 = sumValue453 + productValue550;
                        precise float sumValue456 = productValue551 + sumValue454;
                        precise float productValue552 = ViewCB.packedValues[68u].w * 63.0;
                        uint scalarValue76 = uint(int(floor(productValue552)));
                        precise float productValue553 = float(int(scalarValue76 + 1u)) * 0.015625;
                        precise float sumValue457 = (-0.0) - productValue553;
                        float scalarValue77 = fract(abs(productValue553));
                        precise float sumValue458 = (-0.0) - scalarValue77;
                        precise float comparisonValue56 = ((productValue553 >= sumValue457) ? scalarValue77 : sumValue458) * 64.0;
                        vec4 sampledTextureValue18 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue455, sumValue456, float(int(scalarValue76))), 0.0);
                        float scalarValue78 = sampledTextureValue18.x;
                        precise float sampledTextureValue19 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue455, sumValue456, float(int(uint(int(comparisonValue56))))), 0.0).x - scalarValue78;
                        precise float productValue554 = fract(productValue552) * sampledTextureValue19;
                        precise float sumValue459 = scalarValue78 + productValue554;
                        precise float productValue555 = sumValue459 * 7.0;
                        precise float sumValue460 = productValue555 + 0.800000011920928955078125;
                        precise float productValue556 = intermediateValue288 * (-0.100000001490116119384765625);
                        precise float sumValue462 = sumValue460 + (-1.0);
                        precise float exponentialValue4 = exp2(productValue556) * sumValue462;
                        precise float sumValue463 = exponentialValue4 + 1.0;
                        precise float exponentialValue5 = exp2(productValue541) * sumValue463;
                        precise float exponentialValue6 = exp2(productValue542) * sumValue463;
                        precise float exponentialValue7 = exp2(productValue543) * sumValue463;
                        rayQueryInitializeEXT(intermediateValue310, SceneBVH, 512u, 22u, vec3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0, vec3(ViewCB.packedValues[53u].xyz), intermediateValue288);
                        bool conditionValue18 = rayQueryProceedEXT(intermediateValue310);
                        float intermediateValue326;
                        float intermediateValue328;
                        float intermediateValue330;
                        if (conditionValue18)
                        {
                            float intermediateValue327;
                            float intermediateValue329;
                            float intermediateValue331;
                            float scalarValue79 = exponentialValue5;
                            float scalarValue80 = exponentialValue6;
                            float scalarValue81 = exponentialValue7;
                            bool comparisonValue54;
                            for (;;)
                            {
                                uint scalarValue82 = rayQueryGetIntersectionTypeEXT(intermediateValue310, bool(0u));
                                comparisonValue54 = scalarValue82 == 0u;
                                float branchMergedValue1;
                                float branchMergedValue7;
                                float branchMergedValue8;
                                if (comparisonValue54)
                                {
                                    vec2 vectorValue7 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue310, bool(0u));
                                    vec2 vectorValue8 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue310, bool(0u));
                                    float scalarValue83 = rayQueryGetIntersectionTEXT(intermediateValue310, bool(0u));
                                    uint scalarValue84 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue310, bool(0u));
                                    uint scalarValue85 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue310, bool(0u));
                                    uint scalarValue86 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue310, bool(0u));
                                    uint productValue557 = (scalarValue86 * 76u) + 58u;
                                    uint productValue558 = (scalarValue86 * 76u) + 61u;
                                    precise float sumValue464 = 1.0 - vectorValue7.x;
                                    precise float sumValue465 = sumValue464 - vectorValue8.y;
                                    uint bitwiseValue138 = (objectInstances_2.packedValues[(scalarValue86 * 38u) + 25u] >> 2u) + (scalarValue84 >> 1u);
                                    uint productValue559 = uint(objectInstances.packedValues[(scalarValue86 * 76u) + 54u]) + 0u;
                                    bool comparisonValue57 = (scalarValue84 & 1u) == 0u;
                                    uint comparisonValue58 = comparisonValue57 ? faceUvBuffersRW[nonuniformEXT(productValue559)].packedValues[bitwiseValue138].z : faceUvBuffersRW[nonuniformEXT(productValue559)].packedValues[bitwiseValue138].x;
                                    uint comparisonValue59 = comparisonValue57 ? faceUvBuffersRW[nonuniformEXT(productValue559)].packedValues[bitwiseValue138].y : faceUvBuffersRW[nonuniformEXT(productValue559)].packedValues[bitwiseValue138].w;
                                    uint comparisonValue60 = comparisonValue57 ? faceUvBuffersRW[nonuniformEXT(productValue559)].packedValues[bitwiseValue138].x : faceUvBuffersRW[nonuniformEXT(productValue559)].packedValues[bitwiseValue138].z;
                                    bool conditionValue19 = int16_t(objectInstances.packedValues[productValue558]) < int16_t(0us);
                                    float intermediateValue427;
                                    float intermediateValue428;
                                    if (conditionValue19)
                                    {
                                        uint bitwiseValue139 = comparisonValue60 >> 15u;
                                        precise float bitwiseValue140 = float(bitwiseValue139 & 1u) * 2.0;
                                        precise float sumValue466 = bitwiseValue140 + (-1.0);
                                        precise float bitwiseValue141 = float(comparisonValue60 >> 31u) * 2.0;
                                        precise float sumValue467 = bitwiseValue141 + (-1.0);
                                        precise float bitwiseValue142 = float((comparisonValue60 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue143 = float(bitwiseValue139 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue560 = sumValue466 * 3.0517578125e-05;
                                        precise float productValue561 = sumValue467 * 3.0517578125e-05;
                                        precise float sumValue468 = bitwiseValue142 + productValue560;
                                        precise float sumValue469 = bitwiseValue143 + productValue561;
                                        intermediateValue427 = sumValue468;
                                        intermediateValue428 = sumValue469;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue144 = float(comparisonValue60 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue145 = float(comparisonValue60 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue562 = bitwiseValue144 * 16384.0;
                                        precise float sumValue470 = productValue562 + 0.5;
                                        precise float productValue563 = bitwiseValue145 * 16384.0;
                                        precise float sumValue471 = productValue563 + 0.5;
                                        precise float productValue564 = floor(sumValue470) * 6.103515625e-05;
                                        precise float productValue565 = floor(sumValue471) * 6.103515625e-05;
                                        intermediateValue427 = productValue564;
                                        intermediateValue428 = productValue565;
                                    }
                                    precise float productValue566 = sumValue465 * intermediateValue427;
                                    precise float productValue567 = sumValue465 * intermediateValue428;
                                    precise float sumValue472 = productValue566 + 0.0;
                                    precise float sumValue473 = productValue567 + 0.0;
                                    float intermediateValue492;
                                    float intermediateValue493;
                                    if (conditionValue19)
                                    {
                                        uint bitwiseValue146 = comparisonValue59 >> 15u;
                                        precise float bitwiseValue147 = float(bitwiseValue146 & 1u) * 2.0;
                                        precise float sumValue474 = bitwiseValue147 + (-1.0);
                                        precise float bitwiseValue148 = float(comparisonValue59 >> 31u) * 2.0;
                                        precise float sumValue475 = bitwiseValue148 + (-1.0);
                                        precise float bitwiseValue149 = float((comparisonValue59 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue150 = float(bitwiseValue146 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue568 = sumValue474 * 3.0517578125e-05;
                                        precise float productValue569 = sumValue475 * 3.0517578125e-05;
                                        precise float sumValue476 = bitwiseValue149 + productValue568;
                                        precise float sumValue477 = bitwiseValue150 + productValue569;
                                        intermediateValue492 = sumValue476;
                                        intermediateValue493 = sumValue477;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue151 = float(comparisonValue59 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue152 = float(comparisonValue59 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue570 = bitwiseValue151 * 16384.0;
                                        precise float sumValue478 = productValue570 + 0.5;
                                        precise float productValue571 = bitwiseValue152 * 16384.0;
                                        precise float sumValue479 = productValue571 + 0.5;
                                        precise float productValue572 = floor(sumValue478) * 6.103515625e-05;
                                        precise float productValue573 = floor(sumValue479) * 6.103515625e-05;
                                        intermediateValue492 = productValue572;
                                        intermediateValue493 = productValue573;
                                    }
                                    precise float productValue574 = vectorValue7.x * intermediateValue492;
                                    precise float productValue575 = vectorValue7.x * intermediateValue493;
                                    precise float sumValue480 = sumValue472 + productValue574;
                                    precise float sumValue481 = sumValue473 + productValue575;
                                    float intermediateValue544;
                                    float intermediateValue545;
                                    if (conditionValue19)
                                    {
                                        uint bitwiseValue153 = comparisonValue58 >> 15u;
                                        precise float bitwiseValue154 = float(bitwiseValue153 & 1u) * 2.0;
                                        precise float sumValue482 = bitwiseValue154 + (-1.0);
                                        precise float bitwiseValue155 = float(comparisonValue58 >> 31u) * 2.0;
                                        precise float sumValue483 = bitwiseValue155 + (-1.0);
                                        precise float bitwiseValue156 = float((comparisonValue58 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue157 = float(bitwiseValue153 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue576 = sumValue482 * 3.0517578125e-05;
                                        precise float productValue577 = sumValue483 * 3.0517578125e-05;
                                        precise float sumValue484 = bitwiseValue156 + productValue576;
                                        precise float sumValue485 = bitwiseValue157 + productValue577;
                                        intermediateValue544 = sumValue484;
                                        intermediateValue545 = sumValue485;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue158 = float(comparisonValue58 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue159 = float(comparisonValue58 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue578 = bitwiseValue158 * 16384.0;
                                        precise float sumValue486 = productValue578 + 0.5;
                                        precise float productValue579 = bitwiseValue159 * 16384.0;
                                        precise float sumValue487 = productValue579 + 0.5;
                                        precise float productValue580 = floor(sumValue486) * 6.103515625e-05;
                                        precise float productValue581 = floor(sumValue487) * 6.103515625e-05;
                                        intermediateValue544 = productValue580;
                                        intermediateValue545 = productValue581;
                                    }
                                    precise float productValue582 = vectorValue8.y * intermediateValue544;
                                    precise float productValue583 = vectorValue8.y * intermediateValue545;
                                    precise float sumValue488 = sumValue480 + productValue582;
                                    precise float sumValue489 = sumValue481 + productValue583;
                                    precise float productValue584 = scalarValue83 * 0.083333335816860198974609375;
                                    precise float sumValue490 = productValue584 + (-0.25);
                                    float intermediateValue564;
                                    float intermediateValue565;
                                    float intermediateValue566;
                                    float intermediateValue567;
                                    if (objectInstances.packedValues[productValue557] == 65535us)
                                    {
                                        intermediateValue564 = 1.0;
                                        intermediateValue565 = 1.0;
                                        intermediateValue566 = 1.0;
                                        intermediateValue567 = 1.0;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits45;
                                        if (objectInstances.packedValues[productValue557] > 4095us)
                                        {
                                            reinterpretedBits45 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits45 = uint(objectInstances.packedValues[productValue557]);
                                        }
                                        vec4 sampledTextureValue20 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits45 + 0u], defaultSampler)), vec2(sumValue488, sumValue489), spvNMin(sumValue490, 2.0));
                                        intermediateValue564 = sampledTextureValue20.x;
                                        intermediateValue565 = sampledTextureValue20.y;
                                        intermediateValue566 = sampledTextureValue20.z;
                                        intermediateValue567 = sampledTextureValue20.w;
                                    }
                                    float intermediateValue594;
                                    float intermediateValue595;
                                    float intermediateValue596;
                                    if (scalarValue85 == 2u)
                                    {
                                        float branchMergedValue44;
                                        float branchMergedValue140;
                                        float branchMergedValue141;
                                        if ((objectInstances.packedValues[productValue558] & 128us) == 0us)
                                        {
                                            float intermediateValue621;
                                            if ((objectInstances.packedValues[productValue558] & 2048us) == 0us)
                                            {
                                                intermediateValue621 = intermediateValue567;
                                            }
                                            else
                                            {
                                                precise float productValue585 = intermediateValue567 * 2.0;
                                                precise float sumValue491 = productValue585 + (-1.0);
                                                intermediateValue621 = spvNClamp(sumValue491, 0.0, 1.0);
                                            }
                                            precise float sumValue492 = 0.0 - intermediateValue564;
                                            precise float sumValue493 = 0.0 - intermediateValue565;
                                            precise float sumValue494 = 0.0 - intermediateValue566;
                                            precise float productValue586 = sumValue492 * intermediateValue621;
                                            precise float productValue587 = sumValue493 * intermediateValue621;
                                            precise float productValue588 = sumValue494 * intermediateValue621;
                                            precise float sumValue495 = intermediateValue564 + productValue586;
                                            precise float sumValue496 = intermediateValue565 + productValue587;
                                            precise float sumValue497 = intermediateValue566 + productValue588;
                                            branchMergedValue44 = sumValue496;
                                            branchMergedValue140 = sumValue495;
                                            branchMergedValue141 = sumValue497;
                                        }
                                        else
                                        {
                                            branchMergedValue44 = 0.33399999141693115234375;
                                            branchMergedValue140 = 0.33399999141693115234375;
                                            branchMergedValue141 = 0.33399999141693115234375;
                                        }
                                        intermediateValue594 = branchMergedValue140;
                                        intermediateValue595 = branchMergedValue44;
                                        intermediateValue596 = branchMergedValue141;
                                    }
                                    else
                                    {
                                        precise float sumValue498 = 1.0 - intermediateValue567;
                                        intermediateValue594 = sumValue498;
                                        intermediateValue595 = sumValue498;
                                        intermediateValue596 = sumValue498;
                                    }
                                    precise float productValue589 = scalarValue79 * intermediateValue594;
                                    precise float productValue590 = scalarValue80 * intermediateValue595;
                                    precise float productValue591 = scalarValue81 * intermediateValue596;
                                    float intermediateValue369;
                                    float intermediateValue370;
                                    float intermediateValue371;
                                    bool intermediateValue622;
                                    if (!(dot(vec3(productValue589, productValue590, productValue591), vec3(1.0)) <= 0.00999999977648258209228515625))
                                    {
                                        intermediateValue622 = false;
                                        intermediateValue369 = productValue589;
                                        intermediateValue370 = productValue590;
                                        intermediateValue371 = productValue591;
                                    }
                                    else
                                    {
                                        intermediateValue622 = true;
                                        intermediateValue369 = 0.0;
                                        intermediateValue370 = 0.0;
                                        intermediateValue371 = 0.0;
                                    }
                                    float branchMergedValue162;
                                    float branchMergedValue166;
                                    float branchMergedValue167;
                                    if (intermediateValue622)
                                    {
                                        rayQueryConfirmIntersectionEXT(intermediateValue310);
                                        branchMergedValue162 = intermediateValue370;
                                        branchMergedValue166 = intermediateValue371;
                                        branchMergedValue167 = intermediateValue369;
                                    }
                                    else
                                    {
                                        branchMergedValue162 = intermediateValue370;
                                        branchMergedValue166 = intermediateValue371;
                                        branchMergedValue167 = intermediateValue369;
                                    }
                                    branchMergedValue1 = branchMergedValue162;
                                    branchMergedValue7 = branchMergedValue166;
                                    branchMergedValue8 = branchMergedValue167;
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue80;
                                    branchMergedValue7 = scalarValue81;
                                    branchMergedValue8 = scalarValue79;
                                }
                                intermediateValue329 = branchMergedValue1;
                                intermediateValue331 = branchMergedValue7;
                                intermediateValue327 = branchMergedValue8;
                                bool conditionValue20 = rayQueryProceedEXT(intermediateValue310);
                                if (conditionValue20)
                                {
                                    scalarValue79 = intermediateValue327;
                                    scalarValue80 = intermediateValue329;
                                    scalarValue81 = intermediateValue331;
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
                            intermediateValue326 = exponentialValue5;
                            intermediateValue328 = exponentialValue6;
                            intermediateValue330 = exponentialValue7;
                        }
                        uint scalarValue87 = rayQueryGetIntersectionTypeEXT(intermediateValue310, bool(1u));
                        bool comparisonValue61 = scalarValue87 == 1u;
                        float comparisonValue62 = comparisonValue61 ? 0.0 : intermediateValue326;
                        float comparisonValue63 = comparisonValue61 ? 0.0 : intermediateValue328;
                        float comparisonValue64 = comparisonValue61 ? 0.0 : intermediateValue330;
                        float branchMergedValue181;
                        float branchMergedValue199;
                        float branchMergedValue200;
                        if (dot(vec3(comparisonValue62, comparisonValue63, comparisonValue64), vec3(1.0)) > 0.00999999977648258209228515625)
                        {
                            rayQueryInitializeEXT(intermediateValue347, SceneBVH, 512u, 22u, vec3(sumValue447, fma(ViewCB.packedValues[53u].y, intermediateValue288, reinterpretedBits29), sumValue448), 0.0, vec3(productValue507, productValue508, productValue509), 10000.0);
                            bool conditionValue21 = rayQueryProceedEXT(intermediateValue347);
                            float intermediateValue373;
                            float intermediateValue375;
                            float intermediateValue377;
                            if (conditionValue21)
                            {
                                float intermediateValue374;
                                float intermediateValue376;
                                float intermediateValue378;
                                float scalarValue88 = comparisonValue62;
                                float scalarValue89 = comparisonValue63;
                                float scalarValue90 = comparisonValue64;
                                bool comparisonValue76;
                                for (;;)
                                {
                                    uint scalarValue91 = rayQueryGetIntersectionTypeEXT(intermediateValue347, bool(0u));
                                    comparisonValue76 = scalarValue91 == 0u;
                                    float branchMergedValue4;
                                    float branchMergedValue16;
                                    float branchMergedValue17;
                                    if (comparisonValue76)
                                    {
                                        vec2 vectorValue9 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue347, bool(0u));
                                        vec2 vectorValue10 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue347, bool(0u));
                                        float scalarValue92 = rayQueryGetIntersectionTEXT(intermediateValue347, bool(0u));
                                        uint scalarValue93 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue347, bool(0u));
                                        uint scalarValue94 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue347, bool(0u));
                                        uint scalarValue95 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue347, bool(0u));
                                        uint productValue592 = (scalarValue95 * 76u) + 58u;
                                        uint productValue594 = (scalarValue95 * 76u) + 61u;
                                        precise float sumValue499 = 1.0 - vectorValue9.x;
                                        precise float sumValue500 = sumValue499 - vectorValue10.y;
                                        uint bitwiseValue160 = (objectInstances_2.packedValues[(scalarValue95 * 38u) + 25u] >> 2u) + (scalarValue93 >> 1u);
                                        uint productValue595 = uint(objectInstances.packedValues[(scalarValue95 * 76u) + 54u]) + 0u;
                                        bool comparisonValue65 = (scalarValue93 & 1u) == 0u;
                                        uint comparisonValue66 = comparisonValue65 ? faceUvBuffersRW[nonuniformEXT(productValue595)].packedValues[bitwiseValue160].z : faceUvBuffersRW[nonuniformEXT(productValue595)].packedValues[bitwiseValue160].x;
                                        uint comparisonValue67 = comparisonValue65 ? faceUvBuffersRW[nonuniformEXT(productValue595)].packedValues[bitwiseValue160].y : faceUvBuffersRW[nonuniformEXT(productValue595)].packedValues[bitwiseValue160].w;
                                        uint comparisonValue68 = comparisonValue65 ? faceUvBuffersRW[nonuniformEXT(productValue595)].packedValues[bitwiseValue160].x : faceUvBuffersRW[nonuniformEXT(productValue595)].packedValues[bitwiseValue160].z;
                                        bool conditionValue22 = int16_t(objectInstances.packedValues[productValue594]) < int16_t(0us);
                                        float intermediateValue494;
                                        float intermediateValue495;
                                        if (conditionValue22)
                                        {
                                            uint bitwiseValue161 = comparisonValue68 >> 15u;
                                            precise float bitwiseValue162 = float(bitwiseValue161 & 1u) * 2.0;
                                            precise float sumValue501 = bitwiseValue162 + (-1.0);
                                            precise float bitwiseValue163 = float(comparisonValue68 >> 31u) * 2.0;
                                            precise float sumValue502 = bitwiseValue163 + (-1.0);
                                            precise float bitwiseValue164 = float((comparisonValue68 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue165 = float(bitwiseValue161 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue596 = sumValue501 * 3.0517578125e-05;
                                            precise float productValue597 = sumValue502 * 3.0517578125e-05;
                                            precise float sumValue503 = bitwiseValue164 + productValue596;
                                            precise float sumValue504 = bitwiseValue165 + productValue597;
                                            intermediateValue494 = sumValue503;
                                            intermediateValue495 = sumValue504;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue166 = float(comparisonValue68 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue168 = float(comparisonValue68 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue598 = bitwiseValue166 * 16384.0;
                                            precise float sumValue505 = productValue598 + 0.5;
                                            precise float productValue599 = bitwiseValue168 * 16384.0;
                                            precise float sumValue506 = productValue599 + 0.5;
                                            precise float productValue600 = floor(sumValue505) * 6.103515625e-05;
                                            precise float productValue601 = floor(sumValue506) * 6.103515625e-05;
                                            intermediateValue494 = productValue600;
                                            intermediateValue495 = productValue601;
                                        }
                                        precise float productValue602 = sumValue500 * intermediateValue494;
                                        precise float productValue603 = sumValue500 * intermediateValue495;
                                        precise float sumValue507 = productValue602 + 0.0;
                                        precise float sumValue508 = productValue603 + 0.0;
                                        float intermediateValue546;
                                        float intermediateValue547;
                                        if (conditionValue22)
                                        {
                                            uint bitwiseValue169 = comparisonValue67 >> 15u;
                                            precise float bitwiseValue170 = float(bitwiseValue169 & 1u) * 2.0;
                                            precise float sumValue509 = bitwiseValue170 + (-1.0);
                                            precise float bitwiseValue171 = float(comparisonValue67 >> 31u) * 2.0;
                                            precise float sumValue510 = bitwiseValue171 + (-1.0);
                                            precise float bitwiseValue172 = float((comparisonValue67 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue173 = float(bitwiseValue169 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue604 = sumValue509 * 3.0517578125e-05;
                                            precise float productValue605 = sumValue510 * 3.0517578125e-05;
                                            precise float sumValue511 = bitwiseValue172 + productValue604;
                                            precise float sumValue512 = bitwiseValue173 + productValue605;
                                            intermediateValue546 = sumValue511;
                                            intermediateValue547 = sumValue512;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue174 = float(comparisonValue67 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue175 = float(comparisonValue67 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue606 = bitwiseValue174 * 16384.0;
                                            precise float sumValue513 = productValue606 + 0.5;
                                            precise float productValue607 = bitwiseValue175 * 16384.0;
                                            precise float sumValue514 = productValue607 + 0.5;
                                            precise float productValue608 = floor(sumValue513) * 6.103515625e-05;
                                            precise float productValue609 = floor(sumValue514) * 6.103515625e-05;
                                            intermediateValue546 = productValue608;
                                            intermediateValue547 = productValue609;
                                        }
                                        precise float productValue610 = vectorValue9.x * intermediateValue546;
                                        precise float productValue611 = vectorValue9.x * intermediateValue547;
                                        precise float sumValue515 = sumValue507 + productValue610;
                                        precise float sumValue516 = sumValue508 + productValue611;
                                        float intermediateValue586;
                                        float intermediateValue587;
                                        if (conditionValue22)
                                        {
                                            uint bitwiseValue176 = comparisonValue66 >> 15u;
                                            precise float bitwiseValue177 = float(bitwiseValue176 & 1u) * 2.0;
                                            precise float sumValue517 = bitwiseValue177 + (-1.0);
                                            precise float bitwiseValue178 = float(comparisonValue66 >> 31u) * 2.0;
                                            precise float sumValue518 = bitwiseValue178 + (-1.0);
                                            precise float bitwiseValue179 = float((comparisonValue66 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue180 = float(bitwiseValue176 & 65534u) * 1.525902189314365386962890625e-05;
                                            precise float productValue612 = sumValue517 * 3.0517578125e-05;
                                            precise float productValue613 = sumValue518 * 3.0517578125e-05;
                                            precise float sumValue519 = bitwiseValue179 + productValue612;
                                            precise float sumValue520 = bitwiseValue180 + productValue613;
                                            intermediateValue586 = sumValue519;
                                            intermediateValue587 = sumValue520;
                                        }
                                        else
                                        {
                                            precise float bitwiseValue181 = float(comparisonValue66 & 65535u) * 1.525902189314365386962890625e-05;
                                            precise float bitwiseValue182 = float(comparisonValue66 >> 16u) * 1.525902189314365386962890625e-05;
                                            precise float productValue614 = bitwiseValue181 * 16384.0;
                                            precise float sumValue521 = productValue614 + 0.5;
                                            precise float productValue615 = bitwiseValue182 * 16384.0;
                                            precise float sumValue522 = productValue615 + 0.5;
                                            precise float productValue616 = floor(sumValue521) * 6.103515625e-05;
                                            precise float productValue617 = floor(sumValue522) * 6.103515625e-05;
                                            intermediateValue586 = productValue616;
                                            intermediateValue587 = productValue617;
                                        }
                                        precise float productValue618 = vectorValue10.y * intermediateValue586;
                                        precise float productValue619 = vectorValue10.y * intermediateValue587;
                                        precise float sumValue523 = sumValue515 + productValue618;
                                        precise float sumValue524 = sumValue516 + productValue619;
                                        precise float productValue620 = scalarValue92 * 0.083333335816860198974609375;
                                        precise float sumValue525 = productValue620 + (-0.25);
                                        float intermediateValue597;
                                        float intermediateValue598;
                                        float intermediateValue599;
                                        float intermediateValue600;
                                        if (objectInstances.packedValues[productValue592] == 65535us)
                                        {
                                            intermediateValue597 = 1.0;
                                            intermediateValue598 = 1.0;
                                            intermediateValue599 = 1.0;
                                            intermediateValue600 = 1.0;
                                        }
                                        else
                                        {
                                            uint reinterpretedBits47;
                                            if (objectInstances.packedValues[productValue592] > 4095us)
                                            {
                                                reinterpretedBits47 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                            }
                                            else
                                            {
                                                reinterpretedBits47 = uint(objectInstances.packedValues[productValue592]);
                                            }
                                            vec4 sampledTextureValue21 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits47 + 0u], defaultSampler)), vec2(sumValue523, sumValue524), spvNMin(sumValue525, 2.0));
                                            intermediateValue597 = sampledTextureValue21.x;
                                            intermediateValue598 = sampledTextureValue21.y;
                                            intermediateValue599 = sampledTextureValue21.z;
                                            intermediateValue600 = sampledTextureValue21.w;
                                        }
                                        float intermediateValue628;
                                        float intermediateValue629;
                                        float intermediateValue630;
                                        if (scalarValue94 == 2u)
                                        {
                                            float branchMergedValue46;
                                            float branchMergedValue144;
                                            float branchMergedValue145;
                                            if ((objectInstances.packedValues[productValue594] & 128us) == 0us)
                                            {
                                                float intermediateValue638;
                                                if ((objectInstances.packedValues[productValue594] & 2048us) == 0us)
                                                {
                                                    intermediateValue638 = intermediateValue600;
                                                }
                                                else
                                                {
                                                    precise float productValue621 = intermediateValue600 * 2.0;
                                                    precise float sumValue526 = productValue621 + (-1.0);
                                                    intermediateValue638 = spvNClamp(sumValue526, 0.0, 1.0);
                                                }
                                                precise float sumValue527 = 0.0 - intermediateValue597;
                                                precise float sumValue528 = 0.0 - intermediateValue598;
                                                precise float sumValue529 = 0.0 - intermediateValue599;
                                                precise float productValue622 = sumValue527 * intermediateValue638;
                                                precise float productValue623 = sumValue528 * intermediateValue638;
                                                precise float productValue624 = sumValue529 * intermediateValue638;
                                                precise float sumValue530 = intermediateValue597 + productValue622;
                                                precise float sumValue531 = intermediateValue598 + productValue623;
                                                precise float sumValue532 = intermediateValue599 + productValue624;
                                                branchMergedValue46 = sumValue532;
                                                branchMergedValue144 = sumValue531;
                                                branchMergedValue145 = sumValue530;
                                            }
                                            else
                                            {
                                                branchMergedValue46 = 0.33399999141693115234375;
                                                branchMergedValue144 = 0.33399999141693115234375;
                                                branchMergedValue145 = 0.33399999141693115234375;
                                            }
                                            intermediateValue628 = branchMergedValue145;
                                            intermediateValue629 = branchMergedValue144;
                                            intermediateValue630 = branchMergedValue46;
                                        }
                                        else
                                        {
                                            precise float sumValue533 = 1.0 - intermediateValue600;
                                            intermediateValue628 = sumValue533;
                                            intermediateValue629 = sumValue533;
                                            intermediateValue630 = sumValue533;
                                        }
                                        precise float productValue625 = scalarValue88 * intermediateValue628;
                                        precise float productValue626 = scalarValue89 * intermediateValue629;
                                        precise float productValue627 = scalarValue90 * intermediateValue630;
                                        float intermediateValue436;
                                        float intermediateValue437;
                                        float intermediateValue438;
                                        bool intermediateValue639;
                                        if (!(dot(vec3(productValue625, productValue626, productValue627), vec3(1.0)) <= 0.00999999977648258209228515625))
                                        {
                                            intermediateValue639 = false;
                                            intermediateValue436 = productValue625;
                                            intermediateValue437 = productValue626;
                                            intermediateValue438 = productValue627;
                                        }
                                        else
                                        {
                                            intermediateValue639 = true;
                                            intermediateValue436 = 0.0;
                                            intermediateValue437 = 0.0;
                                            intermediateValue438 = 0.0;
                                        }
                                        float branchMergedValue164;
                                        float branchMergedValue170;
                                        float branchMergedValue171;
                                        if (intermediateValue639)
                                        {
                                            rayQueryConfirmIntersectionEXT(intermediateValue347);
                                            branchMergedValue164 = intermediateValue438;
                                            branchMergedValue170 = intermediateValue437;
                                            branchMergedValue171 = intermediateValue436;
                                        }
                                        else
                                        {
                                            branchMergedValue164 = intermediateValue438;
                                            branchMergedValue170 = intermediateValue437;
                                            branchMergedValue171 = intermediateValue436;
                                        }
                                        branchMergedValue4 = branchMergedValue164;
                                        branchMergedValue16 = branchMergedValue170;
                                        branchMergedValue17 = branchMergedValue171;
                                    }
                                    else
                                    {
                                        branchMergedValue4 = scalarValue90;
                                        branchMergedValue16 = scalarValue89;
                                        branchMergedValue17 = scalarValue88;
                                    }
                                    intermediateValue378 = branchMergedValue4;
                                    intermediateValue376 = branchMergedValue16;
                                    intermediateValue374 = branchMergedValue17;
                                    bool conditionValue23 = rayQueryProceedEXT(intermediateValue347);
                                    if (conditionValue23)
                                    {
                                        scalarValue88 = intermediateValue374;
                                        scalarValue89 = intermediateValue376;
                                        scalarValue90 = intermediateValue378;
                                        continue;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                                intermediateValue373 = intermediateValue374;
                                intermediateValue375 = intermediateValue376;
                                intermediateValue377 = intermediateValue378;
                            }
                            else
                            {
                                intermediateValue373 = comparisonValue62;
                                intermediateValue375 = comparisonValue63;
                                intermediateValue377 = comparisonValue64;
                            }
                            uint scalarValue96 = rayQueryGetIntersectionTypeEXT(intermediateValue347, bool(1u));
                            bool comparisonValue69 = scalarValue96 == 1u;
                            branchMergedValue181 = comparisonValue69 ? 0.0 : intermediateValue375;
                            branchMergedValue199 = comparisonValue69 ? 0.0 : intermediateValue373;
                            branchMergedValue200 = comparisonValue69 ? 0.0 : intermediateValue377;
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
                        rayQueryInitializeEXT(intermediateValue312, SceneBVH, 512u, 22u, vec3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0, vec3(productValue507, productValue508, productValue509), 10000.0);
                        bool conditionValue24 = rayQueryProceedEXT(intermediateValue312);
                        float intermediateValue333;
                        float intermediateValue335;
                        float intermediateValue337;
                        if (conditionValue24)
                        {
                            float intermediateValue334;
                            float intermediateValue336;
                            float intermediateValue338;
                            float scalarValue97 = 1.0;
                            float scalarValue98 = 1.0;
                            float scalarValue99 = 1.0;
                            bool comparisonValue55;
                            for (;;)
                            {
                                uint scalarValue100 = rayQueryGetIntersectionTypeEXT(intermediateValue312, bool(0u));
                                comparisonValue55 = scalarValue100 == 0u;
                                float branchMergedValue2;
                                float branchMergedValue9;
                                float branchMergedValue10;
                                if (comparisonValue55)
                                {
                                    vec2 vectorValue11 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue312, bool(0u));
                                    vec2 vectorValue12 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue312, bool(0u));
                                    float scalarValue101 = rayQueryGetIntersectionTEXT(intermediateValue312, bool(0u));
                                    uint scalarValue102 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue312, bool(0u));
                                    uint scalarValue103 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue312, bool(0u));
                                    uint scalarValue104 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue312, bool(0u));
                                    uint productValue628 = (scalarValue104 * 76u) + 58u;
                                    uint productValue629 = (scalarValue104 * 76u) + 61u;
                                    precise float sumValue534 = 1.0 - vectorValue11.x;
                                    precise float sumValue535 = sumValue534 - vectorValue12.y;
                                    uint bitwiseValue183 = (objectInstances_2.packedValues[(scalarValue104 * 38u) + 25u] >> 2u) + (scalarValue102 >> 1u);
                                    uint productValue630 = uint(objectInstances.packedValues[(scalarValue104 * 76u) + 54u]) + 0u;
                                    bool comparisonValue70 = (scalarValue102 & 1u) == 0u;
                                    uint comparisonValue71 = comparisonValue70 ? faceUvBuffersRW[nonuniformEXT(productValue630)].packedValues[bitwiseValue183].z : faceUvBuffersRW[nonuniformEXT(productValue630)].packedValues[bitwiseValue183].x;
                                    uint comparisonValue72 = comparisonValue70 ? faceUvBuffersRW[nonuniformEXT(productValue630)].packedValues[bitwiseValue183].y : faceUvBuffersRW[nonuniformEXT(productValue630)].packedValues[bitwiseValue183].w;
                                    uint comparisonValue73 = comparisonValue70 ? faceUvBuffersRW[nonuniformEXT(productValue630)].packedValues[bitwiseValue183].x : faceUvBuffersRW[nonuniformEXT(productValue630)].packedValues[bitwiseValue183].z;
                                    bool conditionValue25 = int16_t(objectInstances.packedValues[productValue629]) < int16_t(0us);
                                    float intermediateValue440;
                                    float intermediateValue441;
                                    if (conditionValue25)
                                    {
                                        uint bitwiseValue184 = comparisonValue73 >> 15u;
                                        precise float bitwiseValue185 = float(bitwiseValue184 & 1u) * 2.0;
                                        precise float sumValue536 = bitwiseValue185 + (-1.0);
                                        precise float bitwiseValue186 = float(comparisonValue73 >> 31u) * 2.0;
                                        precise float sumValue537 = bitwiseValue186 + (-1.0);
                                        precise float bitwiseValue187 = float((comparisonValue73 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue188 = float(bitwiseValue184 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue631 = sumValue536 * 3.0517578125e-05;
                                        precise float productValue632 = sumValue537 * 3.0517578125e-05;
                                        precise float sumValue538 = bitwiseValue187 + productValue631;
                                        precise float sumValue539 = bitwiseValue188 + productValue632;
                                        intermediateValue440 = sumValue538;
                                        intermediateValue441 = sumValue539;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue189 = float(comparisonValue73 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue190 = float(comparisonValue73 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue633 = bitwiseValue189 * 16384.0;
                                        precise float sumValue540 = productValue633 + 0.5;
                                        precise float productValue634 = bitwiseValue190 * 16384.0;
                                        precise float sumValue541 = productValue634 + 0.5;
                                        precise float productValue635 = floor(sumValue540) * 6.103515625e-05;
                                        precise float productValue636 = floor(sumValue541) * 6.103515625e-05;
                                        intermediateValue440 = productValue635;
                                        intermediateValue441 = productValue636;
                                    }
                                    precise float productValue637 = sumValue535 * intermediateValue440;
                                    precise float productValue638 = sumValue535 * intermediateValue441;
                                    precise float sumValue542 = productValue637 + 0.0;
                                    precise float sumValue543 = productValue638 + 0.0;
                                    float intermediateValue496;
                                    float intermediateValue497;
                                    if (conditionValue25)
                                    {
                                        uint bitwiseValue191 = comparisonValue72 >> 15u;
                                        precise float bitwiseValue192 = float(bitwiseValue191 & 1u) * 2.0;
                                        precise float sumValue544 = bitwiseValue192 + (-1.0);
                                        precise float bitwiseValue193 = float(comparisonValue72 >> 31u) * 2.0;
                                        precise float sumValue545 = bitwiseValue193 + (-1.0);
                                        precise float bitwiseValue194 = float((comparisonValue72 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue195 = float(bitwiseValue191 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue639 = sumValue544 * 3.0517578125e-05;
                                        precise float productValue640 = sumValue545 * 3.0517578125e-05;
                                        precise float sumValue546 = bitwiseValue194 + productValue639;
                                        precise float sumValue547 = bitwiseValue195 + productValue640;
                                        intermediateValue496 = sumValue546;
                                        intermediateValue497 = sumValue547;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue196 = float(comparisonValue72 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue197 = float(comparisonValue72 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue641 = bitwiseValue196 * 16384.0;
                                        precise float sumValue548 = productValue641 + 0.5;
                                        precise float productValue642 = bitwiseValue197 * 16384.0;
                                        precise float sumValue549 = productValue642 + 0.5;
                                        precise float productValue643 = floor(sumValue548) * 6.103515625e-05;
                                        precise float productValue644 = floor(sumValue549) * 6.103515625e-05;
                                        intermediateValue496 = productValue643;
                                        intermediateValue497 = productValue644;
                                    }
                                    precise float productValue645 = vectorValue11.x * intermediateValue496;
                                    precise float productValue646 = vectorValue11.x * intermediateValue497;
                                    precise float sumValue550 = sumValue542 + productValue645;
                                    precise float sumValue551 = sumValue543 + productValue646;
                                    float intermediateValue548;
                                    float intermediateValue549;
                                    if (conditionValue25)
                                    {
                                        uint bitwiseValue199 = comparisonValue71 >> 15u;
                                        precise float bitwiseValue200 = float(bitwiseValue199 & 1u) * 2.0;
                                        precise float sumValue552 = bitwiseValue200 + (-1.0);
                                        precise float bitwiseValue201 = float(comparisonValue71 >> 31u) * 2.0;
                                        precise float sumValue553 = bitwiseValue201 + (-1.0);
                                        precise float bitwiseValue202 = float((comparisonValue71 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue203 = float(bitwiseValue199 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue647 = sumValue552 * 3.0517578125e-05;
                                        precise float productValue648 = sumValue553 * 3.0517578125e-05;
                                        precise float sumValue554 = bitwiseValue202 + productValue647;
                                        precise float sumValue555 = bitwiseValue203 + productValue648;
                                        intermediateValue548 = sumValue554;
                                        intermediateValue549 = sumValue555;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue204 = float(comparisonValue71 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue205 = float(comparisonValue71 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue649 = bitwiseValue204 * 16384.0;
                                        precise float sumValue556 = productValue649 + 0.5;
                                        precise float productValue650 = bitwiseValue205 * 16384.0;
                                        precise float sumValue557 = productValue650 + 0.5;
                                        precise float productValue651 = floor(sumValue556) * 6.103515625e-05;
                                        precise float productValue652 = floor(sumValue557) * 6.103515625e-05;
                                        intermediateValue548 = productValue651;
                                        intermediateValue549 = productValue652;
                                    }
                                    precise float productValue653 = vectorValue12.y * intermediateValue548;
                                    precise float productValue654 = vectorValue12.y * intermediateValue549;
                                    precise float sumValue558 = sumValue550 + productValue653;
                                    precise float sumValue559 = sumValue551 + productValue654;
                                    precise float productValue655 = scalarValue101 * 0.083333335816860198974609375;
                                    precise float sumValue560 = productValue655 + (-0.25);
                                    float intermediateValue568;
                                    float intermediateValue569;
                                    float intermediateValue570;
                                    float intermediateValue571;
                                    if (objectInstances.packedValues[productValue628] == 65535us)
                                    {
                                        intermediateValue568 = 1.0;
                                        intermediateValue569 = 1.0;
                                        intermediateValue570 = 1.0;
                                        intermediateValue571 = 1.0;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits46;
                                        if (objectInstances.packedValues[productValue628] > 4095us)
                                        {
                                            reinterpretedBits46 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits46 = uint(objectInstances.packedValues[productValue628]);
                                        }
                                        vec4 sampledTextureValue22 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits46 + 0u], defaultSampler)), vec2(sumValue558, sumValue559), spvNMin(sumValue560, 2.0));
                                        intermediateValue568 = sampledTextureValue22.x;
                                        intermediateValue569 = sampledTextureValue22.y;
                                        intermediateValue570 = sampledTextureValue22.z;
                                        intermediateValue571 = sampledTextureValue22.w;
                                    }
                                    float intermediateValue601;
                                    float intermediateValue602;
                                    float intermediateValue603;
                                    if (scalarValue103 == 2u)
                                    {
                                        float branchMergedValue45;
                                        float branchMergedValue142;
                                        float branchMergedValue143;
                                        if ((objectInstances.packedValues[productValue629] & 128us) == 0us)
                                        {
                                            float intermediateValue623;
                                            if ((objectInstances.packedValues[productValue629] & 2048us) == 0us)
                                            {
                                                intermediateValue623 = intermediateValue571;
                                            }
                                            else
                                            {
                                                precise float productValue656 = intermediateValue571 * 2.0;
                                                precise float sumValue561 = productValue656 + (-1.0);
                                                intermediateValue623 = spvNClamp(sumValue561, 0.0, 1.0);
                                            }
                                            precise float sumValue562 = 0.0 - intermediateValue568;
                                            precise float sumValue563 = 0.0 - intermediateValue569;
                                            precise float sumValue564 = 0.0 - intermediateValue570;
                                            precise float productValue657 = sumValue562 * intermediateValue623;
                                            precise float productValue658 = sumValue563 * intermediateValue623;
                                            precise float productValue659 = sumValue564 * intermediateValue623;
                                            precise float sumValue565 = intermediateValue568 + productValue657;
                                            precise float sumValue566 = intermediateValue569 + productValue658;
                                            precise float sumValue567 = intermediateValue570 + productValue659;
                                            branchMergedValue45 = sumValue567;
                                            branchMergedValue142 = sumValue566;
                                            branchMergedValue143 = sumValue565;
                                        }
                                        else
                                        {
                                            branchMergedValue45 = 0.33399999141693115234375;
                                            branchMergedValue142 = 0.33399999141693115234375;
                                            branchMergedValue143 = 0.33399999141693115234375;
                                        }
                                        intermediateValue601 = branchMergedValue143;
                                        intermediateValue602 = branchMergedValue142;
                                        intermediateValue603 = branchMergedValue45;
                                    }
                                    else
                                    {
                                        precise float sumValue568 = 1.0 - intermediateValue571;
                                        intermediateValue601 = sumValue568;
                                        intermediateValue602 = sumValue568;
                                        intermediateValue603 = sumValue568;
                                    }
                                    precise float productValue660 = scalarValue97 * intermediateValue601;
                                    precise float productValue661 = scalarValue98 * intermediateValue602;
                                    precise float productValue662 = scalarValue99 * intermediateValue603;
                                    float intermediateValue387;
                                    float intermediateValue388;
                                    float intermediateValue389;
                                    bool intermediateValue624;
                                    if (!(dot(vec3(productValue660, productValue661, productValue662), vec3(1.0)) <= 0.00999999977648258209228515625))
                                    {
                                        intermediateValue624 = false;
                                        intermediateValue387 = productValue660;
                                        intermediateValue388 = productValue661;
                                        intermediateValue389 = productValue662;
                                    }
                                    else
                                    {
                                        intermediateValue624 = true;
                                        intermediateValue387 = 0.0;
                                        intermediateValue388 = 0.0;
                                        intermediateValue389 = 0.0;
                                    }
                                    float branchMergedValue163;
                                    float branchMergedValue168;
                                    float branchMergedValue169;
                                    if (intermediateValue624)
                                    {
                                        rayQueryConfirmIntersectionEXT(intermediateValue312);
                                        branchMergedValue163 = intermediateValue388;
                                        branchMergedValue168 = intermediateValue387;
                                        branchMergedValue169 = intermediateValue389;
                                    }
                                    else
                                    {
                                        branchMergedValue163 = intermediateValue388;
                                        branchMergedValue168 = intermediateValue387;
                                        branchMergedValue169 = intermediateValue389;
                                    }
                                    branchMergedValue2 = branchMergedValue163;
                                    branchMergedValue9 = branchMergedValue168;
                                    branchMergedValue10 = branchMergedValue169;
                                }
                                else
                                {
                                    branchMergedValue2 = scalarValue98;
                                    branchMergedValue9 = scalarValue97;
                                    branchMergedValue10 = scalarValue99;
                                }
                                intermediateValue336 = branchMergedValue2;
                                intermediateValue334 = branchMergedValue9;
                                intermediateValue338 = branchMergedValue10;
                                bool conditionValue26 = rayQueryProceedEXT(intermediateValue312);
                                if (conditionValue26)
                                {
                                    scalarValue97 = intermediateValue334;
                                    scalarValue98 = intermediateValue336;
                                    scalarValue99 = intermediateValue338;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            intermediateValue333 = intermediateValue334;
                            intermediateValue335 = intermediateValue336;
                            intermediateValue337 = intermediateValue338;
                        }
                        else
                        {
                            intermediateValue333 = 1.0;
                            intermediateValue335 = 1.0;
                            intermediateValue337 = 1.0;
                        }
                        uint scalarValue105 = rayQueryGetIntersectionTypeEXT(intermediateValue312, bool(1u));
                        bool comparisonValue74 = scalarValue105 == 1u;
                        branchMergedValue30 = comparisonValue74 ? 0.0 : intermediateValue335;
                        branchMergedValue82 = comparisonValue74 ? 0.0 : intermediateValue333;
                        branchMergedValue83 = comparisonValue74 ? 0.0 : intermediateValue337;
                    }
                    intermediateValue253 = branchMergedValue82;
                    intermediateValue254 = branchMergedValue30;
                    intermediateValue255 = branchMergedValue83;
                }
                float intermediateValue265;
                float productValue427;
                float productValue428;
                float productValue429;
                if (dot(vec3(intermediateValue253, intermediateValue254, intermediateValue255), vec3(1.0)) > 0.0)
                {
                    float intermediateValue266;
                    if (floatBitsToUint(ViewCB.packedValues[92u]).x == 0u)
                    {
                        intermediateValue266 = intermediateValue221;
                    }
                    else
                    {
                        float branchMergedValue33;
                        if (intermediateValue108 == 2u)
                        {
                            precise float scalarValue106 = intermediateValue221 * 1.5;
                            precise float productValue663 = spvNClamp(scalarValue106, 0.0, 1.0) * 0.5;
                            precise float sumValue569 = 1.0 - intermediateValue221;
                            precise float productValue664 = sumValue569 * productValue663;
                            precise float sumValue570 = intermediateValue221 + productValue664;
                            branchMergedValue33 = sumValue570;
                        }
                        else
                        {
                            float branchMergedValue183;
                            if (intermediateValue108 == 1u)
                            {
                                branchMergedValue183 = spvNMax(intermediateValue221, 0.25);
                            }
                            else
                            {
                                branchMergedValue183 = intermediateValue221;
                            }
                            branchMergedValue33 = branchMergedValue183;
                        }
                        intermediateValue266 = branchMergedValue33;
                    }
                    float scalarValue107 = spvNMax(intermediateValue266, 0.00999999977648258209228515625);
                    float sumValue571 = ViewCB.packedValues[52u].x - intermediateValue76;
                    float sumValue572 = ViewCB.packedValues[52u].y - intermediateValue78;
                    float sumValue573 = ViewCB.packedValues[52u].z - intermediateValue80;
                    float inverseLengthValue15 = inversesqrt(dot(vec3(sumValue571, sumValue572, sumValue573), vec3(sumValue571, sumValue572, sumValue573)));
                    float productValue665 = inverseLengthValue15 * sumValue571;
                    float productValue666 = inverseLengthValue15 * sumValue572;
                    float productValue667 = inverseLengthValue15 * sumValue573;
                    float dotProductValue14 = spvNClamp(dot(vec3(intermediateValue222, intermediateValue224, intermediateValue226), vec3(ViewCB.packedValues[52u].xyz)), 0.0, 1.0);
                    float dotProductValue15 = spvNClamp(dot(vec3(intermediateValue222, intermediateValue224, intermediateValue226), vec3(sumValue403, sumValue404, sumValue405)), 0.0, 1.0);
                    float dotProductValue16 = spvNClamp(dot(vec3(intermediateValue222, intermediateValue224, intermediateValue226), vec3(productValue665, productValue666, productValue667)), 0.0, 1.0);
                    float dotProductValue17 = spvNClamp(dot(vec3(sumValue403, sumValue404, sumValue405), vec3(productValue665, productValue666, productValue667)), 0.0, 1.0);
                    float productValue668 = scalarValue107 * scalarValue107;
                    float productValue669 = productValue668 * productValue668;
                    float productValue670 = (((dotProductValue16 * productValue669) - dotProductValue16) * dotProductValue16) + 1.0;
                    float productValue671 = productValue668 * 0.5;
                    float sumValue574 = 1.0 - productValue671;
                    float dotProductValue18 = spvNClamp(dot(vec3(intermediateValue228, intermediateValue229, intermediateValue230), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
                    float exponentialValue8 = exp2(log2(spvNClamp(1.0 - dotProductValue17, 0.0, 1.0)) * 5.0);
                    float productValue672 = (exponentialValue8 * (dotProductValue18 - intermediateValue228)) + intermediateValue228;
                    float productValue673 = (exponentialValue8 * (dotProductValue18 - intermediateValue229)) + intermediateValue229;
                    float productValue674 = (exponentialValue8 * (dotProductValue18 - intermediateValue230)) + intermediateValue230;
                    float productValue675 = ((dotProductValue17 * dotProductValue17) * (scalarValue107 * 2.0)) + (-0.5);
                    float quotientValue22 = ((productValue669 / ((productValue670 * productValue670) + 1.0000000133514319600180897396058e-10)) * 0.3183098733425140380859375) * (0.25 / ((((dotProductValue15 * sumValue574) + productValue671) * ((dotProductValue14 * sumValue574) + productValue671)) + 1.0000000133514319600180897396058e-10));
                    float exponentialValue9 = ((intermediateValue219 * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - dotProductValue15, 0.0, 1.0)) * 5.0) * productValue675) + 1.0)) * ((exp2(log2(spvNClamp(1.0 - dotProductValue14, 0.0, 1.0)) * 5.0) * productValue675) + 1.0);
                    intermediateValue265 = intermediateValue266;
                    productValue427 = ((((intermediateValue253 * intermediateValue240) * dotProductValue14) * ViewCB.packedValues[50u].x) * ((((1.0 - productValue672) * intermediateValue231) * exponentialValue9) + (productValue672 * quotientValue22))) + productValue478;
                    productValue428 = ((((intermediateValue254 * intermediateValue241) * dotProductValue14) * ViewCB.packedValues[50u].y) * ((((1.0 - productValue673) * intermediateValue232) * exponentialValue9) + (productValue673 * quotientValue22))) + productValue479;
                    productValue429 = ((((intermediateValue255 * intermediateValue242) * dotProductValue14) * ViewCB.packedValues[50u].z) * ((((1.0 - productValue674) * intermediateValue233) * exponentialValue9) + (productValue674 * quotientValue22))) + productValue480;
                }
                else
                {
                    intermediateValue265 = intermediateValue221;
                    productValue427 = productValue478;
                    productValue428 = productValue479;
                    productValue429 = productValue480;
                }
                uvec4 reinterpretedBits32 = floatBitsToUint(ViewCB.packedValues[92u]);
                uint scalarValue108 = reinterpretedBits32.w;
                float intermediateValue273;
                float intermediateValue274;
                float intermediateValue275;
                uint intermediateValue276;
                float intermediateValue278;
                float intermediateValue279;
                float intermediateValue280;
                uint intermediateValue282;
                if (scalarValue108 == 0u)
                {
                    intermediateValue273 = 0.0;
                    intermediateValue274 = 0.0;
                    intermediateValue275 = 0.0;
                    intermediateValue276 = 0u;
                    intermediateValue278 = 0.0;
                    intermediateValue279 = 0.0;
                    intermediateValue280 = 0.0;
                    intermediateValue44 = intermediateValue43;
                    intermediateValue282 = intermediateValue90;
                }
                else
                {
                    intermediateValue[0u] = 0u;
                    uint sumValue575 = scalarValue108 + 4294967295u;
                    uint productValue676 = (intermediateValue90 * 1664525u) + 1013904223u;
                    precise float bitwiseValue206 = float(productValue676 & 16777215u) * 5.9604644775390625e-08;
                    float scalarValue109 = float(int(scalarValue108));
                    precise float productValue677 = bitwiseValue206 * scalarValue109;
                    uint scalarValue110 = uint(min(int(uint(int(productValue677))), int(sumValue575)));
                    f16vec3 productValue449 = uint16BitsToFloat16(inputLightsBuffer.packedValues[scalarValue110 * 2u]);
                    precise float sumValue577 = float(productValue449.x) - sumValue211;
                    precise float sumValue578 = float(productValue449.y) - sumValue214;
                    precise float sumValue579 = float(productValue449.z) - sumValue217;
                    precise float dotProductValue19 = dot(vec3(sumValue577, sumValue578, sumValue579), vec3(sumValue577, sumValue578, sumValue579));
                    precise float quotientValue23 = 1.0 / dotProductValue19;
                    float comparisonValue75 = (int(inputLightsBuffer_2.packedValues[(scalarValue110 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
                    precise float productValue678 = comparisonValue75 * comparisonValue75;
                    float intermediateValue299;
                    if (dotProductValue19 > productValue678)
                    {
                        float inverseLengthValue16 = inversesqrt(dotProductValue19);
                        precise float productValue679 = sumValue577 * inverseLengthValue16;
                        precise float productValue680 = sumValue578 * inverseLengthValue16;
                        precise float productValue681 = sumValue579 * inverseLengthValue16;
                        precise float dotProductValue20 = quotientValue23 * spvNMax(0.0, dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(productValue679, productValue680, productValue681)));
                        intermediateValue299 = dotProductValue20;
                    }
                    else
                    {
                        intermediateValue299 = quotientValue23;
                    }
                    float intermediateValue322;
                    uint intermediateValue323;
                    float intermediateValue324;
                    if (intermediateValue299 > 0.0)
                    {
                        intermediateValue[0u] = scalarValue110;
                        intermediateValue322 = intermediateValue299;
                        intermediateValue323 = 1u;
                        intermediateValue324 = intermediateValue299;
                    }
                    else
                    {
                        intermediateValue322 = -1.0;
                        intermediateValue323 = 0u;
                        intermediateValue324 = 0.0;
                    }
                    intermediateValue[1u] = 0u;
                    uint productValue682 = (productValue676 * 1664525u) + 1013904223u;
                    precise float bitwiseValue207 = float(productValue682 & 16777215u) * 5.9604644775390625e-08;
                    precise float productValue683 = bitwiseValue207 * scalarValue109;
                    uint scalarValue111 = uint(min(int(uint(int(productValue683))), int(sumValue575)));
                    f16vec3 productValue532 = uint16BitsToFloat16(inputLightsBuffer.packedValues[scalarValue111 * 2u]);
                    precise float sumValue580 = float(productValue532.x) - sumValue211;
                    precise float sumValue581 = float(productValue532.y) - sumValue214;
                    precise float sumValue582 = float(productValue532.z) - sumValue217;
                    precise float dotProductValue21 = dot(vec3(sumValue580, sumValue581, sumValue582), vec3(sumValue580, sumValue581, sumValue582));
                    precise float quotientValue24 = 1.0 / dotProductValue21;
                    float comparisonValue78 = (int(inputLightsBuffer_2.packedValues[(scalarValue111 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
                    precise float productValue684 = comparisonValue78 * comparisonValue78;
                    float intermediateValue340;
                    if (dotProductValue21 > productValue684)
                    {
                        float inverseLengthValue17 = inversesqrt(dotProductValue21);
                        precise float productValue685 = sumValue580 * inverseLengthValue17;
                        precise float productValue686 = sumValue581 * inverseLengthValue17;
                        precise float productValue687 = sumValue582 * inverseLengthValue17;
                        precise float dotProductValue22 = quotientValue24 * spvNMax(0.0, dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(productValue685, productValue686, productValue687)));
                        intermediateValue340 = dotProductValue22;
                    }
                    else
                    {
                        intermediateValue340 = quotientValue24;
                    }
                    float intermediateValue359;
                    uint sumValue461;
                    float intermediateValue360;
                    if (intermediateValue340 > 0.0)
                    {
                        float sumValue583 = intermediateValue340 + intermediateValue324;
                        intermediateValue[1u] = scalarValue111;
                        intermediateValue359 = sumValue583;
                        sumValue461 = intermediateValue323 + 1u;
                        intermediateValue360 = sumValue583;
                    }
                    else
                    {
                        intermediateValue359 = -1.0;
                        sumValue461 = intermediateValue323;
                        intermediateValue360 = intermediateValue324;
                    }
                    intermediateValue[2u] = 0u;
                    uint productValue688 = (productValue682 * 1664525u) + 1013904223u;
                    precise float bitwiseValue208 = float(productValue688 & 16777215u) * 5.9604644775390625e-08;
                    precise float productValue689 = bitwiseValue208 * scalarValue109;
                    uint scalarValue112 = uint(min(int(uint(int(productValue689))), int(sumValue575)));
                    f16vec3 productValue593 = uint16BitsToFloat16(inputLightsBuffer.packedValues[scalarValue112 * 2u]);
                    precise float sumValue584 = float(productValue593.x) - sumValue211;
                    precise float sumValue585 = float(productValue593.y) - sumValue214;
                    precise float sumValue586 = float(productValue593.z) - sumValue217;
                    precise float dotProductValue23 = dot(vec3(sumValue584, sumValue585, sumValue586), vec3(sumValue584, sumValue585, sumValue586));
                    precise float quotientValue25 = 1.0 / dotProductValue23;
                    float comparisonValue79 = (int(inputLightsBuffer_2.packedValues[(scalarValue112 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
                    precise float productValue690 = comparisonValue79 * comparisonValue79;
                    float intermediateValue407;
                    if (dotProductValue23 > productValue690)
                    {
                        float inverseLengthValue18 = inversesqrt(dotProductValue23);
                        precise float productValue691 = sumValue584 * inverseLengthValue18;
                        precise float productValue692 = sumValue585 * inverseLengthValue18;
                        precise float productValue693 = sumValue586 * inverseLengthValue18;
                        precise float dotProductValue24 = quotientValue25 * spvNMax(0.0, dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(productValue691, productValue692, productValue693)));
                        intermediateValue407 = dotProductValue24;
                    }
                    else
                    {
                        intermediateValue407 = quotientValue25;
                    }
                    float intermediateValue424;
                    uint sumValue576;
                    float intermediateValue425;
                    if (intermediateValue407 > 0.0)
                    {
                        float sumValue587 = intermediateValue407 + intermediateValue360;
                        intermediateValue[2u] = scalarValue112;
                        intermediateValue424 = sumValue587;
                        sumValue576 = sumValue461 + 1u;
                        intermediateValue425 = sumValue587;
                    }
                    else
                    {
                        intermediateValue424 = -1.0;
                        sumValue576 = sumValue461;
                        intermediateValue425 = intermediateValue360;
                    }
                    intermediateValue[3u] = 0u;
                    uint productValue694 = (productValue688 * 1664525u) + 1013904223u;
                    precise float bitwiseValue209 = float(productValue694 & 16777215u) * 5.9604644775390625e-08;
                    precise float productValue695 = bitwiseValue209 * scalarValue109;
                    uint scalarValue113 = uint(min(int(uint(int(productValue695))), int(sumValue575)));
                    f16vec3 productValue745 = uint16BitsToFloat16(inputLightsBuffer.packedValues[scalarValue113 * 2u]);
                    precise float sumValue588 = float(productValue745.x) - sumValue211;
                    precise float sumValue589 = float(productValue745.y) - sumValue214;
                    precise float sumValue590 = float(productValue745.z) - sumValue217;
                    precise float dotProductValue25 = dot(vec3(sumValue588, sumValue589, sumValue590), vec3(sumValue588, sumValue589, sumValue590));
                    precise float quotientValue26 = 1.0 / dotProductValue25;
                    float comparisonValue80 = (int(inputLightsBuffer_2.packedValues[(scalarValue113 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
                    precise float productValue696 = comparisonValue80 * comparisonValue80;
                    float intermediateValue463;
                    if (dotProductValue25 > productValue696)
                    {
                        float inverseLengthValue19 = inversesqrt(dotProductValue25);
                        precise float productValue697 = sumValue588 * inverseLengthValue19;
                        precise float productValue698 = sumValue589 * inverseLengthValue19;
                        precise float productValue699 = sumValue590 * inverseLengthValue19;
                        precise float dotProductValue26 = quotientValue26 * spvNMax(0.0, dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(productValue697, productValue698, productValue699)));
                        intermediateValue463 = dotProductValue26;
                    }
                    else
                    {
                        intermediateValue463 = quotientValue26;
                    }
                    float intermediateValue488;
                    uint sumValue634;
                    float intermediateValue489;
                    if (intermediateValue463 > 0.0)
                    {
                        float sumValue591 = intermediateValue463 + intermediateValue425;
                        intermediateValue[3u] = scalarValue113;
                        intermediateValue488 = sumValue591;
                        sumValue634 = sumValue576 + 1u;
                        intermediateValue489 = sumValue591;
                    }
                    else
                    {
                        intermediateValue488 = -1.0;
                        sumValue634 = sumValue576;
                        intermediateValue489 = intermediateValue425;
                    }
                    intermediateValue[4u] = 0u;
                    uint productValue700 = (productValue694 * 1664525u) + 1013904223u;
                    precise float bitwiseValue210 = float(productValue700 & 16777215u) * 5.9604644775390625e-08;
                    precise float productValue701 = bitwiseValue210 * scalarValue109;
                    uint scalarValue114 = uint(min(int(uint(int(productValue701))), int(sumValue575)));
                    f16vec3 productValue807 = uint16BitsToFloat16(inputLightsBuffer.packedValues[scalarValue114 * 2u]);
                    precise float sumValue592 = float(productValue807.x) - sumValue211;
                    precise float sumValue593 = float(productValue807.y) - sumValue214;
                    precise float sumValue594 = float(productValue807.z) - sumValue217;
                    precise float dotProductValue27 = dot(vec3(sumValue592, sumValue593, sumValue594), vec3(sumValue592, sumValue593, sumValue594));
                    precise float quotientValue27 = 1.0 / dotProductValue27;
                    float comparisonValue81 = (int(inputLightsBuffer_2.packedValues[(scalarValue114 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
                    precise float productValue702 = comparisonValue81 * comparisonValue81;
                    float intermediateValue526;
                    if (dotProductValue27 > productValue702)
                    {
                        float inverseLengthValue20 = inversesqrt(dotProductValue27);
                        precise float productValue703 = sumValue592 * inverseLengthValue20;
                        precise float productValue704 = sumValue593 * inverseLengthValue20;
                        precise float productValue705 = sumValue594 * inverseLengthValue20;
                        precise float dotProductValue28 = quotientValue27 * spvNMax(0.0, dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(productValue703, productValue704, productValue705)));
                        intermediateValue526 = dotProductValue28;
                    }
                    else
                    {
                        intermediateValue526 = quotientValue27;
                    }
                    float intermediateValue541;
                    uint sumValue713;
                    float intermediateValue542;
                    if (intermediateValue526 > 0.0)
                    {
                        float sumValue595 = intermediateValue526 + intermediateValue489;
                        intermediateValue[4u] = scalarValue114;
                        intermediateValue541 = sumValue595;
                        sumValue713 = sumValue634 + 1u;
                        intermediateValue542 = sumValue595;
                    }
                    else
                    {
                        intermediateValue541 = -1.0;
                        sumValue713 = sumValue634;
                        intermediateValue542 = intermediateValue489;
                    }
                    intermediateValue[5u] = 0u;
                    uint productValue706 = (productValue700 * 1664525u) + 1013904223u;
                    precise float bitwiseValue211 = float(productValue706 & 16777215u) * 5.9604644775390625e-08;
                    precise float productValue707 = bitwiseValue211 * scalarValue109;
                    uint scalarValue115 = uint(min(int(uint(int(productValue707))), int(sumValue575)));
                    f16vec3 productValue913 = uint16BitsToFloat16(inputLightsBuffer.packedValues[scalarValue115 * 2u]);
                    precise float sumValue596 = float(productValue913.x) - sumValue211;
                    precise float sumValue597 = float(productValue913.y) - sumValue214;
                    precise float sumValue598 = float(productValue913.z) - sumValue217;
                    precise float dotProductValue29 = dot(vec3(sumValue596, sumValue597, sumValue598), vec3(sumValue596, sumValue597, sumValue598));
                    precise float quotientValue28 = 1.0 / dotProductValue29;
                    float comparisonValue82 = (int(inputLightsBuffer_2.packedValues[(scalarValue115 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
                    precise float productValue708 = comparisonValue82 * comparisonValue82;
                    float intermediateValue563;
                    if (dotProductValue29 > productValue708)
                    {
                        float inverseLengthValue21 = inversesqrt(dotProductValue29);
                        precise float productValue709 = sumValue596 * inverseLengthValue21;
                        precise float productValue710 = sumValue597 * inverseLengthValue21;
                        precise float productValue711 = sumValue598 * inverseLengthValue21;
                        precise float dotProductValue30 = quotientValue28 * spvNMax(0.0, dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(productValue709, productValue710, productValue711)));
                        intermediateValue563 = dotProductValue30;
                    }
                    else
                    {
                        intermediateValue563 = quotientValue28;
                    }
                    float intermediateValue583;
                    uint sumValue766;
                    float intermediateValue584;
                    if (intermediateValue563 > 0.0)
                    {
                        float sumValue599 = intermediateValue563 + intermediateValue542;
                        intermediateValue[5u] = scalarValue115;
                        intermediateValue583 = sumValue599;
                        sumValue766 = sumValue713 + 1u;
                        intermediateValue584 = sumValue599;
                    }
                    else
                    {
                        intermediateValue583 = -1.0;
                        sumValue766 = sumValue713;
                        intermediateValue584 = intermediateValue542;
                    }
                    intermediateValue[6u] = 0u;
                    uint productValue712 = (productValue706 * 1664525u) + 1013904223u;
                    precise float bitwiseValue212 = float(productValue712 & 16777215u) * 5.9604644775390625e-08;
                    precise float productValue713 = bitwiseValue212 * scalarValue109;
                    uint scalarValue116 = uint(min(int(uint(int(productValue713))), int(sumValue575)));
                    f16vec3 productValue971 = uint16BitsToFloat16(inputLightsBuffer.packedValues[scalarValue116 * 2u]);
                    precise float sumValue600 = float(productValue971.x) - sumValue211;
                    precise float sumValue601 = float(productValue971.y) - sumValue214;
                    precise float sumValue602 = float(productValue971.z) - sumValue217;
                    precise float dotProductValue31 = dot(vec3(sumValue600, sumValue601, sumValue602), vec3(sumValue600, sumValue601, sumValue602));
                    precise float quotientValue29 = 1.0 / dotProductValue31;
                    float comparisonValue83 = (int(inputLightsBuffer_2.packedValues[(scalarValue116 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
                    precise float productValue714 = comparisonValue83 * comparisonValue83;
                    float intermediateValue593;
                    if (dotProductValue31 > productValue714)
                    {
                        float inverseLengthValue22 = inversesqrt(dotProductValue31);
                        precise float productValue715 = sumValue600 * inverseLengthValue22;
                        precise float productValue716 = sumValue601 * inverseLengthValue22;
                        precise float productValue717 = sumValue602 * inverseLengthValue22;
                        precise float dotProductValue32 = quotientValue29 * spvNMax(0.0, dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(productValue715, productValue716, productValue717)));
                        intermediateValue593 = dotProductValue32;
                    }
                    else
                    {
                        intermediateValue593 = quotientValue29;
                    }
                    float intermediateValue618;
                    uint sumValue816;
                    float intermediateValue619;
                    if (intermediateValue593 > 0.0)
                    {
                        float sumValue603 = intermediateValue593 + intermediateValue584;
                        intermediateValue[6u] = scalarValue116;
                        intermediateValue618 = sumValue603;
                        sumValue816 = sumValue766 + 1u;
                        intermediateValue619 = sumValue603;
                    }
                    else
                    {
                        intermediateValue618 = -1.0;
                        sumValue816 = sumValue766;
                        intermediateValue619 = intermediateValue584;
                    }
                    intermediateValue[7u] = 0u;
                    uint productValue718 = (productValue712 * 1664525u) + 1013904223u;
                    precise float bitwiseValue213 = float(productValue718 & 16777215u) * 5.9604644775390625e-08;
                    precise float productValue719 = bitwiseValue213 * scalarValue109;
                    uint scalarValue117 = uint(min(int(uint(int(productValue719))), int(sumValue575)));
                    f16vec3 productValue1018 = uint16BitsToFloat16(inputLightsBuffer.packedValues[scalarValue117 * 2u]);
                    precise float sumValue604 = float(productValue1018.x) - sumValue211;
                    precise float sumValue605 = float(productValue1018.y) - sumValue214;
                    precise float sumValue606 = float(productValue1018.z) - sumValue217;
                    precise float dotProductValue33 = dot(vec3(sumValue604, sumValue605, sumValue606), vec3(sumValue604, sumValue605, sumValue606));
                    precise float quotientValue30 = 1.0 / dotProductValue33;
                    float comparisonValue84 = (int(inputLightsBuffer_2.packedValues[(scalarValue117 * 3u) + 2u]) < int(0u)) ? 0.4600000083446502685546875 : 0.23000000417232513427734375;
                    precise float productValue720 = comparisonValue84 * comparisonValue84;
                    float intermediateValue627;
                    if (dotProductValue33 > productValue720)
                    {
                        float inverseLengthValue23 = inversesqrt(dotProductValue33);
                        precise float productValue721 = sumValue604 * inverseLengthValue23;
                        precise float productValue722 = sumValue605 * inverseLengthValue23;
                        precise float productValue723 = sumValue606 * inverseLengthValue23;
                        precise float dotProductValue34 = quotientValue30 * spvNMax(0.0, dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(productValue721, productValue722, productValue723)));
                        intermediateValue627 = dotProductValue34;
                    }
                    else
                    {
                        intermediateValue627 = quotientValue30;
                    }
                    float intermediateValue636;
                    uint sumValue852;
                    float intermediateValue637;
                    if (intermediateValue627 > 0.0)
                    {
                        float sumValue607 = intermediateValue627 + intermediateValue619;
                        intermediateValue[7u] = scalarValue117;
                        intermediateValue636 = sumValue607;
                        sumValue852 = sumValue816 + 1u;
                        intermediateValue637 = sumValue607;
                    }
                    else
                    {
                        intermediateValue636 = -1.0;
                        sumValue852 = sumValue816;
                        intermediateValue637 = intermediateValue619;
                    }
                    bool comparisonValue85 = sumValue852 == 0u;
                    float intermediateValue281;
                    uint intermediateValue283;
                    uint intermediateValue644;
                    float16_t intermediateValue645;
                    float16_t intermediateValue647;
                    float16_t intermediateValue649;
                    if (comparisonValue85)
                    {
                        intermediateValue281 = intermediateValue43;
                        intermediateValue283 = productValue718;
                        intermediateValue644 = 0u;
                        intermediateValue645 = float16_t(0.0);
                        intermediateValue647 = float16_t(0.0);
                        intermediateValue649 = float16_t(0.0);
                    }
                    else
                    {
                        uint intermediateValue662;
                        uint productValue1063;
                        float bitwiseValue310;
                        bool intermediateValue651;
                        for (;;)
                        {
                            productValue1063 = (productValue718 * 1664525u) + 1013904223u;
                            bitwiseValue310 = (float(productValue1063 & 16777215u) * 5.9604584379258085391484200954437e-08) * intermediateValue637;
                            intermediateValue651 = intermediateValue322 > bitwiseValue310;
                            uint intermediateValue656;
                            if (intermediateValue651)
                            {
                                intermediateValue656 = 0u;
                            }
                            else
                            {
                                uint branchMergedValue48;
                                if (intermediateValue359 > bitwiseValue310)
                                {
                                    branchMergedValue48 = 1u;
                                }
                                else
                                {
                                    uint branchMergedValue189;
                                    if (intermediateValue424 > bitwiseValue310)
                                    {
                                        branchMergedValue189 = 2u;
                                    }
                                    else
                                    {
                                        uint branchMergedValue240;
                                        if (intermediateValue488 > bitwiseValue310)
                                        {
                                            branchMergedValue240 = 3u;
                                        }
                                        else
                                        {
                                            uint branchMergedValue244;
                                            if (intermediateValue541 > bitwiseValue310)
                                            {
                                                branchMergedValue244 = 4u;
                                            }
                                            else
                                            {
                                                uint branchMergedValue245;
                                                if (intermediateValue583 > bitwiseValue310)
                                                {
                                                    branchMergedValue245 = 5u;
                                                }
                                                else
                                                {
                                                    uint branchMergedValue246;
                                                    if (intermediateValue618 > bitwiseValue310)
                                                    {
                                                        branchMergedValue246 = 6u;
                                                    }
                                                    else
                                                    {
                                                        if (!(intermediateValue636 > bitwiseValue310))
                                                        {
                                                            intermediateValue662 = 0u;
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
                                intermediateValue656 = branchMergedValue48;
                            }
                            intermediateValue662 = intermediateValue[intermediateValue656];
                            break;
                        }
                        f16vec3 productValue1073 = uint16BitsToFloat16(inputLightsBuffer.packedValues[intermediateValue662 * 2u]);
                        float16_t scalarValue118 = productValue1073.x;
                        float16_t scalarValue119 = productValue1073.y;
                        float16_t scalarValue120 = productValue1073.z;
                        float sumValue608 = float(scalarValue118) - sumValue211;
                        float sumValue609 = float(scalarValue119) - sumValue214;
                        float sumValue610 = float(scalarValue120) - sumValue217;
                        intermediateValue281 = 1.0 / (ViewCB.packedValues[96u].z * dot(vec3(sumValue608, sumValue609, sumValue610), vec3(sumValue608, sumValue609, sumValue610)));
                        intermediateValue283 = productValue1063;
                        intermediateValue644 = inputLightsBuffer_2.packedValues[(intermediateValue662 * 3u) + 2u];
                        intermediateValue645 = scalarValue118;
                        intermediateValue647 = scalarValue119;
                        intermediateValue649 = scalarValue120;
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
                        branchMergedValue34 = intermediateValue281;
                        branchMergedValue89 = 0.0;
                        branchMergedValue90 = 0.0;
                        branchMergedValue91 = 0.0;
                        branchMergedValue92 = 0u;
                        branchMergedValue93 = 0.0;
                        branchMergedValue94 = 0.0;
                        branchMergedValue95 = 0.0;
                        branchMergedValue96 = intermediateValue283;
                    }
                    else
                    {
                        float comparisonValue86 = (int(intermediateValue644) < int(0u)) ? 0.23000000417232513427734375 : 0.115000002086162567138671875;
                        uint productValue724 = (intermediateValue283 * 1664525u) + 1013904223u;
                        float bitwiseValue214 = float(productValue724 & 16777215u);
                        float productValue725 = bitwiseValue214 * 0.002414158545434474945068359375;
                        float productValue726 = (productValue725 - floor(productValue725)) * 6.283185482025146484375;
                        float productValue727 = 0.9999847412109375 - (bitwiseValue214 * 1.1920928955078125e-07);
                        float nonlinearValue15 = sqrt(spvNClamp(1.0 - (productValue727 * productValue727), 0.0, 1.0)) * comparisonValue86;
                        float wavePhaseValue11 = nonlinearValue15 * cos(productValue726);
                        float wavePhaseValue12 = sin(productValue726) * nonlinearValue15;
                        float productValue728 = productValue727 * comparisonValue86;
                        bool dotProductValue35 = dot(vec3(wavePhaseValue11, wavePhaseValue12, productValue728), vec3(float(intermediateValue645) - sumValue211, float(intermediateValue647) - sumValue214, float(intermediateValue649) - sumValue217)) > 0.0;
                        float comparisonValue88 = float(float16_t(dotProductValue35 ? ((-0.0) - wavePhaseValue11) : wavePhaseValue11) + intermediateValue645) - sumValue211;
                        float comparisonValue89 = float(float16_t(dotProductValue35 ? ((-0.0) - wavePhaseValue12) : wavePhaseValue12) + intermediateValue647) - sumValue214;
                        float comparisonValue90 = float(float16_t(dotProductValue35 ? ((-0.0) - productValue728) : productValue728) + intermediateValue649) - sumValue217;
                        float inverseLengthValue24 = inversesqrt(dot(vec3(comparisonValue88, comparisonValue89, comparisonValue90), vec3(comparisonValue88, comparisonValue89, comparisonValue90)));
                        float productValue729 = comparisonValue88 * inverseLengthValue24;
                        float productValue730 = comparisonValue89 * inverseLengthValue24;
                        float productValue731 = comparisonValue90 * inverseLengthValue24;
                        rayQueryInitializeEXT(intermediateValue654, SceneBVH, 512u, 2u, vec3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0, vec3(productValue729, productValue730, productValue731), sqrt(((comparisonValue88 * comparisonValue88) + (comparisonValue89 * comparisonValue89)) + (comparisonValue90 * comparisonValue90)) + (-0.00999999977648258209228515625));
                        bool conditionValue27 = rayQueryProceedEXT(intermediateValue654);
                        if (conditionValue27)
                        {
                            bool intermediateValue675;
                            bool comparisonValue139;
                            for (;;)
                            {
                                uint scalarValue121 = rayQueryGetIntersectionTypeEXT(intermediateValue654, bool(0u));
                                comparisonValue139 = scalarValue121 == 0u;
                                if (comparisonValue139)
                                {
                                    vec2 vectorValue13 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue654, bool(0u));
                                    vec2 vectorValue14 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue654, bool(0u));
                                    uint scalarValue122 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue654, bool(0u));
                                    uint scalarValue123 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue654, bool(0u));
                                    uint scalarValue124 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue654, bool(0u));
                                    uint productValue732 = (scalarValue124 * 76u) + 58u;
                                    uint productValue733 = (scalarValue124 * 76u) + 61u;
                                    precise float sumValue611 = 1.0 - vectorValue13.x;
                                    precise float sumValue612 = sumValue611 - vectorValue14.y;
                                    uint bitwiseValue215 = (objectInstances_2.packedValues[(scalarValue124 * 38u) + 25u] >> 2u) + (scalarValue122 >> 1u);
                                    uint productValue734 = uint(objectInstances.packedValues[(scalarValue124 * 76u) + 54u]) + 0u;
                                    bool comparisonValue91 = (scalarValue122 & 1u) == 0u;
                                    uint comparisonValue92 = comparisonValue91 ? faceUvBuffersRW[nonuniformEXT(productValue734)].packedValues[bitwiseValue215].z : faceUvBuffersRW[nonuniformEXT(productValue734)].packedValues[bitwiseValue215].x;
                                    uint comparisonValue93 = comparisonValue91 ? faceUvBuffersRW[nonuniformEXT(productValue734)].packedValues[bitwiseValue215].y : faceUvBuffersRW[nonuniformEXT(productValue734)].packedValues[bitwiseValue215].w;
                                    uint comparisonValue94 = comparisonValue91 ? faceUvBuffersRW[nonuniformEXT(productValue734)].packedValues[bitwiseValue215].x : faceUvBuffersRW[nonuniformEXT(productValue734)].packedValues[bitwiseValue215].z;
                                    bool conditionValue28 = int16_t(objectInstances.packedValues[productValue733]) < int16_t(0us);
                                    float intermediateValue676;
                                    float intermediateValue677;
                                    if (conditionValue28)
                                    {
                                        uint bitwiseValue216 = comparisonValue94 >> 15u;
                                        precise float bitwiseValue217 = float(bitwiseValue216 & 1u) * 2.0;
                                        precise float sumValue613 = bitwiseValue217 + (-1.0);
                                        precise float bitwiseValue218 = float(comparisonValue94 >> 31u) * 2.0;
                                        precise float sumValue614 = bitwiseValue218 + (-1.0);
                                        precise float bitwiseValue219 = float((comparisonValue94 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue220 = float(bitwiseValue216 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue735 = sumValue613 * 3.0517578125e-05;
                                        precise float productValue736 = sumValue614 * 3.0517578125e-05;
                                        precise float sumValue615 = bitwiseValue219 + productValue735;
                                        precise float sumValue616 = bitwiseValue220 + productValue736;
                                        intermediateValue676 = sumValue615;
                                        intermediateValue677 = sumValue616;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue221 = float(comparisonValue94 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue222 = float(comparisonValue94 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue737 = bitwiseValue221 * 16384.0;
                                        precise float sumValue617 = productValue737 + 0.5;
                                        precise float productValue738 = bitwiseValue222 * 16384.0;
                                        precise float sumValue618 = productValue738 + 0.5;
                                        precise float productValue739 = floor(sumValue617) * 6.103515625e-05;
                                        precise float productValue740 = floor(sumValue618) * 6.103515625e-05;
                                        intermediateValue676 = productValue739;
                                        intermediateValue677 = productValue740;
                                    }
                                    precise float productValue741 = sumValue612 * intermediateValue676;
                                    precise float productValue742 = sumValue612 * intermediateValue677;
                                    precise float sumValue619 = productValue741 + 0.0;
                                    precise float sumValue620 = productValue742 + 0.0;
                                    float intermediateValue678;
                                    float intermediateValue679;
                                    if (conditionValue28)
                                    {
                                        uint bitwiseValue223 = comparisonValue93 >> 15u;
                                        precise float bitwiseValue224 = float(bitwiseValue223 & 1u) * 2.0;
                                        precise float sumValue621 = bitwiseValue224 + (-1.0);
                                        precise float bitwiseValue225 = float(comparisonValue93 >> 31u) * 2.0;
                                        precise float sumValue622 = bitwiseValue225 + (-1.0);
                                        precise float bitwiseValue226 = float((comparisonValue93 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue227 = float(bitwiseValue223 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue743 = sumValue621 * 3.0517578125e-05;
                                        precise float productValue744 = sumValue622 * 3.0517578125e-05;
                                        precise float sumValue623 = bitwiseValue226 + productValue743;
                                        precise float sumValue624 = bitwiseValue227 + productValue744;
                                        intermediateValue678 = sumValue623;
                                        intermediateValue679 = sumValue624;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue228 = float(comparisonValue93 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue229 = float(comparisonValue93 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue746 = bitwiseValue228 * 16384.0;
                                        precise float sumValue625 = productValue746 + 0.5;
                                        precise float productValue747 = bitwiseValue229 * 16384.0;
                                        precise float sumValue626 = productValue747 + 0.5;
                                        precise float productValue748 = floor(sumValue625) * 6.103515625e-05;
                                        precise float productValue749 = floor(sumValue626) * 6.103515625e-05;
                                        intermediateValue678 = productValue748;
                                        intermediateValue679 = productValue749;
                                    }
                                    precise float productValue750 = vectorValue13.x * intermediateValue678;
                                    precise float productValue751 = vectorValue13.x * intermediateValue679;
                                    precise float sumValue627 = sumValue619 + productValue750;
                                    precise float sumValue628 = sumValue620 + productValue751;
                                    float intermediateValue680;
                                    float intermediateValue681;
                                    if (conditionValue28)
                                    {
                                        uint bitwiseValue230 = comparisonValue92 >> 15u;
                                        precise float bitwiseValue231 = float(bitwiseValue230 & 1u) * 2.0;
                                        precise float sumValue629 = bitwiseValue231 + (-1.0);
                                        precise float bitwiseValue232 = float(comparisonValue92 >> 31u) * 2.0;
                                        precise float sumValue630 = bitwiseValue232 + (-1.0);
                                        precise float bitwiseValue233 = float((comparisonValue92 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue234 = float(bitwiseValue230 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue752 = sumValue629 * 3.0517578125e-05;
                                        precise float productValue753 = sumValue630 * 3.0517578125e-05;
                                        precise float sumValue631 = bitwiseValue233 + productValue752;
                                        precise float sumValue632 = bitwiseValue234 + productValue753;
                                        intermediateValue680 = sumValue631;
                                        intermediateValue681 = sumValue632;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue235 = float(comparisonValue92 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue236 = float(comparisonValue92 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue754 = bitwiseValue235 * 16384.0;
                                        precise float sumValue633 = productValue754 + 0.5;
                                        precise float productValue755 = bitwiseValue236 * 16384.0;
                                        precise float sumValue635 = productValue755 + 0.5;
                                        precise float productValue756 = floor(sumValue633) * 6.103515625e-05;
                                        precise float productValue757 = floor(sumValue635) * 6.103515625e-05;
                                        intermediateValue680 = productValue756;
                                        intermediateValue681 = productValue757;
                                    }
                                    precise float productValue758 = vectorValue14.y * intermediateValue680;
                                    precise float productValue759 = vectorValue14.y * intermediateValue681;
                                    precise float sumValue636 = sumValue627 + productValue758;
                                    precise float sumValue637 = sumValue628 + productValue759;
                                    float intermediateValue682;
                                    if (objectInstances.packedValues[productValue732] == 65535us)
                                    {
                                        intermediateValue682 = 1.0;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits52;
                                        if (objectInstances.packedValues[productValue732] > 4095us)
                                        {
                                            reinterpretedBits52 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits52 = uint(objectInstances.packedValues[productValue732]);
                                        }
                                        intermediateValue682 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits52 + 0u], defaultSampler)), vec2(sumValue636, sumValue637), -0.25).w;
                                    }
                                    uint comparisonValue144;
                                    if (scalarValue123 == 2u)
                                    {
                                        comparisonValue144 = 0u;
                                    }
                                    else
                                    {
                                        comparisonValue144 = uint(intermediateValue682 <= (((objectInstances.packedValues[productValue733] & 4352us) != 0us) ? 0.5 : 0.0));
                                    }
                                    if (comparisonValue144 == 0u)
                                    {
                                        rayQueryConfirmIntersectionEXT(intermediateValue654);
                                    }
                                }
                                intermediateValue675 = rayQueryProceedEXT(intermediateValue654);
                                if (intermediateValue675)
                                {
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        uint scalarValue125 = rayQueryGetIntersectionTypeEXT(intermediateValue654, bool(1u));
                        float intermediateValue667;
                        if (scalarValue125 == 1u)
                        {
                            float scalarValue126 = rayQueryGetIntersectionTEXT(intermediateValue654, bool(1u));
                            intermediateValue667 = scalarValue126;
                        }
                        else
                        {
                            intermediateValue667 = 10000.0;
                        }
                        bool conditionValue29 = !(intermediateValue667 < 10000.0);
                        uint scalarValue127 = uint(conditionValue29);
                        float branchMergedValue184;
                        float branchMergedValue203;
                        float branchMergedValue204;
                        float branchMergedValue205;
                        uint branchMergedValue206;
                        float branchMergedValue207;
                        float branchMergedValue208;
                        float branchMergedValue209;
                        uint branchMergedValue210;
                        if (conditionValue29)
                        {
                            float bitwiseValue237 = (intermediateValue281 * 0.0392156876623630523681640625) * float(intermediateValue644 & 255u);
                            float productValue760 = bitwiseValue237 * 0.00117647065781056880950927734375;
                            branchMergedValue184 = intermediateValue281;
                            branchMergedValue203 = productValue760 * float((intermediateValue644 >> 8u) & 255u);
                            branchMergedValue204 = productValue760 * float((intermediateValue644 >> 16u) & 255u);
                            branchMergedValue205 = (float((intermediateValue644 >> 24u) & 127u) * 0.00236220471560955047607421875) * bitwiseValue237;
                            branchMergedValue206 = scalarValue127;
                            branchMergedValue207 = productValue731;
                            branchMergedValue208 = productValue730;
                            branchMergedValue209 = productValue729;
                            branchMergedValue210 = productValue724;
                        }
                        else
                        {
                            branchMergedValue184 = intermediateValue281;
                            branchMergedValue203 = 0.0;
                            branchMergedValue204 = 0.0;
                            branchMergedValue205 = 0.0;
                            branchMergedValue206 = scalarValue127;
                            branchMergedValue207 = productValue731;
                            branchMergedValue208 = productValue730;
                            branchMergedValue209 = productValue729;
                            branchMergedValue210 = productValue724;
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
                    intermediateValue273 = branchMergedValue95;
                    intermediateValue274 = branchMergedValue94;
                    intermediateValue275 = branchMergedValue93;
                    intermediateValue276 = branchMergedValue92;
                    intermediateValue278 = branchMergedValue91;
                    intermediateValue279 = branchMergedValue90;
                    intermediateValue280 = branchMergedValue89;
                    intermediateValue44 = branchMergedValue34;
                    intermediateValue282 = branchMergedValue96;
                }
                float intermediateValue294;
                float intermediateValue295;
                float intermediateValue296;
                if (intermediateValue276 == 0u)
                {
                    intermediateValue294 = productValue427;
                    intermediateValue295 = productValue428;
                    intermediateValue296 = productValue429;
                }
                else
                {
                    float branchMergedValue35;
                    float branchMergedValue97;
                    float branchMergedValue98;
                    if (dot(vec3(comparisonValue15, comparisonValue16, comparisonValue17), vec3(intermediateValue273, intermediateValue274, intermediateValue275)) > 0.0)
                    {
                        float scalarValue128 = spvNMax(intermediateValue265, 0.00999999977648258209228515625);
                        float sumValue638 = intermediateValue273 - intermediateValue76;
                        float sumValue639 = intermediateValue274 - intermediateValue78;
                        float sumValue640 = intermediateValue275 - intermediateValue80;
                        float inverseLengthValue25 = inversesqrt(dot(vec3(sumValue638, sumValue639, sumValue640), vec3(sumValue638, sumValue639, sumValue640)));
                        float productValue761 = inverseLengthValue25 * sumValue638;
                        float productValue762 = inverseLengthValue25 * sumValue639;
                        float productValue763 = inverseLengthValue25 * sumValue640;
                        float dotProductValue36 = spvNClamp(dot(vec3(intermediateValue222, intermediateValue224, intermediateValue226), vec3(intermediateValue273, intermediateValue274, intermediateValue275)), 0.0, 1.0);
                        float dotProductValue37 = spvNClamp(dot(vec3(intermediateValue222, intermediateValue224, intermediateValue226), vec3(sumValue403, sumValue404, sumValue405)), 0.0, 1.0);
                        float dotProductValue38 = spvNClamp(dot(vec3(intermediateValue222, intermediateValue224, intermediateValue226), vec3(productValue761, productValue762, productValue763)), 0.0, 1.0);
                        float dotProductValue39 = spvNClamp(dot(vec3(sumValue403, sumValue404, sumValue405), vec3(productValue761, productValue762, productValue763)), 0.0, 1.0);
                        float productValue764 = scalarValue128 * scalarValue128;
                        float productValue765 = productValue764 * productValue764;
                        float productValue766 = (((dotProductValue38 * productValue765) - dotProductValue38) * dotProductValue38) + 1.0;
                        float productValue767 = productValue764 * 0.5;
                        float sumValue641 = 1.0 - productValue767;
                        float dotProductValue40 = spvNClamp(dot(vec3(intermediateValue228, intermediateValue229, intermediateValue230), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0);
                        float exponentialValue10 = exp2(log2(spvNClamp(1.0 - dotProductValue39, 0.0, 1.0)) * 5.0);
                        float productValue768 = (exponentialValue10 * (dotProductValue40 - intermediateValue228)) + intermediateValue228;
                        float productValue769 = (exponentialValue10 * (dotProductValue40 - intermediateValue229)) + intermediateValue229;
                        float productValue770 = (exponentialValue10 * (dotProductValue40 - intermediateValue230)) + intermediateValue230;
                        float productValue771 = ((dotProductValue39 * dotProductValue39) * (scalarValue128 * 2.0)) + (-0.5);
                        float quotientValue31 = ((productValue765 / ((productValue766 * productValue766) + 1.0000000133514319600180897396058e-10)) * 0.3183098733425140380859375) * (0.25 / ((((dotProductValue37 * sumValue641) + productValue767) * ((dotProductValue36 * sumValue641) + productValue767)) + 1.0000000133514319600180897396058e-10));
                        float exponentialValue11 = ((intermediateValue219 * 0.3183098733425140380859375) * ((exp2(log2(spvNClamp(1.0 - dotProductValue37, 0.0, 1.0)) * 5.0) * productValue771) + 1.0)) * ((exp2(log2(spvNClamp(1.0 - dotProductValue36, 0.0, 1.0)) * 5.0) * productValue771) + 1.0);
                        branchMergedValue35 = (((intermediateValue280 * intermediateValue242) * dotProductValue36) * ((((1.0 - productValue770) * intermediateValue233) * exponentialValue11) + (productValue770 * quotientValue31))) + productValue429;
                        branchMergedValue97 = (((intermediateValue279 * intermediateValue241) * dotProductValue36) * ((((1.0 - productValue769) * intermediateValue232) * exponentialValue11) + (productValue769 * quotientValue31))) + productValue428;
                        branchMergedValue98 = (((intermediateValue278 * intermediateValue240) * dotProductValue36) * ((((1.0 - productValue768) * intermediateValue231) * exponentialValue11) + (productValue768 * quotientValue31))) + productValue427;
                    }
                    else
                    {
                        branchMergedValue35 = productValue429;
                        branchMergedValue97 = productValue428;
                        branchMergedValue98 = productValue427;
                    }
                    intermediateValue294 = branchMergedValue98;
                    intermediateValue295 = branchMergedValue97;
                    intermediateValue296 = branchMergedValue35;
                }
                bool dotProductValue41 = dot(vec3(0.847100675106048583984375, 0.2079117000102996826171875, 0.489073812961578369140625), vec3(intermediateValue222, intermediateValue224, intermediateValue226)) > 0.949999988079071044921875;
                float comparisonValue95 = dotProductValue41 ? (-0.639436304569244384765625) : 0.847100675106048583984375;
                float comparisonValue96 = dotProductValue41 ? (-0.3907311260700225830078125) : 0.2079117000102996826171875;
                float comparisonValue97 = dotProductValue41 ? 0.6621558666229248046875 : 0.489073812961578369140625;
                precise float dotProductValue42 = dot(vec3(comparisonValue95, comparisonValue96, comparisonValue97), vec3(intermediateValue222, intermediateValue224, intermediateValue226));
                precise float productValue772 = intermediateValue222 * dotProductValue42;
                precise float productValue773 = intermediateValue224 * dotProductValue42;
                precise float productValue774 = intermediateValue226 * dotProductValue42;
                precise float sumValue642 = comparisonValue95 - productValue772;
                precise float sumValue643 = comparisonValue96 - productValue773;
                precise float sumValue644 = comparisonValue97 - productValue774;
                float inverseLengthValue26 = inversesqrt(dot(vec3(sumValue642, sumValue643, sumValue644), vec3(sumValue642, sumValue643, sumValue644)));
                precise float productValue775 = sumValue642 * inverseLengthValue26;
                precise float productValue776 = sumValue643 * inverseLengthValue26;
                precise float productValue777 = sumValue644 * inverseLengthValue26;
                precise float productValue778 = intermediateValue224 * productValue777;
                precise float productValue779 = intermediateValue226 * productValue776;
                precise float sumValue645 = productValue778 - productValue779;
                precise float productValue780 = intermediateValue226 * productValue775;
                precise float productValue781 = intermediateValue222 * productValue777;
                precise float sumValue646 = productValue780 - productValue781;
                precise float productValue782 = intermediateValue222 * productValue776;
                precise float productValue783 = intermediateValue224 * productValue775;
                precise float sumValue647 = productValue782 - productValue783;
                precise float productValue784 = intermediateValue265 * intermediateValue265;
                precise float sumValue648 = intermediateValue222 - intermediateValue76;
                precise float sumValue649 = intermediateValue224 - intermediateValue78;
                precise float sumValue650 = intermediateValue226 - intermediateValue80;
                precise float sumValue651 = sumValue648 - intermediateValue222;
                precise float sumValue652 = sumValue649 - intermediateValue224;
                precise float sumValue653 = sumValue650 - intermediateValue226;
                precise float productValue785 = sumValue651 * productValue784;
                precise float productValue786 = sumValue652 * productValue784;
                precise float productValue787 = sumValue653 * productValue784;
                precise float sumValue654 = intermediateValue222 + productValue785;
                precise float sumValue655 = intermediateValue224 + productValue786;
                precise float sumValue656 = intermediateValue226 + productValue787;
                float inverseLengthValue27 = inversesqrt(dot(vec3(sumValue654, sumValue655, sumValue656), vec3(sumValue654, sumValue655, sumValue656)));
                precise float productValue788 = sumValue654 * inverseLengthValue27;
                precise float productValue789 = sumValue655 * inverseLengthValue27;
                precise float productValue790 = sumValue656 * inverseLengthValue27;
                precise float sumValue657 = intermediateValue234 + (-0.039999999105930328369140625);
                precise float sumValue658 = intermediateValue235 + (-0.039999999105930328369140625);
                precise float sumValue659 = intermediateValue236 + (-0.039999999105930328369140625);
                precise float productValue791 = intermediateValue220 * sumValue657;
                precise float productValue792 = intermediateValue220 * sumValue658;
                precise float productValue793 = intermediateValue220 * sumValue659;
                precise float sumValue660 = productValue791 + 0.039999999105930328369140625;
                precise float sumValue661 = productValue792 + 0.039999999105930328369140625;
                precise float sumValue662 = productValue793 + 0.039999999105930328369140625;
                precise float dotProductValue43 = dot(vec3(sumValue660, sumValue661, sumValue662), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0;
                float scalarValue129 = spvNClamp(dotProductValue43, 0.0, 1.0);
                precise float sumValue663 = scalarValue129 - sumValue660;
                precise float sumValue664 = scalarValue129 - sumValue661;
                precise float sumValue665 = scalarValue129 - sumValue662;
                precise float dotProductValue44 = 1.0 - dot(vec3(sumValue403, sumValue404, sumValue405), vec3(productValue788, productValue789, productValue790));
                precise float nonlinearValue16 = log2(spvNClamp(dotProductValue44, 0.0, 1.0)) * 5.0;
                float exponentialValue12 = exp2(nonlinearValue16);
                precise float productValue794 = sumValue663 * exponentialValue12;
                precise float productValue795 = sumValue664 * exponentialValue12;
                precise float productValue796 = sumValue665 * exponentialValue12;
                precise float sumValue666 = sumValue660 + productValue794;
                precise float sumValue667 = sumValue661 + productValue795;
                precise float sumValue668 = sumValue662 + productValue796;
                precise float dotProductValue45 = dot(vec3(sumValue666, sumValue667, sumValue668), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                precise float dotProductValue46 = dot(vec3(sumValue399, sumValue400, sumValue401), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                uvec4 reinterpretedBits33 = floatBitsToUint(ViewCB.packedValues[91u]);
                uint scalarValue130 = reinterpretedBits33.z;
                float intermediateValue316;
                float intermediateValue317;
                float intermediateValue318;
                float intermediateValue319;
                float intermediateValue320;
                if ((intermediateValue110 == 0u) && (scalarValue130 != 0u))
                {
                    float branchMergedValue36;
                    float branchMergedValue99;
                    float branchMergedValue100;
                    float branchMergedValue101;
                    float branchMergedValue102;
                    float branchMergedValue103;
                    float branchMergedValue104;
                    float branchMergedValue105;
                    if (scalarValue130 == 3u)
                    {
                        branchMergedValue36 = 1.0;
                        branchMergedValue99 = dotProductValue45;
                        branchMergedValue100 = 1.0;
                        branchMergedValue101 = 1.0;
                        branchMergedValue102 = 1.0;
                        branchMergedValue103 = 0.0;
                        branchMergedValue104 = 0.0;
                        branchMergedValue105 = 0.0;
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
                        if (scalarValue130 == 1u)
                        {
                            branchMergedValue185 = 0.0;
                            branchMergedValue211 = 0.0;
                            branchMergedValue212 = 1.0;
                            branchMergedValue213 = 1.0;
                            branchMergedValue214 = 1.0;
                            branchMergedValue215 = 0.0;
                            branchMergedValue216 = 0.0;
                            branchMergedValue217 = 0.0;
                        }
                        else
                        {
                            bool comparisonValue98 = scalarValue130 == 2u;
                            branchMergedValue185 = comparisonValue98 ? 0.0 : dotProductValue46;
                            branchMergedValue211 = comparisonValue98 ? 1.0 : dotProductValue45;
                            branchMergedValue212 = 1.0;
                            branchMergedValue213 = 1.0;
                            branchMergedValue214 = 1.0;
                            branchMergedValue215 = 0.0;
                            branchMergedValue216 = 0.0;
                            branchMergedValue217 = 0.0;
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
                    intermediateValue93 = branchMergedValue105;
                    intermediateValue95 = branchMergedValue104;
                    intermediateValue97 = branchMergedValue103;
                    intermediateValue316 = branchMergedValue102;
                    intermediateValue317 = branchMergedValue101;
                    intermediateValue318 = branchMergedValue100;
                    intermediateValue319 = branchMergedValue99;
                    intermediateValue320 = branchMergedValue36;
                }
                else
                {
                    intermediateValue93 = intermediateValue294;
                    intermediateValue95 = intermediateValue295;
                    intermediateValue97 = intermediateValue296;
                    intermediateValue316 = intermediateValue240;
                    intermediateValue317 = intermediateValue241;
                    intermediateValue318 = intermediateValue242;
                    intermediateValue319 = dotProductValue45;
                    intermediateValue320 = dotProductValue46;
                }
                uint productValue797 = (intermediateValue282 * 1664525u) + 1013904223u;
                precise float bitwiseValue238 = float(productValue797 & 16777215u) * 5.9604644775390625e-08;
                uint productValue798 = (productValue797 * 1664525u) + 1013904223u;
                precise float bitwiseValue239 = float(productValue798 & 16777215u) * 5.9604644775390625e-08;
                uint intermediateValue511;
                float intermediateValue512;
                float intermediateValue513;
                float intermediateValue514;
                if (!(intermediateValue319 <= bitwiseValue238))
                {
                    precise float quotientValue32 = intermediateValue316 / intermediateValue319;
                    precise float quotientValue33 = intermediateValue317 / intermediateValue319;
                    precise float quotientValue34 = intermediateValue318 / intermediateValue319;
                    uint productValue799 = (productValue798 * 1664525u) + 1013904223u;
                    precise float bitwiseValue240 = float(productValue799 & 16777215u) * 5.9604644775390625e-08;
                    float intermediateValue391;
                    float intermediateValue392;
                    float intermediateValue393;
                    float intermediateValue394;
                    float intermediateValue395;
                    float intermediateValue396;
                    bool intermediateValue397;
                    if (intermediateValue221 == 0.0)
                    {
                        precise float scalarValue131 = dot(vec3(intermediateValue76, intermediateValue78, intermediateValue80), vec3(intermediateValue222, intermediateValue224, intermediateValue226)) * 2.0;
                        precise float productValue800 = intermediateValue222 * scalarValue131;
                        precise float productValue801 = intermediateValue224 * scalarValue131;
                        precise float productValue802 = intermediateValue226 * scalarValue131;
                        precise float sumValue669 = intermediateValue76 - productValue800;
                        precise float sumValue670 = intermediateValue78 - productValue801;
                        precise float sumValue671 = intermediateValue80 - productValue802;
                        intermediateValue391 = sumValue669;
                        intermediateValue392 = sumValue670;
                        intermediateValue393 = sumValue671;
                        intermediateValue394 = sumValue666;
                        intermediateValue395 = sumValue667;
                        intermediateValue396 = sumValue668;
                        intermediateValue397 = false;
                    }
                    else
                    {
                        precise float productValue803 = intermediateValue221 * intermediateValue221;
                        float scalarValue132 = spvNMax(0.001000000047497451305389404296875, productValue803);
                        precise float dotProductValue47 = dot(vec3(0.0, 0.0, 1.0), vec3(intermediateValue222, intermediateValue224, intermediateValue226));
                        bool conditionValue30 = dotProductValue47 < 0.0;
                        float comparisonValue99 = conditionValue30 ? (-0.0) : 0.0;
                        float comparisonValue100 = conditionValue30 ? (-1.0) : 1.0;
                        precise float productValue804 = intermediateValue226 * comparisonValue99;
                        precise float productValue805 = intermediateValue224 * comparisonValue100;
                        precise float sumValue672 = productValue804 - productValue805;
                        precise float productValue806 = intermediateValue222 * comparisonValue100;
                        precise float productValue808 = intermediateValue226 * 0.0;
                        precise float sumValue673 = productValue806 - productValue808;
                        precise float productValue809 = intermediateValue224 * 0.0;
                        precise float productValue810 = intermediateValue222 * comparisonValue99;
                        precise float sumValue674 = productValue809 - productValue810;
                        precise float sumValue675 = abs(dotProductValue47) + 1.0;
                        precise float productValue811 = sumValue675 * 0.5;
                        float nonlinearValue17 = sqrt(productValue811);
                        precise float productValue812 = nonlinearValue17 * 2.0;
                        precise float quotientValue35 = sumValue672 / productValue812;
                        precise float quotientValue36 = sumValue673 / productValue812;
                        precise float quotientValue37 = sumValue674 / productValue812;
                        float intermediateValue398;
                        float intermediateValue399;
                        float intermediateValue400;
                        float intermediateValue401;
                        if (conditionValue30)
                        {
                            precise float sumValue676 = (-0.0) - quotientValue36;
                            precise float sumValue677 = (-0.0) - quotientValue35;
                            intermediateValue398 = nonlinearValue17;
                            intermediateValue399 = quotientValue37;
                            intermediateValue400 = sumValue676;
                            intermediateValue401 = sumValue677;
                        }
                        else
                        {
                            intermediateValue398 = quotientValue35;
                            intermediateValue399 = quotientValue36;
                            intermediateValue400 = quotientValue37;
                            intermediateValue401 = nonlinearValue17;
                        }
                        precise float sumValue678 = (-0.0) - intermediateValue398;
                        precise float sumValue679 = (-0.0) - intermediateValue399;
                        precise float sumValue680 = (-0.0) - intermediateValue400;
                        precise float productValue813 = intermediateValue80 * intermediateValue399;
                        precise float productValue814 = intermediateValue78 * intermediateValue400;
                        precise float sumValue681 = productValue813 - productValue814;
                        precise float productValue815 = intermediateValue76 * intermediateValue400;
                        precise float productValue816 = intermediateValue80 * intermediateValue398;
                        precise float sumValue682 = productValue815 - productValue816;
                        precise float productValue817 = intermediateValue78 * intermediateValue398;
                        precise float productValue818 = intermediateValue76 * intermediateValue399;
                        precise float sumValue683 = productValue817 - productValue818;
                        precise float productValue819 = intermediateValue401 * sumValue403;
                        precise float productValue820 = intermediateValue401 * sumValue404;
                        precise float productValue821 = intermediateValue401 * sumValue405;
                        precise float sumValue684 = sumValue681 + productValue819;
                        precise float sumValue685 = sumValue682 + productValue820;
                        precise float sumValue686 = sumValue683 + productValue821;
                        precise float productValue822 = sumValue686 * sumValue679;
                        precise float productValue823 = sumValue685 * sumValue680;
                        precise float sumValue687 = productValue822 - productValue823;
                        precise float productValue824 = sumValue684 * sumValue680;
                        precise float productValue825 = sumValue686 * sumValue678;
                        precise float sumValue688 = productValue824 - productValue825;
                        precise float productValue826 = sumValue685 * sumValue678;
                        precise float productValue827 = sumValue684 * sumValue679;
                        precise float sumValue689 = productValue826 - productValue827;
                        precise float productValue828 = sumValue687 * 2.0;
                        precise float productValue829 = sumValue688 * 2.0;
                        precise float productValue830 = sumValue689 * 2.0;
                        precise float sumValue690 = productValue828 - intermediateValue76;
                        precise float sumValue691 = productValue829 - intermediateValue78;
                        precise float sumValue692 = productValue830 - intermediateValue80;
                        precise float productValue831 = scalarValue132 * sumValue690;
                        precise float productValue832 = scalarValue132 * sumValue691;
                        float inverseLengthValue28 = inversesqrt(dot(vec3(productValue831, productValue832, sumValue692), vec3(productValue831, productValue832, sumValue692)));
                        precise float productValue833 = inverseLengthValue28 * productValue831;
                        precise float productValue834 = inverseLengthValue28 * productValue832;
                        precise float productValue835 = inverseLengthValue28 * sumValue692;
                        bool conditionValue31 = productValue835 < 0.99989998340606689453125;
                        precise float productValue836 = productValue835 * 0.0;
                        precise float sumValue693 = productValue836 - productValue834;
                        precise float sumValue694 = productValue833 - productValue836;
                        precise float productValue837 = productValue834 * 0.0;
                        precise float productValue838 = productValue833 * 0.0;
                        precise float sumValue695 = productValue837 - productValue838;
                        float inverseLengthValue29 = inversesqrt(dot(vec3(sumValue693, sumValue694, sumValue695), vec3(sumValue693, sumValue694, sumValue695)));
                        precise float productValue839 = inverseLengthValue29 * sumValue693;
                        precise float productValue840 = inverseLengthValue29 * sumValue694;
                        precise float productValue841 = inverseLengthValue29 * sumValue695;
                        float comparisonValue101 = conditionValue31 ? productValue839 : 1.0;
                        float comparisonValue102 = conditionValue31 ? productValue840 : 0.0;
                        float comparisonValue103 = conditionValue31 ? productValue841 : 0.0;
                        precise float productValue842 = productValue834 * comparisonValue103;
                        precise float productValue843 = productValue835 * comparisonValue102;
                        precise float sumValue696 = productValue842 - productValue843;
                        precise float productValue844 = productValue835 * comparisonValue101;
                        precise float productValue845 = productValue833 * comparisonValue103;
                        precise float sumValue697 = productValue844 - productValue845;
                        precise float productValue846 = productValue833 * comparisonValue102;
                        precise float productValue847 = productValue834 * comparisonValue101;
                        precise float sumValue698 = productValue846 - productValue847;
                        float nonlinearValue18 = sqrt(bitwiseValue239);
                        precise float productValue848 = bitwiseValue240 * 6.283185482025146484375;
                        precise float wavePhaseValue13 = nonlinearValue18 * cos(productValue848);
                        precise float wavePhaseValue14 = nonlinearValue18 * sin(productValue848);
                        precise float sumValue699 = productValue835 + 1.0;
                        precise float productValue849 = sumValue699 * 0.5;
                        precise float sumValue700 = (-0.0) - wavePhaseValue13;
                        precise float productValue850 = sumValue700 * wavePhaseValue13;
                        precise float sumValue701 = productValue850 + 1.0;
                        float nonlinearValue19 = sqrt(spvNMax(sumValue701, 0.0));
                        precise float sumValue702 = wavePhaseValue14 - nonlinearValue19;
                        precise float productValue851 = productValue849 * sumValue702;
                        precise float sumValue703 = nonlinearValue19 + productValue851;
                        precise float productValue852 = wavePhaseValue13 * comparisonValue101;
                        precise float productValue853 = wavePhaseValue13 * comparisonValue102;
                        precise float productValue854 = wavePhaseValue13 * comparisonValue103;
                        precise float productValue855 = sumValue703 * sumValue696;
                        precise float productValue856 = sumValue703 * sumValue697;
                        precise float productValue857 = sumValue703 * sumValue698;
                        precise float sumValue704 = productValue852 + productValue855;
                        precise float sumValue705 = productValue853 + productValue856;
                        precise float sumValue706 = productValue854 + productValue857;
                        precise float sumValue707 = (-0.0) - sumValue703;
                        precise float productValue858 = sumValue707 * sumValue703;
                        precise float sumValue708 = productValue858 + 1.0;
                        precise float productValue859 = sumValue700 * wavePhaseValue13;
                        precise float sumValue709 = productValue859 + sumValue708;
                        float nonlinearValue20 = sqrt(spvNMax(0.0, sumValue709));
                        precise float productValue860 = productValue833 * nonlinearValue20;
                        precise float productValue861 = productValue834 * nonlinearValue20;
                        precise float productValue862 = productValue835 * nonlinearValue20;
                        precise float sumValue710 = productValue860 + sumValue704;
                        precise float sumValue711 = productValue861 + sumValue705;
                        precise float sumValue712 = sumValue706 + productValue862;
                        precise float productValue863 = scalarValue132 * sumValue710;
                        precise float productValue864 = scalarValue132 * sumValue711;
                        float scalarValue133 = spvNMax(0.0, sumValue712);
                        float inverseLengthValue30 = inversesqrt(dot(vec3(productValue863, productValue864, scalarValue133), vec3(productValue863, productValue864, scalarValue133)));
                        precise float productValue865 = inverseLengthValue30 * productValue863;
                        precise float productValue866 = inverseLengthValue30 * productValue864;
                        precise float productValue867 = scalarValue133 * inverseLengthValue30;
                        precise float sumValue714 = (-0.0) - sumValue690;
                        precise float sumValue715 = (-0.0) - sumValue691;
                        precise float sumValue716 = (-0.0) - sumValue692;
                        precise float dotProductValue48 = dot(vec3(sumValue714, sumValue715, sumValue716), vec3(productValue865, productValue866, productValue867)) * 2.0;
                        precise float productValue868 = dotProductValue48 * productValue865;
                        precise float productValue869 = dotProductValue48 * productValue866;
                        precise float productValue870 = productValue867 * dotProductValue48;
                        precise float sumValue717 = sumValue714 - productValue868;
                        precise float sumValue718 = sumValue715 - productValue869;
                        precise float sumValue719 = sumValue716 - productValue870;
                        float dotProductValue49 = spvNClamp(dot(vec3(productValue865, productValue866, productValue867), vec3(sumValue717, sumValue718, sumValue719)), 0.0, 1.0);
                        bool branchMergedValue37;
                        float branchMergedValue106;
                        float branchMergedValue107;
                        float branchMergedValue108;
                        float branchMergedValue109;
                        float branchMergedValue110;
                        float branchMergedValue111;
                        if (dotProductValue49 < 9.9999997473787516355514526367188e-06)
                        {
                            branchMergedValue37 = true;
                            branchMergedValue106 = 0.0;
                            branchMergedValue107 = 0.0;
                            branchMergedValue108 = 0.0;
                            branchMergedValue109 = 0.0;
                            branchMergedValue110 = 0.0;
                            branchMergedValue111 = 0.0;
                        }
                        else
                        {
                            precise float productValue871 = scalarValue132 * scalarValue132;
                            precise float sumValue720 = 1.0 - intermediateValue228;
                            precise float sumValue721 = 1.0 - intermediateValue229;
                            precise float sumValue722 = 1.0 - intermediateValue230;
                            precise float sumValue723 = 1.0 - spvNMax(0.0, dotProductValue49);
                            precise float nonlinearValue21 = log2(sumValue723) * 5.0;
                            float exponentialValue13 = exp2(nonlinearValue21);
                            precise float productValue872 = sumValue720 * exponentialValue13;
                            precise float productValue873 = sumValue721 * exponentialValue13;
                            precise float productValue874 = sumValue722 * exponentialValue13;
                            precise float sumValue724 = intermediateValue228 + productValue872;
                            precise float sumValue725 = intermediateValue229 + productValue873;
                            precise float sumValue726 = intermediateValue230 + productValue874;
                            precise float productValue875 = sumValue690 * sumValue690;
                            precise float productValue876 = sumValue691 * sumValue691;
                            precise float productValue877 = sumValue692 * sumValue692;
                            precise float dotProductValue50 = dot(vec2(productValue871), vec2(productValue875, productValue876)) / productValue877;
                            precise float sumValue727 = dotProductValue50 + 1.0;
                            precise float nonlinearValue22 = sqrt(sumValue727) * 0.5;
                            precise float sumValue728 = nonlinearValue22 + 0.5;
                            precise float quotientValue38 = 1.0 / sumValue728;
                            precise float productValue878 = sumValue717 * sumValue717;
                            precise float productValue879 = sumValue718 * sumValue718;
                            precise float productValue880 = sumValue719 * sumValue719;
                            precise float dotProductValue51 = dot(vec2(productValue871), vec2(productValue878, productValue879)) / productValue880;
                            precise float sumValue729 = dotProductValue51 + 1.0;
                            precise float nonlinearValue23 = sqrt(sumValue729) * 0.5;
                            precise float sumValue730 = nonlinearValue23 + 0.5;
                            precise float quotientValue39 = 1.0 / sumValue730;
                            precise float sumValue731 = quotientValue38 + quotientValue39;
                            precise float productValue881 = quotientValue38 * quotientValue39;
                            precise float sumValue732 = sumValue731 - productValue881;
                            precise float quotientValue40 = quotientValue39 / sumValue732;
                            precise float productValue882 = sumValue724 * quotientValue40;
                            precise float productValue883 = sumValue725 * quotientValue40;
                            precise float productValue884 = sumValue726 * quotientValue40;
                            precise float productValue885 = intermediateValue399 * sumValue719;
                            precise float productValue886 = intermediateValue400 * sumValue718;
                            precise float sumValue733 = productValue885 - productValue886;
                            precise float productValue887 = intermediateValue400 * sumValue717;
                            precise float productValue888 = intermediateValue398 * sumValue719;
                            precise float sumValue734 = productValue887 - productValue888;
                            precise float productValue889 = intermediateValue398 * sumValue718;
                            precise float productValue890 = intermediateValue399 * sumValue717;
                            precise float sumValue735 = productValue889 - productValue890;
                            precise float productValue891 = intermediateValue401 * sumValue717;
                            precise float productValue892 = intermediateValue401 * sumValue718;
                            precise float productValue893 = intermediateValue401 * sumValue719;
                            precise float sumValue736 = productValue891 + sumValue733;
                            precise float sumValue737 = productValue892 + sumValue734;
                            precise float sumValue738 = productValue893 + sumValue735;
                            precise float productValue894 = intermediateValue399 * sumValue738;
                            precise float productValue895 = intermediateValue400 * sumValue737;
                            precise float sumValue739 = productValue894 - productValue895;
                            precise float productValue896 = intermediateValue400 * sumValue736;
                            precise float productValue897 = intermediateValue398 * sumValue738;
                            precise float sumValue740 = productValue896 - productValue897;
                            precise float productValue898 = intermediateValue398 * sumValue737;
                            precise float productValue899 = intermediateValue399 * sumValue736;
                            precise float sumValue741 = productValue898 - productValue899;
                            precise float productValue900 = sumValue739 * 2.0;
                            precise float productValue901 = sumValue740 * 2.0;
                            precise float productValue902 = sumValue741 * 2.0;
                            precise float sumValue742 = sumValue717 + productValue900;
                            precise float sumValue743 = sumValue718 + productValue901;
                            precise float sumValue744 = sumValue719 + productValue902;
                            branchMergedValue37 = false;
                            branchMergedValue106 = productValue884;
                            branchMergedValue107 = productValue883;
                            branchMergedValue108 = productValue882;
                            branchMergedValue109 = sumValue744;
                            branchMergedValue110 = sumValue743;
                            branchMergedValue111 = sumValue742;
                        }
                        intermediateValue391 = branchMergedValue111;
                        intermediateValue392 = branchMergedValue110;
                        intermediateValue393 = branchMergedValue109;
                        intermediateValue394 = branchMergedValue108;
                        intermediateValue395 = branchMergedValue107;
                        intermediateValue396 = branchMergedValue106;
                        intermediateValue397 = branchMergedValue37;
                    }
                    bool comparisonValue104 = (int(intermediateValue110) > int(0u)) || (scalarValue130 == 0u);
                    precise float productValue903 = quotientValue32 * intermediateValue394;
                    precise float productValue904 = quotientValue33 * intermediateValue395;
                    precise float productValue905 = quotientValue34 * intermediateValue396;
                    float comparisonValue105 = comparisonValue104 ? productValue903 : quotientValue32;
                    float comparisonValue108 = comparisonValue104 ? productValue904 : quotientValue33;
                    float comparisonValue109 = comparisonValue104 ? productValue905 : quotientValue34;
                    if (intermediateValue397)
                    {
                        branchMergedValue = false;
                        branchMergedValue3 = 0.0;
                        branchMergedValue11 = 0.0;
                        branchMergedValue12 = 0.0;
                        branchMergedValue13 = intermediateValue686;
                        branchMergedValue14 = intermediateValue689;
                        branchMergedValue15 = intermediateValue692;
                        break;
                    }
                    rayQueryInitializeEXT(intermediateValue415, SceneBVH, 512u, 109u, vec3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0, vec3(intermediateValue391, intermediateValue392, intermediateValue393), 10000.0);
                    bool conditionValue32 = rayQueryProceedEXT(intermediateValue415);
                    if (conditionValue32)
                    {
                        bool intermediateValue507;
                        bool comparisonValue87;
                        for (;;)
                        {
                            uint scalarValue134 = rayQueryGetIntersectionTypeEXT(intermediateValue415, bool(0u));
                            comparisonValue87 = scalarValue134 == 0u;
                            if (comparisonValue87)
                            {
                                vec2 vectorValue15 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue415, bool(0u));
                                vec2 vectorValue16 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue415, bool(0u));
                                uint scalarValue135 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue415, bool(0u));
                                uint scalarValue136 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue415, bool(0u));
                                uint scalarValue137 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue415, bool(0u));
                                uint productValue906 = (scalarValue137 * 76u) + 58u;
                                uint productValue907 = (scalarValue137 * 76u) + 61u;
                                precise float sumValue745 = 1.0 - vectorValue15.x;
                                precise float sumValue746 = sumValue745 - vectorValue16.y;
                                uint bitwiseValue241 = (objectInstances_2.packedValues[(scalarValue137 * 38u) + 25u] >> 2u) + (scalarValue135 >> 1u);
                                uint productValue908 = uint(objectInstances.packedValues[(scalarValue137 * 76u) + 54u]) + 0u;
                                bool comparisonValue110 = (scalarValue135 & 1u) == 0u;
                                uint comparisonValue111 = comparisonValue110 ? faceUvBuffersRW[nonuniformEXT(productValue908)].packedValues[bitwiseValue241].z : faceUvBuffersRW[nonuniformEXT(productValue908)].packedValues[bitwiseValue241].x;
                                uint comparisonValue112 = comparisonValue110 ? faceUvBuffersRW[nonuniformEXT(productValue908)].packedValues[bitwiseValue241].y : faceUvBuffersRW[nonuniformEXT(productValue908)].packedValues[bitwiseValue241].w;
                                uint comparisonValue113 = comparisonValue110 ? faceUvBuffersRW[nonuniformEXT(productValue908)].packedValues[bitwiseValue241].x : faceUvBuffersRW[nonuniformEXT(productValue908)].packedValues[bitwiseValue241].z;
                                bool conditionValue33 = int16_t(objectInstances.packedValues[productValue907]) < int16_t(0us);
                                float intermediateValue552;
                                float intermediateValue553;
                                if (conditionValue33)
                                {
                                    uint bitwiseValue242 = comparisonValue113 >> 15u;
                                    precise float bitwiseValue243 = float(bitwiseValue242 & 1u) * 2.0;
                                    precise float sumValue747 = bitwiseValue243 + (-1.0);
                                    precise float bitwiseValue244 = float(comparisonValue113 >> 31u) * 2.0;
                                    precise float sumValue748 = bitwiseValue244 + (-1.0);
                                    precise float bitwiseValue245 = float((comparisonValue113 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue246 = float(bitwiseValue242 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue909 = sumValue747 * 3.0517578125e-05;
                                    precise float productValue910 = sumValue748 * 3.0517578125e-05;
                                    precise float sumValue749 = bitwiseValue245 + productValue909;
                                    precise float sumValue750 = bitwiseValue246 + productValue910;
                                    intermediateValue552 = sumValue749;
                                    intermediateValue553 = sumValue750;
                                }
                                else
                                {
                                    precise float bitwiseValue247 = float(comparisonValue113 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue248 = float(comparisonValue113 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue911 = bitwiseValue247 * 16384.0;
                                    precise float sumValue751 = productValue911 + 0.5;
                                    precise float productValue912 = bitwiseValue248 * 16384.0;
                                    precise float sumValue752 = productValue912 + 0.5;
                                    precise float productValue914 = floor(sumValue751) * 6.103515625e-05;
                                    precise float productValue915 = floor(sumValue752) * 6.103515625e-05;
                                    intermediateValue552 = productValue914;
                                    intermediateValue553 = productValue915;
                                }
                                precise float productValue916 = sumValue746 * intermediateValue552;
                                precise float productValue917 = sumValue746 * intermediateValue553;
                                precise float sumValue753 = productValue916 + 0.0;
                                precise float sumValue754 = productValue917 + 0.0;
                                float intermediateValue589;
                                float intermediateValue590;
                                if (conditionValue33)
                                {
                                    uint bitwiseValue249 = comparisonValue112 >> 15u;
                                    precise float bitwiseValue250 = float(bitwiseValue249 & 1u) * 2.0;
                                    precise float sumValue755 = bitwiseValue250 + (-1.0);
                                    precise float bitwiseValue251 = float(comparisonValue112 >> 31u) * 2.0;
                                    precise float sumValue756 = bitwiseValue251 + (-1.0);
                                    precise float bitwiseValue252 = float((comparisonValue112 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue253 = float(bitwiseValue249 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue918 = sumValue755 * 3.0517578125e-05;
                                    precise float productValue919 = sumValue756 * 3.0517578125e-05;
                                    precise float sumValue757 = bitwiseValue252 + productValue918;
                                    precise float sumValue758 = bitwiseValue253 + productValue919;
                                    intermediateValue589 = sumValue757;
                                    intermediateValue590 = sumValue758;
                                }
                                else
                                {
                                    precise float bitwiseValue254 = float(comparisonValue112 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue255 = float(comparisonValue112 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue920 = bitwiseValue254 * 16384.0;
                                    precise float sumValue759 = productValue920 + 0.5;
                                    precise float productValue921 = bitwiseValue255 * 16384.0;
                                    precise float sumValue760 = productValue921 + 0.5;
                                    precise float productValue922 = floor(sumValue759) * 6.103515625e-05;
                                    precise float productValue923 = floor(sumValue760) * 6.103515625e-05;
                                    intermediateValue589 = productValue922;
                                    intermediateValue590 = productValue923;
                                }
                                precise float productValue924 = vectorValue15.x * intermediateValue589;
                                precise float productValue925 = vectorValue15.x * intermediateValue590;
                                precise float sumValue761 = sumValue753 + productValue924;
                                precise float sumValue762 = sumValue754 + productValue925;
                                float intermediateValue625;
                                float intermediateValue626;
                                if (conditionValue33)
                                {
                                    uint bitwiseValue256 = comparisonValue111 >> 15u;
                                    precise float bitwiseValue257 = float(bitwiseValue256 & 1u) * 2.0;
                                    precise float sumValue763 = bitwiseValue257 + (-1.0);
                                    precise float bitwiseValue258 = float(comparisonValue111 >> 31u) * 2.0;
                                    precise float sumValue764 = bitwiseValue258 + (-1.0);
                                    precise float bitwiseValue259 = float((comparisonValue111 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue260 = float(bitwiseValue256 & 65534u) * 1.525902189314365386962890625e-05;
                                    precise float productValue926 = sumValue763 * 3.0517578125e-05;
                                    precise float productValue927 = sumValue764 * 3.0517578125e-05;
                                    precise float sumValue765 = bitwiseValue259 + productValue926;
                                    precise float sumValue767 = bitwiseValue260 + productValue927;
                                    intermediateValue625 = sumValue765;
                                    intermediateValue626 = sumValue767;
                                }
                                else
                                {
                                    precise float bitwiseValue261 = float(comparisonValue111 & 65535u) * 1.525902189314365386962890625e-05;
                                    precise float bitwiseValue262 = float(comparisonValue111 >> 16u) * 1.525902189314365386962890625e-05;
                                    precise float productValue928 = bitwiseValue261 * 16384.0;
                                    precise float sumValue768 = productValue928 + 0.5;
                                    precise float productValue929 = bitwiseValue262 * 16384.0;
                                    precise float sumValue769 = productValue929 + 0.5;
                                    precise float productValue930 = floor(sumValue768) * 6.103515625e-05;
                                    precise float productValue931 = floor(sumValue769) * 6.103515625e-05;
                                    intermediateValue625 = productValue930;
                                    intermediateValue626 = productValue931;
                                }
                                precise float productValue932 = vectorValue16.y * intermediateValue625;
                                precise float productValue933 = vectorValue16.y * intermediateValue626;
                                precise float sumValue770 = sumValue761 + productValue932;
                                precise float sumValue771 = sumValue762 + productValue933;
                                float intermediateValue631;
                                if (objectInstances.packedValues[productValue906] == 65535us)
                                {
                                    intermediateValue631 = 1.0;
                                }
                                else
                                {
                                    uint reinterpretedBits49;
                                    if (objectInstances.packedValues[productValue906] > 4095us)
                                    {
                                        reinterpretedBits49 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                    }
                                    else
                                    {
                                        reinterpretedBits49 = uint(objectInstances.packedValues[productValue906]);
                                    }
                                    intermediateValue631 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits49 + 0u], defaultSampler)), vec2(sumValue770, sumValue771), -0.25).w;
                                }
                                uint comparisonValue133;
                                if (scalarValue136 == 2u)
                                {
                                    comparisonValue133 = 0u;
                                }
                                else
                                {
                                    comparisonValue133 = uint(intermediateValue631 <= (((objectInstances.packedValues[productValue907] & 4352us) != 0us) ? 0.5 : 0.0));
                                }
                                if (comparisonValue133 == 0u)
                                {
                                    rayQueryConfirmIntersectionEXT(intermediateValue415);
                                }
                            }
                            intermediateValue507 = rayQueryProceedEXT(intermediateValue415);
                            if (intermediateValue507)
                            {
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    uint scalarValue138 = rayQueryGetIntersectionTypeEXT(intermediateValue415, bool(1u));
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
                    if (scalarValue138 == 1u)
                    {
                        vec2 vectorValue17 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue415, bool(1u));
                        vec2 vectorValue18 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue415, bool(1u));
                        float scalarValue139 = rayQueryGetIntersectionTEXT(intermediateValue415, bool(1u));
                        uint scalarValue140 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue415, bool(1u));
                        uint scalarValue141 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue415, bool(1u));
                        uint scalarValue142 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue415, bool(1u));
                        branchMergedValue41 = intermediateValue106;
                        branchMergedValue131 = intermediateValue104;
                        branchMergedValue132 = comparisonValue109;
                        branchMergedValue133 = comparisonValue108;
                        branchMergedValue134 = comparisonValue105;
                        branchMergedValue135 = productValue799;
                        branchMergedValue136 = ((scalarValue141 << 30u) | ((scalarValue140 << 14u) & 1073725440u)) | (scalarValue142 & 16383u);
                        branchMergedValue137 = scalarValue139;
                        branchMergedValue138 = vectorValue18.y;
                        branchMergedValue139 = vectorValue17.x;
                        branchMergedValue158 = 2u;
                        branchMergedValue159 = intermediateValue392;
                        branchMergedValue160 = intermediateValue391;
                        branchMergedValue161 = intermediateValue393;
                    }
                    else
                    {
                        branchMergedValue41 = intermediateValue106;
                        branchMergedValue131 = intermediateValue104;
                        branchMergedValue132 = comparisonValue109;
                        branchMergedValue133 = comparisonValue108;
                        branchMergedValue134 = comparisonValue105;
                        branchMergedValue135 = productValue799;
                        branchMergedValue136 = intermediateValue88 | 1073741823u;
                        branchMergedValue137 = 10000.0;
                        branchMergedValue138 = 0.0;
                        branchMergedValue139 = 0.0;
                        branchMergedValue158 = 2u;
                        branchMergedValue159 = intermediateValue392;
                        branchMergedValue160 = intermediateValue391;
                        branchMergedValue161 = intermediateValue393;
                    }
                    intermediateValue77 = branchMergedValue160;
                    intermediateValue79 = branchMergedValue159;
                    intermediateValue81 = branchMergedValue161;
                    intermediateValue83 = branchMergedValue139;
                    intermediateValue85 = branchMergedValue138;
                    intermediateValue87 = branchMergedValue137;
                    intermediateValue89 = branchMergedValue136;
                    intermediateValue511 = branchMergedValue135;
                    intermediateValue512 = branchMergedValue134;
                    intermediateValue513 = branchMergedValue133;
                    intermediateValue514 = branchMergedValue132;
                    intermediateValue105 = branchMergedValue131;
                    intermediateValue107 = branchMergedValue41;
                    intermediateValue109 = branchMergedValue158;
                }
                else
                {
                    precise float sumValue772 = 1.0 - intermediateValue319;
                    precise float quotientValue41 = intermediateValue316 / sumValue772;
                    precise float quotientValue42 = intermediateValue317 / sumValue772;
                    precise float quotientValue43 = intermediateValue318 / sumValue772;
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
                    if (!(intermediateValue320 <= bitwiseValue239))
                    {
                        precise float quotientValue44 = quotientValue41 / intermediateValue320;
                        precise float quotientValue45 = quotientValue42 / intermediateValue320;
                        precise float quotientValue46 = quotientValue43 / intermediateValue320;
                        precise float productValue934 = dotProductValue3 * dotProductValue3;
                        precise float sumValue773 = 1.0 - productValue934;
                        float intermediateValue473;
                        float intermediateValue474;
                        float intermediateValue475;
                        float reinterpretedBits39;
                        float reinterpretedBits40;
                        float reinterpretedBits41;
                        uint intermediateValue476;
                        uint intermediateValue477;
                        uint intermediateValue478;
                        bool intermediateValue479;
                        float intermediateValue480;
                        if (intermediateValue106 == 0u)
                        {
                            precise float scalarValue143 = (-0.0) - dotProductValue3;
                            precise float productValue935 = sumValue773 * 0.565323054790496826171875;
                            float intermediateValue444;
                            float intermediateValue445;
                            float intermediateValue446;
                            if (productValue935 > 1.0)
                            {
                                precise float productValue936 = dotProductValue3 * (-2.0);
                                precise float productValue937 = comparisonValue15 * productValue936;
                                precise float productValue938 = comparisonValue16 * productValue936;
                                precise float productValue939 = comparisonValue17 * productValue936;
                                precise float sumValue774 = intermediateValue76 + productValue937;
                                precise float sumValue775 = intermediateValue78 + productValue938;
                                precise float sumValue776 = intermediateValue80 + productValue939;
                                intermediateValue444 = sumValue774;
                                intermediateValue445 = sumValue775;
                                intermediateValue446 = sumValue776;
                            }
                            else
                            {
                                precise float sumValue777 = 1.0 - productValue935;
                                precise float productValue940 = intermediateValue76 * 0.75187969207763671875;
                                precise float productValue941 = intermediateValue78 * 0.75187969207763671875;
                                precise float productValue942 = intermediateValue80 * 0.75187969207763671875;
                                precise float productValue943 = dotProductValue3 * (-0.75187969207763671875);
                                precise float nonlinearValue24 = productValue943 - sqrt(sumValue777);
                                precise float productValue944 = comparisonValue15 * nonlinearValue24;
                                precise float productValue945 = comparisonValue16 * nonlinearValue24;
                                precise float productValue946 = comparisonValue17 * nonlinearValue24;
                                precise float sumValue778 = productValue940 + productValue944;
                                precise float sumValue779 = productValue941 + productValue945;
                                precise float sumValue780 = productValue942 + productValue946;
                                intermediateValue444 = sumValue778;
                                intermediateValue445 = sumValue779;
                                intermediateValue446 = sumValue780;
                            }
                            uint productValue947 = uint(int(comparisonValue15 * (-256.0)));
                            uint productValue948 = uint(int(comparisonValue16 * (-256.0)));
                            uint productValue949 = uint(int(comparisonValue17 * (-256.0)));
                            intermediateValue473 = intermediateValue444;
                            intermediateValue474 = intermediateValue445;
                            intermediateValue475 = intermediateValue446;
                            reinterpretedBits39 = conditionValue13 ? (sumValue211 - productValue484) : uintBitsToFloat((conditionValue10 ? (-productValue947) : productValue947) + reinterpretedBits22);
                            reinterpretedBits40 = conditionValue14 ? (sumValue214 - productValue485) : uintBitsToFloat((conditionValue11 ? (-productValue948) : productValue948) + reinterpretedBits26);
                            reinterpretedBits41 = conditionValue15 ? (sumValue217 - productValue486) : uintBitsToFloat((conditionValue12 ? (-productValue949) : productValue949) + reinterpretedBits27);
                            intermediateValue476 = uint(conditionValue6);
                            intermediateValue477 = 1u;
                            intermediateValue478 = 0u;
                            intermediateValue479 = true;
                            intermediateValue480 = scalarValue143;
                        }
                        else
                        {
                            precise float productValue950 = sumValue773 * 1.7689001560211181640625;
                            bool conditionValue34 = productValue950 > 1.0;
                            float intermediateValue447;
                            float intermediateValue448;
                            float intermediateValue449;
                            if (conditionValue34)
                            {
                                precise float productValue951 = dotProductValue3 * (-2.0);
                                precise float productValue952 = comparisonValue15 * productValue951;
                                precise float productValue953 = comparisonValue16 * productValue951;
                                precise float productValue954 = comparisonValue17 * productValue951;
                                precise float sumValue781 = intermediateValue76 + productValue952;
                                precise float sumValue782 = intermediateValue78 + productValue953;
                                precise float sumValue783 = intermediateValue80 + productValue954;
                                intermediateValue447 = sumValue781;
                                intermediateValue448 = sumValue782;
                                intermediateValue449 = sumValue783;
                            }
                            else
                            {
                                precise float sumValue784 = 1.0 - productValue950;
                                precise float productValue955 = intermediateValue76 * 1.33000004291534423828125;
                                precise float productValue956 = intermediateValue78 * 1.33000004291534423828125;
                                precise float productValue957 = intermediateValue80 * 1.33000004291534423828125;
                                precise float productValue958 = dotProductValue3 * (-1.33000004291534423828125);
                                precise float nonlinearValue25 = productValue958 - sqrt(sumValue784);
                                precise float productValue959 = comparisonValue15 * nonlinearValue25;
                                precise float productValue960 = comparisonValue16 * nonlinearValue25;
                                precise float productValue961 = comparisonValue17 * nonlinearValue25;
                                precise float sumValue785 = productValue955 + productValue959;
                                precise float sumValue786 = productValue956 + productValue960;
                                precise float sumValue787 = productValue957 + productValue961;
                                intermediateValue447 = sumValue785;
                                intermediateValue448 = sumValue786;
                                intermediateValue449 = sumValue787;
                            }
                            uint scalarValue144 = uint(conditionValue34);
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
                            if (conditionValue34)
                            {
                                precise float dotProductValue52 = dot(vec3(sumValue403, sumValue404, sumValue405), vec3(comparisonValue15, comparisonValue16, comparisonValue17)) * 2.0;
                                precise float productValue962 = comparisonValue15 * dotProductValue52;
                                precise float productValue963 = comparisonValue16 * dotProductValue52;
                                precise float productValue964 = comparisonValue17 * dotProductValue52;
                                precise float sumValue788 = sumValue403 - productValue962;
                                precise float sumValue789 = sumValue404 - productValue963;
                                precise float sumValue790 = sumValue405 - productValue964;
                                precise float sumValue791 = (-0.0) - sumValue788;
                                precise float sumValue792 = (-0.0) - sumValue789;
                                precise float sumValue793 = (-0.0) - sumValue790;
                                branchMergedValue38 = 0.0;
                                branchMergedValue112 = false;
                                branchMergedValue113 = intermediateValue106;
                                branchMergedValue114 = intermediateValue104;
                                branchMergedValue115 = reinterpretedBits30;
                                branchMergedValue116 = reinterpretedBits29;
                                branchMergedValue117 = reinterpretedBits28;
                                branchMergedValue118 = sumValue793;
                                branchMergedValue119 = scalarValue144;
                                branchMergedValue120 = sumValue791;
                                branchMergedValue153 = sumValue792;
                            }
                            else
                            {
                                uint productValue965 = uint(int(comparisonValue15 * (-256.0)));
                                uint productValue966 = uint(int(comparisonValue16 * (-256.0)));
                                uint productValue967 = uint(int(comparisonValue17 * (-256.0)));
                                precise float dotProductValue53 = (-0.0) - dot(vec3(intermediateValue447, intermediateValue448, intermediateValue449), vec3(comparisonValue15, comparisonValue16, comparisonValue17));
                                branchMergedValue38 = dotProductValue53;
                                branchMergedValue112 = true;
                                branchMergedValue113 = 0u;
                                branchMergedValue114 = 0u;
                                branchMergedValue115 = conditionValue15 ? (sumValue217 - productValue486) : uintBitsToFloat((conditionValue12 ? (-productValue967) : productValue967) + reinterpretedBits27);
                                branchMergedValue116 = conditionValue14 ? (sumValue214 - productValue485) : uintBitsToFloat((conditionValue11 ? (-productValue966) : productValue966) + reinterpretedBits26);
                                branchMergedValue117 = conditionValue13 ? (sumValue211 - productValue484) : uintBitsToFloat((conditionValue10 ? (-productValue965) : productValue965) + reinterpretedBits22);
                                branchMergedValue118 = intermediateValue449;
                                branchMergedValue119 = scalarValue144;
                                branchMergedValue120 = intermediateValue447;
                                branchMergedValue153 = intermediateValue448;
                            }
                            intermediateValue473 = branchMergedValue120;
                            intermediateValue474 = branchMergedValue153;
                            intermediateValue475 = branchMergedValue118;
                            reinterpretedBits39 = branchMergedValue117;
                            reinterpretedBits40 = branchMergedValue116;
                            reinterpretedBits41 = branchMergedValue115;
                            intermediateValue476 = branchMergedValue114;
                            intermediateValue477 = branchMergedValue113;
                            intermediateValue478 = branchMergedValue119;
                            intermediateValue479 = branchMergedValue112;
                            intermediateValue480 = branchMergedValue38;
                        }
                        bool comparisonValue114 = intermediateValue478 != 0u;
                        float comparisonValue115 = comparisonValue114 ? 1.0 : sumValue399;
                        float comparisonValue116 = comparisonValue114 ? 1.0 : sumValue400;
                        float comparisonValue117 = comparisonValue114 ? 1.0 : sumValue401;
                        float intermediateValue515;
                        float intermediateValue516;
                        float intermediateValue517;
                        if (intermediateValue479)
                        {
                            precise float sumValue794 = 1.0 - intermediateValue480;
                            precise float nonlinearValue26 = log2(spvNClamp(sumValue794, 0.0, 1.0)) * 5.0;
                            precise float exponentialValue14 = exp2(nonlinearValue26) * 0.980000019073486328125;
                            precise float sumValue795 = exponentialValue14 + 0.0199999995529651641845703125;
                            precise float sumValue796 = 1.0 - sumValue795;
                            precise float productValue968 = comparisonValue115 * sumValue796;
                            precise float productValue969 = comparisonValue116 * sumValue796;
                            precise float productValue970 = comparisonValue117 * sumValue796;
                            intermediateValue515 = productValue968;
                            intermediateValue516 = productValue969;
                            intermediateValue517 = productValue970;
                        }
                        else
                        {
                            intermediateValue515 = comparisonValue115;
                            intermediateValue516 = comparisonValue116;
                            intermediateValue517 = comparisonValue117;
                        }
                        rayQueryInitializeEXT(intermediateValue518, SceneBVH, 512u, 109u, vec3(reinterpretedBits39, reinterpretedBits40, reinterpretedBits41), 0.0, vec3(intermediateValue473, intermediateValue474, intermediateValue475), 10000.0);
                        bool conditionValue35 = rayQueryProceedEXT(intermediateValue518);
                        if (conditionValue35)
                        {
                            bool intermediateValue580;
                            bool comparisonValue119;
                            for (;;)
                            {
                                uint scalarValue145 = rayQueryGetIntersectionTypeEXT(intermediateValue518, bool(0u));
                                comparisonValue119 = scalarValue145 == 0u;
                                if (comparisonValue119)
                                {
                                    vec2 vectorValue19 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue518, bool(0u));
                                    vec2 vectorValue20 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue518, bool(0u));
                                    uint scalarValue146 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue518, bool(0u));
                                    uint scalarValue147 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue518, bool(0u));
                                    uint scalarValue148 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue518, bool(0u));
                                    uint productValue972 = (scalarValue148 * 76u) + 58u;
                                    uint productValue973 = (scalarValue148 * 76u) + 61u;
                                    precise float sumValue797 = 1.0 - vectorValue19.x;
                                    precise float sumValue798 = sumValue797 - vectorValue20.y;
                                    uint bitwiseValue263 = (objectInstances_2.packedValues[(scalarValue148 * 38u) + 25u] >> 2u) + (scalarValue146 >> 1u);
                                    uint productValue974 = uint(objectInstances.packedValues[(scalarValue148 * 76u) + 54u]) + 0u;
                                    bool comparisonValue118 = (scalarValue146 & 1u) == 0u;
                                    uint comparisonValue120 = comparisonValue118 ? faceUvBuffersRW[nonuniformEXT(productValue974)].packedValues[bitwiseValue263].z : faceUvBuffersRW[nonuniformEXT(productValue974)].packedValues[bitwiseValue263].x;
                                    uint comparisonValue121 = comparisonValue118 ? faceUvBuffersRW[nonuniformEXT(productValue974)].packedValues[bitwiseValue263].y : faceUvBuffersRW[nonuniformEXT(productValue974)].packedValues[bitwiseValue263].w;
                                    uint comparisonValue122 = comparisonValue118 ? faceUvBuffersRW[nonuniformEXT(productValue974)].packedValues[bitwiseValue263].x : faceUvBuffersRW[nonuniformEXT(productValue974)].packedValues[bitwiseValue263].z;
                                    bool conditionValue36 = int16_t(objectInstances.packedValues[productValue973]) < int16_t(0us);
                                    float intermediateValue613;
                                    float intermediateValue614;
                                    if (conditionValue36)
                                    {
                                        uint bitwiseValue264 = comparisonValue122 >> 15u;
                                        precise float bitwiseValue265 = float(bitwiseValue264 & 1u) * 2.0;
                                        precise float sumValue799 = bitwiseValue265 + (-1.0);
                                        precise float bitwiseValue266 = float(comparisonValue122 >> 31u) * 2.0;
                                        precise float sumValue800 = bitwiseValue266 + (-1.0);
                                        precise float bitwiseValue267 = float((comparisonValue122 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue268 = float(bitwiseValue264 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue975 = sumValue799 * 3.0517578125e-05;
                                        precise float productValue976 = sumValue800 * 3.0517578125e-05;
                                        precise float sumValue801 = bitwiseValue267 + productValue975;
                                        precise float sumValue802 = bitwiseValue268 + productValue976;
                                        intermediateValue613 = sumValue801;
                                        intermediateValue614 = sumValue802;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue269 = float(comparisonValue122 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue270 = float(comparisonValue122 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue977 = bitwiseValue269 * 16384.0;
                                        precise float sumValue803 = productValue977 + 0.5;
                                        precise float productValue978 = bitwiseValue270 * 16384.0;
                                        precise float sumValue804 = productValue978 + 0.5;
                                        precise float productValue979 = floor(sumValue803) * 6.103515625e-05;
                                        precise float productValue980 = floor(sumValue804) * 6.103515625e-05;
                                        intermediateValue613 = productValue979;
                                        intermediateValue614 = productValue980;
                                    }
                                    precise float productValue981 = sumValue798 * intermediateValue613;
                                    precise float productValue982 = sumValue798 * intermediateValue614;
                                    precise float sumValue805 = productValue981 + 0.0;
                                    precise float sumValue806 = productValue982 + 0.0;
                                    float intermediateValue632;
                                    float intermediateValue633;
                                    if (conditionValue36)
                                    {
                                        uint bitwiseValue271 = comparisonValue121 >> 15u;
                                        precise float bitwiseValue272 = float(bitwiseValue271 & 1u) * 2.0;
                                        precise float sumValue807 = bitwiseValue272 + (-1.0);
                                        precise float bitwiseValue273 = float(comparisonValue121 >> 31u) * 2.0;
                                        precise float sumValue808 = bitwiseValue273 + (-1.0);
                                        precise float bitwiseValue274 = float((comparisonValue121 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue275 = float(bitwiseValue271 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue983 = sumValue807 * 3.0517578125e-05;
                                        precise float productValue984 = sumValue808 * 3.0517578125e-05;
                                        precise float sumValue809 = bitwiseValue274 + productValue983;
                                        precise float sumValue810 = bitwiseValue275 + productValue984;
                                        intermediateValue632 = sumValue809;
                                        intermediateValue633 = sumValue810;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue276 = float(comparisonValue121 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue277 = float(comparisonValue121 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue985 = bitwiseValue276 * 16384.0;
                                        precise float sumValue811 = productValue985 + 0.5;
                                        precise float productValue986 = bitwiseValue277 * 16384.0;
                                        precise float sumValue812 = productValue986 + 0.5;
                                        precise float productValue987 = floor(sumValue811) * 6.103515625e-05;
                                        precise float productValue988 = floor(sumValue812) * 6.103515625e-05;
                                        intermediateValue632 = productValue987;
                                        intermediateValue633 = productValue988;
                                    }
                                    precise float productValue989 = vectorValue19.x * intermediateValue632;
                                    precise float productValue990 = vectorValue19.x * intermediateValue633;
                                    precise float sumValue813 = sumValue805 + productValue989;
                                    precise float sumValue814 = sumValue806 + productValue990;
                                    float intermediateValue652;
                                    float intermediateValue653;
                                    if (conditionValue36)
                                    {
                                        uint bitwiseValue278 = comparisonValue120 >> 15u;
                                        precise float bitwiseValue279 = float(bitwiseValue278 & 1u) * 2.0;
                                        precise float sumValue815 = bitwiseValue279 + (-1.0);
                                        precise float bitwiseValue280 = float(comparisonValue120 >> 31u) * 2.0;
                                        precise float sumValue817 = bitwiseValue280 + (-1.0);
                                        precise float bitwiseValue281 = float((comparisonValue120 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue282 = float(bitwiseValue278 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue991 = sumValue815 * 3.0517578125e-05;
                                        precise float productValue992 = sumValue817 * 3.0517578125e-05;
                                        precise float sumValue818 = bitwiseValue281 + productValue991;
                                        precise float sumValue819 = bitwiseValue282 + productValue992;
                                        intermediateValue652 = sumValue818;
                                        intermediateValue653 = sumValue819;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue283 = float(comparisonValue120 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue284 = float(comparisonValue120 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue993 = bitwiseValue283 * 16384.0;
                                        precise float sumValue820 = productValue993 + 0.5;
                                        precise float productValue994 = bitwiseValue284 * 16384.0;
                                        precise float sumValue821 = productValue994 + 0.5;
                                        precise float productValue995 = floor(sumValue820) * 6.103515625e-05;
                                        precise float productValue996 = floor(sumValue821) * 6.103515625e-05;
                                        intermediateValue652 = productValue995;
                                        intermediateValue653 = productValue996;
                                    }
                                    precise float productValue997 = vectorValue20.y * intermediateValue652;
                                    precise float productValue998 = vectorValue20.y * intermediateValue653;
                                    precise float sumValue822 = sumValue813 + productValue997;
                                    precise float sumValue823 = sumValue814 + productValue998;
                                    float intermediateValue657;
                                    if (objectInstances.packedValues[productValue972] == 65535us)
                                    {
                                        intermediateValue657 = 1.0;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits51;
                                        if (objectInstances.packedValues[productValue972] > 4095us)
                                        {
                                            reinterpretedBits51 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits51 = uint(objectInstances.packedValues[productValue972]);
                                        }
                                        intermediateValue657 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits51 + 0u], defaultSampler)), vec2(sumValue822, sumValue823), -0.25).w;
                                    }
                                    uint comparisonValue138;
                                    if (scalarValue147 == 2u)
                                    {
                                        comparisonValue138 = 0u;
                                    }
                                    else
                                    {
                                        comparisonValue138 = uint(intermediateValue657 <= (((objectInstances.packedValues[productValue973] & 4352us) != 0us) ? 0.5 : 0.0));
                                    }
                                    if (comparisonValue138 == 0u)
                                    {
                                        rayQueryConfirmIntersectionEXT(intermediateValue518);
                                    }
                                }
                                intermediateValue580 = rayQueryProceedEXT(intermediateValue518);
                                if (intermediateValue580)
                                {
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        uint scalarValue149 = rayQueryGetIntersectionTypeEXT(intermediateValue518, bool(1u));
                        float intermediateValue508;
                        float intermediateValue509;
                        float intermediateValue510;
                        uint bitwiseValue198;
                        if (scalarValue149 == 1u)
                        {
                            vec2 vectorValue21 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue518, bool(1u));
                            vec2 vectorValue22 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue518, bool(1u));
                            float scalarValue150 = rayQueryGetIntersectionTEXT(intermediateValue518, bool(1u));
                            uint scalarValue151 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue518, bool(1u));
                            uint scalarValue152 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue518, bool(1u));
                            uint scalarValue153 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue518, bool(1u));
                            intermediateValue508 = vectorValue21.x;
                            intermediateValue509 = vectorValue22.y;
                            intermediateValue510 = scalarValue150;
                            bitwiseValue198 = ((scalarValue152 << 30u) | ((scalarValue151 << 14u) & 1073725440u)) | (scalarValue153 & 16383u);
                        }
                        else
                        {
                            intermediateValue508 = 0.0;
                            intermediateValue509 = 0.0;
                            intermediateValue510 = 10000.0;
                            bitwiseValue198 = intermediateValue88 | 1073741823u;
                        }
                        precise float productValue999 = quotientValue44 * intermediateValue515;
                        precise float productValue1000 = quotientValue45 * intermediateValue516;
                        precise float productValue1001 = quotientValue46 * intermediateValue517;
                        branchMergedValue40 = intermediateValue477;
                        branchMergedValue122 = intermediateValue476;
                        branchMergedValue123 = productValue1001;
                        branchMergedValue124 = productValue1000;
                        branchMergedValue125 = productValue999;
                        branchMergedValue126 = productValue798;
                        branchMergedValue127 = bitwiseValue198;
                        branchMergedValue128 = intermediateValue510;
                        branchMergedValue129 = intermediateValue509;
                        branchMergedValue130 = intermediateValue508;
                        branchMergedValue154 = 3u;
                        branchMergedValue155 = intermediateValue474;
                        branchMergedValue156 = intermediateValue473;
                        branchMergedValue157 = intermediateValue475;
                    }
                    else
                    {
                        precise float sumValue824 = 1.0 - intermediateValue320;
                        precise float quotientValue47 = quotientValue41 / sumValue824;
                        precise float quotientValue48 = quotientValue42 / sumValue824;
                        precise float quotientValue49 = quotientValue43 / sumValue824;
                        precise float productValue1002 = intermediateValue219 * quotientValue47;
                        precise float productValue1003 = intermediateValue219 * quotientValue48;
                        precise float productValue1004 = intermediateValue219 * quotientValue49;
                        uint productValue1005 = (productValue798 * 1664525u) + 1013904223u;
                        precise float bitwiseValue285 = float(productValue1005 & 16777215u) * 5.9604644775390625e-08;
                        uint productValue1006 = (productValue1005 * 1664525u) + 1013904223u;
                        precise float bitwiseValue286 = float(productValue1006 & 16777215u) * 5.9604644775390625e-08;
                        float nonlinearValue27 = sqrt(bitwiseValue285);
                        precise float productValue1007 = bitwiseValue286 * 6.283185482025146484375;
                        precise float wavePhaseValue15 = nonlinearValue27 * cos(productValue1007);
                        precise float wavePhaseValue16 = nonlinearValue27 * sin(productValue1007);
                        precise float sumValue825 = 1.0 - bitwiseValue285;
                        float nonlinearValue28 = sqrt(sumValue825);
                        precise float productValue1008 = productValue775 * wavePhaseValue15;
                        precise float productValue1009 = wavePhaseValue16 * sumValue645;
                        precise float sumValue826 = productValue1009 + productValue1008;
                        precise float productValue1010 = nonlinearValue28 * intermediateValue222;
                        precise float sumValue827 = productValue1010 + sumValue826;
                        precise float productValue1011 = productValue776 * wavePhaseValue15;
                        precise float productValue1012 = wavePhaseValue16 * sumValue646;
                        precise float sumValue828 = productValue1012 + productValue1011;
                        precise float productValue1013 = nonlinearValue28 * intermediateValue224;
                        precise float sumValue829 = productValue1013 + sumValue828;
                        precise float productValue1014 = productValue777 * wavePhaseValue15;
                        precise float productValue1015 = wavePhaseValue16 * sumValue647;
                        precise float sumValue830 = productValue1015 + productValue1014;
                        precise float productValue1016 = nonlinearValue28 * intermediateValue226;
                        precise float sumValue831 = productValue1016 + sumValue830;
                        rayQueryInitializeEXT(intermediateValue357, SceneBVH, 512u, 69u, vec3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0, vec3(sumValue827, sumValue829, sumValue831), 10000.0);
                        bool conditionValue37 = rayQueryProceedEXT(intermediateValue357);
                        if (conditionValue37)
                        {
                            bool intermediateValue457;
                            bool comparisonValue77;
                            for (;;)
                            {
                                uint scalarValue154 = rayQueryGetIntersectionTypeEXT(intermediateValue357, bool(0u));
                                comparisonValue77 = scalarValue154 == 0u;
                                if (comparisonValue77)
                                {
                                    vec2 vectorValue23 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue357, bool(0u));
                                    vec2 vectorValue24 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue357, bool(0u));
                                    uint scalarValue155 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue357, bool(0u));
                                    uint scalarValue156 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue357, bool(0u));
                                    uint scalarValue157 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue357, bool(0u));
                                    uint productValue1017 = (scalarValue157 * 76u) + 58u;
                                    uint productValue1019 = (scalarValue157 * 76u) + 61u;
                                    precise float sumValue832 = 1.0 - vectorValue23.x;
                                    precise float sumValue833 = sumValue832 - vectorValue24.y;
                                    uint bitwiseValue287 = (objectInstances_2.packedValues[(scalarValue157 * 38u) + 25u] >> 2u) + (scalarValue155 >> 1u);
                                    uint productValue1020 = uint(objectInstances.packedValues[(scalarValue157 * 76u) + 54u]) + 0u;
                                    bool comparisonValue123 = (scalarValue155 & 1u) == 0u;
                                    uint comparisonValue124 = comparisonValue123 ? faceUvBuffersRW[nonuniformEXT(productValue1020)].packedValues[bitwiseValue287].z : faceUvBuffersRW[nonuniformEXT(productValue1020)].packedValues[bitwiseValue287].x;
                                    uint comparisonValue125 = comparisonValue123 ? faceUvBuffersRW[nonuniformEXT(productValue1020)].packedValues[bitwiseValue287].y : faceUvBuffersRW[nonuniformEXT(productValue1020)].packedValues[bitwiseValue287].w;
                                    uint comparisonValue126 = comparisonValue123 ? faceUvBuffersRW[nonuniformEXT(productValue1020)].packedValues[bitwiseValue287].x : faceUvBuffersRW[nonuniformEXT(productValue1020)].packedValues[bitwiseValue287].z;
                                    bool conditionValue38 = int16_t(objectInstances.packedValues[productValue1019]) < int16_t(0us);
                                    float intermediateValue520;
                                    float intermediateValue521;
                                    if (conditionValue38)
                                    {
                                        uint bitwiseValue288 = comparisonValue126 >> 15u;
                                        precise float bitwiseValue289 = float(bitwiseValue288 & 1u) * 2.0;
                                        precise float sumValue834 = bitwiseValue289 + (-1.0);
                                        precise float bitwiseValue290 = float(comparisonValue126 >> 31u) * 2.0;
                                        precise float sumValue835 = bitwiseValue290 + (-1.0);
                                        precise float bitwiseValue291 = float((comparisonValue126 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue292 = float(bitwiseValue288 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1021 = sumValue834 * 3.0517578125e-05;
                                        precise float productValue1022 = sumValue835 * 3.0517578125e-05;
                                        precise float sumValue836 = bitwiseValue291 + productValue1021;
                                        precise float sumValue837 = bitwiseValue292 + productValue1022;
                                        intermediateValue520 = sumValue836;
                                        intermediateValue521 = sumValue837;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue293 = float(comparisonValue126 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue294 = float(comparisonValue126 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1023 = bitwiseValue293 * 16384.0;
                                        precise float sumValue838 = productValue1023 + 0.5;
                                        precise float productValue1024 = bitwiseValue294 * 16384.0;
                                        precise float sumValue839 = productValue1024 + 0.5;
                                        precise float productValue1025 = floor(sumValue838) * 6.103515625e-05;
                                        precise float productValue1026 = floor(sumValue839) * 6.103515625e-05;
                                        intermediateValue520 = productValue1025;
                                        intermediateValue521 = productValue1026;
                                    }
                                    precise float productValue1027 = sumValue833 * intermediateValue520;
                                    precise float productValue1028 = sumValue833 * intermediateValue521;
                                    precise float sumValue840 = productValue1027 + 0.0;
                                    precise float sumValue841 = productValue1028 + 0.0;
                                    float intermediateValue561;
                                    float intermediateValue562;
                                    if (conditionValue38)
                                    {
                                        uint bitwiseValue295 = comparisonValue125 >> 15u;
                                        precise float bitwiseValue296 = float(bitwiseValue295 & 1u) * 2.0;
                                        precise float sumValue842 = bitwiseValue296 + (-1.0);
                                        precise float bitwiseValue297 = float(comparisonValue125 >> 31u) * 2.0;
                                        precise float sumValue843 = bitwiseValue297 + (-1.0);
                                        precise float bitwiseValue298 = float((comparisonValue125 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue299 = float(bitwiseValue295 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1029 = sumValue842 * 3.0517578125e-05;
                                        precise float productValue1030 = sumValue843 * 3.0517578125e-05;
                                        precise float sumValue844 = bitwiseValue298 + productValue1029;
                                        precise float sumValue845 = bitwiseValue299 + productValue1030;
                                        intermediateValue561 = sumValue844;
                                        intermediateValue562 = sumValue845;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue300 = float(comparisonValue125 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue301 = float(comparisonValue125 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1031 = bitwiseValue300 * 16384.0;
                                        precise float sumValue846 = productValue1031 + 0.5;
                                        precise float productValue1032 = bitwiseValue301 * 16384.0;
                                        precise float sumValue847 = productValue1032 + 0.5;
                                        precise float productValue1033 = floor(sumValue846) * 6.103515625e-05;
                                        precise float productValue1034 = floor(sumValue847) * 6.103515625e-05;
                                        intermediateValue561 = productValue1033;
                                        intermediateValue562 = productValue1034;
                                    }
                                    precise float productValue1035 = vectorValue23.x * intermediateValue561;
                                    precise float productValue1036 = vectorValue23.x * intermediateValue562;
                                    precise float sumValue848 = sumValue840 + productValue1035;
                                    precise float sumValue849 = sumValue841 + productValue1036;
                                    float intermediateValue591;
                                    float intermediateValue592;
                                    if (conditionValue38)
                                    {
                                        uint bitwiseValue302 = comparisonValue124 >> 15u;
                                        precise float bitwiseValue303 = float(bitwiseValue302 & 1u) * 2.0;
                                        precise float sumValue850 = bitwiseValue303 + (-1.0);
                                        precise float bitwiseValue304 = float(comparisonValue124 >> 31u) * 2.0;
                                        precise float sumValue851 = bitwiseValue304 + (-1.0);
                                        precise float bitwiseValue305 = float((comparisonValue124 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue306 = float(bitwiseValue302 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1037 = sumValue850 * 3.0517578125e-05;
                                        precise float productValue1038 = sumValue851 * 3.0517578125e-05;
                                        precise float sumValue853 = bitwiseValue305 + productValue1037;
                                        precise float sumValue854 = bitwiseValue306 + productValue1038;
                                        intermediateValue591 = sumValue853;
                                        intermediateValue592 = sumValue854;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue307 = float(comparisonValue124 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue308 = float(comparisonValue124 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1039 = bitwiseValue307 * 16384.0;
                                        precise float sumValue855 = productValue1039 + 0.5;
                                        precise float productValue1040 = bitwiseValue308 * 16384.0;
                                        precise float sumValue856 = productValue1040 + 0.5;
                                        precise float productValue1041 = floor(sumValue855) * 6.103515625e-05;
                                        precise float productValue1042 = floor(sumValue856) * 6.103515625e-05;
                                        intermediateValue591 = productValue1041;
                                        intermediateValue592 = productValue1042;
                                    }
                                    precise float productValue1043 = vectorValue24.y * intermediateValue591;
                                    precise float productValue1044 = vectorValue24.y * intermediateValue592;
                                    precise float sumValue857 = sumValue848 + productValue1043;
                                    precise float sumValue858 = sumValue849 + productValue1044;
                                    float intermediateValue615;
                                    if (objectInstances.packedValues[productValue1017] == 65535us)
                                    {
                                        intermediateValue615 = 1.0;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits48;
                                        if (objectInstances.packedValues[productValue1017] > 4095us)
                                        {
                                            reinterpretedBits48 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits48 = uint(objectInstances.packedValues[productValue1017]);
                                        }
                                        intermediateValue615 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits48 + 0u], defaultSampler)), vec2(sumValue857, sumValue858), -0.25).w;
                                    }
                                    uint comparisonValue131;
                                    if (scalarValue156 == 2u)
                                    {
                                        comparisonValue131 = 0u;
                                    }
                                    else
                                    {
                                        comparisonValue131 = uint(intermediateValue615 <= (((objectInstances.packedValues[productValue1019] & 4352us) != 0us) ? 0.5 : 0.0));
                                    }
                                    if (comparisonValue131 == 0u)
                                    {
                                        rayQueryConfirmIntersectionEXT(intermediateValue357);
                                    }
                                }
                                intermediateValue457 = rayQueryProceedEXT(intermediateValue357);
                                if (intermediateValue457)
                                {
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                        uint scalarValue158 = rayQueryGetIntersectionTypeEXT(intermediateValue357, bool(1u));
                        float intermediateValue458;
                        float intermediateValue459;
                        float intermediateValue460;
                        uint bitwiseValue167;
                        if (scalarValue158 == 1u)
                        {
                            vec2 vectorValue25 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue357, bool(1u));
                            vec2 vectorValue26 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue357, bool(1u));
                            float scalarValue159 = rayQueryGetIntersectionTEXT(intermediateValue357, bool(1u));
                            uint scalarValue160 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue357, bool(1u));
                            uint scalarValue161 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue357, bool(1u));
                            uint scalarValue162 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue357, bool(1u));
                            intermediateValue458 = vectorValue25.x;
                            intermediateValue459 = vectorValue26.y;
                            intermediateValue460 = scalarValue159;
                            bitwiseValue167 = ((scalarValue161 << 30u) | ((scalarValue160 << 14u) & 1073725440u)) | (scalarValue162 & 16383u);
                        }
                        else
                        {
                            intermediateValue458 = 0.0;
                            intermediateValue459 = 0.0;
                            intermediateValue460 = 10000.0;
                            bitwiseValue167 = intermediateValue88 | 1073741823u;
                        }
                        rayQueryInitializeEXT(intermediateValue461, SceneBVH, 512u, 16u, vec3(reinterpretedBits28, reinterpretedBits29, reinterpretedBits30), 0.0, vec3(sumValue827, sumValue829, sumValue831), intermediateValue460);
                        bool conditionValue39 = rayQueryProceedEXT(intermediateValue461);
                        float intermediateValue481;
                        float intermediateValue483;
                        float intermediateValue485;
                        if (conditionValue39)
                        {
                            float intermediateValue482;
                            float intermediateValue484;
                            float intermediateValue486;
                            float scalarValue163 = 1.0;
                            float scalarValue164 = 1.0;
                            float scalarValue165 = 1.0;
                            bool comparisonValue106;
                            for (;;)
                            {
                                uint scalarValue166 = rayQueryGetIntersectionTypeEXT(intermediateValue461, bool(0u));
                                comparisonValue106 = scalarValue166 == 0u;
                                float branchMergedValue6;
                                float branchMergedValue21;
                                float branchMergedValue22;
                                if (comparisonValue106)
                                {
                                    vec2 vectorValue27 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue461, bool(0u));
                                    vec2 vectorValue28 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue461, bool(0u));
                                    float scalarValue167 = rayQueryGetIntersectionTEXT(intermediateValue461, bool(0u));
                                    uint scalarValue168 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue461, bool(0u));
                                    uint scalarValue169 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue461, bool(0u));
                                    uint scalarValue170 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue461, bool(0u));
                                    uint productValue1045 = (scalarValue170 * 76u) + 58u;
                                    uint productValue1046 = (scalarValue170 * 76u) + 61u;
                                    precise float sumValue859 = 1.0 - vectorValue27.x;
                                    precise float sumValue860 = sumValue859 - vectorValue28.y;
                                    uint bitwiseValue309 = (objectInstances_2.packedValues[(scalarValue170 * 38u) + 25u] >> 2u) + (scalarValue168 >> 1u);
                                    uint productValue1047 = uint(objectInstances.packedValues[(scalarValue170 * 76u) + 54u]) + 0u;
                                    bool comparisonValue127 = (scalarValue168 & 1u) == 0u;
                                    uint comparisonValue128 = comparisonValue127 ? faceUvBuffersRW[nonuniformEXT(productValue1047)].packedValues[bitwiseValue309].z : faceUvBuffersRW[nonuniformEXT(productValue1047)].packedValues[bitwiseValue309].x;
                                    uint comparisonValue129 = comparisonValue127 ? faceUvBuffersRW[nonuniformEXT(productValue1047)].packedValues[bitwiseValue309].y : faceUvBuffersRW[nonuniformEXT(productValue1047)].packedValues[bitwiseValue309].w;
                                    uint comparisonValue130 = comparisonValue127 ? faceUvBuffersRW[nonuniformEXT(productValue1047)].packedValues[bitwiseValue309].x : faceUvBuffersRW[nonuniformEXT(productValue1047)].packedValues[bitwiseValue309].z;
                                    bool conditionValue40 = int16_t(objectInstances.packedValues[productValue1046]) < int16_t(0us);
                                    float intermediateValue581;
                                    float intermediateValue582;
                                    if (conditionValue40)
                                    {
                                        uint bitwiseValue311 = comparisonValue130 >> 15u;
                                        precise float bitwiseValue312 = float(bitwiseValue311 & 1u) * 2.0;
                                        precise float sumValue861 = bitwiseValue312 + (-1.0);
                                        precise float bitwiseValue313 = float(comparisonValue130 >> 31u) * 2.0;
                                        precise float sumValue862 = bitwiseValue313 + (-1.0);
                                        precise float bitwiseValue314 = float((comparisonValue130 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue315 = float(bitwiseValue311 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1048 = sumValue861 * 3.0517578125e-05;
                                        precise float productValue1049 = sumValue862 * 3.0517578125e-05;
                                        precise float sumValue863 = bitwiseValue314 + productValue1048;
                                        precise float sumValue864 = bitwiseValue315 + productValue1049;
                                        intermediateValue581 = sumValue863;
                                        intermediateValue582 = sumValue864;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue316 = float(comparisonValue130 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue317 = float(comparisonValue130 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1050 = bitwiseValue316 * 16384.0;
                                        precise float sumValue865 = productValue1050 + 0.5;
                                        precise float productValue1051 = bitwiseValue317 * 16384.0;
                                        precise float sumValue866 = productValue1051 + 0.5;
                                        precise float productValue1052 = floor(sumValue865) * 6.103515625e-05;
                                        precise float productValue1053 = floor(sumValue866) * 6.103515625e-05;
                                        intermediateValue581 = productValue1052;
                                        intermediateValue582 = productValue1053;
                                    }
                                    precise float productValue1054 = sumValue860 * intermediateValue581;
                                    precise float productValue1055 = sumValue860 * intermediateValue582;
                                    precise float sumValue867 = productValue1054 + 0.0;
                                    precise float sumValue868 = productValue1055 + 0.0;
                                    float intermediateValue616;
                                    float intermediateValue617;
                                    if (conditionValue40)
                                    {
                                        uint bitwiseValue318 = comparisonValue129 >> 15u;
                                        precise float bitwiseValue319 = float(bitwiseValue318 & 1u) * 2.0;
                                        precise float sumValue869 = bitwiseValue319 + (-1.0);
                                        precise float bitwiseValue320 = float(comparisonValue129 >> 31u) * 2.0;
                                        precise float sumValue870 = bitwiseValue320 + (-1.0);
                                        precise float bitwiseValue321 = float((comparisonValue129 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue322 = float(bitwiseValue318 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1056 = sumValue869 * 3.0517578125e-05;
                                        precise float productValue1057 = sumValue870 * 3.0517578125e-05;
                                        precise float sumValue871 = bitwiseValue321 + productValue1056;
                                        precise float sumValue872 = bitwiseValue322 + productValue1057;
                                        intermediateValue616 = sumValue871;
                                        intermediateValue617 = sumValue872;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue323 = float(comparisonValue129 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue324 = float(comparisonValue129 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1058 = bitwiseValue323 * 16384.0;
                                        precise float sumValue873 = productValue1058 + 0.5;
                                        precise float productValue1059 = bitwiseValue324 * 16384.0;
                                        precise float sumValue874 = productValue1059 + 0.5;
                                        precise float productValue1060 = floor(sumValue873) * 6.103515625e-05;
                                        precise float productValue1061 = floor(sumValue874) * 6.103515625e-05;
                                        intermediateValue616 = productValue1060;
                                        intermediateValue617 = productValue1061;
                                    }
                                    precise float productValue1062 = vectorValue27.x * intermediateValue616;
                                    precise float productValue1064 = vectorValue27.x * intermediateValue617;
                                    precise float sumValue875 = sumValue867 + productValue1062;
                                    precise float sumValue876 = sumValue868 + productValue1064;
                                    float intermediateValue634;
                                    float intermediateValue635;
                                    if (conditionValue40)
                                    {
                                        uint bitwiseValue325 = comparisonValue128 >> 15u;
                                        precise float bitwiseValue326 = float(bitwiseValue325 & 1u) * 2.0;
                                        precise float sumValue877 = bitwiseValue326 + (-1.0);
                                        precise float bitwiseValue327 = float(comparisonValue128 >> 31u) * 2.0;
                                        precise float sumValue878 = bitwiseValue327 + (-1.0);
                                        precise float bitwiseValue328 = float((comparisonValue128 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue329 = float(bitwiseValue325 & 65534u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1065 = sumValue877 * 3.0517578125e-05;
                                        precise float productValue1066 = sumValue878 * 3.0517578125e-05;
                                        precise float sumValue879 = bitwiseValue328 + productValue1065;
                                        precise float sumValue880 = bitwiseValue329 + productValue1066;
                                        intermediateValue634 = sumValue879;
                                        intermediateValue635 = sumValue880;
                                    }
                                    else
                                    {
                                        precise float bitwiseValue330 = float(comparisonValue128 & 65535u) * 1.525902189314365386962890625e-05;
                                        precise float bitwiseValue331 = float(comparisonValue128 >> 16u) * 1.525902189314365386962890625e-05;
                                        precise float productValue1067 = bitwiseValue330 * 16384.0;
                                        precise float sumValue881 = productValue1067 + 0.5;
                                        precise float productValue1068 = bitwiseValue331 * 16384.0;
                                        precise float sumValue882 = productValue1068 + 0.5;
                                        precise float productValue1069 = floor(sumValue881) * 6.103515625e-05;
                                        precise float productValue1070 = floor(sumValue882) * 6.103515625e-05;
                                        intermediateValue634 = productValue1069;
                                        intermediateValue635 = productValue1070;
                                    }
                                    precise float productValue1071 = vectorValue28.y * intermediateValue634;
                                    precise float productValue1072 = vectorValue28.y * intermediateValue635;
                                    precise float sumValue883 = sumValue875 + productValue1071;
                                    precise float sumValue884 = sumValue876 + productValue1072;
                                    precise float productValue1074 = scalarValue167 * 0.083333335816860198974609375;
                                    precise float sumValue885 = productValue1074 + (-0.25);
                                    float intermediateValue640;
                                    float intermediateValue641;
                                    float intermediateValue642;
                                    float intermediateValue643;
                                    if (objectInstances.packedValues[productValue1045] == 65535us)
                                    {
                                        intermediateValue640 = 1.0;
                                        intermediateValue641 = 1.0;
                                        intermediateValue642 = 1.0;
                                        intermediateValue643 = 1.0;
                                    }
                                    else
                                    {
                                        uint reinterpretedBits50;
                                        if (objectInstances.packedValues[productValue1045] > 4095us)
                                        {
                                            reinterpretedBits50 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                        }
                                        else
                                        {
                                            reinterpretedBits50 = uint(objectInstances.packedValues[productValue1045]);
                                        }
                                        vec4 sampledTextureValue23 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits50 + 0u], defaultSampler)), vec2(sumValue883, sumValue884), spvNMin(sumValue885, 2.0));
                                        intermediateValue640 = sampledTextureValue23.x;
                                        intermediateValue641 = sampledTextureValue23.y;
                                        intermediateValue642 = sampledTextureValue23.z;
                                        intermediateValue643 = sampledTextureValue23.w;
                                    }
                                    float intermediateValue658;
                                    float intermediateValue659;
                                    float intermediateValue660;
                                    if (scalarValue169 == 2u)
                                    {
                                        float branchMergedValue49;
                                        float branchMergedValue146;
                                        float branchMergedValue147;
                                        if ((objectInstances.packedValues[productValue1046] & 128us) == 0us)
                                        {
                                            float intermediateValue663;
                                            if ((objectInstances.packedValues[productValue1046] & 2048us) == 0us)
                                            {
                                                intermediateValue663 = intermediateValue643;
                                            }
                                            else
                                            {
                                                precise float productValue1075 = intermediateValue643 * 2.0;
                                                precise float sumValue886 = productValue1075 + (-1.0);
                                                intermediateValue663 = spvNClamp(sumValue886, 0.0, 1.0);
                                            }
                                            precise float sumValue887 = 0.0 - intermediateValue640;
                                            precise float sumValue888 = 0.0 - intermediateValue641;
                                            precise float sumValue889 = 0.0 - intermediateValue642;
                                            precise float productValue1076 = sumValue887 * intermediateValue663;
                                            precise float productValue1077 = sumValue888 * intermediateValue663;
                                            precise float productValue1078 = sumValue889 * intermediateValue663;
                                            precise float sumValue890 = intermediateValue640 + productValue1076;
                                            precise float sumValue891 = intermediateValue641 + productValue1077;
                                            precise float sumValue892 = intermediateValue642 + productValue1078;
                                            branchMergedValue49 = sumValue892;
                                            branchMergedValue146 = sumValue891;
                                            branchMergedValue147 = sumValue890;
                                        }
                                        else
                                        {
                                            branchMergedValue49 = 0.33399999141693115234375;
                                            branchMergedValue146 = 0.33399999141693115234375;
                                            branchMergedValue147 = 0.33399999141693115234375;
                                        }
                                        intermediateValue658 = branchMergedValue147;
                                        intermediateValue659 = branchMergedValue146;
                                        intermediateValue660 = branchMergedValue49;
                                    }
                                    else
                                    {
                                        precise float sumValue893 = 1.0 - intermediateValue643;
                                        intermediateValue658 = sumValue893;
                                        intermediateValue659 = sumValue893;
                                        intermediateValue660 = sumValue893;
                                    }
                                    precise float productValue1079 = scalarValue163 * intermediateValue658;
                                    precise float productValue1080 = scalarValue164 * intermediateValue659;
                                    precise float productValue1081 = scalarValue165 * intermediateValue660;
                                    float intermediateValue537;
                                    float intermediateValue538;
                                    float intermediateValue539;
                                    bool intermediateValue664;
                                    if (!(dot(vec3(productValue1079, productValue1080, productValue1081), vec3(1.0)) <= 0.00999999977648258209228515625))
                                    {
                                        intermediateValue664 = false;
                                        intermediateValue537 = productValue1079;
                                        intermediateValue538 = productValue1080;
                                        intermediateValue539 = productValue1081;
                                    }
                                    else
                                    {
                                        intermediateValue664 = true;
                                        intermediateValue537 = 0.0;
                                        intermediateValue538 = 0.0;
                                        intermediateValue539 = 0.0;
                                    }
                                    float branchMergedValue165;
                                    float branchMergedValue172;
                                    float branchMergedValue173;
                                    if (intermediateValue664)
                                    {
                                        rayQueryConfirmIntersectionEXT(intermediateValue461);
                                        branchMergedValue165 = intermediateValue538;
                                        branchMergedValue172 = intermediateValue537;
                                        branchMergedValue173 = intermediateValue539;
                                    }
                                    else
                                    {
                                        branchMergedValue165 = intermediateValue538;
                                        branchMergedValue172 = intermediateValue537;
                                        branchMergedValue173 = intermediateValue539;
                                    }
                                    branchMergedValue6 = branchMergedValue165;
                                    branchMergedValue21 = branchMergedValue172;
                                    branchMergedValue22 = branchMergedValue173;
                                }
                                else
                                {
                                    branchMergedValue6 = scalarValue164;
                                    branchMergedValue21 = scalarValue163;
                                    branchMergedValue22 = scalarValue165;
                                }
                                intermediateValue484 = branchMergedValue6;
                                intermediateValue482 = branchMergedValue21;
                                intermediateValue486 = branchMergedValue22;
                                bool conditionValue41 = rayQueryProceedEXT(intermediateValue461);
                                if (conditionValue41)
                                {
                                    scalarValue163 = intermediateValue482;
                                    scalarValue164 = intermediateValue484;
                                    scalarValue165 = intermediateValue486;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            intermediateValue481 = intermediateValue482;
                            intermediateValue483 = intermediateValue484;
                            intermediateValue485 = intermediateValue486;
                        }
                        else
                        {
                            intermediateValue481 = 1.0;
                            intermediateValue483 = 1.0;
                            intermediateValue485 = 1.0;
                        }
                        uint scalarValue171 = rayQueryGetIntersectionTypeEXT(intermediateValue461, bool(1u));
                        bool comparisonValue132 = scalarValue171 == 1u;
                        precise float comparisonValue134 = productValue1002 * (comparisonValue132 ? 0.0 : intermediateValue481);
                        precise float comparisonValue135 = productValue1003 * (comparisonValue132 ? 0.0 : intermediateValue483);
                        precise float comparisonValue136 = productValue1004 * (comparisonValue132 ? 0.0 : intermediateValue485);
                        precise float sumValue894 = 1.0 - intermediateValue220;
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
                        if ((int(intermediateValue110) > int(0u)) || (floatBitsToUint(ViewCB.packedValues[91u]).z == 0u))
                        {
                            precise float productValue1082 = sumValue894 * intermediateValue236;
                            precise float productValue1083 = sumValue894 * intermediateValue235;
                            precise float productValue1084 = sumValue894 * intermediateValue234;
                            precise float sumValue895 = 1.0 - sumValue666;
                            precise float sumValue896 = 1.0 - sumValue667;
                            precise float sumValue897 = 1.0 - sumValue668;
                            precise float productValue1085 = productValue1084 * sumValue895;
                            precise float productValue1086 = productValue1083 * sumValue896;
                            precise float productValue1087 = productValue1082 * sumValue897;
                            precise float productValue1088 = productValue1085 * comparisonValue134;
                            precise float productValue1089 = productValue1086 * comparisonValue135;
                            precise float productValue1090 = productValue1087 * comparisonValue136;
                            branchMergedValue188 = intermediateValue106;
                            branchMergedValue220 = intermediateValue104;
                            branchMergedValue221 = productValue1090;
                            branchMergedValue222 = productValue1089;
                            branchMergedValue223 = productValue1088;
                            branchMergedValue224 = productValue1006;
                            branchMergedValue225 = bitwiseValue167;
                            branchMergedValue226 = intermediateValue460;
                            branchMergedValue227 = intermediateValue459;
                            branchMergedValue228 = intermediateValue458;
                            branchMergedValue234 = 1u;
                            branchMergedValue235 = sumValue829;
                            branchMergedValue236 = sumValue827;
                            branchMergedValue237 = sumValue831;
                        }
                        else
                        {
                            branchMergedValue188 = intermediateValue106;
                            branchMergedValue220 = intermediateValue104;
                            branchMergedValue221 = comparisonValue136;
                            branchMergedValue222 = comparisonValue135;
                            branchMergedValue223 = comparisonValue134;
                            branchMergedValue224 = productValue1006;
                            branchMergedValue225 = bitwiseValue167;
                            branchMergedValue226 = intermediateValue460;
                            branchMergedValue227 = intermediateValue459;
                            branchMergedValue228 = intermediateValue458;
                            branchMergedValue234 = 1u;
                            branchMergedValue235 = sumValue829;
                            branchMergedValue236 = sumValue827;
                            branchMergedValue237 = sumValue831;
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
                    intermediateValue77 = branchMergedValue156;
                    intermediateValue79 = branchMergedValue155;
                    intermediateValue81 = branchMergedValue157;
                    intermediateValue83 = branchMergedValue130;
                    intermediateValue85 = branchMergedValue129;
                    intermediateValue87 = branchMergedValue128;
                    intermediateValue89 = branchMergedValue127;
                    intermediateValue511 = branchMergedValue126;
                    intermediateValue512 = branchMergedValue125;
                    intermediateValue513 = branchMergedValue124;
                    intermediateValue514 = branchMergedValue123;
                    intermediateValue105 = branchMergedValue122;
                    intermediateValue107 = branchMergedValue40;
                    intermediateValue109 = branchMergedValue154;
                }
                float branchMergedValue5;
                float branchMergedValue18;
                float branchMergedValue19;
                uint branchMergedValue20;
                if (int(intermediateValue110) > int(3u))
                {
                    float scalarValue172 = spvNMax(intermediateValue512, spvNMax(intermediateValue513, intermediateValue514));
                    uint productValue1091 = (intermediateValue511 * 1664525u) + 1013904223u;
                    precise float bitwiseValue332 = float(productValue1091 & 16777215u) * 5.9604644775390625e-08;
                    if (bitwiseValue332 > scalarValue172)
                    {
                        branchMergedValue = false;
                        branchMergedValue3 = intermediateValue95;
                        branchMergedValue11 = intermediateValue93;
                        branchMergedValue12 = intermediateValue97;
                        branchMergedValue13 = intermediateValue687;
                        branchMergedValue14 = intermediateValue690;
                        branchMergedValue15 = intermediateValue693;
                        break;
                    }
                    precise float quotientValue50 = intermediateValue512 / scalarValue172;
                    precise float quotientValue51 = intermediateValue513 / scalarValue172;
                    precise float quotientValue52 = intermediateValue514 / scalarValue172;
                    branchMergedValue5 = quotientValue52;
                    branchMergedValue18 = quotientValue51;
                    branchMergedValue19 = quotientValue50;
                    branchMergedValue20 = productValue1091;
                }
                else
                {
                    branchMergedValue5 = intermediateValue514;
                    branchMergedValue18 = intermediateValue513;
                    branchMergedValue19 = intermediateValue512;
                    branchMergedValue20 = intermediateValue511;
                }
                intermediateValue103 = branchMergedValue5;
                intermediateValue101 = branchMergedValue18;
                intermediateValue99 = branchMergedValue19;
                intermediateValue91 = branchMergedValue20;
                uint sumValue898 = intermediateValue110 + 1u;
                if (int(sumValue898) < int(9u))
                {
                    intermediateValue43 = intermediateValue44;
                    intermediateValue46 = intermediateValue47;
                    intermediateValue48 = intermediateValue49;
                    intermediateValue50 = intermediateValue51;
                    intermediateValue52 = intermediateValue53;
                    intermediateValue54 = intermediateValue55;
                    intermediateValue56 = intermediateValue57;
                    intermediateValue58 = intermediateValue59;
                    intermediateValue60 = intermediateValue61;
                    intermediateValue62 = intermediateValue63;
                    intermediateValue64 = intermediateValue65;
                    intermediateValue66 = intermediateValue67;
                    intermediateValue68 = intermediateValue69;
                    intermediateValue70 = intermediateValue71;
                    intermediateValue72 = intermediateValue73;
                    intermediateValue74 = intermediateValue75;
                    intermediateValue76 = intermediateValue77;
                    intermediateValue78 = intermediateValue79;
                    intermediateValue80 = intermediateValue81;
                    intermediateValue82 = intermediateValue83;
                    intermediateValue84 = intermediateValue85;
                    intermediateValue86 = intermediateValue87;
                    intermediateValue88 = intermediateValue89;
                    intermediateValue90 = intermediateValue91;
                    intermediateValue92 = intermediateValue93;
                    intermediateValue94 = intermediateValue95;
                    intermediateValue96 = intermediateValue97;
                    intermediateValue98 = intermediateValue99;
                    intermediateValue100 = intermediateValue101;
                    intermediateValue102 = intermediateValue103;
                    intermediateValue104 = intermediateValue105;
                    intermediateValue106 = intermediateValue107;
                    intermediateValue108 = intermediateValue109;
                    intermediateValue110 = sumValue898;
                    continue;
                }
                else
                {
                    branchMergedValue = false;
                    branchMergedValue3 = intermediateValue95;
                    branchMergedValue11 = intermediateValue93;
                    branchMergedValue12 = intermediateValue97;
                    branchMergedValue13 = intermediateValue688;
                    branchMergedValue14 = intermediateValue691;
                    branchMergedValue15 = intermediateValue694;
                    break;
                }
            }
            else
            {
                uvec4 reinterpretedBits35 = floatBitsToUint(ViewCB.packedValues[76u]);
                uint scalarValue173 = reinterpretedBits35.w;
                float sumValue899 = (-0.0) - intermediateValue76;
                float sumValue900 = (-0.0) - intermediateValue78;
                float sumValue901 = (-0.0) - intermediateValue80;
                float productValue1092 = ViewCB.packedValues[60u].w * ViewCB.packedValues[60u].w;
                float dotProductValue54 = (spvNClamp(ViewCB.packedValues[90u].w, 0.0, 1.0) * 15.9154567718505859375) * ((1.0 - productValue1092) / exp2(log2(abs((productValue1092 + 1.0) - ((ViewCB.packedValues[60u].w * 2.0) * spvNMin(spvNMax((-0.0) - dot(vec3(ViewCB.packedValues[52u].xyz), vec3(sumValue899, sumValue900, sumValue901)), -1.0), 1.0)))) * 1.5));
                float intermediateValue145;
                float intermediateValue146;
                float intermediateValue147;
                if (scalarValue173 == 1u)
                {
                    intermediateValue145 = ViewCB.packedValues[58u].x;
                    intermediateValue146 = ViewCB.packedValues[58u].y;
                    intermediateValue147 = ViewCB.packedValues[58u].z;
                }
                else
                {
                    float branchMergedValue25;
                    float branchMergedValue50;
                    float branchMergedValue51;
                    if (scalarValue173 == 2u)
                    {
                        uvec4 vectorValue29 = floatBitsToUint(ViewCB.packedValues[74u]);
                        uint scalarValue174 = vectorValue29.z;
                        uint reinterpretedBits14;
                        if (scalarValue174 > 4095u)
                        {
                            reinterpretedBits14 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits14 = scalarValue174;
                        }
                        float scalarValue175 = abs(intermediateValue76);
                        float scalarValue176 = abs(intermediateValue78);
                        float scalarValue177 = abs(intermediateValue80);
                        float intermediateValue191;
                        float comparisonValue22;
                        float intermediateValue192;
                        if ((scalarValue175 >= scalarValue176) && (scalarValue175 >= scalarValue177))
                        {
                            intermediateValue191 = scalarValue175;
                            comparisonValue22 = (intermediateValue76 < 0.0) ? sumValue901 : intermediateValue80;
                            intermediateValue192 = sumValue900;
                        }
                        else
                        {
                            float branchMergedValue27;
                            float branchMergedValue54;
                            float branchMergedValue55;
                            if (!(scalarValue176 >= scalarValue177))
                            {
                                branchMergedValue27 = sumValue900;
                                branchMergedValue54 = (intermediateValue80 < 0.0) ? intermediateValue76 : sumValue899;
                                branchMergedValue55 = scalarValue177;
                            }
                            else
                            {
                                branchMergedValue27 = (intermediateValue78 < 0.0) ? sumValue901 : intermediateValue80;
                                branchMergedValue54 = sumValue899;
                                branchMergedValue55 = scalarValue176;
                            }
                            intermediateValue191 = branchMergedValue55;
                            comparisonValue22 = branchMergedValue54;
                            intermediateValue192 = branchMergedValue27;
                        }
                        precise float quotientValue53 = 0.5 / intermediateValue191;
                        vec4 sampledTextureValue24 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits14 + 0u], linearSampler)), vec2(fract(fma(comparisonValue22, quotientValue53, 0.5) * ViewCB.packedValues[74u].x), fract(fma(intermediateValue192, quotientValue53, 0.5) * ViewCB.packedValues[74u].y)), 0.0);
                        branchMergedValue25 = (ViewCB.packedValues[58u].z * sampledTextureValue24.z) * ViewCB.packedValues[97u].w;
                        branchMergedValue50 = (ViewCB.packedValues[58u].y * sampledTextureValue24.y) * ViewCB.packedValues[97u].w;
                        branchMergedValue51 = (ViewCB.packedValues[58u].x * sampledTextureValue24.x) * ViewCB.packedValues[97u].w;
                    }
                    else
                    {
                        float branchMergedValue175;
                        float branchMergedValue178;
                        float branchMergedValue179;
                        if (scalarValue173 == 4u)
                        {
                            float scalarValue178 = (dot(vec3(intermediateValue76, intermediateValue78, intermediateValue80), vec3(ViewCB.packedValues[52u].xyz)) * 0.5) + 0.5;
                            branchMergedValue175 = ((ViewCB.packedValues[75u].z - ViewCB.packedValues[76u].z) * scalarValue178) + ViewCB.packedValues[76u].z;
                            branchMergedValue178 = ((ViewCB.packedValues[75u].y - ViewCB.packedValues[76u].y) * scalarValue178) + ViewCB.packedValues[76u].y;
                            branchMergedValue179 = ((ViewCB.packedValues[75u].x - ViewCB.packedValues[76u].x) * scalarValue178) + ViewCB.packedValues[76u].x;
                        }
                        else
                        {
                            float comparisonValue21;
                            if (abs(intermediateValue78) < 1.0)
                            {
                                float quotientValue54 = atan(intermediateValue80 / intermediateValue76);
                                bool conditionValue42 = intermediateValue76 < 0.0;
                                bool comparisonValue137 = intermediateValue76 == 0.0;
                                bool comparisonValue140 = intermediateValue80 >= 0.0;
                                bool conditionValue43 = intermediateValue80 < 0.0;
                                comparisonValue21 = (comparisonValue137 && comparisonValue140) ? 1.57079637050628662109375 : ((comparisonValue137 && conditionValue43) ? (-1.57079637050628662109375) : ((conditionValue42 && conditionValue43) ? (quotientValue54 + (-3.1415927410125732421875)) : ((conditionValue42 && comparisonValue140) ? (quotientValue54 + 3.1415927410125732421875) : quotientValue54)));
                            }
                            else
                            {
                                comparisonValue21 = 0.0;
                            }
                            float multiplyAddValue = fma(abs((fract((comparisonValue21 - ViewCB.packedValues[50u].w) * 0.15915493667125701904296875) * 2.0) + (-1.0)), 0.984375, 0.0078125);
                            float multiplyAddValue1 = fma(0.5 - (asin(intermediateValue78) * 0.3183098733425140380859375), 0.96875, 0.015625);
                            float productValue1093 = ViewCB.packedValues[51u].w * 7.0;
                            float scalarValue179 = fract(productValue1093);
                            uint scalarValue180 = uint(int(floor(productValue1093)));
                            float productValue1094 = float(int(scalarValue180 + 1u)) * 0.125;
                            float scalarValue181 = fract(abs(productValue1094));
                            vec4 sampledTextureValue25 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue, multiplyAddValue1, float(int(scalarValue180))), 0.0);
                            float scalarValue182 = sampledTextureValue25.x;
                            float scalarValue183 = sampledTextureValue25.y;
                            float scalarValue184 = sampledTextureValue25.z;
                            float productValue1095 = scalarValue182 * scalarValue182;
                            float productValue1096 = scalarValue183 * scalarValue183;
                            float productValue1097 = scalarValue184 * scalarValue184;
                            vec4 sampledTextureValue26 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue, multiplyAddValue1, float(int(uint(int(((productValue1094 >= ((-0.0) - productValue1094)) ? scalarValue181 : ((-0.0) - scalarValue181)) * 8.0))))), 0.0);
                            float scalarValue185 = sampledTextureValue26.x;
                            float scalarValue186 = sampledTextureValue26.y;
                            float scalarValue187 = sampledTextureValue26.z;
                            float dotProductValue55 = exp2(log2(spvNMax(dot(vec3(intermediateValue76, intermediateValue78, intermediateValue80), vec3(ViewCB.packedValues[52u].xyz)), 0.0)) * 7.0);
                            float productValue1098 = dotProductValue55 * 0.0500000007450580596923828125;
                            float productValue1099 = ((((scalarValue185 * scalarValue185) - productValue1095) * scalarValue179) + productValue1095) + (productValue1098 * ViewCB.packedValues[50u].x);
                            float productValue1100 = ((((scalarValue186 * scalarValue186) - productValue1096) * scalarValue179) + productValue1096) + (productValue1098 * ViewCB.packedValues[50u].y);
                            float productValue1101 = ((((scalarValue187 * scalarValue187) - productValue1097) * scalarValue179) + productValue1097) + (productValue1098 * ViewCB.packedValues[50u].z);
                            float productValue1102 = (dotProductValue55 * 0.64999997615814208984375) + 0.3499999940395355224609375;
                            branchMergedValue175 = ((((ViewCB.packedValues[58u].z * productValue1102) - productValue1101) * ViewCB.packedValues[58u].w) + productValue1101) * ViewCB.packedValues[97u].w;
                            branchMergedValue178 = ((((ViewCB.packedValues[58u].y * productValue1102) - productValue1100) * ViewCB.packedValues[58u].w) + productValue1100) * ViewCB.packedValues[97u].w;
                            branchMergedValue179 = ((((ViewCB.packedValues[58u].x * productValue1102) - productValue1099) * ViewCB.packedValues[58u].w) + productValue1099) * ViewCB.packedValues[97u].w;
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
                branchMergedValue3 = intermediateValue683;
                branchMergedValue11 = intermediateValue684;
                branchMergedValue12 = intermediateValue685;
                branchMergedValue13 = ((intermediateValue147 + (((ViewCB.packedValues[50u].z * dotProductValue54) * ViewCB.packedValues[61u].z) * exp2(ViewCB.packedValues[62u].z * (-72.1347503662109375)))) * intermediateValue102) + intermediateValue96;
                branchMergedValue14 = ((intermediateValue146 + (((ViewCB.packedValues[50u].y * dotProductValue54) * ViewCB.packedValues[61u].y) * exp2(ViewCB.packedValues[62u].y * (-72.1347503662109375)))) * intermediateValue100) + intermediateValue94;
                branchMergedValue15 = ((intermediateValue145 + (((ViewCB.packedValues[50u].x * dotProductValue54) * ViewCB.packedValues[61u].x) * exp2(ViewCB.packedValues[62u].x * (-72.1347503662109375)))) * intermediateValue98) + intermediateValue92;
                break;
            }
        }
        float scalarValue188 = branchMergedValue3;
        float scalarValue189 = branchMergedValue11;
        float scalarValue190 = branchMergedValue12;
        if (branchMergedValue)
        {
            intermediateValue163 = branchMergedValue15;
            intermediateValue165 = branchMergedValue14;
            intermediateValue167 = branchMergedValue13;
            break;
        }
        intermediateValue163 = scalarValue189;
        intermediateValue165 = scalarValue188;
        intermediateValue167 = scalarValue190;
        break;
    }
    float productValue1103 = intermediateValue163 * reinterpretedBits2;
    float productValue1104 = intermediateValue165 * reinterpretedBits2;
    float productValue1105 = intermediateValue167 * reinterpretedBits2;
    bool bitwiseValue333 = ((productValue1103 < 0.0) || (productValue1104 < 0.0)) || (productValue1105 < 0.0);
    float comparisonValue141 = bitwiseValue333 ? 0.0 : productValue1103;
    float comparisonValue142 = bitwiseValue333 ? 0.0 : productValue1104;
    float comparisonValue143 = bitwiseValue333 ? 0.0 : productValue1105;
    bool bitwiseValue334 = (isnan(comparisonValue141) || isnan(comparisonValue142)) || isnan(comparisonValue143);
    imageStore(outputBufferEmissiveAndLinearRoughness, ivec2(uvec2(bitwiseValue2, bitwiseValue3)), vec4(bitwiseValue334 ? 0.0 : comparisonValue141, bitwiseValue334 ? 0.0 : comparisonValue142, bitwiseValue334 ? 0.0 : comparisonValue143, 0.0));
}
