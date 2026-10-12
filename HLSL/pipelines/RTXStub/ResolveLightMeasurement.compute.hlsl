// RTXStub / ResolveLightMeasurement / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 39
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    if (dispatchThreadId.x == 0u)
    {
        float reinterpretedBits = asfloat(rdAccess_bufferIncidentLight(0u).xxxx.x);
        float3 reinterpretedBits1 = asfloat(uint3(rdAccess_bufferIncidentLight(8u).xxxx.x, rdAccess_bufferIncidentLight(8u + 1u).xxxx.x, rdAccess_bufferIncidentLight(8u + 2u).xxxx.x));
        float scalarValue = reinterpretedBits1.x;
        float intermediateValue1;
        float intermediateValue2;
        float intermediateValue3;
        float intermediateValue4;
        uint intermediateValue5;
        intermediateValue1 = 0.0f;
        intermediateValue2 = 0.0f;
        intermediateValue3 = 0.0f;
        intermediateValue4 = 0.0f;
        intermediateValue5 = 0u;
        float sumValue;
        float productValue;
        float productValue1;
        float productValue2;
        for (;;)
        {
            uint productValue3 = (intermediateValue5 * 4u) + 12u;
            float4 reinterpretedBits2 = asfloat(uint4(rdAccess_bufferIncidentLight(productValue3).xxxx.x, rdAccess_bufferIncidentLight(productValue3 + 1u).xxxx.x, rdAccess_bufferIncidentLight(productValue3 + 2u).xxxx.x, rdAccess_bufferIncidentLight(productValue3 + 3u).xxxx.x));
            float scalarValue1 = reinterpretedBits2.w;
            productValue = (reinterpretedBits2.x * scalarValue1) + intermediateValue2;
            productValue1 = (reinterpretedBits2.y * scalarValue1) + intermediateValue3;
            productValue2 = (reinterpretedBits2.z * scalarValue1) + intermediateValue4;
            sumValue = scalarValue1 + intermediateValue1;
            uint sumValue1 = intermediateValue5 + 1u;
            if (sumValue1 == 256u)
            {
                break;
            }
            else
            {
                intermediateValue1 = sumValue;
                intermediateValue2 = productValue;
                intermediateValue3 = productValue1;
                intermediateValue4 = productValue2;
                intermediateValue5 = sumValue1;
            }
        }
        float scalarValue2 = reinterpretedBits1.y;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        uint intermediateValue11;
        if (!(sumValue >= 16.0f))
        {
            intermediateValue8 = lightMeterDataCbConstants[1u].w;
            intermediateValue9 = lightMeterDataCbConstants[1u].w;
            intermediateValue10 = lightMeterDataCbConstants[1u].w;
            intermediateValue11 = 0u;
        }
        else
        {
            float exponentialValue = max(max(exp2(log2(productValue / sumValue) * 3.0f) / reinterpretedBits, exp2(log2(productValue1 / sumValue) * 3.0f) / reinterpretedBits), exp2(log2(productValue2 / sumValue) * 3.0f) / reinterpretedBits);
            float nonlinearValue = log2(((asuint(exponentialValue) & 2147483647u) > 2139095040u) ? 750000.0f : (0.75f / (exponentialValue + 9.9999999747524270787835121154785e-07f)));
            intermediateValue8 = min(max(nonlinearValue + 0.300000011920928955078125f, lightMeterDataCbConstants[0u].z + (-4.0f)), lightMeterDataCbConstants[0u].y + 4.0f) + lightMeterDataCbConstants[1u].w;
            intermediateValue9 = min(max(nonlinearValue, lightMeterDataCbConstants[0u].z), lightMeterDataCbConstants[0u].y) + lightMeterDataCbConstants[1u].w;
            intermediateValue10 = nonlinearValue + lightMeterDataCbConstants[1u].w;
            intermediateValue11 = 1u;
        }
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        float comparisonValue1;
        float comparisonValue2;
        float comparisonValue3;
        if ((reinterpretedBits != 0.0f) && (asuint(lightMeterDataCbConstants[0u]).w == 0u))
        {
            bool comparisonValue = intermediateValue11 != 0u;
            intermediateValue12 = reinterpretedBits1.z;
            intermediateValue13 = scalarValue;
            intermediateValue14 = scalarValue2;
            comparisonValue1 = comparisonValue ? intermediateValue8 : scalarValue;
            comparisonValue2 = comparisonValue ? intermediateValue9 : scalarValue2;
            comparisonValue3 = comparisonValue ? intermediateValue10 : scalarValue;
        }
        else
        {
            intermediateValue12 = intermediateValue10;
            intermediateValue13 = intermediateValue8;
            intermediateValue14 = intermediateValue8;
            comparisonValue1 = intermediateValue8;
            comparisonValue2 = intermediateValue9;
            comparisonValue3 = intermediateValue10;
        }
        float productValue4 = (lightMeterDataCbConstants[0u].x * (comparisonValue1 - intermediateValue13)) + intermediateValue13;
        float productValue5 = (lightMeterDataCbConstants[0u].x * (comparisonValue2 - intermediateValue14)) + intermediateValue14;
        float exponentialValue1 = exp2(productValue4);
        float exponentialValue2 = exp2(productValue5);
        float exponentialValue3 = exp2(intermediateValue13);
        float exponentialValue4 = exp2(intermediateValue14);
        rdAccess_bufferIncidentLight(0u) = asuint(exponentialValue1).x;
        rdAccess_bufferIncidentLight(0u + 1u) = asuint(exponentialValue2).x;
        rdAccess_bufferIncidentLight(0u + 2u) = asuint(exponentialValue3).x;
        rdAccess_bufferIncidentLight(0u + 3u) = asuint(exponentialValue4).x;
        rdAccess_bufferIncidentLight(4u) = asuint(exponentialValue1 / exponentialValue3).x;
        rdAccess_bufferIncidentLight(5u) = asuint(exponentialValue2 / exponentialValue4).x;
        rdAccess_bufferIncidentLight(8u) = asuint(productValue4).x;
        rdAccess_bufferIncidentLight(9u) = asuint(productValue5).x;
        rdAccess_bufferIncidentLight(10u) = asuint((lightMeterDataCbConstants[0u].x * (comparisonValue3 - intermediateValue12)) + intermediateValue12).x;
    }
}
[numthreads(1, 1, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
