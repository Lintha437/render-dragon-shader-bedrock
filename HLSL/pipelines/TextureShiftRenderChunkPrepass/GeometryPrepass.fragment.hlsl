// TextureShiftRenderChunkPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT_FLOAT_2 1
#endif

#include "../../include/materials/TextureShiftRenderChunkPrepass/FragmentBindings.hlsli"

#include "../../include/Math.hlsli"
void executeFragmentStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool comparisonValue = (varyingSv_Isfrontface0 ? 4294967295u : 0u) != 0u;
#endif
    uint productValue = uint(int(varyingTexCoord6.y * 65535.0f));
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue34 = productValue * 8u;
    float4 loadedBufferValue19 = asfloat(uint4(rdLoad_intermediateValue2(productValue34).x, rdLoad_intermediateValue2(productValue34 + 1u).x, rdLoad_intermediateValue2(productValue34 + 2u).x, rdLoad_intermediateValue2(productValue34 + 3u).x));
    uint productValue35 = (productValue * 8u) + 4u;
    float4 loadedBufferValue20 = asfloat(uint4(rdLoad_intermediateValue2(productValue35).x, rdLoad_intermediateValue2(productValue35 + 1u).x, rdLoad_intermediateValue2(productValue35 + 2u).x, rdLoad_intermediateValue2(productValue35 + 3u).x));
    float scalarValue20 = loadedBufferValue20.x;
    float scalarValue21 = loadedBufferValue20.y;
    float scalarValue22 = loadedBufferValue20.z;
    float multiplyAddValue14 = mad(-varyingTexCoord6.x, loadedBufferValue20.w, 1.0f);
    float clampedValue10 = (scalarValue22 == 0.0f) ? float(scalarValue21 >= multiplyAddValue14) : (1.0f - clamp((multiplyAddValue14 - scalarValue21) / scalarValue22, 0.0f, 1.0f));
    bool conditionValue7 = clampedValue10 < 0.5f;
    uint reinterpretedBits = uint(int(asuint(scalarValue20)) >> int(16u)) & 65535u;
    float sumValue9 = loadedBufferValue19.x + varyingTexCoord0.x;
    float sumValue10 = loadedBufferValue19.y + varyingTexCoord0.y;
    float sumValue11 = loadedBufferValue19.z + varyingTexCoord0.x;
    float sumValue12 = loadedBufferValue19.w + varyingTexCoord0.y;
    uint reinterpretedBits1 = asuint(scalarValue20) & 65535u;
    float comparisonValue17 = conditionValue7 ? sumValue9 : sumValue11;
    float comparisonValue18 = conditionValue7 ? sumValue10 : sumValue12;
    uint comparisonValue19 = conditionValue7 ? reinterpretedBits : reinterpretedBits1;
    float4 sampledTextureValue5 = materialTexture1.Sample(textureSampler1, float2(sumValue9, sumValue10));
    float scalarValue23 = sampledTextureValue5.x;
    float scalarValue24 = sampledTextureValue5.y;
    float scalarValue25 = sampledTextureValue5.z;
    float4 sampledTextureValue6 = materialTexture1.Sample(textureSampler1, float2(sumValue11, sumValue12));
    float multiplyAddValue15 = mad(clampedValue10, sampledTextureValue6.x - scalarValue23, scalarValue23);
    float multiplyAddValue16 = mad(clampedValue10, sampledTextureValue6.y - scalarValue24, scalarValue24);
    float multiplyAddValue17 = mad(clampedValue10, sampledTextureValue6.z - scalarValue25, scalarValue25);
    float comparisonValue20 = (clampedValue10 > 0.5f) ? sampledTextureValue6.w : sampledTextureValue5.w;
    bool comparisonValue21 = varyingTexCoord2.y != 0.0f;
    fragmentColor1.x = comparisonValue21 ? (mad(comparisonValue20, mad(multiplyAddValue15, varyingColor0.x, -multiplyAddValue15), multiplyAddValue15) * varyingColor0.w) : (multiplyAddValue15 * varyingColor0.x);
    fragmentColor1.y = comparisonValue21 ? (mad(comparisonValue20, mad(multiplyAddValue16, varyingColor0.y, -multiplyAddValue16), multiplyAddValue16) * varyingColor0.w) : (multiplyAddValue16 * varyingColor0.y);
    fragmentColor1.z = comparisonValue21 ? (mad(comparisonValue20, mad(multiplyAddValue17, varyingColor0.z, -multiplyAddValue17), multiplyAddValue17) * varyingColor0.w) : (multiplyAddValue17 * varyingColor0.z);
    float intermediateValue20;
    float intermediateValue22;
    float multiplyAddValue4;
    float multiplyAddValue5;
    float multiplyAddValue6;
    float intermediateValue24;
    float intermediateValue26;
    if (((!conditionValue7) && (reinterpretedBits1 != 65535u)) || (conditionValue7 && (reinterpretedBits != 65535u)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float loadedBufferValue = asfloat(rdLoad_textureShiftBufferData(productValue * 8u).x);
    float loadedBufferValue1 = asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 1u).x);
    float loadedBufferValue2 = asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 2u).x);
    float loadedBufferValue3 = asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 3u).x);
    uint4 loadedBufferValue4 = rdLoad_textureShiftBufferData((productValue * 8u) + 4u);
    uint scalarValue = loadedBufferValue4.x;
    float loadedBufferValue5 = asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 5u).x);
    float loadedBufferValue6 = asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 6u).x);
    float loadedBufferValue7 = 1.0f - (asfloat(rdLoad_textureShiftBufferData((productValue * 8u) + 7u).x) * varyingTexCoord6.x);
    float quotientValue;
    if (loadedBufferValue6 == 0.0f)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint productValue36 = (comparisonValue19 * 16u) + 4u;
        float4 loadedBufferValue21 = asfloat(uint4(rdLoad_intermediateValue1(productValue36).x, rdLoad_intermediateValue1(productValue36 + 1u).x, rdLoad_intermediateValue1(productValue36 + 2u).x, rdLoad_intermediateValue1(productValue36 + 3u).x));
        float scalarValue26 = loadedBufferValue21.x;
        float scalarValue27 = loadedBufferValue21.y;
        float scalarValue28 = loadedBufferValue21.z;
        float scalarValue29 = loadedBufferValue21.w;
        uint productValue37 = (comparisonValue19 * 16u) + 8u;
        float4 loadedBufferValue22 = asfloat(uint4(rdLoad_intermediateValue1(productValue37).x, rdLoad_intermediateValue1(productValue37 + 1u).x, rdLoad_intermediateValue1(productValue37 + 2u).x, rdLoad_intermediateValue1(productValue37 + 3u).x));
        uint productValue38 = (comparisonValue19 * 16u) + 12u;
        float2 loadedBufferValue23 = asfloat(uint2(rdLoad_intermediateValue1(productValue38).x, rdLoad_intermediateValue1(productValue38 + 1u).x));
        float scalarValue30 = loadedBufferValue23.x;
        float scalarValue31 = loadedBufferValue23.y;
        uint reinterpretedBits2 = asuint(loadedBufferValue22.x);
        float multiplyAddValue11;
        float multiplyAddValue12;
        float multiplyAddValue13;
        if ((reinterpretedBits2 & 4u) == 4u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        quotientValue = (loadedBufferValue5 < loadedBufferValue7) ? 0.0f : 1.0f;
    }
    else
    {
        quotientValue = 1.0f - min(max((loadedBufferValue7 - loadedBufferValue5) / loadedBufferValue6, 0.0f), 1.0f);
    }
    bool conditionValue = quotientValue < 0.5f;
    precise float comparisonValue1 = varyingTexCoord0.y + (conditionValue ? loadedBufferValue1 : loadedBufferValue3);
    precise float comparisonValue2 = varyingTexCoord0.x + (conditionValue ? loadedBufferValue : loadedBufferValue2);
    uint comparisonValue3 = (conditionValue ? (scalarValue >> 16u) : scalarValue) & 65535u;
    float4 sampledTextureValue = matTextureTexture.Sample(matTextureSampler, float2(loadedBufferValue + varyingTexCoord0.x, loadedBufferValue1 + varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
    float4 sampledTextureValue1 = matTextureTexture.Sample(matTextureSampler, float2(loadedBufferValue2 + varyingTexCoord0.x, loadedBufferValue3 + varyingTexCoord0.y));
    float productValue1 = ((sampledTextureValue1.x - scalarValue1) * quotientValue) + scalarValue1;
    float productValue2 = ((sampledTextureValue1.y - scalarValue2) * quotientValue) + scalarValue2;
    float productValue3 = ((sampledTextureValue1.z - scalarValue3) * quotientValue) + scalarValue3;
    float comparisonValue4 = (quotientValue > 0.5f) ? sampledTextureValue1.w : sampledTextureValue.w;
    float productValue4 = productValue1 * varyingColor0.x;
    float productValue5 = productValue2 * varyingColor0.y;
    float productValue6 = productValue3 * varyingColor0.z;
    float productValue7;
    float productValue8;
    float productValue9;
    if (varyingTexCoord2.y != 0.0f)
    {
        productValue7 = (((productValue4 - productValue1) * comparisonValue4) + productValue1) * varyingColor0.w;
        productValue8 = (((productValue5 - productValue2) * comparisonValue4) + productValue2) * varyingColor0.w;
        productValue9 = (((productValue6 - productValue3) * comparisonValue4) + productValue3) * varyingColor0.w;
    }
    else
    {
        productValue7 = productValue4;
        productValue8 = productValue5;
        productValue9 = productValue6;
    }
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if (comparisonValue3 == 65535u)
    {
        intermediateValue7 = 0.0f;
        intermediateValue8 = 1.0f;
        intermediateValue9 = 0.0f;
        intermediateValue10 = 0.0f;
        intermediateValue12 = 0.0f;
        intermediateValue13 = 1.0f;
        intermediateValue14 = 0.0f;
    }
    else
    {
        float loadedBufferValue11 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 4u).x);
        float loadedBufferValue12 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 5u).x);
        float loadedBufferValue13 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 6u).x);
        float loadedBufferValue14 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 7u).x);
        uint4 loadedBufferValue15 = rdLoad_pbrData((comparisonValue3 * 16u) + 8u);
        uint scalarValue4 = loadedBufferValue15.x;
        float loadedBufferValue16 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 12u).x);
        float loadedBufferValue17 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 13u).x);
        float loadedBufferValue18 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 15u).x);
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        if ((scalarValue4 & 4u) == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float4 sampledTextureValue7 = materialTexture1.Sample(textureSampler1, float2(mad(comparisonValue17, scalarValue26, scalarValue28), mad(comparisonValue18, scalarValue27, scalarValue29)));
            multiplyAddValue11 = mad(sampledTextureValue7.y, 2.0f, -1.0f);
            multiplyAddValue12 = mad(sampledTextureValue7.x, 2.0f, -1.0f);
            multiplyAddValue13 = mad(sampledTextureValue7.z, 2.0f, -1.0f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue4 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue4 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0f;
                    branchMergedValue5 = 0.0f;
                    branchMergedValue6 = 1.0f;
                }
                else
                {
                    float multiplyAddValue = mad(comparisonValue2, loadedBufferValue11, loadedBufferValue13);
                    float multiplyAddValue1 = mad(comparisonValue1, loadedBufferValue12, loadedBufferValue14);
                    float4 sampledTextureValue2 = matTextureTexture.SampleLevel(matTextureSampler, float2(multiplyAddValue, multiplyAddValue1), 0.0f);
                    float scalarValue5 = sampledTextureValue2.x;
                    float scalarValue6 = sampledTextureValue2.y;
                    float scalarValue7 = sampledTextureValue2.z;
                    float multiplyAddValue2 = clamp(mad(min(loadedBufferValue18 - loadedBufferValue17, loadedBufferValue18), -1.0f, 2.0f), 0.0f, 1.0f);
                    bool conditionValue1 = multiplyAddValue2 > 0.0f;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue5 == scalarValue6) && (scalarValue6 == scalarValue7))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue1)
                        {
                            uint unusedTextureMipCount672;
                            uint2 vectorValue = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount672);
                            float productValue10 = float(int(uint(int(float(int(vectorValue.x)))))) * multiplyAddValue;
                            float productValue11 = float(int(uint(int(float(int(vectorValue.y)))))) * multiplyAddValue1;
                            float scalarValue8 = frac(productValue10);
                            float scalarValue9 = frac(productValue11);
                            float comparisonValue14;
                            if (abs(scalarValue8 + (-0.5f)) < 0.0625f)
                            {
                                comparisonValue14 = ((scalarValue8 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue;
                            }
                            else
                            {
                                comparisonValue14 = multiplyAddValue;
                            }
                            float comparisonValue15;
                            if (abs(scalarValue9 + (-0.5f)) < 0.0625f)
                            {
                                comparisonValue15 = ((scalarValue9 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue15 = multiplyAddValue1;
                            }
                            float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue14, comparisonValue15));
                            float scalarValue10 = vectorValue1.x;
                            float scalarValue11 = vectorValue1.y;
                            float scalarValue12 = vectorValue1.z;
                            float scalarValue13 = vectorValue1.w;
                            float sumValue = frac(productValue10 + 0.5f);
                            float sumValue1 = frac(productValue11 + 0.5f);
                            bool conditionValue2 = sumValue1 > 0.5f;
                            float intermediateValue[2];
                            intermediateValue[0u] = conditionValue2 ? scalarValue10 : scalarValue13;
                            intermediateValue[1u] = conditionValue2 ? scalarValue11 : scalarValue12;
                            float clampedValue3 = intermediateValue[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue4 = intermediateValue[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue2 = clampedValue3 - clampedValue4;
                            bool conditionValue3 = sumValue > 0.5f;
                            intermediateValue[0u] = conditionValue3 ? scalarValue12 : scalarValue13;
                            intermediateValue[1u] = conditionValue3 ? scalarValue11 : scalarValue10;
                            float clampedValue5 = intermediateValue[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue = rsqrt(dot(float3(sumValue2, clampedValue5, 0.25f), float3(sumValue2, clampedValue5, 0.25f)));
                            float productValue12 = inverseLengthValue * multiplyAddValue2;
                            branchMergedValue12 = productValue12 * sumValue2;
                            branchMergedValue14 = productValue12 * clampedValue5;
                            branchMergedValue15 = inverseLengthValue * 0.25f;
                        }
                        else
                        {
                            branchMergedValue12 = 0.0f;
                            branchMergedValue14 = 0.0f;
                            branchMergedValue15 = 1.0f;
                        }
                        branchMergedValue9 = branchMergedValue12;
                        branchMergedValue10 = branchMergedValue14;
                        branchMergedValue11 = branchMergedValue15;
                    }
                    else
                    {
                        uint unusedTextureMipCount662;
                        uint2 vectorValue2 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount662);
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue1)
                        {
                            float productValue13 = frac(float(int(uint(int(float(int(vectorValue2.x)))))) * multiplyAddValue);
                            float productValue14 = frac(float(int(uint(int(float(int(vectorValue2.y)))))) * multiplyAddValue1);
                            float comparisonValue6 = (((productValue13 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue6 * 2.0f) + (-1.0f))) - (((productValue13 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.w * 2.0f) + (-1.0f)));
                            float comparisonValue7 = (((productValue14 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f))) - (((productValue14 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue5 * 2.0f) + (-1.0f)));
                            float comparisonValue9 = ((abs(comparisonValue6) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue6;
                            float comparisonValue10 = ((abs(comparisonValue7) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue7;
                            float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue9, comparisonValue10, 0.25f), float3(comparisonValue9, comparisonValue10, 0.25f)));
                            float productValue15 = inverseLengthValue1 * multiplyAddValue2;
                            branchMergedValue13 = productValue15 * comparisonValue9;
                            branchMergedValue16 = productValue15 * comparisonValue10;
                            branchMergedValue17 = inverseLengthValue1 * 0.25f;
                        }
                        else
                        {
                            branchMergedValue13 = 0.0f;
                            branchMergedValue16 = 0.0f;
                            branchMergedValue17 = 1.0f;
                        }
                        branchMergedValue9 = branchMergedValue13;
                        branchMergedValue10 = branchMergedValue16;
                        branchMergedValue11 = branchMergedValue17;
                    }
                    branchMergedValue3 = branchMergedValue9;
                    branchMergedValue5 = branchMergedValue10;
                    branchMergedValue6 = branchMergedValue11;
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue5;
                branchMergedValue2 = branchMergedValue6;
            }
            else
            {
                float multiplyAddValue3 = mad(comparisonValue2, loadedBufferValue11, loadedBufferValue13);
                float multiplyAddValue7 = mad(comparisonValue1, loadedBufferValue12, loadedBufferValue14);
                float multiplyAddValue8 = clamp(mad(min(loadedBufferValue18 - loadedBufferValue17, loadedBufferValue18), -1.0f, 2.0f), 0.0f, 1.0f);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue8 > 0.0f)
                {
                    uint unusedTextureMipCount600;
                    uint2 vectorValue3 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount600);
                    float productValue16 = float(int(uint(int(float(int(vectorValue3.x)))))) * multiplyAddValue3;
                    float productValue20 = float(int(uint(int(float(int(vectorValue3.y)))))) * multiplyAddValue7;
                    float scalarValue14 = frac(productValue16);
                    float scalarValue15 = frac(productValue20);
                    float comparisonValue8;
                    if (abs(scalarValue14 + (-0.5f)) < 0.0625f)
                    {
                        comparisonValue8 = ((scalarValue14 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue3;
                    }
                    else
                    {
                        comparisonValue8 = multiplyAddValue3;
                    }
                    float comparisonValue13;
                    if (abs(scalarValue15 + (-0.5f)) < 0.0625f)
                    {
                        comparisonValue13 = ((scalarValue15 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue7;
                    }
                    else
                    {
                        comparisonValue13 = multiplyAddValue7;
                    }
                    float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue8, comparisonValue13));
                    float scalarValue16 = vectorValue4.x;
                    float scalarValue17 = vectorValue4.y;
                    float scalarValue18 = vectorValue4.z;
                    float scalarValue19 = vectorValue4.w;
                    float sumValue3 = frac(productValue16 + 0.5f);
                    float sumValue4 = frac(productValue20 + 0.5f);
                    bool conditionValue4 = sumValue4 > 0.5f;
                    float rdAccess_intermediateValue1(2);
                    rdAccess_intermediateValue1(0u) = conditionValue4 ? scalarValue16 : scalarValue19;
                    rdAccess_intermediateValue1(1u) = conditionValue4 ? scalarValue17 : scalarValue18;
                    float clampedValue6 = rdAccess_intermediateValue1(uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f))));
                    float clampedValue7 = rdAccess_intermediateValue1(uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f))));
                    float sumValue5 = clampedValue6 - clampedValue7;
                    bool conditionValue5 = sumValue3 > 0.5f;
                    rdAccess_intermediateValue1(0u) = conditionValue5 ? scalarValue18 : scalarValue19;
                    rdAccess_intermediateValue1(1u) = conditionValue5 ? scalarValue17 : scalarValue16;
                    float clampedValue8 = rdAccess_intermediateValue1(uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))) - rdAccess_intermediateValue1(uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f))));
                    float inverseLengthValue2 = rsqrt(dot(float3(sumValue5, clampedValue8, 0.25f), float3(sumValue5, clampedValue8, 0.25f)));
                    float productValue21 = inverseLengthValue2 * multiplyAddValue8;
                    branchMergedValue4 = productValue21 * sumValue5;
                    branchMergedValue7 = productValue21 * clampedValue8;
                    branchMergedValue8 = inverseLengthValue2 * 0.25f;
                }
                else
                {
                    branchMergedValue4 = 0.0f;
                    branchMergedValue7 = 0.0f;
                    branchMergedValue8 = 1.0f;
                }
                branchMergedValue = branchMergedValue4;
                branchMergedValue1 = branchMergedValue7;
                branchMergedValue2 = branchMergedValue8;
            }
            intermediateValue17 = branchMergedValue;
            intermediateValue18 = branchMergedValue1;
            intermediateValue19 = branchMergedValue2;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float loadedBufferValue24 = asfloat(rdLoad_intermediateValue1((comparisonValue19 * 16u) + 15u).x);
            float intermediateValue29;
            float intermediateValue30;
            float intermediateValue31;
            if ((reinterpretedBits2 & 8u) == 8u)
            {
                float clampedValue11 = clamp(2.0f - min(loadedBufferValue24, loadedBufferValue24 - scalarValue31), 0.0f, 1.0f);
                float productValue17;
                float productValue18;
                float productValue19;
                if (clampedValue11 > 0.0f)
                {
                    float multiplyAddValue18 = mad(comparisonValue17, scalarValue26, scalarValue28);
                    float multiplyAddValue19 = mad(comparisonValue18, scalarValue27, scalarValue29);
                    uint intermediateValue35;
                    rdTextureSize(materialTexture1, 0u, intermediateValue35);
                    bool conditionValue8 = intermediateValue35 > 0u;
                    uint unusedTextureMipCount657;
                    uint2 vectorValue5 = rdTextureSize(materialTexture1, 0u, unusedTextureMipCount657);
                    uint scalarValue32 = vectorValue5.x;
                    float comparisonValue22 = rdUnsignedToFloat(conditionValue8 ? scalarValue32 : 0u);
                    float comparisonValue23 = rdUnsignedToFloat(conditionValue8 ? vectorValue5.y : 0u);
                    float productValue39 = frac(multiplyAddValue18 * comparisonValue22);
                    float productValue40 = frac(multiplyAddValue19 * comparisonValue23);
                    float4 comparisonValue24 = materialTexture1.GatherRed(textureSampler1, float2((abs(productValue39 - 0.5f) < 0.0625f) ? (((productValue39 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue18) : multiplyAddValue18, (abs(productValue40 - 0.5f) < 0.0625f) ? (((productValue40 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue19) : multiplyAddValue19));
                    float scalarValue33 = comparisonValue24.x;
                    float scalarValue34 = comparisonValue24.y;
                    float scalarValue35 = comparisonValue24.z;
                    float scalarValue36 = comparisonValue24.w;
                    float multiplyAddValue20 = frac(mad(multiplyAddValue18, comparisonValue22, 0.5f));
                    float multiplyAddValue21 = frac(mad(multiplyAddValue19, comparisonValue23, 0.5f));
                    bool conditionValue9 = multiplyAddValue21 > 0.5f;
                    bool conditionValue10 = multiplyAddValue20 > 0.5f;
                    float comparisonValue25 = conditionValue9 ? scalarValue33 : scalarValue36;
                    float comparisonValue26 = conditionValue9 ? scalarValue34 : scalarValue35;
                    float comparisonValue27 = conditionValue10 ? scalarValue35 : scalarValue36;
                    float comparisonValue28 = conditionValue10 ? scalarValue34 : scalarValue33;
                    float sumValue13 = multiplyAddValue20 - 0.083333335816860198974609375f;
                    float sumValue14 = multiplyAddValue20 + 0.083333335816860198974609375f;
                    float sumValue15 = multiplyAddValue21 - 0.083333335816860198974609375f;
                    float sumValue16 = multiplyAddValue21 + 0.083333335816860198974609375f;
                    uint clampedValue12 = uint(int(clamp(sumValue13 + sumValue13, 0.0f, 1.0f)));
                    uint clampedValue13 = uint(int(clamp(sumValue14 + sumValue14, 0.0f, 1.0f)));
                    uint clampedValue14 = uint(int(clamp(sumValue15 + sumValue15, 0.0f, 1.0f)));
                    uint clampedValue15 = uint(int(clamp(sumValue16 + sumValue16, 0.0f, 1.0f)));
                    float comparisonValue29 = ((clampedValue12 == 1u) ? comparisonValue26 : ((clampedValue12 == 0u) ? comparisonValue25 : 0.0f)) - ((clampedValue13 == 1u) ? comparisonValue26 : ((clampedValue13 == 0u) ? comparisonValue25 : 0.0f));
                    float comparisonValue30 = ((clampedValue14 == 1u) ? comparisonValue28 : ((clampedValue14 == 0u) ? comparisonValue27 : 0.0f)) - ((clampedValue15 == 1u) ? comparisonValue28 : ((clampedValue15 == 0u) ? comparisonValue27 : 0.0f));
                    float3 vectorValue6 = float3(comparisonValue29, comparisonValue30, 0.25f);
                    float inverseLengthValue7 = rsqrt(rdDot3Precise(vectorValue6, vectorValue6));
                    productValue17 = clampedValue11 * (inverseLengthValue7 * comparisonValue30);
                    productValue18 = clampedValue11 * (inverseLengthValue7 * comparisonValue29);
                    productValue19 = inverseLengthValue7 * 0.25f;
                }
                else
                {
                    productValue17 = 0.0f;
                    productValue18 = 0.0f;
                    productValue19 = 1.0f;
                }
                intermediateValue29 = productValue17;
                intermediateValue30 = productValue18;
                intermediateValue31 = productValue19;
            }
            else
            {
                float intermediateValue49;
                float intermediateValue51;
                float intermediateValue53;
                if ((reinterpretedBits2 & 16u) == 16u)
                {
                    float multiplyAddValue22 = mad(comparisonValue17, scalarValue26, scalarValue28);
                    float multiplyAddValue23 = mad(comparisonValue18, scalarValue27, scalarValue29);
                    float sumValue17 = min(loadedBufferValue24, loadedBufferValue24 - scalarValue31);
                    float4 sampledTextureValue8 = materialTexture1.SampleLevel(textureSampler1, float2(multiplyAddValue22, multiplyAddValue23), 0.0f);
                    float scalarValue37 = sampledTextureValue8.x;
                    float scalarValue38 = sampledTextureValue8.y;
                    float scalarValue39 = sampledTextureValue8.z;
                    float intermediateValue50;
                    float intermediateValue52;
                    float intermediateValue54;
                    if ((scalarValue38 == scalarValue37) && (scalarValue39 == scalarValue38))
                    {
                        float scalarValue40 = clamp(2.0f - sumValue17, 0.0f, 1.0f);
                        float productValue22;
                        float productValue23;
                        float productValue24;
                        if (scalarValue40 > 0.0f)
                        {
                            uint intermediateValue61;
                            rdTextureSize(materialTexture1, 0u, intermediateValue61);
                            bool conditionValue11 = intermediateValue61 > 0u;
                            uint unusedTextureMipCount836;
                            uint2 vectorValue7 = rdTextureSize(materialTexture1, 0u, unusedTextureMipCount836);
                            uint scalarValue41 = vectorValue7.x;
                            float comparisonValue31 = rdUnsignedToFloat(conditionValue11 ? scalarValue41 : 0u);
                            float comparisonValue32 = rdUnsignedToFloat(conditionValue11 ? vectorValue7.y : 0u);
                            float productValue41 = frac(multiplyAddValue22 * comparisonValue31);
                            float productValue42 = frac(multiplyAddValue23 * comparisonValue32);
                            float4 comparisonValue33 = materialTexture1.GatherRed(textureSampler1, float2((abs(productValue41 - 0.5f) < 0.0625f) ? (multiplyAddValue22 + ((productValue41 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f))) : multiplyAddValue22, (abs(productValue42 - 0.5f) < 0.0625f) ? (multiplyAddValue23 + ((productValue42 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f))) : multiplyAddValue23));
                            float scalarValue42 = comparisonValue33.x;
                            float scalarValue43 = comparisonValue33.y;
                            float scalarValue44 = comparisonValue33.z;
                            float scalarValue45 = comparisonValue33.w;
                            float multiplyAddValue24 = frac(mad(multiplyAddValue22, comparisonValue31, 0.5f));
                            float multiplyAddValue25 = frac(mad(multiplyAddValue23, comparisonValue32, 0.5f));
                            bool conditionValue12 = multiplyAddValue25 > 0.5f;
                            bool conditionValue13 = multiplyAddValue24 > 0.5f;
                            float comparisonValue34 = conditionValue12 ? scalarValue42 : scalarValue45;
                            float comparisonValue35 = conditionValue12 ? scalarValue43 : scalarValue44;
                            float comparisonValue36 = conditionValue13 ? scalarValue44 : scalarValue45;
                            float comparisonValue37 = conditionValue13 ? scalarValue43 : scalarValue42;
                            float sumValue18 = multiplyAddValue24 - 0.083333335816860198974609375f;
                            float sumValue19 = multiplyAddValue24 + 0.083333335816860198974609375f;
                            float sumValue20 = multiplyAddValue25 - 0.083333335816860198974609375f;
                            float sumValue21 = multiplyAddValue25 + 0.083333335816860198974609375f;
                            uint clampedValue16 = uint(int(clamp(sumValue18 + sumValue18, 0.0f, 1.0f)));
                            uint clampedValue17 = uint(int(clamp(sumValue19 + sumValue19, 0.0f, 1.0f)));
                            uint clampedValue18 = uint(int(clamp(sumValue20 + sumValue20, 0.0f, 1.0f)));
                            uint clampedValue19 = uint(int(clamp(sumValue21 + sumValue21, 0.0f, 1.0f)));
                            float comparisonValue38 = ((clampedValue16 == 1u) ? comparisonValue35 : ((clampedValue16 == 0u) ? comparisonValue34 : 0.0f)) - ((clampedValue17 == 1u) ? comparisonValue35 : ((clampedValue17 == 0u) ? comparisonValue34 : 0.0f));
                            float comparisonValue39 = ((clampedValue18 == 1u) ? comparisonValue37 : ((clampedValue18 == 0u) ? comparisonValue36 : 0.0f)) - ((clampedValue19 == 1u) ? comparisonValue37 : ((clampedValue19 == 0u) ? comparisonValue36 : 0.0f));
                            float3 vectorValue8 = float3(comparisonValue38, comparisonValue39, 0.25f);
                            float inverseLengthValue8 = rsqrt(rdDot3Precise(vectorValue8, vectorValue8));
                            productValue22 = scalarValue40 * (inverseLengthValue8 * comparisonValue39);
                            productValue23 = scalarValue40 * (inverseLengthValue8 * comparisonValue38);
                            productValue24 = inverseLengthValue8 * 0.25f;
                        }
                        else
                        {
                            productValue22 = 0.0f;
                            productValue23 = 0.0f;
                            productValue24 = 1.0f;
                        }
                        intermediateValue50 = productValue22;
                        intermediateValue52 = productValue23;
                        intermediateValue54 = productValue24;
                    }
                    else
                    {
                        uint intermediateValue56;
                        rdTextureSize(materialTexture1, 0u, intermediateValue56);
                        bool conditionValue14 = intermediateValue56 > 0u;
                        uint unusedTextureMipCount781;
                        uint2 vectorValue9 = rdTextureSize(materialTexture1, 0u, unusedTextureMipCount781);
                        uint scalarValue46 = vectorValue9.x;
                        float clampedValue20 = clamp(2.0f - sumValue17, 0.0f, 1.0f);
                        bool conditionValue15 = clampedValue20 > 0.0f;
                        float comparisonValue40 = frac(rdUnsignedToFloat(conditionValue14 ? scalarValue46 : 0u) * multiplyAddValue22);
                        float comparisonValue41 = frac(rdUnsignedToFloat(conditionValue14 ? vectorValue9.y : 0u) * multiplyAddValue23);
                        float multiplyAddValue26 = (comparisonValue40 <= 0.083333335816860198974609375f) ? (-mad(sampledTextureValue8.w, 2.0f, -1.0f)) : 0.0f;
                        float multiplyAddValue27 = (comparisonValue41 <= 0.083333335816860198974609375f) ? (-mad(scalarValue37, 2.0f, -1.0f)) : 0.0f;
                        float multiplyAddValue28 = (comparisonValue40 >= 0.916666686534881591796875f) ? (mad(scalarValue38, 2.0f, -1.0f) + multiplyAddValue26) : multiplyAddValue26;
                        float multiplyAddValue29 = (comparisonValue41 >= 0.916666686534881591796875f) ? (mad(scalarValue39, 2.0f, -1.0f) + multiplyAddValue27) : multiplyAddValue27;
                        bool comparisonValue42 = abs(multiplyAddValue28) >= 0.004999999888241291046142578125f;
                        bool comparisonValue43 = abs(multiplyAddValue29) >= 0.004999999888241291046142578125f;
                        float3 comparisonValue44 = float3(comparisonValue42 ? multiplyAddValue28 : 0.0f, comparisonValue43 ? multiplyAddValue29 : 0.0f, 0.25f);
                        float inverseLengthValue9 = rsqrt(rdDot3Precise(comparisonValue44, comparisonValue44));
                        intermediateValue50 = (conditionValue15 && comparisonValue43) ? (clampedValue20 * (inverseLengthValue9 * multiplyAddValue29)) : 0.0f;
                        intermediateValue52 = (conditionValue15 && comparisonValue42) ? (clampedValue20 * (inverseLengthValue9 * multiplyAddValue28)) : 0.0f;
                        intermediateValue54 = conditionValue15 ? (inverseLengthValue9 * 0.25f) : 1.0f;
                    }
                    intermediateValue49 = intermediateValue50;
                    intermediateValue51 = intermediateValue52;
                    intermediateValue53 = intermediateValue54;
                }
                else
                {
                    intermediateValue49 = 0.0f;
                    intermediateValue51 = 0.0f;
                    intermediateValue53 = 1.0f;
                }
                intermediateValue29 = intermediateValue49;
                intermediateValue30 = intermediateValue51;
                intermediateValue31 = intermediateValue53;
            }
            multiplyAddValue11 = intermediateValue29;
            multiplyAddValue12 = intermediateValue30;
            multiplyAddValue13 = intermediateValue31;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float4 sampledTextureValue3 = matTextureTexture.Sample(matTextureSampler, float2(mad(comparisonValue2, loadedBufferValue11, loadedBufferValue13), mad(comparisonValue1, loadedBufferValue12, loadedBufferValue14)));
            intermediateValue17 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue18 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue19 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float intermediateValue21;
        float intermediateValue23;
        float intermediateValue25;
        float comparisonValue5;
        if ((reinterpretedBits2 & 1u) == 1u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float loadedBufferValue8;
        float loadedBufferValue9;
        float loadedBufferValue10;
        float intermediateValue11;
        if ((scalarValue4 & 1u) == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            uint productValue43 = comparisonValue19 * 16u;
            float4 loadedBufferValue25 = asfloat(uint4(rdLoad_intermediateValue1(productValue43).x, rdLoad_intermediateValue1(productValue43 + 1u).x, rdLoad_intermediateValue1(productValue43 + 2u).x, rdLoad_intermediateValue1(productValue43 + 3u).x));
            float4 sampledTextureValue9 = materialTexture1.Sample(textureSampler1, float2(mad(comparisonValue17, loadedBufferValue25.x, loadedBufferValue25.z), mad(comparisonValue18, loadedBufferValue25.y, loadedBufferValue25.w)));
            comparisonValue5 = ((reinterpretedBits2 & 2u) == 2u) ? sampledTextureValue9.w : scalarValue30;
            intermediateValue25 = sampledTextureValue9.x;
            intermediateValue23 = sampledTextureValue9.z;
            intermediateValue21 = sampledTextureValue9.y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            loadedBufferValue10 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 10u).x);
            loadedBufferValue8 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 11u).x);
            loadedBufferValue9 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 9u).x);
            intermediateValue11 = loadedBufferValue16;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            comparisonValue5 = scalarValue30;
            intermediateValue25 = loadedBufferValue22.w;
            intermediateValue23 = loadedBufferValue22.y;
            intermediateValue21 = loadedBufferValue22.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float4 sampledTextureValue4 = matTextureTexture.Sample(matTextureSampler, float2(mad(comparisonValue2, asfloat(rdLoad_pbrData(comparisonValue3 * 16u).x), asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 2u).x)), mad(comparisonValue1, asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 1u).x), asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 3u).x))));
            loadedBufferValue10 = sampledTextureValue4.y;
            loadedBufferValue8 = sampledTextureValue4.x;
            loadedBufferValue9 = sampledTextureValue4.z;
            intermediateValue11 = ((scalarValue4 & 2u) != 0u) ? sampledTextureValue4.w : loadedBufferValue16;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float comparisonValue45 = varyingSv_Isfrontface0 ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue46 = varyingSv_Isfrontface0 ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue47 = varyingSv_Isfrontface0 ? (-varyingNormal0.z) : varyingNormal0.z;
        float3 vectorValue10 = float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue10 = rsqrt(rdDot3Precise(vectorValue10, vectorValue10));
        float3 vectorValue11 = float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue11 = rsqrt(rdDot3Precise(vectorValue11, vectorValue11));
        float3 vectorValue12 = float3(comparisonValue45, comparisonValue46, comparisonValue47);
        float inverseLengthValue12 = rsqrt(rdDot3Precise(vectorValue12, vectorValue12));
        intermediateValue20 = intermediateValue21;
        intermediateValue22 = intermediateValue23;
        multiplyAddValue4 = mad(inverseLengthValue12 * comparisonValue47, multiplyAddValue13, mad(inverseLengthValue10 * varyingTangent0.z, multiplyAddValue12, multiplyAddValue11 * (inverseLengthValue11 * varyingBitangent0.z)));
        multiplyAddValue5 = mad(inverseLengthValue12 * comparisonValue46, multiplyAddValue13, mad(inverseLengthValue10 * varyingTangent0.y, multiplyAddValue12, multiplyAddValue11 * (inverseLengthValue11 * varyingBitangent0.y)));
        multiplyAddValue6 = mad(inverseLengthValue12 * comparisonValue45, multiplyAddValue13, mad(inverseLengthValue10 * varyingTangent0.x, multiplyAddValue12, multiplyAddValue11 * (inverseLengthValue11 * varyingBitangent0.x)));
        intermediateValue24 = intermediateValue25;
        intermediateValue26 = comparisonValue5;
    }
    else
    {
        intermediateValue20 = 0.0f;
        intermediateValue22 = 1.0f;
        multiplyAddValue4 = 0.0f;
        multiplyAddValue5 = 1.0f;
        multiplyAddValue6 = 0.0f;
        intermediateValue24 = 0.0f;
        intermediateValue26 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float comparisonValue11 = comparisonValue ? ((-0.0f) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue12 = comparisonValue ? ((-0.0f) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue16 = comparisonValue ? ((-0.0f) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue11, comparisonValue12, comparisonValue16), float3(comparisonValue11, comparisonValue12, comparisonValue16)));
        float inverseLengthValue4 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue5 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue17;
        intermediateValue7 = loadedBufferValue8;
        intermediateValue8 = loadedBufferValue9;
        intermediateValue9 = loadedBufferValue10;
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = mad(inverseLengthValue3 * comparisonValue11, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue18, inverseLengthValue5 * varyingTangent0.x));
        intermediateValue13 = mad(inverseLengthValue3 * comparisonValue12, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue18, inverseLengthValue5 * varyingTangent0.y));
        intermediateValue14 = mad(inverseLengthValue3 * comparisonValue16, intermediateValue19, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue18, inverseLengthValue5 * varyingTangent0.z));
#endif
    }
    float sumValue6 = varyingTexCoord3.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue7 = varyingTexCoord3.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue8 = varyingTexCoord3.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor1.w = (intermediateValue26 < intermediateValue24) ? mad(intermediateValue24, 0.4980392158031463623046875f, 0.501960813999176025390625f) : mad(-intermediateValue26, 0.4980392158031463623046875f, 0.4980392158031463623046875f);
    float3 vectorValue13 = float3(multiplyAddValue6, multiplyAddValue5, multiplyAddValue4);
    float inverseLengthValue13 = rsqrt(rdDot3Precise(vectorValue13, vectorValue13));
    float productValue44 = inverseLengthValue13 * multiplyAddValue6;
    float productValue45 = inverseLengthValue13 * multiplyAddValue5;
    float productValue46 = inverseLengthValue13 * multiplyAddValue4;
    float quotientValue2 = 1.0f / (abs(productValue46) + (abs(productValue45) + abs(productValue44)));
    float productValue47 = quotientValue2 * productValue44;
    float productValue48 = quotientValue2 * productValue45;
    bool conditionValue16 = productValue46 < 0.0f;
    float sumValue22 = 2.0f - 1.0f;
    fragmentColor2.x = conditionValue16 ? ((1.0f - abs(productValue48)) * ((productValue47 >= 0.0f) ? sumValue22 : (-1.0f))) : productValue47;
    fragmentColor2.y = conditionValue16 ? ((1.0f - abs(productValue47)) * ((productValue48 >= 0.0f) ? sumValue22 : (-1.0f))) : productValue48;
    float multiplyAddValue30 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue31 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w, sumValue6, sumValue7 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    fragmentColor2.z = mad((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue30, 0.5f, 0.5f) - mad((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x, sumValue6, sumValue7 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue31, 0.5f, 0.5f);
    fragmentColor2.w = mad((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue30, 0.5f, 0.5f) - mad((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y, sumValue6, sumValue7 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue31, 0.5f, 0.5f);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05f) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05f);
    float productValue30 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue48 = (bitwiseValue ? min(productValue30, 1.0f) : varyingTexCoord5.x) * 0.16666667163372039794921875f;
    float multiplyAddValue32 = (bitwiseValue ? min(mad(mad(productValue30, 0.60000002384185791015625f, 0.4000000059604644775390625f), 0.60000002384185791015625f, 0.4000000059604644775390625f) * productValue30, 1.0f) : varyingTexCoord5.y) * 0.16666667163372039794921875f;
    float multiplyAddValue33 = (bitwiseValue ? min(mad(productValue30 * productValue30, 0.60000002384185791015625f, 0.4000000059604644775390625f) * productValue30, 1.0f) : varyingTexCoord5.z) * 0.16666667163372039794921875f;
    float productValue49 = ceil(min(max(max(multiplyAddValue32, 0.0039215688593685626983642578125f), max(multiplyAddValue33, comparisonValue48)), 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.y = uint(clamp(multiplyAddValue32 / productValue49, 0.0f, 1.0f) * 255.0f) + (uint(clamp(comparisonValue48 / productValue49, 0.0f, 1.0f) * 255.0f) * 256u);
    fragmentColor0.z = (uint(clamp(multiplyAddValue33 / productValue49, 0.0f, 1.0f) * 255.0f) * 256u) + uint(clamp(productValue49, 0.0f, 1.0f) * 255.0f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float inverseLengthValue6 = rsqrt(dot(float3(intermediateValue12, intermediateValue13, intermediateValue14), float3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue25 = inverseLengthValue6 * intermediateValue12;
    float productValue26 = inverseLengthValue6 * intermediateValue13;
    float productValue27 = inverseLengthValue6 * intermediateValue14;
    float quotientValue1 = 1.0f / ((abs(productValue26) + abs(productValue25)) + abs(productValue27));
    float productValue28 = quotientValue1 * productValue25;
    float productValue29 = quotientValue1 * productValue26;
    bool conditionValue6 = productValue27 < 0.0f;
    float multiplyAddValue9 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue10 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05f) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue30 = varyingTexCoord1.x * varyingTexCoord1.x;
        clampedValue = clamp(productValue30, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue30 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue30, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue30 * productValue30) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue30, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = varyingTexCoord5.x;
        clampedValue1 = varyingTexCoord5.y;
        clampedValue2 = varyingTexCoord5.z;
    }
    float productValue31 = clampedValue * 0.16666667163372039794921875f;
    float productValue32 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue33 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue9 = ceil(clamp(max(max(productValue31, productValue33), max(productValue32, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(intermediateValue8, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue9, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue31 / clampedValue9, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue32 / clampedValue9, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue33 / clampedValue9, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue9, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.w = uint(clamp(varyingTexCoord1.y, 0.0f, 1.0f) * 255.0f);
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = uint(clamp(intermediateValue20, 0.0f, 1.0f) * 255.0f) + (uint(clamp(intermediateValue22, 0.0f, 1.0f) * 255.0f) * 256u);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor1.x = productValue7;
    fragmentColor1.y = productValue8;
    fragmentColor1.z = productValue9;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue10 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue6 ? (((productValue28 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue29))) : productValue28;
    fragmentColor2.y = conditionValue6 ? ((1.0f - abs(productValue28)) * ((productValue29 < 0.0f) ? (-1.0f) : 1.0f)) : productValue29;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue9) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue10)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue9) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue10)) * 0.5f;
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingSv_Isfrontface0 = stage_input.varyingSv_Isfrontface0;
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor0 = stage_input.varyingColor0;
    varyingTexCoord2 = stage_input.varyingTexCoord2;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingFrontFacing0 = stage_input.varyingFrontFacing0;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
#endif
    varyingTexCoord1 = stage_input.varyingTexCoord1;
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord6 = stage_input.varyingTexCoord6;
    varyingTexCoord5 = stage_input.varyingTexCoord5;
#endif
    varyingNormal0 = stage_input.varyingNormal0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord4 = stage_input.varyingTexCoord4;
#endif
    varyingTangent0 = stage_input.varyingTangent0;
    varyingTexCoord0 = stage_input.varyingTexCoord0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord6 = stage_input.varyingTexCoord6;
#endif
    varyingTexCoord3 = stage_input.varyingTexCoord3;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    stage_output.fragmentColor1 = fragmentColor1;
    stage_output.fragmentColor2 = fragmentColor2;
    return stage_output;
}
