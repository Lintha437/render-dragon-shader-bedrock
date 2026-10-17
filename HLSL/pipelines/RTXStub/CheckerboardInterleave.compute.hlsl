// RTXStub / CheckerboardInterleave / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 20
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(viewCbConstants[91u]);
    uint scalarValue = reinterpretedBits.y;
    uint intermediateValue1;
    uint intermediateValue2;
    if (scalarValue == 2u)
    {
        intermediateValue1 = dispatchThreadId.x;
        intermediateValue2 = 0u;
    }
    else
    {
        uint bitwiseValue = dispatchThreadId.x >> 1u;
        uint scalarValue1 = uint(int(viewCbConstants[80u].x));
        uint branchMergedValue;
        uint branchMergedValue3;
        if (((dispatchThreadId.y ^ dispatchThreadId.x) & 1u) == (uint((scalarValue == 0u) && ((asuint(viewCbConstants[84u]).z & 1u) != 0u)) ^ 1u))
        {
            branchMergedValue = bitwiseValue;
            branchMergedValue3 = scalarValue1;
        }
        else
        {
            branchMergedValue = scalarValue1 + bitwiseValue;
            branchMergedValue3 = -scalarValue1;
        }
        intermediateValue1 = branchMergedValue;
        intermediateValue2 = branchMergedValue3;
    }
    float scalarValue2 = float(int(dispatchThreadId.y));
    if ((float(int(dispatchThreadId.x)) >= viewCbConstants[78u].x) || (scalarValue2 >= viewCbConstants[78u].y))
    {
        outputBufferFinal[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
        outputBufferReprojectedPathLength[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
        outputBufferMotionVectors[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
    }
    else
    {
        float4 loadedBufferValue = inputBufferPrimaryPathLength.Load(int3(uint2(intermediateValue1, dispatchThreadId.y), 0u));
        float scalarValue3 = loadedBufferValue.x;
        float4 loadedBufferValue1 = inputBufferReflectionMotionVectors.Load(int3(uint2(intermediateValue1, dispatchThreadId.y), 0u));
        float scalarValue4 = loadedBufferValue1.x;
        float scalarValue5 = loadedBufferValue1.y;
        float4 loadedBufferValue2 = inputBufferPreInterleaveCurrent.Load(int3(uint2(intermediateValue1, dispatchThreadId.y), 0u));
        float scalarValue6 = loadedBufferValue2.x;
        float scalarValue7 = loadedBufferValue2.y;
        float scalarValue8 = loadedBufferValue2.z;
        float scalarValue9 = loadedBufferValue2.w;
        float comparisonValue4;
        float comparisonValue5;
        float comparisonValue6;
        float productValue;
        float productValue1;
        float productValue2;
        float comparisonValue7;
        if (scalarValue9 != 0.0f)
        {
            uint sumValue = intermediateValue2 + intermediateValue1;
            float4 loadedBufferValue3 = inputBufferPreInterleaveCurrent.Load(int3(uint2(sumValue, dispatchThreadId.y + 1u), 0u));
            float4 loadedBufferValue4 = inputBufferPreInterleaveCurrent.Load(int3(uint2(sumValue, dispatchThreadId.y + 4294967295u), 0u));
            float4 loadedBufferValue5 = inputBufferPreInterleaveCurrent.Load(int3(uint2(sumValue, dispatchThreadId.y), 0u));
            float4 loadedBufferValue6 = inputBufferPreInterleaveCurrent.Load(int3(uint2((((dispatchThreadId.x << 1u) & 2u) + 4294967295u) + sumValue, dispatchThreadId.y), 0u));
            bool comparisonValue = (dispatchThreadId.x == 0u) || (dispatchThreadId.x == (uint(int(viewCbConstants[78u].x)) + 4294967295u));
            float comparisonValue1 = (((loadedBufferValue4.x + loadedBufferValue3.x) + (comparisonValue ? 0.0f : loadedBufferValue5.x)) + (comparisonValue ? 0.0f : loadedBufferValue6.x)) * 0.25f;
            float comparisonValue2 = (((loadedBufferValue4.y + loadedBufferValue3.y) + (comparisonValue ? 0.0f : loadedBufferValue5.y)) + (comparisonValue ? 0.0f : loadedBufferValue6.y)) * 0.25f;
            float comparisonValue3 = (((loadedBufferValue4.z + loadedBufferValue3.z) + (comparisonValue ? 0.0f : loadedBufferValue5.z)) + (comparisonValue ? 0.0f : loadedBufferValue6.z)) * 0.25f;
            float4 loadedBufferValue7 = inputBufferPrimaryPathLength.Load(int3(uint2(sumValue, dispatchThreadId.y), 0u));
            float scalarValue10 = loadedBufferValue7.x;
            float4 loadedBufferValue8 = inputBufferReflectionMotionVectors.Load(int3(uint2(sumValue, dispatchThreadId.y), 0u));
            float scalarValue11 = loadedBufferValue8.x;
            float scalarValue12 = loadedBufferValue8.y;
            float intermediateValue18;
            float intermediateValue19;
            float intermediateValue20;
            uint intermediateValue21;
            if (scalarValue == 0u)
            {
                float scalarValue13 = viewCbConstants[80u].x * scalarValue11;
                float productValue3 = viewCbConstants[80u].y * scalarValue12;
                float sumValue1 = (float(int(sumValue)) + 0.5f) + scalarValue13;
                float sumValue2 = (scalarValue2 + 0.5f) + productValue3;
                uint scalarValue14 = uint(viewCbConstants[80u].x);
                bool conditionValue = sumValue < scalarValue14;
                float branchMergedValue1;
                float branchMergedValue4;
                float branchMergedValue5;
                uint branchMergedValue6;
                if ((((sumValue2 > 0.0f) && (sumValue1 > (conditionValue ? 0.0f : float(int(scalarValue14))))) && (dot(float2(scalarValue13, productValue3), float2(scalarValue13, productValue3)) < 2.0f)) && ((sumValue1 < float(int((conditionValue ? scalarValue14 : uint(viewCbConstants[78u].x)) + 4294967295u))) && (sumValue2 < float(int(uint(viewCbConstants[78u].y) + 4294967295u)))))
                {
                    float4 loadedBufferValue9 = inputBufferPreInterleavePrevious.Load(int3(uint2(uint(min(max(float(uint(viewCbConstants[88u].x * float(uint(floor(sumValue1))))), 0.0f), viewCbConstants[78u].x * viewCbConstants[88u].x)), uint(min(max(float(uint(float(uint(floor(sumValue2))) * viewCbConstants[88u].x)), 0.0f), viewCbConstants[78u].y * viewCbConstants[88u].x))), 0u));
                    branchMergedValue1 = loadedBufferValue9.x;
                    branchMergedValue4 = loadedBufferValue9.y;
                    branchMergedValue5 = loadedBufferValue9.z;
                    branchMergedValue6 = uint(scalarValue3 < scalarValue10);
                }
                else
                {
                    branchMergedValue1 = comparisonValue1;
                    branchMergedValue4 = comparisonValue2;
                    branchMergedValue5 = comparisonValue3;
                    branchMergedValue6 = 0u;
                }
                intermediateValue18 = branchMergedValue1;
                intermediateValue19 = branchMergedValue4;
                intermediateValue20 = branchMergedValue5;
                intermediateValue21 = branchMergedValue6;
            }
            else
            {
                intermediateValue18 = comparisonValue1;
                intermediateValue19 = comparisonValue2;
                intermediateValue20 = comparisonValue3;
                intermediateValue21 = 0u;
            }
            float4 loadedBufferValue10 = inputBufferIncomingIrradianceCache.Load(int3(uint2(intermediateValue1, dispatchThreadId.y), 0u));
            float scalarValue15 = loadedBufferValue10.w;
            float loadedBufferValue11;
            if (scalarValue15 < 0.0f)
            {
                loadedBufferValue11 = 1.0f - inputBufferIncomingIrradianceCache.Load(int3(uint2(sumValue, dispatchThreadId.y), 0u)).w;
            }
            else
            {
                loadedBufferValue11 = scalarValue15;
            }
            uint bitwiseValue1 = uint(scalarValue9) >> 8u;
            uint intermediateValue26;
            if (bitwiseValue1 == 3u)
            {
                intermediateValue26 = uint(dot(float2(scalarValue11, scalarValue12), float2(scalarValue11, scalarValue12)) > dot(float2(scalarValue4, scalarValue5), float2(scalarValue4, scalarValue5)));
            }
            else
            {
                uint branchMergedValue2;
                if (bitwiseValue1 == 0u)
                {
                    branchMergedValue2 = uint(dot(float3(intermediateValue18, intermediateValue19, intermediateValue20), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) > dot(float3(scalarValue6, scalarValue7, scalarValue8), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)));
                }
                else
                {
                    branchMergedValue2 = uint(bitwiseValue1 != ((int(intermediateValue2) > int(0u)) ? 1u : 2u));
                }
                intermediateValue26 = branchMergedValue2;
            }
            bool comparisonValue8 = intermediateValue26 != 0u;
            comparisonValue4 = comparisonValue8 ? scalarValue10 : scalarValue3;
            comparisonValue5 = comparisonValue8 ? scalarValue11 : scalarValue4;
            comparisonValue6 = comparisonValue8 ? scalarValue12 : scalarValue5;
            productValue = (loadedBufferValue11 * (intermediateValue18 - scalarValue6)) + scalarValue6;
            productValue1 = (loadedBufferValue11 * (intermediateValue19 - scalarValue7)) + scalarValue7;
            productValue2 = (loadedBufferValue11 * (intermediateValue20 - scalarValue8)) + scalarValue8;
            comparisonValue7 = float(intermediateValue21 != 0u);
        }
        else
        {
            comparisonValue4 = scalarValue3;
            comparisonValue5 = scalarValue4;
            comparisonValue6 = scalarValue5;
            productValue = scalarValue6;
            productValue1 = scalarValue7;
            productValue2 = scalarValue8;
            comparisonValue7 = 0.0f;
        }
        float intermediateValue23;
        float intermediateValue24;
        float intermediateValue25;
        if (asuint(viewCbConstants[95u]).w == 0u)
        {
            intermediateValue23 = productValue;
            intermediateValue24 = productValue1;
            intermediateValue25 = productValue2;
        }
        else
        {
            float exponentialValue = exp2(log2(max(productValue * 9.9999997473787516355514526367188e-05f, 0.0f)) * 0.1593017578125f);
            float exponentialValue1 = exp2(log2(max(productValue1 * 9.9999997473787516355514526367188e-05f, 0.0f)) * 0.1593017578125f);
            float exponentialValue2 = exp2(log2(max(productValue2 * 9.9999997473787516355514526367188e-05f, 0.0f)) * 0.1593017578125f);
            intermediateValue23 = clamp(exp2(log2(((exponentialValue * 18.8515625f) + 0.8359375f) / ((exponentialValue * 18.6875f) + 1.0f)) * 78.84375f), 0.0f, 1.0f);
            intermediateValue24 = clamp(exp2(log2(((exponentialValue1 * 18.8515625f) + 0.8359375f) / ((exponentialValue1 * 18.6875f) + 1.0f)) * 78.84375f), 0.0f, 1.0f);
            intermediateValue25 = clamp(exp2(log2(((exponentialValue2 * 18.8515625f) + 0.8359375f) / ((exponentialValue2 * 18.6875f) + 1.0f)) * 78.84375f), 0.0f, 1.0f);
        }
        outputBufferFinal[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue23, intermediateValue24, intermediateValue25, comparisonValue7);
        outputBufferReprojectedPathLength[uint2(dispatchThreadId.x, dispatchThreadId.y)] = comparisonValue4.xxxx;
        outputBufferMotionVectors[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(comparisonValue5, comparisonValue6, comparisonValue5, comparisonValue5);
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
