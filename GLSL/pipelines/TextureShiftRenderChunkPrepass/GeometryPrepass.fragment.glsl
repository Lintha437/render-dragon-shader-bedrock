#version 460
#extension GL_GOOGLE_include_directive : require
// TextureShiftRenderChunkPrepass / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
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
#define RD_BINDING_LAYOUT 2
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
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/TextureShiftRenderChunkPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool comparisonValue = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
#endif
    uint productValue = uint(int(varyingTexCoord6.y * 65535.0));
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue42 = productValue * 8u;
    vec4 sampledTextureValue29 = uintBitsToFloat(uvec4(texelFetch(intermediateValue2, int(productValue42)).x, texelFetch(intermediateValue2, int(productValue42 + 1u)).x, texelFetch(intermediateValue2, int(productValue42 + 2u)).x, texelFetch(intermediateValue2, int(productValue42 + 3u)).x));
    uint productValue43 = (productValue * 8u) + 4u;
    vec4 sampledTextureValue30 = uintBitsToFloat(uvec4(texelFetch(intermediateValue2, int(productValue43)).x, texelFetch(intermediateValue2, int(productValue43 + 1u)).x, texelFetch(intermediateValue2, int(productValue43 + 2u)).x, texelFetch(intermediateValue2, int(productValue43 + 3u)).x));
    float scalarValue20 = sampledTextureValue30.x;
    float scalarValue21 = sampledTextureValue30.y;
    float scalarValue22 = sampledTextureValue30.z;
    float multiplyAddValue14 = fma(-varyingTexCoord6.x, sampledTextureValue30.w, 1.0);
    float comparisonValue17 = (scalarValue22 == 0.0) ? float(scalarValue21 >= multiplyAddValue14) : (1.0 - spvNClamp((multiplyAddValue14 - scalarValue21) / scalarValue22, 0.0, 1.0));
    bool conditionValue7 = comparisonValue17 < 0.5;
    uint reinterpretedBits = uint(int(floatBitsToUint(scalarValue20)) >> int(16u)) & 65535u;
    float sumValue9 = sampledTextureValue29.x + varyingTexCoord0.x;
    float sumValue10 = sampledTextureValue29.y + varyingTexCoord0.y;
    float sumValue11 = sampledTextureValue29.z + varyingTexCoord0.x;
    float sumValue12 = sampledTextureValue29.w + varyingTexCoord0.y;
    uint reinterpretedBits1 = floatBitsToUint(scalarValue20) & 65535u;
    float comparisonValue18 = conditionValue7 ? sumValue9 : sumValue11;
    float comparisonValue19 = conditionValue7 ? sumValue10 : sumValue12;
    uint comparisonValue20 = conditionValue7 ? reinterpretedBits : reinterpretedBits1;
    vec4 sampledTextureValue31 = texture(sampler2D(materialTexture1, textureSampler1), vec2(sumValue9, sumValue10));
    float scalarValue23 = sampledTextureValue31.x;
    float scalarValue24 = sampledTextureValue31.y;
    float scalarValue25 = sampledTextureValue31.z;
    vec4 sampledTextureValue32 = texture(sampler2D(materialTexture1, textureSampler1), vec2(sumValue11, sumValue12));
    float multiplyAddValue15 = fma(comparisonValue17, sampledTextureValue32.x - scalarValue23, scalarValue23);
    float multiplyAddValue16 = fma(comparisonValue17, sampledTextureValue32.y - scalarValue24, scalarValue24);
    float multiplyAddValue17 = fma(comparisonValue17, sampledTextureValue32.z - scalarValue25, scalarValue25);
    float comparisonValue21 = (comparisonValue17 > 0.5) ? sampledTextureValue32.w : sampledTextureValue31.w;
    bool comparisonValue22 = varyingTexCoord2.y != 0.0;
    fragmentColor1.x = comparisonValue22 ? (fma(comparisonValue21, fma(multiplyAddValue15, varyingColor0.x, -multiplyAddValue15), multiplyAddValue15) * varyingColor0.w) : (multiplyAddValue15 * varyingColor0.x);
    fragmentColor1.y = comparisonValue22 ? (fma(comparisonValue21, fma(multiplyAddValue16, varyingColor0.y, -multiplyAddValue16), multiplyAddValue16) * varyingColor0.w) : (multiplyAddValue16 * varyingColor0.y);
    fragmentColor1.z = comparisonValue22 ? (fma(comparisonValue21, fma(multiplyAddValue17, varyingColor0.z, -multiplyAddValue17), multiplyAddValue17) * varyingColor0.w) : (multiplyAddValue17 * varyingColor0.z);
    float intermediateValue22;
    float intermediateValue24;
    float multiplyAddValue4;
    float multiplyAddValue5;
    float multiplyAddValue6;
    float intermediateValue26;
    float intermediateValue28;
    if (((!conditionValue7) && (reinterpretedBits1 != 65535u)) || (conditionValue7 && (reinterpretedBits != 65535u)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sampledTextureValue = uintBitsToFloat(texelFetch(textureShiftBufferData, int(productValue * 8u)).x);
    float sampledTextureValue1 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 1u)).x);
    float sampledTextureValue2 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 2u)).x);
    float sampledTextureValue3 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 3u)).x);
    uvec4 sampledTextureValue4 = texelFetch(textureShiftBufferData, int((productValue * 8u) + 4u));
    uint scalarValue = sampledTextureValue4.x;
    float sampledTextureValue5 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 5u)).x);
    float sampledTextureValue6 = uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 6u)).x);
    float sampledTextureValue7 = 1.0 - (uintBitsToFloat(texelFetch(textureShiftBufferData, int((productValue * 8u) + 7u)).x) * varyingTexCoord6.x);
    float quotientValue;
    if (sampledTextureValue6 == 0.0)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM50
        uint productValue44 = (comparisonValue20 * 16u) + 4u;
        vec4 sampledTextureValue33 = uintBitsToFloat(uvec4(texelFetch(intermediateValue1, int(productValue44)).x, texelFetch(intermediateValue1, int(productValue44 + 1u)).x, texelFetch(intermediateValue1, int(productValue44 + 2u)).x, texelFetch(intermediateValue1, int(productValue44 + 3u)).x));
        float scalarValue26 = sampledTextureValue33.x;
        float scalarValue27 = sampledTextureValue33.y;
        float scalarValue28 = sampledTextureValue33.z;
        float scalarValue29 = sampledTextureValue33.w;
        uint productValue45 = (comparisonValue20 * 16u) + 8u;
        vec4 sampledTextureValue34 = uintBitsToFloat(uvec4(texelFetch(intermediateValue1, int(productValue45)).x, texelFetch(intermediateValue1, int(productValue45 + 1u)).x, texelFetch(intermediateValue1, int(productValue45 + 2u)).x, texelFetch(intermediateValue1, int(productValue45 + 3u)).x));
        uint productValue46 = (comparisonValue20 * 16u) + 12u;
        vec2 sampledTextureValue35 = uintBitsToFloat(uvec2(texelFetch(intermediateValue1, int(productValue46)).x, texelFetch(intermediateValue1, int(productValue46 + 1u)).x));
        float scalarValue30 = sampledTextureValue35.x;
        float scalarValue31 = sampledTextureValue35.y;
        uint reinterpretedBits2 = floatBitsToUint(sampledTextureValue34.x);
        float multiplyAddValue11;
        float multiplyAddValue12;
        float multiplyAddValue13;
        if ((reinterpretedBits2 & 4u) == 4u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        quotientValue = (sampledTextureValue5 < sampledTextureValue7) ? 0.0 : 1.0;
    }
    else
    {
        quotientValue = 1.0 - spvNMin(spvNMax((sampledTextureValue7 - sampledTextureValue5) / sampledTextureValue6, 0.0), 1.0);
    }
    bool conditionValue = quotientValue < 0.5;
    precise float comparisonValue1 = varyingTexCoord0.y + (conditionValue ? sampledTextureValue1 : sampledTextureValue3);
    precise float comparisonValue2 = varyingTexCoord0.x + (conditionValue ? sampledTextureValue : sampledTextureValue2);
    uint comparisonValue3 = (conditionValue ? (scalarValue >> 16u) : scalarValue) & 65535u;
    vec4 sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(sampledTextureValue + varyingTexCoord0.x, sampledTextureValue1 + varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue8.x;
    float scalarValue2 = sampledTextureValue8.y;
    float scalarValue3 = sampledTextureValue8.z;
    vec4 sampledTextureValue9 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(sampledTextureValue2 + varyingTexCoord0.x, sampledTextureValue3 + varyingTexCoord0.y));
    float productValue1 = ((sampledTextureValue9.x - scalarValue1) * quotientValue) + scalarValue1;
    float productValue2 = ((sampledTextureValue9.y - scalarValue2) * quotientValue) + scalarValue2;
    float productValue3 = ((sampledTextureValue9.z - scalarValue3) * quotientValue) + scalarValue3;
    float comparisonValue4 = (quotientValue > 0.5) ? sampledTextureValue9.w : sampledTextureValue8.w;
    float productValue4 = productValue1 * varyingColor0.x;
    float productValue5 = productValue2 * varyingColor0.y;
    float productValue6 = productValue3 * varyingColor0.z;
    float productValue7;
    float productValue8;
    float productValue9;
    if (varyingTexCoord2.y != 0.0)
    {
        productValue7 = (((productValue4 - productValue1) * comparisonValue4) + productValue1) * varyingColor0.w;
        productValue8 = (((productValue5 - productValue2) * comparisonValue4) + productValue2) * varyingColor0.w;
        productValue9 = (((productValue6 - productValue3) * comparisonValue4) + productValue3) * varyingColor0.w;
    }
    else
    {
        productValue7 = productValue4;
        productValue8 = productValue5;
        productValue9 = productValue6;
    }
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if (comparisonValue3 == 65535u)
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
        float sampledTextureValue13 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 4u)).x);
        float sampledTextureValue14 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 5u)).x);
        float sampledTextureValue15 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 6u)).x);
        float sampledTextureValue16 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 7u)).x);
        uvec4 sampledTextureValue17 = texelFetch(pbrData, int((comparisonValue3 * 16u) + 8u));
        uint scalarValue4 = sampledTextureValue17.x;
        float sampledTextureValue18 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 12u)).x);
        float sampledTextureValue19 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 13u)).x);
        float sampledTextureValue20 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 15u)).x);
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue4 & 4u) == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            vec4 sampledTextureValue36 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(comparisonValue18, scalarValue26, scalarValue28), fma(comparisonValue19, scalarValue27, scalarValue29)));
            multiplyAddValue11 = fma(sampledTextureValue36.y, 2.0, -1.0);
            multiplyAddValue12 = fma(sampledTextureValue36.x, 2.0, -1.0);
            multiplyAddValue13 = fma(sampledTextureValue36.z, 2.0, -1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue4 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue4 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue = fma(comparisonValue2, sampledTextureValue13, sampledTextureValue15);
                    float multiplyAddValue1 = fma(comparisonValue1, sampledTextureValue14, sampledTextureValue16);
                    vec4 sampledTextureValue21 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue, multiplyAddValue1), 0.0);
                    float scalarValue5 = sampledTextureValue21.x;
                    float scalarValue6 = sampledTextureValue21.y;
                    float scalarValue7 = sampledTextureValue21.z;
                    float multiplyAddValue2 = spvNClamp(fma(spvNMin(sampledTextureValue20 - sampledTextureValue19, sampledTextureValue20), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue1 = multiplyAddValue2 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue5 == scalarValue6) && (scalarValue6 == scalarValue7))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue1)
                        {
                            uvec2 sampledTextureValue22 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue10 = float(int(uint(int(float(int(sampledTextureValue22.x)))))) * multiplyAddValue;
                            float productValue11 = float(int(uint(int(float(int(sampledTextureValue22.y)))))) * multiplyAddValue1;
                            float scalarValue8 = fract(productValue10);
                            float scalarValue9 = fract(productValue11);
                            float comparisonValue14;
                            if (abs(scalarValue8 + (-0.5)) < 0.0625)
                            {
                                comparisonValue14 = ((scalarValue8 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue;
                            }
                            else
                            {
                                comparisonValue14 = multiplyAddValue;
                            }
                            float comparisonValue15;
                            if (abs(scalarValue9 + (-0.5)) < 0.0625)
                            {
                                comparisonValue15 = ((scalarValue9 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue15 = multiplyAddValue1;
                            }
                            vec4 sampledTextureValue23 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue14, comparisonValue15));
                            float scalarValue10 = sampledTextureValue23.x;
                            float scalarValue11 = sampledTextureValue23.y;
                            float scalarValue12 = sampledTextureValue23.z;
                            float scalarValue13 = sampledTextureValue23.w;
                            float sumValue = fract(productValue10 + 0.5);
                            float sumValue1 = fract(productValue11 + 0.5);
                            bool conditionValue2 = sumValue1 > 0.5;
                            float intermediateValue[2];
                            intermediateValue[0u] = conditionValue2 ? scalarValue10 : scalarValue13;
                            intermediateValue[1u] = conditionValue2 ? scalarValue11 : scalarValue12;
                            float productValue12 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue13 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue2 = productValue12 - productValue13;
                            bool conditionValue3 = sumValue > 0.5;
                            intermediateValue[0u] = conditionValue3 ? scalarValue12 : scalarValue13;
                            intermediateValue[1u] = conditionValue3 ? scalarValue11 : scalarValue10;
                            float productValue14 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue = inversesqrt(dot(vec3(sumValue2, productValue14, 0.25), vec3(sumValue2, productValue14, 0.25)));
                            float productValue15 = inverseLengthValue * multiplyAddValue2;
                            branchMergedValue12 = productValue15 * sumValue2;
                            branchMergedValue14 = productValue15 * productValue14;
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
                        uvec2 sampledTextureValue24 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue1)
                        {
                            float productValue20 = fract(float(int(uint(int(float(int(sampledTextureValue24.x)))))) * multiplyAddValue);
                            float productValue21 = fract(float(int(uint(int(float(int(sampledTextureValue24.y)))))) * multiplyAddValue1);
                            float comparisonValue5 = (((productValue20 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue6 * 2.0) + (-1.0))) - (((productValue20 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue21.w * 2.0) + (-1.0)));
                            float comparisonValue7 = (((productValue21 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue7 * 2.0) + (-1.0))) - (((productValue21 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue5 * 2.0) + (-1.0)));
                            float comparisonValue9 = ((abs(comparisonValue5) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue5;
                            float comparisonValue10 = ((abs(comparisonValue7) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue7;
                            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue9, comparisonValue10, 0.25), vec3(comparisonValue9, comparisonValue10, 0.25)));
                            float productValue25 = inverseLengthValue1 * multiplyAddValue2;
                            branchMergedValue13 = productValue25 * comparisonValue9;
                            branchMergedValue16 = productValue25 * comparisonValue10;
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
                float multiplyAddValue3 = fma(comparisonValue2, sampledTextureValue13, sampledTextureValue15);
                float multiplyAddValue7 = fma(comparisonValue1, sampledTextureValue14, sampledTextureValue16);
                float multiplyAddValue8 = spvNClamp(fma(spvNMin(sampledTextureValue20 - sampledTextureValue19, sampledTextureValue20), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue8 > 0.0)
                {
                    uvec2 sampledTextureValue25 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue26 = float(int(uint(int(float(int(sampledTextureValue25.x)))))) * multiplyAddValue3;
                    float productValue27 = float(int(uint(int(float(int(sampledTextureValue25.y)))))) * multiplyAddValue7;
                    float scalarValue14 = fract(productValue26);
                    float scalarValue15 = fract(productValue27);
                    float comparisonValue8;
                    if (abs(scalarValue14 + (-0.5)) < 0.0625)
                    {
                        comparisonValue8 = ((scalarValue14 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue3;
                    }
                    else
                    {
                        comparisonValue8 = multiplyAddValue3;
                    }
                    float comparisonValue13;
                    if (abs(scalarValue15 + (-0.5)) < 0.0625)
                    {
                        comparisonValue13 = ((scalarValue15 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue7;
                    }
                    else
                    {
                        comparisonValue13 = multiplyAddValue7;
                    }
                    vec4 sampledTextureValue26 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue8, comparisonValue13));
                    float scalarValue16 = sampledTextureValue26.x;
                    float scalarValue17 = sampledTextureValue26.y;
                    float scalarValue18 = sampledTextureValue26.z;
                    float scalarValue19 = sampledTextureValue26.w;
                    float sumValue3 = fract(productValue26 + 0.5);
                    float sumValue4 = fract(productValue27 + 0.5);
                    bool conditionValue4 = sumValue4 > 0.5;
                    float intermediateValue1[2];
                    intermediateValue1[0u] = conditionValue4 ? scalarValue16 : scalarValue19;
                    intermediateValue1[1u] = conditionValue4 ? scalarValue17 : scalarValue18;
                    float productValue28 = intermediateValue1[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue29 = intermediateValue1[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue5 = productValue28 - productValue29;
                    bool conditionValue5 = sumValue3 > 0.5;
                    intermediateValue1[0u] = conditionValue5 ? scalarValue18 : scalarValue19;
                    intermediateValue1[1u] = conditionValue5 ? scalarValue17 : scalarValue16;
                    float productValue30 = intermediateValue1[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue5, productValue30, 0.25), vec3(sumValue5, productValue30, 0.25)));
                    float productValue31 = inverseLengthValue2 * multiplyAddValue8;
                    branchMergedValue4 = productValue31 * sumValue5;
                    branchMergedValue7 = productValue31 * productValue30;
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
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float sampledTextureValue37 = uintBitsToFloat(texelFetch(intermediateValue1, int((comparisonValue20 * 16u) + 15u)).x);
            float intermediateValue31;
            float intermediateValue32;
            float intermediateValue33;
            if ((reinterpretedBits2 & 8u) == 8u)
            {
                float sumValue13 = spvNClamp(2.0 - spvNMin(sampledTextureValue37, sampledTextureValue37 - scalarValue31), 0.0, 1.0);
                float productValue17;
                float productValue18;
                float productValue19;
                if (sumValue13 > 0.0)
                {
                    float multiplyAddValue18 = fma(comparisonValue18, scalarValue26, scalarValue28);
                    float multiplyAddValue19 = fma(comparisonValue19, scalarValue27, scalarValue29);
                    bool sampledTextureValue38 = uint(textureQueryLevels(materialTexture1)) > 0u;
                    uvec2 sampledTextureValue39 = uvec2(textureSize(materialTexture1, int(0u)));
                    uint scalarValue32 = sampledTextureValue39.x;
                    float comparisonValue23 = rdEvaluateFloatExpression(sampledTextureValue38 ? scalarValue32 : 0u);
                    float comparisonValue24 = rdEvaluateFloatExpression(sampledTextureValue38 ? sampledTextureValue39.y : 0u);
                    float productValue47 = fract(multiplyAddValue18 * comparisonValue23);
                    float productValue48 = fract(multiplyAddValue19 * comparisonValue24);
                    vec4 sampledTextureValue40 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue47 - 0.5) < 0.0625) ? (((productValue47 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue18) : multiplyAddValue18, (abs(productValue48 - 0.5) < 0.0625) ? (((productValue48 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue19) : multiplyAddValue19));
                    float scalarValue33 = sampledTextureValue40.x;
                    float scalarValue34 = sampledTextureValue40.y;
                    float scalarValue35 = sampledTextureValue40.z;
                    float scalarValue36 = sampledTextureValue40.w;
                    float multiplyAddValue20 = fract(fma(multiplyAddValue18, comparisonValue23, 0.5));
                    float multiplyAddValue21 = fract(fma(multiplyAddValue19, comparisonValue24, 0.5));
                    bool conditionValue8 = multiplyAddValue21 > 0.5;
                    bool conditionValue9 = multiplyAddValue20 > 0.5;
                    float comparisonValue25 = conditionValue8 ? scalarValue33 : scalarValue36;
                    float comparisonValue26 = conditionValue8 ? scalarValue34 : scalarValue35;
                    float comparisonValue27 = conditionValue9 ? scalarValue35 : scalarValue36;
                    float comparisonValue28 = conditionValue9 ? scalarValue34 : scalarValue33;
                    float sumValue14 = multiplyAddValue20 - 0.083333335816860198974609375;
                    float sumValue15 = multiplyAddValue20 + 0.083333335816860198974609375;
                    float sumValue16 = multiplyAddValue21 - 0.083333335816860198974609375;
                    float sumValue17 = multiplyAddValue21 + 0.083333335816860198974609375;
                    uint sumValue18 = uint(int(spvNClamp(sumValue14 + sumValue14, 0.0, 1.0)));
                    uint sumValue19 = uint(int(spvNClamp(sumValue15 + sumValue15, 0.0, 1.0)));
                    uint sumValue20 = uint(int(spvNClamp(sumValue16 + sumValue16, 0.0, 1.0)));
                    uint sumValue21 = uint(int(spvNClamp(sumValue17 + sumValue17, 0.0, 1.0)));
                    float comparisonValue29 = ((sumValue18 == 1u) ? comparisonValue26 : ((sumValue18 == 0u) ? comparisonValue25 : 0.0)) - ((sumValue19 == 1u) ? comparisonValue26 : ((sumValue19 == 0u) ? comparisonValue25 : 0.0));
                    float comparisonValue30 = ((sumValue20 == 1u) ? comparisonValue28 : ((sumValue20 == 0u) ? comparisonValue27 : 0.0)) - ((sumValue21 == 1u) ? comparisonValue28 : ((sumValue21 == 0u) ? comparisonValue27 : 0.0));
                    vec3 vectorValue = vec3(comparisonValue29, comparisonValue30, 0.25);
                    float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                    productValue17 = sumValue13 * (inverseLengthValue7 * comparisonValue30);
                    productValue18 = sumValue13 * (inverseLengthValue7 * comparisonValue29);
                    productValue19 = inverseLengthValue7 * 0.25;
                }
                else
                {
                    productValue17 = 0.0;
                    productValue18 = 0.0;
                    productValue19 = 1.0;
                }
                intermediateValue31 = productValue17;
                intermediateValue32 = productValue18;
                intermediateValue33 = productValue19;
            }
            else
            {
                float intermediateValue48;
                float intermediateValue50;
                float intermediateValue52;
                if ((reinterpretedBits2 & 16u) == 16u)
                {
                    float multiplyAddValue22 = fma(comparisonValue18, scalarValue26, scalarValue28);
                    float multiplyAddValue23 = fma(comparisonValue19, scalarValue27, scalarValue29);
                    float sumValue22 = spvNMin(sampledTextureValue37, sampledTextureValue37 - scalarValue31);
                    vec4 sampledTextureValue41 = textureLod(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue22, multiplyAddValue23), 0.0);
                    float scalarValue37 = sampledTextureValue41.x;
                    float scalarValue38 = sampledTextureValue41.y;
                    float scalarValue39 = sampledTextureValue41.z;
                    float intermediateValue49;
                    float intermediateValue51;
                    float intermediateValue53;
                    if ((scalarValue38 == scalarValue37) && (scalarValue39 == scalarValue38))
                    {
                        float scalarValue40 = spvNClamp(2.0 - sumValue22, 0.0, 1.0);
                        float productValue22;
                        float productValue23;
                        float productValue24;
                        if (scalarValue40 > 0.0)
                        {
                            bool sampledTextureValue42 = uint(textureQueryLevels(materialTexture1)) > 0u;
                            uvec2 sampledTextureValue43 = uvec2(textureSize(materialTexture1, int(0u)));
                            uint scalarValue41 = sampledTextureValue43.x;
                            float comparisonValue31 = rdEvaluateFloatExpression(sampledTextureValue42 ? scalarValue41 : 0u);
                            float comparisonValue32 = rdEvaluateFloatExpression(sampledTextureValue42 ? sampledTextureValue43.y : 0u);
                            float productValue49 = fract(multiplyAddValue22 * comparisonValue31);
                            float productValue50 = fract(multiplyAddValue23 * comparisonValue32);
                            vec4 sampledTextureValue44 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue49 - 0.5) < 0.0625) ? (multiplyAddValue22 + ((productValue49 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue22, (abs(productValue50 - 0.5) < 0.0625) ? (multiplyAddValue23 + ((productValue50 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue23));
                            float scalarValue42 = sampledTextureValue44.x;
                            float scalarValue43 = sampledTextureValue44.y;
                            float scalarValue44 = sampledTextureValue44.z;
                            float scalarValue45 = sampledTextureValue44.w;
                            float multiplyAddValue24 = fract(fma(multiplyAddValue22, comparisonValue31, 0.5));
                            float multiplyAddValue25 = fract(fma(multiplyAddValue23, comparisonValue32, 0.5));
                            bool conditionValue10 = multiplyAddValue25 > 0.5;
                            bool conditionValue11 = multiplyAddValue24 > 0.5;
                            float comparisonValue33 = conditionValue10 ? scalarValue42 : scalarValue45;
                            float comparisonValue34 = conditionValue10 ? scalarValue43 : scalarValue44;
                            float comparisonValue35 = conditionValue11 ? scalarValue44 : scalarValue45;
                            float comparisonValue36 = conditionValue11 ? scalarValue43 : scalarValue42;
                            float sumValue23 = multiplyAddValue24 - 0.083333335816860198974609375;
                            float sumValue24 = multiplyAddValue24 + 0.083333335816860198974609375;
                            float sumValue25 = multiplyAddValue25 - 0.083333335816860198974609375;
                            float sumValue26 = multiplyAddValue25 + 0.083333335816860198974609375;
                            uint sumValue27 = uint(int(spvNClamp(sumValue23 + sumValue23, 0.0, 1.0)));
                            uint sumValue28 = uint(int(spvNClamp(sumValue24 + sumValue24, 0.0, 1.0)));
                            uint sumValue29 = uint(int(spvNClamp(sumValue25 + sumValue25, 0.0, 1.0)));
                            uint sumValue30 = uint(int(spvNClamp(sumValue26 + sumValue26, 0.0, 1.0)));
                            float comparisonValue37 = ((sumValue27 == 1u) ? comparisonValue34 : ((sumValue27 == 0u) ? comparisonValue33 : 0.0)) - ((sumValue28 == 1u) ? comparisonValue34 : ((sumValue28 == 0u) ? comparisonValue33 : 0.0));
                            float comparisonValue38 = ((sumValue29 == 1u) ? comparisonValue36 : ((sumValue29 == 0u) ? comparisonValue35 : 0.0)) - ((sumValue30 == 1u) ? comparisonValue36 : ((sumValue30 == 0u) ? comparisonValue35 : 0.0));
                            vec3 vectorValue1 = vec3(comparisonValue37, comparisonValue38, 0.25);
                            float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                            productValue22 = scalarValue40 * (inverseLengthValue8 * comparisonValue38);
                            productValue23 = scalarValue40 * (inverseLengthValue8 * comparisonValue37);
                            productValue24 = inverseLengthValue8 * 0.25;
                        }
                        else
                        {
                            productValue22 = 0.0;
                            productValue23 = 0.0;
                            productValue24 = 1.0;
                        }
                        intermediateValue49 = productValue22;
                        intermediateValue51 = productValue23;
                        intermediateValue53 = productValue24;
                    }
                    else
                    {
                        bool sampledTextureValue45 = uint(textureQueryLevels(materialTexture1)) > 0u;
                        uvec2 sampledTextureValue46 = uvec2(textureSize(materialTexture1, int(0u)));
                        uint scalarValue46 = sampledTextureValue46.x;
                        float sumValue31 = spvNClamp(2.0 - sumValue22, 0.0, 1.0);
                        bool conditionValue12 = sumValue31 > 0.0;
                        float comparisonValue39 = fract(rdEvaluateFloatExpression(sampledTextureValue45 ? scalarValue46 : 0u) * multiplyAddValue22);
                        float comparisonValue40 = fract(rdEvaluateFloatExpression(sampledTextureValue45 ? sampledTextureValue46.y : 0u) * multiplyAddValue23);
                        float multiplyAddValue26 = (comparisonValue39 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue41.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue27 = (comparisonValue40 <= 0.083333335816860198974609375) ? (-fma(scalarValue37, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue28 = (comparisonValue39 >= 0.916666686534881591796875) ? (fma(scalarValue38, 2.0, -1.0) + multiplyAddValue26) : multiplyAddValue26;
                        float multiplyAddValue29 = (comparisonValue40 >= 0.916666686534881591796875) ? (fma(scalarValue39, 2.0, -1.0) + multiplyAddValue27) : multiplyAddValue27;
                        bool comparisonValue41 = abs(multiplyAddValue28) >= 0.004999999888241291046142578125;
                        bool comparisonValue42 = abs(multiplyAddValue29) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue43 = vec3(comparisonValue41 ? multiplyAddValue28 : 0.0, comparisonValue42 ? multiplyAddValue29 : 0.0, 0.25);
                        float inverseLengthValue9 = inversesqrt(rdDot3Precise2(comparisonValue43, comparisonValue43));
                        intermediateValue49 = (conditionValue12 && comparisonValue42) ? (sumValue31 * (inverseLengthValue9 * multiplyAddValue29)) : 0.0;
                        intermediateValue51 = (conditionValue12 && comparisonValue41) ? (sumValue31 * (inverseLengthValue9 * multiplyAddValue28)) : 0.0;
                        intermediateValue53 = conditionValue12 ? (inverseLengthValue9 * 0.25) : 1.0;
                    }
                    intermediateValue48 = intermediateValue49;
                    intermediateValue50 = intermediateValue51;
                    intermediateValue52 = intermediateValue53;
                }
                else
                {
                    intermediateValue48 = 0.0;
                    intermediateValue50 = 0.0;
                    intermediateValue52 = 1.0;
                }
                intermediateValue31 = intermediateValue48;
                intermediateValue32 = intermediateValue50;
                intermediateValue33 = intermediateValue52;
            }
            multiplyAddValue11 = intermediateValue31;
            multiplyAddValue12 = intermediateValue32;
            multiplyAddValue13 = intermediateValue33;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            vec4 sampledTextureValue27 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(comparisonValue2, sampledTextureValue13, sampledTextureValue15), fma(comparisonValue1, sampledTextureValue14, sampledTextureValue16)));
            intermediateValue18 = (sampledTextureValue27.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue27.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue27.z * 2.0) + (-1.0);
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float intermediateValue23;
        float intermediateValue25;
        float intermediateValue27;
        float comparisonValue6;
        if ((reinterpretedBits2 & 1u) == 1u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue10;
        float sampledTextureValue11;
        float sampledTextureValue12;
        float intermediateValue11;
        if ((scalarValue4 & 1u) == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            uint productValue51 = comparisonValue20 * 16u;
            vec4 sampledTextureValue47 = uintBitsToFloat(uvec4(texelFetch(intermediateValue1, int(productValue51)).x, texelFetch(intermediateValue1, int(productValue51 + 1u)).x, texelFetch(intermediateValue1, int(productValue51 + 2u)).x, texelFetch(intermediateValue1, int(productValue51 + 3u)).x));
            vec4 sampledTextureValue48 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(comparisonValue18, sampledTextureValue47.x, sampledTextureValue47.z), fma(comparisonValue19, sampledTextureValue47.y, sampledTextureValue47.w)));
            comparisonValue6 = ((reinterpretedBits2 & 2u) == 2u) ? sampledTextureValue48.w : scalarValue30;
            intermediateValue27 = sampledTextureValue48.x;
            intermediateValue25 = sampledTextureValue48.z;
            intermediateValue23 = sampledTextureValue48.y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            sampledTextureValue12 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 10u)).x);
            sampledTextureValue10 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 11u)).x);
            sampledTextureValue11 = uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 9u)).x);
            intermediateValue11 = sampledTextureValue18;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            comparisonValue6 = scalarValue30;
            intermediateValue27 = sampledTextureValue34.w;
            intermediateValue25 = sampledTextureValue34.y;
            intermediateValue23 = sampledTextureValue34.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            vec4 sampledTextureValue28 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(comparisonValue2, uintBitsToFloat(texelFetch(pbrData, int(comparisonValue3 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 2u)).x)), fma(comparisonValue1, uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((comparisonValue3 * 16u) + 3u)).x))));
            sampledTextureValue12 = sampledTextureValue28.y;
            sampledTextureValue10 = sampledTextureValue28.x;
            sampledTextureValue11 = sampledTextureValue28.z;
            intermediateValue11 = ((scalarValue4 & 2u) != 0u) ? sampledTextureValue28.w : sampledTextureValue18;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float comparisonValue44 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue45 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue46 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        vec3 vectorValue4 = vec3(comparisonValue44, comparisonValue45, comparisonValue46);
        float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        intermediateValue22 = intermediateValue23;
        intermediateValue24 = intermediateValue25;
        multiplyAddValue4 = fma(inverseLengthValue12 * comparisonValue46, multiplyAddValue13, fma(inverseLengthValue10 * varyingTangent0.z, multiplyAddValue12, multiplyAddValue11 * (inverseLengthValue11 * varyingBitangent0.z)));
        multiplyAddValue5 = fma(inverseLengthValue12 * comparisonValue45, multiplyAddValue13, fma(inverseLengthValue10 * varyingTangent0.y, multiplyAddValue12, multiplyAddValue11 * (inverseLengthValue11 * varyingBitangent0.y)));
        multiplyAddValue6 = fma(inverseLengthValue12 * comparisonValue44, multiplyAddValue13, fma(inverseLengthValue10 * varyingTangent0.x, multiplyAddValue12, multiplyAddValue11 * (inverseLengthValue11 * varyingBitangent0.x)));
        intermediateValue26 = intermediateValue27;
        intermediateValue28 = comparisonValue6;
    }
    else
    {
        intermediateValue22 = 0.0;
        intermediateValue24 = 1.0;
        multiplyAddValue4 = 0.0;
        multiplyAddValue5 = 1.0;
        multiplyAddValue6 = 0.0;
        intermediateValue26 = 0.0;
        intermediateValue28 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float comparisonValue11 = comparisonValue ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue12 = comparisonValue ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue16 = comparisonValue ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue11, comparisonValue12, comparisonValue16), vec3(comparisonValue11, comparisonValue12, comparisonValue16)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        intermediateValue7 = sampledTextureValue10;
        intermediateValue8 = sampledTextureValue11;
        intermediateValue9 = sampledTextureValue12;
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = fma(inverseLengthValue3 * comparisonValue11, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue19, inverseLengthValue5 * varyingTangent0.x));
        intermediateValue13 = fma(inverseLengthValue3 * comparisonValue12, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue19, inverseLengthValue5 * varyingTangent0.y));
        intermediateValue14 = fma(inverseLengthValue3 * comparisonValue16, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue19, inverseLengthValue5 * varyingTangent0.z));
#endif
    }
    float sumValue6 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    float sumValue7 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    float sumValue8 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor1.w = (intermediateValue28 < intermediateValue26) ? fma(intermediateValue26, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue28, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(multiplyAddValue6, multiplyAddValue5, multiplyAddValue4);
    float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue52 = inverseLengthValue13 * multiplyAddValue6;
    float productValue53 = inverseLengthValue13 * multiplyAddValue5;
    float productValue54 = inverseLengthValue13 * multiplyAddValue4;
    float quotientValue2 = 1.0 / (abs(productValue54) + (abs(productValue53) + abs(productValue52)));
    float productValue55 = quotientValue2 * productValue52;
    float productValue56 = quotientValue2 * productValue53;
    bool conditionValue13 = productValue54 < 0.0;
    float sumValue32 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue13 ? ((1.0 - abs(productValue56)) * ((productValue55 >= 0.0) ? sumValue32 : (-1.0))) : productValue55;
    fragmentColor2.y = conditionValue13 ? ((1.0 - abs(productValue55)) * ((productValue56 >= 0.0) ? sumValue32 : (-1.0))) : productValue56;
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[27u], sumValue8, fma(fragmentScalarConstants1.packedValues[19u], sumValue6, sumValue7 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue30, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue31, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue30, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue6, sumValue7 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue31, 0.5, 0.5);
    bool bitwiseValue = (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05) && (varyingTexCoord1.x > 9.9999997473787516355514526367188e-05);
    float productValue37 = varyingTexCoord1.x * varyingTexCoord1.x;
    float comparisonValue47 = (bitwiseValue ? spvNMin(productValue37, 1.0) : varyingTexCoord5.x) * 0.16666667163372039794921875;
    float multiplyAddValue32 = (bitwiseValue ? spvNMin(fma(fma(productValue37, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue37, 1.0) : varyingTexCoord5.y) * 0.16666667163372039794921875;
    float multiplyAddValue33 = (bitwiseValue ? spvNMin(fma(productValue37 * productValue37, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue37, 1.0) : varyingTexCoord5.z) * 0.16666667163372039794921875;
    float productValue57 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue32, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue33, comparisonValue47)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue32 / productValue57, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue47 / productValue57, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue33 / productValue57, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue57, 0.0, 1.0) * 255.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float inverseLengthValue6 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue32 = inverseLengthValue6 * intermediateValue12;
    float productValue33 = inverseLengthValue6 * intermediateValue13;
    float productValue34 = inverseLengthValue6 * intermediateValue14;
    float quotientValue1 = 1.0 / ((abs(productValue33) + abs(productValue32)) + abs(productValue34));
    float productValue35 = quotientValue1 * productValue32;
    float productValue36 = quotientValue1 * productValue33;
    bool conditionValue6 = productValue34 < 0.0;
    float multiplyAddValue9 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue10 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float intermediateValue17;
    float productValue16;
    float productValue17;
    if ((varyingTexCoord1.x > 9.9999997473787516355514526367188e-05) && (((varyingTexCoord5.y + varyingTexCoord5.x) + varyingTexCoord5.z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue37 = varyingTexCoord1.x * varyingTexCoord1.x;
        intermediateValue17 = spvNClamp(productValue37, 0.0, 1.0);
        productValue16 = spvNClamp(((productValue37 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue37, 0.0, 1.0);
        productValue17 = spvNClamp((((productValue37 * productValue37) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue37, 0.0, 1.0);
    }
    else
    {
        intermediateValue17 = varyingTexCoord5.x;
        productValue16 = varyingTexCoord5.y;
        productValue17 = varyingTexCoord5.z;
    }
    float productValue38 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue39 = productValue16 * 0.16666667163372039794921875;
    float productValue40 = productValue17 * 0.16666667163372039794921875;
    float productValue41 = ceil(spvNClamp(spvNMax(spvNMax(productValue38, productValue40), spvNMax(productValue39, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue38 / productValue41, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue39 / productValue41, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue40 / productValue41, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue41, 0.0, 1.0) * 255.0) & 255u);
#endif
    fragmentColor0.w = uint(spvNClamp(varyingTexCoord1.y, 0.0, 1.0) * 255.0);
#if RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) * 256u);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor1.x = productValue7;
    fragmentColor1.y = productValue8;
    fragmentColor1.z = productValue9;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue35 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue36))) : productValue35;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue35)) * ((productValue36 < 0.0) ? (-1.0) : 1.0)) : productValue36;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue9) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue10)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue9) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue10)) * 0.5;
#endif
}
