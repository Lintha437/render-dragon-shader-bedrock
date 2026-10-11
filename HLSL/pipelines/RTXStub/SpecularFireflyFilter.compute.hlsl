// RTXStub / SpecularFireflyFilter / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 41
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint scalarValue = uint(int(viewCbConstants[78u].x));
    uint scalarValue1 = uint(int(viewCbConstants[78u].y));
    uint sumValue = scalarValue1 + 4294967295u;
    uint intermediateValue4;
    uint intermediateValue5;
    uint intermediateValue6;
    if (asuint(viewCbConstants[91u]).y == 2u)
    {
        intermediateValue4 = 0u;
        intermediateValue5 = scalarValue;
        intermediateValue6 = scalarValue1;
    }
    else
    {
        uint scalarValue2 = uint(viewCbConstants[80u].x);
        bool conditionValue = dispatchThreadId.x < scalarValue2;
        intermediateValue4 = conditionValue ? 0u : scalarValue2;
        intermediateValue5 = conditionValue ? scalarValue2 : uint(viewCbConstants[78u].x);
        intermediateValue6 = uint(viewCbConstants[78u].y);
    }
    uint reinterpretedBits = (asuint(rootConstantsConstants[0u]).x & 255u) + 0u;
    uint bitwiseValue = (localThreadId.y << 4u) + localThreadId.x;
    if (int(bitwiseValue) < int(162u))
    {
        uint quotientValue = uint(int(bitwiseValue) - int(18u) * (int(bitwiseValue) / int(18u)));
        uint quotientValue1 = uint(int(bitwiseValue) / int(18u));
        uint bitwiseValue1 = ((workgroupId.y << 4u) + 4294967295u) + quotientValue1;
        uint bitwiseValue2 = uint(min(int(uint(max(int(((workgroupId.x << 4u) + 4294967295u) + quotientValue), int(0u)))), int(scalarValue + 4294967295u)));
        uint scalarValue3 = uint(min(int(uint(max(int(bitwiseValue1), int(0u)))), int(sumValue)));
        intermediateValue[quotientValue + (quotientValue1 * 18u)] = uint4(inputPlaneIdentifier.Load(int3(uint2(bitwiseValue2, scalarValue3), 0u))).x;
        float4 vectorValue = denoisingOutputs[reinterpretedBits][uint2(bitwiseValue2, scalarValue3)].xxxx;
        intermediateValue1[0u + ((quotientValue + (quotientValue1 * 18u)) * 3u)] = vectorValue.x;
        intermediateValue1[1u + ((quotientValue + (quotientValue1 * 18u)) * 3u)] = vectorValue.y;
        intermediateValue1[2u + ((quotientValue + (quotientValue1 * 18u)) * 3u)] = vectorValue.z;
        uint sumValue1 = quotientValue1 + 9u;
        uint sumValue2 = uint(min(int(bitwiseValue1 + 9u), int(sumValue)));
        intermediateValue[quotientValue + (sumValue1 * 18u)] = uint4(inputPlaneIdentifier.Load(int3(uint2(bitwiseValue2, sumValue2), 0u))).x;
        float4 vectorValue1 = denoisingOutputs[reinterpretedBits][uint2(bitwiseValue2, sumValue2)].xxxx;
        intermediateValue1[0u + ((quotientValue + (sumValue1 * 18u)) * 3u)] = vectorValue1.x;
        intermediateValue1[1u + ((quotientValue + (sumValue1 * 18u)) * 3u)] = vectorValue1.y;
        intermediateValue1[2u + ((quotientValue + (sumValue1 * 18u)) * 3u)] = vectorValue1.z;
    }
    GroupMemoryBarrierWithGroupSync();
    uint sumValue3 = localThreadId.x + 1u;
    uint sumValue4 = localThreadId.y + 1u;
    uint productValue = sumValue3 + (sumValue4 * 18u);
    uint loadedBufferValue = uint(int(mad(inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).x, 0.004999999888241291046142578125f, 0.02500000037252902984619140625f) * 1023.0f));
    float intermediateValue13;
    float intermediateValue15;
    float intermediateValue17;
    float intermediateValue19;
    float scalarValue4 = 0.0f;
    float scalarValue5 = 0.0f;
    float scalarValue6 = 0.0f;
    float scalarValue7 = 0.0f;
    uint scalarValue8 = 4294967295u;
    bool intermediateValue21;
    bool intermediateValue22;
    bool comparisonValue;
    for (;;)
    {
        uint sumValue5 = dispatchThreadId.x + 4294967295u;
        uint sumValue6 = scalarValue8 + dispatchThreadId.y;
        intermediateValue21 = int(sumValue6) > int(4294967295u);
        intermediateValue22 = int(sumValue6) < int(intermediateValue6);
        comparisonValue = ((int(sumValue5) >= int(intermediateValue4)) && intermediateValue21) && ((int(sumValue5) < int(intermediateValue5)) && intermediateValue22);
        float intermediateValue23;
        float intermediateValue24;
        float intermediateValue25;
        float intermediateValue26;
        if (comparisonValue)
        {
            uint sumValue7 = scalarValue8 + sumValue4;
            uint productValue1 = intermediateValue[localThreadId.x + (sumValue7 * 18u)] - intermediateValue[productValue];
            float comparisonValue1 = (int(uint(abs(int(productValue1)))) > int(loadedBufferValue)) ? 0.0f : 1.0f;
            float branchMergedValue4;
            float branchMergedValue7;
            float branchMergedValue8;
            float branchMergedValue9;
            if (comparisonValue1 > 0.0f)
            {
                branchMergedValue4 = comparisonValue1 + scalarValue4;
                branchMergedValue7 = (intermediateValue1[0u + ((localThreadId.x + (sumValue7 * 18u)) * 3u)] * comparisonValue1) + scalarValue5;
                branchMergedValue8 = (intermediateValue1[1u + ((localThreadId.x + (sumValue7 * 18u)) * 3u)] * comparisonValue1) + scalarValue6;
                branchMergedValue9 = (intermediateValue1[2u + ((localThreadId.x + (sumValue7 * 18u)) * 3u)] * comparisonValue1) + scalarValue7;
            }
            else
            {
                branchMergedValue4 = scalarValue4;
                branchMergedValue7 = scalarValue5;
                branchMergedValue8 = scalarValue6;
                branchMergedValue9 = scalarValue7;
            }
            intermediateValue23 = branchMergedValue4;
            intermediateValue24 = branchMergedValue7;
            intermediateValue25 = branchMergedValue8;
            intermediateValue26 = branchMergedValue9;
        }
        else
        {
            intermediateValue23 = scalarValue4;
            intermediateValue24 = scalarValue5;
            intermediateValue25 = scalarValue6;
            intermediateValue26 = scalarValue7;
        }
        float intermediateValue27;
        float intermediateValue28;
        float intermediateValue29;
        float intermediateValue30;
        if (((int(dispatchThreadId.x) < int(intermediateValue5)) && intermediateValue22) && ((scalarValue8 != 0u) && ((int(dispatchThreadId.x) >= int(intermediateValue4)) && intermediateValue21)))
        {
            uint sumValue8 = scalarValue8 + sumValue4;
            uint productValue2 = intermediateValue[sumValue3 + (sumValue8 * 18u)] - intermediateValue[productValue];
            float comparisonValue2 = (int(uint(abs(int(productValue2)))) > int(loadedBufferValue)) ? 0.0f : 1.0f;
            float branchMergedValue5;
            float branchMergedValue10;
            float branchMergedValue11;
            float branchMergedValue12;
            if (comparisonValue2 > 0.0f)
            {
                branchMergedValue5 = comparisonValue2 + intermediateValue23;
                branchMergedValue10 = (intermediateValue1[0u + ((sumValue3 + (sumValue8 * 18u)) * 3u)] * comparisonValue2) + intermediateValue24;
                branchMergedValue11 = (intermediateValue1[1u + ((sumValue3 + (sumValue8 * 18u)) * 3u)] * comparisonValue2) + intermediateValue25;
                branchMergedValue12 = (intermediateValue1[2u + ((sumValue3 + (sumValue8 * 18u)) * 3u)] * comparisonValue2) + intermediateValue26;
            }
            else
            {
                branchMergedValue5 = intermediateValue23;
                branchMergedValue10 = intermediateValue24;
                branchMergedValue11 = intermediateValue25;
                branchMergedValue12 = intermediateValue26;
            }
            intermediateValue27 = branchMergedValue5;
            intermediateValue28 = branchMergedValue10;
            intermediateValue29 = branchMergedValue11;
            intermediateValue30 = branchMergedValue12;
        }
        else
        {
            intermediateValue27 = intermediateValue23;
            intermediateValue28 = intermediateValue24;
            intermediateValue29 = intermediateValue25;
            intermediateValue30 = intermediateValue26;
        }
        uint sumValue9 = dispatchThreadId.x + 1u;
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
        if (((int(sumValue9) >= int(intermediateValue4)) && intermediateValue21) && ((int(sumValue9) < int(intermediateValue5)) && intermediateValue22))
        {
            uint sumValue10 = localThreadId.x + 2u;
            uint sumValue11 = scalarValue8 + sumValue4;
            uint productValue3 = intermediateValue[sumValue10 + (sumValue11 * 18u)] - intermediateValue[productValue];
            float comparisonValue3 = (int(uint(abs(int(productValue3)))) > int(loadedBufferValue)) ? 0.0f : 1.0f;
            float branchMergedValue15;
            float branchMergedValue16;
            float branchMergedValue17;
            float branchMergedValue18;
            if (comparisonValue3 > 0.0f)
            {
                branchMergedValue15 = comparisonValue3 + intermediateValue27;
                branchMergedValue16 = (intermediateValue1[0u + ((sumValue10 + (sumValue11 * 18u)) * 3u)] * comparisonValue3) + intermediateValue28;
                branchMergedValue17 = (intermediateValue1[1u + ((sumValue10 + (sumValue11 * 18u)) * 3u)] * comparisonValue3) + intermediateValue29;
                branchMergedValue18 = (intermediateValue1[2u + ((sumValue10 + (sumValue11 * 18u)) * 3u)] * comparisonValue3) + intermediateValue30;
            }
            else
            {
                branchMergedValue15 = intermediateValue27;
                branchMergedValue16 = intermediateValue28;
                branchMergedValue17 = intermediateValue29;
                branchMergedValue18 = intermediateValue30;
            }
            branchMergedValue = branchMergedValue15;
            branchMergedValue1 = branchMergedValue16;
            branchMergedValue2 = branchMergedValue17;
            branchMergedValue3 = branchMergedValue18;
        }
        else
        {
            branchMergedValue = intermediateValue27;
            branchMergedValue1 = intermediateValue28;
            branchMergedValue2 = intermediateValue29;
            branchMergedValue3 = intermediateValue30;
        }
        intermediateValue13 = branchMergedValue;
        intermediateValue15 = branchMergedValue1;
        intermediateValue17 = branchMergedValue2;
        intermediateValue19 = branchMergedValue3;
        uint sumValue12 = scalarValue8 + 1u;
        if (sumValue12 == 2u)
        {
            break;
        }
        else
        {
            scalarValue4 = intermediateValue13;
            scalarValue5 = intermediateValue15;
            scalarValue6 = intermediateValue17;
            scalarValue7 = intermediateValue19;
            scalarValue8 = sumValue12;
            continue;
        }
    }
    uint productValue4 = 0u + ((sumValue3 + (sumValue4 * 18u)) * 3u);
    uint productValue5 = 1u + ((sumValue3 + (sumValue4 * 18u)) * 3u);
    uint productValue6 = 2u + ((sumValue3 + (sumValue4 * 18u)) * 3u);
    float intermediateValue31;
    float intermediateValue32;
    float intermediateValue33;
    if (intermediateValue13 != 0.0f)
    {
        float quotientValue2 = intermediateValue15 / intermediateValue13;
        float quotientValue3 = intermediateValue17 / intermediateValue13;
        float quotientValue4 = intermediateValue19 / intermediateValue13;
        float dotProductValue = dot(float3(intermediateValue1[productValue4], intermediateValue1[productValue5], intermediateValue1[productValue6]), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        float branchMergedValue6;
        float branchMergedValue13;
        float branchMergedValue14;
        if (dotProductValue != 0.0f)
        {
            uint reinterpretedBits1 = ((asuint(rootConstantsConstants[0u]).x >> 24u) << 1u) + 47u;
            float clampedValue = ((viewCbConstants[reinterpretedBits1].x - viewCbConstants[reinterpretedBits1].y) * clamp((outputBufferHistoryLength[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx.x * 63.75f) + (-0.25f), 0.0f, 1.0f)) + viewCbConstants[reinterpretedBits1].y;
            float dotProductValue1 = dot(float3(quotientValue2, quotientValue3, quotientValue4), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) / dotProductValue;
            float branchMergedValue19;
            float branchMergedValue20;
            float branchMergedValue21;
            if (dotProductValue1 < clampedValue)
            {
                float quotientValue5 = dotProductValue1 / clampedValue;
                branchMergedValue19 = (quotientValue5 * (intermediateValue1[productValue4] - quotientValue2)) + quotientValue2;
                branchMergedValue20 = (quotientValue5 * (intermediateValue1[productValue5] - quotientValue3)) + quotientValue3;
                branchMergedValue21 = (quotientValue5 * (intermediateValue1[productValue6] - quotientValue4)) + quotientValue4;
            }
            else
            {
                branchMergedValue19 = intermediateValue1[productValue4];
                branchMergedValue20 = intermediateValue1[productValue5];
                branchMergedValue21 = intermediateValue1[productValue6];
            }
            branchMergedValue6 = branchMergedValue19;
            branchMergedValue13 = branchMergedValue20;
            branchMergedValue14 = branchMergedValue21;
        }
        else
        {
            branchMergedValue6 = intermediateValue1[productValue4];
            branchMergedValue13 = intermediateValue1[productValue5];
            branchMergedValue14 = intermediateValue1[productValue6];
        }
        intermediateValue31 = branchMergedValue6;
        intermediateValue32 = branchMergedValue13;
        intermediateValue33 = branchMergedValue14;
    }
    else
    {
        intermediateValue31 = intermediateValue1[productValue4];
        intermediateValue32 = intermediateValue1[productValue5];
        intermediateValue33 = intermediateValue1[productValue6];
    }
    float4 vectorValue2 = denoisingOutputs[reinterpretedBits][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
    float scalarValue9 = vectorValue2.w;
    uint reinterpretedBits2 = asuint(intermediateValue31) & 2147483647u;
    uint reinterpretedBits3 = asuint(intermediateValue32) & 2147483647u;
    uint reinterpretedBits4 = asuint(intermediateValue33) & 2147483647u;
    uint reinterpretedBits5 = asuint(scalarValue9) & 2147483647u;
    if (!(((((reinterpretedBits2 > 2139095040u) || (reinterpretedBits3 > 2139095040u)) || (reinterpretedBits4 > 2139095040u)) || (reinterpretedBits5 > 2139095040u)) || ((((reinterpretedBits2 == 2139095040u) || (reinterpretedBits3 == 2139095040u)) || (reinterpretedBits4 == 2139095040u)) || (reinterpretedBits5 == 2139095040u))))
    {
        denoisingOutputs[((asuint(rootConstantsConstants[0u]).x >> 8u) & 255u) + 0u][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue31, intermediateValue32, intermediateValue33, scalarValue9).x;
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    workgroupId = stage_input.workgroupId;
    localThreadId = stage_input.localThreadId;
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
