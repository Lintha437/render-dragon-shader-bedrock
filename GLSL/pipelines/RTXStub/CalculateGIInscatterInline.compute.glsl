#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / CalculateGIInscatterInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 22
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
#extension GL_EXT_samplerless_texture_functions : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    precise float productValue = float(gl_GlobalInvocationID.x) * ViewCB.packedValues[81u].x;
    precise float sumValue = productValue + (-1.0);
    precise float productValue1 = float(gl_GlobalInvocationID.z) * ViewCB.packedValues[57u].z;
    uint bitwiseValue = gl_GlobalInvocationID.z & 3u;
    uvec4 reinterpretedBits = floatBitsToUint(ViewCB.packedValues[84u]);
    uint scalarValue = reinterpretedBits.z;
    uint bitwiseValue1 = gl_GlobalInvocationID.x & 65535u;
    uint bitwiseValue2 = gl_GlobalInvocationID.y & 65535u;
    uint bitwiseValue3 = ((bitwiseValue1 << 8u) | bitwiseValue1) & 16711935u;
    uint bitwiseValue4 = ((bitwiseValue3 << 4u) | bitwiseValue3) & 252645135u;
    uint bitwiseValue5 = ((bitwiseValue4 << 2u) | bitwiseValue4) & 858993459u;
    uint bitwiseValue6 = ((bitwiseValue2 << 8u) | bitwiseValue2) & 16711935u;
    uint bitwiseValue7 = ((bitwiseValue6 << 4u) | bitwiseValue6) & 252645135u;
    uint bitwiseValue8 = ((bitwiseValue7 << 2u) | bitwiseValue7) & 858993459u;
    uint bitwiseValue9;
    uint sumValue1;
    uint intermediateValue1;
    uint intermediateValue2;
    bitwiseValue9 = (((((bitwiseValue8 << 1u) | bitwiseValue8) << 1u) & 2863311530u) | (((bitwiseValue5 << 1u) | bitwiseValue5) & 1431655765u)) + scalarValue;
    sumValue1 = scalarValue + bitwiseValue;
    intermediateValue1 = 0u;
    intermediateValue2 = 0u;
    uint bitwiseValue10;
    for (;;)
    {
        uint sumValue2 = intermediateValue1 + 2654435769u;
        bitwiseValue10 = ((((sumValue1 >> 5u) + 3355524772u) ^ ((sumValue1 << 4u) + 2738958700u)) ^ (sumValue2 + sumValue1)) + bitwiseValue9;
        uint sumValue3 = intermediateValue2 + 1u;
        if (sumValue3 == 16u)
        {
            break;
        }
        else
        {
            bitwiseValue9 = bitwiseValue10;
            sumValue1 = ((((bitwiseValue10 << 4u) + 2911926141u) ^ (bitwiseValue10 + sumValue2)) ^ ((bitwiseValue10 >> 5u) + 2123724318u)) + sumValue1;
            intermediateValue1 = sumValue2;
            intermediateValue2 = sumValue3;
        }
    }
    precise float productValue2 = float(gl_GlobalInvocationID.y) * ViewCB.packedValues[81u].y;
    precise float sumValue4 = productValue2 + 1.0;
    precise float productValue3 = ViewCB.packedValues[57u].z * 0.5;
    precise float sumValue5 = productValue3 + productValue1;
    uint productValue4 = (bitwiseValue10 * 1664525u) + 1013904223u;
    precise float bitwiseValue11 = float(productValue4 & 16777215u) * 5.9604644775390625e-08;
    uint productValue5 = (productValue4 * 1664525u) + 1013904223u;
    precise float bitwiseValue12 = float(productValue5 & 16777215u) * 5.9604644775390625e-08;
    precise float bitwiseValue13 = float(((productValue5 * 1664525u) + 7271263u) & 16777215u) * 5.9604644775390625e-08;
    precise float productValue6 = bitwiseValue11 * 2.0;
    precise float productValue7 = bitwiseValue12 * 2.0;
    precise float productValue8 = bitwiseValue13 * 2.0;
    precise float sumValue6 = productValue6 + (-1.0);
    precise float sumValue7 = productValue7 + (-1.0);
    precise float sumValue8 = productValue8 + (-1.0);
    float exponentialValue = (exp2(sumValue5 * 3.45943164825439453125) + (-1.0)) * 5.0;
    precise float productValue9 = productValue1 * 3.45943164825439453125;
    precise float exponentialValue1 = exp2(productValue9) + (-1.0);
    precise float productValue10 = exponentialValue1 * 50.0;
    precise float quotientValue = productValue10 / 10.0;
    float productValue11 = ViewCB.packedValues[78u].w * 2.0;
    float productValue12 = productValue11 * ViewCB.packedValues[81u].w;
    float productValue13 = ((ViewCB.packedValues[78u].z * ViewCB.packedValues[81u].z) * 2.0) + sumValue;
    float sumValue9 = sumValue4 - productValue12;
    float multiplyAddValue = fma(0.5, ViewCB.packedValues[22u].w, fma(sumValue9, ViewCB.packedValues[21u].w, ViewCB.packedValues[20u].w * productValue13)) + ViewCB.packedValues[23u].w;
    float multiplyAddValue1 = ((fma(0.5, ViewCB.packedValues[22u].x, fma(sumValue9, ViewCB.packedValues[21u].x, ViewCB.packedValues[20u].x * productValue13)) + ViewCB.packedValues[23u].x) / multiplyAddValue) - ViewCB.packedValues[72u].x;
    float multiplyAddValue2 = ((fma(0.5, ViewCB.packedValues[22u].y, fma(sumValue9, ViewCB.packedValues[21u].y, ViewCB.packedValues[20u].y * productValue13)) + ViewCB.packedValues[23u].y) / multiplyAddValue) - ViewCB.packedValues[72u].y;
    float multiplyAddValue3 = ((fma(0.5, ViewCB.packedValues[22u].z, fma(sumValue9, ViewCB.packedValues[21u].z, ViewCB.packedValues[20u].z * productValue13)) + ViewCB.packedValues[23u].z) / multiplyAddValue) - ViewCB.packedValues[72u].z;
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
        float multiplyAddValue13 = fma(fma(multiplyAddValue8, 0.5, 0.5), (ViewCB.packedValues[56u].x + (-1.0)) * ViewCB.packedValues[57u].x, ViewCB.packedValues[57u].x * 0.5);
        float multiplyAddValue14 = fma(fma(multiplyAddValue9, -0.5, 0.5), (ViewCB.packedValues[56u].y + (-1.0)) * ViewCB.packedValues[57u].y, ViewCB.packedValues[57u].y * 0.5);
        float nonlinearValue = log2((sqrt(((multiplyAddValue11 * multiplyAddValue11) + (multiplyAddValue10 * multiplyAddValue10)) + (multiplyAddValue12 * multiplyAddValue12)) * 0.20000000298023223876953125) + 1.0) * 0.289064824581146240234375;
        vec4 sampledTextureValue = textureLod(sampler3D(volumetricGIInscatterPrevious, linearSampler), vec3(multiplyAddValue13, multiplyAddValue14, nonlinearValue), 0.0);
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
    precise float productValue14 = ViewCB.packedValues[57u].x * sumValue6;
    precise float productValue15 = ViewCB.packedValues[57u].y * sumValue7;
    precise float sumValue10 = sumValue + productValue14;
    precise float sumValue11 = productValue15 + sumValue4;
    precise float sumValue12 = ViewCB.packedValues[78u].x + (-1.0);
    precise float sumValue13 = ViewCB.packedValues[78u].y + (-1.0);
    precise float productValue16 = sumValue10 * 0.5;
    precise float sumValue14 = productValue16 + 0.5;
    precise float productValue17 = sumValue11 * (-0.5);
    precise float sumValue15 = productValue17 + 0.5;
    precise float productValue18 = spvNClamp(sumValue14, 0.0, 1.0) * sumValue12;
    precise float sumValue16 = productValue18 + 0.5;
    precise float productValue19 = spvNClamp(sumValue15, 0.0, 1.0) * sumValue13;
    precise float sumValue17 = productValue19 + 0.5;
    uint sumValue18 = uint(min(int(uint(max(int(uint(int(sumValue16))), int(0u)))), int(uint(int(ViewCB.packedValues[78u].x)) + 4294967295u)));
    uint sumValue19 = uint(min(int(uint(max(int(uint(int(sumValue17))), int(0u)))), int(uint(int(ViewCB.packedValues[78u].y)) + 4294967295u)));
    uvec4 reinterpretedBits2 = floatBitsToUint(ViewCB.packedValues[91u]);
    uint scalarValue1 = reinterpretedBits2.y;
    uint comparisonValue;
    if (scalarValue1 == 2u)
    {
        comparisonValue = sumValue18;
    }
    else
    {
        comparisonValue = ((((sumValue19 ^ sumValue18) & 1u) != (uint(((scalarValue & 1u) != 0u) && (scalarValue1 == 0u)) ^ 1u)) ? uint(int(ViewCB.packedValues[80u].x)) : 0u) + (sumValue18 >> 1u);
    }
    float sampledTextureValue1 = abs(texelFetch(inputPrimaryWorldPosition, ivec2(uvec2(comparisonValue, sumValue19)), int(0u)).w);
    uint sumValue20 = scalarValue + gl_GlobalInvocationID.z;
    uint bitwiseValue14 = gl_GlobalInvocationID.x & 255u;
    uint bitwiseValue15 = gl_GlobalInvocationID.y & 255u;
    vec4 sampledTextureValue2 = texelFetch(blueNoiseTexture, ivec3(uvec3(bitwiseValue14, bitwiseValue15, (sumValue20 >> 2u) & 127u)), int(0u));
    uint bitwiseValue16 = sumValue20 & 3u;
    float intermediateValue11;
    if (bitwiseValue16 == 0u)
    {
        intermediateValue11 = sampledTextureValue2.x;
    }
    else
    {
        float branchMergedValue;
        if (bitwiseValue16 == 1u)
        {
            branchMergedValue = sampledTextureValue2.y;
        }
        else
        {
            branchMergedValue = (bitwiseValue16 == 2u) ? sampledTextureValue2.z : sampledTextureValue2.w;
        }
        intermediateValue11 = branchMergedValue;
    }
    precise float sumValue21 = intermediateValue11 + (-0.5);
    precise float productValue20 = sumValue21 * ViewCB.packedValues[57u].z;
    precise float sumValue22 = productValue20 + sumValue5;
    precise float productValue21 = sumValue22 * 3.45943164825439453125;
    precise float exponentialValue2 = exp2(productValue21) + (-1.0);
    precise float productValue22 = exponentialValue2 * 50.0;
    precise float quotientValue1 = productValue22 / 10.0;
    float intermediateValue12;
    if (sampledTextureValue1 == 65504.0)
    {
        intermediateValue12 = quotientValue1;
    }
    else
    {
        precise float productValue23 = sampledTextureValue1 * 0.9900000095367431640625;
        precise float sumValue23 = productValue23 + (-0.00999999977648258209228515625);
        intermediateValue12 = spvNMin(sumValue23, quotientValue1);
    }
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if (intermediateValue12 < quotientValue)
    {
        float sumValue24 = spvNMax(intermediateValue6 + (-1.0), 0.0);
        float branchMergedValue1;
        float branchMergedValue5;
        float branchMergedValue6;
        float branchMergedValue7;
        if (reinterpretedBits1 && (sumValue24 > 0.0))
        {
            float multiplyAddValue15 = spvNClamp(fma(sumValue24, 0.3333333432674407958984375, -0.3333333432674407958984375), 0.0, 1.0) + 0.001000000047497451305389404296875;
            vec4 sampledTextureValue3 = textureLod(sampler3D(volumetricGIInscatterPrevious, linearSampler), vec3(fma(sumValue6, ViewCB.packedValues[57u].x, intermediateValue7), fma(sumValue7, ViewCB.packedValues[57u].y, intermediateValue8), fma(sumValue8, ViewCB.packedValues[57u].z, intermediateValue9)), 0.0);
            float scalarValue2 = sampledTextureValue3.w;
            float multiplyAddValue16 = spvNClamp(fma(scalarValue2, 0.3333333432674407958984375, -0.3333333432674407958984375), 0.0, 1.0) + 0.001000000047497451305389404296875;
            float sumValue25 = multiplyAddValue16 + multiplyAddValue15;
            float branchMergedValue12;
            float branchMergedValue14;
            float branchMergedValue15;
            float branchMergedValue16;
            if (sumValue25 > 0.0)
            {
                branchMergedValue12 = ((multiplyAddValue16 * sampledTextureValue3.x) + (multiplyAddValue15 * intermediateValue3)) / sumValue25;
                branchMergedValue14 = ((multiplyAddValue16 * scalarValue2) + (multiplyAddValue15 * sumValue24)) / sumValue25;
                branchMergedValue15 = ((multiplyAddValue16 * sampledTextureValue3.z) + (multiplyAddValue15 * intermediateValue5)) / sumValue25;
                branchMergedValue16 = ((multiplyAddValue16 * sampledTextureValue3.y) + (multiplyAddValue15 * intermediateValue4)) / sumValue25;
            }
            else
            {
                branchMergedValue12 = 0.0;
                branchMergedValue14 = 0.0;
                branchMergedValue15 = 0.0;
                branchMergedValue16 = 0.0;
            }
            branchMergedValue1 = branchMergedValue12;
            branchMergedValue5 = branchMergedValue14;
            branchMergedValue6 = branchMergedValue15;
            branchMergedValue7 = branchMergedValue16;
        }
        else
        {
            branchMergedValue1 = intermediateValue3 * 0.800000011920928955078125;
            branchMergedValue5 = sumValue24;
            branchMergedValue6 = intermediateValue5 * 0.800000011920928955078125;
            branchMergedValue7 = intermediateValue4 * 0.800000011920928955078125;
        }
        intermediateValue14 = branchMergedValue1;
        intermediateValue15 = branchMergedValue7;
        intermediateValue16 = branchMergedValue6;
        intermediateValue17 = branchMergedValue5;
    }
    else
    {
        float productValue24 = ((ViewCB.packedValues[78u].z * 2.0) * ((ViewCB.packedValues[81u].z + 0.5) + float(int(sumValue18)))) + (-1.0);
        float productValue25 = (1.0 - (productValue11 * (float(int(sumValue19)) + 0.5))) - productValue12;
        float multiplyAddValue17 = fma(0.5, ViewCB.packedValues[22u].w, fma(productValue25, ViewCB.packedValues[21u].w, productValue24 * ViewCB.packedValues[20u].w)) + ViewCB.packedValues[23u].w;
        float multiplyAddValue18 = ((fma(0.5, ViewCB.packedValues[22u].x, fma(productValue25, ViewCB.packedValues[21u].x, productValue24 * ViewCB.packedValues[20u].x)) + ViewCB.packedValues[23u].x) / multiplyAddValue17) - ViewCB.packedValues[72u].x;
        float multiplyAddValue19 = ((fma(0.5, ViewCB.packedValues[22u].y, fma(productValue25, ViewCB.packedValues[21u].y, productValue24 * ViewCB.packedValues[20u].y)) + ViewCB.packedValues[23u].y) / multiplyAddValue17) - ViewCB.packedValues[72u].y;
        float multiplyAddValue20 = ((fma(0.5, ViewCB.packedValues[22u].z, fma(productValue25, ViewCB.packedValues[21u].z, productValue24 * ViewCB.packedValues[20u].z)) + ViewCB.packedValues[23u].z) / multiplyAddValue17) - ViewCB.packedValues[72u].z;
        float inverseLengthValue1 = inversesqrt(dot(vec3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20), vec3(multiplyAddValue18, multiplyAddValue19, multiplyAddValue20)));
        float multiplyAddValue21 = fma(inverseLengthValue1 * multiplyAddValue19, intermediateValue12, ViewCB.packedValues[72u].y);
        float multiplyAddValue22;
        if (floatBitsToUint(ViewCB.packedValues[54u]).w == 0u)
        {
            multiplyAddValue22 = spvNClamp(fma(multiplyAddValue21, ViewCB.packedValues[90u].z, ViewCB.packedValues[90u].w), 0.0, 1.0);
        }
        else
        {
            multiplyAddValue22 = 1.0;
        }
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if (floatBitsToUint(ViewCB.packedValues[86u]).z == 0u)
        {
            intermediateValue18 = 0.0;
            intermediateValue19 = 0.0;
            intermediateValue20 = 0.0;
        }
        else
        {
            vec4 sampledTextureValue4 = texelFetch(blueNoiseTexture, ivec3(uvec3(bitwiseValue14, bitwiseValue15, scalarValue & 127u)), int(0u));
            float intermediateValue21;
            if (bitwiseValue == 0u)
            {
                intermediateValue21 = sampledTextureValue4.x;
            }
            else
            {
                float branchMergedValue2;
                if (bitwiseValue == 1u)
                {
                    branchMergedValue2 = sampledTextureValue4.y;
                }
                else
                {
                    branchMergedValue2 = (bitwiseValue == 2u) ? sampledTextureValue4.z : sampledTextureValue4.w;
                }
                intermediateValue21 = branchMergedValue2;
            }
            float productValue26 = intermediateValue21 * 40502.859375;
            float productValue27 = (productValue26 - floor(productValue26)) * 6.283185482025146484375;
            float productValue28 = 0.9999847412109375 - (intermediateValue21 * 2.0);
            float nonlinearValue1 = sqrt(spvNClamp(1.0 - (productValue28 * productValue28), 0.0, 1.0));
            float wavePhaseValue = cos(productValue27) * nonlinearValue1;
            float wavePhaseValue1 = sin(productValue27) * nonlinearValue1;
            rayQueryInitializeEXT(intermediateValue22, SceneBVH, 512u, 159u, vec3(fma(inverseLengthValue1 * multiplyAddValue18, intermediateValue12, ViewCB.packedValues[72u].x), multiplyAddValue21, fma(inverseLengthValue1 * multiplyAddValue20, intermediateValue12, ViewCB.packedValues[72u].z)), 0.0, vec3(wavePhaseValue, wavePhaseValue1, productValue28), 10000.0);
            bool conditionValue = rayQueryProceedEXT(intermediateValue22);
            if (conditionValue)
            {
                bool intermediateValue36;
                bool comparisonValue1;
                for (;;)
                {
                    uint scalarValue3 = rayQueryGetIntersectionTypeEXT(intermediateValue22, bool(0u));
                    comparisonValue1 = scalarValue3 == 0u;
                    if (comparisonValue1)
                    {
                        vec2 vectorValue = rayQueryGetIntersectionBarycentricsEXT(intermediateValue22, bool(0u));
                        vec2 vectorValue1 = rayQueryGetIntersectionBarycentricsEXT(intermediateValue22, bool(0u));
                        uint scalarValue4 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue22, bool(0u));
                        uint scalarValue5 = rayQueryGetIntersectionInstanceCustomIndexEXT(intermediateValue22, bool(0u));
                        uint scalarValue6 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue22, bool(0u));
                        uint productValue29 = (scalarValue6 * 76u) + 58u;
                        uint productValue30 = (scalarValue6 * 76u) + 61u;
                        precise float sumValue26 = 1.0 - vectorValue.x;
                        precise float sumValue27 = sumValue26 - vectorValue1.y;
                        uint bitwiseValue18 = (objectInstances_2.packedValues[(scalarValue6 * 38u) + 25u] >> 2u) + (scalarValue4 >> 1u);
                        uint productValue31 = uint(objectInstances.packedValues[(scalarValue6 * 76u) + 54u]) + 0u;
                        bool comparisonValue2 = (scalarValue4 & 1u) == 0u;
                        uint comparisonValue3 = comparisonValue2 ? faceUvBuffersRW[nonuniformEXT(productValue31)].packedValues[bitwiseValue18].z : faceUvBuffersRW[nonuniformEXT(productValue31)].packedValues[bitwiseValue18].x;
                        uint comparisonValue4 = comparisonValue2 ? faceUvBuffersRW[nonuniformEXT(productValue31)].packedValues[bitwiseValue18].y : faceUvBuffersRW[nonuniformEXT(productValue31)].packedValues[bitwiseValue18].w;
                        uint comparisonValue5 = comparisonValue2 ? faceUvBuffersRW[nonuniformEXT(productValue31)].packedValues[bitwiseValue18].x : faceUvBuffersRW[nonuniformEXT(productValue31)].packedValues[bitwiseValue18].z;
                        bool conditionValue1 = int16_t(objectInstances.packedValues[productValue30]) < int16_t(0us);
                        float intermediateValue41;
                        float intermediateValue42;
                        if (conditionValue1)
                        {
                            uint bitwiseValue19 = comparisonValue5 >> 15u;
                            precise float bitwiseValue20 = float(bitwiseValue19 & 1u) * 2.0;
                            precise float sumValue28 = bitwiseValue20 + (-1.0);
                            precise float bitwiseValue21 = float(comparisonValue5 >> 31u) * 2.0;
                            precise float sumValue30 = bitwiseValue21 + (-1.0);
                            precise float bitwiseValue22 = float((comparisonValue5 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue23 = float(bitwiseValue19 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue32 = sumValue28 * 3.0517578125e-05;
                            precise float productValue33 = sumValue30 * 3.0517578125e-05;
                            precise float sumValue31 = bitwiseValue22 + productValue32;
                            precise float sumValue32 = bitwiseValue23 + productValue33;
                            intermediateValue41 = sumValue31;
                            intermediateValue42 = sumValue32;
                        }
                        else
                        {
                            precise float bitwiseValue24 = float(comparisonValue5 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue25 = float(comparisonValue5 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue34 = bitwiseValue24 * 16384.0;
                            precise float sumValue33 = productValue34 + 0.5;
                            precise float productValue35 = bitwiseValue25 * 16384.0;
                            precise float sumValue34 = productValue35 + 0.5;
                            precise float productValue36 = floor(sumValue33) * 6.103515625e-05;
                            precise float productValue37 = floor(sumValue34) * 6.103515625e-05;
                            intermediateValue41 = productValue36;
                            intermediateValue42 = productValue37;
                        }
                        precise float productValue38 = sumValue27 * intermediateValue41;
                        precise float productValue39 = sumValue27 * intermediateValue42;
                        precise float sumValue35 = productValue38 + 0.0;
                        precise float sumValue36 = productValue39 + 0.0;
                        float intermediateValue49;
                        float intermediateValue50;
                        if (conditionValue1)
                        {
                            uint bitwiseValue26 = comparisonValue4 >> 15u;
                            precise float bitwiseValue27 = float(bitwiseValue26 & 1u) * 2.0;
                            precise float sumValue37 = bitwiseValue27 + (-1.0);
                            precise float bitwiseValue28 = float(comparisonValue4 >> 31u) * 2.0;
                            precise float sumValue38 = bitwiseValue28 + (-1.0);
                            precise float bitwiseValue29 = float((comparisonValue4 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue30 = float(bitwiseValue26 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue40 = sumValue37 * 3.0517578125e-05;
                            precise float productValue41 = sumValue38 * 3.0517578125e-05;
                            precise float sumValue39 = bitwiseValue29 + productValue40;
                            precise float sumValue40 = bitwiseValue30 + productValue41;
                            intermediateValue49 = sumValue39;
                            intermediateValue50 = sumValue40;
                        }
                        else
                        {
                            precise float bitwiseValue31 = float(comparisonValue4 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue32 = float(comparisonValue4 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue42 = bitwiseValue31 * 16384.0;
                            precise float sumValue41 = productValue42 + 0.5;
                            precise float productValue43 = bitwiseValue32 * 16384.0;
                            precise float sumValue42 = productValue43 + 0.5;
                            precise float productValue44 = floor(sumValue41) * 6.103515625e-05;
                            precise float productValue45 = floor(sumValue42) * 6.103515625e-05;
                            intermediateValue49 = productValue44;
                            intermediateValue50 = productValue45;
                        }
                        precise float productValue46 = vectorValue.x * intermediateValue49;
                        precise float productValue47 = vectorValue.x * intermediateValue50;
                        precise float sumValue43 = sumValue35 + productValue46;
                        precise float sumValue44 = sumValue36 + productValue47;
                        float intermediateValue63;
                        float intermediateValue64;
                        if (conditionValue1)
                        {
                            uint bitwiseValue33 = comparisonValue3 >> 15u;
                            precise float bitwiseValue34 = float(bitwiseValue33 & 1u) * 2.0;
                            precise float sumValue45 = bitwiseValue34 + (-1.0);
                            precise float bitwiseValue35 = float(comparisonValue3 >> 31u) * 2.0;
                            precise float sumValue46 = bitwiseValue35 + (-1.0);
                            precise float bitwiseValue36 = float((comparisonValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue37 = float(bitwiseValue33 & 65534u) * 1.525902189314365386962890625e-05;
                            precise float productValue48 = sumValue45 * 3.0517578125e-05;
                            precise float productValue49 = sumValue46 * 3.0517578125e-05;
                            precise float sumValue47 = bitwiseValue36 + productValue48;
                            precise float sumValue48 = bitwiseValue37 + productValue49;
                            intermediateValue63 = sumValue47;
                            intermediateValue64 = sumValue48;
                        }
                        else
                        {
                            precise float bitwiseValue38 = float(comparisonValue3 & 65535u) * 1.525902189314365386962890625e-05;
                            precise float bitwiseValue39 = float(comparisonValue3 >> 16u) * 1.525902189314365386962890625e-05;
                            precise float productValue50 = bitwiseValue38 * 16384.0;
                            precise float sumValue49 = productValue50 + 0.5;
                            precise float productValue51 = bitwiseValue39 * 16384.0;
                            precise float sumValue50 = productValue51 + 0.5;
                            precise float productValue52 = floor(sumValue49) * 6.103515625e-05;
                            precise float productValue53 = floor(sumValue50) * 6.103515625e-05;
                            intermediateValue63 = productValue52;
                            intermediateValue64 = productValue53;
                        }
                        precise float productValue54 = vectorValue1.y * intermediateValue63;
                        precise float productValue55 = vectorValue1.y * intermediateValue64;
                        precise float sumValue51 = sumValue43 + productValue54;
                        precise float sumValue52 = sumValue44 + productValue55;
                        float intermediateValue65;
                        if (objectInstances.packedValues[productValue29] == 65535us)
                        {
                            intermediateValue65 = 1.0;
                        }
                        else
                        {
                            uint reinterpretedBits5;
                            if (objectInstances.packedValues[productValue29] > 4095us)
                            {
                                reinterpretedBits5 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                            }
                            else
                            {
                                reinterpretedBits5 = uint(objectInstances.packedValues[productValue29]);
                            }
                            intermediateValue65 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits5 + 0u], defaultSampler)), vec2(sumValue51, sumValue52), -0.25).w;
                        }
                        uint comparisonValue10;
                        if (scalarValue5 == 2u)
                        {
                            comparisonValue10 = 0u;
                        }
                        else
                        {
                            comparisonValue10 = uint(intermediateValue65 <= (((objectInstances.packedValues[productValue30] & 4352us) != 0us) ? 0.5 : 0.0));
                        }
                        if (comparisonValue10 == 0u)
                        {
                            rayQueryConfirmIntersectionEXT(intermediateValue22);
                        }
                    }
                    intermediateValue36 = rayQueryProceedEXT(intermediateValue22);
                    if (intermediateValue36)
                    {
                        continue;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            uint scalarValue7 = rayQueryGetIntersectionTypeEXT(intermediateValue22, bool(1u));
            bool intermediateValue29;
            uint bitwiseValue17;
            if (scalarValue7 == 1u)
            {
                float scalarValue8 = rayQueryGetIntersectionTEXT(intermediateValue22, bool(1u));
                uint scalarValue9 = rayQueryGetIntersectionPrimitiveIndexEXT(intermediateValue22, bool(1u));
                uint scalarValue10 = rayQueryGetIntersectionInstanceIdEXT(intermediateValue22, bool(1u));
                intermediateValue29 = scalarValue8 < 10000.0;
                bitwiseValue17 = ((scalarValue9 << 14u) & 1073725440u) | (scalarValue10 & 16383u);
            }
            else
            {
                intermediateValue29 = false;
                bitwiseValue17 = 1073741823u;
            }
            float intermediateValue38;
            float intermediateValue39;
            float intermediateValue40;
            if (intermediateValue29)
            {
                uint bitwiseValue40 = bitwiseValue17 & 16383u;
                uint productValue56 = uint(objectInstances.packedValues[(bitwiseValue40 * 76u) + 54u]) + 0u;
                uint bitwiseValue41 = ((objectInstances_2.packedValues[(bitwiseValue40 * 38u) + 25u] >> 2u) + ((bitwiseValue17 >> 15u) & 32767u)) * 8u;
                f16vec3 sumValue29 = uint16BitsToFloat16(u16vec3(faceIrradianceCache[nonuniformEXT(productValue56)].packedValues[bitwiseValue41], faceIrradianceCache[nonuniformEXT(productValue56)].packedValues[bitwiseValue41 + 1u], faceIrradianceCache[nonuniformEXT(productValue56)].packedValues[bitwiseValue41 + 2u]));
                intermediateValue38 = float(sumValue29.x);
                intermediateValue39 = float(sumValue29.y);
                intermediateValue40 = float(sumValue29.z);
            }
            else
            {
                uvec4 reinterpretedBits3 = floatBitsToUint(ViewCB.packedValues[75u]);
                uint scalarValue11 = reinterpretedBits3.w;
                float branchMergedValue3;
                float branchMergedValue8;
                float branchMergedValue9;
                if (scalarValue11 == 1u)
                {
                    branchMergedValue3 = ViewCB.packedValues[58u].z;
                    branchMergedValue8 = ViewCB.packedValues[58u].y;
                    branchMergedValue9 = ViewCB.packedValues[58u].x;
                }
                else
                {
                    float branchMergedValue13;
                    float branchMergedValue17;
                    float branchMergedValue18;
                    if (scalarValue11 == 2u)
                    {
                        uvec4 vectorValue2 = floatBitsToUint(ViewCB.packedValues[74u]);
                        uint scalarValue12 = vectorValue2.z;
                        uint reinterpretedBits4;
                        if (scalarValue12 > 4095u)
                        {
                            reinterpretedBits4 = floatBitsToUint(ViewCB.packedValues[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits4 = scalarValue12;
                        }
                        float scalarValue13 = abs(wavePhaseValue);
                        float scalarValue14 = abs(wavePhaseValue1);
                        float scalarValue15 = abs(productValue28);
                        float intermediateValue62;
                        float comparisonValue9;
                        float sumValue53;
                        if ((scalarValue13 >= scalarValue14) && (scalarValue13 >= scalarValue15))
                        {
                            intermediateValue62 = scalarValue13;
                            comparisonValue9 = (wavePhaseValue < 0.0) ? ((-0.0) - productValue28) : productValue28;
                            sumValue53 = (-0.0) - wavePhaseValue1;
                        }
                        else
                        {
                            float sumValue54 = (-0.0) - wavePhaseValue;
                            float branchMergedValue4;
                            float branchMergedValue10;
                            float branchMergedValue11;
                            if (!(scalarValue14 >= scalarValue15))
                            {
                                branchMergedValue4 = (-0.0) - wavePhaseValue1;
                                branchMergedValue10 = (productValue28 < 0.0) ? wavePhaseValue : sumValue54;
                                branchMergedValue11 = scalarValue15;
                            }
                            else
                            {
                                branchMergedValue4 = (wavePhaseValue1 < 0.0) ? ((-0.0) - productValue28) : productValue28;
                                branchMergedValue10 = sumValue54;
                                branchMergedValue11 = scalarValue14;
                            }
                            intermediateValue62 = branchMergedValue11;
                            comparisonValue9 = branchMergedValue10;
                            sumValue53 = branchMergedValue4;
                        }
                        precise float quotientValue2 = 0.5 / intermediateValue62;
                        vec4 sampledTextureValue5 = textureLod(nonuniformEXT(sampler2D(textures[reinterpretedBits4 + 0u], linearSampler)), vec2(fract(fma(comparisonValue9, quotientValue2, 0.5) * ViewCB.packedValues[74u].x), fract(fma(sumValue53, quotientValue2, 0.5) * ViewCB.packedValues[74u].y)), 0.0);
                        branchMergedValue13 = (ViewCB.packedValues[58u].z * sampledTextureValue5.z) * ViewCB.packedValues[97u].w;
                        branchMergedValue17 = (ViewCB.packedValues[58u].y * sampledTextureValue5.y) * ViewCB.packedValues[97u].w;
                        branchMergedValue18 = (ViewCB.packedValues[58u].x * sampledTextureValue5.x) * ViewCB.packedValues[97u].w;
                    }
                    else
                    {
                        float branchMergedValue19;
                        float branchMergedValue20;
                        float branchMergedValue21;
                        if (scalarValue11 == 4u)
                        {
                            float scalarValue16 = (dot(vec3(wavePhaseValue, wavePhaseValue1, productValue28), vec3(ViewCB.packedValues[52u].xyz)) * 0.5) + 0.5;
                            branchMergedValue19 = ((ViewCB.packedValues[75u].z - ViewCB.packedValues[76u].z) * scalarValue16) + ViewCB.packedValues[76u].z;
                            branchMergedValue20 = ((ViewCB.packedValues[75u].y - ViewCB.packedValues[76u].y) * scalarValue16) + ViewCB.packedValues[76u].y;
                            branchMergedValue21 = ((ViewCB.packedValues[75u].x - ViewCB.packedValues[76u].x) * scalarValue16) + ViewCB.packedValues[76u].x;
                        }
                        else
                        {
                            float comparisonValue8;
                            if (abs(wavePhaseValue1) < 1.0)
                            {
                                float quotientValue3 = atan(productValue28 / wavePhaseValue);
                                bool conditionValue2 = wavePhaseValue < 0.0;
                                bool comparisonValue6 = wavePhaseValue == 0.0;
                                bool comparisonValue7 = productValue28 >= 0.0;
                                bool conditionValue3 = productValue28 < 0.0;
                                comparisonValue8 = (comparisonValue7 && comparisonValue6) ? 1.57079637050628662109375 : ((conditionValue3 && comparisonValue6) ? (-1.57079637050628662109375) : ((conditionValue3 && conditionValue2) ? (quotientValue3 + (-3.1415927410125732421875)) : ((comparisonValue7 && conditionValue2) ? (quotientValue3 + 3.1415927410125732421875) : quotientValue3)));
                            }
                            else
                            {
                                comparisonValue8 = 0.0;
                            }
                            float multiplyAddValue23 = fma(abs((fract((comparisonValue8 - ViewCB.packedValues[50u].w) * 0.15915493667125701904296875) * 2.0) + (-1.0)), 0.984375, 0.0078125);
                            float multiplyAddValue24 = fma(0.5 - (asin(wavePhaseValue1) * 0.3183098733425140380859375), 0.96875, 0.015625);
                            float productValue57 = ViewCB.packedValues[51u].w * 7.0;
                            float scalarValue17 = fract(productValue57);
                            uint scalarValue18 = uint(int(floor(productValue57)));
                            float productValue58 = float(int(scalarValue18 + 1u)) * 0.125;
                            float scalarValue19 = fract(abs(productValue58));
                            vec4 sampledTextureValue6 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue23, multiplyAddValue24, float(int(scalarValue18))), 0.0);
                            float scalarValue20 = sampledTextureValue6.x;
                            float scalarValue21 = sampledTextureValue6.y;
                            float scalarValue22 = sampledTextureValue6.z;
                            float productValue59 = scalarValue20 * scalarValue20;
                            float productValue60 = scalarValue21 * scalarValue21;
                            float productValue61 = scalarValue22 * scalarValue22;
                            vec4 sampledTextureValue7 = textureLod(sampler2DArray(skyTexture, linearSampler), vec3(multiplyAddValue23, multiplyAddValue24, float(int(uint(int(((productValue58 >= ((-0.0) - productValue58)) ? scalarValue19 : ((-0.0) - scalarValue19)) * 8.0))))), 0.0);
                            float scalarValue23 = sampledTextureValue7.x;
                            float scalarValue24 = sampledTextureValue7.y;
                            float scalarValue25 = sampledTextureValue7.z;
                            float dotProductValue = exp2(log2(spvNMax(dot(vec3(wavePhaseValue, wavePhaseValue1, productValue28), vec3(ViewCB.packedValues[52u].xyz)), 0.0)) * 7.0);
                            float productValue62 = dotProductValue * 0.0500000007450580596923828125;
                            float productValue63 = ((((scalarValue23 * scalarValue23) - productValue59) * scalarValue17) + productValue59) + (productValue62 * ViewCB.packedValues[50u].x);
                            float productValue64 = ((((scalarValue24 * scalarValue24) - productValue60) * scalarValue17) + productValue60) + (productValue62 * ViewCB.packedValues[50u].y);
                            float productValue65 = ((((scalarValue25 * scalarValue25) - productValue61) * scalarValue17) + productValue61) + (productValue62 * ViewCB.packedValues[50u].z);
                            float productValue66 = (dotProductValue * 0.64999997615814208984375) + 0.3499999940395355224609375;
                            branchMergedValue19 = ((((ViewCB.packedValues[58u].z * productValue66) - productValue65) * ViewCB.packedValues[58u].w) + productValue65) * ViewCB.packedValues[97u].w;
                            branchMergedValue20 = ((((ViewCB.packedValues[58u].y * productValue66) - productValue64) * ViewCB.packedValues[58u].w) + productValue64) * ViewCB.packedValues[97u].w;
                            branchMergedValue21 = ((((ViewCB.packedValues[58u].x * productValue66) - productValue63) * ViewCB.packedValues[58u].w) + productValue63) * ViewCB.packedValues[97u].w;
                        }
                        branchMergedValue13 = branchMergedValue19;
                        branchMergedValue17 = branchMergedValue20;
                        branchMergedValue18 = branchMergedValue21;
                    }
                    branchMergedValue3 = branchMergedValue13;
                    branchMergedValue8 = branchMergedValue17;
                    branchMergedValue9 = branchMergedValue18;
                }
                intermediateValue38 = branchMergedValue9;
                intermediateValue39 = branchMergedValue8;
                intermediateValue40 = branchMergedValue3;
            }
            intermediateValue18 = intermediateValue38 * 0.3183098733425140380859375;
            intermediateValue19 = intermediateValue39 * 0.3183098733425140380859375;
            intermediateValue20 = intermediateValue40 * 0.3183098733425140380859375;
        }
        float multiplyAddValue25 = multiplyAddValue22 * spvNClamp(fma(float(floatBitsToUint(ViewCB.packedValues[53u]).w), 0.02500000037252902984619140625, -0.5), 0.0, 1.0);
        float sumValue55 = spvNMin(intermediateValue6 + 1.0, 200.0);
        float quotientValue4 = 1.0 / sumValue55;
        intermediateValue14 = (quotientValue4 * ((intermediateValue18 * multiplyAddValue25) - intermediateValue3)) + intermediateValue3;
        intermediateValue15 = (quotientValue4 * ((intermediateValue19 * multiplyAddValue25) - intermediateValue4)) + intermediateValue4;
        intermediateValue16 = (quotientValue4 * ((intermediateValue20 * multiplyAddValue25) - intermediateValue5)) + intermediateValue5;
        intermediateValue17 = sumValue55;
    }
    imageStore(volumetricGIInscatterRW[0u], ivec3(uvec3(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y, gl_GlobalInvocationID.z)), vec4(intermediateValue14, intermediateValue15, intermediateValue16, intermediateValue17));
}
