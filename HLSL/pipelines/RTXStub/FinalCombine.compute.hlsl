// RTXStub / FinalCombine / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 25
#endif


#include "../../include/materials/RTXStub/ComputeBindings.hlsli"

void executeComputeStage()
{
    float scalarValue = float(dispatchThreadId.y);
    if ((float(dispatchThreadId.x) >= viewCbConstants[78u].x) || (scalarValue >= viewCbConstants[78u].y))
    {
        outputBufferFinal[uint2(dispatchThreadId.x, dispatchThreadId.y)] = 0.0f.xxxx;
    }
    else
    {
        uint4 reinterpretedBits = asuint(viewCbConstants[91u]);
        uint scalarValue1 = reinterpretedBits.y;
        bool comparisonValue = scalarValue1 == 2u;
        uint intermediateValue2;
        if (comparisonValue)
        {
            intermediateValue2 = dispatchThreadId.x;
        }
        else
        {
            uint productValue = uint(viewCbConstants[78u].x * 0.5f);
            uint reinterpretedBits1 = (((scalarValue1 == 0u) ? asuint(viewCbConstants[84u]).z : 0u) + dispatchThreadId.y) & 1u;
            uint branchMergedValue;
            if (dispatchThreadId.x < productValue)
            {
                branchMergedValue = ((dispatchThreadId.x << 1u) | 1u) - reinterpretedBits1;
            }
            else
            {
                branchMergedValue = reinterpretedBits1 | ((dispatchThreadId.x - productValue) << 1u);
            }
            intermediateValue2 = branchMergedValue;
        }
        uint comparisonValue1 = comparisonValue ? intermediateValue2 : dispatchThreadId.x;
        float4 loadedBufferValue = inputPrimaryPosLowPrecision.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float4 loadedBufferValue1 = inputBufferPrimaryPathLength.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue2 = loadedBufferValue1.x;
        float scalarValue3 = abs(loadedBufferValue.w);
        bool comparisonValue2 = scalarValue2 == 65504.0f;
        float4 loadedBufferValue2 = inputEmissiveAndLinearRoughness.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue4 = loadedBufferValue2.x;
        float scalarValue5 = loadedBufferValue2.y;
        float scalarValue6 = loadedBufferValue2.z;
        float scalarValue7 = loadedBufferValue2.w;
        bool reinterpretedBits2 = ((asuint(scalarValue6) & 2147483647u) > 2139095040u) || (((asuint(scalarValue4) & 2147483647u) > 2139095040u) || ((asuint(scalarValue5) & 2147483647u) > 2139095040u));
        float comparisonValue3 = reinterpretedBits2 ? 0.0f : scalarValue4;
        float comparisonValue4 = reinterpretedBits2 ? 0.0f : scalarValue5;
        float comparisonValue5 = reinterpretedBits2 ? 0.0f : scalarValue6;
        outputBufferPreviousLinearRoughness[uint2(dispatchThreadId.x, dispatchThreadId.y)] = scalarValue7.xxxx;
        float productValue1 = viewCbConstants[78u].z * (float(intermediateValue2) + 0.5f);
        float productValue2 = viewCbConstants[78u].w * (scalarValue + 0.5f);
        float productValue3;
        float productValue4;
        float productValue5;
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        if (asuint(viewCbConstants[96u]).y == 0u)
        {
            float nonlinearValue = log2((scalarValue3 * 0.20000000298023223876953125f) + 1.0f) * 0.289064824581146240234375f;
            float4 sampledTextureValue = volumetricResolvedInscatter.SampleLevel(linearSampler, float3(productValue1, productValue2, nonlinearValue), 0.0f);
            float scalarValue8 = sampledTextureValue.x;
            float scalarValue9 = sampledTextureValue.y;
            float scalarValue10 = sampledTextureValue.z;
            float4 sampledTextureValue1 = volumetricGIResolvedInscatter.SampleLevel(linearSampler, float3(productValue1, productValue2, nonlinearValue), 0.0f);
            float scalarValue11 = sampledTextureValue1.x;
            float scalarValue12 = sampledTextureValue1.y;
            float scalarValue13 = sampledTextureValue1.z;
            float4 sampledTextureValue2 = volumetricResolvedTransmission.SampleLevel(linearSampler, float3(productValue1, productValue2, nonlinearValue), 0.0f);
            productValue3 = (scalarValue11 * scalarValue11) + (scalarValue8 * scalarValue8);
            productValue4 = (scalarValue12 * scalarValue12) + (scalarValue9 * scalarValue9);
            productValue5 = (scalarValue13 * scalarValue13) + (scalarValue10 * scalarValue10);
            intermediateValue15 = sampledTextureValue2.x;
            intermediateValue16 = sampledTextureValue2.y;
            intermediateValue17 = sampledTextureValue2.z;
        }
        else
        {
            productValue3 = 0.0f;
            productValue4 = 0.0f;
            productValue5 = 0.0f;
            intermediateValue15 = 1.0f;
            intermediateValue16 = 1.0f;
            intermediateValue17 = 1.0f;
        }
        float loadedBufferValue3 = asfloat(rdLoad_inputIncidentLight(0u).x);
        float productValue6 = loadedBufferValue3 * productValue3;
        float productValue7 = loadedBufferValue3 * productValue4;
        float productValue8 = loadedBufferValue3 * productValue5;
        bool reinterpretedBits3 = ((asuint(productValue8) & 2147483647u) > 2139095040u) || (((asuint(productValue6) & 2147483647u) > 2139095040u) || ((asuint(productValue7) & 2147483647u) > 2139095040u));
        bool reinterpretedBits4 = (((asuint(intermediateValue15) & 2147483647u) > 2139095040u) || ((asuint(intermediateValue16) & 2147483647u) > 2139095040u)) || ((asuint(intermediateValue17) & 2147483647u) > 2139095040u);
        float4 loadedBufferValue4 = inputBufferNormal.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue14 = loadedBufferValue4.x;
        float scalarValue15 = loadedBufferValue4.y;
        float sumValue = 1.0f - abs(scalarValue14);
        float scalarValue16 = abs(scalarValue15);
        float sumValue1 = sumValue - scalarValue16;
        bool conditionValue = sumValue1 < 0.0f;
        float comparisonValue6 = conditionValue ? ((1.0f - scalarValue16) * ((scalarValue14 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue14;
        float comparisonValue7 = conditionValue ? (((scalarValue15 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue) : scalarValue15;
        float inverseLengthValue = rsqrt(dot(float3(comparisonValue6, comparisonValue7, sumValue1), float3(comparisonValue6, comparisonValue7, sumValue1)));
        float productValue9 = comparisonValue6 * inverseLengthValue;
        float productValue10 = comparisonValue7 * inverseLengthValue;
        float productValue11 = inverseLengthValue * sumValue1;
        float4 loadedBufferValue5 = inputPrimaryViewDirection.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue17 = loadedBufferValue5.x;
        float scalarValue18 = loadedBufferValue5.y;
        float scalarValue19 = loadedBufferValue5.z;
        float4 loadedBufferValue6 = inputPrimaryThroughput.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
        float scalarValue20 = loadedBufferValue6.w;
        float intermediateValue26;
        float intermediateValue27;
        float intermediateValue28;
        if (asuint(viewCbConstants[91u]).y == 2u)
        {
            intermediateValue26 = comparisonValue3;
            intermediateValue27 = comparisonValue4;
            intermediateValue28 = comparisonValue5;
        }
        else
        {
            float intermediateValue36;
            float intermediateValue37;
            float intermediateValue38;
            if (comparisonValue2)
            {
                intermediateValue36 = 0.0f;
                intermediateValue37 = 0.0f;
                intermediateValue38 = 0.0f;
            }
            else
            {
                float4 reinterpretedBits5 = denoisingOutputs[(asuint(rootConstantsConstants[0u]).x & 255u) + 0u][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
                float scalarValue21 = reinterpretedBits5.x;
                float intermediateValue44;
                float intermediateValue45;
                float intermediateValue46;
                if (asuint(viewCbConstants[96u]).x == 0u)
                {
                    intermediateValue44 = scalarValue21;
                    intermediateValue45 = reinterpretedBits5.y;
                    intermediateValue46 = reinterpretedBits5.z;
                }
                else
                {
                    uint reinterpretedBits6 = asuint(rootConstantsConstants[0u]).x & 255u;
                    float scalarValue22 = reinterpretedBits5.w;
                    float4 vectorValue = denoisingChromaAndVarianceOutputs[reinterpretedBits6][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
                    float dotProductValue = (dot(float3(scalarValue21, reinterpretedBits5.yz), float3(productValue9, productValue10, productValue11)) * 1.02332603931427001953125f) + (scalarValue22 * 0.886225998401641845703125f);
                    float quotientValue = dotProductValue * (0.564189970493316650390625f / (scalarValue22 + 9.9999999747524270787835121154785e-07f));
                    float productValue12 = quotientValue * vectorValue.x;
                    float productValue13 = quotientValue * vectorValue.y;
                    float productValue14 = (dotProductValue * 2.0f) - (productValue13 * 0.5f);
                    float productValue15 = productValue14 - (productValue12 * 0.5f);
                    intermediateValue44 = max(productValue15 + productValue12, 0.0f);
                    intermediateValue45 = max(productValue14 + productValue13, 0.0f);
                    intermediateValue46 = max(productValue15, 0.0f);
                }
                float4 reinterpretedBits7 = denoisingOutputs[((asuint(rootConstantsConstants[0u]).x >> 8u) & 255u) + 0u][uint2(dispatchThreadId.x, dispatchThreadId.y)].xxxx;
                float scalarValue23 = reinterpretedBits7.x;
                float scalarValue24 = reinterpretedBits7.y;
                float scalarValue25 = reinterpretedBits7.z;
                bool reinterpretedBits8 = (((asuint(intermediateValue44) & 2147483647u) > 2139095040u) || ((asuint(intermediateValue45) & 2147483647u) > 2139095040u)) || ((asuint(intermediateValue46) & 2147483647u) > 2139095040u);
                bool reinterpretedBits9 = ((asuint(scalarValue25) & 2147483647u) > 2139095040u) || (((asuint(scalarValue23) & 2147483647u) > 2139095040u) || ((asuint(scalarValue24) & 2147483647u) > 2139095040u));
                float4 loadedBufferValue7 = inputBufferColourAndMetallic.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
                float scalarValue26 = loadedBufferValue7.x;
                float scalarValue27 = loadedBufferValue7.y;
                float scalarValue28 = loadedBufferValue7.z;
                float scalarValue29 = loadedBufferValue7.w;
                float productValue16 = scalarValue26 * scalarValue26;
                float productValue17 = scalarValue27 * scalarValue27;
                float productValue18 = scalarValue28 * scalarValue28;
                float4 loadedBufferValue8 = inputBufferSurfaceOpacityAndObjectCategory.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
                float sumValue2 = (-0.0f) - scalarValue17;
                float sumValue3 = (-0.0f) - scalarValue18;
                float sumValue4 = (-0.0f) - scalarValue19;
                float productValue19 = scalarValue7 * scalarValue7;
                float productValue20 = productValue9 - (scalarValue17 * productValue19);
                float productValue21 = productValue10 - (scalarValue18 * productValue19);
                float productValue22 = productValue11 - (scalarValue19 * productValue19);
                float inverseLengthValue1 = rsqrt(dot(float3(productValue20, productValue21, productValue22), float3(productValue20, productValue21, productValue22)));
                float productValue23 = ((productValue16 + (-0.039999999105930328369140625f)) * scalarValue29) + 0.039999999105930328369140625f;
                float productValue24 = ((productValue17 + (-0.039999999105930328369140625f)) * scalarValue29) + 0.039999999105930328369140625f;
                float productValue25 = ((productValue18 + (-0.039999999105930328369140625f)) * scalarValue29) + 0.039999999105930328369140625f;
                float dotProductValue1 = dot(float3(sumValue2, sumValue3, sumValue4), float3(inverseLengthValue1 * productValue20, inverseLengthValue1 * productValue21, inverseLengthValue1 * productValue22));
                float multiplyAddValue8;
                if (((uint(loadedBufferValue8.y * 255.0f) & 127u) == 3u) && (asuint(viewCbConstants[54u]).w != 0u))
                {
                    multiplyAddValue8 = clamp(mad(dotProductValue1, 2.9359951019287109375f, -1.93599522113800048828125f), 0.0f, 1.0f);
                }
                else
                {
                    multiplyAddValue8 = dotProductValue1;
                }
                float clampedValue = clamp(dot(float3(productValue23, productValue24, productValue25), float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f)) * 50.0f, 0.0f, 1.0f);
                float sumValue5 = clampedValue - productValue23;
                float sumValue6 = clampedValue - productValue24;
                float sumValue7 = clampedValue - productValue25;
                float clampedValue1 = exp2(log2(clamp(1.0f - multiplyAddValue8, 0.0f, 1.0f)) * 5.0f);
                float productValue26 = (clampedValue1 * sumValue5) + productValue23;
                float productValue27 = (clampedValue1 * sumValue6) + productValue24;
                float productValue28 = (clampedValue1 * sumValue7) + productValue25;
                float inverseLengthValue2 = rsqrt(dot(float3(productValue9, productValue10, productValue11), float3(productValue9, productValue10, productValue11)));
                float productValue29 = inverseLengthValue2 * productValue9;
                float productValue30 = inverseLengthValue2 * productValue10;
                float productValue31 = inverseLengthValue2 * productValue11;
                float4 loadedBufferValue9 = shadowDenoisingInputs[((asuint(rootConstantsConstants[0u]).x >> 16u) & 255u) + 0u].Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u));
                float scalarValue30 = loadedBufferValue9.x;
                float productValue66;
                float productValue67;
                float productValue68;
                float productValue69;
                float productValue70;
                float productValue71;
                if (dot(float3(scalarValue30, loadedBufferValue9.yz), 1.0f.xxx) > 0.0f)
                {
                    float scalarValue31 = max(scalarValue7, 0.00999999977648258209228515625f);
                    float sumValue8 = viewCbConstants[52u].x - scalarValue17;
                    float sumValue9 = viewCbConstants[52u].y - scalarValue18;
                    float sumValue10 = viewCbConstants[52u].z - scalarValue19;
                    float inverseLengthValue3 = rsqrt(dot(float3(sumValue8, sumValue9, sumValue10), float3(sumValue8, sumValue9, sumValue10)));
                    float productValue35 = inverseLengthValue3 * sumValue8;
                    float productValue36 = inverseLengthValue3 * sumValue9;
                    float productValue37 = inverseLengthValue3 * sumValue10;
                    float clampedValue2 = clamp(dot(float3(productValue29, productValue30, productValue31), float3(viewCbConstants[52u].xyz)), 0.0f, 1.0f);
                    float clampedValue3 = clamp(dot(float3(productValue29, productValue30, productValue31), float3(sumValue2, sumValue3, sumValue4)), 0.0f, 1.0f);
                    float clampedValue4 = clamp(dot(float3(productValue29, productValue30, productValue31), float3(productValue35, productValue36, productValue37)), 0.0f, 1.0f);
                    float clampedValue5 = clamp(dot(float3(sumValue2, sumValue3, sumValue4), float3(productValue35, productValue36, productValue37)), 0.0f, 1.0f);
                    float productValue38 = scalarValue31 * scalarValue31;
                    float productValue39 = productValue38 * productValue38;
                    float productValue43 = (((clampedValue4 * productValue39) - clampedValue4) * clampedValue4) + 1.0f;
                    float productValue44 = productValue38 * 0.5f;
                    float sumValue11 = 1.0f - productValue44;
                    float clampedValue6 = exp2(log2(clamp(1.0f - clampedValue5, 0.0f, 1.0f)) * 5.0f);
                    float productValue45 = (clampedValue6 * sumValue5) + productValue23;
                    float productValue46 = (clampedValue6 * sumValue6) + productValue24;
                    float productValue47 = (clampedValue6 * sumValue7) + productValue25;
                    float productValue48 = ((clampedValue5 * clampedValue5) * (scalarValue31 * 2.0f)) + (-0.5f);
                    float clampedValue7 = (((exp2(log2(clamp(1.0f - clampedValue3, 0.0f, 1.0f)) * 5.0f) * productValue48) + 1.0f) * 0.3183098733425140380859375f) * ((exp2(log2(clamp(1.0f - clampedValue2, 0.0f, 1.0f)) * 5.0f) * productValue48) + 1.0f);
                    float loadedBufferValue10 = clampedValue2 * asfloat(rdLoad_inputIncidentLight(0u).x);
                    float productValue52 = (viewCbConstants[50u].x * scalarValue30) * loadedBufferValue10;
                    float quotientValue1 = (0.25f / ((((clampedValue3 * sumValue11) + productValue44) * ((clampedValue2 * sumValue11) + productValue44)) + 1.0000000133514319600180897396058e-10f)) * ((productValue39 / ((productValue43 * productValue43) + 1.0000000133514319600180897396058e-10f)) * 0.3183098733425140380859375f);
                    float productValue53 = (viewCbConstants[50u].y * loadedBufferValue9.y) * loadedBufferValue10;
                    float productValue54 = (viewCbConstants[50u].z * loadedBufferValue9.z) * loadedBufferValue10;
                    productValue66 = (quotientValue1 * productValue52) * productValue45;
                    productValue67 = (quotientValue1 * productValue53) * productValue46;
                    productValue68 = (quotientValue1 * productValue54) * productValue47;
                    productValue69 = ((1.0f - productValue45) * productValue52) * clampedValue7;
                    productValue70 = ((1.0f - productValue46) * productValue53) * clampedValue7;
                    productValue71 = ((1.0f - productValue47) * productValue54) * clampedValue7;
                }
                else
                {
                    productValue66 = 0.0f;
                    productValue67 = 0.0f;
                    productValue68 = 0.0f;
                    productValue69 = 0.0f;
                    productValue70 = 0.0f;
                    productValue71 = 0.0f;
                }
                float loadedBufferValue11 = clamp(mad(asfloat(uint3(intermediateValue66, intermediateValue67, rdLoad_inputIncidentLight(8u + 2u).x)).z, 0.25f, -2.5f), 0.0f, 1.0f) * 0.0500000007450580596923828125f;
                float dotProductValue2 = (((viewCbConstants[59u].w * (1.0f - loadedBufferValue11)) + loadedBufferValue11) * 5.0f) * ((exp2(log2(max((-0.0f) - dot(float3(scalarValue17, scalarValue18, scalarValue19), float3(productValue29, productValue30, productValue31)), 0.0f)) * 1.10000002384185791015625f) * 0.800000011920928955078125f) + 0.20000000298023223876953125f);
                float productValue55 = loadedBufferValue8.x * (1.0f - scalarValue29);
                intermediateValue36 = (productValue66 + (productValue26 * (reinterpretedBits9 ? 0.0f : scalarValue23))) + ((productValue55 * productValue16) * ((productValue69 + ((1.0f - productValue26) * (reinterpretedBits8 ? 0.0f : intermediateValue44))) + dotProductValue2));
                intermediateValue37 = (productValue67 + (productValue27 * (reinterpretedBits9 ? 0.0f : scalarValue24))) + ((productValue55 * productValue17) * ((productValue70 + ((1.0f - productValue27) * (reinterpretedBits8 ? 0.0f : intermediateValue45))) + dotProductValue2));
                intermediateValue38 = (productValue68 + (productValue28 * (reinterpretedBits9 ? 0.0f : scalarValue25))) + ((productValue55 * productValue18) * ((productValue71 + ((1.0f - productValue28) * (reinterpretedBits8 ? 0.0f : intermediateValue46))) + dotProductValue2));
            }
            float comparisonValue8 = comparisonValue2 ? loadedBufferValue.x : 0.0f;
            float comparisonValue9 = comparisonValue2 ? loadedBufferValue.y : 0.0f;
            float comparisonValue10 = comparisonValue2 ? loadedBufferValue.z : 0.0f;
            float sumValue12 = intermediateValue36 + comparisonValue3;
            float sumValue13 = intermediateValue37 + comparisonValue4;
            float sumValue14 = intermediateValue38 + comparisonValue5;
            bool comparisonValue11 = (uint(scalarValue20) & 240u) == 0u;
            float intermediateValue40;
            float intermediateValue41;
            float intermediateValue42;
            if (comparisonValue11)
            {
                intermediateValue40 = sumValue12;
                intermediateValue41 = sumValue13;
                intermediateValue42 = sumValue14;
            }
            else
            {
                uint4 reinterpretedBits10 = asuint(viewCbConstants[76u]);
                uint scalarValue32 = reinterpretedBits10.w;
                float intermediateValue60;
                float intermediateValue61;
                float intermediateValue62;
                if (scalarValue32 == 1u)
                {
                    intermediateValue60 = viewCbConstants[58u].x;
                    intermediateValue61 = viewCbConstants[58u].y;
                    intermediateValue62 = viewCbConstants[58u].z;
                }
                else
                {
                    float branchMergedValue1;
                    float branchMergedValue5;
                    float branchMergedValue6;
                    if (scalarValue32 == 2u)
                    {
                        uint4 vectorValue1 = asuint(viewCbConstants[74u]);
                        uint scalarValue33 = vectorValue1.z;
                        uint reinterpretedBits13;
                        if (scalarValue33 > 4095u)
                        {
                            reinterpretedBits13 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits13 = scalarValue33;
                        }
                        float scalarValue34 = abs(scalarValue17);
                        float scalarValue35 = abs(scalarValue18);
                        float scalarValue36 = abs(scalarValue19);
                        float intermediateValue103;
                        float comparisonValue18;
                        float sumValue17;
                        if ((scalarValue34 >= scalarValue35) && (scalarValue34 >= scalarValue36))
                        {
                            intermediateValue103 = scalarValue34;
                            comparisonValue18 = (scalarValue17 < 0.0f) ? ((-0.0f) - scalarValue19) : scalarValue19;
                            sumValue17 = (-0.0f) - scalarValue18;
                        }
                        else
                        {
                            float sumValue15 = (-0.0f) - scalarValue17;
                            float branchMergedValue3;
                            float branchMergedValue9;
                            float branchMergedValue10;
                            if (!(scalarValue35 >= scalarValue36))
                            {
                                branchMergedValue3 = scalarValue36;
                                branchMergedValue9 = (-0.0f) - scalarValue18;
                                branchMergedValue10 = (scalarValue19 < 0.0f) ? scalarValue17 : sumValue15;
                            }
                            else
                            {
                                branchMergedValue3 = scalarValue35;
                                branchMergedValue9 = (scalarValue18 < 0.0f) ? ((-0.0f) - scalarValue19) : scalarValue19;
                                branchMergedValue10 = sumValue15;
                            }
                            intermediateValue103 = branchMergedValue3;
                            comparisonValue18 = branchMergedValue10;
                            sumValue17 = branchMergedValue9;
                        }
                        precise float quotientValue2 = 0.5f / intermediateValue103;
                        float4 sampledTextureValue3 = textures[NonUniformResourceIndex(reinterpretedBits13 + 0u)].SampleLevel(linearSampler, float2(frac(mad(comparisonValue18, quotientValue2, 0.5f) * viewCbConstants[74u].x), frac(mad(sumValue17, quotientValue2, 0.5f) * viewCbConstants[74u].y)), 0.0f);
                        branchMergedValue1 = (viewCbConstants[58u].z * sampledTextureValue3.z) * viewCbConstants[97u].w;
                        branchMergedValue5 = (viewCbConstants[58u].x * sampledTextureValue3.x) * viewCbConstants[97u].w;
                        branchMergedValue6 = (viewCbConstants[58u].y * sampledTextureValue3.y) * viewCbConstants[97u].w;
                    }
                    else
                    {
                        float branchMergedValue13;
                        float branchMergedValue15;
                        float branchMergedValue16;
                        if (scalarValue32 == 4u)
                        {
                            float scalarValue37 = (dot(float3(scalarValue17, scalarValue18, scalarValue19), float3(viewCbConstants[52u].xyz)) * 0.5f) + 0.5f;
                            branchMergedValue13 = ((viewCbConstants[75u].z - viewCbConstants[76u].z) * scalarValue37) + viewCbConstants[76u].z;
                            branchMergedValue15 = ((viewCbConstants[75u].x - viewCbConstants[76u].x) * scalarValue37) + viewCbConstants[76u].x;
                            branchMergedValue16 = ((viewCbConstants[75u].y - viewCbConstants[76u].y) * scalarValue37) + viewCbConstants[76u].y;
                        }
                        else
                        {
                            float comparisonValue14;
                            if (abs(scalarValue18) < 1.0f)
                            {
                                float quotientValue3 = atan(scalarValue19 / scalarValue17);
                                bool conditionValue1 = scalarValue17 < 0.0f;
                                bool comparisonValue12 = scalarValue17 == 0.0f;
                                bool comparisonValue13 = scalarValue19 >= 0.0f;
                                bool conditionValue2 = scalarValue19 < 0.0f;
                                comparisonValue14 = (comparisonValue12 && comparisonValue13) ? 1.57079637050628662109375f : ((comparisonValue12 && conditionValue2) ? (-1.57079637050628662109375f) : ((conditionValue1 && conditionValue2) ? (quotientValue3 + (-3.1415927410125732421875f)) : ((conditionValue1 && comparisonValue13) ? (quotientValue3 + 3.1415927410125732421875f) : quotientValue3)));
                            }
                            else
                            {
                                comparisonValue14 = 0.0f;
                            }
                            float multiplyAddValue = mad(abs((frac((comparisonValue14 - viewCbConstants[50u].w) * 0.15915493667125701904296875f) * 2.0f) + (-1.0f)), 0.984375f, 0.0078125f);
                            float multiplyAddValue1 = mad(0.5f - (asin(scalarValue18) * 0.3183098733425140380859375f), 0.96875f, 0.015625f);
                            float productValue56 = viewCbConstants[51u].w * 7.0f;
                            float scalarValue38 = frac(productValue56);
                            uint scalarValue39 = uint(int(floor(productValue56)));
                            float productValue57 = float(int(scalarValue39 + 1u)) * 0.125f;
                            float scalarValue40 = frac(abs(productValue57));
                            float4 sampledTextureValue4 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue, multiplyAddValue1, float(int(scalarValue39))), 0.0f);
                            float scalarValue41 = sampledTextureValue4.x;
                            float scalarValue42 = sampledTextureValue4.y;
                            float scalarValue43 = sampledTextureValue4.z;
                            float productValue58 = scalarValue41 * scalarValue41;
                            float productValue59 = scalarValue42 * scalarValue42;
                            float productValue60 = scalarValue43 * scalarValue43;
                            float4 sampledTextureValue5 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue, multiplyAddValue1, float(int(uint(int(((productValue57 >= ((-0.0f) - productValue57)) ? scalarValue40 : ((-0.0f) - scalarValue40)) * 8.0f))))), 0.0f);
                            float scalarValue44 = sampledTextureValue5.x;
                            float scalarValue45 = sampledTextureValue5.y;
                            float scalarValue46 = sampledTextureValue5.z;
                            float dotProductValue3 = exp2(log2(max(dot(float3(scalarValue17, scalarValue18, scalarValue19), float3(viewCbConstants[52u].xyz)), 0.0f)) * 7.0f);
                            float productValue61 = dotProductValue3 * 0.0500000007450580596923828125f;
                            float productValue62 = ((((scalarValue44 * scalarValue44) - productValue58) * scalarValue38) + productValue58) + (productValue61 * viewCbConstants[50u].x);
                            float productValue63 = ((((scalarValue45 * scalarValue45) - productValue59) * scalarValue38) + productValue59) + (productValue61 * viewCbConstants[50u].y);
                            float productValue64 = ((((scalarValue46 * scalarValue46) - productValue60) * scalarValue38) + productValue60) + (productValue61 * viewCbConstants[50u].z);
                            float productValue65 = (dotProductValue3 * 0.64999997615814208984375f) + 0.3499999940395355224609375f;
                            branchMergedValue13 = ((((viewCbConstants[58u].z * productValue65) - productValue64) * viewCbConstants[58u].w) + productValue64) * viewCbConstants[97u].w;
                            branchMergedValue15 = ((((viewCbConstants[58u].x * productValue65) - productValue62) * viewCbConstants[58u].w) + productValue62) * viewCbConstants[97u].w;
                            branchMergedValue16 = ((((viewCbConstants[58u].y * productValue65) - productValue63) * viewCbConstants[58u].w) + productValue63) * viewCbConstants[97u].w;
                        }
                        branchMergedValue1 = branchMergedValue13;
                        branchMergedValue5 = branchMergedValue15;
                        branchMergedValue6 = branchMergedValue16;
                    }
                    intermediateValue60 = branchMergedValue5;
                    intermediateValue61 = branchMergedValue6;
                    intermediateValue62 = branchMergedValue1;
                }
                float loadedBufferValue12 = asfloat(rdLoad_inputIncidentLight(0u).x);
                float multiplyAddValue2 = clamp(mad(scalarValue2, viewCbConstants[51u].x, viewCbConstants[51u].y), 0.0f, 1.0f);
                intermediateValue40 = (sumValue12 + comparisonValue8) + (multiplyAddValue2 * ((loadedBufferValue12 * intermediateValue60) - sumValue12));
                intermediateValue41 = (sumValue13 + comparisonValue9) + (multiplyAddValue2 * ((loadedBufferValue12 * intermediateValue61) - sumValue13));
                intermediateValue42 = (sumValue14 + comparisonValue10) + (multiplyAddValue2 * ((loadedBufferValue12 * intermediateValue62) - sumValue14));
            }
            float productValue72 = intermediateValue40 * loadedBufferValue6.x;
            float productValue73 = intermediateValue41 * loadedBufferValue6.y;
            float productValue74 = intermediateValue42 * loadedBufferValue6.z;
            float multiplyAddValue3 = clamp(mad(scalarValue3, viewCbConstants[51u].x, viewCbConstants[51u].y), 0.0f, 1.0f);
            float productValue40;
            float productValue41;
            float productValue42;
            if (multiplyAddValue3 > 0.0f)
            {
                float productValue75 = (((viewCbConstants[78u].z * viewCbConstants[81u].z) + productValue1) * 2.0f) + (-1.0f);
                float productValue76 = (1.0f - (productValue2 * 2.0f)) - ((viewCbConstants[81u].w * 2.0f) * viewCbConstants[78u].w);
                float multiplyAddValue4 = mad(0.5f, viewCbConstants[22u].w, mad(productValue76, viewCbConstants[21u].w, productValue75 * viewCbConstants[20u].w)) + viewCbConstants[23u].w;
                float multiplyAddValue5 = ((mad(0.5f, viewCbConstants[22u].x, mad(productValue76, viewCbConstants[21u].x, productValue75 * viewCbConstants[20u].x)) + viewCbConstants[23u].x) / multiplyAddValue4) - viewCbConstants[72u].x;
                float multiplyAddValue6 = ((mad(0.5f, viewCbConstants[22u].y, mad(productValue76, viewCbConstants[21u].y, productValue75 * viewCbConstants[20u].y)) + viewCbConstants[23u].y) / multiplyAddValue4) - viewCbConstants[72u].y;
                float multiplyAddValue7 = ((mad(0.5f, viewCbConstants[22u].z, mad(productValue76, viewCbConstants[21u].z, productValue75 * viewCbConstants[20u].z)) + viewCbConstants[23u].z) / multiplyAddValue4) - viewCbConstants[72u].z;
                float inverseLengthValue4 = rsqrt(dot(float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7), float3(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7)));
                float productValue77 = multiplyAddValue5 * inverseLengthValue4;
                float productValue78 = multiplyAddValue6 * inverseLengthValue4;
                float productValue79 = multiplyAddValue7 * inverseLengthValue4;
                uint4 reinterpretedBits11 = asuint(viewCbConstants[76u]);
                uint scalarValue47 = reinterpretedBits11.w;
                float intermediateValue68;
                float intermediateValue69;
                float intermediateValue70;
                if (scalarValue47 == 1u)
                {
                    intermediateValue68 = viewCbConstants[58u].x;
                    intermediateValue69 = viewCbConstants[58u].y;
                    intermediateValue70 = viewCbConstants[58u].z;
                }
                else
                {
                    float branchMergedValue2;
                    float branchMergedValue7;
                    float branchMergedValue8;
                    if (scalarValue47 == 2u)
                    {
                        uint4 vectorValue2 = asuint(viewCbConstants[74u]);
                        uint scalarValue48 = vectorValue2.z;
                        uint reinterpretedBits14;
                        if (scalarValue48 > 4095u)
                        {
                            reinterpretedBits14 = asuint(viewCbConstants[98u]).w;
                        }
                        else
                        {
                            reinterpretedBits14 = scalarValue48;
                        }
                        float scalarValue49 = abs(productValue77);
                        float scalarValue50 = abs(productValue78);
                        float scalarValue51 = abs(productValue79);
                        float comparisonValue19;
                        float sumValue18;
                        float intermediateValue104;
                        if ((scalarValue49 >= scalarValue50) && (scalarValue49 >= scalarValue51))
                        {
                            comparisonValue19 = (productValue77 < 0.0f) ? ((-0.0f) - productValue79) : productValue79;
                            sumValue18 = (-0.0f) - productValue78;
                            intermediateValue104 = scalarValue49;
                        }
                        else
                        {
                            float sumValue16 = (-0.0f) - productValue77;
                            float branchMergedValue4;
                            float branchMergedValue11;
                            float branchMergedValue12;
                            if (!(scalarValue50 >= scalarValue51))
                            {
                                branchMergedValue4 = scalarValue51;
                                branchMergedValue11 = (-0.0f) - productValue78;
                                branchMergedValue12 = (productValue79 < 0.0f) ? productValue77 : sumValue16;
                            }
                            else
                            {
                                branchMergedValue4 = scalarValue50;
                                branchMergedValue11 = (productValue78 < 0.0f) ? ((-0.0f) - productValue79) : productValue79;
                                branchMergedValue12 = sumValue16;
                            }
                            comparisonValue19 = branchMergedValue12;
                            sumValue18 = branchMergedValue11;
                            intermediateValue104 = branchMergedValue4;
                        }
                        precise float quotientValue4 = 0.5f / intermediateValue104;
                        float4 sampledTextureValue6 = textures[NonUniformResourceIndex(reinterpretedBits14 + 0u)].SampleLevel(linearSampler, float2(frac(mad(comparisonValue19, quotientValue4, 0.5f) * viewCbConstants[74u].x), frac(mad(sumValue18, quotientValue4, 0.5f) * viewCbConstants[74u].y)), 0.0f);
                        branchMergedValue2 = (viewCbConstants[58u].z * sampledTextureValue6.z) * viewCbConstants[97u].w;
                        branchMergedValue7 = (viewCbConstants[58u].y * sampledTextureValue6.y) * viewCbConstants[97u].w;
                        branchMergedValue8 = (viewCbConstants[58u].x * sampledTextureValue6.x) * viewCbConstants[97u].w;
                    }
                    else
                    {
                        float branchMergedValue14;
                        float branchMergedValue17;
                        float branchMergedValue18;
                        if (scalarValue47 == 4u)
                        {
                            float scalarValue52 = (dot(float3(productValue77, productValue78, productValue79), float3(viewCbConstants[52u].xyz)) * 0.5f) + 0.5f;
                            branchMergedValue14 = ((viewCbConstants[75u].z - viewCbConstants[76u].z) * scalarValue52) + viewCbConstants[76u].z;
                            branchMergedValue17 = ((viewCbConstants[75u].y - viewCbConstants[76u].y) * scalarValue52) + viewCbConstants[76u].y;
                            branchMergedValue18 = ((viewCbConstants[75u].x - viewCbConstants[76u].x) * scalarValue52) + viewCbConstants[76u].x;
                        }
                        else
                        {
                            float comparisonValue17;
                            if (abs(productValue78) < 1.0f)
                            {
                                float quotientValue5 = atan(productValue79 / productValue77);
                                bool conditionValue3 = productValue77 < 0.0f;
                                bool comparisonValue15 = productValue77 == 0.0f;
                                bool comparisonValue16 = productValue79 >= 0.0f;
                                bool conditionValue4 = productValue79 < 0.0f;
                                comparisonValue17 = (comparisonValue15 && comparisonValue16) ? 1.57079637050628662109375f : ((comparisonValue15 && conditionValue4) ? (-1.57079637050628662109375f) : ((conditionValue3 && conditionValue4) ? (quotientValue5 + (-3.1415927410125732421875f)) : ((conditionValue3 && comparisonValue16) ? (quotientValue5 + 3.1415927410125732421875f) : quotientValue5)));
                            }
                            else
                            {
                                comparisonValue17 = 0.0f;
                            }
                            float multiplyAddValue9 = mad(abs((frac((comparisonValue17 - viewCbConstants[50u].w) * 0.15915493667125701904296875f) * 2.0f) + (-1.0f)), 0.984375f, 0.0078125f);
                            float multiplyAddValue10 = mad(0.5f - (asin(productValue78) * 0.3183098733425140380859375f), 0.96875f, 0.015625f);
                            float productValue80 = viewCbConstants[51u].w * 7.0f;
                            float scalarValue53 = frac(productValue80);
                            uint scalarValue54 = uint(int(floor(productValue80)));
                            float productValue81 = float(int(scalarValue54 + 1u)) * 0.125f;
                            float scalarValue55 = frac(abs(productValue81));
                            float4 sampledTextureValue7 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue9, multiplyAddValue10, float(int(scalarValue54))), 0.0f);
                            float scalarValue56 = sampledTextureValue7.x;
                            float scalarValue57 = sampledTextureValue7.y;
                            float scalarValue58 = sampledTextureValue7.z;
                            float productValue82 = scalarValue56 * scalarValue56;
                            float productValue83 = scalarValue57 * scalarValue57;
                            float productValue84 = scalarValue58 * scalarValue58;
                            float4 sampledTextureValue8 = skyTexture.SampleLevel(linearSampler, float3(multiplyAddValue9, multiplyAddValue10, float(int(uint(int(((productValue81 >= ((-0.0f) - productValue81)) ? scalarValue55 : ((-0.0f) - scalarValue55)) * 8.0f))))), 0.0f);
                            float scalarValue59 = sampledTextureValue8.x;
                            float scalarValue60 = sampledTextureValue8.y;
                            float scalarValue61 = sampledTextureValue8.z;
                            float dotProductValue4 = exp2(log2(max(dot(float3(productValue77, productValue78, productValue79), float3(viewCbConstants[52u].xyz)), 0.0f)) * 7.0f);
                            float productValue85 = dotProductValue4 * 0.0500000007450580596923828125f;
                            float productValue86 = ((((scalarValue59 * scalarValue59) - productValue82) * scalarValue53) + productValue82) + (productValue85 * viewCbConstants[50u].x);
                            float productValue87 = ((((scalarValue60 * scalarValue60) - productValue83) * scalarValue53) + productValue83) + (productValue85 * viewCbConstants[50u].y);
                            float productValue88 = ((((scalarValue61 * scalarValue61) - productValue84) * scalarValue53) + productValue84) + (productValue85 * viewCbConstants[50u].z);
                            float productValue89 = (dotProductValue4 * 0.64999997615814208984375f) + 0.3499999940395355224609375f;
                            branchMergedValue14 = ((((viewCbConstants[58u].z * productValue89) - productValue88) * viewCbConstants[58u].w) + productValue88) * viewCbConstants[97u].w;
                            branchMergedValue17 = ((((viewCbConstants[58u].y * productValue89) - productValue87) * viewCbConstants[58u].w) + productValue87) * viewCbConstants[97u].w;
                            branchMergedValue18 = ((((viewCbConstants[58u].x * productValue89) - productValue86) * viewCbConstants[58u].w) + productValue86) * viewCbConstants[97u].w;
                        }
                        branchMergedValue2 = branchMergedValue14;
                        branchMergedValue7 = branchMergedValue17;
                        branchMergedValue8 = branchMergedValue18;
                    }
                    intermediateValue68 = branchMergedValue8;
                    intermediateValue69 = branchMergedValue7;
                    intermediateValue70 = branchMergedValue2;
                }
                float loadedBufferValue13 = asfloat(rdLoad_inputIncidentLight(0u).x);
                float4 sampledTextureValue9 = volumetricResolvedTransmission.SampleLevel(linearSampler, float3(productValue1, productValue2, 1.0f), 0.0f);
                float productValue90 = (loadedBufferValue13 * intermediateValue68) * sampledTextureValue9.x;
                float productValue91 = (loadedBufferValue13 * intermediateValue69) * sampledTextureValue9.y;
                float productValue92 = (loadedBufferValue13 * intermediateValue70) * sampledTextureValue9.z;
                productValue40 = (((productValue90 - productValue72) + ((viewCbConstants[77u].x - productValue90) * viewCbConstants[77u].w)) * multiplyAddValue3) + productValue72;
                productValue41 = (((productValue91 - productValue73) + ((viewCbConstants[77u].y - productValue91) * viewCbConstants[77u].w)) * multiplyAddValue3) + productValue73;
                productValue42 = (((productValue92 - productValue74) + ((viewCbConstants[77u].z - productValue92) * viewCbConstants[77u].w)) * multiplyAddValue3) + productValue74;
            }
            else
            {
                productValue40 = productValue72;
                productValue41 = productValue73;
                productValue42 = productValue74;
            }
            intermediateValue26 = comparisonValue11 ? (productValue40 + comparisonValue8) : productValue40;
            intermediateValue27 = comparisonValue11 ? (productValue41 + comparisonValue9) : productValue41;
            intermediateValue28 = comparisonValue11 ? (productValue42 + comparisonValue10) : productValue42;
        }
        uint4 reinterpretedBits12 = asuint(viewCbConstants[91u]);
        float intermediateValue29;
        float intermediateValue30;
        float intermediateValue31;
        if (reinterpretedBits12.y == 0u)
        {
            intermediateValue29 = intermediateValue26;
            intermediateValue30 = intermediateValue27;
            intermediateValue31 = intermediateValue28;
        }
        else
        {
            float4 vectorValue3 = outputBufferReferencePathTracer[uint2(comparisonValue1, dispatchThreadId.y)].xxxx;
            float scalarValue62 = vectorValue3.x;
            float scalarValue63 = vectorValue3.y;
            float scalarValue64 = vectorValue3.z;
            float quotientValue6 = 1.0f / float(reinterpretedBits12.x);
            float productValue93 = ((intermediateValue26 - scalarValue62) * quotientValue6) + scalarValue62;
            float productValue94 = ((intermediateValue27 - scalarValue63) * quotientValue6) + scalarValue63;
            float productValue95 = ((intermediateValue28 - scalarValue64) * quotientValue6) + scalarValue64;
            outputBufferReferencePathTracer[uint2(comparisonValue1, dispatchThreadId.y)] = float4(productValue93, productValue94, productValue95, 0.0f).x;
            intermediateValue29 = productValue93;
            intermediateValue30 = productValue94;
            intermediateValue31 = productValue95;
        }
        float multiplyAddValue11 = mad(intermediateValue29, reinterpretedBits4 ? 0.0f : intermediateValue15, reinterpretedBits3 ? 0.0f : productValue6);
        float multiplyAddValue12 = mad(intermediateValue30, reinterpretedBits4 ? 0.0f : intermediateValue16, reinterpretedBits3 ? 0.0f : productValue7);
        float multiplyAddValue13 = mad(intermediateValue31, reinterpretedBits4 ? 0.0f : intermediateValue17, reinterpretedBits3 ? 0.0f : productValue8);
        float productValue32;
        float productValue33;
        float productValue34;
        if ((asuint(viewCbConstants[95u]).w == 0u) && (viewCbConstants[78u].x < viewCbConstants[79u].x))
        {
            productValue32 = max(multiplyAddValue11 * 0.25f, 0.0f);
            productValue33 = max(multiplyAddValue12 * 0.25f, 0.0f);
            productValue34 = max(multiplyAddValue13 * 0.25f, 0.0f);
        }
        else
        {
            float2 loadedBufferValue14 = asfloat(uint2(rdLoad_inputIncidentLight(0u).x, rdLoad_inputIncidentLight(0u + 1u).x));
            float quotientValue7 = loadedBufferValue14.y / loadedBufferValue14.x;
            productValue32 = quotientValue7 * multiplyAddValue11;
            productValue33 = quotientValue7 * multiplyAddValue12;
            productValue34 = quotientValue7 * multiplyAddValue13;
        }
        float productValue49;
        float productValue50;
        float productValue51;
        if (outputBufferDebug[uint2(0u, 0u)].xxxx.w != 0.0f)
        {
            float clampedValue8 = clamp(productValue32, 0.0f, 1.0f) * 0.00999999977648258209228515625f;
            float clampedValue9 = clamp(productValue33, 0.0f, 1.0f) * 0.00999999977648258209228515625f;
            float clampedValue10 = clamp(productValue34, 0.0f, 1.0f) * 0.00999999977648258209228515625f;
            float4 vectorValue4 = outputBufferDebug[uint2(comparisonValue1, dispatchThreadId.y)].xxxx;
            float scalarValue65 = vectorValue4.w;
            productValue49 = ((vectorValue4.x - clampedValue8) * scalarValue65) + clampedValue8;
            productValue50 = ((vectorValue4.y - clampedValue9) * scalarValue65) + clampedValue9;
            productValue51 = ((vectorValue4.z - clampedValue10) * scalarValue65) + clampedValue10;
        }
        else
        {
            productValue49 = productValue32;
            productValue50 = productValue33;
            productValue51 = productValue34;
        }
        if (asuint(viewCbConstants[91u]).y == 2u)
        {
            outputBufferFinal[uint2(comparisonValue1, dispatchThreadId.y)] = float4(productValue49, productValue50, productValue51, 0.0f);
        }
        else
        {
            outputBufferPreInterleave[uint2(comparisonValue1, dispatchThreadId.y)] = float4(productValue49, productValue50, productValue51, scalarValue20);
            outputBufferReflectionMotionVectors[uint2(comparisonValue1, dispatchThreadId.y)] = float4(inputBufferMotionVectors.Load(int3(uint2(dispatchThreadId.x, dispatchThreadId.y), 0u)).xyxx);
        }
    }
}
[numthreads(16, 16, 1)]
void main(ComputeStageInput stage_input)
{
    dispatchThreadId = stage_input.dispatchThreadId;
    executeComputeStage();
}
