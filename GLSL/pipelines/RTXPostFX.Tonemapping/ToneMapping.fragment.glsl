#version 460
#extension GL_GOOGLE_include_directive : require
// RTXPostFX.Tonemapping / ToneMapping / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
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
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/RTXPostFX.Tonemapping/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue = fma(sampledTextureValue1.x, fragmentScalarConstants1.packedValues[20u], sampledTextureValue.x);
    float multiplyAddValue1 = fma(sampledTextureValue1.y, fragmentScalarConstants1.packedValues[20u], sampledTextureValue.y);
    float multiplyAddValue2 = fma(sampledTextureValue1.z, fragmentScalarConstants1.packedValues[20u], sampledTextureValue.z);
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if (fragmentScalarConstants1.packedValues[48u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue6 = texture(sampler2D(rasterColorTexture, rasterColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue7 = texture(sampler2D(gBloomBufferTexture, gBloomBufferSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue24 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[5u].x, sampledTextureValue6.x);
    float multiplyAddValue25 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[5u].x, sampledTextureValue6.y);
    float multiplyAddValue26 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[5u].x, sampledTextureValue6.z);
    float intermediateValue;
    float intermediateValue1;
    float intermediateValue2;
    if (fragmentVectorConstants1.packedValues[12u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        vec3 vectorValue = vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2);
        float multiplyAddValue3;
        float multiplyAddValue4;
        float multiplyAddValue5;
        if (fragmentScalarConstants1.packedValues[0u] == 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue;
        float branchMergedValue3;
        float branchMergedValue4;
        if (fragmentVectorConstants1.packedValues[0u].x == 0.0)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float scalarValue = spvNMax(rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), -24.0);
            precise float nonlinearValue = log2(scalarValue) + 24.0;
            precise float productValue15 = nonlinearValue * 0.0357142873108386993408203125;
            float sampledTextureValue11 = exp2(textureLod(sampler2D(materialTexture3, textureSampler3), vec2(productValue15, 0.5), 0.0).x);
            precise float productValue16 = multiplyAddValue * sampledTextureValue11;
            precise float productValue17 = multiplyAddValue1 * sampledTextureValue11;
            precise float productValue18 = multiplyAddValue2 * sampledTextureValue11;
            precise float quotientValue19 = productValue16 / scalarValue;
            precise float quotientValue20 = productValue17 / scalarValue;
            precise float quotientValue21 = productValue18 / scalarValue;
            float scalarValue6 = rdDot3Precise2(vec3(quotientValue19, quotientValue20, quotientValue21), vec3(0.3333333432674407958984375));
            precise float multiplyAddValue27 = fma(scalarValue6, fma(scalarValue6, -1489.699951171875, 1486.4000244140625), -3.2999999523162841796875) / fma(scalarValue6, fma(scalarValue6, 0.1500000059604644775390625, 944.20001220703125), 1.0);
            precise float sumValue8 = multiplyAddValue27 - 1.0;
            float multiplyAddValue28 = fma(fragmentScalarConstants1.packedValues[40u], spvNMax(sumValue8, 0.0), 1.0);
            precise float sumValue9 = quotientValue19 - scalarValue6;
            precise float sumValue10 = quotientValue20 - scalarValue6;
            precise float sumValue11 = quotientValue21 - scalarValue6;
            multiplyAddValue5 = fma(multiplyAddValue28, sumValue9, scalarValue6);
            multiplyAddValue4 = fma(multiplyAddValue28, sumValue10, scalarValue6);
            multiplyAddValue3 = fma(multiplyAddValue28, sumValue11, scalarValue6);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float scalarValue = spvNMax(rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), -24.0);
            float sampledTextureValue2 = exp2(textureLod(sampler2D(materialTexture3, textureSampler3), vec2((log2(scalarValue) + 24.0) * 0.0357142873108386993408203125, 0.5), 0.0).x);
            float quotientValue = (multiplyAddValue * sampledTextureValue2) / scalarValue;
            float quotientValue1 = (multiplyAddValue1 * sampledTextureValue2) / scalarValue;
            float quotientValue2 = (multiplyAddValue2 * sampledTextureValue2) / scalarValue;
            float scalarValue1 = rdDot3Precise2(vec3(quotientValue, quotientValue1, quotientValue2), vec3(0.3333333432674407958984375));
            float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[40u], spvNMax((fma(scalarValue1, fma(scalarValue1, -1489.699951171875, 1486.4000244140625), -3.2999999523162841796875) / fma(scalarValue1, fma(scalarValue1, 0.1500000059604644775390625, 944.20001220703125), 1.0)) - 1.0, 0.0), 1.0);
            multiplyAddValue5 = fma(multiplyAddValue6, quotientValue - scalarValue1, scalarValue1);
            multiplyAddValue4 = fma(multiplyAddValue6, quotientValue1 - scalarValue1, scalarValue1);
            multiplyAddValue3 = fma(multiplyAddValue6, quotientValue2 - scalarValue1, scalarValue1);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float dotProductValue = spvNMax(dot(vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), -24.0);
            float sampledTextureValue8 = exp2(textureLod(sampler2D(gToneCurveTexture, gToneCurveSampler), vec2((log2(dotProductValue) + 24.0) * 0.0357142873108386993408203125, 0.5), 0.0).x);
            float quotientValue7 = (sampledTextureValue8 * multiplyAddValue24) / dotProductValue;
            float quotientValue8 = (sampledTextureValue8 * multiplyAddValue25) / dotProductValue;
            float quotientValue9 = (sampledTextureValue8 * multiplyAddValue26) / dotProductValue;
            float dotProductValue1 = dot(vec3(quotientValue7, quotientValue8, quotientValue9), vec3(0.3333333432674407958984375));
            float quotientValue10 = (fragmentVectorConstants1.packedValues[10u].x * spvNMax(0.0, ((((1486.4000244140625 - (dotProductValue1 * 1489.699951171875)) * dotProductValue1) + (-3.2999999523162841796875)) / ((((dotProductValue1 * 0.1500000059604644775390625) + 944.20001220703125) * dotProductValue1) + 1.0)) + (-1.0))) + 1.0;
            branchMergedValue = (quotientValue10 * (quotientValue7 - dotProductValue1)) + dotProductValue1;
            branchMergedValue3 = (quotientValue10 * (quotientValue8 - dotProductValue1)) + dotProductValue1;
            branchMergedValue4 = (quotientValue10 * (quotientValue9 - dotProductValue1)) + dotProductValue1;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float intermediateValue21;
            float intermediateValue22;
            float intermediateValue23;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue1;
            float productValue2;
            float productValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue;
            float productValue1;
            float productValue2;
#endif
            if (varyingTexCoord0.x < 0.25)
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float scalarValue2 = rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                precise float sumValue12 = scalarValue2 + 1.0;
                precise float quotientValue22 = scalarValue2 / sumValue12;
                precise float productValue19 = fragmentScalarConstants1.packedValues[8u] * (-1.44269502162933349609375);
                precise float exponentialValue9 = quotientValue22 * exp2(productValue19);
                precise float nonlinearValue1 = log2(spvNMin(exponentialValue9, 1.0)) * fragmentScalarConstants1.packedValues[12u];
                precise float exponentialValue10 = quotientValue22 * exp2(nonlinearValue1);
                precise float quotientValue23 = exponentialValue10 / scalarValue2;
                precise float productValue20 = quotientValue23 * multiplyAddValue;
                precise float productValue21 = quotientValue23 * multiplyAddValue1;
                precise float productValue22 = quotientValue23 * multiplyAddValue2;
                intermediateValue21 = productValue22;
                intermediateValue22 = productValue21;
                intermediateValue23 = productValue20;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue2 = rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                float quotientValue3 = scalarValue2 / (scalarValue2 + 1.0);
                float exponentialValue4 = (quotientValue3 * exp2(log2(spvNMin(quotientValue3 * exp2(fragmentScalarConstants1.packedValues[8u] * (-1.44269502162933349609375)), 1.0)) * fragmentScalarConstants1.packedValues[12u])) / scalarValue2;
                productValue1 = exponentialValue4 * multiplyAddValue2;
                productValue2 = exponentialValue4 * multiplyAddValue1;
                productValue3 = exponentialValue4 * multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float dotProductValue2 = dot(vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
                float quotientValue11 = dotProductValue2 / (dotProductValue2 + 1.0);
                float exponentialValue8 = (exp2(log2(spvNMin(1.0, exp2(fragmentVectorConstants1.packedValues[2u].x * (-1.44269502162933349609375)) * quotientValue11)) * fragmentVectorConstants1.packedValues[3u].x) * quotientValue11) / dotProductValue2;
                productValue = exponentialValue8 * multiplyAddValue24;
                productValue1 = exponentialValue8 * multiplyAddValue25;
                productValue2 = exponentialValue8 * multiplyAddValue26;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float exponentialValue5;
                float exponentialValue6;
                float exponentialValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float exponentialValue1;
                float exponentialValue2;
                float exponentialValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float branchMergedValue1;
                float branchMergedValue5;
                float branchMergedValue6;
#endif
                if (varyingTexCoord0.x < 0.5)
                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                    precise float sumValue13 = multiplyAddValue - 0.0040000001899898052215576171875;
                    precise float sumValue14 = multiplyAddValue1 - 0.0040000001899898052215576171875;
                    precise float sumValue15 = multiplyAddValue2 - 0.0040000001899898052215576171875;
                    float scalarValue7 = spvNMax(sumValue13, 0.0);
                    float scalarValue8 = spvNMax(sumValue14, 0.0);
                    float scalarValue9 = spvNMax(sumValue15, 0.0);
                    precise float multiplyAddValue29 = scalarValue7 * fma(scalarValue7, 6.19999980926513671875, 0.5);
                    precise float multiplyAddValue30 = scalarValue8 * fma(scalarValue8, 6.19999980926513671875, 0.5);
                    precise float multiplyAddValue31 = scalarValue9 * fma(scalarValue9, 6.19999980926513671875, 0.5);
                    precise float multiplyAddValue32 = multiplyAddValue29 / fma(scalarValue7, fma(scalarValue7, 6.19999980926513671875, 1.7000000476837158203125), 0.0599999986588954925537109375);
                    precise float multiplyAddValue33 = multiplyAddValue30 / fma(scalarValue8, fma(scalarValue8, 6.19999980926513671875, 1.7000000476837158203125), 0.0599999986588954925537109375);
                    precise float multiplyAddValue34 = multiplyAddValue31 / fma(scalarValue9, fma(scalarValue9, 6.19999980926513671875, 1.7000000476837158203125), 0.0599999986588954925537109375);
                    bool comparisonValue = fragmentScalarConstants1.packedValues[28u] != 0.0;
                    precise float nonlinearValue2 = log2(multiplyAddValue32) * 2.2000000476837158203125;
                    precise float nonlinearValue3 = log2(multiplyAddValue33) * 2.2000000476837158203125;
                    precise float nonlinearValue4 = log2(multiplyAddValue34) * 2.2000000476837158203125;
                    exponentialValue7 = comparisonValue ? exp2(nonlinearValue2) : multiplyAddValue32;
                    exponentialValue6 = comparisonValue ? exp2(nonlinearValue3) : multiplyAddValue33;
                    exponentialValue5 = comparisonValue ? exp2(nonlinearValue4) : multiplyAddValue34;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    float sumValue = spvNMax(multiplyAddValue - 0.0040000001899898052215576171875, 0.0);
                    float sumValue1 = spvNMax(multiplyAddValue1 - 0.0040000001899898052215576171875, 0.0);
                    float sumValue2 = spvNMax(multiplyAddValue2 - 0.0040000001899898052215576171875, 0.0);
                    float multiplyAddValue7 = (sumValue * fma(sumValue, 6.19999980926513671875, 0.5)) / fma(sumValue, fma(sumValue, 6.19999980926513671875, 1.7000000476837158203125), 0.0599999986588954925537109375);
                    float multiplyAddValue8 = (sumValue1 * fma(sumValue1, 6.19999980926513671875, 0.5)) / fma(sumValue1, fma(sumValue1, 6.19999980926513671875, 1.7000000476837158203125), 0.0599999986588954925537109375);
                    float multiplyAddValue9 = (sumValue2 * fma(sumValue2, 6.19999980926513671875, 0.5)) / fma(sumValue2, fma(sumValue2, 6.19999980926513671875, 1.7000000476837158203125), 0.0599999986588954925537109375);
                    bool comparisonValue = fragmentScalarConstants1.packedValues[28u] != 0.0;
                    exponentialValue3 = comparisonValue ? exp2(log2(multiplyAddValue7) * 2.2000000476837158203125) : multiplyAddValue7;
                    exponentialValue2 = comparisonValue ? exp2(log2(multiplyAddValue8) * 2.2000000476837158203125) : multiplyAddValue8;
                    exponentialValue1 = comparisonValue ? exp2(log2(multiplyAddValue9) * 2.2000000476837158203125) : multiplyAddValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float sumValue4 = spvNMax(0.0, multiplyAddValue24 + (-0.0040000001899898052215576171875));
                    float sumValue5 = spvNMax(0.0, multiplyAddValue25 + (-0.0040000001899898052215576171875));
                    float sumValue6 = spvNMax(0.0, multiplyAddValue26 + (-0.0040000001899898052215576171875));
                    float productValue4 = sumValue4 * 6.19999980926513671875;
                    float productValue5 = sumValue5 * 6.19999980926513671875;
                    float productValue6 = sumValue6 * 6.19999980926513671875;
                    float quotientValue12 = ((productValue4 + 0.5) * sumValue4) / (((productValue4 + 1.7000000476837158203125) * sumValue4) + 0.0599999986588954925537109375);
                    float quotientValue13 = ((productValue5 + 0.5) * sumValue5) / (((productValue5 + 1.7000000476837158203125) * sumValue5) + 0.0599999986588954925537109375);
                    float quotientValue14 = ((productValue6 + 0.5) * sumValue6) / (((productValue6 + 1.7000000476837158203125) * sumValue6) + 0.0599999986588954925537109375);
                    float branchMergedValue10;
                    float branchMergedValue13;
                    float branchMergedValue14;
                    if (fragmentVectorConstants1.packedValues[7u].x != 0.0)
                    {
                        branchMergedValue10 = exp2(log2(quotientValue12) * 2.2000000476837158203125);
                        branchMergedValue13 = exp2(log2(quotientValue13) * 2.2000000476837158203125);
                        branchMergedValue14 = exp2(log2(quotientValue14) * 2.2000000476837158203125);
                    }
                    else
                    {
                        branchMergedValue10 = quotientValue12;
                        branchMergedValue13 = quotientValue13;
                        branchMergedValue14 = quotientValue14;
                    }
                    branchMergedValue1 = branchMergedValue10;
                    branchMergedValue5 = branchMergedValue13;
                    branchMergedValue6 = branchMergedValue14;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                    float scalarValue3 = spvNMax(rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), -24.0);
                    precise float nonlinearValue5 = log2(scalarValue3) + 24.0;
                    precise float productValue23 = nonlinearValue5 * 0.0357142873108386993408203125;
                    float sampledTextureValue12 = exp2(textureLod(sampler2D(materialTexture3, textureSampler3), vec2(productValue23, 0.5), 0.0).x);
                    precise float productValue24 = multiplyAddValue * sampledTextureValue12;
                    precise float productValue25 = multiplyAddValue1 * sampledTextureValue12;
                    precise float productValue26 = multiplyAddValue2 * sampledTextureValue12;
                    precise float quotientValue24 = productValue24 / scalarValue3;
                    precise float quotientValue25 = productValue25 / scalarValue3;
                    precise float quotientValue26 = productValue26 / scalarValue3;
                    float scalarValue10 = rdDot3Precise2(vec3(quotientValue24, quotientValue25, quotientValue26), vec3(0.3333333432674407958984375));
                    precise float multiplyAddValue35 = fma(scalarValue10, fma(scalarValue10, -1489.699951171875, 1486.4000244140625), -3.2999999523162841796875) / fma(scalarValue10, fma(scalarValue10, 0.1500000059604644775390625, 944.20001220703125), 1.0);
                    precise float sumValue16 = multiplyAddValue35 - 1.0;
                    float multiplyAddValue36 = fma(fragmentScalarConstants1.packedValues[40u], spvNMax(sumValue16, 0.0), 1.0);
                    precise float sumValue17 = quotientValue24 - scalarValue10;
                    precise float sumValue18 = quotientValue25 - scalarValue10;
                    precise float sumValue19 = quotientValue26 - scalarValue10;
                    exponentialValue7 = fma(multiplyAddValue36, sumValue17, scalarValue10);
                    exponentialValue6 = fma(multiplyAddValue36, sumValue18, scalarValue10);
                    exponentialValue5 = fma(multiplyAddValue36, sumValue19, scalarValue10);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    float scalarValue3 = spvNMax(rdDot3Precise2(vectorValue, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), -24.0);
                    float sampledTextureValue3 = exp2(textureLod(sampler2D(materialTexture3, textureSampler3), vec2((log2(scalarValue3) + 24.0) * 0.0357142873108386993408203125, 0.5), 0.0).x);
                    float quotientValue4 = (multiplyAddValue * sampledTextureValue3) / scalarValue3;
                    float quotientValue5 = (multiplyAddValue1 * sampledTextureValue3) / scalarValue3;
                    float quotientValue6 = (multiplyAddValue2 * sampledTextureValue3) / scalarValue3;
                    float scalarValue4 = rdDot3Precise2(vec3(quotientValue4, quotientValue5, quotientValue6), vec3(0.3333333432674407958984375));
                    float multiplyAddValue10 = fma(fragmentScalarConstants1.packedValues[40u], spvNMax((fma(scalarValue4, fma(scalarValue4, -1489.699951171875, 1486.4000244140625), -3.2999999523162841796875) / fma(scalarValue4, fma(scalarValue4, 0.1500000059604644775390625, 944.20001220703125), 1.0)) - 1.0, 0.0), 1.0);
                    exponentialValue3 = fma(multiplyAddValue10, quotientValue4 - scalarValue4, scalarValue4);
                    exponentialValue2 = fma(multiplyAddValue10, quotientValue5 - scalarValue4, scalarValue4);
                    exponentialValue1 = fma(multiplyAddValue10, quotientValue6 - scalarValue4, scalarValue4);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float dotProductValue3 = spvNMax(dot(vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), -24.0);
                    float sampledTextureValue9 = exp2(textureLod(sampler2D(gToneCurveTexture, gToneCurveSampler), vec2((log2(dotProductValue3) + 24.0) * 0.0357142873108386993408203125, 0.5), 0.0).x);
                    float quotientValue15 = (sampledTextureValue9 * multiplyAddValue24) / dotProductValue3;
                    float quotientValue16 = (sampledTextureValue9 * multiplyAddValue25) / dotProductValue3;
                    float quotientValue17 = (sampledTextureValue9 * multiplyAddValue26) / dotProductValue3;
                    float dotProductValue4 = dot(vec3(quotientValue15, quotientValue16, quotientValue17), vec3(0.3333333432674407958984375));
                    float quotientValue18 = (fragmentVectorConstants1.packedValues[10u].x * spvNMax(0.0, ((((1486.4000244140625 - (dotProductValue4 * 1489.699951171875)) * dotProductValue4) + (-3.2999999523162841796875)) / ((((dotProductValue4 * 0.1500000059604644775390625) + 944.20001220703125) * dotProductValue4) + 1.0)) + (-1.0))) + 1.0;
                    branchMergedValue1 = (quotientValue18 * (quotientValue15 - dotProductValue4)) + dotProductValue4;
                    branchMergedValue5 = (quotientValue18 * (quotientValue16 - dotProductValue4)) + dotProductValue4;
                    branchMergedValue6 = (quotientValue18 * (quotientValue17 - dotProductValue4)) + dotProductValue4;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                intermediateValue21 = exponentialValue5;
                intermediateValue22 = exponentialValue6;
                intermediateValue23 = exponentialValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                productValue1 = exponentialValue1;
                productValue2 = exponentialValue2;
                productValue3 = exponentialValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                productValue = branchMergedValue1;
                productValue1 = branchMergedValue5;
                productValue2 = branchMergedValue6;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM40
            bool sampledTextureValue4 = fma(-fma(texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x, 0.064153559505939483642578125, 1.0), 0.5, 1.0) < varyingTexCoord0.y;
            precise float sumValue20 = 1.0 - intermediateValue23;
            precise float sumValue21 = 1.0 - intermediateValue22;
            precise float sumValue22 = 1.0 - intermediateValue21;
            multiplyAddValue5 = sampledTextureValue4 ? fma(sumValue20, 0.20000000298023223876953125, intermediateValue23) : intermediateValue23;
            multiplyAddValue4 = sampledTextureValue4 ? fma(sumValue21, 0.20000000298023223876953125, intermediateValue22) : intermediateValue22;
            multiplyAddValue3 = sampledTextureValue4 ? fma(sumValue22, 0.20000000298023223876953125, intermediateValue21) : intermediateValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            bool sampledTextureValue4 = fma(-fma(texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x, 0.064153559505939483642578125, 1.0), 0.5, 1.0) < varyingTexCoord0.y;
            multiplyAddValue5 = sampledTextureValue4 ? fma(1.0 - productValue3, 0.20000000298023223876953125, productValue3) : productValue3;
            multiplyAddValue4 = sampledTextureValue4 ? fma(1.0 - productValue2, 0.20000000298023223876953125, productValue2) : productValue2;
            multiplyAddValue3 = sampledTextureValue4 ? fma(1.0 - productValue1, 0.20000000298023223876953125, productValue1) : productValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue9;
            float branchMergedValue11;
            float branchMergedValue12;
            if (varyingTexCoord0.y > (0.5 - (texture(sampler2D(gToneCurveTexture, gToneCurveSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y)).x * 0.0320767797529697418212890625)))
            {
                branchMergedValue9 = ((1.0 - productValue) * 0.20000000298023223876953125) + productValue;
                branchMergedValue11 = ((1.0 - productValue1) * 0.20000000298023223876953125) + productValue1;
                branchMergedValue12 = ((1.0 - productValue2) * 0.20000000298023223876953125) + productValue2;
            }
            else
            {
                branchMergedValue9 = productValue;
                branchMergedValue11 = productValue1;
                branchMergedValue12 = productValue2;
            }
            branchMergedValue = branchMergedValue9;
            branchMergedValue3 = branchMergedValue11;
            branchMergedValue4 = branchMergedValue12;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue14 = multiplyAddValue3;
        intermediateValue15 = multiplyAddValue4;
        intermediateValue16 = multiplyAddValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue = branchMergedValue;
        intermediateValue1 = branchMergedValue3;
        intermediateValue2 = branchMergedValue4;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue14 = multiplyAddValue2;
        intermediateValue15 = multiplyAddValue1;
        intermediateValue16 = multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue = multiplyAddValue24;
        intermediateValue1 = multiplyAddValue25;
        intermediateValue2 = multiplyAddValue26;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[24u] != 0.0;
    float multiplyAddValue11 = spvNClamp(fma(fragmentScalarConstants1.packedValues[36u], fma(intermediateValue16, fragmentVectorConstants1.packedValues[8u].x, -0.180000007152557373046875), 0.180000007152557373046875), 0.0, 1.0);
    float multiplyAddValue12 = spvNClamp(fma(fragmentScalarConstants1.packedValues[36u], fma(intermediateValue15, fragmentVectorConstants1.packedValues[8u].y, -0.180000007152557373046875), 0.180000007152557373046875), 0.0, 1.0);
    float multiplyAddValue16 = spvNClamp(fma(fragmentScalarConstants1.packedValues[36u], fma(intermediateValue14, fragmentVectorConstants1.packedValues[8u].z, -0.180000007152557373046875), 0.180000007152557373046875), 0.0, 1.0);
    float scalarValue5 = rdDot3Precise2(vec3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue16), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    precise float sumValue23 = multiplyAddValue11 - scalarValue5;
    precise float sumValue24 = multiplyAddValue12 - scalarValue5;
    precise float sumValue25 = multiplyAddValue16 - scalarValue5;
    precise float multiplyAddValue37 = log2(fma(fragmentScalarConstants1.packedValues[4u], sumValue23, scalarValue5)) * fragmentScalarConstants1.packedValues[44u];
    precise float multiplyAddValue38 = log2(fma(fragmentScalarConstants1.packedValues[4u], sumValue24, scalarValue5)) * fragmentScalarConstants1.packedValues[44u];
    precise float multiplyAddValue39 = log2(fma(fragmentScalarConstants1.packedValues[4u], sumValue25, scalarValue5)) * fragmentScalarConstants1.packedValues[44u];
    precise float exponentialValue11 = (comparisonValue1 ? exp2(multiplyAddValue37) : intermediateValue16) - multiplyAddValue;
    precise float exponentialValue12 = (comparisonValue1 ? exp2(multiplyAddValue38) : intermediateValue15) - multiplyAddValue1;
    precise float exponentialValue13 = (comparisonValue1 ? exp2(multiplyAddValue39) : intermediateValue14) - multiplyAddValue2;
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[48u], exponentialValue11, multiplyAddValue);
    float multiplyAddValue41 = fma(fragmentScalarConstants1.packedValues[48u], exponentialValue12, multiplyAddValue1);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[48u], exponentialValue13, multiplyAddValue2);
    float multiplyAddValue17;
    float multiplyAddValue18;
    float multiplyAddValue19;
    if (fragmentScalarConstants1.packedValues[28u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[24u] != 0.0;
    float multiplyAddValue11 = spvNClamp(fma(fragmentScalarConstants1.packedValues[36u], fma(intermediateValue16, fragmentVectorConstants1.packedValues[8u].x, -0.180000007152557373046875), 0.180000007152557373046875), 0.0, 1.0);
    float multiplyAddValue12 = spvNClamp(fma(fragmentScalarConstants1.packedValues[36u], fma(intermediateValue15, fragmentVectorConstants1.packedValues[8u].y, -0.180000007152557373046875), 0.180000007152557373046875), 0.0, 1.0);
    float multiplyAddValue16 = spvNClamp(fma(fragmentScalarConstants1.packedValues[36u], fma(intermediateValue14, fragmentVectorConstants1.packedValues[8u].z, -0.180000007152557373046875), 0.180000007152557373046875), 0.0, 1.0);
    float scalarValue5 = rdDot3Precise2(vec3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue16), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[48u], (comparisonValue1 ? exp2(log2(fma(fragmentScalarConstants1.packedValues[4u], multiplyAddValue11 - scalarValue5, scalarValue5)) * fragmentScalarConstants1.packedValues[44u]) : intermediateValue16) - multiplyAddValue, multiplyAddValue);
    float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[48u], (comparisonValue1 ? exp2(log2(fma(fragmentScalarConstants1.packedValues[4u], multiplyAddValue12 - scalarValue5, scalarValue5)) * fragmentScalarConstants1.packedValues[44u]) : intermediateValue15) - multiplyAddValue1, multiplyAddValue1);
    float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[48u], (comparisonValue1 ? exp2(log2(fma(fragmentScalarConstants1.packedValues[4u], multiplyAddValue16 - scalarValue5, scalarValue5)) * fragmentScalarConstants1.packedValues[44u]) : intermediateValue14) - multiplyAddValue2, multiplyAddValue2);
    float multiplyAddValue13;
    float multiplyAddValue14;
    float multiplyAddValue15;
    if (fragmentScalarConstants1.packedValues[28u] != 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[6u].x != 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float productValue27 = multiplyAddValue40 * 12.9200000762939453125;
        precise float productValue28 = multiplyAddValue41 * 12.9200000762939453125;
        precise float productValue29 = multiplyAddValue42 * 12.9200000762939453125;
        precise float nonlinearValue6 = log2(multiplyAddValue40) * 0.4166666567325592041015625;
        precise float nonlinearValue7 = log2(multiplyAddValue41) * 0.4166666567325592041015625;
        precise float nonlinearValue8 = log2(multiplyAddValue42) * 0.4166666567325592041015625;
        multiplyAddValue17 = (multiplyAddValue42 < 0.003130800090730190277099609375) ? productValue29 : fma(exp2(nonlinearValue8), 1.05499994754791259765625, -0.054999999701976776123046875);
        multiplyAddValue18 = (multiplyAddValue41 < 0.003130800090730190277099609375) ? productValue28 : fma(exp2(nonlinearValue7), 1.05499994754791259765625, -0.054999999701976776123046875);
        multiplyAddValue19 = (multiplyAddValue40 < 0.003130800090730190277099609375) ? productValue27 : fma(exp2(nonlinearValue6), 1.05499994754791259765625, -0.054999999701976776123046875);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue13 = (multiplyAddValue22 < 0.003130800090730190277099609375) ? (multiplyAddValue22 * 12.9200000762939453125) : fma(exp2(log2(multiplyAddValue22) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875);
        multiplyAddValue14 = (multiplyAddValue21 < 0.003130800090730190277099609375) ? (multiplyAddValue21 * 12.9200000762939453125) : fma(exp2(log2(multiplyAddValue21) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875);
        multiplyAddValue15 = (multiplyAddValue20 < 0.003130800090730190277099609375) ? (multiplyAddValue20 * 12.9200000762939453125) : fma(exp2(log2(multiplyAddValue20) * 0.4166666567325592041015625), 1.05499994754791259765625, -0.054999999701976776123046875);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue7 = spvNClamp((((fragmentVectorConstants1.packedValues[8u].x * intermediateValue) + (-0.180000007152557373046875)) * fragmentVectorConstants1.packedValues[9u].x) + 0.180000007152557373046875, 0.0, 1.0);
        float productValue8 = spvNClamp((((fragmentVectorConstants1.packedValues[8u].y * intermediateValue1) + (-0.180000007152557373046875)) * fragmentVectorConstants1.packedValues[9u].x) + 0.180000007152557373046875, 0.0, 1.0);
        float productValue11 = spvNClamp((((fragmentVectorConstants1.packedValues[8u].z * intermediateValue2) + (-0.180000007152557373046875)) * fragmentVectorConstants1.packedValues[9u].x) + 0.180000007152557373046875, 0.0, 1.0);
        float dotProductValue5 = dot(vec3(productValue7, productValue8, productValue11), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        exponentialValue = exp2(log2(((productValue7 - dotProductValue5) * fragmentVectorConstants1.packedValues[1u].x) + dotProductValue5) * fragmentVectorConstants1.packedValues[11u].x);
        exponentialValue1 = exp2(log2(((productValue8 - dotProductValue5) * fragmentVectorConstants1.packedValues[1u].x) + dotProductValue5) * fragmentVectorConstants1.packedValues[11u].x);
        exponentialValue2 = exp2(log2(((productValue11 - dotProductValue5) * fragmentVectorConstants1.packedValues[1u].x) + dotProductValue5) * fragmentVectorConstants1.packedValues[11u].x);
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        multiplyAddValue17 = multiplyAddValue42;
        multiplyAddValue18 = multiplyAddValue41;
        multiplyAddValue19 = multiplyAddValue40;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue13 = multiplyAddValue22;
        multiplyAddValue14 = multiplyAddValue21;
        multiplyAddValue15 = multiplyAddValue20;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        exponentialValue = intermediateValue;
        exponentialValue1 = intermediateValue1;
        exponentialValue2 = intermediateValue2;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue30 = varyingTexCoord0.x * fragmentVectorConstants1.packedValues[4u].x;
    precise float productValue31 = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[4u].y;
    uint bitwiseValue7 = uint(abs(productValue31)) + (uint(abs(productValue30)) << 16u);
    uint bitwiseValue8 = ((bitwiseValue7 ^ 61u) ^ (bitwiseValue7 >> 16u)) * 9u;
    uint bitwiseValue9 = (bitwiseValue8 ^ (bitwiseValue8 >> 4u)) * 668265261u;
    float multiplyAddValue43 = fma(-rdEvaluateFloatExpression(bitwiseValue9 ^ (bitwiseValue9 >> 15u)), 4.656612873077392578125e-10, 0.5);
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float sumValue26 = 1.0 - sampledTextureValue5.w;
    fragmentColor0.x = fma(fma(multiplyAddValue43, 0.0039215688593685626983642578125, multiplyAddValue19), sumValue26, sampledTextureValue5.x);
    fragmentColor0.y = fma(fma(multiplyAddValue43, 0.0039215688593685626983642578125, multiplyAddValue18), sumValue26, sampledTextureValue5.y);
    fragmentColor0.z = fma(fma(multiplyAddValue43, 0.0039215688593685626983642578125, multiplyAddValue17), sumValue26, sampledTextureValue5.z);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint bitwiseValue = uint(abs(varyingTexCoord0.y * fragmentVectorConstants1.packedValues[4u].y)) + (uint(abs(varyingTexCoord0.x * fragmentVectorConstants1.packedValues[4u].x)) << 16u);
    uint bitwiseValue1 = ((bitwiseValue ^ 61u) ^ (bitwiseValue >> 16u)) * 9u;
    uint bitwiseValue2 = (bitwiseValue1 ^ (bitwiseValue1 >> 4u)) * 668265261u;
    float multiplyAddValue23 = fma(-rdEvaluateFloatExpression(bitwiseValue2 ^ (bitwiseValue2 >> 15u)), 4.656612873077392578125e-10, 0.5);
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float sumValue3 = 1.0 - sampledTextureValue5.w;
    fragmentColor0.x = fma(fma(multiplyAddValue23, 0.0039215688593685626983642578125, multiplyAddValue15), sumValue3, sampledTextureValue5.x);
    fragmentColor0.y = fma(fma(multiplyAddValue23, 0.0039215688593685626983642578125, multiplyAddValue14), sumValue3, sampledTextureValue5.y);
    fragmentColor0.z = fma(fma(multiplyAddValue23, 0.0039215688593685626983642578125, multiplyAddValue13), sumValue3, sampledTextureValue5.z);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue12 = ((exponentialValue - multiplyAddValue24) * fragmentVectorConstants1.packedValues[12u].x) + multiplyAddValue24;
    float productValue13 = ((exponentialValue1 - multiplyAddValue25) * fragmentVectorConstants1.packedValues[12u].x) + multiplyAddValue25;
    float productValue14 = ((exponentialValue2 - multiplyAddValue26) * fragmentVectorConstants1.packedValues[12u].x) + multiplyAddValue26;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if (fragmentVectorConstants1.packedValues[7u].x != 0.0)
    {
        float productValue9;
        if (productValue12 < 0.003130800090730190277099609375)
        {
            productValue9 = productValue12 * 12.9200000762939453125;
        }
        else
        {
            productValue9 = (exp2(log2(productValue12) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
        }
        float productValue10;
        if (productValue13 < 0.003130800090730190277099609375)
        {
            productValue10 = productValue13 * 12.9200000762939453125;
        }
        else
        {
            productValue10 = (exp2(log2(productValue13) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
        }
        float branchMergedValue2;
        float branchMergedValue7;
        float branchMergedValue8;
        if (productValue14 < 0.003130800090730190277099609375)
        {
            branchMergedValue2 = productValue9;
            branchMergedValue7 = productValue10;
            branchMergedValue8 = productValue14 * 12.9200000762939453125;
        }
        else
        {
            branchMergedValue2 = productValue9;
            branchMergedValue7 = productValue10;
            branchMergedValue8 = (exp2(log2(productValue14) * 0.4166666567325592041015625) * 1.05499994754791259765625) + (-0.054999999701976776123046875);
        }
        intermediateValue3 = branchMergedValue2;
        intermediateValue4 = branchMergedValue7;
        intermediateValue5 = branchMergedValue8;
    }
    else
    {
        intermediateValue3 = productValue12;
        intermediateValue4 = productValue13;
        intermediateValue5 = productValue14;
    }
    uint bitwiseValue3 = (uint(abs(fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord0.x)) << 16u) + uint(abs(fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord0.y));
    uint bitwiseValue4 = ((bitwiseValue3 ^ 61u) ^ (bitwiseValue3 >> 16u)) * 9u;
    uint bitwiseValue5 = ((bitwiseValue4 >> 4u) ^ bitwiseValue4) * 668265261u;
    float bitwiseValue6 = 0.00196078442968428134918212890625 - (float((bitwiseValue5 >> 15u) ^ bitwiseValue5) * 1.826122803319507603703186759958e-12);
    vec4 sampledTextureValue10 = texture(sampler2D(gRasterizedInputTexture, gRasterizedInputSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float sumValue7 = 1.0 - sampledTextureValue10.w;
    fragmentColor0.x = ((bitwiseValue6 + intermediateValue3) * sumValue7) + sampledTextureValue10.x;
    fragmentColor0.y = ((bitwiseValue6 + intermediateValue4) * sumValue7) + sampledTextureValue10.y;
    fragmentColor0.z = ((bitwiseValue6 + intermediateValue5) * sumValue7) + sampledTextureValue10.z;
#endif
    fragmentColor0.w = 1.0;
}
