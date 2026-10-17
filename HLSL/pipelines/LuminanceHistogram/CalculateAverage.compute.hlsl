// LuminanceHistogram / CalculateAverage / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT128
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/LuminanceHistogram/ComputeBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float intermediateValue5;
    intermediateValue5 = 0.0f;
    float multiplyAddValue;
    uint sumValue;
    uint scalarValue1 = 1u;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue;
    uint intermediateValue1;
    intermediateValue = 0.0f;
    intermediateValue1 = 1u;
    float productValue;
#endif
    for (;;)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (scalarValue1 >= 256u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue = (float(rdAccess_curFrameLuminanceHistogram(intermediateValue1).xxxx.x) * 0.00390625f) + intermediateValue;
        uint sumValue3 = intermediateValue1 + 1u;
        if (sumValue3 == 256u)
#endif
        {
            break;
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue = mad(rdUnsignedToFloat(rdAccess_intermediateValue2(scalarValue1).xxxx.x), 0.00390625f, intermediateValue5);
        sumValue = scalarValue1 + 1u;
        intermediateValue5 = multiplyAddValue;
        scalarValue1 = sumValue;
        continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        else
        {
            intermediateValue = productValue;
            intermediateValue1 = sumValue3;
        }
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float productValue5 = intermediateValue5 * RD_UNIFORM_QUANTILE_BOUNDS.x;
    float productValue6 = intermediateValue5 * RD_UNIFORM_QUANTILE_BOUNDS.y;
    float intermediateValue7;
    float intermediateValue8;
    intermediateValue7 = 0.0f;
    intermediateValue8 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue1 = RD_UNIFORM_QUANTILE_BOUNDS.x * productValue;
    float productValue2 = RD_UNIFORM_QUANTILE_BOUNDS.y * productValue;
    float intermediateValue2;
    float intermediateValue3;
    float intermediateValue4;
    uint intermediateValue5;
    intermediateValue2 = 0.0f;
    intermediateValue3 = 0.0f;
    intermediateValue4 = 0.0f;
    intermediateValue5 = 1u;
    float productValue3;
#endif
    float sumValue1;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue1;
    float multiplyAddValue2;
    uint sumValue2;
    float scalarValue2 = 0.0f;
    uint scalarValue3 = 1u;
#endif
    for (;;)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (scalarValue3 >= 256u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float scalarValue = max(intermediateValue3, productValue1);
        float productValue4 = (float(rdAccess_curFrameLuminanceHistogram(intermediateValue5).xxxx.x) * 0.00390625f) + intermediateValue3;
        float sumValue4 = max(min(productValue4, productValue2), scalarValue) - scalarValue;
        productValue3 = (sumValue4 * float(intermediateValue5)) + intermediateValue2;
        sumValue1 = sumValue4 + intermediateValue4;
        uint sumValue5 = intermediateValue5 + 1u;
        if (sumValue5 == 256u)
#endif
        {
            break;
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float scalarValue4 = max(productValue5, scalarValue2);
        multiplyAddValue2 = mad(rdUnsignedToFloat(rdAccess_intermediateValue2(scalarValue3).xxxx.x), 0.00390625f, scalarValue2);
        float sumValue6 = max(scalarValue4, min(productValue6, multiplyAddValue2)) - scalarValue4;
        multiplyAddValue1 = mad(sumValue6, rdUnsignedToFloat(scalarValue3), intermediateValue8);
        sumValue1 = sumValue6 + intermediateValue7;
        sumValue2 = scalarValue3 + 1u;
        intermediateValue7 = sumValue1;
        intermediateValue8 = multiplyAddValue1;
        scalarValue2 = multiplyAddValue2;
        scalarValue3 = sumValue2;
        continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        else
        {
            intermediateValue2 = productValue3;
            intermediateValue3 = productValue4;
            intermediateValue4 = sumValue1;
            intermediateValue5 = sumValue5;
        }
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue3 = mad(((intermediateValue8 / max(intermediateValue7, 1.0f)) - 1.0f) * RD_UNIFORM_LOG_LUMINANCE_RANGE.x, 0.00393700785934925079345703125f, RD_UNIFORM_MIN_LOG_LUMINANCE.x);
    float sampledTextureValue1 = min(RD_UNIFORM_LOG_LUMINANCE_RANGE.x + RD_UNIFORM_MIN_LOG_LUMINANCE.x, max(log2(max(materialTexture1.SampleLevel(textureSampler1, 0.5f.xx, 0.0f).x, 0.00095000001601874828338623046875f)), RD_UNIFORM_MIN_LOG_LUMINANCE.x));
    intermediateValue1[uint2(0u, 0u)] = exp2((RD_UNIFORM_ADAPTATION.x > 0.5f) ? mad(multiplyAddValue3 - sampledTextureValue1, 1.0f - exp2((((sampledTextureValue1 < multiplyAddValue3) ? RD_UNIFORM_ADAPTIVE_PARAMETERS.y : RD_UNIFORM_ADAPTIVE_PARAMETERS.z) * (RD_UNIFORM_ADAPTIVE_PARAMETERS.x * (-RD_UNIFORM_ADAPTATION.y))) * 1.44269502162933349609375f), sampledTextureValue1) : multiplyAddValue3).xxxx;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float quotientValue = ((((productValue3 / max(sumValue1, 1.0f)) + (-1.0f)) * 0.00393700785934925079345703125f) * RD_UNIFORM_LOG_LUMINANCE_RANGE.x) + RD_UNIFORM_MIN_LOG_LUMINANCE.x;
    float exponentialValue;
    if (RD_UNIFORM_ADAPTATION.x > 0.5f)
    {
        float sampledTextureValue = min(max(log2(max(previousFrameAverageLuminanceTexture.SampleLevel(previousFrameAverageLuminanceSampler, 0.5f.xx, 0.0f).x, 0.00095000001601874828338623046875f)), RD_UNIFORM_MIN_LOG_LUMINANCE.x), RD_UNIFORM_MIN_LOG_LUMINANCE.x + RD_UNIFORM_LOG_LUMINANCE_RANGE.x);
        exponentialValue = ((1.0f - exp2(((RD_UNIFORM_ADAPTATION.y * (-1.44269502162933349609375f)) * RD_UNIFORM_ADAPTIVE_PARAMETERS.x) * ((quotientValue > sampledTextureValue) ? RD_UNIFORM_ADAPTIVE_PARAMETERS.y : RD_UNIFORM_ADAPTIVE_PARAMETERS.z))) * (quotientValue - sampledTextureValue)) + sampledTextureValue;
    }
    else
    {
        exponentialValue = quotientValue;
    }
    adaptedFrameAverageLuminanceTexture[uint2(0u, 0u)] = exp2(exponentialValue).xxxx;
#endif
}
[numthreads(1, 1, 1)]
void main()
{
    executeComputeStage();
}
