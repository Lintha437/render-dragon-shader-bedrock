// BilateralGrid / BuildBilateralGrid / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_THREAD_LIMIT
#define RD_OPTION_THREAD_LIMIT RD_THREAD_LIMIT_LIMITED_AT64
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/BilateralGrid/ComputeBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeComputeStage()
{
    if ((dispatchThreadId.x < uint(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_SCENE_RESOLUTION.x)) && (dispatchThreadId.y < uint(RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_SCENE_RESOLUTION.y)))
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float4 loadedBufferValue2 = materialTexture2.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue5 = loadedBufferValue2.x;
        float scalarValue6 = loadedBufferValue2.y;
        float scalarValue7 = loadedBufferValue2.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float4 loadedBufferValue = sceneColorTexture.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue = loadedBufferValue.x;
        float scalarValue1 = loadedBufferValue.y;
        float scalarValue2 = loadedBufferValue.z;
#endif
        float quotientValue;
        float quotientValue1;
        float quotientValue2;
        if (RD_UNIFORM_PRE_EXPOSURE_ENABLED.x > 0.0f)
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float loadedBufferValue3 = (0.180000007152557373046875f / materialTexture1.Load(int3(uint2(0u, 0u), 0u)).x) + 9.9999997473787516355514526367188e-05f;
            quotientValue = scalarValue7 / loadedBufferValue3;
            quotientValue1 = scalarValue6 / loadedBufferValue3;
            quotientValue2 = scalarValue5 / loadedBufferValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float loadedBufferValue1 = (0.180000007152557373046875f / previousFrameAverageLuminanceTexture.Load(int3(uint2(0u, 0u), 0u)).x) + 9.9999997473787516355514526367188e-05f;
            quotientValue = scalarValue / loadedBufferValue1;
            quotientValue1 = scalarValue1 / loadedBufferValue1;
            quotientValue2 = scalarValue2 / loadedBufferValue1;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            quotientValue = scalarValue7;
            quotientValue1 = scalarValue6;
            quotientValue2 = scalarValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            quotientValue = scalarValue;
            quotientValue1 = scalarValue1;
            quotientValue2 = scalarValue2;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float nonlinearValue = (log2(min(max(rdDot3Precise(float3(quotientValue2, quotientValue1, quotientValue), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z), RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w)) - RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x) / (RD_UNIFORM_LUMINANCE_RANGE_PARAMS.y - RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x);
        uint productValue6 = uint(((rdUnsignedToFloat(dispatchThreadId.x) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_SCENE_RESOLUTION.z) * RD_UNIFORM_GRID_DIMENSIONS.x);
        uint productValue7 = uint(min(int(uint(int(RD_UNIFORM_GRID_DIMENSIONS.z)) - 2u), int(uint(max(int(uint(int(nonlinearValue * RD_UNIFORM_GRID_DIMENSIONS.z))), int(0u))))));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float dotProductValue = (log2(min(max(dot(float3(quotientValue, quotientValue1, quotientValue2), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)), RD_UNIFORM_LUMINANCE_RANGE_PARAMS.z), RD_UNIFORM_LUMINANCE_RANGE_PARAMS.w)) - RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x) / (RD_UNIFORM_LUMINANCE_RANGE_PARAMS.y - RD_UNIFORM_LUMINANCE_RANGE_PARAMS.x);
        float productValue = RD_UNIFORM_GRID_DIMENSIONS.z * dotProductValue;
        uint productValue1 = uint((RD_UNIFORM_GRID_DIMENSIONS.x * (float(dispatchThreadId.x) + 0.5f)) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_SCENE_RESOLUTION.z);
        uint productValue2 = uint((RD_UNIFORM_GRID_DIMENSIONS.y * (float(dispatchThreadId.y) + 0.5f)) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_SCENE_RESOLUTION.w);
        uint sumValue = uint(min(int(uint(max(int(uint(int(productValue))), int(0u)))), int(uint(int(RD_UNIFORM_GRID_DIMENSIONS.z)) + 4294967294u)));
#endif
        uint scalarValue3 = uint(RD_UNIFORM_GRID_DIMENSIONS.x);
        uint scalarValue4 = uint(RD_UNIFORM_GRID_DIMENSIONS.y);
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint productValue8 = scalarValue3 * uint(((rdUnsignedToFloat(dispatchThreadId.y) + 0.5f) * RD_UNIFORM_SCENE_RESOLUTION_AND_RECIP_SCENE_RESOLUTION.w) * RD_UNIFORM_GRID_DIMENSIONS.y);
        uint productValue9 = productValue6 + (((scalarValue3 * productValue7) * scalarValue4) + productValue8);
        uint productValue10 = (productValue8 + ((scalarValue3 * (productValue7 + 1u)) * scalarValue4)) + productValue6;
        float multiplyAddValue = clamp(mad(RD_UNIFORM_GRID_DIMENSIONS.z, nonlinearValue, -rdUnsignedToFloat(productValue7)), 0.0f, 1.0f);
        float sumValue3 = 1.0f - multiplyAddValue;
        uint intermediateValue11;
        InterlockedAdd(rdAccess_intermediateValue2(productValue9 * 2u), uint(sumValue3 * 256.0f), intermediateValue11);
        uint intermediateValue12;
        InterlockedAdd(rdAccess_intermediateValue2((productValue9 * 2u) + 1u), uint((nonlinearValue * sumValue3) * 256.0f), intermediateValue12);
        uint intermediateValue13;
        InterlockedAdd(rdAccess_intermediateValue2(productValue10 * 2u), uint(multiplyAddValue * 256.0f), intermediateValue13);
        uint intermediateValue14;
        InterlockedAdd(rdAccess_intermediateValue2((productValue10 * 2u) + 1u), uint((nonlinearValue * multiplyAddValue) * 256.0f), intermediateValue14);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint productValue3 = ((productValue2 + (sumValue * scalarValue4)) * scalarValue3) + productValue1;
        uint productValue4 = ((((sumValue + 1u) * scalarValue4) + productValue2) * scalarValue3) + productValue1;
        float sumValue1 = min(max(productValue - float(sumValue), 0.0f), 1.0f);
        float sumValue2 = 1.0f - sumValue1;
        uint intermediateValue5;
        InterlockedAdd(rdAccess_bilateralGrid(productValue3 * 2u), uint(sumValue2 * 256.0f), intermediateValue5);
        float productValue5 = dotProductValue * 256.0f;
        uint intermediateValue6;
        InterlockedAdd(rdAccess_bilateralGrid((productValue3 * 2u) + 1u), uint(sumValue2 * productValue5), intermediateValue6);
        uint intermediateValue7;
        InterlockedAdd(rdAccess_bilateralGrid(productValue4 * 2u), uint(sumValue1 * 256.0f), intermediateValue7);
        uint intermediateValue8;
        InterlockedAdd(rdAccess_bilateralGrid((productValue4 * 2u) + 1u), uint(sumValue1 * productValue5), intermediateValue8);
#endif
    }
}
#if RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_LIMITED_AT64
[numthreads(8, 8, 1)]
#elif RD_OPTION_THREAD_LIMIT == RD_THREAD_LIMIT_NATIVE
[numthreads(16, 16, 1)]
#endif
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
