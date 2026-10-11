// RTXStub / ShadowDenoising / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 26
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    uint4 reinterpretedBits = asuint(rootConstantsConstants[0u]);
    uint scalarValue = reinterpretedBits.x;
    uint bitwiseValue = scalarValue & 2u;
    bool comparisonValue = bitwiseValue != 0u;
    uint bitwiseValue1 = dispatchThreadId.x >> 4u;
    uint bitwiseValue2 = dispatchThreadId.y >> 4u;
    uint4 loadedBufferValue = uint4(inputTileClassification.Load(int3(uint2(bitwiseValue1, bitwiseValue2), 0u)));
    uint scalarValue1 = loadedBufferValue.x;
    if ((scalarValue1 & 1u) == 0u)
    {
        uint sumValue = bitwiseValue1 + 4294967295u;
        uint sumValue1 = bitwiseValue2 + 4294967295u;
        uint sumValue2 = bitwiseValue2 + 1u;
        uint sumValue3 = bitwiseValue1 + 1u;
        uint bitwiseValue3 = ((scalarValue >> 8u) & 255u) + 0u;
        uint bitwiseValue4 = ((scalarValue >> 16u) & 255u) + 0u;
        uint bitwiseValue5 = bitwiseValue >> 1u;
        float4 vectorValue = shadowDenoisingOutputs[bitwiseValue3][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
        float scalarValue2 = vectorValue.x;
        float scalarValue3 = vectorValue.y;
        float scalarValue4 = vectorValue.z;
        float scalarValue5 = vectorValue.w;
        if (((((((((scalarValue1 & 4u) & uint4(inputTileClassification.Load(int3(uint2(sumValue, sumValue1), 0u))).x) & uint4(inputTileClassification.Load(int3(uint2(sumValue, bitwiseValue2), 0u))).x) & uint4(inputTileClassification.Load(int3(uint2(sumValue, sumValue2), 0u))).x) & uint4(inputTileClassification.Load(int3(uint2(bitwiseValue1, sumValue1), 0u))).x) & uint4(inputTileClassification.Load(int3(uint2(bitwiseValue1, sumValue2), 0u))).x) & uint4(inputTileClassification.Load(int3(uint2(sumValue3, sumValue1), 0u))).x) & uint4(inputTileClassification.Load(int3(uint2(sumValue3, bitwiseValue2), 0u))).x) == 0u)
        {
            uint intermediateValue9;
            uint intermediateValue10;
            uint intermediateValue11;
            if (asuint(viewCbConstants[91u]).y == 2u)
            {
                intermediateValue9 = 0u;
                intermediateValue10 = uint(int(viewCbConstants[78u].x));
                intermediateValue11 = uint(int(viewCbConstants[78u].y));
            }
            else
            {
                uint scalarValue6 = uint(viewCbConstants[80u].x);
                uint scalarValue7 = uint(viewCbConstants[78u].y);
                uint branchMergedValue4;
                uint branchMergedValue5;
                uint branchMergedValue6;
                if (dispatchThreadId.x < scalarValue6)
                {
                    branchMergedValue4 = 0u;
                    branchMergedValue5 = scalarValue6;
                    branchMergedValue6 = scalarValue7;
                }
                else
                {
                    branchMergedValue4 = scalarValue6;
                    branchMergedValue5 = uint(viewCbConstants[78u].x);
                    branchMergedValue6 = scalarValue7;
                }
                intermediateValue9 = branchMergedValue4;
                intermediateValue10 = branchMergedValue5;
                intermediateValue11 = branchMergedValue6;
            }
            float4 loadedBufferValue1 = inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
            float scalarValue8 = loadedBufferValue1.x;
            float4 loadedBufferValue2 = inputGeometryNormal.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
            float scalarValue9 = loadedBufferValue2.x;
            float scalarValue10 = loadedBufferValue2.y;
            float sumValue4 = 1.0f - abs(scalarValue9);
            float scalarValue11 = abs(scalarValue10);
            float sumValue5 = sumValue4 - scalarValue11;
            bool conditionValue = sumValue5 < 0.0f;
            float comparisonValue1 = conditionValue ? ((1.0f - scalarValue11) * ((scalarValue9 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue9;
            float comparisonValue2 = conditionValue ? (((scalarValue10 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue4) : scalarValue10;
            float inverseLengthValue = rsqrt(dot(float3(comparisonValue1, comparisonValue2, sumValue5), float3(comparisonValue1, comparisonValue2, sumValue5)));
            float productValue = comparisonValue1 * inverseLengthValue;
            float productValue1 = comparisonValue2 * inverseLengthValue;
            float productValue2 = inverseLengthValue * sumValue5;
            float dotProductValue = dot(float3(productValue, productValue1, productValue2), float3(viewCbConstants[52u].xyz));
            if (!(dotProductValue <= 0.0f))
            {
                float productValue3 = viewCbConstants[78u].z * 2.0f;
                float productValue4 = viewCbConstants[78u].w * (-2.0f);
                float scalarValue12 = float(int(dispatchThreadId.x));
                float scalarValue13 = float(int(dispatchThreadId.y));
                float multiplyAddValue = mad(scalarValue12 + 0.5f, productValue3, -1.0f);
                float multiplyAddValue1 = mad(scalarValue13 + 0.5f, productValue4, 1.0f);
                float multiplyAddValue2 = mad(multiplyAddValue, viewCbConstants[40u].x, viewCbConstants[42u].x);
                float multiplyAddValue3 = mad(multiplyAddValue, viewCbConstants[40u].y, viewCbConstants[42u].y);
                float multiplyAddValue4 = mad(multiplyAddValue, viewCbConstants[40u].z, viewCbConstants[42u].z);
                float multiplyAddValue5 = mad(multiplyAddValue1, viewCbConstants[41u].x, multiplyAddValue2);
                float multiplyAddValue6 = mad(multiplyAddValue1, viewCbConstants[41u].y, multiplyAddValue3);
                float multiplyAddValue7 = mad(multiplyAddValue1, viewCbConstants[41u].z, multiplyAddValue4);
                float nonlinearValue = 1.0f / sqrt(((multiplyAddValue6 * multiplyAddValue6) + (multiplyAddValue5 * multiplyAddValue5)) + (multiplyAddValue7 * multiplyAddValue7));
                float productValue5 = nonlinearValue * scalarValue8;
                float productValue6 = productValue5 * multiplyAddValue5;
                float productValue7 = productValue5 * multiplyAddValue6;
                float productValue8 = productValue5 * multiplyAddValue7;
                float productValue9 = scalarValue5 * 0.01860214583575725555419921875f;
                float scalarValue14 = abs(dotProductValue);
                float quotientValue = 1.0f / scalarValue14;
                float productValue10 = quotientValue * productValue9;
                float productValue11 = max(productValue9, productValue10 * 0.5f);
                float scalarValue15 = float(int(bitwiseValue5));
                float bitwiseValue6 = float(int(bitwiseValue5 ^ 1u));
                float dotProductValue1 = dot(float2(productValue10, productValue11), float2(scalarValue15, bitwiseValue6));
                float quotientValue1 = 1.0f / (((dotProductValue1 * dotProductValue1) * 0.88871109485626220703125f) + 1.0000000116860974230803549289703e-07f);
                bool conditionValue1 = scalarValue14 < 0.25f;
                float dotProductValue2 = dot(float3(viewCbConstants[52u].xyz), float3(productValue, productValue1, productValue2));
                float productValue12 = viewCbConstants[52u].x - (dotProductValue2 * productValue);
                float productValue13 = viewCbConstants[52u].y - (dotProductValue2 * productValue1);
                float productValue14 = viewCbConstants[52u].z - (dotProductValue2 * productValue2);
                float inverseLengthValue1 = rsqrt(dot(float3(productValue12, productValue13, productValue14), float3(productValue12, productValue13, productValue14)));
                float productValue15 = productValue12 * inverseLengthValue1;
                float productValue16 = productValue13 * inverseLengthValue1;
                float productValue17 = productValue14 * inverseLengthValue1;
                float dotProductValue3 = dot(float3(productValue15, productValue16, productValue17), float3(productValue, productValue1, productValue2)) * (1.0f / dotProductValue2);
                float productValue18 = productValue15 - (dotProductValue3 * viewCbConstants[52u].x);
                float productValue19 = productValue16 - (dotProductValue3 * viewCbConstants[52u].y);
                float productValue20 = productValue17 - (dotProductValue3 * viewCbConstants[52u].z);
                float sumValue6 = productValue6 - productValue18;
                float sumValue7 = productValue7 - productValue19;
                float sumValue8 = productValue8 - productValue20;
                float multiplyAddValue8 = mad(sumValue8, viewCbConstants[6u].w, mad(sumValue7, viewCbConstants[5u].w, sumValue6 * viewCbConstants[4u].w)) + viewCbConstants[7u].w;
                float sumValue9 = productValue18 + productValue6;
                float sumValue10 = productValue19 + productValue7;
                float sumValue11 = productValue20 + productValue8;
                float multiplyAddValue9 = mad(sumValue11, viewCbConstants[6u].w, mad(sumValue10, viewCbConstants[5u].w, sumValue9 * viewCbConstants[4u].w)) + viewCbConstants[7u].w;
                float multiplyAddValue10 = ((mad(sumValue8, viewCbConstants[6u].x, mad(sumValue7, viewCbConstants[5u].x, sumValue6 * viewCbConstants[4u].x)) + viewCbConstants[7u].x) / multiplyAddValue8) - ((mad(sumValue11, viewCbConstants[6u].x, mad(sumValue10, viewCbConstants[5u].x, sumValue9 * viewCbConstants[4u].x)) + viewCbConstants[7u].x) / multiplyAddValue9);
                float multiplyAddValue11 = ((mad(sumValue8, viewCbConstants[6u].y, mad(sumValue7, viewCbConstants[5u].y, sumValue6 * viewCbConstants[4u].y)) + viewCbConstants[7u].y) / multiplyAddValue8) - ((mad(sumValue11, viewCbConstants[6u].y, mad(sumValue10, viewCbConstants[5u].y, sumValue9 * viewCbConstants[4u].y)) + viewCbConstants[7u].y) / multiplyAddValue9);
                float inverseLengthValue2 = rsqrt(dot(float2(multiplyAddValue10, multiplyAddValue11), float2(multiplyAddValue10, multiplyAddValue11)));
                float productValue21 = inverseLengthValue2 * multiplyAddValue10;
                float productValue22 = inverseLengthValue2 * multiplyAddValue11;
                float comparisonValue3 = conditionValue1 ? (comparisonValue ? ((-0.0f) - productValue22) : productValue21) : bitwiseValue6;
                float comparisonValue4 = (conditionValue1 ? (comparisonValue ? productValue21 : productValue22) : scalarValue15) * 0.5f;
                uint multiplyAddValue12 = uint(int(mad(scalarValue8, 0.004999999888241291046142578125f, 0.02500000037252902984619140625f) * 1023.0f));
                uint4 loadedBufferValue3 = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)));
                uint scalarValue16 = loadedBufferValue3.x;
                uint sumValue12 = dispatchThreadId.x + 1u;
                bool conditionValue2 = int(dispatchThreadId.y) < int(0u);
                bool comparisonValue5 = int(dispatchThreadId.y) >= int(intermediateValue11);
                uint loadedBufferValue4 = uint4(inputPlaneIdentifier.Load(int3(uint2(sumValue12, dispatchThreadId.y), 0u))).x - scalarValue16;
                float nonlinearValue1;
                float intermediateValue24;
                if ((int(uint(abs(int(loadedBufferValue4)))) <= int(multiplyAddValue12)) && (!((conditionValue2 || (int(sumValue12) < int(intermediateValue9))) || ((int(sumValue12) >= int(intermediateValue10)) || comparisonValue5))))
                {
                    float multiplyAddValue13 = mad(float(int(sumValue12)) + 0.5f, productValue3, -1.0f);
                    float loadedBufferValue5 = inputBufferPrimaryPathLength.Load(int3(uint2(sumValue12, dispatchThreadId.y), 0u)).x * nonlinearValue;
                    float multiplyAddValue14 = productValue6 - (mad(multiplyAddValue1, viewCbConstants[41u].x, mad(multiplyAddValue13, viewCbConstants[40u].x, viewCbConstants[42u].x)) * loadedBufferValue5);
                    float multiplyAddValue15 = productValue7 - (mad(multiplyAddValue1, viewCbConstants[41u].y, mad(multiplyAddValue13, viewCbConstants[40u].y, viewCbConstants[42u].y)) * loadedBufferValue5);
                    float multiplyAddValue16 = productValue8 - (mad(multiplyAddValue1, viewCbConstants[41u].z, mad(multiplyAddValue13, viewCbConstants[40u].z, viewCbConstants[42u].z)) * loadedBufferValue5);
                    nonlinearValue1 = sqrt(((multiplyAddValue15 * multiplyAddValue15) + (multiplyAddValue14 * multiplyAddValue14)) + (multiplyAddValue16 * multiplyAddValue16));
                    intermediateValue24 = 1.0f;
                }
                else
                {
                    nonlinearValue1 = 0.0f;
                    intermediateValue24 = 0.0f;
                }
                uint sumValue13 = dispatchThreadId.x + 4294967295u;
                uint loadedBufferValue6 = uint4(inputPlaneIdentifier.Load(int3(uint2(sumValue13, dispatchThreadId.y), 0u))).x - scalarValue16;
                float nonlinearValue2;
                float sumValue14;
                if ((int(uint(abs(int(loadedBufferValue6)))) <= int(multiplyAddValue12)) && (!((conditionValue2 || (int(sumValue13) < int(intermediateValue9))) || ((int(sumValue13) >= int(intermediateValue10)) || comparisonValue5))))
                {
                    float multiplyAddValue17 = mad(float(int(sumValue13)) + 0.5f, productValue3, -1.0f);
                    float loadedBufferValue7 = inputBufferPrimaryPathLength.Load(int3(uint2(sumValue13, dispatchThreadId.y), 0u)).x * nonlinearValue;
                    float multiplyAddValue18 = productValue6 - (mad(multiplyAddValue1, viewCbConstants[41u].x, mad(multiplyAddValue17, viewCbConstants[40u].x, viewCbConstants[42u].x)) * loadedBufferValue7);
                    float multiplyAddValue19 = productValue7 - (mad(multiplyAddValue1, viewCbConstants[41u].y, mad(multiplyAddValue17, viewCbConstants[40u].y, viewCbConstants[42u].y)) * loadedBufferValue7);
                    float multiplyAddValue20 = productValue8 - (mad(multiplyAddValue1, viewCbConstants[41u].z, mad(multiplyAddValue17, viewCbConstants[40u].z, viewCbConstants[42u].z)) * loadedBufferValue7);
                    nonlinearValue2 = sqrt(((multiplyAddValue19 * multiplyAddValue19) + (multiplyAddValue18 * multiplyAddValue18)) + (multiplyAddValue20 * multiplyAddValue20)) + nonlinearValue1;
                    sumValue14 = intermediateValue24 + 1.0f;
                }
                else
                {
                    nonlinearValue2 = nonlinearValue1;
                    sumValue14 = intermediateValue24;
                }
                uint sumValue15 = dispatchThreadId.y + 1u;
                bool conditionValue3 = int(dispatchThreadId.x) < int(intermediateValue9);
                bool comparisonValue6 = int(dispatchThreadId.x) >= int(intermediateValue10);
                uint loadedBufferValue8 = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, sumValue15), 0u))).x - scalarValue16;
                float nonlinearValue3;
                float intermediateValue26;
                if ((int(uint(abs(int(loadedBufferValue8)))) <= int(multiplyAddValue12)) && (!(((int(sumValue15) < int(0u)) || conditionValue3) || (comparisonValue6 || (int(sumValue15) >= int(intermediateValue11))))))
                {
                    float multiplyAddValue21 = mad(float(int(sumValue15)) + 0.5f, productValue4, 1.0f);
                    float loadedBufferValue9 = inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, sumValue15), 0u)).x * nonlinearValue;
                    float multiplyAddValue22 = productValue6 - (loadedBufferValue9 * mad(multiplyAddValue21, viewCbConstants[41u].x, multiplyAddValue2));
                    float multiplyAddValue23 = productValue7 - (mad(multiplyAddValue21, viewCbConstants[41u].y, multiplyAddValue3) * loadedBufferValue9);
                    float multiplyAddValue24 = productValue8 - (mad(multiplyAddValue21, viewCbConstants[41u].z, multiplyAddValue4) * loadedBufferValue9);
                    nonlinearValue3 = sqrt(((multiplyAddValue23 * multiplyAddValue23) + (multiplyAddValue22 * multiplyAddValue22)) + (multiplyAddValue24 * multiplyAddValue24));
                    intermediateValue26 = 1.0f;
                }
                else
                {
                    nonlinearValue3 = 0.0f;
                    intermediateValue26 = 0.0f;
                }
                uint sumValue16 = dispatchThreadId.y + 4294967295u;
                uint loadedBufferValue10 = uint4(inputPlaneIdentifier.Load(int3(uint2(dispatchThreadId.x, sumValue16), 0u))).x - scalarValue16;
                float nonlinearValue4;
                float sumValue17;
                if ((int(uint(abs(int(loadedBufferValue10)))) <= int(multiplyAddValue12)) && (!(((int(sumValue16) < int(0u)) || conditionValue3) || (comparisonValue6 || (int(sumValue16) >= int(intermediateValue11))))))
                {
                    float multiplyAddValue25 = mad(float(int(sumValue16)) + 0.5f, productValue4, 1.0f);
                    float loadedBufferValue11 = inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, sumValue16), 0u)).x * nonlinearValue;
                    float multiplyAddValue26 = productValue6 - (loadedBufferValue11 * mad(multiplyAddValue25, viewCbConstants[41u].x, multiplyAddValue2));
                    float multiplyAddValue27 = productValue7 - (mad(multiplyAddValue25, viewCbConstants[41u].y, multiplyAddValue3) * loadedBufferValue11);
                    float multiplyAddValue28 = productValue8 - (mad(multiplyAddValue25, viewCbConstants[41u].z, multiplyAddValue4) * loadedBufferValue11);
                    nonlinearValue4 = sqrt(((multiplyAddValue27 * multiplyAddValue27) + (multiplyAddValue26 * multiplyAddValue26)) + (multiplyAddValue28 * multiplyAddValue28)) + nonlinearValue3;
                    sumValue17 = intermediateValue26 + 1.0f;
                }
                else
                {
                    nonlinearValue4 = nonlinearValue3;
                    sumValue17 = intermediateValue26;
                }
                precise float comparisonValue7 = ((sumValue14 > 0.0f) ? (nonlinearValue2 / sumValue14) : nonlinearValue2) * 0.5f;
                precise float comparisonValue8 = ((sumValue17 > 0.0f) ? (nonlinearValue4 / sumValue17) : nonlinearValue4) * 0.5f;
                float quotientValue2 = productValue10 / comparisonValue7;
                float quotientValue3 = productValue11 / comparisonValue8;
                uint dotProductValue4 = uint(max(int(1u), int(uint(int(dot(float2(min(12.0f, max(0.0f, comparisonValue ? (quotientValue2 * quotientValue) : quotientValue2)), min(12.0f, max(0.0f, comparisonValue ? (quotientValue3 * quotientValue) : quotientValue3))), float2(scalarValue15, bitwiseValue6)))))));
                float intermediateValue27;
                float intermediateValue29;
                float intermediateValue31;
                float intermediateValue33;
                if (int(dotProductValue4) > int(1u))
                {
                    float intermediateValue28;
                    float intermediateValue30;
                    float intermediateValue32;
                    float intermediateValue34;
                    float scalarValue17 = 1.0f;
                    float scalarValue18 = scalarValue2;
                    float scalarValue19 = scalarValue3;
                    float scalarValue20 = scalarValue4;
                    uint scalarValue21 = 1u;
                    float productValue23;
                    float productValue24;
                    uint sumValue19;
                    uint sumValue20;
                    uint intermediateValue41;
                    bool comparisonValue9;
                    for (;;)
                    {
                        float scalarValue22 = float(int(scalarValue21));
                        productValue23 = comparisonValue4 * scalarValue22;
                        productValue24 = scalarValue22 * comparisonValue3;
                        sumValue19 = uint(int(scalarValue12 - productValue23));
                        sumValue20 = uint(int(scalarValue13 - productValue24));
                        intermediateValue41 = uint(int(float(int(multiplyAddValue12))));
                        uint loadedBufferValue12 = uint4(inputPlaneIdentifier.Load(int3(uint2(sumValue19, sumValue20), 0u))).x - scalarValue16;
                        comparisonValue9 = (int(uint(abs(int(loadedBufferValue12)))) <= int(intermediateValue41)) && (!(((int(sumValue19) < int(intermediateValue9)) || (int(sumValue20) < int(0u))) || ((int(sumValue19) >= int(intermediateValue10)) || (int(sumValue20) >= int(intermediateValue11)))));
                        float sumValue21;
                        float productValue25;
                        float productValue26;
                        float productValue27;
                        if (comparisonValue9)
                        {
                            float multiplyAddValue29 = mad(float(int(sumValue19)) + 0.5f, viewCbConstants[78u].z * 2.0f, -1.0f);
                            float multiplyAddValue30 = mad(float(int(sumValue20)) + 0.5f, viewCbConstants[78u].w * (-2.0f), 1.0f);
                            float loadedBufferValue13 = inputBufferPrimaryPathLength.Load(int3(uint2(sumValue19, sumValue20), 0u)).x * nonlinearValue;
                            float multiplyAddValue31 = productValue6 - (mad(multiplyAddValue30, viewCbConstants[41u].x, mad(multiplyAddValue29, viewCbConstants[40u].x, viewCbConstants[42u].x)) * loadedBufferValue13);
                            float multiplyAddValue32 = productValue7 - (mad(multiplyAddValue30, viewCbConstants[41u].y, mad(multiplyAddValue29, viewCbConstants[40u].y, viewCbConstants[42u].y)) * loadedBufferValue13);
                            float multiplyAddValue33 = productValue8 - (mad(multiplyAddValue30, viewCbConstants[41u].z, mad(multiplyAddValue29, viewCbConstants[40u].z, viewCbConstants[42u].z)) * loadedBufferValue13);
                            float dotProductValue5 = exp2((quotientValue1 * (-1.44269502162933349609375f)) * dot(float3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33), float3(multiplyAddValue31, multiplyAddValue32, multiplyAddValue33)));
                            float4 vectorValue1 = shadowDenoisingOutputs[bitwiseValue3][uint2(sumValue19, sumValue20)].xxxx;
                            sumValue21 = dotProductValue5 + scalarValue17;
                            productValue25 = (vectorValue1.x * dotProductValue5) + scalarValue18;
                            productValue26 = (vectorValue1.y * dotProductValue5) + scalarValue19;
                            productValue27 = (vectorValue1.z * dotProductValue5) + scalarValue20;
                        }
                        else
                        {
                            sumValue21 = scalarValue17;
                            productValue25 = scalarValue18;
                            productValue26 = scalarValue19;
                            productValue27 = scalarValue20;
                        }
                        uint sumValue18 = uint(int(productValue23 + scalarValue12));
                        uint sumValue22 = uint(int(productValue24 + scalarValue13));
                        uint loadedBufferValue14 = uint4(inputPlaneIdentifier.Load(int3(uint2(sumValue18, sumValue22), 0u))).x - scalarValue16;
                        float branchMergedValue;
                        float branchMergedValue1;
                        float branchMergedValue2;
                        float branchMergedValue3;
                        if ((int(uint(abs(int(loadedBufferValue14)))) <= int(intermediateValue41)) && (!(((int(sumValue18) < int(intermediateValue9)) || (int(sumValue22) < int(0u))) || ((int(sumValue18) >= int(intermediateValue10)) || (int(sumValue22) >= int(intermediateValue11))))))
                        {
                            float multiplyAddValue34 = mad(float(int(sumValue18)) + 0.5f, viewCbConstants[78u].z * 2.0f, -1.0f);
                            float multiplyAddValue35 = mad(float(int(sumValue22)) + 0.5f, viewCbConstants[78u].w * (-2.0f), 1.0f);
                            float loadedBufferValue15 = inputBufferPrimaryPathLength.Load(int3(uint2(sumValue18, sumValue22), 0u)).x * nonlinearValue;
                            float multiplyAddValue36 = productValue6 - (mad(multiplyAddValue35, viewCbConstants[41u].x, mad(multiplyAddValue34, viewCbConstants[40u].x, viewCbConstants[42u].x)) * loadedBufferValue15);
                            float multiplyAddValue37 = productValue7 - (mad(multiplyAddValue35, viewCbConstants[41u].y, mad(multiplyAddValue34, viewCbConstants[40u].y, viewCbConstants[42u].y)) * loadedBufferValue15);
                            float multiplyAddValue38 = productValue8 - (mad(multiplyAddValue35, viewCbConstants[41u].z, mad(multiplyAddValue34, viewCbConstants[40u].z, viewCbConstants[42u].z)) * loadedBufferValue15);
                            float dotProductValue6 = exp2((quotientValue1 * (-1.44269502162933349609375f)) * dot(float3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38), float3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38)));
                            float4 vectorValue2 = shadowDenoisingOutputs[bitwiseValue3][uint2(sumValue18, sumValue22)].xxxx;
                            branchMergedValue = dotProductValue6 + sumValue21;
                            branchMergedValue1 = (vectorValue2.x * dotProductValue6) + productValue25;
                            branchMergedValue2 = (vectorValue2.y * dotProductValue6) + productValue26;
                            branchMergedValue3 = (vectorValue2.z * dotProductValue6) + productValue27;
                        }
                        else
                        {
                            branchMergedValue = sumValue21;
                            branchMergedValue1 = productValue25;
                            branchMergedValue2 = productValue26;
                            branchMergedValue3 = productValue27;
                        }
                        intermediateValue28 = branchMergedValue;
                        intermediateValue30 = branchMergedValue1;
                        intermediateValue32 = branchMergedValue2;
                        intermediateValue34 = branchMergedValue3;
                        uint sumValue23 = scalarValue21 + 1u;
                        if (sumValue23 == dotProductValue4)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue17 = intermediateValue28;
                            scalarValue18 = intermediateValue30;
                            scalarValue19 = intermediateValue32;
                            scalarValue20 = intermediateValue34;
                            scalarValue21 = sumValue23;
                            continue;
                        }
                    }
                    intermediateValue27 = intermediateValue28;
                    intermediateValue29 = intermediateValue30;
                    intermediateValue31 = intermediateValue32;
                    intermediateValue33 = intermediateValue34;
                }
                else
                {
                    intermediateValue27 = 1.0f;
                    intermediateValue29 = scalarValue2;
                    intermediateValue31 = scalarValue3;
                    intermediateValue33 = scalarValue4;
                }
                shadowDenoisingOutputs[bitwiseValue4][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(min(max(intermediateValue29 / intermediateValue27, 0.0f), 100.0f), min(max(intermediateValue31 / intermediateValue27, 0.0f), 100.0f), min(max(intermediateValue33 / intermediateValue27, 0.0f), 100.0f), scalarValue5).x;
            }
            else
            {
                shadowDenoisingOutputs[bitwiseValue4][uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.x;
            }
        }
        else
        {
            shadowDenoisingOutputs[bitwiseValue4][uint2(dispatchThreadId.x, dispatchThreadId.y)] = float4(scalarValue2, scalarValue3, scalarValue4, scalarValue5).x;
        }
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
