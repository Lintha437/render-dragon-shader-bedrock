// RTXStub / ToneCurve / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 46
#endif

#define RD_USE_DIVIDE_UNSIGNED_UINT_19 1

#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

#include "../../include/Math.hlsli"
void executeComputeStage()
{
    if (!(localThreadIndex > 255u))
    {
        float productValue = (float(localThreadIndex) * 0.109375f) + (-24.0f);
        uint4 vectorValue = outputBufferToneMappingHistogram[uint2(localThreadIndex, 0u)].xxxx;
        float productValue1 = (float(vectorValue.x) * 0.015625f) + 1.0f;
        float comparisonValue = (localThreadIndex > 196u) ? 0.0f : productValue1;
        intermediateValue[localThreadIndex] = WaveActiveSum(comparisonValue);
        GroupMemoryBarrierWithGroupSync();
        bool conditionValue = WaveGetLaneCount() < 129u;
        if (conditionValue)
        {
            uint scalarValue = 128u;
            bool intermediateValue5;
            for (;;)
            {
                intermediateValue5 = localThreadIndex < scalarValue;
                if (intermediateValue5)
                {
                    intermediateValue[localThreadIndex] += intermediateValue[scalarValue + localThreadIndex];
                }
                GroupMemoryBarrierWithGroupSync();
                uint bitwiseValue = scalarValue >> 1u;
                if (bitwiseValue < WaveGetLaneCount())
                {
                    break;
                }
                else
                {
                    scalarValue = bitwiseValue;
                    continue;
                }
            }
        }
        float scalarValue1 = intermediateValue[0u];
        GroupMemoryBarrierWithGroupSync();
        float quotientValue = comparisonValue / scalarValue1;
        float productValue2 = ((-2.4739310741424560546875f) - min((-0.0f) - viewCbConstants[94u].w, -2.5563933849334716796875f)) * 9.14285755157470703125f;
        float comparisonValue1 = (quotientValue > 0.0f) ? (1.0f / quotientValue) : 0.0f;
        float quotientValue1;
        float intermediateValue8;
        float scalarValue2 = 1.000000016862383526387164645044e-16f;
        uint scalarValue3 = 0u;
        float comparisonValue2;
        for (;;)
        {
            comparisonValue2 = (quotientValue < scalarValue2) ? 0.0f : 1.0f;
            intermediateValue[localThreadIndex] = WaveActiveSum(comparisonValue2);
            GroupMemoryBarrierWithGroupSync();
            if (conditionValue)
            {
                uint scalarValue4 = 128u;
                bool intermediateValue10;
                for (;;)
                {
                    intermediateValue10 = localThreadIndex < scalarValue4;
                    if (intermediateValue10)
                    {
                        intermediateValue[localThreadIndex] += intermediateValue[scalarValue4 + localThreadIndex];
                    }
                    GroupMemoryBarrierWithGroupSync();
                    uint bitwiseValue1 = scalarValue4 >> 1u;
                    if (bitwiseValue1 < WaveGetLaneCount())
                    {
                        break;
                    }
                    else
                    {
                        scalarValue4 = bitwiseValue1;
                        continue;
                    }
                }
            }
            intermediateValue8 = intermediateValue[0u];
            GroupMemoryBarrierWithGroupSync();
            intermediateValue[localThreadIndex] = WaveActiveSum(comparisonValue2 * comparisonValue1);
            GroupMemoryBarrierWithGroupSync();
            if (conditionValue)
            {
                uint scalarValue5 = 128u;
                bool intermediateValue13;
                for (;;)
                {
                    intermediateValue13 = localThreadIndex < scalarValue5;
                    if (intermediateValue13)
                    {
                        intermediateValue[localThreadIndex] += intermediateValue[scalarValue5 + localThreadIndex];
                    }
                    GroupMemoryBarrierWithGroupSync();
                    uint bitwiseValue2 = scalarValue5 >> 1u;
                    if (bitwiseValue2 < WaveGetLaneCount())
                    {
                        break;
                    }
                    else
                    {
                        scalarValue5 = bitwiseValue2;
                        continue;
                    }
                }
            }
            float scalarValue6 = intermediateValue[0u];
            GroupMemoryBarrierWithGroupSync();
            quotientValue1 = (intermediateValue8 - productValue2) / scalarValue6;
            uint sumValue = scalarValue3 + 1u;
            if (sumValue == 16u)
            {
                break;
            }
            else
            {
                scalarValue2 = quotientValue1;
                scalarValue3 = sumValue;
                continue;
            }
        }
        float comparisonValue3 = (quotientValue < quotientValue1) ? 0.0f : 1.0f;
        intermediateValue[localThreadIndex] = WaveActiveSum(comparisonValue3);
        GroupMemoryBarrierWithGroupSync();
        if (conditionValue)
        {
            uint scalarValue7 = 128u;
            bool intermediateValue16;
            for (;;)
            {
                intermediateValue16 = localThreadIndex < scalarValue7;
                if (intermediateValue16)
                {
                    intermediateValue[localThreadIndex] += intermediateValue[scalarValue7 + localThreadIndex];
                }
                GroupMemoryBarrierWithGroupSync();
                uint bitwiseValue3 = scalarValue7 >> 1u;
                if (bitwiseValue3 < WaveGetLaneCount())
                {
                    break;
                }
                else
                {
                    scalarValue7 = bitwiseValue3;
                    continue;
                }
            }
        }
        float scalarValue8 = intermediateValue[0u];
        GroupMemoryBarrierWithGroupSync();
        intermediateValue[localThreadIndex] = WaveActiveSum(comparisonValue3 * comparisonValue1);
        GroupMemoryBarrierWithGroupSync();
        if (conditionValue)
        {
            uint scalarValue9 = 128u;
            bool intermediateValue19;
            for (;;)
            {
                intermediateValue19 = localThreadIndex < scalarValue9;
                if (intermediateValue19)
                {
                    intermediateValue[localThreadIndex] += intermediateValue[scalarValue9 + localThreadIndex];
                }
                GroupMemoryBarrierWithGroupSync();
                uint bitwiseValue4 = scalarValue9 >> 1u;
                if (bitwiseValue4 < WaveGetLaneCount())
                {
                    break;
                }
                else
                {
                    scalarValue9 = bitwiseValue4;
                    continue;
                }
            }
        }
        float scalarValue10 = intermediateValue[0u];
        GroupMemoryBarrierWithGroupSync();
        float comparisonValue4 = ((localThreadIndex + 4294967099u) > 58u) ? 0.0f : productValue1;
        intermediateValue[localThreadIndex] = WaveActiveSum(comparisonValue4);
        GroupMemoryBarrierWithGroupSync();
        if (conditionValue)
        {
            uint scalarValue11 = 128u;
            bool intermediateValue22;
            for (;;)
            {
                intermediateValue22 = localThreadIndex < scalarValue11;
                if (intermediateValue22)
                {
                    intermediateValue[localThreadIndex] += intermediateValue[scalarValue11 + localThreadIndex];
                }
                GroupMemoryBarrierWithGroupSync();
                uint bitwiseValue5 = scalarValue11 >> 1u;
                if (bitwiseValue5 < WaveGetLaneCount())
                {
                    break;
                }
                else
                {
                    scalarValue11 = bitwiseValue5;
                    continue;
                }
            }
        }
        float scalarValue12 = intermediateValue[0u];
        GroupMemoryBarrierWithGroupSync();
        float quotientValue2 = comparisonValue4 / scalarValue12;
        float comparisonValue5 = (quotientValue2 > 0.0f) ? (1.0f / quotientValue2) : 0.0f;
        float quotientValue3;
        float intermediateValue25;
        float scalarValue13 = 1.000000016862383526387164645044e-16f;
        uint scalarValue14 = 0u;
        float comparisonValue6;
        for (;;)
        {
            comparisonValue6 = (quotientValue2 < scalarValue13) ? 0.0f : 1.0f;
            intermediateValue[localThreadIndex] = WaveActiveSum(comparisonValue6);
            GroupMemoryBarrierWithGroupSync();
            if (conditionValue)
            {
                uint scalarValue15 = 128u;
                bool intermediateValue27;
                for (;;)
                {
                    intermediateValue27 = localThreadIndex < scalarValue15;
                    if (intermediateValue27)
                    {
                        intermediateValue[localThreadIndex] += intermediateValue[scalarValue15 + localThreadIndex];
                    }
                    GroupMemoryBarrierWithGroupSync();
                    uint bitwiseValue6 = scalarValue15 >> 1u;
                    if (bitwiseValue6 < WaveGetLaneCount())
                    {
                        break;
                    }
                    else
                    {
                        scalarValue15 = bitwiseValue6;
                        continue;
                    }
                }
            }
            intermediateValue25 = intermediateValue[0u];
            GroupMemoryBarrierWithGroupSync();
            intermediateValue[localThreadIndex] = WaveActiveSum(comparisonValue6 * comparisonValue5);
            GroupMemoryBarrierWithGroupSync();
            if (conditionValue)
            {
                uint scalarValue16 = 128u;
                bool intermediateValue30;
                for (;;)
                {
                    intermediateValue30 = localThreadIndex < scalarValue16;
                    if (intermediateValue30)
                    {
                        intermediateValue[localThreadIndex] += intermediateValue[scalarValue16 + localThreadIndex];
                    }
                    GroupMemoryBarrierWithGroupSync();
                    uint bitwiseValue7 = scalarValue16 >> 1u;
                    if (bitwiseValue7 < WaveGetLaneCount())
                    {
                        break;
                    }
                    else
                    {
                        scalarValue16 = bitwiseValue7;
                        continue;
                    }
                }
            }
            float scalarValue17 = intermediateValue[0u];
            GroupMemoryBarrierWithGroupSync();
            quotientValue3 = (intermediateValue25 + (-22.6187992095947265625f)) / scalarValue17;
            uint sumValue1 = scalarValue14 + 1u;
            if (sumValue1 == 16u)
            {
                break;
            }
            else
            {
                scalarValue13 = quotientValue3;
                scalarValue14 = sumValue1;
                continue;
            }
        }
        float comparisonValue7 = (quotientValue2 < quotientValue3) ? 0.0f : 1.0f;
        intermediateValue[localThreadIndex] = WaveActiveSum(comparisonValue7);
        GroupMemoryBarrierWithGroupSync();
        if (conditionValue)
        {
            uint scalarValue18 = 128u;
            bool intermediateValue33;
            for (;;)
            {
                intermediateValue33 = localThreadIndex < scalarValue18;
                if (intermediateValue33)
                {
                    intermediateValue[localThreadIndex] += intermediateValue[scalarValue18 + localThreadIndex];
                }
                GroupMemoryBarrierWithGroupSync();
                uint bitwiseValue8 = scalarValue18 >> 1u;
                if (bitwiseValue8 < WaveGetLaneCount())
                {
                    break;
                }
                else
                {
                    scalarValue18 = bitwiseValue8;
                    continue;
                }
            }
        }
        float scalarValue19 = intermediateValue[0u];
        GroupMemoryBarrierWithGroupSync();
        intermediateValue[localThreadIndex] = WaveActiveSum(comparisonValue7 * comparisonValue5);
        GroupMemoryBarrierWithGroupSync();
        if (conditionValue)
        {
            uint scalarValue20 = 128u;
            bool intermediateValue37;
            for (;;)
            {
                intermediateValue37 = localThreadIndex < scalarValue20;
                if (intermediateValue37)
                {
                    intermediateValue[localThreadIndex] += intermediateValue[scalarValue20 + localThreadIndex];
                }
                GroupMemoryBarrierWithGroupSync();
                uint bitwiseValue9 = scalarValue20 >> 1u;
                if (bitwiseValue9 < WaveGetLaneCount())
                {
                    break;
                }
                else
                {
                    scalarValue20 = bitwiseValue9;
                    continue;
                }
            }
        }
        float scalarValue21 = intermediateValue[0u];
        GroupMemoryBarrierWithGroupSync();
        float quotientValue4 = ((((22.6187992095947265625f - scalarValue19) * comparisonValue5) / scalarValue21) + 1.0f) * comparisonValue7;
        bool conditionValue1 = localThreadIndex < 197u;
        float comparisonValue8;
        if (conditionValue1)
        {
            comparisonValue8 = max(conditionValue1 ? (((((productValue2 - scalarValue8) * comparisonValue1) / scalarValue10) + 1.0f) * comparisonValue3) : quotientValue4, viewCbConstants[95u].x);
        }
        else
        {
            comparisonValue8 = quotientValue4;
        }
        intermediateValue[localThreadIndex] = WavePrefixSum(comparisonValue8) + comparisonValue8;
        GroupMemoryBarrierWithGroupSync();
        bool conditionValue2 = WaveGetLaneCount() < 256u;
        if (conditionValue2)
        {
            uint scalarValue22 = WaveGetLaneCount();
            uint intermediateValue42;
            bool comparisonValue9;
            for (;;)
            {
                intermediateValue42 = rdDivideUnsigned(localThreadIndex, scalarValue22);
                comparisonValue9 = (intermediateValue42 & 1u) == 0u;
                if (!comparisonValue9)
                {
                    intermediateValue[localThreadIndex] += intermediateValue[(intermediateValue42 * scalarValue22) + 4294967295u];
                }
                GroupMemoryBarrierWithGroupSync();
                uint bitwiseValue10 = scalarValue22 << 1u;
                if (bitwiseValue10 < 256u)
                {
                    scalarValue22 = bitwiseValue10;
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        float scalarValue23 = intermediateValue[localThreadIndex];
        GroupMemoryBarrierWithGroupSync();
        float productValue3 = min((((scalarValue23 - comparisonValue8) - intermediateValue[255u]) * 0.109375f) - (max(0.0f, viewCbConstants[94u].y - productValue) * viewCbConstants[94u].x), viewCbConstants[95u].y + productValue);
        intermediateValue[localThreadIndex] = WavePrefixSum(productValue3) + productValue3;
        GroupMemoryBarrierWithGroupSync();
        if (conditionValue2)
        {
            uint scalarValue24 = WaveGetLaneCount();
            uint intermediateValue44;
            bool comparisonValue10;
            for (;;)
            {
                intermediateValue44 = rdDivideUnsigned(localThreadIndex, scalarValue24);
                comparisonValue10 = (intermediateValue44 & 1u) == 0u;
                if (!comparisonValue10)
                {
                    intermediateValue[localThreadIndex] += intermediateValue[(intermediateValue44 * scalarValue24) + 4294967295u];
                }
                GroupMemoryBarrierWithGroupSync();
                uint bitwiseValue11 = scalarValue24 << 1u;
                if (bitwiseValue11 < 256u)
                {
                    scalarValue24 = bitwiseValue11;
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        GroupMemoryBarrierWithGroupSync();
        uint sumValue2 = min((localThreadIndex + 12u), 255u);
        uint sumValue3 = uint(max(int(0u), int(localThreadIndex + 4294967283u)));
        float quotientValue5 = viewCbConstants[94u].z + ((intermediateValue[sumValue2] - intermediateValue[sumValue3]) / float(sumValue2 - sumValue3));
        float productValue4;
        if (asuint(viewCbConstants[95u]).z == 0u)
        {
            productValue4 = ((outputBufferToneCurve[uint2(localThreadIndex, 0u)].xxxx.x - quotientValue5) * 0.932393848896026611328125f) + quotientValue5;
        }
        else
        {
            productValue4 = quotientValue5;
        }
        outputBufferToneCurve[uint2(localThreadIndex, 0u)] = productValue4.x;
        outputBufferToneMappingHistogram[uint2(localThreadIndex, 0u)] = uint4(0u, 0u, 0u, 0u).x;
    }
}
[numthreads(256, 1, 1)]
void main(ComputeStageInput stage_input)
{
    localThreadIndex = stage_input.localThreadIndex;
    executeComputeStage();
}
