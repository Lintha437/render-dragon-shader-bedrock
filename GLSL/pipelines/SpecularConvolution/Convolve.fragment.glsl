#version 460
#extension GL_GOOGLE_include_directive : require
// SpecularConvolution / Convolve / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/SpecularConvolution/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue;
    float multiplyAddValue1;
    float intermediateValue6;
    switch (uint(int(fragmentScalarConstants1.packedValues[8u])))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (varyingTexCoord0.x * 2.0) + (-1.0);
    float productValue1 = (varyingTexCoord0.y * 2.0) + (-1.0);
    float intermediateValue;
    float sumValue;
    float sumValue1;
    switch (uint(int(fragmentVectorConstants1.packedValues[2u].x)))
#endif
    {
        case 0u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = fma(varyingTexCoord0.x, -2.0, 1.0);
            multiplyAddValue1 = fma(varyingTexCoord0.y, -2.0, 1.0);
            intermediateValue6 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = 1.0;
            sumValue = (-0.0) - productValue1;
            sumValue1 = (-0.0) - productValue;
#endif
            break;
        }
        case 1u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = fma(varyingTexCoord0.x, 2.0, -1.0);
            multiplyAddValue1 = fma(varyingTexCoord0.y, -2.0, 1.0);
            intermediateValue6 = -1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = -1.0;
            sumValue = (-0.0) - productValue1;
            sumValue1 = productValue;
#endif
            break;
        }
        case 2u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = fma(varyingTexCoord0.y, 2.0, -1.0);
            multiplyAddValue1 = 1.0;
            intermediateValue6 = fma(varyingTexCoord0.x, 2.0, -1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = productValue;
            sumValue = 1.0;
            sumValue1 = productValue1;
#endif
            break;
        }
        case 3u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = fma(varyingTexCoord0.y, -2.0, 1.0);
            multiplyAddValue1 = -1.0;
            intermediateValue6 = fma(varyingTexCoord0.x, 2.0, -1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = productValue;
            sumValue = -1.0;
            sumValue1 = (-0.0) - productValue1;
#endif
            break;
        }
        case 4u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = 1.0;
            multiplyAddValue1 = fma(varyingTexCoord0.y, -2.0, 1.0);
            intermediateValue6 = fma(varyingTexCoord0.x, 2.0, -1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = productValue;
            sumValue = (-0.0) - productValue1;
            sumValue1 = 1.0;
#endif
            break;
        }
        case 5u:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = -1.0;
            multiplyAddValue1 = fma(varyingTexCoord0.y, -2.0, 1.0);
            intermediateValue6 = fma(varyingTexCoord0.x, -2.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = (-0.0) - productValue;
            sumValue = (-0.0) - productValue1;
            sumValue1 = -1.0;
#endif
            break;
        }
        default:
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue = 0.0;
            multiplyAddValue1 = 0.0;
            intermediateValue6 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            intermediateValue = 0.0;
            sumValue = 0.0;
            sumValue1 = 0.0;
#endif
            break;
        }
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec3 vectorValue1 = vec3(intermediateValue6, multiplyAddValue1, multiplyAddValue);
    float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    float productValue24 = inverseLengthValue3 * intermediateValue6;
    float productValue25 = inverseLengthValue3 * multiplyAddValue1;
    float productValue26 = inverseLengthValue3 * multiplyAddValue;
    vec3 vectorValue2 = vec3(productValue24, productValue25, productValue26);
    float intermediateValue13;
    float intermediateValue15;
    float intermediateValue17;
    if (uint(int(fragmentScalarConstants1.packedValues[4u])) == 1u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float inverseLengthValue = inversesqrt(dot(vec3(intermediateValue, sumValue, sumValue1), vec3(intermediateValue, sumValue, sumValue1)));
    float productValue2 = inverseLengthValue * intermediateValue;
    float productValue3 = inverseLengthValue * sumValue;
    float productValue4 = inverseLengthValue * sumValue1;
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[0u].y));
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if (uint(int(fragmentVectorConstants1.packedValues[1u].x)) == 1u)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float intermediateValue14;
        float intermediateValue16;
        float intermediateValue18;
        if (uint(int(fragmentScalarConstants1.packedValues[1u])) == 0u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue4;
        float branchMergedValue5;
        float branchMergedValue6;
        if (scalarValue == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            vec4 sampledTextureValue2 = textureLod(samplerCube(materialTexture0, textureSampler0), vec3(productValue24, productValue25, productValue26), 0.0);
            intermediateValue18 = sampledTextureValue2.x;
            intermediateValue16 = sampledTextureValue2.y;
            intermediateValue14 = sampledTextureValue2.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            vec4 vectorValue = textureLod(samplerCube(cubeMapTexture, cubeMapSampler), vec3(productValue2, productValue3, productValue4), 0.0);
            branchMergedValue4 = vectorValue.x;
            branchMergedValue5 = vectorValue.y;
            branchMergedValue6 = vectorValue.z;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float quotientValue2 = fragmentScalarConstants1.packedValues[1u] / (fragmentScalarConstants1.packedValues[3u] - 1.0);
            uint scalarValue11 = uint(fragmentScalarConstants1.packedValues[0u]);
            float scalarValue12 = trunc(fragmentScalarConstants1.packedValues[2u]);
            float scalarValue13 = rdEvaluateFloatExpression(scalarValue11);
            float productValue27 = quotientValue2 * quotientValue2;
            float productValue28 = productValue27 * productValue27;
            float multiplyAddValue2 = fma(productValue27, productValue27, -1.0);
            bool conditionValue1 = abs(productValue26) < 0.999000012874603271484375;
            float comparisonValue1 = conditionValue1 ? 0.0 : productValue26;
            float comparisonValue2 = -(conditionValue1 ? productValue25 : 0.0);
            float comparisonValue3 = conditionValue1 ? (productValue24 - comparisonValue1) : (-comparisonValue1);
            vec3 comparisonValue4 = vec3(comparisonValue2, comparisonValue3, conditionValue1 ? 0.0 : productValue25);
            float inverseLengthValue4 = inversesqrt(rdDot3Precise2(comparisonValue4, comparisonValue4));
            float productValue29 = inverseLengthValue4 * comparisonValue2;
            float productValue30 = inverseLengthValue4 * comparisonValue3;
            float productValue31 = inverseLengthValue4 * productValue25;
            float productValue32 = -(productValue26 * productValue30);
            float multiplyAddValue3 = conditionValue1 ? productValue32 : fma(productValue25, productValue31, productValue32);
            float multiplyAddValue4 = fma(productValue26, productValue29, -(conditionValue1 ? 0.0 : (productValue24 * productValue31)));
            float multiplyAddValue5 = fma(productValue24, productValue30, -(productValue25 * productValue29));
            float quotientValue3 = 12.56637096405029296875 / ((scalarValue12 * scalarValue12) * 6.0);
            float intermediateValue19;
            float intermediateValue20;
            float intermediateValue21;
            float intermediateValue22;
            intermediateValue19 = 0.0;
            intermediateValue20 = 0.0;
            intermediateValue21 = 0.0;
            intermediateValue22 = 0.0;
            uint sumValue1;
            float sumValue;
            float multiplyAddValue6;
            float multiplyAddValue7;
            float multiplyAddValue8;
            uint scalarValue7 = 0u;
            for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float scalarValue1 = float(int(uint(int(fragmentVectorConstants1.packedValues[0u].z))));
            uint scalarValue2 = uint(fragmentVectorConstants1.packedValues[0u].x);
            float quotientValue = fragmentVectorConstants1.packedValues[0u].y / (fragmentVectorConstants1.packedValues[0u].w + (-1.0));
            float intermediateValue8;
            float intermediateValue10;
            float intermediateValue12;
            float intermediateValue14;
            if (int(scalarValue2) > int(0u))
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                if (int(scalarValue7) >= int(scalarValue11))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float intermediateValue9;
                float intermediateValue11;
                float intermediateValue13;
                float intermediateValue15;
                float scalarValue3 = 0.0;
                float scalarValue4 = 0.0;
                float scalarValue5 = 0.0;
                float scalarValue6 = 0.0;
                uint scalarValue7 = 0u;
                float intermediateValue22;
                float productValue6;
                float sumValue3;
                float dotProductValue;
                float productValue20;
                float productValue21;
                float productValue22;
                float dotProductValue1;
                bool intermediateValue25;
                for (;;)
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    break;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    uint bitwiseValue = (scalarValue7 << 16u) | (scalarValue7 >> 16u);
                    uint bitwiseValue1 = ((bitwiseValue << 1u) & 2863311530u) | ((bitwiseValue >> 1u) & 1431655765u);
                    uint bitwiseValue2 = ((bitwiseValue1 << 2u) & 3435973836u) | ((bitwiseValue1 >> 2u) & 858993459u);
                    uint bitwiseValue3 = ((bitwiseValue2 << 4u) & 4042322160u) | ((bitwiseValue2 >> 4u) & 252645135u);
                    float bitwiseValue4 = float(((bitwiseValue3 << 8u) & 4278255360u) | ((bitwiseValue3 >> 8u) & 16711935u)) * 2.3283064365386962890625e-10;
                    intermediateValue22 = float(scalarValue2);
                    float productValue5 = quotientValue * quotientValue;
                    float quotientValue1 = (float(scalarValue7) / intermediateValue22) * 6.283185482025146484375;
                    productValue6 = productValue5 * productValue5;
                    sumValue3 = productValue6 + (-1.0);
                    float nonlinearValue = sqrt((1.0 - bitwiseValue4) / ((bitwiseValue4 * sumValue3) + 1.0));
                    float nonlinearValue1 = sqrt(1.0 - (nonlinearValue * nonlinearValue));
                    float wavePhaseValue = cos(quotientValue1) * nonlinearValue1;
                    float wavePhaseValue1 = sin(quotientValue1) * nonlinearValue1;
                    bool conditionValue = abs(productValue4) < 0.999000012874603271484375;
                    float comparisonValue = conditionValue ? 0.0 : 1.0;
                    float scalarValue8 = float(conditionValue);
                    float productValue7 = (-0.0) - (productValue3 * scalarValue8);
                    float productValue8 = (scalarValue8 * productValue2) - (comparisonValue * productValue4);
                    float productValue9 = comparisonValue * productValue3;
                    float inverseLengthValue1 = inversesqrt(dot(vec3(productValue7, productValue8, productValue9), vec3(productValue7, productValue8, productValue9)));
                    float productValue10 = inverseLengthValue1 * productValue7;
                    float productValue11 = productValue8 * inverseLengthValue1;
                    float productValue12 = productValue9 * inverseLengthValue1;
                    float productValue13 = ((productValue10 * wavePhaseValue) + (nonlinearValue * productValue2)) + (((productValue12 * productValue3) - (productValue11 * productValue4)) * wavePhaseValue1);
                    float productValue14 = ((productValue11 * wavePhaseValue) + (nonlinearValue * productValue3)) + (((productValue10 * productValue4) - (productValue12 * productValue2)) * wavePhaseValue1);
                    float productValue15 = ((productValue12 * wavePhaseValue) + (nonlinearValue * productValue4)) + (((productValue11 * productValue2) - (productValue10 * productValue3)) * wavePhaseValue1);
                    dotProductValue = dot(vec3(productValue2, productValue3, productValue4), vec3(productValue13, productValue14, productValue15));
                    float productValue16 = dotProductValue * 2.0;
                    float productValue17 = (productValue13 * productValue16) - productValue2;
                    float productValue18 = (productValue14 * productValue16) - productValue3;
                    float productValue19 = (productValue15 * productValue16) - productValue4;
                    float inverseLengthValue2 = inversesqrt(dot(vec3(productValue17, productValue18, productValue19), vec3(productValue17, productValue18, productValue19)));
                    productValue20 = productValue17 * inverseLengthValue2;
                    productValue21 = productValue18 * inverseLengthValue2;
                    productValue22 = productValue19 * inverseLengthValue2;
                    dotProductValue1 = spvNClamp(dot(vec3(productValue2, productValue3, productValue4), vec3(productValue20, productValue21, productValue22)), 0.0, 1.0);
                    intermediateValue25 = dotProductValue1 > 0.0;
                    float branchMergedValue;
                    float branchMergedValue1;
                    float branchMergedValue2;
                    float branchMergedValue3;
                    if (intermediateValue25)
                    {
                        float scalarValue9 = spvNMax(dotProductValue, 0.0);
                        float productValue23 = ((scalarValue9 * scalarValue9) * sumValue3) + 1.0;
                        vec4 sampledTextureValue = textureLod(samplerCube(cubeMapTexture, cubeMapSampler), vec3(productValue20, productValue21, productValue22), spvNMax(log2(1.0 / (((intermediateValue22 * 0.249993741512298583984375) * (productValue6 / ((productValue23 * productValue23) * 3.1415927410125732421875))) * (2.094395160675048828125 / (scalarValue1 * scalarValue1)))) * 0.5, 0.0));
                        branchMergedValue = dotProductValue1 + scalarValue3;
                        branchMergedValue1 = (sampledTextureValue.x * dotProductValue1) + scalarValue4;
                        branchMergedValue2 = (sampledTextureValue.y * dotProductValue1) + scalarValue5;
                        branchMergedValue3 = (sampledTextureValue.z * dotProductValue1) + scalarValue6;
                    }
                    else
                    {
                        branchMergedValue = scalarValue3;
                        branchMergedValue1 = scalarValue4;
                        branchMergedValue2 = scalarValue5;
                        branchMergedValue3 = scalarValue6;
                    }
                    intermediateValue9 = branchMergedValue;
                    intermediateValue11 = branchMergedValue1;
                    intermediateValue13 = branchMergedValue2;
                    intermediateValue15 = branchMergedValue3;
                    uint sumValue2 = scalarValue7 + 1u;
                    if (sumValue2 == scalarValue2)
                    {
                        break;
                    }
                    else
                    {
                        scalarValue3 = intermediateValue9;
                        scalarValue4 = intermediateValue11;
                        scalarValue5 = intermediateValue13;
                        scalarValue6 = intermediateValue15;
                        scalarValue7 = sumValue2;
                        continue;
                    }
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                uint bitwiseValue5 = scalarValue7 >> 16u;
                uint bitwiseValue6 = (bitfieldInsert(bitwiseValue5 << 1u, scalarValue7, int(17u), int(16u)) & 2863311530u) + ((bitfieldInsert(bitwiseValue5, scalarValue7, int(16u), int(16u)) >> 1u) & 1431655765u);
                uint bitwiseValue7 = ((bitwiseValue6 << 2u) & 3435973836u) + ((bitwiseValue6 >> 2u) & 858993459u);
                uint bitwiseValue8 = ((bitwiseValue7 << 4u) & 4042322160u) + ((bitwiseValue7 >> 4u) & 252645135u);
                float bitwiseValue9 = rdEvaluateFloatExpression(((bitwiseValue8 << 8u) & 4278255360u) + ((bitwiseValue8 >> 8u) & 16711935u));
                float quotientValue4 = (rdEvaluateFloatExpression(scalarValue7) / scalarValue13) * 6.283185482025146484375;
                float multiplyAddValue9 = fma(-bitwiseValue9, 2.3283064365386962890625e-10, 1.0) / fma(multiplyAddValue2, bitwiseValue9 * 2.3283064365386962890625e-10, 1.0);
                float nonlinearValue2 = sqrt(multiplyAddValue9);
                float nonlinearValue3 = sqrt(1.0 - multiplyAddValue9);
                float wavePhaseValue2 = nonlinearValue3 * cos(quotientValue4);
                float wavePhaseValue3 = nonlinearValue3 * sin(quotientValue4);
                float productValue33 = wavePhaseValue3 * multiplyAddValue5;
                float multiplyAddValue10 = fma(productValue24, nonlinearValue2, fma(productValue29, wavePhaseValue2, wavePhaseValue3 * multiplyAddValue3));
                float multiplyAddValue11 = fma(productValue25, nonlinearValue2, fma(productValue30, wavePhaseValue2, wavePhaseValue3 * multiplyAddValue4));
                float multiplyAddValue12 = fma(productValue26, nonlinearValue2, conditionValue1 ? productValue33 : fma(wavePhaseValue2, productValue31, productValue33));
                float scalarValue14 = rdDot3Precise2(vectorValue2, vec3(multiplyAddValue10, multiplyAddValue11, multiplyAddValue12));
                float sumValue4 = scalarValue14 + scalarValue14;
                float multiplyAddValue13 = fma(sumValue4, multiplyAddValue10, -productValue24);
                float multiplyAddValue14 = fma(sumValue4, multiplyAddValue11, -productValue25);
                float multiplyAddValue15 = fma(sumValue4, multiplyAddValue12, -productValue26);
                vec3 vectorValue3 = vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15);
                float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
                float productValue34 = inverseLengthValue5 * multiplyAddValue13;
                float productValue35 = inverseLengthValue5 * multiplyAddValue14;
                float productValue36 = inverseLengthValue5 * multiplyAddValue15;
                float scalarValue15 = spvNClamp(rdDot3Precise2(vectorValue2, vec3(productValue34, productValue35, productValue36)), 0.0, 1.0);
                if (scalarValue15 > 0.0)
                {
                    float scalarValue16 = spvNMax(scalarValue14, 0.0);
                    float multiplyAddValue16 = fma(scalarValue16 * scalarValue16, multiplyAddValue2, 1.0);
                    vec4 sampledTextureValue3 = textureLod(samplerCube(materialTexture0, textureSampler0), vec3(productValue34, productValue35, productValue36), spvNMax(log2((1.0 / ((scalarValue13 * (productValue28 / ((multiplyAddValue16 * multiplyAddValue16) * 3.1415927410125732421875))) * 0.249993741512298583984375)) / quotientValue3) * 0.5, 0.0));
                    multiplyAddValue8 = fma(sampledTextureValue3.x, scalarValue15, intermediateValue22);
                    multiplyAddValue7 = fma(sampledTextureValue3.y, scalarValue15, intermediateValue21);
                    multiplyAddValue6 = fma(sampledTextureValue3.z, scalarValue15, intermediateValue20);
                    sumValue = intermediateValue19 + scalarValue15;
                }
                else
                {
                    multiplyAddValue8 = intermediateValue22;
                    multiplyAddValue7 = intermediateValue21;
                    multiplyAddValue6 = intermediateValue20;
                    sumValue = intermediateValue19;
                }
                sumValue1 = scalarValue7 + 1u;
                intermediateValue19 = sumValue;
                intermediateValue20 = multiplyAddValue6;
                intermediateValue21 = multiplyAddValue7;
                intermediateValue22 = multiplyAddValue8;
                scalarValue7 = sumValue1;
                continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue8 = intermediateValue9;
                intermediateValue10 = intermediateValue11;
                intermediateValue12 = intermediateValue13;
                intermediateValue14 = intermediateValue15;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            float scalarValue17 = spvNMax(intermediateValue19, 0.001000000047497451305389404296875);
            intermediateValue18 = intermediateValue22 / scalarValue17;
            intermediateValue16 = intermediateValue21 / scalarValue17;
            intermediateValue14 = intermediateValue20 / scalarValue17;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            else
            {
                intermediateValue8 = 0.0;
                intermediateValue10 = 0.0;
                intermediateValue12 = 0.0;
                intermediateValue14 = 0.0;
            }
            float scalarValue10 = spvNMax(0.001000000047497451305389404296875, intermediateValue8);
            branchMergedValue4 = intermediateValue10 / scalarValue10;
            branchMergedValue5 = intermediateValue12 / scalarValue10;
            branchMergedValue6 = intermediateValue14 / scalarValue10;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue13 = intermediateValue14;
        intermediateValue15 = intermediateValue16;
        intermediateValue17 = intermediateValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue5 = branchMergedValue4;
        intermediateValue6 = branchMergedValue5;
        intermediateValue7 = branchMergedValue6;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue4 = textureLod(samplerCube(materialTexture0, textureSampler0), vec3(productValue24, productValue25, productValue26), trunc(fragmentScalarConstants1.packedValues[1u]));
        intermediateValue13 = sampledTextureValue4.z;
        intermediateValue15 = sampledTextureValue4.y;
        intermediateValue17 = sampledTextureValue4.x;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue1 = textureLod(samplerCube(cubeMapTexture, cubeMapSampler), vec3(productValue2, productValue3, productValue4), float(int(scalarValue)));
        intermediateValue5 = sampledTextureValue1.x;
        intermediateValue6 = sampledTextureValue1.y;
        intermediateValue7 = sampledTextureValue1.z;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = intermediateValue17;
    fragmentColor0.y = intermediateValue15;
    fragmentColor0.z = intermediateValue13;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = intermediateValue5;
    fragmentColor0.y = intermediateValue6;
    fragmentColor0.z = intermediateValue7;
#endif
    fragmentColor0.w = 1.0;
}
