#version 460
#extension GL_GOOGLE_include_directive : require
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
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/PostFX.Debug.Texture2D/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), fragmentScalarConstants1.packedValues[8u]);
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool intermediateValue24;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    switch (uint(fragmentScalarConstants1.packedValues[4u]))
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y), fragmentScalarConstants1.packedValues[8u]);
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    float intermediateValue24;
    switch (uint(fragmentScalarConstants1.packedValues[4u]))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue1 = textureLod(sampler2D(rasterColorTexture, rasterColorSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), fragmentVectorConstants1.packedValues[2u].x);
    float scalarValue9 = sampledTextureValue1.x;
    float scalarValue10 = sampledTextureValue1.y;
    float scalarValue11 = sampledTextureValue1.z;
    float scalarValue12 = sampledTextureValue1.w;
    float productValue;
    float productValue3;
    float productValue4;
    bool intermediateValue7;
    switch (uint(fragmentVectorConstants1.packedValues[1u].x))
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        case 1u:
        {
            intermediateValue24 = true;
            intermediateValue25 = scalarValue3;
            intermediateValue26 = scalarValue3;
            intermediateValue27 = scalarValue3;
            break;
        }
#elif RD_PLATFORM == RD_PLATFORM_SM50
        case 1u:
        {
            intermediateValue21 = true;
            intermediateValue22 = scalarValue3;
            intermediateValue23 = scalarValue3;
            intermediateValue24 = scalarValue3;
            break;
        }
#endif
        case 2u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float multiplyAddValue = fma(scalarValue, 2.0, -1.0);
            float multiplyAddValue1 = fma(scalarValue1, 2.0, -1.0);
            float scalarValue4 = abs(multiplyAddValue1);
            precise float sumValue12 = 1.0 - abs(multiplyAddValue);
            precise float sumValue13 = 1.0 - scalarValue4;
            precise float sumValue14 = sumValue12 - scalarValue4;
            bool conditionValue5 = sumValue14 < 0.0;
            precise float comparisonValue8 = ((multiplyAddValue >= 0.0) ? 1.0 : (-1.0)) * sumValue13;
            precise float comparisonValue9 = ((multiplyAddValue1 >= 0.0) ? 1.0 : (-1.0)) * sumValue12;
            float comparisonValue10 = conditionValue5 ? comparisonValue8 : multiplyAddValue;
            float comparisonValue11 = conditionValue5 ? comparisonValue9 : multiplyAddValue1;
            vec3 vectorValue2 = vec3(comparisonValue10, comparisonValue11, sumValue14);
            float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
            precise float productValue11 = inverseLengthValue4 * comparisonValue10;
            precise float productValue12 = inverseLengthValue4 * comparisonValue11;
            precise float productValue13 = inverseLengthValue4 * sumValue14;
            intermediateValue24 = true;
            intermediateValue25 = fma(productValue13, 0.5, 0.5);
            intermediateValue26 = fma(productValue11, 0.5, 0.5);
            intermediateValue27 = fma(productValue12, 0.5, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float multiplyAddValue = fma(scalarValue, 2.0, -1.0);
            float multiplyAddValue1 = fma(scalarValue1, 2.0, -1.0);
            float scalarValue4 = abs(multiplyAddValue1);
            float sumValue = 1.0 - abs(multiplyAddValue);
            float sumValue1 = sumValue - scalarValue4;
            bool conditionValue = sumValue1 < 0.0;
            float comparisonValue = conditionValue ? (((multiplyAddValue >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue4)) : multiplyAddValue;
            float comparisonValue1 = conditionValue ? (((multiplyAddValue1 >= 0.0) ? 1.0 : (-1.0)) * sumValue) : multiplyAddValue1;
            vec3 vectorValue = vec3(comparisonValue, comparisonValue1, sumValue1);
            float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
            intermediateValue21 = true;
            intermediateValue22 = fma(inverseLengthValue * sumValue1, 0.5, 0.5);
            intermediateValue23 = fma(inverseLengthValue * comparisonValue, 0.5, 0.5);
            intermediateValue24 = fma(inverseLengthValue * comparisonValue1, 0.5, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue6 = (scalarValue9 * 2.0) + (-1.0);
            float productValue7 = (scalarValue10 * 2.0) + (-1.0);
            float sumValue7 = 1.0 - abs(productValue6);
            float scalarValue13 = abs(productValue7);
            float sumValue8 = sumValue7 - scalarValue13;
            bool conditionValue3 = sumValue8 < 0.0;
            float comparisonValue4 = conditionValue3 ? ((1.0 - scalarValue13) * ((productValue6 < 0.0) ? (-1.0) : 1.0)) : productValue6;
            float comparisonValue5 = conditionValue3 ? (sumValue7 * ((productValue7 < 0.0) ? (-1.0) : 1.0)) : productValue7;
            float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue4, comparisonValue5, sumValue8), vec3(comparisonValue4, comparisonValue5, sumValue8))) * 0.5;
            productValue = (inverseLengthValue2 * comparisonValue4) + 0.5;
            productValue3 = (inverseLengthValue2 * comparisonValue5) + 0.5;
            productValue4 = (inverseLengthValue2 * sumValue8) + 0.5;
            intermediateValue7 = false;
#endif
            break;
        }
        case 3u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float scalarValue5 = abs(scalarValue1);
            precise float sumValue15 = 1.0 - abs(scalarValue);
            precise float sumValue16 = 1.0 - scalarValue5;
            precise float sumValue17 = sumValue15 - scalarValue5;
            bool conditionValue6 = sumValue17 < 0.0;
            precise float comparisonValue12 = sumValue16 * ((scalarValue >= 0.0) ? 1.0 : (-1.0));
            precise float comparisonValue13 = sumValue15 * ((scalarValue1 >= 0.0) ? 1.0 : (-1.0));
            float comparisonValue14 = conditionValue6 ? comparisonValue12 : scalarValue;
            float comparisonValue15 = conditionValue6 ? comparisonValue13 : scalarValue1;
            vec3 vectorValue3 = vec3(comparisonValue14, comparisonValue15, sumValue17);
            float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
            precise float productValue14 = inverseLengthValue5 * comparisonValue14;
            precise float productValue15 = inverseLengthValue5 * comparisonValue15;
            precise float productValue16 = inverseLengthValue5 * sumValue17;
            intermediateValue24 = true;
            intermediateValue25 = fma(productValue16, 0.5, 0.5);
            intermediateValue26 = fma(productValue14, 0.5, 0.5);
            intermediateValue27 = fma(productValue15, 0.5, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float scalarValue5 = abs(scalarValue1);
            float sumValue2 = 1.0 - abs(scalarValue);
            float sumValue3 = sumValue2 - scalarValue5;
            bool conditionValue1 = sumValue3 < 0.0;
            float comparisonValue2 = conditionValue1 ? ((1.0 - scalarValue5) * ((scalarValue >= 0.0) ? 1.0 : (-1.0))) : scalarValue;
            float comparisonValue3 = conditionValue1 ? (sumValue2 * ((scalarValue1 >= 0.0) ? 1.0 : (-1.0))) : scalarValue1;
            vec3 vectorValue1 = vec3(comparisonValue2, comparisonValue3, sumValue3);
            float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
            intermediateValue21 = true;
            intermediateValue22 = fma(inverseLengthValue1 * sumValue3, 0.5, 0.5);
            intermediateValue23 = fma(inverseLengthValue1 * comparisonValue2, 0.5, 0.5);
            intermediateValue24 = fma(inverseLengthValue1 * comparisonValue3, 0.5, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float sumValue9 = 1.0 - abs(scalarValue9);
            float scalarValue14 = abs(scalarValue10);
            float sumValue10 = sumValue9 - scalarValue14;
            bool conditionValue4 = sumValue10 < 0.0;
            float comparisonValue6 = conditionValue4 ? ((1.0 - scalarValue14) * ((scalarValue9 < 0.0) ? (-1.0) : 1.0)) : scalarValue9;
            float comparisonValue7 = conditionValue4 ? (sumValue9 * ((scalarValue10 < 0.0) ? (-1.0) : 1.0)) : scalarValue10;
            float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, sumValue10), vec3(comparisonValue6, comparisonValue7, sumValue10))) * 0.5;
            productValue = (inverseLengthValue3 * comparisonValue6) + 0.5;
            productValue3 = (inverseLengthValue3 * comparisonValue7) + 0.5;
            productValue4 = (inverseLengthValue3 * sumValue10) + 0.5;
            intermediateValue7 = false;
#endif
            break;
        }
        case 4u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = 0.0;
            intermediateValue26 = fma(spvNClamp(scalarValue, -1.0, 1.0), 5.0, 0.5);
            intermediateValue27 = fma(spvNClamp(scalarValue1, -1.0, 1.0), 5.0, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = 0.0;
            intermediateValue23 = fma(spvNClamp(scalarValue, -1.0, 1.0), 5.0, 0.5);
            intermediateValue24 = fma(spvNClamp(scalarValue1, -1.0, 1.0), 5.0, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (spvNMin(spvNMax(scalarValue9, -1.0), 1.0) * 5.0) + 0.5;
            productValue3 = (spvNMin(spvNMax(scalarValue10, -1.0), 1.0) * 5.0) + 0.5;
            productValue4 = 0.0;
            intermediateValue7 = false;
#endif
            break;
        }
        case 5u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = 0.0;
            intermediateValue26 = fma(spvNClamp(scalarValue2, -1.0, 1.0), 5.0, 0.5);
            intermediateValue27 = fma(spvNClamp(scalarValue3, -1.0, 1.0), 5.0, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = 0.0;
            intermediateValue23 = fma(spvNClamp(scalarValue2, -1.0, 1.0), 5.0, 0.5);
            intermediateValue24 = fma(spvNClamp(scalarValue3, -1.0, 1.0), 5.0, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (spvNMin(spvNMax(scalarValue11, -1.0), 1.0) * 5.0) + 0.5;
            productValue3 = (spvNMin(spvNMax(scalarValue12, -1.0), 1.0) * 5.0) + 0.5;
            productValue4 = 0.0;
            intermediateValue7 = false;
#endif
            break;
        }
        case 6u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = 0.0;
            intermediateValue26 = scalarValue;
            intermediateValue27 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = 0.0;
            intermediateValue23 = scalarValue;
            intermediateValue24 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue9;
            productValue3 = scalarValue10;
            productValue4 = 0.0;
            intermediateValue7 = false;
#endif
            break;
        }
        case 7u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = fma(scalarValue2, 0.0500000007450580596923828125, 0.5);
            intermediateValue26 = fma(scalarValue, 0.0500000007450580596923828125, 0.5);
            intermediateValue27 = fma(scalarValue1, 0.0500000007450580596923828125, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = fma(scalarValue2, 0.0500000007450580596923828125, 0.5);
            intermediateValue23 = fma(scalarValue, 0.0500000007450580596923828125, 0.5);
            intermediateValue24 = fma(scalarValue1, 0.0500000007450580596923828125, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (scalarValue9 * 0.0500000007450580596923828125) + 0.5;
            productValue3 = (scalarValue10 * 0.0500000007450580596923828125) + 0.5;
            productValue4 = (scalarValue11 * 0.0500000007450580596923828125) + 0.5;
            intermediateValue7 = false;
#endif
            break;
        }
        case 8u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = scalarValue2;
            intermediateValue26 = scalarValue;
            intermediateValue27 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = scalarValue2;
            intermediateValue23 = scalarValue;
            intermediateValue24 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue9;
            productValue3 = scalarValue10;
            productValue4 = scalarValue11;
            intermediateValue7 = false;
#endif
            break;
        }
        case 9u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = scalarValue;
            intermediateValue26 = scalarValue;
            intermediateValue27 = scalarValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = scalarValue;
            intermediateValue23 = scalarValue;
            intermediateValue24 = scalarValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue9;
            productValue3 = scalarValue9;
            productValue4 = scalarValue9;
            intermediateValue7 = false;
#endif
            break;
        }
        case 10u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = scalarValue1;
            intermediateValue26 = scalarValue1;
            intermediateValue27 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = scalarValue1;
            intermediateValue23 = scalarValue1;
            intermediateValue24 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue10;
            productValue3 = scalarValue10;
            productValue4 = scalarValue10;
            intermediateValue7 = false;
#endif
            break;
        }
        case 11u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = scalarValue2;
            intermediateValue26 = scalarValue2;
            intermediateValue27 = scalarValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = scalarValue2;
            intermediateValue23 = scalarValue2;
            intermediateValue24 = scalarValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue11;
            productValue3 = scalarValue11;
            productValue4 = scalarValue11;
            intermediateValue7 = false;
#endif
            break;
        }
        case 12u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            bool conditionValue2 = scalarValue < 0.0;
            intermediateValue24 = true;
            intermediateValue25 = 0.0;
            intermediateValue26 = conditionValue2 ? (-scalarValue) : 0.0;
            intermediateValue27 = conditionValue2 ? 0.0 : scalarValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            bool conditionValue2 = scalarValue < 0.0;
            intermediateValue21 = true;
            intermediateValue22 = 0.0;
            intermediateValue23 = conditionValue2 ? (-scalarValue) : 0.0;
            intermediateValue24 = conditionValue2 ? 0.0 : scalarValue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            if (!(scalarValue9 < 0.0))
            {
                productValue = 0.0;
                productValue3 = scalarValue9;
                productValue4 = 0.0;
                intermediateValue7 = false;
                break;
            }
            productValue = (-0.0) - scalarValue9;
            productValue3 = 0.0;
            productValue4 = 0.0;
            intermediateValue7 = false;
#endif
            break;
        }
        case 13u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue17 = rdDot3Precise2(vec3(scalarValue, scalarValue1, scalarValue2), vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) * 8.0;
            precise float nonlinearValue1 = log2(productValue17) + 4.0;
            precise float productValue18 = nonlinearValue1 * 0.5;
            float scalarValue17 = spvNClamp(productValue18, 0.0, 8.0);
            uint scalarValue18 = uint(min(int(uint(int(scalarValue17))), int(6u)));
            float scalarValue19 = fract(scalarValue17);
            uint scalarValue20 = min(scalarValue18, 8u);
            uint sumValue18 = min((scalarValue18 + 1u), 8u);
            precise float sumValue19 = intermediateValue4[sumValue18].x - intermediateValue4[scalarValue20].x;
            precise float sumValue20 = intermediateValue4[sumValue18].y - intermediateValue4[scalarValue20].y;
            precise float sumValue21 = intermediateValue4[sumValue18].z - intermediateValue4[scalarValue20].z;
            intermediateValue24 = false;
            intermediateValue25 = fma(scalarValue19, sumValue21, intermediateValue4[scalarValue20].z);
            intermediateValue26 = fma(scalarValue19, sumValue19, intermediateValue4[scalarValue20].x);
            intermediateValue27 = fma(scalarValue19, sumValue20, intermediateValue4[scalarValue20].y);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float nonlinearValue = spvNClamp((log2(rdDot3Precise2(vec3(scalarValue, scalarValue1, scalarValue2), vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) * 8.0) + 4.0) * 0.5, 0.0, 8.0);
            uint scalarValue6 = uint(min(int(uint(int(nonlinearValue))), int(6u)));
            float scalarValue7 = fract(nonlinearValue);
            uint scalarValue8 = min(scalarValue6, 8u);
            uint sumValue4 = min((scalarValue6 + 1u), 8u);
            intermediateValue21 = false;
            intermediateValue22 = fma(scalarValue7, intermediateValue4[sumValue4].z - intermediateValue4[scalarValue8].z, intermediateValue4[scalarValue8].z);
            intermediateValue23 = fma(scalarValue7, intermediateValue4[sumValue4].x - intermediateValue4[scalarValue8].x, intermediateValue4[scalarValue8].x);
            intermediateValue24 = fma(scalarValue7, intermediateValue4[sumValue4].y - intermediateValue4[scalarValue8].y, intermediateValue4[scalarValue8].y);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float dotProductValue = spvNMin(spvNMax((log2(dot(vec3(scalarValue9, scalarValue10, scalarValue11), vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) * 8.0) + 4.0) * 0.5, 0.0), 8.0);
            uint scalarValue15 = uint(min(int(uint(max(int(uint(int(dotProductValue))), int(0u)))), int(6u)));
            float scalarValue16 = fract(dotProductValue);
            uint sumValue11 = scalarValue15 + 1u;
            productValue = ((intermediateValue[sumValue11] - intermediateValue[scalarValue15]) * scalarValue16) + intermediateValue[scalarValue15];
            productValue3 = ((intermediateValue1[sumValue11] - intermediateValue1[scalarValue15]) * scalarValue16) + intermediateValue1[scalarValue15];
            productValue4 = ((intermediateValue2[sumValue11] - intermediateValue2[scalarValue15]) * scalarValue16) + intermediateValue2[scalarValue15];
            intermediateValue7 = true;
#endif
            break;
        }
        case 15u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue19 = fragmentScalarConstants1.packedValues[1u] * fragmentScalarConstants1.packedValues[0u];
            precise float sumValue22 = fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[0u].y;
            precise float sumValue23 = fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[0u].x;
            precise float multiplyAddValue2 = productValue19 / fma(scalarValue, sumValue22, fragmentScalarConstants1.packedValues[1u]);
            precise float sumValue24 = multiplyAddValue2 - fragmentScalarConstants1.packedValues[0u];
            precise float quotientValue = sumValue24 / sumValue23;
            intermediateValue24 = false;
            intermediateValue25 = 0.0;
            intermediateValue26 = quotientValue;
            intermediateValue27 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = false;
            intermediateValue22 = 0.0;
            intermediateValue23 = (((fragmentScalarConstants1.packedValues[1u] * fragmentScalarConstants1.packedValues[0u]) / fma(scalarValue, fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[1u])) - fragmentScalarConstants1.packedValues[0u]) / (fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[0u].x);
            intermediateValue24 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (((fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[0u].y) / (((fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[0u].y) * scalarValue9) + fragmentVectorConstants1.packedValues[0u].y)) - fragmentVectorConstants1.packedValues[0u].x) / (fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[0u].x);
            productValue3 = 0.0;
            productValue4 = 0.0;
            intermediateValue7 = true;
#endif
            break;
        }
        case 16u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue25 = scalarValue3 - 0.501960813999176025390625;
            precise float productValue20 = sumValue25 * 2.007874011993408203125;
            float scalarValue21 = spvNClamp(productValue20, 0.0, 1.0);
            intermediateValue24 = true;
            intermediateValue25 = scalarValue21;
            intermediateValue26 = scalarValue21;
            intermediateValue27 = scalarValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue1 = spvNClamp((scalarValue3 - 0.501960813999176025390625) * 2.007874011993408203125, 0.0, 1.0);
            intermediateValue21 = true;
            intermediateValue22 = productValue1;
            intermediateValue23 = productValue1;
            intermediateValue24 = productValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue8 = spvNClamp((scalarValue12 + (-0.501960813999176025390625)) * 2.007874011993408203125, 0.0, 1.0);
            productValue = productValue8;
            productValue3 = productValue8;
            productValue4 = productValue8;
            intermediateValue7 = false;
#endif
            break;
        }
        case 17u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue26 = 0.4980392158031463623046875 - scalarValue3;
            precise float productValue21 = sumValue26 * 2.007874011993408203125;
            float scalarValue22 = spvNClamp(productValue21, 0.0, 1.0);
            intermediateValue24 = true;
            intermediateValue25 = scalarValue22;
            intermediateValue26 = scalarValue22;
            intermediateValue27 = scalarValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue2 = spvNClamp((0.4980392158031463623046875 - scalarValue3) * 2.007874011993408203125, 0.0, 1.0);
            intermediateValue21 = true;
            intermediateValue22 = productValue2;
            intermediateValue23 = productValue2;
            intermediateValue24 = productValue2;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue9 = spvNClamp((0.4980392158031463623046875 - scalarValue12) * 2.007874011993408203125, 0.0, 1.0);
            productValue = productValue9;
            productValue3 = productValue9;
            productValue4 = productValue9;
            intermediateValue7 = false;
#endif
            break;
        }
        case 21u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue27 = 1.0 - scalarValue;
            precise float sumValue28 = 1.0 - scalarValue1;
            precise float productValue22 = fragmentScalarConstants1.packedValues[1u] * fragmentScalarConstants1.packedValues[0u];
            precise float sumValue29 = fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[0u].y;
            precise float sumValue30 = fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[0u].x;
            precise float multiplyAddValue3 = productValue22 / fma(sumValue27, sumValue29, fragmentScalarConstants1.packedValues[1u]);
            precise float multiplyAddValue4 = productValue22 / fma(sumValue28, sumValue29, fragmentScalarConstants1.packedValues[1u]);
            precise float sumValue31 = multiplyAddValue3 - fragmentScalarConstants1.packedValues[0u];
            precise float sumValue32 = multiplyAddValue4 - fragmentScalarConstants1.packedValues[0u];
            precise float quotientValue1 = sumValue32 / sumValue30;
            precise float quotientValue2 = sumValue31 / sumValue30;
            intermediateValue24 = false;
            intermediateValue25 = 0.0;
            intermediateValue26 = quotientValue2;
            intermediateValue27 = quotientValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue5 = fragmentScalarConstants1.packedValues[1u] * fragmentScalarConstants1.packedValues[0u];
            float sumValue5 = fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[0u].y;
            float sumValue6 = fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[0u].x;
            intermediateValue21 = false;
            intermediateValue22 = 0.0;
            intermediateValue23 = ((productValue5 / fma(1.0 - scalarValue, sumValue5, fragmentScalarConstants1.packedValues[1u])) - fragmentScalarConstants1.packedValues[0u]) / sumValue6;
            intermediateValue24 = ((productValue5 / fma(1.0 - scalarValue1, sumValue5, fragmentScalarConstants1.packedValues[1u])) - fragmentScalarConstants1.packedValues[0u]) / sumValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue10 = fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[0u].y;
            float sumValue5 = fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[0u].y;
            float sumValue6 = fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[0u].x;
            productValue = ((productValue10 / ((sumValue5 * (1.0 - scalarValue9)) + fragmentVectorConstants1.packedValues[0u].y)) - fragmentVectorConstants1.packedValues[0u].x) / sumValue6;
            productValue3 = ((productValue10 / ((sumValue5 * (1.0 - scalarValue10)) + fragmentVectorConstants1.packedValues[0u].y)) - fragmentVectorConstants1.packedValues[0u].x) / sumValue6;
            productValue4 = 0.0;
            intermediateValue7 = true;
#endif
            break;
        }
        default:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = false;
            intermediateValue25 = scalarValue2;
            intermediateValue26 = scalarValue;
            intermediateValue27 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = false;
            intermediateValue22 = scalarValue2;
            intermediateValue23 = scalarValue;
            intermediateValue24 = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue9;
            productValue3 = scalarValue10;
            productValue4 = scalarValue11;
            intermediateValue7 = true;
            break;
        }
        case 1u:
        {
            productValue = scalarValue12;
            productValue3 = scalarValue12;
            productValue4 = scalarValue12;
            intermediateValue7 = false;
#endif
            break;
        }
    }
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float nonlinearValue2 = log2(intermediateValue26) * 0.4545454680919647216796875;
    precise float nonlinearValue3 = log2(intermediateValue27) * 0.4545454680919647216796875;
    precise float nonlinearValue4 = log2(intermediateValue25) * 0.4545454680919647216796875;
    fragmentColor0.x = intermediateValue24 ? intermediateValue26 : exp2(nonlinearValue2);
    fragmentColor0.y = intermediateValue24 ? intermediateValue27 : exp2(nonlinearValue3);
    fragmentColor0.z = intermediateValue24 ? intermediateValue25 : exp2(nonlinearValue4);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = intermediateValue21 ? intermediateValue23 : exp2(log2(intermediateValue23) * 0.4545454680919647216796875);
    fragmentColor0.y = intermediateValue21 ? intermediateValue24 : exp2(log2(intermediateValue24) * 0.4545454680919647216796875);
    fragmentColor0.z = intermediateValue21 ? intermediateValue22 : exp2(log2(intermediateValue22) * 0.4545454680919647216796875);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (intermediateValue7)
    {
        exponentialValue = exp2(log2(productValue) * 0.4545454680919647216796875);
        exponentialValue1 = exp2(log2(productValue3) * 0.4545454680919647216796875);
        exponentialValue2 = exp2(log2(productValue4) * 0.4545454680919647216796875);
    }
    else
    {
        exponentialValue = productValue;
        exponentialValue1 = productValue3;
        exponentialValue2 = productValue4;
    }
    fragmentColor0.x = exponentialValue;
    fragmentColor0.y = exponentialValue1;
    fragmentColor0.z = exponentialValue2;
#endif
    fragmentColor0.w = 1.0;
}
