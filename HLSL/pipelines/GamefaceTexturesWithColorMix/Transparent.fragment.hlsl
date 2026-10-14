// GamefaceTexturesWithColorMix / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT2_7 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT3_8 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT4_9 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_INSERT_UINT_6 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT2_16 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT3_17 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT4_18 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_SEXTRACT_INT_15 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT2_12 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT3_13 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT4_14 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_BITFIELD_UEXTRACT_UINT_11 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/GamefaceTexturesWithColorMix/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeFragmentStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint bitwiseValue6 = (uint(varyingTexCoord3.z) << 4u) + ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint productValue38 = bitwiseValue6 * 4u;
    uint quotientValue26 = uint(int(fragmentVectorConstants1[productValue38 / 4u][productValue38 % 4u]));
    float4 sampledTextureValue2 = materialTexture1.Sample(textureSampler1, float2(mad(varyingTexCoord4.z, RD_UNIFORM_UV_TRANSFORM_ROW_1.z, RD_UNIFORM_UV_TRANSFORM_ROW_1.x), mad(varyingTexCoord4.w, RD_UNIFORM_UV_TRANSFORM_ROW_1.w, RD_UNIFORM_UV_TRANSFORM_ROW_1.y)));
    float scalarValue18 = sampledTextureValue2.x;
    float scalarValue19 = sampledTextureValue2.y;
    float scalarValue20 = sampledTextureValue2.z;
    float scalarValue21 = sampledTextureValue2.w;
    float4 sampledTextureValue3 = materialTexture0.Sample(textureSampler0, float2(mad(varyingTexCoord1.x, RD_UNIFORM_UV_TRANSFORM_ROW_0.z, RD_UNIFORM_UV_TRANSFORM_ROW_0.x), mad(varyingTexCoord1.y, RD_UNIFORM_UV_TRANSFORM_ROW_0.w, RD_UNIFORM_UV_TRANSFORM_ROW_0.y)));
    float scalarValue22 = sampledTextureValue3.w;
    uint bitwiseValue7 = (((16u * bitwiseValue6) + 16u) + 12u) >> 2u;
    uint quotientValue27 = bitwiseValue7 / 4u;
    uint scalarValue38 = bitwiseValue7 % 4u;
    precise float productValue39 = sampledTextureValue3.x * fragmentVectorConstants1[quotientValue27][scalarValue38];
    precise float productValue40 = sampledTextureValue3.y * fragmentVectorConstants1[quotientValue27][scalarValue38];
    precise float productValue41 = sampledTextureValue3.z * fragmentVectorConstants1[quotientValue27][scalarValue38];
    precise float productValue42 = scalarValue22 * fragmentVectorConstants1[quotientValue27][scalarValue38];
    float scalarValue24 = max(scalarValue21, 9.9999997473787516355514526367188e-05f);
    precise float quotientValue28 = scalarValue18 / scalarValue24;
    precise float quotientValue29 = scalarValue19 / scalarValue24;
    precise float quotientValue30 = scalarValue20 / scalarValue24;
    float scalarValue39 = max(productValue42, 9.9999997473787516355514526367188e-05f);
    precise float quotientValue31 = productValue39 / scalarValue39;
    precise float quotientValue32 = productValue40 / scalarValue39;
    precise float quotientValue33 = productValue41 / scalarValue39;
    precise float sumValue71 = 1.0f - scalarValue21;
    precise float productValue43 = scalarValue21 * productValue42;
    uint productValue44 = quotientValue26 * 4u;
    float3 vectorValue2 = float3(quotientValue28, quotientValue29, quotientValue30);
    float3 vectorValue3 = float3(quotientValue31, quotientValue32, quotientValue33);
    float intermediateValue29;
    float intermediateValue30;
    float intermediateValue31;
    switch (uint(int(fragmentVectorConstants1[productValue44 / 4u][productValue44 % 4u])))
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint scalarValue17 = rdBitfieldInsert(rdBitfieldUExtract(uint(varyingTexCoord3.y), 4u, 4u), uint(varyingTexCoord3.z), 4u, 28u);
    uint productValue31 = scalarValue17 * 4u;
    uint quotientValue18 = uint(int(fragmentVectorConstants1[productValue31 / 4u][productValue31 % 4u]));
    float4 sampledTextureValue2 = materialTexture1.Sample(textureSampler1, float2(mad(varyingTexCoord4.z, RD_UNIFORM_UV_TRANSFORM_ROW_1.z, RD_UNIFORM_UV_TRANSFORM_ROW_1.x), mad(varyingTexCoord4.w, RD_UNIFORM_UV_TRANSFORM_ROW_1.w, RD_UNIFORM_UV_TRANSFORM_ROW_1.y)));
    float scalarValue18 = sampledTextureValue2.x;
    float scalarValue19 = sampledTextureValue2.y;
    float scalarValue20 = sampledTextureValue2.z;
    float scalarValue21 = sampledTextureValue2.w;
    float4 sampledTextureValue3 = materialTexture0.Sample(textureSampler0, float2(mad(varyingTexCoord1.x, RD_UNIFORM_UV_TRANSFORM_ROW_0.z, RD_UNIFORM_UV_TRANSFORM_ROW_0.x), mad(varyingTexCoord1.y, RD_UNIFORM_UV_TRANSFORM_ROW_0.w, RD_UNIFORM_UV_TRANSFORM_ROW_0.y)));
    float scalarValue22 = sampledTextureValue3.w;
    uint bitwiseValue1 = (((16u * scalarValue17) + 16u) + 12u) >> 2u;
    uint quotientValue19 = bitwiseValue1 / 4u;
    uint scalarValue23 = bitwiseValue1 % 4u;
    float productValue32 = sampledTextureValue3.x * fragmentVectorConstants1[quotientValue19][scalarValue23];
    float productValue33 = sampledTextureValue3.y * fragmentVectorConstants1[quotientValue19][scalarValue23];
    float productValue34 = sampledTextureValue3.z * fragmentVectorConstants1[quotientValue19][scalarValue23];
    float productValue35 = scalarValue22 * fragmentVectorConstants1[quotientValue19][scalarValue23];
    float scalarValue24 = max(scalarValue21, 9.9999997473787516355514526367188e-05f);
    float quotientValue20 = scalarValue18 / scalarValue24;
    float quotientValue21 = scalarValue19 / scalarValue24;
    float quotientValue22 = scalarValue20 / scalarValue24;
    float scalarValue25 = max(productValue35, 9.9999997473787516355514526367188e-05f);
    float quotientValue23 = productValue32 / scalarValue25;
    float quotientValue24 = productValue33 / scalarValue25;
    float quotientValue25 = productValue34 / scalarValue25;
    float sumValue32 = 1.0f - scalarValue21;
    float productValue36 = scalarValue21 * productValue35;
    uint productValue37 = quotientValue18 * 4u;
    float3 vectorValue = float3(quotientValue20, quotientValue21, quotientValue22);
    float3 vectorValue1 = float3(quotientValue23, quotientValue24, quotientValue25);
    float intermediateValue26;
    float intermediateValue27;
    float intermediateValue28;
    switch (uint(int(fragmentVectorConstants1[productValue37 / 4u][productValue37 % 4u])))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint bitwiseValue = (uint(varyingTexCoord3.z) << 4u) | ((uint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue = bitwiseValue + 1u;
    float4 sampledTextureValue = txBuffer1Texture.Sample(txBuffer1Sampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_1.z * varyingTexCoord4.z) + RD_UNIFORM_UV_TRANSFORM_ROW_1.x, (RD_UNIFORM_UV_TRANSFORM_ROW_1.w * varyingTexCoord4.w) + RD_UNIFORM_UV_TRANSFORM_ROW_1.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float4 sampledTextureValue1 = txBufferTexture.Sample(txBufferSampler, float2((RD_UNIFORM_UV_TRANSFORM_ROW_0.z * varyingTexCoord1.x) + RD_UNIFORM_UV_TRANSFORM_ROW_0.x, (RD_UNIFORM_UV_TRANSFORM_ROW_0.w * varyingTexCoord1.y) + RD_UNIFORM_UV_TRANSFORM_ROW_0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float productValue = scalarValue4 * fragmentConstants[sumValue].w;
    float productValue1 = scalarValue5 * fragmentConstants[sumValue].w;
    float productValue2 = scalarValue6 * fragmentConstants[sumValue].w;
    float productValue3 = sampledTextureValue1.w * fragmentConstants[sumValue].w;
    float scalarValue7 = max(scalarValue3, 9.9999997473787516355514526367188e-05f);
    float quotientValue = scalarValue / scalarValue7;
    float quotientValue1 = scalarValue1 / scalarValue7;
    float quotientValue2 = scalarValue2 / scalarValue7;
    float scalarValue8 = max(productValue3, 9.9999997473787516355514526367188e-05f);
    float quotientValue3 = productValue / scalarValue8;
    float quotientValue4 = productValue1 / scalarValue8;
    float quotientValue5 = productValue2 / scalarValue8;
    float sumValue1 = 1.0f - scalarValue3;
    float productValue4 = productValue3 * scalarValue3;
    float productValue5;
    float productValue6;
    float productValue7;
    switch (uint(int(fragmentConstants[uint(int(fragmentConstants[bitwiseValue].x))].x)))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        case 1u:
        {
            productValue5 = quotientValue3 * quotientValue;
            productValue6 = quotientValue4 * quotientValue1;
            productValue7 = quotientValue5 * quotientValue2;
            break;
        }
        case 2u:
        {
            productValue5 = (quotientValue3 + quotientValue) - (quotientValue3 * quotientValue);
            productValue6 = (quotientValue4 + quotientValue1) - (quotientValue4 * quotientValue1);
            productValue7 = (quotientValue5 + quotientValue2) - (quotientValue5 * quotientValue2);
            break;
        }
        case 3u:
        {
            float productValue8 = (quotientValue * 2.0f) + (-1.0f);
            float productValue9 = (quotientValue1 * 2.0f) + (-1.0f);
            float productValue10 = (quotientValue2 * 2.0f) + (-1.0f);
            float productValue11 = (quotientValue3 + productValue8) - (quotientValue3 * productValue8);
            float productValue12 = (quotientValue4 + productValue9) - (quotientValue4 * productValue9);
            float productValue13 = (quotientValue5 + productValue10) - (quotientValue5 * productValue10);
            productValue5 = ((((quotientValue3 * quotientValue) * 2.0f) - productValue11) * ((quotientValue > 0.5f) ? 0.0f : 1.0f)) + productValue11;
            productValue6 = ((((quotientValue4 * quotientValue1) * 2.0f) - productValue12) * ((quotientValue1 > 0.5f) ? 0.0f : 1.0f)) + productValue12;
            productValue7 = ((((quotientValue5 * quotientValue2) * 2.0f) - productValue13) * ((quotientValue2 > 0.5f) ? 0.0f : 1.0f)) + productValue13;
            break;
        }
        case 4u:
        {
            productValue5 = min(quotientValue3, quotientValue);
            productValue6 = min(quotientValue4, quotientValue1);
            productValue7 = min(quotientValue5, quotientValue2);
            break;
        }
        case 5u:
        {
            productValue5 = max(quotientValue3, quotientValue);
            productValue6 = max(quotientValue4, quotientValue1);
            productValue7 = max(quotientValue5, quotientValue2);
            break;
        }
        case 6u:
        {
            productValue5 = min(quotientValue / max(1.0f - quotientValue3, 9.9999997473787516355514526367188e-05f), 1.0f);
            productValue6 = min(quotientValue1 / max(1.0f - quotientValue4, 9.9999997473787516355514526367188e-05f), 1.0f);
            productValue7 = min(quotientValue2 / max(1.0f - quotientValue5, 9.9999997473787516355514526367188e-05f), 1.0f);
            break;
        }
        case 7u:
        {
            productValue5 = 1.0f - min((1.0f - quotientValue) / max(quotientValue3, 9.9999997473787516355514526367188e-05f), 1.0f);
            productValue6 = 1.0f - min((1.0f - quotientValue1) / max(quotientValue4, 9.9999997473787516355514526367188e-05f), 1.0f);
            productValue7 = 1.0f - min((1.0f - quotientValue2) / max(quotientValue5, 9.9999997473787516355514526367188e-05f), 1.0f);
            break;
        }
        case 8u:
        {
            float productValue14 = quotientValue3 * 2.0f;
            float productValue15 = quotientValue4 * 2.0f;
            float productValue16 = quotientValue5 * 2.0f;
            float sumValue2 = productValue14 + (-1.0f);
            float sumValue3 = productValue15 + (-1.0f);
            float sumValue4 = productValue16 + (-1.0f);
            float productValue17 = (sumValue2 + quotientValue) - (sumValue2 * quotientValue);
            float productValue18 = (sumValue3 + quotientValue1) - (sumValue3 * quotientValue1);
            float productValue19 = (sumValue4 + quotientValue2) - (sumValue4 * quotientValue2);
            productValue5 = (((productValue14 * quotientValue) - productValue17) * ((quotientValue3 > 0.5f) ? 0.0f : 1.0f)) + productValue17;
            productValue6 = (((productValue15 * quotientValue1) - productValue18) * ((quotientValue4 > 0.5f) ? 0.0f : 1.0f)) + productValue18;
            productValue7 = (((productValue16 * quotientValue2) - productValue19) * ((quotientValue5 > 0.5f) ? 0.0f : 1.0f)) + productValue19;
            break;
        }
        case 9u:
        {
            float nonlinearValue = sqrt(quotientValue);
            float nonlinearValue1 = sqrt(quotientValue1);
            float nonlinearValue2 = sqrt(quotientValue2);
            float productValue20 = quotientValue3 * 2.0f;
            float productValue21 = quotientValue4 * 2.0f;
            float productValue22 = quotientValue5 * 2.0f;
            float comparisonValue = (((nonlinearValue - quotientValue) + (((((((quotientValue * 16.0f) + (-12.0f)) * quotientValue) + 4.0f) * quotientValue) - nonlinearValue) * ((quotientValue > 0.25f) ? 0.0f : 1.0f))) * (productValue20 + (-1.0f))) + quotientValue;
            float comparisonValue1 = (((nonlinearValue1 - quotientValue1) + (((((((quotientValue1 * 16.0f) + (-12.0f)) * quotientValue1) + 4.0f) * quotientValue1) - nonlinearValue1) * ((quotientValue1 > 0.25f) ? 0.0f : 1.0f))) * (productValue21 + (-1.0f))) + quotientValue1;
            float comparisonValue2 = (((nonlinearValue2 - quotientValue2) + (((((((quotientValue2 * 16.0f) + (-12.0f)) * quotientValue2) + 4.0f) * quotientValue2) - nonlinearValue2) * ((quotientValue2 > 0.25f) ? 0.0f : 1.0f))) * (productValue22 + (-1.0f))) + quotientValue2;
            productValue5 = (((quotientValue - (((1.0f - quotientValue) * quotientValue) * (1.0f - productValue20))) - comparisonValue) * ((quotientValue3 > 0.5f) ? 0.0f : 1.0f)) + comparisonValue;
            productValue6 = (((quotientValue1 - (((1.0f - quotientValue1) * quotientValue1) * (1.0f - productValue21))) - comparisonValue1) * ((quotientValue4 > 0.5f) ? 0.0f : 1.0f)) + comparisonValue1;
            productValue7 = (((quotientValue2 - (((1.0f - quotientValue2) * quotientValue2) * (1.0f - productValue22))) - comparisonValue2) * ((quotientValue5 > 0.5f) ? 0.0f : 1.0f)) + comparisonValue2;
            break;
        }
        case 10u:
        {
            productValue5 = abs(quotientValue - quotientValue3);
            productValue6 = abs(quotientValue1 - quotientValue4);
            productValue7 = abs(quotientValue2 - quotientValue5);
            break;
        }
        case 11u:
        {
            productValue5 = (quotientValue3 + quotientValue) - ((quotientValue3 * quotientValue) * 2.0f);
            productValue6 = (quotientValue4 + quotientValue1) - ((quotientValue4 * quotientValue1) * 2.0f);
            productValue7 = (quotientValue5 + quotientValue2) - ((quotientValue5 * quotientValue2) * 2.0f);
            break;
        }
        case 12u:
        {
            float sumValue5 = max(max(quotientValue, quotientValue1), quotientValue2) - min(min(quotientValue, quotientValue1), quotientValue2);
            float intermediateValue13;
            float intermediateValue14;
            float intermediateValue15;
            if (!(quotientValue3 <= quotientValue4))
            {
                float branchMergedValue;
                float branchMergedValue4;
                float branchMergedValue5;
                if (!(quotientValue3 <= quotientValue5))
                {
                    float branchMergedValue12;
                    float branchMergedValue20;
                    float branchMergedValue21;
                    if (!(quotientValue4 <= quotientValue5))
                    {
                        float branchMergedValue36;
                        float branchMergedValue44;
                        float branchMergedValue45;
                        if (quotientValue3 > quotientValue5)
                        {
                            branchMergedValue36 = sumValue5;
                            branchMergedValue44 = ((((scalarValue5 - scalarValue6) * fragmentConstants[sumValue].w) / scalarValue8) * sumValue5) / max(((scalarValue4 - scalarValue6) * fragmentConstants[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05f);
                            branchMergedValue45 = 0.0f;
                        }
                        else
                        {
                            branchMergedValue36 = 0.0f;
                            branchMergedValue44 = 0.0f;
                            branchMergedValue45 = 0.0f;
                        }
                        branchMergedValue12 = branchMergedValue36;
                        branchMergedValue20 = branchMergedValue44;
                        branchMergedValue21 = branchMergedValue45;
                    }
                    else
                    {
                        float branchMergedValue37;
                        float branchMergedValue46;
                        float branchMergedValue47;
                        if (quotientValue3 > quotientValue4)
                        {
                            branchMergedValue37 = sumValue5;
                            branchMergedValue46 = 0.0f;
                            branchMergedValue47 = ((((scalarValue6 - scalarValue5) * fragmentConstants[sumValue].w) / scalarValue8) * sumValue5) / max(((scalarValue4 - scalarValue5) * fragmentConstants[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05f);
                        }
                        else
                        {
                            branchMergedValue37 = 0.0f;
                            branchMergedValue46 = 0.0f;
                            branchMergedValue47 = 0.0f;
                        }
                        branchMergedValue12 = branchMergedValue37;
                        branchMergedValue20 = branchMergedValue46;
                        branchMergedValue21 = branchMergedValue47;
                    }
                    branchMergedValue = branchMergedValue12;
                    branchMergedValue4 = branchMergedValue20;
                    branchMergedValue5 = branchMergedValue21;
                }
                else
                {
                    float branchMergedValue13;
                    float branchMergedValue22;
                    float branchMergedValue23;
                    if (quotientValue5 > quotientValue4)
                    {
                        branchMergedValue13 = ((((scalarValue4 - scalarValue5) * fragmentConstants[sumValue].w) / scalarValue8) * sumValue5) / max(((scalarValue6 - scalarValue5) * fragmentConstants[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05f);
                        branchMergedValue22 = 0.0f;
                        branchMergedValue23 = sumValue5;
                    }
                    else
                    {
                        branchMergedValue13 = 0.0f;
                        branchMergedValue22 = 0.0f;
                        branchMergedValue23 = 0.0f;
                    }
                    branchMergedValue = branchMergedValue13;
                    branchMergedValue4 = branchMergedValue22;
                    branchMergedValue5 = branchMergedValue23;
                }
                intermediateValue13 = branchMergedValue;
                intermediateValue14 = branchMergedValue4;
                intermediateValue15 = branchMergedValue5;
            }
            else
            {
                float branchMergedValue1;
                float branchMergedValue6;
                float branchMergedValue7;
                if (!(quotientValue4 <= quotientValue5))
                {
                    float branchMergedValue14;
                    float branchMergedValue24;
                    float branchMergedValue25;
                    if (!(quotientValue3 <= quotientValue5))
                    {
                        float branchMergedValue38;
                        float branchMergedValue48;
                        float branchMergedValue49;
                        if (quotientValue4 > quotientValue5)
                        {
                            branchMergedValue38 = ((((scalarValue4 - scalarValue6) * fragmentConstants[sumValue].w) / scalarValue8) * sumValue5) / max(((scalarValue5 - scalarValue6) * fragmentConstants[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05f);
                            branchMergedValue48 = sumValue5;
                            branchMergedValue49 = 0.0f;
                        }
                        else
                        {
                            branchMergedValue38 = 0.0f;
                            branchMergedValue48 = 0.0f;
                            branchMergedValue49 = 0.0f;
                        }
                        branchMergedValue14 = branchMergedValue38;
                        branchMergedValue24 = branchMergedValue48;
                        branchMergedValue25 = branchMergedValue49;
                    }
                    else
                    {
                        float branchMergedValue39;
                        float branchMergedValue50;
                        float branchMergedValue51;
                        if (quotientValue4 > quotientValue3)
                        {
                            branchMergedValue39 = 0.0f;
                            branchMergedValue50 = sumValue5;
                            branchMergedValue51 = ((((scalarValue6 - scalarValue4) * fragmentConstants[sumValue].w) / scalarValue8) * sumValue5) / max(((scalarValue5 - scalarValue4) * fragmentConstants[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05f);
                        }
                        else
                        {
                            branchMergedValue39 = 0.0f;
                            branchMergedValue50 = 0.0f;
                            branchMergedValue51 = 0.0f;
                        }
                        branchMergedValue14 = branchMergedValue39;
                        branchMergedValue24 = branchMergedValue50;
                        branchMergedValue25 = branchMergedValue51;
                    }
                    branchMergedValue1 = branchMergedValue14;
                    branchMergedValue6 = branchMergedValue24;
                    branchMergedValue7 = branchMergedValue25;
                }
                else
                {
                    float branchMergedValue15;
                    float branchMergedValue26;
                    float branchMergedValue27;
                    if (quotientValue5 > quotientValue3)
                    {
                        branchMergedValue15 = 0.0f;
                        branchMergedValue26 = ((((scalarValue5 - scalarValue4) * fragmentConstants[sumValue].w) / scalarValue8) * sumValue5) / max(((scalarValue6 - scalarValue4) * fragmentConstants[sumValue].w) / scalarValue8, 9.9999997473787516355514526367188e-05f);
                        branchMergedValue27 = sumValue5;
                    }
                    else
                    {
                        branchMergedValue15 = 0.0f;
                        branchMergedValue26 = 0.0f;
                        branchMergedValue27 = 0.0f;
                    }
                    branchMergedValue1 = branchMergedValue15;
                    branchMergedValue6 = branchMergedValue26;
                    branchMergedValue7 = branchMergedValue27;
                }
                intermediateValue13 = branchMergedValue1;
                intermediateValue14 = branchMergedValue6;
                intermediateValue15 = branchMergedValue7;
            }
            float productValue23 = (((((quotientValue1 * 0.715200006961822509765625f) + (quotientValue * 0.2125999927520751953125f)) + (quotientValue2 * 0.072200000286102294921875f)) - (intermediateValue13 * 0.2125999927520751953125f)) - (intermediateValue14 * 0.715200006961822509765625f)) - (intermediateValue15 * 0.072200000286102294921875f);
            float sumValue6 = productValue23 + intermediateValue13;
            float sumValue7 = productValue23 + intermediateValue14;
            float sumValue8 = productValue23 + intermediateValue15;
            float productValue24 = ((sumValue6 * 0.2125999927520751953125f) + (sumValue7 * 0.715200006961822509765625f)) + (sumValue8 * 0.072200000286102294921875f);
            float scalarValue9 = min(min(sumValue6, sumValue7), sumValue8);
            float scalarValue10 = max(max(sumValue6, sumValue7), sumValue8);
            float quotientValue6;
            float quotientValue10;
            float quotientValue14;
            if (scalarValue9 < 0.0f)
            {
                float sumValue9 = max(productValue24 - scalarValue9, 9.9999997473787516355514526367188e-05f);
                quotientValue6 = (((sumValue6 - productValue24) * productValue24) / sumValue9) + productValue24;
                quotientValue10 = (((sumValue7 - productValue24) * productValue24) / sumValue9) + productValue24;
                quotientValue14 = (((sumValue8 - productValue24) * productValue24) / sumValue9) + productValue24;
            }
            else
            {
                quotientValue6 = sumValue6;
                quotientValue10 = sumValue7;
                quotientValue14 = sumValue8;
            }
            if (!(scalarValue10 > 1.0f))
            {
                productValue5 = quotientValue6;
                productValue6 = quotientValue10;
                productValue7 = quotientValue14;
                break;
            }
            float sumValue10 = 1.0f - productValue24;
            float sumValue11 = max(scalarValue10 - productValue24, 9.9999997473787516355514526367188e-05f);
            productValue5 = (((quotientValue6 - productValue24) * sumValue10) / sumValue11) + productValue24;
            productValue6 = (((quotientValue10 - productValue24) * sumValue10) / sumValue11) + productValue24;
            productValue7 = (((quotientValue14 - productValue24) * sumValue10) / sumValue11) + productValue24;
            break;
        }
        case 13u:
        {
            float sumValue12 = max(max(quotientValue3, quotientValue4), quotientValue5) - min(min(quotientValue3, quotientValue4), quotientValue5);
            float intermediateValue18;
            float intermediateValue19;
            float intermediateValue20;
            if (!(quotientValue <= quotientValue1))
            {
                float branchMergedValue2;
                float branchMergedValue8;
                float branchMergedValue9;
                if (!(quotientValue <= quotientValue2))
                {
                    float branchMergedValue16;
                    float branchMergedValue28;
                    float branchMergedValue29;
                    if (!(quotientValue1 <= quotientValue2))
                    {
                        float branchMergedValue40;
                        float branchMergedValue52;
                        float branchMergedValue53;
                        if (quotientValue > quotientValue2)
                        {
                            branchMergedValue40 = sumValue12;
                            branchMergedValue52 = (((scalarValue1 - scalarValue2) / scalarValue7) * sumValue12) / max((scalarValue - scalarValue2) / scalarValue7, 9.9999997473787516355514526367188e-05f);
                            branchMergedValue53 = 0.0f;
                        }
                        else
                        {
                            branchMergedValue40 = 0.0f;
                            branchMergedValue52 = 0.0f;
                            branchMergedValue53 = 0.0f;
                        }
                        branchMergedValue16 = branchMergedValue40;
                        branchMergedValue28 = branchMergedValue52;
                        branchMergedValue29 = branchMergedValue53;
                    }
                    else
                    {
                        float branchMergedValue41;
                        float branchMergedValue54;
                        float branchMergedValue55;
                        if (quotientValue > quotientValue1)
                        {
                            branchMergedValue41 = sumValue12;
                            branchMergedValue54 = 0.0f;
                            branchMergedValue55 = (((scalarValue2 - scalarValue1) / scalarValue7) * sumValue12) / max((scalarValue - scalarValue1) / scalarValue7, 9.9999997473787516355514526367188e-05f);
                        }
                        else
                        {
                            branchMergedValue41 = 0.0f;
                            branchMergedValue54 = 0.0f;
                            branchMergedValue55 = 0.0f;
                        }
                        branchMergedValue16 = branchMergedValue41;
                        branchMergedValue28 = branchMergedValue54;
                        branchMergedValue29 = branchMergedValue55;
                    }
                    branchMergedValue2 = branchMergedValue16;
                    branchMergedValue8 = branchMergedValue28;
                    branchMergedValue9 = branchMergedValue29;
                }
                else
                {
                    float branchMergedValue17;
                    float branchMergedValue30;
                    float branchMergedValue31;
                    if (quotientValue2 > quotientValue1)
                    {
                        branchMergedValue17 = (((scalarValue - scalarValue1) / scalarValue7) * sumValue12) / max((scalarValue2 - scalarValue1) / scalarValue7, 9.9999997473787516355514526367188e-05f);
                        branchMergedValue30 = 0.0f;
                        branchMergedValue31 = sumValue12;
                    }
                    else
                    {
                        branchMergedValue17 = 0.0f;
                        branchMergedValue30 = 0.0f;
                        branchMergedValue31 = 0.0f;
                    }
                    branchMergedValue2 = branchMergedValue17;
                    branchMergedValue8 = branchMergedValue30;
                    branchMergedValue9 = branchMergedValue31;
                }
                intermediateValue18 = branchMergedValue2;
                intermediateValue19 = branchMergedValue8;
                intermediateValue20 = branchMergedValue9;
            }
            else
            {
                float branchMergedValue3;
                float branchMergedValue10;
                float branchMergedValue11;
                if (!(quotientValue1 <= quotientValue2))
                {
                    float branchMergedValue18;
                    float branchMergedValue32;
                    float branchMergedValue33;
                    if (!(quotientValue <= quotientValue2))
                    {
                        float branchMergedValue42;
                        float branchMergedValue56;
                        float branchMergedValue57;
                        if (quotientValue1 > quotientValue2)
                        {
                            branchMergedValue42 = (((scalarValue - scalarValue2) / scalarValue7) * sumValue12) / max((scalarValue1 - scalarValue2) / scalarValue7, 9.9999997473787516355514526367188e-05f);
                            branchMergedValue56 = sumValue12;
                            branchMergedValue57 = 0.0f;
                        }
                        else
                        {
                            branchMergedValue42 = 0.0f;
                            branchMergedValue56 = 0.0f;
                            branchMergedValue57 = 0.0f;
                        }
                        branchMergedValue18 = branchMergedValue42;
                        branchMergedValue32 = branchMergedValue56;
                        branchMergedValue33 = branchMergedValue57;
                    }
                    else
                    {
                        float branchMergedValue43;
                        float branchMergedValue58;
                        float branchMergedValue59;
                        if (quotientValue1 > quotientValue)
                        {
                            branchMergedValue43 = 0.0f;
                            branchMergedValue58 = sumValue12;
                            branchMergedValue59 = (((scalarValue2 - scalarValue) / scalarValue7) * sumValue12) / max((scalarValue1 - scalarValue) / scalarValue7, 9.9999997473787516355514526367188e-05f);
                        }
                        else
                        {
                            branchMergedValue43 = 0.0f;
                            branchMergedValue58 = 0.0f;
                            branchMergedValue59 = 0.0f;
                        }
                        branchMergedValue18 = branchMergedValue43;
                        branchMergedValue32 = branchMergedValue58;
                        branchMergedValue33 = branchMergedValue59;
                    }
                    branchMergedValue3 = branchMergedValue18;
                    branchMergedValue10 = branchMergedValue32;
                    branchMergedValue11 = branchMergedValue33;
                }
                else
                {
                    float branchMergedValue19;
                    float branchMergedValue34;
                    float branchMergedValue35;
                    if (quotientValue2 > quotientValue)
                    {
                        branchMergedValue19 = 0.0f;
                        branchMergedValue34 = (((scalarValue1 - scalarValue) / scalarValue7) * sumValue12) / max((scalarValue2 - scalarValue) / scalarValue7, 9.9999997473787516355514526367188e-05f);
                        branchMergedValue35 = sumValue12;
                    }
                    else
                    {
                        branchMergedValue19 = 0.0f;
                        branchMergedValue34 = 0.0f;
                        branchMergedValue35 = 0.0f;
                    }
                    branchMergedValue3 = branchMergedValue19;
                    branchMergedValue10 = branchMergedValue34;
                    branchMergedValue11 = branchMergedValue35;
                }
                intermediateValue18 = branchMergedValue3;
                intermediateValue19 = branchMergedValue10;
                intermediateValue20 = branchMergedValue11;
            }
            float productValue25 = (((((quotientValue1 * 0.715200006961822509765625f) + (quotientValue * 0.2125999927520751953125f)) + (quotientValue2 * 0.072200000286102294921875f)) - (intermediateValue18 * 0.2125999927520751953125f)) - (intermediateValue19 * 0.715200006961822509765625f)) - (intermediateValue20 * 0.072200000286102294921875f);
            float sumValue13 = productValue25 + intermediateValue18;
            float sumValue14 = productValue25 + intermediateValue19;
            float sumValue15 = productValue25 + intermediateValue20;
            float productValue26 = ((sumValue13 * 0.2125999927520751953125f) + (sumValue14 * 0.715200006961822509765625f)) + (sumValue15 * 0.072200000286102294921875f);
            float scalarValue11 = min(min(sumValue13, sumValue14), sumValue15);
            float scalarValue12 = max(max(sumValue13, sumValue14), sumValue15);
            float quotientValue7;
            float quotientValue11;
            float quotientValue15;
            if (scalarValue11 < 0.0f)
            {
                float sumValue16 = max(productValue26 - scalarValue11, 9.9999997473787516355514526367188e-05f);
                quotientValue7 = (((sumValue13 - productValue26) * productValue26) / sumValue16) + productValue26;
                quotientValue11 = (((sumValue14 - productValue26) * productValue26) / sumValue16) + productValue26;
                quotientValue15 = (((sumValue15 - productValue26) * productValue26) / sumValue16) + productValue26;
            }
            else
            {
                quotientValue7 = sumValue13;
                quotientValue11 = sumValue14;
                quotientValue15 = sumValue15;
            }
            if (!(scalarValue12 > 1.0f))
            {
                productValue5 = quotientValue7;
                productValue6 = quotientValue11;
                productValue7 = quotientValue15;
                break;
            }
            float sumValue17 = 1.0f - productValue26;
            float sumValue18 = max(scalarValue12 - productValue26, 9.9999997473787516355514526367188e-05f);
            productValue5 = (((quotientValue7 - productValue26) * sumValue17) / sumValue18) + productValue26;
            productValue6 = (((quotientValue11 - productValue26) * sumValue17) / sumValue18) + productValue26;
            productValue7 = (((quotientValue15 - productValue26) * sumValue17) / sumValue18) + productValue26;
            break;
        }
        case 14u:
        {
            float productValue27 = (((((quotientValue1 * 0.715200006961822509765625f) + (quotientValue * 0.2125999927520751953125f)) + (quotientValue2 * 0.072200000286102294921875f)) - (quotientValue3 * 0.2125999927520751953125f)) - (quotientValue4 * 0.715200006961822509765625f)) - (quotientValue5 * 0.072200000286102294921875f);
            float sumValue19 = productValue27 + quotientValue3;
            float sumValue20 = productValue27 + quotientValue4;
            float sumValue21 = productValue27 + quotientValue5;
            float productValue28 = ((sumValue19 * 0.2125999927520751953125f) + (sumValue20 * 0.715200006961822509765625f)) + (sumValue21 * 0.072200000286102294921875f);
            float scalarValue13 = min(min(sumValue19, sumValue20), sumValue21);
            float scalarValue14 = max(max(sumValue19, sumValue20), sumValue21);
            float quotientValue8;
            float quotientValue12;
            float quotientValue16;
            if (scalarValue13 < 0.0f)
            {
                float sumValue22 = max(productValue28 - scalarValue13, 9.9999997473787516355514526367188e-05f);
                quotientValue8 = (((sumValue19 - productValue28) * productValue28) / sumValue22) + productValue28;
                quotientValue12 = (((sumValue20 - productValue28) * productValue28) / sumValue22) + productValue28;
                quotientValue16 = (((sumValue21 - productValue28) * productValue28) / sumValue22) + productValue28;
            }
            else
            {
                quotientValue8 = sumValue19;
                quotientValue12 = sumValue20;
                quotientValue16 = sumValue21;
            }
            if (!(scalarValue14 > 1.0f))
            {
                productValue5 = quotientValue8;
                productValue6 = quotientValue12;
                productValue7 = quotientValue16;
                break;
            }
            float sumValue23 = 1.0f - productValue28;
            float sumValue24 = max(scalarValue14 - productValue28, 9.9999997473787516355514526367188e-05f);
            productValue5 = (((quotientValue8 - productValue28) * sumValue23) / sumValue24) + productValue28;
            productValue6 = (((quotientValue12 - productValue28) * sumValue23) / sumValue24) + productValue28;
            productValue7 = (((quotientValue16 - productValue28) * sumValue23) / sumValue24) + productValue28;
            break;
        }
        case 15u:
        {
            float productValue29 = ((((quotientValue * (-0.2125999927520751953125f)) - (quotientValue2 * 0.072200000286102294921875f)) + (quotientValue3 * 0.2125999927520751953125f)) + (quotientValue5 * 0.072200000286102294921875f)) + ((quotientValue4 - quotientValue1) * 0.715200006961822509765625f);
            float sumValue25 = productValue29 + quotientValue;
            float sumValue26 = productValue29 + quotientValue1;
            float sumValue27 = productValue29 + quotientValue2;
            float productValue30 = ((sumValue25 * 0.2125999927520751953125f) + (sumValue26 * 0.715200006961822509765625f)) + (sumValue27 * 0.072200000286102294921875f);
            float scalarValue15 = min(min(sumValue25, sumValue26), sumValue27);
            float scalarValue16 = max(max(sumValue25, sumValue26), sumValue27);
            float quotientValue9;
            float quotientValue13;
            float quotientValue17;
            if (scalarValue15 < 0.0f)
            {
                float sumValue28 = max(productValue30 - scalarValue15, 9.9999997473787516355514526367188e-05f);
                quotientValue9 = (((sumValue25 - productValue30) * productValue30) / sumValue28) + productValue30;
                quotientValue13 = (((sumValue26 - productValue30) * productValue30) / sumValue28) + productValue30;
                quotientValue17 = (((sumValue27 - productValue30) * productValue30) / sumValue28) + productValue30;
            }
            else
            {
                quotientValue9 = sumValue25;
                quotientValue13 = sumValue26;
                quotientValue17 = sumValue27;
            }
            if (!(scalarValue16 > 1.0f))
            {
                productValue5 = quotientValue9;
                productValue6 = quotientValue13;
                productValue7 = quotientValue17;
                break;
            }
            float sumValue29 = 1.0f - productValue30;
            float sumValue30 = max(scalarValue16 - productValue30, 9.9999997473787516355514526367188e-05f);
            productValue5 = (((quotientValue9 - productValue30) * sumValue29) / sumValue30) + productValue30;
            productValue6 = (((quotientValue13 - productValue30) * sumValue29) / sumValue30) + productValue30;
            productValue7 = (((quotientValue17 - productValue30) * sumValue29) / sumValue30) + productValue30;
            break;
        }
        case 16u:
        {
            productValue5 = min(quotientValue3 + quotientValue, 1.0f);
            productValue6 = min(quotientValue4 + quotientValue1, 1.0f);
            productValue7 = min(quotientValue5 + quotientValue2, 1.0f);
            break;
        }
        default:
        {
            productValue5 = 0.0f;
            productValue6 = 0.0f;
            productValue7 = 0.0f;
            break;
        }
#endif
        case 0u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue29 = quotientValue33;
            intermediateValue30 = quotientValue32;
            intermediateValue31 = quotientValue31;
            break;
        }
        case 1u:
        {
            precise float productValue45 = quotientValue28 * quotientValue31;
            precise float productValue46 = quotientValue29 * quotientValue32;
            precise float productValue47 = quotientValue30 * quotientValue33;
            intermediateValue29 = productValue47;
            intermediateValue30 = productValue46;
            intermediateValue31 = productValue45;
            break;
        }
        case 2u:
        {
            precise float sumValue72 = quotientValue28 + quotientValue31;
            precise float sumValue73 = quotientValue29 + quotientValue32;
            precise float sumValue74 = quotientValue30 + quotientValue33;
            intermediateValue29 = mad(-quotientValue30, quotientValue33, sumValue74);
            intermediateValue30 = mad(-quotientValue29, quotientValue32, sumValue73);
            intermediateValue31 = mad(-quotientValue28, quotientValue31, sumValue72);
            break;
        }
        case 3u:
        {
            precise float sumValue75 = quotientValue28 + quotientValue28;
            precise float sumValue76 = quotientValue29 + quotientValue29;
            precise float sumValue77 = quotientValue30 + quotientValue30;
            float multiplyAddValue16 = mad(quotientValue28, 2.0f, -1.0f);
            float multiplyAddValue17 = mad(quotientValue29, 2.0f, -1.0f);
            float multiplyAddValue18 = mad(quotientValue30, 2.0f, -1.0f);
            precise float sumValue78 = quotientValue31 + multiplyAddValue16;
            precise float sumValue79 = quotientValue32 + multiplyAddValue17;
            precise float sumValue80 = quotientValue33 + multiplyAddValue18;
            float multiplyAddValue19 = mad(-quotientValue31, multiplyAddValue16, sumValue78);
            float multiplyAddValue20 = mad(-quotientValue32, multiplyAddValue17, sumValue79);
            float multiplyAddValue21 = mad(-quotientValue33, multiplyAddValue18, sumValue80);
            intermediateValue29 = mad(float(quotientValue30 <= 0.5f), mad(quotientValue33, sumValue77, -multiplyAddValue21), multiplyAddValue21);
            intermediateValue30 = mad(float(quotientValue29 <= 0.5f), mad(quotientValue32, sumValue76, -multiplyAddValue20), multiplyAddValue20);
            intermediateValue31 = mad(float(quotientValue28 <= 0.5f), mad(quotientValue31, sumValue75, -multiplyAddValue19), multiplyAddValue19);
            break;
        }
        case 4u:
        {
            intermediateValue29 = min(quotientValue30, quotientValue33);
            intermediateValue30 = min(quotientValue29, quotientValue32);
            intermediateValue31 = min(quotientValue28, quotientValue31);
            break;
        }
        case 5u:
        {
            intermediateValue29 = max(quotientValue30, quotientValue33);
            intermediateValue30 = max(quotientValue29, quotientValue32);
            intermediateValue31 = max(quotientValue28, quotientValue31);
            break;
        }
        case 6u:
        {
            precise float sumValue81 = 1.0f - quotientValue31;
            precise float sumValue82 = 1.0f - quotientValue32;
            precise float sumValue83 = 1.0f - quotientValue33;
            precise float quotientValue34 = quotientValue28 / max(sumValue81, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue35 = quotientValue29 / max(sumValue82, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue36 = quotientValue30 / max(sumValue83, 9.9999997473787516355514526367188e-05f);
            intermediateValue29 = min(quotientValue36, 1.0f);
            intermediateValue30 = min(quotientValue35, 1.0f);
            intermediateValue31 = min(quotientValue34, 1.0f);
            break;
        }
        case 7u:
        {
            precise float sumValue84 = 1.0f - quotientValue28;
            precise float sumValue85 = 1.0f - quotientValue29;
            precise float sumValue86 = 1.0f - quotientValue30;
            precise float quotientValue37 = sumValue84 / max(quotientValue31, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue38 = sumValue85 / max(quotientValue32, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue39 = sumValue86 / max(quotientValue33, 9.9999997473787516355514526367188e-05f);
            precise float sumValue87 = 1.0f - min(quotientValue37, 1.0f);
            precise float sumValue88 = 1.0f - min(quotientValue38, 1.0f);
            precise float sumValue89 = 1.0f - min(quotientValue39, 1.0f);
            intermediateValue29 = sumValue89;
            intermediateValue30 = sumValue88;
            intermediateValue31 = sumValue87;
            break;
        }
        case 8u:
        {
            precise float sumValue90 = quotientValue31 + quotientValue31;
            precise float sumValue91 = quotientValue32 + quotientValue32;
            precise float sumValue92 = quotientValue33 + quotientValue33;
            float multiplyAddValue22 = mad(quotientValue31, 2.0f, -1.0f);
            float multiplyAddValue23 = mad(quotientValue32, 2.0f, -1.0f);
            float multiplyAddValue24 = mad(quotientValue33, 2.0f, -1.0f);
            precise float sumValue93 = quotientValue28 + multiplyAddValue22;
            precise float sumValue94 = quotientValue29 + multiplyAddValue23;
            precise float sumValue95 = quotientValue30 + multiplyAddValue24;
            float multiplyAddValue25 = mad(-quotientValue28, multiplyAddValue22, sumValue93);
            float multiplyAddValue26 = mad(-quotientValue29, multiplyAddValue23, sumValue94);
            float multiplyAddValue27 = mad(-quotientValue30, multiplyAddValue24, sumValue95);
            intermediateValue29 = mad(float(quotientValue33 <= 0.5f), mad(quotientValue30, sumValue92, -multiplyAddValue27), multiplyAddValue27);
            intermediateValue30 = mad(float(quotientValue32 <= 0.5f), mad(quotientValue29, sumValue91, -multiplyAddValue26), multiplyAddValue26);
            intermediateValue31 = mad(float(quotientValue31 <= 0.5f), mad(quotientValue28, sumValue90, -multiplyAddValue25), multiplyAddValue25);
            break;
        }
        case 9u:
        {
            float nonlinearValue6 = sqrt(quotientValue28);
            float nonlinearValue7 = sqrt(quotientValue29);
            float nonlinearValue8 = sqrt(quotientValue30);
            precise float multiplyAddValue28 = mad(float(quotientValue28 <= 0.25f), mad(mad(mad(quotientValue28, 16.0f, -12.0f), quotientValue28, 4.0f), quotientValue28, -nonlinearValue6), nonlinearValue6) - quotientValue28;
            precise float multiplyAddValue29 = mad(float(quotientValue29 <= 0.25f), mad(mad(mad(quotientValue29, 16.0f, -12.0f), quotientValue29, 4.0f), quotientValue29, -nonlinearValue7), nonlinearValue7) - quotientValue29;
            precise float multiplyAddValue30 = mad(float(quotientValue30 <= 0.25f), mad(mad(mad(quotientValue30, 16.0f, -12.0f), quotientValue30, 4.0f), quotientValue30, -nonlinearValue8), nonlinearValue8) - quotientValue30;
            float multiplyAddValue31 = mad(mad(quotientValue31, 2.0f, -1.0f), multiplyAddValue28, quotientValue28);
            float multiplyAddValue32 = mad(mad(quotientValue32, 2.0f, -1.0f), multiplyAddValue29, quotientValue29);
            float multiplyAddValue33 = mad(mad(quotientValue33, 2.0f, -1.0f), multiplyAddValue30, quotientValue30);
            precise float multiplyAddValue34 = quotientValue28 * mad(-quotientValue31, 2.0f, 1.0f);
            precise float multiplyAddValue35 = quotientValue29 * mad(-quotientValue32, 2.0f, 1.0f);
            precise float multiplyAddValue36 = quotientValue30 * mad(-quotientValue33, 2.0f, 1.0f);
            precise float sumValue96 = 1.0f - quotientValue28;
            precise float sumValue97 = 1.0f - quotientValue29;
            precise float sumValue98 = 1.0f - quotientValue30;
            precise float multiplyAddValue37 = mad(-multiplyAddValue34, sumValue96, quotientValue28) - multiplyAddValue31;
            precise float multiplyAddValue38 = mad(-multiplyAddValue35, sumValue97, quotientValue29) - multiplyAddValue32;
            precise float multiplyAddValue39 = mad(-multiplyAddValue36, sumValue98, quotientValue30) - multiplyAddValue33;
            intermediateValue29 = mad(float(quotientValue33 <= 0.5f), multiplyAddValue39, multiplyAddValue33);
            intermediateValue30 = mad(float(quotientValue32 <= 0.5f), multiplyAddValue38, multiplyAddValue32);
            intermediateValue31 = mad(float(quotientValue31 <= 0.5f), multiplyAddValue37, multiplyAddValue31);
            break;
        }
        case 10u:
        {
            precise float sumValue99 = quotientValue28 - quotientValue31;
            precise float sumValue100 = quotientValue29 - quotientValue32;
            precise float sumValue101 = quotientValue30 - quotientValue33;
            intermediateValue29 = abs(sumValue101);
            intermediateValue30 = abs(sumValue100);
            intermediateValue31 = abs(sumValue99);
            break;
        }
        case 11u:
        {
            precise float sumValue102 = quotientValue28 + quotientValue31;
            precise float sumValue103 = quotientValue29 + quotientValue32;
            precise float sumValue104 = quotientValue30 + quotientValue33;
            precise float productValue48 = quotientValue28 * quotientValue31;
            precise float productValue49 = quotientValue29 * quotientValue32;
            precise float productValue50 = quotientValue30 * quotientValue33;
            intermediateValue29 = mad(-productValue50, 2.0f, sumValue104);
            intermediateValue30 = mad(-productValue49, 2.0f, sumValue103);
            intermediateValue31 = mad(-productValue48, 2.0f, sumValue102);
            break;
        }
        case 12u:
        {
            precise float sumValue105 = max(quotientValue30, max(quotientValue29, quotientValue28)) - min(quotientValue30, min(quotientValue29, quotientValue28));
            float comparisonValue14;
            float comparisonValue15;
            float comparisonValue16;
            if (quotientValue32 >= quotientValue31)
            {
                bool conditionValue16 = quotientValue31 < quotientValue33;
                bool conditionValue17 = quotientValue33 < quotientValue32;
                precise float sumValue106 = quotientValue32 - quotientValue31;
                precise float sumValue107 = quotientValue33 - quotientValue31;
                precise float sumValue108 = quotientValue31 - quotientValue33;
                precise float sumValue109 = quotientValue32 - quotientValue33;
                precise float productValue51 = sumValue105 * sumValue106;
                precise float productValue52 = sumValue105 * sumValue107;
                precise float productValue53 = sumValue105 * sumValue108;
                precise float quotientValue40 = productValue51 / max(sumValue107, 9.9999997473787516355514526367188e-05f);
                precise float quotientValue41 = productValue52 / max(sumValue106, 9.9999997473787516355514526367188e-05f);
                precise float quotientValue42 = productValue53 / max(sumValue109, 9.9999997473787516355514526367188e-05f);
                bool comparisonValue29 = quotientValue33 >= quotientValue32;
                bool comparisonValue30 = quotientValue33 >= quotientValue31;
                bool bitwiseValue8 = comparisonValue30 && (quotientValue31 < quotientValue32);
                comparisonValue14 = comparisonValue29 ? (conditionValue16 ? sumValue105 : 0.0f) : (bitwiseValue8 ? quotientValue41 : 0.0f);
                comparisonValue15 = comparisonValue29 ? (conditionValue16 ? quotientValue40 : 0.0f) : ((bitwiseValue8 || ((!comparisonValue30) && conditionValue17)) ? sumValue105 : 0.0f);
                comparisonValue16 = (comparisonValue29 || ((!conditionValue17) || comparisonValue30)) ? 0.0f : quotientValue42;
            }
            else
            {
                bool conditionValue18 = quotientValue32 < quotientValue33;
                bool conditionValue19 = quotientValue33 < quotientValue31;
                precise float sumValue110 = quotientValue31 - quotientValue32;
                precise float sumValue111 = quotientValue33 - quotientValue32;
                precise float sumValue112 = quotientValue32 - quotientValue33;
                precise float sumValue113 = quotientValue31 - quotientValue33;
                precise float productValue54 = sumValue105 * sumValue110;
                precise float productValue55 = sumValue105 * sumValue111;
                precise float productValue56 = sumValue105 * sumValue112;
                precise float quotientValue43 = productValue54 / max(sumValue111, 9.9999997473787516355514526367188e-05f);
                precise float quotientValue44 = productValue55 / max(sumValue110, 9.9999997473787516355514526367188e-05f);
                precise float quotientValue45 = productValue56 / max(sumValue113, 9.9999997473787516355514526367188e-05f);
                bool comparisonValue31 = quotientValue33 >= quotientValue31;
                bool comparisonValue32 = quotientValue33 >= quotientValue32;
                bool bitwiseValue9 = comparisonValue32 && (quotientValue32 < quotientValue31);
                comparisonValue14 = comparisonValue31 ? (conditionValue18 ? sumValue105 : 0.0f) : (bitwiseValue9 ? quotientValue44 : 0.0f);
                comparisonValue15 = ((comparisonValue32 || (!conditionValue19)) || comparisonValue31) ? 0.0f : quotientValue45;
                comparisonValue16 = comparisonValue31 ? (conditionValue18 ? quotientValue43 : 0.0f) : ((bitwiseValue9 || ((!comparisonValue32) && conditionValue19)) ? sumValue105 : 0.0f);
            }
            precise float sumValue114 = rdDot3Precise(vectorValue2, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) - rdDot3Precise(float3(comparisonValue16, comparisonValue15, comparisonValue14), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            precise float sumValue115 = sumValue114 + comparisonValue16;
            precise float sumValue116 = sumValue114 + comparisonValue15;
            precise float sumValue117 = sumValue114 + comparisonValue14;
            float scalarValue40 = rdDot3Precise(float3(sumValue115, sumValue116, sumValue117), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float scalarValue41 = min(sumValue117, min(sumValue116, sumValue115));
            float scalarValue42 = max(sumValue117, max(sumValue116, sumValue115));
            bool conditionValue20 = scalarValue41 < 0.0f;
            precise float sumValue118 = sumValue115 - scalarValue40;
            precise float sumValue119 = sumValue116 - scalarValue40;
            precise float sumValue120 = sumValue117 - scalarValue40;
            precise float productValue57 = scalarValue40 * sumValue118;
            precise float productValue58 = scalarValue40 * sumValue119;
            precise float productValue59 = scalarValue40 * sumValue120;
            precise float sumValue121 = scalarValue40 - scalarValue41;
            float scalarValue43 = max(sumValue121, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue46 = productValue57 / scalarValue43;
            precise float quotientValue47 = productValue58 / scalarValue43;
            precise float quotientValue48 = productValue59 / scalarValue43;
            precise float sumValue122 = scalarValue40 + quotientValue46;
            precise float sumValue123 = scalarValue40 + quotientValue47;
            precise float sumValue124 = scalarValue40 + quotientValue48;
            float comparisonValue33 = conditionValue20 ? sumValue122 : sumValue115;
            float comparisonValue34 = conditionValue20 ? sumValue123 : sumValue116;
            float comparisonValue35 = conditionValue20 ? sumValue124 : sumValue117;
            bool conditionValue21 = scalarValue42 > 1.0f;
            precise float sumValue125 = comparisonValue33 - scalarValue40;
            precise float sumValue126 = comparisonValue34 - scalarValue40;
            precise float sumValue127 = comparisonValue35 - scalarValue40;
            precise float sumValue128 = 1.0f - scalarValue40;
            precise float productValue60 = sumValue125 * sumValue128;
            precise float productValue61 = sumValue126 * sumValue128;
            precise float productValue62 = sumValue127 * sumValue128;
            precise float sumValue129 = scalarValue42 - scalarValue40;
            float scalarValue44 = max(sumValue129, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue49 = productValue60 / scalarValue44;
            precise float quotientValue50 = productValue61 / scalarValue44;
            precise float quotientValue51 = productValue62 / scalarValue44;
            precise float sumValue130 = scalarValue40 + quotientValue49;
            precise float sumValue131 = scalarValue40 + quotientValue50;
            precise float sumValue132 = scalarValue40 + quotientValue51;
            intermediateValue29 = conditionValue21 ? sumValue132 : comparisonValue35;
            intermediateValue30 = conditionValue21 ? sumValue131 : comparisonValue34;
            intermediateValue31 = conditionValue21 ? sumValue130 : comparisonValue33;
            break;
        }
        case 13u:
        {
            precise float sumValue133 = max(quotientValue33, max(quotientValue32, quotientValue31)) - min(quotientValue33, min(quotientValue32, quotientValue31));
            float comparisonValue20;
            float comparisonValue21;
            float comparisonValue22;
            if (quotientValue29 >= quotientValue28)
            {
                bool conditionValue22 = quotientValue28 < quotientValue30;
                bool conditionValue23 = quotientValue30 < quotientValue29;
                precise float sumValue134 = quotientValue29 - quotientValue28;
                precise float sumValue135 = quotientValue30 - quotientValue28;
                precise float sumValue136 = quotientValue28 - quotientValue30;
                precise float sumValue137 = quotientValue29 - quotientValue30;
                precise float productValue63 = sumValue133 * sumValue134;
                precise float productValue64 = sumValue133 * sumValue135;
                precise float productValue65 = sumValue133 * sumValue136;
                precise float quotientValue52 = productValue63 / max(sumValue135, 9.9999997473787516355514526367188e-05f);
                precise float quotientValue53 = productValue64 / max(sumValue134, 9.9999997473787516355514526367188e-05f);
                precise float quotientValue54 = productValue65 / max(sumValue137, 9.9999997473787516355514526367188e-05f);
                bool comparisonValue36 = quotientValue30 >= quotientValue29;
                bool comparisonValue37 = quotientValue30 >= quotientValue28;
                bool bitwiseValue10 = comparisonValue37 && (quotientValue28 < quotientValue29);
                comparisonValue20 = comparisonValue36 ? (conditionValue22 ? sumValue133 : 0.0f) : (bitwiseValue10 ? quotientValue53 : 0.0f);
                comparisonValue21 = comparisonValue36 ? (conditionValue22 ? quotientValue52 : 0.0f) : ((bitwiseValue10 || ((!comparisonValue37) && conditionValue23)) ? sumValue133 : 0.0f);
                comparisonValue22 = (comparisonValue36 || ((!conditionValue23) || comparisonValue37)) ? 0.0f : quotientValue54;
            }
            else
            {
                bool conditionValue24 = quotientValue29 < quotientValue30;
                bool conditionValue25 = quotientValue30 < quotientValue28;
                precise float sumValue138 = quotientValue28 - quotientValue29;
                precise float sumValue139 = quotientValue30 - quotientValue29;
                precise float sumValue140 = quotientValue29 - quotientValue30;
                precise float sumValue141 = quotientValue28 - quotientValue30;
                precise float productValue66 = sumValue133 * sumValue138;
                precise float productValue67 = sumValue133 * sumValue139;
                precise float productValue68 = sumValue133 * sumValue140;
                precise float quotientValue55 = productValue66 / max(sumValue139, 9.9999997473787516355514526367188e-05f);
                precise float quotientValue56 = productValue67 / max(sumValue138, 9.9999997473787516355514526367188e-05f);
                precise float quotientValue57 = productValue68 / max(sumValue141, 9.9999997473787516355514526367188e-05f);
                bool comparisonValue38 = quotientValue30 >= quotientValue28;
                bool comparisonValue39 = quotientValue30 >= quotientValue29;
                bool bitwiseValue11 = comparisonValue39 && (quotientValue29 < quotientValue28);
                comparisonValue20 = comparisonValue38 ? (conditionValue24 ? sumValue133 : 0.0f) : (bitwiseValue11 ? quotientValue56 : 0.0f);
                comparisonValue21 = ((comparisonValue39 || (!conditionValue25)) || comparisonValue38) ? 0.0f : quotientValue57;
                comparisonValue22 = comparisonValue38 ? (conditionValue24 ? quotientValue55 : 0.0f) : ((bitwiseValue11 || ((!comparisonValue39) && conditionValue25)) ? sumValue133 : 0.0f);
            }
            precise float sumValue142 = rdDot3Precise(vectorValue2, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) - rdDot3Precise(float3(comparisonValue22, comparisonValue21, comparisonValue20), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            precise float sumValue143 = sumValue142 + comparisonValue22;
            precise float sumValue144 = sumValue142 + comparisonValue21;
            precise float sumValue145 = sumValue142 + comparisonValue20;
            float scalarValue45 = rdDot3Precise(float3(sumValue143, sumValue144, sumValue145), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float scalarValue46 = min(sumValue145, min(sumValue144, sumValue143));
            float scalarValue47 = max(sumValue145, max(sumValue144, sumValue143));
            bool conditionValue26 = scalarValue46 < 0.0f;
            precise float sumValue146 = sumValue143 - scalarValue45;
            precise float sumValue147 = sumValue144 - scalarValue45;
            precise float sumValue148 = sumValue145 - scalarValue45;
            precise float productValue69 = scalarValue45 * sumValue146;
            precise float productValue70 = scalarValue45 * sumValue147;
            precise float productValue71 = scalarValue45 * sumValue148;
            precise float sumValue149 = scalarValue45 - scalarValue46;
            float scalarValue48 = max(sumValue149, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue58 = productValue69 / scalarValue48;
            precise float quotientValue59 = productValue70 / scalarValue48;
            precise float quotientValue60 = productValue71 / scalarValue48;
            precise float sumValue150 = scalarValue45 + quotientValue58;
            precise float sumValue151 = scalarValue45 + quotientValue59;
            precise float sumValue152 = scalarValue45 + quotientValue60;
            float comparisonValue40 = conditionValue26 ? sumValue150 : sumValue143;
            float comparisonValue41 = conditionValue26 ? sumValue151 : sumValue144;
            float comparisonValue42 = conditionValue26 ? sumValue152 : sumValue145;
            bool conditionValue27 = scalarValue47 > 1.0f;
            precise float sumValue153 = comparisonValue40 - scalarValue45;
            precise float sumValue154 = comparisonValue41 - scalarValue45;
            precise float sumValue155 = comparisonValue42 - scalarValue45;
            precise float sumValue156 = 1.0f - scalarValue45;
            precise float productValue72 = sumValue153 * sumValue156;
            precise float productValue73 = sumValue154 * sumValue156;
            precise float productValue74 = sumValue155 * sumValue156;
            precise float sumValue157 = scalarValue47 - scalarValue45;
            float scalarValue49 = max(sumValue157, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue61 = productValue72 / scalarValue49;
            precise float quotientValue62 = productValue73 / scalarValue49;
            precise float quotientValue63 = productValue74 / scalarValue49;
            precise float sumValue158 = scalarValue45 + quotientValue61;
            precise float sumValue159 = scalarValue45 + quotientValue62;
            precise float sumValue160 = scalarValue45 + quotientValue63;
            intermediateValue29 = conditionValue27 ? sumValue160 : comparisonValue42;
            intermediateValue30 = conditionValue27 ? sumValue159 : comparisonValue41;
            intermediateValue31 = conditionValue27 ? sumValue158 : comparisonValue40;
            break;
        }
        case 14u:
        {
            precise float sumValue161 = rdDot3Precise(vectorValue2, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) - rdDot3Precise(vectorValue3, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            precise float sumValue162 = sumValue161 + quotientValue31;
            precise float sumValue163 = sumValue161 + quotientValue32;
            precise float sumValue164 = sumValue161 + quotientValue33;
            float scalarValue50 = rdDot3Precise(float3(sumValue162, sumValue163, sumValue164), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float scalarValue51 = min(sumValue164, min(sumValue163, sumValue162));
            float scalarValue52 = max(sumValue164, max(sumValue163, sumValue162));
            bool conditionValue28 = scalarValue51 < 0.0f;
            precise float sumValue165 = sumValue162 - scalarValue50;
            precise float sumValue166 = sumValue163 - scalarValue50;
            precise float sumValue167 = sumValue164 - scalarValue50;
            precise float productValue75 = scalarValue50 * sumValue165;
            precise float productValue76 = scalarValue50 * sumValue166;
            precise float productValue77 = scalarValue50 * sumValue167;
            precise float sumValue168 = scalarValue50 - scalarValue51;
            float scalarValue53 = max(sumValue168, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue64 = productValue75 / scalarValue53;
            precise float quotientValue65 = productValue76 / scalarValue53;
            precise float quotientValue66 = productValue77 / scalarValue53;
            precise float sumValue169 = scalarValue50 + quotientValue64;
            precise float sumValue170 = scalarValue50 + quotientValue65;
            precise float sumValue171 = scalarValue50 + quotientValue66;
            float comparisonValue43 = conditionValue28 ? sumValue169 : sumValue162;
            float comparisonValue44 = conditionValue28 ? sumValue170 : sumValue163;
            float comparisonValue45 = conditionValue28 ? sumValue171 : sumValue164;
            bool conditionValue29 = scalarValue52 > 1.0f;
            precise float sumValue172 = comparisonValue43 - scalarValue50;
            precise float sumValue173 = comparisonValue44 - scalarValue50;
            precise float sumValue174 = comparisonValue45 - scalarValue50;
            precise float sumValue175 = 1.0f - scalarValue50;
            precise float productValue78 = sumValue172 * sumValue175;
            precise float productValue79 = sumValue173 * sumValue175;
            precise float productValue80 = sumValue174 * sumValue175;
            precise float sumValue176 = scalarValue52 - scalarValue50;
            float scalarValue54 = max(sumValue176, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue67 = productValue78 / scalarValue54;
            precise float quotientValue68 = productValue79 / scalarValue54;
            precise float quotientValue69 = productValue80 / scalarValue54;
            precise float sumValue177 = scalarValue50 + quotientValue67;
            precise float sumValue178 = scalarValue50 + quotientValue68;
            precise float sumValue179 = scalarValue50 + quotientValue69;
            intermediateValue29 = conditionValue29 ? sumValue179 : comparisonValue45;
            intermediateValue30 = conditionValue29 ? sumValue178 : comparisonValue44;
            intermediateValue31 = conditionValue29 ? sumValue177 : comparisonValue43;
            break;
        }
        case 15u:
        {
            precise float sumValue180 = rdDot3Precise(vectorValue3, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) - rdDot3Precise(vectorValue2, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            precise float sumValue181 = sumValue180 + quotientValue28;
            precise float sumValue182 = sumValue180 + quotientValue29;
            precise float sumValue183 = sumValue180 + quotientValue30;
            float scalarValue55 = rdDot3Precise(float3(sumValue181, sumValue182, sumValue183), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float scalarValue56 = min(sumValue183, min(sumValue182, sumValue181));
            float scalarValue57 = max(sumValue183, max(sumValue182, sumValue181));
            bool conditionValue30 = scalarValue56 < 0.0f;
            precise float sumValue184 = sumValue181 - scalarValue55;
            precise float sumValue185 = sumValue182 - scalarValue55;
            precise float sumValue186 = sumValue183 - scalarValue55;
            precise float productValue81 = scalarValue55 * sumValue184;
            precise float productValue82 = scalarValue55 * sumValue185;
            precise float productValue83 = scalarValue55 * sumValue186;
            precise float sumValue187 = scalarValue55 - scalarValue56;
            float scalarValue58 = max(sumValue187, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue70 = productValue81 / scalarValue58;
            precise float quotientValue71 = productValue82 / scalarValue58;
            precise float quotientValue72 = productValue83 / scalarValue58;
            precise float sumValue188 = scalarValue55 + quotientValue70;
            precise float sumValue189 = scalarValue55 + quotientValue71;
            precise float sumValue190 = scalarValue55 + quotientValue72;
            float comparisonValue46 = conditionValue30 ? sumValue188 : sumValue181;
            float comparisonValue47 = conditionValue30 ? sumValue189 : sumValue182;
            float comparisonValue48 = conditionValue30 ? sumValue190 : sumValue183;
            bool conditionValue31 = scalarValue57 > 1.0f;
            precise float sumValue191 = comparisonValue46 - scalarValue55;
            precise float sumValue192 = comparisonValue47 - scalarValue55;
            precise float sumValue193 = comparisonValue48 - scalarValue55;
            precise float sumValue194 = 1.0f - scalarValue55;
            precise float productValue84 = sumValue191 * sumValue194;
            precise float productValue85 = sumValue192 * sumValue194;
            precise float productValue86 = sumValue193 * sumValue194;
            precise float sumValue195 = scalarValue57 - scalarValue55;
            float scalarValue59 = max(sumValue195, 9.9999997473787516355514526367188e-05f);
            precise float quotientValue73 = productValue84 / scalarValue59;
            precise float quotientValue74 = productValue85 / scalarValue59;
            precise float quotientValue75 = productValue86 / scalarValue59;
            precise float sumValue196 = scalarValue55 + quotientValue73;
            precise float sumValue197 = scalarValue55 + quotientValue74;
            precise float sumValue198 = scalarValue55 + quotientValue75;
            intermediateValue29 = conditionValue31 ? sumValue198 : comparisonValue48;
            intermediateValue30 = conditionValue31 ? sumValue197 : comparisonValue47;
            intermediateValue31 = conditionValue31 ? sumValue196 : comparisonValue46;
            break;
        }
        case 16u:
        {
            precise float sumValue199 = quotientValue28 + quotientValue31;
            precise float sumValue200 = quotientValue29 + quotientValue32;
            precise float sumValue201 = quotientValue30 + quotientValue33;
            intermediateValue29 = min(sumValue201, 1.0f);
            intermediateValue30 = min(sumValue200, 1.0f);
            intermediateValue31 = min(sumValue199, 1.0f);
            break;
        }
        default:
        {
            intermediateValue29 = 0.0f;
            intermediateValue30 = 0.0f;
            intermediateValue31 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue26 = quotientValue25;
            intermediateValue27 = quotientValue24;
            intermediateValue28 = quotientValue23;
            break;
        }
        case 1u:
        {
            intermediateValue26 = quotientValue22 * quotientValue25;
            intermediateValue27 = quotientValue21 * quotientValue24;
            intermediateValue28 = quotientValue20 * quotientValue23;
            break;
        }
        case 2u:
        {
            intermediateValue26 = mad(-quotientValue22, quotientValue25, quotientValue22 + quotientValue25);
            intermediateValue27 = mad(-quotientValue21, quotientValue24, quotientValue21 + quotientValue24);
            intermediateValue28 = mad(-quotientValue20, quotientValue23, quotientValue20 + quotientValue23);
            break;
        }
        case 3u:
        {
            float multiplyAddValue = mad(quotientValue20, 2.0f, -1.0f);
            float multiplyAddValue1 = mad(quotientValue21, 2.0f, -1.0f);
            float multiplyAddValue2 = mad(quotientValue22, 2.0f, -1.0f);
            float multiplyAddValue3 = mad(-quotientValue23, multiplyAddValue, quotientValue23 + multiplyAddValue);
            float multiplyAddValue4 = mad(-quotientValue24, multiplyAddValue1, quotientValue24 + multiplyAddValue1);
            float multiplyAddValue5 = mad(-quotientValue25, multiplyAddValue2, quotientValue25 + multiplyAddValue2);
            intermediateValue26 = (quotientValue22 <= 0.5f) ? (mad(quotientValue25, quotientValue22 + quotientValue22, -multiplyAddValue5) + multiplyAddValue5) : multiplyAddValue5;
            intermediateValue27 = (quotientValue21 <= 0.5f) ? (mad(quotientValue24, quotientValue21 + quotientValue21, -multiplyAddValue4) + multiplyAddValue4) : multiplyAddValue4;
            intermediateValue28 = (quotientValue20 <= 0.5f) ? (mad(quotientValue23, quotientValue20 + quotientValue20, -multiplyAddValue3) + multiplyAddValue3) : multiplyAddValue3;
            break;
        }
        case 4u:
        {
            intermediateValue26 = min(quotientValue22, quotientValue25);
            intermediateValue27 = min(quotientValue21, quotientValue24);
            intermediateValue28 = min(quotientValue20, quotientValue23);
            break;
        }
        case 5u:
        {
            intermediateValue26 = max(quotientValue22, quotientValue25);
            intermediateValue27 = max(quotientValue21, quotientValue24);
            intermediateValue28 = max(quotientValue20, quotientValue23);
            break;
        }
        case 6u:
        {
            intermediateValue26 = min(quotientValue22 / max(1.0f - quotientValue25, 9.9999997473787516355514526367188e-05f), 1.0f);
            intermediateValue27 = min(quotientValue21 / max(1.0f - quotientValue24, 9.9999997473787516355514526367188e-05f), 1.0f);
            intermediateValue28 = min(quotientValue20 / max(1.0f - quotientValue23, 9.9999997473787516355514526367188e-05f), 1.0f);
            break;
        }
        case 7u:
        {
            intermediateValue26 = 1.0f - min((1.0f - quotientValue22) / max(quotientValue25, 9.9999997473787516355514526367188e-05f), 1.0f);
            intermediateValue27 = 1.0f - min((1.0f - quotientValue21) / max(quotientValue24, 9.9999997473787516355514526367188e-05f), 1.0f);
            intermediateValue28 = 1.0f - min((1.0f - quotientValue20) / max(quotientValue23, 9.9999997473787516355514526367188e-05f), 1.0f);
            break;
        }
        case 8u:
        {
            float multiplyAddValue6 = mad(quotientValue23, 2.0f, -1.0f);
            float multiplyAddValue7 = mad(quotientValue24, 2.0f, -1.0f);
            float multiplyAddValue8 = mad(quotientValue25, 2.0f, -1.0f);
            float multiplyAddValue9 = mad(-quotientValue20, multiplyAddValue6, quotientValue20 + multiplyAddValue6);
            float multiplyAddValue10 = mad(-quotientValue21, multiplyAddValue7, quotientValue21 + multiplyAddValue7);
            float multiplyAddValue11 = mad(-quotientValue22, multiplyAddValue8, quotientValue22 + multiplyAddValue8);
            intermediateValue26 = (quotientValue25 <= 0.5f) ? (mad(quotientValue22, quotientValue25 + quotientValue25, -multiplyAddValue11) + multiplyAddValue11) : multiplyAddValue11;
            intermediateValue27 = (quotientValue24 <= 0.5f) ? (mad(quotientValue21, quotientValue24 + quotientValue24, -multiplyAddValue10) + multiplyAddValue10) : multiplyAddValue10;
            intermediateValue28 = (quotientValue23 <= 0.5f) ? (mad(quotientValue20, quotientValue23 + quotientValue23, -multiplyAddValue9) + multiplyAddValue9) : multiplyAddValue9;
            break;
        }
        case 9u:
        {
            float nonlinearValue3 = sqrt(quotientValue20);
            float nonlinearValue4 = sqrt(quotientValue21);
            float nonlinearValue5 = sqrt(quotientValue22);
            float multiplyAddValue12 = mad(mad(quotientValue23, 2.0f, -1.0f), ((quotientValue20 <= 0.25f) ? (mad(mad(mad(quotientValue20, 16.0f, -12.0f), quotientValue20, 4.0f), quotientValue20, -nonlinearValue3) + nonlinearValue3) : nonlinearValue3) - quotientValue20, quotientValue20);
            float multiplyAddValue13 = mad(mad(quotientValue24, 2.0f, -1.0f), ((quotientValue21 <= 0.25f) ? (mad(mad(mad(quotientValue21, 16.0f, -12.0f), quotientValue21, 4.0f), quotientValue21, -nonlinearValue4) + nonlinearValue4) : nonlinearValue4) - quotientValue21, quotientValue21);
            float multiplyAddValue14 = mad(mad(quotientValue25, 2.0f, -1.0f), ((quotientValue22 <= 0.25f) ? (mad(mad(mad(quotientValue22, 16.0f, -12.0f), quotientValue22, 4.0f), quotientValue22, -nonlinearValue5) + nonlinearValue5) : nonlinearValue5) - quotientValue22, quotientValue22);
            intermediateValue26 = (quotientValue25 <= 0.5f) ? ((mad(-(quotientValue22 * mad(-quotientValue25, 2.0f, 1.0f)), 1.0f - quotientValue22, quotientValue22) - multiplyAddValue14) + multiplyAddValue14) : multiplyAddValue14;
            intermediateValue27 = (quotientValue24 <= 0.5f) ? ((mad(-(quotientValue21 * mad(-quotientValue24, 2.0f, 1.0f)), 1.0f - quotientValue21, quotientValue21) - multiplyAddValue13) + multiplyAddValue13) : multiplyAddValue13;
            intermediateValue28 = (quotientValue23 <= 0.5f) ? ((mad(-(quotientValue20 * mad(-quotientValue23, 2.0f, 1.0f)), 1.0f - quotientValue20, quotientValue20) - multiplyAddValue12) + multiplyAddValue12) : multiplyAddValue12;
            break;
        }
        case 10u:
        {
            intermediateValue26 = abs(quotientValue22 - quotientValue25);
            intermediateValue27 = abs(quotientValue21 - quotientValue24);
            intermediateValue28 = abs(quotientValue20 - quotientValue23);
            break;
        }
        case 11u:
        {
            intermediateValue26 = mad(-(quotientValue22 * quotientValue25), 2.0f, quotientValue22 + quotientValue25);
            intermediateValue27 = mad(-(quotientValue21 * quotientValue24), 2.0f, quotientValue21 + quotientValue24);
            intermediateValue28 = mad(-(quotientValue20 * quotientValue23), 2.0f, quotientValue20 + quotientValue23);
            break;
        }
        case 12u:
        {
            float sumValue33 = max(quotientValue22, max(quotientValue21, quotientValue20)) - min(quotientValue22, min(quotientValue21, quotientValue20));
            float comparisonValue14;
            float comparisonValue15;
            float comparisonValue16;
            if (quotientValue24 >= quotientValue23)
            {
                bool conditionValue = quotientValue23 < quotientValue25;
                bool conditionValue1 = quotientValue25 < quotientValue24;
                float sumValue34 = quotientValue24 - quotientValue23;
                float sumValue35 = quotientValue25 - quotientValue23;
                bool comparisonValue3 = quotientValue25 >= quotientValue24;
                bool comparisonValue4 = quotientValue25 >= quotientValue23;
                bool bitwiseValue2 = comparisonValue4 && (quotientValue23 < quotientValue24);
                comparisonValue14 = comparisonValue3 ? (conditionValue ? sumValue33 : 0.0f) : (bitwiseValue2 ? ((sumValue33 * sumValue35) / max(sumValue34, 9.9999997473787516355514526367188e-05f)) : 0.0f);
                comparisonValue15 = comparisonValue3 ? (conditionValue ? ((sumValue33 * sumValue34) / max(sumValue35, 9.9999997473787516355514526367188e-05f)) : 0.0f) : ((bitwiseValue2 || ((!comparisonValue4) && conditionValue1)) ? sumValue33 : 0.0f);
                comparisonValue16 = (comparisonValue3 || ((!conditionValue1) || comparisonValue4)) ? 0.0f : ((sumValue33 * (quotientValue23 - quotientValue25)) / max(quotientValue24 - quotientValue25, 9.9999997473787516355514526367188e-05f));
            }
            else
            {
                bool conditionValue2 = quotientValue24 < quotientValue25;
                bool conditionValue3 = quotientValue25 < quotientValue23;
                float sumValue36 = quotientValue23 - quotientValue24;
                float sumValue37 = quotientValue25 - quotientValue24;
                bool comparisonValue5 = quotientValue25 >= quotientValue23;
                bool comparisonValue6 = quotientValue25 >= quotientValue24;
                bool bitwiseValue3 = comparisonValue6 && (quotientValue24 < quotientValue23);
                comparisonValue14 = comparisonValue5 ? (conditionValue2 ? sumValue33 : 0.0f) : (bitwiseValue3 ? ((sumValue33 * sumValue37) / max(sumValue36, 9.9999997473787516355514526367188e-05f)) : 0.0f);
                comparisonValue15 = ((comparisonValue6 || (!conditionValue3)) || comparisonValue5) ? 0.0f : ((sumValue33 * (quotientValue24 - quotientValue25)) / max(quotientValue23 - quotientValue25, 9.9999997473787516355514526367188e-05f));
                comparisonValue16 = comparisonValue5 ? (conditionValue2 ? ((sumValue33 * sumValue36) / max(sumValue37, 9.9999997473787516355514526367188e-05f)) : 0.0f) : ((bitwiseValue3 || ((!comparisonValue6) && conditionValue3)) ? sumValue33 : 0.0f);
            }
            float sumValue38 = rdDot3Precise(vectorValue, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) - rdDot3Precise(float3(comparisonValue16, comparisonValue15, comparisonValue14), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float sumValue39 = sumValue38 + comparisonValue16;
            float sumValue40 = sumValue38 + comparisonValue15;
            float sumValue41 = sumValue38 + comparisonValue14;
            float scalarValue26 = rdDot3Precise(float3(sumValue39, sumValue40, sumValue41), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float scalarValue27 = min(sumValue41, min(sumValue40, sumValue39));
            float scalarValue28 = max(sumValue41, max(sumValue40, sumValue39));
            bool conditionValue4 = scalarValue27 < 0.0f;
            float sumValue42 = max(scalarValue26 - scalarValue27, 9.9999997473787516355514526367188e-05f);
            float comparisonValue7 = conditionValue4 ? (scalarValue26 + ((scalarValue26 * (sumValue39 - scalarValue26)) / sumValue42)) : sumValue39;
            float comparisonValue8 = conditionValue4 ? (scalarValue26 + ((scalarValue26 * (sumValue40 - scalarValue26)) / sumValue42)) : sumValue40;
            float comparisonValue9 = conditionValue4 ? (scalarValue26 + ((scalarValue26 * (sumValue41 - scalarValue26)) / sumValue42)) : sumValue41;
            bool conditionValue5 = scalarValue28 > 1.0f;
            float sumValue43 = 1.0f - scalarValue26;
            float sumValue44 = max(scalarValue28 - scalarValue26, 9.9999997473787516355514526367188e-05f);
            intermediateValue26 = conditionValue5 ? (scalarValue26 + (((comparisonValue9 - scalarValue26) * sumValue43) / sumValue44)) : comparisonValue9;
            intermediateValue27 = conditionValue5 ? (scalarValue26 + (((comparisonValue8 - scalarValue26) * sumValue43) / sumValue44)) : comparisonValue8;
            intermediateValue28 = conditionValue5 ? (scalarValue26 + (((comparisonValue7 - scalarValue26) * sumValue43) / sumValue44)) : comparisonValue7;
            break;
        }
        case 13u:
        {
            float sumValue45 = max(quotientValue25, max(quotientValue24, quotientValue23)) - min(quotientValue25, min(quotientValue24, quotientValue23));
            float comparisonValue20;
            float comparisonValue21;
            float comparisonValue22;
            if (quotientValue21 >= quotientValue20)
            {
                bool conditionValue6 = quotientValue20 < quotientValue22;
                bool conditionValue7 = quotientValue22 < quotientValue21;
                float sumValue46 = quotientValue21 - quotientValue20;
                float sumValue47 = quotientValue22 - quotientValue20;
                bool comparisonValue10 = quotientValue22 >= quotientValue21;
                bool comparisonValue11 = quotientValue22 >= quotientValue20;
                bool bitwiseValue4 = comparisonValue11 && (quotientValue20 < quotientValue21);
                comparisonValue20 = comparisonValue10 ? (conditionValue6 ? sumValue45 : 0.0f) : (bitwiseValue4 ? ((sumValue45 * sumValue47) / max(sumValue46, 9.9999997473787516355514526367188e-05f)) : 0.0f);
                comparisonValue21 = comparisonValue10 ? (conditionValue6 ? ((sumValue45 * sumValue46) / max(sumValue47, 9.9999997473787516355514526367188e-05f)) : 0.0f) : ((bitwiseValue4 || ((!comparisonValue11) && conditionValue7)) ? sumValue45 : 0.0f);
                comparisonValue22 = (comparisonValue10 || ((!conditionValue7) || comparisonValue11)) ? 0.0f : ((sumValue45 * (quotientValue20 - quotientValue22)) / max(quotientValue21 - quotientValue22, 9.9999997473787516355514526367188e-05f));
            }
            else
            {
                bool conditionValue8 = quotientValue21 < quotientValue22;
                bool conditionValue9 = quotientValue22 < quotientValue20;
                float sumValue48 = quotientValue20 - quotientValue21;
                float sumValue49 = quotientValue22 - quotientValue21;
                bool comparisonValue12 = quotientValue22 >= quotientValue20;
                bool comparisonValue13 = quotientValue22 >= quotientValue21;
                bool bitwiseValue5 = comparisonValue13 && (quotientValue21 < quotientValue20);
                comparisonValue20 = comparisonValue12 ? (conditionValue8 ? sumValue45 : 0.0f) : (bitwiseValue5 ? ((sumValue45 * sumValue49) / max(sumValue48, 9.9999997473787516355514526367188e-05f)) : 0.0f);
                comparisonValue21 = ((comparisonValue13 || (!conditionValue9)) || comparisonValue12) ? 0.0f : ((sumValue45 * (quotientValue21 - quotientValue22)) / max(quotientValue20 - quotientValue22, 9.9999997473787516355514526367188e-05f));
                comparisonValue22 = comparisonValue12 ? (conditionValue8 ? ((sumValue45 * sumValue48) / max(sumValue49, 9.9999997473787516355514526367188e-05f)) : 0.0f) : ((bitwiseValue5 || ((!comparisonValue13) && conditionValue9)) ? sumValue45 : 0.0f);
            }
            float sumValue50 = rdDot3Precise(vectorValue, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) - rdDot3Precise(float3(comparisonValue22, comparisonValue21, comparisonValue20), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float sumValue51 = sumValue50 + comparisonValue22;
            float sumValue52 = sumValue50 + comparisonValue21;
            float sumValue53 = sumValue50 + comparisonValue20;
            float scalarValue29 = rdDot3Precise(float3(sumValue51, sumValue52, sumValue53), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float scalarValue30 = min(sumValue53, min(sumValue52, sumValue51));
            float scalarValue31 = max(sumValue53, max(sumValue52, sumValue51));
            bool conditionValue10 = scalarValue30 < 0.0f;
            float sumValue54 = max(scalarValue29 - scalarValue30, 9.9999997473787516355514526367188e-05f);
            float comparisonValue17 = conditionValue10 ? (scalarValue29 + ((scalarValue29 * (sumValue51 - scalarValue29)) / sumValue54)) : sumValue51;
            float comparisonValue18 = conditionValue10 ? (scalarValue29 + ((scalarValue29 * (sumValue52 - scalarValue29)) / sumValue54)) : sumValue52;
            float comparisonValue19 = conditionValue10 ? (scalarValue29 + ((scalarValue29 * (sumValue53 - scalarValue29)) / sumValue54)) : sumValue53;
            bool conditionValue11 = scalarValue31 > 1.0f;
            float sumValue55 = 1.0f - scalarValue29;
            float sumValue56 = max(scalarValue31 - scalarValue29, 9.9999997473787516355514526367188e-05f);
            intermediateValue26 = conditionValue11 ? (scalarValue29 + (((comparisonValue19 - scalarValue29) * sumValue55) / sumValue56)) : comparisonValue19;
            intermediateValue27 = conditionValue11 ? (scalarValue29 + (((comparisonValue18 - scalarValue29) * sumValue55) / sumValue56)) : comparisonValue18;
            intermediateValue28 = conditionValue11 ? (scalarValue29 + (((comparisonValue17 - scalarValue29) * sumValue55) / sumValue56)) : comparisonValue17;
            break;
        }
        case 14u:
        {
            float sumValue57 = rdDot3Precise(vectorValue, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) - rdDot3Precise(vectorValue1, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float sumValue58 = sumValue57 + quotientValue23;
            float sumValue59 = sumValue57 + quotientValue24;
            float sumValue60 = sumValue57 + quotientValue25;
            float scalarValue32 = rdDot3Precise(float3(sumValue58, sumValue59, sumValue60), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float scalarValue33 = min(sumValue60, min(sumValue59, sumValue58));
            float scalarValue34 = max(sumValue60, max(sumValue59, sumValue58));
            bool conditionValue12 = scalarValue33 < 0.0f;
            float sumValue61 = max(scalarValue32 - scalarValue33, 9.9999997473787516355514526367188e-05f);
            float comparisonValue23 = conditionValue12 ? (scalarValue32 + ((scalarValue32 * (sumValue58 - scalarValue32)) / sumValue61)) : sumValue58;
            float comparisonValue24 = conditionValue12 ? (scalarValue32 + ((scalarValue32 * (sumValue59 - scalarValue32)) / sumValue61)) : sumValue59;
            float comparisonValue25 = conditionValue12 ? (scalarValue32 + ((scalarValue32 * (sumValue60 - scalarValue32)) / sumValue61)) : sumValue60;
            bool conditionValue13 = scalarValue34 > 1.0f;
            float sumValue62 = 1.0f - scalarValue32;
            float sumValue63 = max(scalarValue34 - scalarValue32, 9.9999997473787516355514526367188e-05f);
            intermediateValue26 = conditionValue13 ? (scalarValue32 + (((comparisonValue25 - scalarValue32) * sumValue62) / sumValue63)) : comparisonValue25;
            intermediateValue27 = conditionValue13 ? (scalarValue32 + (((comparisonValue24 - scalarValue32) * sumValue62) / sumValue63)) : comparisonValue24;
            intermediateValue28 = conditionValue13 ? (scalarValue32 + (((comparisonValue23 - scalarValue32) * sumValue62) / sumValue63)) : comparisonValue23;
            break;
        }
        case 15u:
        {
            float sumValue64 = rdDot3Precise(vectorValue1, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f)) - rdDot3Precise(vectorValue, float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float sumValue65 = sumValue64 + quotientValue20;
            float sumValue66 = sumValue64 + quotientValue21;
            float sumValue67 = sumValue64 + quotientValue22;
            float scalarValue35 = rdDot3Precise(float3(sumValue65, sumValue66, sumValue67), float3(0.2125999927520751953125f, 0.715200006961822509765625f, 0.072200000286102294921875f));
            float scalarValue36 = min(sumValue67, min(sumValue66, sumValue65));
            float scalarValue37 = max(sumValue67, max(sumValue66, sumValue65));
            bool conditionValue14 = scalarValue36 < 0.0f;
            float sumValue68 = max(scalarValue35 - scalarValue36, 9.9999997473787516355514526367188e-05f);
            float comparisonValue26 = conditionValue14 ? (scalarValue35 + ((scalarValue35 * (sumValue65 - scalarValue35)) / sumValue68)) : sumValue65;
            float comparisonValue27 = conditionValue14 ? (scalarValue35 + ((scalarValue35 * (sumValue66 - scalarValue35)) / sumValue68)) : sumValue66;
            float comparisonValue28 = conditionValue14 ? (scalarValue35 + ((scalarValue35 * (sumValue67 - scalarValue35)) / sumValue68)) : sumValue67;
            bool conditionValue15 = scalarValue37 > 1.0f;
            float sumValue69 = 1.0f - scalarValue35;
            float sumValue70 = max(scalarValue37 - scalarValue35, 9.9999997473787516355514526367188e-05f);
            intermediateValue26 = conditionValue15 ? (scalarValue35 + (((comparisonValue28 - scalarValue35) * sumValue69) / sumValue70)) : comparisonValue28;
            intermediateValue27 = conditionValue15 ? (scalarValue35 + (((comparisonValue27 - scalarValue35) * sumValue69) / sumValue70)) : comparisonValue27;
            intermediateValue28 = conditionValue15 ? (scalarValue35 + (((comparisonValue26 - scalarValue35) * sumValue69) / sumValue70)) : comparisonValue26;
            break;
        }
        case 16u:
        {
            intermediateValue26 = min(quotientValue22 + quotientValue25, 1.0f);
            intermediateValue27 = min(quotientValue21 + quotientValue24, 1.0f);
            intermediateValue28 = min(quotientValue20 + quotientValue23, 1.0f);
            break;
        }
        default:
        {
            intermediateValue26 = 0.0f;
            intermediateValue27 = 0.0f;
            intermediateValue28 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue5 = quotientValue3;
            productValue6 = quotientValue4;
            productValue7 = quotientValue5;
#endif
            break;
        }
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float clampedValue = productValue43 * clamp(intermediateValue31, 0.0f, 1.0f);
    precise float clampedValue1 = productValue43 * clamp(intermediateValue30, 0.0f, 1.0f);
    precise float clampedValue2 = productValue43 * clamp(intermediateValue29, 0.0f, 1.0f);
    precise float productValue87 = productValue43 * 1.0f;
    float multiplyAddValue40 = mad(-scalarValue22, fragmentVectorConstants1[quotientValue27][scalarValue38], 1.0f);
    fragmentColor0.x = mad(multiplyAddValue40, scalarValue18, mad(sumValue71, productValue39, clampedValue));
    fragmentColor0.y = mad(multiplyAddValue40, scalarValue19, mad(sumValue71, productValue40, clampedValue1));
    fragmentColor0.z = mad(multiplyAddValue40, scalarValue20, mad(sumValue71, productValue41, clampedValue2));
    fragmentColor0.w = mad(multiplyAddValue40, scalarValue21, mad(sumValue71, productValue42, productValue87));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue15 = mad(-scalarValue22, fragmentVectorConstants1[quotientValue19][scalarValue23], 1.0f);
    fragmentColor0.x = mad(multiplyAddValue15, scalarValue18, mad(sumValue32, productValue32, productValue36 * clamp(intermediateValue28, 0.0f, 1.0f)));
    fragmentColor0.y = mad(multiplyAddValue15, scalarValue19, mad(sumValue32, productValue33, productValue36 * clamp(intermediateValue27, 0.0f, 1.0f)));
    fragmentColor0.z = mad(multiplyAddValue15, scalarValue20, mad(sumValue32, productValue34, productValue36 * clamp(intermediateValue26, 0.0f, 1.0f)));
    fragmentColor0.w = mad(multiplyAddValue15, scalarValue21, mad(sumValue32, productValue35, productValue36));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue31 = 1.0f - productValue3;
    fragmentColor0.x = ((sumValue31 * scalarValue) + (productValue * sumValue1)) + (clamp(productValue5, 0.0f, 1.0f) * productValue4);
    fragmentColor0.y = ((sumValue31 * scalarValue1) + (productValue1 * sumValue1)) + (clamp(productValue6, 0.0f, 1.0f) * productValue4);
    fragmentColor0.z = ((sumValue31 * scalarValue2) + (productValue2 * sumValue1)) + (clamp(productValue7, 0.0f, 1.0f) * productValue4);
    fragmentColor0.w = (sumValue31 * scalarValue3) + productValue3;
#endif
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord1 = stage_input.varyingTexCoord1;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord0 = stage_input.varyingTexCoord0;
#endif
    varyingTexCoord4 = stage_input.varyingTexCoord4;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord2 = stage_input.varyingTexCoord2;
#endif
    varyingTexCoord3 = stage_input.varyingTexCoord3;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord5 = stage_input.varyingTexCoord5;
#endif
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
