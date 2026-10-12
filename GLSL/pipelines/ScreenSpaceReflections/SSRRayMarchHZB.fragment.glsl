#version 460
#extension GL_GOOGLE_include_directive : require
// ScreenSpaceReflections / SSRRayMarchHZB / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 6
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/ScreenSpaceReflections/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue33 = varyingTexCoord0.x * fragmentVectorConstants1.packedValues[19u].x;
    precise float productValue34 = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[19u].y;
    precise float sumValue12 = floor(productValue33) + 0.5;
    precise float sumValue13 = floor(productValue34) + 0.5;
    precise float productValue35 = sumValue12 * fragmentVectorConstants1.packedValues[19u].z;
    precise float productValue36 = sumValue13 * fragmentVectorConstants1.packedValues[19u].w;
    bool sampledTextureValue6 = uint(textureQueryLevels(intermediateValue2)) > 0u;
    uvec2 sampledTextureValue7 = uvec2(textureSize(intermediateValue2, int(0u)));
    uint scalarValue17 = sampledTextureValue7.x;
    precise float comparisonValue7 = productValue35 * rdEvaluateFloatExpression(sampledTextureValue6 ? scalarValue17 : 0u);
    precise float comparisonValue8 = productValue36 * rdEvaluateFloatExpression(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
    precise float sampledTextureValue8 = rdEvaluateFloatExpression((texelFetch(intermediateValue2, ivec2(uvec2(uint(int(comparisonValue7)), uint(int(comparisonValue8)))), int(0u)).x >> 8u) & 255u) * 0.0039215688593685626983642578125;
    float scalarValue18 = dFdyCoarse(productValue35);
    float scalarValue19 = dFdxCoarse(productValue36);
    float scalarValue20 = dFdxCoarse(productValue35);
    float scalarValue21 = dFdyCoarse(productValue36);
    if (fragmentScalarConstants1.packedValues[20u] < sampledTextureValue8)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float productValue74 = (floor(varyingTexCoord0.x * fragmentVectorConstants1.packedValues[19u].x) + 0.5) * fragmentVectorConstants1.packedValues[19u].z;
    float productValue75 = (floor(varyingTexCoord0.y * fragmentVectorConstants1.packedValues[19u].y) + 0.5) * fragmentVectorConstants1.packedValues[19u].w;
    bool sampledTextureValue6 = uint(textureQueryLevels(intermediateValue2)) > 0u;
    uvec2 sampledTextureValue7 = uvec2(textureSize(intermediateValue2, int(0u)));
    uint scalarValue17 = sampledTextureValue7.x;
    float sampledTextureValue13 = rdEvaluateFloatExpression(bitfieldExtract(texelFetch(intermediateValue2, ivec2(uvec2(uint(int(productValue74 * rdEvaluateFloatExpression(sampledTextureValue6 ? scalarValue17 : 0u))), uint(int(productValue75 * rdEvaluateFloatExpression(sampledTextureValue6 ? sampledTextureValue7.y : 0u))))), int(0u)).x, int(8u), int(8u))) * 0.0039215688593685626983642578125;
    float scalarValue43 = dFdyCoarse(productValue74);
    float scalarValue44 = dFdxCoarse(productValue75);
    float scalarValue45 = dFdyCoarse(productValue75);
    float scalarValue46 = dFdxCoarse(productValue74);
    if (fragmentScalarConstants1.packedValues[20u] < sampledTextureValue13)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (floor(fragmentVectorConstants1.packedValues[19u].x * varyingTexCoord0.x) + 0.5) * fragmentVectorConstants1.packedValues[19u].z;
    float productValue1 = (floor(fragmentVectorConstants1.packedValues[19u].y * varyingTexCoord0.y) + 0.5) * fragmentVectorConstants1.packedValues[19u].w;
    uvec2 sampledTextureValue = uvec2(textureSize(gbufferRoughnessTexture, int(0u)));
    float sampledTextureValue1 = float((texelFetch(gbufferRoughnessTexture, ivec2(uvec2(uint(int(float(int(uint(int(float(int(sampledTextureValue.x)))))) * productValue)), uint(int(float(int(uint(int(float(int(sampledTextureValue.y)))))) * productValue1)))), int(0u)).x >> 8u) & 255u) * 0.0039215688593685626983642578125;
    float intermediateValue;
    float intermediateValue1;
    float intermediateValue2;
    float intermediateValue4;
    if (sampledTextureValue1 > fragmentVectorConstants1.packedValues[5u].x)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        fragmentColor0.x = 0.0;
        fragmentColor0.y = 0.0;
        fragmentColor0.z = 0.0;
        fragmentColor0.w = -1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue = 0.0;
        intermediateValue1 = 0.0;
        intermediateValue2 = 0.0;
        intermediateValue4 = -1.0;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        vec4 sampledTextureValue9 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(productValue35, productValue36), vec2(scalarValue20, scalarValue19), vec2(scalarValue18, scalarValue21));
        float scalarValue22 = sampledTextureValue9.x;
        if (scalarValue22 != 1.0)
#elif RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue14 = textureGrad(sampler2D(materialTexture0, textureSampler0), vec2(productValue74, productValue75), vec2(scalarValue46, scalarValue44), vec2(scalarValue43, scalarValue45));
        float scalarValue47 = sampledTextureValue14.x;
        if (scalarValue47 != 1.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[18u].x));
        vec4 sampledTextureValue2 = texture(sampler2D(gbufferDepthTexture, gbufferDepthSampler), vec2(productValue, productValue1));
        float scalarValue1 = sampledTextureValue2.x;
        float branchMergedValue7;
        float branchMergedValue8;
        float branchMergedValue9;
        float branchMergedValue10;
        if (scalarValue1 == 1.0)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            uint scalarValue23 = uint(int(fragmentScalarConstants1.packedValues[72u]));
            precise float productValue37 = varyingTexCoord1.x * fragmentScalarConstants1.packedValues[40u];
            precise float productValue38 = varyingTexCoord1.y * fragmentScalarConstants1.packedValues[45u];
            float multiplyAddValue10 = fma(scalarValue22, fragmentScalarConstants1.packedValues[51u], fragmentScalarConstants1.packedValues[55u]);
            precise float quotientValue9 = productValue37 / multiplyAddValue10;
            precise float quotientValue10 = productValue38 / multiplyAddValue10;
            precise float quotientValue11 = fragmentScalarConstants1.packedValues[54u] / multiplyAddValue10;
            vec4 sampledTextureValue10 = textureGrad(sampler2D(materialTexture1, textureSampler1), vec2(productValue35, productValue36), vec2(scalarValue20, scalarValue19), vec2(scalarValue18, scalarValue21));
            float scalarValue24 = sampledTextureValue10.x;
            float scalarValue25 = sampledTextureValue10.y;
            float scalarValue26 = abs(scalarValue25);
            precise float sumValue14 = 1.0 - abs(scalarValue24);
            precise float sumValue15 = 1.0 - scalarValue26;
            precise float sumValue16 = sumValue14 - scalarValue26;
            bool conditionValue2 = sumValue16 < 0.0;
            precise float multiplyAddValue11 = sumValue15 * fma(float(scalarValue24 >= 0.0), 2.0, -1.0);
            precise float multiplyAddValue12 = sumValue14 * fma(float(scalarValue25 >= 0.0), 2.0, -1.0);
            float comparisonValue9 = conditionValue2 ? multiplyAddValue11 : scalarValue24;
            float comparisonValue10 = conditionValue2 ? multiplyAddValue12 : scalarValue25;
            vec3 vectorValue = vec3(comparisonValue9, comparisonValue10, sumValue16);
            float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
            precise float productValue39 = inverseLengthValue8 * comparisonValue9;
            precise float productValue40 = inverseLengthValue8 * comparisonValue10;
            precise float productValue41 = inverseLengthValue8 * sumValue16;
            vec3 vectorValue1 = vec3(productValue39, productValue40, productValue41);
            float scalarValue27 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[6u].xyz), vectorValue1);
            float scalarValue28 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[7u].xyz), vectorValue1);
            float scalarValue29 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[8u].xyz), vectorValue1);
            vec3 vectorValue2 = vec3(scalarValue27, scalarValue28, scalarValue29);
            float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
            precise float productValue42 = inverseLengthValue9 * scalarValue27;
            precise float productValue43 = inverseLengthValue9 * scalarValue28;
            precise float productValue44 = inverseLengthValue9 * scalarValue29;
            vec3 vectorValue3 = vec3(quotientValue9, quotientValue10, quotientValue11);
            float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
            precise float productValue45 = inverseLengthValue10 * quotientValue9;
            precise float productValue46 = inverseLengthValue10 * quotientValue10;
            precise float productValue47 = inverseLengthValue10 * quotientValue11;
            float scalarValue30 = rdDot3Precise2(vec3(productValue45, productValue46, productValue47), vec3(productValue42, productValue43, productValue44));
            precise float sumValue17 = scalarValue30 + scalarValue30;
            float scalarValue31 = -sumValue17;
            float multiplyAddValue13 = fma(productValue42, scalarValue31, productValue45);
            float multiplyAddValue14 = fma(productValue43, scalarValue31, productValue46);
            float multiplyAddValue15 = fma(productValue44, scalarValue31, productValue47);
            vec3 vectorValue4 = vec3(multiplyAddValue13, multiplyAddValue14, multiplyAddValue15);
            float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
            precise float productValue48 = inverseLengthValue11 * multiplyAddValue13;
            precise float productValue49 = inverseLengthValue11 * multiplyAddValue14;
            precise float productValue50 = inverseLengthValue11 * multiplyAddValue15;
            float multiplyAddValue17 = fma(productValue50, 1000.0, quotientValue11);
            bool conditionValue3 = fragmentScalarConstants1.packedValues[56u] < multiplyAddValue17;
            precise float sumValue18 = fragmentScalarConstants1.packedValues[56u] - quotientValue11;
            precise float quotientValue12 = sumValue18 / productValue50;
            float multiplyAddValue18 = conditionValue3 ? fma(quotientValue12, productValue48, quotientValue9) : fma(productValue48, 1000.0, quotientValue9);
            float multiplyAddValue19 = conditionValue3 ? fma(quotientValue12, productValue49, quotientValue10) : fma(productValue49, 1000.0, quotientValue10);
            float multiplyAddValue21 = conditionValue3 ? fma(quotientValue12, productValue50, quotientValue11) : multiplyAddValue17;
            precise float productValue51 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[1u].x;
            precise float productValue52 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[1u].y;
            precise float productValue53 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[1u].z;
            precise float productValue54 = multiplyAddValue19 * fragmentVectorConstants1.packedValues[1u].w;
            precise float multiplyAddValue22 = fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue21, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue18, productValue51)) + fragmentVectorConstants1.packedValues[3u].x;
            precise float multiplyAddValue23 = fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue21, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue18, productValue52)) + fragmentVectorConstants1.packedValues[3u].y;
            precise float multiplyAddValue24 = fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue21, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue18, productValue53)) + fragmentVectorConstants1.packedValues[3u].z;
            precise float multiplyAddValue25 = fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue21, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue18, productValue54)) + fragmentVectorConstants1.packedValues[3u].w;
            precise float quotientValue13 = multiplyAddValue22 / multiplyAddValue25;
            precise float quotientValue14 = multiplyAddValue23 / multiplyAddValue25;
            precise float quotientValue15 = multiplyAddValue24 / multiplyAddValue25;
            precise float productValue55 = quotientValue14 * 0.5;
            precise float productValue56 = quotientValue13 * 0.5;
            float multiplyAddValue26 = fma(varyingTexCoord1.y, -0.5, 0.5);
            float multiplyAddValue27 = fma(varyingTexCoord1.x, 0.5, 0.5);
            precise float multiplyAddValue28 = fma(productValue55, -1.0, 0.5) - multiplyAddValue26;
            precise float multiplyAddValue29 = fma(productValue56, 1.0, 0.5) - multiplyAddValue27;
            precise float productValue57 = multiplyAddValue28 * fragmentVectorConstants1.packedValues[16u].y;
            precise float productValue58 = multiplyAddValue29 * fragmentVectorConstants1.packedValues[16u].x;
            precise float sumValue19 = quotientValue15 - scalarValue22;
            vec2 vectorValue5 = vec2(productValue57, productValue58);
            precise float nonlinearValue1 = fragmentScalarConstants1.packedValues[16u] / sqrt(rdDot2Precise(vectorValue5, vectorValue5));
            precise float productValue59 = productValue58 * nonlinearValue1;
            precise float productValue60 = productValue57 * nonlinearValue1;
            float multiplyAddValue30 = fma(multiplyAddValue27, fragmentVectorConstants1.packedValues[16u].x, productValue59);
            float multiplyAddValue31 = fma(multiplyAddValue26, fragmentVectorConstants1.packedValues[16u].y, productValue60);
            bool conditionValue4 = productValue58 > 0.0;
            bool conditionValue5 = productValue57 > 0.0;
            uint scalarValue32 = uint(int(fragmentVectorConstants1.packedValues[16u].x));
            uint scalarValue33 = uint(int(fragmentVectorConstants1.packedValues[16u].y));
            uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[60u]));
            float multiplyAddValue20;
            uint intermediateValue49;
            uint intermediateValue51;
            uint intermediateValue53;
            multiplyAddValue20 = fma(sumValue19, nonlinearValue1, scalarValue22);
            intermediateValue49 = uint(int(floor(multiplyAddValue31)));
            intermediateValue51 = uint(int(floor(multiplyAddValue30)));
            intermediateValue53 = 0u;
            float intermediateValue42;
            float intermediateValue44;
            float intermediateValue46;
            uint intermediateValue48;
            uint intermediateValue50;
            uint intermediateValue52;
            uint intermediateValue54;
            bool intermediateValue61;
            float scalarValue35 = multiplyAddValue31;
            float scalarValue36 = multiplyAddValue30;
            uint scalarValue12 = 0u;
            for (;;)
            {
                if (int(scalarValue23) <= int(intermediateValue53))
                {
                    intermediateValue61 = true;
                    break;
                }
                uint bitwiseValue6 = scalarValue12 & 31u;
                uint bitwiseValue7 = uint(int(intermediateValue51) >> int(bitwiseValue6));
                uint bitwiseValue8 = uint(int(intermediateValue49) >> int(bitwiseValue6));
                vec4 sampledTextureValue11 = texelFetch(materialTexture3, ivec2(uvec2(bitwiseValue7, bitwiseValue8)), int(scalarValue12));
                precise float sumValue20 = 1.0 - sampledTextureValue11.x;
                precise float sumValue21 = 1.0 - sampledTextureValue11.y;
                uint bitwiseValue9 = bitwiseValue7 << bitwiseValue6;
                uint bitwiseValue10 = bitwiseValue8 << bitwiseValue6;
                uint bitwiseValue11 = 1u << bitwiseValue6;
                uint sumValue22 = bitwiseValue11 + bitwiseValue9;
                uint sumValue23 = bitwiseValue10 + bitwiseValue11;
                bool conditionValue6 = !conditionValue4;
                bool conditionValue7 = !conditionValue5;
                uint sumValue24 = bitwiseValue9 - 1u;
                uint sumValue25 = bitwiseValue10 - 1u;
                float comparisonValue11 = rdSignedBitsToFloat(conditionValue4 ? sumValue22 : bitwiseValue9);
                float comparisonValue12 = rdSignedBitsToFloat(conditionValue5 ? sumValue23 : bitwiseValue10);
                precise float sumValue26 = comparisonValue11 - scalarValue36;
                precise float sumValue28 = comparisonValue12 - scalarValue35;
                precise float quotientValue16 = sumValue26 / productValue58;
                precise float quotientValue17 = sumValue28 / productValue57;
                bool conditionValue8 = quotientValue16 < quotientValue17;
                float multiplyAddValue32 = fma(quotientValue16, productValue57, scalarValue35);
                float multiplyAddValue33 = fma(quotientValue17, productValue58, scalarValue36);
                uint scalarValue37 = uint(int(floor(multiplyAddValue32)));
                uint scalarValue38 = uint(int(floor(multiplyAddValue33)));
                bool conditionValue9 = !conditionValue8;
                float multiplyAddValue34 = conditionValue8 ? fma(quotientValue16, sumValue19, multiplyAddValue20) : fma(quotientValue17, sumValue19, multiplyAddValue20);
                if ((sumValue21 >= spvNMin(multiplyAddValue20, multiplyAddValue34)) && ((int(intermediateValue53) > int(0u)) && (spvNMax(multiplyAddValue20, multiplyAddValue34) >= sumValue20)))
                {
                    uint sumValue27;
                    if (scalarValue12 == 0u)
                    {
                        intermediateValue61 = false;
                        break;
                    }
                    else
                    {
                        sumValue27 = scalarValue12 - 1u;
                    }
                    intermediateValue54 = intermediateValue53;
                    intermediateValue52 = intermediateValue51;
                    intermediateValue50 = intermediateValue49;
                    intermediateValue48 = sumValue27;
                    intermediateValue46 = scalarValue36;
                    intermediateValue44 = scalarValue35;
                    intermediateValue42 = multiplyAddValue20;
                }
                else
                {
                    if ((((((int(scalarValue38) < int(0u)) && conditionValue9) || (conditionValue8 && (((int(sumValue22) < int(0u)) && conditionValue4) || ((int(sumValue24) < int(0u)) && conditionValue6)))) || (((int(scalarValue37) < int(0u)) && conditionValue8) || ((((int(sumValue25) < int(0u)) && conditionValue7) || ((int(sumValue23) < int(0u)) && conditionValue5)) && conditionValue9))) || (((((int(sumValue22) >= int(scalarValue32)) && conditionValue4) || (conditionValue6 && (int(sumValue24) >= int(scalarValue32)))) && conditionValue8) || ((int(scalarValue32) <= int(scalarValue38)) && conditionValue9))) || (((int(scalarValue37) >= int(scalarValue33)) && conditionValue8) || (((conditionValue7 && (int(sumValue25) >= int(scalarValue33))) || ((int(sumValue23) >= int(scalarValue33)) && conditionValue5)) && conditionValue9)))
                    {
                        intermediateValue61 = true;
                        break;
                    }
                    intermediateValue54 = intermediateValue53 + 1u;
                    intermediateValue52 = conditionValue8 ? (conditionValue4 ? sumValue22 : sumValue24) : scalarValue38;
                    intermediateValue50 = conditionValue8 ? scalarValue37 : (conditionValue5 ? sumValue23 : sumValue25);
                    intermediateValue48 = uint(int(scalarValue34) > int(scalarValue12 + 1u)) + scalarValue12;
                    intermediateValue46 = conditionValue8 ? comparisonValue11 : multiplyAddValue33;
                    intermediateValue44 = conditionValue8 ? multiplyAddValue32 : comparisonValue12;
                    intermediateValue42 = multiplyAddValue34;
                }
                multiplyAddValue20 = intermediateValue42;
                scalarValue35 = intermediateValue44;
                scalarValue36 = intermediateValue46;
                scalarValue12 = intermediateValue48;
                intermediateValue49 = intermediateValue50;
                intermediateValue51 = intermediateValue52;
                intermediateValue53 = intermediateValue54;
                continue;
            }
            if (!intermediateValue61)
            {
                precise float sumValue29 = rdSignedBitsToFloat(intermediateValue51) + 0.5;
                precise float sumValue30 = rdSignedBitsToFloat(intermediateValue49) + 0.5;
                precise float quotientValue18 = sumValue29 / fragmentVectorConstants1.packedValues[16u].x;
                precise float quotientValue19 = sumValue30 / fragmentVectorConstants1.packedValues[16u].y;
                precise float productValue61 = productValue49 * fragmentVectorConstants1.packedValues[7u].x;
                precise float productValue62 = productValue49 * fragmentVectorConstants1.packedValues[7u].y;
                precise float productValue63 = productValue49 * fragmentVectorConstants1.packedValues[7u].z;
                float multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[8u].x, productValue50, fma(fragmentVectorConstants1.packedValues[6u].x, productValue48, productValue61));
                float multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[8u].y, productValue50, fma(fragmentVectorConstants1.packedValues[6u].y, productValue48, productValue62));
                float multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[8u].z, productValue50, fma(fragmentVectorConstants1.packedValues[6u].z, productValue48, productValue63));
                precise float quotientValue20 = rdSignedBitsToFloat(intermediateValue53) / trunc(fragmentScalarConstants1.packedValues[72u]);
                precise float productValue64 = fragmentScalarConstants1.packedValues[58u] * fragmentScalarConstants1.packedValues[68u];
                precise float multiplyAddValue38 = log2(abs(fma(quotientValue18, 2.0, -1.0))) * productValue64;
                precise float multiplyAddValue39 = log2(abs(fma(quotientValue19, 2.0, -1.0))) * fragmentScalarConstants1.packedValues[69u];
                precise float exponentialValue = 1.0 - exp2(multiplyAddValue38);
                precise float exponentialValue1 = 1.0 - exp2(multiplyAddValue39);
                precise float productValue65 = exponentialValue1 * exponentialValue;
                precise float sumValue31 = 1.0 - fragmentScalarConstants1.packedValues[70u];
                precise float sumValue32 = quotientValue20 - fragmentScalarConstants1.packedValues[70u];
                precise float quotientValue21 = 1.0 / sumValue31;
                precise float productValue66 = quotientValue21 * sumValue32;
                float scalarValue39 = spvNClamp(productValue66, 0.0, 1.0);
                precise float productValue67 = scalarValue39 * scalarValue39;
                precise float sumValue33 = fragmentScalarConstants1.packedValues[20u] - fragmentScalarConstants1.packedValues[21u];
                precise float sumValue34 = spvNMax(sampledTextureValue8, fragmentScalarConstants1.packedValues[21u]) - fragmentScalarConstants1.packedValues[21u];
                precise float quotientValue22 = sumValue34 / sumValue33;
                precise float sumValue35 = 1.0 - quotientValue22;
                vec4 sampledTextureValue12 = texture(sampler2D(materialTexture1, textureSampler1), vec2(quotientValue18, quotientValue19));
                float scalarValue40 = sampledTextureValue12.x;
                float scalarValue41 = sampledTextureValue12.y;
                float scalarValue42 = abs(scalarValue41);
                precise float sumValue36 = 1.0 - abs(scalarValue40);
                precise float sumValue37 = 1.0 - scalarValue42;
                precise float sumValue38 = sumValue36 - scalarValue42;
                bool conditionValue10 = sumValue38 < 0.0;
                precise float multiplyAddValue40 = fma(float(scalarValue40 >= 0.0), 2.0, -1.0) * sumValue37;
                precise float multiplyAddValue41 = fma(float(scalarValue41 >= 0.0), 2.0, -1.0) * sumValue36;
                float comparisonValue13 = conditionValue10 ? multiplyAddValue40 : scalarValue40;
                float comparisonValue14 = conditionValue10 ? multiplyAddValue41 : scalarValue41;
                vec3 vectorValue6 = vec3(comparisonValue13, comparisonValue14, sumValue38);
                float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
                precise float productValue68 = inverseLengthValue12 * comparisonValue13;
                precise float productValue69 = inverseLengthValue12 * comparisonValue14;
                precise float productValue70 = inverseLengthValue12 * sumValue38;
                vec3 vectorValue7 = vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37);
                float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
                precise float productValue71 = multiplyAddValue35 * inverseLengthValue13;
                precise float productValue72 = multiplyAddValue36 * inverseLengthValue13;
                precise float productValue73 = multiplyAddValue37 * inverseLengthValue13;
                precise float sumValue39 = 1.0 - rdDot3Precise2(vec3(productValue68, productValue69, productValue70), vec3(productValue71, productValue72, productValue73));
                fragmentColor0.w = spvNMin(sumValue35, spvNMin(spvNClamp(sumValue39, 0.0, 1.0), spvNMin(fma(-fma(scalarValue39, -2.0, 3.0), productValue67, 1.0), productValue65)));
                fragmentColor0.x = quotientValue18;
                fragmentColor0.y = quotientValue19;
                fragmentColor0.z = multiplyAddValue20;
            }
            else
            {
                fragmentColor0.x = 0.0;
                fragmentColor0.y = 0.0;
                fragmentColor0.z = 0.0;
                fragmentColor0.w = -1.0;
            }
#elif RD_PLATFORM == RD_PLATFORM_SM50
            uint scalarValue23 = uint(int(fragmentScalarConstants1.packedValues[72u]));
            float multiplyAddValue42 = fma(scalarValue47, fragmentScalarConstants1.packedValues[51u], fragmentScalarConstants1.packedValues[55u]);
            float quotientValue23 = (varyingTexCoord1.x * fragmentScalarConstants1.packedValues[40u]) / multiplyAddValue42;
            float quotientValue24 = (varyingTexCoord1.y * fragmentScalarConstants1.packedValues[45u]) / multiplyAddValue42;
            float quotientValue25 = fragmentScalarConstants1.packedValues[54u] / multiplyAddValue42;
            vec4 sampledTextureValue15 = textureGrad(sampler2D(materialTexture1, textureSampler1), vec2(productValue74, productValue75), vec2(scalarValue46, scalarValue44), vec2(scalarValue43, scalarValue45));
            float scalarValue48 = sampledTextureValue15.x;
            float scalarValue49 = sampledTextureValue15.y;
            float scalarValue50 = abs(scalarValue49);
            float sumValue40 = 1.0 - abs(scalarValue48);
            float sumValue41 = sumValue40 - scalarValue50;
            bool conditionValue11 = sumValue41 < 0.0;
            float sumValue42 = 2.0 - 1.0;
            float comparisonValue15 = conditionValue11 ? ((1.0 - scalarValue50) * ((scalarValue48 >= 0.0) ? sumValue42 : (-1.0))) : scalarValue48;
            float comparisonValue16 = conditionValue11 ? (sumValue40 * ((scalarValue49 >= 0.0) ? sumValue42 : (-1.0))) : scalarValue49;
            vec3 vectorValue8 = vec3(comparisonValue15, comparisonValue16, sumValue41);
            float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
            vec3 productValue76 = vec3(inverseLengthValue14 * comparisonValue15, inverseLengthValue14 * comparisonValue16, inverseLengthValue14 * sumValue41);
            float scalarValue51 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[6u].xyz), productValue76);
            float scalarValue52 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[7u].xyz), productValue76);
            float scalarValue53 = rdDot3Precise2(vec3(fragmentVectorConstants1.packedValues[8u].xyz), productValue76);
            vec3 vectorValue9 = vec3(scalarValue51, scalarValue52, scalarValue53);
            float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
            float productValue77 = inverseLengthValue15 * scalarValue51;
            float productValue78 = inverseLengthValue15 * scalarValue52;
            float productValue79 = inverseLengthValue15 * scalarValue53;
            vec3 vectorValue10 = vec3(quotientValue23, quotientValue24, quotientValue25);
            float inverseLengthValue16 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
            float productValue80 = inverseLengthValue16 * quotientValue23;
            float productValue81 = inverseLengthValue16 * quotientValue24;
            float productValue82 = inverseLengthValue16 * quotientValue25;
            float scalarValue54 = rdDot3Precise2(vec3(productValue80, productValue81, productValue82), vec3(productValue77, productValue78, productValue79));
            float sumValue43 = -(scalarValue54 + scalarValue54);
            float multiplyAddValue43 = fma(productValue77, sumValue43, productValue80);
            float multiplyAddValue44 = fma(productValue78, sumValue43, productValue81);
            float multiplyAddValue45 = fma(productValue79, sumValue43, productValue82);
            vec3 vectorValue11 = vec3(multiplyAddValue43, multiplyAddValue44, multiplyAddValue45);
            float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
            float productValue83 = inverseLengthValue17 * multiplyAddValue43;
            float productValue84 = inverseLengthValue17 * multiplyAddValue44;
            float productValue85 = inverseLengthValue17 * multiplyAddValue45;
            float multiplyAddValue46 = fma(productValue85, 1000.0, quotientValue25);
            bool conditionValue12 = fragmentScalarConstants1.packedValues[56u] < multiplyAddValue46;
            float quotientValue26 = (fragmentScalarConstants1.packedValues[56u] - quotientValue25) / productValue85;
            float multiplyAddValue47 = conditionValue12 ? fma(quotientValue26, productValue83, quotientValue23) : fma(productValue83, 1000.0, quotientValue23);
            float multiplyAddValue48 = conditionValue12 ? fma(quotientValue26, productValue84, quotientValue24) : fma(productValue84, 1000.0, quotientValue24);
            float multiplyAddValue49 = conditionValue12 ? fma(quotientValue26, productValue85, quotientValue25) : multiplyAddValue46;
            float multiplyAddValue50 = fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].w)) + fragmentVectorConstants1.packedValues[3u].w;
            float multiplyAddValue26 = fma(varyingTexCoord1.y, -0.5, 0.5);
            float multiplyAddValue27 = fma(varyingTexCoord1.x, 0.5, 0.5);
            float multiplyAddValue51 = ((0.5 - (((fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue50) * 0.5)) - multiplyAddValue26) * fragmentVectorConstants1.packedValues[16u].y;
            float multiplyAddValue52 = (((((fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue50) * 0.5) + 0.5) - multiplyAddValue27) * fragmentVectorConstants1.packedValues[16u].x;
            float multiplyAddValue53 = ((fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue49, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue47, multiplyAddValue48 * fragmentVectorConstants1.packedValues[1u].z)) + fragmentVectorConstants1.packedValues[3u].z) / multiplyAddValue50) - scalarValue47;
            vec2 vectorValue12 = vec2(multiplyAddValue51, multiplyAddValue52);
            float nonlinearValue2 = fragmentScalarConstants1.packedValues[16u] / sqrt(rdDot2Precise(vectorValue12, vectorValue12));
            float multiplyAddValue54 = fma(multiplyAddValue27, fragmentVectorConstants1.packedValues[16u].x, multiplyAddValue52 * nonlinearValue2);
            float multiplyAddValue55 = fma(multiplyAddValue26, fragmentVectorConstants1.packedValues[16u].y, multiplyAddValue51 * nonlinearValue2);
            bool conditionValue13 = multiplyAddValue52 > 0.0;
            bool conditionValue14 = multiplyAddValue51 > 0.0;
            uint scalarValue32 = uint(int(fragmentVectorConstants1.packedValues[16u].x));
            uint scalarValue33 = uint(int(fragmentVectorConstants1.packedValues[16u].y));
            uint scalarValue34 = uint(int(fragmentScalarConstants1.packedValues[60u]));
            float multiplyAddValue16;
            uint intermediateValue47;
            uint intermediateValue49;
            uint intermediateValue51;
            multiplyAddValue16 = fma(multiplyAddValue53, nonlinearValue2, scalarValue47);
            intermediateValue47 = uint(int(floor(multiplyAddValue55)));
            intermediateValue49 = uint(int(floor(multiplyAddValue54)));
            intermediateValue51 = 0u;
            float intermediateValue40;
            float intermediateValue42;
            float intermediateValue44;
            uint intermediateValue46;
            uint intermediateValue48;
            uint intermediateValue50;
            uint intermediateValue52;
            bool intermediateValue59;
            float scalarValue55 = multiplyAddValue55;
            float scalarValue56 = multiplyAddValue54;
            uint scalarValue12 = 0u;
            for (;;)
            {
                if (int(scalarValue23) <= int(intermediateValue51))
                {
                    intermediateValue59 = true;
                    break;
                }
                uint bitwiseValue6 = scalarValue12 & 31u;
                vec4 sampledTextureValue16 = texelFetch(materialTexture3, ivec2(uvec2(uint(int(intermediateValue49) >> int(bitwiseValue6)), uint(int(intermediateValue47) >> int(bitwiseValue6)))), int(scalarValue12));
                uint scalarValue57 = bitfieldInsert(intermediateValue49, 0u, int(0u), int(bitwiseValue6));
                uint scalarValue58 = bitfieldInsert(intermediateValue47, 0u, int(0u), int(bitwiseValue6));
                uint bitwiseValue11 = 1u << bitwiseValue6;
                uint sumValue44 = scalarValue57 + bitwiseValue11;
                uint sumValue45 = bitwiseValue11 + scalarValue58;
                uint comparisonValue17 = conditionValue13 ? sumValue44 : (scalarValue57 - 1u);
                uint comparisonValue18 = conditionValue14 ? sumValue45 : (scalarValue58 - 1u);
                float comparisonValue19 = rdSignedBitsToFloat(conditionValue13 ? sumValue44 : scalarValue57);
                float comparisonValue20 = rdSignedBitsToFloat(conditionValue14 ? sumValue45 : scalarValue58);
                float quotientValue27 = (comparisonValue19 - scalarValue56) / multiplyAddValue52;
                float quotientValue28 = (comparisonValue20 - scalarValue55) / multiplyAddValue51;
                bool conditionValue15 = quotientValue27 < quotientValue28;
                float multiplyAddValue56 = fma(quotientValue27, multiplyAddValue51, scalarValue55);
                float multiplyAddValue57 = fma(quotientValue28, multiplyAddValue52, scalarValue56);
                uint scalarValue59 = uint(int(floor(multiplyAddValue56)));
                uint scalarValue60 = uint(int(floor(multiplyAddValue57)));
                bool conditionValue16 = !conditionValue15;
                float multiplyAddValue58 = conditionValue15 ? fma(quotientValue27, multiplyAddValue53, multiplyAddValue16) : fma(quotientValue28, multiplyAddValue53, multiplyAddValue16);
                if (((1.0 - sampledTextureValue16.y) >= spvNMin(multiplyAddValue16, multiplyAddValue58)) && ((spvNMax(multiplyAddValue16, multiplyAddValue58) >= (1.0 - sampledTextureValue16.x)) && (int(intermediateValue51) > int(0u))))
                {
                    uint sumValue8;
                    if (scalarValue12 == 0u)
                    {
                        intermediateValue59 = false;
                        break;
                    }
                    else
                    {
                        sumValue8 = scalarValue12 - 1u;
                    }
                    intermediateValue52 = intermediateValue51;
                    intermediateValue50 = intermediateValue49;
                    intermediateValue48 = intermediateValue47;
                    intermediateValue46 = sumValue8;
                    intermediateValue44 = scalarValue56;
                    intermediateValue42 = scalarValue55;
                    intermediateValue40 = multiplyAddValue16;
                }
                else
                {
                    if (((conditionValue16 && (int(scalarValue33) <= int(comparisonValue18))) || (conditionValue15 && (int(scalarValue59) >= int(scalarValue33)))) || ((((int(scalarValue32) <= int(comparisonValue17)) && conditionValue15) || ((int(scalarValue32) <= int(scalarValue60)) && conditionValue16)) || (((conditionValue15 && (int(comparisonValue17) < int(0u))) || ((int(scalarValue60) < int(0u)) && conditionValue16)) || (((int(scalarValue59) < int(0u)) && conditionValue15) || ((int(comparisonValue18) < int(0u)) && conditionValue16)))))
                    {
                        intermediateValue59 = true;
                        break;
                    }
                    intermediateValue52 = intermediateValue51 + 1u;
                    intermediateValue50 = conditionValue15 ? comparisonValue17 : scalarValue60;
                    intermediateValue48 = conditionValue15 ? scalarValue59 : comparisonValue18;
                    intermediateValue46 = uint(int(scalarValue34) > int(scalarValue12 + 1u)) + scalarValue12;
                    intermediateValue44 = conditionValue15 ? comparisonValue19 : multiplyAddValue57;
                    intermediateValue42 = conditionValue15 ? multiplyAddValue56 : comparisonValue20;
                    intermediateValue40 = multiplyAddValue58;
                }
                multiplyAddValue16 = intermediateValue40;
                scalarValue55 = intermediateValue42;
                scalarValue56 = intermediateValue44;
                scalarValue12 = intermediateValue46;
                intermediateValue47 = intermediateValue48;
                intermediateValue49 = intermediateValue50;
                intermediateValue51 = intermediateValue52;
                continue;
            }
            if (!intermediateValue59)
            {
                float quotientValue29 = (rdSignedBitsToFloat(intermediateValue49) + 0.5) / fragmentVectorConstants1.packedValues[16u].x;
                float quotientValue30 = (rdSignedBitsToFloat(intermediateValue47) + 0.5) / fragmentVectorConstants1.packedValues[16u].y;
                float multiplyAddValue59 = fma(fragmentVectorConstants1.packedValues[8u].x, productValue85, fma(fragmentVectorConstants1.packedValues[6u].x, productValue83, productValue84 * fragmentVectorConstants1.packedValues[7u].x));
                float multiplyAddValue60 = fma(fragmentVectorConstants1.packedValues[8u].y, productValue85, fma(fragmentVectorConstants1.packedValues[6u].y, productValue83, productValue84 * fragmentVectorConstants1.packedValues[7u].y));
                float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[8u].z, productValue85, fma(fragmentVectorConstants1.packedValues[6u].z, productValue83, productValue84 * fragmentVectorConstants1.packedValues[7u].z));
                float quotientValue31 = spvNClamp((1.0 / (1.0 - fragmentScalarConstants1.packedValues[70u])) * ((rdSignedBitsToFloat(intermediateValue51) / trunc(fragmentScalarConstants1.packedValues[72u])) - fragmentScalarConstants1.packedValues[70u]), 0.0, 1.0);
                vec4 sampledTextureValue17 = texture(sampler2D(materialTexture1, textureSampler1), vec2(quotientValue29, quotientValue30));
                float scalarValue61 = sampledTextureValue17.x;
                float scalarValue62 = sampledTextureValue17.y;
                float scalarValue63 = abs(scalarValue62);
                float sumValue46 = 1.0 - abs(scalarValue61);
                float sumValue47 = sumValue46 - scalarValue63;
                bool conditionValue17 = sumValue47 < 0.0;
                float comparisonValue21 = conditionValue17 ? ((1.0 - scalarValue63) * ((scalarValue61 >= 0.0) ? sumValue42 : (-1.0))) : scalarValue61;
                float comparisonValue22 = conditionValue17 ? (sumValue46 * ((scalarValue62 >= 0.0) ? sumValue42 : (-1.0))) : scalarValue62;
                vec3 vectorValue13 = vec3(comparisonValue21, comparisonValue22, sumValue47);
                float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
                vec3 vectorValue14 = vec3(multiplyAddValue59, multiplyAddValue60, multiplyAddValue61);
                float inverseLengthValue19 = inversesqrt(rdDot3Precise2(vectorValue14, vectorValue14));
                fragmentColor0.w = spvNMin(1.0 - ((spvNMax(sampledTextureValue13, fragmentScalarConstants1.packedValues[21u]) - fragmentScalarConstants1.packedValues[21u]) / (fragmentScalarConstants1.packedValues[20u] - fragmentScalarConstants1.packedValues[21u])), spvNMin(spvNClamp(1.0 - rdDot3Precise2(vec3(inverseLengthValue18 * comparisonValue21, inverseLengthValue18 * comparisonValue22, inverseLengthValue18 * sumValue47), vec3(multiplyAddValue59 * inverseLengthValue19, multiplyAddValue60 * inverseLengthValue19, multiplyAddValue61 * inverseLengthValue19)), 0.0, 1.0), spvNMin(fma(-fma(quotientValue31, -2.0, 3.0), quotientValue31 * quotientValue31, 1.0), (1.0 - exp2(log2(abs(fma(quotientValue30, 2.0, -1.0))) * fragmentScalarConstants1.packedValues[69u])) * (1.0 - exp2(log2(abs(fma(quotientValue29, 2.0, -1.0))) * (fragmentScalarConstants1.packedValues[58u] * fragmentScalarConstants1.packedValues[68u]))))));
                fragmentColor0.x = quotientValue29;
                fragmentColor0.y = quotientValue30;
                fragmentColor0.z = multiplyAddValue16;
            }
            else
            {
                fragmentColor0.x = 0.0;
                fragmentColor0.y = 0.0;
                fragmentColor0.z = 0.0;
                fragmentColor0.w = -1.0;
            }
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue7 = -1.0;
            branchMergedValue8 = 0.0;
            branchMergedValue9 = 0.0;
            branchMergedValue10 = 0.0;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
            fragmentColor0.x = 0.0;
            fragmentColor0.y = 0.0;
            fragmentColor0.z = 0.0;
            fragmentColor0.w = -1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float productValue2 = (scalarValue1 * fragmentVectorConstants1.packedValues[12u].w) + fragmentVectorConstants1.packedValues[13u].w;
            float quotientValue = (fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord1.x) / productValue2;
            float quotientValue1 = (fragmentVectorConstants1.packedValues[11u].y * varyingTexCoord1.y) / productValue2;
            float quotientValue2 = fragmentVectorConstants1.packedValues[13u].z / productValue2;
            vec4 sampledTextureValue3 = texture(sampler2D(gbufferNormalTexture, gbufferNormalSampler), vec2(productValue, productValue1));
            float scalarValue2 = sampledTextureValue3.x;
            float scalarValue3 = sampledTextureValue3.y;
            float sumValue = 1.0 - abs(scalarValue2);
            float scalarValue4 = abs(scalarValue3);
            float sumValue1 = sumValue - scalarValue4;
            bool conditionValue = sumValue1 < 0.0;
            float comparisonValue = conditionValue ? ((1.0 - scalarValue4) * ((scalarValue2 < 0.0) ? (-1.0) : 1.0)) : scalarValue2;
            float comparisonValue1 = conditionValue ? (((scalarValue3 < 0.0) ? (-1.0) : 1.0) * sumValue) : scalarValue3;
            float inverseLengthValue = inversesqrt(dot(vec3(comparisonValue, comparisonValue1, sumValue1), vec3(comparisonValue, comparisonValue1, sumValue1)));
            float productValue3 = comparisonValue * inverseLengthValue;
            float productValue4 = comparisonValue1 * inverseLengthValue;
            float productValue5 = inverseLengthValue * sumValue1;
            float inverseLengthValue1 = inversesqrt(dot(vec3(productValue3, productValue4, productValue5), vec3(productValue3, productValue4, productValue5)));
            float productValue6 = inverseLengthValue1 * productValue3;
            float productValue7 = productValue4 * inverseLengthValue1;
            float productValue8 = inverseLengthValue1 * productValue5;
            float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[6u].z, productValue8, fma(fragmentVectorConstants1.packedValues[6u].y, productValue7, productValue6 * fragmentVectorConstants1.packedValues[6u].x));
            float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[7u].z, productValue8, fma(fragmentVectorConstants1.packedValues[7u].y, productValue7, productValue6 * fragmentVectorConstants1.packedValues[7u].x));
            float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[8u].z, productValue8, fma(fragmentVectorConstants1.packedValues[8u].y, productValue7, productValue6 * fragmentVectorConstants1.packedValues[8u].x));
            float inverseLengthValue2 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
            float productValue9 = inverseLengthValue2 * multiplyAddValue;
            float productValue10 = inverseLengthValue2 * multiplyAddValue1;
            float productValue11 = inverseLengthValue2 * multiplyAddValue2;
            float inverseLengthValue3 = inversesqrt(dot(vec3(quotientValue, quotientValue1, quotientValue2), vec3(quotientValue, quotientValue1, quotientValue2)));
            float productValue12 = inverseLengthValue3 * quotientValue;
            float productValue13 = inverseLengthValue3 * quotientValue1;
            float productValue14 = inverseLengthValue3 * quotientValue2;
            float dotProductValue = dot(vec3(productValue12, productValue13, productValue14), vec3(productValue9, productValue10, productValue11)) * 2.0;
            float productValue15 = productValue12 - (dotProductValue * productValue9);
            float productValue16 = productValue13 - (dotProductValue * productValue10);
            float productValue17 = productValue14 - (dotProductValue * productValue11);
            float inverseLengthValue4 = inversesqrt(dot(vec3(productValue15, productValue16, productValue17), vec3(productValue15, productValue16, productValue17)));
            float productValue18 = productValue15 * inverseLengthValue4;
            float productValue19 = productValue16 * inverseLengthValue4;
            float productValue20 = productValue17 * inverseLengthValue4;
            float productValue21 = (productValue20 * 1000.0) + quotientValue2;
            float productValue22;
            float productValue23;
            float sumValue3;
            if (productValue21 > fragmentVectorConstants1.packedValues[14u].x)
            {
                float sumValue2 = fragmentVectorConstants1.packedValues[14u].x - quotientValue2;
                float quotientValue3 = sumValue2 / productValue20;
                productValue22 = quotientValue3 * productValue18;
                productValue23 = quotientValue3 * productValue19;
                sumValue3 = sumValue2 + quotientValue2;
            }
            else
            {
                productValue22 = productValue18 * 1000.0;
                productValue23 = productValue19 * 1000.0;
                sumValue3 = productValue21;
            }
            precise float sumValue4 = quotientValue1 + productValue23;
            precise float sumValue5 = quotientValue + productValue22;
            float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[2u].w, sumValue3, fma(fragmentVectorConstants1.packedValues[1u].w, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[0u].w)) + fragmentVectorConstants1.packedValues[3u].w;
            float multiplyAddValue4 = ((((fma(fragmentVectorConstants1.packedValues[2u].x, sumValue3, fma(fragmentVectorConstants1.packedValues[1u].x, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[0u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue3) - varyingTexCoord1.x) * 0.5) * fragmentVectorConstants1.packedValues[16u].x;
            float multiplyAddValue5 = ((varyingTexCoord1.y - ((fma(fragmentVectorConstants1.packedValues[2u].y, sumValue3, fma(fragmentVectorConstants1.packedValues[1u].y, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[0u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue3)) * 0.5) * fragmentVectorConstants1.packedValues[16u].y;
            float multiplyAddValue6 = ((fma(fragmentVectorConstants1.packedValues[2u].z, sumValue3, fma(fragmentVectorConstants1.packedValues[1u].z, sumValue4, sumValue5 * fragmentVectorConstants1.packedValues[0u].z)) + fragmentVectorConstants1.packedValues[3u].z) / multiplyAddValue3) - scalarValue1;
            float nonlinearValue = fragmentVectorConstants1.packedValues[4u].x / sqrt((multiplyAddValue4 * multiplyAddValue4) + (multiplyAddValue5 * multiplyAddValue5));
            float productValue24 = (nonlinearValue * multiplyAddValue4) + (fragmentVectorConstants1.packedValues[16u].x * ((varyingTexCoord1.x * 0.5) + 0.5));
            float productValue25 = (nonlinearValue * multiplyAddValue5) + (fragmentVectorConstants1.packedValues[16u].y * (0.5 - (varyingTexCoord1.y * 0.5)));
            float productValue26 = (nonlinearValue * multiplyAddValue6) + scalarValue1;
            uint scalarValue5 = uint(int(floor(productValue24)));
            uint scalarValue6 = uint(int(floor(productValue25)));
            float intermediateValue3;
            uint intermediateValue14;
            uint intermediateValue16;
            uint intermediateValue18;
            bool intermediateValue20;
            if (int(scalarValue) > int(0u))
            {
                float intermediateValue23;
                float intermediateValue25;
                float intermediateValue27;
                uint intermediateValue29;
                uint intermediateValue31;
                uint intermediateValue33;
                uint intermediateValue35;
                float intermediateValue13;
                uint intermediateValue15;
                uint intermediateValue17;
                uint intermediateValue19;
                bool intermediateValue21;
                float scalarValue7 = productValue24;
                float scalarValue8 = productValue25;
                float scalarValue9 = productValue26;
                uint scalarValue10 = scalarValue5;
                uint scalarValue11 = scalarValue6;
                uint scalarValue12 = 0u;
                uint scalarValue13 = 0u;
                float sumValue6;
                float sumValue7;
                uint bitwiseValue3;
                uint bitwiseValue4;
                uint bitwiseValue5;
                bool intermediateValue36;
                bool intermediateValue37;
                float comparisonValue2;
                float quotientValue6;
                float comparisonValue3;
                float quotientValue7;
                bool intermediateValue38;
                for (;;)
                {
                    uint bitwiseValue = scalarValue13 & 31u;
                    uint bitwiseValue1 = uint(int(scalarValue10) >> int(bitwiseValue));
                    uint bitwiseValue2 = uint(int(scalarValue11) >> int(bitwiseValue));
                    vec4 sampledTextureValue4 = texelFetch(hiZBufferTexture, ivec2(uvec2(bitwiseValue1, bitwiseValue2)), int(scalarValue13));
                    sumValue6 = 1.0 - sampledTextureValue4.x;
                    sumValue7 = 1.0 - sampledTextureValue4.y;
                    bitwiseValue3 = bitwiseValue1 << bitwiseValue;
                    bitwiseValue4 = bitwiseValue2 << bitwiseValue;
                    bitwiseValue5 = 1u << bitwiseValue;
                    intermediateValue36 = multiplyAddValue4 > 0.0;
                    intermediateValue37 = multiplyAddValue5 > 0.0;
                    comparisonValue2 = float(int(bitwiseValue3 + (intermediateValue36 ? bitwiseValue5 : 0u)));
                    quotientValue6 = (comparisonValue2 - scalarValue7) / multiplyAddValue4;
                    comparisonValue3 = float(int(bitwiseValue4 + (intermediateValue37 ? bitwiseValue5 : 0u)));
                    quotientValue7 = (comparisonValue3 - scalarValue8) / multiplyAddValue5;
                    intermediateValue38 = quotientValue6 < quotientValue7;
                    float intermediateValue43;
                    float intermediateValue44;
                    float intermediateValue45;
                    uint comparisonValue6;
                    uint intermediateValue46;
                    if (intermediateValue38)
                    {
                        float productValue27 = (quotientValue6 * multiplyAddValue5) + scalarValue8;
                        intermediateValue43 = comparisonValue2;
                        intermediateValue44 = productValue27;
                        intermediateValue45 = quotientValue6;
                        comparisonValue6 = bitwiseValue3 + (intermediateValue36 ? bitwiseValue5 : 4294967295u);
                        intermediateValue46 = uint(int(floor(productValue27)));
                    }
                    else
                    {
                        float productValue28 = (quotientValue7 * multiplyAddValue4) + scalarValue7;
                        intermediateValue43 = productValue28;
                        intermediateValue44 = comparisonValue3;
                        intermediateValue45 = quotientValue7;
                        comparisonValue6 = uint(int(floor(productValue28)));
                        intermediateValue46 = bitwiseValue4 + (intermediateValue37 ? bitwiseValue5 : 4294967295u);
                    }
                    precise float productValue29 = multiplyAddValue6 * intermediateValue45;
                    precise float sumValue9 = scalarValue9 + productValue29;
                    float branchMergedValue;
                    float branchMergedValue1;
                    uint branchMergedValue2;
                    uint branchMergedValue3;
                    uint branchMergedValue4;
                    uint branchMergedValue5;
                    float branchMergedValue6;
                    if ((spvNMin(scalarValue9, sumValue9) <= sumValue7) && ((int(scalarValue12) > int(0u)) && (spvNMax(scalarValue9, sumValue9) >= sumValue6)))
                    {
                        if (scalarValue13 == 0u)
                        {
                            intermediateValue13 = scalarValue9;
                            intermediateValue15 = scalarValue10;
                            intermediateValue17 = scalarValue11;
                            intermediateValue19 = scalarValue12;
                            intermediateValue21 = true;
                            break;
                        }
                        branchMergedValue = scalarValue8;
                        branchMergedValue1 = scalarValue9;
                        branchMergedValue2 = scalarValue10;
                        branchMergedValue3 = scalarValue11;
                        branchMergedValue4 = scalarValue12;
                        branchMergedValue5 = scalarValue13 + 4294967295u;
                        branchMergedValue6 = scalarValue7;
                    }
                    else
                    {
                        if ((int(intermediateValue46) >= int(uint(int(fragmentVectorConstants1.packedValues[16u].y)))) || ((int(intermediateValue46 | comparisonValue6) < int(0u)) || (int(comparisonValue6) >= int(uint(int(fragmentVectorConstants1.packedValues[16u].x))))))
                        {
                            intermediateValue13 = scalarValue9;
                            intermediateValue15 = scalarValue10;
                            intermediateValue17 = scalarValue11;
                            intermediateValue19 = scalarValue12;
                            intermediateValue21 = false;
                            break;
                        }
                        branchMergedValue = intermediateValue44;
                        branchMergedValue1 = sumValue9;
                        branchMergedValue2 = comparisonValue6;
                        branchMergedValue3 = intermediateValue46;
                        branchMergedValue4 = scalarValue12 + 1u;
                        branchMergedValue5 = uint(int(scalarValue13 + 1u) < int(uint(int(fragmentVectorConstants1.packedValues[15u].x)))) + scalarValue13;
                        branchMergedValue6 = intermediateValue43;
                    }
                    intermediateValue25 = branchMergedValue;
                    intermediateValue27 = branchMergedValue1;
                    intermediateValue29 = branchMergedValue2;
                    intermediateValue31 = branchMergedValue3;
                    intermediateValue33 = branchMergedValue4;
                    intermediateValue35 = branchMergedValue5;
                    intermediateValue23 = branchMergedValue6;
                    if (int(intermediateValue33) < int(scalarValue))
                    {
                        scalarValue7 = intermediateValue23;
                        scalarValue8 = intermediateValue25;
                        scalarValue9 = intermediateValue27;
                        scalarValue10 = intermediateValue29;
                        scalarValue11 = intermediateValue31;
                        scalarValue12 = intermediateValue33;
                        scalarValue13 = intermediateValue35;
                        continue;
                    }
                    else
                    {
                        intermediateValue13 = intermediateValue27;
                        intermediateValue15 = intermediateValue29;
                        intermediateValue17 = intermediateValue31;
                        intermediateValue19 = intermediateValue33;
                        intermediateValue21 = false;
                        break;
                    }
                }
                intermediateValue3 = intermediateValue13;
                intermediateValue14 = intermediateValue15;
                intermediateValue16 = intermediateValue17;
                intermediateValue18 = intermediateValue19;
                intermediateValue20 = intermediateValue21;
            }
            else
            {
                intermediateValue3 = productValue26;
                intermediateValue14 = scalarValue5;
                intermediateValue16 = scalarValue6;
                intermediateValue18 = 0u;
                intermediateValue20 = false;
            }
            float branchMergedValue11;
            float branchMergedValue12;
            float branchMergedValue13;
            float branchMergedValue14;
            if (intermediateValue20)
            {
                float quotientValue4 = (float(int(intermediateValue14)) + 0.5) / fragmentVectorConstants1.packedValues[16u].x;
                float quotientValue5 = (float(int(intermediateValue16)) + 0.5) / fragmentVectorConstants1.packedValues[16u].y;
                float multiplyAddValue7 = fma(fragmentVectorConstants1.packedValues[8u].x, productValue20, fma(fragmentVectorConstants1.packedValues[7u].x, productValue19, productValue18 * fragmentVectorConstants1.packedValues[6u].x));
                float multiplyAddValue8 = fma(fragmentVectorConstants1.packedValues[8u].y, productValue20, fma(fragmentVectorConstants1.packedValues[7u].y, productValue19, productValue18 * fragmentVectorConstants1.packedValues[6u].y));
                float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[8u].z, productValue20, fma(fragmentVectorConstants1.packedValues[7u].z, productValue19, productValue18 * fragmentVectorConstants1.packedValues[6u].z));
                float quotientValue8 = spvNClamp(((float(int(intermediateValue18)) / float(int(scalarValue))) - fragmentVectorConstants1.packedValues[17u].z) / (1.0 - fragmentVectorConstants1.packedValues[17u].z), 0.0, 1.0);
                vec4 sampledTextureValue5 = texture(sampler2D(gbufferNormalTexture, gbufferNormalSampler), vec2(quotientValue4, quotientValue5));
                float scalarValue14 = sampledTextureValue5.x;
                float scalarValue15 = sampledTextureValue5.y;
                float sumValue10 = 1.0 - abs(scalarValue14);
                float scalarValue16 = abs(scalarValue15);
                float sumValue11 = sumValue10 - scalarValue16;
                bool conditionValue1 = sumValue11 < 0.0;
                float comparisonValue4 = conditionValue1 ? ((1.0 - scalarValue16) * ((scalarValue14 < 0.0) ? (-1.0) : 1.0)) : scalarValue14;
                float comparisonValue5 = conditionValue1 ? (((scalarValue15 < 0.0) ? (-1.0) : 1.0) * sumValue10) : scalarValue15;
                float inverseLengthValue5 = inversesqrt(dot(vec3(comparisonValue4, comparisonValue5, sumValue11), vec3(comparisonValue4, comparisonValue5, sumValue11)));
                float productValue30 = comparisonValue4 * inverseLengthValue5;
                float productValue31 = comparisonValue5 * inverseLengthValue5;
                float productValue32 = inverseLengthValue5 * sumValue11;
                float inverseLengthValue6 = inversesqrt(dot(vec3(productValue30, productValue31, productValue32), vec3(productValue30, productValue31, productValue32)));
                float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9), vec3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9)));
                branchMergedValue11 = spvNMin(spvNMin(spvNMin((1.0 - exp2(log2(abs((quotientValue5 * 2.0) + (-1.0))) * fragmentVectorConstants1.packedValues[17u].y)) * (1.0 - exp2((fragmentVectorConstants1.packedValues[17u].x * fragmentVectorConstants1.packedValues[14u].z) * log2(abs((quotientValue4 * 2.0) + (-1.0))))), 1.0 - ((quotientValue8 * quotientValue8) * (3.0 - (quotientValue8 * 2.0)))), spvNClamp(1.0 - dot(vec3(inverseLengthValue6 * productValue30, productValue31 * inverseLengthValue6, inverseLengthValue6 * productValue32), vec3(inverseLengthValue7 * multiplyAddValue7, inverseLengthValue7 * multiplyAddValue8, inverseLengthValue7 * multiplyAddValue9)), 0.0, 1.0)), 1.0 - ((spvNMax(sampledTextureValue1, fragmentVectorConstants1.packedValues[5u].y) - fragmentVectorConstants1.packedValues[5u].y) / (fragmentVectorConstants1.packedValues[5u].x - fragmentVectorConstants1.packedValues[5u].y)));
                branchMergedValue12 = intermediateValue3;
                branchMergedValue13 = quotientValue5;
                branchMergedValue14 = quotientValue4;
            }
            else
            {
                branchMergedValue11 = -1.0;
                branchMergedValue12 = 0.0;
                branchMergedValue13 = 0.0;
                branchMergedValue14 = 0.0;
            }
            branchMergedValue7 = branchMergedValue11;
            branchMergedValue8 = branchMergedValue12;
            branchMergedValue9 = branchMergedValue13;
            branchMergedValue10 = branchMergedValue14;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue = branchMergedValue10;
        intermediateValue1 = branchMergedValue9;
        intermediateValue2 = branchMergedValue8;
        intermediateValue4 = branchMergedValue7;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = intermediateValue;
    fragmentColor0.y = intermediateValue1;
    fragmentColor0.z = intermediateValue2;
    fragmentColor0.w = intermediateValue4;
#endif
}
