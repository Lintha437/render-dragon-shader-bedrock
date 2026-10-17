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
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/RTXPostFX.Tonemapping/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeFragmentStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    float4 sampledTextureValue = materialTexture0.Sample(textureSampler0, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue1 = materialTexture1.Sample(textureSampler1, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue = mad(sampledTextureValue1.x, RD_UNIFORM_G_BLOOM_MULTIPLIER.x, sampledTextureValue.x);
    float multiplyAddValue1 = mad(sampledTextureValue1.y, RD_UNIFORM_G_BLOOM_MULTIPLIER.x, sampledTextureValue.y);
    float multiplyAddValue2 = mad(sampledTextureValue1.z, RD_UNIFORM_G_BLOOM_MULTIPLIER.x, sampledTextureValue.z);
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue6 = rasterColorTexture.Sample(rasterColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float4 sampledTextureValue7 = gBloomBufferTexture.Sample(gBloomBufferSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue24 = mad(sampledTextureValue7.x, RD_UNIFORM_G_BLOOM_MULTIPLIER.x, sampledTextureValue6.x);
    float multiplyAddValue25 = mad(sampledTextureValue7.y, RD_UNIFORM_G_BLOOM_MULTIPLIER.x, sampledTextureValue6.y);
    float multiplyAddValue26 = mad(sampledTextureValue7.z, RD_UNIFORM_G_BLOOM_MULTIPLIER.x, sampledTextureValue6.z);
    float intermediateValue;
    float intermediateValue1;
    float intermediateValue2;
#endif
    if (RD_UNIFORM_G_TONE_MAPPING_INTENSITY.x != 0.0f)
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        float3 vectorValue = float3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2);
        float multiplyAddValue3;
        float multiplyAddValue4;
        float multiplyAddValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue;
        float branchMergedValue3;
        float branchMergedValue4;
#endif
        if (RD_UNIFORM_G_TONE_MAPPING_DEBUG_MODE.x == 0.0f)
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float scalarValue = max(rdDot3Precise(vectorValue, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), -24.0f);
            precise float nonlinearValue = log2(scalarValue) + 24.0f;
            precise float productValue12 = nonlinearValue * 0.0357142873108386993408203125f;
            float sampledTextureValue11 = exp2(materialTexture3.SampleLevel(textureSampler3, float2(productValue12, 0.5f), 0.0f).x);
            precise float productValue13 = multiplyAddValue * sampledTextureValue11;
            precise float productValue14 = multiplyAddValue1 * sampledTextureValue11;
            precise float productValue15 = multiplyAddValue2 * sampledTextureValue11;
            precise float quotientValue19 = productValue13 / scalarValue;
            precise float quotientValue20 = productValue14 / scalarValue;
            precise float quotientValue21 = productValue15 / scalarValue;
            float scalarValue6 = rdDot3Precise(float3(quotientValue19, quotientValue20, quotientValue21), 0.3333333432674407958984375f.xxx);
            precise float multiplyAddValue27 = mad(scalarValue6, mad(scalarValue6, -1489.699951171875f, 1486.4000244140625f), -3.2999999523162841796875f) / mad(scalarValue6, mad(scalarValue6, 0.1500000059604644775390625f, 944.20001220703125f), 1.0f);
            precise float sumValue8 = multiplyAddValue27 - 1.0f;
            float multiplyAddValue28 = mad(RD_UNIFORM_G_TONE_MAPPING_FILMIC_SATURATION_CORRECTION.x, max(sumValue8, 0.0f), 1.0f);
            precise float sumValue9 = quotientValue19 - scalarValue6;
            precise float sumValue10 = quotientValue20 - scalarValue6;
            precise float sumValue11 = quotientValue21 - scalarValue6;
            multiplyAddValue5 = mad(multiplyAddValue28, sumValue9, scalarValue6);
            multiplyAddValue4 = mad(multiplyAddValue28, sumValue10, scalarValue6);
            multiplyAddValue3 = mad(multiplyAddValue28, sumValue11, scalarValue6);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float scalarValue = max(rdDot3Precise(vectorValue, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), -24.0f);
            float sampledTextureValue2 = exp2(materialTexture3.SampleLevel(textureSampler3, float2((log2(scalarValue) + 24.0f) * 0.0357142873108386993408203125f, 0.5f), 0.0f).x);
            float quotientValue = (multiplyAddValue * sampledTextureValue2) / scalarValue;
            float quotientValue1 = (multiplyAddValue1 * sampledTextureValue2) / scalarValue;
            float quotientValue2 = (multiplyAddValue2 * sampledTextureValue2) / scalarValue;
            float scalarValue1 = rdDot3Precise(float3(quotientValue, quotientValue1, quotientValue2), 0.3333333432674407958984375f.xxx);
            float multiplyAddValue6 = mad(RD_UNIFORM_G_TONE_MAPPING_FILMIC_SATURATION_CORRECTION.x, max((mad(scalarValue1, mad(scalarValue1, -1489.699951171875f, 1486.4000244140625f), -3.2999999523162841796875f) / mad(scalarValue1, mad(scalarValue1, 0.1500000059604644775390625f, 944.20001220703125f), 1.0f)) - 1.0f, 0.0f), 1.0f);
            multiplyAddValue5 = mad(multiplyAddValue6, quotientValue - scalarValue1, scalarValue1);
            multiplyAddValue4 = mad(multiplyAddValue6, quotientValue1 - scalarValue1, scalarValue1);
            multiplyAddValue3 = mad(multiplyAddValue6, quotientValue2 - scalarValue1, scalarValue1);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float dotProductValue = max(dot(float3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), -24.0f);
            float sampledTextureValue8 = exp2(gToneCurveTexture.SampleLevel(gToneCurveSampler, float2((log2(dotProductValue) + 24.0f) * 0.0357142873108386993408203125f, 0.5f), 0.0f).x);
            float quotientValue7 = (sampledTextureValue8 * multiplyAddValue24) / dotProductValue;
            float quotientValue8 = (sampledTextureValue8 * multiplyAddValue25) / dotProductValue;
            float quotientValue9 = (sampledTextureValue8 * multiplyAddValue26) / dotProductValue;
            float dotProductValue1 = dot(float3(quotientValue7, quotientValue8, quotientValue9), 0.3333333432674407958984375f.xxx);
            float quotientValue10 = (RD_UNIFORM_G_TONE_MAPPING_FILMIC_SATURATION_CORRECTION.x * max(0.0f, ((((1486.4000244140625f - (dotProductValue1 * 1489.699951171875f)) * dotProductValue1) + (-3.2999999523162841796875f)) / ((((dotProductValue1 * 0.1500000059604644775390625f) + 944.20001220703125f) * dotProductValue1) + 1.0f)) + (-1.0f))) + 1.0f;
            branchMergedValue = (quotientValue10 * (quotientValue7 - dotProductValue1)) + dotProductValue1;
            branchMergedValue3 = (quotientValue10 * (quotientValue8 - dotProductValue1)) + dotProductValue1;
            branchMergedValue4 = (quotientValue10 * (quotientValue9 - dotProductValue1)) + dotProductValue1;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float intermediateValue19;
            float intermediateValue20;
            float intermediateValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue1;
            float productValue2;
            float productValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue;
            float productValue1;
            float productValue2;
#endif
            if (varyingTexCoord0.x < 0.25f)
            {
#if RD_PLATFORM == RD_PLATFORM_SM40
                float scalarValue2 = rdDot3Precise(vectorValue, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                precise float sumValue12 = scalarValue2 + 1.0f;
                precise float quotientValue22 = scalarValue2 / sumValue12;
                precise float productValue16 = RD_UNIFORM_G_TONE_MAPPING_SHADOW_CONTRAST_END.x * (-1.44269502162933349609375f);
                precise float exponentialValue9 = quotientValue22 * exp2(productValue16);
                precise float nonlinearValue1 = log2(min(exponentialValue9, 1.0f)) * RD_UNIFORM_G_TONE_MAPPING_SHADOW_CONTRAST.x;
                precise float exponentialValue10 = quotientValue22 * exp2(nonlinearValue1);
                precise float quotientValue23 = exponentialValue10 / scalarValue2;
                precise float productValue17 = quotientValue23 * multiplyAddValue;
                precise float productValue18 = quotientValue23 * multiplyAddValue1;
                precise float productValue19 = quotientValue23 * multiplyAddValue2;
                intermediateValue19 = productValue19;
                intermediateValue20 = productValue18;
                intermediateValue21 = productValue17;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                float scalarValue2 = rdDot3Precise(vectorValue, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                float quotientValue3 = scalarValue2 / (scalarValue2 + 1.0f);
                float exponentialValue4 = (quotientValue3 * exp2(log2(min(quotientValue3 * exp2(RD_UNIFORM_G_TONE_MAPPING_SHADOW_CONTRAST_END.x * (-1.44269502162933349609375f)), 1.0f)) * RD_UNIFORM_G_TONE_MAPPING_SHADOW_CONTRAST.x)) / scalarValue2;
                productValue1 = exponentialValue4 * multiplyAddValue2;
                productValue2 = exponentialValue4 * multiplyAddValue1;
                productValue3 = exponentialValue4 * multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float dotProductValue2 = dot(float3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
                float quotientValue11 = dotProductValue2 / (dotProductValue2 + 1.0f);
                float exponentialValue8 = (exp2(log2(min(1.0f, exp2(RD_UNIFORM_G_TONE_MAPPING_SHADOW_CONTRAST_END.x * (-1.44269502162933349609375f)) * quotientValue11)) * RD_UNIFORM_G_TONE_MAPPING_SHADOW_CONTRAST.x) * quotientValue11) / dotProductValue2;
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
                if (varyingTexCoord0.x < 0.5f)
                {
#if RD_PLATFORM == RD_PLATFORM_SM40
                    precise float sumValue13 = multiplyAddValue - 0.0040000001899898052215576171875f;
                    precise float sumValue14 = multiplyAddValue1 - 0.0040000001899898052215576171875f;
                    precise float sumValue15 = multiplyAddValue2 - 0.0040000001899898052215576171875f;
                    float scalarValue7 = max(sumValue13, 0.0f);
                    float scalarValue8 = max(sumValue14, 0.0f);
                    float scalarValue9 = max(sumValue15, 0.0f);
                    precise float multiplyAddValue29 = scalarValue7 * mad(scalarValue7, 6.19999980926513671875f, 0.5f);
                    precise float multiplyAddValue30 = scalarValue8 * mad(scalarValue8, 6.19999980926513671875f, 0.5f);
                    precise float multiplyAddValue31 = scalarValue9 * mad(scalarValue9, 6.19999980926513671875f, 0.5f);
                    precise float multiplyAddValue32 = multiplyAddValue29 / mad(scalarValue7, mad(scalarValue7, 6.19999980926513671875f, 1.7000000476837158203125f), 0.0599999986588954925537109375f);
                    precise float multiplyAddValue33 = multiplyAddValue30 / mad(scalarValue8, mad(scalarValue8, 6.19999980926513671875f, 1.7000000476837158203125f), 0.0599999986588954925537109375f);
                    precise float multiplyAddValue34 = multiplyAddValue31 / mad(scalarValue9, mad(scalarValue9, 6.19999980926513671875f, 1.7000000476837158203125f), 0.0599999986588954925537109375f);
                    bool comparisonValue = RD_UNIFORM_G_PERFORM_SRGB_CONVERSION.x != 0.0f;
                    precise float nonlinearValue2 = log2(multiplyAddValue32) * 2.2000000476837158203125f;
                    precise float nonlinearValue3 = log2(multiplyAddValue33) * 2.2000000476837158203125f;
                    precise float nonlinearValue4 = log2(multiplyAddValue34) * 2.2000000476837158203125f;
                    exponentialValue7 = comparisonValue ? exp2(nonlinearValue2) : multiplyAddValue32;
                    exponentialValue6 = comparisonValue ? exp2(nonlinearValue3) : multiplyAddValue33;
                    exponentialValue5 = comparisonValue ? exp2(nonlinearValue4) : multiplyAddValue34;
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    float sumValue = max(multiplyAddValue - 0.0040000001899898052215576171875f, 0.0f);
                    float sumValue1 = max(multiplyAddValue1 - 0.0040000001899898052215576171875f, 0.0f);
                    float sumValue2 = max(multiplyAddValue2 - 0.0040000001899898052215576171875f, 0.0f);
                    float multiplyAddValue7 = (sumValue * mad(sumValue, 6.19999980926513671875f, 0.5f)) / mad(sumValue, mad(sumValue, 6.19999980926513671875f, 1.7000000476837158203125f), 0.0599999986588954925537109375f);
                    float multiplyAddValue8 = (sumValue1 * mad(sumValue1, 6.19999980926513671875f, 0.5f)) / mad(sumValue1, mad(sumValue1, 6.19999980926513671875f, 1.7000000476837158203125f), 0.0599999986588954925537109375f);
                    float multiplyAddValue9 = (sumValue2 * mad(sumValue2, 6.19999980926513671875f, 0.5f)) / mad(sumValue2, mad(sumValue2, 6.19999980926513671875f, 1.7000000476837158203125f), 0.0599999986588954925537109375f);
                    bool comparisonValue = RD_UNIFORM_G_PERFORM_SRGB_CONVERSION.x != 0.0f;
                    exponentialValue3 = comparisonValue ? exp2(log2(multiplyAddValue7) * 2.2000000476837158203125f) : multiplyAddValue7;
                    exponentialValue2 = comparisonValue ? exp2(log2(multiplyAddValue8) * 2.2000000476837158203125f) : multiplyAddValue8;
                    exponentialValue1 = comparisonValue ? exp2(log2(multiplyAddValue9) * 2.2000000476837158203125f) : multiplyAddValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float sumValue4 = max(0.0f, multiplyAddValue24 + (-0.0040000001899898052215576171875f));
                    float sumValue5 = max(0.0f, multiplyAddValue25 + (-0.0040000001899898052215576171875f));
                    float sumValue6 = max(0.0f, multiplyAddValue26 + (-0.0040000001899898052215576171875f));
                    float productValue4 = sumValue4 * 6.19999980926513671875f;
                    float productValue5 = sumValue5 * 6.19999980926513671875f;
                    float productValue8 = sumValue6 * 6.19999980926513671875f;
                    float quotientValue12 = ((productValue4 + 0.5f) * sumValue4) / (((productValue4 + 1.7000000476837158203125f) * sumValue4) + 0.0599999986588954925537109375f);
                    float quotientValue13 = ((productValue5 + 0.5f) * sumValue5) / (((productValue5 + 1.7000000476837158203125f) * sumValue5) + 0.0599999986588954925537109375f);
                    float quotientValue14 = ((productValue8 + 0.5f) * sumValue6) / (((productValue8 + 1.7000000476837158203125f) * sumValue6) + 0.0599999986588954925537109375f);
                    float branchMergedValue10;
                    float branchMergedValue13;
                    float branchMergedValue14;
                    if (RD_UNIFORM_G_PERFORM_SRGB_CONVERSION.x != 0.0f)
                    {
                        branchMergedValue10 = exp2(log2(quotientValue12) * 2.2000000476837158203125f);
                        branchMergedValue13 = exp2(log2(quotientValue13) * 2.2000000476837158203125f);
                        branchMergedValue14 = exp2(log2(quotientValue14) * 2.2000000476837158203125f);
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
                    float scalarValue3 = max(rdDot3Precise(vectorValue, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), -24.0f);
                    precise float nonlinearValue5 = log2(scalarValue3) + 24.0f;
                    precise float productValue20 = nonlinearValue5 * 0.0357142873108386993408203125f;
                    float sampledTextureValue12 = exp2(materialTexture3.SampleLevel(textureSampler3, float2(productValue20, 0.5f), 0.0f).x);
                    precise float productValue21 = multiplyAddValue * sampledTextureValue12;
                    precise float productValue22 = multiplyAddValue1 * sampledTextureValue12;
                    precise float productValue23 = multiplyAddValue2 * sampledTextureValue12;
                    precise float quotientValue24 = productValue21 / scalarValue3;
                    precise float quotientValue25 = productValue22 / scalarValue3;
                    precise float quotientValue26 = productValue23 / scalarValue3;
                    float scalarValue10 = rdDot3Precise(float3(quotientValue24, quotientValue25, quotientValue26), 0.3333333432674407958984375f.xxx);
                    precise float multiplyAddValue35 = mad(scalarValue10, mad(scalarValue10, -1489.699951171875f, 1486.4000244140625f), -3.2999999523162841796875f) / mad(scalarValue10, mad(scalarValue10, 0.1500000059604644775390625f, 944.20001220703125f), 1.0f);
                    precise float sumValue16 = multiplyAddValue35 - 1.0f;
                    float multiplyAddValue36 = mad(RD_UNIFORM_G_TONE_MAPPING_FILMIC_SATURATION_CORRECTION.x, max(sumValue16, 0.0f), 1.0f);
                    precise float sumValue17 = quotientValue24 - scalarValue10;
                    precise float sumValue18 = quotientValue25 - scalarValue10;
                    precise float sumValue19 = quotientValue26 - scalarValue10;
                    exponentialValue7 = mad(multiplyAddValue36, sumValue17, scalarValue10);
                    exponentialValue6 = mad(multiplyAddValue36, sumValue18, scalarValue10);
                    exponentialValue5 = mad(multiplyAddValue36, sumValue19, scalarValue10);
#elif RD_PLATFORM == RD_PLATFORM_SM50
                    float scalarValue3 = max(rdDot3Precise(vectorValue, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), -24.0f);
                    float sampledTextureValue3 = exp2(materialTexture3.SampleLevel(textureSampler3, float2((log2(scalarValue3) + 24.0f) * 0.0357142873108386993408203125f, 0.5f), 0.0f).x);
                    float quotientValue4 = (multiplyAddValue * sampledTextureValue3) / scalarValue3;
                    float quotientValue5 = (multiplyAddValue1 * sampledTextureValue3) / scalarValue3;
                    float quotientValue6 = (multiplyAddValue2 * sampledTextureValue3) / scalarValue3;
                    float scalarValue4 = rdDot3Precise(float3(quotientValue4, quotientValue5, quotientValue6), 0.3333333432674407958984375f.xxx);
                    float multiplyAddValue10 = mad(RD_UNIFORM_G_TONE_MAPPING_FILMIC_SATURATION_CORRECTION.x, max((mad(scalarValue4, mad(scalarValue4, -1489.699951171875f, 1486.4000244140625f), -3.2999999523162841796875f) / mad(scalarValue4, mad(scalarValue4, 0.1500000059604644775390625f, 944.20001220703125f), 1.0f)) - 1.0f, 0.0f), 1.0f);
                    exponentialValue3 = mad(multiplyAddValue10, quotientValue4 - scalarValue4, scalarValue4);
                    exponentialValue2 = mad(multiplyAddValue10, quotientValue5 - scalarValue4, scalarValue4);
                    exponentialValue1 = mad(multiplyAddValue10, quotientValue6 - scalarValue4, scalarValue4);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    float dotProductValue3 = max(dot(float3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), -24.0f);
                    float sampledTextureValue9 = exp2(gToneCurveTexture.SampleLevel(gToneCurveSampler, float2((log2(dotProductValue3) + 24.0f) * 0.0357142873108386993408203125f, 0.5f), 0.0f).x);
                    float quotientValue15 = (sampledTextureValue9 * multiplyAddValue24) / dotProductValue3;
                    float quotientValue16 = (sampledTextureValue9 * multiplyAddValue25) / dotProductValue3;
                    float quotientValue17 = (sampledTextureValue9 * multiplyAddValue26) / dotProductValue3;
                    float dotProductValue4 = dot(float3(quotientValue15, quotientValue16, quotientValue17), 0.3333333432674407958984375f.xxx);
                    float quotientValue18 = (RD_UNIFORM_G_TONE_MAPPING_FILMIC_SATURATION_CORRECTION.x * max(0.0f, ((((1486.4000244140625f - (dotProductValue4 * 1489.699951171875f)) * dotProductValue4) + (-3.2999999523162841796875f)) / ((((dotProductValue4 * 0.1500000059604644775390625f) + 944.20001220703125f) * dotProductValue4) + 1.0f)) + (-1.0f))) + 1.0f;
                    branchMergedValue1 = (quotientValue18 * (quotientValue15 - dotProductValue4)) + dotProductValue4;
                    branchMergedValue5 = (quotientValue18 * (quotientValue16 - dotProductValue4)) + dotProductValue4;
                    branchMergedValue6 = (quotientValue18 * (quotientValue17 - dotProductValue4)) + dotProductValue4;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM40
                intermediateValue19 = exponentialValue5;
                intermediateValue20 = exponentialValue6;
                intermediateValue21 = exponentialValue7;
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
            bool sampledTextureValue4 = mad(-mad(materialTexture3.Sample(textureSampler3, float2(varyingTexCoord0.x, varyingTexCoord0.y)).x, 0.064153559505939483642578125f, 1.0f), 0.5f, 1.0f) < varyingTexCoord0.y;
            precise float sumValue20 = 1.0f - intermediateValue21;
            precise float sumValue21 = 1.0f - intermediateValue20;
            precise float sumValue22 = 1.0f - intermediateValue19;
            multiplyAddValue5 = sampledTextureValue4 ? mad(sumValue20, 0.20000000298023223876953125f, intermediateValue21) : intermediateValue21;
            multiplyAddValue4 = sampledTextureValue4 ? mad(sumValue21, 0.20000000298023223876953125f, intermediateValue20) : intermediateValue20;
            multiplyAddValue3 = sampledTextureValue4 ? mad(sumValue22, 0.20000000298023223876953125f, intermediateValue19) : intermediateValue19;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            bool sampledTextureValue4 = mad(-mad(materialTexture3.Sample(textureSampler3, float2(varyingTexCoord0.x, varyingTexCoord0.y)).x, 0.064153559505939483642578125f, 1.0f), 0.5f, 1.0f) < varyingTexCoord0.y;
            multiplyAddValue5 = sampledTextureValue4 ? mad(1.0f - productValue3, 0.20000000298023223876953125f, productValue3) : productValue3;
            multiplyAddValue4 = sampledTextureValue4 ? mad(1.0f - productValue2, 0.20000000298023223876953125f, productValue2) : productValue2;
            multiplyAddValue3 = sampledTextureValue4 ? mad(1.0f - productValue1, 0.20000000298023223876953125f, productValue1) : productValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue9;
            float branchMergedValue11;
            float branchMergedValue12;
            if (varyingTexCoord0.y > (0.5f - (gToneCurveTexture.Sample(gToneCurveSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y)).x * 0.0320767797529697418212890625f)))
            {
                branchMergedValue9 = ((1.0f - productValue) * 0.20000000298023223876953125f) + productValue;
                branchMergedValue11 = ((1.0f - productValue1) * 0.20000000298023223876953125f) + productValue1;
                branchMergedValue12 = ((1.0f - productValue2) * 0.20000000298023223876953125f) + productValue2;
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
        intermediateValue12 = multiplyAddValue3;
        intermediateValue13 = multiplyAddValue4;
        intermediateValue14 = multiplyAddValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue = branchMergedValue;
        intermediateValue1 = branchMergedValue3;
        intermediateValue2 = branchMergedValue4;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue12 = multiplyAddValue2;
        intermediateValue13 = multiplyAddValue1;
        intermediateValue14 = multiplyAddValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue = multiplyAddValue24;
        intermediateValue1 = multiplyAddValue25;
        intermediateValue2 = multiplyAddValue26;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    bool comparisonValue1 = RD_UNIFORM_G_COLOR_GRADING_ENABLED.x != 0.0f;
    float multiplyAddValue11 = clamp(mad(RD_UNIFORM_G_TONE_MAPPING_CONTRAST.x, mad(intermediateValue14, RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE.x, -0.180000007152557373046875f), 0.180000007152557373046875f), 0.0f, 1.0f);
    float multiplyAddValue12 = clamp(mad(RD_UNIFORM_G_TONE_MAPPING_CONTRAST.x, mad(intermediateValue13, RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE.y, -0.180000007152557373046875f), 0.180000007152557373046875f), 0.0f, 1.0f);
    float multiplyAddValue16 = clamp(mad(RD_UNIFORM_G_TONE_MAPPING_CONTRAST.x, mad(intermediateValue12, RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE.z, -0.180000007152557373046875f), 0.180000007152557373046875f), 0.0f, 1.0f);
    float scalarValue5 = rdDot3Precise(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue16), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
    precise float sumValue23 = multiplyAddValue11 - scalarValue5;
    precise float sumValue24 = multiplyAddValue12 - scalarValue5;
    precise float sumValue25 = multiplyAddValue16 - scalarValue5;
    precise float multiplyAddValue37 = log2(mad(RD_UNIFORM_G_TONE_MAPPING_SATURATION.x, sumValue23, scalarValue5)) * RD_UNIFORM_G_TONE_MAPPING_GAMMA.x;
    precise float multiplyAddValue38 = log2(mad(RD_UNIFORM_G_TONE_MAPPING_SATURATION.x, sumValue24, scalarValue5)) * RD_UNIFORM_G_TONE_MAPPING_GAMMA.x;
    precise float multiplyAddValue39 = log2(mad(RD_UNIFORM_G_TONE_MAPPING_SATURATION.x, sumValue25, scalarValue5)) * RD_UNIFORM_G_TONE_MAPPING_GAMMA.x;
    precise float exponentialValue11 = (comparisonValue1 ? exp2(multiplyAddValue37) : intermediateValue14) - multiplyAddValue;
    precise float exponentialValue12 = (comparisonValue1 ? exp2(multiplyAddValue38) : intermediateValue13) - multiplyAddValue1;
    precise float exponentialValue13 = (comparisonValue1 ? exp2(multiplyAddValue39) : intermediateValue12) - multiplyAddValue2;
    float multiplyAddValue40 = mad(RD_UNIFORM_G_TONE_MAPPING_INTENSITY.x, exponentialValue11, multiplyAddValue);
    float multiplyAddValue41 = mad(RD_UNIFORM_G_TONE_MAPPING_INTENSITY.x, exponentialValue12, multiplyAddValue1);
    float multiplyAddValue42 = mad(RD_UNIFORM_G_TONE_MAPPING_INTENSITY.x, exponentialValue13, multiplyAddValue2);
    float multiplyAddValue17;
    float multiplyAddValue18;
    float multiplyAddValue19;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    bool comparisonValue1 = RD_UNIFORM_G_COLOR_GRADING_ENABLED.x != 0.0f;
    float multiplyAddValue11 = clamp(mad(RD_UNIFORM_G_TONE_MAPPING_CONTRAST.x, mad(intermediateValue14, RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE.x, -0.180000007152557373046875f), 0.180000007152557373046875f), 0.0f, 1.0f);
    float multiplyAddValue12 = clamp(mad(RD_UNIFORM_G_TONE_MAPPING_CONTRAST.x, mad(intermediateValue13, RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE.y, -0.180000007152557373046875f), 0.180000007152557373046875f), 0.0f, 1.0f);
    float multiplyAddValue16 = clamp(mad(RD_UNIFORM_G_TONE_MAPPING_CONTRAST.x, mad(intermediateValue12, RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE.z, -0.180000007152557373046875f), 0.180000007152557373046875f), 0.0f, 1.0f);
    float scalarValue5 = rdDot3Precise(float3(multiplyAddValue11, multiplyAddValue12, multiplyAddValue16), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
    float multiplyAddValue20 = mad(RD_UNIFORM_G_TONE_MAPPING_INTENSITY.x, (comparisonValue1 ? exp2(log2(mad(RD_UNIFORM_G_TONE_MAPPING_SATURATION.x, multiplyAddValue11 - scalarValue5, scalarValue5)) * RD_UNIFORM_G_TONE_MAPPING_GAMMA.x) : intermediateValue14) - multiplyAddValue, multiplyAddValue);
    float multiplyAddValue21 = mad(RD_UNIFORM_G_TONE_MAPPING_INTENSITY.x, (comparisonValue1 ? exp2(log2(mad(RD_UNIFORM_G_TONE_MAPPING_SATURATION.x, multiplyAddValue12 - scalarValue5, scalarValue5)) * RD_UNIFORM_G_TONE_MAPPING_GAMMA.x) : intermediateValue13) - multiplyAddValue1, multiplyAddValue1);
    float multiplyAddValue22 = mad(RD_UNIFORM_G_TONE_MAPPING_INTENSITY.x, (comparisonValue1 ? exp2(log2(mad(RD_UNIFORM_G_TONE_MAPPING_SATURATION.x, multiplyAddValue16 - scalarValue5, scalarValue5)) * RD_UNIFORM_G_TONE_MAPPING_GAMMA.x) : intermediateValue12) - multiplyAddValue2, multiplyAddValue2);
    float multiplyAddValue13;
    float multiplyAddValue14;
    float multiplyAddValue15;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (RD_UNIFORM_G_COLOR_GRADING_ENABLED.x != 0.0f)
    {
        float clampedValue = clamp((((RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE.x * intermediateValue) + (-0.180000007152557373046875f)) * RD_UNIFORM_G_TONE_MAPPING_CONTRAST.x) + 0.180000007152557373046875f, 0.0f, 1.0f);
        float clampedValue1 = clamp((((RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE.y * intermediateValue1) + (-0.180000007152557373046875f)) * RD_UNIFORM_G_TONE_MAPPING_CONTRAST.x) + 0.180000007152557373046875f, 0.0f, 1.0f);
        float clampedValue2 = clamp((((RD_UNIFORM_G_TONE_MAPPING_COLOR_BALANCE.z * intermediateValue2) + (-0.180000007152557373046875f)) * RD_UNIFORM_G_TONE_MAPPING_CONTRAST.x) + 0.180000007152557373046875f, 0.0f, 1.0f);
        float dotProductValue5 = dot(float3(clampedValue, clampedValue1, clampedValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        exponentialValue = exp2(log2(((clampedValue - dotProductValue5) * RD_UNIFORM_G_TONE_MAPPING_SATURATION.x) + dotProductValue5) * RD_UNIFORM_G_TONE_MAPPING_GAMMA.x);
        exponentialValue1 = exp2(log2(((clampedValue1 - dotProductValue5) * RD_UNIFORM_G_TONE_MAPPING_SATURATION.x) + dotProductValue5) * RD_UNIFORM_G_TONE_MAPPING_GAMMA.x);
        exponentialValue2 = exp2(log2(((clampedValue2 - dotProductValue5) * RD_UNIFORM_G_TONE_MAPPING_SATURATION.x) + dotProductValue5) * RD_UNIFORM_G_TONE_MAPPING_GAMMA.x);
    }
    else
    {
        exponentialValue = intermediateValue;
        exponentialValue1 = intermediateValue1;
        exponentialValue2 = intermediateValue2;
    }
    float productValue9 = ((exponentialValue - multiplyAddValue24) * RD_UNIFORM_G_TONE_MAPPING_INTENSITY.x) + multiplyAddValue24;
    float productValue10 = ((exponentialValue1 - multiplyAddValue25) * RD_UNIFORM_G_TONE_MAPPING_INTENSITY.x) + multiplyAddValue25;
    float productValue11 = ((exponentialValue2 - multiplyAddValue26) * RD_UNIFORM_G_TONE_MAPPING_INTENSITY.x) + multiplyAddValue26;
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
#endif
    if (RD_UNIFORM_G_PERFORM_SRGB_CONVERSION.x != 0.0f)
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        precise float productValue24 = multiplyAddValue40 * 12.9200000762939453125f;
        precise float productValue25 = multiplyAddValue41 * 12.9200000762939453125f;
        precise float productValue26 = multiplyAddValue42 * 12.9200000762939453125f;
        precise float nonlinearValue6 = log2(multiplyAddValue40) * 0.4166666567325592041015625f;
        precise float nonlinearValue7 = log2(multiplyAddValue41) * 0.4166666567325592041015625f;
        precise float nonlinearValue8 = log2(multiplyAddValue42) * 0.4166666567325592041015625f;
        multiplyAddValue17 = (multiplyAddValue42 < 0.003130800090730190277099609375f) ? productValue26 : mad(exp2(nonlinearValue8), 1.05499994754791259765625f, -0.054999999701976776123046875f);
        multiplyAddValue18 = (multiplyAddValue41 < 0.003130800090730190277099609375f) ? productValue25 : mad(exp2(nonlinearValue7), 1.05499994754791259765625f, -0.054999999701976776123046875f);
        multiplyAddValue19 = (multiplyAddValue40 < 0.003130800090730190277099609375f) ? productValue24 : mad(exp2(nonlinearValue6), 1.05499994754791259765625f, -0.054999999701976776123046875f);
#elif RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue13 = (multiplyAddValue22 < 0.003130800090730190277099609375f) ? (multiplyAddValue22 * 12.9200000762939453125f) : mad(exp2(log2(multiplyAddValue22) * 0.4166666567325592041015625f), 1.05499994754791259765625f, -0.054999999701976776123046875f);
        multiplyAddValue14 = (multiplyAddValue21 < 0.003130800090730190277099609375f) ? (multiplyAddValue21 * 12.9200000762939453125f) : mad(exp2(log2(multiplyAddValue21) * 0.4166666567325592041015625f), 1.05499994754791259765625f, -0.054999999701976776123046875f);
        multiplyAddValue15 = (multiplyAddValue20 < 0.003130800090730190277099609375f) ? (multiplyAddValue20 * 12.9200000762939453125f) : mad(exp2(log2(multiplyAddValue20) * 0.4166666567325592041015625f), 1.05499994754791259765625f, -0.054999999701976776123046875f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float productValue6;
        if (productValue9 < 0.003130800090730190277099609375f)
        {
            productValue6 = productValue9 * 12.9200000762939453125f;
        }
        else
        {
            productValue6 = (exp2(log2(productValue9) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
        }
        float productValue7;
        if (productValue10 < 0.003130800090730190277099609375f)
        {
            productValue7 = productValue10 * 12.9200000762939453125f;
        }
        else
        {
            productValue7 = (exp2(log2(productValue10) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
        }
        float branchMergedValue2;
        float branchMergedValue7;
        float branchMergedValue8;
        if (productValue11 < 0.003130800090730190277099609375f)
        {
            branchMergedValue2 = productValue6;
            branchMergedValue7 = productValue7;
            branchMergedValue8 = productValue11 * 12.9200000762939453125f;
        }
        else
        {
            branchMergedValue2 = productValue6;
            branchMergedValue7 = productValue7;
            branchMergedValue8 = (exp2(log2(productValue11) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f);
        }
        intermediateValue3 = branchMergedValue2;
        intermediateValue4 = branchMergedValue7;
        intermediateValue5 = branchMergedValue8;
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
        intermediateValue3 = productValue9;
        intermediateValue4 = productValue10;
        intermediateValue5 = productValue11;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue27 = varyingTexCoord0.x * RD_UNIFORM_SCREEN_SIZE.x;
    precise float productValue28 = varyingTexCoord0.y * RD_UNIFORM_SCREEN_SIZE.y;
    uint bitwiseValue7 = uint(abs(productValue28)) + (uint(abs(productValue27)) << 16u);
    uint bitwiseValue8 = ((bitwiseValue7 ^ 61u) ^ (bitwiseValue7 >> 16u)) * 9u;
    uint bitwiseValue9 = (bitwiseValue8 ^ (bitwiseValue8 >> 4u)) * 668265261u;
    float multiplyAddValue43 = mad(-rdUnsignedToFloat(bitwiseValue9 ^ (bitwiseValue9 >> 15u)), 4.656612873077392578125e-10f, 0.5f);
    float4 sampledTextureValue5 = materialTexture2.Sample(textureSampler2, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float sumValue26 = 1.0f - sampledTextureValue5.w;
    fragmentColor0.x = mad(mad(multiplyAddValue43, 0.0039215688593685626983642578125f, multiplyAddValue19), sumValue26, sampledTextureValue5.x);
    fragmentColor0.y = mad(mad(multiplyAddValue43, 0.0039215688593685626983642578125f, multiplyAddValue18), sumValue26, sampledTextureValue5.y);
    fragmentColor0.z = mad(mad(multiplyAddValue43, 0.0039215688593685626983642578125f, multiplyAddValue17), sumValue26, sampledTextureValue5.z);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint bitwiseValue = uint(abs(varyingTexCoord0.y * RD_UNIFORM_SCREEN_SIZE.y)) + (uint(abs(varyingTexCoord0.x * RD_UNIFORM_SCREEN_SIZE.x)) << 16u);
    uint bitwiseValue1 = ((bitwiseValue ^ 61u) ^ (bitwiseValue >> 16u)) * 9u;
    uint bitwiseValue2 = (bitwiseValue1 ^ (bitwiseValue1 >> 4u)) * 668265261u;
    float multiplyAddValue23 = mad(-rdUnsignedToFloat(bitwiseValue2 ^ (bitwiseValue2 >> 15u)), 4.656612873077392578125e-10f, 0.5f);
    float4 sampledTextureValue5 = materialTexture2.Sample(textureSampler2, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float sumValue3 = 1.0f - sampledTextureValue5.w;
    fragmentColor0.x = mad(mad(multiplyAddValue23, 0.0039215688593685626983642578125f, multiplyAddValue15), sumValue3, sampledTextureValue5.x);
    fragmentColor0.y = mad(mad(multiplyAddValue23, 0.0039215688593685626983642578125f, multiplyAddValue14), sumValue3, sampledTextureValue5.y);
    fragmentColor0.z = mad(mad(multiplyAddValue23, 0.0039215688593685626983642578125f, multiplyAddValue13), sumValue3, sampledTextureValue5.z);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint bitwiseValue3 = (uint(abs(RD_UNIFORM_SCREEN_SIZE.x * varyingTexCoord0.x)) << 16u) + uint(abs(RD_UNIFORM_SCREEN_SIZE.y * varyingTexCoord0.y));
    uint bitwiseValue4 = ((bitwiseValue3 ^ 61u) ^ (bitwiseValue3 >> 16u)) * 9u;
    uint bitwiseValue5 = ((bitwiseValue4 >> 4u) ^ bitwiseValue4) * 668265261u;
    float bitwiseValue6 = 0.00196078442968428134918212890625f - (float((bitwiseValue5 >> 15u) ^ bitwiseValue5) * 1.826122803319507603703186759958e-12f);
    float4 sampledTextureValue10 = gRasterizedInputTexture.Sample(gRasterizedInputSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y));
    float sumValue7 = 1.0f - sampledTextureValue10.w;
    fragmentColor0.x = ((bitwiseValue6 + intermediateValue3) * sumValue7) + sampledTextureValue10.x;
    fragmentColor0.y = ((bitwiseValue6 + intermediateValue4) * sumValue7) + sampledTextureValue10.y;
    fragmentColor0.z = ((bitwiseValue6 + intermediateValue5) * sumValue7) + sampledTextureValue10.z;
#endif
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
