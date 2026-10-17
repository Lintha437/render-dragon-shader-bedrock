#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlockPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#endif
#extension GL_EXT_samplerless_texture_functions : require
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
#extension GL_EXT_spirv_intrinsics : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/SingleBlockPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue21 = sampledTextureValue21.x;
    float scalarValue22 = sampledTextureValue21.y;
    float scalarValue23 = sampledTextureValue21.z;
    float scalarValue24 = sampledTextureValue21.w;
    bool comparisonValue14 = fragmentScalarConstants1.packedValues[40u] != 0.0;
    fragmentColor1.x = comparisonValue14 ? (fma(scalarValue24, fma(scalarValue21, varyingColor0.x, -scalarValue21), scalarValue21) * varyingColor0.w) : (scalarValue21 * varyingColor0.x);
    fragmentColor1.y = comparisonValue14 ? (fma(scalarValue24, fma(scalarValue22, varyingColor0.y, -scalarValue22), scalarValue22) * varyingColor0.w) : (scalarValue22 * varyingColor0.y);
    fragmentColor1.z = comparisonValue14 ? (fma(scalarValue24, fma(scalarValue23, varyingColor0.z, -scalarValue23), scalarValue23) * varyingColor0.w) : (scalarValue23 * varyingColor0.z);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue33 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingColor0.x, varyingColor0.y));
    fragmentColor1.x = (sampledTextureValue21.x * fma(varyingColor0.z, fma(sampledTextureValue33.x, 2.0, -1.0), 1.0)) * varyingColor0.w;
    fragmentColor1.y = (sampledTextureValue21.y * fma(varyingColor0.z, fma(sampledTextureValue33.y, 2.0, -1.0), 1.0)) * varyingColor0.w;
    fragmentColor1.z = (sampledTextureValue21.z * fma(varyingColor0.z, fma(sampledTextureValue33.z, 2.0, -1.0), 1.0)) * varyingColor0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool comparisonValue2 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
#endif
    uint scalarValue = uint(varyingTexCoord4);
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float intermediateValue21;
    float intermediateValue23;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    float intermediateValue25;
    float intermediateValue27;
    if (scalarValue != 65535u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float intermediateValue19;
    float intermediateValue21;
    float multiplyAddValue;
    float multiplyAddValue1;
    float multiplyAddValue2;
    float intermediateValue23;
    float intermediateValue25;
    if (scalarValue != 65535u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue.x;
    float scalarValue2 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.z;
    float scalarValue4 = sampledTextureValue.w;
    float productValue = scalarValue1 * varyingColor0.x;
    float productValue1 = scalarValue2 * varyingColor0.y;
    float productValue2 = scalarValue3 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue39 = texture(sampler2D(seasonsTextureTexture, seasonsTextureSampler), vec2(varyingColor0.x, varyingColor0.y));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if (scalarValue == 65535u)
#endif
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue * 4u) + 1u]);
        float scalarValue25 = reinterpretedBits.x;
        float scalarValue26 = reinterpretedBits.y;
        float scalarValue27 = reinterpretedBits.z;
        float scalarValue28 = reinterpretedBits.w;
        vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue * 4u) + 2u]);
        vec2 reinterpretedBits2 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue * 8u) + 6u]);
        float scalarValue29 = reinterpretedBits2.x;
        float scalarValue30 = reinterpretedBits2.y;
        uint reinterpretedBits3 = floatBitsToUint(reinterpretedBits1.x);
        float multiplyAddValue7;
        float multiplyAddValue8;
        float multiplyAddValue9;
        if ((reinterpretedBits3 & 4u) == 4u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits6 = uintBitsToFloat(intermediateValue4.packedValues[(scalarValue * 4u) + 1u]);
        float scalarValue46 = reinterpretedBits6.x;
        float scalarValue47 = reinterpretedBits6.y;
        float scalarValue48 = reinterpretedBits6.z;
        float scalarValue49 = reinterpretedBits6.w;
        vec4 reinterpretedBits7 = uintBitsToFloat(intermediateValue4.packedValues[(scalarValue * 4u) + 2u]);
        vec2 reinterpretedBits8 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue * 8u) + 6u]);
        float scalarValue50 = reinterpretedBits8.x;
        float scalarValue51 = reinterpretedBits8.y;
        uint reinterpretedBits9 = floatBitsToUint(reinterpretedBits7.x);
        float multiplyAddValue7;
        float multiplyAddValue8;
        float multiplyAddValue9;
        if ((reinterpretedBits9 & 4u) == 4u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue3 = (((productValue - scalarValue1) * scalarValue4) + scalarValue1) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue2) * scalarValue4) + scalarValue2) * varyingColor0.w;
        productValue5 = (((productValue2 - scalarValue3) * scalarValue4) + scalarValue3) * varyingColor0.w;
    }
    else
    {
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue2;
    }
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if (scalarValue == 65535u)
    {
        intermediateValue7 = 0.0;
        intermediateValue8 = 1.0;
        intermediateValue9 = 0.0;
        intermediateValue10 = 0.0;
        intermediateValue12 = 0.0;
        intermediateValue13 = 1.0;
        intermediateValue14 = 0.0;
    }
    else
    {
        float sampledTextureValue5 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 4u)).x);
        float sampledTextureValue6 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 5u)).x);
        float sampledTextureValue7 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 6u)).x);
        float sampledTextureValue8 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 7u)).x);
        uvec4 sampledTextureValue9 = texelFetch(pbrData, int((scalarValue * 16u) + 8u));
        uint scalarValue5 = sampledTextureValue9.x;
        float sampledTextureValue10 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 12u)).x);
        float sampledTextureValue11 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 13u)).x);
        float sampledTextureValue12 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 15u)).x);
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue5 & 4u) == 0u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue3 = 0.0;
        intermediateValue4 = 1.0;
        intermediateValue5 = 0.0;
        intermediateValue6 = 0.0;
        intermediateValue8 = 0.0;
        intermediateValue9 = 1.0;
        intermediateValue10 = 0.0;
    }
    else
    {
        float sampledTextureValue5 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 4u)).x);
        float sampledTextureValue6 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 5u)).x);
        float sampledTextureValue7 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 6u)).x);
        float sampledTextureValue8 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 7u)).x);
        uvec4 sampledTextureValue9 = texelFetch(pbrData, int((scalarValue * 16u) + 8u));
        uint scalarValue5 = sampledTextureValue9.x;
        float sampledTextureValue10 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 12u)).x);
        float sampledTextureValue11 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 13u)).x);
        float sampledTextureValue12 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 15u)).x);
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        if ((scalarValue5 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue22 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, scalarValue25, scalarValue27), fma(varyingTexCoord0.y, scalarValue26, scalarValue28)));
            multiplyAddValue7 = fma(sampledTextureValue22.y, 2.0, -1.0);
            multiplyAddValue8 = fma(sampledTextureValue22.x, 2.0, -1.0);
            multiplyAddValue9 = fma(sampledTextureValue22.z, 2.0, -1.0);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue34 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, scalarValue46, scalarValue48), fma(varyingTexCoord0.y, scalarValue47, scalarValue49)));
            multiplyAddValue7 = fma(sampledTextureValue34.y, 2.0, -1.0);
            multiplyAddValue8 = fma(sampledTextureValue34.x, 2.0, -1.0);
            multiplyAddValue9 = fma(sampledTextureValue34.z, 2.0, -1.0);
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue5 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue5 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue3 = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                    float multiplyAddValue4 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                    vec4 sampledTextureValue13 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue3, multiplyAddValue4), 0.0);
                    float scalarValue6 = sampledTextureValue13.x;
                    float scalarValue7 = sampledTextureValue13.y;
                    float scalarValue8 = sampledTextureValue13.z;
                    float multiplyAddValue5 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue = multiplyAddValue5 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue6 == scalarValue7) && (scalarValue7 == scalarValue8))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue)
                        {
                            uvec2 sampledTextureValue14 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue8 = float(int(uint(int(float(int(sampledTextureValue14.x)))))) * multiplyAddValue3;
                            float productValue9 = float(int(uint(int(float(int(sampledTextureValue14.y)))))) * multiplyAddValue4;
                            float scalarValue9 = fract(productValue8);
                            float scalarValue10 = fract(productValue9);
                            float comparisonValue10;
                            if (abs(scalarValue9 + (-0.5)) < 0.0625)
                            {
                                comparisonValue10 = ((scalarValue9 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue3;
                            }
                            else
                            {
                                comparisonValue10 = multiplyAddValue3;
                            }
                            float comparisonValue11;
                            if (abs(scalarValue10 + (-0.5)) < 0.0625)
                            {
                                comparisonValue11 = ((scalarValue10 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue4;
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue4;
                            }
                            vec4 sampledTextureValue15 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue10, comparisonValue11));
                            float scalarValue11 = sampledTextureValue15.x;
                            float scalarValue12 = sampledTextureValue15.y;
                            float scalarValue13 = sampledTextureValue15.z;
                            float scalarValue14 = sampledTextureValue15.w;
                            float sumValue = fract(productValue8 + 0.5);
                            float sumValue1 = fract(productValue9 + 0.5);
                            bool conditionValue1 = sumValue1 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue1 ? scalarValue11 : scalarValue14;
                            intermediateValue1[1u] = conditionValue1 ? scalarValue12 : scalarValue13;
                            float productValue14 = intermediateValue1[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue18 = intermediateValue1[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue2 = productValue14 - productValue18;
                            bool conditionValue2 = sumValue > 0.5;
                            intermediateValue1[0u] = conditionValue2 ? scalarValue13 : scalarValue14;
                            intermediateValue1[1u] = conditionValue2 ? scalarValue12 : scalarValue11;
                            float productValue19 = intermediateValue1[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue = inversesqrt(dot(vec3(sumValue2, productValue19, 0.25), vec3(sumValue2, productValue19, 0.25)));
                            float productValue20 = inverseLengthValue * multiplyAddValue5;
                            branchMergedValue12 = productValue20 * sumValue2;
                            branchMergedValue14 = productValue20 * productValue19;
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
                        uvec2 sampledTextureValue16 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue)
                        {
                            float productValue21 = fract(float(int(uint(int(float(int(sampledTextureValue16.x)))))) * multiplyAddValue3);
                            float productValue22 = fract(float(int(uint(int(float(int(sampledTextureValue16.y)))))) * multiplyAddValue4);
                            float comparisonValue3 = (((productValue21 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue7 * 2.0) + (-1.0))) - (((productValue21 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue13.w * 2.0) + (-1.0)));
                            float comparisonValue5 = (((productValue22 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue8 * 2.0) + (-1.0))) - (((productValue22 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue6 * 2.0) + (-1.0)));
                            float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                            float comparisonValue7 = ((abs(comparisonValue5) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue5;
                            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, 0.25), vec3(comparisonValue6, comparisonValue7, 0.25)));
                            float productValue23 = inverseLengthValue1 * multiplyAddValue5;
                            branchMergedValue13 = productValue23 * comparisonValue6;
                            branchMergedValue16 = productValue23 * comparisonValue7;
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
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue5;
                branchMergedValue2 = branchMergedValue6;
            }
            else
            {
                float multiplyAddValue6 = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                float multiplyAddValue10 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                float multiplyAddValue11 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue11 > 0.0)
                {
                    uvec2 sampledTextureValue17 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue24 = float(int(uint(int(float(int(sampledTextureValue17.x)))))) * multiplyAddValue6;
                    float productValue25 = float(int(uint(int(float(int(sampledTextureValue17.y)))))) * multiplyAddValue10;
                    float scalarValue15 = fract(productValue24);
                    float scalarValue16 = fract(productValue25);
                    float comparisonValue4;
                    if (abs(scalarValue15 + (-0.5)) < 0.0625)
                    {
                        comparisonValue4 = ((scalarValue15 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue6;
                    }
                    else
                    {
                        comparisonValue4 = multiplyAddValue6;
                    }
                    float comparisonValue9;
                    if (abs(scalarValue16 + (-0.5)) < 0.0625)
                    {
                        comparisonValue9 = ((scalarValue16 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue10;
                    }
                    else
                    {
                        comparisonValue9 = multiplyAddValue10;
                    }
                    vec4 sampledTextureValue18 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue4, comparisonValue9));
                    float scalarValue17 = sampledTextureValue18.x;
                    float scalarValue18 = sampledTextureValue18.y;
                    float scalarValue19 = sampledTextureValue18.z;
                    float scalarValue20 = sampledTextureValue18.w;
                    float sumValue3 = fract(productValue24 + 0.5);
                    float sumValue4 = fract(productValue25 + 0.5);
                    bool conditionValue3 = sumValue4 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue3 ? scalarValue17 : scalarValue20;
                    intermediateValue2[1u] = conditionValue3 ? scalarValue18 : scalarValue19;
                    float productValue26 = intermediateValue2[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue27 = intermediateValue2[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue5 = productValue26 - productValue27;
                    bool conditionValue4 = sumValue3 > 0.5;
                    intermediateValue2[0u] = conditionValue4 ? scalarValue19 : scalarValue20;
                    intermediateValue2[1u] = conditionValue4 ? scalarValue18 : scalarValue17;
                    float productValue28 = intermediateValue2[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue5, productValue28, 0.25), vec3(sumValue5, productValue28, 0.25)));
                    float productValue29 = inverseLengthValue2 * multiplyAddValue11;
                    branchMergedValue4 = productValue29 * sumValue5;
                    branchMergedValue7 = productValue29 * productValue28;
                    branchMergedValue8 = inverseLengthValue2 * 0.25;
                }
                else
                {
                    branchMergedValue4 = 0.0;
                    branchMergedValue7 = 0.0;
                    branchMergedValue8 = 1.0;
                }
                branchMergedValue = branchMergedValue4;
                branchMergedValue1 = branchMergedValue7;
                branchMergedValue2 = branchMergedValue8;
            }
            intermediateValue18 = branchMergedValue;
            intermediateValue19 = branchMergedValue1;
            intermediateValue20 = branchMergedValue2;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue5 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue5 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue3 = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                    float multiplyAddValue4 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                    vec4 sampledTextureValue13 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue3, multiplyAddValue4), 0.0);
                    float scalarValue6 = sampledTextureValue13.x;
                    float scalarValue7 = sampledTextureValue13.y;
                    float scalarValue8 = sampledTextureValue13.z;
                    float multiplyAddValue5 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue = multiplyAddValue5 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue6 == scalarValue7) && (scalarValue7 == scalarValue8))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue)
                        {
                            uvec2 sampledTextureValue14 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue8 = float(int(uint(int(float(int(sampledTextureValue14.x)))))) * multiplyAddValue3;
                            float productValue9 = float(int(uint(int(float(int(sampledTextureValue14.y)))))) * multiplyAddValue4;
                            float scalarValue9 = fract(productValue8);
                            float scalarValue10 = fract(productValue9);
                            float comparisonValue10;
                            if (abs(scalarValue9 + (-0.5)) < 0.0625)
                            {
                                comparisonValue10 = ((scalarValue9 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue3;
                            }
                            else
                            {
                                comparisonValue10 = multiplyAddValue3;
                            }
                            float comparisonValue11;
                            if (abs(scalarValue10 + (-0.5)) < 0.0625)
                            {
                                comparisonValue11 = ((scalarValue10 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue4;
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue4;
                            }
                            vec4 sampledTextureValue15 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue10, comparisonValue11));
                            float scalarValue11 = sampledTextureValue15.x;
                            float scalarValue12 = sampledTextureValue15.y;
                            float scalarValue13 = sampledTextureValue15.z;
                            float scalarValue14 = sampledTextureValue15.w;
                            float sumValue = fract(productValue8 + 0.5);
                            float sumValue1 = fract(productValue9 + 0.5);
                            bool conditionValue1 = sumValue1 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue1 ? scalarValue11 : scalarValue14;
                            intermediateValue1[1u] = conditionValue1 ? scalarValue12 : scalarValue13;
                            float productValue14 = intermediateValue1[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue18 = intermediateValue1[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue2 = productValue14 - productValue18;
                            bool conditionValue2 = sumValue > 0.5;
                            intermediateValue1[0u] = conditionValue2 ? scalarValue13 : scalarValue14;
                            intermediateValue1[1u] = conditionValue2 ? scalarValue12 : scalarValue11;
                            float productValue19 = intermediateValue1[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue = inversesqrt(dot(vec3(sumValue2, productValue19, 0.25), vec3(sumValue2, productValue19, 0.25)));
                            float productValue20 = inverseLengthValue * multiplyAddValue5;
                            branchMergedValue12 = productValue20 * sumValue2;
                            branchMergedValue14 = productValue20 * productValue19;
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
                        uvec2 sampledTextureValue16 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue)
                        {
                            float productValue21 = fract(float(int(uint(int(float(int(sampledTextureValue16.x)))))) * multiplyAddValue3);
                            float productValue22 = fract(float(int(uint(int(float(int(sampledTextureValue16.y)))))) * multiplyAddValue4);
                            float comparisonValue3 = (((productValue21 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue7 * 2.0) + (-1.0))) - (((productValue21 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue13.w * 2.0) + (-1.0)));
                            float comparisonValue5 = (((productValue22 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue8 * 2.0) + (-1.0))) - (((productValue22 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue6 * 2.0) + (-1.0)));
                            float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                            float comparisonValue7 = ((abs(comparisonValue5) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue5;
                            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue6, comparisonValue7, 0.25), vec3(comparisonValue6, comparisonValue7, 0.25)));
                            float productValue23 = inverseLengthValue1 * multiplyAddValue5;
                            branchMergedValue13 = productValue23 * comparisonValue6;
                            branchMergedValue16 = productValue23 * comparisonValue7;
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
                }
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue5;
                branchMergedValue2 = branchMergedValue6;
            }
            else
            {
                float multiplyAddValue6 = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                float multiplyAddValue10 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                float multiplyAddValue11 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue11 > 0.0)
                {
                    uvec2 sampledTextureValue17 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue24 = float(int(uint(int(float(int(sampledTextureValue17.x)))))) * multiplyAddValue6;
                    float productValue25 = float(int(uint(int(float(int(sampledTextureValue17.y)))))) * multiplyAddValue10;
                    float scalarValue15 = fract(productValue24);
                    float scalarValue16 = fract(productValue25);
                    float comparisonValue4;
                    if (abs(scalarValue15 + (-0.5)) < 0.0625)
                    {
                        comparisonValue4 = ((scalarValue15 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue6;
                    }
                    else
                    {
                        comparisonValue4 = multiplyAddValue6;
                    }
                    float comparisonValue9;
                    if (abs(scalarValue16 + (-0.5)) < 0.0625)
                    {
                        comparisonValue9 = ((scalarValue16 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue10;
                    }
                    else
                    {
                        comparisonValue9 = multiplyAddValue10;
                    }
                    vec4 sampledTextureValue18 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue4, comparisonValue9));
                    float scalarValue17 = sampledTextureValue18.x;
                    float scalarValue18 = sampledTextureValue18.y;
                    float scalarValue19 = sampledTextureValue18.z;
                    float scalarValue20 = sampledTextureValue18.w;
                    float sumValue3 = fract(productValue24 + 0.5);
                    float sumValue4 = fract(productValue25 + 0.5);
                    bool conditionValue3 = sumValue4 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue3 ? scalarValue17 : scalarValue20;
                    intermediateValue2[1u] = conditionValue3 ? scalarValue18 : scalarValue19;
                    float productValue26 = intermediateValue2[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue27 = intermediateValue2[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue5 = productValue26 - productValue27;
                    bool conditionValue4 = sumValue3 > 0.5;
                    intermediateValue2[0u] = conditionValue4 ? scalarValue19 : scalarValue20;
                    intermediateValue2[1u] = conditionValue4 ? scalarValue18 : scalarValue17;
                    float productValue28 = intermediateValue2[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue5, productValue28, 0.25), vec3(sumValue5, productValue28, 0.25)));
                    float productValue29 = inverseLengthValue2 * multiplyAddValue11;
                    branchMergedValue4 = productValue29 * sumValue5;
                    branchMergedValue7 = productValue29 * productValue28;
                    branchMergedValue8 = inverseLengthValue2 * 0.25;
                }
                else
                {
                    branchMergedValue4 = 0.0;
                    branchMergedValue7 = 0.0;
                    branchMergedValue8 = 1.0;
                }
                branchMergedValue = branchMergedValue4;
                branchMergedValue1 = branchMergedValue7;
                branchMergedValue2 = branchMergedValue8;
            }
            intermediateValue14 = branchMergedValue;
            intermediateValue15 = branchMergedValue1;
            intermediateValue16 = branchMergedValue2;
#endif
        }
        else
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits4 = uintBitsToFloat(intermediateValue1.packedValues[(scalarValue * 16u) + 15u]);
            float intermediateValue30;
            float intermediateValue31;
            float intermediateValue32;
            if ((reinterpretedBits3 & 8u) == 8u)
            {
                float sumValue9 = spvNClamp(2.0 - spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue30), 0.0, 1.0);
                float productValue10;
                float productValue11;
                float productValue12;
                if (sumValue9 > 0.0)
                {
                    float multiplyAddValue14 = fma(varyingTexCoord0.x, scalarValue25, scalarValue27);
                    float multiplyAddValue15 = fma(varyingTexCoord0.y, scalarValue26, scalarValue28);
                    bool sampledTextureValue23 = uint(textureQueryLevels(materialTexture0)) > 0u;
                    uvec2 sampledTextureValue24 = uvec2(textureSize(materialTexture0, int(0u)));
                    uint scalarValue31 = sampledTextureValue24.x;
                    float comparisonValue15 = rdEvaluateFloatExpression(sampledTextureValue23 ? scalarValue31 : 0u);
                    float comparisonValue16 = rdEvaluateFloatExpression(sampledTextureValue23 ? sampledTextureValue24.y : 0u);
                    float productValue40 = fract(multiplyAddValue14 * comparisonValue15);
                    float productValue41 = fract(multiplyAddValue15 * comparisonValue16);
                    vec4 sampledTextureValue25 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue40 - 0.5) < 0.0625) ? (multiplyAddValue14 + ((productValue40 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue14, (abs(productValue41 - 0.5) < 0.0625) ? (multiplyAddValue15 + ((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue15));
                    float scalarValue32 = sampledTextureValue25.x;
                    float scalarValue33 = sampledTextureValue25.y;
                    float scalarValue34 = sampledTextureValue25.z;
                    float scalarValue35 = sampledTextureValue25.w;
                    float multiplyAddValue16 = fract(fma(multiplyAddValue14, comparisonValue15, 0.5));
                    float multiplyAddValue17 = fract(fma(multiplyAddValue15, comparisonValue16, 0.5));
                    bool conditionValue6 = multiplyAddValue17 > 0.5;
                    bool conditionValue7 = multiplyAddValue16 > 0.5;
                    float comparisonValue17 = conditionValue6 ? scalarValue32 : scalarValue35;
                    float comparisonValue18 = conditionValue6 ? scalarValue33 : scalarValue34;
                    float comparisonValue19 = conditionValue7 ? scalarValue34 : scalarValue35;
                    float comparisonValue20 = conditionValue7 ? scalarValue33 : scalarValue32;
                    float sumValue10 = multiplyAddValue16 - 0.083333335816860198974609375;
                    float sumValue11 = multiplyAddValue16 + 0.083333335816860198974609375;
                    float sumValue12 = multiplyAddValue17 - 0.083333335816860198974609375;
                    float sumValue13 = multiplyAddValue17 + 0.083333335816860198974609375;
                    uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                    uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                    uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                    uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                    float comparisonValue21 = ((sumValue14 == 1u) ? comparisonValue18 : ((sumValue14 == 0u) ? comparisonValue17 : 0.0)) - ((sumValue15 == 1u) ? comparisonValue18 : ((sumValue15 == 0u) ? comparisonValue17 : 0.0));
                    float comparisonValue22 = ((sumValue16 == 1u) ? comparisonValue20 : ((sumValue16 == 0u) ? comparisonValue19 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue20 : ((sumValue17 == 0u) ? comparisonValue19 : 0.0));
                    vec3 vectorValue = vec3(comparisonValue21, comparisonValue22, 0.25);
                    float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                    productValue10 = sumValue9 * (inverseLengthValue7 * comparisonValue22);
                    productValue11 = sumValue9 * (inverseLengthValue7 * comparisonValue21);
                    productValue12 = inverseLengthValue7 * 0.25;
                }
                else
                {
                    productValue10 = 0.0;
                    productValue11 = 0.0;
                    productValue12 = 1.0;
                }
                intermediateValue30 = productValue10;
                intermediateValue31 = productValue11;
                intermediateValue32 = productValue12;
            }
            else
            {
                float intermediateValue47;
                float intermediateValue49;
                float intermediateValue51;
                if ((reinterpretedBits3 & 16u) == 16u)
                {
                    float multiplyAddValue18 = fma(varyingTexCoord0.x, scalarValue25, scalarValue27);
                    float multiplyAddValue19 = fma(varyingTexCoord0.y, scalarValue26, scalarValue28);
                    float sumValue18 = spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue30);
                    vec4 sampledTextureValue26 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue18, multiplyAddValue19), 0.0);
                    float scalarValue36 = sampledTextureValue26.x;
                    float scalarValue37 = sampledTextureValue26.y;
                    float scalarValue38 = sampledTextureValue26.z;
                    float intermediateValue48;
                    float intermediateValue50;
                    float intermediateValue52;
                    if ((scalarValue37 == scalarValue36) && (scalarValue38 == scalarValue37))
                    {
                        float scalarValue39 = spvNClamp(2.0 - sumValue18, 0.0, 1.0);
                        float productValue15;
                        float productValue16;
                        float productValue17;
                        if (scalarValue39 > 0.0)
                        {
                            bool sampledTextureValue27 = uint(textureQueryLevels(materialTexture0)) > 0u;
                            uvec2 sampledTextureValue28 = uvec2(textureSize(materialTexture0, int(0u)));
                            uint scalarValue40 = sampledTextureValue28.x;
                            float comparisonValue23 = rdEvaluateFloatExpression(sampledTextureValue27 ? scalarValue40 : 0u);
                            float comparisonValue24 = rdEvaluateFloatExpression(sampledTextureValue27 ? sampledTextureValue28.y : 0u);
                            float productValue42 = fract(multiplyAddValue18 * comparisonValue23);
                            float productValue43 = fract(multiplyAddValue19 * comparisonValue24);
                            vec4 sampledTextureValue29 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue42 - 0.5) < 0.0625) ? (multiplyAddValue18 + ((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue18, (abs(productValue43 - 0.5) < 0.0625) ? (multiplyAddValue19 + ((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue19));
                            float scalarValue41 = sampledTextureValue29.x;
                            float scalarValue42 = sampledTextureValue29.y;
                            float scalarValue43 = sampledTextureValue29.z;
                            float scalarValue44 = sampledTextureValue29.w;
                            float multiplyAddValue20 = fract(fma(multiplyAddValue18, comparisonValue23, 0.5));
                            float multiplyAddValue21 = fract(fma(multiplyAddValue19, comparisonValue24, 0.5));
                            bool conditionValue8 = multiplyAddValue21 > 0.5;
                            bool conditionValue9 = multiplyAddValue20 > 0.5;
                            float comparisonValue25 = conditionValue8 ? scalarValue41 : scalarValue44;
                            float comparisonValue26 = conditionValue8 ? scalarValue42 : scalarValue43;
                            float comparisonValue27 = conditionValue9 ? scalarValue43 : scalarValue44;
                            float comparisonValue28 = conditionValue9 ? scalarValue42 : scalarValue41;
                            float sumValue19 = multiplyAddValue20 - 0.083333335816860198974609375;
                            float sumValue20 = multiplyAddValue20 + 0.083333335816860198974609375;
                            float sumValue21 = multiplyAddValue21 - 0.083333335816860198974609375;
                            float sumValue22 = multiplyAddValue21 + 0.083333335816860198974609375;
                            uint sumValue23 = uint(int(spvNClamp(sumValue19 + sumValue19, 0.0, 1.0)));
                            uint sumValue24 = uint(int(spvNClamp(sumValue20 + sumValue20, 0.0, 1.0)));
                            uint sumValue25 = uint(int(spvNClamp(sumValue21 + sumValue21, 0.0, 1.0)));
                            uint sumValue26 = uint(int(spvNClamp(sumValue22 + sumValue22, 0.0, 1.0)));
                            float comparisonValue29 = ((sumValue23 == 1u) ? comparisonValue26 : ((sumValue23 == 0u) ? comparisonValue25 : 0.0)) - ((sumValue24 == 1u) ? comparisonValue26 : ((sumValue24 == 0u) ? comparisonValue25 : 0.0));
                            float comparisonValue30 = ((sumValue25 == 1u) ? comparisonValue28 : ((sumValue25 == 0u) ? comparisonValue27 : 0.0)) - ((sumValue26 == 1u) ? comparisonValue28 : ((sumValue26 == 0u) ? comparisonValue27 : 0.0));
                            vec3 vectorValue1 = vec3(comparisonValue29, comparisonValue30, 0.25);
                            float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                            productValue15 = scalarValue39 * (inverseLengthValue8 * comparisonValue30);
                            productValue16 = scalarValue39 * (inverseLengthValue8 * comparisonValue29);
                            productValue17 = inverseLengthValue8 * 0.25;
                        }
                        else
                        {
                            productValue15 = 0.0;
                            productValue16 = 0.0;
                            productValue17 = 1.0;
                        }
                        intermediateValue48 = productValue15;
                        intermediateValue50 = productValue16;
                        intermediateValue52 = productValue17;
                    }
                    else
                    {
                        bool sampledTextureValue30 = uint(textureQueryLevels(materialTexture0)) > 0u;
                        uvec2 sampledTextureValue31 = uvec2(textureSize(materialTexture0, int(0u)));
                        uint scalarValue45 = sampledTextureValue31.x;
                        float sumValue27 = spvNClamp(2.0 - sumValue18, 0.0, 1.0);
                        bool conditionValue10 = sumValue27 > 0.0;
                        float comparisonValue31 = fract(multiplyAddValue18 * rdEvaluateFloatExpression(sampledTextureValue30 ? scalarValue45 : 0u));
                        float comparisonValue32 = fract(multiplyAddValue19 * rdEvaluateFloatExpression(sampledTextureValue30 ? sampledTextureValue31.y : 0u));
                        float multiplyAddValue22 = (comparisonValue31 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue26.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue23 = (comparisonValue32 <= 0.083333335816860198974609375) ? (-fma(scalarValue36, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue24 = (comparisonValue31 >= 0.916666686534881591796875) ? (fma(scalarValue37, 2.0, -1.0) + multiplyAddValue22) : multiplyAddValue22;
                        float multiplyAddValue25 = (comparisonValue32 >= 0.916666686534881591796875) ? (fma(scalarValue38, 2.0, -1.0) + multiplyAddValue23) : multiplyAddValue23;
                        bool comparisonValue33 = abs(multiplyAddValue24) >= 0.004999999888241291046142578125;
                        bool comparisonValue34 = abs(multiplyAddValue25) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue35 = vec3(comparisonValue33 ? multiplyAddValue24 : 0.0, comparisonValue34 ? multiplyAddValue25 : 0.0, 0.25);
                        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(comparisonValue35, comparisonValue35));
                        intermediateValue48 = (conditionValue10 && comparisonValue34) ? (sumValue27 * (inverseLengthValue9 * multiplyAddValue25)) : 0.0;
                        intermediateValue50 = (conditionValue10 && comparisonValue33) ? (sumValue27 * (inverseLengthValue9 * multiplyAddValue24)) : 0.0;
                        intermediateValue52 = conditionValue10 ? (inverseLengthValue9 * 0.25) : 1.0;
                    }
                    intermediateValue47 = intermediateValue48;
                    intermediateValue49 = intermediateValue50;
                    intermediateValue51 = intermediateValue52;
                }
                else
                {
                    intermediateValue47 = 0.0;
                    intermediateValue49 = 0.0;
                    intermediateValue51 = 1.0;
                }
                intermediateValue30 = intermediateValue47;
                intermediateValue31 = intermediateValue49;
                intermediateValue32 = intermediateValue51;
            }
            multiplyAddValue7 = intermediateValue30;
            multiplyAddValue8 = intermediateValue31;
            multiplyAddValue9 = intermediateValue32;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits10 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue * 16u) + 15u]);
            float intermediateValue28;
            float intermediateValue29;
            float intermediateValue30;
            if ((reinterpretedBits9 & 8u) == 8u)
            {
                float sumValue29 = spvNClamp(2.0 - spvNMin(reinterpretedBits10, reinterpretedBits10 - scalarValue51), 0.0, 1.0);
                float productValue10;
                float productValue11;
                float productValue12;
                if (sumValue29 > 0.0)
                {
                    float multiplyAddValue30 = fma(varyingTexCoord0.x, scalarValue46, scalarValue48);
                    float multiplyAddValue31 = fma(varyingTexCoord0.y, scalarValue47, scalarValue49);
                    bool sampledTextureValue23 = uint(textureQueryLevels(materialTexture0)) > 0u;
                    uvec2 sampledTextureValue24 = uvec2(textureSize(materialTexture0, int(0u)));
                    uint scalarValue31 = sampledTextureValue24.x;
                    float comparisonValue15 = rdEvaluateFloatExpression(sampledTextureValue23 ? scalarValue31 : 0u);
                    float comparisonValue16 = rdEvaluateFloatExpression(sampledTextureValue23 ? sampledTextureValue24.y : 0u);
                    float productValue51 = fract(multiplyAddValue30 * comparisonValue15);
                    float productValue52 = fract(multiplyAddValue31 * comparisonValue16);
                    vec4 sampledTextureValue35 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue51 - 0.5) < 0.0625) ? (multiplyAddValue30 + ((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue30, (abs(productValue52 - 0.5) < 0.0625) ? (multiplyAddValue31 + ((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue31));
                    float scalarValue52 = sampledTextureValue35.x;
                    float scalarValue53 = sampledTextureValue35.y;
                    float scalarValue54 = sampledTextureValue35.z;
                    float scalarValue55 = sampledTextureValue35.w;
                    float multiplyAddValue32 = fract(fma(multiplyAddValue30, comparisonValue15, 0.5));
                    float multiplyAddValue33 = fract(fma(multiplyAddValue31, comparisonValue16, 0.5));
                    bool conditionValue12 = multiplyAddValue33 > 0.5;
                    bool conditionValue13 = multiplyAddValue32 > 0.5;
                    float comparisonValue40 = conditionValue12 ? scalarValue52 : scalarValue55;
                    float comparisonValue41 = conditionValue12 ? scalarValue53 : scalarValue54;
                    float comparisonValue42 = conditionValue13 ? scalarValue54 : scalarValue55;
                    float comparisonValue43 = conditionValue13 ? scalarValue53 : scalarValue52;
                    float sumValue30 = multiplyAddValue32 - 0.083333335816860198974609375;
                    float sumValue31 = multiplyAddValue32 + 0.083333335816860198974609375;
                    float sumValue32 = multiplyAddValue33 - 0.083333335816860198974609375;
                    float sumValue33 = multiplyAddValue33 + 0.083333335816860198974609375;
                    uint sumValue34 = uint(int(spvNClamp(sumValue30 + sumValue30, 0.0, 1.0)));
                    uint sumValue35 = uint(int(spvNClamp(sumValue31 + sumValue31, 0.0, 1.0)));
                    uint sumValue36 = uint(int(spvNClamp(sumValue32 + sumValue32, 0.0, 1.0)));
                    uint sumValue37 = uint(int(spvNClamp(sumValue33 + sumValue33, 0.0, 1.0)));
                    float comparisonValue44 = ((sumValue34 == 1u) ? comparisonValue41 : ((sumValue34 == 0u) ? comparisonValue40 : 0.0)) - ((sumValue35 == 1u) ? comparisonValue41 : ((sumValue35 == 0u) ? comparisonValue40 : 0.0));
                    float comparisonValue45 = ((sumValue36 == 1u) ? comparisonValue43 : ((sumValue36 == 0u) ? comparisonValue42 : 0.0)) - ((sumValue37 == 1u) ? comparisonValue43 : ((sumValue37 == 0u) ? comparisonValue42 : 0.0));
                    vec3 vectorValue6 = vec3(comparisonValue44, comparisonValue45, 0.25);
                    float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
                    productValue10 = sumValue29 * (inverseLengthValue14 * comparisonValue45);
                    productValue11 = sumValue29 * (inverseLengthValue14 * comparisonValue44);
                    productValue12 = inverseLengthValue14 * 0.25;
                }
                else
                {
                    productValue10 = 0.0;
                    productValue11 = 0.0;
                    productValue12 = 1.0;
                }
                intermediateValue28 = productValue10;
                intermediateValue29 = productValue11;
                intermediateValue30 = productValue12;
            }
            else
            {
                float intermediateValue45;
                float intermediateValue47;
                float intermediateValue49;
                if ((reinterpretedBits9 & 16u) == 16u)
                {
                    float multiplyAddValue34 = fma(varyingTexCoord0.x, scalarValue46, scalarValue48);
                    float multiplyAddValue35 = fma(varyingTexCoord0.y, scalarValue47, scalarValue49);
                    float sumValue38 = spvNMin(reinterpretedBits10, reinterpretedBits10 - scalarValue51);
                    vec4 sampledTextureValue36 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue34, multiplyAddValue35), 0.0);
                    float scalarValue56 = sampledTextureValue36.x;
                    float scalarValue57 = sampledTextureValue36.y;
                    float scalarValue58 = sampledTextureValue36.z;
                    float intermediateValue46;
                    float intermediateValue48;
                    float intermediateValue50;
                    if ((scalarValue57 == scalarValue56) && (scalarValue58 == scalarValue57))
                    {
                        float scalarValue59 = spvNClamp(2.0 - sumValue38, 0.0, 1.0);
                        float productValue15;
                        float productValue16;
                        float productValue17;
                        if (scalarValue59 > 0.0)
                        {
                            bool sampledTextureValue27 = uint(textureQueryLevels(materialTexture0)) > 0u;
                            uvec2 sampledTextureValue28 = uvec2(textureSize(materialTexture0, int(0u)));
                            uint scalarValue40 = sampledTextureValue28.x;
                            float comparisonValue23 = rdEvaluateFloatExpression(sampledTextureValue27 ? scalarValue40 : 0u);
                            float comparisonValue24 = rdEvaluateFloatExpression(sampledTextureValue27 ? sampledTextureValue28.y : 0u);
                            float productValue53 = fract(multiplyAddValue34 * comparisonValue23);
                            float productValue54 = fract(multiplyAddValue35 * comparisonValue24);
                            vec4 sampledTextureValue37 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue53 - 0.5) < 0.0625) ? (multiplyAddValue34 + ((productValue53 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue34, (abs(productValue54 - 0.5) < 0.0625) ? (multiplyAddValue35 + ((productValue54 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue35));
                            float scalarValue60 = sampledTextureValue37.x;
                            float scalarValue61 = sampledTextureValue37.y;
                            float scalarValue62 = sampledTextureValue37.z;
                            float scalarValue63 = sampledTextureValue37.w;
                            float multiplyAddValue36 = fract(fma(multiplyAddValue34, comparisonValue23, 0.5));
                            float multiplyAddValue37 = fract(fma(multiplyAddValue35, comparisonValue24, 0.5));
                            bool conditionValue14 = multiplyAddValue37 > 0.5;
                            bool conditionValue15 = multiplyAddValue36 > 0.5;
                            float comparisonValue46 = conditionValue14 ? scalarValue60 : scalarValue63;
                            float comparisonValue47 = conditionValue14 ? scalarValue61 : scalarValue62;
                            float comparisonValue48 = conditionValue15 ? scalarValue62 : scalarValue63;
                            float comparisonValue49 = conditionValue15 ? scalarValue61 : scalarValue60;
                            float sumValue39 = multiplyAddValue36 - 0.083333335816860198974609375;
                            float sumValue40 = multiplyAddValue36 + 0.083333335816860198974609375;
                            float sumValue41 = multiplyAddValue37 - 0.083333335816860198974609375;
                            float sumValue42 = multiplyAddValue37 + 0.083333335816860198974609375;
                            uint sumValue43 = uint(int(spvNClamp(sumValue39 + sumValue39, 0.0, 1.0)));
                            uint sumValue44 = uint(int(spvNClamp(sumValue40 + sumValue40, 0.0, 1.0)));
                            uint sumValue45 = uint(int(spvNClamp(sumValue41 + sumValue41, 0.0, 1.0)));
                            uint sumValue46 = uint(int(spvNClamp(sumValue42 + sumValue42, 0.0, 1.0)));
                            float comparisonValue50 = ((sumValue43 == 1u) ? comparisonValue47 : ((sumValue43 == 0u) ? comparisonValue46 : 0.0)) - ((sumValue44 == 1u) ? comparisonValue47 : ((sumValue44 == 0u) ? comparisonValue46 : 0.0));
                            float comparisonValue51 = ((sumValue45 == 1u) ? comparisonValue49 : ((sumValue45 == 0u) ? comparisonValue48 : 0.0)) - ((sumValue46 == 1u) ? comparisonValue49 : ((sumValue46 == 0u) ? comparisonValue48 : 0.0));
                            vec3 vectorValue7 = vec3(comparisonValue50, comparisonValue51, 0.25);
                            float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
                            productValue15 = scalarValue59 * (inverseLengthValue15 * comparisonValue51);
                            productValue16 = scalarValue59 * (inverseLengthValue15 * comparisonValue50);
                            productValue17 = inverseLengthValue15 * 0.25;
                        }
                        else
                        {
                            productValue15 = 0.0;
                            productValue16 = 0.0;
                            productValue17 = 1.0;
                        }
                        intermediateValue46 = productValue15;
                        intermediateValue48 = productValue16;
                        intermediateValue50 = productValue17;
                    }
                    else
                    {
                        bool sampledTextureValue30 = uint(textureQueryLevels(materialTexture0)) > 0u;
                        uvec2 sampledTextureValue31 = uvec2(textureSize(materialTexture0, int(0u)));
                        uint scalarValue45 = sampledTextureValue31.x;
                        float sumValue47 = spvNClamp(2.0 - sumValue38, 0.0, 1.0);
                        bool conditionValue16 = sumValue47 > 0.0;
                        float comparisonValue52 = fract(multiplyAddValue34 * rdEvaluateFloatExpression(sampledTextureValue30 ? scalarValue45 : 0u));
                        float comparisonValue53 = fract(multiplyAddValue35 * rdEvaluateFloatExpression(sampledTextureValue30 ? sampledTextureValue31.y : 0u));
                        float multiplyAddValue38 = (comparisonValue52 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue36.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue39 = (comparisonValue53 <= 0.083333335816860198974609375) ? (-fma(scalarValue56, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue40 = (comparisonValue52 >= 0.916666686534881591796875) ? (fma(scalarValue57, 2.0, -1.0) + multiplyAddValue38) : multiplyAddValue38;
                        float multiplyAddValue41 = (comparisonValue53 >= 0.916666686534881591796875) ? (fma(scalarValue58, 2.0, -1.0) + multiplyAddValue39) : multiplyAddValue39;
                        bool comparisonValue54 = abs(multiplyAddValue40) >= 0.004999999888241291046142578125;
                        bool comparisonValue55 = abs(multiplyAddValue41) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue56 = vec3(comparisonValue54 ? multiplyAddValue40 : 0.0, comparisonValue55 ? multiplyAddValue41 : 0.0, 0.25);
                        float inverseLengthValue16 = inversesqrt(rdDot3Precise2(comparisonValue56, comparisonValue56));
                        intermediateValue46 = (conditionValue16 && comparisonValue55) ? (sumValue47 * (inverseLengthValue16 * multiplyAddValue41)) : 0.0;
                        intermediateValue48 = (conditionValue16 && comparisonValue54) ? (sumValue47 * (inverseLengthValue16 * multiplyAddValue40)) : 0.0;
                        intermediateValue50 = conditionValue16 ? (inverseLengthValue16 * 0.25) : 1.0;
                    }
                    intermediateValue45 = intermediateValue46;
                    intermediateValue47 = intermediateValue48;
                    intermediateValue49 = intermediateValue50;
                }
                else
                {
                    intermediateValue45 = 0.0;
                    intermediateValue47 = 0.0;
                    intermediateValue49 = 1.0;
                }
                intermediateValue28 = intermediateValue45;
                intermediateValue29 = intermediateValue47;
                intermediateValue30 = intermediateValue49;
            }
            multiplyAddValue7 = intermediateValue28;
            multiplyAddValue8 = intermediateValue29;
            multiplyAddValue9 = intermediateValue30;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue19 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7), fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8)));
            intermediateValue18 = (sampledTextureValue19.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue19.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue19.z * 2.0) + (-1.0);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue19 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7), fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8)));
            intermediateValue14 = (sampledTextureValue19.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue19.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue19.z * 2.0) + (-1.0);
#endif
        }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue22;
        float intermediateValue24;
        float intermediateValue26;
        float comparisonValue1;
        if ((reinterpretedBits3 & 1u) == 1u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue20;
        float intermediateValue22;
        float intermediateValue24;
        float comparisonValue;
        if ((reinterpretedBits9 & 1u) == 1u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue1;
        float sampledTextureValue2;
        float sampledTextureValue3;
        float intermediateValue11;
        if ((scalarValue5 & 1u) == 0u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue2;
        float sampledTextureValue3;
        float sampledTextureValue4;
        float intermediateValue7;
        if ((scalarValue5 & 1u) == 0u)
#endif
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 reinterpretedBits5 = uintBitsToFloat(intermediateValue3.packedValues[scalarValue * 4u]);
            vec4 sampledTextureValue32 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, reinterpretedBits5.x, reinterpretedBits5.z), fma(varyingTexCoord0.y, reinterpretedBits5.y, reinterpretedBits5.w)));
            comparisonValue1 = ((reinterpretedBits3 & 2u) == 2u) ? sampledTextureValue32.w : scalarValue29;
            intermediateValue26 = sampledTextureValue32.x;
            intermediateValue24 = sampledTextureValue32.z;
            intermediateValue22 = sampledTextureValue32.y;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 reinterpretedBits11 = uintBitsToFloat(intermediateValue4.packedValues[scalarValue * 4u]);
            vec4 sampledTextureValue38 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, reinterpretedBits11.x, reinterpretedBits11.z), fma(varyingTexCoord0.y, reinterpretedBits11.y, reinterpretedBits11.w)));
            comparisonValue = ((reinterpretedBits9 & 2u) == 2u) ? sampledTextureValue38.w : scalarValue50;
            intermediateValue24 = sampledTextureValue38.x;
            intermediateValue22 = sampledTextureValue38.z;
            intermediateValue20 = sampledTextureValue38.y;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 10u)).x);
            sampledTextureValue1 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 11u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 9u)).x);
            intermediateValue11 = sampledTextureValue10;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            sampledTextureValue4 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 10u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 11u)).x);
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 9u)).x);
            intermediateValue7 = sampledTextureValue10;
#endif
        }
        else
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue1 = scalarValue29;
            intermediateValue26 = reinterpretedBits1.w;
            intermediateValue24 = reinterpretedBits1.y;
            intermediateValue22 = reinterpretedBits1.z;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            comparisonValue = scalarValue50;
            intermediateValue24 = reinterpretedBits7.w;
            intermediateValue22 = reinterpretedBits7.y;
            intermediateValue20 = reinterpretedBits7.z;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue20 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 3u)).x))));
            sampledTextureValue3 = sampledTextureValue20.y;
            sampledTextureValue1 = sampledTextureValue20.x;
            sampledTextureValue2 = sampledTextureValue20.z;
            intermediateValue11 = ((scalarValue5 & 2u) != 0u) ? sampledTextureValue20.w : sampledTextureValue10;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue20 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 3u)).x))));
            sampledTextureValue4 = sampledTextureValue20.y;
            sampledTextureValue2 = sampledTextureValue20.x;
            sampledTextureValue3 = sampledTextureValue20.z;
            intermediateValue7 = ((scalarValue5 & 2u) != 0u) ? sampledTextureValue20.w : sampledTextureValue10;
#endif
        }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue36 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue37 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue38 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        vec3 vectorValue4 = vec3(comparisonValue36, comparisonValue37, comparisonValue38);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        intermediateValue21 = intermediateValue22;
        intermediateValue23 = intermediateValue24;
        multiplyAddValue = fma(inverseLengthValue12 * comparisonValue38, multiplyAddValue9, fma(inverseLengthValue10 * varyingTangent0.z, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue11 * varyingBitangent0.z)));
        multiplyAddValue1 = fma(inverseLengthValue12 * comparisonValue37, multiplyAddValue9, fma(inverseLengthValue10 * varyingTangent0.y, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue11 * varyingBitangent0.y)));
        multiplyAddValue2 = fma(inverseLengthValue12 * comparisonValue36, multiplyAddValue9, fma(inverseLengthValue10 * varyingTangent0.x, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue11 * varyingBitangent0.x)));
        intermediateValue25 = intermediateValue26;
        intermediateValue27 = comparisonValue1;
    }
    else
    {
        intermediateValue21 = 0.0;
        intermediateValue23 = 1.0;
        multiplyAddValue = 0.0;
        multiplyAddValue1 = 1.0;
        multiplyAddValue2 = 0.0;
        intermediateValue25 = 0.0;
        intermediateValue27 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue36 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue37 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue38 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        vec3 vectorValue4 = vec3(comparisonValue36, comparisonValue37, comparisonValue38);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        intermediateValue19 = intermediateValue20;
        intermediateValue21 = intermediateValue22;
        multiplyAddValue = fma(inverseLengthValue12 * comparisonValue38, multiplyAddValue9, fma(inverseLengthValue10 * varyingTangent0.z, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue11 * varyingBitangent0.z)));
        multiplyAddValue1 = fma(inverseLengthValue12 * comparisonValue37, multiplyAddValue9, fma(inverseLengthValue10 * varyingTangent0.y, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue11 * varyingBitangent0.y)));
        multiplyAddValue2 = fma(inverseLengthValue12 * comparisonValue36, multiplyAddValue9, fma(inverseLengthValue10 * varyingTangent0.x, multiplyAddValue8, multiplyAddValue7 * (inverseLengthValue11 * varyingBitangent0.x)));
        intermediateValue23 = intermediateValue24;
        intermediateValue25 = comparisonValue;
    }
    else
    {
        intermediateValue19 = 0.0;
        intermediateValue21 = 1.0;
        multiplyAddValue = 0.0;
        multiplyAddValue1 = 1.0;
        multiplyAddValue2 = 0.0;
        intermediateValue23 = 0.0;
        intermediateValue25 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue8 = comparisonValue2 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue12 = comparisonValue2 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue13 = comparisonValue2 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue8, comparisonValue12, comparisonValue13), vec3(comparisonValue8, comparisonValue12, comparisonValue13)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        intermediateValue7 = sampledTextureValue1;
        intermediateValue8 = sampledTextureValue2;
        intermediateValue9 = sampledTextureValue3;
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = fma(inverseLengthValue3 * comparisonValue8, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue19, inverseLengthValue5 * varyingTangent0.x));
        intermediateValue13 = fma(inverseLengthValue3 * comparisonValue12, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue19, inverseLengthValue5 * varyingTangent0.y));
        intermediateValue14 = fma(inverseLengthValue3 * comparisonValue13, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue19, inverseLengthValue5 * varyingTangent0.z));
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float comparisonValue8 = comparisonValue2 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue12 = comparisonValue2 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue13 = comparisonValue2 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue8, comparisonValue12, comparisonValue13), vec3(comparisonValue8, comparisonValue12, comparisonValue13)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue17 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue14;
        intermediateValue3 = sampledTextureValue2;
        intermediateValue4 = sampledTextureValue3;
        intermediateValue5 = sampledTextureValue4;
        intermediateValue6 = intermediateValue7;
        intermediateValue8 = fma(inverseLengthValue3 * comparisonValue8, intermediateValue16, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue15, inverseLengthValue17 * varyingTangent0.x));
        intermediateValue9 = fma(inverseLengthValue3 * comparisonValue12, intermediateValue16, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue15, inverseLengthValue17 * varyingTangent0.y));
        intermediateValue10 = fma(inverseLengthValue3 * comparisonValue13, intermediateValue16, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue15, inverseLengthValue17 * varyingTangent0.z));
#endif
    }
    float sumValue6 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    float sumValue7 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    float sumValue8 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor1.w = (intermediateValue27 < intermediateValue25) ? fma(intermediateValue25, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue27, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(multiplyAddValue2, multiplyAddValue1, multiplyAddValue);
    float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue44 = inverseLengthValue13 * multiplyAddValue2;
    float productValue45 = inverseLengthValue13 * multiplyAddValue1;
    float productValue46 = inverseLengthValue13 * multiplyAddValue;
    float quotientValue1 = 1.0 / (abs(productValue46) + (abs(productValue45) + abs(productValue44)));
    float productValue47 = quotientValue1 * productValue44;
    float productValue48 = quotientValue1 * productValue45;
    bool conditionValue11 = productValue46 < 0.0;
    float sumValue28 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? ((1.0 - abs(productValue48)) * ((productValue47 >= 0.0) ? sumValue28 : (-1.0))) : productValue47;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue47)) * ((productValue48 >= 0.0) ? sumValue28 : (-1.0))) : productValue48;
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[27u], sumValue8, fma(fragmentScalarConstants1.packedValues[19u], sumValue6, sumValue7 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue26, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue27, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue26, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue27, 0.5, 0.5);
    bool bitwiseValue = (((fragmentScalarConstants1.packedValues[33u] + fragmentScalarConstants1.packedValues[32u]) + fragmentScalarConstants1.packedValues[34u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[44u] > 9.9999997473787516355514526367188e-05);
    float productValue49 = fragmentScalarConstants1.packedValues[44u] * fragmentScalarConstants1.packedValues[44u];
    float comparisonValue39 = (bitwiseValue ? spvNMin(productValue49, 1.0) : fragmentVectorConstants1.packedValues[8u].x) * 0.16666667163372039794921875;
    float multiplyAddValue28 = (bitwiseValue ? spvNMin(fma(fma(productValue49, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue49, 1.0) : fragmentVectorConstants1.packedValues[8u].y) * 0.16666667163372039794921875;
    float multiplyAddValue29 = (bitwiseValue ? spvNMin(fma(productValue49 * productValue49, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue49, 1.0) : fragmentVectorConstants1.packedValues[8u].z) * 0.16666667163372039794921875;
    float productValue50 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue28, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue29, comparisonValue39)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue28 / productValue50, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue39 / productValue50, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue29 / productValue50, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue50, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(fragmentScalarConstants1.packedValues[45u], 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor1.w = (intermediateValue25 < intermediateValue23) ? fma(intermediateValue23, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue25, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(multiplyAddValue2, multiplyAddValue1, multiplyAddValue);
    float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue44 = inverseLengthValue13 * multiplyAddValue2;
    float productValue45 = inverseLengthValue13 * multiplyAddValue1;
    float productValue46 = inverseLengthValue13 * multiplyAddValue;
    float quotientValue1 = 1.0 / (abs(productValue46) + (abs(productValue45) + abs(productValue44)));
    float productValue47 = quotientValue1 * productValue44;
    float productValue48 = quotientValue1 * productValue45;
    bool conditionValue11 = productValue46 < 0.0;
    float sumValue28 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? ((1.0 - abs(productValue48)) * ((productValue47 >= 0.0) ? sumValue28 : (-1.0))) : productValue47;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue47)) * ((productValue48 >= 0.0) ? sumValue28 : (-1.0))) : productValue48;
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[27u], sumValue8, fma(fragmentScalarConstants1.packedValues[19u], sumValue6, sumValue7 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue26, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue27, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue26, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue27, 0.5, 0.5);
    bool bitwiseValue1 = (((fragmentScalarConstants1.packedValues[33u] + fragmentScalarConstants1.packedValues[32u]) + fragmentScalarConstants1.packedValues[34u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[40u] > 9.9999997473787516355514526367188e-05);
    float productValue55 = fragmentScalarConstants1.packedValues[40u] * fragmentScalarConstants1.packedValues[40u];
    float comparisonValue57 = (bitwiseValue1 ? spvNMin(productValue55, 1.0) : fragmentVectorConstants1.packedValues[8u].x) * 0.16666667163372039794921875;
    float multiplyAddValue42 = (bitwiseValue1 ? spvNMin(fma(fma(productValue55, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue55, 1.0) : fragmentVectorConstants1.packedValues[8u].y) * 0.16666667163372039794921875;
    float multiplyAddValue43 = (bitwiseValue1 ? spvNMin(fma(productValue55 * productValue55, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue55, 1.0) : fragmentVectorConstants1.packedValues[8u].z) * 0.16666667163372039794921875;
    float productValue56 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue42, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue43, comparisonValue57)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue42 / productValue56, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue57 / productValue56, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue43 / productValue56, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue56, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(fragmentScalarConstants1.packedValues[41u], 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float inverseLengthValue6 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue30 = inverseLengthValue6 * intermediateValue12;
    float productValue31 = inverseLengthValue6 * intermediateValue13;
    float productValue32 = inverseLengthValue6 * intermediateValue14;
    float quotientValue = 1.0 / ((abs(productValue31) + abs(productValue30)) + abs(productValue32));
    float productValue33 = quotientValue * productValue30;
    float productValue34 = quotientValue * productValue31;
    bool conditionValue5 = productValue32 < 0.0;
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float intermediateValue17;
    float productValue12;
    float productValue13;
    if ((fragmentVectorConstants1.packedValues[11u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[8u].x + fragmentVectorConstants1.packedValues[8u].y) + fragmentVectorConstants1.packedValues[8u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue35 = fragmentVectorConstants1.packedValues[11u].x * fragmentVectorConstants1.packedValues[11u].x;
        intermediateValue17 = spvNClamp(productValue35, 0.0, 1.0);
        productValue12 = spvNClamp(((productValue35 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue35, 0.0, 1.0);
        productValue13 = spvNClamp((((productValue35 * productValue35) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue35, 0.0, 1.0);
    }
    else
    {
        intermediateValue17 = fragmentVectorConstants1.packedValues[8u].x;
        productValue12 = fragmentVectorConstants1.packedValues[8u].y;
        productValue13 = fragmentVectorConstants1.packedValues[8u].z;
    }
    float productValue36 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue37 = productValue12 * 0.16666667163372039794921875;
    float productValue38 = productValue13 * 0.16666667163372039794921875;
    float productValue39 = ceil(spvNClamp(spvNMax(spvNMax(productValue36, productValue38), spvNMax(productValue37, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue36 / productValue39, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue37 / productValue39, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue38 / productValue39, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue39, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[11u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = productValue3;
    fragmentColor1.y = productValue4;
    fragmentColor1.z = productValue5;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue5 ? (((productValue33 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue34))) : productValue33;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue33)) * ((productValue34 < 0.0) ? (-1.0) : 1.0)) : productValue34;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue13)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue13)) * 0.5;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float inverseLengthValue18 = inversesqrt(dot(vec3(intermediateValue8, intermediateValue9, intermediateValue10), vec3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue57 = inverseLengthValue18 * intermediateValue8;
    float productValue58 = inverseLengthValue18 * intermediateValue9;
    float productValue59 = inverseLengthValue18 * intermediateValue10;
    float quotientValue2 = 1.0 / ((abs(productValue58) + abs(productValue57)) + abs(productValue59));
    float productValue60 = quotientValue2 * productValue57;
    float productValue61 = quotientValue2 * productValue58;
    bool conditionValue17 = productValue59 < 0.0;
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float intermediateValue13;
    float productValue6;
    float productValue7;
    if ((fragmentVectorConstants1.packedValues[10u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[8u].x + fragmentVectorConstants1.packedValues[8u].y) + fragmentVectorConstants1.packedValues[8u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue62 = fragmentVectorConstants1.packedValues[10u].x * fragmentVectorConstants1.packedValues[10u].x;
        intermediateValue13 = spvNClamp(productValue62, 0.0, 1.0);
        productValue6 = spvNClamp(((productValue62 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue62, 0.0, 1.0);
        productValue7 = spvNClamp((((productValue62 * productValue62) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue62, 0.0, 1.0);
    }
    else
    {
        intermediateValue13 = fragmentVectorConstants1.packedValues[8u].x;
        productValue6 = fragmentVectorConstants1.packedValues[8u].y;
        productValue7 = fragmentVectorConstants1.packedValues[8u].z;
    }
    float productValue63 = intermediateValue13 * 0.16666667163372039794921875;
    float productValue64 = productValue6 * 0.16666667163372039794921875;
    float productValue65 = productValue7 * 0.16666667163372039794921875;
    float productValue66 = ceil(spvNClamp(spvNMax(spvNMax(productValue63, productValue65), spvNMax(productValue64, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue63 / productValue66, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue64 / productValue66, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue65 / productValue66, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue66, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[10u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = (sampledTextureValue.x * varyingColor0.w) * ((((sampledTextureValue39.x * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.y = (sampledTextureValue.y * varyingColor0.w) * ((((sampledTextureValue39.y * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.z = (sampledTextureValue.z * varyingColor0.w) * ((((sampledTextureValue39.z * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue17 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue17 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue13)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue13)) * 0.5;
#endif
}
