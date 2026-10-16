// RTXStub / DrawLights / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 30
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint scalarValue = 0u;
    half3 productValue;
    uint productValue1;
    for (;;)
    {
        uint bitwiseValue = scalarValue + (workgroupId.z << 6u);
        productValue = (half3)f16tof32(rdByteLoad_inputLightsBuffer_uint16_t3(0u, (bitwiseValue * 2u) * 6 + 0));
        productValue1 = rdByteLoad_inputLightsBuffer_uint(0u, ((bitwiseValue * 3u) + 2u) * 4 + 0);
        if (productValue1 == 0u)
        {
            break;
        }
        else
        {
            float scalarValue1 = float(productValue.x);
            float scalarValue2 = float(productValue.y);
            float scalarValue3 = float(productValue.z);
            float multiplyAddValue = mad(scalarValue3, viewCbConstants[6u].w, mad(scalarValue2, viewCbConstants[5u].w, viewCbConstants[4u].w * scalarValue1)) + viewCbConstants[7u].w;
            if ((multiplyAddValue > 0.0f) && (((mad(scalarValue3, viewCbConstants[6u].z, mad(scalarValue2, viewCbConstants[5u].z, viewCbConstants[4u].z * scalarValue1)) + viewCbConstants[7u].z) / multiplyAddValue) > 0.0f))
            {
                float multiplyAddValue1 = (((((mad(scalarValue3, viewCbConstants[6u].x, mad(scalarValue2, viewCbConstants[5u].x, viewCbConstants[4u].x * scalarValue1)) + viewCbConstants[7u].x) / multiplyAddValue) * 0.5f) + 0.5f) * viewCbConstants[78u].x) - float(int(dispatchThreadId.x));
                float multiplyAddValue2 = (viewCbConstants[78u].y * (0.5f - (((mad(scalarValue3, viewCbConstants[6u].y, mad(scalarValue2, viewCbConstants[5u].y, viewCbConstants[4u].y * scalarValue1)) + viewCbConstants[7u].y) / multiplyAddValue) * 0.5f))) - float(int(dispatchThreadId.y));
                if (!(!(sqrt((multiplyAddValue1 * multiplyAddValue1) + (multiplyAddValue2 * multiplyAddValue2)) <= 10.0f)))
                {
                    float bitwiseValue1 = float(productValue1 & 255u);
                    float productValue2 = bitwiseValue1 * 0.0001537870266474783420562744140625f;
                    outputBufferFinal[uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4((bitwiseValue1 * 0.0003087849472649395465850830078125f) * float((productValue1 >> 24u) & 127u), productValue2 * float((productValue1 >> 16u) & 255u), productValue2 * float((productValue1 >> 8u) & 255u), 1.0f);
                }
            }
            uint sumValue = scalarValue + 1u;
            if (int(sumValue) < int(64u))
            {
                scalarValue = sumValue;
                continue;
            }
            else
            {
                break;
            }
        }
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    workgroupId = stage_input.workgroupId;
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
