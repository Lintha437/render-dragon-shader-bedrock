// RTXStub / BlurGIInscatter / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 12
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint scalarValue = reinterpretedBits.x;
    uint reinterpretedBits1 = 1u - asuint(rootConstantsConstants[0u]).x;
    uint4 reinterpretedBits2 = asuint(rootConstantsConstants[0u]);
    uint scalarValue1 = reinterpretedBits2.x;
    uint sumValue = 1u - scalarValue1;
    float4 vectorValue = volumetricGIInscatterRW[reinterpretedBits1][uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)].xxxx;
    float scalarValue2 = vectorValue.w;
    float multiplyAddValue = clamp(mad(scalarValue2, 0.3333333432674407958984375f, -0.3333333432674407958984375f), 0.0f, 1.0f) + 0.001000000047497451305389404296875f;
    float productValue = multiplyAddValue * vectorValue.x;
    float productValue1 = multiplyAddValue * vectorValue.y;
    float productValue2 = multiplyAddValue * vectorValue.z;
    float productValue3 = multiplyAddValue * scalarValue2;
    uint multiplyAddValue1 = uint(int(clamp(mad(productValue3, -0.008333333767950534820556640625f, 0.833333313465118408203125f), 0.0f, 1.0f) * 5.0f));
    float intermediateValue4;
    float intermediateValue6;
    float intermediateValue8;
    float intermediateValue10;
    float intermediateValue12;
    if (int(multiplyAddValue1 + 2u) > int(1u))
    {
        float intermediateValue5;
        float intermediateValue7;
        float intermediateValue9;
        float intermediateValue11;
        float intermediateValue13;
        float scalarValue3 = productValue;
        float scalarValue4 = productValue1;
        float scalarValue5 = productValue2;
        float scalarValue6 = productValue3;
        float scalarValue7 = multiplyAddValue;
        uint scalarValue8 = 1u;
        uint productValue4;
        uint productValue5;
        uint intermediateValue20;
        uint intermediateValue21;
        bool bitwiseValue;
        for (;;)
        {
            productValue4 = (scalarValue1 * scalarValue8) + dispatchThreadId.x;
            productValue5 = (sumValue * scalarValue8) + dispatchThreadId.y;
            intermediateValue20 = uint(viewCbConstants[56u].x);
            intermediateValue21 = uint(viewCbConstants[56u].y);
            bitwiseValue = (productValue4 < intermediateValue20) && (productValue5 < intermediateValue21);
            float productValue6;
            float productValue7;
            float productValue8;
            float productValue9;
            float sumValue1;
            if (bitwiseValue)
            {
                float4 vectorValue1 = volumetricGIInscatterRW[reinterpretedBits1][uint3(productValue4, productValue5, dispatchThreadId.z)].xxxx;
                float scalarValue9 = vectorValue1.w;
                float multiplyAddValue2 = clamp(mad(scalarValue9, 0.3333333432674407958984375f, -0.3333333432674407958984375f), 0.0f, 1.0f) + 0.001000000047497451305389404296875f;
                productValue6 = (multiplyAddValue2 * vectorValue1.x) + scalarValue3;
                productValue7 = (multiplyAddValue2 * vectorValue1.y) + scalarValue4;
                productValue8 = (multiplyAddValue2 * vectorValue1.z) + scalarValue5;
                productValue9 = (multiplyAddValue2 * scalarValue9) + scalarValue6;
                sumValue1 = multiplyAddValue2 + scalarValue7;
            }
            else
            {
                productValue6 = scalarValue3;
                productValue7 = scalarValue4;
                productValue8 = scalarValue5;
                productValue9 = scalarValue6;
                sumValue1 = scalarValue7;
            }
            uint scalarValue10 = -scalarValue8;
            uint productValue10 = (scalarValue1 * scalarValue10) + dispatchThreadId.x;
            uint productValue11 = (sumValue * scalarValue10) + dispatchThreadId.y;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            float branchMergedValue3;
            float branchMergedValue4;
            if ((productValue10 < intermediateValue20) && (productValue11 < intermediateValue21))
            {
                float4 vectorValue2 = volumetricGIInscatterRW[reinterpretedBits1][uint3(productValue10, productValue11, dispatchThreadId.z)].xxxx;
                float scalarValue11 = vectorValue2.w;
                float multiplyAddValue3 = clamp(mad(scalarValue11, 0.3333333432674407958984375f, -0.3333333432674407958984375f), 0.0f, 1.0f) + 0.001000000047497451305389404296875f;
                branchMergedValue = (multiplyAddValue3 * vectorValue2.x) + productValue6;
                branchMergedValue1 = (multiplyAddValue3 * vectorValue2.y) + productValue7;
                branchMergedValue2 = (multiplyAddValue3 * vectorValue2.z) + productValue8;
                branchMergedValue3 = (multiplyAddValue3 * scalarValue11) + productValue9;
                branchMergedValue4 = multiplyAddValue3 + sumValue1;
            }
            else
            {
                branchMergedValue = productValue6;
                branchMergedValue1 = productValue7;
                branchMergedValue2 = productValue8;
                branchMergedValue3 = productValue9;
                branchMergedValue4 = sumValue1;
            }
            intermediateValue5 = branchMergedValue;
            intermediateValue7 = branchMergedValue1;
            intermediateValue9 = branchMergedValue2;
            intermediateValue11 = branchMergedValue3;
            intermediateValue13 = branchMergedValue4;
            if (int(scalarValue8) < int(multiplyAddValue1 + 1u))
            {
                scalarValue3 = intermediateValue5;
                scalarValue4 = intermediateValue7;
                scalarValue5 = intermediateValue9;
                scalarValue6 = intermediateValue11;
                scalarValue7 = intermediateValue13;
                scalarValue8++;
                continue;
            }
            else
            {
                break;
            }
        }
        intermediateValue4 = intermediateValue5;
        intermediateValue6 = intermediateValue7;
        intermediateValue8 = intermediateValue9;
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = intermediateValue13;
    }
    else
    {
        intermediateValue4 = productValue;
        intermediateValue6 = productValue1;
        intermediateValue8 = productValue2;
        intermediateValue10 = productValue3;
        intermediateValue12 = multiplyAddValue;
    }
    float quotientValue;
    float quotientValue1;
    float quotientValue2;
    float quotientValue3;
    if (intermediateValue12 > 0.0f)
    {
        quotientValue = intermediateValue4 / intermediateValue12;
        quotientValue1 = intermediateValue6 / intermediateValue12;
        quotientValue2 = intermediateValue8 / intermediateValue12;
        quotientValue3 = intermediateValue10 / intermediateValue12;
    }
    else
    {
        quotientValue = 0.0f;
        quotientValue1 = 0.0f;
        quotientValue2 = 0.0f;
        quotientValue3 = 0.0f;
    }
    volumetricGIInscatterRW[scalarValue][uint3(dispatchThreadId.x, dispatchThreadId.y, dispatchThreadId.z)] = float4(quotientValue, quotientValue1, quotientValue2, quotientValue3).x;
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
