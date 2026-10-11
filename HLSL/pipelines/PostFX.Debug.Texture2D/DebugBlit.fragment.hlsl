// PostFX.Debug.Texture2D / DebugBlit / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/PostFX.Debug.Texture2D/FragmentBindings.hlsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.hlsli"
#endif
void executeFragmentStage()
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    float4 sampledTextureValue = materialTexture0.SampleLevel(textureSampler0, float2(varyingTexCoord0.x, varyingTexCoord0.y), RD_UNIFORM_MIP_LEVEL.x);
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool intermediateValue19;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float4 sampledTextureValue1 = rasterColorTexture.SampleLevel(rasterColorSampler, float2(varyingTexCoord0.x, varyingTexCoord0.y), RD_UNIFORM_MIP_LEVEL.x);
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
    float scalarValue12 = sampledTextureValue1.w;
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
            intermediateValue20 = scalarValue3;
            intermediateValue21 = scalarValue3;
            intermediateValue22 = scalarValue3;
            break;
        }
#endif
        case 2u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float multiplyAddValue = mad(scalarValue, 2.0f, -1.0f);
            float multiplyAddValue1 = mad(scalarValue1, 2.0f, -1.0f);
            float scalarValue4 = abs(multiplyAddValue1);
            precise float sumValue12 = 1.0f - abs(multiplyAddValue);
            precise float sumValue13 = 1.0f - scalarValue4;
            precise float sumValue14 = sumValue12 - scalarValue4;
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
            float multiplyAddValue = mad(scalarValue, 2.0f, -1.0f);
            float multiplyAddValue1 = mad(scalarValue1, 2.0f, -1.0f);
            float scalarValue4 = abs(multiplyAddValue1);
            float sumValue = 1.0f - abs(multiplyAddValue);
            float sumValue1 = sumValue - scalarValue4;
            bool conditionValue = sumValue1 < 0.0f;
            float comparisonValue = conditionValue ? (((multiplyAddValue >= 0.0f) ? 1.0f : (-1.0f)) * (1.0f - scalarValue4)) : multiplyAddValue;
            float comparisonValue1 = conditionValue ? (((multiplyAddValue1 >= 0.0f) ? 1.0f : (-1.0f)) * sumValue) : multiplyAddValue1;
            float3 vectorValue = float3(comparisonValue, comparisonValue1, sumValue1);
            float inverseLengthValue = rsqrt(rdDot3Precise(vectorValue, vectorValue));
            intermediateValue19 = true;
            intermediateValue20 = mad(inverseLengthValue * sumValue1, 0.5f, 0.5f);
            intermediateValue21 = mad(inverseLengthValue * comparisonValue, 0.5f, 0.5f);
            intermediateValue22 = mad(inverseLengthValue * comparisonValue1, 0.5f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue4 = (scalarValue9 * 2.0f) + (-1.0f);
            float productValue5 = (scalarValue10 * 2.0f) + (-1.0f);
            float sumValue7 = 1.0f - abs(productValue4);
            float scalarValue13 = abs(productValue5);
            float sumValue8 = sumValue7 - scalarValue13;
            bool conditionValue3 = sumValue8 < 0.0f;
            float comparisonValue4 = conditionValue3 ? ((1.0f - scalarValue13) * ((productValue4 < 0.0f) ? (-1.0f) : 1.0f)) : productValue4;
            float comparisonValue5 = conditionValue3 ? (sumValue7 * ((productValue5 < 0.0f) ? (-1.0f) : 1.0f)) : productValue5;
            float inverseLengthValue2 = rsqrt(dot(float3(comparisonValue4, comparisonValue5, sumValue8), float3(comparisonValue4, comparisonValue5, sumValue8))) * 0.5f;
            productValue = (inverseLengthValue2 * comparisonValue4) + 0.5f;
            productValue1 = (inverseLengthValue2 * comparisonValue5) + 0.5f;
            productValue2 = (inverseLengthValue2 * sumValue8) + 0.5f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 3u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float scalarValue5 = abs(scalarValue1);
            precise float sumValue15 = 1.0f - abs(scalarValue);
            precise float sumValue16 = 1.0f - scalarValue5;
            precise float sumValue17 = sumValue15 - scalarValue5;
            bool conditionValue6 = sumValue17 < 0.0f;
            precise float comparisonValue12 = sumValue16 * ((scalarValue >= 0.0f) ? 1.0f : (-1.0f));
            precise float comparisonValue13 = sumValue15 * ((scalarValue1 >= 0.0f) ? 1.0f : (-1.0f));
            float comparisonValue14 = conditionValue6 ? comparisonValue12 : scalarValue;
            float comparisonValue15 = conditionValue6 ? comparisonValue13 : scalarValue1;
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
            float scalarValue5 = abs(scalarValue1);
            float sumValue2 = 1.0f - abs(scalarValue);
            float sumValue3 = sumValue2 - scalarValue5;
            bool conditionValue1 = sumValue3 < 0.0f;
            float comparisonValue2 = conditionValue1 ? ((1.0f - scalarValue5) * ((scalarValue >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue;
            float comparisonValue3 = conditionValue1 ? (sumValue2 * ((scalarValue1 >= 0.0f) ? 1.0f : (-1.0f))) : scalarValue1;
            float3 vectorValue1 = float3(comparisonValue2, comparisonValue3, sumValue3);
            float inverseLengthValue1 = rsqrt(rdDot3Precise(vectorValue1, vectorValue1));
            intermediateValue19 = true;
            intermediateValue20 = mad(inverseLengthValue1 * sumValue3, 0.5f, 0.5f);
            intermediateValue21 = mad(inverseLengthValue1 * comparisonValue2, 0.5f, 0.5f);
            intermediateValue22 = mad(inverseLengthValue1 * comparisonValue3, 0.5f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float sumValue9 = 1.0f - abs(scalarValue9);
            float scalarValue14 = abs(scalarValue10);
            float sumValue10 = sumValue9 - scalarValue14;
            bool conditionValue4 = sumValue10 < 0.0f;
            float comparisonValue6 = conditionValue4 ? ((1.0f - scalarValue14) * ((scalarValue9 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue9;
            float comparisonValue7 = conditionValue4 ? (sumValue9 * ((scalarValue10 < 0.0f) ? (-1.0f) : 1.0f)) : scalarValue10;
            float inverseLengthValue3 = rsqrt(dot(float3(comparisonValue6, comparisonValue7, sumValue10), float3(comparisonValue6, comparisonValue7, sumValue10))) * 0.5f;
            productValue = (inverseLengthValue3 * comparisonValue6) + 0.5f;
            productValue1 = (inverseLengthValue3 * comparisonValue7) + 0.5f;
            productValue2 = (inverseLengthValue3 * sumValue10) + 0.5f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 4u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = 0.0f;
            intermediateValue21 = mad(clamp(scalarValue, -1.0f, 1.0f), 5.0f, 0.5f);
            intermediateValue22 = mad(clamp(scalarValue1, -1.0f, 1.0f), 5.0f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (min(max(scalarValue9, -1.0f), 1.0f) * 5.0f) + 0.5f;
            productValue1 = (min(max(scalarValue10, -1.0f), 1.0f) * 5.0f) + 0.5f;
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
            intermediateValue21 = mad(clamp(scalarValue2, -1.0f, 1.0f), 5.0f, 0.5f);
            intermediateValue22 = mad(clamp(scalarValue3, -1.0f, 1.0f), 5.0f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (min(max(scalarValue11, -1.0f), 1.0f) * 5.0f) + 0.5f;
            productValue1 = (min(max(scalarValue12, -1.0f), 1.0f) * 5.0f) + 0.5f;
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
            intermediateValue21 = scalarValue;
            intermediateValue22 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue9;
            productValue1 = scalarValue10;
            productValue2 = 0.0f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 7u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = mad(scalarValue2, 0.0500000007450580596923828125f, 0.5f);
            intermediateValue21 = mad(scalarValue, 0.0500000007450580596923828125f, 0.5f);
            intermediateValue22 = mad(scalarValue1, 0.0500000007450580596923828125f, 0.5f);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (scalarValue9 * 0.0500000007450580596923828125f) + 0.5f;
            productValue1 = (scalarValue10 * 0.0500000007450580596923828125f) + 0.5f;
            productValue2 = (scalarValue11 * 0.0500000007450580596923828125f) + 0.5f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 8u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = scalarValue2;
            intermediateValue21 = scalarValue;
            intermediateValue22 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue9;
            productValue1 = scalarValue10;
            productValue2 = scalarValue11;
            intermediateValue7 = false;
#endif
            break;
        }
        case 9u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = scalarValue;
            intermediateValue21 = scalarValue;
            intermediateValue22 = scalarValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue9;
            productValue1 = scalarValue9;
            productValue2 = scalarValue9;
            intermediateValue7 = false;
#endif
            break;
        }
        case 10u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = scalarValue1;
            intermediateValue21 = scalarValue1;
            intermediateValue22 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue10;
            productValue1 = scalarValue10;
            productValue2 = scalarValue10;
            intermediateValue7 = false;
#endif
            break;
        }
        case 11u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = true;
            intermediateValue20 = scalarValue2;
            intermediateValue21 = scalarValue2;
            intermediateValue22 = scalarValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue11;
            productValue1 = scalarValue11;
            productValue2 = scalarValue11;
            intermediateValue7 = false;
#endif
            break;
        }
        case 12u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            bool conditionValue2 = scalarValue < 0.0f;
            intermediateValue19 = true;
            intermediateValue20 = 0.0f;
            intermediateValue21 = conditionValue2 ? (-scalarValue) : 0.0f;
            intermediateValue22 = conditionValue2 ? 0.0f : scalarValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            if (!(scalarValue9 < 0.0f))
            {
                productValue = 0.0f;
                productValue1 = scalarValue9;
                productValue2 = 0.0f;
                intermediateValue7 = false;
                break;
            }
            productValue = (-0.0f) - scalarValue9;
            productValue1 = 0.0f;
            productValue2 = 0.0f;
            intermediateValue7 = false;
#endif
            break;
        }
        case 13u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue13 = rdDot3Precise(float3(scalarValue, scalarValue1, scalarValue2), float3(0.2125000059604644775390625f, 0.7153999805450439453125f, 0.07209999859333038330078125f)) * 8.0f;
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
            float clampedValue = clamp((log2(rdDot3Precise(float3(scalarValue, scalarValue1, scalarValue2), float3(0.2125000059604644775390625f, 0.7153999805450439453125f, 0.07209999859333038330078125f)) * 8.0f) + 4.0f) * 0.5f, 0.0f, 8.0f);
            uint scalarValue6 = uint(min(int(uint(int(clampedValue))), int(6u)));
            float scalarValue7 = frac(clampedValue);
            uint scalarValue8 = min(scalarValue6, 8u);
            uint sumValue4 = min((scalarValue6 + 1u), 8u);
            intermediateValue19 = false;
            intermediateValue20 = mad(scalarValue7, intermediateValue2[sumValue4].z - intermediateValue2[scalarValue8].z, intermediateValue2[scalarValue8].z);
            intermediateValue21 = mad(scalarValue7, intermediateValue2[sumValue4].x - intermediateValue2[scalarValue8].x, intermediateValue2[scalarValue8].x);
            intermediateValue22 = mad(scalarValue7, intermediateValue2[sumValue4].y - intermediateValue2[scalarValue8].y, intermediateValue2[scalarValue8].y);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float dotProductValue = min(max((log2(dot(float3(scalarValue9, scalarValue10, scalarValue11), float3(0.2125000059604644775390625f, 0.7153999805450439453125f, 0.07209999859333038330078125f)) * 8.0f) + 4.0f) * 0.5f, 0.0f), 8.0f);
            uint scalarValue15 = uint(min(int(uint(max(int(uint(int(dotProductValue))), int(0u)))), int(6u)));
            float scalarValue16 = frac(dotProductValue);
            uint sumValue11 = scalarValue15 + 1u;
            productValue = ((intermediateValue[sumValue11] - intermediateValue[scalarValue15]) * scalarValue16) + intermediateValue[scalarValue15];
            productValue1 = ((intermediateValue1[sumValue11] - intermediateValue1[scalarValue15]) * scalarValue16) + intermediateValue1[scalarValue15];
            productValue2 = ((intermediateValue2[sumValue11] - intermediateValue2[scalarValue15]) * scalarValue16) + intermediateValue2[scalarValue15];
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
            precise float multiplyAddValue2 = productValue15 / mad(scalarValue, sumValue22, RD_UNIFORM_CLIP_PLANES.y);
            precise float sumValue24 = multiplyAddValue2 - RD_UNIFORM_CLIP_PLANES.x;
            precise float quotientValue = sumValue24 / sumValue23;
            intermediateValue19 = false;
            intermediateValue20 = 0.0f;
            intermediateValue21 = quotientValue;
            intermediateValue22 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = false;
            intermediateValue20 = 0.0f;
            intermediateValue21 = (((RD_UNIFORM_CLIP_PLANES.y * RD_UNIFORM_CLIP_PLANES.x) / mad(scalarValue, RD_UNIFORM_CLIP_PLANES.x - RD_UNIFORM_CLIP_PLANES.y, RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / (RD_UNIFORM_CLIP_PLANES.y - RD_UNIFORM_CLIP_PLANES.x);
            intermediateValue22 = 0.0f;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (((RD_UNIFORM_CLIP_PLANES.x * RD_UNIFORM_CLIP_PLANES.y) / (((RD_UNIFORM_CLIP_PLANES.x - RD_UNIFORM_CLIP_PLANES.y) * scalarValue9) + RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / (RD_UNIFORM_CLIP_PLANES.y - RD_UNIFORM_CLIP_PLANES.x);
            productValue1 = 0.0f;
            productValue2 = 0.0f;
            intermediateValue7 = true;
#endif
            break;
        }
        case 16u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue25 = scalarValue3 - 0.501960813999176025390625f;
            precise float productValue16 = sumValue25 * 2.007874011993408203125f;
            float clampedValue6 = clamp(productValue16, 0.0f, 1.0f);
            intermediateValue19 = true;
            intermediateValue20 = clampedValue6;
            intermediateValue21 = clampedValue6;
            intermediateValue22 = clampedValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float clampedValue1 = clamp((scalarValue3 - 0.501960813999176025390625f) * 2.007874011993408203125f, 0.0f, 1.0f);
            intermediateValue19 = true;
            intermediateValue20 = clampedValue1;
            intermediateValue21 = clampedValue1;
            intermediateValue22 = clampedValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float clampedValue3 = clamp((scalarValue12 + (-0.501960813999176025390625f)) * 2.007874011993408203125f, 0.0f, 1.0f);
            productValue = clampedValue3;
            productValue1 = clampedValue3;
            productValue2 = clampedValue3;
            intermediateValue7 = false;
#endif
            break;
        }
        case 17u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue26 = 0.4980392158031463623046875f - scalarValue3;
            precise float productValue17 = sumValue26 * 2.007874011993408203125f;
            float clampedValue7 = clamp(productValue17, 0.0f, 1.0f);
            intermediateValue19 = true;
            intermediateValue20 = clampedValue7;
            intermediateValue21 = clampedValue7;
            intermediateValue22 = clampedValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float clampedValue2 = clamp((0.4980392158031463623046875f - scalarValue3) * 2.007874011993408203125f, 0.0f, 1.0f);
            intermediateValue19 = true;
            intermediateValue20 = clampedValue2;
            intermediateValue21 = clampedValue2;
            intermediateValue22 = clampedValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float clampedValue4 = clamp((0.4980392158031463623046875f - scalarValue12) * 2.007874011993408203125f, 0.0f, 1.0f);
            productValue = clampedValue4;
            productValue1 = clampedValue4;
            productValue2 = clampedValue4;
            intermediateValue7 = false;
#endif
            break;
        }
        case 21u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue27 = 1.0f - scalarValue;
            precise float sumValue28 = 1.0f - scalarValue1;
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
            float productValue3 = RD_UNIFORM_CLIP_PLANES.y * RD_UNIFORM_CLIP_PLANES.x;
            float sumValue5 = RD_UNIFORM_CLIP_PLANES.x - RD_UNIFORM_CLIP_PLANES.y;
            float sumValue6 = RD_UNIFORM_CLIP_PLANES.y - RD_UNIFORM_CLIP_PLANES.x;
            intermediateValue19 = false;
            intermediateValue20 = 0.0f;
            intermediateValue21 = ((productValue3 / mad(1.0f - scalarValue, sumValue5, RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / sumValue6;
            intermediateValue22 = ((productValue3 / mad(1.0f - scalarValue1, sumValue5, RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / sumValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue6 = RD_UNIFORM_CLIP_PLANES.x * RD_UNIFORM_CLIP_PLANES.y;
            float sumValue5 = RD_UNIFORM_CLIP_PLANES.x - RD_UNIFORM_CLIP_PLANES.y;
            float sumValue6 = RD_UNIFORM_CLIP_PLANES.y - RD_UNIFORM_CLIP_PLANES.x;
            productValue = ((productValue6 / ((sumValue5 * (1.0f - scalarValue9)) + RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / sumValue6;
            productValue1 = ((productValue6 / ((sumValue5 * (1.0f - scalarValue10)) + RD_UNIFORM_CLIP_PLANES.y)) - RD_UNIFORM_CLIP_PLANES.x) / sumValue6;
            productValue2 = 0.0f;
            intermediateValue7 = true;
#endif
            break;
        }
        default:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue19 = false;
            intermediateValue20 = scalarValue2;
            intermediateValue21 = scalarValue;
            intermediateValue22 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue9;
            productValue1 = scalarValue10;
            productValue2 = scalarValue11;
            intermediateValue7 = true;
            break;
        }
        case 1u:
        {
            productValue = scalarValue12;
            productValue1 = scalarValue12;
            productValue2 = scalarValue12;
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
