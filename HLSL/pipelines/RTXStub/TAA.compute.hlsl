// RTXStub / TAA / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 21
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    float sumValue = float(int(dispatchThreadId.x)) + 0.5f;
    float sumValue1 = float(int(dispatchThreadId.y)) + 0.5f;
    float productValue = ((viewCbConstants[87u].y * sumValue) - viewCbConstants[81u].z) + (-0.5f);
    float productValue1 = ((sumValue1 * viewCbConstants[87u].y) - viewCbConstants[81u].w) + (-0.5f);
    uint scalarValue = uint(int(round(productValue)));
    uint scalarValue1 = uint(int(round(productValue1)));
    float4 loadedBufferValue = inputFinalColour.Load(int3(uint2(scalarValue, scalarValue1), 0u));
    float scalarValue2 = loadedBufferValue.x;
    float scalarValue3 = loadedBufferValue.y;
    float scalarValue4 = loadedBufferValue.z;
    float4 loadedBufferValue1 = inputBufferMotionVectors.Load(int3(uint2(scalarValue, scalarValue1), 0u));
    float scalarValue5 = loadedBufferValue1.x;
    float scalarValue6 = loadedBufferValue1.y;
    float productValue2 = scalarValue2 * scalarValue2;
    float productValue3 = scalarValue3 * scalarValue3;
    float productValue4 = scalarValue4 * scalarValue4;
    float intermediateValue8;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue14;
    float intermediateValue16;
    float intermediateValue18;
    float intermediateValue20;
    float intermediateValue22;
    float intermediateValue24;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
    float intermediateValue29;
    float intermediateValue30;
    float intermediateValue31;
    uint intermediateValue32;
    float scalarValue7 = scalarValue5;
    float scalarValue8 = scalarValue6;
    float scalarValue9 = scalarValue2;
    float scalarValue10 = scalarValue3;
    float scalarValue11 = scalarValue4;
    float scalarValue12 = productValue2;
    float scalarValue13 = productValue3;
    float scalarValue14 = productValue4;
    uint scalarValue15 = 4294967295u;
    for (;;)
    {
        intermediateValue24 = scalarValue7;
        intermediateValue25 = scalarValue8;
        intermediateValue26 = scalarValue9;
        intermediateValue27 = scalarValue10;
        intermediateValue28 = scalarValue11;
        intermediateValue29 = scalarValue12;
        intermediateValue30 = scalarValue13;
        intermediateValue31 = scalarValue14;
        intermediateValue32 = 4294967295u;
        bool comparisonValue;
        for (;;)
        {
            comparisonValue = (intermediateValue32 | scalarValue15) == 0u;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            float branchMergedValue3;
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            if (comparisonValue)
            {
                branchMergedValue = intermediateValue24;
                branchMergedValue1 = intermediateValue25;
                branchMergedValue2 = intermediateValue26;
                branchMergedValue3 = intermediateValue27;
                branchMergedValue4 = intermediateValue28;
                branchMergedValue5 = intermediateValue29;
                branchMergedValue6 = intermediateValue30;
                branchMergedValue7 = intermediateValue31;
            }
            else
            {
                uint sumValue2 = scalarValue15 + scalarValue;
                uint sumValue3 = intermediateValue32 + scalarValue1;
                float4 loadedBufferValue2 = inputFinalColour.Load(int3(uint2(sumValue2, sumValue3), 0u));
                float scalarValue16 = loadedBufferValue2.x;
                float scalarValue17 = loadedBufferValue2.y;
                float scalarValue18 = loadedBufferValue2.z;
                float4 loadedBufferValue3 = inputBufferMotionVectors.Load(int3(uint2(sumValue2, sumValue3), 0u));
                float scalarValue19 = loadedBufferValue3.x;
                float sumValue4 = scalarValue16 + intermediateValue26;
                float sumValue5 = scalarValue17 + intermediateValue27;
                float sumValue6 = scalarValue18 + intermediateValue28;
                float productValue5 = (scalarValue16 * scalarValue16) + intermediateValue29;
                float productValue6 = (scalarValue17 * scalarValue17) + intermediateValue30;
                float productValue7 = (scalarValue18 * scalarValue18) + intermediateValue31;
                float branchMergedValue8;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                float branchMergedValue12;
                float branchMergedValue13;
                float branchMergedValue14;
                float branchMergedValue15;
                if (dot(float2(scalarValue19, loadedBufferValue3.y), float2(scalarValue19, loadedBufferValue3.y)) > dot(float2(intermediateValue24, intermediateValue25), float2(intermediateValue24, intermediateValue25)))
                {
                    branchMergedValue8 = scalarValue19;
                    branchMergedValue9 = loadedBufferValue3.y;
                    branchMergedValue10 = sumValue4;
                    branchMergedValue11 = sumValue5;
                    branchMergedValue12 = sumValue6;
                    branchMergedValue13 = productValue5;
                    branchMergedValue14 = productValue6;
                    branchMergedValue15 = productValue7;
                }
                else
                {
                    branchMergedValue8 = intermediateValue24;
                    branchMergedValue9 = intermediateValue25;
                    branchMergedValue10 = sumValue4;
                    branchMergedValue11 = sumValue5;
                    branchMergedValue12 = sumValue6;
                    branchMergedValue13 = productValue5;
                    branchMergedValue14 = productValue6;
                    branchMergedValue15 = productValue7;
                }
                branchMergedValue = branchMergedValue8;
                branchMergedValue1 = branchMergedValue9;
                branchMergedValue2 = branchMergedValue10;
                branchMergedValue3 = branchMergedValue11;
                branchMergedValue4 = branchMergedValue12;
                branchMergedValue5 = branchMergedValue13;
                branchMergedValue6 = branchMergedValue14;
                branchMergedValue7 = branchMergedValue15;
            }
            intermediateValue8 = branchMergedValue;
            intermediateValue10 = branchMergedValue1;
            intermediateValue12 = branchMergedValue2;
            intermediateValue14 = branchMergedValue3;
            intermediateValue16 = branchMergedValue4;
            intermediateValue18 = branchMergedValue5;
            intermediateValue20 = branchMergedValue6;
            intermediateValue22 = branchMergedValue7;
            uint sumValue7 = intermediateValue32 + 1u;
            if (sumValue7 == 2u)
            {
                break;
            }
            else
            {
                intermediateValue24 = intermediateValue8;
                intermediateValue25 = intermediateValue10;
                intermediateValue26 = intermediateValue12;
                intermediateValue27 = intermediateValue14;
                intermediateValue28 = intermediateValue16;
                intermediateValue29 = intermediateValue18;
                intermediateValue30 = intermediateValue20;
                intermediateValue31 = intermediateValue22;
                intermediateValue32 = sumValue7;
                continue;
            }
        }
        uint sumValue8 = scalarValue15 + 1u;
        if (sumValue8 == 2u)
        {
            break;
        }
        else
        {
            scalarValue7 = intermediateValue8;
            scalarValue8 = intermediateValue10;
            scalarValue9 = intermediateValue12;
            scalarValue10 = intermediateValue14;
            scalarValue11 = intermediateValue16;
            scalarValue12 = intermediateValue18;
            scalarValue13 = intermediateValue20;
            scalarValue14 = intermediateValue22;
            scalarValue15 = sumValue8;
            continue;
        }
    }
    float productValue8 = viewCbConstants[78u].x * intermediateValue8;
    float productValue9 = viewCbConstants[78u].y * intermediateValue10;
    float productValue10 = intermediateValue12 * 0.111111111938953399658203125f;
    float productValue11 = intermediateValue14 * 0.111111111938953399658203125f;
    float productValue12 = intermediateValue16 * 0.111111111938953399658203125f;
    float clampedValue = clamp(sqrt(dot(float2(productValue8, productValue9), float2(productValue8, productValue9))), 0.0f, 1.0f);
    float productValue13 = (clampedValue * clampedValue) * (3.0f - (clampedValue * 2.0f));
    float productValue14 = 4.0f - (productValue13 * 3.0f);
    float nonlinearValue = productValue14 * sqrt(max(0.0f, (intermediateValue18 * 0.111111111938953399658203125f) - (productValue10 * productValue10)));
    float nonlinearValue1 = productValue14 * sqrt(max(0.0f, (intermediateValue20 * 0.111111111938953399658203125f) - (productValue11 * productValue11)));
    float nonlinearValue2 = productValue14 * sqrt(max(0.0f, (intermediateValue22 * 0.111111111938953399658203125f) - (productValue12 * productValue12)));
    float productValue15 = min(max((productValue8 * viewCbConstants[87u].z) + sumValue, 0.0f), viewCbConstants[79u].x + (-1.0f));
    float productValue16 = min(max((productValue9 * viewCbConstants[87u].z) + sumValue1, 0.0f), viewCbConstants[79u].y + (-1.0f));
    float sumValue9 = floor(productValue15 + (-0.5f));
    float sumValue10 = floor(productValue16 + (-0.5f));
    float sumValue11 = sumValue9 + 0.5f;
    float sumValue12 = sumValue10 + 0.5f;
    float clampedValue1 = clamp(productValue15 - sumValue11, 0.0f, 1.0f);
    float clampedValue2 = clamp(productValue16 - sumValue12, 0.0f, 1.0f);
    float productValue17 = clampedValue1 * clampedValue1;
    float productValue18 = clampedValue2 * clampedValue2;
    float productValue19 = productValue17 * clampedValue1;
    float productValue20 = productValue18 * clampedValue2;
    float productValue21 = productValue17 - ((productValue19 + clampedValue1) * 0.5f);
    float productValue22 = productValue18 - ((productValue20 + clampedValue2) * 0.5f);
    float productValue23 = (clampedValue1 * 0.5f) * (productValue17 - clampedValue1);
    float productValue24 = (clampedValue2 * 0.5f) * (productValue18 - clampedValue2);
    float sumValue13 = (1.0f - productValue23) - productValue21;
    float sumValue14 = (1.0f - productValue24) - productValue22;
    float productValue25 = (sumValue9 + (-0.5f)) * viewCbConstants[79u].z;
    float productValue26 = (sumValue10 + (-0.5f)) * viewCbConstants[79u].w;
    float quotientValue = ((((((productValue17 * 2.5f) + (-1.0f)) - (productValue19 * 1.5f)) + sumValue13) / sumValue13) + sumValue11) * viewCbConstants[79u].z;
    float quotientValue1 = ((((((productValue18 * 2.5f) + (-1.0f)) - (productValue20 * 1.5f)) + sumValue14) / sumValue14) + sumValue12) * viewCbConstants[79u].w;
    float productValue27 = (sumValue9 + 2.5f) * viewCbConstants[79u].z;
    float productValue28 = (sumValue10 + 2.5f) * viewCbConstants[79u].w;
    float4 sampledTextureValue = inputTAAHistory.SampleLevel(linearSampler, float2(productValue25, productValue26), 0.0f);
    float productValue29 = productValue22 * productValue21;
    float4 sampledTextureValue1 = inputTAAHistory.SampleLevel(linearSampler, float2(productValue25, quotientValue1), 0.0f);
    float productValue30 = sumValue14 * productValue21;
    float4 sampledTextureValue2 = inputTAAHistory.SampleLevel(linearSampler, float2(productValue25, productValue28), 0.0f);
    float productValue31 = productValue21 * productValue24;
    float4 sampledTextureValue3 = inputTAAHistory.SampleLevel(linearSampler, float2(quotientValue, productValue26), 0.0f);
    float productValue32 = sumValue13 * productValue22;
    float4 sampledTextureValue4 = inputTAAHistory.SampleLevel(linearSampler, float2(quotientValue, quotientValue1), 0.0f);
    float productValue33 = sumValue14 * sumValue13;
    float4 sampledTextureValue5 = inputTAAHistory.SampleLevel(linearSampler, float2(quotientValue, productValue28), 0.0f);
    float productValue34 = sumValue13 * productValue24;
    float4 sampledTextureValue6 = inputTAAHistory.SampleLevel(linearSampler, float2(productValue27, productValue26), 0.0f);
    float productValue35 = productValue22 * productValue23;
    float4 sampledTextureValue7 = inputTAAHistory.SampleLevel(linearSampler, float2(productValue27, quotientValue1), 0.0f);
    float productValue36 = sumValue14 * productValue23;
    float4 sampledTextureValue8 = inputTAAHistory.SampleLevel(linearSampler, float2(productValue27, productValue28), 0.0f);
    float productValue37 = productValue24 * productValue23;
    float productValue38 = min(nonlinearValue + productValue10, max(productValue10 - nonlinearValue, max(0.0f, ((((((((sampledTextureValue1.x * productValue30) + (sampledTextureValue.x * productValue29)) + (sampledTextureValue2.x * productValue31)) + (sampledTextureValue3.x * productValue32)) + (sampledTextureValue4.x * productValue33)) + (sampledTextureValue5.x * productValue34)) + (sampledTextureValue6.x * productValue35)) + (sampledTextureValue7.x * productValue36)) + (sampledTextureValue8.x * productValue37))));
    float productValue39 = min(nonlinearValue1 + productValue11, max(productValue11 - nonlinearValue1, max(0.0f, ((((((((sampledTextureValue1.y * productValue30) + (sampledTextureValue.y * productValue29)) + (sampledTextureValue2.y * productValue31)) + (sampledTextureValue3.y * productValue32)) + (sampledTextureValue4.y * productValue33)) + (sampledTextureValue5.y * productValue34)) + (sampledTextureValue6.y * productValue35)) + (sampledTextureValue7.y * productValue36)) + (sampledTextureValue8.y * productValue37))));
    float productValue40 = min(nonlinearValue2 + productValue12, max(productValue12 - nonlinearValue2, max(0.0f, ((((((((sampledTextureValue1.z * productValue30) + (sampledTextureValue.z * productValue29)) + (sampledTextureValue2.z * productValue31)) + (sampledTextureValue3.z * productValue32)) + (sampledTextureValue4.z * productValue33)) + (sampledTextureValue5.z * productValue34)) + (sampledTextureValue6.z * productValue35)) + (sampledTextureValue7.z * productValue36)) + (sampledTextureValue8.z * productValue37))));
    float sumValue15;
    float sumValue16;
    if ((loadedBufferValue.w != 0.0f) && (asuint(viewCbConstants[91u]).y == 0u))
    {
        sumValue15 = (productValue + viewCbConstants[81u].z) - viewCbConstants[82u].x;
        sumValue16 = (productValue1 + viewCbConstants[81u].w) - viewCbConstants[82u].y;
    }
    else
    {
        sumValue15 = productValue;
        sumValue16 = productValue1;
    }
    float sumValue17 = sumValue15 - float(int(scalarValue));
    float sumValue18 = sumValue16 - float(int(scalarValue1));
    float dotProductValue = max(productValue13, min(max(1.0f - (dot(float2(sumValue17, sumValue18), float2(sumValue17, sumValue18)) * viewCbConstants[87u].z), 0.0500000007450580596923828125f), 1.0f)) * 0.100000001490116119384765625f;
    outputBufferTAAHistory[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4((dotProductValue * (scalarValue2 - productValue38)) + productValue38, (dotProductValue * (scalarValue3 - productValue39)) + productValue39, (dotProductValue * (scalarValue4 - productValue40)) + productValue40, 0.0f);
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
