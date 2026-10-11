// LuminanceHistogram / BuildHistogram / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT128
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_4 1
#endif

#include "../../include/materials/LuminanceHistogram/ComputeBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeComputeStage()
{
#if (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM50)
    uint sumValue;
    uint scalarValue3 = 0u;
    for (;;)
    {
        if (scalarValue3 >= 2u)
        {
            break;
        }
        intermediateValue5[localThreadIndex + (scalarValue3 * 128u)] = 0u;
        sumValue = scalarValue3 + 1u;
        scalarValue3 = sumValue;
        continue;
    }
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    intermediateValue5[localThreadIndex] = 0u;
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM65)
    rdAccess_intermediateValue(localThreadIndex) = 0u;
    uint sumValue1 = localThreadIndex + 128u;
    rdAccess_intermediateValue(sumValue1) = 0u;
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    rdAccess_intermediateValue(localThreadIndex) = 0u;
#endif
    GroupMemoryBarrierWithGroupSync();
    if ((dispatchThreadId.x < uint(RD_UNIFORM_SCREEN_SIZE.x)) && (dispatchThreadId.y < uint(RD_UNIFORM_SCREEN_SIZE.y)))
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float quotientValue5 = (rdSignedBitsToFloat(dispatchThreadId.x) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.z;
        float quotientValue6 = (rdSignedBitsToFloat(dispatchThreadId.y) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.w;
        float4 sampledTextureValue2 = materialTexture0.SampleLevel(textureSampler0, float2(quotientValue5, quotientValue6), 0.0f);
        float scalarValue4 = sampledTextureValue2.x;
        float scalarValue5 = sampledTextureValue2.y;
        float scalarValue6 = sampledTextureValue2.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float quotientValue = (float(int(dispatchThreadId.x)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.z;
        float quotientValue1 = (float(int(dispatchThreadId.y)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.w;
        float4 sampledTextureValue = gameColorTexture.SampleLevel(gameColorSampler, float2(quotientValue, quotientValue1), 0.0f);
        float scalarValue = sampledTextureValue.x;
        float scalarValue1 = sampledTextureValue.y;
        float scalarValue2 = sampledTextureValue.z;
#endif
        float quotientValue2;
        float quotientValue3;
        float quotientValue4;
        if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float sampledTextureValue3 = (0.180000007152557373046875f / materialTexture1.SampleLevel(textureSampler1, 0.5f.xx, 0.0f).x) + 9.9999997473787516355514526367188e-05f;
            quotientValue2 = scalarValue6 / sampledTextureValue3;
            quotientValue3 = scalarValue5 / sampledTextureValue3;
            quotientValue4 = scalarValue4 / sampledTextureValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float sampledTextureValue1 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.SampleLevel(previousFrameAverageLuminanceSampler, 0.5f.xx, 0.0f).x) + 9.9999997473787516355514526367188e-05f;
            quotientValue2 = scalarValue / sampledTextureValue1;
            quotientValue3 = scalarValue1 / sampledTextureValue1;
            quotientValue4 = scalarValue2 / sampledTextureValue1;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            quotientValue2 = scalarValue6;
            quotientValue3 = scalarValue5;
            quotientValue4 = scalarValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            quotientValue2 = scalarValue;
            quotientValue3 = scalarValue1;
            quotientValue4 = scalarValue2;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float scalarValue7 = rdDot3Precise(float3(quotientValue4, quotientValue3, quotientValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        float2 sumValue5 = float2(quotientValue5 - 0.5f, quotientValue6 - 0.5f);
        uint intermediateValue16;
        InterlockedAdd(intermediateValue5[(scalarValue7 >= 0.00095000001601874828338623046875f) ? uint(mad(clamp((log2(scalarValue7) - RD_UNIFORM_MIN_LOG_LUMINANCE.x) / RD_UNIFORM_LOG_LUMINANCE_RANGE.x, 0.0f, 1.0f), 254.0f, 1.0f)) : 0u], uint(exp2((rdDot2Precise(sumValue5, sumValue5) * (-RD_UNIFORM_CENTER_WEIGHT.x)) * 1.44269502162933349609375f) * 256.0f), intermediateValue16);
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM65)
        float dotProductValue = dot(float3(quotientValue2, quotientValue3, quotientValue4), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        uint intermediateValue6;
        if (dotProductValue < 0.00095000001601874828338623046875f)
        {
            intermediateValue6 = 0u;
        }
        else
        {
            intermediateValue6 = uint((min(max((log2(dotProductValue) - RD_UNIFORM_MIN_LOG_LUMINANCE.x) / RD_UNIFORM_LOG_LUMINANCE_RANGE.x, 0.0f), 1.0f) * 254.0f) + 1.0f);
        }
        float sumValue3 = quotientValue + (-0.5f);
        float sumValue4 = quotientValue1 + (-0.5f);
        uint intermediateValue7;
        InterlockedAdd(rdAccess_intermediateValue(intermediateValue6), uint(exp2((dot(float2(sumValue3, sumValue4), float2(sumValue3, sumValue4)) * (-1.44269502162933349609375f)) * RD_UNIFORM_CENTER_WEIGHT.x) * 256.0f), intermediateValue7);
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM65)
        float dotProductValue = dot(float3(quotientValue2, quotientValue3, quotientValue4), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        uint intermediateValue5;
        if (dotProductValue < 0.00095000001601874828338623046875f)
        {
            intermediateValue5 = 0u;
        }
        else
        {
            intermediateValue5 = uint((min(max((log2(dotProductValue) - RD_UNIFORM_MIN_LOG_LUMINANCE.x) / RD_UNIFORM_LOG_LUMINANCE_RANGE.x, 0.0f), 1.0f) * 254.0f) + 1.0f);
        }
        float sumValue3 = quotientValue + (-0.5f);
        float sumValue4 = quotientValue1 + (-0.5f);
        uint intermediateValue6;
        InterlockedAdd(rdAccess_intermediateValue(intermediateValue5), uint(exp2((dot(float2(sumValue3, sumValue4), float2(sumValue3, sumValue4)) * (-1.44269502162933349609375f)) * RD_UNIFORM_CENTER_WEIGHT.x) * 256.0f), intermediateValue6);
#endif
    }
    GroupMemoryBarrierWithGroupSync();
#if (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM50)
    uint sumValue2;
    uint scalarValue8 = 0u;
    for (;;)
    {
        if (scalarValue8 >= 2u)
        {
            break;
        }
        uint productValue = localThreadIndex + (scalarValue8 * 128u);
        uint intermediateValue18;
        InterlockedAdd(rdAccess_intermediateValue2(productValue), intermediateValue5[productValue], intermediateValue18);
        sumValue2 = scalarValue8 + 1u;
        scalarValue8 = sumValue2;
        continue;
    }
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    uint intermediateValue14;
    InterlockedAdd(rdAccess_intermediateValue2(localThreadIndex), intermediateValue5[localThreadIndex], intermediateValue14);
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128 && RD_PLATFORM == RD_PLATFORM_SM65)
    uint intermediateValue4;
    InterlockedAdd(rdAccess_curFrameLuminanceHistogram(localThreadIndex), rdAccess_intermediateValue(localThreadIndex), intermediateValue4);
    uint intermediateValue5;
    InterlockedAdd(rdAccess_curFrameLuminanceHistogram(localThreadIndex + 128u), rdAccess_intermediateValue(sumValue1), intermediateValue5);
#elif (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    uint intermediateValue4;
    InterlockedAdd(rdAccess_curFrameLuminanceHistogram(localThreadIndex), rdAccess_intermediateValue(localThreadIndex), intermediateValue4);
#endif
}
#if RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT128
[numthreads(16, 8, 1)]
#elif RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE
[numthreads(16, 16, 1)]
#endif
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    localThreadIndex = stage_input.localThreadIndex;
    executeComputeStage();
}
