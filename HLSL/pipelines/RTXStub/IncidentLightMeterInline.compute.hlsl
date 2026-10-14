// RTXStub / IncidentLightMeterInline / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 28
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint scalarValue = reinterpretedBits.x;
    uint bitwiseValue = scalarValue & 65535u;
    if (dispatchThreadId.z == 0u)
    {
        uint quotientValue = uint(((1.0f / float(bitwiseValue)) * (float(dispatchThreadId.x) + 0.5f)) * viewCbConstants[80u].x);
        uint bitwiseValue1 = uint(((1.0f / float(scalarValue >> 16u)) * (float(dispatchThreadId.y) + 0.5f)) * viewCbConstants[80u].y);
        float4 loadedBufferValue = previousDiffuseBuffer.Load(int3(uint2(quotientValue, bitwiseValue1), 0u));
        float scalarValue1 = loadedBufferValue.x;
        float scalarValue2 = loadedBufferValue.w;
        float4 loadedBufferValue1 = inputPreviousGeometryNormal.Load(int3(uint2(quotientValue, bitwiseValue1), 0u));
        float scalarValue3 = loadedBufferValue1.x;
        float scalarValue4 = loadedBufferValue1.y;
        float sumValue = 1.0f - abs(scalarValue3);
        float scalarValue5 = abs(scalarValue4);
        float sumValue1 = sumValue - scalarValue5;
        bool conditionValue = sumValue1 < 0.0f;
        float comparisonValue = conditionValue ? ((1.0f - scalarValue5) * ((scalarValue3 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue3;
        float comparisonValue1 = conditionValue ? (((scalarValue4 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue) : scalarValue4;
        float inverseLengthValue = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue1), float3(comparisonValue, comparisonValue1, sumValue1)));
        float productValue = comparisonValue * inverseLengthValue;
        float productValue1 = comparisonValue1 * inverseLengthValue;
        float productValue2 = inverseLengthValue * sumValue1;
        float intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        if (asuint(viewCbConstants[96u]).x == 0u)
        {
            intermediateValue7 = scalarValue1;
            intermediateValue8 = loadedBufferValue.y;
            intermediateValue9 = loadedBufferValue.z;
        }
        else
        {
            float4 loadedBufferValue2 = previousDiffuseChromaBuffer.Load(int3(uint2(quotientValue, bitwiseValue1), 0u));
            float dotProductValue = (dot(float3(scalarValue1, loadedBufferValue.yz), float3(productValue, productValue1, productValue2)) * 1.02332603931427001953125f) + (scalarValue2 * 0.886225998401641845703125f);
            float quotientValue1 = dotProductValue * (0.564189970493316650390625f / (scalarValue2 + 9.9999999747524270787835121154785e-07f));
            float productValue3 = quotientValue1 * loadedBufferValue2.x;
            float productValue4 = quotientValue1 * loadedBufferValue2.y;
            float productValue5 = (dotProductValue * 2.0f) - (productValue4 * 0.5f);
            float productValue6 = productValue5 - (productValue3 * 0.5f);
            intermediateValue7 = max(productValue6 + productValue3, 0.0f);
            intermediateValue8 = max(productValue5 + productValue4, 0.0f);
            intermediateValue9 = max(productValue6, 0.0f);
        }
        float clampedValue = clamp(dot(float3(productValue, productValue1, productValue2), float3(viewCbConstants[52u].xyz)), 0.0f, 1.0f);
        float productValue7;
        float productValue8;
        float productValue9;
        if (clampedValue > 0.0f)
        {
            float4 loadedBufferValue3 = previousSunLightShadowBuffer.Load(int3(uint2(quotientValue, bitwiseValue1), 0u));
            float reinterpretedBits1 = asfloat(rdAccess_bufferIncidentLight(0u).xxxx.x) * (clampedValue * 0.3183098733425140380859375f);
            productValue7 = ((reinterpretedBits1 * loadedBufferValue3.x) * viewCbConstants[50u].x) + intermediateValue7;
            productValue8 = ((reinterpretedBits1 * loadedBufferValue3.y) * viewCbConstants[50u].y) + intermediateValue8;
            productValue9 = ((reinterpretedBits1 * loadedBufferValue3.z) * viewCbConstants[50u].z) + intermediateValue9;
        }
        else
        {
            productValue7 = intermediateValue7;
            productValue8 = intermediateValue8;
            productValue9 = intermediateValue9;
        }
        float exponentialValue = exp2(log2(productValue7) * 0.3333333432674407958984375f);
        float exponentialValue1 = exp2(log2(productValue8) * 0.3333333432674407958984375f);
        float exponentialValue2 = exp2(log2(productValue9) * 0.3333333432674407958984375f);
        bool reinterpretedBits2 = (((asuint(exponentialValue) & 2147483647u) > 2139095040u) || ((asuint(exponentialValue1) & 2147483647u) > 2139095040u)) || ((asuint(exponentialValue2) & 2147483647u) > 2139095040u);
        uint productValue10 = ((dispatchThreadId.x + 3u) + (bitwiseValue * dispatchThreadId.y)) * 4u;
        rdAccess_bufferIncidentLight(productValue10) = asuint(reinterpretedBits2 ? 0.0f : exponentialValue).x;
        rdAccess_bufferIncidentLight(productValue10 + 1u) = asuint(reinterpretedBits2 ? 0.0f : exponentialValue1).x;
        rdAccess_bufferIncidentLight(productValue10 + 2u) = asuint(reinterpretedBits2 ? 0.0f : exponentialValue2).x;
        rdAccess_bufferIncidentLight(productValue10 + 3u) = asuint(1.0f - clamp(mad(previousPrimaryPathLengthBuffer.Load(int3(uint2(quotientValue, bitwiseValue1), 0u)).x, viewCbConstants[51u].x, viewCbConstants[51u].y), 0.0f, 1.0f)).x;
    }
}
[numthreads(4, 4, 2)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
