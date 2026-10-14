#version 460
#extension GL_GOOGLE_include_directive : require
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
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/PostFX.Debug.Texture2DArray/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    vec4 sampledTextureValue1 = texture(sampler2DArray(materialTexture0, textureSampler0), vec3(varyingTexCoord0.x, varyingTexCoord0.y, fragmentScalarConstants1.packedValues[8u]));
    float scalarValue8 = sampledTextureValue1.x;
    float scalarValue9 = sampledTextureValue1.y;
    float scalarValue10 = sampledTextureValue1.z;
    float scalarValue11 = sampledTextureValue1.w;
    bool intermediateValue24;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    switch (uint(fragmentScalarConstants1.packedValues[4u]))
#elif RD_PLATFORM == RD_PLATFORM_SM50
    vec4 sampledTextureValue1 = texture(sampler2DArray(materialTexture0, textureSampler0), vec3(varyingTexCoord0.x, varyingTexCoord0.y, fragmentScalarConstants1.packedValues[8u]));
    float scalarValue8 = sampledTextureValue1.x;
    float scalarValue9 = sampledTextureValue1.y;
    float scalarValue10 = sampledTextureValue1.z;
    float scalarValue11 = sampledTextureValue1.w;
    bool intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    float intermediateValue24;
    switch (uint(fragmentScalarConstants1.packedValues[4u]))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    vec4 sampledTextureValue = texture(sampler2DArray(rasterColorTexture, rasterColorSampler), vec3(varyingTexCoord0.x, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[2u].x));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
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
            intermediateValue25 = scalarValue11;
            intermediateValue26 = scalarValue11;
            intermediateValue27 = scalarValue11;
            break;
        }
#elif RD_PLATFORM == RD_PLATFORM_SM50
        case 1u:
        {
            intermediateValue21 = true;
            intermediateValue22 = scalarValue11;
            intermediateValue23 = scalarValue11;
            intermediateValue24 = scalarValue11;
            break;
        }
#endif
        case 2u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float multiplyAddValue = fma(scalarValue8, 2.0, -1.0);
            float multiplyAddValue1 = fma(scalarValue9, 2.0, -1.0);
            float scalarValue12 = abs(multiplyAddValue1);
            precise float sumValue12 = 1.0 - abs(multiplyAddValue);
            precise float sumValue13 = 1.0 - scalarValue12;
            precise float sumValue14 = sumValue12 - scalarValue12;
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
            float multiplyAddValue = fma(scalarValue8, 2.0, -1.0);
            float multiplyAddValue1 = fma(scalarValue9, 2.0, -1.0);
            float scalarValue12 = abs(multiplyAddValue1);
            float sumValue7 = 1.0 - abs(multiplyAddValue);
            float sumValue8 = sumValue7 - scalarValue12;
            bool conditionValue2 = sumValue8 < 0.0;
            float comparisonValue4 = conditionValue2 ? (((multiplyAddValue >= 0.0) ? 1.0 : (-1.0)) * (1.0 - scalarValue12)) : multiplyAddValue;
            float comparisonValue5 = conditionValue2 ? (((multiplyAddValue1 >= 0.0) ? 1.0 : (-1.0)) * sumValue7) : multiplyAddValue1;
            vec3 vectorValue = vec3(comparisonValue4, comparisonValue5, sumValue8);
            float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
            intermediateValue21 = true;
            intermediateValue22 = fma(inverseLengthValue2 * sumValue8, 0.5, 0.5);
            intermediateValue23 = fma(inverseLengthValue2 * comparisonValue4, 0.5, 0.5);
            intermediateValue24 = fma(inverseLengthValue2 * comparisonValue5, 0.5, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue1 = (scalarValue * 2.0) + (-1.0);
            float productValue2 = (scalarValue1 * 2.0) + (-1.0);
            float sumValue = 1.0 - abs(productValue1);
            float scalarValue4 = abs(productValue2);
            float sumValue1 = sumValue - scalarValue4;
            bool conditionValue = sumValue1 < 0.0;
            float comparisonValue = conditionValue ? ((1.0 - scalarValue4) * ((productValue1 < 0.0) ? (-1.0) : 1.0)) : productValue1;
            float comparisonValue1 = conditionValue ? (sumValue * ((productValue2 < 0.0) ? (-1.0) : 1.0)) : productValue2;
            float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue1), vec3(comparisonValue, comparisonValue1, sumValue1))) * 0.5;
            productValue = (inverseLengthValue * comparisonValue) + 0.5;
            productValue3 = (inverseLengthValue * comparisonValue1) + 0.5;
            productValue4 = (inverseLengthValue * sumValue1) + 0.5;
            intermediateValue7 = false;
#endif
            break;
        }
        case 3u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            float scalarValue13 = abs(scalarValue9);
            precise float sumValue15 = 1.0 - abs(scalarValue8);
            precise float sumValue16 = 1.0 - scalarValue13;
            precise float sumValue17 = sumValue15 - scalarValue13;
            bool conditionValue6 = sumValue17 < 0.0;
            precise float comparisonValue12 = sumValue16 * ((scalarValue8 >= 0.0) ? 1.0 : (-1.0));
            precise float comparisonValue13 = sumValue15 * ((scalarValue9 >= 0.0) ? 1.0 : (-1.0));
            float comparisonValue14 = conditionValue6 ? comparisonValue12 : scalarValue8;
            float comparisonValue15 = conditionValue6 ? comparisonValue13 : scalarValue9;
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
            float scalarValue13 = abs(scalarValue9);
            float sumValue9 = 1.0 - abs(scalarValue8);
            float sumValue10 = sumValue9 - scalarValue13;
            bool conditionValue3 = sumValue10 < 0.0;
            float comparisonValue6 = conditionValue3 ? ((1.0 - scalarValue13) * ((scalarValue8 >= 0.0) ? 1.0 : (-1.0))) : scalarValue8;
            float comparisonValue7 = conditionValue3 ? (sumValue9 * ((scalarValue9 >= 0.0) ? 1.0 : (-1.0))) : scalarValue9;
            vec3 vectorValue1 = vec3(comparisonValue6, comparisonValue7, sumValue10);
            float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
            intermediateValue21 = true;
            intermediateValue22 = fma(inverseLengthValue3 * sumValue10, 0.5, 0.5);
            intermediateValue23 = fma(inverseLengthValue3 * comparisonValue6, 0.5, 0.5);
            intermediateValue24 = fma(inverseLengthValue3 * comparisonValue7, 0.5, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float sumValue2 = 1.0 - abs(scalarValue);
            float scalarValue5 = abs(scalarValue1);
            float sumValue3 = sumValue2 - scalarValue5;
            bool conditionValue1 = sumValue3 < 0.0;
            float comparisonValue2 = conditionValue1 ? ((1.0 - scalarValue5) * ((scalarValue < 0.0) ? (-1.0) : 1.0)) : scalarValue;
            float comparisonValue3 = conditionValue1 ? (sumValue2 * ((scalarValue1 < 0.0) ? (-1.0) : 1.0)) : scalarValue1;
            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue2, comparisonValue3, sumValue3), vec3(comparisonValue2, comparisonValue3, sumValue3))) * 0.5;
            productValue = (inverseLengthValue1 * comparisonValue2) + 0.5;
            productValue3 = (inverseLengthValue1 * comparisonValue3) + 0.5;
            productValue4 = (inverseLengthValue1 * sumValue3) + 0.5;
            intermediateValue7 = false;
#endif
            break;
        }
        case 4u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = 0.0;
            intermediateValue26 = fma(spvNClamp(scalarValue8, -1.0, 1.0), 5.0, 0.5);
            intermediateValue27 = fma(spvNClamp(scalarValue9, -1.0, 1.0), 5.0, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = 0.0;
            intermediateValue23 = fma(spvNClamp(scalarValue8, -1.0, 1.0), 5.0, 0.5);
            intermediateValue24 = fma(spvNClamp(scalarValue9, -1.0, 1.0), 5.0, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (spvNMin(spvNMax(scalarValue, -1.0), 1.0) * 5.0) + 0.5;
            productValue3 = (spvNMin(spvNMax(scalarValue1, -1.0), 1.0) * 5.0) + 0.5;
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
            intermediateValue26 = fma(spvNClamp(scalarValue10, -1.0, 1.0), 5.0, 0.5);
            intermediateValue27 = fma(spvNClamp(scalarValue11, -1.0, 1.0), 5.0, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = 0.0;
            intermediateValue23 = fma(spvNClamp(scalarValue10, -1.0, 1.0), 5.0, 0.5);
            intermediateValue24 = fma(spvNClamp(scalarValue11, -1.0, 1.0), 5.0, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (spvNMin(spvNMax(scalarValue2, -1.0), 1.0) * 5.0) + 0.5;
            productValue3 = (spvNMin(spvNMax(scalarValue3, -1.0), 1.0) * 5.0) + 0.5;
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
            intermediateValue26 = scalarValue8;
            intermediateValue27 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = 0.0;
            intermediateValue23 = scalarValue8;
            intermediateValue24 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue;
            productValue3 = scalarValue1;
            productValue4 = 0.0;
            intermediateValue7 = false;
#endif
            break;
        }
        case 7u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = fma(scalarValue10, 0.0500000007450580596923828125, 0.5);
            intermediateValue26 = fma(scalarValue8, 0.0500000007450580596923828125, 0.5);
            intermediateValue27 = fma(scalarValue9, 0.0500000007450580596923828125, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = fma(scalarValue10, 0.0500000007450580596923828125, 0.5);
            intermediateValue23 = fma(scalarValue8, 0.0500000007450580596923828125, 0.5);
            intermediateValue24 = fma(scalarValue9, 0.0500000007450580596923828125, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (scalarValue * 0.0500000007450580596923828125) + 0.5;
            productValue3 = (scalarValue1 * 0.0500000007450580596923828125) + 0.5;
            productValue4 = (scalarValue2 * 0.0500000007450580596923828125) + 0.5;
            intermediateValue7 = false;
#endif
            break;
        }
        case 8u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = scalarValue10;
            intermediateValue26 = scalarValue8;
            intermediateValue27 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = scalarValue10;
            intermediateValue23 = scalarValue8;
            intermediateValue24 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue;
            productValue3 = scalarValue1;
            productValue4 = scalarValue2;
            intermediateValue7 = false;
#endif
            break;
        }
        case 9u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = scalarValue8;
            intermediateValue26 = scalarValue8;
            intermediateValue27 = scalarValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = scalarValue8;
            intermediateValue23 = scalarValue8;
            intermediateValue24 = scalarValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue;
            productValue3 = scalarValue;
            productValue4 = scalarValue;
            intermediateValue7 = false;
#endif
            break;
        }
        case 10u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = scalarValue9;
            intermediateValue26 = scalarValue9;
            intermediateValue27 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = scalarValue9;
            intermediateValue23 = scalarValue9;
            intermediateValue24 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue1;
            productValue3 = scalarValue1;
            productValue4 = scalarValue1;
            intermediateValue7 = false;
#endif
            break;
        }
        case 11u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = true;
            intermediateValue25 = scalarValue10;
            intermediateValue26 = scalarValue10;
            intermediateValue27 = scalarValue10;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = true;
            intermediateValue22 = scalarValue10;
            intermediateValue23 = scalarValue10;
            intermediateValue24 = scalarValue10;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue2;
            productValue3 = scalarValue2;
            productValue4 = scalarValue2;
            intermediateValue7 = false;
#endif
            break;
        }
        case 12u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            bool conditionValue4 = scalarValue8 < 0.0;
            intermediateValue24 = true;
            intermediateValue25 = 0.0;
            intermediateValue26 = conditionValue4 ? (-scalarValue8) : 0.0;
            intermediateValue27 = conditionValue4 ? 0.0 : scalarValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            bool conditionValue4 = scalarValue8 < 0.0;
            intermediateValue21 = true;
            intermediateValue22 = 0.0;
            intermediateValue23 = conditionValue4 ? (-scalarValue8) : 0.0;
            intermediateValue24 = conditionValue4 ? 0.0 : scalarValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            if (!(scalarValue < 0.0))
            {
                productValue = 0.0;
                productValue3 = scalarValue;
                productValue4 = 0.0;
                intermediateValue7 = false;
                break;
            }
            productValue = (-0.0) - scalarValue;
            productValue3 = 0.0;
            productValue4 = 0.0;
            intermediateValue7 = false;
#endif
            break;
        }
        case 13u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue17 = rdDot3Precise2(vec3(scalarValue8, scalarValue9, scalarValue10), vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) * 8.0;
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
            float nonlinearValue = spvNClamp((log2(rdDot3Precise2(vec3(scalarValue8, scalarValue9, scalarValue10), vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) * 8.0) + 4.0) * 0.5, 0.0, 8.0);
            uint scalarValue14 = uint(min(int(uint(int(nonlinearValue))), int(6u)));
            float scalarValue15 = fract(nonlinearValue);
            uint scalarValue16 = min(scalarValue14, 8u);
            uint sumValue11 = min((scalarValue14 + 1u), 8u);
            intermediateValue21 = false;
            intermediateValue22 = fma(scalarValue15, intermediateValue4[sumValue11].z - intermediateValue4[scalarValue16].z, intermediateValue4[scalarValue16].z);
            intermediateValue23 = fma(scalarValue15, intermediateValue4[sumValue11].x - intermediateValue4[scalarValue16].x, intermediateValue4[scalarValue16].x);
            intermediateValue24 = fma(scalarValue15, intermediateValue4[sumValue11].y - intermediateValue4[scalarValue16].y, intermediateValue4[scalarValue16].y);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float dotProductValue = spvNMin(spvNMax((log2(dot(vec3(scalarValue, scalarValue1, scalarValue2), vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) * 8.0) + 4.0) * 0.5, 0.0), 8.0);
            uint scalarValue6 = uint(min(int(uint(max(int(uint(int(dotProductValue))), int(0u)))), int(6u)));
            float scalarValue7 = fract(dotProductValue);
            uint sumValue4 = scalarValue6 + 1u;
            productValue = ((intermediateValue[sumValue4] - intermediateValue[scalarValue6]) * scalarValue7) + intermediateValue[scalarValue6];
            productValue3 = ((intermediateValue1[sumValue4] - intermediateValue1[scalarValue6]) * scalarValue7) + intermediateValue1[scalarValue6];
            productValue4 = ((intermediateValue2[sumValue4] - intermediateValue2[scalarValue6]) * scalarValue7) + intermediateValue2[scalarValue6];
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
            precise float multiplyAddValue2 = productValue19 / fma(scalarValue8, sumValue22, fragmentScalarConstants1.packedValues[1u]);
            precise float sumValue24 = multiplyAddValue2 - fragmentScalarConstants1.packedValues[0u];
            precise float quotientValue = sumValue24 / sumValue23;
            intermediateValue24 = false;
            intermediateValue25 = 0.0;
            intermediateValue26 = quotientValue;
            intermediateValue27 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = false;
            intermediateValue22 = 0.0;
            intermediateValue23 = (((fragmentScalarConstants1.packedValues[1u] * fragmentScalarConstants1.packedValues[0u]) / fma(scalarValue8, fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[1u])) - fragmentScalarConstants1.packedValues[0u]) / (fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[0u].x);
            intermediateValue24 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = (((fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[0u].y) / (((fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[0u].y) * scalarValue) + fragmentVectorConstants1.packedValues[0u].y)) - fragmentVectorConstants1.packedValues[0u].x) / (fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[0u].x);
            productValue3 = 0.0;
            productValue4 = 0.0;
            intermediateValue7 = true;
#endif
            break;
        }
        case 16u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue25 = scalarValue11 - 0.501960813999176025390625;
            precise float productValue20 = sumValue25 * 2.007874011993408203125;
            float scalarValue21 = spvNClamp(productValue20, 0.0, 1.0);
            intermediateValue24 = true;
            intermediateValue25 = scalarValue21;
            intermediateValue26 = scalarValue21;
            intermediateValue27 = scalarValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue8 = spvNClamp((scalarValue11 - 0.501960813999176025390625) * 2.007874011993408203125, 0.0, 1.0);
            intermediateValue21 = true;
            intermediateValue22 = productValue8;
            intermediateValue23 = productValue8;
            intermediateValue24 = productValue8;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue5 = spvNClamp((scalarValue3 + (-0.501960813999176025390625)) * 2.007874011993408203125, 0.0, 1.0);
            productValue = productValue5;
            productValue3 = productValue5;
            productValue4 = productValue5;
            intermediateValue7 = false;
#endif
            break;
        }
        case 17u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue26 = 0.4980392158031463623046875 - scalarValue11;
            precise float productValue21 = sumValue26 * 2.007874011993408203125;
            float scalarValue22 = spvNClamp(productValue21, 0.0, 1.0);
            intermediateValue24 = true;
            intermediateValue25 = scalarValue22;
            intermediateValue26 = scalarValue22;
            intermediateValue27 = scalarValue22;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float productValue9 = spvNClamp((0.4980392158031463623046875 - scalarValue11) * 2.007874011993408203125, 0.0, 1.0);
            intermediateValue21 = true;
            intermediateValue22 = productValue9;
            intermediateValue23 = productValue9;
            intermediateValue24 = productValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue6 = spvNClamp((0.4980392158031463623046875 - scalarValue3) * 2.007874011993408203125, 0.0, 1.0);
            productValue = productValue6;
            productValue3 = productValue6;
            productValue4 = productValue6;
            intermediateValue7 = false;
#endif
            break;
        }
        case 21u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float sumValue27 = 1.0 - scalarValue8;
            precise float sumValue28 = 1.0 - scalarValue9;
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
            float productValue10 = fragmentScalarConstants1.packedValues[1u] * fragmentScalarConstants1.packedValues[0u];
            float sumValue5 = fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[0u].y;
            float sumValue6 = fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[0u].x;
            intermediateValue21 = false;
            intermediateValue22 = 0.0;
            intermediateValue23 = ((productValue10 / fma(1.0 - scalarValue8, sumValue5, fragmentScalarConstants1.packedValues[1u])) - fragmentScalarConstants1.packedValues[0u]) / sumValue6;
            intermediateValue24 = ((productValue10 / fma(1.0 - scalarValue9, sumValue5, fragmentScalarConstants1.packedValues[1u])) - fragmentScalarConstants1.packedValues[0u]) / sumValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue7 = fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[0u].y;
            float sumValue5 = fragmentVectorConstants1.packedValues[0u].x - fragmentVectorConstants1.packedValues[0u].y;
            float sumValue6 = fragmentVectorConstants1.packedValues[0u].y - fragmentVectorConstants1.packedValues[0u].x;
            productValue = ((productValue7 / ((sumValue5 * (1.0 - scalarValue)) + fragmentVectorConstants1.packedValues[0u].y)) - fragmentVectorConstants1.packedValues[0u].x) / sumValue6;
            productValue3 = ((productValue7 / ((sumValue5 * (1.0 - scalarValue1)) + fragmentVectorConstants1.packedValues[0u].y)) - fragmentVectorConstants1.packedValues[0u].x) / sumValue6;
            productValue4 = 0.0;
            intermediateValue7 = true;
#endif
            break;
        }
        default:
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            intermediateValue24 = false;
            intermediateValue25 = scalarValue10;
            intermediateValue26 = scalarValue8;
            intermediateValue27 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue21 = false;
            intermediateValue22 = scalarValue10;
            intermediateValue23 = scalarValue8;
            intermediateValue24 = scalarValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            productValue = scalarValue;
            productValue3 = scalarValue1;
            productValue4 = scalarValue2;
            intermediateValue7 = true;
            break;
        }
        case 1u:
        {
            productValue = scalarValue3;
            productValue3 = scalarValue3;
            productValue4 = scalarValue3;
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
