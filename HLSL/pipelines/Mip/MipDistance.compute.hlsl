// Mip / MipDistance / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif


#include "../../include/materials/Mip/ComputeBindings.hlsli"

void executeComputeStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint productValue = uint(int(RD_UNIFORM_SCREEN_SIZE.x * 2.0f));
    uint productValue1 = uint(int(RD_UNIFORM_SCREEN_SIZE.y * 2.0f));
    uint scalarValue = uint(int(float(dispatchThreadId.x)));
    uint scalarValue1 = uint(int(float(dispatchThreadId.y)));
    uint bitwiseValue = scalarValue << 1u;
    uint bitwiseValue1 = scalarValue1 << 1u;
    bool comparisonValue = ((productValue & 1u) != 0u) && (scalarValue == (productValue + 4294967293u));
    bool comparisonValue1 = ((productValue1 & 1u) != 0u) && (scalarValue1 == (productValue1 + 4294967293u));
    float intermediateValue17;
    float intermediateValue18;
    if (uint(int(RD_UNIFORM_LEVELS.x)) == 0u)
    {
        float4 loadedBufferValue = framebufferDepthTexture.Load(int3(uint2(bitwiseValue, bitwiseValue1), 0u));
        float scalarValue2 = loadedBufferValue.x;
        float quotientValue = (((float(int(bitwiseValue)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.x) * 2.0f) + (-1.0f);
        float quotientValue1 = ((1.0f - ((float(int(bitwiseValue1)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.y)) * 2.0f) + (-1.0f);
        float multiplyAddValue = (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.z, scalarValue2, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.z, quotientValue1, quotientValue * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.z)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.z) / (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.w, scalarValue2, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.w, quotientValue1, quotientValue * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.w)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.w);
        uint bitwiseValue2 = bitwiseValue1 | 1u;
        float4 loadedBufferValue1 = framebufferDepthTexture.Load(int3(uint2(bitwiseValue, bitwiseValue2), 0u));
        float scalarValue3 = loadedBufferValue1.x;
        float quotientValue2 = (((float(int(bitwiseValue)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.x) * 2.0f) + (-1.0f);
        float quotientValue3 = ((1.0f - ((float(int(bitwiseValue2)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.y)) * 2.0f) + (-1.0f);
        float multiplyAddValue1 = (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.z, scalarValue3, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.z, quotientValue3, quotientValue2 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.z)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.z) / (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.w, scalarValue3, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.w, quotientValue3, quotientValue2 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.w)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.w);
        float4 loadedBufferValue2 = framebufferDepthTexture.Load(int3(uint2(bitwiseValue, bitwiseValue1), 0u));
        float scalarValue4 = loadedBufferValue2.x;
        float quotientValue4 = (((float(int(bitwiseValue)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.x) * 2.0f) + (-1.0f);
        float quotientValue5 = ((1.0f - ((float(int(bitwiseValue1)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.y)) * 2.0f) + (-1.0f);
        float multiplyAddValue2 = (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.z, scalarValue4, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.z, quotientValue5, quotientValue4 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.z)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.z) / (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.w, scalarValue4, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.w, quotientValue5, quotientValue4 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.w)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.w);
        uint bitwiseValue3 = bitwiseValue | 1u;
        float4 loadedBufferValue3 = framebufferDepthTexture.Load(int3(uint2(bitwiseValue3, bitwiseValue2), 0u));
        float scalarValue5 = loadedBufferValue3.x;
        float quotientValue6 = (((float(int(bitwiseValue3)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.x) * 2.0f) + (-1.0f);
        float quotientValue7 = ((1.0f - ((float(int(bitwiseValue2)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.y)) * 2.0f) + (-1.0f);
        float multiplyAddValue3 = (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.z, scalarValue5, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.z, quotientValue7, quotientValue6 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.z)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.z) / (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.w, scalarValue5, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.w, quotientValue7, quotientValue6 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.w)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.w);
        float scalarValue6 = min(multiplyAddValue, min(multiplyAddValue1, min(multiplyAddValue2, multiplyAddValue3)));
        float scalarValue7 = max(multiplyAddValue, max(multiplyAddValue1, max(multiplyAddValue2, multiplyAddValue3)));
        float intermediateValue10;
        float intermediateValue11;
        if (comparisonValue)
        {
            uint sumValue = bitwiseValue + 2u;
            float4 loadedBufferValue4 = framebufferDepthTexture.Load(int3(uint2(sumValue, bitwiseValue1), 0u));
            float scalarValue8 = loadedBufferValue4.x;
            float quotientValue8 = (((float(int(sumValue)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.x) * 2.0f) + (-1.0f);
            float quotientValue9 = ((1.0f - ((float(int(bitwiseValue1)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.y)) * 2.0f) + (-1.0f);
            float4 loadedBufferValue5 = framebufferDepthTexture.Load(int3(uint2(sumValue, bitwiseValue2), 0u));
            float scalarValue9 = loadedBufferValue5.x;
            float quotientValue10 = (((float(int(sumValue)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.x) * 2.0f) + (-1.0f);
            float quotientValue11 = ((1.0f - ((float(int(bitwiseValue2)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.y)) * 2.0f) + (-1.0f);
            float intermediateValue13;
            float intermediateValue14;
            if (comparisonValue1)
            {
                uint sumValue1 = bitwiseValue1 + 2u;
                float4 loadedBufferValue6 = framebufferDepthTexture.Load(int3(uint2(sumValue, sumValue1), 0u));
                float scalarValue10 = loadedBufferValue6.x;
                float quotientValue12 = (((float(int(sumValue)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.x) * 2.0f) + (-1.0f);
                float quotientValue13 = ((1.0f - ((float(int(sumValue1)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.y)) * 2.0f) + (-1.0f);
                float multiplyAddValue4 = (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.z, scalarValue10, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.z, quotientValue13, quotientValue12 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.z)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.z) / (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.w, scalarValue10, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.w, quotientValue13, quotientValue12 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.w)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.w);
                intermediateValue13 = min(scalarValue6, multiplyAddValue4);
                intermediateValue14 = min(scalarValue7, multiplyAddValue4);
            }
            else
            {
                intermediateValue13 = scalarValue6;
                intermediateValue14 = scalarValue7;
            }
            float multiplyAddValue5 = min((mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.z, scalarValue8, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.z, quotientValue9, quotientValue8 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.z)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.z) / (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.w, scalarValue8, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.w, quotientValue9, quotientValue8 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.w)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.w), (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.z, scalarValue9, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.z, quotientValue11, quotientValue10 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.z)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.z) / (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.w, scalarValue9, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.w, quotientValue11, quotientValue10 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.w)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.w));
            intermediateValue10 = min(intermediateValue13, multiplyAddValue5);
            intermediateValue11 = min(intermediateValue14, multiplyAddValue5);
        }
        else
        {
            intermediateValue10 = scalarValue6;
            intermediateValue11 = scalarValue7;
        }
        float branchMergedValue;
        float branchMergedValue2;
        if (comparisonValue1)
        {
            uint sumValue2 = bitwiseValue1 + 2u;
            float4 loadedBufferValue8 = framebufferDepthTexture.Load(int3(uint2(bitwiseValue, sumValue2), 0u));
            float scalarValue11 = loadedBufferValue8.x;
            float quotientValue14 = (((float(int(bitwiseValue)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.x) * 2.0f) + (-1.0f);
            float quotientValue15 = ((1.0f - ((float(int(sumValue2)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.y)) * 2.0f) + (-1.0f);
            float4 loadedBufferValue9 = framebufferDepthTexture.Load(int3(uint2(bitwiseValue3, sumValue2), 0u));
            float scalarValue12 = loadedBufferValue9.x;
            float quotientValue16 = (((float(int(bitwiseValue3)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.x) * 2.0f) + (-1.0f);
            float quotientValue17 = ((1.0f - ((float(int(sumValue2)) + 0.5f) / RD_UNIFORM_SCREEN_SIZE.y)) * 2.0f) + (-1.0f);
            float multiplyAddValue6 = min((mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.z, scalarValue11, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.z, quotientValue15, quotientValue14 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.z)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.z) / (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.w, scalarValue11, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.w, quotientValue15, quotientValue14 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.w)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.w), (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.z, scalarValue12, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.z, quotientValue17, quotientValue16 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.z)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.z) / (mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2.w, scalarValue12, mad(RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1.w, quotientValue17, quotientValue16 * RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0.w)) + RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3.w));
            branchMergedValue = min(intermediateValue10, multiplyAddValue6);
            branchMergedValue2 = min(intermediateValue11, multiplyAddValue6);
        }
        else
        {
            branchMergedValue = intermediateValue10;
            branchMergedValue2 = intermediateValue11;
        }
        intermediateValue17 = branchMergedValue;
        intermediateValue18 = branchMergedValue2;
    }
    else
    {
        uint bitwiseValue4 = bitwiseValue1 | 1u;
        uint bitwiseValue5 = bitwiseValue | 1u;
        float loadedBufferValue10 = min(inputMipTexture.Load(int3(uint2(bitwiseValue, bitwiseValue1), 0u)).x, min(inputMipTexture.Load(int3(uint2(bitwiseValue, bitwiseValue4), 0u)).x, min(inputMipTexture.Load(int3(uint2(bitwiseValue5, bitwiseValue1), 0u)).x, inputMipTexture.Load(int3(uint2(bitwiseValue5, bitwiseValue4), 0u)).x)));
        float loadedBufferValue7;
        if (comparisonValue)
        {
            uint sumValue3 = bitwiseValue + 2u;
            float loadedBufferValue13;
            if (comparisonValue1)
            {
                loadedBufferValue13 = min(loadedBufferValue10, inputMipTexture.Load(int3(uint2(sumValue3, bitwiseValue1 + 2u), 0u)).x);
            }
            else
            {
                loadedBufferValue13 = loadedBufferValue10;
            }
            loadedBufferValue7 = min(loadedBufferValue13, min(inputMipTexture.Load(int3(uint2(sumValue3, bitwiseValue1), 0u)).x, inputMipTexture.Load(int3(uint2(sumValue3, bitwiseValue4), 0u)).x));
        }
        else
        {
            loadedBufferValue7 = loadedBufferValue10;
        }
        float loadedBufferValue11;
        if (comparisonValue1)
        {
            uint sumValue4 = bitwiseValue1 + 2u;
            loadedBufferValue11 = min(loadedBufferValue7, min(inputMipTexture.Load(int3(uint2(bitwiseValue, sumValue4), 0u)).x, inputMipTexture.Load(int3(uint2(bitwiseValue5, sumValue4), 0u)).x));
        }
        else
        {
            loadedBufferValue11 = loadedBufferValue7;
        }
        float loadedBufferValue14 = max(inputMipTexture.Load(int3(uint2(bitwiseValue, bitwiseValue1), 0u)).y, max(inputMipTexture.Load(int3(uint2(bitwiseValue, bitwiseValue4), 0u)).y, max(inputMipTexture.Load(int3(uint2(bitwiseValue5, bitwiseValue1), 0u)).y, inputMipTexture.Load(int3(uint2(bitwiseValue5, bitwiseValue4), 0u)).y)));
        float loadedBufferValue12;
        if (comparisonValue)
        {
            uint sumValue5 = bitwiseValue + 2u;
            float loadedBufferValue15;
            if (comparisonValue1)
            {
                loadedBufferValue15 = min(loadedBufferValue14, inputMipTexture.Load(int3(uint2(sumValue5, bitwiseValue1 + 2u), 0u)).y);
            }
            else
            {
                loadedBufferValue15 = loadedBufferValue14;
            }
            loadedBufferValue12 = min(loadedBufferValue15, min(inputMipTexture.Load(int3(uint2(sumValue5, bitwiseValue1), 0u)).y, inputMipTexture.Load(int3(uint2(sumValue5, bitwiseValue4), 0u)).y));
        }
        else
        {
            loadedBufferValue12 = loadedBufferValue14;
        }
        float branchMergedValue1;
        float branchMergedValue3;
        if (comparisonValue1)
        {
            uint sumValue6 = bitwiseValue1 + 2u;
            branchMergedValue1 = loadedBufferValue11;
            branchMergedValue3 = min(loadedBufferValue12, min(inputMipTexture.Load(int3(uint2(bitwiseValue, sumValue6), 0u)).y, inputMipTexture.Load(int3(uint2(bitwiseValue5, sumValue6), 0u)).y));
        }
        else
        {
            branchMergedValue1 = loadedBufferValue11;
            branchMergedValue3 = loadedBufferValue12;
        }
        intermediateValue17 = branchMergedValue1;
        intermediateValue18 = branchMergedValue3;
    }
    outputMipTexture[uint2(scalarValue, scalarValue1)] = float4(intermediateValue17, intermediateValue18, 0.0f, 0.0f);
#endif
}
[numthreads(8, 8, 1)]
#if RD_PLATFORM == RD_PLATFORM_SM50
void main()
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
void main(ComputeStageInput stage_input)
#endif
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    dispatchThreadId = stage_input.dispatchThreadId;
#endif
    executeComputeStage();
}
