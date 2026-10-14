// PostFX.Debug.Texture2DArray / DebugBlit / fragment forward pipeline.
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

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/PostFX.Debug.Texture2DArray/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeFragmentStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    float4 sampledTextureValue1 = materialTexture0.Sample(textureSampler0, float3(varyingTexCoord0.x, varyingTexCoord0.y, RD_UNIFORM_TEXTURE_ARRAY_INDEX.x));
    float scalarValue8 = sampledTextureValue1.x;
    float scalarValue9 = sampledTextureValue1.y;
    float scalarValue10 = sampledTextureValue1.z;
    float scalarValue11 = sampledTextureValue1.w;
    bool intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue = rasterColorTexture.Sample(rasterColorSampler, float3(varyingTexCoord0.x, varyingTexCoord0.y, RD_UNIFORM_TEXTURE_ARRAY_INDEX.x));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float productValue;
    float productValue1;
    float productValue2;
    bool intermediateValue7;
#endif
    switch (uint(RD_UNIFORM_DEBUG_MODE.x))
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        case 1u:
        {
            intermediateValue19 = true;
            intermediateValue20 = scalarValue11;
            intermediateValue21 = scalarValue11;
            intermediateValue22 = scalarValue11;
            break;
        }
#endif
        case 2u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float multiplyAddValue = mad(scalarValue8, 2.0f, -1.0f);
            float multiplyAddValue1 = mad(scalarValue9, 2.0f, -1.0f);
            float scalarValue12 = abs(multiplyAddValue1);
            precise float sumValue12 = 1.0f - abs(multiplyAddValue);
            precise float sumValue13 = 1.0f - scalarValue12;
            precise float sumValue14 = sumValue12 - scalarValue12;
            bool conditionValue5 = sumValue14 < 0.0f;
            precise float comparisonValue8 = ((multiplyAddValue >= 0.0f) ? 1.0f : (-1.0f)) * sumValue13;
            precise float comparisonValue9 = ((multiplyAddValue1 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue12;
            float comparisonValue10 = conditionValue5 ? comparisonValue8 : multiplyAddValue;
            float comparisonValue11 = conditionValue5 ? comparisonValue9 : multiplyAddValue1;
            float3 vectorValue2 = float3(comparisonValue10, comparisonValue11, sumValue14);
            float inverseLengthValue4 = rsqrt(rdDot3Precise(vectorValue2, vectorValue2));
            precise float productValue7 = inverseLengthValue4 * comparisonValue10;
            precise float productValue8 = inverseLengthValue4 * comparisonValue11;
            precise float productValue9 = inverseLengthValue4 * sumValue14;
            intermediateValue19 = true;
            intermediateValue20 = mad(productValue9, 0.5f, 0.5f);
            intermediateValue21 = mad(productValue7, 0.5f, 0.5f);
            intermediateValue22 = mad(productValue8, 0.5f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue = mad(scalarValue8, 2.0f, -1.0f);
            float multiplyAddValue1 = mad(scalarValue9, 2.0f, -1.0f);
            float scalarValue12 = abs(multiplyAddValue1);
            float sumValue7 = 1.0f - abs(multiplyAddValue);
            float sumValue8 = sumValue7 - scalarValue12;
            bool conditionValue2 = sumValue8 < 0.0f;
            float comparisonValue4 = conditionValue2 ? (((multiplyAddValue >= 0.0f) ? 1.0f : (-1.0f)) * (1.0f - scalarValue12)) : multiplyAddValue;
            float comparisonValue5 = conditionValue2 ? (((multiplyAddValue1 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue7) : multiplyAddValue1;
            float3 vectorValue = float3(comparisonValue4, comparisonValue5, sumValue8);
            float inverseLengthValue2 = rsqrt(rdDot3Precise(vectorValue, vectorValue));
            intermediateValue19 = true;
            intermediateValue20 = mad(inverseLengthValue2 * sumValue8, 0.5f, 0.5f);
            intermediateValue21 = mad(inverseLengthValue2 * comparisonValue4, 0.5f, 0.5f);
            intermediateValue22 = mad(inverseLengthValue2 * comparisonValue5, 0.5f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue3 = (scalarValue * 2.0f) + (-1.0f);
            float productValue4 = (scalarValue1 * 2.0f) + (-1.0f);
            float sumValue = 1.0f - abs(productValue3);
            float scalarValue4 = abs(productValue4);
            float sumValue1 = sumValue - scalarValue4;
            bool conditionValue = sumValue1 < 0.0f;
            float comparisonValue = conditionValue ? ((1.0f - scalarValue4) * ((productValue3 < 0.0f) ? (-1.0f) : 1.0f)) : productValue3;
            float comparisonValue1 = conditionValue ? (sumValue * ((productValue4 < 0.0f) ? (-1.0f) : 1.0f)) : productValue4;
            float inverseLengthValue = rsqrt(dot(float3(comparisonValue, comparisonValue1, sumValue1), float3(comparisonValue, comparisonValue1, sumValue1))) * 0.5f;
            productValue = (inverseLengthValue * comparisonValue) + 0.5f;
            productValue1 = (inverseLengthValue * comparisonValue1) + 0.5f;
            productValue2 = (inverseLengthValue * sumValue1) + 0.5f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 3u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float scalarValue13 = abs(scalarValue9);
            precise float sumValue15 = 1.0f - abs(scalarValue8);
            precise float sumValue16 = 1.0f - scalarValue13;
            precise float sumValue17 = sumValue15 - scalarValue13;
            bool conditionValue6 = sumValue17 < 0.0f;
            precise float comparisonValue12 = sumValue16 * ((scalarValue8 >= 0.0f) ? 1.0f : (-1.0f));
            precise float comparisonValue13 = sumValue15 * ((scalarValue9 >= 0.0f) ? 1.0f : (-1.0f));
            float comparisonValue14 = conditionValue6 ? comparisonValue12 : scalarValue8;
            float comparisonValue15 = conditionValue6 ? comparisonValue13 : scalarValue9;
            float3 vectorValue3 = float3(comparisonValue14, comparisonValue15, sumValue17);
            float inverseLengthValue5 = rsqrt(rdDot3Precise(vectorValue3, vectorValue3));
            precise float productValue10 = inverseLengthValue5 * comparisonValue14;
            precise float productValue11 = inverseLengthValue5 * comparisonValue15;
            precise float productValue12 = inverseLengthValue5 * sumValue17;
            intermediateValue19 = true;
            intermediateValue20 = mad(productValue12, 0.5f, 0.5f);
            intermediateValue21 = mad(productValue10, 0.5f, 0.5f);
            intermediateValue22 = mad(productValue11, 0.5f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float scalarValue13 = abs(scalarValue9);
            float sumValue9 = 1.0f - abs(scalarValue8);
            float sumValue10 = sumValue9 - scalarValue13;
            bool conditionValue3 = sumValue10 < 0.0f;
            float comparisonValue6 = conditionValue3 ? ((1.0f - scalarValue13) * ((scalarValue8 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue8;
            float comparisonValue7 = conditionValue3 ? (sumValue9 * ((scalarValue9 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue9;
            float3 vectorValue1 = float3(comparisonValue6, comparisonValue7, sumValue10);
            float inverseLengthValue3 = rsqrt(rdDot3Precise(vectorValue1, vectorValue1));
            intermediateValue19 = true;
            intermediateValue20 = mad(inverseLengthValue3 * sumValue10, 0.5f, 0.5f);
            intermediateValue21 = mad(inverseLengthValue3 * comparisonValue6, 0.5f, 0.5f);
            intermediateValue22 = mad(inverseLengthValue3 * comparisonValue7, 0.5f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float sumValue2 = 1.0f - abs(scalarValue);
            float scalarValue5 = abs(scalarValue1);
            float sumValue3 = sumValue2 - scalarValue5;
            bool conditionValue1 = sumValue3 < 0.0f;
            float comparisonValue2 = conditionValue1 ? ((1.0f - scalarValue5) * ((scalarValue < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue;
            float comparisonValue3 = conditionValue1 ? (sumValue2 * ((scalarValue1 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue1;
            float inverseLengthValue1 = rsqrt(dot(float3(comparisonValue2, comparisonValue3, sumValue3), float3(comparisonValue2, comparisonValue3, sumValue3))) * 0.5f;
            productValue = (inverseLengthValue1 * comparisonValue2) + 0.5f;
            productValue1 = (inverseLengthValue1 * comparisonValue3) + 0.5f;
            productValue2 = (inverseLengthValue1 * sumValue3) + 0.5f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 4u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = 0.0f;
            intermediateValue21 = mad(clamp(scalarValue8, -1.0f, 1.0f), 5.0f, 0.5f);
            intermediateValue22 = mad(clamp(scalarValue9, -1.0f, 1.0f), 5.0f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (min(max(scalarValue, -1.0f), 1.0f) * 5.0f) + 0.5f;
            productValue1 = (min(max(scalarValue1, -1.0f), 1.0f) * 5.0f) + 0.5f;
            productValue2 = 0.0f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 5u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = 0.0f;
            intermediateValue21 = mad(clamp(scalarValue10, -1.0f, 1.0f), 5.0f, 0.5f);
            intermediateValue22 = mad(clamp(scalarValue11, -1.0f, 1.0f), 5.0f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (min(max(scalarValue2, -1.0f), 1.0f) * 5.0f) + 0.5f;
            productValue1 = (min(max(scalarValue3, -1.0f), 1.0f) * 5.0f) + 0.5f;
            productValue2 = 0.0f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 6u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = 0.0f;
            intermediateValue21 = scalarValue8;
            intermediateValue22 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue;
            productValue1 = scalarValue1;
            productValue2 = 0.0f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 7u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = mad(scalarValue10, 0.0500000007450580596923828125f, 0.5f);
            intermediateValue21 = mad(scalarValue8, 0.0500000007450580596923828125f, 0.5f);
            intermediateValue22 = mad(scalarValue9, 0.0500000007450580596923828125f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (scalarValue * 0.0500000007450580596923828125f) + 0.5f;
            productValue1 = (scalarValue1 * 0.0500000007450580596923828125f) + 0.5f;
            productValue2 = (scalarValue2 * 0.0500000007450580596923828125f) + 0.5f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 8u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = scalarValue10;
            intermediateValue21 = scalarValue8;
            intermediateValue22 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue;
            productValue1 = scalarValue1;
            productValue2 = scalarValue2;
            intermediateValue7 = false;
#endif
            break;
        }
        case 9u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = scalarValue8;
            intermediateValue21 = scalarValue8;
            intermediateValue22 = scalarValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue;
            productValue1 = scalarValue;
            productValue2 = scalarValue;
            intermediateValue7 = false;
#endif
            break;
        }
        case 10u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = scalarValue9;
            intermediateValue21 = scalarValue9;
            intermediateValue22 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue1;
            productValue1 = scalarValue1;
            productValue2 = scalarValue1;
            intermediateValue7 = false;
#endif
            break;
        }
        case 11u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = scalarValue10;
            intermediateValue21 = scalarValue10;
            intermediateValue22 = scalarValue10;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue2;
            productValue1 = scalarValue2;
            productValue2 = scalarValue2;
            intermediateValue7 = false;
#endif
            break;
        }
        case 12u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            bool conditionValue4 = scalarValue8 < 0.0f;
            intermediateValue19 = true;
            intermediateValue20 = 0.0f;
            intermediateValue21 = conditionValue4 ? (-scalarValue8) : 0.0f;
            intermediateValue22 = conditionValue4 ? 0.0f : scalarValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            if (!(scalarValue < 0.0f))
            {
                productValue = 0.0f;
                productValue1 = scalarValue;
                productValue2 = 0.0f;
                intermediateValue7 = false;
                break;
            }
            productValue = (-0.0f) - scalarValue;
            productValue1 = 0.0f;
            productValue2 = 0.0f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 13u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue13 = rdDot3Precise(float3(scalarValue8, scalarValue9, scalarValue10), float3(0.2125000059604644775390625f, 0.7153999805450439453125f, 0.07209999859333038330078125f)) * 8.0f;
            precise float nonlinearValue = log2(productValue13) + 4.0f;
            precise float productValue14 = nonlinearValue * 0.5f;
            float clampedValue5 = clamp(productValue14, 0.0f, 8.0f);
            uint scalarValue17 = uint(min(int(uint(int(clampedValue5))), int(6u)));
            float scalarValue18 = frac(clampedValue5);
            uint scalarValue19 = min(scalarValue17, 8u);
            uint sumValue18 = min((scalarValue17 + 1u), 8u);
            precise float sumValue19 = intermediateValue2[sumValue18].x - intermediateValue2[scalarValue19].x;
            precise float sumValue20 = intermediateValue2[sumValue18].y - intermediateValue2[scalarValue19].y;
            precise float sumValue21 = intermediateValue2[sumValue18].z - intermediateValue2[scalarValue19].z;
            intermediateValue19 = false;
            intermediateValue20 = mad(scalarValue18, sumValue21, intermediateValue2[scalarValue19].z);
            intermediateValue21 = mad(scalarValue18, sumValue19, intermediateValue2[scalarValue19].x);
            intermediateValue22 = mad(scalarValue18, sumValue20, intermediateValue2[scalarValue19].y);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float clampedValue2 = clamp((log2(rdDot3Precise(float3(scalarValue8, scalarValue9, scalarValue10), float3(0.2125000059604644775390625f, 0.7153999805450439453125f, 0.07209999859333038330078125f)) * 8.0f) + 4.0f) * 0.5f, 0.0f, 8.0f);
            uint scalarValue14 = uint(min(int(uint(int(clampedValue2))), int(6u)));
            float scalarValue15 = frac(clampedValue2);
            uint scalarValue16 = min(scalarValue14, 8u);
            uint sumValue11 = min((scalarValue14 + 1u), 8u);
            intermediateValue19 = false;
            intermediateValue20 = mad(scalarValue15, intermediateValue2[sumValue11].z - intermediateValue2[scalarValue16].z, intermediateValue2[scalarValue16].z);
            intermediateValue21 = mad(scalarValue15, intermediateValue2[sumValue11].x - intermediateValue2[scalarValue16].x, intermediateValue2[scalarValue16].x);
            intermediateValue22 = mad(scalarValue15, intermediateValue2[sumValue11].y - intermediateValue2[scalarValue16].y, intermediateValue2[scalarValue16].y);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float dotProductValue = min(max((log2(dot(float3(scalarValue, scalarValue1, scalarValue2), float3(0.2125000059604644775390625f, 0.7153999805450439453125f, 0.07209999859333038330078125f)) * 8.0f) + 4.0f) * 0.5f, 0.0f), 8.0f);
            uint scalarValue6 = uint(min(int(uint(max(int(uint(int(dotProductValue))), int(0u)))), int(6u)));
            float scalarValue7 = frac(dotProductValue);
            uint sumValue4 = scalarValue6 + 1u;
            productValue = ((intermediateValue[sumValue4] - intermediateValue[scalarValue6]) * scalarValue7) + intermediateValue[scalarValue6];
            productValue1 = ((intermediateValue1[sumValue4] - intermediateValue1[scalarValue6]) * scalarValue7) + intermediateValue1[scalarValue6];
            productValue2 = ((intermediateValue2[sumValue4] - intermediateValue2[scalarValue6]) * scalarValue7) + intermediateValue2[scalarValue6];
            intermediateValue7 = true;
#endif
            break;
        }
        case 15u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue15 = RD_UNIFORM_CLIP_PLANES.y * RD_UNIFORM_CLIP_PLANES.x;
            precise float sumValue22 = RD_UNIFORM_CLIP_PLANES.x - RD_UNIFORM_CLIP_PLANES.y;
            precise float sumValue23 = RD_UNIFORM_CLIP_PLANES.y - RD_UNIFORM_CLIP_PLANES.x;
            precise float multiplyAddValue2 = productValue15 / mad(scalarValue8, sumValue22, RD_UNIFORM_CLIP_PLANES.y);
            precise float sumValue24 = multiplyAddValue2 - RD_UNIFORM_CLIP_PLANES.x;
            precise float quotientValue = sumValue24 / sumValue23;
            intermediateValue19 = false;
            intermediateValue20 = 0.0f;
            intermediateValue21 = quotientValue;
            intermediateValue22 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = false;
            intermediateValue20 = 0.0f;
            intermediateValue21 = (((RD_UNIFORM_CLIP_PLANES.y * RD_UNIFORM_CLIP_PLANES.x) / mad(scalarValue8, RD_UNIFORM_CLIP_PLANES.x - RD_UNIFORM_CLIP_PLANES.y, RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / (RD_UNIFORM_CLIP_PLANES.y - RD_UNIFORM_CLIP_PLANES.x);
            intermediateValue22 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (((RD_UNIFORM_CLIP_PLANES.x * RD_UNIFORM_CLIP_PLANES.y) / (((RD_UNIFORM_CLIP_PLANES.x - RD_UNIFORM_CLIP_PLANES.y) * scalarValue) + RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / (RD_UNIFORM_CLIP_PLANES.y - RD_UNIFORM_CLIP_PLANES.x);
            productValue1 = 0.0f;
            productValue2 = 0.0f;
            intermediateValue7 = true;
#endif
            break;
        }
        case 16u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue25 = scalarValue11 - 0.501960813999176025390625f;
            precise float productValue16 = sumValue25 * 2.007874011993408203125f;
            float clampedValue6 = clamp(productValue16, 0.0f, 1.0f);
            intermediateValue19 = true;
            intermediateValue20 = clampedValue6;
            intermediateValue21 = clampedValue6;
            intermediateValue22 = clampedValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float clampedValue3 = clamp((scalarValue11 - 0.501960813999176025390625f) * 2.007874011993408203125f, 0.0f, 1.0f);
            intermediateValue19 = true;
            intermediateValue20 = clampedValue3;
            intermediateValue21 = clampedValue3;
            intermediateValue22 = clampedValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float clampedValue = clamp((scalarValue3 + (-0.501960813999176025390625f)) * 2.007874011993408203125f, 0.0f, 1.0f);
            productValue = clampedValue;
            productValue1 = clampedValue;
            productValue2 = clampedValue;
            intermediateValue7 = false;
#endif
            break;
        }
        case 17u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue26 = 0.4980392158031463623046875f - scalarValue11;
            precise float productValue17 = sumValue26 * 2.007874011993408203125f;
            float clampedValue7 = clamp(productValue17, 0.0f, 1.0f);
            intermediateValue19 = true;
            intermediateValue20 = clampedValue7;
            intermediateValue21 = clampedValue7;
            intermediateValue22 = clampedValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float clampedValue4 = clamp((0.4980392158031463623046875f - scalarValue11) * 2.007874011993408203125f, 0.0f, 1.0f);
            intermediateValue19 = true;
            intermediateValue20 = clampedValue4;
            intermediateValue21 = clampedValue4;
            intermediateValue22 = clampedValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float clampedValue1 = clamp((0.4980392158031463623046875f - scalarValue3) * 2.007874011993408203125f, 0.0f, 1.0f);
            productValue = clampedValue1;
            productValue1 = clampedValue1;
            productValue2 = clampedValue1;
            intermediateValue7 = false;
#endif
            break;
        }
        case 21u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue27 = 1.0f - scalarValue8;
            precise float sumValue28 = 1.0f - scalarValue9;
            precise float productValue18 = RD_UNIFORM_CLIP_PLANES.y * RD_UNIFORM_CLIP_PLANES.x;
            precise float sumValue29 = RD_UNIFORM_CLIP_PLANES.x - RD_UNIFORM_CLIP_PLANES.y;
            precise float sumValue30 = RD_UNIFORM_CLIP_PLANES.y - RD_UNIFORM_CLIP_PLANES.x;
            precise float multiplyAddValue3 = productValue18 / mad(sumValue27, sumValue29, RD_UNIFORM_CLIP_PLANES.y);
            precise float multiplyAddValue4 = productValue18 / mad(sumValue28, sumValue29, RD_UNIFORM_CLIP_PLANES.y);
            precise float sumValue31 = multiplyAddValue3 - RD_UNIFORM_CLIP_PLANES.x;
            precise float sumValue32 = multiplyAddValue4 - RD_UNIFORM_CLIP_PLANES.x;
            precise float quotientValue1 = sumValue32 / sumValue30;
            precise float quotientValue2 = sumValue31 / sumValue30;
            intermediateValue19 = false;
            intermediateValue20 = 0.0f;
            intermediateValue21 = quotientValue2;
            intermediateValue22 = quotientValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue6 = RD_UNIFORM_CLIP_PLANES.y * RD_UNIFORM_CLIP_PLANES.x;
            float sumValue5 = RD_UNIFORM_CLIP_PLANES.x - RD_UNIFORM_CLIP_PLANES.y;
            float sumValue6 = RD_UNIFORM_CLIP_PLANES.y - RD_UNIFORM_CLIP_PLANES.x;
            intermediateValue19 = false;
            intermediateValue20 = 0.0f;
            intermediateValue21 = ((productValue6 / mad(1.0f - scalarValue8, sumValue5, RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / sumValue6;
            intermediateValue22 = ((productValue6 / mad(1.0f - scalarValue9, sumValue5, RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / sumValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue5 = RD_UNIFORM_CLIP_PLANES.x * RD_UNIFORM_CLIP_PLANES.y;
            float sumValue5 = RD_UNIFORM_CLIP_PLANES.x - RD_UNIFORM_CLIP_PLANES.y;
            float sumValue6 = RD_UNIFORM_CLIP_PLANES.y - RD_UNIFORM_CLIP_PLANES.x;
            productValue = ((productValue5 / ((sumValue5 * (1.0f - scalarValue)) + RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / sumValue6;
            productValue1 = ((productValue5 / ((sumValue5 * (1.0f - scalarValue1)) + RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / sumValue6;
            productValue2 = 0.0f;
            intermediateValue7 = true;
#endif
            break;
        }
        default:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = false;
            intermediateValue20 = scalarValue10;
            intermediateValue21 = scalarValue8;
            intermediateValue22 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue;
            productValue1 = scalarValue1;
            productValue2 = scalarValue2;
            intermediateValue7 = true;
            break;
        }
        case 1u:
        {
            productValue = scalarValue3;
            productValue1 = scalarValue3;
            productValue2 = scalarValue3;
            intermediateValue7 = false;
#endif
            break;
        }
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float nonlinearValue1 = log2(intermediateValue21) * 0.4545454680919647216796875f;
    precise float nonlinearValue2 = log2(intermediateValue22) * 0.4545454680919647216796875f;
    precise float nonlinearValue3 = log2(intermediateValue20) * 0.4545454680919647216796875f;
    fragmentColor0.x = intermediateValue19 ? intermediateValue21 : exp2(nonlinearValue1);
    fragmentColor0.y = intermediateValue19 ? intermediateValue22 : exp2(nonlinearValue2);
    fragmentColor0.z = intermediateValue19 ? intermediateValue20 : exp2(nonlinearValue3);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = intermediateValue19 ? intermediateValue21 : exp2(log2(intermediateValue21) * 0.4545454680919647216796875f);
    fragmentColor0.y = intermediateValue19 ? intermediateValue22 : exp2(log2(intermediateValue22) * 0.4545454680919647216796875f);
    fragmentColor0.z = intermediateValue19 ? intermediateValue20 : exp2(log2(intermediateValue20) * 0.4545454680919647216796875f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (intermediateValue7)
    {
        exponentialValue = exp2(log2(productValue) * 0.4545454680919647216796875f);
        exponentialValue1 = exp2(log2(productValue1) * 0.4545454680919647216796875f);
        exponentialValue2 = exp2(log2(productValue2) * 0.4545454680919647216796875f);
    }
    else
    {
        exponentialValue = productValue;
        exponentialValue1 = productValue1;
        exponentialValue2 = productValue2;
    }
    fragmentColor0.x = exponentialValue;
    fragmentColor0.y = exponentialValue1;
    fragmentColor0.z = exponentialValue2;
#endif
    fragmentColor0.w = 1.0f;
}
FragmentStageOutput main(FragmentStageInput stage_input)
{
    varyingTexCoord0 = stage_input.varyingTexCoord0;
    executeFragmentStage();
    FragmentStageOutput stage_output;
    stage_output.fragmentColor0 = fragmentColor0;
    return stage_output;
}
