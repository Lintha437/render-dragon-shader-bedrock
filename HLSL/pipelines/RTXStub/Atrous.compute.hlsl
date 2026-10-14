// RTXStub / Atrous / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
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
    uint4 reinterpretedBits2 = asuint(rootConstantsConstants[0u]);
    uint scalarValue1 = reinterpretedBits2.x;
    float4 loadedBufferValue = inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
    float scalarValue2 = loadedBufferValue.x;
    if (scalarValue2 == 65504.0f)
    {
        denoisingOutputs[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.x;
    }
    else
    {
        uint bitwiseValue3 = (scalarValue & 255u) + 0u;
        float4 loadedBufferValue1 = inputBufferNormal.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
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
        uint4 loadedBufferValue2 = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
        uint scalarValue6 = loadedBufferValue2.x;
        uint multiplyAddValue = uint(int(mad(scalarValue2, 0.004999999888241291046142578125f, 0.02500000037252902984619140625f) * 1023.0f));
        float4 vectorValue = denoisingOutputs[bitwiseValue3][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue7 = vectorValue.x;
        float scalarValue8 = vectorValue.y;
        float scalarValue9 = vectorValue.z;
        float scalarValue10 = vectorValue.w;
        float dotProductValue = dot(float3(scalarValue7, scalarValue8, scalarValue9), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
        uint bitwiseValue4 = ((scalarValue1 >> 23u) & 2u) + 46u;
        float intermediateValue13;
        uint intermediateValue14;
        float intermediateValue16;
        float intermediateValue17;
        if ((scalarValue1 & 67108864u) == 0u)
        {
            intermediateValue13 = scalarValue10;
            intermediateValue14 = 0u;
            intermediateValue16 = 1.0f;
            intermediateValue17 = viewCbConstants[bitwiseValue4].x;
        }
        else
        {
            float sumValue2;
            uint intermediateValue15;
            float intermediateValue18;
            if (scalarValue10 < 0.0f)
            {
                sumValue2 = (-0.0f) - scalarValue10;
                intermediateValue15 = 1u;
                intermediateValue18 = max(viewCbConstants[bitwiseValue4].x, 4.0f);
            }
            else
            {
                sumValue2 = scalarValue10;
                intermediateValue15 = 0u;
                intermediateValue18 = viewCbConstants[bitwiseValue4].x;
            }
            intermediateValue13 = sumValue2;
            intermediateValue14 = intermediateValue15;
            intermediateValue16 = sqrt(max(1.0000000133514319600180897396058e-10f, sumValue2));
            intermediateValue17 = intermediateValue18;
        }
        float productValue3 = intermediateValue17 * intermediateValue16;
        float productValue4 = max(min((outputBufferHistoryLength[uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx.x * 25.5f) + (-1.0f), 1.0f) * viewCbConstants[bitwiseValue4].z, 4.0f);
        uint4 reinterpretedBits3 = asuint(viewCbConstants[91u]);
        uint scalarValue11 = reinterpretedBits3.y;
        bool comparisonValue2 = scalarValue11 != 2u;
        uint loadedBufferValue3;
        if (bitwiseValue && comparisonValue2)
        {
            loadedBufferValue3 = uint((uint(inputPrimaryThroughput.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).w) & 15u) == 0u);
        }
        else
        {
            loadedBufferValue3 = 0u;
        }
        bool comparisonValue3 = loadedBufferValue3 == 0u;
        bool comparisonValue4 = scalarValue11 == 2u;
        uint intermediateValue24;
        uint intermediateValue25;
        uint intermediateValue26;
        uint intermediateValue27;
        if (comparisonValue3)
        {
            uint branchMergedValue;
            uint branchMergedValue2;
            uint branchMergedValue3;
            uint branchMergedValue4;
            if (comparisonValue4)
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
            if (comparisonValue4)
            {
                branchMergedValue1 = dispatchThreadId.x;
                branchMergedValue5 = scalarValue15;
                branchMergedValue6 = scalarValue14;
                branchMergedValue7 = 0u;
            }
            else
            {
                uint productValue5 = uint(viewCbConstants[78u].x * 0.5f);
                uint reinterpretedBits4 = (((scalarValue11 == 0u) ? asuint(viewCbConstants[84u]).z : 0u) + dispatchThreadId.y) & 1u;
                uint branchMergedValue9;
                uint branchMergedValue13;
                uint branchMergedValue14;
                uint branchMergedValue15;
                if (dispatchThreadId.x < productValue5)
                {
                    branchMergedValue9 = ((dispatchThreadId.x << 1u) | 1u) - reinterpretedBits4;
                    branchMergedValue13 = scalarValue15;
                    branchMergedValue14 = scalarValue14;
                    branchMergedValue15 = 0u;
                }
                else
                {
                    branchMergedValue9 = reinterpretedBits4 | ((dispatchThreadId.x - productValue5) << 1u);
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
        uint4 reinterpretedBits5 = asuint(viewCbConstants[84u]);
        uint scalarValue16 = reinterpretedBits5.z;
        uint sumValue3 = scalarValue16 + bitwiseValue1;
        float4 loadedBufferValue4 = blueNoiseTexture.Load(int4(uint3(dispatchThreadId.x & 255u, dispatchThreadId.y & 255u, (sumValue3 >> 1u) & 127u), 0u));
        bool comparisonValue5 = (sumValue3 & 1u) == 0u;
        float productValue6 = min(float(int(bitwiseValue2)), 16.0f) * 0.5f;
        uint comparisonValue6 = uint(int(((comparisonValue5 ? loadedBufferValue4.x : loadedBufferValue4.z) + (-0.5f)) * productValue6)) + intermediateValue27;
        uint comparisonValue7 = uint(int(((comparisonValue5 ? loadedBufferValue4.y : loadedBufferValue4.w) + (-0.5f)) * productValue6)) + dispatchThreadId.y;
        uint bitwiseValue5;
        if (comparisonValue2 && (!bitwiseValue))
        {
            bitwiseValue5 = uint(max(int(1u), int(uint(int(bitwiseValue2) >> int(1u)))));
        }
        else
        {
            bitwiseValue5 = bitwiseValue2;
        }
        uint sumValue4 = comparisonValue6 - bitwiseValue5;
        uint sumValue5 = comparisonValue7 - bitwiseValue2;
        uint intermediateValue29;
        if (comparisonValue3)
        {
            intermediateValue29 = sumValue4;
        }
        else
        {
            intermediateValue29 = ((((sumValue4 ^ sumValue5) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue4 >> 1u);
        }
        bool conditionValue1 = int(sumValue5) > int(4294967295u);
        bool conditionValue2 = int(sumValue5) < int(intermediateValue26);
        float sumValue8;
        float productValue7;
        float productValue8;
        float productValue9;
        float productValue10;
        if ((conditionValue1 && (int(intermediateValue29) >= int(intermediateValue24))) && (conditionValue2 && (int(intermediateValue29) < int(intermediateValue25))))
        {
            uint loadedBufferValue5 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue29, sumValue5), 0u))).x - scalarValue6;
            float4 loadedBufferValue6 = inputBufferNormal.Load(int3(uint2(intermediateValue29, sumValue5), 0u));
            float scalarValue17 = loadedBufferValue6.x;
            float scalarValue18 = loadedBufferValue6.y;
            float sumValue6 = 1.0f - abs(scalarValue17);
            float scalarValue19 = abs(scalarValue18);
            float sumValue7 = sumValue6 - scalarValue19;
            bool conditionValue3 = sumValue7 < 0.0f;
            float comparisonValue8 = conditionValue3 ? ((1.0f - scalarValue19) * ((scalarValue17 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue17;
            float comparisonValue9 = conditionValue3 ? (((scalarValue18 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue6) : scalarValue18;
            float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue8, comparisonValue9, sumValue7), float3(comparisonValue8, comparisonValue9, sumValue7)));
            float4 vectorValue1 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue29, sumValue5)].xxxx;
            float scalarValue20 = vectorValue1.x;
            float scalarValue21 = vectorValue1.w;
            float clampedValue = (exp2(log2(clamp(dot(float3(productValue, productValue1, productValue2), float3(comparisonValue8 * inverseLengthValue1, comparisonValue9 * inverseLengthValue1, inverseLengthValue1 * sumValue7)), 0.0f, 1.0f)) * productValue4) * ((int(uint(abs(int(loadedBufferValue5)))) <= int(multiplyAddValue)) ? 0.25f : 0.0f)) * exp2((((-0.0f) - abs(dotProductValue - dot(float3(scalarValue20, vectorValue1.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)))) / productValue3) * 1.44269502162933349609375f);
            float sumValue9;
            if (scalarValue21 < 0.0f)
            {
                sumValue9 = min((-0.0f) - scalarValue21, intermediateValue13);
            }
            else
            {
                sumValue9 = scalarValue21;
            }
            sumValue8 = clampedValue + 1.0f;
            productValue7 = (clampedValue * scalarValue20) + scalarValue7;
            productValue8 = (clampedValue * vectorValue1.y) + scalarValue8;
            productValue9 = (clampedValue * vectorValue1.z) + scalarValue9;
            productValue10 = ((clampedValue * clampedValue) * sumValue9) + intermediateValue13;
        }
        else
        {
            sumValue8 = 1.0f;
            productValue7 = scalarValue7;
            productValue8 = scalarValue8;
            productValue9 = scalarValue9;
            productValue10 = intermediateValue13;
        }
        uint intermediateValue39;
        if (comparisonValue3)
        {
            intermediateValue39 = comparisonValue6;
        }
        else
        {
            intermediateValue39 = ((((sumValue5 ^ comparisonValue6) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (comparisonValue6 >> 1u);
        }
        float sumValue12;
        float productValue11;
        float productValue12;
        float productValue13;
        float productValue14;
        if ((conditionValue1 && (int(intermediateValue39) >= int(intermediateValue24))) && (conditionValue2 && (int(intermediateValue39) < int(intermediateValue25))))
        {
            uint loadedBufferValue7 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue39, sumValue5), 0u))).x - scalarValue6;
            float4 loadedBufferValue8 = inputBufferNormal.Load(int3(uint2(intermediateValue39, sumValue5), 0u));
            float scalarValue22 = loadedBufferValue8.x;
            float scalarValue23 = loadedBufferValue8.y;
            float sumValue10 = 1.0f - abs(scalarValue22);
            float scalarValue24 = abs(scalarValue23);
            float sumValue11 = sumValue10 - scalarValue24;
            bool conditionValue4 = sumValue11 < 0.0f;
            float comparisonValue10 = conditionValue4 ? ((1.0f - scalarValue24) * ((scalarValue22 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue22;
            float comparisonValue11 = conditionValue4 ? (((scalarValue23 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue10) : scalarValue23;
            float inverseLengthValue2 = rsqrt(dot(float3(comparisonValue10, comparisonValue11, sumValue11), float3(comparisonValue10, comparisonValue11, sumValue11)));
            float4 vectorValue2 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue39, sumValue5)].xxxx;
            float scalarValue25 = vectorValue2.x;
            float scalarValue26 = vectorValue2.w;
            float clampedValue1 = (exp2(log2(clamp(dot(float3(productValue, productValue1, productValue2), float3(comparisonValue10 * inverseLengthValue2, comparisonValue11 * inverseLengthValue2, inverseLengthValue2 * sumValue11)), 0.0f, 1.0f)) * productValue4) * ((int(uint(abs(int(loadedBufferValue7)))) <= int(multiplyAddValue)) ? 0.5f : 0.0f)) * exp2((((-0.0f) - abs(dotProductValue - dot(float3(scalarValue25, vectorValue2.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)))) / productValue3) * 1.44269502162933349609375f);
            float sumValue14;
            if (scalarValue26 < 0.0f)
            {
                sumValue14 = min((-0.0f) - scalarValue26, intermediateValue13);
            }
            else
            {
                sumValue14 = scalarValue26;
            }
            sumValue12 = clampedValue1 + sumValue8;
            productValue11 = (clampedValue1 * scalarValue25) + productValue7;
            productValue12 = (clampedValue1 * vectorValue2.y) + productValue8;
            productValue13 = (clampedValue1 * vectorValue2.z) + productValue9;
            productValue14 = ((clampedValue1 * clampedValue1) * sumValue14) + productValue10;
        }
        else
        {
            sumValue12 = sumValue8;
            productValue11 = productValue7;
            productValue12 = productValue8;
            productValue13 = productValue9;
            productValue14 = productValue10;
        }
        uint sumValue13 = bitwiseValue5 + comparisonValue6;
        uint intermediateValue47;
        if (comparisonValue3)
        {
            intermediateValue47 = sumValue13;
        }
        else
        {
            intermediateValue47 = ((((sumValue13 ^ sumValue5) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue13 >> 1u);
        }
        float sumValue17;
        float productValue15;
        float productValue16;
        float productValue17;
        float productValue18;
        if ((conditionValue1 && (int(intermediateValue47) >= int(intermediateValue24))) && (conditionValue2 && (int(intermediateValue47) < int(intermediateValue25))))
        {
            uint loadedBufferValue9 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue47, sumValue5), 0u))).x - scalarValue6;
            float4 loadedBufferValue10 = inputBufferNormal.Load(int3(uint2(intermediateValue47, sumValue5), 0u));
            float scalarValue27 = loadedBufferValue10.x;
            float scalarValue28 = loadedBufferValue10.y;
            float sumValue15 = 1.0f - abs(scalarValue27);
            float scalarValue29 = abs(scalarValue28);
            float sumValue16 = sumValue15 - scalarValue29;
            bool conditionValue5 = sumValue16 < 0.0f;
            float comparisonValue12 = conditionValue5 ? ((1.0f - scalarValue29) * ((scalarValue27 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue27;
            float comparisonValue13 = conditionValue5 ? (((scalarValue28 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue15) : scalarValue28;
            float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue12, comparisonValue13, sumValue16), float3(comparisonValue12, comparisonValue13, sumValue16)));
            float4 vectorValue3 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue47, sumValue5)].xxxx;
            float scalarValue30 = vectorValue3.x;
            float scalarValue31 = vectorValue3.w;
            float clampedValue2 = (exp2(log2(clamp(dot(float3(productValue, productValue1, productValue2), float3(comparisonValue12 * inverseLengthValue3, comparisonValue13 * inverseLengthValue3, inverseLengthValue3 * sumValue16)), 0.0f, 1.0f)) * productValue4) * ((int(uint(abs(int(loadedBufferValue9)))) <= int(multiplyAddValue)) ? 0.25f : 0.0f)) * exp2((((-0.0f) - abs(dotProductValue - dot(float3(scalarValue30, vectorValue3.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)))) / productValue3) * 1.44269502162933349609375f);
            float sumValue18;
            if (scalarValue31 < 0.0f)
            {
                sumValue18 = min((-0.0f) - scalarValue31, intermediateValue13);
            }
            else
            {
                sumValue18 = scalarValue31;
            }
            sumValue17 = clampedValue2 + sumValue12;
            productValue15 = (clampedValue2 * scalarValue30) + productValue11;
            productValue16 = (clampedValue2 * vectorValue3.y) + productValue12;
            productValue17 = (clampedValue2 * vectorValue3.z) + productValue13;
            productValue18 = ((clampedValue2 * clampedValue2) * sumValue18) + productValue14;
        }
        else
        {
            sumValue17 = sumValue12;
            productValue15 = productValue11;
            productValue16 = productValue12;
            productValue17 = productValue13;
            productValue18 = productValue14;
        }
        uint intermediateValue55;
        if (comparisonValue3)
        {
            intermediateValue55 = sumValue4;
        }
        else
        {
            intermediateValue55 = ((((sumValue4 ^ comparisonValue7) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue4 >> 1u);
        }
        bool conditionValue6 = int(comparisonValue7) > int(4294967295u);
        bool conditionValue7 = int(comparisonValue7) < int(intermediateValue26);
        float sumValue21;
        float productValue19;
        float productValue20;
        float productValue21;
        float productValue22;
        if ((conditionValue6 && (int(intermediateValue55) >= int(intermediateValue24))) && (conditionValue7 && (int(intermediateValue55) < int(intermediateValue25))))
        {
            uint loadedBufferValue11 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue55, comparisonValue7), 0u))).x - scalarValue6;
            float4 loadedBufferValue12 = inputBufferNormal.Load(int3(uint2(intermediateValue55, comparisonValue7), 0u));
            float scalarValue32 = loadedBufferValue12.x;
            float scalarValue33 = loadedBufferValue12.y;
            float sumValue19 = 1.0f - abs(scalarValue32);
            float scalarValue34 = abs(scalarValue33);
            float sumValue20 = sumValue19 - scalarValue34;
            bool conditionValue8 = sumValue20 < 0.0f;
            float comparisonValue14 = conditionValue8 ? ((1.0f - scalarValue34) * ((scalarValue32 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue32;
            float comparisonValue15 = conditionValue8 ? (((scalarValue33 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue19) : scalarValue33;
            float inverseLengthValue4 = rsqrt(dot(float3(comparisonValue14, comparisonValue15, sumValue20), float3(comparisonValue14, comparisonValue15, sumValue20)));
            float4 vectorValue4 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue55, comparisonValue7)].xxxx;
            float scalarValue35 = vectorValue4.x;
            float scalarValue36 = vectorValue4.w;
            float clampedValue3 = (exp2(log2(clamp(dot(float3(productValue, productValue1, productValue2), float3(comparisonValue14 * inverseLengthValue4, comparisonValue15 * inverseLengthValue4, inverseLengthValue4 * sumValue20)), 0.0f, 1.0f)) * productValue4) * ((int(uint(abs(int(loadedBufferValue11)))) <= int(multiplyAddValue)) ? 0.5f : 0.0f)) * exp2((((-0.0f) - abs(dotProductValue - dot(float3(scalarValue35, vectorValue4.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)))) / productValue3) * 1.44269502162933349609375f);
            float sumValue22;
            if (scalarValue36 < 0.0f)
            {
                sumValue22 = min((-0.0f) - scalarValue36, intermediateValue13);
            }
            else
            {
                sumValue22 = scalarValue36;
            }
            sumValue21 = clampedValue3 + sumValue17;
            productValue19 = (clampedValue3 * scalarValue35) + productValue15;
            productValue20 = (clampedValue3 * vectorValue4.y) + productValue16;
            productValue21 = (clampedValue3 * vectorValue4.z) + productValue17;
            productValue22 = ((clampedValue3 * clampedValue3) * sumValue22) + productValue18;
        }
        else
        {
            sumValue21 = sumValue17;
            productValue19 = productValue15;
            productValue20 = productValue16;
            productValue21 = productValue17;
            productValue22 = productValue18;
        }
        uint intermediateValue65;
        if (comparisonValue3)
        {
            intermediateValue65 = sumValue13;
        }
        else
        {
            intermediateValue65 = ((((sumValue13 ^ comparisonValue7) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue13 >> 1u);
        }
        float sumValue25;
        float productValue23;
        float productValue24;
        float productValue25;
        float productValue26;
        if ((conditionValue6 && (int(intermediateValue65) >= int(intermediateValue24))) && (conditionValue7 && (int(intermediateValue65) < int(intermediateValue25))))
        {
            uint loadedBufferValue13 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue65, comparisonValue7), 0u))).x - scalarValue6;
            float4 loadedBufferValue14 = inputBufferNormal.Load(int3(uint2(intermediateValue65, comparisonValue7), 0u));
            float scalarValue37 = loadedBufferValue14.x;
            float scalarValue38 = loadedBufferValue14.y;
            float sumValue23 = 1.0f - abs(scalarValue37);
            float scalarValue39 = abs(scalarValue38);
            float sumValue24 = sumValue23 - scalarValue39;
            bool conditionValue9 = sumValue24 < 0.0f;
            float comparisonValue16 = conditionValue9 ? ((1.0f - scalarValue39) * ((scalarValue37 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue37;
            float comparisonValue17 = conditionValue9 ? (((scalarValue38 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue23) : scalarValue38;
            float inverseLengthValue5 = rsqrt(dot(float3(comparisonValue16, comparisonValue17, sumValue24), float3(comparisonValue16, comparisonValue17, sumValue24)));
            float4 vectorValue5 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue65, comparisonValue7)].xxxx;
            float scalarValue40 = vectorValue5.x;
            float scalarValue41 = vectorValue5.w;
            float clampedValue4 = (exp2(log2(clamp(dot(float3(productValue, productValue1, productValue2), float3(comparisonValue16 * inverseLengthValue5, comparisonValue17 * inverseLengthValue5, inverseLengthValue5 * sumValue24)), 0.0f, 1.0f)) * productValue4) * ((int(uint(abs(int(loadedBufferValue13)))) <= int(multiplyAddValue)) ? 0.5f : 0.0f)) * exp2((((-0.0f) - abs(dotProductValue - dot(float3(scalarValue40, vectorValue5.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)))) / productValue3) * 1.44269502162933349609375f);
            float sumValue27;
            if (scalarValue41 < 0.0f)
            {
                sumValue27 = min((-0.0f) - scalarValue41, intermediateValue13);
            }
            else
            {
                sumValue27 = scalarValue41;
            }
            sumValue25 = clampedValue4 + sumValue21;
            productValue23 = (clampedValue4 * scalarValue40) + productValue19;
            productValue24 = (clampedValue4 * vectorValue5.y) + productValue20;
            productValue25 = (clampedValue4 * vectorValue5.z) + productValue21;
            productValue26 = ((clampedValue4 * clampedValue4) * sumValue27) + productValue22;
        }
        else
        {
            sumValue25 = sumValue21;
            productValue23 = productValue19;
            productValue24 = productValue20;
            productValue25 = productValue21;
            productValue26 = productValue22;
        }
        uint sumValue26 = comparisonValue7 + bitwiseValue2;
        uint intermediateValue73;
        if (comparisonValue3)
        {
            intermediateValue73 = sumValue4;
        }
        else
        {
            intermediateValue73 = ((((sumValue4 ^ sumValue26) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue4 >> 1u);
        }
        bool conditionValue10 = int(sumValue26) > int(4294967295u);
        bool conditionValue11 = int(sumValue26) < int(intermediateValue26);
        float sumValue30;
        float productValue27;
        float productValue28;
        float productValue29;
        float productValue30;
        if ((conditionValue10 && (int(intermediateValue73) >= int(intermediateValue24))) && (conditionValue11 && (int(intermediateValue73) < int(intermediateValue25))))
        {
            uint loadedBufferValue15 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue73, sumValue26), 0u))).x - scalarValue6;
            float4 loadedBufferValue16 = inputBufferNormal.Load(int3(uint2(intermediateValue73, sumValue26), 0u));
            float scalarValue42 = loadedBufferValue16.x;
            float scalarValue43 = loadedBufferValue16.y;
            float sumValue28 = 1.0f - abs(scalarValue42);
            float scalarValue44 = abs(scalarValue43);
            float sumValue29 = sumValue28 - scalarValue44;
            bool conditionValue12 = sumValue29 < 0.0f;
            float comparisonValue18 = conditionValue12 ? ((1.0f - scalarValue44) * ((scalarValue42 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue42;
            float comparisonValue19 = conditionValue12 ? (((scalarValue43 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue28) : scalarValue43;
            float inverseLengthValue6 = rsqrt(dot(float3(comparisonValue18, comparisonValue19, sumValue29), float3(comparisonValue18, comparisonValue19, sumValue29)));
            float4 vectorValue6 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue73, sumValue26)].xxxx;
            float scalarValue45 = vectorValue6.x;
            float scalarValue46 = vectorValue6.w;
            float clampedValue5 = (exp2(log2(clamp(dot(float3(productValue, productValue1, productValue2), float3(comparisonValue18 * inverseLengthValue6, comparisonValue19 * inverseLengthValue6, inverseLengthValue6 * sumValue29)), 0.0f, 1.0f)) * productValue4) * ((int(uint(abs(int(loadedBufferValue15)))) <= int(multiplyAddValue)) ? 0.25f : 0.0f)) * exp2((((-0.0f) - abs(dotProductValue - dot(float3(scalarValue45, vectorValue6.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)))) / productValue3) * 1.44269502162933349609375f);
            float sumValue31;
            if (scalarValue46 < 0.0f)
            {
                sumValue31 = min((-0.0f) - scalarValue46, intermediateValue13);
            }
            else
            {
                sumValue31 = scalarValue46;
            }
            sumValue30 = clampedValue5 + sumValue25;
            productValue27 = (clampedValue5 * scalarValue45) + productValue23;
            productValue28 = (clampedValue5 * vectorValue6.y) + productValue24;
            productValue29 = (clampedValue5 * vectorValue6.z) + productValue25;
            productValue30 = ((clampedValue5 * clampedValue5) * sumValue31) + productValue26;
        }
        else
        {
            sumValue30 = sumValue25;
            productValue27 = productValue23;
            productValue28 = productValue24;
            productValue29 = productValue25;
            productValue30 = productValue26;
        }
        uint intermediateValue83;
        if (comparisonValue3)
        {
            intermediateValue83 = comparisonValue6;
        }
        else
        {
            intermediateValue83 = ((((sumValue26 ^ comparisonValue6) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (comparisonValue6 >> 1u);
        }
        float sumValue34;
        float productValue31;
        float productValue32;
        float productValue33;
        float productValue34;
        if ((conditionValue10 && (int(intermediateValue83) >= int(intermediateValue24))) && (conditionValue11 && (int(intermediateValue83) < int(intermediateValue25))))
        {
            uint loadedBufferValue17 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue83, sumValue26), 0u))).x - scalarValue6;
            float4 loadedBufferValue18 = inputBufferNormal.Load(int3(uint2(intermediateValue83, sumValue26), 0u));
            float scalarValue47 = loadedBufferValue18.x;
            float scalarValue48 = loadedBufferValue18.y;
            float sumValue32 = 1.0f - abs(scalarValue47);
            float scalarValue49 = abs(scalarValue48);
            float sumValue33 = sumValue32 - scalarValue49;
            bool conditionValue13 = sumValue33 < 0.0f;
            float comparisonValue20 = conditionValue13 ? ((1.0f - scalarValue49) * ((scalarValue47 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue47;
            float comparisonValue21 = conditionValue13 ? (((scalarValue48 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue32) : scalarValue48;
            float inverseLengthValue7 = rsqrt(dot(float3(comparisonValue20, comparisonValue21, sumValue33), float3(comparisonValue20, comparisonValue21, sumValue33)));
            float4 vectorValue7 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue83, sumValue26)].xxxx;
            float scalarValue50 = vectorValue7.x;
            float scalarValue51 = vectorValue7.w;
            float clampedValue6 = (exp2(log2(clamp(dot(float3(productValue, productValue1, productValue2), float3(comparisonValue20 * inverseLengthValue7, comparisonValue21 * inverseLengthValue7, inverseLengthValue7 * sumValue33)), 0.0f, 1.0f)) * productValue4) * ((int(uint(abs(int(loadedBufferValue17)))) <= int(multiplyAddValue)) ? 0.5f : 0.0f)) * exp2((((-0.0f) - abs(dotProductValue - dot(float3(scalarValue50, vectorValue7.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)))) / productValue3) * 1.44269502162933349609375f);
            float sumValue35;
            if (scalarValue51 < 0.0f)
            {
                sumValue35 = min((-0.0f) - scalarValue51, intermediateValue13);
            }
            else
            {
                sumValue35 = scalarValue51;
            }
            sumValue34 = clampedValue6 + sumValue30;
            productValue31 = (clampedValue6 * scalarValue50) + productValue27;
            productValue32 = (clampedValue6 * vectorValue7.y) + productValue28;
            productValue33 = (clampedValue6 * vectorValue7.z) + productValue29;
            productValue34 = ((clampedValue6 * clampedValue6) * sumValue35) + productValue30;
        }
        else
        {
            sumValue34 = sumValue30;
            productValue31 = productValue27;
            productValue32 = productValue28;
            productValue33 = productValue29;
            productValue34 = productValue30;
        }
        uint intermediateValue91;
        if (comparisonValue3)
        {
            intermediateValue91 = sumValue13;
        }
        else
        {
            intermediateValue91 = ((((sumValue13 ^ sumValue26) & 1u) != (uint((scalarValue11 == 0u) && ((scalarValue16 & 1u) != 0u)) ^ 1u)) ? uint(int(viewCbConstants[80u].x)) : 0u) + (sumValue13 >> 1u);
        }
        float sumValue38;
        float productValue35;
        float productValue36;
        float productValue37;
        float productValue38;
        if ((conditionValue10 && (int(intermediateValue91) >= int(intermediateValue24))) && (conditionValue11 && (int(intermediateValue91) < int(intermediateValue25))))
        {
            uint loadedBufferValue19 = uint4(inputPlaneIdentifier.Load(int3(uint2(intermediateValue91, sumValue26), 0u))).x - scalarValue6;
            float4 loadedBufferValue20 = inputBufferNormal.Load(int3(uint2(intermediateValue91, sumValue26), 0u));
            float scalarValue52 = loadedBufferValue20.x;
            float scalarValue53 = loadedBufferValue20.y;
            float sumValue36 = 1.0f - abs(scalarValue52);
            float scalarValue54 = abs(scalarValue53);
            float sumValue37 = sumValue36 - scalarValue54;
            bool conditionValue14 = sumValue37 < 0.0f;
            float comparisonValue22 = conditionValue14 ? ((1.0f - scalarValue54) * ((scalarValue52 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue52;
            float comparisonValue23 = conditionValue14 ? (((scalarValue53 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue36) : scalarValue53;
            float inverseLengthValue8 = rsqrt(dot(float3(comparisonValue22, comparisonValue23, sumValue37), float3(comparisonValue22, comparisonValue23, sumValue37)));
            float4 vectorValue8 = denoisingOutputs[bitwiseValue3][uint2(intermediateValue91, sumValue26)].xxxx;
            float scalarValue55 = vectorValue8.x;
            float scalarValue56 = vectorValue8.w;
            float clampedValue7 = (exp2(log2(clamp(dot(float3(productValue, productValue1, productValue2), float3(comparisonValue22 * inverseLengthValue8, comparisonValue23 * inverseLengthValue8, inverseLengthValue8 * sumValue37)), 0.0f, 1.0f)) * productValue4) * ((int(uint(abs(int(loadedBufferValue19)))) <= int(multiplyAddValue)) ? 0.25f : 0.0f)) * exp2((((-0.0f) - abs(dotProductValue - dot(float3(scalarValue55, vectorValue8.yz), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)))) / productValue3) * 1.44269502162933349609375f);
            float sumValue39;
            if (scalarValue56 < 0.0f)
            {
                sumValue39 = min((-0.0f) - scalarValue56, intermediateValue13);
            }
            else
            {
                sumValue39 = scalarValue56;
            }
            sumValue38 = clampedValue7 + sumValue34;
            productValue35 = (clampedValue7 * scalarValue55) + productValue31;
            productValue36 = (clampedValue7 * vectorValue8.y) + productValue32;
            productValue37 = (clampedValue7 * vectorValue8.z) + productValue33;
            productValue38 = ((clampedValue7 * clampedValue7) * sumValue39) + productValue34;
        }
        else
        {
            sumValue38 = sumValue34;
            productValue35 = productValue31;
            productValue36 = productValue32;
            productValue37 = productValue33;
            productValue38 = productValue34;
        }
        float quotientValue = productValue38 / (sumValue38 * sumValue38);
        float comparisonValue24 = (intermediateValue14 != 0u) ? ((-0.0f) - quotientValue) : quotientValue;
        float quotientValue1 = productValue35 / sumValue38;
        float quotientValue2 = productValue36 / sumValue38;
        float quotientValue3 = productValue37 / sumValue38;
        uint reinterpretedBits6 = asuint(quotientValue1) & 2147483647u;
        uint reinterpretedBits7 = asuint(quotientValue2) & 2147483647u;
        uint reinterpretedBits8 = asuint(quotientValue3) & 2147483647u;
        uint reinterpretedBits9 = asuint(comparisonValue24) & 2147483647u;
        if (!(((reinterpretedBits9 > 2139095040u) || (((reinterpretedBits6 > 2139095040u) || (reinterpretedBits7 > 2139095040u)) || (reinterpretedBits8 > 2139095040u))) || ((reinterpretedBits9 == 2139095040u) || (((reinterpretedBits6 == 2139095040u) || (reinterpretedBits7 == 2139095040u)) || (reinterpretedBits8 == 2139095040u)))))
        {
            denoisingOutputs[reinterpretedBits1][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(quotientValue1, quotientValue2, quotientValue3, comparisonValue24).x;
        }
    }
}
[numthreads(16, 8, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
