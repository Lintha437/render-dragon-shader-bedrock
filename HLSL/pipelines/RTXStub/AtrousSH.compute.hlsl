// RTXStub / AtrousSH / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 6
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint scalarValue = reinterpretedBits.x;
    bool bitwiseValue = (scalarValue & 16711680u) < 196608u;
    uint bitwiseValue1 = scalarValue >> 16u;
    uint bitwiseValue2 = 1u << (bitwiseValue1 & 31u);
    uint reinterpretedBits1 = ((asuint(rootConstantsConstants[0u]).x >> 8u) & 255u) + 0u;
    uint reinterpretedBits2 = (asuint(rootConstantsConstants[0u]).x >> 8u) & 255u;
    float4 loadedBufferValue = inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
    float scalarValue1 = loadedBufferValue.x;
    if (scalarValue1 == 65504.0f)
    {
        denoisingOutputs[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.x;
        denoisingChromaAndVarianceOutputs[reinterpretedBits2][uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.x;
    }
    else
    {
        uint reinterpretedBits3 = asuint(rootConstantsConstants[0u]).x & 255u;
        uint bitwiseValue3 = (scalarValue & 255u) + 0u;
        uint4 reinterpretedBits4 = asuint(rootConstantsConstants[0u]);
        uint scalarValue2 = reinterpretedBits4.x;
        uint4 loadedBufferValue1 = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
        uint scalarValue3 = loadedBufferValue1.x;
        uint multiplyAddValue = uint(int(mad(scalarValue1, 0.004999999888241291046142578125f, 0.02500000037252902984619140625f) * 1023.0f));
        float4 vectorValue = denoisingOutputs[bitwiseValue3][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue4 = vectorValue.x;
        float scalarValue5 = vectorValue.y;
        float scalarValue6 = vectorValue.z;
        float scalarValue7 = vectorValue.w;
        float4 vectorValue1 = denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue8 = vectorValue1.x;
        float scalarValue9 = vectorValue1.y;
        float scalarValue10 = vectorValue1.w;
        uint bitwiseValue4 = ((scalarValue2 >> 23u) & 2u) + 46u;
        float intermediateValue13;
        uint intermediateValue14;
        float intermediateValue16;
        float intermediateValue17;
        if ((scalarValue2 & 67108864u) == 0u)
        {
            intermediateValue13 = scalarValue10;
            intermediateValue14 = 0u;
            intermediateValue16 = 1.0f;
            intermediateValue17 = viewCbConstants[bitwiseValue4].x;
        }
        else
        {
            float sumValue;
            uint intermediateValue15;
            float intermediateValue18;
            if (scalarValue10 < 0.0f)
            {
                sumValue = (-0.0f) - scalarValue10;
                intermediateValue15 = 1u;
                intermediateValue18 = max(viewCbConstants[bitwiseValue4].x, 4.0f);
            }
            else
            {
                sumValue = scalarValue10;
                intermediateValue15 = 0u;
                intermediateValue18 = viewCbConstants[bitwiseValue4].x;
            }
            intermediateValue13 = sumValue;
            intermediateValue14 = intermediateValue15;
            intermediateValue16 = sqrt(max(1.0000000133514319600180897396058e-10f, sumValue));
            intermediateValue17 = intermediateValue18;
        }
        float productValue = intermediateValue17 * intermediateValue16;
        uint4 reinterpretedBits5 = asuint(viewCbConstants[91u]);
        uint scalarValue11 = reinterpretedBits5.y;
        bool comparisonValue = scalarValue11 != 2u;
        uint loadedBufferValue2;
        if (bitwiseValue && comparisonValue)
        {
            loadedBufferValue2 = uint((uint(inputPrimaryThroughput.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).w) & 15u) == 0u);
        }
        else
        {
            loadedBufferValue2 = 0u;
        }
        bool comparisonValue1 = loadedBufferValue2 == 0u;
        bool comparisonValue2 = scalarValue11 == 2u;
        uint intermediateValue24;
        uint intermediateValue25;
        uint intermediateValue26;
        uint intermediateValue27;
        if (comparisonValue1)
        {
            uint branchMergedValue;
            uint branchMergedValue2;
            uint branchMergedValue3;
            uint branchMergedValue4;
            if (comparisonValue2)
            {
                branchMergedValue = dispatchThreadId.x;
                branchMergedValue2 = uint(int(viewCbConstants[78u].y));
                branchMergedValue3 = uint(int(viewCbConstants[78u].x));
                branchMergedValue4 = 0u;
            }
            else
            {
                uint scalarValue12 = uint(viewCbConstants[80u].x);
                uint scalarValue13 = uint(viewCbConstants[78u].y);
                uint branchMergedValue8;
                uint branchMergedValue10;
                uint branchMergedValue11;
                uint branchMergedValue12;
                if (dispatchThreadId.x < scalarValue12)
                {
                    branchMergedValue8 = dispatchThreadId.x;
                    branchMergedValue10 = scalarValue13;
                    branchMergedValue11 = scalarValue12;
                    branchMergedValue12 = 0u;
                }
                else
                {
                    branchMergedValue8 = dispatchThreadId.x;
                    branchMergedValue10 = scalarValue13;
                    branchMergedValue11 = uint(viewCbConstants[78u].x);
                    branchMergedValue12 = scalarValue12;
                }
                branchMergedValue = branchMergedValue8;
                branchMergedValue2 = branchMergedValue10;
                branchMergedValue3 = branchMergedValue11;
                branchMergedValue4 = branchMergedValue12;
            }
            intermediateValue24 = branchMergedValue4;
            intermediateValue25 = branchMergedValue3;
            intermediateValue26 = branchMergedValue2;
            intermediateValue27 = branchMergedValue;
        }
        else
        {
            uint scalarValue14 = uint(int(viewCbConstants[78u].x));
            uint scalarValue15 = uint(int(viewCbConstants[78u].y));
            uint branchMergedValue1;
            uint branchMergedValue5;
            uint branchMergedValue6;
            uint branchMergedValue7;
            if (comparisonValue2)
            {
                branchMergedValue1 = dispatchThreadId.x;
                branchMergedValue5 = scalarValue15;
                branchMergedValue6 = scalarValue14;
                branchMergedValue7 = 0u;
            }
            else
            {
                uint productValue1 = uint(viewCbConstants[78u].x * 0.5f);
                uint reinterpretedBits6 = (((scalarValue11 == 0u) ? asuint(viewCbConstants[84u]).z : 0u) + dispatchThreadId.y) & 1u;
                uint branchMergedValue9;
                uint branchMergedValue13;
                uint branchMergedValue14;
                uint branchMergedValue15;
                if (dispatchThreadId.x < productValue1)
                {
                    branchMergedValue9 = ((dispatchThreadId.x << 1u) | 1u) - reinterpretedBits6;
                    branchMergedValue13 = scalarValue15;
                    branchMergedValue14 = scalarValue14;
                    branchMergedValue15 = 0u;
                }
                else
                {
                    branchMergedValue9 = reinterpretedBits6 | ((dispatchThreadId.x - productValue1) << 1u);
                    branchMergedValue13 = scalarValue15;
                    branchMergedValue14 = scalarValue14;
                    branchMergedValue15 = 0u;
                }
                branchMergedValue1 = branchMergedValue9;
                branchMergedValue5 = branchMergedValue13;
                branchMergedValue6 = branchMergedValue14;
                branchMergedValue7 = branchMergedValue15;
            }
            intermediateValue24 = branchMergedValue7;
            intermediateValue25 = branchMergedValue6;
            intermediateValue26 = branchMergedValue5;
            intermediateValue27 = branchMergedValue1;
        }
        uint4 reinterpretedBits7 = asuint(viewCbConstants[84u]);
        uint scalarValue16 = reinterpretedBits7.z;
        uint sumValue1 = scalarValue16 + bitwiseValue1;
        float4 loadedBufferValue3 = blueNoiseTexture.Load(int4(uint3(dispatchThreadId.x & 255u, dispatchThreadId.y & 255u, (sumValue1 >> 1u) & 127u), 0u));
        bool comparisonValue3 = (sumValue1 & 1u) == 0u;
        float productValue2 = min(float(int(bitwiseValue2)), 16.0f) * 0.5f;
        uint comparisonValue4 = uint(int(((comparisonValue3 ? loadedBufferValue3.x : loadedBufferValue3.z) + (-0.5f)) * productValue2)) + intermediateValue27;
        uint comparisonValue5 = uint(int(((comparisonValue3 ? loadedBufferValue3.y : loadedBufferValue3.w) + (-0.5f)) * productValue2)) + dispatchThreadId.y;
        uint bitwiseValue5;
        if (comparisonValue && (!bitwiseValue))
        {
            bitwiseValue5 = uint(max(int(1u), int(uint(int(bitwiseValue2) >> int(1u)))));
        }
        else
        {
            bitwiseValue5 = bitwiseValue2;
        }
        uint sumValue2 = comparisonValue4 - bitwiseValue5;
        uint sumValue3 = comparisonValue5 - bitwiseValue2;
        uint intermediateValue29;
        if (comparisonValue1)
        {
            intermediateValue29 = sumValue2;
        }
        else
        {
            intermediateValue29 = ((((sumValue2 ^ sumValue3) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue2 >> 1u);
        }
        bool conditionValue = int(sumValue3) > int(4294967295u);
        bool conditionValue1 = int(sumValue3) < int(intermediateValue26);
        float sumValue4;
        float productValue3;
        float productValue4;
        float productValue5;
        float productValue6;
        float productValue7;
        float productValue8;
        float productValue9;
        if ((conditionValue && (int(intermediateValue29) >= int(intermediateValue24))) && (conditionValue1 && (int(intermediateValue29) < int(intermediateValue25))))
        {
            uint loadedBufferValue4 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue29, sumValue3), 0u))).x - scalarValue3;
            float4 vectorValue2 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue29, sumValue3)].xxxx;
            float scalarValue17 = vectorValue2.w;
            float exponentialValue = exp2((((-0.0f) - abs(scalarValue7 - scalarValue17)) / productValue) * 1.44269502162933349609375f) * ((int(uint(abs(int(loadedBufferValue4)))) <= int(multiplyAddValue)) ? 0.25f : 0.0f);
            float4 vectorValue3 = denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(intermediateValue29, sumValue3)].xxxx;
            float scalarValue18 = vectorValue3.w;
            float sumValue5;
            if (scalarValue18 < 0.0f)
            {
                sumValue5 = min((-0.0f) - scalarValue18, intermediateValue13);
            }
            else
            {
                sumValue5 = scalarValue18;
            }
            sumValue4 = exponentialValue + 1.0f;
            productValue3 = (exponentialValue * vectorValue2.x) + scalarValue4;
            productValue4 = (exponentialValue * vectorValue2.y) + scalarValue5;
            productValue5 = (exponentialValue * vectorValue2.z) + scalarValue6;
            productValue6 = (exponentialValue * scalarValue17) + scalarValue7;
            productValue7 = (vectorValue3.x * exponentialValue) + scalarValue8;
            productValue8 = (vectorValue3.y * exponentialValue) + scalarValue9;
            productValue9 = ((exponentialValue * exponentialValue) * sumValue5) + intermediateValue13;
        }
        else
        {
            sumValue4 = 1.0f;
            productValue3 = scalarValue4;
            productValue4 = scalarValue5;
            productValue5 = scalarValue6;
            productValue6 = scalarValue7;
            productValue7 = scalarValue8;
            productValue8 = scalarValue9;
            productValue9 = intermediateValue13;
        }
        uint intermediateValue36;
        if (comparisonValue1)
        {
            intermediateValue36 = comparisonValue4;
        }
        else
        {
            intermediateValue36 = ((((sumValue3 ^ comparisonValue4) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (comparisonValue4 >> 1u);
        }
        float sumValue6;
        float productValue10;
        float productValue11;
        float productValue12;
        float productValue13;
        float productValue14;
        float productValue15;
        float productValue16;
        if ((conditionValue && (int(intermediateValue36) >= int(intermediateValue24))) && (conditionValue1 && (int(intermediateValue36) < int(intermediateValue25))))
        {
            uint loadedBufferValue5 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue36, sumValue3), 0u))).x - scalarValue3;
            float4 vectorValue4 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue36, sumValue3)].xxxx;
            float scalarValue19 = vectorValue4.w;
            float exponentialValue1 = exp2((((-0.0f) - abs(scalarValue7 - scalarValue19)) / productValue) * 1.44269502162933349609375f) * ((int(uint(abs(int(loadedBufferValue5)))) <= int(multiplyAddValue)) ? 0.5f : 0.0f);
            float4 vectorValue5 = denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(intermediateValue36, sumValue3)].xxxx;
            float scalarValue20 = vectorValue5.w;
            float sumValue8;
            if (scalarValue20 < 0.0f)
            {
                sumValue8 = min((-0.0f) - scalarValue20, intermediateValue13);
            }
            else
            {
                sumValue8 = scalarValue20;
            }
            sumValue6 = exponentialValue1 + sumValue4;
            productValue10 = (exponentialValue1 * vectorValue4.x) + productValue3;
            productValue11 = (exponentialValue1 * vectorValue4.y) + productValue4;
            productValue12 = (exponentialValue1 * vectorValue4.z) + productValue5;
            productValue13 = (exponentialValue1 * scalarValue19) + productValue6;
            productValue14 = (vectorValue5.x * exponentialValue1) + productValue7;
            productValue15 = (vectorValue5.y * exponentialValue1) + productValue8;
            productValue16 = ((exponentialValue1 * exponentialValue1) * sumValue8) + productValue9;
        }
        else
        {
            sumValue6 = sumValue4;
            productValue10 = productValue3;
            productValue11 = productValue4;
            productValue12 = productValue5;
            productValue13 = productValue6;
            productValue14 = productValue7;
            productValue15 = productValue8;
            productValue16 = productValue9;
        }
        uint sumValue7 = bitwiseValue5 + comparisonValue4;
        uint intermediateValue41;
        if (comparisonValue1)
        {
            intermediateValue41 = sumValue7;
        }
        else
        {
            intermediateValue41 = ((((sumValue7 ^ sumValue3) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue7 >> 1u);
        }
        float sumValue9;
        float productValue17;
        float productValue18;
        float productValue19;
        float productValue20;
        float productValue21;
        float productValue22;
        float productValue23;
        if ((conditionValue && (int(intermediateValue41) >= int(intermediateValue24))) && (conditionValue1 && (int(intermediateValue41) < int(intermediateValue25))))
        {
            uint loadedBufferValue6 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue41, sumValue3), 0u))).x - scalarValue3;
            float4 vectorValue6 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue41, sumValue3)].xxxx;
            float scalarValue21 = vectorValue6.w;
            float exponentialValue2 = exp2((((-0.0f) - abs(scalarValue7 - scalarValue21)) / productValue) * 1.44269502162933349609375f) * ((int(uint(abs(int(loadedBufferValue6)))) <= int(multiplyAddValue)) ? 0.25f : 0.0f);
            float4 vectorValue7 = denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(intermediateValue41, sumValue3)].xxxx;
            float scalarValue22 = vectorValue7.w;
            float sumValue10;
            if (scalarValue22 < 0.0f)
            {
                sumValue10 = min((-0.0f) - scalarValue22, intermediateValue13);
            }
            else
            {
                sumValue10 = scalarValue22;
            }
            sumValue9 = exponentialValue2 + sumValue6;
            productValue17 = (exponentialValue2 * vectorValue6.x) + productValue10;
            productValue18 = (exponentialValue2 * vectorValue6.y) + productValue11;
            productValue19 = (exponentialValue2 * vectorValue6.z) + productValue12;
            productValue20 = (exponentialValue2 * scalarValue21) + productValue13;
            productValue21 = (vectorValue7.x * exponentialValue2) + productValue14;
            productValue22 = (vectorValue7.y * exponentialValue2) + productValue15;
            productValue23 = ((exponentialValue2 * exponentialValue2) * sumValue10) + productValue16;
        }
        else
        {
            sumValue9 = sumValue6;
            productValue17 = productValue10;
            productValue18 = productValue11;
            productValue19 = productValue12;
            productValue20 = productValue13;
            productValue21 = productValue14;
            productValue22 = productValue15;
            productValue23 = productValue16;
        }
        uint intermediateValue46;
        if (comparisonValue1)
        {
            intermediateValue46 = sumValue2;
        }
        else
        {
            intermediateValue46 = ((((sumValue2 ^ comparisonValue5) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue2 >> 1u);
        }
        bool conditionValue2 = int(comparisonValue5) > int(4294967295u);
        bool conditionValue3 = int(comparisonValue5) < int(intermediateValue26);
        float sumValue11;
        float productValue24;
        float productValue25;
        float productValue26;
        float productValue27;
        float productValue28;
        float productValue29;
        float productValue30;
        if ((conditionValue2 && (int(intermediateValue46) >= int(intermediateValue24))) && (conditionValue3 && (int(intermediateValue46) < int(intermediateValue25))))
        {
            uint loadedBufferValue7 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue46, comparisonValue5), 0u))).x - scalarValue3;
            float4 vectorValue8 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue46, comparisonValue5)].xxxx;
            float scalarValue23 = vectorValue8.w;
            float exponentialValue3 = exp2((((-0.0f) - abs(scalarValue7 - scalarValue23)) / productValue) * 1.44269502162933349609375f) * ((int(uint(abs(int(loadedBufferValue7)))) <= int(multiplyAddValue)) ? 0.5f : 0.0f);
            float4 vectorValue9 = denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(intermediateValue46, comparisonValue5)].xxxx;
            float scalarValue24 = vectorValue9.w;
            float sumValue12;
            if (scalarValue24 < 0.0f)
            {
                sumValue12 = min((-0.0f) - scalarValue24, intermediateValue13);
            }
            else
            {
                sumValue12 = scalarValue24;
            }
            sumValue11 = exponentialValue3 + sumValue9;
            productValue24 = (exponentialValue3 * vectorValue8.x) + productValue17;
            productValue25 = (exponentialValue3 * vectorValue8.y) + productValue18;
            productValue26 = (exponentialValue3 * vectorValue8.z) + productValue19;
            productValue27 = (exponentialValue3 * scalarValue23) + productValue20;
            productValue28 = (vectorValue9.x * exponentialValue3) + productValue21;
            productValue29 = (vectorValue9.y * exponentialValue3) + productValue22;
            productValue30 = ((exponentialValue3 * exponentialValue3) * sumValue12) + productValue23;
        }
        else
        {
            sumValue11 = sumValue9;
            productValue24 = productValue17;
            productValue25 = productValue18;
            productValue26 = productValue19;
            productValue27 = productValue20;
            productValue28 = productValue21;
            productValue29 = productValue22;
            productValue30 = productValue23;
        }
        uint intermediateValue53;
        if (comparisonValue1)
        {
            intermediateValue53 = sumValue7;
        }
        else
        {
            intermediateValue53 = ((((sumValue7 ^ comparisonValue5) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue7 >> 1u);
        }
        float sumValue13;
        float productValue31;
        float productValue32;
        float productValue33;
        float productValue34;
        float productValue35;
        float productValue36;
        float productValue37;
        if ((conditionValue2 && (int(intermediateValue53) >= int(intermediateValue24))) && (conditionValue3 && (int(intermediateValue53) < int(intermediateValue25))))
        {
            uint loadedBufferValue8 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue53, comparisonValue5), 0u))).x - scalarValue3;
            float4 vectorValue10 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue53, comparisonValue5)].xxxx;
            float scalarValue25 = vectorValue10.w;
            float exponentialValue4 = exp2((((-0.0f) - abs(scalarValue7 - scalarValue25)) / productValue) * 1.44269502162933349609375f) * ((int(uint(abs(int(loadedBufferValue8)))) <= int(multiplyAddValue)) ? 0.5f : 0.0f);
            float4 vectorValue11 = denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(intermediateValue53, comparisonValue5)].xxxx;
            float scalarValue26 = vectorValue11.w;
            float sumValue15;
            if (scalarValue26 < 0.0f)
            {
                sumValue15 = min((-0.0f) - scalarValue26, intermediateValue13);
            }
            else
            {
                sumValue15 = scalarValue26;
            }
            sumValue13 = exponentialValue4 + sumValue11;
            productValue31 = (exponentialValue4 * vectorValue10.x) + productValue24;
            productValue32 = (exponentialValue4 * vectorValue10.y) + productValue25;
            productValue33 = (exponentialValue4 * vectorValue10.z) + productValue26;
            productValue34 = (exponentialValue4 * scalarValue25) + productValue27;
            productValue35 = (vectorValue11.x * exponentialValue4) + productValue28;
            productValue36 = (vectorValue11.y * exponentialValue4) + productValue29;
            productValue37 = ((exponentialValue4 * exponentialValue4) * sumValue15) + productValue30;
        }
        else
        {
            sumValue13 = sumValue11;
            productValue31 = productValue24;
            productValue32 = productValue25;
            productValue33 = productValue26;
            productValue34 = productValue27;
            productValue35 = productValue28;
            productValue36 = productValue29;
            productValue37 = productValue30;
        }
        uint sumValue14 = comparisonValue5 + bitwiseValue2;
        uint intermediateValue58;
        if (comparisonValue1)
        {
            intermediateValue58 = sumValue2;
        }
        else
        {
            intermediateValue58 = ((((sumValue2 ^ sumValue14) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue2 >> 1u);
        }
        bool conditionValue4 = int(sumValue14) > int(4294967295u);
        bool conditionValue5 = int(sumValue14) < int(intermediateValue26);
        float sumValue16;
        float productValue38;
        float productValue39;
        float productValue40;
        float productValue41;
        float productValue42;
        float productValue43;
        float productValue44;
        if ((conditionValue4 && (int(intermediateValue58) >= int(intermediateValue24))) && (conditionValue5 && (int(intermediateValue58) < int(intermediateValue25))))
        {
            uint loadedBufferValue9 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue58, sumValue14), 0u))).x - scalarValue3;
            float4 vectorValue12 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue58, sumValue14)].xxxx;
            float scalarValue27 = vectorValue12.w;
            float exponentialValue5 = exp2((((-0.0f) - abs(scalarValue7 - scalarValue27)) / productValue) * 1.44269502162933349609375f) * ((int(uint(abs(int(loadedBufferValue9)))) <= int(multiplyAddValue)) ? 0.25f : 0.0f);
            float4 vectorValue13 = denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(intermediateValue58, sumValue14)].xxxx;
            float scalarValue28 = vectorValue13.w;
            float sumValue17;
            if (scalarValue28 < 0.0f)
            {
                sumValue17 = min((-0.0f) - scalarValue28, intermediateValue13);
            }
            else
            {
                sumValue17 = scalarValue28;
            }
            sumValue16 = exponentialValue5 + sumValue13;
            productValue38 = (exponentialValue5 * vectorValue12.x) + productValue31;
            productValue39 = (exponentialValue5 * vectorValue12.y) + productValue32;
            productValue40 = (exponentialValue5 * vectorValue12.z) + productValue33;
            productValue41 = (exponentialValue5 * scalarValue27) + productValue34;
            productValue42 = (vectorValue13.x * exponentialValue5) + productValue35;
            productValue43 = (vectorValue13.y * exponentialValue5) + productValue36;
            productValue44 = ((exponentialValue5 * exponentialValue5) * sumValue17) + productValue37;
        }
        else
        {
            sumValue16 = sumValue13;
            productValue38 = productValue31;
            productValue39 = productValue32;
            productValue40 = productValue33;
            productValue41 = productValue34;
            productValue42 = productValue35;
            productValue43 = productValue36;
            productValue44 = productValue37;
        }
        uint intermediateValue65;
        if (comparisonValue1)
        {
            intermediateValue65 = comparisonValue4;
        }
        else
        {
            intermediateValue65 = ((((sumValue14 ^ comparisonValue4) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (comparisonValue4 >> 1u);
        }
        float sumValue18;
        float productValue45;
        float productValue46;
        float productValue47;
        float productValue48;
        float productValue49;
        float productValue50;
        float productValue51;
        if ((conditionValue4 && (int(intermediateValue65) >= int(intermediateValue24))) && (conditionValue5 && (int(intermediateValue65) < int(intermediateValue25))))
        {
            uint loadedBufferValue10 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue65, sumValue14), 0u))).x - scalarValue3;
            float4 vectorValue14 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue65, sumValue14)].xxxx;
            float scalarValue29 = vectorValue14.w;
            float exponentialValue6 = exp2((((-0.0f) - abs(scalarValue7 - scalarValue29)) / productValue) * 1.44269502162933349609375f) * ((int(uint(abs(int(loadedBufferValue10)))) <= int(multiplyAddValue)) ? 0.5f : 0.0f);
            float4 vectorValue15 = denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(intermediateValue65, sumValue14)].xxxx;
            float scalarValue30 = vectorValue15.w;
            float sumValue19;
            if (scalarValue30 < 0.0f)
            {
                sumValue19 = min((-0.0f) - scalarValue30, intermediateValue13);
            }
            else
            {
                sumValue19 = scalarValue30;
            }
            sumValue18 = exponentialValue6 + sumValue16;
            productValue45 = (exponentialValue6 * vectorValue14.x) + productValue38;
            productValue46 = (exponentialValue6 * vectorValue14.y) + productValue39;
            productValue47 = (exponentialValue6 * vectorValue14.z) + productValue40;
            productValue48 = (exponentialValue6 * scalarValue29) + productValue41;
            productValue49 = (vectorValue15.x * exponentialValue6) + productValue42;
            productValue50 = (vectorValue15.y * exponentialValue6) + productValue43;
            productValue51 = ((exponentialValue6 * exponentialValue6) * sumValue19) + productValue44;
        }
        else
        {
            sumValue18 = sumValue16;
            productValue45 = productValue38;
            productValue46 = productValue39;
            productValue47 = productValue40;
            productValue48 = productValue41;
            productValue49 = productValue42;
            productValue50 = productValue43;
            productValue51 = productValue44;
        }
        uint intermediateValue70;
        if (comparisonValue1)
        {
            intermediateValue70 = sumValue7;
        }
        else
        {
            intermediateValue70 = ((((sumValue7 ^ sumValue14) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue7 >> 1u);
        }
        float sumValue20;
        float productValue52;
        float productValue53;
        float productValue54;
        float productValue55;
        float productValue56;
        float productValue57;
        float productValue58;
        if ((conditionValue4 && (int(intermediateValue70) >= int(intermediateValue24))) && (conditionValue5 && (int(intermediateValue70) < int(intermediateValue25))))
        {
            uint loadedBufferValue11 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue70, sumValue14), 0u))).x - scalarValue3;
            float4 vectorValue16 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue70, sumValue14)].xxxx;
            float scalarValue31 = vectorValue16.w;
            float exponentialValue7 = exp2((((-0.0f) - abs(scalarValue7 - scalarValue31)) / productValue) * 1.44269502162933349609375f) * ((int(uint(abs(int(loadedBufferValue11)))) <= int(multiplyAddValue)) ? 0.25f : 0.0f);
            float4 vectorValue17 = denoisingChromaAndVarianceOutputs[reinterpretedBits3][uint2(intermediateValue70, sumValue14)].xxxx;
            float scalarValue32 = vectorValue17.w;
            float sumValue21;
            if (scalarValue32 < 0.0f)
            {
                sumValue21 = min((-0.0f) - scalarValue32, intermediateValue13);
            }
            else
            {
                sumValue21 = scalarValue32;
            }
            sumValue20 = exponentialValue7 + sumValue18;
            productValue52 = (exponentialValue7 * vectorValue16.x) + productValue45;
            productValue53 = (exponentialValue7 * vectorValue16.y) + productValue46;
            productValue54 = (exponentialValue7 * vectorValue16.z) + productValue47;
            productValue55 = (exponentialValue7 * scalarValue31) + productValue48;
            productValue56 = (vectorValue17.x * exponentialValue7) + productValue49;
            productValue57 = (vectorValue17.y * exponentialValue7) + productValue50;
            productValue58 = ((exponentialValue7 * exponentialValue7) * sumValue21) + productValue51;
        }
        else
        {
            sumValue20 = sumValue18;
            productValue52 = productValue45;
            productValue53 = productValue46;
            productValue54 = productValue47;
            productValue55 = productValue48;
            productValue56 = productValue49;
            productValue57 = productValue50;
            productValue58 = productValue51;
        }
        float quotientValue = productValue58 / (sumValue20 * sumValue20);
        float comparisonValue6 = (intermediateValue14 != 0u) ? ((-0.0f) - quotientValue) : quotientValue;
        float quotientValue1 = productValue52 / sumValue20;
        float quotientValue2 = productValue53 / sumValue20;
        float quotientValue3 = productValue54 / sumValue20;
        float quotientValue4 = productValue55 / sumValue20;
        float quotientValue5 = productValue56 / sumValue20;
        float quotientValue6 = productValue57 / sumValue20;
        uint reinterpretedBits8 = asuint(quotientValue1) & 2147483647u;
        uint reinterpretedBits9 = asuint(quotientValue2) & 2147483647u;
        uint reinterpretedBits10 = asuint(quotientValue3) & 2147483647u;
        uint reinterpretedBits11 = asuint(quotientValue4) & 2147483647u;
        if (!(((((reinterpretedBits8 > 2139095040u) || (reinterpretedBits9 > 2139095040u)) || (reinterpretedBits10 > 2139095040u)) || (reinterpretedBits11 > 2139095040u)) || ((((reinterpretedBits8 == 2139095040u) || (reinterpretedBits9 == 2139095040u)) || (reinterpretedBits10 == 2139095040u)) || (reinterpretedBits11 == 2139095040u))))
        {
            denoisingOutputs[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(quotientValue1, quotientValue2, quotientValue3, quotientValue4).x;
        }
        uint reinterpretedBits12 = asuint(quotientValue5) & 2147483647u;
        uint reinterpretedBits13 = asuint(quotientValue6) & 2147483647u;
        uint reinterpretedBits14 = asuint(comparisonValue6) & 2147483647u;
        if (!(((reinterpretedBits14 > 2139095040u) || ((reinterpretedBits12 > 2139095040u) || (reinterpretedBits13 > 2139095040u))) || ((reinterpretedBits14 == 2139095040u) || ((reinterpretedBits12 == 2139095040u) || (reinterpretedBits13 == 2139095040u)))))
        {
            denoisingChromaAndVarianceOutputs[reinterpretedBits2][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(quotientValue5, quotientValue6, 0.0f, comparisonValue6).x;
        }
    }
}
[numthreads(16, 8, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
