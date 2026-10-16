#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / CalculateInscatterInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 24
#endif

#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
#extension GL_EXT_shader_16bit_storage : require
#extension GL_EXT_ray_query : require
#extension GL_EXT_ray_flags_primitive_culling : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_samplerless_texture_functions : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    precise float productValue = float(gl_GlobalInvocationID.x) * ViewCB.packedValues[80u].z;
    precise float sumValue = productValue + (-1.0);
    precise float productValue1 = float(gl_GlobalInvocationID.z) * ViewCB.packedValues[55u].z;
    uvec4 reinterpretedBits = floatBitsToUint(ViewCB.packedValues[84u]);
    uint scalarValue = reinterpretedBits.z;
    uint bitwiseValue = gl_GlobalInvocationID.x & 65535u;
    uint bitwiseValue1 = gl_GlobalInvocationID.y & 65535u;
    uint bitwiseValue2 = ((bitwiseValue << 8u) | bitwiseValue) & 16711935u;
    uint bitwiseValue3 = ((bitwiseValue2 << 4u) | bitwiseValue2) & 252645135u;
    uint bitwiseValue4 = ((bitwiseValue3 << 2u) | bitwiseValue3) & 858993459u;
    uint bitwiseValue5 = ((bitwiseValue1 << 8u) | bitwiseValue1) & 16711935u;
    uint bitwiseValue6 = ((bitwiseValue5 << 4u) | bitwiseValue5) & 252645135u;
    uint bitwiseValue7 = ((bitwiseValue6 << 2u) | bitwiseValue6) & 858993459u;
    uint bitwiseValue8;
    uint bitwiseValue10;
    uint intermediateValue1;
    uint intermediateValue2;
    bitwiseValue8 = (((((bitwiseValue7 << 1u) | bitwiseValue7) << 1u) & 2863311530u) | (((bitwiseValue4 << 1u) | bitwiseValue4) & 1431655765u)) + scalarValue;
    bitwiseValue10 = scalarValue + (gl_GlobalInvocationID.z & 3u);
    intermediateValue1 = 0u;
    intermediateValue2 = 0u;
    uint bitwiseValue9;
    for (;;)
    {
        uint sumValue1 = intermediateValue1 + 2654435769u;
        bitwiseValue9 = ((((bitwiseValue10 >> 5u) + 3355524772u) ^ ((bitwiseValue10 << 4u) + 2738958700u)) ^ (sumValue1 + bitwiseValue10)) + bitwiseValue8;
        uint sumValue2 = intermediateValue2 + 1u;
        if (sumValue2 == 16u)
        {
            break;
        }
        else
        {
            bitwiseValue8 = bitwiseValue9;
            bitwiseValue10 = ((((bitwiseValue9 << 4u) + 2911926141u) ^ (bitwiseValue9 + sumValue1)) ^ ((bitwiseValue9 >> 5u) + 2123724318u)) + bitwiseValue10;
            intermediateValue1 = sumValue1;
            intermediateValue2 = sumValue2;
        }
    }
    precise float productValue2 = float(gl_GlobalInvocationID.y) * ViewCB.packedValues[80u].w;
    precise float sumValue3 = productValue2 + 1.0;
    precise float productValue3 = ViewCB.packedValues[55u].z * 0.5;
    precise float sumValue4 = productValue3 + productValue1;
    uint productValue4 = (bitwiseValue9 * 1664525u) + 1013904223u;
    precise float bitwiseValue11 = float(productValue4 & 16777215u) * 5.9604644775390625e-08;
    uint productValue5 = (productValue4 * 1664525u) + 1013904223u;
    precise float bitwiseValue12 = float(productValue5 & 16777215u) * 5.9604644775390625e-08;
    precise float bitwiseValue13 = float(((productValue5 * 1664525u) + 7271263u) & 16777215u) * 5.9604644775390625e-08;
    precise float productValue6 = bitwiseValue11 * 2.0;
    precise float productValue7 = bitwiseValue12 * 2.0;
    precise float productValue8 = bitwiseValue13 * 2.0;
    precise float sumValue5 = productValue6 + (-1.0);
    precise float sumValue6 = productValue7 + (-1.0);
    precise float sumValue7 = productValue8 + (-1.0);
    float exponentialValue = (exp2(sumValue4 * 3.45943164825439453125) + (-1.0)) * 5.0;
    precise float productValue9 = productValue1 * 3.45943164825439453125;
    precise float exponentialValue1 = exp2(productValue9) + (-1.0);
    precise float productValue10 = exponentialValue1 * 50.0;
    precise float quotientValue = productValue10 / 10.0;
    float productValue11 = ((ViewCB.packedValues[81u].z * 2.0) * ViewCB.packedValues[78u].z) + sumValue;
    float productValue12 = sumValue3 - ((ViewCB.packedValues[81u].w * 2.0) * ViewCB.packedValues[78u].w);
    float multiplyAddValue = fma(0.5, ViewCB.packedValues[22u].w, fma(productValue12, ViewCB.packedValues[21u].w, productValue11 * ViewCB.packedValues[20u].w)) + ViewCB.packedValues[23u].w;
    float multiplyAddValue1 = ((fma(0.5, ViewCB.packedValues[22u].x, fma(productValue12, ViewCB.packedValues[21u].x, productValue11 * ViewCB.packedValues[20u].x)) + ViewCB.packedValues[23u].x) / multiplyAddValue) - ViewCB.packedValues[72u].x;
    float multiplyAddValue2 = ((fma(0.5, ViewCB.packedValues[22u].y, fma(productValue12, ViewCB.packedValues[21u].y, productValue11 * ViewCB.packedValues[20u].y)) + ViewCB.packedValues[23u].y) / multiplyAddValue) - ViewCB.packedValues[72u].y;
    float multiplyAddValue3 = ((fma(0.5, ViewCB.packedValues[22u].z, fma(productValue12, ViewCB.packedValues[21u].z, productValue11 * ViewCB.packedValues[20u].z)) + ViewCB.packedValues[23u].z) / multiplyAddValue) - ViewCB.packedValues[72u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3), vec3(multiplyAddValue1, multiplyAddValue2, multiplyAddValue3)));
    float multiplyAddValue4 = ViewCB.packedValues[69u].x + fma(multiplyAddValue1 * inverseLengthValue, exponentialValue, ViewCB.packedValues[72u].x);
    float multiplyAddValue5 = ViewCB.packedValues[69u].y + fma(multiplyAddValue2 * inverseLengthValue, exponentialValue, ViewCB.packedValues[72u].y);
    float multiplyAddValue6 = ViewCB.packedValues[69u].z + fma(multiplyAddValue3 * inverseLengthValue, exponentialValue, ViewCB.packedValues[72u].z);
    float multiplyAddValue7 = fma(multiplyAddValue6, ViewCB.packedValues[26u].w, fma(multiplyAddValue5, ViewCB.packedValues[25u].w, multiplyAddValue4 * ViewCB.packedValues[24u].w)) + ViewCB.packedValues[27u].w;
    float multiplyAddValue8 = (fma(multiplyAddValue6, ViewCB.packedValues[26u].x, fma(multiplyAddValue5, ViewCB.packedValues[25u].x, multiplyAddValue4 * ViewCB.packedValues[24u].x)) + ViewCB.packedValues[27u].x) / multiplyAddValue7;
    float multiplyAddValue9 = (fma(multiplyAddValue6, ViewCB.packedValues[26u].y, fma(multiplyAddValue5, ViewCB.packedValues[25u].y, multiplyAddValue4 * ViewCB.packedValues[24u].y)) + ViewCB.packedValues[27u].y) / multiplyAddValue7;
    bool reinterpretedBits1 = ((abs(multiplyAddValue8) < 1.0099999904632568359375) && (abs(multiplyAddValue9) < 1.0099999904632568359375)) && (floatBitsToUint(ViewCB.packedValues[55u]).w != 0u);
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if (reinterpretedBits1)
    {
        float multiplyAddValue10 = fma(multiplyAddValue6, ViewCB.packedValues[30u].x, fma(multiplyAddValue5, ViewCB.packedValues[29u].x, ViewCB.packedValues[28u].x * multiplyAddValue4)) + ViewCB.packedValues[31u].x;
        float multiplyAddValue11 = fma(multiplyAddValue6, ViewCB.packedValues[30u].y, fma(multiplyAddValue5, ViewCB.packedValues[29u].y, ViewCB.packedValues[28u].y * multiplyAddValue4)) + ViewCB.packedValues[31u].y;
        float multiplyAddValue12 = fma(multiplyAddValue6, ViewCB.packedValues[30u].z, fma(multiplyAddValue5, ViewCB.packedValues[29u].z, ViewCB.packedValues[28u].z * multiplyAddValue4)) + ViewCB.packedValues[31u].z;
        float multiplyAddValue13 = fma(fma(multiplyAddValue8, 0.5, 0.5), (ViewCB.packedValues[54u].x + (-1.0)) * ViewCB.packedValues[55u].x, ViewCB.packedValues[55u].x * 0.5);
        float multiplyAddValue14 = fma(fma(multiplyAddValue9, -0.5, 0.5), (ViewCB.packedValues[54u].y + (-1.0)) * ViewCB.packedValues[55u].y, ViewCB.packedValues[55u].y * 0.5);
        float nonlinearValue = log2((sqrt(((multiplyAddValue11 * multiplyAddValue11) + (multiplyAddValue10 * multiplyAddValue10)) + (multiplyAddValue12 * multiplyAddValue12)) * 0.20000000298023223876953125) + 1.0) * 0.289064824581146240234375;
        vec4 sampledTextureValue = textureLod(sampler3D(volumetricInscatterPrevious, linearSampler), vec3(multiplyAddValue13, multiplyAddValue14, nonlinearValue), 0.0);
        intermediateValue3 = sampledTextureValue.x;
        intermediateValue4 = sampledTextureValue.y;
        intermediateValue5 = sampledTextureValue.z;
        intermediateValue6 = sampledTextureValue.w;
        intermediateValue7 = multiplyAddValue13;
        intermediateValue8 = multiplyAddValue14;
        intermediateValue9 = nonlinearValue;
    }
    else
    {
        intermediateValue3 = 0.0;
        intermediateValue4 = 0.0;
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
        intermediateValue7 = 0.0;
        intermediateValue8 = 0.0;
        intermediateValue9 = 0.0;
    }
    precise float productValue13 = ViewCB.packedValues[55u].x * sumValue5;
    precise float productValue14 = ViewCB.packedValues[55u].y * sumValue6;
    precise float sumValue8 = sumValue + productValue13;
    precise float sumValue9 = productValue14 + sumValue3;
    precise float sumValue10 = ViewCB.packedValues[78u].x + (-1.0);
    precise float sumValue11 = ViewCB.packedValues[78u].y + (-1.0);
    precise float productValue15 = sumValue8 * 0.5;
    precise float sumValue12 = productValue15 + 0.5;
    precise float productValue16 = sumValue9 * (-0.5);
    precise float sumValue13 = productValue16 + 0.5;
    precise float productValue17 = spvNClamp(sumValue12, 0.0, 1.0) * sumValue10;
    precise float sumValue14 = productValue17 + 0.5;
    precise float productValue18 = spvNClamp(sumValue13, 0.0, 1.0) * sumValue11;
    precise float sumValue15 = productValue18 + 0.5;
    uint sumValue16 = uint(min(int(uint(max(int(uint(int(sumValue14))), int(0u)))), int(uint(int(ViewCB.packedValues[78u].x)) + 4294967295u)));
    uint sumValue17 = uint(min(int(uint(max(int(uint(int(sumValue15))), int(0u)))), int(uint(int(ViewCB.packedValues[78u].y)) + 4294967295u)));
    uvec4 reinterpretedBits2 = floatBitsToUint(ViewCB.packedValues[91u]);
    uint scalarValue1 = reinterpretedBits2.y;
    uint comparisonValue;
    if (scalarValue1 == 2u)
    {
        comparisonValue = sumValue16;
    }
    else
    {
        comparisonValue = ((((sumValue17 ^ sumValue16) & 1u) != (uint(((scalarValue & 1u) != 0u) && (scalarValue1 == 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue16 >> 1u);
    }
    float sampledTextureValue1 = abs(texelFetch(inputPrimaryWorldPosition, ivec2(uvec2(comparisonValue, sumValue17)), int(0u)).w);
    uint sumValue18 = scalarValue + gl_GlobalInvocationID.z;
    vec4 sampledTextureValue2 = texelFetch(blueNoiseTexture, ivec3(uvec3(gl_GlobalInvocationID.x & 255u, gl_GlobalInvocationID.y & 255u, (sumValue18 >> 2u) & 127u)), int(0u));
    uint bitwiseValue14 = sumValue18 & 3u;
    float intermediateValue11;
    if (bitwiseValue14 == 0u)
    {
        intermediateValue11 = sampledTextureValue2.x;
    }
    else
    {
        float branchMergedValue9;
        if (bitwiseValue14 == 1u)
        {
            branchMergedValue9 = sampledTextureValue2.y;
        }
        else
        {
            branchMergedValue9 = (bitwiseValue14 == 2u) ? sampledTextureValue2.z : sampledTextureValue2.w;
        }
        intermediateValue11 = branchMergedValue9;
    }
    precise float sumValue19 = intermediateValue11 + (-0.5);
    precise float productValue19 = sumValue19 * ViewCB.packedValues[55u].z;
    precise float sumValue20 = productValue19 + sumValue4;
    precise float productValue20 = sumValue20 * 3.45943164825439453125;
    precise float exponentialValue2 = exp2(productValue20) + (-1.0);
    precise float productValue21 = exponentialValue2 * 50.0;
    precise float quotientValue1 = productValue21 / 10.0;
    float intermediateValue12;
    if (sampledTextureValue1 == 65504.0)
    {
        intermediateValue12 = quotientValue1;
    }
    else
    {
        precise float productValue22 = sampledTextureValue1 * 0.9900000095367431640625;
        precise float sumValue21 = productValue22 + (-0.00999999977648258209228515625);
        intermediateValue12 = spvNMin(sumValue21, quotientValue1);
    }
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if (intermediateValue12 < quotientValue)
    {
        float sumValue22 = spvNMax(intermediateValue6 + (-1.0), 0.0);
        float branchMergedValue10;
        float branchMergedValue16;
        float branchMergedValue17;
        float branchMergedValue18;
        if (reinterpretedBits1 && (sumValue22 > 0.0))
        {
            float multiplyAddValue15 = spvNClamp(fma(sumValue22, 0.3333333432674407958984375, -0.3333333432674407958984375), 0.0, 1.0) + 0.001000000047497451305389404296875;
            vec4 sampledTextureValue3 = textureLod(sampler3D(volumetricInscatterPrevious, linearSampler), vec3(fma(sumValue5, ViewCB.packedValues[55u].x, intermediateValue7), fma(sumValue6, ViewCB.packedValues[55u].y, intermediateValue8), fma(sumValue7, ViewCB.packedValues[55u].z, intermediateValue9)), 0.0);
            float scalarValue2 = sampledTextureValue3.w;
            float multiplyAddValue16 = spvNClamp(fma(scalarValue2, 0.3333333432674407958984375, -0.3333333432674407958984375), 0.0, 1.0) + 0.001000000047497451305389404296875;
            float sumValue23 = multiplyAddValue16 + multiplyAddValue15;
            float branchMergedValue38;
            float branchMergedValue39;
            float branchMergedValue40;
            float branchMergedValue41;
            if (sumValue23 > 0.0)
            {
                branchMergedValue38 = ((multiplyAddValue16 * sampledTextureValue3.y) + (multiplyAddValue15 * intermediateValue4)) / sumValue23;
                branchMergedValue39 = ((multiplyAddValue16 * sampledTextureValue3.x) + (multiplyAddValue15 * intermediateValue3)) / sumValue23;
                branchMergedValue40 = ((multiplyAddValue16 * scalarValue2) + (multiplyAddValue15 * sumValue22)) / sumValue23;
                branchMergedValue41 = ((multiplyAddValue16 * sampledTextureValue3.z) + (multiplyAddValue15 * intermediateValue5)) / sumValue23;
            }
            else
            {
                branchMergedValue38 = 0.0;
                branchMergedValue39 = 0.0;
                branchMergedValue40 = 0.0;
                branchMergedValue41 = 0.0;
            }
            branchMergedValue10 = branchMergedValue38;
            branchMergedValue16 = branchMergedValue39;
            branchMergedValue17 = branchMergedValue40;
            branchMergedValue18 = branchMergedValue41;
        }
        else
        {
            branchMergedValue10 = intermediateValue4 * 0.800000011920928955078125;
            branchMergedValue16 = intermediateValue3 * 0.800000011920928955078125;
            branchMergedValue17 = sumValue22;
            branchMergedValue18 = intermediateValue5 * 0.800000011920928955078125;
        }
        intermediateValue16 = branchMergedValue16;
        intermediateValue17 = branchMergedValue10;
        intermediateValue18 = branchMergedValue18;
        intermediateValue19 = branchMergedValue17;
    }
    else
    {
        precise float sumValue24 = float(int(sumValue16)) + 0.5;
        precise float sumValue25 = float(int(sumValue17)) + 0.5;
        precise float productValue23 = ViewCB.packedValues[78u].z * sumValue24;
        precise float productValue24 = ViewCB.packedValues[78u].w * sumValue25;
        precise float productValue25 = productValue23 * 2.0;
        precise float productValue26 = productValue24 * 2.0;
        precise float sumValue26 = productValue25 + (-1.0);
        precise float sumValue27 = 1.0 - productValue26;
        precise float productValue27 = ViewCB.packedValues[81u].z * ViewCB.packedValues[78u].z;
        precise float productValue28 = ViewCB.packedValues[81u].w * ViewCB.packedValues[78u].w;
        precise float productValue29 = productValue27 * 2.0;
        precise float productValue30 = productValue28 * 2.0;
        precise float sumValue28 = productValue29 + sumValue26;
        precise float sumValue29 = sumValue27 - productValue30;
        precise float productValue31 = ViewCB.packedValues[20u].x * sumValue28;
        precise float productValue32 = sumValue29 * ViewCB.packedValues[21u].x;
        precise float sumValue30 = productValue32 + productValue31;
        precise float productValue33 = 0.5 * ViewCB.packedValues[22u].x;
        precise float sumValue31 = productValue33 + sumValue30;
        precise float productValue34 = 1.0 * ViewCB.packedValues[23u].x;
        precise float sumValue32 = productValue34 + sumValue31;
        precise float productValue35 = ViewCB.packedValues[20u].y * sumValue28;
        precise float productValue36 = sumValue29 * ViewCB.packedValues[21u].y;
        precise float sumValue33 = productValue36 + productValue35;
        precise float productValue37 = 0.5 * ViewCB.packedValues[22u].y;
        precise float sumValue34 = productValue37 + sumValue33;
        precise float productValue38 = 1.0 * ViewCB.packedValues[23u].y;
        precise float sumValue35 = productValue38 + sumValue34;
        precise float productValue39 = ViewCB.packedValues[20u].z * sumValue28;
        precise float productValue40 = sumValue29 * ViewCB.packedValues[21u].z;
        precise float sumValue36 = productValue40 + productValue39;
        precise float productValue41 = 0.5 * ViewCB.packedValues[22u].z;
        precise float sumValue37 = productValue41 + sumValue36;
        precise float productValue42 = 1.0 * ViewCB.packedValues[23u].z;
        precise float sumValue38 = productValue42 + sumValue37;
        precise float productValue43 = ViewCB.packedValues[20u].w * sumValue28;
        precise float productValue44 = sumValue29 * ViewCB.packedValues[21u].w;
        precise float sumValue39 = productValue44 + productValue43;
        precise float productValue45 = 0.5 * ViewCB.packedValues[22u].w;
        precise float sumValue40 = productValue45 + sumValue39;
        precise float productValue46 = 1.0 * ViewCB.packedValues[23u].w;
        precise float sumValue41 = productValue46 + sumValue40;
        precise float quotientValue2 = sumValue32 / sumValue41;
        precise float quotientValue3 = sumValue35 / sumValue41;
        precise float quotientValue4 = sumValue38 / sumValue41;
        precise float sumValue42 = quotientValue2 - ViewCB.packedValues[72u].x;
        precise float sumValue43 = quotientValue3 - ViewCB.packedValues[72u].y;
        precise float sumValue44 = quotientValue4 - ViewCB.packedValues[72u].z;
        float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue42, sumValue43, sumValue44), vec3(sumValue42, sumValue43, sumValue44)));
        precise float productValue47 = sumValue42 * inverseLengthValue1;
        precise float productValue48 = sumValue43 * inverseLengthValue1;
        precise float productValue49 = sumValue44 * inverseLengthValue1;
        precise float productValue50 = productValue47 * intermediateValue12;
        precise float sumValue45 = productValue50 + ViewCB.packedValues[72u].x;
        precise float productValue51 = productValue48 * intermediateValue12;
        precise float sumValue46 = productValue51 + ViewCB.packedValues[72u].y;
        precise float productValue52 = productValue49 * intermediateValue12;
        precise float sumValue47 = productValue52 + ViewCB.packedValues[72u].z;
        bool reinterpretedBits3 = floatBitsToUint(ViewCB.packedValues[54u]).w == 0u;
        float multiplyAddValue17;
        if (reinterpretedBits3)
        {
            multiplyAddValue17 = spvNClamp(fma(sumValue46, ViewCB.packedValues[90u].z, ViewCB.packedValues[90u].w), 0.0, 1.0);
        }
        else
        {
            multiplyAddValue17 = 1.0;
        }
        rayQueryInitializeEXT(intermediateValue14, SceneBVH, 512u, 32u, vec3(sumValue45, sumValue46, sumValue47), 0.0, vec3(ViewCB.packedValues[53u].xyz), 10000.0);
        bool conditionValue = rayQueryProceedEXT(intermediateValue14);
        if (conditionValue)
        {
            bool intermediateValue30;
            bool comparisonValue1;
            for (;;)
            {
                uint scalarValue3 = rayQueryGetIntersectionTypeEXT(intermediateValue14, bool(0u));
                comparisonValue1 = scalarValue3 == 0u;
                if (comparisonValue1)
                {
                    vec2 vectorValue = rayQueryGetIntersectionBarycentricsEXT(intermediateValue14, bool(0u));
                    vec2 vectorValue1 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue14, bool(0u));
                    uint scalarValue4 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue14, bool(0u));
                    uint scalarValue5 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue14, bool(0u));
                    uint scalarValue6 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue14, bool(0u));
                    uint productValue53 = (scalarValue6 * 76u) + 58u;
                    uint productValue54 = (scalarValue6 * 76u) + 61u;
                    precise float sumValue48 = 1.0 - vectorValue.x;
                    precise float sumValue49 = sumValue48 - vectorValue1.y;
                    uint bitwiseValue15 = (objectInstances_2.packedValues[(scalarValue6 * 38u) + 25u] >> 2u) + (scalarValue4 >> 1u);
                    uint productValue55 = uint(objectInstances.packedValues[(scalarValue6 * 76u) + 54u]) + 0u;
                    bool comparisonValue2 = (scalarValue4 & 1u) == 0u;
                    uint comparisonValue3 = comparisonValue2 ? faceUvBuffersRW[nonuniformEXT(productValue55)].packedValues[bitwiseValue15].z : faceUvBuffersRW[nonuniformEXT(productValue55)].packedValues[bitwiseValue15].x;
                    uint comparisonValue4 = comparisonValue2 ? faceUvBuffersRW[nonuniformEXT(productValue55)].packedValues[bitwiseValue15].y : faceUvBuffersRW[nonuniformEXT(productValue55)].packedValues[bitwiseValue15].w;
                    uint comparisonValue5 = comparisonValue2 ? faceUvBuffersRW[nonuniformEXT(productValue55)].packedValues[bitwiseValue15].x : faceUvBuffersRW[nonuniformEXT(productValue55)].packedValues[bitwiseValue15].z;
                    bool conditionValue1 = int16_t(objectInstances.packedValues[productValue54]) < int16_t(0us);
                    float intermediateValue48;
                    float intermediateValue49;
                    if (conditionValue1)
                    {
                        uint bitwiseValue16 = comparisonValue5 >> 15u;
                        precise float bitwiseValue17 = float(bitwiseValue16 & 1u) * 2.0;
                        precise float sumValue50 = bitwiseValue17 + (-1.0);
                        precise float bitwiseValue18 = float(comparisonValue5 >> 31u) * 2.0;
                        precise float sumValue51 = bitwiseValue18 + (-1.0);
                        precise float bitwiseValue19 = float((comparisonValue5 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue20 = float(bitwiseValue16 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue56 = sumValue50 * 3.0517578125e-05;
                        precise float productValue57 = sumValue51 * 3.0517578125e-05;
                        precise float sumValue52 = bitwiseValue19 + productValue56;
                        precise float sumValue53 = bitwiseValue20 + productValue57;
                        intermediateValue48 = sumValue52;
                        intermediateValue49 = sumValue53;
                    }
                    else
                    {
                        precise float bitwiseValue21 = float(comparisonValue5 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue22 = float(comparisonValue5 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue58 = bitwiseValue21 * 16384.0;
                        precise float sumValue54 = productValue58 + 0.5;
                        precise float productValue59 = bitwiseValue22 * 16384.0;
                        precise float sumValue55 = productValue59 + 0.5;
                        precise float productValue60 = floor(sumValue54) * 6.103515625e-05;
                        precise float productValue61 = floor(sumValue55) * 6.103515625e-05;
                        intermediateValue48 = productValue60;
                        intermediateValue49 = productValue61;
                    }
                    precise float productValue62 = sumValue49 * intermediateValue48;
                    precise float productValue63 = sumValue49 * intermediateValue49;
                    precise float sumValue56 = productValue62 + 0.0;
                    precise float sumValue57 = productValue63 + 0.0;
                    float intermediateValue85;
                    float intermediateValue86;
                    if (conditionValue1)
                    {
                        uint bitwiseValue23 = comparisonValue4 >> 15u;
                        precise float bitwiseValue24 = float(bitwiseValue23 & 1u) * 2.0;
                        precise float sumValue58 = bitwiseValue24 + (-1.0);
                        precise float bitwiseValue25 = float(comparisonValue4 >> 31u) * 2.0;
                        precise float sumValue59 = bitwiseValue25 + (-1.0);
                        precise float bitwiseValue26 = float((comparisonValue4 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue27 = float(bitwiseValue23 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue64 = sumValue58 * 3.0517578125e-05;
                        precise float productValue65 = sumValue59 * 3.0517578125e-05;
                        precise float sumValue60 = bitwiseValue26 + productValue64;
                        precise float sumValue61 = bitwiseValue27 + productValue65;
                        intermediateValue85 = sumValue60;
                        intermediateValue86 = sumValue61;
                    }
                    else
                    {
                        precise float bitwiseValue28 = float(comparisonValue4 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue29 = float(comparisonValue4 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue66 = bitwiseValue28 * 16384.0;
                        precise float sumValue62 = productValue66 + 0.5;
                        precise float productValue67 = bitwiseValue29 * 16384.0;
                        precise float sumValue63 = productValue67 + 0.5;
                        precise float productValue68 = floor(sumValue62) * 6.103515625e-05;
                        precise float productValue69 = floor(sumValue63) * 6.103515625e-05;
                        intermediateValue85 = productValue68;
                        intermediateValue86 = productValue69;
                    }
                    precise float productValue70 = vectorValue.x * intermediateValue85;
                    precise float productValue71 = vectorValue.x * intermediateValue86;
                    precise float sumValue64 = sumValue56 + productValue70;
                    precise float sumValue65 = sumValue57 + productValue71;
                    float intermediateValue115;
                    float intermediateValue116;
                    if (conditionValue1)
                    {
                        uint bitwiseValue30 = comparisonValue3 >> 15u;
                        precise float bitwiseValue31 = float(bitwiseValue30 & 1u) * 2.0;
                        precise float sumValue66 = bitwiseValue31 + (-1.0);
                        precise float bitwiseValue32 = float(comparisonValue3 >> 31u) * 2.0;
                        precise float sumValue67 = bitwiseValue32 + (-1.0);
                        precise float bitwiseValue33 = float((comparisonValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue34 = float(bitwiseValue30 & 65534u) * 1.525902189314365386962890625e-05;
                        precise float productValue72 = sumValue66 * 3.0517578125e-05;
                        precise float productValue73 = sumValue67 * 3.0517578125e-05;
                        precise float sumValue68 = bitwiseValue33 + productValue72;
                        precise float sumValue69 = bitwiseValue34 + productValue73;
                        intermediateValue115 = sumValue68;
                        intermediateValue116 = sumValue69;
                    }
                    else
                    {
                        precise float bitwiseValue35 = float(comparisonValue3 & 65535u) * 1.525902189314365386962890625e-05;
                        precise float bitwiseValue36 = float(comparisonValue3 >> 16u) * 1.525902189314365386962890625e-05;
                        precise float productValue74 = bitwiseValue35 * 16384.0;
                        precise float sumValue70 = productValue74 + 0.5;
                        precise float productValue75 = bitwiseValue36 * 16384.0;
                        precise float sumValue71 = productValue75 + 0.5;
                        precise float productValue76 = floor(sumValue70) * 6.103515625e-05;
                        precise float productValue77 = floor(sumValue71) * 6.103515625e-05;
                        intermediateValue115 = productValue76;
                        intermediateValue116 = productValue77;
                    }
                    precise float productValue78 = vectorValue1.y * intermediateValue115;
                    precise float productValue79 = vectorValue1.y * intermediateValue116;
                    precise float sumValue72 = sumValue64 + productValue78;
                    precise float sumValue73 = sumValue65 + productValue79;
                    float intermediateValue119;
                    if (objectInstances.packedValues[productValue53] == 65535us)
                    {
                        intermediateValue119 = 1.0;
                    }
                    else
                    {
                        uint reinterpretedBits4;
                        if (objectInstances.packedValues[productValue53] > 4095us)
                        {
                            reinterpretedBits4 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits4 = uint(objectInstances.packedValues[productValue53]);
                        }
                        intermediateValue119 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits4 + 0u], defaultSampler)), vec2(sumValue72, sumValue73), -0.25).w;
                    }
                    uint comparisonValue28;
                    if (scalarValue5 == 2u)
                    {
                        comparisonValue28 = 0u;
                    }
                    else
                    {
                        comparisonValue28 = uint(intermediateValue119 <= (((objectInstances.packedValues[productValue54] & 4352us) != 0us) ? 0.5 : 0.0));
                    }
                    if (comparisonValue28 == 0u)
                    {
                        rayQueryConfirmIntersectionEXT(intermediateValue14);
                    }
                }
                intermediateValue30 = rayQueryProceedEXT(intermediateValue14);
                if (intermediateValue30)
                {
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        uint scalarValue7 = rayQueryGetIntersectionTypeEXT(intermediateValue14, bool(1u));
        float intermediateValue23;
        if (scalarValue7 == 1u)
        {
            float scalarValue8 = rayQueryGetIntersectionTEXT(intermediateValue14, bool(1u));
            intermediateValue23 = scalarValue8;
        }
        else
        {
            intermediateValue23 = 10000.0;
        }
        float intermediateValue45;
        float intermediateValue46;
        float intermediateValue47;
        if (intermediateValue23 < 10000.0)
        {
            precise float productValue80 = intermediateValue23 * ViewCB.packedValues[63u].x;
            precise float productValue81 = intermediateValue23 * ViewCB.packedValues[63u].y;
            precise float productValue82 = intermediateValue23 * ViewCB.packedValues[63u].z;
            precise float productValue83 = productValue80 * (-1.44269502162933349609375);
            precise float productValue84 = productValue81 * (-1.44269502162933349609375);
            precise float productValue85 = productValue82 * (-1.44269502162933349609375);
            precise float productValue86 = ViewCB.packedValues[53u].x * intermediateValue23;
            precise float sumValue74 = productValue86 + sumValue45;
            precise float productValue87 = ViewCB.packedValues[53u].z * intermediateValue23;
            precise float sumValue75 = productValue87 + sumValue47;
            precise float productValue88 = sumValue74 * ViewCB.packedValues[83u].z;
            precise float sumValue76 = productValue88 + ViewCB.packedValues[84u].x;
            precise float productValue89 = sumValue75 * ViewCB.packedValues[83u].w;
            precise float sumValue77 = productValue89 + ViewCB.packedValues[84u].y;
            vec4 sampledTextureValue4 = textureLod(sampler2D(wibblyTexture, linearWrapSampler), vec2(sumValue76, sumValue77), 0.0);
            precise float sumValue78 = sampledTextureValue4.x + (-0.5);
            precise float sumValue79 = sampledTextureValue4.y + (-0.5);
            precise float productValue90 = sumValue74 * ViewCB.packedValues[82u].z;
            precise float sumValue80 = productValue90 + ViewCB.packedValues[83u].x;
            precise float productValue91 = sumValue75 * ViewCB.packedValues[82u].w;
            precise float sumValue81 = productValue91 + ViewCB.packedValues[83u].y;
            precise float productValue92 = sumValue78 * 0.4000000059604644775390625;
            precise float productValue93 = sumValue79 * 0.4000000059604644775390625;
            precise float sumValue82 = sumValue80 + productValue92;
            precise float sumValue83 = productValue93 + sumValue81;
            precise float productValue94 = ViewCB.packedValues[68u].w * 63.0;
            uint scalarValue9 = uint(int(floor(productValue94)));
            precise float productValue95 = float(int(scalarValue9 + 1u)) * 0.015625;
            precise float sumValue84 = (-0.0) - productValue95;
            float scalarValue10 = fract(abs(productValue95));
            precise float sumValue85 = (-0.0) - scalarValue10;
            precise float comparisonValue6 = ((productValue95 >= sumValue84) ? scalarValue10 : sumValue85) * 64.0;
            vec4 sampledTextureValue5 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue82, sumValue83, float(int(scalarValue9))), 0.0);
            float scalarValue11 = sampledTextureValue5.x;
            precise float sampledTextureValue6 = textureLod(sampler2DArray(causticsTexture, linearWrapSampler), vec3(sumValue82, sumValue83, float(int(uint(int(comparisonValue6))))), 0.0).x - scalarValue11;
            precise float productValue96 = fract(productValue94) * sampledTextureValue6;
            precise float sumValue86 = scalarValue11 + productValue96;
            precise float productValue97 = sumValue86 * 7.0;
            precise float sumValue87 = productValue97 + 0.800000011920928955078125;
            precise float productValue98 = intermediateValue23 * (-0.100000001490116119384765625);
            precise float sumValue88 = sumValue87 + (-1.0);
            precise float exponentialValue3 = exp2(productValue98) * sumValue88;
            precise float sumValue89 = exponentialValue3 + 1.0;
            precise float exponentialValue4 = exp2(productValue83) * sumValue89;
            precise float exponentialValue5 = exp2(productValue84) * sumValue89;
            precise float exponentialValue6 = exp2(productValue85) * sumValue89;
            rayQueryInitializeEXT(intermediateValue34, SceneBVH, 512u, 22u, vec3(sumValue45, sumValue46, sumValue47), 0.0, vec3(ViewCB.packedValues[53u].xyz), intermediateValue23);
            bool conditionValue2 = rayQueryProceedEXT(intermediateValue34);
            float intermediateValue36;
            float intermediateValue38;
            float intermediateValue40;
            if (conditionValue2)
            {
                float intermediateValue37;
                float intermediateValue39;
                float intermediateValue41;
                float scalarValue12 = exponentialValue4;
                float scalarValue13 = exponentialValue5;
                float scalarValue14 = exponentialValue6;
                bool comparisonValue11;
                for (;;)
                {
                    uint scalarValue15 = rayQueryGetIntersectionTypeEXT(intermediateValue34, bool(0u));
                    comparisonValue11 = scalarValue15 == 0u;
                    float branchMergedValue;
                    float branchMergedValue3;
                    float branchMergedValue4;
                    if (comparisonValue11)
                    {
                        vec2 vectorValue2 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue34, bool(0u));
                        vec2 vectorValue3 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue34, bool(0u));
                        float scalarValue16 = rayQueryGetIntersectionTEXT(intermediateValue34, bool(0u));
                        uint scalarValue17 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue34, bool(0u));
                        uint scalarValue18 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue34, bool(0u));
                        uint scalarValue19 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue34, bool(0u));
                        uint productValue99 = (scalarValue19 * 76u) + 58u;
                        uint productValue100 = (scalarValue19 * 76u) + 61u;
                        precise float sumValue90 = 1.0 - vectorValue2.x;
                        precise float sumValue91 = sumValue90 - vectorValue3.y;
                        uint bitwiseValue37 = (objectInstances_2.packedValues[(scalarValue19 * 38u) + 25u] >> 2u) + (scalarValue17 >> 1u);
                        uint productValue101 = uint(objectInstances.packedValues[(scalarValue19 * 76u) + 54u]) + 0u;
                        bool comparisonValue7 = (scalarValue17 & 1u) == 0u;
                        uint comparisonValue8 = comparisonValue7 ? faceUvBuffersRW[nonuniformEXT(productValue101)].packedValues[bitwiseValue37].z : faceUvBuffersRW[nonuniformEXT(productValue101)].packedValues[bitwiseValue37].x;
                        uint comparisonValue9 = comparisonValue7 ? faceUvBuffersRW[nonuniformEXT(productValue101)].packedValues[bitwiseValue37].y : faceUvBuffersRW[nonuniformEXT(productValue101)].packedValues[bitwiseValue37].w;
                        uint comparisonValue10 = comparisonValue7 ? faceUvBuffersRW[nonuniformEXT(productValue101)].packedValues[bitwiseValue37].x : faceUvBuffersRW[nonuniformEXT(productValue101)].packedValues[bitwiseValue37].z;
                        bool conditionValue3 = int16_t(objectInstances.packedValues[productValue100]) < int16_t(0us);
                        float intermediateValue102;
                        float intermediateValue103;
                        if (conditionValue3)
                        {
                            uint bitwiseValue38 = comparisonValue10 >> 15u;
                            precise float bitwiseValue39 = float(bitwiseValue38 & 1u) * 2.0;
                            precise float sumValue92 = bitwiseValue39 + (-1.0);
                            precise float bitwiseValue40 = float(comparisonValue10 >> 31u) * 2.0;
                            precise float sumValue93 = bitwiseValue40 + (-1.0);
                            precise float bitwiseValue41 = float((comparisonValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue42 = float(bitwiseValue38 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue102 = sumValue92 * 3.0517578125e-05;
                            precise float productValue103 = sumValue93 * 3.0517578125e-05;
                            precise float sumValue94 = bitwiseValue41 + productValue102;
                            precise float sumValue95 = bitwiseValue42 + productValue103;
                            intermediateValue102 = sumValue94;
                            intermediateValue103 = sumValue95;
                        }
                        else
                        {
                            precise float bitwiseValue43 = float(comparisonValue10 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue44 = float(comparisonValue10 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue104 = bitwiseValue43 * 16384.0;
                            precise float sumValue96 = productValue104 + 0.5;
                            precise float productValue105 = bitwiseValue44 * 16384.0;
                            precise float sumValue97 = productValue105 + 0.5;
                            precise float productValue106 = floor(sumValue96) * 6.103515625e-05;
                            precise float productValue107 = floor(sumValue97) * 6.103515625e-05;
                            intermediateValue102 = productValue106;
                            intermediateValue103 = productValue107;
                        }
                        precise float productValue108 = sumValue91 * intermediateValue102;
                        precise float productValue109 = sumValue91 * intermediateValue103;
                        precise float sumValue98 = productValue108 + 0.0;
                        precise float sumValue99 = productValue109 + 0.0;
                        float intermediateValue120;
                        float intermediateValue121;
                        if (conditionValue3)
                        {
                            uint bitwiseValue45 = comparisonValue9 >> 15u;
                            precise float bitwiseValue46 = float(bitwiseValue45 & 1u) * 2.0;
                            precise float sumValue100 = bitwiseValue46 + (-1.0);
                            precise float bitwiseValue47 = float(comparisonValue9 >> 31u) * 2.0;
                            precise float sumValue101 = bitwiseValue47 + (-1.0);
                            precise float bitwiseValue48 = float((comparisonValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue49 = float(bitwiseValue45 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue110 = sumValue100 * 3.0517578125e-05;
                            precise float productValue111 = sumValue101 * 3.0517578125e-05;
                            precise float sumValue102 = bitwiseValue48 + productValue110;
                            precise float sumValue103 = bitwiseValue49 + productValue111;
                            intermediateValue120 = sumValue102;
                            intermediateValue121 = sumValue103;
                        }
                        else
                        {
                            precise float bitwiseValue50 = float(comparisonValue9 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue51 = float(comparisonValue9 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue112 = bitwiseValue50 * 16384.0;
                            precise float sumValue104 = productValue112 + 0.5;
                            precise float productValue113 = bitwiseValue51 * 16384.0;
                            precise float sumValue105 = productValue113 + 0.5;
                            precise float productValue114 = floor(sumValue104) * 6.103515625e-05;
                            precise float productValue115 = floor(sumValue105) * 6.103515625e-05;
                            intermediateValue120 = productValue114;
                            intermediateValue121 = productValue115;
                        }
                        precise float productValue116 = vectorValue2.x * intermediateValue120;
                        precise float productValue117 = vectorValue2.x * intermediateValue121;
                        precise float sumValue106 = sumValue98 + productValue116;
                        precise float sumValue107 = sumValue99 + productValue117;
                        float intermediateValue126;
                        float intermediateValue127;
                        if (conditionValue3)
                        {
                            uint bitwiseValue52 = comparisonValue8 >> 15u;
                            precise float bitwiseValue53 = float(bitwiseValue52 & 1u) * 2.0;
                            precise float sumValue108 = bitwiseValue53 + (-1.0);
                            precise float bitwiseValue54 = float(comparisonValue8 >> 31u) * 2.0;
                            precise float sumValue109 = bitwiseValue54 + (-1.0);
                            precise float bitwiseValue55 = float((comparisonValue8 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue56 = float(bitwiseValue52 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue118 = sumValue108 * 3.0517578125e-05;
                            precise float productValue119 = sumValue109 * 3.0517578125e-05;
                            precise float sumValue110 = bitwiseValue55 + productValue118;
                            precise float sumValue111 = bitwiseValue56 + productValue119;
                            intermediateValue126 = sumValue110;
                            intermediateValue127 = sumValue111;
                        }
                        else
                        {
                            precise float bitwiseValue57 = float(comparisonValue8 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue58 = float(comparisonValue8 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue120 = bitwiseValue57 * 16384.0;
                            precise float sumValue112 = productValue120 + 0.5;
                            precise float productValue121 = bitwiseValue58 * 16384.0;
                            precise float sumValue113 = productValue121 + 0.5;
                            precise float productValue122 = floor(sumValue112) * 6.103515625e-05;
                            precise float productValue123 = floor(sumValue113) * 6.103515625e-05;
                            intermediateValue126 = productValue122;
                            intermediateValue127 = productValue123;
                        }
                        precise float productValue124 = vectorValue3.y * intermediateValue126;
                        precise float productValue125 = vectorValue3.y * intermediateValue127;
                        precise float sumValue114 = sumValue106 + productValue124;
                        precise float sumValue115 = sumValue107 + productValue125;
                        precise float productValue126 = scalarValue16 * 0.083333335816860198974609375;
                        precise float sumValue116 = productValue126 + (-0.25);
                        float intermediateValue130;
                        float intermediateValue131;
                        float intermediateValue132;
                        float intermediateValue133;
                        if (objectInstances.packedValues[productValue99] == 65535us)
                        {
                            intermediateValue130 = 1.0;
                            intermediateValue131 = 1.0;
                            intermediateValue132 = 1.0;
                            intermediateValue133 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits5;
                            if (objectInstances.packedValues[productValue99] > 4095us)
                            {
                                reinterpretedBits5 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits5 = uint(objectInstances.packedValues[productValue99]);
                            }
                            vec4 sampledTextureValue7 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits5 + 0u], defaultSampler)), vec2(sumValue114, sumValue115), spvNMin(sumValue116, 2.0));
                            intermediateValue130 = sampledTextureValue7.x;
                            intermediateValue131 = sampledTextureValue7.y;
                            intermediateValue132 = sampledTextureValue7.z;
                            intermediateValue133 = sampledTextureValue7.w;
                        }
                        float intermediateValue142;
                        float intermediateValue143;
                        float intermediateValue144;
                        if (scalarValue18 == 2u)
                        {
                            float branchMergedValue13;
                            float branchMergedValue23;
                            float branchMergedValue24;
                            if ((objectInstances.packedValues[productValue100] & 128us) == 0us)
                            {
                                float intermediateValue149;
                                if ((objectInstances.packedValues[productValue100] & 2048us) == 0us)
                                {
                                    intermediateValue149 = intermediateValue133;
                                }
                                else
                                {
                                    precise float productValue127 = intermediateValue133 * 2.0;
                                    precise float sumValue117 = productValue127 + (-1.0);
                                    intermediateValue149 = spvNClamp(sumValue117, 0.0, 1.0);
                                }
                                precise float sumValue118 = 0.0 - intermediateValue130;
                                precise float sumValue119 = 0.0 - intermediateValue131;
                                precise float sumValue120 = 0.0 - intermediateValue132;
                                precise float productValue128 = sumValue118 * intermediateValue149;
                                precise float productValue129 = sumValue119 * intermediateValue149;
                                precise float productValue130 = sumValue120 * intermediateValue149;
                                precise float sumValue121 = intermediateValue130 + productValue128;
                                precise float sumValue122 = intermediateValue131 + productValue129;
                                precise float sumValue123 = intermediateValue132 + productValue130;
                                branchMergedValue13 = sumValue123;
                                branchMergedValue23 = sumValue122;
                                branchMergedValue24 = sumValue121;
                            }
                            else
                            {
                                branchMergedValue13 = 0.33399999141693115234375;
                                branchMergedValue23 = 0.33399999141693115234375;
                                branchMergedValue24 = 0.33399999141693115234375;
                            }
                            intermediateValue142 = branchMergedValue24;
                            intermediateValue143 = branchMergedValue23;
                            intermediateValue144 = branchMergedValue13;
                        }
                        else
                        {
                            precise float sumValue124 = 1.0 - intermediateValue133;
                            intermediateValue142 = sumValue124;
                            intermediateValue143 = sumValue124;
                            intermediateValue144 = sumValue124;
                        }
                        precise float productValue131 = scalarValue12 * intermediateValue142;
                        precise float productValue132 = scalarValue13 * intermediateValue143;
                        precise float productValue133 = scalarValue14 * intermediateValue144;
                        float intermediateValue70;
                        float intermediateValue71;
                        float intermediateValue72;
                        bool intermediateValue150;
                        if (!(dot(vec3(productValue131, productValue132, productValue133), vec3(1.0)) <= 0.00999999977648258209228515625))
                        {
                            intermediateValue150 = false;
                            intermediateValue70 = productValue131;
                            intermediateValue71 = productValue132;
                            intermediateValue72 = productValue133;
                        }
                        else
                        {
                            intermediateValue150 = true;
                            intermediateValue70 = 0.0;
                            intermediateValue71 = 0.0;
                            intermediateValue72 = 0.0;
                        }
                        float branchMergedValue29;
                        float branchMergedValue32;
                        float branchMergedValue33;
                        if (intermediateValue150)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue34);
                            branchMergedValue29 = intermediateValue72;
                            branchMergedValue32 = intermediateValue71;
                            branchMergedValue33 = intermediateValue70;
                        }
                        else
                        {
                            branchMergedValue29 = intermediateValue72;
                            branchMergedValue32 = intermediateValue71;
                            branchMergedValue33 = intermediateValue70;
                        }
                        branchMergedValue = branchMergedValue29;
                        branchMergedValue3 = branchMergedValue32;
                        branchMergedValue4 = branchMergedValue33;
                    }
                    else
                    {
                        branchMergedValue = scalarValue14;
                        branchMergedValue3 = scalarValue13;
                        branchMergedValue4 = scalarValue12;
                    }
                    intermediateValue41 = branchMergedValue;
                    intermediateValue39 = branchMergedValue3;
                    intermediateValue37 = branchMergedValue4;
                    bool conditionValue4 = rayQueryProceedEXT(intermediateValue34);
                    if (conditionValue4)
                    {
                        scalarValue12 = intermediateValue37;
                        scalarValue13 = intermediateValue39;
                        scalarValue14 = intermediateValue41;
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
                intermediateValue36 = intermediateValue37;
                intermediateValue38 = intermediateValue39;
                intermediateValue40 = intermediateValue41;
            }
            else
            {
                intermediateValue36 = exponentialValue4;
                intermediateValue38 = exponentialValue5;
                intermediateValue40 = exponentialValue6;
            }
            uint scalarValue20 = rayQueryGetIntersectionTypeEXT(intermediateValue34, bool(1u));
            bool comparisonValue12 = scalarValue20 == 1u;
            float comparisonValue13 = comparisonValue12 ? 0.0 : intermediateValue36;
            float comparisonValue14 = comparisonValue12 ? 0.0 : intermediateValue38;
            float comparisonValue15 = comparisonValue12 ? 0.0 : intermediateValue40;
            float branchMergedValue12;
            float branchMergedValue21;
            float branchMergedValue22;
            if (dot(vec3(comparisonValue13, comparisonValue14, comparisonValue15), vec3(1.0)) > 0.00999999977648258209228515625)
            {
                rayQueryInitializeEXT(intermediateValue54, SceneBVH, 512u, 22u, vec3(sumValue74, fma(ViewCB.packedValues[53u].y, intermediateValue23, sumValue46), sumValue75), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                bool conditionValue5 = rayQueryProceedEXT(intermediateValue54);
                float intermediateValue74;
                float intermediateValue76;
                float intermediateValue78;
                if (conditionValue5)
                {
                    float intermediateValue75;
                    float intermediateValue77;
                    float intermediateValue79;
                    float scalarValue21 = comparisonValue13;
                    float scalarValue22 = comparisonValue14;
                    float scalarValue23 = comparisonValue15;
                    bool comparisonValue19;
                    for (;;)
                    {
                        uint scalarValue24 = rayQueryGetIntersectionTypeEXT(intermediateValue54, bool(0u));
                        comparisonValue19 = scalarValue24 == 0u;
                        float branchMergedValue2;
                        float branchMergedValue7;
                        float branchMergedValue8;
                        if (comparisonValue19)
                        {
                            vec2 vectorValue4 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue54, bool(0u));
                            vec2 vectorValue5 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue54, bool(0u));
                            float scalarValue25 = rayQueryGetIntersectionTEXT(intermediateValue54, bool(0u));
                            uint scalarValue26 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue54, bool(0u));
                            uint scalarValue27 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue54, bool(0u));
                            uint scalarValue28 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue54, bool(0u));
                            uint productValue134 = (scalarValue28 * 76u) + 58u;
                            uint productValue135 = (scalarValue28 * 76u) + 61u;
                            precise float sumValue125 = 1.0 - vectorValue4.x;
                            precise float sumValue126 = sumValue125 - vectorValue5.y;
                            uint bitwiseValue59 = (objectInstances_2.packedValues[(scalarValue28 * 38u) + 25u] >> 2u) + (scalarValue26 >> 1u);
                            uint productValue136 = uint(objectInstances.packedValues[(scalarValue28 * 76u) + 54u]) + 0u;
                            bool comparisonValue16 = (scalarValue26 & 1u) == 0u;
                            uint comparisonValue17 = comparisonValue16 ? faceUvBuffersRW[nonuniformEXT(productValue136)].packedValues[bitwiseValue59].z : faceUvBuffersRW[nonuniformEXT(productValue136)].packedValues[bitwiseValue59].x;
                            uint comparisonValue20 = comparisonValue16 ? faceUvBuffersRW[nonuniformEXT(productValue136)].packedValues[bitwiseValue59].y : faceUvBuffersRW[nonuniformEXT(productValue136)].packedValues[bitwiseValue59].w;
                            uint comparisonValue21 = comparisonValue16 ? faceUvBuffersRW[nonuniformEXT(productValue136)].packedValues[bitwiseValue59].x : faceUvBuffersRW[nonuniformEXT(productValue136)].packedValues[bitwiseValue59].z;
                            bool conditionValue6 = int16_t(objectInstances.packedValues[productValue135]) < int16_t(0us);
                            float intermediateValue122;
                            float intermediateValue123;
                            if (conditionValue6)
                            {
                                uint bitwiseValue60 = comparisonValue21 >> 15u;
                                precise float bitwiseValue61 = float(bitwiseValue60 & 1u) * 2.0;
                                precise float sumValue127 = bitwiseValue61 + (-1.0);
                                precise float bitwiseValue62 = float(comparisonValue21 >> 31u) * 2.0;
                                precise float sumValue128 = bitwiseValue62 + (-1.0);
                                precise float bitwiseValue63 = float((comparisonValue21 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue64 = float(bitwiseValue60 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue137 = sumValue127 * 3.0517578125e-05;
                                precise float productValue138 = sumValue128 * 3.0517578125e-05;
                                precise float sumValue129 = bitwiseValue63 + productValue137;
                                precise float sumValue130 = bitwiseValue64 + productValue138;
                                intermediateValue122 = sumValue129;
                                intermediateValue123 = sumValue130;
                            }
                            else
                            {
                                precise float bitwiseValue65 = float(comparisonValue21 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue66 = float(comparisonValue21 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue139 = bitwiseValue65 * 16384.0;
                                precise float sumValue131 = productValue139 + 0.5;
                                precise float productValue140 = bitwiseValue66 * 16384.0;
                                precise float sumValue132 = productValue140 + 0.5;
                                precise float productValue141 = floor(sumValue131) * 6.103515625e-05;
                                precise float productValue142 = floor(sumValue132) * 6.103515625e-05;
                                intermediateValue122 = productValue141;
                                intermediateValue123 = productValue142;
                            }
                            precise float productValue143 = sumValue126 * intermediateValue122;
                            precise float productValue144 = sumValue126 * intermediateValue123;
                            precise float sumValue133 = productValue143 + 0.0;
                            precise float sumValue134 = productValue144 + 0.0;
                            float intermediateValue128;
                            float intermediateValue129;
                            if (conditionValue6)
                            {
                                uint bitwiseValue67 = comparisonValue20 >> 15u;
                                precise float bitwiseValue68 = float(bitwiseValue67 & 1u) * 2.0;
                                precise float sumValue135 = bitwiseValue68 + (-1.0);
                                precise float bitwiseValue69 = float(comparisonValue20 >> 31u) * 2.0;
                                precise float sumValue136 = bitwiseValue69 + (-1.0);
                                precise float bitwiseValue70 = float((comparisonValue20 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue71 = float(bitwiseValue67 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue145 = sumValue135 * 3.0517578125e-05;
                                precise float productValue146 = sumValue136 * 3.0517578125e-05;
                                precise float sumValue137 = bitwiseValue70 + productValue145;
                                precise float sumValue138 = bitwiseValue71 + productValue146;
                                intermediateValue128 = sumValue137;
                                intermediateValue129 = sumValue138;
                            }
                            else
                            {
                                precise float bitwiseValue72 = float(comparisonValue20 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue73 = float(comparisonValue20 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue147 = bitwiseValue72 * 16384.0;
                                precise float sumValue139 = productValue147 + 0.5;
                                precise float productValue148 = bitwiseValue73 * 16384.0;
                                precise float sumValue140 = productValue148 + 0.5;
                                precise float productValue149 = floor(sumValue139) * 6.103515625e-05;
                                precise float productValue150 = floor(sumValue140) * 6.103515625e-05;
                                intermediateValue128 = productValue149;
                                intermediateValue129 = productValue150;
                            }
                            precise float productValue151 = vectorValue4.x * intermediateValue128;
                            precise float productValue152 = vectorValue4.x * intermediateValue129;
                            precise float sumValue141 = sumValue133 + productValue151;
                            precise float sumValue142 = sumValue134 + productValue152;
                            float intermediateValue136;
                            float intermediateValue137;
                            if (conditionValue6)
                            {
                                uint bitwiseValue74 = comparisonValue17 >> 15u;
                                precise float bitwiseValue75 = float(bitwiseValue74 & 1u) * 2.0;
                                precise float sumValue143 = bitwiseValue75 + (-1.0);
                                precise float bitwiseValue76 = float(comparisonValue17 >> 31u) * 2.0;
                                precise float sumValue144 = bitwiseValue76 + (-1.0);
                                precise float bitwiseValue77 = float((comparisonValue17 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue78 = float(bitwiseValue74 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue153 = sumValue143 * 3.0517578125e-05;
                                precise float productValue154 = sumValue144 * 3.0517578125e-05;
                                precise float sumValue145 = bitwiseValue77 + productValue153;
                                precise float sumValue146 = bitwiseValue78 + productValue154;
                                intermediateValue136 = sumValue145;
                                intermediateValue137 = sumValue146;
                            }
                            else
                            {
                                precise float bitwiseValue79 = float(comparisonValue17 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue80 = float(comparisonValue17 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue155 = bitwiseValue79 * 16384.0;
                                precise float sumValue147 = productValue155 + 0.5;
                                precise float productValue156 = bitwiseValue80 * 16384.0;
                                precise float sumValue148 = productValue156 + 0.5;
                                precise float productValue157 = floor(sumValue147) * 6.103515625e-05;
                                precise float productValue158 = floor(sumValue148) * 6.103515625e-05;
                                intermediateValue136 = productValue157;
                                intermediateValue137 = productValue158;
                            }
                            precise float productValue159 = vectorValue5.y * intermediateValue136;
                            precise float productValue160 = vectorValue5.y * intermediateValue137;
                            precise float sumValue149 = sumValue141 + productValue159;
                            precise float sumValue150 = sumValue142 + productValue160;
                            float intermediateValue145;
                            float intermediateValue146;
                            float intermediateValue147;
                            float intermediateValue148;
                            if (objectInstances.packedValues[productValue134] == 65535us)
                            {
                                intermediateValue145 = 1.0;
                                intermediateValue146 = 1.0;
                                intermediateValue147 = 1.0;
                                intermediateValue148 = 1.0;
                            }
                            else
                            {
                                uint reinterpretedBits7;
                                if (objectInstances.packedValues[productValue134] > 4095us)
                                {
                                    reinterpretedBits7 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits7 = uint(objectInstances.packedValues[productValue134]);
                                }
                                vec4 sampledTextureValue8 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits7 + 0u], defaultSampler)), vec2(sumValue149, sumValue150), spvNMin(fma(scalarValue25, 0.083333335816860198974609375, -0.25), 2.0));
                                intermediateValue145 = sampledTextureValue8.x;
                                intermediateValue146 = sampledTextureValue8.y;
                                intermediateValue147 = sampledTextureValue8.z;
                                intermediateValue148 = sampledTextureValue8.w;
                            }
                            float intermediateValue154;
                            float intermediateValue155;
                            float intermediateValue156;
                            if (scalarValue27 == 2u)
                            {
                                float branchMergedValue15;
                                float branchMergedValue27;
                                float branchMergedValue28;
                                if ((objectInstances.packedValues[productValue135] & 128us) == 0us)
                                {
                                    float intermediateValue159;
                                    if ((objectInstances.packedValues[productValue135] & 2048us) == 0us)
                                    {
                                        intermediateValue159 = intermediateValue148;
                                    }
                                    else
                                    {
                                        intermediateValue159 = spvNClamp(fma(intermediateValue148, 2.0, -1.0), 0.0, 1.0);
                                    }
                                    branchMergedValue15 = intermediateValue147 - (intermediateValue159 * intermediateValue147);
                                    branchMergedValue27 = intermediateValue146 - (intermediateValue159 * intermediateValue146);
                                    branchMergedValue28 = intermediateValue145 - (intermediateValue159 * intermediateValue145);
                                }
                                else
                                {
                                    branchMergedValue15 = 0.33399999141693115234375;
                                    branchMergedValue27 = 0.33399999141693115234375;
                                    branchMergedValue28 = 0.33399999141693115234375;
                                }
                                intermediateValue154 = branchMergedValue28;
                                intermediateValue155 = branchMergedValue27;
                                intermediateValue156 = branchMergedValue15;
                            }
                            else
                            {
                                float sumValue151 = 1.0 - intermediateValue148;
                                intermediateValue154 = sumValue151;
                                intermediateValue155 = sumValue151;
                                intermediateValue156 = sumValue151;
                            }
                            float productValue161 = intermediateValue154 * scalarValue21;
                            float productValue162 = intermediateValue155 * scalarValue22;
                            float productValue163 = intermediateValue156 * scalarValue23;
                            float intermediateValue111;
                            float intermediateValue112;
                            float intermediateValue113;
                            bool intermediateValue160;
                            if (!(dot(vec3(productValue161, productValue162, productValue163), vec3(1.0)) <= 0.00999999977648258209228515625))
                            {
                                intermediateValue160 = false;
                                intermediateValue111 = productValue161;
                                intermediateValue112 = productValue162;
                                intermediateValue113 = productValue163;
                            }
                            else
                            {
                                intermediateValue160 = true;
                                intermediateValue111 = 0.0;
                                intermediateValue112 = 0.0;
                                intermediateValue113 = 0.0;
                            }
                            float branchMergedValue31;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            if (intermediateValue160)
                            {
                                rayQueryConfirmIntersectionEXT(intermediateValue54);
                                branchMergedValue31 = intermediateValue113;
                                branchMergedValue36 = intermediateValue112;
                                branchMergedValue37 = intermediateValue111;
                            }
                            else
                            {
                                branchMergedValue31 = intermediateValue113;
                                branchMergedValue36 = intermediateValue112;
                                branchMergedValue37 = intermediateValue111;
                            }
                            branchMergedValue2 = branchMergedValue31;
                            branchMergedValue7 = branchMergedValue36;
                            branchMergedValue8 = branchMergedValue37;
                        }
                        else
                        {
                            branchMergedValue2 = scalarValue23;
                            branchMergedValue7 = scalarValue22;
                            branchMergedValue8 = scalarValue21;
                        }
                        intermediateValue79 = branchMergedValue2;
                        intermediateValue77 = branchMergedValue7;
                        intermediateValue75 = branchMergedValue8;
                        bool conditionValue7 = rayQueryProceedEXT(intermediateValue54);
                        if (conditionValue7)
                        {
                            scalarValue21 = intermediateValue75;
                            scalarValue22 = intermediateValue77;
                            scalarValue23 = intermediateValue79;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue74 = intermediateValue75;
                    intermediateValue76 = intermediateValue77;
                    intermediateValue78 = intermediateValue79;
                }
                else
                {
                    intermediateValue74 = comparisonValue13;
                    intermediateValue76 = comparisonValue14;
                    intermediateValue78 = comparisonValue15;
                }
                uint scalarValue29 = rayQueryGetIntersectionTypeEXT(intermediateValue54, bool(1u));
                bool comparisonValue22 = scalarValue29 == 1u;
                branchMergedValue12 = comparisonValue22 ? 0.0 : intermediateValue78;
                branchMergedValue21 = comparisonValue22 ? 0.0 : intermediateValue76;
                branchMergedValue22 = comparisonValue22 ? 0.0 : intermediateValue74;
            }
            else
            {
                branchMergedValue12 = comparisonValue15;
                branchMergedValue21 = comparisonValue14;
                branchMergedValue22 = comparisonValue13;
            }
            intermediateValue45 = branchMergedValue22;
            intermediateValue46 = branchMergedValue21;
            intermediateValue47 = branchMergedValue12;
        }
        else
        {
            float branchMergedValue11;
            float branchMergedValue19;
            float branchMergedValue20;
            if (reinterpretedBits3)
            {
                rayQueryInitializeEXT(intermediateValue43, SceneBVH, 512u, 22u, vec3(sumValue45, sumValue46, sumValue47), 0.0, vec3(ViewCB.packedValues[52u].xyz), 10000.0);
                bool conditionValue8 = rayQueryProceedEXT(intermediateValue43);
                float intermediateValue56;
                float intermediateValue58;
                float intermediateValue60;
                if (conditionValue8)
                {
                    float intermediateValue57;
                    float intermediateValue59;
                    float intermediateValue61;
                    float scalarValue30 = 1.0;
                    float scalarValue31 = 1.0;
                    float scalarValue32 = 1.0;
                    bool comparisonValue18;
                    for (;;)
                    {
                        uint scalarValue33 = rayQueryGetIntersectionTypeEXT(intermediateValue43, bool(0u));
                        comparisonValue18 = scalarValue33 == 0u;
                        float branchMergedValue1;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (comparisonValue18)
                        {
                            vec2 vectorValue6 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue43, bool(0u));
                            vec2 vectorValue7 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue43, bool(0u));
                            float scalarValue34 = rayQueryGetIntersectionTEXT(intermediateValue43, bool(0u));
                            uint scalarValue35 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue43, bool(0u));
                            uint scalarValue36 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue43, bool(0u));
                            uint scalarValue37 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue43, bool(0u));
                            uint productValue164 = (scalarValue37 * 76u) + 58u;
                            uint productValue165 = (scalarValue37 * 76u) + 61u;
                            precise float sumValue152 = 1.0 - vectorValue6.x;
                            precise float sumValue153 = sumValue152 - vectorValue7.y;
                            uint bitwiseValue81 = (objectInstances_2.packedValues[(scalarValue37 * 38u) + 25u] >> 2u) + (scalarValue35 >> 1u);
                            uint productValue166 = uint(objectInstances.packedValues[(scalarValue37 * 76u) + 54u]) + 0u;
                            bool comparisonValue23 = (scalarValue35 & 1u) == 0u;
                            uint comparisonValue24 = comparisonValue23 ? faceUvBuffersRW[nonuniformEXT(productValue166)].packedValues[bitwiseValue81].z : faceUvBuffersRW[nonuniformEXT(productValue166)].packedValues[bitwiseValue81].x;
                            uint comparisonValue25 = comparisonValue23 ? faceUvBuffersRW[nonuniformEXT(productValue166)].packedValues[bitwiseValue81].y : faceUvBuffersRW[nonuniformEXT(productValue166)].packedValues[bitwiseValue81].w;
                            uint comparisonValue26 = comparisonValue23 ? faceUvBuffersRW[nonuniformEXT(productValue166)].packedValues[bitwiseValue81].x : faceUvBuffersRW[nonuniformEXT(productValue166)].packedValues[bitwiseValue81].z;
                            bool conditionValue9 = int16_t(objectInstances.packedValues[productValue165]) < int16_t(0us);
                            float intermediateValue117;
                            float intermediateValue118;
                            if (conditionValue9)
                            {
                                uint bitwiseValue82 = comparisonValue26 >> 15u;
                                precise float bitwiseValue83 = float(bitwiseValue82 & 1u) * 2.0;
                                precise float sumValue154 = bitwiseValue83 + (-1.0);
                                precise float bitwiseValue84 = float(comparisonValue26 >> 31u) * 2.0;
                                precise float sumValue155 = bitwiseValue84 + (-1.0);
                                precise float bitwiseValue85 = float((comparisonValue26 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue86 = float(bitwiseValue82 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue167 = sumValue154 * 3.0517578125e-05;
                                precise float productValue168 = sumValue155 * 3.0517578125e-05;
                                precise float sumValue156 = bitwiseValue85 + productValue167;
                                precise float sumValue157 = bitwiseValue86 + productValue168;
                                intermediateValue117 = sumValue156;
                                intermediateValue118 = sumValue157;
                            }
                            else
                            {
                                precise float bitwiseValue87 = float(comparisonValue26 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue88 = float(comparisonValue26 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue169 = bitwiseValue87 * 16384.0;
                                precise float sumValue158 = productValue169 + 0.5;
                                precise float productValue170 = bitwiseValue88 * 16384.0;
                                precise float sumValue159 = productValue170 + 0.5;
                                precise float productValue171 = floor(sumValue158) * 6.103515625e-05;
                                precise float productValue172 = floor(sumValue159) * 6.103515625e-05;
                                intermediateValue117 = productValue171;
                                intermediateValue118 = productValue172;
                            }
                            precise float productValue173 = sumValue153 * intermediateValue117;
                            precise float productValue174 = sumValue153 * intermediateValue118;
                            precise float sumValue160 = productValue173 + 0.0;
                            precise float sumValue161 = productValue174 + 0.0;
                            float intermediateValue124;
                            float intermediateValue125;
                            if (conditionValue9)
                            {
                                uint bitwiseValue89 = comparisonValue25 >> 15u;
                                precise float bitwiseValue90 = float(bitwiseValue89 & 1u) * 2.0;
                                precise float sumValue162 = bitwiseValue90 + (-1.0);
                                precise float bitwiseValue91 = float(comparisonValue25 >> 31u) * 2.0;
                                precise float sumValue163 = bitwiseValue91 + (-1.0);
                                precise float bitwiseValue92 = float((comparisonValue25 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue93 = float(bitwiseValue89 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue175 = sumValue162 * 3.0517578125e-05;
                                precise float productValue176 = sumValue163 * 3.0517578125e-05;
                                precise float sumValue164 = bitwiseValue92 + productValue175;
                                precise float sumValue165 = bitwiseValue93 + productValue176;
                                intermediateValue124 = sumValue164;
                                intermediateValue125 = sumValue165;
                            }
                            else
                            {
                                precise float bitwiseValue94 = float(comparisonValue25 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue95 = float(comparisonValue25 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue177 = bitwiseValue94 * 16384.0;
                                precise float sumValue166 = productValue177 + 0.5;
                                precise float productValue178 = bitwiseValue95 * 16384.0;
                                precise float sumValue167 = productValue178 + 0.5;
                                precise float productValue179 = floor(sumValue166) * 6.103515625e-05;
                                precise float productValue180 = floor(sumValue167) * 6.103515625e-05;
                                intermediateValue124 = productValue179;
                                intermediateValue125 = productValue180;
                            }
                            precise float productValue181 = vectorValue6.x * intermediateValue124;
                            precise float productValue182 = vectorValue6.x * intermediateValue125;
                            precise float sumValue168 = sumValue160 + productValue181;
                            precise float sumValue169 = sumValue161 + productValue182;
                            float intermediateValue134;
                            float intermediateValue135;
                            if (conditionValue9)
                            {
                                uint bitwiseValue96 = comparisonValue24 >> 15u;
                                precise float bitwiseValue97 = float(bitwiseValue96 & 1u) * 2.0;
                                precise float sumValue170 = bitwiseValue97 + (-1.0);
                                precise float bitwiseValue98 = float(comparisonValue24 >> 31u) * 2.0;
                                precise float sumValue171 = bitwiseValue98 + (-1.0);
                                precise float bitwiseValue99 = float((comparisonValue24 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue100 = float(bitwiseValue96 & 65534u) * 1.525902189314365386962890625e-05;
                                precise float productValue183 = sumValue170 * 3.0517578125e-05;
                                precise float productValue184 = sumValue171 * 3.0517578125e-05;
                                precise float sumValue172 = bitwiseValue99 + productValue183;
                                precise float sumValue173 = bitwiseValue100 + productValue184;
                                intermediateValue134 = sumValue172;
                                intermediateValue135 = sumValue173;
                            }
                            else
                            {
                                precise float bitwiseValue101 = float(comparisonValue24 & 65535u) * 1.525902189314365386962890625e-05;
                                precise float bitwiseValue102 = float(comparisonValue24 >> 16u) * 1.525902189314365386962890625e-05;
                                precise float productValue185 = bitwiseValue101 * 16384.0;
                                precise float sumValue174 = productValue185 + 0.5;
                                precise float productValue186 = bitwiseValue102 * 16384.0;
                                precise float sumValue175 = productValue186 + 0.5;
                                precise float productValue187 = floor(sumValue174) * 6.103515625e-05;
                                precise float productValue188 = floor(sumValue175) * 6.103515625e-05;
                                intermediateValue134 = productValue187;
                                intermediateValue135 = productValue188;
                            }
                            precise float productValue189 = vectorValue7.y * intermediateValue134;
                            precise float productValue190 = vectorValue7.y * intermediateValue135;
                            precise float sumValue176 = sumValue168 + productValue189;
                            precise float sumValue177 = sumValue169 + productValue190;
                            float intermediateValue138;
                            float intermediateValue139;
                            float intermediateValue140;
                            float intermediateValue141;
                            if (objectInstances.packedValues[productValue164] == 65535us)
                            {
                                intermediateValue138 = 1.0;
                                intermediateValue139 = 1.0;
                                intermediateValue140 = 1.0;
                                intermediateValue141 = 1.0;
                            }
                            else
                            {
                                uint reinterpretedBits6;
                                if (objectInstances.packedValues[productValue164] > 4095us)
                                {
                                    reinterpretedBits6 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                                }
                                else
                                {
                                    reinterpretedBits6 = uint(objectInstances.packedValues[productValue164]);
                                }
                                vec4 sampledTextureValue9 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits6 + 0u], defaultSampler)), vec2(sumValue176, sumValue177), spvNMin(fma(scalarValue34, 0.083333335816860198974609375, -0.25), 2.0));
                                intermediateValue138 = sampledTextureValue9.x;
                                intermediateValue139 = sampledTextureValue9.y;
                                intermediateValue140 = sampledTextureValue9.z;
                                intermediateValue141 = sampledTextureValue9.w;
                            }
                            float intermediateValue151;
                            float intermediateValue152;
                            float intermediateValue153;
                            if (scalarValue36 == 2u)
                            {
                                float branchMergedValue14;
                                float branchMergedValue25;
                                float branchMergedValue26;
                                if ((objectInstances.packedValues[productValue165] & 128us) == 0us)
                                {
                                    float intermediateValue157;
                                    if ((objectInstances.packedValues[productValue165] & 2048us) == 0us)
                                    {
                                        intermediateValue157 = intermediateValue141;
                                    }
                                    else
                                    {
                                        intermediateValue157 = spvNClamp(fma(intermediateValue141, 2.0, -1.0), 0.0, 1.0);
                                    }
                                    branchMergedValue14 = intermediateValue140 - (intermediateValue157 * intermediateValue140);
                                    branchMergedValue25 = intermediateValue139 - (intermediateValue157 * intermediateValue139);
                                    branchMergedValue26 = intermediateValue138 - (intermediateValue157 * intermediateValue138);
                                }
                                else
                                {
                                    branchMergedValue14 = 0.33399999141693115234375;
                                    branchMergedValue25 = 0.33399999141693115234375;
                                    branchMergedValue26 = 0.33399999141693115234375;
                                }
                                intermediateValue151 = branchMergedValue26;
                                intermediateValue152 = branchMergedValue25;
                                intermediateValue153 = branchMergedValue14;
                            }
                            else
                            {
                                float sumValue178 = 1.0 - intermediateValue141;
                                intermediateValue151 = sumValue178;
                                intermediateValue152 = sumValue178;
                                intermediateValue153 = sumValue178;
                            }
                            float productValue191 = intermediateValue151 * scalarValue30;
                            float productValue192 = intermediateValue152 * scalarValue31;
                            float productValue193 = intermediateValue153 * scalarValue32;
                            float intermediateValue98;
                            float intermediateValue99;
                            float intermediateValue100;
                            bool intermediateValue158;
                            if (!(dot(vec3(productValue191, productValue192, productValue193), vec3(1.0)) <= 0.00999999977648258209228515625))
                            {
                                intermediateValue158 = false;
                                intermediateValue98 = productValue191;
                                intermediateValue99 = productValue192;
                                intermediateValue100 = productValue193;
                            }
                            else
                            {
                                intermediateValue158 = true;
                                intermediateValue98 = 0.0;
                                intermediateValue99 = 0.0;
                                intermediateValue100 = 0.0;
                            }
                            float branchMergedValue30;
                            float branchMergedValue34;
                            float branchMergedValue35;
                            if (intermediateValue158)
                            {
                                rayQueryConfirmIntersectionEXT(intermediateValue43);
                                branchMergedValue30 = intermediateValue100;
                                branchMergedValue34 = intermediateValue99;
                                branchMergedValue35 = intermediateValue98;
                            }
                            else
                            {
                                branchMergedValue30 = intermediateValue100;
                                branchMergedValue34 = intermediateValue99;
                                branchMergedValue35 = intermediateValue98;
                            }
                            branchMergedValue1 = branchMergedValue30;
                            branchMergedValue5 = branchMergedValue34;
                            branchMergedValue6 = branchMergedValue35;
                        }
                        else
                        {
                            branchMergedValue1 = scalarValue32;
                            branchMergedValue5 = scalarValue31;
                            branchMergedValue6 = scalarValue30;
                        }
                        intermediateValue61 = branchMergedValue1;
                        intermediateValue59 = branchMergedValue5;
                        intermediateValue57 = branchMergedValue6;
                        bool conditionValue10 = rayQueryProceedEXT(intermediateValue43);
                        if (conditionValue10)
                        {
                            scalarValue30 = intermediateValue57;
                            scalarValue31 = intermediateValue59;
                            scalarValue32 = intermediateValue61;
                            continue;
                        }
                        else
                        {
                            break;
                        }
                    }
                    intermediateValue56 = intermediateValue57;
                    intermediateValue58 = intermediateValue59;
                    intermediateValue60 = intermediateValue61;
                }
                else
                {
                    intermediateValue56 = 1.0;
                    intermediateValue58 = 1.0;
                    intermediateValue60 = 1.0;
                }
                uint scalarValue38 = rayQueryGetIntersectionTypeEXT(intermediateValue43, bool(1u));
                bool comparisonValue27 = scalarValue38 == 1u;
                branchMergedValue11 = comparisonValue27 ? 0.0 : intermediateValue60;
                branchMergedValue19 = comparisonValue27 ? 0.0 : intermediateValue58;
                branchMergedValue20 = comparisonValue27 ? 0.0 : intermediateValue56;
            }
            else
            {
                branchMergedValue11 = 0.0;
                branchMergedValue19 = 0.0;
                branchMergedValue20 = 0.0;
            }
            intermediateValue45 = branchMergedValue20;
            intermediateValue46 = branchMergedValue19;
            intermediateValue47 = branchMergedValue11;
        }
        float productValue194 = ViewCB.packedValues[60u].w * ViewCB.packedValues[60u].w;
        float multiplyAddValue18 = (((1.0 - productValue194) / exp2(log2(abs((productValue194 + 1.0) - ((ViewCB.packedValues[60u].w * 2.0) * spvNMin(spvNMax(dot(vec3(ViewCB.packedValues[52u].xyz), vec3(productValue47, productValue48, productValue49)), -1.0), 1.0)))) * 1.5)) * 0.3183098733425140380859375) * ((multiplyAddValue17 * multiplyAddValue17) * spvNClamp(fma(float(floatBitsToUint(ViewCB.packedValues[53u]).w), 0.02500000037252902984619140625, -0.5), 0.0, 1.0));
        float sumValue179 = spvNMin(intermediateValue6 + 1.0, 16.0);
        float quotientValue5 = 1.0 / sumValue179;
        intermediateValue16 = ((((multiplyAddValue18 * intermediateValue45) * ViewCB.packedValues[50u].x) - intermediateValue3) * quotientValue5) + intermediateValue3;
        intermediateValue17 = ((((multiplyAddValue18 * intermediateValue46) * ViewCB.packedValues[50u].y) - intermediateValue4) * quotientValue5) + intermediateValue4;
        intermediateValue18 = ((((multiplyAddValue18 * intermediateValue47) * ViewCB.packedValues[50u].z) - intermediateValue5) * quotientValue5) + intermediateValue5;
        intermediateValue19 = sumValue179;
    }
    imageStore(volumetricInscatterRW, ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(intermediateValue16, intermediateValue17, intermediateValue18, intermediateValue19));
}
