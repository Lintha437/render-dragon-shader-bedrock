// RTXStub / BlendCheckerboardFieldsShadow / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 11
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    if (!((float(dispatchThreadId.x) >= viewCbConstants[80u].x) || (float(dispatchThreadId.y) >= viewCbConstants[80u].y)))
    {
        uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
        uint scalarValue = reinterpretedBits.x;
        uint bitwiseValue = ((scalarValue >> 8u) & 255u) + 0u;
        uint bitwiseValue1 = ((scalarValue >> 16u) & 255u) + 0u;
        uint sumValue = uint(viewCbConstants[80u].x) + dispatchThreadId.x;
        uint4 loadedBufferValue = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
        uint scalarValue1 = loadedBufferValue.x;
        uint loadedBufferValue1 = scalarValue1 - uint4(inputPlaneIdentifier.Load(int3(uint2(sumValue, dispatchThreadId.y), 0u))).x;
        float4 vectorValue = shadowDenoisingOutputs[bitwiseValue][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue2 = vectorValue.x;
        float scalarValue3 = vectorValue.y;
        float scalarValue4 = vectorValue.z;
        float scalarValue5 = vectorValue.w;
        float4 vectorValue1 = shadowDenoisingOutputs[bitwiseValue][uint2(sumValue, dispatchThreadId.y)].xxxx;
        float scalarValue6 = vectorValue1.x;
        float scalarValue7 = vectorValue1.y;
        float scalarValue8 = vectorValue1.z;
        float scalarValue9 = vectorValue1.w;
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        if ((scalarValue1 != 0u) && (int(uint(abs(int(loadedBufferValue1)))) < int(uint(int(mad(inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).x, 0.001000000047497451305389404296875f, 0.02500000037252902984619140625f) * 1023.0f)))))
        {
            float productValue = ((scalarValue6 - scalarValue2) * 0.5f) + scalarValue2;
            float productValue1 = ((scalarValue7 - scalarValue3) * 0.5f) + scalarValue3;
            float productValue2 = ((scalarValue8 - scalarValue4) * 0.5f) + scalarValue4;
            float productValue3 = ((scalarValue9 - scalarValue5) * 0.5f) + scalarValue5;
            intermediateValue12 = productValue;
            intermediateValue13 = productValue1;
            intermediateValue14 = productValue2;
            intermediateValue15 = productValue3;
            intermediateValue16 = productValue;
            intermediateValue17 = productValue1;
            intermediateValue18 = productValue2;
            intermediateValue19 = productValue3;
        }
        else
        {
            intermediateValue12 = scalarValue2;
            intermediateValue13 = scalarValue3;
            intermediateValue14 = scalarValue4;
            intermediateValue15 = scalarValue5;
            intermediateValue16 = scalarValue6;
            intermediateValue17 = scalarValue7;
            intermediateValue18 = scalarValue8;
            intermediateValue19 = scalarValue9;
        }
        shadowDenoisingOutputs[bitwiseValue1][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(intermediateValue12, intermediateValue13, intermediateValue14, intermediateValue15).x;
        shadowDenoisingOutputs[bitwiseValue1][uint2(sumValue, dispatchThreadId.y)] = float4(intermediateValue16, intermediateValue17, intermediateValue18, intermediateValue19).x;
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
