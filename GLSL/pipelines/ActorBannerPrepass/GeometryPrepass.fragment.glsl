#version 460
#extension GL_GOOGLE_include_directive : require
// ActorBannerPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
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
#extension GL_EXT_samplerless_texture_functions : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/ActorBannerPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    fragmentColor1.x = sampledTextureValue9.x * varyingColor0.x;
    fragmentColor1.y = sampledTextureValue9.y * varyingColor0.y;
    fragmentColor1.z = sampledTextureValue9.z * varyingColor0.z;
    uint scalarValue16 = uint(int(fragmentScalarConstants1.packedValues[48u]));
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    if ((scalarValue16 & 4u) == 4u)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    uint scalarValue16 = uint(int(fragmentScalarConstants1.packedValues[48u]));
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    if ((scalarValue16 & 4u) == 4u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool comparisonValue = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[12u].x));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    if ((scalarValue & 4u) == 0u)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[11u].x, fragmentVectorConstants1.packedValues[11u].z), fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[11u].y, fragmentVectorConstants1.packedValues[11u].w)));
        multiplyAddValue = fma(sampledTextureValue10.y, 2.0, -1.0);
        multiplyAddValue1 = fma(sampledTextureValue10.x, 2.0, -1.0);
        multiplyAddValue2 = fma(sampledTextureValue10.z, 2.0, -1.0);
    }
    else
    {
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        if ((scalarValue16 & 8u) == 8u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if ((scalarValue & 8u) == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float sumValue9 = spvNClamp(2.0 - spvNMin(fragmentScalarConstants1.packedValues[55u] - fragmentScalarConstants1.packedValues[53u], fragmentScalarConstants1.packedValues[55u]), 0.0, 1.0);
            float productValue3;
            float productValue4;
            float productValue5;
            if (sumValue9 > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue3;
            float branchMergedValue5;
            float branchMergedValue6;
            if ((scalarValue & 16u) == 0u)
            {
                branchMergedValue3 = 0.0;
                branchMergedValue5 = 0.0;
                branchMergedValue6 = 1.0;
            }
            else
#endif
            {
                float multiplyAddValue3 = fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[11u].x, fragmentVectorConstants1.packedValues[11u].z);
                float multiplyAddValue4 = fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[11u].y, fragmentVectorConstants1.packedValues[11u].w);
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue11 = uint(textureQueryLevels(materialTexture1)) > 0u;
                uvec2 sampledTextureValue12 = uvec2(textureSize(materialTexture1, int(0u)));
                uint scalarValue17 = sampledTextureValue12.x;
                float comparisonValue13 = rdEvaluateFloatExpression(sampledTextureValue11 ? scalarValue17 : 0u);
                float comparisonValue14 = rdEvaluateFloatExpression(sampledTextureValue11 ? sampledTextureValue12.y : 0u);
                float productValue33 = fract(multiplyAddValue3 * comparisonValue13);
                float productValue34 = fract(multiplyAddValue4 * comparisonValue14);
                vec4 sampledTextureValue13 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue33 - 0.5) < 0.0625) ? (((productValue33 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue3) : multiplyAddValue3, (abs(productValue34 - 0.5) < 0.0625) ? (((productValue34 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue4) : multiplyAddValue4));
                float scalarValue18 = sampledTextureValue13.x;
                float scalarValue19 = sampledTextureValue13.y;
                float scalarValue20 = sampledTextureValue13.z;
                float scalarValue21 = sampledTextureValue13.w;
                float multiplyAddValue14 = fract(fma(multiplyAddValue3, comparisonValue13, 0.5));
                float multiplyAddValue15 = fract(fma(multiplyAddValue4, comparisonValue14, 0.5));
                bool conditionValue6 = multiplyAddValue15 > 0.5;
                bool conditionValue7 = multiplyAddValue14 > 0.5;
                float comparisonValue15 = conditionValue6 ? scalarValue18 : scalarValue21;
                float comparisonValue16 = conditionValue6 ? scalarValue19 : scalarValue20;
                float comparisonValue17 = conditionValue7 ? scalarValue20 : scalarValue21;
                float comparisonValue18 = conditionValue7 ? scalarValue19 : scalarValue18;
                float sumValue10 = multiplyAddValue14 - 0.083333335816860198974609375;
                float sumValue11 = multiplyAddValue14 + 0.083333335816860198974609375;
                float sumValue12 = multiplyAddValue15 - 0.083333335816860198974609375;
                float sumValue13 = multiplyAddValue15 + 0.083333335816860198974609375;
                uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                float comparisonValue19 = ((sumValue14 == 1u) ? comparisonValue16 : ((sumValue14 == 0u) ? comparisonValue15 : 0.0)) - ((sumValue15 == 1u) ? comparisonValue16 : ((sumValue15 == 0u) ? comparisonValue15 : 0.0));
                float comparisonValue20 = ((sumValue16 == 1u) ? comparisonValue18 : ((sumValue16 == 0u) ? comparisonValue17 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue18 : ((sumValue17 == 0u) ? comparisonValue17 : 0.0));
                vec3 vectorValue = vec3(comparisonValue19, comparisonValue20, 0.25);
                float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                productValue3 = sumValue9 * (inverseLengthValue7 * comparisonValue20);
                productValue4 = sumValue9 * (inverseLengthValue7 * comparisonValue19);
                productValue5 = inverseLengthValue7 * 0.25;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue11 = uint(textureQueryLevels(materialTexture1)) > 0u;
                uvec2 sampledTextureValue12 = uvec2(textureSize(materialTexture1, int(0u)));
                uint scalarValue17 = sampledTextureValue12.x;
                float comparisonValue13 = rdEvaluateFloatExpression(sampledTextureValue11 ? scalarValue17 : 0u);
                float comparisonValue14 = rdEvaluateFloatExpression(sampledTextureValue11 ? sampledTextureValue12.y : 0u);
                float productValue33 = fract(multiplyAddValue3 * comparisonValue13);
                float productValue34 = fract(multiplyAddValue4 * comparisonValue14);
                vec4 sampledTextureValue21 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue33 - 0.5) < 0.0625) ? (multiplyAddValue3 + ((productValue33 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue3, (abs(productValue34 - 0.5) < 0.0625) ? (multiplyAddValue4 + ((productValue34 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue4));
                float scalarValue32 = sampledTextureValue21.x;
                float scalarValue33 = sampledTextureValue21.y;
                float scalarValue34 = sampledTextureValue21.z;
                float scalarValue35 = sampledTextureValue21.w;
                float multiplyAddValue14 = fract(fma(multiplyAddValue3, comparisonValue13, 0.5));
                float multiplyAddValue15 = fract(fma(multiplyAddValue4, comparisonValue14, 0.5));
                bool conditionValue6 = multiplyAddValue15 > 0.5;
                bool conditionValue7 = multiplyAddValue14 > 0.5;
                float comparisonValue38 = conditionValue6 ? scalarValue32 : scalarValue35;
                float comparisonValue39 = conditionValue6 ? scalarValue33 : scalarValue34;
                float comparisonValue40 = conditionValue7 ? scalarValue34 : scalarValue35;
                float comparisonValue41 = conditionValue7 ? scalarValue33 : scalarValue32;
                float sumValue10 = multiplyAddValue14 - 0.083333335816860198974609375;
                float sumValue11 = multiplyAddValue14 + 0.083333335816860198974609375;
                float sumValue12 = multiplyAddValue15 - 0.083333335816860198974609375;
                float sumValue13 = multiplyAddValue15 + 0.083333335816860198974609375;
                uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                float comparisonValue42 = ((sumValue14 == 1u) ? comparisonValue39 : ((sumValue14 == 0u) ? comparisonValue38 : 0.0)) - ((sumValue15 == 1u) ? comparisonValue39 : ((sumValue15 == 0u) ? comparisonValue38 : 0.0));
                float comparisonValue43 = ((sumValue16 == 1u) ? comparisonValue41 : ((sumValue16 == 0u) ? comparisonValue40 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue41 : ((sumValue17 == 0u) ? comparisonValue40 : 0.0));
                vec3 vectorValue6 = vec3(comparisonValue42, comparisonValue43, 0.25);
                float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
                productValue3 = sumValue9 * (inverseLengthValue14 * comparisonValue43);
                productValue4 = sumValue9 * (inverseLengthValue14 * comparisonValue42);
                productValue5 = inverseLengthValue14 * 0.25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                vec4 sampledTextureValue1 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue3, multiplyAddValue4), 0.0);
                float scalarValue1 = sampledTextureValue1.x;
                float scalarValue2 = sampledTextureValue1.y;
                float scalarValue3 = sampledTextureValue1.z;
                float multiplyAddValue5 = spvNClamp(fma(spvNMin(fragmentVectorConstants1.packedValues[13u].w - fragmentVectorConstants1.packedValues[13u].y, fragmentVectorConstants1.packedValues[13u].w), -1.0, 2.0), 0.0, 1.0);
                bool conditionValue = multiplyAddValue5 > 0.0;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if ((scalarValue1 == scalarValue2) && (scalarValue2 == scalarValue3))
                {
                    float branchMergedValue12;
                    float branchMergedValue14;
                    float branchMergedValue15;
                    if (conditionValue)
                    {
                        uvec2 sampledTextureValue2 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float productValue = float(int(uint(int(float(int(sampledTextureValue2.x)))))) * multiplyAddValue3;
                        float productValue1 = float(int(uint(int(float(int(sampledTextureValue2.y)))))) * multiplyAddValue4;
                        float scalarValue4 = fract(productValue);
                        float scalarValue5 = fract(productValue1);
                        float comparisonValue10;
                        if (abs(scalarValue4 + (-0.5)) < 0.0625)
                        {
                            comparisonValue10 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue3;
                        }
                        else
                        {
                            comparisonValue10 = multiplyAddValue3;
                        }
                        float comparisonValue11;
                        if (abs(scalarValue5 + (-0.5)) < 0.0625)
                        {
                            comparisonValue11 = ((scalarValue5 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue4;
                        }
                        else
                        {
                            comparisonValue11 = multiplyAddValue4;
                        }
                        vec4 sampledTextureValue3 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue10, comparisonValue11));
                        float scalarValue6 = sampledTextureValue3.x;
                        float scalarValue7 = sampledTextureValue3.y;
                        float scalarValue8 = sampledTextureValue3.z;
                        float scalarValue9 = sampledTextureValue3.w;
                        float sumValue = fract(productValue + 0.5);
                        float sumValue1 = fract(productValue1 + 0.5);
                        bool conditionValue1 = sumValue1 > 0.5;
                        float intermediateValue[2];
                        intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue9;
                        intermediateValue[1u] = conditionValue1 ? scalarValue7 : scalarValue8;
                        float productValue2 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                        float productValue6 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                        float sumValue2 = productValue2 - productValue6;
                        bool conditionValue2 = sumValue > 0.5;
                        intermediateValue[0u] = conditionValue2 ? scalarValue8 : scalarValue9;
                        intermediateValue[1u] = conditionValue2 ? scalarValue7 : scalarValue6;
                        float productValue7 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                        float inverseLengthValue = inversesqrt(dot(vec3(sumValue2, productValue7, 0.25), vec3(sumValue2, productValue7, 0.25)));
                        float productValue10 = inverseLengthValue * multiplyAddValue5;
                        branchMergedValue12 = productValue10 * sumValue2;
                        branchMergedValue14 = productValue10 * productValue7;
                        branchMergedValue15 = inverseLengthValue * 0.25;
                    }
                    else
                    {
                        branchMergedValue12 = 0.0;
                        branchMergedValue14 = 0.0;
                        branchMergedValue15 = 1.0;
                    }
                    branchMergedValue9 = branchMergedValue12;
                    branchMergedValue10 = branchMergedValue14;
                    branchMergedValue11 = branchMergedValue15;
                }
                else
                {
                    uvec2 sampledTextureValue4 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float branchMergedValue13;
                    float branchMergedValue16;
                    float branchMergedValue17;
                    if (conditionValue)
                    {
                        float productValue11 = fract(float(int(uint(int(float(int(sampledTextureValue4.x)))))) * multiplyAddValue3);
                        float productValue12 = fract(float(int(uint(int(float(int(sampledTextureValue4.y)))))) * multiplyAddValue4);
                        float comparisonValue1 = (((productValue11 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue2 * 2.0) + (-1.0))) - (((productValue11 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue1.w * 2.0) + (-1.0)));
                        float comparisonValue2 = (((productValue12 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue3 * 2.0) + (-1.0))) - (((productValue12 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue1 * 2.0) + (-1.0)));
                        float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                        float comparisonValue5 = ((abs(comparisonValue2) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue2;
                        float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue3, comparisonValue5, 0.25), vec3(comparisonValue3, comparisonValue5, 0.25)));
                        float productValue13 = inverseLengthValue1 * multiplyAddValue5;
                        branchMergedValue13 = productValue13 * comparisonValue3;
                        branchMergedValue16 = productValue13 * comparisonValue5;
                        branchMergedValue17 = inverseLengthValue1 * 0.25;
                    }
                    else
                    {
                        branchMergedValue13 = 0.0;
                        branchMergedValue16 = 0.0;
                        branchMergedValue17 = 1.0;
                    }
                    branchMergedValue9 = branchMergedValue13;
                    branchMergedValue10 = branchMergedValue16;
                    branchMergedValue11 = branchMergedValue17;
                }
                branchMergedValue3 = branchMergedValue9;
                branchMergedValue5 = branchMergedValue10;
                branchMergedValue6 = branchMergedValue11;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            else
            {
                productValue3 = 0.0;
                productValue4 = 0.0;
                productValue5 = 1.0;
            }
            intermediateValue8 = productValue3;
            intermediateValue9 = productValue4;
            intermediateValue10 = productValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = branchMergedValue3;
            branchMergedValue1 = branchMergedValue5;
            branchMergedValue2 = branchMergedValue6;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float intermediateValue22;
            float intermediateValue24;
            float intermediateValue26;
            if ((scalarValue16 & 16u) == 16u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float multiplyAddValue6 = fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[11u].x, fragmentVectorConstants1.packedValues[11u].z);
            float multiplyAddValue7 = fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[11u].y, fragmentVectorConstants1.packedValues[11u].w);
            float multiplyAddValue8 = spvNClamp(fma(spvNMin(fragmentVectorConstants1.packedValues[13u].w - fragmentVectorConstants1.packedValues[13u].y, fragmentVectorConstants1.packedValues[13u].w), -1.0, 2.0), 0.0, 1.0);
            float branchMergedValue4;
            float branchMergedValue7;
            float branchMergedValue8;
            if (multiplyAddValue8 > 0.0)
#endif
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                float multiplyAddValue6 = fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[11u].x, fragmentVectorConstants1.packedValues[11u].z);
                float multiplyAddValue7 = fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[11u].y, fragmentVectorConstants1.packedValues[11u].w);
                float sumValue18 = spvNMin(fragmentScalarConstants1.packedValues[55u] - fragmentScalarConstants1.packedValues[53u], fragmentScalarConstants1.packedValues[55u]);
                vec4 sampledTextureValue14 = textureLod(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue6, multiplyAddValue7), 0.0);
                float scalarValue22 = sampledTextureValue14.x;
                float scalarValue23 = sampledTextureValue14.y;
                float scalarValue24 = sampledTextureValue14.z;
                float intermediateValue23;
                float intermediateValue25;
                float intermediateValue27;
                if ((scalarValue23 == scalarValue22) && (scalarValue24 == scalarValue23))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                uvec2 sampledTextureValue5 = uvec2(textureSize(matTextureTexture, int(0u)));
                float productValue14 = float(int(uint(int(float(int(sampledTextureValue5.x)))))) * multiplyAddValue6;
                float productValue15 = float(int(uint(int(float(int(sampledTextureValue5.y)))))) * multiplyAddValue7;
                float scalarValue10 = fract(productValue14);
                float scalarValue11 = fract(productValue15);
                float comparisonValue4;
                if (abs(scalarValue10 + (-0.5)) < 0.0625)
#endif
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    float scalarValue25 = spvNClamp(2.0 - sumValue18, 0.0, 1.0);
                    float productValue16;
                    float productValue17;
                    float productValue18;
                    if (scalarValue25 > 0.0)
                    {
                        bool sampledTextureValue15 = uint(textureQueryLevels(materialTexture1)) > 0u;
                        uvec2 sampledTextureValue16 = uvec2(textureSize(materialTexture1, int(0u)));
                        uint scalarValue26 = sampledTextureValue16.x;
                        float comparisonValue21 = rdEvaluateFloatExpression(sampledTextureValue15 ? scalarValue26 : 0u);
                        float comparisonValue22 = rdEvaluateFloatExpression(sampledTextureValue15 ? sampledTextureValue16.y : 0u);
                        float productValue35 = fract(multiplyAddValue6 * comparisonValue21);
                        float productValue36 = fract(multiplyAddValue7 * comparisonValue22);
                        vec4 sampledTextureValue17 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue35 - 0.5) < 0.0625) ? (multiplyAddValue6 + ((productValue35 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue6, (abs(productValue36 - 0.5) < 0.0625) ? (multiplyAddValue7 + ((productValue36 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue7));
                        float scalarValue27 = sampledTextureValue17.x;
                        float scalarValue28 = sampledTextureValue17.y;
                        float scalarValue29 = sampledTextureValue17.z;
                        float scalarValue30 = sampledTextureValue17.w;
                        float multiplyAddValue16 = fract(fma(multiplyAddValue6, comparisonValue21, 0.5));
                        float multiplyAddValue17 = fract(fma(multiplyAddValue7, comparisonValue22, 0.5));
                        bool conditionValue8 = multiplyAddValue17 > 0.5;
                        bool conditionValue9 = multiplyAddValue16 > 0.5;
                        float comparisonValue23 = conditionValue8 ? scalarValue27 : scalarValue30;
                        float comparisonValue24 = conditionValue8 ? scalarValue28 : scalarValue29;
                        float comparisonValue25 = conditionValue9 ? scalarValue29 : scalarValue30;
                        float comparisonValue26 = conditionValue9 ? scalarValue28 : scalarValue27;
                        float sumValue19 = multiplyAddValue16 - 0.083333335816860198974609375;
                        float sumValue20 = multiplyAddValue16 + 0.083333335816860198974609375;
                        float sumValue21 = multiplyAddValue17 - 0.083333335816860198974609375;
                        float sumValue22 = multiplyAddValue17 + 0.083333335816860198974609375;
                        uint sumValue23 = uint(int(spvNClamp(sumValue19 + sumValue19, 0.0, 1.0)));
                        uint sumValue24 = uint(int(spvNClamp(sumValue20 + sumValue20, 0.0, 1.0)));
                        uint sumValue25 = uint(int(spvNClamp(sumValue21 + sumValue21, 0.0, 1.0)));
                        uint sumValue26 = uint(int(spvNClamp(sumValue22 + sumValue22, 0.0, 1.0)));
                        float comparisonValue27 = ((sumValue23 == 1u) ? comparisonValue24 : ((sumValue23 == 0u) ? comparisonValue23 : 0.0)) - ((sumValue24 == 1u) ? comparisonValue24 : ((sumValue24 == 0u) ? comparisonValue23 : 0.0));
                        float comparisonValue28 = ((sumValue25 == 1u) ? comparisonValue26 : ((sumValue25 == 0u) ? comparisonValue25 : 0.0)) - ((sumValue26 == 1u) ? comparisonValue26 : ((sumValue26 == 0u) ? comparisonValue25 : 0.0));
                        vec3 vectorValue1 = vec3(comparisonValue27, comparisonValue28, 0.25);
                        float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                        productValue16 = scalarValue25 * (inverseLengthValue8 * comparisonValue28);
                        productValue17 = scalarValue25 * (inverseLengthValue8 * comparisonValue27);
                        productValue18 = inverseLengthValue8 * 0.25;
                    }
                    else
                    {
                        productValue16 = 0.0;
                        productValue17 = 0.0;
                        productValue18 = 1.0;
                    }
                    intermediateValue23 = productValue16;
                    intermediateValue25 = productValue17;
                    intermediateValue27 = productValue18;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    comparisonValue4 = ((scalarValue10 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue6;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    bool sampledTextureValue18 = uint(textureQueryLevels(materialTexture1)) > 0u;
                    uvec2 sampledTextureValue19 = uvec2(textureSize(materialTexture1, int(0u)));
                    uint scalarValue31 = sampledTextureValue19.x;
                    float sumValue27 = spvNClamp(2.0 - sumValue18, 0.0, 1.0);
                    bool conditionValue10 = sumValue27 > 0.0;
                    float comparisonValue29 = fract(multiplyAddValue6 * rdEvaluateFloatExpression(sampledTextureValue18 ? scalarValue31 : 0u));
                    float comparisonValue30 = fract(multiplyAddValue7 * rdEvaluateFloatExpression(sampledTextureValue18 ? sampledTextureValue19.y : 0u));
                    float multiplyAddValue18 = (comparisonValue29 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue14.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue19 = (comparisonValue30 <= 0.083333335816860198974609375) ? (-fma(scalarValue22, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue20 = (comparisonValue29 >= 0.916666686534881591796875) ? (fma(scalarValue23, 2.0, -1.0) + multiplyAddValue18) : multiplyAddValue18;
                    float multiplyAddValue21 = (comparisonValue30 >= 0.916666686534881591796875) ? (fma(scalarValue24, 2.0, -1.0) + multiplyAddValue19) : multiplyAddValue19;
                    bool comparisonValue31 = abs(multiplyAddValue20) >= 0.004999999888241291046142578125;
                    bool comparisonValue32 = abs(multiplyAddValue21) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue33 = vec3(comparisonValue31 ? multiplyAddValue20 : 0.0, comparisonValue32 ? multiplyAddValue21 : 0.0, 0.25);
                    float inverseLengthValue9 = inversesqrt(rdDot3Precise2(comparisonValue33, comparisonValue33));
                    intermediateValue23 = (conditionValue10 && comparisonValue32) ? (sumValue27 * (inverseLengthValue9 * multiplyAddValue21)) : 0.0;
                    intermediateValue25 = (conditionValue10 && comparisonValue31) ? (sumValue27 * (inverseLengthValue9 * multiplyAddValue20)) : 0.0;
                    intermediateValue27 = conditionValue10 ? (inverseLengthValue9 * 0.25) : 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    comparisonValue4 = multiplyAddValue6;
#endif
                }
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue22 = intermediateValue23;
                intermediateValue24 = intermediateValue25;
                intermediateValue26 = intermediateValue27;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float comparisonValue9;
                if (abs(scalarValue11 + (-0.5)) < 0.0625)
                {
                    comparisonValue9 = ((scalarValue11 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue7;
                }
                else
                {
                    comparisonValue9 = multiplyAddValue7;
                }
                vec4 sampledTextureValue6 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue4, comparisonValue9));
                float scalarValue12 = sampledTextureValue6.x;
                float scalarValue13 = sampledTextureValue6.y;
                float scalarValue14 = sampledTextureValue6.z;
                float scalarValue15 = sampledTextureValue6.w;
                float sumValue3 = fract(productValue14 + 0.5);
                float sumValue4 = fract(productValue15 + 0.5);
                bool conditionValue3 = sumValue4 > 0.5;
                float intermediateValue1[2];
                intermediateValue1[0u] = conditionValue3 ? scalarValue12 : scalarValue15;
                intermediateValue1[1u] = conditionValue3 ? scalarValue13 : scalarValue14;
                float productValue19 = intermediateValue1[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue20 = intermediateValue1[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue5 = productValue19 - productValue20;
                bool conditionValue4 = sumValue3 > 0.5;
                intermediateValue1[0u] = conditionValue4 ? scalarValue14 : scalarValue15;
                intermediateValue1[1u] = conditionValue4 ? scalarValue13 : scalarValue12;
                float productValue21 = intermediateValue1[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue5, productValue21, 0.25), vec3(sumValue5, productValue21, 0.25)));
                float productValue22 = inverseLengthValue2 * multiplyAddValue8;
                branchMergedValue4 = productValue22 * sumValue5;
                branchMergedValue7 = productValue22 * productValue21;
                branchMergedValue8 = inverseLengthValue2 * 0.25;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                intermediateValue22 = 0.0;
                intermediateValue24 = 0.0;
                intermediateValue26 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue4 = 0.0;
                branchMergedValue7 = 0.0;
                branchMergedValue8 = 1.0;
#endif
            }
#if RD_PLATFORM == RD_PLATFORM_SM50
            intermediateValue8 = intermediateValue22;
            intermediateValue9 = intermediateValue24;
            intermediateValue10 = intermediateValue26;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = branchMergedValue4;
            branchMergedValue1 = branchMergedValue7;
            branchMergedValue2 = branchMergedValue8;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        multiplyAddValue = intermediateValue8;
        multiplyAddValue1 = intermediateValue9;
        multiplyAddValue2 = intermediateValue10;
    }
    float intermediateValue28;
    float intermediateValue29;
    float intermediateValue30;
    float comparisonValue8;
    if ((scalarValue16 & 1u) == 1u)
    {
        vec4 sampledTextureValue20 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[10u].x, fragmentVectorConstants1.packedValues[10u].z), fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[10u].y, fragmentVectorConstants1.packedValues[10u].w)));
        intermediateValue28 = sampledTextureValue20.y;
        intermediateValue29 = sampledTextureValue20.z;
        intermediateValue30 = sampledTextureValue20.x;
        comparisonValue8 = ((scalarValue16 & 2u) == 2u) ? sampledTextureValue20.w : fragmentScalarConstants1.packedValues[52u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        intermediateValue3 = branchMergedValue;
        intermediateValue4 = branchMergedValue1;
        intermediateValue5 = branchMergedValue2;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        intermediateValue28 = fragmentVectorConstants1.packedValues[12u].z;
        intermediateValue29 = fragmentVectorConstants1.packedValues[12u].y;
        intermediateValue30 = fragmentScalarConstants1.packedValues[51u];
        comparisonValue8 = fragmentScalarConstants1.packedValues[52u];
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        vec4 sampledTextureValue7 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[11u].x, fragmentVectorConstants1.packedValues[11u].z), fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[11u].y, fragmentVectorConstants1.packedValues[11u].w)));
        intermediateValue3 = (sampledTextureValue7.x * 2.0) + (-1.0);
        intermediateValue4 = (sampledTextureValue7.y * 2.0) + (-1.0);
        intermediateValue5 = (sampledTextureValue7.z * 2.0) + (-1.0);
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM50
    float comparisonValue34 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
    float comparisonValue35 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
    float comparisonValue36 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
    vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
    float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
    float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    vec3 vectorValue4 = vec3(comparisonValue34, comparisonValue35, comparisonValue36);
    float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
    float multiplyAddValue22 = fma(inverseLengthValue12 * comparisonValue34, multiplyAddValue2, fma(inverseLengthValue10 * varyingTangent0.x, multiplyAddValue1, multiplyAddValue * (inverseLengthValue11 * varyingBitangent0.x)));
    float multiplyAddValue23 = fma(inverseLengthValue12 * comparisonValue35, multiplyAddValue2, fma(inverseLengthValue10 * varyingTangent0.y, multiplyAddValue1, multiplyAddValue * (inverseLengthValue11 * varyingBitangent0.y)));
    float multiplyAddValue24 = fma(inverseLengthValue12 * comparisonValue36, multiplyAddValue2, fma(inverseLengthValue10 * varyingTangent0.z, multiplyAddValue1, multiplyAddValue * (inverseLengthValue11 * varyingBitangent0.z)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if ((scalarValue & 1u) == 0u)
    {
        intermediateValue12 = fragmentVectorConstants1.packedValues[12u].z;
        intermediateValue13 = fragmentVectorConstants1.packedValues[12u].w;
        intermediateValue14 = fragmentVectorConstants1.packedValues[12u].y;
        intermediateValue15 = fragmentVectorConstants1.packedValues[13u].x;
    }
    else
    {
        vec4 sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[10u].x, fragmentVectorConstants1.packedValues[10u].z), fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[10u].y, fragmentVectorConstants1.packedValues[10u].w)));
        intermediateValue12 = sampledTextureValue8.y;
        intermediateValue13 = sampledTextureValue8.x;
        intermediateValue14 = sampledTextureValue8.z;
        intermediateValue15 = ((scalarValue & 2u) != 0u) ? sampledTextureValue8.w : fragmentVectorConstants1.packedValues[13u].x;
    }
    float comparisonValue6 = comparisonValue ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
    float comparisonValue7 = comparisonValue ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
    float comparisonValue12 = comparisonValue ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
    float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, comparisonValue12), vec3(comparisonValue6, comparisonValue7, comparisonValue12)));
    float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
    float inverseLengthValue5 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue3;
    float multiplyAddValue9 = fma(inverseLengthValue3 * comparisonValue6, intermediateValue5, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue4, inverseLengthValue5 * varyingTangent0.x));
    float multiplyAddValue10 = fma(inverseLengthValue3 * comparisonValue7, intermediateValue5, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue4, inverseLengthValue5 * varyingTangent0.y));
    float multiplyAddValue11 = fma(inverseLengthValue3 * comparisonValue12, intermediateValue5, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue4, inverseLengthValue5 * varyingTangent0.z));
#endif
    float sumValue6 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[9u].x;
    float sumValue7 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[9u].y;
    float sumValue8 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[9u].z;
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor1.w = (comparisonValue8 < intermediateValue30) ? fma(intermediateValue30, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue8, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24);
    float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue37 = inverseLengthValue13 * multiplyAddValue22;
    float productValue38 = inverseLengthValue13 * multiplyAddValue23;
    float productValue39 = inverseLengthValue13 * multiplyAddValue24;
    float quotientValue1 = 1.0 / (abs(productValue39) + (abs(productValue38) + abs(productValue37)));
    float productValue40 = quotientValue1 * productValue37;
    float productValue41 = quotientValue1 * productValue38;
    bool conditionValue11 = productValue39 < 0.0;
    float sumValue28 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? (((productValue40 >= 0.0) ? sumValue28 : (-1.0)) * (1.0 - abs(productValue41))) : productValue40;
    fragmentColor2.y = conditionValue11 ? (((productValue41 >= 0.0) ? sumValue28 : (-1.0)) * (1.0 - abs(productValue40))) : productValue41;
    float multiplyAddValue25 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[27u], sumValue8, fma(fragmentScalarConstants1.packedValues[19u], sumValue6, sumValue7 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue25, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue26, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue25, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue26, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[33u] + fragmentScalarConstants1.packedValues[32u]) + fragmentScalarConstants1.packedValues[34u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[56u] > 9.9999997473787516355514526367188e-05);
    float productValue42 = fragmentScalarConstants1.packedValues[56u] * fragmentScalarConstants1.packedValues[56u];
    float comparisonValue37 = (bitwiseValue1 ? spvNMin(productValue42, 1.0) : fragmentVectorConstants1.packedValues[8u].x) * 0.16666667163372039794921875;
    float multiplyAddValue27 = (bitwiseValue1 ? spvNMin(fma(fma(productValue42, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue42, 1.0) : fragmentVectorConstants1.packedValues[8u].y) * 0.16666667163372039794921875;
    float multiplyAddValue28 = (bitwiseValue1 ? spvNMin(fma(productValue42 * productValue42, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue42, 1.0) : fragmentVectorConstants1.packedValues[8u].z) * 0.16666667163372039794921875;
    float productValue43 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue27, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue28, comparisonValue37)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue27 / productValue43, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue37 / productValue43, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue28 / productValue43, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue43, 0.0, 1.0) * 255.0);
    uint productValue44 = uint(floor(fragmentScalarConstants1.packedValues[35u] * 255.0));
    fragmentColor0.w = (((productValue44 & 2u) != 0u) ? 512u : 0u) + ((((productValue44 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[57u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue28, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue29, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor1.w = (comparisonValue8 < intermediateValue30) ? fma(intermediateValue30, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-comparisonValue8, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24);
    float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue37 = inverseLengthValue13 * multiplyAddValue22;
    float productValue38 = inverseLengthValue13 * multiplyAddValue23;
    float productValue39 = inverseLengthValue13 * multiplyAddValue24;
    float quotientValue1 = 1.0 / (abs(productValue39) + (abs(productValue38) + abs(productValue37)));
    float productValue40 = quotientValue1 * productValue37;
    float productValue41 = quotientValue1 * productValue38;
    bool conditionValue11 = productValue39 < 0.0;
    float sumValue28 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? ((1.0 - abs(productValue41)) * ((productValue40 >= 0.0) ? sumValue28 : (-1.0))) : productValue40;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue40)) * ((productValue41 >= 0.0) ? sumValue28 : (-1.0))) : productValue41;
    float multiplyAddValue25 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[27u], sumValue8, fma(fragmentScalarConstants1.packedValues[19u], sumValue6, sumValue7 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue25, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue26, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue25, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue26, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[33u] + fragmentScalarConstants1.packedValues[32u]) + fragmentScalarConstants1.packedValues[34u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[56u] > 9.9999997473787516355514526367188e-05);
    float productValue42 = fragmentScalarConstants1.packedValues[56u] * fragmentScalarConstants1.packedValues[56u];
    float comparisonValue37 = (bitwiseValue1 ? spvNMin(productValue42, 1.0) : fragmentVectorConstants1.packedValues[8u].x) * 0.16666667163372039794921875;
    float multiplyAddValue27 = (bitwiseValue1 ? spvNMin(fma(fma(productValue42, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue42, 1.0) : fragmentVectorConstants1.packedValues[8u].y) * 0.16666667163372039794921875;
    float multiplyAddValue28 = (bitwiseValue1 ? spvNMin(fma(productValue42 * productValue42, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue42, 1.0) : fragmentVectorConstants1.packedValues[8u].z) * 0.16666667163372039794921875;
    float productValue43 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue27, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue28, comparisonValue37)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue27 / productValue43, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue37 / productValue43, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue28 / productValue43, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue43, 0.0, 1.0) * 255.0);
    uint productValue44 = uint(floor(fragmentScalarConstants1.packedValues[35u] * 255.0));
    fragmentColor0.w = (((productValue44 & 2u) != 0u) ? 512u : 0u) + ((((productValue44 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(fragmentScalarConstants1.packedValues[57u], 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue28, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue29, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor1.x = sampledTextureValue9.x;
    fragmentColor1.y = sampledTextureValue9.y;
    fragmentColor1.z = sampledTextureValue9.z;
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float inverseLengthValue6 = inversesqrt(dot(vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue23 = inverseLengthValue6 * multiplyAddValue9;
    float productValue24 = inverseLengthValue6 * multiplyAddValue10;
    float productValue25 = inverseLengthValue6 * multiplyAddValue11;
    float quotientValue = 1.0 / ((abs(productValue24) + abs(productValue23)) + abs(productValue25));
    float productValue26 = quotientValue * productValue23;
    float productValue27 = quotientValue * productValue24;
    bool conditionValue5 = productValue25 < 0.0;
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float intermediateValue17;
    float productValue8;
    float productValue9;
    if ((fragmentVectorConstants1.packedValues[14u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[8u].x + fragmentVectorConstants1.packedValues[8u].y) + fragmentVectorConstants1.packedValues[8u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue28 = fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue17 = spvNClamp(productValue28, 0.0, 1.0);
        productValue8 = spvNClamp(((productValue28 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue28, 0.0, 1.0);
        productValue9 = spvNClamp((((productValue28 * productValue28) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue28, 0.0, 1.0);
    }
    else
    {
        intermediateValue17 = fragmentVectorConstants1.packedValues[8u].x;
        productValue8 = fragmentVectorConstants1.packedValues[8u].y;
        productValue9 = fragmentVectorConstants1.packedValues[8u].z;
    }
    float productValue29 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue30 = productValue8 * 0.16666667163372039794921875;
    float productValue31 = productValue9 * 0.16666667163372039794921875;
    float productValue32 = ceil(spvNClamp(spvNMax(spvNMax(productValue29, productValue31), spvNMax(productValue30, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[8u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue29 / productValue32, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue30 / productValue32, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue31 / productValue32, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue32, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[14u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = sampledTextureValue.x * varyingColor0.x;
    fragmentColor1.y = sampledTextureValue.y * varyingColor0.y;
    fragmentColor1.z = sampledTextureValue.z * varyingColor0.z;
    fragmentColor1.w = (intermediateValue13 > intermediateValue15) ? ((intermediateValue13 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue15 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue5 ? (((productValue26 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue27))) : productValue26;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue26)) * ((productValue27 < 0.0) ? (-1.0) : 1.0)) : productValue27;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue13)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue13)) * 0.5;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float inverseLengthValue6 = inversesqrt(dot(vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue23 = inverseLengthValue6 * multiplyAddValue9;
    float productValue24 = inverseLengthValue6 * multiplyAddValue10;
    float productValue25 = inverseLengthValue6 * multiplyAddValue11;
    float quotientValue = 1.0 / ((abs(productValue24) + abs(productValue23)) + abs(productValue25));
    float productValue26 = quotientValue * productValue23;
    float productValue27 = quotientValue * productValue24;
    bool conditionValue5 = productValue25 < 0.0;
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float intermediateValue17;
    float productValue8;
    float productValue9;
    if ((fragmentVectorConstants1.packedValues[14u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[8u].x + fragmentVectorConstants1.packedValues[8u].y) + fragmentVectorConstants1.packedValues[8u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue28 = fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue17 = spvNClamp(productValue28, 0.0, 1.0);
        productValue8 = spvNClamp(((productValue28 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue28, 0.0, 1.0);
        productValue9 = spvNClamp((((productValue28 * productValue28) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue28, 0.0, 1.0);
    }
    else
    {
        intermediateValue17 = fragmentVectorConstants1.packedValues[8u].x;
        productValue8 = fragmentVectorConstants1.packedValues[8u].y;
        productValue9 = fragmentVectorConstants1.packedValues[8u].z;
    }
    float productValue29 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue30 = productValue8 * 0.16666667163372039794921875;
    float productValue31 = productValue9 * 0.16666667163372039794921875;
    float productValue32 = ceil(spvNClamp(spvNMax(spvNMax(productValue29, productValue31), spvNMax(productValue30, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[8u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue29 / productValue32, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue30 / productValue32, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue31 / productValue32, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue32, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[14u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = sampledTextureValue.x;
    fragmentColor1.y = sampledTextureValue.y;
    fragmentColor1.z = sampledTextureValue.z;
    fragmentColor1.w = (intermediateValue13 > intermediateValue15) ? ((intermediateValue13 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue15 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue5 ? (((productValue26 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue27))) : productValue26;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue26)) * ((productValue27 < 0.0) ? (-1.0) : 1.0)) : productValue27;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue13)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue13)) * 0.5;
#endif
}
