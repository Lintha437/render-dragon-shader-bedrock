#version 460
#extension GL_GOOGLE_include_directive : require
// SpecularConvolution / GenerateBrdf / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 3
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/SpecularConvolution/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue9 = varyingTexCoord0.y * varyingTexCoord0.y;
    float multiplyAddValue = sqrt(fma(-varyingTexCoord0.x, varyingTexCoord0.x, 1.0));
    uint scalarValue = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float scalarValue1 = rdEvaluateFloatExpression(uint(fragmentScalarConstants1.packedValues[0u]));
    float multiplyAddValue8 = fma(productValue9, productValue9, -1.0);
    precise float productValue10 = productValue9 * 0.5;
    float multiplyAddValue9 = fma(-productValue9, 0.5, 1.0);
    precise float multiplyAddValue10 = fma(varyingTexCoord0.x, multiplyAddValue9, productValue10) + 9.9999997473787516355514526367188e-05;
    precise float quotientValue2 = varyingTexCoord0.x / multiplyAddValue10;
    float intermediateValue6;
    float intermediateValue7;
    intermediateValue6 = 0.0;
    intermediateValue7 = 0.0;
    float multiplyAddValue4;
    float multiplyAddValue5;
    uint sumValue;
    uint scalarValue2 = 0u;
    for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float productValue2 = varyingTexCoord0.y * varyingTexCoord0.y;
    float multiplyAddValue = sqrt(fma(-varyingTexCoord0.x, varyingTexCoord0.x, 1.0));
    uint scalarValue = uint(int(fragmentScalarConstants1.packedValues[0u]));
    float scalarValue1 = rdEvaluateFloatExpression(uint(fragmentScalarConstants1.packedValues[0u]));
    float multiplyAddValue1 = fma(productValue2, productValue2, -1.0);
    float productValue3 = productValue2 * 0.5;
    float multiplyAddValue2 = fma(-productValue2, 0.5, 1.0);
    float multiplyAddValue3 = varyingTexCoord0.x / (fma(varyingTexCoord0.x, multiplyAddValue2, productValue3) + 9.9999997473787516355514526367188e-05);
    float intermediateValue6;
    float intermediateValue7;
    intermediateValue6 = 0.0;
    intermediateValue7 = 0.0;
    float multiplyAddValue4;
    float multiplyAddValue5;
    uint sumValue;
    uint scalarValue2 = 0u;
    for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float nonlinearValue3 = sqrt(1.0 - (varyingTexCoord0.x * varyingTexCoord0.x));
    float intermediateValue;
    float intermediateValue2;
    if (int(uint(int(fragmentVectorConstants1.packedValues[0u].x))) > int(0u))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        if (int(scalarValue) <= int(scalarValue2))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float intermediateValue1;
        float intermediateValue3;
        float scalarValue4 = 0.0;
        float scalarValue5 = 0.0;
        uint scalarValue2 = 0u;
        float intermediateValue7;
        float productValue;
        float nonlinearValue1;
        float productValue1;
        float intermediateValue8;
        bool intermediateValue9;
        for (;;)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue7 = fragmentVectorConstants1.packedValues[0u].x;
            uint bitwiseValue5 = (scalarValue2 << 16u) | (scalarValue2 >> 16u);
            uint bitwiseValue6 = ((bitwiseValue5 << 1u) & 2863311530u) | ((bitwiseValue5 >> 1u) & 1431655765u);
            uint bitwiseValue7 = ((bitwiseValue6 << 2u) & 3435973836u) | ((bitwiseValue6 >> 2u) & 858993459u);
            uint bitwiseValue8 = ((bitwiseValue7 << 4u) & 4042322160u) | ((bitwiseValue7 >> 4u) & 252645135u);
            float bitwiseValue9 = float(((bitwiseValue8 << 8u) & 4278255360u) | ((bitwiseValue8 >> 8u) & 16711935u)) * 2.3283064365386962890625e-10;
            productValue = varyingTexCoord0.y * varyingTexCoord0.y;
            float quotientValue = (float(scalarValue2) / float(uint(intermediateValue7))) * 6.283185482025146484375;
            nonlinearValue1 = sqrt((1.0 - bitwiseValue9) / ((bitwiseValue9 * ((productValue * productValue) + (-1.0))) + 1.0));
            float nonlinearValue4 = sqrt(1.0 - (nonlinearValue1 * nonlinearValue1));
            float dotProductValue = dot(vec3(nonlinearValue3, 0.0, varyingTexCoord0.x), vec3(sin(quotientValue) * nonlinearValue4, (-0.0) - (nonlinearValue4 * cos(quotientValue)), nonlinearValue1));
            productValue1 = spvNClamp(((nonlinearValue1 * 2.0) * dotProductValue) - varyingTexCoord0.x, 0.0, 1.0);
            intermediateValue8 = spvNClamp(dotProductValue, 0.0, 1.0);
            intermediateValue9 = productValue1 > 0.0;
            float branchMergedValue;
            float branchMergedValue1;
            if (intermediateValue9)
            {
                float productValue6 = productValue * 0.5;
                float sumValue3 = 1.0 - productValue6;
                float sumValue4 = productValue6 + 9.9999997473787516355514526367188e-05;
                float quotientValue1 = (((varyingTexCoord0.x / ((sumValue3 * varyingTexCoord0.x) + sumValue4)) * intermediateValue8) * (productValue1 / ((productValue1 * sumValue3) + sumValue4))) / (spvNClamp(nonlinearValue1, 0.0, 1.0) * varyingTexCoord0.x);
                float sumValue5 = 1.0 - intermediateValue8;
                float productValue7 = sumValue5 * sumValue5;
                float productValue8 = (productValue7 * productValue7) * sumValue5;
                branchMergedValue = (quotientValue1 * (1.0 - productValue8)) + scalarValue4;
                branchMergedValue1 = (quotientValue1 * productValue8) + scalarValue5;
            }
            else
            {
                branchMergedValue = scalarValue4;
                branchMergedValue1 = scalarValue5;
            }
            intermediateValue1 = branchMergedValue;
            intermediateValue3 = branchMergedValue1;
            uint sumValue6 = scalarValue2 + 1u;
            if (int(sumValue6) < int(uint(int(intermediateValue7))))
            {
                scalarValue4 = intermediateValue1;
                scalarValue5 = intermediateValue3;
                scalarValue2 = sumValue6;
                continue;
            }
            else
            {
                break;
            }
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40
        uint bitwiseValue10 = (scalarValue2 << 16u) + (scalarValue2 >> 16u);
        uint bitwiseValue11 = ((bitwiseValue10 << 1u) & 2863311530u) + ((bitwiseValue10 >> 1u) & 1431655765u);
        uint bitwiseValue12 = ((bitwiseValue11 << 2u) & 3435973836u) + ((bitwiseValue11 >> 2u) & 858993459u);
        uint bitwiseValue13 = ((bitwiseValue12 << 4u) & 4042322160u) + ((bitwiseValue12 >> 4u) & 252645135u);
        float bitwiseValue14 = rdEvaluateFloatExpression(((bitwiseValue13 << 8u) & 4278255360u) + ((bitwiseValue13 >> 8u) & 16711935u));
        precise float productValue11 = bitwiseValue14 * 2.3283064365386962890625e-10;
        precise float quotientValue3 = rdEvaluateFloatExpression(scalarValue2) / scalarValue1;
        precise float productValue12 = quotientValue3 * 6.283185482025146484375;
        precise float multiplyAddValue11 = fma(-bitwiseValue14, 2.3283064365386962890625e-10, 1.0) / fma(multiplyAddValue8, productValue11, 1.0);
        float nonlinearValue5 = sqrt(multiplyAddValue11);
        precise float sumValue7 = 1.0 - multiplyAddValue11;
        precise float nonlinearValue6 = sqrt(sumValue7) * sin(productValue12);
        precise float productValue13 = nonlinearValue5 * 0.0;
        precise float productValue14 = nonlinearValue5 * 1.0;
        float multiplyAddValue12 = fma(nonlinearValue6, 0.0, productValue14);
        float multiplyAddValue13 = rdDot2Precise(vec2(multiplyAddValue, varyingTexCoord0.x), vec2(fma(nonlinearValue6, 1.0, productValue13), multiplyAddValue12));
        precise float sumValue8 = rdDot2Precise(vec2(multiplyAddValue12), vec2(multiplyAddValue13)) - varyingTexCoord0.x;
        float scalarValue6 = spvNClamp(sumValue8, 0.0, 1.0);
        float scalarValue7 = spvNClamp(multiplyAddValue13, 0.0, 1.0);
        bool conditionValue1 = scalarValue6 > 0.0;
        precise float multiplyAddValue14 = fma(scalarValue6, multiplyAddValue9, productValue10) + 9.9999997473787516355514526367188e-05;
        precise float quotientValue4 = scalarValue6 / multiplyAddValue14;
        precise float productValue15 = quotientValue2 * quotientValue4;
        precise float productValue16 = scalarValue7 * productValue15;
        precise float productValue17 = spvNMin(multiplyAddValue12, 1.0) * varyingTexCoord0.x;
        precise float quotientValue5 = productValue16 / productValue17;
        precise float sumValue9 = 1.0 - scalarValue7;
        precise float productValue18 = sumValue9 * sumValue9;
        precise float productValue19 = productValue18 * productValue18;
        precise float productValue20 = sumValue9 * productValue19;
        multiplyAddValue5 = conditionValue1 ? fma(fma(-productValue19, sumValue9, 1.0), quotientValue5, intermediateValue7) : intermediateValue7;
        multiplyAddValue4 = conditionValue1 ? fma(productValue20, quotientValue5, intermediateValue6) : intermediateValue6;
        sumValue = scalarValue2 + 1u;
        intermediateValue6 = multiplyAddValue4;
        intermediateValue7 = multiplyAddValue5;
        scalarValue2 = sumValue;
        continue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        uint bitwiseValue = scalarValue2 >> 16u;
        uint bitwiseValue1 = (bitfieldInsert(bitwiseValue << 1u, scalarValue2, int(17u), int(16u)) & 2863311530u) + ((bitfieldInsert(bitwiseValue, scalarValue2, int(16u), int(16u)) >> 1u) & 1431655765u);
        uint bitwiseValue2 = ((bitwiseValue1 << 2u) & 3435973836u) + ((bitwiseValue1 >> 2u) & 858993459u);
        uint bitwiseValue3 = ((bitwiseValue2 << 4u) & 4042322160u) + ((bitwiseValue2 >> 4u) & 252645135u);
        float bitwiseValue4 = rdEvaluateFloatExpression(((bitwiseValue3 << 8u) & 4278255360u) + ((bitwiseValue3 >> 8u) & 16711935u));
        float multiplyAddValue6 = fma(-bitwiseValue4, 2.3283064365386962890625e-10, 1.0) / fma(multiplyAddValue1, bitwiseValue4 * 2.3283064365386962890625e-10, 1.0);
        float nonlinearValue = sqrt(multiplyAddValue6);
        float nonlinearValue2 = rdDot2Precise(vec2(multiplyAddValue, varyingTexCoord0.x), vec2(sqrt(1.0 - multiplyAddValue6) * sin((rdEvaluateFloatExpression(scalarValue2) / scalarValue1) * 6.283185482025146484375), nonlinearValue));
        float sumValue1 = spvNClamp(rdDot2Precise(vec2(nonlinearValue), vec2(nonlinearValue2)) - varyingTexCoord0.x, 0.0, 1.0);
        float scalarValue3 = spvNClamp(nonlinearValue2, 0.0, 1.0);
        bool conditionValue = sumValue1 > 0.0;
        float multiplyAddValue7 = (scalarValue3 * (multiplyAddValue3 * (sumValue1 / (fma(sumValue1, multiplyAddValue2, productValue3) + 9.9999997473787516355514526367188e-05)))) / (spvNMin(nonlinearValue, 1.0) * varyingTexCoord0.x);
        float sumValue2 = 1.0 - scalarValue3;
        float productValue4 = sumValue2 * sumValue2;
        float productValue5 = productValue4 * productValue4;
        multiplyAddValue5 = conditionValue ? fma(fma(-productValue5, sumValue2, 1.0), multiplyAddValue7, intermediateValue7) : intermediateValue7;
        multiplyAddValue4 = conditionValue ? fma(sumValue2 * productValue5, multiplyAddValue7, intermediateValue6) : intermediateValue6;
        sumValue = scalarValue2 + 1u;
        intermediateValue6 = multiplyAddValue4;
        intermediateValue7 = multiplyAddValue5;
        scalarValue2 = sumValue;
        continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue = intermediateValue1;
        intermediateValue2 = intermediateValue3;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float quotientValue6 = intermediateValue7 / fragmentScalarConstants1.packedValues[0u];
    precise float quotientValue7 = intermediateValue6 / fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.x = quotientValue6;
    fragmentColor0.y = quotientValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = intermediateValue7 / fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.y = intermediateValue6 / fragmentScalarConstants1.packedValues[0u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    else
    {
        intermediateValue = 0.0;
        intermediateValue2 = 0.0;
    }
    fragmentColor0.x = intermediateValue / fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = intermediateValue2 / fragmentVectorConstants1.packedValues[0u].x;
#endif
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 1.0;
}
