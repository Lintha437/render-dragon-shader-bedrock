// VolumeScattering / Scattering / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_4 1
#endif

#include "../../include/materials/VolumeScattering/ComputeBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint scalarValue = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
#endif
    if (!((int(dispatchThreadId.x) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.x)))) || (int(dispatchThreadId.y) >= int(uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.y))))))
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint scalarValue = uint(int(RD_UNIFORM_VOLUME_DIMENSIONS.z));
        float exponentialValue3 = exp2(((-0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.z) * 5.770780086517333984375f);
        float multiplyAddValue = mad(mad(1.0f - exponentialValue3, 0.0186573602259159088134765625f, 1.0f), RD_UNIFORM_VOLUME_NEAR_FAR.x, ((exponentialValue3 - 1.0f) * 0.0186573602259159088134765625f) * RD_UNIFORM_VOLUME_NEAR_FAR.y);
        float multiplyAddValue1;
        float multiplyAddValue2;
        float multiplyAddValue3;
        float productValue;
        float multiplyAddValue4;
        uint sumValue;
        float scalarValue2 = 0.0f;
        float scalarValue3 = 0.0f;
        float scalarValue4 = 0.0f;
        float scalarValue5 = 1.0f;
        float scalarValue6 = multiplyAddValue;
        uint scalarValue7 = 0u;
        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float exponentialValue = (exp2((-2.8853900432586669921875f) / RD_UNIFORM_VOLUME_DIMENSIONS.z) + (-1.0f)) * 0.0186573602259159088134765625f;
        if (int(scalarValue) > int(0u))
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            if (int(scalarValue) <= int(scalarValue7))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue;
            float intermediateValue1;
            float intermediateValue2;
            float intermediateValue3;
            float intermediateValue4;
            uint intermediateValue5;
            productValue = (RD_UNIFORM_VOLUME_NEAR_FAR.x * (1.0f - exponentialValue)) + (RD_UNIFORM_VOLUME_NEAR_FAR.y * exponentialValue);
            intermediateValue1 = 0.0f;
            intermediateValue2 = 0.0f;
            intermediateValue3 = 0.0f;
            intermediateValue4 = 1.0f;
            intermediateValue5 = 0u;
            for (;;)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float exponentialValue1 = (exp2(((float(int(intermediateValue5)) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.z) * 5.770780086517333984375f) + (-1.0f)) * 0.0186573602259159088134765625f;
                float productValue1 = ((1.0f - exponentialValue1) * RD_UNIFORM_VOLUME_NEAR_FAR.x) + (RD_UNIFORM_VOLUME_NEAR_FAR.y * exponentialValue1);
                float sumValue1 = productValue1 - productValue;
                float4 loadedBufferValue = scatteringBufferInTexture.Load(int4(uint3(dispatchThreadId.x, dispatchThreadId.y, intermediateValue5), 0u));
                float scalarValue1 = loadedBufferValue.w;
                float exponentialValue2 = exp2((scalarValue1 * (-1.44269502162933349609375f)) * sumValue1);
                float comparisonValue = ((abs(scalarValue1) > 9.9999999747524270787835121154785e-07f) ? ((1.0f - exponentialValue2) / scalarValue1) : sumValue1) * intermediateValue4;
                float productValue2 = (comparisonValue * loadedBufferValue.x) + intermediateValue1;
                float productValue3 = (comparisonValue * loadedBufferValue.y) + intermediateValue2;
                float productValue4 = (comparisonValue * loadedBufferValue.z) + intermediateValue3;
                float productValue5 = exponentialValue2 * intermediateValue4;
                scatteringBufferOutTexture[uint3(dispatchThreadId.x, dispatchThreadId.y, intermediateValue5)] = float4(productValue2, productValue3, productValue4, productValue5);
                uint sumValue2 = intermediateValue5 + 1u;
                if (sumValue2 == scalarValue)
                {
                    break;
                }
                else
                {
                    productValue = productValue1;
                    intermediateValue1 = productValue2;
                    intermediateValue2 = productValue3;
                    intermediateValue3 = productValue4;
                    intermediateValue4 = productValue5;
                    intermediateValue5 = sumValue2;
                }
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float exponentialValue4 = exp2(((rdSignedBitsToFloat(scalarValue7) + 0.5f) / RD_UNIFORM_VOLUME_DIMENSIONS.z) * 5.770780086517333984375f);
            multiplyAddValue4 = mad(mad(1.0f - exponentialValue4, 0.0186573602259159088134765625f, 1.0f), RD_UNIFORM_VOLUME_NEAR_FAR.x, ((exponentialValue4 - 1.0f) * 0.0186573602259159088134765625f) * RD_UNIFORM_VOLUME_NEAR_FAR.y);
            float sumValue3 = multiplyAddValue4 - scalarValue6;
            float4 loadedBufferValue1 = materialTexture0.Load(int4(uint3(dispatchThreadId.x, dispatchThreadId.y, scalarValue7), 0u));
            float scalarValue8 = loadedBufferValue1.w;
            float exponentialValue5 = exp2((sumValue3 * (-scalarValue8)) * 1.44269502162933349609375f);
            float comparisonValue1 = scalarValue5 * ((abs(scalarValue8) > 9.9999999747524270787835121154785e-07f) ? ((1.0f - exponentialValue5) / scalarValue8) : sumValue3);
            multiplyAddValue3 = mad(comparisonValue1, loadedBufferValue1.x, scalarValue4);
            multiplyAddValue2 = mad(comparisonValue1, loadedBufferValue1.y, scalarValue3);
            multiplyAddValue1 = mad(comparisonValue1, loadedBufferValue1.z, scalarValue2);
            productValue = scalarValue5 * exponentialValue5;
            intermediateValue1[uint3(dispatchThreadId.x, dispatchThreadId.y, scalarValue7)] = float4(multiplyAddValue3, multiplyAddValue2, multiplyAddValue1, productValue);
            sumValue = scalarValue7 + 1u;
            scalarValue2 = multiplyAddValue1;
            scalarValue3 = multiplyAddValue2;
            scalarValue4 = multiplyAddValue3;
            scalarValue5 = productValue;
            scalarValue6 = multiplyAddValue4;
            scalarValue7 = sumValue;
            continue;
#endif
        }
    }
}
[numthreads(8, 8, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
