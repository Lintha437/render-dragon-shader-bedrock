// TextureShiftRenderChunkPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE2_FLOAT_23 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_25 1
#endif
#define RD_USE_TEXTURE_SIZE_UINT2_0 1
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_UNSIGNED_TO_FLOAT2_FLOAT_24 1
#endif

#include "../../include/materials/TextureShiftRenderChunkPrepass/FragmentBindings.hlsli"

#include "../../include/Math.hlsli"


void executeFragmentStage()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool comparisonValue = (varyingSv_Isfrontface0 ? 4294967295u : 0u) != 0u;
#endif
    uint productValue = uint(int(varyingTexCoord6.y * 65535.0f));
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint productValue43 = productValue * 8u;
    float4 loadedBufferValue19 = asfloat(uint4(rdLoad_intermediateValue2(productValue43).x, rdLoad_intermediateValue2(productValue43 + 1u).x, rdLoad_intermediateValue2(productValue43 + 2u).x, rdLoad_intermediateValue2(productValue43 + 3u).x));
    uint productValue44 = (productValue * 8u) + 4u;
    float4 loadedBufferValue20 = asfloat(uint4(rdLoad_intermediateValue2(productValue44).x, rdLoad_intermediateValue2(productValue44 + 1u).x, rdLoad_intermediateValue2(productValue44 + 2u).x, rdLoad_intermediateValue2(productValue44 + 3u).x));
    float scalarValue22 = loadedBufferValue20.x;
    float scalarValue23 = loadedBufferValue20.y;
    float scalarValue24 = loadedBufferValue20.z;
    float multiplyAddValue12 = mad(-varyingTexCoord6.x, loadedBufferValue20.w, 1.0f);
    float clampedValue11 = (scalarValue24 == 0.0f) ? float(scalarValue23 >= multiplyAddValue12) : (1.0f - clamp((multiplyAddValue12 - scalarValue23) / scalarValue24, 0.0f, 1.0f));
    float sumValue9 = loadedBufferValue19.x + varyingTexCoord0.x;
    float sumValue10 = loadedBufferValue19.y + varyingTexCoord0.y;
    float sumValue11 = loadedBufferValue19.z + varyingTexCoord0.x;
    float sumValue12 = loadedBufferValue19.w + varyingTexCoord0.y;
    float4 sampledTextureValue5 = materialTexture1.Sample(textureSampler1, float2(sumValue9, sumValue10));
    float scalarValue25 = sampledTextureValue5.x;
    float scalarValue26 = sampledTextureValue5.y;
    float scalarValue27 = sampledTextureValue5.z;
    float scalarValue28 = sampledTextureValue5.w;
    float4 sampledTextureValue6 = materialTexture1.Sample(textureSampler1, float2(sumValue11, sumValue12));
    float scalarValue29 = sampledTextureValue6.w;
    bool comparisonValue24 = scalarValue28 >= 0.5f;
    bool comparisonValue25 = scalarValue29 >= 0.5f;
    float productValue45 = min(clampedValue11 * 4.0f, 1.0f);
    float comparisonValue26 = ((comparisonValue24 && comparisonValue25) || (!(comparisonValue24 || comparisonValue25))) ? float(comparisonValue24) : (comparisonValue25 ? productValue45 : (1.0f - productValue45));
    bool comparisonValue27 = comparisonValue26 <= 0.0f;
    bool comparisonValue28 = comparisonValue27 || (comparisonValue26 >= 1.0f);
    float multiplyAddValue17 = rdDot2Precise2(float2(floor(mad(varyingColor1.x / varyingColor1.w, 0.5f, 0.5f) * RD_UNIFORM_DITHER_PARAMS.x), floor(mad(varyingColor1.y / varyingColor1.w, 0.5f, 0.5f) * RD_UNIFORM_DITHER_PARAMS.y)), float2(0.067110560834407806396484375f, 0.005837149918079376220703125f));
    bool comparisonValue29 = (comparisonValue28 && comparisonValue27) || ((frac(frac(multiplyAddValue17) * 52.98291778564453125f) >= comparisonValue26) && (!comparisonValue28));
    if (comparisonValue29)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint productValue43 = productValue * 8u;
    float4 loadedBufferValue19 = asfloat(uint4(rdLoad_intermediateValue2(productValue43).x, rdLoad_intermediateValue2(productValue43 + 1u).x, rdLoad_intermediateValue2(productValue43 + 2u).x, rdLoad_intermediateValue2(productValue43 + 3u).x));
    uint productValue44 = (productValue * 8u) + 4u;
    float4 loadedBufferValue20 = asfloat(uint4(rdLoad_intermediateValue2(productValue44).x, rdLoad_intermediateValue2(productValue44 + 1u).x, rdLoad_intermediateValue2(productValue44 + 2u).x, rdLoad_intermediateValue2(productValue44 + 3u).x));
    float scalarValue22 = loadedBufferValue20.x;
    float scalarValue23 = loadedBufferValue20.y;
    float scalarValue24 = loadedBufferValue20.z;
    float multiplyAddValue12 = mad(-varyingTexCoord6.x, loadedBufferValue20.w, 1.0f);
    float clampedValue11 = (scalarValue24 == 0.0f) ? float(scalarValue23 >= multiplyAddValue12) : (1.0f - clamp((multiplyAddValue12 - scalarValue23) / scalarValue24, 0.0f, 1.0f));
    float sumValue9 = loadedBufferValue19.x + varyingTexCoord0.x;
    float sumValue10 = loadedBufferValue19.y + varyingTexCoord0.y;
    float sumValue11 = loadedBufferValue19.z + varyingTexCoord0.x;
    float sumValue12 = loadedBufferValue19.w + varyingTexCoord0.y;
    float4 sampledTextureValue5 = materialTexture1.Sample(textureSampler1, float2(sumValue9, sumValue10));
    float scalarValue25 = sampledTextureValue5.x;
    float scalarValue26 = sampledTextureValue5.y;
    float scalarValue27 = sampledTextureValue5.z;
    float scalarValue28 = sampledTextureValue5.w;
    float4 sampledTextureValue6 = materialTexture1.Sample(textureSampler1, float2(sumValue11, sumValue12));
    float scalarValue29 = sampledTextureValue6.w;
    bool comparisonValue24 = scalarValue28 >= 0.5f;
    bool comparisonValue25 = scalarValue29 >= 0.5f;
    float productValue45 = min(clampedValue11 * 4.0f, 1.0f);
    float comparisonValue65 = ((!(comparisonValue24 || comparisonValue25)) || (comparisonValue24 && comparisonValue25)) ? float(comparisonValue24) : (comparisonValue25 ? productValue45 : (1.0f - productValue45));
    bool comparisonValue66 = comparisonValue65 <= 0.0f;
    bool comparisonValue67 = comparisonValue66 || (comparisonValue65 >= 1.0f);
    uint4 reinterpretedBits3 = asuint(RD_UNIFORM_DITHER_PARAMS);
    float multiplyAddValue38 = mad(varyingColor1.x / varyingColor1.w, 0.5f, 0.5f) * asfloat(reinterpretedBits3.x);
    float multiplyAddValue39 = mad(varyingColor1.y / varyingColor1.w, 0.5f, 0.5f) * asfloat(reinterpretedBits3.y);
    float scalarValue71 = rdDot2Precise2(float2(floor(multiplyAddValue38), floor(multiplyAddValue39)), float2(0.067110560834407806396484375f, 0.005837149918079376220703125f));
    bool comparisonValue68 = ((frac(frac(scalarValue71) * 52.98291778564453125f) >= comparisonValue65) && (!comparisonValue67)) || (comparisonValue67 && comparisonValue66);
    float reinterpretedBits4 = asfloat(asuint(RD_UNIFORM_VIEW_MATRIX_ROW_0.z));
    float reinterpretedBits5 = asfloat(asuint(RD_UNIFORM_VIEW_MATRIX_ROW_1.z));
    float reinterpretedBits6 = asfloat(asuint(RD_UNIFORM_VIEW_MATRIX_ROW_2.z));
    float3 vectorValue19 = float3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue72 = rdDot3Precise2(vectorValue19, vectorValue19);
    float inverseLengthValue20 = rsqrt(scalarValue72);
    uint4 reinterpretedBits7 = asuint(RD_UNIFORM_VIEW_POSITION_AND_TIME);
    float reinterpretedBits8 = rdDot3Precise2(float3(-(inverseLengthValue20 * reinterpretedBits4), -(inverseLengthValue20 * reinterpretedBits5), -(inverseLengthValue20 * reinterpretedBits6)), float3(varyingTexCoord3.x - asfloat(reinterpretedBits7.x), varyingTexCoord3.y - asfloat(reinterpretedBits7.y), varyingTexCoord3.z - asfloat(reinterpretedBits7.z)));
    float reinterpretedBits9 = asfloat(asuint(RD_UNIFORM_DITHER_PARAMS2_ROW_2.x));
    float clampedValue30 = clamp((1.0f / (asfloat(asuint(RD_UNIFORM_DITHER_PARAMS2_ROW_2.y)) - reinterpretedBits9)) * (reinterpretedBits8 - reinterpretedBits9), 0.0f, 1.0f);
    float reinterpretedBits10 = asfloat(asuint(RD_UNIFORM_DITHER_PARAMS2_ROW_2.z));
    float quotientValue7 = floor(multiplyAddValue38 / reinterpretedBits10) * reinterpretedBits10;
    float quotientValue8 = floor(multiplyAddValue39 / reinterpretedBits10) * reinterpretedBits10;
    float productValue80 = floor(quotientValue8 * 0.25f);
    float productValue81 = floor(quotientValue8 * 0.5f);
    float scalarValue73 = floor(quotientValue8);
    if (comparisonValue68 || ((varyingTexCoord2.x > 0.5f) && ((mad(mad(mad(frac(mad(floor(quotientValue7 * 0.25f), 0.5f, (productValue80 * productValue80) * 0.75f)), 0.25f, frac(mad(floor(quotientValue7 * 0.5f), 0.5f, (productValue81 * productValue81) * 0.75f))), 0.25f, frac(mad(floor(quotientValue7), 0.5f, (scalarValue73 * scalarValue73) * 0.75f))), 64.0f, 0.5f) * 0.015625f) >= ((clampedValue30 * clampedValue30) * mad(clampedValue30, -2.0f, 3.0f)))))
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
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
    {
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
    float scalarValue4 = sampledTextureValue.w;
    float4 sampledTextureValue1 = matTextureTexture.Sample(matTextureSampler, float2(loadedBufferValue2 + varyingTexCoord0.x, loadedBufferValue3 + varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.w;
    float productValue1 = scalarValue5 * quotientValue;
    float productValue2 = productValue1 + (scalarValue4 * (1.0f - quotientValue));
    float comparisonValue4 = (productValue2 > 0.0f) ? (productValue1 / productValue2) : 0.0f;
    float productValue3 = (comparisonValue4 * (sampledTextureValue1.x - scalarValue1)) + scalarValue1;
    float productValue4 = (comparisonValue4 * (sampledTextureValue1.y - scalarValue2)) + scalarValue2;
    float productValue5 = (comparisonValue4 * (sampledTextureValue1.z - scalarValue3)) + scalarValue3;
    bool comparisonValue5 = scalarValue4 >= 0.5f;
    bool comparisonValue6 = scalarValue5 >= 0.5f;
    float comparisonValue7;
    if (comparisonValue5 != comparisonValue6)
    {
        float productValue6 = min(max(quotientValue * 4.0f, 0.0f), 1.0f);
        comparisonValue7 = comparisonValue6 ? productValue6 : (1.0f - productValue6);
    }
    else
    {
        comparisonValue7 = float(comparisonValue5);
    }
    bool comparisonValue8 = comparisonValue7 <= 0.0f;
    bool intermediateValue9;
    if (comparisonValue8 || (comparisonValue7 >= 1.0f))
    {
        intermediateValue9 = comparisonValue8;
    }
    else
    {
        intermediateValue9 = comparisonValue7 <= frac(frac(dot(float2(floor((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x), floor((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y)), float2(0.067110560834407806396484375f, 0.005837149918079376220703125f))) * 52.98291778564453125f);
    }
    float comparisonValue9 = intermediateValue9 ? 0.0f : 1.0f;
    if (intermediateValue9)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
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
    {
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
    float scalarValue4 = sampledTextureValue.w;
    float4 sampledTextureValue1 = matTextureTexture.Sample(matTextureSampler, float2(loadedBufferValue2 + varyingTexCoord0.x, loadedBufferValue3 + varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.w;
    float productValue1 = scalarValue5 * quotientValue;
    float productValue2 = productValue1 + (scalarValue4 * (1.0f - quotientValue));
    float comparisonValue4 = (productValue2 > 0.0f) ? (productValue1 / productValue2) : 0.0f;
    float productValue3 = (comparisonValue4 * (sampledTextureValue1.x - scalarValue1)) + scalarValue1;
    float productValue4 = (comparisonValue4 * (sampledTextureValue1.y - scalarValue2)) + scalarValue2;
    float productValue5 = (comparisonValue4 * (sampledTextureValue1.z - scalarValue3)) + scalarValue3;
    bool comparisonValue5 = scalarValue4 >= 0.5f;
    bool comparisonValue6 = scalarValue5 >= 0.5f;
    float comparisonValue7;
    if (comparisonValue5 != comparisonValue6)
    {
        float productValue6 = min(max(quotientValue * 4.0f, 0.0f), 1.0f);
        comparisonValue7 = comparisonValue6 ? productValue6 : (1.0f - productValue6);
    }
    else
    {
        comparisonValue7 = float(comparisonValue5);
    }
    bool comparisonValue8 = comparisonValue7 <= 0.0f;
    bool intermediateValue9;
    if (comparisonValue8 || (comparisonValue7 >= 1.0f))
    {
        intermediateValue9 = comparisonValue8;
    }
    else
    {
        intermediateValue9 = comparisonValue7 <= frac(frac(dot(float2(floor((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x), floor((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y)), float2(0.067110560834407806396484375f, 0.005837149918079376220703125f))) * 52.98291778564453125f);
    }
    float comparisonValue9 = intermediateValue9 ? 0.0f : 1.0f;
    bool comparisonValue10;
    if (varyingTexCoord2.x > 0.5f)
    {
        float inverseLengthValue14 = rsqrt(dot(float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z), float3(RD_UNIFORM_VIEW_MATRIX_ROW_0.z, RD_UNIFORM_VIEW_MATRIX_ROW_1.z, RD_UNIFORM_VIEW_MATRIX_ROW_2.z)));
        float clampedValue22 = clamp((dot(float3((-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_0.z * inverseLengthValue14), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_1.z * inverseLengthValue14), (-0.0f) - (RD_UNIFORM_VIEW_MATRIX_ROW_2.z * inverseLengthValue14)), float3(varyingTexCoord3.x - RD_UNIFORM_VIEW_POSITION_AND_TIME.x, varyingTexCoord3.y - RD_UNIFORM_VIEW_POSITION_AND_TIME.y, varyingTexCoord3.z - RD_UNIFORM_VIEW_POSITION_AND_TIME.z)) - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x) / (RD_UNIFORM_DITHER_PARAMS2_ROW_2.y - RD_UNIFORM_DITHER_PARAMS2_ROW_2.x), 0.0f, 1.0f);
        float quotientValue4 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.x) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float quotientValue5 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5f) + 0.5f) * RD_UNIFORM_DITHER_PARAMS.y) / RD_UNIFORM_DITHER_PARAMS2_ROW_2.z) * RD_UNIFORM_DITHER_PARAMS2_ROW_2.z;
        float productValue63 = floor(quotientValue5 * 0.25f);
        float productValue64 = floor(quotientValue5 * 0.5f);
        float scalarValue58 = floor(quotientValue5);
        comparisonValue10 = ((clampedValue22 * clampedValue22) * (3.0f - (clampedValue22 * 2.0f))) <= ((((frac(((productValue64 * productValue64) * 0.75f) + (floor(quotientValue4 * 0.5f) * 0.5f)) + (frac(((productValue63 * productValue63) * 0.75f) + (floor(quotientValue4 * 0.25f) * 0.5f)) * 0.25f)) * 0.25f) + 0.0078125f) + frac(((scalarValue58 * scalarValue58) * 0.75f) + (floor(quotientValue4) * 0.5f)));
    }
    else
    {
        comparisonValue10 = false;
    }
    if (intermediateValue9 || comparisonValue10)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool conditionValue7 = clampedValue11 < 0.5f;
    uint reinterpretedBits = uint(int(asuint(scalarValue22)) >> int(16u)) & 65535u;
    uint reinterpretedBits1 = asuint(scalarValue22) & 65535u;
    float comparisonValue30 = conditionValue7 ? sumValue9 : sumValue11;
    float comparisonValue31 = conditionValue7 ? sumValue10 : sumValue12;
    uint comparisonValue32 = conditionValue7 ? reinterpretedBits : reinterpretedBits1;
    float productValue46 = clampedValue11 * scalarValue29;
    float multiplyAddValue18 = mad(1.0f - clampedValue11, scalarValue28, productValue46);
    bool conditionValue8 = multiplyAddValue18 > 0.0f;
    float quotientValue2 = productValue46 / multiplyAddValue18;
    float multiplyAddValue19 = conditionValue8 ? mad(sampledTextureValue6.x - scalarValue25, quotientValue2, scalarValue25) : scalarValue25;
    float multiplyAddValue20 = conditionValue8 ? mad(sampledTextureValue6.y - scalarValue26, quotientValue2, scalarValue26) : scalarValue26;
    float multiplyAddValue21 = conditionValue8 ? mad(sampledTextureValue6.z - scalarValue27, quotientValue2, scalarValue27) : scalarValue27;
    bool comparisonValue33 = varyingTexCoord2.y != 0.0f;
    fragmentColor1.x = comparisonValue33 ? ((comparisonValue29 ? multiplyAddValue19 : (mad(multiplyAddValue19, varyingColor0.x, -multiplyAddValue19) + multiplyAddValue19)) * varyingColor0.w) : (multiplyAddValue19 * varyingColor0.x);
    fragmentColor1.y = comparisonValue33 ? ((comparisonValue29 ? multiplyAddValue20 : (mad(multiplyAddValue20, varyingColor0.y, -multiplyAddValue20) + multiplyAddValue20)) * varyingColor0.w) : (multiplyAddValue20 * varyingColor0.y);
    fragmentColor1.z = comparisonValue33 ? ((comparisonValue29 ? multiplyAddValue21 : (mad(multiplyAddValue21, varyingColor0.z, -multiplyAddValue21) + multiplyAddValue21)) * varyingColor0.w) : (multiplyAddValue21 * varyingColor0.z);
    float intermediateValue25;
    float intermediateValue27;
    float multiplyAddValue6;
    float multiplyAddValue7;
    float multiplyAddValue8;
    float intermediateValue29;
    float intermediateValue31;
    if ((conditionValue7 && (reinterpretedBits != 65535u)) || ((!conditionValue7) && (reinterpretedBits1 != 65535u)))
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    bool conditionValue7 = clampedValue11 < 0.5f;
    uint reinterpretedBits = uint(int(asuint(scalarValue22)) >> int(16u)) & 65535u;
    uint reinterpretedBits1 = asuint(scalarValue22) & 65535u;
    float comparisonValue30 = conditionValue7 ? sumValue9 : sumValue11;
    float comparisonValue31 = conditionValue7 ? sumValue10 : sumValue12;
    uint comparisonValue32 = conditionValue7 ? reinterpretedBits : reinterpretedBits1;
    float productValue46 = clampedValue11 * scalarValue29;
    float multiplyAddValue18 = mad(1.0f - clampedValue11, scalarValue28, productValue46);
    bool conditionValue8 = multiplyAddValue18 > 0.0f;
    float quotientValue2 = productValue46 / multiplyAddValue18;
    float multiplyAddValue19 = conditionValue8 ? mad(sampledTextureValue6.x - scalarValue25, quotientValue2, scalarValue25) : scalarValue25;
    float multiplyAddValue20 = conditionValue8 ? mad(sampledTextureValue6.y - scalarValue26, quotientValue2, scalarValue26) : scalarValue26;
    float multiplyAddValue21 = conditionValue8 ? mad(sampledTextureValue6.z - scalarValue27, quotientValue2, scalarValue27) : scalarValue27;
    bool comparisonValue33 = varyingTexCoord2.y != 0.0f;
    fragmentColor1.x = comparisonValue33 ? ((comparisonValue68 ? multiplyAddValue19 : (mad(multiplyAddValue19, varyingColor0.x, -multiplyAddValue19) + multiplyAddValue19)) * varyingColor0.w) : (multiplyAddValue19 * varyingColor0.x);
    fragmentColor1.y = comparisonValue33 ? ((comparisonValue68 ? multiplyAddValue20 : (mad(multiplyAddValue20, varyingColor0.y, -multiplyAddValue20) + multiplyAddValue20)) * varyingColor0.w) : (multiplyAddValue20 * varyingColor0.y);
    fragmentColor1.z = comparisonValue33 ? ((comparisonValue68 ? multiplyAddValue21 : (mad(multiplyAddValue21, varyingColor0.z, -multiplyAddValue21) + multiplyAddValue21)) * varyingColor0.w) : (multiplyAddValue21 * varyingColor0.z);
    float intermediateValue29;
    float intermediateValue31;
    float multiplyAddValue7;
    float multiplyAddValue8;
    float multiplyAddValue9;
    float intermediateValue33;
    float intermediateValue35;
    if (((!conditionValue7) && (reinterpretedBits1 != 65535u)) || (conditionValue7 && (reinterpretedBits != 65535u)))
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue7 = productValue3 * varyingColor0.x;
    float productValue8 = productValue4 * varyingColor0.y;
    float productValue9 = productValue5 * varyingColor0.z;
    float productValue10;
    float productValue11;
    float productValue12;
    if (varyingTexCoord2.y != 0.0f)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue7 = productValue3 * varyingColor0.x;
    float productValue8 = productValue4 * varyingColor0.y;
    float productValue9 = productValue5 * varyingColor0.z;
    float productValue12;
    float productValue13;
    float productValue14;
    if (varyingTexCoord2.y != 0.0f)
#endif
    {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        uint productValue47 = (comparisonValue32 * 16u) + 4u;
        float4 loadedBufferValue21 = asfloat(uint4(rdLoad_intermediateValue1(productValue47).x, rdLoad_intermediateValue1(productValue47 + 1u).x, rdLoad_intermediateValue1(productValue47 + 2u).x, rdLoad_intermediateValue1(productValue47 + 3u).x));
        float scalarValue30 = loadedBufferValue21.x;
        float scalarValue31 = loadedBufferValue21.y;
        float scalarValue32 = loadedBufferValue21.z;
        float scalarValue33 = loadedBufferValue21.w;
        uint productValue48 = (comparisonValue32 * 16u) + 8u;
        float4 loadedBufferValue22 = asfloat(uint4(rdLoad_intermediateValue1(productValue48).x, rdLoad_intermediateValue1(productValue48 + 1u).x, rdLoad_intermediateValue1(productValue48 + 2u).x, rdLoad_intermediateValue1(productValue48 + 3u).x));
        uint productValue49 = (comparisonValue32 * 16u) + 12u;
        float2 loadedBufferValue23 = asfloat(uint2(rdLoad_intermediateValue1(productValue49).x, rdLoad_intermediateValue1(productValue49 + 1u).x));
        float scalarValue34 = loadedBufferValue23.x;
        float scalarValue35 = loadedBufferValue23.y;
        uint reinterpretedBits2 = asuint(loadedBufferValue22.x);
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        if ((reinterpretedBits2 & 4u) == 4u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        uint productValue47 = (comparisonValue32 * 16u) + 4u;
        float4 loadedBufferValue21 = asfloat(uint4(rdLoad_intermediateValue1(productValue47).x, rdLoad_intermediateValue1(productValue47 + 1u).x, rdLoad_intermediateValue1(productValue47 + 2u).x, rdLoad_intermediateValue1(productValue47 + 3u).x));
        float scalarValue30 = loadedBufferValue21.x;
        float scalarValue31 = loadedBufferValue21.y;
        float scalarValue32 = loadedBufferValue21.z;
        float scalarValue33 = loadedBufferValue21.w;
        uint productValue48 = (comparisonValue32 * 16u) + 8u;
        float4 loadedBufferValue22 = asfloat(uint4(rdLoad_intermediateValue1(productValue48).x, rdLoad_intermediateValue1(productValue48 + 1u).x, rdLoad_intermediateValue1(productValue48 + 2u).x, rdLoad_intermediateValue1(productValue48 + 3u).x));
        uint productValue49 = (comparisonValue32 * 16u) + 12u;
        float2 loadedBufferValue23 = asfloat(uint2(rdLoad_intermediateValue1(productValue49).x, rdLoad_intermediateValue1(productValue49 + 1u).x));
        float scalarValue34 = loadedBufferValue23.x;
        float scalarValue35 = loadedBufferValue23.y;
        uint reinterpretedBits2 = asuint(loadedBufferValue22.x);
        float multiplyAddValue14;
        float multiplyAddValue15;
        float multiplyAddValue16;
        if ((reinterpretedBits2 & 4u) == 4u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue10 = ((comparisonValue9 * (productValue7 - productValue3)) + productValue3) * varyingColor0.w;
        productValue11 = ((comparisonValue9 * (productValue8 - productValue4)) + productValue4) * varyingColor0.w;
        productValue12 = ((comparisonValue9 * (productValue9 - productValue5)) + productValue5) * varyingColor0.w;
    }
    else
    {
        productValue10 = productValue7;
        productValue11 = productValue8;
        productValue12 = productValue9;
    }
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if (comparisonValue3 == 65535u)
    {
        intermediateValue10 = 0.0f;
        intermediateValue11 = 1.0f;
        intermediateValue12 = 0.0f;
        intermediateValue13 = 0.0f;
        intermediateValue15 = 0.0f;
        intermediateValue16 = 1.0f;
        intermediateValue17 = 0.0f;
    }
    else
    {
        float loadedBufferValue11 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 4u).x);
        float loadedBufferValue12 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 5u).x);
        float loadedBufferValue13 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 6u).x);
        float loadedBufferValue14 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 7u).x);
        uint4 loadedBufferValue15 = rdLoad_pbrData((comparisonValue3 * 16u) + 8u);
        uint scalarValue6 = loadedBufferValue15.x;
        float loadedBufferValue16 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 12u).x);
        float loadedBufferValue17 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 13u).x);
        float loadedBufferValue18 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 15u).x);
        float intermediateValue20;
        float intermediateValue21;
        float intermediateValue22;
        if ((scalarValue6 & 4u) == 0u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue12 = ((comparisonValue9 * (productValue7 - productValue3)) + productValue3) * varyingColor0.w;
        productValue13 = ((comparisonValue9 * (productValue8 - productValue4)) + productValue4) * varyingColor0.w;
        productValue14 = ((comparisonValue9 * (productValue9 - productValue5)) + productValue5) * varyingColor0.w;
    }
    else
    {
        productValue12 = productValue7;
        productValue13 = productValue8;
        productValue14 = productValue9;
    }
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if (comparisonValue3 == 65535u)
    {
        intermediateValue11 = 0.0f;
        intermediateValue12 = 1.0f;
        intermediateValue13 = 0.0f;
        intermediateValue14 = 0.0f;
        intermediateValue16 = 0.0f;
        intermediateValue17 = 1.0f;
        intermediateValue18 = 0.0f;
    }
    else
    {
        float loadedBufferValue11 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 4u).x);
        float loadedBufferValue12 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 5u).x);
        float loadedBufferValue13 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 6u).x);
        float loadedBufferValue14 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 7u).x);
        uint4 loadedBufferValue15 = rdLoad_pbrData((comparisonValue3 * 16u) + 8u);
        uint scalarValue6 = loadedBufferValue15.x;
        float loadedBufferValue16 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 12u).x);
        float loadedBufferValue17 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 13u).x);
        float loadedBufferValue18 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 15u).x);
        float intermediateValue21;
        float intermediateValue22;
        float intermediateValue23;
        if ((scalarValue6 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float4 sampledTextureValue7 = materialTexture1.Sample(textureSampler1, float2(mad(comparisonValue30, scalarValue30, scalarValue32), mad(comparisonValue31, scalarValue31, scalarValue33)));
            multiplyAddValue13 = mad(sampledTextureValue7.y, 2.0f, -1.0f);
            multiplyAddValue14 = mad(sampledTextureValue7.x, 2.0f, -1.0f);
            multiplyAddValue15 = mad(sampledTextureValue7.z, 2.0f, -1.0f);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float4 sampledTextureValue7 = materialTexture1.Sample(textureSampler1, float2(mad(comparisonValue30, scalarValue30, scalarValue32), mad(comparisonValue31, scalarValue31, scalarValue33)));
            multiplyAddValue14 = mad(sampledTextureValue7.y, 2.0f, -1.0f);
            multiplyAddValue15 = mad(sampledTextureValue7.x, 2.0f, -1.0f);
            multiplyAddValue16 = mad(sampledTextureValue7.z, 2.0f, -1.0f);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue6 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue6 & 16u) == 0u)
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
                    float scalarValue7 = sampledTextureValue2.x;
                    float scalarValue8 = sampledTextureValue2.y;
                    float scalarValue9 = sampledTextureValue2.z;
                    float multiplyAddValue2 = clamp(mad(min(loadedBufferValue18 - loadedBufferValue17, loadedBufferValue18), -1.0f, 2.0f), 0.0f, 1.0f);
                    bool conditionValue1 = multiplyAddValue2 > 0.0f;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue7 == scalarValue8) && (scalarValue8 == scalarValue9))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue1)
                        {
                            uint unusedTextureMipCount727;
                            uint2 vectorValue = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount727);
                            float productValue15 = float(int(uint(int(float(int(vectorValue.x)))))) * multiplyAddValue;
                            float productValue16 = float(int(uint(int(float(int(vectorValue.y)))))) * multiplyAddValue1;
                            float scalarValue10 = frac(productValue15);
                            float scalarValue11 = frac(productValue16);
                            float comparisonValue19;
                            if (abs(scalarValue10 + (-0.5f)) < 0.0625f)
                            {
                                comparisonValue19 = ((scalarValue10 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue;
                            }
                            else
                            {
                                comparisonValue19 = multiplyAddValue;
                            }
                            float comparisonValue20;
                            if (abs(scalarValue11 + (-0.5f)) < 0.0625f)
                            {
                                comparisonValue20 = ((scalarValue11 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue20 = multiplyAddValue1;
                            }
                            float4 vectorValue1 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue19, comparisonValue20));
                            float scalarValue12 = vectorValue1.x;
                            float scalarValue13 = vectorValue1.y;
                            float scalarValue14 = vectorValue1.z;
                            float scalarValue15 = vectorValue1.w;
                            float sumValue = frac(productValue15 + 0.5f);
                            float sumValue1 = frac(productValue16 + 0.5f);
                            bool conditionValue2 = sumValue1 > 0.5f;
                            float intermediateValue[2];
                            intermediateValue[0u] = conditionValue2 ? scalarValue12 : scalarValue15;
                            intermediateValue[1u] = conditionValue2 ? scalarValue13 : scalarValue14;
                            float clampedValue4 = intermediateValue[uint(int(clamp((sumValue + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue5 = intermediateValue[uint(int(clamp((sumValue + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue2 = clampedValue4 - clampedValue5;
                            bool conditionValue3 = sumValue > 0.5f;
                            intermediateValue[0u] = conditionValue3 ? scalarValue14 : scalarValue15;
                            intermediateValue[1u] = conditionValue3 ? scalarValue13 : scalarValue12;
                            float clampedValue6 = intermediateValue[uint(int(clamp((sumValue1 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue1 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue = rsqrt(dot(float3(sumValue2, clampedValue6, 0.25f), float3(sumValue2, clampedValue6, 0.25f)));
                            float productValue17 = inverseLengthValue * multiplyAddValue2;
                            branchMergedValue12 = productValue17 * sumValue2;
                            branchMergedValue14 = productValue17 * clampedValue6;
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
                        uint unusedTextureMipCount717;
                        uint2 vectorValue2 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount717);
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue1)
                        {
                            float productValue18 = frac(float(int(uint(int(float(int(vectorValue2.x)))))) * multiplyAddValue);
                            float productValue19 = frac(float(int(uint(int(float(int(vectorValue2.y)))))) * multiplyAddValue1);
                            float comparisonValue11 = (((productValue18 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue18 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.w * 2.0f) + (-1.0f)));
                            float comparisonValue12 = (((productValue19 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue9 * 2.0f) + (-1.0f))) - (((productValue19 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f)));
                            float comparisonValue15 = ((abs(comparisonValue11) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue11;
                            float comparisonValue16 = ((abs(comparisonValue12) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue12;
                            float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue15, comparisonValue16, 0.25f), float3(comparisonValue15, comparisonValue16, 0.25f)));
                            float productValue25 = inverseLengthValue1 * multiplyAddValue2;
                            branchMergedValue13 = productValue25 * comparisonValue15;
                            branchMergedValue16 = productValue25 * comparisonValue16;
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
                float multiplyAddValue4 = mad(comparisonValue1, loadedBufferValue12, loadedBufferValue14);
                float multiplyAddValue5 = clamp(mad(min(loadedBufferValue18 - loadedBufferValue17, loadedBufferValue18), -1.0f, 2.0f), 0.0f, 1.0f);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue5 > 0.0f)
                {
                    uint unusedTextureMipCount655;
                    uint2 vectorValue3 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount655);
                    float productValue26 = float(int(uint(int(float(int(vectorValue3.x)))))) * multiplyAddValue3;
                    float productValue32 = float(int(uint(int(float(int(vectorValue3.y)))))) * multiplyAddValue4;
                    float scalarValue16 = frac(productValue26);
                    float scalarValue17 = frac(productValue32);
                    float comparisonValue13;
                    if (abs(scalarValue16 + (-0.5f)) < 0.0625f)
                    {
                        comparisonValue13 = ((scalarValue16 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue3;
                    }
                    else
                    {
                        comparisonValue13 = multiplyAddValue3;
                    }
                    float comparisonValue18;
                    if (abs(scalarValue17 + (-0.5f)) < 0.0625f)
                    {
                        comparisonValue18 = ((scalarValue17 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
                    }
                    else
                    {
                        comparisonValue18 = multiplyAddValue4;
                    }
                    float4 vectorValue4 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue13, comparisonValue18));
                    float scalarValue18 = vectorValue4.x;
                    float scalarValue19 = vectorValue4.y;
                    float scalarValue20 = vectorValue4.z;
                    float scalarValue21 = vectorValue4.w;
                    float sumValue3 = frac(productValue26 + 0.5f);
                    float sumValue4 = frac(productValue32 + 0.5f);
                    bool conditionValue4 = sumValue4 > 0.5f;
                    float rdAccess_intermediateValue1(2);
                    rdAccess_intermediateValue1(0u) = conditionValue4 ? scalarValue18 : scalarValue21;
                    rdAccess_intermediateValue1(1u) = conditionValue4 ? scalarValue19 : scalarValue20;
                    float clampedValue7 = rdAccess_intermediateValue1(uint(int(clamp((sumValue3 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f))));
                    float clampedValue8 = rdAccess_intermediateValue1(uint(int(clamp((sumValue3 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f))));
                    float sumValue5 = clampedValue7 - clampedValue8;
                    bool conditionValue5 = sumValue3 > 0.5f;
                    rdAccess_intermediateValue1(0u) = conditionValue5 ? scalarValue20 : scalarValue21;
                    rdAccess_intermediateValue1(1u) = conditionValue5 ? scalarValue19 : scalarValue18;
                    float clampedValue9 = rdAccess_intermediateValue1(uint(int(clamp((sumValue4 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))) - rdAccess_intermediateValue1(uint(int(clamp((sumValue4 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f))));
                    float inverseLengthValue2 = rsqrt(dot(float3(sumValue5, clampedValue9, 0.25f), float3(sumValue5, clampedValue9, 0.25f)));
                    float productValue33 = inverseLengthValue2 * multiplyAddValue5;
                    branchMergedValue4 = productValue33 * sumValue5;
                    branchMergedValue7 = productValue33 * clampedValue9;
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
            intermediateValue20 = branchMergedValue;
            intermediateValue21 = branchMergedValue1;
            intermediateValue22 = branchMergedValue2;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue6 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue6 & 16u) == 0u)
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
                    float scalarValue7 = sampledTextureValue2.x;
                    float scalarValue8 = sampledTextureValue2.y;
                    float scalarValue9 = sampledTextureValue2.z;
                    float multiplyAddValue2 = clamp(mad(min(loadedBufferValue18 - loadedBufferValue17, loadedBufferValue18), -1.0f, 2.0f), 0.0f, 1.0f);
                    bool conditionValue1 = multiplyAddValue2 > 0.0f;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue7 == scalarValue8) && (scalarValue8 == scalarValue9))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue1)
                        {
                            uint unusedTextureMipCount828;
                            uint2 vectorValue14 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount828);
                            float productValue65 = float(int(uint(int(float(int(vectorValue14.x)))))) * multiplyAddValue;
                            float productValue66 = float(int(uint(int(float(int(vectorValue14.y)))))) * multiplyAddValue1;
                            float scalarValue59 = frac(productValue65);
                            float scalarValue60 = frac(productValue66);
                            float comparisonValue20;
                            if (abs(scalarValue59 + (-0.5f)) < 0.0625f)
                            {
                                comparisonValue20 = ((scalarValue59 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue;
                            }
                            else
                            {
                                comparisonValue20 = multiplyAddValue;
                            }
                            float comparisonValue21;
                            if (abs(scalarValue60 + (-0.5f)) < 0.0625f)
                            {
                                comparisonValue21 = ((scalarValue60 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue21 = multiplyAddValue1;
                            }
                            float4 vectorValue15 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue20, comparisonValue21));
                            float scalarValue61 = vectorValue15.x;
                            float scalarValue62 = vectorValue15.y;
                            float scalarValue63 = vectorValue15.z;
                            float scalarValue64 = vectorValue15.w;
                            float sumValue23 = frac(productValue65 + 0.5f);
                            float sumValue24 = frac(productValue66 + 0.5f);
                            bool conditionValue18 = sumValue24 > 0.5f;
                            float intermediateValue[2];
                            intermediateValue[0u] = conditionValue18 ? scalarValue61 : scalarValue64;
                            intermediateValue[1u] = conditionValue18 ? scalarValue62 : scalarValue63;
                            float clampedValue23 = intermediateValue[uint(int(clamp((sumValue23 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))];
                            float clampedValue24 = intermediateValue[uint(int(clamp((sumValue23 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float sumValue25 = clampedValue23 - clampedValue24;
                            bool conditionValue19 = sumValue23 > 0.5f;
                            intermediateValue[0u] = conditionValue19 ? scalarValue63 : scalarValue64;
                            intermediateValue[1u] = conditionValue19 ? scalarValue62 : scalarValue61;
                            float clampedValue25 = intermediateValue[uint(int(clamp((sumValue24 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))] - intermediateValue[uint(int(clamp((sumValue24 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f)))];
                            float inverseLengthValue15 = rsqrt(dot(float3(sumValue25, clampedValue25, 0.25f), float3(sumValue25, clampedValue25, 0.25f)));
                            float productValue67 = inverseLengthValue15 * multiplyAddValue2;
                            branchMergedValue12 = productValue67 * sumValue25;
                            branchMergedValue14 = productValue67 * clampedValue25;
                            branchMergedValue15 = inverseLengthValue15 * 0.25f;
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
                        uint unusedTextureMipCount818;
                        uint2 vectorValue16 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount818);
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue1)
                        {
                            float productValue68 = frac(float(int(uint(int(float(int(vectorValue16.x)))))) * multiplyAddValue);
                            float productValue69 = frac(float(int(uint(int(float(int(vectorValue16.y)))))) * multiplyAddValue1);
                            float comparisonValue61 = (((productValue68 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue8 * 2.0f) + (-1.0f))) - (((productValue68 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((sampledTextureValue2.w * 2.0f) + (-1.0f)));
                            float comparisonValue62 = (((productValue69 < 0.916666686534881591796875f) ? 0.0f : 1.0f) * ((scalarValue9 * 2.0f) + (-1.0f))) - (((productValue69 > 0.083333335816860198974609375f) ? 0.0f : 1.0f) * ((scalarValue7 * 2.0f) + (-1.0f)));
                            float comparisonValue63 = ((abs(comparisonValue61) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue61;
                            float comparisonValue64 = ((abs(comparisonValue62) < 0.004999999888241291046142578125f) ? 0.0f : 1.0f) * comparisonValue62;
                            float inverseLengthValue16 = rsqrt(dot(float3(comparisonValue63, comparisonValue64, 0.25f), float3(comparisonValue63, comparisonValue64, 0.25f)));
                            float productValue70 = inverseLengthValue16 * multiplyAddValue2;
                            branchMergedValue13 = productValue70 * comparisonValue63;
                            branchMergedValue16 = productValue70 * comparisonValue64;
                            branchMergedValue17 = inverseLengthValue16 * 0.25f;
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
                float multiplyAddValue4 = mad(comparisonValue1, loadedBufferValue12, loadedBufferValue14);
                float multiplyAddValue5 = clamp(mad(min(loadedBufferValue18 - loadedBufferValue17, loadedBufferValue18), -1.0f, 2.0f), 0.0f, 1.0f);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue5 > 0.0f)
                {
                    uint unusedTextureMipCount757;
                    uint2 vectorValue17 = rdTextureSize(matTextureTexture, 0u, unusedTextureMipCount757);
                    float productValue71 = float(int(uint(int(float(int(vectorValue17.x)))))) * multiplyAddValue3;
                    float productValue72 = float(int(uint(int(float(int(vectorValue17.y)))))) * multiplyAddValue4;
                    float scalarValue65 = frac(productValue71);
                    float scalarValue66 = frac(productValue72);
                    float comparisonValue14;
                    if (abs(scalarValue65 + (-0.5f)) < 0.0625f)
                    {
                        comparisonValue14 = ((scalarValue65 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue3;
                    }
                    else
                    {
                        comparisonValue14 = multiplyAddValue3;
                    }
                    float comparisonValue19;
                    if (abs(scalarValue66 + (-0.5f)) < 0.0625f)
                    {
                        comparisonValue19 = ((scalarValue66 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue4;
                    }
                    else
                    {
                        comparisonValue19 = multiplyAddValue4;
                    }
                    float4 vectorValue18 = matTextureTexture.GatherRed(matTextureSampler, float2(comparisonValue14, comparisonValue19));
                    float scalarValue67 = vectorValue18.x;
                    float scalarValue68 = vectorValue18.y;
                    float scalarValue69 = vectorValue18.z;
                    float scalarValue70 = vectorValue18.w;
                    float sumValue26 = frac(productValue71 + 0.5f);
                    float sumValue27 = frac(productValue72 + 0.5f);
                    bool conditionValue20 = sumValue27 > 0.5f;
                    float rdAccess_intermediateValue1(2);
                    rdAccess_intermediateValue1(0u) = conditionValue20 ? scalarValue67 : scalarValue70;
                    rdAccess_intermediateValue1(1u) = conditionValue20 ? scalarValue68 : scalarValue69;
                    float clampedValue26 = rdAccess_intermediateValue1(uint(int(clamp((sumValue26 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f))));
                    float clampedValue27 = rdAccess_intermediateValue1(uint(int(clamp((sumValue26 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f))));
                    float sumValue28 = clampedValue26 - clampedValue27;
                    bool conditionValue21 = sumValue26 > 0.5f;
                    rdAccess_intermediateValue1(0u) = conditionValue21 ? scalarValue69 : scalarValue70;
                    rdAccess_intermediateValue1(1u) = conditionValue21 ? scalarValue68 : scalarValue67;
                    float clampedValue28 = rdAccess_intermediateValue1(uint(int(clamp((sumValue27 + (-0.083333335816860198974609375f)) * 2.0f, 0.0f, 1.0f)))) - rdAccess_intermediateValue1(uint(int(clamp((sumValue27 + 0.083333335816860198974609375f) * 2.0f, 0.0f, 1.0f))));
                    float inverseLengthValue17 = rsqrt(dot(float3(sumValue28, clampedValue28, 0.25f), float3(sumValue28, clampedValue28, 0.25f)));
                    float productValue73 = inverseLengthValue17 * multiplyAddValue5;
                    branchMergedValue4 = productValue73 * sumValue28;
                    branchMergedValue7 = productValue73 * clampedValue28;
                    branchMergedValue8 = inverseLengthValue17 * 0.25f;
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
            intermediateValue21 = branchMergedValue;
            intermediateValue22 = branchMergedValue1;
            intermediateValue23 = branchMergedValue2;
#endif
        }
        else
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float loadedBufferValue24 = asfloat(rdLoad_intermediateValue1((comparisonValue32 * 16u) + 15u).x);
            float intermediateValue35;
            float intermediateValue36;
            float intermediateValue37;
            if ((reinterpretedBits2 & 8u) == 8u)
            {
                float clampedValue12 = clamp(2.0f - min(loadedBufferValue24, loadedBufferValue24 - scalarValue35), 0.0f, 1.0f);
                float productValue20;
                float productValue21;
                float productValue22;
                if (clampedValue12 > 0.0f)
                {
                    float multiplyAddValue22 = mad(comparisonValue30, scalarValue30, scalarValue32);
                    float multiplyAddValue23 = mad(comparisonValue31, scalarValue31, scalarValue33);
                    uint intermediateValue44;
                    rdTextureSize(materialTexture1, 0u, intermediateValue44);
                    bool conditionValue9 = intermediateValue44 > 0u;
                    uint unusedTextureMipCount730;
                    uint2 vectorValue5 = rdTextureSize(materialTexture1, 0u, unusedTextureMipCount730);
                    uint scalarValue36 = vectorValue5.x;
                    float comparisonValue34 = rdUnsignedToFloat2(conditionValue9 ? scalarValue36 : 0u);
                    float comparisonValue35 = rdUnsignedToFloat2(conditionValue9 ? vectorValue5.y : 0u);
                    float productValue50 = frac(multiplyAddValue22 * comparisonValue34);
                    float productValue51 = frac(multiplyAddValue23 * comparisonValue35);
                    float4 comparisonValue36 = materialTexture1.GatherRed(textureSampler1, float2((abs(productValue50 - 0.5f) < 0.0625f) ? (((productValue50 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue22) : multiplyAddValue22, (abs(productValue51 - 0.5f) < 0.0625f) ? (((productValue51 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue23) : multiplyAddValue23));
                    float scalarValue37 = comparisonValue36.x;
                    float scalarValue38 = comparisonValue36.y;
                    float scalarValue39 = comparisonValue36.z;
                    float scalarValue40 = comparisonValue36.w;
                    float multiplyAddValue24 = frac(mad(multiplyAddValue22, comparisonValue34, 0.5f));
                    float multiplyAddValue25 = frac(mad(multiplyAddValue23, comparisonValue35, 0.5f));
                    bool conditionValue10 = multiplyAddValue25 > 0.5f;
                    bool conditionValue11 = multiplyAddValue24 > 0.5f;
                    float comparisonValue37 = conditionValue10 ? scalarValue37 : scalarValue40;
                    float comparisonValue38 = conditionValue10 ? scalarValue38 : scalarValue39;
                    float comparisonValue39 = conditionValue11 ? scalarValue39 : scalarValue40;
                    float comparisonValue40 = conditionValue11 ? scalarValue38 : scalarValue37;
                    float sumValue13 = multiplyAddValue24 - 0.083333335816860198974609375f;
                    float sumValue14 = multiplyAddValue24 + 0.083333335816860198974609375f;
                    float sumValue15 = multiplyAddValue25 - 0.083333335816860198974609375f;
                    float sumValue16 = multiplyAddValue25 + 0.083333335816860198974609375f;
                    uint clampedValue13 = uint(int(clamp(sumValue13 + sumValue13, 0.0f, 1.0f)));
                    uint clampedValue14 = uint(int(clamp(sumValue14 + sumValue14, 0.0f, 1.0f)));
                    uint clampedValue15 = uint(int(clamp(sumValue15 + sumValue15, 0.0f, 1.0f)));
                    uint clampedValue16 = uint(int(clamp(sumValue16 + sumValue16, 0.0f, 1.0f)));
                    float comparisonValue41 = ((clampedValue13 == 1u) ? comparisonValue38 : ((clampedValue13 == 0u) ? comparisonValue37 : 0.0f)) - ((clampedValue14 == 1u) ? comparisonValue38 : ((clampedValue14 == 0u) ? comparisonValue37 : 0.0f));
                    float comparisonValue42 = ((clampedValue15 == 1u) ? comparisonValue40 : ((clampedValue15 == 0u) ? comparisonValue39 : 0.0f)) - ((clampedValue16 == 1u) ? comparisonValue40 : ((clampedValue16 == 0u) ? comparisonValue39 : 0.0f));
                    float3 vectorValue6 = float3(comparisonValue41, comparisonValue42, 0.25f);
                    float scalarValue41 = rdDot3Precise2(vectorValue6, vectorValue6);
                    float inverseLengthValue7 = rsqrt(scalarValue41);
                    productValue20 = clampedValue12 * (inverseLengthValue7 * comparisonValue42);
                    productValue21 = clampedValue12 * (inverseLengthValue7 * comparisonValue41);
                    productValue22 = inverseLengthValue7 * 0.25f;
                }
                else
                {
                    productValue20 = 0.0f;
                    productValue21 = 0.0f;
                    productValue22 = 1.0f;
                }
                intermediateValue35 = productValue20;
                intermediateValue36 = productValue21;
                intermediateValue37 = productValue22;
            }
            else
            {
                float intermediateValue59;
                float intermediateValue61;
                float intermediateValue63;
                if ((reinterpretedBits2 & 16u) == 16u)
                {
                    float multiplyAddValue26 = mad(comparisonValue30, scalarValue30, scalarValue32);
                    float multiplyAddValue27 = mad(comparisonValue31, scalarValue31, scalarValue33);
                    float sumValue17 = min(loadedBufferValue24, loadedBufferValue24 - scalarValue35);
                    float4 sampledTextureValue8 = materialTexture1.SampleLevel(textureSampler1, float2(multiplyAddValue26, multiplyAddValue27), 0.0f);
                    float scalarValue42 = sampledTextureValue8.x;
                    float scalarValue43 = sampledTextureValue8.y;
                    float scalarValue44 = sampledTextureValue8.z;
                    float intermediateValue60;
                    float intermediateValue62;
                    float intermediateValue64;
                    if ((scalarValue43 == scalarValue42) && (scalarValue44 == scalarValue43))
                    {
                        float scalarValue45 = clamp(2.0f - sumValue17, 0.0f, 1.0f);
                        float productValue27;
                        float productValue28;
                        float productValue29;
                        if (scalarValue45 > 0.0f)
                        {
                            uint intermediateValue72;
                            rdTextureSize(materialTexture1, 0u, intermediateValue72);
                            bool conditionValue12 = intermediateValue72 > 0u;
                            uint unusedTextureMipCount909;
                            uint2 vectorValue7 = rdTextureSize(materialTexture1, 0u, unusedTextureMipCount909);
                            uint scalarValue46 = vectorValue7.x;
                            float comparisonValue43 = rdUnsignedToFloat2(conditionValue12 ? scalarValue46 : 0u);
                            float comparisonValue44 = rdUnsignedToFloat2(conditionValue12 ? vectorValue7.y : 0u);
                            float productValue52 = frac(multiplyAddValue26 * comparisonValue43);
                            float productValue53 = frac(multiplyAddValue27 * comparisonValue44);
                            float4 comparisonValue45 = materialTexture1.GatherRed(textureSampler1, float2((abs(productValue52 - 0.5f) < 0.0625f) ? (multiplyAddValue26 + ((productValue52 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f))) : multiplyAddValue26, (abs(productValue53 - 0.5f) < 0.0625f) ? (multiplyAddValue27 + ((productValue53 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f))) : multiplyAddValue27));
                            float scalarValue47 = comparisonValue45.x;
                            float scalarValue48 = comparisonValue45.y;
                            float scalarValue49 = comparisonValue45.z;
                            float scalarValue50 = comparisonValue45.w;
                            float multiplyAddValue28 = frac(mad(multiplyAddValue26, comparisonValue43, 0.5f));
                            float multiplyAddValue29 = frac(mad(multiplyAddValue27, comparisonValue44, 0.5f));
                            bool conditionValue13 = multiplyAddValue29 > 0.5f;
                            bool conditionValue14 = multiplyAddValue28 > 0.5f;
                            float comparisonValue46 = conditionValue13 ? scalarValue47 : scalarValue50;
                            float comparisonValue47 = conditionValue13 ? scalarValue48 : scalarValue49;
                            float comparisonValue48 = conditionValue14 ? scalarValue49 : scalarValue50;
                            float comparisonValue49 = conditionValue14 ? scalarValue48 : scalarValue47;
                            float sumValue18 = multiplyAddValue28 - 0.083333335816860198974609375f;
                            float sumValue19 = multiplyAddValue28 + 0.083333335816860198974609375f;
                            float sumValue20 = multiplyAddValue29 - 0.083333335816860198974609375f;
                            float sumValue21 = multiplyAddValue29 + 0.083333335816860198974609375f;
                            uint clampedValue17 = uint(int(clamp(sumValue18 + sumValue18, 0.0f, 1.0f)));
                            uint clampedValue18 = uint(int(clamp(sumValue19 + sumValue19, 0.0f, 1.0f)));
                            uint clampedValue19 = uint(int(clamp(sumValue20 + sumValue20, 0.0f, 1.0f)));
                            uint clampedValue20 = uint(int(clamp(sumValue21 + sumValue21, 0.0f, 1.0f)));
                            float comparisonValue50 = ((clampedValue17 == 1u) ? comparisonValue47 : ((clampedValue17 == 0u) ? comparisonValue46 : 0.0f)) - ((clampedValue18 == 1u) ? comparisonValue47 : ((clampedValue18 == 0u) ? comparisonValue46 : 0.0f));
                            float comparisonValue51 = ((clampedValue19 == 1u) ? comparisonValue49 : ((clampedValue19 == 0u) ? comparisonValue48 : 0.0f)) - ((clampedValue20 == 1u) ? comparisonValue49 : ((clampedValue20 == 0u) ? comparisonValue48 : 0.0f));
                            float3 vectorValue8 = float3(comparisonValue50, comparisonValue51, 0.25f);
                            float scalarValue51 = rdDot3Precise2(vectorValue8, vectorValue8);
                            float inverseLengthValue8 = rsqrt(scalarValue51);
                            productValue27 = scalarValue45 * (inverseLengthValue8 * comparisonValue51);
                            productValue28 = scalarValue45 * (inverseLengthValue8 * comparisonValue50);
                            productValue29 = inverseLengthValue8 * 0.25f;
                        }
                        else
                        {
                            productValue27 = 0.0f;
                            productValue28 = 0.0f;
                            productValue29 = 1.0f;
                        }
                        intermediateValue60 = productValue27;
                        intermediateValue62 = productValue28;
                        intermediateValue64 = productValue29;
                    }
                    else
                    {
                        uint intermediateValue66;
                        rdTextureSize(materialTexture1, 0u, intermediateValue66);
                        bool conditionValue15 = intermediateValue66 > 0u;
                        uint unusedTextureMipCount854;
                        uint2 vectorValue9 = rdTextureSize(materialTexture1, 0u, unusedTextureMipCount854);
                        uint scalarValue52 = vectorValue9.x;
                        float comparisonValue52 = rdUnsignedToFloat2(conditionValue15 ? scalarValue52 : 0u);
                        float comparisonValue53 = rdUnsignedToFloat2(conditionValue15 ? vectorValue9.y : 0u);
                        float clampedValue21 = clamp(2.0f - sumValue17, 0.0f, 1.0f);
                        bool conditionValue16 = clampedValue21 > 0.0f;
                        float productValue54 = frac(multiplyAddValue26 * comparisonValue52);
                        float productValue55 = frac(multiplyAddValue27 * comparisonValue53);
                        float multiplyAddValue30 = (productValue54 <= 0.083333335816860198974609375f) ? (-mad(sampledTextureValue8.w, 2.0f, -1.0f)) : 0.0f;
                        float multiplyAddValue31 = (productValue55 <= 0.083333335816860198974609375f) ? (-mad(scalarValue42, 2.0f, -1.0f)) : 0.0f;
                        float multiplyAddValue32 = (productValue54 >= 0.916666686534881591796875f) ? (mad(scalarValue43, 2.0f, -1.0f) + multiplyAddValue30) : multiplyAddValue30;
                        float multiplyAddValue33 = (productValue55 >= 0.916666686534881591796875f) ? (mad(scalarValue44, 2.0f, -1.0f) + multiplyAddValue31) : multiplyAddValue31;
                        bool comparisonValue54 = abs(multiplyAddValue32) >= 0.004999999888241291046142578125f;
                        bool comparisonValue55 = abs(multiplyAddValue33) >= 0.004999999888241291046142578125f;
                        float3 comparisonValue56 = float3(comparisonValue54 ? multiplyAddValue32 : 0.0f, comparisonValue55 ? multiplyAddValue33 : 0.0f, 0.25f);
                        float scalarValue53 = rdDot3Precise2(comparisonValue56, comparisonValue56);
                        float inverseLengthValue9 = rsqrt(scalarValue53);
                        intermediateValue60 = (conditionValue16 && comparisonValue55) ? (clampedValue21 * (inverseLengthValue9 * multiplyAddValue33)) : 0.0f;
                        intermediateValue62 = (conditionValue16 && comparisonValue54) ? (clampedValue21 * (inverseLengthValue9 * multiplyAddValue32)) : 0.0f;
                        intermediateValue64 = conditionValue16 ? (inverseLengthValue9 * 0.25f) : 1.0f;
                    }
                    intermediateValue59 = intermediateValue60;
                    intermediateValue61 = intermediateValue62;
                    intermediateValue63 = intermediateValue64;
                }
                else
                {
                    intermediateValue59 = 0.0f;
                    intermediateValue61 = 0.0f;
                    intermediateValue63 = 1.0f;
                }
                intermediateValue35 = intermediateValue59;
                intermediateValue36 = intermediateValue61;
                intermediateValue37 = intermediateValue63;
            }
            multiplyAddValue13 = intermediateValue35;
            multiplyAddValue14 = intermediateValue36;
            multiplyAddValue15 = intermediateValue37;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float loadedBufferValue24 = asfloat(rdLoad_intermediateValue1((comparisonValue32 * 16u) + 15u).x);
            float intermediateValue39;
            float intermediateValue40;
            float intermediateValue41;
            if ((reinterpretedBits2 & 8u) == 8u)
            {
                float clampedValue12 = clamp(2.0f - min(loadedBufferValue24, loadedBufferValue24 - scalarValue35), 0.0f, 1.0f);
                float productValue22;
                float productValue23;
                float productValue24;
                if (clampedValue12 > 0.0f)
                {
                    float multiplyAddValue22 = mad(comparisonValue30, scalarValue30, scalarValue32);
                    float multiplyAddValue23 = mad(comparisonValue31, scalarValue31, scalarValue33);
                    uint intermediateValue48;
                    rdTextureSize(materialTexture1, 0u, intermediateValue48);
                    bool conditionValue23 = intermediateValue48 > 0u;
                    uint unusedTextureMipCount886;
                    uint2 vectorValue20 = rdTextureSize(materialTexture1, 0u, unusedTextureMipCount886);
                    uint scalarValue74 = vectorValue20.x;
                    float comparisonValue69 = rdUnsignedToFloat2(conditionValue23 ? scalarValue74 : 0u);
                    float comparisonValue70 = rdUnsignedToFloat2(conditionValue23 ? vectorValue20.y : 0u);
                    float productValue82 = frac(multiplyAddValue22 * comparisonValue69);
                    float productValue83 = frac(multiplyAddValue23 * comparisonValue70);
                    float4 comparisonValue71 = materialTexture1.GatherRed(textureSampler1, float2((abs(productValue82 - 0.5f) < 0.0625f) ? (((productValue82 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue22) : multiplyAddValue22, (abs(productValue83 - 0.5f) < 0.0625f) ? (((productValue83 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f)) + multiplyAddValue23) : multiplyAddValue23));
                    float scalarValue75 = comparisonValue71.x;
                    float scalarValue76 = comparisonValue71.y;
                    float scalarValue77 = comparisonValue71.z;
                    float scalarValue78 = comparisonValue71.w;
                    float multiplyAddValue40 = frac(mad(multiplyAddValue22, comparisonValue69, 0.5f));
                    float multiplyAddValue41 = frac(mad(multiplyAddValue23, comparisonValue70, 0.5f));
                    bool conditionValue24 = multiplyAddValue41 > 0.5f;
                    bool conditionValue25 = multiplyAddValue40 > 0.5f;
                    float comparisonValue72 = conditionValue24 ? scalarValue75 : scalarValue78;
                    float comparisonValue73 = conditionValue24 ? scalarValue76 : scalarValue77;
                    float comparisonValue74 = conditionValue25 ? scalarValue77 : scalarValue78;
                    float comparisonValue75 = conditionValue25 ? scalarValue76 : scalarValue75;
                    float sumValue29 = multiplyAddValue40 - 0.083333335816860198974609375f;
                    float sumValue30 = multiplyAddValue40 + 0.083333335816860198974609375f;
                    float sumValue31 = multiplyAddValue41 - 0.083333335816860198974609375f;
                    float sumValue32 = multiplyAddValue41 + 0.083333335816860198974609375f;
                    uint clampedValue31 = uint(int(clamp(sumValue29 + sumValue29, 0.0f, 1.0f)));
                    uint clampedValue32 = uint(int(clamp(sumValue30 + sumValue30, 0.0f, 1.0f)));
                    uint clampedValue33 = uint(int(clamp(sumValue31 + sumValue31, 0.0f, 1.0f)));
                    uint clampedValue34 = uint(int(clamp(sumValue32 + sumValue32, 0.0f, 1.0f)));
                    float comparisonValue76 = ((clampedValue31 == 1u) ? comparisonValue73 : ((clampedValue31 == 0u) ? comparisonValue72 : 0.0f)) - ((clampedValue32 == 1u) ? comparisonValue73 : ((clampedValue32 == 0u) ? comparisonValue72 : 0.0f));
                    float comparisonValue77 = ((clampedValue33 == 1u) ? comparisonValue75 : ((clampedValue33 == 0u) ? comparisonValue74 : 0.0f)) - ((clampedValue34 == 1u) ? comparisonValue75 : ((clampedValue34 == 0u) ? comparisonValue74 : 0.0f));
                    float3 vectorValue21 = float3(comparisonValue76, comparisonValue77, 0.25f);
                    float scalarValue79 = rdDot3Precise2(vectorValue21, vectorValue21);
                    float inverseLengthValue21 = rsqrt(scalarValue79);
                    productValue22 = clampedValue12 * (inverseLengthValue21 * comparisonValue77);
                    productValue23 = clampedValue12 * (inverseLengthValue21 * comparisonValue76);
                    productValue24 = inverseLengthValue21 * 0.25f;
                }
                else
                {
                    productValue22 = 0.0f;
                    productValue23 = 0.0f;
                    productValue24 = 1.0f;
                }
                intermediateValue39 = productValue22;
                intermediateValue40 = productValue23;
                intermediateValue41 = productValue24;
            }
            else
            {
                float intermediateValue63;
                float intermediateValue65;
                float intermediateValue67;
                if ((reinterpretedBits2 & 16u) == 16u)
                {
                    float multiplyAddValue26 = mad(comparisonValue30, scalarValue30, scalarValue32);
                    float multiplyAddValue27 = mad(comparisonValue31, scalarValue31, scalarValue33);
                    float sumValue17 = min(loadedBufferValue24, loadedBufferValue24 - scalarValue35);
                    float4 sampledTextureValue8 = materialTexture1.SampleLevel(textureSampler1, float2(multiplyAddValue26, multiplyAddValue27), 0.0f);
                    float scalarValue42 = sampledTextureValue8.x;
                    float scalarValue43 = sampledTextureValue8.y;
                    float scalarValue44 = sampledTextureValue8.z;
                    float intermediateValue64;
                    float intermediateValue66;
                    float intermediateValue68;
                    if ((scalarValue43 == scalarValue42) && (scalarValue44 == scalarValue43))
                    {
                        float scalarValue45 = clamp(2.0f - sumValue17, 0.0f, 1.0f);
                        float productValue29;
                        float productValue30;
                        float productValue31;
                        if (scalarValue45 > 0.0f)
                        {
                            uint intermediateValue76;
                            rdTextureSize(materialTexture1, 0u, intermediateValue76);
                            bool conditionValue26 = intermediateValue76 > 0u;
                            uint unusedTextureMipCount1064;
                            uint2 vectorValue22 = rdTextureSize(materialTexture1, 0u, unusedTextureMipCount1064);
                            uint scalarValue80 = vectorValue22.x;
                            float comparisonValue78 = rdUnsignedToFloat2(conditionValue26 ? scalarValue80 : 0u);
                            float comparisonValue79 = rdUnsignedToFloat2(conditionValue26 ? vectorValue22.y : 0u);
                            float productValue84 = frac(multiplyAddValue26 * comparisonValue78);
                            float productValue85 = frac(multiplyAddValue27 * comparisonValue79);
                            float4 comparisonValue80 = materialTexture1.GatherRed(textureSampler1, float2((abs(productValue84 - 0.5f) < 0.0625f) ? (multiplyAddValue26 + ((productValue84 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f))) : multiplyAddValue26, (abs(productValue85 - 0.5f) < 0.0625f) ? (multiplyAddValue27 + ((productValue85 > 0.5f) ? 3.814697265625e-06f : (-3.814697265625e-06f))) : multiplyAddValue27));
                            float scalarValue81 = comparisonValue80.x;
                            float scalarValue82 = comparisonValue80.y;
                            float scalarValue83 = comparisonValue80.z;
                            float scalarValue84 = comparisonValue80.w;
                            float multiplyAddValue42 = frac(mad(multiplyAddValue26, comparisonValue78, 0.5f));
                            float multiplyAddValue43 = frac(mad(multiplyAddValue27, comparisonValue79, 0.5f));
                            bool conditionValue27 = multiplyAddValue43 > 0.5f;
                            bool conditionValue28 = multiplyAddValue42 > 0.5f;
                            float comparisonValue81 = conditionValue27 ? scalarValue81 : scalarValue84;
                            float comparisonValue82 = conditionValue27 ? scalarValue82 : scalarValue83;
                            float comparisonValue83 = conditionValue28 ? scalarValue83 : scalarValue84;
                            float comparisonValue84 = conditionValue28 ? scalarValue82 : scalarValue81;
                            float sumValue33 = multiplyAddValue42 - 0.083333335816860198974609375f;
                            float sumValue34 = multiplyAddValue42 + 0.083333335816860198974609375f;
                            float sumValue35 = multiplyAddValue43 - 0.083333335816860198974609375f;
                            float sumValue36 = multiplyAddValue43 + 0.083333335816860198974609375f;
                            uint clampedValue35 = uint(int(clamp(sumValue33 + sumValue33, 0.0f, 1.0f)));
                            uint clampedValue36 = uint(int(clamp(sumValue34 + sumValue34, 0.0f, 1.0f)));
                            uint clampedValue37 = uint(int(clamp(sumValue35 + sumValue35, 0.0f, 1.0f)));
                            uint clampedValue38 = uint(int(clamp(sumValue36 + sumValue36, 0.0f, 1.0f)));
                            float comparisonValue85 = ((clampedValue35 == 1u) ? comparisonValue82 : ((clampedValue35 == 0u) ? comparisonValue81 : 0.0f)) - ((clampedValue36 == 1u) ? comparisonValue82 : ((clampedValue36 == 0u) ? comparisonValue81 : 0.0f));
                            float comparisonValue86 = ((clampedValue37 == 1u) ? comparisonValue84 : ((clampedValue37 == 0u) ? comparisonValue83 : 0.0f)) - ((clampedValue38 == 1u) ? comparisonValue84 : ((clampedValue38 == 0u) ? comparisonValue83 : 0.0f));
                            float3 vectorValue23 = float3(comparisonValue85, comparisonValue86, 0.25f);
                            float scalarValue85 = rdDot3Precise2(vectorValue23, vectorValue23);
                            float inverseLengthValue22 = rsqrt(scalarValue85);
                            productValue29 = scalarValue45 * (inverseLengthValue22 * comparisonValue86);
                            productValue30 = scalarValue45 * (inverseLengthValue22 * comparisonValue85);
                            productValue31 = inverseLengthValue22 * 0.25f;
                        }
                        else
                        {
                            productValue29 = 0.0f;
                            productValue30 = 0.0f;
                            productValue31 = 1.0f;
                        }
                        intermediateValue64 = productValue29;
                        intermediateValue66 = productValue30;
                        intermediateValue68 = productValue31;
                    }
                    else
                    {
                        uint intermediateValue70;
                        rdTextureSize(materialTexture1, 0u, intermediateValue70);
                        bool conditionValue29 = intermediateValue70 > 0u;
                        uint unusedTextureMipCount1009;
                        uint2 vectorValue24 = rdTextureSize(materialTexture1, 0u, unusedTextureMipCount1009);
                        uint scalarValue86 = vectorValue24.x;
                        float comparisonValue87 = rdUnsignedToFloat2(conditionValue29 ? scalarValue86 : 0u);
                        float comparisonValue88 = rdUnsignedToFloat2(conditionValue29 ? vectorValue24.y : 0u);
                        float clampedValue21 = clamp(2.0f - sumValue17, 0.0f, 1.0f);
                        bool conditionValue16 = clampedValue21 > 0.0f;
                        float productValue86 = frac(multiplyAddValue26 * comparisonValue87);
                        float productValue87 = frac(multiplyAddValue27 * comparisonValue88);
                        float multiplyAddValue44 = (productValue86 <= 0.083333335816860198974609375f) ? (-mad(sampledTextureValue8.w, 2.0f, -1.0f)) : 0.0f;
                        float multiplyAddValue45 = (productValue87 <= 0.083333335816860198974609375f) ? (-mad(scalarValue42, 2.0f, -1.0f)) : 0.0f;
                        float multiplyAddValue46 = (productValue86 >= 0.916666686534881591796875f) ? (mad(scalarValue43, 2.0f, -1.0f) + multiplyAddValue44) : multiplyAddValue44;
                        float multiplyAddValue47 = (productValue87 >= 0.916666686534881591796875f) ? (mad(scalarValue44, 2.0f, -1.0f) + multiplyAddValue45) : multiplyAddValue45;
                        bool comparisonValue89 = abs(multiplyAddValue46) >= 0.004999999888241291046142578125f;
                        bool comparisonValue90 = abs(multiplyAddValue47) >= 0.004999999888241291046142578125f;
                        float3 comparisonValue91 = float3(comparisonValue89 ? multiplyAddValue46 : 0.0f, comparisonValue90 ? multiplyAddValue47 : 0.0f, 0.25f);
                        float scalarValue87 = rdDot3Precise2(comparisonValue91, comparisonValue91);
                        float inverseLengthValue23 = rsqrt(scalarValue87);
                        intermediateValue64 = (conditionValue16 && comparisonValue90) ? (clampedValue21 * (inverseLengthValue23 * multiplyAddValue47)) : 0.0f;
                        intermediateValue66 = (conditionValue16 && comparisonValue89) ? (clampedValue21 * (inverseLengthValue23 * multiplyAddValue46)) : 0.0f;
                        intermediateValue68 = conditionValue16 ? (inverseLengthValue23 * 0.25f) : 1.0f;
                    }
                    intermediateValue63 = intermediateValue64;
                    intermediateValue65 = intermediateValue66;
                    intermediateValue67 = intermediateValue68;
                }
                else
                {
                    intermediateValue63 = 0.0f;
                    intermediateValue65 = 0.0f;
                    intermediateValue67 = 1.0f;
                }
                intermediateValue39 = intermediateValue63;
                intermediateValue40 = intermediateValue65;
                intermediateValue41 = intermediateValue67;
            }
            multiplyAddValue14 = intermediateValue39;
            multiplyAddValue15 = intermediateValue40;
            multiplyAddValue16 = intermediateValue41;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float4 sampledTextureValue3 = matTextureTexture.Sample(matTextureSampler, float2(mad(comparisonValue2, loadedBufferValue11, loadedBufferValue13), mad(comparisonValue1, loadedBufferValue12, loadedBufferValue14)));
            intermediateValue20 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue21 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue22 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float4 sampledTextureValue3 = matTextureTexture.Sample(matTextureSampler, float2(mad(comparisonValue2, loadedBufferValue11, loadedBufferValue13), mad(comparisonValue1, loadedBufferValue12, loadedBufferValue14)));
            intermediateValue21 = (sampledTextureValue3.x * 2.0f) + (-1.0f);
            intermediateValue22 = (sampledTextureValue3.y * 2.0f) + (-1.0f);
            intermediateValue23 = (sampledTextureValue3.z * 2.0f) + (-1.0f);
#endif
        }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue26;
        float intermediateValue28;
        float intermediateValue30;
        float comparisonValue10;
        if ((reinterpretedBits2 & 1u) == 1u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue30;
        float intermediateValue32;
        float intermediateValue34;
        float comparisonValue10;
        if ((reinterpretedBits2 & 1u) == 1u)
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float loadedBufferValue8;
        float loadedBufferValue9;
        float loadedBufferValue10;
        float intermediateValue14;
        if ((scalarValue6 & 1u) == 0u)
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float loadedBufferValue8;
        float loadedBufferValue9;
        float loadedBufferValue10;
        float intermediateValue15;
        if ((scalarValue6 & 1u) == 0u)
#endif
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            uint productValue56 = comparisonValue32 * 16u;
            float4 loadedBufferValue25 = asfloat(uint4(rdLoad_intermediateValue1(productValue56).x, rdLoad_intermediateValue1(productValue56 + 1u).x, rdLoad_intermediateValue1(productValue56 + 2u).x, rdLoad_intermediateValue1(productValue56 + 3u).x));
            float4 sampledTextureValue9 = materialTexture1.Sample(textureSampler1, float2(mad(comparisonValue30, loadedBufferValue25.x, loadedBufferValue25.z), mad(comparisonValue31, loadedBufferValue25.y, loadedBufferValue25.w)));
            comparisonValue10 = ((reinterpretedBits2 & 2u) == 2u) ? sampledTextureValue9.w : scalarValue34;
            intermediateValue30 = sampledTextureValue9.x;
            intermediateValue28 = sampledTextureValue9.z;
            intermediateValue26 = sampledTextureValue9.y;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            uint productValue56 = comparisonValue32 * 16u;
            float4 loadedBufferValue25 = asfloat(uint4(rdLoad_intermediateValue1(productValue56).x, rdLoad_intermediateValue1(productValue56 + 1u).x, rdLoad_intermediateValue1(productValue56 + 2u).x, rdLoad_intermediateValue1(productValue56 + 3u).x));
            float4 sampledTextureValue9 = materialTexture1.Sample(textureSampler1, float2(mad(comparisonValue30, loadedBufferValue25.x, loadedBufferValue25.z), mad(comparisonValue31, loadedBufferValue25.y, loadedBufferValue25.w)));
            comparisonValue10 = ((reinterpretedBits2 & 2u) == 2u) ? sampledTextureValue9.w : scalarValue34;
            intermediateValue34 = sampledTextureValue9.x;
            intermediateValue32 = sampledTextureValue9.z;
            intermediateValue30 = sampledTextureValue9.y;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            loadedBufferValue10 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 10u).x);
            loadedBufferValue8 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 11u).x);
            loadedBufferValue9 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 9u).x);
            intermediateValue14 = loadedBufferValue16;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            loadedBufferValue10 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 10u).x);
            loadedBufferValue8 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 11u).x);
            loadedBufferValue9 = asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 9u).x);
            intermediateValue15 = loadedBufferValue16;
#endif
        }
        else
        {
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue10 = scalarValue34;
            intermediateValue30 = loadedBufferValue22.w;
            intermediateValue28 = loadedBufferValue22.y;
            intermediateValue26 = loadedBufferValue22.z;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue10 = scalarValue34;
            intermediateValue34 = loadedBufferValue22.w;
            intermediateValue32 = loadedBufferValue22.y;
            intermediateValue30 = loadedBufferValue22.z;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float4 sampledTextureValue4 = matTextureTexture.Sample(matTextureSampler, float2(mad(comparisonValue2, asfloat(rdLoad_pbrData(comparisonValue3 * 16u).x), asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 2u).x)), mad(comparisonValue1, asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 1u).x), asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 3u).x))));
            loadedBufferValue10 = sampledTextureValue4.y;
            loadedBufferValue8 = sampledTextureValue4.x;
            loadedBufferValue9 = sampledTextureValue4.z;
            intermediateValue14 = ((scalarValue6 & 2u) != 0u) ? sampledTextureValue4.w : loadedBufferValue16;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float4 sampledTextureValue4 = matTextureTexture.Sample(matTextureSampler, float2(mad(comparisonValue2, asfloat(rdLoad_pbrData(comparisonValue3 * 16u).x), asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 2u).x)), mad(comparisonValue1, asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 1u).x), asfloat(rdLoad_pbrData((comparisonValue3 * 16u) + 3u).x))));
            loadedBufferValue10 = sampledTextureValue4.y;
            loadedBufferValue8 = sampledTextureValue4.x;
            loadedBufferValue9 = sampledTextureValue4.z;
            intermediateValue15 = ((scalarValue6 & 2u) != 0u) ? sampledTextureValue4.w : loadedBufferValue16;
#endif
        }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue57 = varyingSv_Isfrontface0 ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue58 = varyingSv_Isfrontface0 ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue59 = varyingSv_Isfrontface0 ? (-varyingNormal0.z) : varyingNormal0.z;
        float3 vectorValue10 = float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue54 = rdDot3Precise2(vectorValue10, vectorValue10);
        float inverseLengthValue10 = rsqrt(scalarValue54);
        float3 vectorValue11 = float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue55 = rdDot3Precise2(vectorValue11, vectorValue11);
        float inverseLengthValue11 = rsqrt(scalarValue55);
        float3 vectorValue12 = float3(comparisonValue57, comparisonValue58, comparisonValue59);
        float scalarValue56 = rdDot3Precise2(vectorValue12, vectorValue12);
        float inverseLengthValue12 = rsqrt(scalarValue56);
        intermediateValue25 = intermediateValue26;
        intermediateValue27 = intermediateValue28;
        multiplyAddValue6 = mad(inverseLengthValue12 * comparisonValue59, multiplyAddValue15, mad(inverseLengthValue10 * varyingTangent0.z, multiplyAddValue14, multiplyAddValue13 * (inverseLengthValue11 * varyingBitangent0.z)));
        multiplyAddValue7 = mad(inverseLengthValue12 * comparisonValue58, multiplyAddValue15, mad(inverseLengthValue10 * varyingTangent0.y, multiplyAddValue14, multiplyAddValue13 * (inverseLengthValue11 * varyingBitangent0.y)));
        multiplyAddValue8 = mad(inverseLengthValue12 * comparisonValue57, multiplyAddValue15, mad(inverseLengthValue10 * varyingTangent0.x, multiplyAddValue14, multiplyAddValue13 * (inverseLengthValue11 * varyingBitangent0.x)));
        intermediateValue29 = intermediateValue30;
        intermediateValue31 = comparisonValue10;
    }
    else
    {
        intermediateValue25 = 0.0f;
        intermediateValue27 = 1.0f;
        multiplyAddValue6 = 0.0f;
        multiplyAddValue7 = 1.0f;
        multiplyAddValue8 = 0.0f;
        intermediateValue29 = 0.0f;
        intermediateValue31 = 0.0f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue57 = varyingSv_Isfrontface0 ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue58 = varyingSv_Isfrontface0 ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue59 = varyingSv_Isfrontface0 ? (-varyingNormal0.z) : varyingNormal0.z;
        float3 vectorValue10 = float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue54 = rdDot3Precise2(vectorValue10, vectorValue10);
        float inverseLengthValue10 = rsqrt(scalarValue54);
        float3 vectorValue11 = float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue55 = rdDot3Precise2(vectorValue11, vectorValue11);
        float inverseLengthValue11 = rsqrt(scalarValue55);
        float3 vectorValue12 = float3(comparisonValue57, comparisonValue58, comparisonValue59);
        float scalarValue56 = rdDot3Precise2(vectorValue12, vectorValue12);
        float inverseLengthValue12 = rsqrt(scalarValue56);
        intermediateValue29 = intermediateValue30;
        intermediateValue31 = intermediateValue32;
        multiplyAddValue7 = mad(inverseLengthValue12 * comparisonValue59, multiplyAddValue16, mad(inverseLengthValue10 * varyingTangent0.z, multiplyAddValue15, multiplyAddValue14 * (inverseLengthValue11 * varyingBitangent0.z)));
        multiplyAddValue8 = mad(inverseLengthValue12 * comparisonValue58, multiplyAddValue16, mad(inverseLengthValue10 * varyingTangent0.y, multiplyAddValue15, multiplyAddValue14 * (inverseLengthValue11 * varyingBitangent0.y)));
        multiplyAddValue9 = mad(inverseLengthValue12 * comparisonValue57, multiplyAddValue16, mad(inverseLengthValue10 * varyingTangent0.x, multiplyAddValue15, multiplyAddValue14 * (inverseLengthValue11 * varyingBitangent0.x)));
        intermediateValue33 = intermediateValue34;
        intermediateValue35 = comparisonValue10;
    }
    else
    {
        intermediateValue29 = 0.0f;
        intermediateValue31 = 1.0f;
        multiplyAddValue7 = 0.0f;
        multiplyAddValue8 = 1.0f;
        multiplyAddValue9 = 0.0f;
        intermediateValue33 = 0.0f;
        intermediateValue35 = 0.0f;
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue17 = comparisonValue ? ((-0.0f) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue22 = comparisonValue ? ((-0.0f) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue23 = comparisonValue ? ((-0.0f) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue17, comparisonValue22, comparisonValue23), float3(comparisonValue17, comparisonValue22, comparisonValue23)));
        float inverseLengthValue4 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue5 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue20;
        intermediateValue10 = loadedBufferValue8;
        intermediateValue11 = loadedBufferValue9;
        intermediateValue12 = loadedBufferValue10;
        intermediateValue13 = intermediateValue14;
        intermediateValue15 = mad(inverseLengthValue3 * comparisonValue17, intermediateValue22, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue21, inverseLengthValue5 * varyingTangent0.x));
        intermediateValue16 = mad(inverseLengthValue3 * comparisonValue22, intermediateValue22, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue21, inverseLengthValue5 * varyingTangent0.y));
        intermediateValue17 = mad(inverseLengthValue3 * comparisonValue23, intermediateValue22, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue21, inverseLengthValue5 * varyingTangent0.z));
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue17 = comparisonValue ? ((-0.0f) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue22 = comparisonValue ? ((-0.0f) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue23 = comparisonValue ? ((-0.0f) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue17, comparisonValue22, comparisonValue23), float3(comparisonValue17, comparisonValue22, comparisonValue23)));
        float inverseLengthValue4 = rsqrt(dot(float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), float3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue18 = rsqrt(dot(float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), float3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue21;
        intermediateValue11 = loadedBufferValue8;
        intermediateValue12 = loadedBufferValue9;
        intermediateValue13 = loadedBufferValue10;
        intermediateValue14 = intermediateValue15;
        intermediateValue16 = mad(inverseLengthValue3 * comparisonValue17, intermediateValue23, mad(inverseLengthValue4 * varyingBitangent0.x, intermediateValue22, inverseLengthValue18 * varyingTangent0.x));
        intermediateValue17 = mad(inverseLengthValue3 * comparisonValue22, intermediateValue23, mad(inverseLengthValue4 * varyingBitangent0.y, intermediateValue22, inverseLengthValue18 * varyingTangent0.y));
        intermediateValue18 = mad(inverseLengthValue3 * comparisonValue23, intermediateValue23, mad(inverseLengthValue4 * varyingBitangent0.z, intermediateValue22, inverseLengthValue18 * varyingTangent0.z));
#endif
    }
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue6 = varyingTexCoord3.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue7 = varyingTexCoord3.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue8 = varyingTexCoord3.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    fragmentColor1.w = (intermediateValue31 < intermediateValue29) ? mad(intermediateValue29, 0.4980392158031463623046875f, 0.501960813999176025390625f) : mad(-intermediateValue31, 0.4980392158031463623046875f, 0.4980392158031463623046875f);
    float3 vectorValue13 = float3(multiplyAddValue8, multiplyAddValue7, multiplyAddValue6);
    float scalarValue57 = rdDot3Precise2(vectorValue13, vectorValue13);
    float inverseLengthValue13 = rsqrt(scalarValue57);
    float productValue57 = inverseLengthValue13 * multiplyAddValue8;
    float productValue58 = inverseLengthValue13 * multiplyAddValue7;
    float productValue59 = inverseLengthValue13 * multiplyAddValue6;
    float quotientValue3 = 1.0f / (abs(productValue59) + (abs(productValue58) + abs(productValue57)));
    float productValue60 = quotientValue3 * productValue57;
    float productValue61 = quotientValue3 * productValue58;
    bool conditionValue17 = productValue59 < 0.0f;
    float sumValue22 = 2.0f - 1.0f;
    fragmentColor2.x = conditionValue17 ? ((1.0f - abs(productValue61)) * ((productValue60 >= 0.0f) ? sumValue22 : (-1.0f))) : productValue60;
    fragmentColor2.y = conditionValue17 ? ((1.0f - abs(productValue60)) * ((productValue61 >= 0.0f) ? sumValue22 : (-1.0f))) : productValue61;
    float multiplyAddValue34 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue35 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w, sumValue6, sumValue7 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    fragmentColor2.z = mad((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue34, 0.5f, 0.5f) - mad((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x, sumValue6, sumValue7 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue35, 0.5f, 0.5f);
    fragmentColor2.w = mad((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y, varyingTexCoord3.x, varyingTexCoord3.y * RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue34, 0.5f, 0.5f) - mad((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y, sumValue6, sumValue7 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue35, 0.5f, 0.5f);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05f) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05f);
    float productValue39 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue60 = (bitwiseValue ? min(productValue39, 1.0f) : varyingTexCoord5.x) * 0.16666667163372039794921875f;
    float multiplyAddValue36 = (bitwiseValue ? min(mad(mad(productValue39, 0.60000002384185791015625f, 0.4000000059604644775390625f), 0.60000002384185791015625f, 0.4000000059604644775390625f) * productValue39, 1.0f) : varyingTexCoord5.y) * 0.16666667163372039794921875f;
    float multiplyAddValue37 = (bitwiseValue ? min(mad(productValue39 * productValue39, 0.60000002384185791015625f, 0.4000000059604644775390625f) * productValue39, 1.0f) : varyingTexCoord5.z) * 0.16666667163372039794921875f;
    float productValue62 = ceil(min(max(max(multiplyAddValue36, 0.0039215688593685626983642578125f), max(multiplyAddValue37, comparisonValue60)), 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.y = uint(clamp(multiplyAddValue36 / productValue62, 0.0f, 1.0f) * 255.0f) + (uint(clamp(comparisonValue60 / productValue62, 0.0f, 1.0f) * 255.0f) * 256u);
    fragmentColor0.z = (uint(clamp(multiplyAddValue37 / productValue62, 0.0f, 1.0f) * 255.0f) * 256u) + uint(clamp(productValue62, 0.0f, 1.0f) * 255.0f);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint4 reinterpretedBits11 = asuint(RD_UNIFORM_PREV_WORLD_POS_OFFSET);
    float reinterpretedBits12 = varyingTexCoord3.x - asfloat(reinterpretedBits11.x);
    float reinterpretedBits13 = varyingTexCoord3.y - asfloat(reinterpretedBits11.y);
    float reinterpretedBits14 = varyingTexCoord3.z - asfloat(reinterpretedBits11.z);
    fragmentColor1.w = (intermediateValue35 < intermediateValue33) ? mad(intermediateValue33, 0.4980392158031463623046875f, 0.501960813999176025390625f) : mad(-intermediateValue35, 0.4980392158031463623046875f, 0.4980392158031463623046875f);
    float3 vectorValue25 = float3(multiplyAddValue9, multiplyAddValue8, multiplyAddValue7);
    float scalarValue88 = rdDot3Precise2(vectorValue25, vectorValue25);
    float inverseLengthValue24 = rsqrt(scalarValue88);
    float productValue88 = inverseLengthValue24 * multiplyAddValue9;
    float productValue89 = inverseLengthValue24 * multiplyAddValue8;
    float productValue90 = inverseLengthValue24 * multiplyAddValue7;
    float quotientValue9 = 1.0f / (abs(productValue90) + (abs(productValue89) + abs(productValue88)));
    float productValue91 = quotientValue9 * productValue88;
    float productValue92 = quotientValue9 * productValue89;
    bool conditionValue30 = productValue90 < 0.0f;
    float sumValue22 = 2.0f - 1.0f;
    fragmentColor2.x = conditionValue30 ? ((1.0f - abs(productValue92)) * ((productValue91 >= 0.0f) ? sumValue22 : (-1.0f))) : productValue91;
    fragmentColor2.y = conditionValue30 ? ((1.0f - abs(productValue91)) * ((productValue92 >= 0.0f) ? sumValue22 : (-1.0f))) : productValue92;
    uint4 reinterpretedBits15 = asuint(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1);
    uint4 reinterpretedBits16 = asuint(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0);
    uint4 reinterpretedBits17 = asuint(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2);
    uint4 reinterpretedBits18 = asuint(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3);
    float multiplyAddValue48 = mad(asfloat(asuint(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w)), varyingTexCoord3.z, mad(asfloat(asuint(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w)), varyingTexCoord3.x, varyingTexCoord3.y * asfloat(asuint(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w)))) + asfloat(asuint(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w));
    uint4 reinterpretedBits19 = asuint(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1);
    uint4 reinterpretedBits20 = asuint(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0);
    uint4 reinterpretedBits21 = asuint(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2);
    uint4 reinterpretedBits22 = asuint(RD_UNIFORM_PREV_VIEW_PROJ_ROW_3);
    float multiplyAddValue49 = mad(asfloat(asuint(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w)), reinterpretedBits14, mad(asfloat(asuint(RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)), reinterpretedBits12, reinterpretedBits13 * asfloat(asuint(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w)))) + asfloat(asuint(RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w));
    fragmentColor2.z = mad((mad(asfloat(reinterpretedBits17.x), varyingTexCoord3.z, mad(asfloat(reinterpretedBits16.x), varyingTexCoord3.x, varyingTexCoord3.y * asfloat(reinterpretedBits15.x))) + asfloat(reinterpretedBits18.x)) / multiplyAddValue48, 0.5f, 0.5f) - mad((mad(asfloat(reinterpretedBits21.x), reinterpretedBits14, mad(asfloat(reinterpretedBits20.x), reinterpretedBits12, reinterpretedBits13 * asfloat(reinterpretedBits19.x))) + asfloat(reinterpretedBits22.x)) / multiplyAddValue49, 0.5f, 0.5f);
    fragmentColor2.w = mad((mad(asfloat(reinterpretedBits17.y), varyingTexCoord3.z, mad(asfloat(reinterpretedBits16.y), varyingTexCoord3.x, varyingTexCoord3.y * asfloat(reinterpretedBits15.y))) + asfloat(reinterpretedBits18.y)) / multiplyAddValue48, 0.5f, 0.5f) - mad((mad(asfloat(reinterpretedBits21.y), reinterpretedBits14, mad(asfloat(reinterpretedBits20.y), reinterpretedBits12, reinterpretedBits13 * asfloat(reinterpretedBits19.y))) + asfloat(reinterpretedBits22.y)) / multiplyAddValue49, 0.5f, 0.5f);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05f) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05f);
    float productValue39 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue60 = (bitwiseValue ? min(productValue39, 1.0f) : varyingTexCoord5.x) * 0.16666667163372039794921875f;
    float multiplyAddValue36 = (bitwiseValue ? min(mad(mad(productValue39, 0.60000002384185791015625f, 0.4000000059604644775390625f), 0.60000002384185791015625f, 0.4000000059604644775390625f) * productValue39, 1.0f) : varyingTexCoord5.y) * 0.16666667163372039794921875f;
    float multiplyAddValue37 = (bitwiseValue ? min(mad(productValue39 * productValue39, 0.60000002384185791015625f, 0.4000000059604644775390625f) * productValue39, 1.0f) : varyingTexCoord5.z) * 0.16666667163372039794921875f;
    float productValue62 = ceil(min(max(max(multiplyAddValue36, 0.0039215688593685626983642578125f), max(multiplyAddValue37, comparisonValue60)), 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.y = uint(clamp(multiplyAddValue36 / productValue62, 0.0f, 1.0f) * 255.0f) + (uint(clamp(comparisonValue60 / productValue62, 0.0f, 1.0f) * 255.0f) * 256u);
    fragmentColor0.z = (uint(clamp(multiplyAddValue37 / productValue62, 0.0f, 1.0f) * 255.0f) * 256u) + uint(clamp(productValue62, 0.0f, 1.0f) * 255.0f);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue6 = varyingTexCoord3.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue7 = varyingTexCoord3.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue8 = varyingTexCoord3.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue6 = rsqrt(dot(float3(intermediateValue15, intermediateValue16, intermediateValue17), float3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue34 = inverseLengthValue6 * intermediateValue15;
    float productValue35 = inverseLengthValue6 * intermediateValue16;
    float productValue36 = inverseLengthValue6 * intermediateValue17;
    float quotientValue1 = 1.0f / ((abs(productValue35) + abs(productValue34)) + abs(productValue36));
    float productValue37 = quotientValue1 * productValue34;
    float productValue38 = quotientValue1 * productValue35;
    bool conditionValue6 = productValue36 < 0.0f;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue11 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue;
    float clampedValue1;
    float clampedValue2;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05f) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue39 = varyingTexCoord1.x * varyingTexCoord1.x;
        clampedValue = clamp(productValue39, 0.0f, 1.0f);
        clampedValue1 = clamp(((productValue39 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue39, 0.0f, 1.0f);
        clampedValue2 = clamp((((productValue39 * productValue39) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue39, 0.0f, 1.0f);
    }
    else
    {
        clampedValue = varyingTexCoord5.x;
        clampedValue1 = varyingTexCoord5.y;
        clampedValue2 = varyingTexCoord5.z;
    }
    float productValue40 = clampedValue * 0.16666667163372039794921875f;
    float productValue41 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue42 = clampedValue2 * 0.16666667163372039794921875f;
    float clampedValue10 = ceil(clamp(max(max(productValue40, productValue42), max(productValue41, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(intermediateValue11, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue12, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue40 / clampedValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue41 / clampedValue10, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue42 / clampedValue10, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue10, 0.0f, 1.0f) * 255.0f) & 255u);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue6 = varyingTexCoord3.x - RD_UNIFORM_PREV_WORLD_POS_OFFSET.x;
    float sumValue7 = varyingTexCoord3.y - RD_UNIFORM_PREV_WORLD_POS_OFFSET.y;
    float sumValue8 = varyingTexCoord3.z - RD_UNIFORM_PREV_WORLD_POS_OFFSET.z;
    float inverseLengthValue19 = rsqrt(dot(float3(intermediateValue16, intermediateValue17, intermediateValue18), float3(intermediateValue16, intermediateValue17, intermediateValue18)));
    float productValue74 = inverseLengthValue19 * intermediateValue16;
    float productValue75 = inverseLengthValue19 * intermediateValue17;
    float productValue76 = inverseLengthValue19 * intermediateValue18;
    float quotientValue6 = 1.0f / ((abs(productValue75) + abs(productValue74)) + abs(productValue76));
    float productValue77 = quotientValue6 * productValue74;
    float productValue78 = quotientValue6 * productValue75;
    bool conditionValue22 = productValue76 < 0.0f;
    float multiplyAddValue10 = mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.w, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.w, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.w * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.w;
    float multiplyAddValue11 = mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.w, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.w, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.w)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.w;
    float clampedValue1;
    float clampedValue2;
    float clampedValue3;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05f) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05f))
    {
        float productValue39 = varyingTexCoord1.x * varyingTexCoord1.x;
        clampedValue1 = clamp(productValue39, 0.0f, 1.0f);
        clampedValue2 = clamp(((productValue39 * 0.36000001430511474609375f) + 0.63999998569488525390625f) * productValue39, 0.0f, 1.0f);
        clampedValue3 = clamp((((productValue39 * productValue39) * 0.60000002384185791015625f) + 0.4000000059604644775390625f) * productValue39, 0.0f, 1.0f);
    }
    else
    {
        clampedValue1 = varyingTexCoord5.x;
        clampedValue2 = varyingTexCoord5.y;
        clampedValue3 = varyingTexCoord5.z;
    }
    float productValue41 = clampedValue1 * 0.16666667163372039794921875f;
    float productValue42 = clampedValue2 * 0.16666667163372039794921875f;
    float productValue79 = clampedValue3 * 0.16666667163372039794921875f;
    float clampedValue29 = ceil(clamp(max(max(productValue41, productValue79), max(productValue42, 0.0039215688593685626983642578125f)), 0.0f, 1.0f) * 255.0f) * 0.0039215688593685626983642578125f;
    fragmentColor0.x = ((uint(clamp(intermediateValue12, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(intermediateValue13, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.y = ((uint(clamp(productValue41 / clampedValue29, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(productValue42 / clampedValue29, 0.0f, 1.0f) * 255.0f) & 255u);
    fragmentColor0.z = ((uint(clamp(productValue79 / clampedValue29, 0.0f, 1.0f) * 255.0f) << 8u) & 65280u) | (uint(clamp(clampedValue29, 0.0f, 1.0f) * 255.0f) & 255u);
#endif
    fragmentColor0.w = uint(clamp(varyingTexCoord1.y, 0.0f, 1.0f) * 255.0f);
#if (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = uint(clamp(intermediateValue25, 0.0f, 1.0f) * 255.0f) + (uint(clamp(intermediateValue27, 0.0f, 1.0f) * 255.0f) * 256u);
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.x = uint(clamp(intermediateValue29, 0.0f, 1.0f) * 255.0f) + (uint(clamp(intermediateValue31, 0.0f, 1.0f) * 255.0f) * 256u);
#elif (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor1.x = productValue10;
    fragmentColor1.y = productValue11;
    fragmentColor1.z = productValue12;
    fragmentColor1.w = (intermediateValue10 > intermediateValue13) ? ((intermediateValue10 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue13 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue6 ? (((productValue37 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue38))) : productValue37;
    fragmentColor2.y = conditionValue6 ? ((1.0f - abs(productValue37)) * ((productValue38 < 0.0f) ? (-1.0f) : 1.0f)) : productValue38;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue10) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue11)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue10) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue11)) * 0.5f;
#elif (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_DITHERING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor1.x = productValue12;
    fragmentColor1.y = productValue13;
    fragmentColor1.z = productValue14;
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875f) + 0.501960813999176025390625f) : (0.4980392158031463623046875f - (intermediateValue14 * 0.4980392158031463623046875f));
    fragmentColor2.x = conditionValue22 ? (((productValue77 < 0.0f) ? (-1.0f) : 1.0f) * (1.0f - abs(productValue78))) : productValue77;
    fragmentColor2.y = conditionValue22 ? ((1.0f - abs(productValue77)) * ((productValue78 < 0.0f) ? (-1.0f) : 1.0f)) : productValue78;
    fragmentColor2.z = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.x, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.x, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.x * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.x) / multiplyAddValue10) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.x, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.x, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.x)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.x) / multiplyAddValue11)) * 0.5f;
    fragmentColor2.w = (((mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2.y, varyingTexCoord3.z, mad(RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1.y, varyingTexCoord3.y, RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0.y * varyingTexCoord3.x)) + RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3.y) / multiplyAddValue10) - ((mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_2.y, sumValue8, mad(RD_UNIFORM_PREV_VIEW_PROJ_ROW_1.y, sumValue7, sumValue6 * RD_UNIFORM_PREV_VIEW_PROJ_ROW_0.y)) + RD_UNIFORM_PREV_VIEW_PROJ_ROW_3.y) / multiplyAddValue11)) * 0.5f;
#endif
    discardIfRequested();
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingSv_Isfrontface0 = stage_input.varyingSv_Isfrontface0;
    varyingBitangent0 = stage_input.varyingBitangent0;
    varyingColor1 = stage_input.varyingColor1;
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
