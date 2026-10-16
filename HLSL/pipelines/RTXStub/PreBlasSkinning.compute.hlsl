// RTXStub / PreBlasSkinning / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 15
#endif

#define RD_USE_PACK_HALF2X16_UINT_21 1
#define RD_USE_UNPACK_HALF2X16_FLOAT2_22 1

#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

#include "../../include/Math.hlsli"
void executeComputeStage()
{
    uint bitwiseValue = (workgroupId.x << 6u) + localThreadIndex;
    uint4 reinterpretedBits = asuint(preBlasSkinningCbConstants[1u]);
    if (bitwiseValue < reinterpretedBits.y)
    {
        uint4 reinterpretedBits1 = asuint(preBlasSkinningCbConstants[0u]);
        uint scalarValue = reinterpretedBits1.x;
        uint productValue = scalarValue * bitwiseValue;
        uint sumValue = productValue + reinterpretedBits.w;
        uint reinterpretedBits2 = asuint(preBlasSkinningCbConstants[2u]).y + productValue;
        uint bitwiseValue1 = scalarValue >> 2u;
        uint bitwiseValue2 = scalarValue >> 4u;
        uint bitwiseValue3 = bitwiseValue2 << 2u;
        uint sumValue1 = bitwiseValue1 - bitwiseValue3;
        bool comparisonValue = bitwiseValue2 == 0u;
        uint intermediateValue[10];
        uint intermediateValue2;
        if (comparisonValue)
        {
            intermediateValue2 = 0u;
        }
        else
        {
            uint intermediateValue4;
            uint intermediateValue5;
            intermediateValue4 = 0u;
            intermediateValue5 = 0u;
            for (;;)
            {
                uint reinterpretedBits3 = asuint(preBlasSkinningCbConstants[1u]).z + 0u;
                uint bitwiseValue4 = ((intermediateValue5 << 4u) + sumValue) >> 2u;
                uint4 sumValue2 = uint4(vertexBuffersRW[reinterpretedBits3].Load((bitwiseValue4) * 4u).xxxx.x, vertexBuffersRW[reinterpretedBits3].Load((bitwiseValue4 + 1u) * 4u).xxxx.x, vertexBuffersRW[reinterpretedBits3].Load((bitwiseValue4 + 2u) * 4u).xxxx.x, vertexBuffersRW[reinterpretedBits3].Load((bitwiseValue4 + 3u) * 4u).xxxx.x);
                intermediateValue[intermediateValue4] = sumValue2.x;
                intermediateValue[intermediateValue4 | 1u] = sumValue2.y;
                intermediateValue[intermediateValue4 | 2u] = sumValue2.z;
                intermediateValue[intermediateValue4 | 3u] = sumValue2.w;
                uint sumValue3 = intermediateValue5 + 1u;
                if (sumValue3 == bitwiseValue2)
                {
                    break;
                }
                else
                {
                    intermediateValue4 += 4u;
                    intermediateValue5 = sumValue3;
                }
            }
            intermediateValue2 = bitwiseValue3;
        }
        bool comparisonValue1 = bitwiseValue1 == bitwiseValue3;
        if (!comparisonValue1)
        {
            uint intermediateValue7;
            uint intermediateValue8;
            intermediateValue7 = intermediateValue2;
            intermediateValue8 = 0u;
            for (;;)
            {
                intermediateValue[intermediateValue7] = vertexBuffersRW[asuint(preBlasSkinningCbConstants[1u]).z + 0u].Load(((((bitwiseValue2 << 4u) + sumValue) + (intermediateValue8 << 2u)) >> 2u) * 4u).xxxx.x;
                uint sumValue4 = intermediateValue8 + 1u;
                if (sumValue4 < sumValue1)
                {
                    intermediateValue7++;
                    intermediateValue8 = sumValue4;
                }
                else
                {
                    break;
                }
            }
        }
        uint4 reinterpretedBits4 = asuint(preBlasSkinningCbConstants[0u]);
        uint scalarValue1 = reinterpretedBits4.z;
        if (!(scalarValue1 == 4294967295u))
        {
            uint scalarValue2 = scalarValue1 >> 2u;
            uint reinterpretedBits5 = asuint(preBlasSkinningCbConstants[2u]).x + 0u;
            uint bitwiseValue5 = (reinterpretedBits4.y + productValue) >> 2u;
            uint2 sumValue5 = uint2(vertexBuffersRW[reinterpretedBits5].Load((bitwiseValue5) * 4u).xxxx.x, vertexBuffersRW[reinterpretedBits5].Load((bitwiseValue5 + 1u) * 4u).xxxx.x);
            intermediateValue[scalarValue2] = sumValue5.x;
            intermediateValue[scalarValue2 + 1u] = sumValue5.y;
        }
        uint reinterpretedBits6 = intermediateValue[asuint(preBlasSkinningCbConstants[1u]).x >> 2u];
        uint bitwiseValue6 = reinterpretedBits6 & 65535u;
        if (bitwiseValue6 < 8u)
        {
            uint bitwiseValue7 = (bitwiseValue6 << 2u) | 3u;
            uint sumValue6 = bitwiseValue7 + 1u;
            uint sumValue7 = bitwiseValue7 + 2u;
            uint sumValue8 = bitwiseValue7 + 3u;
            uint4 reinterpretedBits7 = asuint(preBlasSkinningCbConstants[0u]);
            uint bitwiseValue8 = reinterpretedBits7.y >> 2u;
            uint scalarValue3 = intermediateValue[bitwiseValue8];
            uint sumValue9 = bitwiseValue8 + 1u;
            uint scalarValue4 = intermediateValue[sumValue9];
            float2 bitwiseValue9 = rdUnpackHalf2x16(scalarValue3 & 65535u);
            float scalarValue5 = bitwiseValue9.x;
            float2 bitwiseValue10 = rdUnpackHalf2x16(scalarValue3 >> 16u);
            float scalarValue6 = bitwiseValue10.x;
            float2 bitwiseValue11 = rdUnpackHalf2x16(scalarValue4 & 65535u);
            float scalarValue7 = bitwiseValue11.x;
            float2 bitwiseValue12 = rdUnpackHalf2x16(scalarValue4 >> 16u);
            float scalarValue8 = bitwiseValue12.x;
            intermediateValue[bitwiseValue8] = (rdPackHalf2x16(float2(mad(preBlasSkinningCbConstants[sumValue8].y, scalarValue8, mad(preBlasSkinningCbConstants[sumValue7].y, scalarValue7, mad(preBlasSkinningCbConstants[sumValue6].y, scalarValue6, scalarValue5 * preBlasSkinningCbConstants[bitwiseValue7].y))), 0.0f)) << 16u) | rdPackHalf2x16(float2(mad(preBlasSkinningCbConstants[sumValue8].x, scalarValue8, mad(preBlasSkinningCbConstants[sumValue7].x, scalarValue7, mad(preBlasSkinningCbConstants[sumValue6].x, scalarValue6, scalarValue5 * preBlasSkinningCbConstants[bitwiseValue7].x))), 0.0f));
            intermediateValue[sumValue9] = (rdPackHalf2x16(float2(mad(preBlasSkinningCbConstants[sumValue8].w, scalarValue8, mad(preBlasSkinningCbConstants[sumValue7].w, scalarValue7, mad(preBlasSkinningCbConstants[sumValue6].w, scalarValue6, scalarValue5 * preBlasSkinningCbConstants[bitwiseValue7].w))), 0.0f)) << 16u) | rdPackHalf2x16(float2(mad(preBlasSkinningCbConstants[sumValue8].z, scalarValue8, mad(preBlasSkinningCbConstants[sumValue7].z, scalarValue7, mad(preBlasSkinningCbConstants[sumValue6].z, scalarValue6, scalarValue5 * preBlasSkinningCbConstants[bitwiseValue7].z))), 0.0f));
            uint bitwiseValue13 = reinterpretedBits7.w >> 2u;
            uint bitwiseValue14 = intermediateValue[bitwiseValue13] & 255u;
            float comparisonValue2 = float(int((bitwiseValue14 == (intermediateValue[bitwiseValue13] & 127u)) ? bitwiseValue14 : (intermediateValue[bitwiseValue13] | 4294967040u))) * 0.0078740157186985015869140625f;
            uint bitwiseValue15 = intermediateValue[bitwiseValue13] >> 8u;
            uint bitwiseValue16 = bitwiseValue15 & 255u;
            float comparisonValue3 = float(int((bitwiseValue16 == (bitwiseValue15 & 127u)) ? bitwiseValue16 : (bitwiseValue15 | 4294967040u))) * 0.0078740157186985015869140625f;
            uint bitwiseValue17 = intermediateValue[bitwiseValue13] >> 16u;
            uint bitwiseValue18 = bitwiseValue17 & 255u;
            float comparisonValue4 = float(int((bitwiseValue18 == (bitwiseValue17 & 127u)) ? bitwiseValue18 : (bitwiseValue17 | 4294967040u))) * 0.0078740157186985015869140625f;
            uint bitwiseValue19 = intermediateValue[bitwiseValue13] >> 24u;
            float comparisonValue5 = float(int((bitwiseValue19 == (bitwiseValue19 & 127u)) ? bitwiseValue19 : (bitwiseValue19 | 4294967040u))) * 0.0078740157186985015869140625f;
            intermediateValue[bitwiseValue13] = ((((uint(int(min(max(mad(preBlasSkinningCbConstants[sumValue8].z, comparisonValue5, mad(preBlasSkinningCbConstants[sumValue7].z, comparisonValue4, mad(preBlasSkinningCbConstants[sumValue6].z, comparisonValue3, comparisonValue2 * preBlasSkinningCbConstants[bitwiseValue7].z))) * 127.0f, -127.0f), 127.0f))) << 16u) & 16711680u) | (uint(int(min(max(mad(preBlasSkinningCbConstants[sumValue8].w, comparisonValue5, mad(preBlasSkinningCbConstants[sumValue7].w, comparisonValue4, mad(preBlasSkinningCbConstants[sumValue6].w, comparisonValue3, comparisonValue2 * preBlasSkinningCbConstants[bitwiseValue7].w))) * 127.0f, -127.0f), 127.0f))) << 24u)) | ((uint(int(min(max(mad(preBlasSkinningCbConstants[sumValue8].y, comparisonValue5, mad(preBlasSkinningCbConstants[sumValue7].y, comparisonValue4, mad(preBlasSkinningCbConstants[sumValue6].y, comparisonValue3, comparisonValue2 * preBlasSkinningCbConstants[bitwiseValue7].y))) * 127.0f, -127.0f), 127.0f))) << 8u) & 65280u)) | (uint(int(min(max(mad(preBlasSkinningCbConstants[sumValue8].x, comparisonValue5, mad(preBlasSkinningCbConstants[sumValue7].x, comparisonValue4, mad(preBlasSkinningCbConstants[sumValue6].x, comparisonValue3, comparisonValue2 * preBlasSkinningCbConstants[bitwiseValue7].x))) * 127.0f, -127.0f), 127.0f))) & 255u);
        }
        uint intermediateValue15;
        if (comparisonValue)
        {
            intermediateValue15 = 0u;
        }
        else
        {
            uint intermediateValue16;
            uint intermediateValue17;
            intermediateValue16 = 0u;
            intermediateValue17 = 0u;
            for (;;)
            {
                uint reinterpretedBits8 = asuint(preBlasSkinningCbConstants[2u]).x + 0u;
                uint bitwiseValue20 = ((intermediateValue17 << 4u) + reinterpretedBits2) >> 2u;
                vertexBuffersRW[reinterpretedBits8].Store((bitwiseValue20) * 4u, intermediateValue[intermediateValue16].x);
                vertexBuffersRW[reinterpretedBits8].Store((bitwiseValue20 + 1u) * 4u, intermediateValue[intermediateValue16 | 1u].x);
                vertexBuffersRW[reinterpretedBits8].Store((bitwiseValue20 + 2u) * 4u, intermediateValue[intermediateValue16 | 2u].x);
                vertexBuffersRW[reinterpretedBits8].Store((bitwiseValue20 + 3u) * 4u, intermediateValue[intermediateValue16 | 3u].x);
                uint sumValue10 = intermediateValue17 + 1u;
                if (sumValue10 == bitwiseValue2)
                {
                    break;
                }
                else
                {
                    intermediateValue16 += 4u;
                    intermediateValue17 = sumValue10;
                }
            }
            intermediateValue15 = bitwiseValue3;
        }
        if (!comparisonValue1)
        {
            uint intermediateValue18;
            uint intermediateValue19;
            intermediateValue18 = intermediateValue15;
            intermediateValue19 = 0u;
            for (;;)
            {
                vertexBuffersRW[asuint(preBlasSkinningCbConstants[2u]).x + 0u].Store(((((bitwiseValue2 << 4u) + reinterpretedBits2) + (intermediateValue19 << 2u)) >> 2u) * 4u, intermediateValue[intermediateValue18].x);
                uint sumValue11 = intermediateValue19 + 1u;
                if (sumValue11 < sumValue1)
                {
                    intermediateValue18++;
                    intermediateValue19 = sumValue11;
                }
                else
                {
                    break;
                }
            }
        }
    }
}
[numthreads(64, 1, 1)]
void main(ComputeStageInput stage_input)
{
    workgroupId = stage_input.workgroupId;
    localThreadIndex = stage_input.localThreadIndex;
    executeComputeStage();
}
