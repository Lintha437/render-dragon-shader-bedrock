// RTXStub / TemporalDenoising / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 42
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint scalarValue = reinterpretedBits.x;
    uint bitwiseValue = ((scalarValue >> 16u) & 255u) + 0u;
    float4 bitwiseValue1 = shadowDenoisingOutputs[((scalarValue >> 8u) & 255u) + 0u][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
    float scalarValue1 = bitwiseValue1.x;
    float scalarValue2 = bitwiseValue1.y;
    float scalarValue3 = bitwiseValue1.z;
    if ((uint4(inputTileClassification.Load(int3(uint2(uint(int(dispatchThreadId.x) / int(16u)), uint(int(dispatchThreadId.y) / int(16u))), 0u))).x & 4u) == 0u)
    {
        float4 loadedBufferValue = inputBufferMotionVectors.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        uint productValue = uint(int(((loadedBufferValue.x + (viewCbConstants[78u].z * viewCbConstants[81u].z)) * viewCbConstants[80u].x) + float(int(dispatchThreadId.x))));
        uint productValue1 = uint(int(((loadedBufferValue.y + (viewCbConstants[78u].w * viewCbConstants[81u].w)) * viewCbConstants[80u].y) + float(int(dispatchThreadId.y))));
        uint intermediateValue6;
        uint intermediateValue7;
        uint intermediateValue8;
        if (asuint(viewCbConstants[91u]).y == 2u)
        {
            intermediateValue6 = 0u;
            intermediateValue7 = uint(int(viewCbConstants[78u].x));
            intermediateValue8 = uint(int(viewCbConstants[78u].y));
        }
        else
        {
            uint scalarValue4 = uint(viewCbConstants[80u].x);
            bool conditionValue = dispatchThreadId.x < scalarValue4;
            intermediateValue6 = conditionValue ? 0u : scalarValue4;
            intermediateValue7 = conditionValue ? scalarValue4 : uint(viewCbConstants[78u].x);
            intermediateValue8 = uint(viewCbConstants[78u].y);
        }
        float productValue2 = viewCbConstants[88u].x * viewCbConstants[78u].x;
        float productValue3 = viewCbConstants[88u].x * viewCbConstants[78u].y;
        uint productValue4 = uint(float(uint(min(max(float(uint(viewCbConstants[88u].x * float(productValue))), 0.0f), productValue2))));
        uint productValue5 = uint(float(uint(min(max(float(uint(viewCbConstants[88u].x * float(productValue1))), 0.0f), productValue3))));
        bool loadedBufferValue4;
        if (((int(productValue1) > int(4294967295u)) && (int(productValue) >= int(intermediateValue6))) && ((int(productValue) < int(intermediateValue7)) && (int(productValue1) < int(intermediateValue8))))
        {
            float4 loadedBufferValue1 = inputGeometryNormal.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
            float scalarValue5 = loadedBufferValue1.x;
            float scalarValue6 = loadedBufferValue1.y;
            float sumValue = 1.0f - abs(scalarValue5);
            float scalarValue7 = abs(scalarValue6);
            float sumValue1 = sumValue - scalarValue7;
            bool conditionValue1 = sumValue1 < 0.0f;
            float comparisonValue = conditionValue1 ? ((1.0f - scalarValue7) * ((scalarValue5 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue5;
            float comparisonValue1 = conditionValue1 ? (((scalarValue6 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue) : scalarValue6;
            float inverseLengthValue = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue1), float3(comparisonValue, comparisonValue1, sumValue1)));
            float4 loadedBufferValue2 = previousPrimaryNormalBuffer.Load(int3(uint2(uint(float(uint(min(max(float(uint(viewCbConstants[88u].x * float(dispatchThreadId.x))), 0.0f), productValue2)))), uint(float(uint(min(max(float(uint(viewCbConstants[88u].x * float(dispatchThreadId.y))), 0.0f), productValue3))))), 0u));
            float scalarValue8 = loadedBufferValue2.x;
            float scalarValue9 = loadedBufferValue2.y;
            float sumValue2 = 1.0f - abs(scalarValue8);
            float scalarValue10 = abs(scalarValue9);
            float sumValue3 = sumValue2 - scalarValue10;
            bool conditionValue2 = sumValue3 < 0.0f;
            float comparisonValue2 = conditionValue2 ? ((1.0f - scalarValue10) * ((scalarValue8 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue8;
            float comparisonValue3 = conditionValue2 ? (((scalarValue9 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue2) : scalarValue9;
            float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue2, comparisonValue3, sumValue3), float3(comparisonValue2, comparisonValue3, sumValue3)));
            float4 loadedBufferValue3 = inputBufferReprojectedPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
            float scalarValue11 = loadedBufferValue3.x;
            loadedBufferValue4 = clamp(float((abs(previousPrimaryPathLengthBuffer.Load(int3(uint2(productValue4, productValue5), 0u)).x - scalarValue11) / scalarValue11) < 0.039999999105930328369140625f) - float(dot(float3(comparisonValue2 * inverseLengthValue1, comparisonValue3 * inverseLengthValue1, inverseLengthValue1 * sumValue3), float3(comparisonValue * inverseLengthValue, comparisonValue1 * inverseLengthValue, inverseLengthValue * sumValue1)) < 0.60000002384185791015625f), 0.0f, 1.0f) != 0.0f;
        }
        else
        {
            loadedBufferValue4 = false;
        }
        float4 loadedBufferValue5 = previousSunLightShadowBuffer.Load(int3(uint2(productValue4, productValue5), 0u));
        shadowDenoisingOutputs[bitwiseValue][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(loadedBufferValue4 ? ((((loadedBufferValue4 ? loadedBufferValue5.x : 0.0f) - scalarValue1) * 0.60000002384185791015625f) + scalarValue1) : scalarValue1, loadedBufferValue4 ? ((((loadedBufferValue4 ? loadedBufferValue5.y : 0.0f) - scalarValue2) * 0.60000002384185791015625f) + scalarValue2) : scalarValue2, loadedBufferValue4 ? ((((loadedBufferValue4 ? loadedBufferValue5.z : 0.0f) - scalarValue3) * 0.60000002384185791015625f) + scalarValue3) : scalarValue3, bitwiseValue1.w).x;
    }
    else
    {
        shadowDenoisingOutputs[bitwiseValue][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(scalarValue1, scalarValue2, scalarValue3, bitwiseValue1.w).x;
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
