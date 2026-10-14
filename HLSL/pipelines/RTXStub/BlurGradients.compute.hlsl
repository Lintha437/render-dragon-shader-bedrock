// RTXStub / BlurGradients / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 14
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint scalarValue = reinterpretedBits.x;
    uint bitwiseValue = (scalarValue >> 24u) & 1u;
    uint scalarValue1 = uint(int(viewCbConstants[78u].x));
    uint reinterpretedBits1 = (asuint(viewCbConstants[91u]).y != 2u) ? uint(int(scalarValue1) / int(2u)) : scalarValue1;
    bool comparisonValue = bitwiseValue != 0u;
    uint comparisonValue1 = comparisonValue ? dispatchThreadId.y : dispatchThreadId.x;
    uint comparisonValue2 = comparisonValue ? dispatchThreadId.x : dispatchThreadId.y;
    uint bitwiseValue1 = -(bitwiseValue ^ 1u);
    uint scalarValue2 = -bitwiseValue;
    uint bitwiseValue2 = comparisonValue1 - (bitwiseValue1 & 5u);
    uint bitwiseValue3 = comparisonValue2 - (scalarValue2 & 5u);
    uint bitwiseValue4 = scalarValue & 255u;
    float intermediateValue7;
    float intermediateValue8;
    uint comparisonValue3;
    if (int(bitwiseValue2 | bitwiseValue3) > int(4294967295u))
    {
        float4 vectorValue = outputAdaptiveDenoiserGradients[bitwiseValue4][uint2(bitwiseValue2, bitwiseValue3)].xxxx;
        uint4 loadedBufferValue = uint4(inputAdaptiveDenoiserPlaneIdentifier.Load(int3(uint2(bitwiseValue2, bitwiseValue3), 0u)));
        uint scalarValue3 = loadedBufferValue.x;
        intermediateValue7 = vectorValue.x;
        intermediateValue8 = vectorValue.y;
        comparisonValue3 = ((int(comparisonValue ? bitwiseValue3 : bitwiseValue2) >= int(reinterpretedBits1)) && (scalarValue3 != 0u)) ? (scalarValue3 ^ 2147483648u) : scalarValue3;
    }
    else
    {
        intermediateValue7 = 0.0f;
        intermediateValue8 = 0.0f;
        comparisonValue3 = 0u;
    }
    intermediateValue1[0u + (localThreadId.x * 2u)] = intermediateValue7;
    intermediateValue1[1u + (localThreadId.x * 2u)] = intermediateValue8;
    intermediateValue[localThreadId.x] = comparisonValue3;
    if (int(localThreadId.x) < int(10u))
    {
        uint bitwiseValue5 = comparisonValue1 + (bitwiseValue1 & 123u);
        uint bitwiseValue6 = comparisonValue2 + (scalarValue2 & 123u);
        float intermediateValue11;
        float intermediateValue12;
        uint comparisonValue4;
        if ((int(bitwiseValue5) < int(uint(int(scalarValue1) / int(4u)))) && (int(bitwiseValue6) < int(uint(int(uint(int(viewCbConstants[78u].y))) / int(4u)))))
        {
            float4 vectorValue1 = outputAdaptiveDenoiserGradients[bitwiseValue4][uint2(bitwiseValue5, bitwiseValue6)].xxxx;
            uint4 loadedBufferValue1 = uint4(inputAdaptiveDenoiserPlaneIdentifier.Load(int3(uint2(bitwiseValue5, bitwiseValue6), 0u)));
            uint scalarValue4 = loadedBufferValue1.x;
            intermediateValue11 = vectorValue1.x;
            intermediateValue12 = vectorValue1.y;
            comparisonValue4 = ((int(comparisonValue ? bitwiseValue6 : bitwiseValue5) >= int(reinterpretedBits1)) && (scalarValue4 != 0u)) ? (scalarValue4 ^ 2147483648u) : scalarValue4;
        }
        else
        {
            intermediateValue11 = 0.0f;
            intermediateValue12 = 0.0f;
            comparisonValue4 = 0u;
        }
        uint sumValue = localThreadId.x + 128u;
        intermediateValue1[0u + (sumValue * 2u)] = intermediateValue11;
        intermediateValue1[1u + (sumValue * 2u)] = intermediateValue12;
        intermediateValue[sumValue] = comparisonValue4;
    }
    GroupMemoryBarrierWithGroupSync();
    uint reinterpretedBits2 = (asuint(rootConstantsConstants[0u]).x >> 8u) & 255u;
    uint sumValue1 = localThreadId.x + 5u;
    if (intermediateValue[sumValue1] == 0u)
    {
        outputAdaptiveDenoiserGradients[reinterpretedBits2][uint2(comparisonValue1, comparisonValue2)] = 0.0f.x;
    }
    else
    {
        float intermediateValue13;
        float productValue;
        float productValue2;
        uint intermediateValue14;
        intermediateValue13 = 1.0f;
        productValue = intermediateValue1[0u + (sumValue1 * 2u)];
        productValue2 = intermediateValue1[1u + (sumValue1 * 2u)];
        intermediateValue14 = 0u;
        float sumValue2;
        float productValue1;
        float productValue3;
        for (;;)
        {
            uint sumValue3 = intermediateValue14 + 1u;
            uint sumValue4 = sumValue3 + sumValue1;
            uint sumValue5 = intermediateValue[sumValue4] - intermediateValue[sumValue1];
            float multiplyAddValue = clamp(mad(float(int(intermediateValue14)), -0.3333333432674407958984375f, 1.66666662693023681640625f), 0.0f, 1.0f);
            float productValue4 = float(int(uint(abs(int(sumValue5)))) < int(100u)) * multiplyAddValue;
            uint sumValue6 = (sumValue1 - intermediateValue14) + 4294967295u;
            uint sumValue7 = intermediateValue[sumValue6] - intermediateValue[sumValue1];
            float productValue5 = float(int(uint(abs(int(sumValue7)))) < int(100u)) * multiplyAddValue;
            productValue1 = ((intermediateValue1[0u + (sumValue4 * 2u)] * productValue4) + productValue) + (productValue5 * intermediateValue1[0u + (sumValue6 * 2u)]);
            productValue3 = ((intermediateValue1[1u + (sumValue4 * 2u)] * productValue4) + productValue2) + (productValue5 * intermediateValue1[1u + (sumValue6 * 2u)]);
            sumValue2 = (productValue4 + intermediateValue13) + productValue5;
            if (sumValue3 == 5u)
            {
                break;
            }
            else
            {
                intermediateValue13 = sumValue2;
                productValue = productValue1;
                productValue2 = productValue3;
                intermediateValue14 = sumValue3;
            }
        }
        float quotientValue = productValue1 / sumValue2;
        outputAdaptiveDenoiserGradients[reinterpretedBits2][uint2(comparisonValue1, comparisonValue2)] = float4(quotientValue, productValue3 / sumValue2, quotientValue, quotientValue).x;
    }
}
[numthreads(128, 1, 1)]
void main(ComputeStageInput stage_input)
{
    localThreadId = stage_input.localThreadId;
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
