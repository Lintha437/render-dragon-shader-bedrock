#version 460
#extension GL_GOOGLE_include_directive : require
// Upscaling / TAAU / fragment forward pipeline.
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
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/Upscaling/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float productValue46 = rdEvaluateFloatExpression(uint(varyingTexCoord0.x * fragmentVectorConstants1.packedValues[3u].x)) + 0.5;
    float productValue47 = rdEvaluateFloatExpression(uint(varyingTexCoord0.y * fragmentVectorConstants1.packedValues[3u].y)) + 0.5;
    float multiplyAddValue = fma(productValue46, fragmentScalarConstants1.packedValues[8u], -fragmentVectorConstants1.packedValues[0u].x) - 0.5;
    float multiplyAddValue1 = fma(productValue47, fragmentScalarConstants1.packedValues[8u], -fragmentVectorConstants1.packedValues[0u].y) - 0.5;
    float scalarValue24 = roundEven(multiplyAddValue);
    float scalarValue25 = roundEven(multiplyAddValue1);
    uint scalarValue26 = uint(int(scalarValue24));
    uint scalarValue27 = uint(int(scalarValue25));
    vec4 sampledTextureValue13 = texelFetch(materialTexture1, ivec2(uvec2(scalarValue26, scalarValue27)), int(0u));
    float scalarValue28 = sampledTextureValue13.x;
    float scalarValue29 = sampledTextureValue13.y;
    float scalarValue30 = sampledTextureValue13.z;
    vec4 sampledTextureValue14 = texelFetch(materialTexture0, ivec2(uvec2(scalarValue26, scalarValue27)), int(0u));
    bool comparisonValue6 = fragmentVectorConstants1.packedValues[1u].w != 0.0;
    float intermediateValue18;
    float intermediateValue20;
    float productValue4;
    float productValue5;
    float productValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = float(uint(fragmentVectorConstants1.packedValues[3u].x * varyingTexCoord0.x)) + 0.5;
    float productValue1 = float(uint(fragmentVectorConstants1.packedValues[3u].y * varyingTexCoord0.y)) + 0.5;
    float productValue2 = ((productValue * fragmentVectorConstants1.packedValues[2u].x) - fragmentVectorConstants1.packedValues[0u].x) + (-0.5);
    float productValue3 = ((productValue1 * fragmentVectorConstants1.packedValues[2u].x) - fragmentVectorConstants1.packedValues[0u].y) + (-0.5);
    uint scalarValue = uint(int(roundEven(productValue2)));
    uint scalarValue1 = uint(int(roundEven(productValue3)));
    vec4 sampledTextureValue = texelFetch(inputFinalColorTexture, ivec2(uvec2(scalarValue, scalarValue1)), int(0u));
    float scalarValue2 = sampledTextureValue.x;
    float scalarValue3 = sampledTextureValue.y;
    float scalarValue4 = sampledTextureValue.z;
    vec4 sampledTextureValue1 = texelFetch(inputBufferMotionVectorsTexture, ivec2(uvec2(scalarValue, scalarValue1)), int(0u));
    float scalarValue5 = sampledTextureValue1.z;
    float sumValue1 = (-0.0) - sampledTextureValue1.w;
    float productValue7 = scalarValue2 * scalarValue2;
    float productValue8 = scalarValue3 * scalarValue3;
    float productValue9 = scalarValue4 * scalarValue4;
    float intermediateValue11;
    float intermediateValue13;
    float intermediateValue15;
    float intermediateValue17;
    float intermediateValue19;
    float intermediateValue21;
    float intermediateValue23;
#endif
    float intermediateValue25;
    float intermediateValue27;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue28;
#endif
    float intermediateValue29;
#if RD_PLATFORM == RD_PLATFORM_SM50
    intermediateValue18 = -sampledTextureValue14.w;
    intermediateValue20 = sampledTextureValue14.z;
    productValue4 = scalarValue30 * scalarValue30;
    productValue5 = scalarValue29 * scalarValue29;
    productValue6 = scalarValue28 * scalarValue28;
    intermediateValue25 = scalarValue30;
    intermediateValue27 = scalarValue29;
    intermediateValue29 = scalarValue28;
    uint sumValue;
    float intermediateValue19;
    float intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    float intermediateValue24;
    float intermediateValue26;
    float intermediateValue28;
#endif
    float intermediateValue30;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue31;
    float intermediateValue32;
    float intermediateValue33;
    float intermediateValue34;
    uint intermediateValue35;
    float scalarValue6 = scalarValue5;
    float scalarValue7 = sumValue1;
    float scalarValue8 = scalarValue2;
    float scalarValue9 = scalarValue3;
    float scalarValue10 = scalarValue4;
    float scalarValue11 = productValue7;
    float scalarValue12 = productValue8;
    float scalarValue13 = productValue9;
#endif
    uint scalarValue14 = 4294967295u;
    for (;;)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        if (int(scalarValue14) > int(1u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue27 = scalarValue6;
        intermediateValue28 = scalarValue7;
        intermediateValue29 = scalarValue8;
        intermediateValue30 = scalarValue9;
        intermediateValue31 = scalarValue10;
        intermediateValue32 = scalarValue11;
        intermediateValue33 = scalarValue12;
        intermediateValue34 = scalarValue13;
        intermediateValue35 = 4294967295u;
        bool comparisonValue;
        for (;;)
        {
            comparisonValue = (intermediateValue35 | scalarValue14) == 0u;
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            float branchMergedValue3;
            float branchMergedValue4;
            float branchMergedValue5;
            float branchMergedValue6;
            float branchMergedValue7;
            if (comparisonValue)
            {
                branchMergedValue = intermediateValue31;
                branchMergedValue1 = intermediateValue32;
                branchMergedValue2 = intermediateValue33;
                branchMergedValue3 = intermediateValue34;
                branchMergedValue4 = intermediateValue27;
                branchMergedValue5 = intermediateValue28;
                branchMergedValue6 = intermediateValue29;
                branchMergedValue7 = intermediateValue30;
            }
            else
            {
                uint sumValue2 = scalarValue14 + scalarValue;
                uint sumValue3 = intermediateValue35 + scalarValue1;
                vec4 sampledTextureValue2 = texelFetch(inputFinalColorTexture, ivec2(uvec2(sumValue2, sumValue3)), int(0u));
                float scalarValue15 = sampledTextureValue2.x;
                float scalarValue16 = sampledTextureValue2.y;
                float scalarValue17 = sampledTextureValue2.z;
                vec4 sampledTextureValue3 = texelFetch(inputBufferMotionVectorsTexture, ivec2(uvec2(sumValue2, sumValue3)), int(0u));
                float scalarValue18 = sampledTextureValue3.z;
                float sumValue4 = scalarValue15 + intermediateValue29;
                float sumValue5 = scalarValue16 + intermediateValue30;
                float sumValue6 = scalarValue17 + intermediateValue31;
                float productValue10 = (scalarValue15 * scalarValue15) + intermediateValue32;
                float productValue11 = (scalarValue16 * scalarValue16) + intermediateValue33;
                float productValue12 = (scalarValue17 * scalarValue17) + intermediateValue34;
                float branchMergedValue14;
                float branchMergedValue15;
                float branchMergedValue16;
                float branchMergedValue17;
                float branchMergedValue18;
                float branchMergedValue19;
                float branchMergedValue20;
                float branchMergedValue21;
                if (fragmentVectorConstants1.packedValues[1u].w != 0.0)
                {
                    float branchMergedValue25;
                    float branchMergedValue26;
                    float branchMergedValue27;
                    float branchMergedValue28;
                    float branchMergedValue29;
                    float branchMergedValue30;
                    float branchMergedValue31;
                    float branchMergedValue32;
                    if (dot(vec2(scalarValue18, sampledTextureValue3.w), vec2(scalarValue18, sampledTextureValue3.w)) > dot(vec2(intermediateValue27, intermediateValue28), vec2(intermediateValue27, intermediateValue28)))
                    {
                        branchMergedValue25 = sumValue6;
                        branchMergedValue26 = productValue10;
                        branchMergedValue27 = productValue11;
                        branchMergedValue28 = productValue12;
                        branchMergedValue29 = scalarValue18;
                        branchMergedValue30 = sampledTextureValue3.w;
                        branchMergedValue31 = sumValue4;
                        branchMergedValue32 = sumValue5;
                    }
                    else
                    {
                        branchMergedValue25 = sumValue6;
                        branchMergedValue26 = productValue10;
                        branchMergedValue27 = productValue11;
                        branchMergedValue28 = productValue12;
                        branchMergedValue29 = intermediateValue27;
                        branchMergedValue30 = intermediateValue28;
                        branchMergedValue31 = sumValue4;
                        branchMergedValue32 = sumValue5;
                    }
                    branchMergedValue14 = branchMergedValue25;
                    branchMergedValue15 = branchMergedValue26;
                    branchMergedValue16 = branchMergedValue27;
                    branchMergedValue17 = branchMergedValue28;
                    branchMergedValue18 = branchMergedValue29;
                    branchMergedValue19 = branchMergedValue30;
                    branchMergedValue20 = branchMergedValue31;
                    branchMergedValue21 = branchMergedValue32;
                }
                else
                {
                    branchMergedValue14 = sumValue6;
                    branchMergedValue15 = productValue10;
                    branchMergedValue16 = productValue11;
                    branchMergedValue17 = productValue12;
                    branchMergedValue18 = intermediateValue27;
                    branchMergedValue19 = intermediateValue28;
                    branchMergedValue20 = sumValue4;
                    branchMergedValue21 = sumValue5;
                }
                branchMergedValue = branchMergedValue14;
                branchMergedValue1 = branchMergedValue15;
                branchMergedValue2 = branchMergedValue16;
                branchMergedValue3 = branchMergedValue17;
                branchMergedValue4 = branchMergedValue18;
                branchMergedValue5 = branchMergedValue19;
                branchMergedValue6 = branchMergedValue20;
                branchMergedValue7 = branchMergedValue21;
            }
            intermediateValue19 = branchMergedValue;
            intermediateValue21 = branchMergedValue1;
            intermediateValue23 = branchMergedValue2;
            intermediateValue25 = branchMergedValue3;
            intermediateValue11 = branchMergedValue4;
            intermediateValue13 = branchMergedValue5;
            intermediateValue15 = branchMergedValue6;
            intermediateValue17 = branchMergedValue7;
            uint sumValue7 = intermediateValue35 + 1u;
            if (sumValue7 == 2u)
            {
                break;
            }
            else
            {
                intermediateValue27 = intermediateValue11;
                intermediateValue28 = intermediateValue13;
                intermediateValue29 = intermediateValue15;
                intermediateValue30 = intermediateValue17;
                intermediateValue31 = intermediateValue19;
                intermediateValue32 = intermediateValue21;
                intermediateValue33 = intermediateValue23;
                intermediateValue34 = intermediateValue25;
                intermediateValue35 = sumValue7;
                continue;
            }
        }
        uint sumValue8 = scalarValue14 + 1u;
        if (sumValue8 == 2u)
#endif
        {
            break;
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        bool comparisonValue7 = scalarValue14 == 0u;
        intermediateValue19 = intermediateValue18;
        intermediateValue21 = intermediateValue20;
        intermediateValue22 = productValue4;
        intermediateValue23 = productValue5;
        intermediateValue24 = productValue6;
        intermediateValue26 = intermediateValue25;
        intermediateValue28 = intermediateValue27;
        intermediateValue30 = intermediateValue29;
        float intermediateValue33;
        float intermediateValue34;
        float intermediateValue35;
        float intermediateValue36;
        float intermediateValue37;
        float intermediateValue38;
        float intermediateValue39;
        float intermediateValue40;
        uint sumValue9;
        uint scalarValue31 = 4294967295u;
        for (;;)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        else
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            if (int(scalarValue31) > int(1u))
            {
                break;
            }
            if (comparisonValue7 && (scalarValue31 == 0u))
            {
                sumValue9 = 1u;
                intermediateValue40 = intermediateValue30;
                intermediateValue39 = intermediateValue28;
                intermediateValue38 = intermediateValue26;
                intermediateValue37 = intermediateValue24;
                intermediateValue36 = intermediateValue23;
                intermediateValue35 = intermediateValue22;
                intermediateValue34 = intermediateValue21;
                intermediateValue33 = intermediateValue19;
                intermediateValue19 = intermediateValue33;
                intermediateValue21 = intermediateValue34;
                intermediateValue22 = intermediateValue35;
                intermediateValue23 = intermediateValue36;
                intermediateValue24 = intermediateValue37;
                intermediateValue26 = intermediateValue38;
                intermediateValue28 = intermediateValue39;
                intermediateValue30 = intermediateValue40;
                scalarValue31 = sumValue9;
                continue;
            }
            uint sumValue31 = scalarValue26 + scalarValue14;
            uint sumValue32 = scalarValue31 + scalarValue27;
            vec4 sampledTextureValue15 = texelFetch(materialTexture1, ivec2(uvec2(sumValue31, sumValue32)), int(0u));
            float scalarValue32 = sampledTextureValue15.x;
            float scalarValue33 = sampledTextureValue15.y;
            float scalarValue34 = sampledTextureValue15.z;
            vec4 sampledTextureValue16 = texelFetch(materialTexture0, ivec2(uvec2(sumValue31, sumValue32)), int(0u));
            float scalarValue35 = sampledTextureValue16.z;
            vec2 vectorValue = vec2(scalarValue35, sampledTextureValue16.w);
            vec2 vectorValue1 = vec2(intermediateValue21, intermediateValue19);
            bool bitwiseValue = comparisonValue6 && (rdDot2Precise(vectorValue1, vectorValue1) < rdDot2Precise(vectorValue, vectorValue));
            sumValue9 = scalarValue31 + 1u;
            intermediateValue40 = intermediateValue30 + scalarValue32;
            intermediateValue39 = intermediateValue28 + scalarValue33;
            intermediateValue38 = intermediateValue26 + scalarValue34;
            intermediateValue37 = fma(scalarValue32, scalarValue32, intermediateValue24);
            intermediateValue36 = fma(scalarValue33, scalarValue33, intermediateValue23);
            intermediateValue35 = fma(scalarValue34, scalarValue34, intermediateValue22);
            intermediateValue34 = bitwiseValue ? scalarValue35 : intermediateValue21;
            intermediateValue33 = bitwiseValue ? sampledTextureValue16.w : intermediateValue19;
            intermediateValue19 = intermediateValue33;
            intermediateValue21 = intermediateValue34;
            intermediateValue22 = intermediateValue35;
            intermediateValue23 = intermediateValue36;
            intermediateValue24 = intermediateValue37;
            intermediateValue26 = intermediateValue38;
            intermediateValue28 = intermediateValue39;
            intermediateValue30 = intermediateValue40;
            scalarValue31 = sumValue9;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            scalarValue6 = intermediateValue11;
            scalarValue7 = intermediateValue13;
            scalarValue8 = intermediateValue15;
            scalarValue9 = intermediateValue17;
            scalarValue10 = intermediateValue19;
            scalarValue11 = intermediateValue21;
            scalarValue12 = intermediateValue23;
            scalarValue13 = intermediateValue25;
            scalarValue14 = sumValue8;
#endif
            continue;
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        sumValue = scalarValue14 + 1u;
        intermediateValue18 = intermediateValue19;
        intermediateValue20 = intermediateValue21;
        productValue4 = intermediateValue22;
        productValue5 = intermediateValue23;
        productValue6 = intermediateValue24;
        intermediateValue25 = intermediateValue26;
        intermediateValue27 = intermediateValue28;
        intermediateValue29 = intermediateValue30;
        scalarValue14 = sumValue;
        continue;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float productValue48 = intermediateValue20 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue49 = intermediateValue18 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue50 = intermediateValue29 * 0.111111111938953399658203125;
    float productValue51 = intermediateValue27 * 0.111111111938953399658203125;
    float productValue52 = intermediateValue25 * 0.111111111938953399658203125;
    vec2 vectorValue2 = vec2(productValue48, productValue49);
    float nonlinearValue4 = spvNMin(sqrt(rdDot2Precise(vectorValue2, vectorValue2)), 1.0);
    float multiplyAddValue2 = (nonlinearValue4 * nonlinearValue4) * fma(nonlinearValue4, -2.0, 3.0);
    float multiplyAddValue3 = fma(multiplyAddValue2, fragmentScalarConstants1.packedValues[4u] - fragmentScalarConstants1.packedValues[5u], fragmentScalarConstants1.packedValues[5u]);
    float multiplyAddValue4 = sqrt(spvNMax(fma(productValue6, 0.111111111938953399658203125, -(productValue50 * productValue50)), 0.0)) * multiplyAddValue3;
    float multiplyAddValue5 = sqrt(spvNMax(fma(productValue5, 0.111111111938953399658203125, -(productValue51 * productValue51)), 0.0)) * multiplyAddValue3;
    float multiplyAddValue6 = sqrt(spvNMax(fma(productValue4, 0.111111111938953399658203125, -(productValue52 * productValue52)), 0.0)) * multiplyAddValue3;
    float multiplyAddValue7 = fma(intermediateValue29, 0.111111111938953399658203125, -multiplyAddValue4);
    float multiplyAddValue8 = fma(intermediateValue27, 0.111111111938953399658203125, -multiplyAddValue5);
    float multiplyAddValue9 = fma(intermediateValue25, 0.111111111938953399658203125, -multiplyAddValue6);
    float multiplyAddValue10 = fma(intermediateValue29, 0.111111111938953399658203125, multiplyAddValue4);
    float multiplyAddValue11 = fma(intermediateValue27, 0.111111111938953399658203125, multiplyAddValue5);
    float multiplyAddValue12 = fma(intermediateValue25, 0.111111111938953399658203125, multiplyAddValue6);
    float multiplyAddValue13 = spvNMin(fragmentVectorConstants1.packedValues[3u].x - 1.0, spvNMax(fma(-productValue48, fragmentScalarConstants1.packedValues[9u], productValue46), 0.0));
    float multiplyAddValue14 = spvNMin(fragmentVectorConstants1.packedValues[3u].y - 1.0, spvNMax(fma(-productValue49, fragmentScalarConstants1.packedValues[9u], productValue47), 0.0));
    float sumValue33 = floor(multiplyAddValue13 - 0.5);
    float sumValue34 = floor(multiplyAddValue14 - 0.5);
    float sumValue35 = sumValue33 + 0.5;
    float sumValue36 = sumValue34 + 0.5;
    float sumValue37 = spvNClamp(multiplyAddValue13 - sumValue35, 0.0, 1.0);
    float sumValue38 = spvNClamp(multiplyAddValue14 - sumValue36, 0.0, 1.0);
    float productValue53 = sumValue38 * sumValue38;
    float productValue54 = sumValue37 * sumValue37;
    float multiplyAddValue15 = fma(-fma(productValue54, sumValue37, sumValue37), 0.5, productValue54);
    float multiplyAddValue16 = fma(-fma(productValue53, sumValue38, sumValue38), 0.5, productValue53);
    float multiplyAddValue17 = fma(sumValue37 * productValue54, 1.5, -(productValue54 * 2.5)) + 1.0;
    float multiplyAddValue18 = fma(sumValue38 * productValue53, 1.5, -(productValue53 * 2.5)) + 1.0;
    float multiplyAddValue19 = fma(productValue53, sumValue38, -productValue53);
    float multiplyAddValue20 = fma(productValue54, sumValue37, -productValue54);
    float productValue55 = multiplyAddValue19 * 0.5;
    float productValue56 = multiplyAddValue20 * 0.5;
    float multiplyAddValue21 = fma(-multiplyAddValue20, 0.5, (1.0 - multiplyAddValue15) - multiplyAddValue17);
    float multiplyAddValue22 = fma(-multiplyAddValue19, 0.5, (1.0 - multiplyAddValue16) - multiplyAddValue18);
    float sumValue39 = multiplyAddValue21 + multiplyAddValue17;
    float sumValue40 = multiplyAddValue22 + multiplyAddValue18;
    float productValue57 = (sumValue33 - 0.5) * fragmentVectorConstants1.packedValues[4u].x;
    float productValue58 = (sumValue34 - 0.5) * fragmentVectorConstants1.packedValues[4u].y;
    float quotientValue7 = ((multiplyAddValue22 / sumValue40) + sumValue36) * fragmentVectorConstants1.packedValues[4u].y;
    float quotientValue8 = ((multiplyAddValue21 / sumValue39) + sumValue35) * fragmentVectorConstants1.packedValues[4u].x;
    float productValue59 = (sumValue33 + 2.5) * fragmentVectorConstants1.packedValues[4u].x;
    float productValue60 = (sumValue34 + 2.5) * fragmentVectorConstants1.packedValues[4u].y;
    vec4 sampledTextureValue17 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(productValue57, productValue58), 0.0);
    float productValue61 = multiplyAddValue16 * multiplyAddValue15;
    vec4 sampledTextureValue18 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(productValue57, quotientValue7), 0.0);
    float productValue62 = sumValue40 * multiplyAddValue15;
    float productValue63 = sumValue39 * multiplyAddValue16;
    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(productValue57, productValue60), 0.0);
    float productValue64 = productValue55 * multiplyAddValue15;
    float productValue65 = productValue56 * multiplyAddValue16;
    vec4 sampledTextureValue20 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(quotientValue8, productValue58), 0.0);
    vec4 sampledTextureValue21 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(quotientValue8, quotientValue7), 0.0);
    float productValue66 = sumValue40 * sumValue39;
    vec4 sampledTextureValue22 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(quotientValue8, productValue60), 0.0);
    float productValue67 = productValue55 * sumValue39;
    float productValue68 = productValue56 * sumValue40;
    vec4 sampledTextureValue23 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(productValue59, productValue58), 0.0);
    vec4 sampledTextureValue24 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(productValue59, quotientValue7), 0.0);
    vec4 sampledTextureValue25 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(productValue59, productValue60), 0.0);
    float productValue69 = productValue55 * productValue56;
    float multiplyAddValue23 = spvNMax(fma(sampledTextureValue25.x, productValue69, fma(sampledTextureValue24.x, productValue68, fma(sampledTextureValue23.x, productValue65, fma(sampledTextureValue22.x, productValue67, fma(sampledTextureValue21.x, productValue66, fma(sampledTextureValue20.x, productValue63, fma(sampledTextureValue19.x, productValue64, fma(sampledTextureValue17.x, productValue61, productValue62 * sampledTextureValue18.x)))))))), 0.0);
    float multiplyAddValue24 = spvNMax(fma(sampledTextureValue25.y, productValue69, fma(sampledTextureValue24.y, productValue68, fma(sampledTextureValue23.y, productValue65, fma(sampledTextureValue22.y, productValue67, fma(sampledTextureValue21.y, productValue66, fma(sampledTextureValue20.y, productValue63, fma(sampledTextureValue19.y, productValue64, fma(sampledTextureValue17.y, productValue61, productValue62 * sampledTextureValue18.y)))))))), 0.0);
    float multiplyAddValue25 = spvNMax(fma(sampledTextureValue25.z, productValue69, fma(sampledTextureValue24.z, productValue68, fma(sampledTextureValue23.z, productValue65, fma(sampledTextureValue22.z, productValue67, fma(sampledTextureValue21.z, productValue66, fma(sampledTextureValue20.z, productValue63, fma(sampledTextureValue19.z, productValue64, fma(sampledTextureValue17.z, productValue61, productValue62 * sampledTextureValue18.z)))))))), 0.0);
    float intermediateValue44;
    float intermediateValue45;
    float intermediateValue46;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue13 = fragmentVectorConstants1.packedValues[5u].x * intermediateValue11;
    float productValue14 = fragmentVectorConstants1.packedValues[5u].y * intermediateValue13;
    float productValue15 = intermediateValue15 * 0.111111111938953399658203125;
    float productValue16 = intermediateValue17 * 0.111111111938953399658203125;
    float productValue17 = intermediateValue19 * 0.111111111938953399658203125;
    float dotProductValue = spvNClamp(sqrt(dot(vec2(productValue13, productValue14), vec2(productValue13, productValue14))), 0.0, 1.0);
    float productValue18 = (dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0));
    float productValue19 = ((fragmentVectorConstants1.packedValues[1u].x - fragmentVectorConstants1.packedValues[1u].y) * productValue18) + fragmentVectorConstants1.packedValues[1u].y;
    float nonlinearValue = productValue19 * sqrt(spvNMax(0.0, (intermediateValue21 * 0.111111111938953399658203125) - (productValue15 * productValue15)));
    float nonlinearValue1 = productValue19 * sqrt(spvNMax(0.0, (intermediateValue23 * 0.111111111938953399658203125) - (productValue16 * productValue16)));
    float nonlinearValue2 = productValue19 * sqrt(spvNMax(0.0, (intermediateValue25 * 0.111111111938953399658203125) - (productValue17 * productValue17)));
    float sumValue10 = productValue15 - nonlinearValue;
    float sumValue11 = productValue16 - nonlinearValue1;
    float sumValue12 = productValue17 - nonlinearValue2;
    float sumValue13 = nonlinearValue + productValue15;
    float sumValue15 = nonlinearValue1 + productValue16;
    float sumValue16 = nonlinearValue2 + productValue17;
    float productValue20 = spvNMin(spvNMax(productValue - (productValue13 * fragmentVectorConstants1.packedValues[2u].y), 0.0), fragmentVectorConstants1.packedValues[3u].x + (-1.0));
    float productValue21 = spvNMin(spvNMax(productValue1 - (productValue14 * fragmentVectorConstants1.packedValues[2u].y), 0.0), fragmentVectorConstants1.packedValues[3u].y + (-1.0));
    float sumValue17 = floor(productValue20 + (-0.5));
    float sumValue18 = floor(productValue21 + (-0.5));
    float sumValue19 = sumValue17 + 0.5;
    float sumValue20 = sumValue18 + 0.5;
    float sumValue21 = spvNMin(spvNMax(productValue20 - sumValue19, 0.0), 1.0);
    float sumValue22 = spvNMin(spvNMax(productValue21 - sumValue20, 0.0), 1.0);
    float productValue22 = sumValue21 * sumValue21;
    float productValue23 = sumValue22 * sumValue22;
    float productValue24 = productValue22 * sumValue21;
    float productValue25 = productValue23 * sumValue22;
    float productValue26 = productValue22 - ((productValue24 + sumValue21) * 0.5);
    float productValue27 = productValue23 - ((productValue25 + sumValue22) * 0.5);
    float productValue28 = (sumValue21 * 0.5) * (productValue22 - sumValue21);
    float productValue29 = (sumValue22 * 0.5) * (productValue23 - sumValue22);
    float sumValue23 = (1.0 - productValue28) - productValue26;
    float sumValue24 = (1.0 - productValue29) - productValue27;
    float productValue30 = (sumValue17 + (-0.5)) * fragmentVectorConstants1.packedValues[4u].x;
    float productValue31 = (sumValue18 + (-0.5)) * fragmentVectorConstants1.packedValues[4u].y;
    float quotientValue = ((((((productValue22 * 2.5) + (-1.0)) - (productValue24 * 1.5)) + sumValue23) / sumValue23) + sumValue19) * fragmentVectorConstants1.packedValues[4u].x;
    float quotientValue1 = ((((((productValue23 * 2.5) + (-1.0)) - (productValue25 * 1.5)) + sumValue24) / sumValue24) + sumValue20) * fragmentVectorConstants1.packedValues[4u].y;
    float productValue32 = (sumValue17 + 2.5) * fragmentVectorConstants1.packedValues[4u].x;
    float productValue33 = (sumValue18 + 2.5) * fragmentVectorConstants1.packedValues[4u].y;
    vec4 sampledTextureValue4 = textureLod(sampler2D(inputTaaHistoryTexture, inputTaaHistorySampler), vec2(productValue30, productValue31), 0.0);
    float productValue34 = productValue27 * productValue26;
    vec4 sampledTextureValue5 = textureLod(sampler2D(inputTaaHistoryTexture, inputTaaHistorySampler), vec2(productValue30, quotientValue1), 0.0);
    float productValue35 = sumValue24 * productValue26;
    vec4 sampledTextureValue6 = textureLod(sampler2D(inputTaaHistoryTexture, inputTaaHistorySampler), vec2(productValue30, productValue33), 0.0);
    float productValue36 = productValue26 * productValue29;
    vec4 sampledTextureValue7 = textureLod(sampler2D(inputTaaHistoryTexture, inputTaaHistorySampler), vec2(quotientValue, productValue31), 0.0);
    float productValue37 = sumValue23 * productValue27;
    vec4 sampledTextureValue8 = textureLod(sampler2D(inputTaaHistoryTexture, inputTaaHistorySampler), vec2(quotientValue, quotientValue1), 0.0);
    float productValue38 = sumValue24 * sumValue23;
    vec4 sampledTextureValue9 = textureLod(sampler2D(inputTaaHistoryTexture, inputTaaHistorySampler), vec2(quotientValue, productValue33), 0.0);
    float productValue39 = sumValue23 * productValue29;
    vec4 sampledTextureValue10 = textureLod(sampler2D(inputTaaHistoryTexture, inputTaaHistorySampler), vec2(productValue32, productValue31), 0.0);
    float productValue40 = productValue27 * productValue28;
    vec4 sampledTextureValue11 = textureLod(sampler2D(inputTaaHistoryTexture, inputTaaHistorySampler), vec2(productValue32, quotientValue1), 0.0);
    float productValue41 = sumValue24 * productValue28;
    vec4 sampledTextureValue12 = textureLod(sampler2D(inputTaaHistoryTexture, inputTaaHistorySampler), vec2(productValue32, productValue33), 0.0);
    float productValue42 = productValue29 * productValue28;
    float productValue43 = spvNMax(0.0, ((((((((sampledTextureValue5.x * productValue35) + (sampledTextureValue4.x * productValue34)) + (sampledTextureValue6.x * productValue36)) + (sampledTextureValue7.x * productValue37)) + (sampledTextureValue8.x * productValue38)) + (sampledTextureValue9.x * productValue39)) + (sampledTextureValue10.x * productValue40)) + (sampledTextureValue11.x * productValue41)) + (sampledTextureValue12.x * productValue42));
    float productValue44 = spvNMax(0.0, ((((((((sampledTextureValue5.y * productValue35) + (sampledTextureValue4.y * productValue34)) + (sampledTextureValue6.y * productValue36)) + (sampledTextureValue7.y * productValue37)) + (sampledTextureValue8.y * productValue38)) + (sampledTextureValue9.y * productValue39)) + (sampledTextureValue10.y * productValue40)) + (sampledTextureValue11.y * productValue41)) + (sampledTextureValue12.y * productValue42));
    float productValue45 = spvNMax(0.0, ((((((((sampledTextureValue5.z * productValue35) + (sampledTextureValue4.z * productValue34)) + (sampledTextureValue6.z * productValue36)) + (sampledTextureValue7.z * productValue37)) + (sampledTextureValue8.z * productValue38)) + (sampledTextureValue9.z * productValue39)) + (sampledTextureValue10.z * productValue40)) + (sampledTextureValue11.z * productValue41)) + (sampledTextureValue12.z * productValue42));
    float intermediateValue40;
    float intermediateValue41;
    float intermediateValue42;
#endif
    if (fragmentVectorConstants1.packedValues[1u].z != 0.0)
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        float multiplyAddValue26;
        float multiplyAddValue27;
        float multiplyAddValue28;
        if ((((multiplyAddValue10 < multiplyAddValue23) || (multiplyAddValue11 < multiplyAddValue24)) || (multiplyAddValue12 < multiplyAddValue25)) || ((multiplyAddValue25 < multiplyAddValue9) || ((multiplyAddValue23 < multiplyAddValue7) || (multiplyAddValue24 < multiplyAddValue8))))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue8;
        float branchMergedValue10;
        float branchMergedValue11;
        if ((((productValue43 > sumValue13) || (productValue44 > sumValue15)) || (productValue45 > sumValue16)) || (((productValue43 < sumValue10) || (productValue44 < sumValue11)) || (productValue45 < sumValue12)))
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float sumValue41 = scalarValue28 - multiplyAddValue23;
            float sumValue42 = scalarValue29 - multiplyAddValue24;
            float sumValue43 = scalarValue30 - multiplyAddValue25;
            vec3 vectorValue3 = vec3(sumValue41, sumValue42, sumValue43);
            float nonlinearValue5 = sqrt(rdDot3Precise2(vectorValue3, vectorValue3));
            bool conditionValue1 = nonlinearValue5 > 0.0;
            float comparisonValue8 = conditionValue1 ? (sumValue41 / nonlinearValue5) : sumValue41;
            float comparisonValue9 = conditionValue1 ? (sumValue42 / nonlinearValue5) : sumValue42;
            float comparisonValue10 = conditionValue1 ? (sumValue43 / nonlinearValue5) : sumValue43;
            uint intermediateValue47;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float intermediateValue[3];
            intermediateValue[0u] = sumValue13;
            intermediateValue[1u] = sumValue15;
            intermediateValue[2u] = sumValue16;
            float intermediateValue1[3];
            intermediateValue1[0u] = sumValue10;
            intermediateValue1[1u] = sumValue11;
            intermediateValue1[2u] = sumValue12;
            float intermediateValue2[3];
            intermediateValue2[0u] = productValue43;
            intermediateValue2[1u] = productValue44;
            intermediateValue2[2u] = productValue45;
            float sumValue25 = scalarValue2 - productValue43;
            float sumValue26 = scalarValue3 - productValue44;
            float sumValue28 = scalarValue4 - productValue45;
            float intermediateValue3[3];
            intermediateValue3[0u] = sumValue25;
            intermediateValue3[1u] = sumValue26;
            intermediateValue3[2u] = sumValue28;
            float nonlinearValue3 = sqrt(((sumValue26 * sumValue26) + (sumValue25 * sumValue25)) + (sumValue28 * sumValue28));
            float intermediateValue43;
            float intermediateValue44;
            float intermediateValue45;
            if (nonlinearValue3 > 0.0)
            {
                float quotientValue2 = sumValue25 / nonlinearValue3;
                float quotientValue3 = sumValue26 / nonlinearValue3;
                float quotientValue4 = sumValue28 / nonlinearValue3;
                intermediateValue3[0u] = quotientValue2;
                intermediateValue3[1u] = quotientValue3;
                intermediateValue3[2u] = quotientValue4;
                intermediateValue43 = quotientValue4;
                intermediateValue44 = quotientValue3;
                intermediateValue45 = quotientValue2;
            }
            else
            {
                intermediateValue43 = sumValue28;
                intermediateValue44 = sumValue26;
                intermediateValue45 = sumValue25;
            }
            uint sumValue27;
#endif
            float intermediateValue48;
            float intermediateValue50;
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue47 = 0u;
            intermediateValue48 = 65000.0;
            intermediateValue50 = -65000.0;
            uint sumValue14;
            uint comparisonValue5;
            float intermediateValue49;
            float intermediateValue51;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint intermediateValue52;
            float scalarValue19 = intermediateValue45;
            float scalarValue20 = -65000.0;
            float scalarValue21 = 65000.0;
#endif
            uint scalarValue22 = 0u;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            uint scalarValue23 = 0u;
            bool intermediateValue54;
#endif
            for (;;)
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                if (int(scalarValue22) >= int(3u))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                intermediateValue54 = abs(scalarValue19) > fragmentVectorConstants1.packedValues[2u].z;
                if (intermediateValue54)
                {
                    float quotientValue5 = (intermediateValue1[scalarValue23] - intermediateValue2[scalarValue23]) / scalarValue19;
                    float quotientValue6 = (intermediateValue[scalarValue23] - intermediateValue2[scalarValue23]) / scalarValue19;
                    bool conditionValue = quotientValue5 > quotientValue6;
                    float comparisonValue1 = conditionValue ? quotientValue6 : quotientValue5;
                    float comparisonValue2 = conditionValue ? quotientValue5 : quotientValue6;
                    float comparisonValue3 = (comparisonValue1 > scalarValue20) ? comparisonValue1 : scalarValue20;
                    float comparisonValue4 = (comparisonValue2 < scalarValue21) ? comparisonValue2 : scalarValue21;
                    uint branchMergedValue9;
                    float branchMergedValue12;
                    float branchMergedValue13;
                    if (comparisonValue4 < 0.0)
                    {
                        branchMergedValue9 = 1u;
                        branchMergedValue12 = comparisonValue4;
                        branchMergedValue13 = comparisonValue3;
                    }
                    else
                    {
                        branchMergedValue9 = (comparisonValue3 > comparisonValue4) ? 1u : scalarValue22;
                        branchMergedValue12 = comparisonValue4;
                        branchMergedValue13 = comparisonValue3;
                    }
                    intermediateValue48 = branchMergedValue13;
                    intermediateValue50 = branchMergedValue12;
                    intermediateValue52 = branchMergedValue9;
                }
                else
                {
                    intermediateValue48 = scalarValue20;
                    intermediateValue50 = scalarValue21;
                    intermediateValue52 = ((intermediateValue2[scalarValue23] < intermediateValue1[scalarValue23]) || (intermediateValue2[scalarValue23] > intermediateValue[scalarValue23])) ? 1u : scalarValue22;
                }
                sumValue27 = scalarValue23 + 1u;
                if (sumValue27 == 3u)
#endif
                {
                    break;
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                bool comparisonValue11 = scalarValue22 == 0u;
                bool comparisonValue12 = scalarValue22 == 1u;
                bool comparisonValue13 = scalarValue22 == 2u;
                float comparisonValue14 = comparisonValue13 ? comparisonValue10 : (comparisonValue12 ? comparisonValue9 : (comparisonValue11 ? comparisonValue8 : 0.0));
                if (fragmentScalarConstants1.packedValues[10u] < abs(comparisonValue14))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                scalarValue19 = intermediateValue3[sumValue27];
                scalarValue20 = intermediateValue48;
                scalarValue21 = intermediateValue50;
                scalarValue22 = intermediateValue52;
                scalarValue23 = sumValue27;
                continue;
            }
            float branchMergedValue22;
            float branchMergedValue23;
            float branchMergedValue24;
            if (intermediateValue52 == 0u)
            {
                float branchMergedValue33;
                float branchMergedValue34;
                float branchMergedValue35;
                if (intermediateValue48 > 0.0)
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    float comparisonValue15 = comparisonValue13 ? multiplyAddValue25 : (comparisonValue12 ? multiplyAddValue24 : (comparisonValue11 ? multiplyAddValue23 : 0.0));
                    float comparisonValue16 = ((comparisonValue13 ? multiplyAddValue9 : (comparisonValue12 ? multiplyAddValue8 : (comparisonValue11 ? multiplyAddValue7 : 0.0))) - comparisonValue15) / comparisonValue14;
                    float comparisonValue17 = ((comparisonValue13 ? multiplyAddValue12 : (comparisonValue12 ? multiplyAddValue11 : (comparisonValue11 ? multiplyAddValue10 : 0.0))) - comparisonValue15) / comparisonValue14;
                    bool conditionValue2 = comparisonValue17 < comparisonValue16;
                    float comparisonValue18 = conditionValue2 ? comparisonValue17 : comparisonValue16;
                    float comparisonValue19 = conditionValue2 ? comparisonValue16 : comparisonValue17;
                    float comparisonValue20 = (intermediateValue50 < comparisonValue18) ? comparisonValue18 : intermediateValue50;
                    float comparisonValue21 = (comparisonValue19 < intermediateValue48) ? comparisonValue19 : intermediateValue48;
                    intermediateValue51 = comparisonValue20;
                    intermediateValue49 = comparisonValue21;
                    comparisonValue5 = ((comparisonValue21 < comparisonValue20) || (comparisonValue21 < 0.0)) ? 4294967295u : intermediateValue47;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue33 = (intermediateValue48 * intermediateValue43) + productValue45;
                    branchMergedValue34 = (intermediateValue48 * intermediateValue44) + productValue44;
                    branchMergedValue35 = (intermediateValue48 * intermediateValue45) + productValue43;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    float comparisonValue22 = comparisonValue13 ? multiplyAddValue25 : (comparisonValue12 ? multiplyAddValue24 : (comparisonValue11 ? multiplyAddValue23 : 0.0));
                    intermediateValue51 = intermediateValue50;
                    intermediateValue49 = intermediateValue48;
                    comparisonValue5 = ((comparisonValue22 < (comparisonValue13 ? multiplyAddValue9 : (comparisonValue12 ? multiplyAddValue8 : (comparisonValue11 ? multiplyAddValue7 : 0.0)))) || ((comparisonValue13 ? multiplyAddValue12 : (comparisonValue12 ? multiplyAddValue11 : (comparisonValue11 ? multiplyAddValue10 : 0.0))) < comparisonValue22)) ? 4294967295u : intermediateValue47;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue33 = (intermediateValue50 * intermediateValue43) + productValue45;
                    branchMergedValue34 = (intermediateValue50 * intermediateValue44) + productValue44;
                    branchMergedValue35 = (intermediateValue50 * intermediateValue45) + productValue43;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                sumValue14 = scalarValue22 + 1u;
                intermediateValue47 = comparisonValue5;
                intermediateValue48 = intermediateValue49;
                intermediateValue50 = intermediateValue51;
                scalarValue22 = sumValue14;
                continue;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue22 = branchMergedValue33;
                branchMergedValue23 = branchMergedValue34;
                branchMergedValue24 = branchMergedValue35;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            bool conditionValue3 = intermediateValue50 > 0.0;
            bool comparisonValue23 = intermediateValue47 != 0u;
            multiplyAddValue26 = comparisonValue23 ? spvNMin(multiplyAddValue10, spvNMax(multiplyAddValue7, multiplyAddValue23)) : (conditionValue3 ? fma(comparisonValue8, intermediateValue50, multiplyAddValue23) : fma(comparisonValue8, intermediateValue48, multiplyAddValue23));
            multiplyAddValue27 = comparisonValue23 ? spvNMin(multiplyAddValue11, spvNMax(multiplyAddValue8, multiplyAddValue24)) : (conditionValue3 ? fma(comparisonValue9, intermediateValue50, multiplyAddValue24) : fma(comparisonValue9, intermediateValue48, multiplyAddValue24));
            multiplyAddValue28 = comparisonValue23 ? spvNMin(multiplyAddValue12, spvNMax(multiplyAddValue9, multiplyAddValue25)) : (conditionValue3 ? fma(comparisonValue10, intermediateValue50, multiplyAddValue25) : fma(comparisonValue10, intermediateValue48, multiplyAddValue25));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            else
            {
                branchMergedValue22 = spvNMin(sumValue16, spvNMax(sumValue12, productValue45));
                branchMergedValue23 = spvNMin(sumValue15, spvNMax(sumValue11, productValue44));
                branchMergedValue24 = spvNMin(sumValue13, spvNMax(sumValue10, productValue43));
            }
            branchMergedValue8 = branchMergedValue22;
            branchMergedValue10 = branchMergedValue23;
            branchMergedValue11 = branchMergedValue24;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            multiplyAddValue26 = multiplyAddValue23;
            multiplyAddValue27 = multiplyAddValue24;
            multiplyAddValue28 = multiplyAddValue25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue8 = productValue45;
            branchMergedValue10 = productValue44;
            branchMergedValue11 = productValue43;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue44 = multiplyAddValue28;
        intermediateValue45 = multiplyAddValue27;
        intermediateValue46 = multiplyAddValue26;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue40 = branchMergedValue11;
        intermediateValue41 = branchMergedValue10;
        intermediateValue42 = branchMergedValue8;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue44 = spvNMin(multiplyAddValue12, spvNMax(multiplyAddValue9, multiplyAddValue25));
        intermediateValue45 = spvNMin(multiplyAddValue11, spvNMax(multiplyAddValue8, multiplyAddValue24));
        intermediateValue46 = spvNMin(multiplyAddValue10, spvNMax(multiplyAddValue7, multiplyAddValue23));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue40 = spvNMin(sumValue13, spvNMax(sumValue10, productValue43));
        intermediateValue41 = spvNMin(sumValue15, spvNMax(sumValue11, productValue44));
        intermediateValue42 = spvNMin(sumValue16, spvNMax(sumValue12, productValue45));
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    vec2 sumValue44 = vec2(multiplyAddValue - scalarValue24, multiplyAddValue1 - scalarValue25);
    float multiplyAddValue29 = (fragmentScalarConstants1.packedValues[2u] != 0.0) ? (spvNMax(spvNClamp(fma(-fragmentScalarConstants1.packedValues[9u], rdDot2Precise(sumValue44, sumValue44), 1.0), 0.0500000007450580596923828125, 1.0), multiplyAddValue2) * 0.100000001490116119384765625) : 1.0;
    fragmentColor0.x = fma(multiplyAddValue29, scalarValue28 - intermediateValue46, intermediateValue46);
    fragmentColor0.y = fma(multiplyAddValue29, scalarValue29 - intermediateValue45, intermediateValue45);
    fragmentColor0.z = fma(multiplyAddValue29, scalarValue30 - intermediateValue44, intermediateValue44);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue29 = productValue2 - float(int(scalarValue));
    float sumValue30 = productValue3 - float(int(scalarValue1));
    float dotProductValue1 = (fragmentVectorConstants1.packedValues[0u].z != 0.0) ? (spvNMax(productValue18, spvNMin(spvNMax(1.0 - (fragmentVectorConstants1.packedValues[2u].y * dot(vec2(sumValue29, sumValue30), vec2(sumValue29, sumValue30))), 0.0500000007450580596923828125), 1.0)) * 0.100000001490116119384765625) : 1.0;
    fragmentColor0.x = (dotProductValue1 * (scalarValue2 - intermediateValue40)) + intermediateValue40;
    fragmentColor0.y = (dotProductValue1 * (scalarValue3 - intermediateValue41)) + intermediateValue41;
    fragmentColor0.z = (dotProductValue1 * (scalarValue4 - intermediateValue42)) + intermediateValue42;
#endif
    fragmentColor0.w = 0.0;
}
