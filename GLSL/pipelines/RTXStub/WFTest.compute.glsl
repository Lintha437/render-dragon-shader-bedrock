#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / WFTest / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 45
#endif

#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    float scalarValue = float(int(gl_GlobalInvocationID.x));
    uint intermediateValue3;
    if (floatBitsToUint(ViewCB.packedValues[91u]).x == 1u)
    {
        uint productValue = uint((ViewCB.packedValues[78u].x * ViewCB.packedValues[78u].y) + scalarValue);
        uint bitwiseValue = (productValue + 2127912214u) + (productValue << 12u);
        uint bitwiseValue1 = (bitwiseValue ^ 3345072700u) ^ (bitwiseValue >> 19u);
        uint bitwiseValue2 = (bitwiseValue1 + 374761393u) + (bitwiseValue1 << 5u);
        uint bitwiseValue3 = (bitwiseValue2 + 3550635116u) ^ (bitwiseValue2 << 9u);
        uint bitwiseValue4 = (bitwiseValue3 + 4251993797u) + (bitwiseValue3 << 3u);
        uint bitwiseValue5 = gl_GlobalInvocationID.x & 65535u;
        uint bitwiseValue6 = gl_GlobalInvocationID.y & 65535u;
        uint bitwiseValue7 = ((bitwiseValue5 << 8u) | bitwiseValue5) & 16711935u;
        uint bitwiseValue8 = ((bitwiseValue7 << 4u) | bitwiseValue7) & 252645135u;
        uint bitwiseValue9 = ((bitwiseValue8 << 2u) | bitwiseValue8) & 858993459u;
        uint bitwiseValue10 = ((bitwiseValue6 << 8u) | bitwiseValue6) & 16711935u;
        uint bitwiseValue11 = ((bitwiseValue10 << 4u) | bitwiseValue10) & 252645135u;
        uint bitwiseValue12 = ((bitwiseValue11 << 2u) | bitwiseValue11) & 858993459u;
        uint reinterpretedBits;
        uint bitwiseValue14;
        uint intermediateValue1;
        uint intermediateValue2;
        reinterpretedBits = floatBitsToUint(ViewCB.packedValues[84u]).z + (((((bitwiseValue12 << 1u) | bitwiseValue12) << 1u) & 2863311530u) | (((bitwiseValue9 << 1u) | bitwiseValue9) & 1431655765u));
        bitwiseValue14 = (bitwiseValue4 ^ 3042594569u) ^ (bitwiseValue4 >> 16u);
        intermediateValue1 = 0u;
        intermediateValue2 = 0u;
        uint bitwiseValue13;
        for (;;)
        {
            uint sumValue = intermediateValue1 + 2654435769u;
            bitwiseValue13 = ((((bitwiseValue14 >> 5u) + 3355524772u) ^ ((bitwiseValue14 << 4u) + 2738958700u)) ^ (sumValue + bitwiseValue14)) + reinterpretedBits;
            uint sumValue1 = intermediateValue2 + 1u;
            if (sumValue1 == 16u)
            {
                break;
            }
            else
            {
                reinterpretedBits = bitwiseValue13;
                bitwiseValue14 = ((((bitwiseValue13 << 4u) + 2911926141u) ^ (bitwiseValue13 + sumValue)) ^ ((bitwiseValue13 >> 5u) + 2123724318u)) + bitwiseValue14;
                intermediateValue1 = sumValue;
                intermediateValue2 = sumValue1;
            }
        }
        intermediateValue3 = bitwiseValue13;
    }
    else
    {
        intermediateValue3 = floatBitsToUint(imageLoad(outputBufferReferencePathTracer, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y))).w);
    }
    float quotientValue = ViewCB.packedValues[78u].x / ViewCB.packedValues[78u].y;
    float productValue1 = (((scalarValue * 2.0) * ViewCB.packedValues[78u].z) * quotientValue) - quotientValue;
    float productValue2 = ((float(int(gl_GlobalInvocationID.y)) * 2.0) * ViewCB.packedValues[78u].w) + (-1.0);
    float dotProductValue = dot(vec3(productValue1, productValue2, -1.0), vec3(productValue1, productValue2, -1.0));
    float dotProductValue1 = dot(vec3(0.0, 0.0, 1.60000002384185791015625), vec3(productValue1, productValue2, -1.0));
    float productValue3 = (dotProductValue1 * dotProductValue1) - (dotProductValue * 1.5600001811981201171875);
    bool intermediateValue4;
    float intermediateValue5;
    float intermediateValue7;
    float intermediateValue8;
    if (productValue3 > 0.0)
    {
        float nonlinearValue = sqrt(productValue3);
        float quotientValue1 = (((-0.0) - dotProductValue1) - nonlinearValue) / dotProductValue;
        bool branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if ((quotientValue1 < 1000.0) && (quotientValue1 > 0.001000000047497451305389404296875))
        {
            branchMergedValue = true;
            branchMergedValue1 = quotientValue1 * productValue1;
            branchMergedValue2 = quotientValue1 * productValue2;
            branchMergedValue3 = 1.60000002384185791015625 - quotientValue1;
        }
        else
        {
            float quotientValue2 = (nonlinearValue - dotProductValue1) / dotProductValue;
            bool branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            if ((quotientValue2 < 1000.0) && (quotientValue2 > 0.001000000047497451305389404296875))
            {
                branchMergedValue4 = true;
                branchMergedValue5 = quotientValue2 * productValue1;
                branchMergedValue6 = quotientValue2 * productValue2;
                branchMergedValue7 = 1.60000002384185791015625 - quotientValue2;
            }
            else
            {
                branchMergedValue4 = false;
                branchMergedValue5 = intermediateValue6;
                branchMergedValue6 = intermediateValue6;
                branchMergedValue7 = intermediateValue6;
            }
            branchMergedValue = branchMergedValue4;
            branchMergedValue1 = branchMergedValue5;
            branchMergedValue2 = branchMergedValue6;
            branchMergedValue3 = branchMergedValue7;
        }
        intermediateValue4 = branchMergedValue;
        intermediateValue5 = branchMergedValue1;
        intermediateValue7 = branchMergedValue2;
        intermediateValue8 = branchMergedValue3;
    }
    else
    {
        intermediateValue4 = false;
        intermediateValue5 = intermediateValue6;
        intermediateValue7 = intermediateValue6;
        intermediateValue8 = intermediateValue6;
    }
    float sumValue5;
    float sumValue6;
    float sumValue7;
    uint intermediateValue11;
    if (intermediateValue4)
    {
        uint productValue4 = (intermediateValue3 * 1664525u) + 1013904223u;
        uint productValue5 = (productValue4 * 1664525u) + 1013904223u;
        float sumValue2 = (-0.0) - productValue1;
        float sumValue3 = (-0.0) - productValue2;
        float scalarValue1 = spvNMax(0.00999999977648258209228515625, ViewCB.packedValues[85u].w);
        float productValue6 = ViewCB.packedValues[85u].z * 0.959999978542327880859375;
        float sumValue4 = productValue6 + 0.039999999105930328369140625;
        float productValue7 = spvNMax(0.001000000047497451305389404296875, scalarValue1 * scalarValue1);
        float dotProductValue2 = dot(vec3(0.0, 0.0, 1.0), vec3(intermediateValue5, intermediateValue7, intermediateValue8));
        bool conditionValue = dotProductValue2 < 0.0;
        float comparisonValue = conditionValue ? (-0.0) : 0.0;
        float comparisonValue1 = conditionValue ? (-1.0) : 1.0;
        float nonlinearValue1 = sqrt((abs(dotProductValue2) + 1.0) * 0.5);
        float productValue8 = nonlinearValue1 * 2.0;
        float quotientValue3 = ((comparisonValue * intermediateValue8) - (comparisonValue1 * intermediateValue7)) / productValue8;
        float quotientValue4 = (comparisonValue1 * intermediateValue5) / productValue8;
        float quotientValue5 = ((-0.0) - (intermediateValue5 * comparisonValue)) / productValue8;
        float intermediateValue15;
        float intermediateValue16;
        float sumValue8;
        float sumValue9;
        if (conditionValue)
        {
            intermediateValue15 = nonlinearValue1;
            intermediateValue16 = quotientValue5;
            sumValue8 = (-0.0) - quotientValue4;
            sumValue9 = (-0.0) - quotientValue3;
        }
        else
        {
            intermediateValue15 = quotientValue3;
            intermediateValue16 = quotientValue4;
            sumValue8 = quotientValue5;
            sumValue9 = nonlinearValue1;
        }
        float sumValue10 = (-0.0) - intermediateValue15;
        float sumValue11 = (-0.0) - intermediateValue16;
        float sumValue12 = (-0.0) - sumValue8;
        float productValue9 = (sumValue11 - (sumValue8 * productValue2)) + (sumValue9 * sumValue2);
        float productValue10 = ((sumValue8 * productValue1) + intermediateValue15) + (sumValue9 * sumValue3);
        float productValue11 = ((intermediateValue15 * productValue2) - (intermediateValue16 * productValue1)) + sumValue9;
        float productValue12 = (((productValue11 * sumValue11) - (productValue10 * sumValue12)) * 2.0) - productValue1;
        float productValue13 = (((productValue9 * sumValue12) - (productValue11 * sumValue10)) * 2.0) - productValue2;
        float productValue14 = (((productValue10 * sumValue10) - (productValue9 * sumValue11)) * 2.0) + 1.0;
        float productValue15 = productValue12 * productValue7;
        float productValue16 = productValue13 * productValue7;
        float inverseLengthValue = inversesqrt(dot(vec3(productValue15, productValue16, productValue14), vec3(productValue15, productValue16, productValue14)));
        float productValue17 = productValue15 * inverseLengthValue;
        float productValue18 = productValue16 * inverseLengthValue;
        float productValue19 = productValue14 * inverseLengthValue;
        bool conditionValue1 = productValue19 < 0.99989998340606689453125;
        float sumValue13 = (-0.0) - productValue18;
        float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue13, productValue17, 0.0), vec3(sumValue13, productValue17, 0.0)));
        float comparisonValue2 = conditionValue1 ? (inverseLengthValue1 * sumValue13) : 1.0;
        float comparisonValue3 = conditionValue1 ? (productValue17 * inverseLengthValue1) : 0.0;
        float nonlinearValue2 = sqrt(float(productValue4 & 16777215u) * 5.9604644775390625e-08);
        float bitwiseValue15 = float(productValue5 & 16777215u) * 3.7450703871400037314742803573608e-07;
        float wavePhaseValue = cos(bitwiseValue15) * nonlinearValue2;
        float sumValue14 = (-0.0) - wavePhaseValue;
        float multiplyAddValue = sqrt(spvNMax(fma(sumValue14, wavePhaseValue, 1.0), 0.0));
        float wavePhaseValue1 = (((productValue19 + 1.0) * 0.5) * ((sin(bitwiseValue15) * nonlinearValue2) - multiplyAddValue)) + multiplyAddValue;
        float productValue20 = wavePhaseValue1 * productValue19;
        float multiplyAddValue1 = sqrt(spvNMax(0.0, fma(sumValue14, wavePhaseValue, fma((-0.0) - wavePhaseValue1, wavePhaseValue1, 1.0))));
        float productValue21 = (((comparisonValue2 * wavePhaseValue) - (productValue20 * comparisonValue3)) + (multiplyAddValue1 * productValue17)) * productValue7;
        float productValue22 = (((productValue20 * comparisonValue2) + (comparisonValue3 * wavePhaseValue)) + (multiplyAddValue1 * productValue18)) * productValue7;
        float productValue23 = spvNMax(0.0, (multiplyAddValue1 * productValue19) + (wavePhaseValue1 * ((comparisonValue3 * productValue17) - (comparisonValue2 * productValue18))));
        float inverseLengthValue2 = inversesqrt(dot(vec3(productValue21, productValue22, productValue23), vec3(productValue21, productValue22, productValue23)));
        float productValue24 = productValue21 * inverseLengthValue2;
        float productValue25 = productValue22 * inverseLengthValue2;
        float productValue26 = inverseLengthValue2 * productValue23;
        float sumValue15 = (-0.0) - productValue12;
        float sumValue16 = (-0.0) - productValue13;
        float sumValue17 = (-0.0) - productValue14;
        float dotProductValue3 = dot(vec3(sumValue15, sumValue16, sumValue17), vec3(productValue24, productValue25, productValue26)) * 2.0;
        float productValue27 = sumValue15 - (dotProductValue3 * productValue24);
        float productValue28 = sumValue16 - (dotProductValue3 * productValue25);
        float productValue29 = sumValue17 - (dotProductValue3 * productValue26);
        float dotProductValue4 = spvNClamp(dot(vec3(productValue24, productValue25, productValue26), vec3(productValue27, productValue28, productValue29)), 0.0, 1.0);
        float sumValue18 = 0.959999978542327880859375 - productValue6;
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
        if (dotProductValue4 < 9.9999997473787516355514526367188e-06)
        {
            intermediateValue18 = 0.0;
            intermediateValue19 = 0.0;
            intermediateValue20 = 1.0;
            intermediateValue21 = 0.0;
        }
        else
        {
            float productValue30 = productValue7 * productValue7;
            float multiplyAddValue2 = 1.0 / fma(sqrt((dot(vec2(productValue30), vec2(productValue12 * productValue12, productValue13 * productValue13)) / (productValue14 * productValue14)) + 1.0), 0.5, 0.5);
            float multiplyAddValue3 = 1.0 / fma(sqrt((dot(vec2(productValue30), vec2(productValue27 * productValue27, productValue28 * productValue28)) / (productValue29 * productValue29)) + 1.0), 0.5, 0.5);
            float productValue31 = ((productValue29 * intermediateValue16) - (productValue28 * sumValue8)) + (productValue27 * sumValue9);
            float productValue32 = ((productValue27 * sumValue8) - (productValue29 * intermediateValue15)) + (productValue28 * sumValue9);
            float productValue33 = ((productValue28 * intermediateValue15) - (productValue27 * intermediateValue16)) + (productValue29 * sumValue9);
            precise float productValue34 = (productValue29 + (((productValue32 * intermediateValue15) - (productValue31 * intermediateValue16)) * 2.0)) + 1.0;
            intermediateValue18 = (((productValue33 * intermediateValue16) - (productValue32 * sumValue8)) * 2.0) + productValue27;
            intermediateValue19 = (((productValue31 * sumValue8) - (productValue33 * intermediateValue15)) * 2.0) + productValue28;
            intermediateValue20 = productValue34;
            intermediateValue21 = (multiplyAddValue3 / ((multiplyAddValue3 + multiplyAddValue2) - (multiplyAddValue3 * multiplyAddValue2))) * ((exp2(log2(1.0 - spvNMax(0.0, dotProductValue4)) * 5.0) * sumValue18) + sumValue4);
        }
        float dotProductValue5 = dot(vec3(intermediateValue5, intermediateValue7, intermediateValue8), vec3(sumValue2, sumValue3, 1.0)) * 0.3183098733425140380859375;
        float sumValue19 = intermediateValue18 - productValue1;
        float sumValue20 = intermediateValue19 - productValue2;
        float inverseLengthValue3 = inversesqrt(dot(vec3(sumValue19, sumValue20, intermediateValue20), vec3(sumValue19, sumValue20, intermediateValue20)));
        float dotProductValue6 = ((dotProductValue5 * (1.0 - ViewCB.packedValues[85u].z)) * (sumValue18 - (exp2(log2(spvNClamp(1.0 - spvNClamp(dot(vec3(sumValue2, sumValue3, 1.0), vec3(inverseLengthValue3 * sumValue19, inverseLengthValue3 * sumValue20, inverseLengthValue3 * intermediateValue20)), 0.0, 1.0), 0.0, 1.0)) * 5.0) * (spvNClamp(dot(vec3(sumValue4), vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)) * 50.0, 0.0, 1.0) - sumValue4)))) / dotProductValue5;
        sumValue5 = dotProductValue6 + intermediateValue21;
        sumValue6 = dotProductValue6 + intermediateValue21;
        sumValue7 = dotProductValue6 + intermediateValue21;
        intermediateValue11 = productValue5;
    }
    else
    {
        sumValue5 = 1.0;
        sumValue6 = 1.0;
        sumValue7 = 1.0;
        intermediateValue11 = intermediateValue3;
    }
    vec4 loadedBufferValue = imageLoad(outputBufferReferencePathTracer, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)));
    float scalarValue2 = loadedBufferValue.x;
    float scalarValue3 = loadedBufferValue.y;
    float scalarValue4 = loadedBufferValue.z;
    imageStore(outputBufferReferencePathTracer, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(((sumValue5 - scalarValue2) * 0.20000000298023223876953125) + scalarValue2, ((sumValue6 - scalarValue3) * 0.20000000298023223876953125) + scalarValue3, ((sumValue7 - scalarValue4) * 0.20000000298023223876953125) + scalarValue4, uintBitsToFloat(intermediateValue11)));
    imageStore(outputBufferFinal, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), vec4(imageLoad(outputBufferReferencePathTracer, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)))));
}
