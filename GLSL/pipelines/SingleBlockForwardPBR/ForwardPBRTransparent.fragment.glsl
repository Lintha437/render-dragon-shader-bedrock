#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlockForwardPBR / ForwardPBRTransparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
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
#endif
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_samplerless_texture_functions : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_SIGNED_BITS_TO_FLOAT_FLOAT_6 1
#endif

#include "../../include/materials/SingleBlockForwardPBR/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue72 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue88 = sampledTextureValue72.x;
    float scalarValue89 = sampledTextureValue72.y;
    float scalarValue90 = sampledTextureValue72.z;
    float scalarValue91 = sampledTextureValue72.w;
    bool comparisonValue102 = fragmentScalarConstants1.packedValues[260u] != 0.0;
    float multiplyAddValue57 = comparisonValue102 ? (fma(scalarValue91, fma(scalarValue88, varyingColor0.x, -scalarValue88), scalarValue88) * varyingColor0.w) : (scalarValue88 * varyingColor0.x);
    float multiplyAddValue58 = comparisonValue102 ? (fma(scalarValue91, fma(scalarValue89, varyingColor0.y, -scalarValue89), scalarValue89) * varyingColor0.w) : (scalarValue89 * varyingColor0.y);
    float multiplyAddValue59 = comparisonValue102 ? (fma(scalarValue91, fma(scalarValue90, varyingColor0.z, -scalarValue90), scalarValue90) * varyingColor0.w) : (scalarValue90 * varyingColor0.z);
    bool comparisonValue103 = fragmentScalarConstants1.packedValues[488u] != 0.0;
    float exponentialValue6 = comparisonValue103 ? exp2(log2(spvNMax(multiplyAddValue57, 0.0)) * 2.2000000476837158203125) : ((multiplyAddValue57 <= 0.040449999272823333740234375) ? (multiplyAddValue57 * 0.077399380505084991455078125) : exp2(log2((multiplyAddValue57 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue7 = comparisonValue103 ? exp2(log2(spvNMax(multiplyAddValue58, 0.0)) * 2.2000000476837158203125) : ((multiplyAddValue58 <= 0.040449999272823333740234375) ? (multiplyAddValue58 * 0.077399380505084991455078125) : exp2(log2((multiplyAddValue58 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue8 = comparisonValue103 ? exp2(log2(spvNMax(multiplyAddValue59, 0.0)) * 2.2000000476837158203125) : ((multiplyAddValue59 <= 0.040449999272823333740234375) ? (multiplyAddValue59 * 0.077399380505084991455078125) : exp2(log2((multiplyAddValue59 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue72 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue96 = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingColor0.x, varyingColor0.y));
    float multiplyAddValue246 = sampledTextureValue72.x * fma(varyingColor0.z, fma(sampledTextureValue96.x, 2.0, -1.0), 1.0);
    float multiplyAddValue247 = sampledTextureValue72.y * fma(varyingColor0.z, fma(sampledTextureValue96.y, 2.0, -1.0), 1.0);
    float multiplyAddValue248 = sampledTextureValue72.z * fma(varyingColor0.z, fma(sampledTextureValue96.z, 2.0, -1.0), 1.0);
    float productValue305 = multiplyAddValue246 * varyingColor0.w;
    float productValue306 = multiplyAddValue247 * varyingColor0.w;
    float productValue307 = multiplyAddValue248 * varyingColor0.w;
    bool comparisonValue183 = fragmentScalarConstants1.packedValues[484u] != 0.0;
    float multiplyAddValue249 = comparisonValue183 ? exp2(log2(spvNMax(productValue305, 0.0)) * 2.2000000476837158203125) : ((productValue305 <= 0.040449999272823333740234375) ? (productValue305 * 0.077399380505084991455078125) : exp2(log2(fma(multiplyAddValue246, varyingColor0.w, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float multiplyAddValue250 = comparisonValue183 ? exp2(log2(spvNMax(productValue306, 0.0)) * 2.2000000476837158203125) : ((productValue306 <= 0.040449999272823333740234375) ? (productValue306 * 0.077399380505084991455078125) : exp2(log2(fma(multiplyAddValue247, varyingColor0.w, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float multiplyAddValue251 = comparisonValue183 ? exp2(log2(spvNMax(productValue307, 0.0)) * 2.2000000476837158203125) : ((productValue307 <= 0.040449999272823333740234375) ? (productValue307 * 0.077399380505084991455078125) : exp2(log2(fma(multiplyAddValue248, varyingColor0.w, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool comparisonValue = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
#endif
    uint scalarValue = uint(varyingTexCoord4);
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float intermediateValue41;
    float intermediateValue42;
    float intermediateValue44;
    float intermediateValue46;
    float multiplyAddValue3;
    float multiplyAddValue4;
    float multiplyAddValue5;
    if (scalarValue != 65535u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float intermediateValue39;
    float intermediateValue40;
    float intermediateValue42;
    float intermediateValue44;
    float multiplyAddValue6;
    float multiplyAddValue7;
    float multiplyAddValue8;
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
    float intermediateValue10;
    if (fragmentVectorConstants1.packedValues[65u].x != 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue113 = texture(sampler2D(seasonsTextureTexture, seasonsTextureSampler), vec2(varyingColor0.x, varyingColor0.y));
    float productValue366 = (sampledTextureValue.x * varyingColor0.w) * ((((sampledTextureValue113.x * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    float productValue367 = (sampledTextureValue.y * varyingColor0.w) * ((((sampledTextureValue113.y * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    float productValue368 = (sampledTextureValue.z * varyingColor0.w) * ((((sampledTextureValue113.z * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[121u].x != 0.0)
#endif
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits = uintBitsToFloat(intermediateValue10.packedValues[(scalarValue * 4u) + 1u]);
        float scalarValue92 = reinterpretedBits.x;
        float scalarValue93 = reinterpretedBits.y;
        float scalarValue94 = reinterpretedBits.z;
        float scalarValue95 = reinterpretedBits.w;
        vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue10.packedValues[(scalarValue * 4u) + 2u]);
        vec2 reinterpretedBits2 = uintBitsToFloat(intermediateValue9.packedValues[(scalarValue * 8u) + 6u]);
        float scalarValue96 = reinterpretedBits2.x;
        float scalarValue97 = reinterpretedBits2.y;
        uint reinterpretedBits3 = floatBitsToUint(reinterpretedBits1.x);
        float multiplyAddValue34;
        float multiplyAddValue35;
        float multiplyAddValue36;
        if ((reinterpretedBits3 & 4u) == 4u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits12 = uintBitsToFloat(intermediateValue11.packedValues[(scalarValue * 4u) + 1u]);
        float scalarValue182 = reinterpretedBits12.x;
        float scalarValue183 = reinterpretedBits12.y;
        float scalarValue184 = reinterpretedBits12.z;
        float scalarValue185 = reinterpretedBits12.w;
        vec4 reinterpretedBits13 = uintBitsToFloat(intermediateValue11.packedValues[(scalarValue * 4u) + 2u]);
        vec2 reinterpretedBits14 = uintBitsToFloat(intermediateValue10.packedValues[(scalarValue * 8u) + 6u]);
        float scalarValue186 = reinterpretedBits14.x;
        float scalarValue187 = reinterpretedBits14.y;
        uint reinterpretedBits15 = floatBitsToUint(reinterpretedBits13.x);
        float multiplyAddValue37;
        float multiplyAddValue38;
        float multiplyAddValue39;
        if ((reinterpretedBits15 & 4u) == 4u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue3 = (((productValue - scalarValue1) * scalarValue4) + scalarValue1) * varyingColor0.w;
        productValue4 = (((productValue1 - scalarValue2) * scalarValue4) + scalarValue2) * varyingColor0.w;
        productValue5 = (((productValue2 - scalarValue3) * scalarValue4) + scalarValue3) * varyingColor0.w;
        intermediateValue10 = 1.0;
    }
    else
    {
        productValue3 = productValue;
        productValue4 = productValue1;
        productValue5 = productValue2;
        intermediateValue10 = scalarValue4 * varyingColor0.w;
    }
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[122u].x != 0.0)
    {
        exponentialValue = exp2(log2(spvNMax(productValue3, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(productValue4, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(productValue5, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (productValue3 <= 0.040449999272823333740234375) ? (productValue3 * 0.077399380505084991455078125) : exp2(log2((productValue3 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (productValue4 <= 0.040449999272823333740234375) ? (productValue4 * 0.077399380505084991455078125) : exp2(log2((productValue4 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (productValue5 <= 0.040449999272823333740234375) ? (productValue5 * 0.077399380505084991455078125) : exp2(log2((productValue5 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float multiplyAddValue;
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if (scalarValue == 65535u)
    {
        multiplyAddValue = 0.0;
        intermediateValue11 = 1.0;
        intermediateValue12 = 0.0;
        intermediateValue13 = 0.0;
        intermediateValue15 = 0.0;
        intermediateValue16 = 1.0;
        intermediateValue17 = 0.0;
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
        float intermediateValue24;
        float intermediateValue25;
        float intermediateValue26;
        if ((scalarValue5 & 4u) == 0u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        exponentialValue = exp2(log2(spvNMax(productValue366, 0.0)) * 2.2000000476837158203125);
        exponentialValue1 = exp2(log2(spvNMax(productValue367, 0.0)) * 2.2000000476837158203125);
        exponentialValue2 = exp2(log2(spvNMax(productValue368, 0.0)) * 2.2000000476837158203125);
    }
    else
    {
        exponentialValue = (productValue366 <= 0.040449999272823333740234375) ? (productValue366 * 0.077399380505084991455078125) : exp2(log2((productValue366 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue1 = (productValue367 <= 0.040449999272823333740234375) ? (productValue367 * 0.077399380505084991455078125) : exp2(log2((productValue367 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
        exponentialValue2 = (productValue368 <= 0.040449999272823333740234375) ? (productValue368 * 0.077399380505084991455078125) : exp2(log2((productValue368 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625);
    }
    float multiplyAddValue;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    if (scalarValue == 65535u)
    {
        multiplyAddValue = 0.0;
        intermediateValue6 = 1.0;
        intermediateValue7 = 0.0;
        intermediateValue8 = 0.0;
        intermediateValue10 = 0.0;
        intermediateValue11 = 1.0;
        intermediateValue12 = 0.0;
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
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
        if ((scalarValue5 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue73 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord0.x, scalarValue92, scalarValue94), fma(varyingTexCoord0.y, scalarValue93, scalarValue95)));
            multiplyAddValue34 = fma(sampledTextureValue73.y, 2.0, -1.0);
            multiplyAddValue35 = fma(sampledTextureValue73.x, 2.0, -1.0);
            multiplyAddValue36 = fma(sampledTextureValue73.z, 2.0, -1.0);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue97 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord0.x, scalarValue182, scalarValue184), fma(varyingTexCoord0.y, scalarValue183, scalarValue185)));
            multiplyAddValue37 = fma(sampledTextureValue97.y, 2.0, -1.0);
            multiplyAddValue38 = fma(sampledTextureValue97.x, 2.0, -1.0);
            multiplyAddValue39 = fma(sampledTextureValue97.z, 2.0, -1.0);
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue9;
            float branchMergedValue17;
            float branchMergedValue18;
            if ((scalarValue5 & 8u) == 0u)
            {
                float branchMergedValue48;
                float branchMergedValue52;
                float branchMergedValue53;
                if ((scalarValue5 & 16u) == 0u)
                {
                    branchMergedValue48 = 1.0;
                    branchMergedValue52 = 0.0;
                    branchMergedValue53 = 0.0;
                }
                else
                {
                    float multiplyAddValue1 = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                    float multiplyAddValue2 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                    vec4 sampledTextureValue15 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue1, multiplyAddValue2), 0.0);
                    float scalarValue6 = sampledTextureValue15.x;
                    float scalarValue7 = sampledTextureValue15.y;
                    float scalarValue8 = sampledTextureValue15.z;
                    float multiplyAddValue9 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue = multiplyAddValue9 > 0.0;
                    float branchMergedValue61;
                    float branchMergedValue63;
                    float branchMergedValue64;
                    if ((scalarValue6 == scalarValue7) && (scalarValue7 == scalarValue8))
                    {
                        float branchMergedValue68;
                        float branchMergedValue70;
                        float branchMergedValue71;
                        if (conditionValue)
                        {
                            uvec2 sampledTextureValue16 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue6 = float(int(uint(int(float(int(sampledTextureValue16.x)))))) * multiplyAddValue1;
                            float productValue7 = float(int(uint(int(float(int(sampledTextureValue16.y)))))) * multiplyAddValue2;
                            float scalarValue9 = fract(productValue6);
                            float scalarValue10 = fract(productValue7);
                            float comparisonValue18;
                            if (abs(scalarValue9 + (-0.5)) < 0.0625)
                            {
                                comparisonValue18 = ((scalarValue9 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue18 = multiplyAddValue1;
                            }
                            float comparisonValue20;
                            if (abs(scalarValue10 + (-0.5)) < 0.0625)
                            {
                                comparisonValue20 = ((scalarValue10 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue2;
                            }
                            else
                            {
                                comparisonValue20 = multiplyAddValue2;
                            }
                            vec4 sampledTextureValue17 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue18, comparisonValue20));
                            float scalarValue11 = sampledTextureValue17.x;
                            float scalarValue12 = sampledTextureValue17.y;
                            float scalarValue13 = sampledTextureValue17.z;
                            float scalarValue14 = sampledTextureValue17.w;
                            float sumValue = fract(productValue6 + 0.5);
                            float sumValue1 = fract(productValue7 + 0.5);
                            bool conditionValue1 = sumValue1 > 0.5;
                            float intermediateValue4[2];
                            intermediateValue4[0u] = conditionValue1 ? scalarValue11 : scalarValue14;
                            intermediateValue4[1u] = conditionValue1 ? scalarValue12 : scalarValue13;
                            float productValue8 = intermediateValue4[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue9 = intermediateValue4[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue2 = productValue8 - productValue9;
                            bool conditionValue2 = sumValue > 0.5;
                            intermediateValue4[0u] = conditionValue2 ? scalarValue13 : scalarValue14;
                            intermediateValue4[1u] = conditionValue2 ? scalarValue12 : scalarValue11;
                            float productValue10 = intermediateValue4[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue4[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue = inversesqrt(dot(vec3(sumValue2, productValue10, 0.25), vec3(sumValue2, productValue10, 0.25)));
                            float productValue11 = inverseLengthValue * multiplyAddValue9;
                            branchMergedValue68 = inverseLengthValue * 0.25;
                            branchMergedValue70 = productValue11 * productValue10;
                            branchMergedValue71 = productValue11 * sumValue2;
                        }
                        else
                        {
                            branchMergedValue68 = 1.0;
                            branchMergedValue70 = 0.0;
                            branchMergedValue71 = 0.0;
                        }
                        branchMergedValue61 = branchMergedValue68;
                        branchMergedValue63 = branchMergedValue70;
                        branchMergedValue64 = branchMergedValue71;
                    }
                    else
                    {
                        uvec2 sampledTextureValue18 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue69;
                        float branchMergedValue72;
                        float branchMergedValue73;
                        if (conditionValue)
                        {
                            float productValue12 = fract(float(int(uint(int(float(int(sampledTextureValue18.x)))))) * multiplyAddValue1);
                            float productValue13 = fract(float(int(uint(int(float(int(sampledTextureValue18.y)))))) * multiplyAddValue2);
                            float comparisonValue3 = (((productValue12 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue7 * 2.0) + (-1.0))) - (((productValue12 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue15.w * 2.0) + (-1.0)));
                            float comparisonValue4 = (((productValue13 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue8 * 2.0) + (-1.0))) - (((productValue13 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue6 * 2.0) + (-1.0)));
                            float comparisonValue5 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                            float comparisonValue6 = ((abs(comparisonValue4) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue4;
                            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue5, comparisonValue6, 0.25), vec3(comparisonValue5, comparisonValue6, 0.25)));
                            float productValue14 = inverseLengthValue1 * multiplyAddValue9;
                            branchMergedValue69 = inverseLengthValue1 * 0.25;
                            branchMergedValue72 = productValue14 * comparisonValue6;
                            branchMergedValue73 = productValue14 * comparisonValue5;
                        }
                        else
                        {
                            branchMergedValue69 = 1.0;
                            branchMergedValue72 = 0.0;
                            branchMergedValue73 = 0.0;
                        }
                        branchMergedValue61 = branchMergedValue69;
                        branchMergedValue63 = branchMergedValue72;
                        branchMergedValue64 = branchMergedValue73;
                    }
                    branchMergedValue48 = branchMergedValue61;
                    branchMergedValue52 = branchMergedValue63;
                    branchMergedValue53 = branchMergedValue64;
                }
                branchMergedValue9 = branchMergedValue48;
                branchMergedValue17 = branchMergedValue52;
                branchMergedValue18 = branchMergedValue53;
            }
            else
            {
                float multiplyAddValue10 = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                float multiplyAddValue11 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                float multiplyAddValue12 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue49;
                float branchMergedValue54;
                float branchMergedValue55;
                if (multiplyAddValue12 > 0.0)
                {
                    uvec2 sampledTextureValue19 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue15 = float(int(uint(int(float(int(sampledTextureValue19.x)))))) * multiplyAddValue10;
                    float productValue16 = float(int(uint(int(float(int(sampledTextureValue19.y)))))) * multiplyAddValue11;
                    float scalarValue15 = fract(productValue15);
                    float scalarValue16 = fract(productValue16);
                    float comparisonValue8;
                    if (abs(scalarValue15 + (-0.5)) < 0.0625)
                    {
                        comparisonValue8 = ((scalarValue15 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue10;
                    }
                    else
                    {
                        comparisonValue8 = multiplyAddValue10;
                    }
                    float comparisonValue17;
                    if (abs(scalarValue16 + (-0.5)) < 0.0625)
                    {
                        comparisonValue17 = ((scalarValue16 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue11;
                    }
                    else
                    {
                        comparisonValue17 = multiplyAddValue11;
                    }
                    vec4 sampledTextureValue24 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue8, comparisonValue17));
                    float scalarValue17 = sampledTextureValue24.x;
                    float scalarValue18 = sampledTextureValue24.y;
                    float scalarValue19 = sampledTextureValue24.z;
                    float scalarValue20 = sampledTextureValue24.w;
                    float sumValue3 = fract(productValue15 + 0.5);
                    float sumValue4 = fract(productValue16 + 0.5);
                    bool conditionValue3 = sumValue4 > 0.5;
                    float intermediateValue5[2];
                    intermediateValue5[0u] = conditionValue3 ? scalarValue17 : scalarValue20;
                    intermediateValue5[1u] = conditionValue3 ? scalarValue18 : scalarValue19;
                    float productValue17 = intermediateValue5[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue18 = intermediateValue5[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue5 = productValue17 - productValue18;
                    bool conditionValue4 = sumValue3 > 0.5;
                    intermediateValue5[0u] = conditionValue4 ? scalarValue19 : scalarValue20;
                    intermediateValue5[1u] = conditionValue4 ? scalarValue18 : scalarValue17;
                    float productValue19 = intermediateValue5[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue5[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue5, productValue19, 0.25), vec3(sumValue5, productValue19, 0.25)));
                    float productValue20 = inverseLengthValue2 * multiplyAddValue12;
                    branchMergedValue49 = inverseLengthValue2 * 0.25;
                    branchMergedValue54 = productValue20 * productValue19;
                    branchMergedValue55 = productValue20 * sumValue5;
                }
                else
                {
                    branchMergedValue49 = 1.0;
                    branchMergedValue54 = 0.0;
                    branchMergedValue55 = 0.0;
                }
                branchMergedValue9 = branchMergedValue49;
                branchMergedValue17 = branchMergedValue54;
                branchMergedValue18 = branchMergedValue55;
            }
            intermediateValue24 = branchMergedValue18;
            intermediateValue25 = branchMergedValue17;
            intermediateValue26 = branchMergedValue9;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue9;
            float branchMergedValue15;
            float branchMergedValue16;
            if ((scalarValue5 & 8u) == 0u)
            {
                float branchMergedValue48;
                float branchMergedValue52;
                float branchMergedValue53;
                if ((scalarValue5 & 16u) == 0u)
                {
                    branchMergedValue48 = 1.0;
                    branchMergedValue52 = 0.0;
                    branchMergedValue53 = 0.0;
                }
                else
                {
                    float multiplyAddValue1 = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                    float multiplyAddValue2 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                    vec4 sampledTextureValue15 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue1, multiplyAddValue2), 0.0);
                    float scalarValue6 = sampledTextureValue15.x;
                    float scalarValue7 = sampledTextureValue15.y;
                    float scalarValue8 = sampledTextureValue15.z;
                    float multiplyAddValue9 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue = multiplyAddValue9 > 0.0;
                    float branchMergedValue61;
                    float branchMergedValue63;
                    float branchMergedValue64;
                    if ((scalarValue6 == scalarValue7) && (scalarValue7 == scalarValue8))
                    {
                        float branchMergedValue68;
                        float branchMergedValue70;
                        float branchMergedValue71;
                        if (conditionValue)
                        {
                            uvec2 sampledTextureValue16 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue6 = float(int(uint(int(float(int(sampledTextureValue16.x)))))) * multiplyAddValue1;
                            float productValue7 = float(int(uint(int(float(int(sampledTextureValue16.y)))))) * multiplyAddValue2;
                            float scalarValue9 = fract(productValue6);
                            float scalarValue10 = fract(productValue7);
                            float comparisonValue18;
                            if (abs(scalarValue9 + (-0.5)) < 0.0625)
                            {
                                comparisonValue18 = ((scalarValue9 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue1;
                            }
                            else
                            {
                                comparisonValue18 = multiplyAddValue1;
                            }
                            float comparisonValue20;
                            if (abs(scalarValue10 + (-0.5)) < 0.0625)
                            {
                                comparisonValue20 = ((scalarValue10 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue2;
                            }
                            else
                            {
                                comparisonValue20 = multiplyAddValue2;
                            }
                            vec4 sampledTextureValue17 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue18, comparisonValue20));
                            float scalarValue11 = sampledTextureValue17.x;
                            float scalarValue12 = sampledTextureValue17.y;
                            float scalarValue13 = sampledTextureValue17.z;
                            float scalarValue14 = sampledTextureValue17.w;
                            float sumValue = fract(productValue6 + 0.5);
                            float sumValue1 = fract(productValue7 + 0.5);
                            bool conditionValue1 = sumValue1 > 0.5;
                            float intermediateValue4[2];
                            intermediateValue4[0u] = conditionValue1 ? scalarValue11 : scalarValue14;
                            intermediateValue4[1u] = conditionValue1 ? scalarValue12 : scalarValue13;
                            float productValue8 = intermediateValue4[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue9 = intermediateValue4[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue2 = productValue8 - productValue9;
                            bool conditionValue2 = sumValue > 0.5;
                            intermediateValue4[0u] = conditionValue2 ? scalarValue13 : scalarValue14;
                            intermediateValue4[1u] = conditionValue2 ? scalarValue12 : scalarValue11;
                            float productValue10 = intermediateValue4[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue4[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue = inversesqrt(dot(vec3(sumValue2, productValue10, 0.25), vec3(sumValue2, productValue10, 0.25)));
                            float productValue11 = inverseLengthValue * multiplyAddValue9;
                            branchMergedValue68 = inverseLengthValue * 0.25;
                            branchMergedValue70 = productValue11 * productValue10;
                            branchMergedValue71 = productValue11 * sumValue2;
                        }
                        else
                        {
                            branchMergedValue68 = 1.0;
                            branchMergedValue70 = 0.0;
                            branchMergedValue71 = 0.0;
                        }
                        branchMergedValue61 = branchMergedValue68;
                        branchMergedValue63 = branchMergedValue70;
                        branchMergedValue64 = branchMergedValue71;
                    }
                    else
                    {
                        uvec2 sampledTextureValue18 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue69;
                        float branchMergedValue72;
                        float branchMergedValue73;
                        if (conditionValue)
                        {
                            float productValue12 = fract(float(int(uint(int(float(int(sampledTextureValue18.x)))))) * multiplyAddValue1);
                            float productValue13 = fract(float(int(uint(int(float(int(sampledTextureValue18.y)))))) * multiplyAddValue2);
                            float comparisonValue3 = (((productValue12 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue7 * 2.0) + (-1.0))) - (((productValue12 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue15.w * 2.0) + (-1.0)));
                            float comparisonValue4 = (((productValue13 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue8 * 2.0) + (-1.0))) - (((productValue13 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue6 * 2.0) + (-1.0)));
                            float comparisonValue5 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                            float comparisonValue6 = ((abs(comparisonValue4) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue4;
                            float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue5, comparisonValue6, 0.25), vec3(comparisonValue5, comparisonValue6, 0.25)));
                            float productValue14 = inverseLengthValue1 * multiplyAddValue9;
                            branchMergedValue69 = inverseLengthValue1 * 0.25;
                            branchMergedValue72 = productValue14 * comparisonValue6;
                            branchMergedValue73 = productValue14 * comparisonValue5;
                        }
                        else
                        {
                            branchMergedValue69 = 1.0;
                            branchMergedValue72 = 0.0;
                            branchMergedValue73 = 0.0;
                        }
                        branchMergedValue61 = branchMergedValue69;
                        branchMergedValue63 = branchMergedValue72;
                        branchMergedValue64 = branchMergedValue73;
                    }
                    branchMergedValue48 = branchMergedValue61;
                    branchMergedValue52 = branchMergedValue63;
                    branchMergedValue53 = branchMergedValue64;
                }
                branchMergedValue9 = branchMergedValue48;
                branchMergedValue15 = branchMergedValue52;
                branchMergedValue16 = branchMergedValue53;
            }
            else
            {
                float multiplyAddValue10 = fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7);
                float multiplyAddValue11 = fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8);
                float multiplyAddValue12 = spvNClamp(fma(spvNMin(sampledTextureValue12 - sampledTextureValue11, sampledTextureValue12), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue49;
                float branchMergedValue54;
                float branchMergedValue55;
                if (multiplyAddValue12 > 0.0)
                {
                    uvec2 sampledTextureValue19 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue15 = float(int(uint(int(float(int(sampledTextureValue19.x)))))) * multiplyAddValue10;
                    float productValue16 = float(int(uint(int(float(int(sampledTextureValue19.y)))))) * multiplyAddValue11;
                    float scalarValue15 = fract(productValue15);
                    float scalarValue16 = fract(productValue16);
                    float comparisonValue8;
                    if (abs(scalarValue15 + (-0.5)) < 0.0625)
                    {
                        comparisonValue8 = ((scalarValue15 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue10;
                    }
                    else
                    {
                        comparisonValue8 = multiplyAddValue10;
                    }
                    float comparisonValue17;
                    if (abs(scalarValue16 + (-0.5)) < 0.0625)
                    {
                        comparisonValue17 = ((scalarValue16 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue11;
                    }
                    else
                    {
                        comparisonValue17 = multiplyAddValue11;
                    }
                    vec4 sampledTextureValue24 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue8, comparisonValue17));
                    float scalarValue17 = sampledTextureValue24.x;
                    float scalarValue18 = sampledTextureValue24.y;
                    float scalarValue19 = sampledTextureValue24.z;
                    float scalarValue20 = sampledTextureValue24.w;
                    float sumValue3 = fract(productValue15 + 0.5);
                    float sumValue4 = fract(productValue16 + 0.5);
                    bool conditionValue3 = sumValue4 > 0.5;
                    float intermediateValue5[2];
                    intermediateValue5[0u] = conditionValue3 ? scalarValue17 : scalarValue20;
                    intermediateValue5[1u] = conditionValue3 ? scalarValue18 : scalarValue19;
                    float productValue17 = intermediateValue5[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue18 = intermediateValue5[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue5 = productValue17 - productValue18;
                    bool conditionValue4 = sumValue3 > 0.5;
                    intermediateValue5[0u] = conditionValue4 ? scalarValue19 : scalarValue20;
                    intermediateValue5[1u] = conditionValue4 ? scalarValue18 : scalarValue17;
                    float productValue19 = intermediateValue5[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue5[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue5, productValue19, 0.25), vec3(sumValue5, productValue19, 0.25)));
                    float productValue20 = inverseLengthValue2 * multiplyAddValue12;
                    branchMergedValue49 = inverseLengthValue2 * 0.25;
                    branchMergedValue54 = productValue20 * productValue19;
                    branchMergedValue55 = productValue20 * sumValue5;
                }
                else
                {
                    branchMergedValue49 = 1.0;
                    branchMergedValue54 = 0.0;
                    branchMergedValue55 = 0.0;
                }
                branchMergedValue9 = branchMergedValue49;
                branchMergedValue15 = branchMergedValue54;
                branchMergedValue16 = branchMergedValue55;
            }
            intermediateValue19 = branchMergedValue16;
            intermediateValue20 = branchMergedValue15;
            intermediateValue21 = branchMergedValue9;
#endif
        }
        else
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits4 = uintBitsToFloat(intermediateValue8.packedValues[(scalarValue * 16u) + 15u]);
            float intermediateValue65;
            float intermediateValue66;
            float intermediateValue67;
            if ((reinterpretedBits3 & 8u) == 8u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits16 = uintBitsToFloat(intermediateValue9.packedValues[(scalarValue * 16u) + 15u]);
            float intermediateValue63;
            float intermediateValue64;
            float intermediateValue65;
            if ((reinterpretedBits15 & 8u) == 8u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue25 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7), fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8)));
            intermediateValue24 = (sampledTextureValue25.x * 2.0) + (-1.0);
            intermediateValue25 = (sampledTextureValue25.y * 2.0) + (-1.0);
            intermediateValue26 = (sampledTextureValue25.z * 2.0) + (-1.0);
        }
        float intermediateValue14;
        float sampledTextureValue1;
        float sampledTextureValue2;
        float sampledTextureValue3;
        if ((scalarValue5 & 1u) == 0u)
        {
            sampledTextureValue1 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 10u)).x);
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 11u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 9u)).x);
            intermediateValue14 = sampledTextureValue10;
        }
        else
        {
            vec4 sampledTextureValue26 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 3u)).x))));
            sampledTextureValue1 = sampledTextureValue26.y;
            sampledTextureValue3 = sampledTextureValue26.x;
            sampledTextureValue2 = sampledTextureValue26.z;
            intermediateValue14 = ((scalarValue5 & 2u) != 0u) ? sampledTextureValue26.w : sampledTextureValue10;
        }
        float comparisonValue7 = comparisonValue ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue9 = comparisonValue ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue10 = comparisonValue ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue7, comparisonValue9, comparisonValue10), vec3(comparisonValue7, comparisonValue9, comparisonValue10)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue24;
        multiplyAddValue = fma(inverseLengthValue3 * comparisonValue7, intermediateValue26, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue25, inverseLengthValue5 * varyingTangent0.x));
        intermediateValue11 = fma(inverseLengthValue3 * comparisonValue9, intermediateValue26, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue25, inverseLengthValue5 * varyingTangent0.y));
        intermediateValue12 = fma(inverseLengthValue3 * comparisonValue10, intermediateValue26, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue25, inverseLengthValue5 * varyingTangent0.z));
        intermediateValue13 = intermediateValue14;
        intermediateValue15 = sampledTextureValue1;
        intermediateValue16 = sampledTextureValue2;
        intermediateValue17 = sampledTextureValue3;
    }
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue14 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue16 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue17 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue16, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue15, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue14, multiplyAddValue13 * fragmentVectorConstants1.packedValues[0u].w)));
    float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue16, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue15, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue14, multiplyAddValue13 * fragmentVectorConstants1.packedValues[0u].x))) / multiplyAddValue17;
    float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue16, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue15, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue14, multiplyAddValue13 * fragmentVectorConstants1.packedValues[0u].y))) / multiplyAddValue17;
    float multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue16, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue15, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue14, multiplyAddValue13 * fragmentVectorConstants1.packedValues[0u].z))) / multiplyAddValue17;
    float inverseLengthValue6 = inversesqrt(dot(vec3(multiplyAddValue, intermediateValue11, intermediateValue12), vec3(multiplyAddValue, intermediateValue11, intermediateValue12)));
    float productValue21 = inverseLengthValue6 * multiplyAddValue;
    float productValue22 = inverseLengthValue6 * intermediateValue11;
    float productValue23 = inverseLengthValue6 * intermediateValue12;
    float multiplyAddValue21 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue23, fma(fragmentVectorConstants1.packedValues[5u].x, productValue22, productValue21 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue22 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue23, fma(fragmentVectorConstants1.packedValues[5u].y, productValue22, productValue21 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue23 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue23, fma(fragmentVectorConstants1.packedValues[5u].z, productValue22, productValue21 * fragmentVectorConstants1.packedValues[4u].z));
    float sumValue6 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[115u].x;
    float sumValue7 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[115u].y;
    float sumValue8 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[115u].z;
    float scalarValue21 = dFdxCoarse(multiplyAddValue13);
    float scalarValue22 = dFdxCoarse(multiplyAddValue14);
    float scalarValue23 = dFdxCoarse(multiplyAddValue15);
    float inverseLengthValue7 = inversesqrt(dot(vec3(scalarValue21, scalarValue22, scalarValue23), vec3(scalarValue21, scalarValue22, scalarValue23)));
    float productValue28 = inverseLengthValue7 * scalarValue21;
    float productValue31 = inverseLengthValue7 * scalarValue22;
    float productValue32 = inverseLengthValue7 * scalarValue23;
    float sumValue9 = (-0.0) - multiplyAddValue15;
    float sumValue10 = dFdyCoarse((-0.0) - multiplyAddValue13);
    float sumValue11 = dFdyCoarse((-0.0) - multiplyAddValue14);
    float scalarValue24 = dFdyCoarse(sumValue9);
    float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue10, sumValue11, scalarValue24), vec3(sumValue10, sumValue11, scalarValue24)));
    float productValue42 = inverseLengthValue8 * sumValue10;
    float productValue43 = inverseLengthValue8 * sumValue11;
    float productValue50 = inverseLengthValue8 * scalarValue24;
    float productValue51 = (productValue50 * productValue31) - (productValue43 * productValue32);
    float productValue52 = (productValue42 * productValue32) - (productValue50 * productValue28);
    float productValue53 = (productValue43 * productValue28) - (productValue42 * productValue31);
    float inverseLengthValue9 = inversesqrt(dot(vec3(productValue51, productValue52, productValue53), vec3(productValue51, productValue52, productValue53)));
    float productValue57 = productValue51 * inverseLengthValue9;
    float productValue58 = productValue52 * inverseLengthValue9;
    float productValue59 = productValue53 * inverseLengthValue9;
    float multiplyAddValue24 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue59, fma(fragmentVectorConstants1.packedValues[9u].x, productValue58, productValue57 * fragmentVectorConstants1.packedValues[8u].x));
    float multiplyAddValue25 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue59, fma(fragmentVectorConstants1.packedValues[9u].y, productValue58, productValue57 * fragmentVectorConstants1.packedValues[8u].y));
    float multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue59, fma(fragmentVectorConstants1.packedValues[9u].z, productValue58, productValue57 * fragmentVectorConstants1.packedValues[8u].z));
    float inverseLengthValue10 = inversesqrt(dot(vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26)));
    float quotientValue = roundEven((inverseLengthValue10 * multiplyAddValue24) / fragmentVectorConstants1.packedValues[137u].x) * fragmentVectorConstants1.packedValues[137u].x;
    float quotientValue1 = roundEven((inverseLengthValue10 * multiplyAddValue25) / fragmentVectorConstants1.packedValues[137u].x) * fragmentVectorConstants1.packedValues[137u].x;
    float quotientValue2 = roundEven((inverseLengthValue10 * multiplyAddValue26) / fragmentVectorConstants1.packedValues[137u].x) * fragmentVectorConstants1.packedValues[137u].x;
    float inverseLengthValue11 = inversesqrt(dot(vec3(quotientValue, quotientValue1, quotientValue2), vec3(quotientValue, quotientValue1, quotientValue2)));
    float productValue60 = inverseLengthValue11 * quotientValue;
    float productValue61 = inverseLengthValue11 * quotientValue1;
    float productValue62 = inverseLengthValue11 * quotientValue2;
    float productValue63 = fragmentVectorConstants1.packedValues[134u].z * 0.5;
    float quotientValue6 = productValue63 - (sumValue6 - (floor(sumValue6 / fragmentVectorConstants1.packedValues[134u].z) * fragmentVectorConstants1.packedValues[134u].z));
    float quotientValue7 = productValue63 - (sumValue7 - (floor(sumValue7 / fragmentVectorConstants1.packedValues[134u].z) * fragmentVectorConstants1.packedValues[134u].z));
    float quotientValue8 = productValue63 - (sumValue8 - (floor(sumValue8 / fragmentVectorConstants1.packedValues[134u].z) * fragmentVectorConstants1.packedValues[134u].z));
    float dotProductValue = dot(vec3(quotientValue6, quotientValue7, quotientValue8), vec3(productValue60, productValue61, productValue62));
    float productValue64 = ((quotientValue6 + sumValue6) - (dotProductValue * productValue60)) + fragmentVectorConstants1.packedValues[115u].x;
    float productValue66 = ((sumValue7 - (dotProductValue * productValue61)) + quotientValue7) + fragmentVectorConstants1.packedValues[115u].y;
    float productValue67 = ((sumValue8 - (dotProductValue * productValue62)) + quotientValue8) + fragmentVectorConstants1.packedValues[115u].z;
    float intermediateValue23;
    float productValue29;
    float productValue30;
    if ((fragmentVectorConstants1.packedValues[111u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[62u].x + fragmentVectorConstants1.packedValues[62u].y) + fragmentVectorConstants1.packedValues[62u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue69 = fragmentVectorConstants1.packedValues[111u].x * fragmentVectorConstants1.packedValues[111u].x;
        intermediateValue23 = spvNClamp(productValue69, 0.0, 1.0);
        productValue29 = spvNClamp(((productValue69 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue69, 0.0, 1.0);
        productValue30 = spvNClamp((((productValue69 * productValue69) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue69, 0.0, 1.0);
    }
    else
    {
        intermediateValue23 = fragmentVectorConstants1.packedValues[62u].x;
        productValue29 = fragmentVectorConstants1.packedValues[62u].y;
        productValue30 = fragmentVectorConstants1.packedValues[62u].z;
    }
    float sumValue12 = 1.0 - intermediateValue17;
    float productValue70 = sumValue12 * 0.039999999105930328369140625;
    float productValue82 = productValue70 + (intermediateValue17 * exponentialValue);
    float productValue83 = productValue70 + (intermediateValue17 * exponentialValue1);
    float productValue84 = productValue70 + (intermediateValue17 * exponentialValue2);
    float sampledTextureValue13;
    if ((fragmentVectorConstants1.packedValues[112u].x != 0.0) && (fragmentVectorConstants1.packedValues[112u].w != 0.0))
    {
        sampledTextureValue13 = exp2(log2((texture(sampler2DArray(causticsTextureTexture, causticsTextureSampler), vec3((varyingTexCoord3.x - fragmentVectorConstants1.packedValues[115u].x) * fragmentVectorConstants1.packedValues[112u].y, (varyingTexCoord3.z - fragmentVectorConstants1.packedValues[115u].z) * fragmentVectorConstants1.packedValues[112u].y, fragmentVectorConstants1.packedValues[113u].y)).x * 2.0) * spvNClamp(dot(vec3(0.0, 1.0, 0.0), vec3(productValue21, productValue22, productValue23)), 0.0, 1.0)) * fragmentVectorConstants1.packedValues[112u].z) * (fragmentVectorConstants1.packedValues[112u].z + 1.0);
    }
    else
    {
        sampledTextureValue13 = 1.0;
    }
    float quotientValue9 = spvNClamp(((fragmentVectorConstants1.packedValues[111u].y * 16.0) - fragmentVectorConstants1.packedValues[71u].y) / spvNMax(fragmentVectorConstants1.packedValues[71u].x - fragmentVectorConstants1.packedValues[71u].y, 1.0), 0.0, 1.0);
    float nonlinearValue = sqrt(((multiplyAddValue14 * multiplyAddValue14) + (multiplyAddValue13 * multiplyAddValue13)) + (multiplyAddValue15 * multiplyAddValue15));
    float productValue36;
    float productValue37;
    float productValue38;
    float productValue39;
    float productValue40;
    float productValue41;
    float intermediateValue28;
    float intermediateValue30;
    float intermediateValue32;
    float intermediateValue34;
    float intermediateValue36;
    float intermediateValue38;
    if (multiplyAddValue20 != 1.0)
    {
        float sumValue13 = nonlinearValue + 9.9999997473787516355514526367188e-05;
        float quotientValue10 = multiplyAddValue13 / sumValue13;
        float quotientValue11 = multiplyAddValue14 / sumValue13;
        float quotientValue12 = multiplyAddValue15 / sumValue13;
        float sumValue14 = (-0.0) - quotientValue10;
        float sumValue15 = (-0.0) - quotientValue11;
        float sumValue16 = (-0.0) - quotientValue12;
        float productValue85 = fragmentVectorConstants1.packedValues[141u].x * intermediateValue13;
        bool conditionValue5 = int(uint(int(fragmentVectorConstants1.packedValues[134u].y))) > int(0u);
        float intermediateValue29;
        float intermediateValue31;
        float intermediateValue33;
        float intermediateValue35;
        float intermediateValue37;
        float intermediateValue39;
        if ((fragmentVectorConstants1.packedValues[124u].x != 0.0) && (abs(fragmentVectorConstants1.packedValues[111u].y) < 9.9999997473787516355514526367188e-05))
        {
            intermediateValue29 = 0.0;
            intermediateValue31 = 0.0;
            intermediateValue33 = 0.0;
            intermediateValue35 = 0.0;
            intermediateValue37 = 0.0;
            intermediateValue39 = 0.0;
        }
        else
        {
            float productValue68;
            float intermediateValue49;
            if (uint(int(fragmentVectorConstants1.packedValues[60u].x)) == 1u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue25 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue5, sampledTextureValue7), fma(varyingTexCoord0.y, sampledTextureValue6, sampledTextureValue8)));
            intermediateValue19 = (sampledTextureValue25.x * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue25.y * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue25.z * 2.0) + (-1.0);
        }
        float intermediateValue9;
        float sampledTextureValue2;
        float sampledTextureValue3;
        float sampledTextureValue4;
        if ((scalarValue5 & 1u) == 0u)
        {
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 10u)).x);
            sampledTextureValue4 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 11u)).x);
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 9u)).x);
            intermediateValue9 = sampledTextureValue10;
        }
        else
        {
            vec4 sampledTextureValue26 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue * 16u) + 3u)).x))));
            sampledTextureValue2 = sampledTextureValue26.y;
            sampledTextureValue4 = sampledTextureValue26.x;
            sampledTextureValue3 = sampledTextureValue26.z;
            intermediateValue9 = ((scalarValue5 & 2u) != 0u) ? sampledTextureValue26.w : sampledTextureValue10;
        }
        float comparisonValue7 = comparisonValue ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue9 = comparisonValue ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue10 = comparisonValue ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue3 = inversesqrt(dot(vec3(comparisonValue7, comparisonValue9, comparisonValue10), vec3(comparisonValue7, comparisonValue9, comparisonValue10)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue44 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        multiplyAddValue = fma(inverseLengthValue3 * comparisonValue7, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue20, inverseLengthValue44 * varyingTangent0.x));
        intermediateValue6 = fma(inverseLengthValue3 * comparisonValue9, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue20, inverseLengthValue44 * varyingTangent0.y));
        intermediateValue7 = fma(inverseLengthValue3 * comparisonValue10, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue20, inverseLengthValue44 * varyingTangent0.z));
        intermediateValue8 = intermediateValue9;
        intermediateValue10 = sampledTextureValue2;
        intermediateValue11 = sampledTextureValue3;
        intermediateValue12 = sampledTextureValue4;
    }
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue14 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue15 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue16 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue17 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue16, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue15, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue14, multiplyAddValue13 * fragmentVectorConstants1.packedValues[0u].w)));
    float multiplyAddValue18 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue16, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue15, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue14, multiplyAddValue13 * fragmentVectorConstants1.packedValues[0u].x))) / multiplyAddValue17;
    float multiplyAddValue19 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue16, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue15, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue14, multiplyAddValue13 * fragmentVectorConstants1.packedValues[0u].y))) / multiplyAddValue17;
    float multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue16, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue15, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue14, multiplyAddValue13 * fragmentVectorConstants1.packedValues[0u].z))) / multiplyAddValue17;
    float inverseLengthValue45 = inversesqrt(dot(vec3(multiplyAddValue, intermediateValue6, intermediateValue7), vec3(multiplyAddValue, intermediateValue6, intermediateValue7)));
    float productValue369 = inverseLengthValue45 * multiplyAddValue;
    float productValue370 = inverseLengthValue45 * intermediateValue6;
    float productValue371 = inverseLengthValue45 * intermediateValue7;
    float multiplyAddValue395 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue371, fma(fragmentVectorConstants1.packedValues[5u].x, productValue370, productValue369 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue396 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue371, fma(fragmentVectorConstants1.packedValues[5u].y, productValue370, productValue369 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue397 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue371, fma(fragmentVectorConstants1.packedValues[5u].z, productValue370, productValue369 * fragmentVectorConstants1.packedValues[4u].z));
    float sumValue217 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[114u].x;
    float sumValue218 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[114u].y;
    float sumValue219 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[114u].z;
    float scalarValue21 = dFdxCoarse(multiplyAddValue13);
    float scalarValue22 = dFdxCoarse(multiplyAddValue14);
    float scalarValue23 = dFdxCoarse(multiplyAddValue15);
    float inverseLengthValue7 = inversesqrt(dot(vec3(scalarValue21, scalarValue22, scalarValue23), vec3(scalarValue21, scalarValue22, scalarValue23)));
    float productValue28 = inverseLengthValue7 * scalarValue21;
    float productValue31 = inverseLengthValue7 * scalarValue22;
    float productValue32 = inverseLengthValue7 * scalarValue23;
    float sumValue9 = (-0.0) - multiplyAddValue15;
    float sumValue10 = dFdyCoarse((-0.0) - multiplyAddValue13);
    float sumValue11 = dFdyCoarse((-0.0) - multiplyAddValue14);
    float scalarValue24 = dFdyCoarse(sumValue9);
    float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue10, sumValue11, scalarValue24), vec3(sumValue10, sumValue11, scalarValue24)));
    float productValue42 = inverseLengthValue8 * sumValue10;
    float productValue43 = inverseLengthValue8 * sumValue11;
    float productValue50 = inverseLengthValue8 * scalarValue24;
    float productValue51 = (productValue50 * productValue31) - (productValue43 * productValue32);
    float productValue52 = (productValue42 * productValue32) - (productValue50 * productValue28);
    float productValue53 = (productValue43 * productValue28) - (productValue42 * productValue31);
    float inverseLengthValue9 = inversesqrt(dot(vec3(productValue51, productValue52, productValue53), vec3(productValue51, productValue52, productValue53)));
    float productValue57 = productValue51 * inverseLengthValue9;
    float productValue58 = productValue52 * inverseLengthValue9;
    float productValue59 = productValue53 * inverseLengthValue9;
    float multiplyAddValue24 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue59, fma(fragmentVectorConstants1.packedValues[9u].x, productValue58, productValue57 * fragmentVectorConstants1.packedValues[8u].x));
    float multiplyAddValue25 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue59, fma(fragmentVectorConstants1.packedValues[9u].y, productValue58, productValue57 * fragmentVectorConstants1.packedValues[8u].y));
    float multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue59, fma(fragmentVectorConstants1.packedValues[9u].z, productValue58, productValue57 * fragmentVectorConstants1.packedValues[8u].z));
    float inverseLengthValue10 = inversesqrt(dot(vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26)));
    float quotientValue50 = roundEven((inverseLengthValue10 * multiplyAddValue24) / fragmentVectorConstants1.packedValues[136u].x) * fragmentVectorConstants1.packedValues[136u].x;
    float quotientValue51 = roundEven((inverseLengthValue10 * multiplyAddValue25) / fragmentVectorConstants1.packedValues[136u].x) * fragmentVectorConstants1.packedValues[136u].x;
    float quotientValue52 = roundEven((inverseLengthValue10 * multiplyAddValue26) / fragmentVectorConstants1.packedValues[136u].x) * fragmentVectorConstants1.packedValues[136u].x;
    float inverseLengthValue46 = inversesqrt(dot(vec3(quotientValue50, quotientValue51, quotientValue52), vec3(quotientValue50, quotientValue51, quotientValue52)));
    float productValue372 = inverseLengthValue46 * quotientValue50;
    float productValue373 = inverseLengthValue46 * quotientValue51;
    float productValue374 = inverseLengthValue46 * quotientValue52;
    float productValue375 = fragmentVectorConstants1.packedValues[133u].z * 0.5;
    float quotientValue53 = productValue375 - (sumValue217 - (floor(sumValue217 / fragmentVectorConstants1.packedValues[133u].z) * fragmentVectorConstants1.packedValues[133u].z));
    float quotientValue54 = productValue375 - (sumValue218 - (floor(sumValue218 / fragmentVectorConstants1.packedValues[133u].z) * fragmentVectorConstants1.packedValues[133u].z));
    float quotientValue55 = productValue375 - (sumValue219 - (floor(sumValue219 / fragmentVectorConstants1.packedValues[133u].z) * fragmentVectorConstants1.packedValues[133u].z));
    float dotProductValue18 = dot(vec3(quotientValue53, quotientValue54, quotientValue55), vec3(productValue372, productValue373, productValue374));
    float productValue376 = ((quotientValue53 + sumValue217) - (dotProductValue18 * productValue372)) + fragmentVectorConstants1.packedValues[114u].x;
    float productValue377 = ((sumValue218 - (dotProductValue18 * productValue373)) + quotientValue54) + fragmentVectorConstants1.packedValues[114u].y;
    float productValue378 = ((sumValue219 - (dotProductValue18 * productValue374)) + quotientValue55) + fragmentVectorConstants1.packedValues[114u].z;
    float intermediateValue18;
    float productValue26;
    float productValue27;
    if ((fragmentVectorConstants1.packedValues[110u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[62u].x + fragmentVectorConstants1.packedValues[62u].y) + fragmentVectorConstants1.packedValues[62u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue379 = fragmentVectorConstants1.packedValues[110u].x * fragmentVectorConstants1.packedValues[110u].x;
        intermediateValue18 = spvNClamp(productValue379, 0.0, 1.0);
        productValue26 = spvNClamp(((productValue379 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue379, 0.0, 1.0);
        productValue27 = spvNClamp((((productValue379 * productValue379) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue379, 0.0, 1.0);
    }
    else
    {
        intermediateValue18 = fragmentVectorConstants1.packedValues[62u].x;
        productValue26 = fragmentVectorConstants1.packedValues[62u].y;
        productValue27 = fragmentVectorConstants1.packedValues[62u].z;
    }
    float sumValue278 = 1.0 - intermediateValue12;
    float productValue380 = sumValue278 * 0.039999999105930328369140625;
    float productValue381 = productValue380 + (intermediateValue12 * exponentialValue);
    float productValue382 = productValue380 + (intermediateValue12 * exponentialValue1);
    float productValue383 = productValue380 + (intermediateValue12 * exponentialValue2);
    float sampledTextureValue14;
    if ((fragmentVectorConstants1.packedValues[111u].x != 0.0) && (fragmentVectorConstants1.packedValues[111u].w != 0.0))
    {
        sampledTextureValue14 = exp2(log2((texture(sampler2DArray(causticsTextureTexture, causticsTextureSampler), vec3((varyingTexCoord3.x - fragmentVectorConstants1.packedValues[114u].x) * fragmentVectorConstants1.packedValues[111u].y, (varyingTexCoord3.z - fragmentVectorConstants1.packedValues[114u].z) * fragmentVectorConstants1.packedValues[111u].y, fragmentVectorConstants1.packedValues[112u].y)).x * 2.0) * spvNClamp(dot(vec3(0.0, 1.0, 0.0), vec3(productValue369, productValue370, productValue371)), 0.0, 1.0)) * fragmentVectorConstants1.packedValues[111u].z) * (fragmentVectorConstants1.packedValues[111u].z + 1.0);
    }
    else
    {
        sampledTextureValue14 = 1.0;
    }
    float quotientValue56 = spvNClamp(((fragmentVectorConstants1.packedValues[110u].y * 16.0) - fragmentVectorConstants1.packedValues[70u].y) / spvNMax(fragmentVectorConstants1.packedValues[70u].x - fragmentVectorConstants1.packedValues[70u].y, 1.0), 0.0, 1.0);
    float nonlinearValue = sqrt(((multiplyAddValue14 * multiplyAddValue14) + (multiplyAddValue13 * multiplyAddValue13)) + (multiplyAddValue15 * multiplyAddValue15));
    float productValue33;
    float productValue34;
    float productValue35;
    float productValue36;
    float productValue37;
    float productValue38;
    float intermediateValue23;
    float intermediateValue25;
    float intermediateValue27;
    float intermediateValue29;
    float intermediateValue31;
    float intermediateValue33;
    if (multiplyAddValue20 != 1.0)
    {
        float sumValue13 = nonlinearValue + 9.9999997473787516355514526367188e-05;
        float quotientValue10 = multiplyAddValue13 / sumValue13;
        float quotientValue11 = multiplyAddValue14 / sumValue13;
        float quotientValue12 = multiplyAddValue15 / sumValue13;
        float sumValue14 = (-0.0) - quotientValue10;
        float sumValue15 = (-0.0) - quotientValue11;
        float sumValue16 = (-0.0) - quotientValue12;
        float productValue384 = fragmentVectorConstants1.packedValues[140u].x * intermediateValue8;
        bool conditionValue45 = int(uint(int(fragmentVectorConstants1.packedValues[133u].y))) > int(0u);
        float intermediateValue24;
        float intermediateValue26;
        float intermediateValue28;
        float intermediateValue30;
        float intermediateValue32;
        float intermediateValue34;
        if ((fragmentVectorConstants1.packedValues[123u].x != 0.0) && (abs(fragmentVectorConstants1.packedValues[110u].y) < 9.9999997473787516355514526367188e-05))
        {
            intermediateValue24 = 0.0;
            intermediateValue26 = 0.0;
            intermediateValue28 = 0.0;
            intermediateValue30 = 0.0;
            intermediateValue32 = 0.0;
            intermediateValue34 = 0.0;
        }
        else
        {
            float productValue65;
            float intermediateValue44;
            if (uint(int(fragmentVectorConstants1.packedValues[60u].x)) == 1u)
#endif
            {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                float sumValue117 = spvNClamp(2.0 - spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue97), 0.0, 1.0);
                float productValue24;
                float productValue25;
                float productValue26;
                if (sumValue117 > 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                float sumValue198 = spvNClamp(2.0 - spvNMin(reinterpretedBits16, reinterpretedBits16 - scalarValue187), 0.0, 1.0);
                float productValue24;
                float productValue25;
                float productValue26;
                if (sumValue198 > 0.0)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[129u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[129u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[129u].y, fragmentVectorConstants1.packedValues[129u].x * fragmentVectorConstants1.packedValues[4u].x)));
                float multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[129u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[129u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[129u].y, fragmentVectorConstants1.packedValues[129u].x * fragmentVectorConstants1.packedValues[4u].y)));
                float multiplyAddValue29 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[129u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[129u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[129u].y, fragmentVectorConstants1.packedValues[129u].x * fragmentVectorConstants1.packedValues[4u].z)));
                float inverseLengthValue12 = inversesqrt(dot(vec3(multiplyAddValue27, multiplyAddValue28, multiplyAddValue29), vec3(multiplyAddValue27, multiplyAddValue28, multiplyAddValue29)));
                float dotProductValue1 = spvNMax(dot(vec3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23), vec3(inverseLengthValue12 * multiplyAddValue27, inverseLengthValue12 * multiplyAddValue28, inverseLengthValue12 * multiplyAddValue29)), 0.0);
                float productValue86 = spvNClamp(1.0 - dotProductValue1, 0.0, 1.0) * fragmentVectorConstants1.packedValues[139u].w;
                float comparisonValue11 = (productValue86 * productValue21) + (conditionValue5 ? productValue64 : varyingTexCoord3.x);
                float comparisonValue12 = (productValue86 * productValue22) + (conditionValue5 ? productValue66 : varyingTexCoord3.y);
                float comparisonValue13 = (productValue86 * productValue23) + (conditionValue5 ? productValue67 : varyingTexCoord3.z);
                uint dotProductValue2 = uint(int(dot(vec4(spvNClamp(fragmentVectorConstants1.packedValues[78u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[78u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[78u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[78u].w, 0.0, 1.0)), vec4(1.0))));
                float intermediateValue50;
                float intermediateValue69;
                if (int(dotProductValue2) > int(0u))
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float multiplyAddValue398 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[128u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[128u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[128u].y, fragmentVectorConstants1.packedValues[128u].x * fragmentVectorConstants1.packedValues[4u].x)));
                float multiplyAddValue399 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[128u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[128u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[128u].y, fragmentVectorConstants1.packedValues[128u].x * fragmentVectorConstants1.packedValues[4u].y)));
                float multiplyAddValue400 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[128u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[128u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[128u].y, fragmentVectorConstants1.packedValues[128u].x * fragmentVectorConstants1.packedValues[4u].z)));
                float inverseLengthValue47 = inversesqrt(dot(vec3(multiplyAddValue398, multiplyAddValue399, multiplyAddValue400), vec3(multiplyAddValue398, multiplyAddValue399, multiplyAddValue400)));
                float dotProductValue19 = spvNMax(dot(vec3(multiplyAddValue395, multiplyAddValue396, multiplyAddValue397), vec3(inverseLengthValue47 * multiplyAddValue398, inverseLengthValue47 * multiplyAddValue399, inverseLengthValue47 * multiplyAddValue400)), 0.0);
                float productValue385 = spvNClamp(1.0 - dotProductValue19, 0.0, 1.0) * fragmentVectorConstants1.packedValues[138u].w;
                float comparisonValue255 = (productValue385 * productValue369) + (conditionValue45 ? productValue376 : varyingTexCoord3.x);
                float comparisonValue256 = (productValue385 * productValue370) + (conditionValue45 ? productValue377 : varyingTexCoord3.y);
                float comparisonValue257 = (productValue385 * productValue371) + (conditionValue45 ? productValue378 : varyingTexCoord3.z);
                uint dotProductValue20 = uint(int(dot(vec4(spvNClamp(fragmentVectorConstants1.packedValues[77u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[77u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[77u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[77u].w, 0.0, 1.0)), vec4(1.0))));
                float intermediateValue45;
                float intermediateValue64;
                if (int(dotProductValue20) > int(0u))
#endif
                {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    float multiplyAddValue60 = fma(varyingTexCoord0.x, scalarValue92, scalarValue94);
                    float multiplyAddValue61 = fma(varyingTexCoord0.y, scalarValue93, scalarValue95);
                    bool sampledTextureValue74 = uint(textureQueryLevels(materialTexture2)) > 0u;
                    uvec2 sampledTextureValue75 = uvec2(textureSize(materialTexture2, int(0u)));
                    uint scalarValue98 = sampledTextureValue75.x;
                    float comparisonValue104 = rdEvaluateFloatExpression(sampledTextureValue74 ? scalarValue98 : 0u);
                    float comparisonValue105 = rdEvaluateFloatExpression(sampledTextureValue74 ? sampledTextureValue75.y : 0u);
                    float productValue229 = fract(multiplyAddValue60 * comparisonValue104);
                    float productValue230 = fract(multiplyAddValue61 * comparisonValue105);
                    vec4 sampledTextureValue76 = textureGather(sampler2D(materialTexture2, textureSampler2), vec2((abs(productValue229 - 0.5) < 0.0625) ? (((productValue229 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue60) : multiplyAddValue60, (abs(productValue230 - 0.5) < 0.0625) ? (((productValue230 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue61) : multiplyAddValue61));
                    float scalarValue99 = sampledTextureValue76.x;
                    float scalarValue100 = sampledTextureValue76.y;
                    float scalarValue101 = sampledTextureValue76.z;
                    float scalarValue102 = sampledTextureValue76.w;
                    float multiplyAddValue63 = fract(fma(multiplyAddValue60, comparisonValue104, 0.5));
                    float multiplyAddValue64 = fract(fma(multiplyAddValue61, comparisonValue105, 0.5));
                    bool conditionValue7 = multiplyAddValue64 > 0.5;
                    bool conditionValue8 = multiplyAddValue63 > 0.5;
                    float sumValue118 = multiplyAddValue63 - 0.083333335816860198974609375;
                    float sumValue119 = multiplyAddValue63 + 0.083333335816860198974609375;
                    float sumValue120 = multiplyAddValue64 - 0.083333335816860198974609375;
                    float sumValue121 = multiplyAddValue64 + 0.083333335816860198974609375;
                    vec2 comparisonValue106 = vec2(conditionValue7 ? scalarValue99 : scalarValue102, conditionValue7 ? scalarValue100 : scalarValue101);
                    uint sumValue122 = min(uint(int(spvNClamp(sumValue118 + sumValue118, 0.0, 1.0))), 68u);
                    uint sumValue123 = min(uint(int(spvNClamp(sumValue119 + sumValue119, 0.0, 1.0))), 68u);
                    float reinterpretedBits5 = rdDot2Precise(comparisonValue106, vec2(uintBitsToFloat(intermediateValue21[sumValue122].x), uintBitsToFloat(intermediateValue21[sumValue122].y))) - rdDot2Precise(comparisonValue106, vec2(uintBitsToFloat(intermediateValue21[sumValue123].x), uintBitsToFloat(intermediateValue21[sumValue123].y)));
                    vec2 comparisonValue107 = vec2(conditionValue8 ? scalarValue101 : scalarValue102, conditionValue8 ? scalarValue100 : scalarValue99);
                    uint sumValue124 = min(uint(int(spvNClamp(sumValue120 + sumValue120, 0.0, 1.0))), 68u);
                    uint sumValue125 = min(uint(int(spvNClamp(sumValue121 + sumValue121, 0.0, 1.0))), 68u);
                    float reinterpretedBits6 = rdDot2Precise(comparisonValue107, vec2(uintBitsToFloat(intermediateValue21[sumValue124].x), uintBitsToFloat(intermediateValue21[sumValue124].y))) - rdDot2Precise(comparisonValue107, vec2(uintBitsToFloat(intermediateValue21[sumValue125].x), uintBitsToFloat(intermediateValue21[sumValue125].y)));
                    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, 0.25);
                    float inverseLengthValue18 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                    productValue24 = sumValue117 * (inverseLengthValue18 * reinterpretedBits6);
                    productValue25 = sumValue117 * (inverseLengthValue18 * reinterpretedBits5);
                    productValue26 = inverseLengthValue18 * 0.25;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    float multiplyAddValue252 = fma(varyingTexCoord0.x, scalarValue182, scalarValue184);
                    float multiplyAddValue253 = fma(varyingTexCoord0.y, scalarValue183, scalarValue185);
                    bool sampledTextureValue74 = uint(textureQueryLevels(materialTexture2)) > 0u;
                    uvec2 sampledTextureValue75 = uvec2(textureSize(materialTexture2, int(0u)));
                    uint scalarValue98 = sampledTextureValue75.x;
                    float comparisonValue104 = rdEvaluateFloatExpression(sampledTextureValue74 ? scalarValue98 : 0u);
                    float comparisonValue105 = rdEvaluateFloatExpression(sampledTextureValue74 ? sampledTextureValue75.y : 0u);
                    float productValue308 = fract(multiplyAddValue252 * comparisonValue104);
                    float productValue309 = fract(multiplyAddValue253 * comparisonValue105);
                    vec4 sampledTextureValue98 = textureGather(sampler2D(materialTexture2, textureSampler2), vec2((abs(productValue308 - 0.5) < 0.0625) ? (((productValue308 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue252) : multiplyAddValue252, (abs(productValue309 - 0.5) < 0.0625) ? (((productValue309 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue253) : multiplyAddValue253));
                    float scalarValue188 = sampledTextureValue98.x;
                    float scalarValue189 = sampledTextureValue98.y;
                    float scalarValue190 = sampledTextureValue98.z;
                    float scalarValue191 = sampledTextureValue98.w;
                    float multiplyAddValue254 = fract(fma(multiplyAddValue252, comparisonValue104, 0.5));
                    float multiplyAddValue255 = fract(fma(multiplyAddValue253, comparisonValue105, 0.5));
                    bool conditionValue26 = multiplyAddValue255 > 0.5;
                    bool conditionValue27 = multiplyAddValue254 > 0.5;
                    float sumValue199 = multiplyAddValue254 - 0.083333335816860198974609375;
                    float sumValue200 = multiplyAddValue254 + 0.083333335816860198974609375;
                    float sumValue201 = multiplyAddValue255 - 0.083333335816860198974609375;
                    float sumValue202 = multiplyAddValue255 + 0.083333335816860198974609375;
                    vec2 comparisonValue184 = vec2(conditionValue26 ? scalarValue188 : scalarValue191, conditionValue26 ? scalarValue189 : scalarValue190);
                    uint sumValue203 = min(uint(int(spvNClamp(sumValue199 + sumValue199, 0.0, 1.0))), 68u);
                    uint sumValue204 = min(uint(int(spvNClamp(sumValue200 + sumValue200, 0.0, 1.0))), 68u);
                    float reinterpretedBits17 = rdDot2Precise(comparisonValue184, vec2(uintBitsToFloat(intermediateValue23[sumValue203].x), uintBitsToFloat(intermediateValue23[sumValue203].y))) - rdDot2Precise(comparisonValue184, vec2(uintBitsToFloat(intermediateValue23[sumValue204].x), uintBitsToFloat(intermediateValue23[sumValue204].y)));
                    vec2 comparisonValue185 = vec2(conditionValue27 ? scalarValue190 : scalarValue191, conditionValue27 ? scalarValue189 : scalarValue188);
                    uint sumValue205 = min(uint(int(spvNClamp(sumValue201 + sumValue201, 0.0, 1.0))), 68u);
                    uint sumValue206 = min(uint(int(spvNClamp(sumValue202 + sumValue202, 0.0, 1.0))), 68u);
                    float reinterpretedBits18 = rdDot2Precise(comparisonValue185, vec2(uintBitsToFloat(intermediateValue23[sumValue205].x), uintBitsToFloat(intermediateValue23[sumValue205].y))) - rdDot2Precise(comparisonValue185, vec2(uintBitsToFloat(intermediateValue23[sumValue206].x), uintBitsToFloat(intermediateValue23[sumValue206].y)));
                    vec3 vectorValue21 = vec3(reinterpretedBits17, reinterpretedBits18, 0.25);
                    float inverseLengthValue36 = inversesqrt(rdDot3Precise2(vectorValue21, vectorValue21));
                    productValue24 = sumValue198 * (inverseLengthValue36 * reinterpretedBits18);
                    productValue25 = sumValue198 * (inverseLengthValue36 * reinterpretedBits17);
                    productValue26 = inverseLengthValue36 * 0.25;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    float intermediateValue68;
                    float intermediateValue70;
                    uint intermediateValue81;
                    float scalarValue25 = 1.0;
                    float scalarValue26 = 1.0;
                    uint scalarValue27 = 0u;
                    uint scalarValue28 = 0u;
                    uint sumValue34;
                    bool intermediateValue83;
                    for (;;)
                    {
                        sumValue34 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[scalarValue28 + 312u])) + scalarValue27), int(8u)));
                        intermediateValue83 = int(scalarValue27) < int(sumValue34);
                        uint branchMergedValue;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (intermediateValue83)
                        {
                            float intermediateValue99;
                            float intermediateValue100;
                            uint intermediateValue101;
                            float scalarValue29 = scalarValue25;
                            float scalarValue30 = scalarValue26;
                            uint scalarValue31 = scalarValue27;
                            uint bitwiseValue10;
                            float multiplyAddValue38;
                            float multiplyAddValue39;
                            float multiplyAddValue40;
                            bool comparisonValue30;
                            for (;;)
                            {
                                bitwiseValue10 = scalarValue31 << 2u;
                                uint sumValue17 = bitwiseValue10 + 79u;
                                uint sumValue18 = bitwiseValue10 + 80u;
                                uint sumValue19 = bitwiseValue10 + 81u;
                                uint sumValue20 = bitwiseValue10 + 82u;
                                multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[sumValue19].x, comparisonValue13, fma(fragmentVectorConstants1.packedValues[sumValue18].x, comparisonValue12, fragmentVectorConstants1.packedValues[sumValue17].x * comparisonValue11)) + fragmentVectorConstants1.packedValues[sumValue20].x;
                                multiplyAddValue39 = fma(fragmentVectorConstants1.packedValues[sumValue19].y, comparisonValue13, fma(fragmentVectorConstants1.packedValues[sumValue18].y, comparisonValue12, fragmentVectorConstants1.packedValues[sumValue17].y * comparisonValue11)) + fragmentVectorConstants1.packedValues[sumValue20].y;
                                multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[sumValue19].z, comparisonValue13, fma(fragmentVectorConstants1.packedValues[sumValue18].z, comparisonValue12, fragmentVectorConstants1.packedValues[sumValue17].z * comparisonValue11)) + fragmentVectorConstants1.packedValues[sumValue20].z;
                                comparisonValue30 = ((abs(multiplyAddValue38) <= 1.0) && (abs(multiplyAddValue39) <= 1.0)) && (abs(multiplyAddValue40) <= 1.0);
                                float branchMergedValue1;
                                uint branchMergedValue7;
                                float branchMergedValue8;
                                if (comparisonValue30)
                                {
                                    uint sumValue21 = scalarValue31 + 48u;
                                    float sumValue22 = spvNMin(spvNMax(dotProductValue1, fragmentScalarConstants1.packedValues[scalarValue31 + 244u]), 1.0);
                                    float nonlinearValue1 = (sqrt(1.0 - (sumValue22 * sumValue22)) / sumValue22) * fragmentVectorConstants1.packedValues[sumValue21].z;
                                    float productValue87 = (multiplyAddValue38 * 0.5) + 0.5;
                                    float productValue88 = 0.5 - (multiplyAddValue39 * 0.5);
                                    uint sumValue23 = bitwiseValue10 + 18u;
                                    float nonlinearValue2 = sqrt((((fragmentVectorConstants1.packedValues[sumValue23].x * fragmentVectorConstants1.packedValues[sumValue23].x) + (fragmentVectorConstants1.packedValues[sumValue23].y * fragmentVectorConstants1.packedValues[sumValue23].y)) + (fragmentVectorConstants1.packedValues[sumValue23].z * fragmentVectorConstants1.packedValues[sumValue23].z)) + (fragmentVectorConstants1.packedValues[sumValue23].w * fragmentVectorConstants1.packedValues[sumValue23].w)) * fragmentVectorConstants1.packedValues[141u].z;
                                    uint comparisonValue14 = (fragmentVectorConstants1.packedValues[134u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[sumValue21].w + 0.5))), int(1u)))), int(9u)));
                                    uint quotientValue13 = uint(int(comparisonValue14) / int(2u));
                                    float intermediateValue153;
                                    float intermediateValue154;
                                    if (int(comparisonValue14) > int(0u))
                                    {
                                        float sumValue91;
                                        float productValue176;
                                        float intermediateValue182;
                                        float intermediateValue183;
                                        uint intermediateValue184;
                                        float scalarValue32 = 0.0;
                                        float scalarValue33 = 0.0;
                                        uint scalarValue34 = 0u;
                                        for (;;)
                                        {
                                            intermediateValue182 = scalarValue32;
                                            intermediateValue183 = scalarValue33;
                                            intermediateValue184 = 0u;
                                            float intermediateValue228;
                                            float intermediateValue185;
                                            float intermediateValue186;
                                            float intermediateValue187;
                                            float intermediateValue188;
                                            float productValue184;
                                            float productValue185;
                                            bool comparisonValue56;
                                            float sumValue101;
                                            for (;;)
                                            {
                                                float productValue89 = (productValue87 + ((float(int(intermediateValue184 - quotientValue13)) + 0.5) * fragmentVectorConstants1.packedValues[139u].x)) * fragmentVectorConstants1.packedValues[sumValue21].x;
                                                float productValue90 = (productValue88 + (fragmentVectorConstants1.packedValues[139u].x * (float(int(scalarValue34 - quotientValue13)) + 0.5))) * fragmentVectorConstants1.packedValues[sumValue21].x;
                                                vec4 sampledTextureValue27 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue89, productValue90, float(int(scalarValue31))));
                                                intermediateValue185 = sampledTextureValue27.x;
                                                intermediateValue186 = sampledTextureValue27.y;
                                                intermediateValue187 = sampledTextureValue27.z;
                                                intermediateValue188 = sampledTextureValue27.w;
                                                productValue184 = fract((productValue89 * fragmentVectorConstants1.packedValues[139u].z) + 0.5);
                                                productValue185 = fract((productValue90 * fragmentVectorConstants1.packedValues[139u].z) + 0.5);
                                                float productValue91 = spvNClamp((multiplyAddValue40 - intermediateValue185) * nonlinearValue2, 0.0, 1.0);
                                                float productValue92 = spvNClamp((multiplyAddValue40 - intermediateValue186) * nonlinearValue2, 0.0, 1.0);
                                                float productValue93 = spvNClamp((multiplyAddValue40 - intermediateValue187) * nonlinearValue2, 0.0, 1.0);
                                                float productValue94 = spvNClamp((multiplyAddValue40 - intermediateValue188) * nonlinearValue2, 0.0, 1.0);
                                                float productValue95 = 1.0 - ((productValue91 * productValue91) * (3.0 - (productValue91 * 2.0)));
                                                float productValue96 = 1.0 - ((productValue94 * productValue94) * (3.0 - (productValue94 * 2.0)));
                                                float productValue97 = (((1.0 - ((productValue93 * productValue93) * (3.0 - (productValue93 * 2.0)))) - productValue96) * productValue184) + productValue96;
                                                productValue176 = (productValue97 + intermediateValue183) + ((((((1.0 - ((productValue92 * productValue92) * (3.0 - (productValue92 * 2.0)))) - productValue95) * productValue184) + productValue95) - productValue97) * productValue185);
                                                comparisonValue56 = fragmentVectorConstants1.packedValues[134u].x != 0.0;
                                                sumValue101 = (multiplyAddValue40 - fragmentVectorConstants1.packedValues[sumValue21].y) - nonlinearValue1;
                                                float branchMergedValue4;
                                                if (comparisonValue56)
                                                {
                                                    branchMergedValue4 = float(intermediateValue188 >= sumValue101);
                                                }
                                                else
                                                {
                                                    float comparisonValue15 = (intermediateValue185 < sumValue101) ? 0.0 : 1.0;
                                                    float comparisonValue16 = (intermediateValue188 < sumValue101) ? 0.0 : 1.0;
                                                    float comparisonValue19 = ((((intermediateValue187 < sumValue101) ? 0.0 : 1.0) - comparisonValue16) * productValue184) + comparisonValue16;
                                                    branchMergedValue4 = (((((((intermediateValue186 < sumValue101) ? 0.0 : 1.0) - comparisonValue15) * productValue184) + comparisonValue15) - comparisonValue19) * productValue185) + comparisonValue19;
                                                }
                                                intermediateValue228 = branchMergedValue4;
                                                sumValue91 = intermediateValue228 + intermediateValue182;
                                                uint sumValue24 = intermediateValue184 + 1u;
                                                if (sumValue24 == comparisonValue14)
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    intermediateValue182 = sumValue91;
                                                    intermediateValue183 = productValue176;
                                                    intermediateValue184 = sumValue24;
                                                    continue;
                                                }
                                            }
                                            uint sumValue25 = scalarValue34 + 1u;
                                            if (sumValue25 == comparisonValue14)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                scalarValue32 = sumValue91;
                                                scalarValue33 = productValue176;
                                                scalarValue34 = sumValue25;
                                                continue;
                                            }
                                        }
                                        intermediateValue153 = sumValue91;
                                        intermediateValue154 = productValue176;
                                    }
                                    else
                                    {
                                        intermediateValue153 = 0.0;
                                        intermediateValue154 = 0.0;
                                    }
                                    float productValue98 = float(int(comparisonValue14 * comparisonValue14));
                                    branchMergedValue1 = spvNMin(scalarValue30, intermediateValue153 / productValue98);
                                    branchMergedValue7 = sumValue34;
                                    branchMergedValue8 = spvNMin(scalarValue29, intermediateValue154 / productValue98);
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue30;
                                    branchMergedValue7 = scalarValue31 + 1u;
                                    branchMergedValue8 = scalarValue29;
                                }
                                intermediateValue100 = branchMergedValue1;
                                intermediateValue101 = branchMergedValue7;
                                intermediateValue99 = branchMergedValue8;
                                if (int(intermediateValue101) < int(sumValue34))
                                {
                                    scalarValue29 = intermediateValue99;
                                    scalarValue30 = intermediateValue100;
                                    scalarValue31 = intermediateValue101;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            branchMergedValue = intermediateValue101;
                            branchMergedValue5 = intermediateValue100;
                            branchMergedValue6 = intermediateValue99;
                        }
                        else
                        {
                            branchMergedValue = scalarValue27;
                            branchMergedValue5 = scalarValue26;
                            branchMergedValue6 = scalarValue25;
                        }
                        intermediateValue81 = branchMergedValue;
                        intermediateValue70 = branchMergedValue5;
                        intermediateValue68 = branchMergedValue6;
                        uint sumValue26 = scalarValue28 + 1u;
                        if (sumValue26 == dotProductValue2)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue25 = intermediateValue68;
                            scalarValue26 = intermediateValue70;
                            scalarValue27 = intermediateValue81;
                            scalarValue28 = sumValue26;
                            continue;
                        }
                    }
                    intermediateValue50 = intermediateValue68;
                    intermediateValue69 = intermediateValue70;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    float intermediateValue63;
                    float intermediateValue65;
                    uint intermediateValue76;
                    float scalarValue25 = 1.0;
                    float scalarValue26 = 1.0;
                    uint scalarValue27 = 0u;
                    uint scalarValue28 = 0u;
                    uint sumValue34;
                    bool intermediateValue78;
                    for (;;)
                    {
                        sumValue34 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[scalarValue28 + 308u])) + scalarValue27), int(8u)));
                        intermediateValue78 = int(scalarValue27) < int(sumValue34);
                        uint branchMergedValue;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (intermediateValue78)
                        {
                            float intermediateValue94;
                            float intermediateValue95;
                            uint intermediateValue96;
                            float scalarValue29 = scalarValue25;
                            float scalarValue30 = scalarValue26;
                            uint scalarValue31 = scalarValue27;
                            uint bitwiseValue10;
                            float multiplyAddValue38;
                            float multiplyAddValue39;
                            float multiplyAddValue40;
                            bool comparisonValue30;
                            for (;;)
                            {
                                bitwiseValue10 = scalarValue31 << 2u;
                                uint sumValue279 = bitwiseValue10 + 78u;
                                uint sumValue17 = bitwiseValue10 + 79u;
                                uint sumValue18 = bitwiseValue10 + 80u;
                                uint sumValue19 = bitwiseValue10 + 81u;
                                multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[sumValue18].x, comparisonValue257, fma(fragmentVectorConstants1.packedValues[sumValue17].x, comparisonValue256, fragmentVectorConstants1.packedValues[sumValue279].x * comparisonValue255)) + fragmentVectorConstants1.packedValues[sumValue19].x;
                                multiplyAddValue39 = fma(fragmentVectorConstants1.packedValues[sumValue18].y, comparisonValue257, fma(fragmentVectorConstants1.packedValues[sumValue17].y, comparisonValue256, fragmentVectorConstants1.packedValues[sumValue279].y * comparisonValue255)) + fragmentVectorConstants1.packedValues[sumValue19].y;
                                multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[sumValue18].z, comparisonValue257, fma(fragmentVectorConstants1.packedValues[sumValue17].z, comparisonValue256, fragmentVectorConstants1.packedValues[sumValue279].z * comparisonValue255)) + fragmentVectorConstants1.packedValues[sumValue19].z;
                                comparisonValue30 = ((abs(multiplyAddValue38) <= 1.0) && (abs(multiplyAddValue39) <= 1.0)) && (abs(multiplyAddValue40) <= 1.0);
                                uint branchMergedValue1;
                                float branchMergedValue7;
                                float branchMergedValue8;
                                if (comparisonValue30)
                                {
                                    uint sumValue21 = scalarValue31 + 48u;
                                    float sumValue280 = spvNMin(spvNMax(dotProductValue19, fragmentScalarConstants1.packedValues[scalarValue31 + 244u]), 1.0);
                                    float nonlinearValue12 = (sqrt(1.0 - (sumValue280 * sumValue280)) / sumValue280) * fragmentVectorConstants1.packedValues[sumValue21].z;
                                    float productValue87 = (multiplyAddValue38 * 0.5) + 0.5;
                                    float productValue88 = 0.5 - (multiplyAddValue39 * 0.5);
                                    uint sumValue23 = bitwiseValue10 + 18u;
                                    float nonlinearValue13 = sqrt((((fragmentVectorConstants1.packedValues[sumValue23].x * fragmentVectorConstants1.packedValues[sumValue23].x) + (fragmentVectorConstants1.packedValues[sumValue23].y * fragmentVectorConstants1.packedValues[sumValue23].y)) + (fragmentVectorConstants1.packedValues[sumValue23].z * fragmentVectorConstants1.packedValues[sumValue23].z)) + (fragmentVectorConstants1.packedValues[sumValue23].w * fragmentVectorConstants1.packedValues[sumValue23].w)) * fragmentVectorConstants1.packedValues[140u].z;
                                    uint comparisonValue258 = (fragmentVectorConstants1.packedValues[133u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[sumValue21].w + 0.5))), int(1u)))), int(9u)));
                                    uint quotientValue57 = uint(int(comparisonValue258) / int(2u));
                                    float intermediateValue148;
                                    float intermediateValue149;
                                    if (int(comparisonValue258) > int(0u))
                                    {
                                        float sumValue91;
                                        float productValue173;
                                        float intermediateValue177;
                                        float intermediateValue178;
                                        uint intermediateValue179;
                                        float scalarValue32 = 0.0;
                                        float scalarValue33 = 0.0;
                                        uint scalarValue34 = 0u;
                                        for (;;)
                                        {
                                            intermediateValue177 = scalarValue32;
                                            intermediateValue178 = scalarValue33;
                                            intermediateValue179 = 0u;
                                            float intermediateValue223;
                                            float intermediateValue180;
                                            float intermediateValue181;
                                            float intermediateValue182;
                                            float intermediateValue183;
                                            float productValue181;
                                            float productValue182;
                                            bool comparisonValue56;
                                            float sumValue101;
                                            for (;;)
                                            {
                                                float productValue386 = (productValue87 + ((float(int(intermediateValue179 - quotientValue57)) + 0.5) * fragmentVectorConstants1.packedValues[138u].x)) * fragmentVectorConstants1.packedValues[sumValue21].x;
                                                float productValue387 = (productValue88 + (fragmentVectorConstants1.packedValues[138u].x * (float(int(scalarValue34 - quotientValue57)) + 0.5))) * fragmentVectorConstants1.packedValues[sumValue21].x;
                                                vec4 sampledTextureValue114 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue386, productValue387, float(int(scalarValue31))));
                                                intermediateValue180 = sampledTextureValue114.x;
                                                intermediateValue181 = sampledTextureValue114.y;
                                                intermediateValue182 = sampledTextureValue114.z;
                                                intermediateValue183 = sampledTextureValue114.w;
                                                productValue181 = fract((productValue386 * fragmentVectorConstants1.packedValues[138u].z) + 0.5);
                                                productValue182 = fract((productValue387 * fragmentVectorConstants1.packedValues[138u].z) + 0.5);
                                                float productValue388 = spvNClamp((multiplyAddValue40 - intermediateValue180) * nonlinearValue13, 0.0, 1.0);
                                                float productValue389 = spvNClamp((multiplyAddValue40 - intermediateValue181) * nonlinearValue13, 0.0, 1.0);
                                                float productValue390 = spvNClamp((multiplyAddValue40 - intermediateValue182) * nonlinearValue13, 0.0, 1.0);
                                                float productValue391 = spvNClamp((multiplyAddValue40 - intermediateValue183) * nonlinearValue13, 0.0, 1.0);
                                                float productValue392 = 1.0 - ((productValue388 * productValue388) * (3.0 - (productValue388 * 2.0)));
                                                float productValue393 = 1.0 - ((productValue391 * productValue391) * (3.0 - (productValue391 * 2.0)));
                                                float productValue394 = (((1.0 - ((productValue390 * productValue390) * (3.0 - (productValue390 * 2.0)))) - productValue393) * productValue181) + productValue393;
                                                productValue173 = (productValue394 + intermediateValue178) + ((((((1.0 - ((productValue389 * productValue389) * (3.0 - (productValue389 * 2.0)))) - productValue392) * productValue181) + productValue392) - productValue394) * productValue182);
                                                comparisonValue56 = fragmentVectorConstants1.packedValues[133u].x != 0.0;
                                                sumValue101 = (multiplyAddValue40 - fragmentVectorConstants1.packedValues[sumValue21].y) - nonlinearValue12;
                                                float branchMergedValue4;
                                                if (comparisonValue56)
                                                {
                                                    branchMergedValue4 = float(intermediateValue183 >= sumValue101);
                                                }
                                                else
                                                {
                                                    float comparisonValue259 = (intermediateValue180 < sumValue101) ? 0.0 : 1.0;
                                                    float comparisonValue260 = (intermediateValue183 < sumValue101) ? 0.0 : 1.0;
                                                    float comparisonValue261 = ((((intermediateValue182 < sumValue101) ? 0.0 : 1.0) - comparisonValue260) * productValue181) + comparisonValue260;
                                                    branchMergedValue4 = (((((((intermediateValue181 < sumValue101) ? 0.0 : 1.0) - comparisonValue259) * productValue181) + comparisonValue259) - comparisonValue261) * productValue182) + comparisonValue261;
                                                }
                                                intermediateValue223 = branchMergedValue4;
                                                sumValue91 = intermediateValue223 + intermediateValue177;
                                                uint sumValue281 = intermediateValue179 + 1u;
                                                if (sumValue281 == comparisonValue258)
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    intermediateValue177 = sumValue91;
                                                    intermediateValue178 = productValue173;
                                                    intermediateValue179 = sumValue281;
                                                    continue;
                                                }
                                            }
                                            uint sumValue25 = scalarValue34 + 1u;
                                            if (sumValue25 == comparisonValue258)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                scalarValue32 = sumValue91;
                                                scalarValue33 = productValue173;
                                                scalarValue34 = sumValue25;
                                                continue;
                                            }
                                        }
                                        intermediateValue148 = sumValue91;
                                        intermediateValue149 = productValue173;
                                    }
                                    else
                                    {
                                        intermediateValue148 = 0.0;
                                        intermediateValue149 = 0.0;
                                    }
                                    float productValue395 = float(int(comparisonValue258 * comparisonValue258));
                                    branchMergedValue1 = sumValue34;
                                    branchMergedValue7 = spvNMin(scalarValue30, intermediateValue148 / productValue395);
                                    branchMergedValue8 = spvNMin(scalarValue29, intermediateValue149 / productValue395);
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue31 + 1u;
                                    branchMergedValue7 = scalarValue30;
                                    branchMergedValue8 = scalarValue29;
                                }
                                intermediateValue96 = branchMergedValue1;
                                intermediateValue95 = branchMergedValue7;
                                intermediateValue94 = branchMergedValue8;
                                if (int(intermediateValue96) < int(sumValue34))
                                {
                                    scalarValue29 = intermediateValue94;
                                    scalarValue30 = intermediateValue95;
                                    scalarValue31 = intermediateValue96;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            branchMergedValue = intermediateValue96;
                            branchMergedValue5 = intermediateValue95;
                            branchMergedValue6 = intermediateValue94;
                        }
                        else
                        {
                            branchMergedValue = scalarValue27;
                            branchMergedValue5 = scalarValue26;
                            branchMergedValue6 = scalarValue25;
                        }
                        intermediateValue76 = branchMergedValue;
                        intermediateValue65 = branchMergedValue5;
                        intermediateValue63 = branchMergedValue6;
                        uint sumValue26 = scalarValue28 + 1u;
                        if (sumValue26 == dotProductValue20)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue25 = intermediateValue63;
                            scalarValue26 = intermediateValue65;
                            scalarValue27 = intermediateValue76;
                            scalarValue28 = sumValue26;
                            continue;
                        }
                    }
                    intermediateValue45 = intermediateValue63;
                    intermediateValue64 = intermediateValue65;
#endif
                }
                else
                {
#if RD_PLATFORM == RD_PLATFORM_SM50
                    productValue24 = 0.0;
                    productValue25 = 0.0;
                    productValue26 = 1.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    intermediateValue50 = 1.0;
                    intermediateValue69 = 1.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    intermediateValue45 = 1.0;
                    intermediateValue64 = 1.0;
#endif
                }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue65 = productValue24;
                intermediateValue66 = productValue25;
                intermediateValue67 = productValue26;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue63 = productValue24;
                intermediateValue64 = productValue25;
                intermediateValue65 = productValue26;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float intermediateValue85;
                if (int(uint(int(fragmentVectorConstants1.packedValues[56u].x))) > int(0u))
                {
                    float scalarValue35 = spvNMin(spvNMax(dotProductValue1, fragmentVectorConstants1.packedValues[61u].x), 1.0);
                    float multiplyAddValue30 = spvNMin(((fragmentVectorConstants1.packedValues[128u].z - fragmentVectorConstants1.packedValues[48u].y) + fma(fragmentVectorConstants1.packedValues[127u].z, comparisonValue13, fma(fragmentVectorConstants1.packedValues[126u].z, comparisonValue12, fragmentVectorConstants1.packedValues[125u].z * comparisonValue11))) - ((sqrt(1.0 - (scalarValue35 * scalarValue35)) / scalarValue35) * fragmentVectorConstants1.packedValues[48u].z), 1.0);
                    float multiplyAddValue31 = (((fma(fragmentVectorConstants1.packedValues[127u].x, comparisonValue13, fma(fragmentVectorConstants1.packedValues[126u].x, comparisonValue12, fragmentVectorConstants1.packedValues[125u].x * comparisonValue11)) + fragmentVectorConstants1.packedValues[128u].x) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[56u].y;
                    float multiplyAddValue32 = (0.5 - ((fma(fragmentVectorConstants1.packedValues[127u].y, comparisonValue13, fma(fragmentVectorConstants1.packedValues[126u].y, comparisonValue12, fragmentVectorConstants1.packedValues[125u].y * comparisonValue11)) + fragmentVectorConstants1.packedValues[128u].y) * 0.5)) * fragmentVectorConstants1.packedValues[56u].y;
                    uint comparisonValue21 = (fragmentVectorConstants1.packedValues[134u].x != 0.0) ? 1u : 2u;
                    uint bitwiseValue = comparisonValue21 >> 1u;
                    float branchMergedValue12;
                    if ((multiplyAddValue32 < fragmentVectorConstants1.packedValues[56u].y) && (((multiplyAddValue31 >= 0.0) && (multiplyAddValue31 < fragmentVectorConstants1.packedValues[56u].y)) && (multiplyAddValue32 >= 0.0)))
                    {
                        float dotProductValue3 = dot(vec4(fragmentVectorConstants1.packedValues[78u]), vec4(1.0)) + 1.0;
                        float sumValue69;
                        float intermediateValue136;
                        uint intermediateValue137;
                        float scalarValue36 = 0.0;
                        uint scalarValue37 = 0u;
                        for (;;)
                        {
                            intermediateValue136 = scalarValue36;
                            intermediateValue137 = 0u;
                            float intermediateValue175;
                            float productValue172;
                            float productValue173;
                            bool comparisonValue42;
                            for (;;)
                            {
                                float productValue99 = fragmentVectorConstants1.packedValues[56u].y * fragmentVectorConstants1.packedValues[56u].z;
                                productValue172 = (productValue99 * (float(int(intermediateValue137 - bitwiseValue)) + 0.5)) + multiplyAddValue31;
                                productValue173 = (productValue99 * (float(int(scalarValue37 - bitwiseValue)) + 0.5)) + multiplyAddValue32;
                                comparisonValue42 = fragmentVectorConstants1.packedValues[134u].x != 0.0;
                                float branchMergedValue2;
                                if (comparisonValue42)
                                {
                                    branchMergedValue2 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue172, productValue173, dotProductValue3), 0.0).x >= multiplyAddValue30);
                                }
                                else
                                {
                                    vec4 sampledTextureValue28 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue172, productValue173, dotProductValue3));
                                    float productValue100 = fract((fragmentVectorConstants1.packedValues[139u].z * productValue172) + 0.5);
                                    float comparisonValue22 = (sampledTextureValue28.x < multiplyAddValue30) ? 0.0 : 1.0;
                                    float comparisonValue23 = (sampledTextureValue28.w < multiplyAddValue30) ? 0.0 : 1.0;
                                    float comparisonValue24 = ((((sampledTextureValue28.z < multiplyAddValue30) ? 0.0 : 1.0) - comparisonValue23) * productValue100) + comparisonValue23;
                                    branchMergedValue2 = (((((((sampledTextureValue28.y < multiplyAddValue30) ? 0.0 : 1.0) - comparisonValue22) * productValue100) + comparisonValue22) - comparisonValue24) * fract((fragmentVectorConstants1.packedValues[139u].z * productValue173) + 0.5)) + comparisonValue24;
                                }
                                intermediateValue175 = branchMergedValue2;
                                sumValue69 = intermediateValue175 + intermediateValue136;
                                uint sumValue27 = intermediateValue137 + 1u;
                                if (int(sumValue27) < int(comparisonValue21))
                                {
                                    intermediateValue136 = sumValue69;
                                    intermediateValue137 = sumValue27;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            uint sumValue28 = scalarValue37 + 1u;
                            if (int(sumValue28) < int(comparisonValue21))
                            {
                                scalarValue36 = sumValue69;
                                scalarValue37 = sumValue28;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                        branchMergedValue12 = sumValue69 / float(int(comparisonValue21 * comparisonValue21));
                    }
                    else
                    {
                        branchMergedValue12 = 1.0;
                    }
                    intermediateValue85 = branchMergedValue12;
                }
                else
                {
                    intermediateValue85 = 1.0;
                }
                float intermediateValue103;
                if ((int(uint(int(fragmentVectorConstants1.packedValues[60u].y))) > int(0u)) && (int(uint(int(fragmentVectorConstants1.packedValues[120u].x))) > int(0u)))
                {
                    float multiplyAddValue33 = fma(fragmentVectorConstants1.packedValues[118u].w, comparisonValue13, fma(fragmentVectorConstants1.packedValues[117u].w, comparisonValue12, fragmentVectorConstants1.packedValues[116u].w * comparisonValue11)) + fragmentVectorConstants1.packedValues[119u].w;
                    float scalarValue38 = spvNMin(spvNMax(dotProductValue1, fragmentVectorConstants1.packedValues[61u].x), 1.0);
                    float multiplyAddValue49 = (((fma(fragmentVectorConstants1.packedValues[118u].z, comparisonValue13, fma(fragmentVectorConstants1.packedValues[117u].z, comparisonValue12, fragmentVectorConstants1.packedValues[116u].z * comparisonValue11)) + fragmentVectorConstants1.packedValues[119u].z) / multiplyAddValue33) - fragmentVectorConstants1.packedValues[48u].y) - ((sqrt(1.0 - (scalarValue38 * scalarValue38)) / scalarValue38) * fragmentVectorConstants1.packedValues[48u].z);
                    float multiplyAddValue50 = (((fma(fragmentVectorConstants1.packedValues[118u].x, comparisonValue13, fma(fragmentVectorConstants1.packedValues[117u].x, comparisonValue12, fragmentVectorConstants1.packedValues[116u].x * comparisonValue11)) + fragmentVectorConstants1.packedValues[119u].x) / multiplyAddValue33) * 0.5) + 0.5;
                    float multiplyAddValue51 = 0.5 - (((fma(fragmentVectorConstants1.packedValues[118u].y, comparisonValue13, fma(fragmentVectorConstants1.packedValues[117u].y, comparisonValue12, fragmentVectorConstants1.packedValues[116u].y * comparisonValue11)) + fragmentVectorConstants1.packedValues[119u].y) / multiplyAddValue33) * 0.5);
                    uint comparisonValue28 = (fragmentVectorConstants1.packedValues[134u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[63u].z + 0.5))), int(1u)))), int(9u)));
                    uint quotientValue14 = uint(int(comparisonValue28) / int(2u));
                    float dotProductValue4 = dot(vec4(fragmentVectorConstants1.packedValues[78u]), vec4(1.0));
                    float intermediateValue131;
                    if (int(comparisonValue28) > int(0u))
                    {
                        float sumValue71;
                        float intermediateValue155;
                        uint intermediateValue156;
                        float scalarValue39 = 0.0;
                        uint scalarValue40 = 0u;
                        for (;;)
                        {
                            intermediateValue155 = scalarValue39;
                            intermediateValue156 = 0u;
                            float intermediateValue189;
                            vec4 intermediateValue157;
                            float productValue179;
                            float productValue180;
                            bool comparisonValue46;
                            for (;;)
                            {
                                intermediateValue157 = fragmentVectorConstants1.packedValues[139u];
                                productValue179 = (multiplyAddValue50 + ((float(int(intermediateValue156 - quotientValue14)) + 0.5) * intermediateValue157.x)) * fragmentVectorConstants1.packedValues[48u].x;
                                productValue180 = (multiplyAddValue51 + (intermediateValue157.x * (float(int(scalarValue40 - quotientValue14)) + 0.5))) * fragmentVectorConstants1.packedValues[48u].x;
                                comparisonValue46 = fragmentVectorConstants1.packedValues[134u].x != 0.0;
                                float branchMergedValue3;
                                if (comparisonValue46)
                                {
                                    branchMergedValue3 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue179, productValue180, dotProductValue4), 0.0).x >= multiplyAddValue49);
                                }
                                else
                                {
                                    vec4 sampledTextureValue29 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue179, productValue180, dotProductValue4));
                                    float productValue101 = fract((productValue179 * intermediateValue157.z) + 0.5);
                                    float comparisonValue34 = (sampledTextureValue29.x < multiplyAddValue49) ? 0.0 : 1.0;
                                    float comparisonValue35 = (sampledTextureValue29.w < multiplyAddValue49) ? 0.0 : 1.0;
                                    float comparisonValue38 = ((((sampledTextureValue29.z < multiplyAddValue49) ? 0.0 : 1.0) - comparisonValue35) * productValue101) + comparisonValue35;
                                    branchMergedValue3 = (((((((sampledTextureValue29.y < multiplyAddValue49) ? 0.0 : 1.0) - comparisonValue34) * productValue101) + comparisonValue34) - comparisonValue38) * fract((productValue180 * intermediateValue157.z) + 0.5)) + comparisonValue38;
                                }
                                intermediateValue189 = branchMergedValue3;
                                sumValue71 = intermediateValue189 + intermediateValue155;
                                uint sumValue29 = intermediateValue156 + 1u;
                                if (sumValue29 == comparisonValue28)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue155 = sumValue71;
                                    intermediateValue156 = sumValue29;
                                    continue;
                                }
                            }
                            uint sumValue30 = scalarValue40 + 1u;
                            if (sumValue30 == comparisonValue28)
                            {
                                break;
                            }
                            else
                            {
                                scalarValue39 = sumValue71;
                                scalarValue40 = sumValue30;
                                continue;
                            }
                        }
                        intermediateValue131 = sumValue71;
                    }
                    else
                    {
                        intermediateValue131 = 0.0;
                    }
                    float quotientValue15 = intermediateValue131 / float(int(comparisonValue28 * comparisonValue28));
                    float branchMergedValue14;
                    if (quotientValue15 < 1.0)
                    {
                        branchMergedValue14 = spvNMin(1.0, spvNMax(quotientValue15, 1.0 - fragmentVectorConstants1.packedValues[63u].w));
                    }
                    else
                    {
                        branchMergedValue14 = 1.0;
                    }
                    intermediateValue103 = branchMergedValue14;
                }
                else
                {
                    intermediateValue103 = 1.0;
                }
                float scalarValue41 = spvNMin(intermediateValue69, spvNMin(intermediateValue85, intermediateValue103));
                float productValue102 = spvNMax(0.0, fragmentVectorConstants1.packedValues[139u].y - spvNMin(fragmentVectorConstants1.packedValues[139u].y * 0.100000001490116119384765625, 8.0));
                float quotientValue18 = spvNClamp((sumValue9 - productValue102) / (fragmentVectorConstants1.packedValues[139u].y - productValue102), 0.0, 1.0);
                productValue68 = (((quotientValue18 * quotientValue18) * (1.0 - scalarValue41)) * (3.0 - (quotientValue18 * 2.0))) + scalarValue41;
                intermediateValue49 = intermediateValue50;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float intermediateValue80;
                if (int(uint(int(fragmentVectorConstants1.packedValues[56u].x))) > int(0u))
                {
                    float scalarValue258 = spvNMin(spvNMax(dotProductValue19, fragmentVectorConstants1.packedValues[61u].x), 1.0);
                    float multiplyAddValue401 = spvNMin(((fragmentVectorConstants1.packedValues[127u].z - fragmentVectorConstants1.packedValues[48u].y) + fma(fragmentVectorConstants1.packedValues[126u].z, comparisonValue257, fma(fragmentVectorConstants1.packedValues[125u].z, comparisonValue256, fragmentVectorConstants1.packedValues[124u].z * comparisonValue255))) - ((sqrt(1.0 - (scalarValue258 * scalarValue258)) / scalarValue258) * fragmentVectorConstants1.packedValues[48u].z), 1.0);
                    float multiplyAddValue402 = (((fma(fragmentVectorConstants1.packedValues[126u].x, comparisonValue257, fma(fragmentVectorConstants1.packedValues[125u].x, comparisonValue256, fragmentVectorConstants1.packedValues[124u].x * comparisonValue255)) + fragmentVectorConstants1.packedValues[127u].x) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[56u].y;
                    float multiplyAddValue403 = (0.5 - ((fma(fragmentVectorConstants1.packedValues[126u].y, comparisonValue257, fma(fragmentVectorConstants1.packedValues[125u].y, comparisonValue256, fragmentVectorConstants1.packedValues[124u].y * comparisonValue255)) + fragmentVectorConstants1.packedValues[127u].y) * 0.5)) * fragmentVectorConstants1.packedValues[56u].y;
                    uint comparisonValue262 = (fragmentVectorConstants1.packedValues[133u].x != 0.0) ? 1u : 2u;
                    uint bitwiseValue107 = comparisonValue262 >> 1u;
                    float branchMergedValue12;
                    if ((multiplyAddValue403 < fragmentVectorConstants1.packedValues[56u].y) && (((multiplyAddValue402 >= 0.0) && (multiplyAddValue402 < fragmentVectorConstants1.packedValues[56u].y)) && (multiplyAddValue403 >= 0.0)))
                    {
                        float dotProductValue21 = dot(vec4(fragmentVectorConstants1.packedValues[77u]), vec4(1.0)) + 1.0;
                        float sumValue69;
                        float intermediateValue131;
                        uint intermediateValue132;
                        float scalarValue36 = 0.0;
                        uint scalarValue37 = 0u;
                        for (;;)
                        {
                            intermediateValue131 = scalarValue36;
                            intermediateValue132 = 0u;
                            float intermediateValue170;
                            float productValue169;
                            float productValue170;
                            bool comparisonValue42;
                            for (;;)
                            {
                                float productValue99 = fragmentVectorConstants1.packedValues[56u].y * fragmentVectorConstants1.packedValues[56u].z;
                                productValue169 = (productValue99 * (float(int(intermediateValue132 - bitwiseValue107)) + 0.5)) + multiplyAddValue402;
                                productValue170 = (productValue99 * (float(int(scalarValue37 - bitwiseValue107)) + 0.5)) + multiplyAddValue403;
                                comparisonValue42 = fragmentVectorConstants1.packedValues[133u].x != 0.0;
                                float branchMergedValue2;
                                if (comparisonValue42)
                                {
                                    branchMergedValue2 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue169, productValue170, dotProductValue21), 0.0).x >= multiplyAddValue401);
                                }
                                else
                                {
                                    vec4 sampledTextureValue115 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue169, productValue170, dotProductValue21));
                                    float productValue396 = fract((fragmentVectorConstants1.packedValues[138u].z * productValue169) + 0.5);
                                    float comparisonValue263 = (sampledTextureValue115.x < multiplyAddValue401) ? 0.0 : 1.0;
                                    float comparisonValue264 = (sampledTextureValue115.w < multiplyAddValue401) ? 0.0 : 1.0;
                                    float comparisonValue265 = ((((sampledTextureValue115.z < multiplyAddValue401) ? 0.0 : 1.0) - comparisonValue264) * productValue396) + comparisonValue264;
                                    branchMergedValue2 = (((((((sampledTextureValue115.y < multiplyAddValue401) ? 0.0 : 1.0) - comparisonValue263) * productValue396) + comparisonValue263) - comparisonValue265) * fract((fragmentVectorConstants1.packedValues[138u].z * productValue170) + 0.5)) + comparisonValue265;
                                }
                                intermediateValue170 = branchMergedValue2;
                                sumValue69 = intermediateValue170 + intermediateValue131;
                                uint sumValue282 = intermediateValue132 + 1u;
                                if (int(sumValue282) < int(comparisonValue262))
                                {
                                    intermediateValue131 = sumValue69;
                                    intermediateValue132 = sumValue282;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            uint sumValue28 = scalarValue37 + 1u;
                            if (int(sumValue28) < int(comparisonValue262))
                            {
                                scalarValue36 = sumValue69;
                                scalarValue37 = sumValue28;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                        branchMergedValue12 = sumValue69 / float(int(comparisonValue262 * comparisonValue262));
                    }
                    else
                    {
                        branchMergedValue12 = 1.0;
                    }
                    intermediateValue80 = branchMergedValue12;
                }
                else
                {
                    intermediateValue80 = 1.0;
                }
                float intermediateValue98;
                if ((int(uint(int(fragmentVectorConstants1.packedValues[60u].y))) > int(0u)) && (int(uint(int(fragmentVectorConstants1.packedValues[119u].x))) > int(0u)))
                {
                    float multiplyAddValue404 = fma(fragmentVectorConstants1.packedValues[117u].w, comparisonValue257, fma(fragmentVectorConstants1.packedValues[116u].w, comparisonValue256, fragmentVectorConstants1.packedValues[115u].w * comparisonValue255)) + fragmentVectorConstants1.packedValues[118u].w;
                    float scalarValue259 = spvNMin(spvNMax(dotProductValue19, fragmentVectorConstants1.packedValues[61u].x), 1.0);
                    float multiplyAddValue405 = (((fma(fragmentVectorConstants1.packedValues[117u].z, comparisonValue257, fma(fragmentVectorConstants1.packedValues[116u].z, comparisonValue256, fragmentVectorConstants1.packedValues[115u].z * comparisonValue255)) + fragmentVectorConstants1.packedValues[118u].z) / multiplyAddValue404) - fragmentVectorConstants1.packedValues[48u].y) - ((sqrt(1.0 - (scalarValue259 * scalarValue259)) / scalarValue259) * fragmentVectorConstants1.packedValues[48u].z);
                    float multiplyAddValue406 = (((fma(fragmentVectorConstants1.packedValues[117u].x, comparisonValue257, fma(fragmentVectorConstants1.packedValues[116u].x, comparisonValue256, fragmentVectorConstants1.packedValues[115u].x * comparisonValue255)) + fragmentVectorConstants1.packedValues[118u].x) / multiplyAddValue404) * 0.5) + 0.5;
                    float multiplyAddValue407 = 0.5 - (((fma(fragmentVectorConstants1.packedValues[117u].y, comparisonValue257, fma(fragmentVectorConstants1.packedValues[116u].y, comparisonValue256, fragmentVectorConstants1.packedValues[115u].y * comparisonValue255)) + fragmentVectorConstants1.packedValues[118u].y) / multiplyAddValue404) * 0.5);
                    uint comparisonValue266 = (fragmentVectorConstants1.packedValues[133u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[63u].z + 0.5))), int(1u)))), int(9u)));
                    uint quotientValue58 = uint(int(comparisonValue266) / int(2u));
                    float dotProductValue22 = dot(vec4(fragmentVectorConstants1.packedValues[77u]), vec4(1.0));
                    float intermediateValue126;
                    if (int(comparisonValue266) > int(0u))
                    {
                        float sumValue71;
                        float intermediateValue150;
                        uint intermediateValue151;
                        float scalarValue39 = 0.0;
                        uint scalarValue40 = 0u;
                        for (;;)
                        {
                            intermediateValue150 = scalarValue39;
                            intermediateValue151 = 0u;
                            float intermediateValue184;
                            vec4 intermediateValue152;
                            float productValue176;
                            float productValue177;
                            bool comparisonValue46;
                            for (;;)
                            {
                                intermediateValue152 = fragmentVectorConstants1.packedValues[138u];
                                productValue176 = (multiplyAddValue406 + ((float(int(intermediateValue151 - quotientValue58)) + 0.5) * intermediateValue152.x)) * fragmentVectorConstants1.packedValues[48u].x;
                                productValue177 = (multiplyAddValue407 + (intermediateValue152.x * (float(int(scalarValue40 - quotientValue58)) + 0.5))) * fragmentVectorConstants1.packedValues[48u].x;
                                comparisonValue46 = fragmentVectorConstants1.packedValues[133u].x != 0.0;
                                float branchMergedValue3;
                                if (comparisonValue46)
                                {
                                    branchMergedValue3 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue176, productValue177, dotProductValue22), 0.0).x >= multiplyAddValue405);
                                }
                                else
                                {
                                    vec4 sampledTextureValue116 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue176, productValue177, dotProductValue22));
                                    float productValue397 = fract((productValue176 * intermediateValue152.z) + 0.5);
                                    float comparisonValue267 = (sampledTextureValue116.x < multiplyAddValue405) ? 0.0 : 1.0;
                                    float comparisonValue268 = (sampledTextureValue116.w < multiplyAddValue405) ? 0.0 : 1.0;
                                    float comparisonValue269 = ((((sampledTextureValue116.z < multiplyAddValue405) ? 0.0 : 1.0) - comparisonValue268) * productValue397) + comparisonValue268;
                                    branchMergedValue3 = (((((((sampledTextureValue116.y < multiplyAddValue405) ? 0.0 : 1.0) - comparisonValue267) * productValue397) + comparisonValue267) - comparisonValue269) * fract((productValue177 * intermediateValue152.z) + 0.5)) + comparisonValue269;
                                }
                                intermediateValue184 = branchMergedValue3;
                                sumValue71 = intermediateValue184 + intermediateValue150;
                                uint sumValue283 = intermediateValue151 + 1u;
                                if (sumValue283 == comparisonValue266)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue150 = sumValue71;
                                    intermediateValue151 = sumValue283;
                                    continue;
                                }
                            }
                            uint sumValue30 = scalarValue40 + 1u;
                            if (sumValue30 == comparisonValue266)
                            {
                                break;
                            }
                            else
                            {
                                scalarValue39 = sumValue71;
                                scalarValue40 = sumValue30;
                                continue;
                            }
                        }
                        intermediateValue126 = sumValue71;
                    }
                    else
                    {
                        intermediateValue126 = 0.0;
                    }
                    float quotientValue59 = intermediateValue126 / float(int(comparisonValue266 * comparisonValue266));
                    float branchMergedValue14;
                    if (quotientValue59 < 1.0)
                    {
                        branchMergedValue14 = spvNMin(1.0, spvNMax(quotientValue59, 1.0 - fragmentVectorConstants1.packedValues[63u].w));
                    }
                    else
                    {
                        branchMergedValue14 = 1.0;
                    }
                    intermediateValue98 = branchMergedValue14;
                }
                else
                {
                    intermediateValue98 = 1.0;
                }
                float scalarValue260 = spvNMin(intermediateValue64, spvNMin(intermediateValue80, intermediateValue98));
                float productValue398 = spvNMax(0.0, fragmentVectorConstants1.packedValues[138u].y - spvNMin(fragmentVectorConstants1.packedValues[138u].y * 0.100000001490116119384765625, 8.0));
                float quotientValue60 = spvNClamp((sumValue9 - productValue398) / (fragmentVectorConstants1.packedValues[138u].y - productValue398), 0.0, 1.0);
                productValue65 = (((quotientValue60 * quotientValue60) * (1.0 - scalarValue260)) * (3.0 - (quotientValue60 * 2.0))) + scalarValue260;
                intermediateValue44 = intermediateValue45;
#endif
            }
            else
            {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                float intermediateValue88;
                float intermediateValue90;
                float intermediateValue92;
                if ((reinterpretedBits3 & 16u) == 16u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                float intermediateValue86;
                float intermediateValue88;
                float intermediateValue90;
                if ((reinterpretedBits15 & 16u) == 16u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                productValue68 = 1.0;
                intermediateValue49 = 1.0;
            }
            float multiplyAddValue52 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].x)));
            float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].y)));
            float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].z)));
            float inverseLengthValue13 = inversesqrt(dot(vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54), vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54)));
            float productValue110 = inverseLengthValue13 * multiplyAddValue52;
            float productValue111 = inverseLengthValue13 * multiplyAddValue53;
            float productValue112 = inverseLengthValue13 * multiplyAddValue54;
            float productValue113 = fragmentVectorConstants1.packedValues[64u].x * (fragmentVectorConstants1.packedValues[121u].w * sampledTextureValue13);
            float productValue114 = productValue113 * fragmentVectorConstants1.packedValues[121u].x;
            float productValue115 = productValue113 * fragmentVectorConstants1.packedValues[121u].y;
            float productValue116 = productValue113 * fragmentVectorConstants1.packedValues[121u].z;
            float dotProductValue5 = dot(vec3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23), vec3(productValue110, productValue111, productValue112));
            float scalarValue42 = spvNMax(dotProductValue5, 0.0);
            float dotProductValue6 = spvNMax(dot(vec3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23), vec3(sumValue14, sumValue15, sumValue16)), 0.0);
            float sumValue31 = fragmentVectorConstants1.packedValues[141u].y + 1.0;
            float productValue117 = sumValue31 * sumValue31;
            float sumValue32 = productValue110 - quotientValue10;
            float sumValue35 = productValue111 - quotientValue11;
            float sumValue36 = productValue112 - quotientValue12;
            float inverseLengthValue14 = inversesqrt(dot(vec3(sumValue32, sumValue35, sumValue36), vec3(sumValue32, sumValue35, sumValue36)));
            float productValue118 = inverseLengthValue14 * sumValue32;
            float productValue119 = inverseLengthValue14 * sumValue35;
            float productValue120 = inverseLengthValue14 * sumValue36;
            float scalarValue43 = spvNMax(intermediateValue16, 0.0500000007450580596923828125);
            float productValue121 = scalarValue43 * scalarValue43;
            float productValue122 = productValue121 * productValue121;
            float dotProductValue7 = spvNMax(dot(vec3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23), vec3(productValue118, productValue119, productValue120)), 0.0);
            float productValue123 = ((dotProductValue7 * dotProductValue7) * (productValue122 + (-1.0))) + 1.0;
            float productValue124 = productValue121 * 0.5;
            float sumValue37 = 1.0 - productValue124;
            float sumValue38 = productValue124 + 9.9999997473787516355514526367188e-05;
            float dotProductValue8 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue14, sumValue15, sumValue16), vec3(productValue118, productValue119, productValue120)), 0.0), 0.0, 1.0);
            float productValue125 = dotProductValue8 * dotProductValue8;
            float productValue126 = (productValue125 * productValue125) * dotProductValue8;
            float productValue127 = (productValue126 * (1.0 - productValue82)) + productValue82;
            float productValue128 = (productValue126 * (1.0 - productValue83)) + productValue83;
            float productValue129 = (productValue126 * (1.0 - productValue84)) + productValue84;
            float quotientValue19 = ((dotProductValue6 / ((sumValue37 * dotProductValue6) + sumValue38)) * (productValue122 / ((productValue123 * productValue123) * 3.1415927410125732421875))) * (scalarValue42 / ((sumValue37 * scalarValue42) + sumValue38));
            float productValue130 = ((scalarValue42 * 4.0) * dotProductValue6) + 9.9999997473787516355514526367188e-05;
            float quotientValue20 = (((spvNMax((dotProductValue5 + fragmentVectorConstants1.packedValues[141u].y) / productValue117, 0.0) - scalarValue42) * productValue85) + scalarValue42) * productValue68;
            float dotProductValue9 = (intermediateValue49 * productValue85) * spvNMax((dot(vec3((-0.0) - multiplyAddValue21, (-0.0) - multiplyAddValue22, (-0.0) - multiplyAddValue23), vec3(productValue110, productValue111, productValue112)) + fragmentVectorConstants1.packedValues[141u].y) / productValue117, 0.0);
            float productValue131 = sumValue12 * 0.3183098733425140380859375;
            float productValue132 = fragmentVectorConstants1.packedValues[123u].y * (scalarValue42 * productValue68);
            intermediateValue29 = (productValue132 * productValue114) * ((productValue127 * quotientValue19) / productValue130);
            intermediateValue31 = (productValue132 * productValue115) * ((productValue128 * quotientValue19) / productValue130);
            intermediateValue33 = (productValue132 * productValue116) * ((productValue129 * quotientValue19) / productValue130);
            intermediateValue35 = (((productValue131 * exponentialValue) * productValue114) * fragmentVectorConstants1.packedValues[123u].x) * (((1.0 - productValue127) * quotientValue20) + dotProductValue9);
            intermediateValue37 = (((productValue131 * exponentialValue1) * productValue115) * fragmentVectorConstants1.packedValues[123u].x) * (((1.0 - productValue128) * quotientValue20) + dotProductValue9);
            intermediateValue39 = (((productValue131 * exponentialValue2) * productValue116) * fragmentVectorConstants1.packedValues[123u].x) * (((1.0 - productValue129) * quotientValue20) + dotProductValue9);
        }
        float intermediateValue46;
        float intermediateValue47;
        float intermediateValue48;
        if (fragmentVectorConstants1.packedValues[64u].w != 0.0)
        {
            float productValue133 = ((varyingTexCoord3.x + (-0.5)) + (productValue21 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[115u].x;
            float productValue134 = ((varyingTexCoord3.y + (-0.5)) + (productValue22 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[115u].y;
            float productValue135 = ((varyingTexCoord3.z + (-0.5)) + (productValue23 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[115u].z;
            float productValue136 = floor(productValue133 * 0.0625) * 16.0;
            float productValue137 = floor(productValue134 * 0.0625) * 16.0;
            float productValue138 = floor(productValue135 * 0.0625) * 16.0;
            uint productValue139 = uint(int(floor(float(int(uint(int(floor(productValue133))))) * 0.0625)));
            uint productValue159 = uint(int(floor(float(int(uint(int(floor(productValue134))))) * 0.0625)));
            uint productValue160 = uint(int(floor(float(int(uint(int(floor(productValue135))))) * 0.0625)));
            float sumValue39 = productValue133 - productValue136;
            float sumValue40 = productValue134 - productValue137;
            float sumValue41 = productValue135 - productValue138;
            uint bitwiseValue1 = (productValue159 << 16u) | (productValue139 & 65535u);
            uint bitwiseValue2 = productValue160 & 65535u;
            uint productValue161 = productValue139 * 1540483477u;
            uint productValue162 = productValue159 * 1540483477u;
            uint productValue163 = productValue160 * 1540483477u;
            uint bitwiseValue3 = ((((((((productValue161 >> 24u) ^ productValue161) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue162 >> 24u) ^ productValue162) * 1540483477u)) * 1540483477u) ^ (((productValue163 >> 24u) ^ productValue163) * 1540483477u)) * 1540483477u;
            uint bitwiseValue4 = ((bitwiseValue3 >> 13u) ^ bitwiseValue3) * 1540483477u;
            uint bitwiseValue5 = (bitwiseValue4 >> 15u) ^ bitwiseValue4;
            uint bitwiseValue6 = bitwiseValue5 >> 16u;
            uint bitwiseValue8 = bitwiseValue5 & 65535u;
            uint comparisonValue43 = uint(bitwiseValue8 == bitwiseValue6) | (bitwiseValue8 ^ bitwiseValue6);
            uint sumValue42 = uint(fragmentVectorConstants1.packedValues[59u].x) + 4294967295u;
            bool intermediateValue77;
            uint scalarValue44 = comparisonValue43;
            uint scalarValue45 = 0u;
            uint scalarValue46 = 0u;
            uint sampledTextureValue20;
            uint bitwiseValue7;
            for (;;)
            {
                bitwiseValue7 = scalarValue44 & sumValue42;
                uint sampledTextureValue30 = texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 2u)).x & 65535u;
                bool sampledTextureValue31 = (texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 1u)).x == bitwiseValue2) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue7 * 4u)).x == bitwiseValue1) && (sampledTextureValue30 == comparisonValue43));
                sampledTextureValue20 = sampledTextureValue31 ? texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 3u)).x : scalarValue45;
                if ((sampledTextureValue30 == 0u) || sampledTextureValue31)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                productValue65 = 1.0;
                intermediateValue44 = 1.0;
            }
            float multiplyAddValue52 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].x)));
            float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].y)));
            float multiplyAddValue54 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].z)));
            float inverseLengthValue13 = inversesqrt(dot(vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54), vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54)));
            float productValue110 = inverseLengthValue13 * multiplyAddValue52;
            float productValue111 = inverseLengthValue13 * multiplyAddValue53;
            float productValue112 = inverseLengthValue13 * multiplyAddValue54;
            float productValue399 = fragmentVectorConstants1.packedValues[64u].x * (fragmentVectorConstants1.packedValues[120u].w * sampledTextureValue14);
            float productValue400 = productValue399 * fragmentVectorConstants1.packedValues[120u].x;
            float productValue401 = productValue399 * fragmentVectorConstants1.packedValues[120u].y;
            float productValue402 = productValue399 * fragmentVectorConstants1.packedValues[120u].z;
            float dotProductValue23 = dot(vec3(multiplyAddValue395, multiplyAddValue396, multiplyAddValue397), vec3(productValue110, productValue111, productValue112));
            float scalarValue261 = spvNMax(dotProductValue23, 0.0);
            float dotProductValue24 = spvNMax(dot(vec3(multiplyAddValue395, multiplyAddValue396, multiplyAddValue397), vec3(sumValue14, sumValue15, sumValue16)), 0.0);
            float sumValue284 = fragmentVectorConstants1.packedValues[140u].y + 1.0;
            float productValue403 = sumValue284 * sumValue284;
            float sumValue32 = productValue110 - quotientValue10;
            float sumValue35 = productValue111 - quotientValue11;
            float sumValue36 = productValue112 - quotientValue12;
            float inverseLengthValue14 = inversesqrt(dot(vec3(sumValue32, sumValue35, sumValue36), vec3(sumValue32, sumValue35, sumValue36)));
            float productValue118 = inverseLengthValue14 * sumValue32;
            float productValue119 = inverseLengthValue14 * sumValue35;
            float productValue120 = inverseLengthValue14 * sumValue36;
            float scalarValue262 = spvNMax(intermediateValue11, 0.0500000007450580596923828125);
            float productValue404 = scalarValue262 * scalarValue262;
            float productValue405 = productValue404 * productValue404;
            float dotProductValue25 = spvNMax(dot(vec3(multiplyAddValue395, multiplyAddValue396, multiplyAddValue397), vec3(productValue118, productValue119, productValue120)), 0.0);
            float productValue406 = ((dotProductValue25 * dotProductValue25) * (productValue405 + (-1.0))) + 1.0;
            float productValue407 = productValue404 * 0.5;
            float sumValue285 = 1.0 - productValue407;
            float sumValue286 = productValue407 + 9.9999997473787516355514526367188e-05;
            float dotProductValue8 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue14, sumValue15, sumValue16), vec3(productValue118, productValue119, productValue120)), 0.0), 0.0, 1.0);
            float productValue125 = dotProductValue8 * dotProductValue8;
            float productValue126 = (productValue125 * productValue125) * dotProductValue8;
            float productValue408 = (productValue126 * (1.0 - productValue381)) + productValue381;
            float productValue409 = (productValue126 * (1.0 - productValue382)) + productValue382;
            float productValue410 = (productValue126 * (1.0 - productValue383)) + productValue383;
            float quotientValue61 = ((dotProductValue24 / ((sumValue285 * dotProductValue24) + sumValue286)) * (productValue405 / ((productValue406 * productValue406) * 3.1415927410125732421875))) * (scalarValue261 / ((sumValue285 * scalarValue261) + sumValue286));
            float productValue411 = ((scalarValue261 * 4.0) * dotProductValue24) + 9.9999997473787516355514526367188e-05;
            float quotientValue62 = (((spvNMax((dotProductValue23 + fragmentVectorConstants1.packedValues[140u].y) / productValue403, 0.0) - scalarValue261) * productValue384) + scalarValue261) * productValue65;
            float dotProductValue26 = (intermediateValue44 * productValue384) * spvNMax((dot(vec3((-0.0) - multiplyAddValue395, (-0.0) - multiplyAddValue396, (-0.0) - multiplyAddValue397), vec3(productValue110, productValue111, productValue112)) + fragmentVectorConstants1.packedValues[140u].y) / productValue403, 0.0);
            float productValue412 = sumValue278 * 0.3183098733425140380859375;
            float productValue413 = fragmentVectorConstants1.packedValues[122u].y * (scalarValue261 * productValue65);
            intermediateValue24 = (productValue413 * productValue400) * ((productValue408 * quotientValue61) / productValue411);
            intermediateValue26 = (productValue413 * productValue401) * ((productValue409 * quotientValue61) / productValue411);
            intermediateValue28 = (productValue413 * productValue402) * ((productValue410 * quotientValue61) / productValue411);
            intermediateValue30 = (((productValue412 * exponentialValue) * productValue400) * fragmentVectorConstants1.packedValues[122u].x) * (((1.0 - productValue408) * quotientValue62) + dotProductValue26);
            intermediateValue32 = (((productValue412 * exponentialValue1) * productValue401) * fragmentVectorConstants1.packedValues[122u].x) * (((1.0 - productValue409) * quotientValue62) + dotProductValue26);
            intermediateValue34 = (((productValue412 * exponentialValue2) * productValue402) * fragmentVectorConstants1.packedValues[122u].x) * (((1.0 - productValue410) * quotientValue62) + dotProductValue26);
        }
        float intermediateValue41;
        float intermediateValue42;
        float intermediateValue43;
        if (fragmentVectorConstants1.packedValues[64u].w != 0.0)
        {
            float productValue414 = ((varyingTexCoord3.x + (-0.5)) + (productValue369 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[114u].x;
            float productValue415 = ((varyingTexCoord3.y + (-0.5)) + (productValue370 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[114u].y;
            float productValue416 = ((varyingTexCoord3.z + (-0.5)) + (productValue371 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[114u].z;
            float productValue417 = floor(productValue414 * 0.0625) * 16.0;
            float productValue418 = floor(productValue415 * 0.0625) * 16.0;
            float productValue419 = floor(productValue416 * 0.0625) * 16.0;
            uint productValue420 = uint(int(floor(float(int(uint(int(floor(productValue414))))) * 0.0625)));
            uint productValue421 = uint(int(floor(float(int(uint(int(floor(productValue415))))) * 0.0625)));
            uint productValue422 = uint(int(floor(float(int(uint(int(floor(productValue416))))) * 0.0625)));
            float sumValue287 = productValue414 - productValue417;
            float sumValue288 = productValue415 - productValue418;
            float sumValue289 = productValue416 - productValue419;
            uint bitwiseValue108 = (productValue421 << 16u) | (productValue420 & 65535u);
            uint bitwiseValue109 = productValue422 & 65535u;
            uint productValue423 = productValue420 * 1540483477u;
            uint productValue424 = productValue421 * 1540483477u;
            uint productValue425 = productValue422 * 1540483477u;
            uint bitwiseValue110 = ((((((((productValue423 >> 24u) ^ productValue423) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue424 >> 24u) ^ productValue424) * 1540483477u)) * 1540483477u) ^ (((productValue425 >> 24u) ^ productValue425) * 1540483477u)) * 1540483477u;
            uint bitwiseValue111 = ((bitwiseValue110 >> 13u) ^ bitwiseValue110) * 1540483477u;
            uint bitwiseValue112 = (bitwiseValue111 >> 15u) ^ bitwiseValue111;
            uint bitwiseValue113 = bitwiseValue112 >> 16u;
            uint bitwiseValue114 = bitwiseValue112 & 65535u;
            uint comparisonValue270 = uint(bitwiseValue114 == bitwiseValue113) | (bitwiseValue114 ^ bitwiseValue113);
            uint sumValue42 = uint(fragmentVectorConstants1.packedValues[59u].x) + 4294967295u;
            bool intermediateValue72;
            uint scalarValue263 = comparisonValue270;
            uint scalarValue45 = 0u;
            uint scalarValue46 = 0u;
            uint sampledTextureValue21;
            uint bitwiseValue7;
            for (;;)
            {
                bitwiseValue7 = scalarValue263 & sumValue42;
                uint sampledTextureValue30 = texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 2u)).x & 65535u;
                bool sampledTextureValue117 = (texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 1u)).x == bitwiseValue109) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue7 * 4u)).x == bitwiseValue108) && (sampledTextureValue30 == comparisonValue270));
                sampledTextureValue21 = sampledTextureValue117 ? texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 3u)).x : scalarValue45;
                if ((sampledTextureValue30 == 0u) || sampledTextureValue117)
#endif
                {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    float multiplyAddValue66 = fma(varyingTexCoord0.x, scalarValue92, scalarValue94);
                    float multiplyAddValue67 = fma(varyingTexCoord0.y, scalarValue93, scalarValue95);
                    float sumValue126 = spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue97);
                    vec4 sampledTextureValue77 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(multiplyAddValue66, multiplyAddValue67), 0.0);
                    float scalarValue103 = sampledTextureValue77.x;
                    float scalarValue104 = sampledTextureValue77.y;
                    float scalarValue105 = sampledTextureValue77.z;
                    float intermediateValue89;
                    float intermediateValue91;
                    float intermediateValue93;
                    if ((scalarValue104 == scalarValue103) && (scalarValue105 == scalarValue104))
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    float multiplyAddValue256 = fma(varyingTexCoord0.x, scalarValue182, scalarValue184);
                    float multiplyAddValue257 = fma(varyingTexCoord0.y, scalarValue183, scalarValue185);
                    float sumValue207 = spvNMin(reinterpretedBits16, reinterpretedBits16 - scalarValue187);
                    vec4 sampledTextureValue99 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(multiplyAddValue256, multiplyAddValue257), 0.0);
                    float scalarValue192 = sampledTextureValue99.x;
                    float scalarValue193 = sampledTextureValue99.y;
                    float scalarValue194 = sampledTextureValue99.z;
                    float intermediateValue87;
                    float intermediateValue89;
                    float intermediateValue91;
                    if ((scalarValue193 == scalarValue192) && (scalarValue194 == scalarValue193))
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    intermediateValue77 = sampledTextureValue31;
                    break;
                }
                else
                {
                    uint sumValue52 = scalarValue46 + 1u;
                    if (int(sumValue52) < int(8u))
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    intermediateValue72 = sampledTextureValue117;
                    break;
                }
                else
                {
                    uint sumValue52 = scalarValue46 + 1u;
                    if (int(sumValue52) < int(8u))
#endif
                    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                        float scalarValue106 = spvNClamp(2.0 - sumValue126, 0.0, 1.0);
                        float productValue54;
                        float productValue55;
                        float productValue56;
                        if (scalarValue106 > 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                        float scalarValue195 = spvNClamp(2.0 - sumValue207, 0.0, 1.0);
                        float productValue54;
                        float productValue55;
                        float productValue56;
                        if (scalarValue195 > 0.0)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        scalarValue44 = bitwiseValue7 + 1u;
                        scalarValue45 = sampledTextureValue20;
                        scalarValue46 = sumValue52;
                        continue;
                    }
                    else
                    {
                        intermediateValue77 = false;
                        break;
                    }
                }
            }
            uint bitwiseValue9 = sampledTextureValue20 >> 2u;
            float branchMergedValue10;
            float branchMergedValue19;
            float branchMergedValue20;
            if (intermediateValue77)
            {
                float scalarValue47 = abs(productValue21);
                float scalarValue48 = abs(productValue22);
                float scalarValue49 = abs(productValue23);
                float branchMergedValue50;
                float branchMergedValue56;
                float branchMergedValue57;
                if (((scalarValue47 >= 1.0) || (scalarValue48 >= 1.0)) || (scalarValue49 >= 1.0))
                {
                    float intermediateValue190;
                    float intermediateValue191;
                    float intermediateValue192;
                    float intermediateValue193;
                    float intermediateValue195;
                    float intermediateValue197;
                    float intermediateValue199;
                    float intermediateValue201;
                    float intermediateValue203;
                    float intermediateValue205;
                    float intermediateValue206;
                    float intermediateValue207;
                    float productValue146;
                    float productValue147;
                    float productValue148;
                    float sumValue43;
                    float sumValue44;
                    float sumValue45;
                    float sumValue46;
                    float sumValue47;
                    float sumValue48;
                    float sumValue49;
                    float sumValue50;
                    float sumValue51;
                    float productValue149;
                    float productValue150;
                    float productValue151;
                    float productValue152;
                    bool comparisonValue27;
                    for (;;)
                    {
                        float dotProductValue10 = dot(vec3(sumValue39, sumValue40, sumValue41), vec3(scalarValue47, scalarValue48, scalarValue49));
                        float dotProductValue11 = dot(vec3(sumValue39, sumValue40, sumValue41), vec3(scalarValue49, scalarValue47, scalarValue48));
                        float dotProductValue12 = dot(vec3(sumValue39, sumValue40, sumValue41), vec3(scalarValue48, scalarValue49, scalarValue47));
                        float comparisonValue47 = ((inverseLengthValue6 * ((intermediateValue11 + multiplyAddValue) + intermediateValue12)) > 0.0) ? ceil(dotProductValue10) : floor(dotProductValue10);
                        float scalarValue50 = floor(dotProductValue11);
                        float scalarValue51 = floor(dotProductValue12);
                        productValue146 = ((comparisonValue47 * scalarValue47) + (scalarValue50 * scalarValue49)) + (scalarValue51 * scalarValue48);
                        productValue147 = ((comparisonValue47 * scalarValue48) + (scalarValue50 * scalarValue47)) + (scalarValue51 * scalarValue49);
                        productValue148 = ((comparisonValue47 * scalarValue49) + (scalarValue50 * scalarValue48)) + (scalarValue51 * scalarValue47);
                        sumValue43 = productValue146 + scalarValue49;
                        sumValue44 = productValue147 + scalarValue47;
                        sumValue45 = productValue148 + scalarValue48;
                        sumValue46 = productValue146 + scalarValue48;
                        sumValue47 = productValue147 + scalarValue49;
                        sumValue48 = productValue148 + scalarValue47;
                        sumValue49 = sumValue43 + scalarValue48;
                        sumValue50 = sumValue47 + scalarValue47;
                        sumValue51 = sumValue45 + scalarValue47;
                        float sumValue53 = dotProductValue11 - scalarValue50;
                        float sumValue54 = dotProductValue12 - scalarValue51;
                        float sumValue55 = 1.0 - sumValue53;
                        float sumValue56 = 1.0 - sumValue54;
                        productValue149 = sumValue56 * sumValue55;
                        productValue150 = sumValue56 * sumValue53;
                        productValue151 = sumValue55 * sumValue54;
                        productValue152 = sumValue54 * sumValue53;
                        comparisonValue27 = ((productValue148 >= 0.0) && ((productValue146 >= 0.0) && (productValue147 >= 0.0))) && ((sumValue51 < 16.0) && ((sumValue49 < 16.0) && (sumValue50 < 16.0)));
                        if (comparisonValue27)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        scalarValue263 = bitwiseValue7 + 1u;
                        scalarValue45 = sampledTextureValue21;
                        scalarValue46 = sumValue52;
                        continue;
                    }
                    else
                    {
                        intermediateValue72 = false;
                        break;
                    }
                }
            }
            uint bitwiseValue115 = sampledTextureValue21 >> 2u;
            float branchMergedValue10;
            float branchMergedValue19;
            float branchMergedValue20;
            if (intermediateValue72)
            {
                float scalarValue264 = abs(productValue369);
                float scalarValue265 = abs(productValue370);
                float scalarValue266 = abs(productValue371);
                float branchMergedValue50;
                float branchMergedValue56;
                float branchMergedValue57;
                if (((scalarValue264 >= 1.0) || (scalarValue265 >= 1.0)) || (scalarValue266 >= 1.0))
                {
                    float intermediateValue185;
                    float intermediateValue186;
                    float intermediateValue187;
                    float intermediateValue188;
                    float intermediateValue190;
                    float intermediateValue192;
                    float intermediateValue194;
                    float intermediateValue196;
                    float intermediateValue198;
                    float intermediateValue200;
                    float intermediateValue201;
                    float intermediateValue202;
                    float productValue143;
                    float productValue144;
                    float productValue145;
                    float sumValue43;
                    float sumValue44;
                    float sumValue45;
                    float sumValue46;
                    float sumValue47;
                    float sumValue48;
                    float sumValue49;
                    float sumValue50;
                    float sumValue51;
                    float productValue146;
                    float productValue147;
                    float productValue148;
                    float productValue149;
                    bool comparisonValue27;
                    for (;;)
                    {
                        float dotProductValue27 = dot(vec3(sumValue287, sumValue288, sumValue289), vec3(scalarValue264, scalarValue265, scalarValue266));
                        float dotProductValue28 = dot(vec3(sumValue287, sumValue288, sumValue289), vec3(scalarValue266, scalarValue264, scalarValue265));
                        float dotProductValue29 = dot(vec3(sumValue287, sumValue288, sumValue289), vec3(scalarValue265, scalarValue266, scalarValue264));
                        float comparisonValue271 = ((inverseLengthValue45 * ((intermediateValue6 + multiplyAddValue) + intermediateValue7)) > 0.0) ? ceil(dotProductValue27) : floor(dotProductValue27);
                        float scalarValue267 = floor(dotProductValue28);
                        float scalarValue268 = floor(dotProductValue29);
                        productValue143 = ((comparisonValue271 * scalarValue264) + (scalarValue267 * scalarValue266)) + (scalarValue268 * scalarValue265);
                        productValue144 = ((comparisonValue271 * scalarValue265) + (scalarValue267 * scalarValue264)) + (scalarValue268 * scalarValue266);
                        productValue145 = ((comparisonValue271 * scalarValue266) + (scalarValue267 * scalarValue265)) + (scalarValue268 * scalarValue264);
                        sumValue43 = productValue143 + scalarValue266;
                        sumValue44 = productValue144 + scalarValue264;
                        sumValue45 = productValue145 + scalarValue265;
                        sumValue46 = productValue143 + scalarValue265;
                        sumValue47 = productValue144 + scalarValue266;
                        sumValue48 = productValue145 + scalarValue264;
                        sumValue49 = sumValue43 + scalarValue265;
                        sumValue50 = sumValue47 + scalarValue264;
                        sumValue51 = sumValue45 + scalarValue264;
                        float sumValue290 = dotProductValue28 - scalarValue267;
                        float sumValue291 = dotProductValue29 - scalarValue268;
                        float sumValue292 = 1.0 - sumValue290;
                        float sumValue293 = 1.0 - sumValue291;
                        productValue146 = sumValue293 * sumValue292;
                        productValue147 = sumValue293 * sumValue290;
                        productValue148 = sumValue292 * sumValue291;
                        productValue149 = sumValue291 * sumValue290;
                        comparisonValue27 = ((productValue145 >= 0.0) && ((productValue143 >= 0.0) && (productValue144 >= 0.0))) && ((sumValue51 < 16.0) && ((sumValue49 < 16.0) && (sumValue50 < 16.0)));
                        if (comparisonValue27)
#endif
                        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                            bool sampledTextureValue78 = uint(textureQueryLevels(materialTexture2)) > 0u;
                            uvec2 sampledTextureValue79 = uvec2(textureSize(materialTexture2, int(0u)));
                            uint scalarValue107 = sampledTextureValue79.x;
                            float comparisonValue108 = rdEvaluateFloatExpression(sampledTextureValue78 ? scalarValue107 : 0u);
                            float comparisonValue109 = rdEvaluateFloatExpression(sampledTextureValue78 ? sampledTextureValue79.y : 0u);
                            float productValue231 = fract(multiplyAddValue66 * comparisonValue108);
                            float productValue232 = fract(multiplyAddValue67 * comparisonValue109);
                            vec4 sampledTextureValue80 = textureGather(sampler2D(materialTexture2, textureSampler2), vec2((abs(productValue231 - 0.5) < 0.0625) ? (multiplyAddValue66 + ((productValue231 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue66, (abs(productValue232 - 0.5) < 0.0625) ? (multiplyAddValue67 + ((productValue232 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue67));
                            float scalarValue108 = sampledTextureValue80.x;
                            float scalarValue109 = sampledTextureValue80.y;
                            float scalarValue110 = sampledTextureValue80.z;
                            float scalarValue111 = sampledTextureValue80.w;
                            float multiplyAddValue68 = fract(fma(multiplyAddValue66, comparisonValue108, 0.5));
                            float multiplyAddValue69 = fract(fma(multiplyAddValue67, comparisonValue109, 0.5));
                            bool conditionValue9 = multiplyAddValue69 > 0.5;
                            bool conditionValue10 = multiplyAddValue68 > 0.5;
                            float sumValue127 = multiplyAddValue68 - 0.083333335816860198974609375;
                            float sumValue128 = multiplyAddValue68 + 0.083333335816860198974609375;
                            float sumValue129 = multiplyAddValue69 - 0.083333335816860198974609375;
                            float sumValue130 = multiplyAddValue69 + 0.083333335816860198974609375;
                            vec2 comparisonValue110 = vec2(conditionValue9 ? scalarValue108 : scalarValue111, conditionValue9 ? scalarValue109 : scalarValue110);
                            uint sumValue131 = min(uint(int(spvNClamp(sumValue127 + sumValue127, 0.0, 1.0))), 68u);
                            uint sumValue132 = min(uint(int(spvNClamp(sumValue128 + sumValue128, 0.0, 1.0))), 68u);
                            float reinterpretedBits7 = rdDot2Precise(comparisonValue110, vec2(uintBitsToFloat(intermediateValue21[sumValue131].x), uintBitsToFloat(intermediateValue21[sumValue131].y))) - rdDot2Precise(comparisonValue110, vec2(uintBitsToFloat(intermediateValue21[sumValue132].x), uintBitsToFloat(intermediateValue21[sumValue132].y)));
                            vec2 comparisonValue111 = vec2(conditionValue10 ? scalarValue110 : scalarValue111, conditionValue10 ? scalarValue109 : scalarValue108);
                            uint sumValue133 = min(uint(int(spvNClamp(sumValue129 + sumValue129, 0.0, 1.0))), 68u);
                            uint sumValue134 = min(uint(int(spvNClamp(sumValue130 + sumValue130, 0.0, 1.0))), 68u);
                            float reinterpretedBits8 = rdDot2Precise(comparisonValue111, vec2(uintBitsToFloat(intermediateValue21[sumValue133].x), uintBitsToFloat(intermediateValue21[sumValue133].y))) - rdDot2Precise(comparisonValue111, vec2(uintBitsToFloat(intermediateValue21[sumValue134].x), uintBitsToFloat(intermediateValue21[sumValue134].y)));
                            vec3 vectorValue1 = vec3(reinterpretedBits7, reinterpretedBits8, 0.25);
                            float inverseLengthValue19 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                            productValue54 = scalarValue106 * (inverseLengthValue19 * reinterpretedBits8);
                            productValue55 = scalarValue106 * (inverseLengthValue19 * reinterpretedBits7);
                            productValue56 = inverseLengthValue19 * 0.25;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                            bool sampledTextureValue78 = uint(textureQueryLevels(materialTexture2)) > 0u;
                            uvec2 sampledTextureValue79 = uvec2(textureSize(materialTexture2, int(0u)));
                            uint scalarValue107 = sampledTextureValue79.x;
                            float comparisonValue108 = rdEvaluateFloatExpression(sampledTextureValue78 ? scalarValue107 : 0u);
                            float comparisonValue109 = rdEvaluateFloatExpression(sampledTextureValue78 ? sampledTextureValue79.y : 0u);
                            float productValue310 = fract(multiplyAddValue256 * comparisonValue108);
                            float productValue311 = fract(multiplyAddValue257 * comparisonValue109);
                            vec4 sampledTextureValue100 = textureGather(sampler2D(materialTexture2, textureSampler2), vec2((abs(productValue310 - 0.5) < 0.0625) ? (multiplyAddValue256 + ((productValue310 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue256, (abs(productValue311 - 0.5) < 0.0625) ? (multiplyAddValue257 + ((productValue311 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue257));
                            float scalarValue196 = sampledTextureValue100.x;
                            float scalarValue197 = sampledTextureValue100.y;
                            float scalarValue198 = sampledTextureValue100.z;
                            float scalarValue199 = sampledTextureValue100.w;
                            float multiplyAddValue258 = fract(fma(multiplyAddValue256, comparisonValue108, 0.5));
                            float multiplyAddValue259 = fract(fma(multiplyAddValue257, comparisonValue109, 0.5));
                            bool conditionValue28 = multiplyAddValue259 > 0.5;
                            bool conditionValue29 = multiplyAddValue258 > 0.5;
                            float sumValue208 = multiplyAddValue258 - 0.083333335816860198974609375;
                            float sumValue209 = multiplyAddValue258 + 0.083333335816860198974609375;
                            float sumValue210 = multiplyAddValue259 - 0.083333335816860198974609375;
                            float sumValue211 = multiplyAddValue259 + 0.083333335816860198974609375;
                            vec2 comparisonValue186 = vec2(conditionValue28 ? scalarValue196 : scalarValue199, conditionValue28 ? scalarValue197 : scalarValue198);
                            uint sumValue212 = min(uint(int(spvNClamp(sumValue208 + sumValue208, 0.0, 1.0))), 68u);
                            uint sumValue213 = min(uint(int(spvNClamp(sumValue209 + sumValue209, 0.0, 1.0))), 68u);
                            float reinterpretedBits19 = rdDot2Precise(comparisonValue186, vec2(uintBitsToFloat(intermediateValue23[sumValue212].x), uintBitsToFloat(intermediateValue23[sumValue212].y))) - rdDot2Precise(comparisonValue186, vec2(uintBitsToFloat(intermediateValue23[sumValue213].x), uintBitsToFloat(intermediateValue23[sumValue213].y)));
                            vec2 comparisonValue187 = vec2(conditionValue29 ? scalarValue198 : scalarValue199, conditionValue29 ? scalarValue197 : scalarValue196);
                            uint sumValue214 = min(uint(int(spvNClamp(sumValue210 + sumValue210, 0.0, 1.0))), 68u);
                            uint sumValue215 = min(uint(int(spvNClamp(sumValue211 + sumValue211, 0.0, 1.0))), 68u);
                            float reinterpretedBits20 = rdDot2Precise(comparisonValue187, vec2(uintBitsToFloat(intermediateValue23[sumValue214].x), uintBitsToFloat(intermediateValue23[sumValue214].y))) - rdDot2Precise(comparisonValue187, vec2(uintBitsToFloat(intermediateValue23[sumValue215].x), uintBitsToFloat(intermediateValue23[sumValue215].y)));
                            vec3 vectorValue22 = vec3(reinterpretedBits19, reinterpretedBits20, 0.25);
                            float inverseLengthValue37 = inversesqrt(rdDot3Precise2(vectorValue22, vectorValue22));
                            productValue54 = scalarValue195 * (inverseLengthValue37 * reinterpretedBits20);
                            productValue55 = scalarValue195 * (inverseLengthValue37 * reinterpretedBits19);
                            productValue56 = inverseLengthValue37 * 0.25;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                            uvec4 sampledTextureValue32 = texelFetch(voxelBuffer, int(((uint(productValue147) + bitwiseValue9) + (uint(productValue148) << 4u)) + (uint(productValue146) << 8u)));
                            uint scalarValue52 = sampledTextureValue32.x;
                            float bitwiseValue13;
                            float intermediateValue147;
                            float intermediateValue148;
                            if (scalarValue52 == 0u)
                            {
                                bitwiseValue13 = 0.0;
                                intermediateValue147 = 0.0;
                                intermediateValue148 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue11 = float(scalarValue52 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue13 = bitwiseValue11 * float(scalarValue52 & 255u);
                                intermediateValue147 = bitwiseValue11 * float((scalarValue52 >> 8u) & 255u);
                                intermediateValue148 = bitwiseValue11 * float((scalarValue52 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue33 = texelFetch(voxelBuffer, int(((uint(sumValue44) + bitwiseValue9) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u)));
                            uint scalarValue53 = sampledTextureValue33.x;
                            float bitwiseValue17;
                            float intermediateValue158;
                            float intermediateValue159;
                            if (scalarValue53 == 0u)
                            {
                                bitwiseValue17 = 0.0;
                                intermediateValue158 = 0.0;
                                intermediateValue159 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue12 = float(scalarValue53 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue17 = bitwiseValue12 * float(scalarValue53 & 255u);
                                intermediateValue158 = bitwiseValue12 * float((scalarValue53 >> 8u) & 255u);
                                intermediateValue159 = bitwiseValue12 * float((scalarValue53 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue34 = texelFetch(voxelBuffer, int(((uint(sumValue47) + bitwiseValue9) + (uint(sumValue48) << 4u)) + (uint(sumValue46) << 8u)));
                            uint scalarValue54 = sampledTextureValue34.x;
                            float bitwiseValue21;
                            float intermediateValue176;
                            float intermediateValue177;
                            if (scalarValue54 == 0u)
                            {
                                bitwiseValue21 = 0.0;
                                intermediateValue176 = 0.0;
                                intermediateValue177 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue14 = float(scalarValue54 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue21 = bitwiseValue14 * float(scalarValue54 & 255u);
                                intermediateValue176 = bitwiseValue14 * float((scalarValue54 >> 8u) & 255u);
                                intermediateValue177 = bitwiseValue14 * float((scalarValue54 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue35 = texelFetch(voxelBuffer, int(((uint(sumValue50) + bitwiseValue9) + (uint(sumValue51) << 4u)) + (uint(sumValue49) << 8u)));
                            uint scalarValue55 = sampledTextureValue35.x;
                            float branchMergedValue15;
                            float branchMergedValue26;
                            float branchMergedValue27;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            float branchMergedValue30;
                            float branchMergedValue31;
                            float branchMergedValue32;
                            float branchMergedValue33;
                            float branchMergedValue34;
                            float branchMergedValue44;
                            float branchMergedValue45;
                            if (scalarValue55 == 0u)
                            {
                                branchMergedValue15 = 0.0;
                                branchMergedValue26 = 0.0;
                                branchMergedValue27 = 0.0;
                                branchMergedValue28 = intermediateValue177;
                                branchMergedValue29 = intermediateValue176;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue159;
                                branchMergedValue32 = intermediateValue158;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue148;
                                branchMergedValue44 = bitwiseValue13;
                                branchMergedValue45 = intermediateValue147;
                            }
                            else
                            {
                                float bitwiseValue16 = float(scalarValue55 >> 24u) * 9.2272217443678528070449829101562e-05;
                                branchMergedValue15 = bitwiseValue16 * float((scalarValue55 >> 16u) & 255u);
                                branchMergedValue26 = bitwiseValue16 * float((scalarValue55 >> 8u) & 255u);
                                branchMergedValue27 = bitwiseValue16 * float(scalarValue55 & 255u);
                                branchMergedValue28 = intermediateValue177;
                                branchMergedValue29 = intermediateValue176;
                                branchMergedValue30 = bitwiseValue21;
                                branchMergedValue31 = intermediateValue159;
                                branchMergedValue32 = intermediateValue158;
                                branchMergedValue33 = bitwiseValue17;
                                branchMergedValue34 = intermediateValue148;
                                branchMergedValue44 = bitwiseValue13;
                                branchMergedValue45 = intermediateValue147;
                            }
                            intermediateValue190 = branchMergedValue44;
                            intermediateValue191 = branchMergedValue45;
                            intermediateValue192 = branchMergedValue34;
                            intermediateValue193 = branchMergedValue33;
                            intermediateValue195 = branchMergedValue32;
                            intermediateValue197 = branchMergedValue31;
                            intermediateValue199 = branchMergedValue30;
                            intermediateValue201 = branchMergedValue29;
                            intermediateValue203 = branchMergedValue28;
                            intermediateValue205 = branchMergedValue27;
                            intermediateValue206 = branchMergedValue26;
                            intermediateValue207 = branchMergedValue15;
                            break;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                            uvec4 sampledTextureValue118 = texelFetch(voxelBuffer, int(((uint(productValue144) + bitwiseValue115) + (uint(productValue145) << 4u)) + (uint(productValue143) << 8u)));
                            uint scalarValue269 = sampledTextureValue118.x;
                            float bitwiseValue13;
                            float intermediateValue142;
                            float intermediateValue143;
                            if (scalarValue269 == 0u)
                            {
                                bitwiseValue13 = 0.0;
                                intermediateValue142 = 0.0;
                                intermediateValue143 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue116 = float(scalarValue269 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue13 = bitwiseValue116 * float(scalarValue269 & 255u);
                                intermediateValue142 = bitwiseValue116 * float((scalarValue269 >> 8u) & 255u);
                                intermediateValue143 = bitwiseValue116 * float((scalarValue269 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue119 = texelFetch(voxelBuffer, int(((uint(sumValue44) + bitwiseValue115) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u)));
                            uint scalarValue270 = sampledTextureValue119.x;
                            float bitwiseValue17;
                            float intermediateValue153;
                            float intermediateValue154;
                            if (scalarValue270 == 0u)
                            {
                                bitwiseValue17 = 0.0;
                                intermediateValue153 = 0.0;
                                intermediateValue154 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue117 = float(scalarValue270 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue17 = bitwiseValue117 * float(scalarValue270 & 255u);
                                intermediateValue153 = bitwiseValue117 * float((scalarValue270 >> 8u) & 255u);
                                intermediateValue154 = bitwiseValue117 * float((scalarValue270 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue120 = texelFetch(voxelBuffer, int(((uint(sumValue47) + bitwiseValue115) + (uint(sumValue48) << 4u)) + (uint(sumValue46) << 8u)));
                            uint scalarValue271 = sampledTextureValue120.x;
                            float bitwiseValue21;
                            float intermediateValue171;
                            float intermediateValue172;
                            if (scalarValue271 == 0u)
                            {
                                bitwiseValue21 = 0.0;
                                intermediateValue171 = 0.0;
                                intermediateValue172 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue118 = float(scalarValue271 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue21 = bitwiseValue118 * float(scalarValue271 & 255u);
                                intermediateValue171 = bitwiseValue118 * float((scalarValue271 >> 8u) & 255u);
                                intermediateValue172 = bitwiseValue118 * float((scalarValue271 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue121 = texelFetch(voxelBuffer, int(((uint(sumValue50) + bitwiseValue115) + (uint(sumValue51) << 4u)) + (uint(sumValue49) << 8u)));
                            uint scalarValue272 = sampledTextureValue121.x;
                            float branchMergedValue17;
                            float branchMergedValue26;
                            float branchMergedValue27;
                            float branchMergedValue28;
                            float branchMergedValue29;
                            float branchMergedValue30;
                            float branchMergedValue31;
                            float branchMergedValue32;
                            float branchMergedValue33;
                            float branchMergedValue34;
                            float branchMergedValue44;
                            float branchMergedValue45;
                            if (scalarValue272 == 0u)
                            {
                                branchMergedValue17 = 0.0;
                                branchMergedValue26 = 0.0;
                                branchMergedValue27 = 0.0;
                                branchMergedValue28 = intermediateValue171;
                                branchMergedValue29 = bitwiseValue21;
                                branchMergedValue30 = intermediateValue154;
                                branchMergedValue31 = intermediateValue153;
                                branchMergedValue32 = intermediateValue172;
                                branchMergedValue33 = intermediateValue143;
                                branchMergedValue34 = bitwiseValue13;
                                branchMergedValue44 = intermediateValue142;
                                branchMergedValue45 = bitwiseValue17;
                            }
                            else
                            {
                                float bitwiseValue119 = float(scalarValue272 >> 24u) * 9.2272217443678528070449829101562e-05;
                                branchMergedValue17 = bitwiseValue119 * float((scalarValue272 >> 16u) & 255u);
                                branchMergedValue26 = bitwiseValue119 * float((scalarValue272 >> 8u) & 255u);
                                branchMergedValue27 = bitwiseValue119 * float(scalarValue272 & 255u);
                                branchMergedValue28 = intermediateValue171;
                                branchMergedValue29 = bitwiseValue21;
                                branchMergedValue30 = intermediateValue154;
                                branchMergedValue31 = intermediateValue153;
                                branchMergedValue32 = intermediateValue172;
                                branchMergedValue33 = intermediateValue143;
                                branchMergedValue34 = bitwiseValue13;
                                branchMergedValue44 = intermediateValue142;
                                branchMergedValue45 = bitwiseValue17;
                            }
                            intermediateValue185 = branchMergedValue34;
                            intermediateValue186 = branchMergedValue44;
                            intermediateValue187 = branchMergedValue33;
                            intermediateValue188 = branchMergedValue45;
                            intermediateValue190 = branchMergedValue31;
                            intermediateValue192 = branchMergedValue30;
                            intermediateValue194 = branchMergedValue29;
                            intermediateValue196 = branchMergedValue28;
                            intermediateValue198 = branchMergedValue32;
                            intermediateValue200 = branchMergedValue27;
                            intermediateValue201 = branchMergedValue26;
                            intermediateValue202 = branchMergedValue17;
                            break;
#endif
                        }
                        else
                        {
#if RD_PLATFORM == RD_PLATFORM_SM50
                            productValue54 = 0.0;
                            productValue55 = 0.0;
                            productValue56 = 1.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                            float intermediateValue161;
                            float intermediateValue162;
                            float intermediateValue163;
                            float sumValue72;
                            float sumValue73;
                            float sumValue74;
                            uint comparisonValue36;
                            bool comparisonValue37;
                            for (;;)
                            {
                                sumValue72 = productValue146 + productValue136;
                                sumValue73 = productValue147 + productValue137;
                                sumValue74 = productValue148 + productValue138;
                                uint comparisonValue50 = ((((uint(productValue146 >= 16.0) << 1u) | uint(productValue146 < 0.0)) | (uint(productValue147 < 0.0) << 2u)) | (uint(productValue147 >= 16.0) << 3u)) | (uint(productValue148 < 0.0) << 4u);
                                comparisonValue36 = intermediateValue[comparisonValue50 | (uint(productValue148 >= 16.0) << 5u)];
                                comparisonValue37 = ((((comparisonValue50 | (uint(productValue148 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue50 & 31u))) == 0u;
                                uint sampledTextureValue38;
                                if (comparisonValue37)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue36 & 31u))) == 0u)
                                    {
                                        intermediateValue161 = 0.0;
                                        intermediateValue162 = 0.0;
                                        intermediateValue163 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue38 = ((((uint(sumValue72 - (floor(sumValue72 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue73 - (floor(sumValue73 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue74 - (floor(sumValue74 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue36)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue38 = ((((uint(productValue148) << 4u) & 240u) | (uint(productValue147) & 15u)) | ((uint(productValue146) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uvec4 sampledTextureValue36 = texelFetch(voxelBuffer, int(sampledTextureValue38));
                                uint scalarValue56 = sampledTextureValue36.x;
                                if (scalarValue56 == 0u)
                                {
                                    intermediateValue161 = 0.0;
                                    intermediateValue162 = 0.0;
                                    intermediateValue163 = 0.0;
                                    break;
                                }
                                float bitwiseValue18 = float(scalarValue56 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue161 = bitwiseValue18 * float(scalarValue56 & 255u);
                                intermediateValue162 = bitwiseValue18 * float((scalarValue56 >> 8u) & 255u);
                                intermediateValue163 = bitwiseValue18 * float((scalarValue56 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue194;
                            float intermediateValue196;
                            float intermediateValue198;
                            float sumValue93;
                            float sumValue94;
                            float sumValue95;
                            uint comparisonValue48;
                            bool comparisonValue49;
                            for (;;)
                            {
                                sumValue93 = sumValue43 + productValue136;
                                sumValue94 = sumValue44 + productValue137;
                                sumValue95 = sumValue45 + productValue138;
                                uint comparisonValue53 = ((((uint(sumValue43 >= 16.0) << 1u) | uint(sumValue43 < 0.0)) | (uint(sumValue44 < 0.0) << 2u)) | (uint(sumValue44 >= 16.0) << 3u)) | (uint(sumValue45 < 0.0) << 4u);
                                comparisonValue48 = intermediateValue[comparisonValue53 | (uint(sumValue45 >= 16.0) << 5u)];
                                comparisonValue49 = ((((comparisonValue53 | (uint(sumValue45 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue53 & 31u))) == 0u;
                                uint sampledTextureValue47;
                                if (comparisonValue49)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue48 & 31u))) == 0u)
                                    {
                                        intermediateValue194 = 0.0;
                                        intermediateValue196 = 0.0;
                                        intermediateValue198 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue47 = ((((uint(sumValue93 - (floor(sumValue93 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue94 - (floor(sumValue94 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue95 - (floor(sumValue95 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue48)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue47 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uvec4 sampledTextureValue37 = texelFetch(voxelBuffer, int(sampledTextureValue47));
                                uint scalarValue57 = sampledTextureValue37.x;
                                if (scalarValue57 == 0u)
                                {
                                    intermediateValue194 = 0.0;
                                    intermediateValue196 = 0.0;
                                    intermediateValue198 = 0.0;
                                    break;
                                }
                                float bitwiseValue20 = float(scalarValue57 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue194 = bitwiseValue20 * float(scalarValue57 & 255u);
                                intermediateValue196 = bitwiseValue20 * float((scalarValue57 >> 8u) & 255u);
                                intermediateValue198 = bitwiseValue20 * float((scalarValue57 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue200;
                            float intermediateValue202;
                            float intermediateValue204;
                            float sumValue102;
                            float sumValue103;
                            float sumValue104;
                            uint comparisonValue58;
                            bool comparisonValue59;
                            for (;;)
                            {
                                sumValue102 = sumValue46 + productValue136;
                                sumValue103 = sumValue47 + productValue137;
                                sumValue104 = sumValue48 + productValue138;
                                uint comparisonValue54 = ((((uint(sumValue46 >= 16.0) << 1u) | uint(sumValue46 < 0.0)) | (uint(sumValue47 < 0.0) << 2u)) | (uint(sumValue47 >= 16.0) << 3u)) | (uint(sumValue48 < 0.0) << 4u);
                                comparisonValue58 = intermediateValue[comparisonValue54 | (uint(sumValue48 >= 16.0) << 5u)];
                                comparisonValue59 = ((((comparisonValue54 | (uint(sumValue48 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue54 & 31u))) == 0u;
                                uint sampledTextureValue51;
                                if (comparisonValue59)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue58 & 31u))) == 0u)
                                    {
                                        intermediateValue200 = 0.0;
                                        intermediateValue202 = 0.0;
                                        intermediateValue204 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue51 = ((((uint(sumValue102 - (floor(sumValue102 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue103 - (floor(sumValue103 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue104 - (floor(sumValue104 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue58)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue51 = ((((uint(sumValue48) << 4u) & 240u) | (uint(sumValue47) & 15u)) | ((uint(sumValue46) << 8u) & 3840u)) + bitwiseValue9;
                                }
                                uvec4 sampledTextureValue40 = texelFetch(voxelBuffer, int(sampledTextureValue51));
                                uint scalarValue58 = sampledTextureValue40.x;
                                if (scalarValue58 == 0u)
                                {
                                    intermediateValue200 = 0.0;
                                    intermediateValue202 = 0.0;
                                    intermediateValue204 = 0.0;
                                    break;
                                }
                                float bitwiseValue22 = float(scalarValue58 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue200 = bitwiseValue22 * float(scalarValue58 & 255u);
                                intermediateValue202 = bitwiseValue22 * float((scalarValue58 >> 8u) & 255u);
                                intermediateValue204 = bitwiseValue22 * float((scalarValue58 >> 16u) & 255u);
                                break;
                            }
                            float sumValue57 = sumValue49 + productValue136;
                            float sumValue58 = sumValue50 + productValue137;
                            float sumValue65 = sumValue51 + productValue138;
                            uint comparisonValue55 = ((((uint(sumValue49 >= 16.0) << 1u) | uint(sumValue49 < 0.0)) | (uint(sumValue50 < 0.0) << 2u)) | (uint(sumValue50 >= 16.0) << 3u)) | (uint(sumValue51 < 0.0) << 4u);
                            uint comparisonValue57 = comparisonValue55 | (uint(sumValue51 >= 16.0) << 5u);
                            uint sampledTextureValue55;
                            if ((((comparisonValue57 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue55 & 31u))) == 0u)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (intermediateValue[comparisonValue57] & 31u))) == 0u)
                                {
                                    intermediateValue190 = intermediateValue161;
                                    intermediateValue191 = intermediateValue162;
                                    intermediateValue192 = intermediateValue163;
                                    intermediateValue193 = intermediateValue194;
                                    intermediateValue195 = intermediateValue196;
                                    intermediateValue197 = intermediateValue198;
                                    intermediateValue199 = intermediateValue200;
                                    intermediateValue201 = intermediateValue202;
                                    intermediateValue203 = intermediateValue204;
                                    intermediateValue205 = 0.0;
                                    intermediateValue206 = 0.0;
                                    intermediateValue207 = 0.0;
                                    break;
                                }
                                sampledTextureValue55 = ((((uint(sumValue57 - (floor(sumValue57 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue58 - (floor(sumValue58 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue65 - (floor(sumValue65 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue57])).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue55 = ((((uint(sumValue51) << 4u) & 240u) | (uint(sumValue50) & 15u)) | ((uint(sumValue49) << 8u) & 3840u)) + bitwiseValue9;
                            }
                            uvec4 sampledTextureValue43 = texelFetch(voxelBuffer, int(sampledTextureValue55));
                            uint scalarValue59 = sampledTextureValue43.x;
                            if (scalarValue59 == 0u)
                            {
                                intermediateValue190 = intermediateValue161;
                                intermediateValue191 = intermediateValue162;
                                intermediateValue192 = intermediateValue163;
                                intermediateValue193 = intermediateValue194;
                                intermediateValue195 = intermediateValue196;
                                intermediateValue197 = intermediateValue198;
                                intermediateValue199 = intermediateValue200;
                                intermediateValue201 = intermediateValue202;
                                intermediateValue203 = intermediateValue204;
                                intermediateValue205 = 0.0;
                                intermediateValue206 = 0.0;
                                intermediateValue207 = 0.0;
                                break;
                            }
                            float bitwiseValue23 = float(scalarValue59 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue190 = intermediateValue161;
                            intermediateValue191 = intermediateValue162;
                            intermediateValue192 = intermediateValue163;
                            intermediateValue193 = intermediateValue194;
                            intermediateValue195 = intermediateValue196;
                            intermediateValue197 = intermediateValue198;
                            intermediateValue199 = intermediateValue200;
                            intermediateValue201 = intermediateValue202;
                            intermediateValue203 = intermediateValue204;
                            intermediateValue205 = bitwiseValue23 * float(scalarValue59 & 255u);
                            intermediateValue206 = bitwiseValue23 * float((scalarValue59 >> 8u) & 255u);
                            intermediateValue207 = bitwiseValue23 * float((scalarValue59 >> 16u) & 255u);
                            break;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                            float intermediateValue156;
                            float intermediateValue157;
                            float intermediateValue158;
                            float sumValue72;
                            float sumValue73;
                            float sumValue74;
                            uint comparisonValue36;
                            bool comparisonValue37;
                            for (;;)
                            {
                                sumValue72 = productValue143 + productValue417;
                                sumValue73 = productValue144 + productValue418;
                                sumValue74 = productValue145 + productValue419;
                                uint comparisonValue272 = ((((uint(productValue143 >= 16.0) << 1u) | uint(productValue143 < 0.0)) | (uint(productValue144 < 0.0) << 2u)) | (uint(productValue144 >= 16.0) << 3u)) | (uint(productValue145 < 0.0) << 4u);
                                comparisonValue36 = intermediateValue[comparisonValue272 | (uint(productValue145 >= 16.0) << 5u)];
                                comparisonValue37 = ((((comparisonValue272 | (uint(productValue145 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue272 & 31u))) == 0u;
                                uint sampledTextureValue39;
                                if (comparisonValue37)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue115 + 4096u)).x & (1u << (comparisonValue36 & 31u))) == 0u)
                                    {
                                        intermediateValue156 = 0.0;
                                        intermediateValue157 = 0.0;
                                        intermediateValue158 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue39 = ((((uint(sumValue72 - (floor(sumValue72 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue73 - (floor(sumValue73 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue74 - (floor(sumValue74 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue115 + 4097u) + comparisonValue36)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue39 = ((((uint(productValue145) << 4u) & 240u) | (uint(productValue144) & 15u)) | ((uint(productValue143) << 8u) & 3840u)) + bitwiseValue115;
                                }
                                uvec4 sampledTextureValue122 = texelFetch(voxelBuffer, int(sampledTextureValue39));
                                uint scalarValue273 = sampledTextureValue122.x;
                                if (scalarValue273 == 0u)
                                {
                                    intermediateValue156 = 0.0;
                                    intermediateValue157 = 0.0;
                                    intermediateValue158 = 0.0;
                                    break;
                                }
                                float bitwiseValue120 = float(scalarValue273 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue156 = bitwiseValue120 * float(scalarValue273 & 255u);
                                intermediateValue157 = bitwiseValue120 * float((scalarValue273 >> 8u) & 255u);
                                intermediateValue158 = bitwiseValue120 * float((scalarValue273 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue189;
                            float intermediateValue191;
                            float intermediateValue193;
                            float sumValue93;
                            float sumValue94;
                            float sumValue95;
                            uint comparisonValue48;
                            bool comparisonValue49;
                            for (;;)
                            {
                                sumValue93 = sumValue43 + productValue417;
                                sumValue94 = sumValue44 + productValue418;
                                sumValue95 = sumValue45 + productValue419;
                                uint comparisonValue53 = ((((uint(sumValue43 >= 16.0) << 1u) | uint(sumValue43 < 0.0)) | (uint(sumValue44 < 0.0) << 2u)) | (uint(sumValue44 >= 16.0) << 3u)) | (uint(sumValue45 < 0.0) << 4u);
                                comparisonValue48 = intermediateValue[comparisonValue53 | (uint(sumValue45 >= 16.0) << 5u)];
                                comparisonValue49 = ((((comparisonValue53 | (uint(sumValue45 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue53 & 31u))) == 0u;
                                uint sampledTextureValue48;
                                if (comparisonValue49)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue115 + 4096u)).x & (1u << (comparisonValue48 & 31u))) == 0u)
                                    {
                                        intermediateValue189 = 0.0;
                                        intermediateValue191 = 0.0;
                                        intermediateValue193 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue48 = ((((uint(sumValue93 - (floor(sumValue93 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue94 - (floor(sumValue94 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue95 - (floor(sumValue95 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue115 + 4097u) + comparisonValue48)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue48 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue115;
                                }
                                uvec4 sampledTextureValue123 = texelFetch(voxelBuffer, int(sampledTextureValue48));
                                uint scalarValue274 = sampledTextureValue123.x;
                                if (scalarValue274 == 0u)
                                {
                                    intermediateValue189 = 0.0;
                                    intermediateValue191 = 0.0;
                                    intermediateValue193 = 0.0;
                                    break;
                                }
                                float bitwiseValue121 = float(scalarValue274 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue189 = bitwiseValue121 * float(scalarValue274 & 255u);
                                intermediateValue191 = bitwiseValue121 * float((scalarValue274 >> 8u) & 255u);
                                intermediateValue193 = bitwiseValue121 * float((scalarValue274 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue195;
                            float intermediateValue197;
                            float intermediateValue199;
                            float sumValue102;
                            float sumValue103;
                            float sumValue104;
                            uint comparisonValue58;
                            bool comparisonValue59;
                            for (;;)
                            {
                                sumValue102 = sumValue46 + productValue417;
                                sumValue103 = sumValue47 + productValue418;
                                sumValue104 = sumValue48 + productValue419;
                                uint comparisonValue54 = ((((uint(sumValue46 >= 16.0) << 1u) | uint(sumValue46 < 0.0)) | (uint(sumValue47 < 0.0) << 2u)) | (uint(sumValue47 >= 16.0) << 3u)) | (uint(sumValue48 < 0.0) << 4u);
                                comparisonValue58 = intermediateValue[comparisonValue54 | (uint(sumValue48 >= 16.0) << 5u)];
                                comparisonValue59 = ((((comparisonValue54 | (uint(sumValue48 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue54 & 31u))) == 0u;
                                uint sampledTextureValue52;
                                if (comparisonValue59)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue115 + 4096u)).x & (1u << (comparisonValue58 & 31u))) == 0u)
                                    {
                                        intermediateValue195 = 0.0;
                                        intermediateValue197 = 0.0;
                                        intermediateValue199 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue52 = ((((uint(sumValue102 - (floor(sumValue102 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue103 - (floor(sumValue103 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue104 - (floor(sumValue104 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue115 + 4097u) + comparisonValue58)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue52 = ((((uint(sumValue48) << 4u) & 240u) | (uint(sumValue47) & 15u)) | ((uint(sumValue46) << 8u) & 3840u)) + bitwiseValue115;
                                }
                                uvec4 sampledTextureValue124 = texelFetch(voxelBuffer, int(sampledTextureValue52));
                                uint scalarValue275 = sampledTextureValue124.x;
                                if (scalarValue275 == 0u)
                                {
                                    intermediateValue195 = 0.0;
                                    intermediateValue197 = 0.0;
                                    intermediateValue199 = 0.0;
                                    break;
                                }
                                float bitwiseValue122 = float(scalarValue275 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue195 = bitwiseValue122 * float(scalarValue275 & 255u);
                                intermediateValue197 = bitwiseValue122 * float((scalarValue275 >> 8u) & 255u);
                                intermediateValue199 = bitwiseValue122 * float((scalarValue275 >> 16u) & 255u);
                                break;
                            }
                            float sumValue294 = sumValue49 + productValue417;
                            float sumValue295 = sumValue50 + productValue418;
                            float sumValue296 = sumValue51 + productValue419;
                            uint comparisonValue55 = ((((uint(sumValue49 >= 16.0) << 1u) | uint(sumValue49 < 0.0)) | (uint(sumValue50 < 0.0) << 2u)) | (uint(sumValue50 >= 16.0) << 3u)) | (uint(sumValue51 < 0.0) << 4u);
                            uint comparisonValue57 = comparisonValue55 | (uint(sumValue51 >= 16.0) << 5u);
                            uint sampledTextureValue56;
                            if ((((comparisonValue57 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue55 & 31u))) == 0u)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue115 + 4096u)).x & (1u << (intermediateValue[comparisonValue57] & 31u))) == 0u)
                                {
                                    intermediateValue185 = intermediateValue156;
                                    intermediateValue186 = intermediateValue157;
                                    intermediateValue187 = intermediateValue158;
                                    intermediateValue188 = intermediateValue189;
                                    intermediateValue190 = intermediateValue191;
                                    intermediateValue192 = intermediateValue193;
                                    intermediateValue194 = intermediateValue195;
                                    intermediateValue196 = intermediateValue197;
                                    intermediateValue198 = intermediateValue199;
                                    intermediateValue200 = 0.0;
                                    intermediateValue201 = 0.0;
                                    intermediateValue202 = 0.0;
                                    break;
                                }
                                sampledTextureValue56 = ((((uint(sumValue294 - (floor(sumValue294 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue295 - (floor(sumValue295 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue296 - (floor(sumValue296 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue115 + 4097u) + intermediateValue[comparisonValue57])).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue56 = ((((uint(sumValue51) << 4u) & 240u) | (uint(sumValue50) & 15u)) | ((uint(sumValue49) << 8u) & 3840u)) + bitwiseValue115;
                            }
                            uvec4 sampledTextureValue125 = texelFetch(voxelBuffer, int(sampledTextureValue56));
                            uint scalarValue276 = sampledTextureValue125.x;
                            if (scalarValue276 == 0u)
                            {
                                intermediateValue185 = intermediateValue156;
                                intermediateValue186 = intermediateValue157;
                                intermediateValue187 = intermediateValue158;
                                intermediateValue188 = intermediateValue189;
                                intermediateValue190 = intermediateValue191;
                                intermediateValue192 = intermediateValue193;
                                intermediateValue194 = intermediateValue195;
                                intermediateValue196 = intermediateValue197;
                                intermediateValue198 = intermediateValue199;
                                intermediateValue200 = 0.0;
                                intermediateValue201 = 0.0;
                                intermediateValue202 = 0.0;
                                break;
                            }
                            float bitwiseValue123 = float(scalarValue276 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue185 = intermediateValue156;
                            intermediateValue186 = intermediateValue157;
                            intermediateValue187 = intermediateValue158;
                            intermediateValue188 = intermediateValue189;
                            intermediateValue190 = intermediateValue191;
                            intermediateValue192 = intermediateValue193;
                            intermediateValue194 = intermediateValue195;
                            intermediateValue196 = intermediateValue197;
                            intermediateValue198 = intermediateValue199;
                            intermediateValue200 = bitwiseValue123 * float(scalarValue276 & 255u);
                            intermediateValue201 = bitwiseValue123 * float((scalarValue276 >> 8u) & 255u);
                            intermediateValue202 = bitwiseValue123 * float((scalarValue276 >> 16u) & 255u);
                            break;
#endif
                        }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                        intermediateValue89 = productValue54;
                        intermediateValue91 = productValue55;
                        intermediateValue93 = productValue56;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                        intermediateValue87 = productValue54;
                        intermediateValue89 = productValue55;
                        intermediateValue91 = productValue56;
#endif
                    }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    else
                    {
                        bool sampledTextureValue81 = uint(textureQueryLevels(materialTexture2)) > 0u;
                        uvec2 sampledTextureValue82 = uvec2(textureSize(materialTexture2, int(0u)));
                        uint scalarValue112 = sampledTextureValue82.x;
                        float sumValue135 = spvNClamp(2.0 - sumValue126, 0.0, 1.0);
                        bool conditionValue11 = sumValue135 > 0.0;
                        float comparisonValue112 = fract(rdEvaluateFloatExpression(sampledTextureValue81 ? scalarValue112 : 0u) * multiplyAddValue66);
                        float comparisonValue113 = fract(rdEvaluateFloatExpression(sampledTextureValue81 ? sampledTextureValue82.y : 0u) * multiplyAddValue67);
                        float multiplyAddValue70 = (comparisonValue112 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue77.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue71 = (comparisonValue113 <= 0.083333335816860198974609375) ? (-fma(scalarValue103, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue72 = (comparisonValue112 >= 0.916666686534881591796875) ? (fma(scalarValue104, 2.0, -1.0) + multiplyAddValue70) : multiplyAddValue70;
                        float multiplyAddValue73 = (comparisonValue113 >= 0.916666686534881591796875) ? (fma(scalarValue105, 2.0, -1.0) + multiplyAddValue71) : multiplyAddValue71;
                        bool comparisonValue114 = abs(multiplyAddValue72) >= 0.004999999888241291046142578125;
                        bool comparisonValue115 = abs(multiplyAddValue73) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue116 = vec3(comparisonValue114 ? multiplyAddValue72 : 0.0, comparisonValue115 ? multiplyAddValue73 : 0.0, 0.25);
                        float inverseLengthValue20 = inversesqrt(rdDot3Precise2(comparisonValue116, comparisonValue116));
                        intermediateValue89 = (conditionValue11 && comparisonValue115) ? (sumValue135 * (inverseLengthValue20 * multiplyAddValue73)) : 0.0;
                        intermediateValue91 = (conditionValue11 && comparisonValue114) ? (sumValue135 * (inverseLengthValue20 * multiplyAddValue72)) : 0.0;
                        intermediateValue93 = conditionValue11 ? (inverseLengthValue20 * 0.25) : 1.0;
                    }
                    intermediateValue88 = intermediateValue89;
                    intermediateValue90 = intermediateValue91;
                    intermediateValue92 = intermediateValue93;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    else
                    {
                        bool sampledTextureValue81 = uint(textureQueryLevels(materialTexture2)) > 0u;
                        uvec2 sampledTextureValue82 = uvec2(textureSize(materialTexture2, int(0u)));
                        uint scalarValue112 = sampledTextureValue82.x;
                        float sumValue216 = spvNClamp(2.0 - sumValue207, 0.0, 1.0);
                        bool conditionValue30 = sumValue216 > 0.0;
                        float comparisonValue188 = fract(rdEvaluateFloatExpression(sampledTextureValue81 ? scalarValue112 : 0u) * multiplyAddValue256);
                        float comparisonValue189 = fract(rdEvaluateFloatExpression(sampledTextureValue81 ? sampledTextureValue82.y : 0u) * multiplyAddValue257);
                        float multiplyAddValue260 = (comparisonValue188 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue99.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue261 = (comparisonValue189 <= 0.083333335816860198974609375) ? (-fma(scalarValue192, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue262 = (comparisonValue188 >= 0.916666686534881591796875) ? (fma(scalarValue193, 2.0, -1.0) + multiplyAddValue260) : multiplyAddValue260;
                        float multiplyAddValue263 = (comparisonValue189 >= 0.916666686534881591796875) ? (fma(scalarValue194, 2.0, -1.0) + multiplyAddValue261) : multiplyAddValue261;
                        bool comparisonValue190 = abs(multiplyAddValue262) >= 0.004999999888241291046142578125;
                        bool comparisonValue191 = abs(multiplyAddValue263) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue192 = vec3(comparisonValue190 ? multiplyAddValue262 : 0.0, comparisonValue191 ? multiplyAddValue263 : 0.0, 0.25);
                        float inverseLengthValue38 = inversesqrt(rdDot3Precise2(comparisonValue192, comparisonValue192));
                        intermediateValue87 = (conditionValue30 && comparisonValue191) ? (sumValue216 * (inverseLengthValue38 * multiplyAddValue263)) : 0.0;
                        intermediateValue89 = (conditionValue30 && comparisonValue190) ? (sumValue216 * (inverseLengthValue38 * multiplyAddValue262)) : 0.0;
                        intermediateValue91 = conditionValue30 ? (inverseLengthValue38 * 0.25) : 1.0;
                    }
                    intermediateValue86 = intermediateValue87;
                    intermediateValue88 = intermediateValue89;
                    intermediateValue90 = intermediateValue91;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue50 = (((intermediateValue197 * productValue150) + (intermediateValue192 * productValue149)) + (intermediateValue203 * productValue151)) + (intermediateValue207 * productValue152);
                    branchMergedValue56 = (((intermediateValue195 * productValue150) + (intermediateValue191 * productValue149)) + (intermediateValue201 * productValue151)) + (intermediateValue206 * productValue152);
                    branchMergedValue57 = (((intermediateValue193 * productValue150) + (intermediateValue190 * productValue149)) + (intermediateValue199 * productValue151)) + (intermediateValue205 * productValue152);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue50 = (((intermediateValue188 * productValue147) + (intermediateValue185 * productValue146)) + (intermediateValue194 * productValue148)) + (intermediateValue200 * productValue149);
                    branchMergedValue56 = (((intermediateValue192 * productValue147) + (intermediateValue187 * productValue146)) + (intermediateValue198 * productValue148)) + (intermediateValue202 * productValue149);
                    branchMergedValue57 = (((intermediateValue190 * productValue147) + (intermediateValue186 * productValue146)) + (intermediateValue196 * productValue148)) + (intermediateValue201 * productValue149);
#endif
                }
                else
                {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    intermediateValue88 = 0.0;
                    intermediateValue90 = 0.0;
                    intermediateValue92 = 1.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    intermediateValue86 = 0.0;
                    intermediateValue88 = 0.0;
                    intermediateValue90 = 1.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    float intermediateValue209;
                    float intermediateValue210;
                    float intermediateValue211;
                    float intermediateValue212;
                    float intermediateValue214;
                    float intermediateValue216;
                    float intermediateValue218;
                    float intermediateValue220;
                    float intermediateValue222;
                    float intermediateValue224;
                    float intermediateValue225;
                    float intermediateValue226;
                    float intermediateValue115;
                    float intermediateValue116;
                    float intermediateValue117;
                    uint intermediateValue118;
                    uint intermediateValue119;
                    uint intermediateValue120;
                    float intermediateValue123;
                    float sumValue59;
                    float sumValue60;
                    float sumValue61;
                    float sumValue62;
                    float sumValue63;
                    float sumValue64;
                    bool comparisonValue29;
                    uint productValue153;
                    uint productValue154;
                    uint productValue155;
                    uint productValue156;
                    uint productValue157;
                    uint productValue158;
                    for (;;)
                    {
                        intermediateValue115 = floor(sumValue39);
                        intermediateValue116 = floor(sumValue40);
                        intermediateValue117 = floor(sumValue41);
                        float sumValue66 = sumValue39 - intermediateValue115;
                        float sumValue67 = sumValue40 - intermediateValue116;
                        float sumValue68 = sumValue41 - intermediateValue117;
                        uint comparisonValue60 = ((uint(sumValue67 >= sumValue68) << 1u) | uint(sumValue66 >= sumValue67)) | (uint(sumValue66 >= sumValue68) << 2u);
                        intermediateValue118 = uint(intermediateValue115);
                        intermediateValue119 = uint(intermediateValue116);
                        intermediateValue120 = uint(intermediateValue117);
                        float scalarValue60 = spvNMin(sumValue66, sumValue67);
                        float scalarValue61 = spvNMax(sumValue66, sumValue67);
                        intermediateValue123 = spvNMin(scalarValue60, sumValue68);
                        float scalarValue62 = spvNMax(scalarValue61, sumValue68);
                        float scalarValue63 = spvNMax(spvNMin(scalarValue61, sumValue68), scalarValue60);
                        sumValue59 = 1.0 - scalarValue62;
                        sumValue60 = scalarValue62 - scalarValue63;
                        sumValue61 = scalarValue63 - intermediateValue123;
                        sumValue62 = intermediateValue115 + 1.0;
                        sumValue63 = intermediateValue116 + 1.0;
                        sumValue64 = intermediateValue117 + 1.0;
                        comparisonValue29 = (((intermediateValue115 >= 0.0) && (intermediateValue116 >= 0.0)) && (intermediateValue117 >= 0.0)) && (((sumValue62 < 16.0) && (sumValue63 < 16.0)) && (sumValue64 < 16.0));
                        productValue153 = 0u + (comparisonValue60 * 3u);
                        productValue154 = 1u + (comparisonValue60 * 3u);
                        productValue155 = 2u + (comparisonValue60 * 3u);
                        productValue156 = 0u + (comparisonValue60 * 3u);
                        productValue157 = 1u + (comparisonValue60 * 3u);
                        productValue158 = 2u + (comparisonValue60 * 3u);
                        if (comparisonValue29)
                        {
                            uint bitwiseValue25 = intermediateValue120 << 4u;
                            uint sumValue70 = intermediateValue119 + bitwiseValue9;
                            uint bitwiseValue26 = sumValue70 + (intermediateValue118 << 8u);
                            uvec4 sampledTextureValue44 = texelFetch(voxelBuffer, int(bitwiseValue26 + bitwiseValue25));
                            uint scalarValue64 = sampledTextureValue44.x;
                            float bitwiseValue15;
                            float intermediateValue150;
                            float intermediateValue151;
                            if (scalarValue64 == 0u)
                            {
                                bitwiseValue15 = 0.0;
                                intermediateValue150 = 0.0;
                                intermediateValue151 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue27 = float(scalarValue64 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue15 = bitwiseValue27 * float(scalarValue64 & 255u);
                                intermediateValue150 = bitwiseValue27 * float((scalarValue64 >> 8u) & 255u);
                                intermediateValue151 = bitwiseValue27 * float((scalarValue64 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue45 = texelFetch(voxelBuffer, int(((intermediateValue1[productValue154] + sumValue70) + ((intermediateValue1[productValue153] + intermediateValue118) << 8u)) + ((intermediateValue1[productValue155] + intermediateValue120) << 4u)));
                            uint scalarValue65 = sampledTextureValue45.x;
                            float bitwiseValue19;
                            float intermediateValue165;
                            float intermediateValue166;
                            if (scalarValue65 == 0u)
                            {
                                bitwiseValue19 = 0.0;
                                intermediateValue165 = 0.0;
                                intermediateValue166 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue28 = float(scalarValue65 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue19 = bitwiseValue28 * float(scalarValue65 & 255u);
                                intermediateValue165 = bitwiseValue28 * float((scalarValue65 >> 8u) & 255u);
                                intermediateValue166 = bitwiseValue28 * float((scalarValue65 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue46 = texelFetch(voxelBuffer, int(((intermediateValue2[productValue157] + sumValue70) + ((intermediateValue2[productValue156] + intermediateValue118) << 8u)) + ((intermediateValue2[productValue158] + intermediateValue120) << 4u)));
                            uint scalarValue66 = sampledTextureValue46.x;
                            float bitwiseValue24;
                            float intermediateValue179;
                            float intermediateValue180;
                            if (scalarValue66 == 0u)
                            {
                                bitwiseValue24 = 0.0;
                                intermediateValue179 = 0.0;
                                intermediateValue180 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue29 = float(scalarValue66 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue24 = bitwiseValue29 * float(scalarValue66 & 255u);
                                intermediateValue179 = bitwiseValue29 * float((scalarValue66 >> 8u) & 255u);
                                intermediateValue180 = bitwiseValue29 * float((scalarValue66 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue59 = texelFetch(voxelBuffer, int((bitwiseValue26 + 273u) + bitwiseValue25));
                            uint scalarValue67 = sampledTextureValue59.x;
                            float branchMergedValue16;
                            float branchMergedValue35;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            float branchMergedValue38;
                            float branchMergedValue39;
                            float branchMergedValue40;
                            float branchMergedValue41;
                            float branchMergedValue42;
                            float branchMergedValue43;
                            float branchMergedValue46;
                            float branchMergedValue47;
                            if (scalarValue67 == 0u)
                            {
                                branchMergedValue16 = 0.0;
                                branchMergedValue35 = 0.0;
                                branchMergedValue36 = 0.0;
                                branchMergedValue37 = intermediateValue180;
                                branchMergedValue38 = intermediateValue179;
                                branchMergedValue39 = bitwiseValue24;
                                branchMergedValue40 = intermediateValue166;
                                branchMergedValue41 = intermediateValue165;
                                branchMergedValue42 = bitwiseValue19;
                                branchMergedValue43 = intermediateValue151;
                                branchMergedValue46 = intermediateValue150;
                                branchMergedValue47 = bitwiseValue15;
                            }
                            else
                            {
                                float bitwiseValue30 = float(scalarValue67 >> 24u) * 9.2272217443678528070449829101562e-05;
                                branchMergedValue16 = bitwiseValue30 * float((scalarValue67 >> 16u) & 255u);
                                branchMergedValue35 = bitwiseValue30 * float((scalarValue67 >> 8u) & 255u);
                                branchMergedValue36 = bitwiseValue30 * float(scalarValue67 & 255u);
                                branchMergedValue37 = intermediateValue180;
                                branchMergedValue38 = intermediateValue179;
                                branchMergedValue39 = bitwiseValue24;
                                branchMergedValue40 = intermediateValue166;
                                branchMergedValue41 = intermediateValue165;
                                branchMergedValue42 = bitwiseValue19;
                                branchMergedValue43 = intermediateValue151;
                                branchMergedValue46 = intermediateValue150;
                                branchMergedValue47 = bitwiseValue15;
                            }
                            intermediateValue209 = branchMergedValue47;
                            intermediateValue210 = branchMergedValue46;
                            intermediateValue211 = branchMergedValue43;
                            intermediateValue212 = branchMergedValue42;
                            intermediateValue214 = branchMergedValue41;
                            intermediateValue216 = branchMergedValue40;
                            intermediateValue218 = branchMergedValue39;
                            intermediateValue220 = branchMergedValue38;
                            intermediateValue222 = branchMergedValue37;
                            intermediateValue224 = branchMergedValue36;
                            intermediateValue225 = branchMergedValue35;
                            intermediateValue226 = branchMergedValue16;
                            break;
                        }
                        else
                        {
                            float intermediateValue168;
                            float intermediateValue169;
                            float intermediateValue170;
                            float sumValue76;
                            float sumValue77;
                            float sumValue78;
                            float sumValue79;
                            float sumValue80;
                            float sumValue81;
                            float sumValue82;
                            float sumValue83;
                            float sumValue84;
                            uint comparisonValue39;
                            bool comparisonValue40;
                            for (;;)
                            {
                                sumValue76 = float(intermediateValue1[productValue153]) + intermediateValue115;
                                sumValue77 = float(intermediateValue1[productValue154]) + intermediateValue116;
                                sumValue78 = float(intermediateValue1[productValue155]) + intermediateValue117;
                                sumValue79 = float(intermediateValue2[productValue156]) + intermediateValue115;
                                sumValue80 = float(intermediateValue2[productValue157]) + intermediateValue116;
                                sumValue81 = float(intermediateValue2[productValue158]) + intermediateValue117;
                                sumValue82 = intermediateValue115 + productValue136;
                                sumValue83 = intermediateValue116 + productValue137;
                                sumValue84 = intermediateValue117 + productValue138;
                                uint comparisonValue63 = ((((uint(intermediateValue115 >= 16.0) << 1u) | uint(intermediateValue115 < 0.0)) | (uint(intermediateValue116 < 0.0) << 2u)) | (uint(intermediateValue116 >= 16.0) << 3u)) | (uint(intermediateValue117 < 0.0) << 4u);
                                comparisonValue39 = intermediateValue[comparisonValue63 | (uint(intermediateValue117 >= 16.0) << 5u)];
                                comparisonValue40 = ((((comparisonValue63 | (uint(intermediateValue117 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue63 & 31u))) == 0u;
                                uint sampledTextureValue41;
                                if (comparisonValue40)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue39 & 31u))) == 0u)
                                    {
                                        intermediateValue168 = 0.0;
                                        intermediateValue169 = 0.0;
                                        intermediateValue170 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue41 = ((((uint(sumValue82 - (floor(sumValue82 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue83 - (floor(sumValue83 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue84 - (floor(sumValue84 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue39)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue41 = ((((intermediateValue118 << 8u) & 3840u) | (intermediateValue119 & 15u)) | ((intermediateValue120 << 4u) & 240u)) + bitwiseValue9;
                                }
                                uvec4 sampledTextureValue60 = texelFetch(voxelBuffer, int(sampledTextureValue41));
                                uint scalarValue68 = sampledTextureValue60.x;
                                if (scalarValue68 == 0u)
                                {
                                    intermediateValue168 = 0.0;
                                    intermediateValue169 = 0.0;
                                    intermediateValue170 = 0.0;
                                    break;
                                }
                                float bitwiseValue31 = float(scalarValue68 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue168 = bitwiseValue31 * float(scalarValue68 & 255u);
                                intermediateValue169 = bitwiseValue31 * float((scalarValue68 >> 8u) & 255u);
                                intermediateValue170 = bitwiseValue31 * float((scalarValue68 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue213;
                            float intermediateValue215;
                            float intermediateValue217;
                            float sumValue96;
                            float sumValue97;
                            float sumValue98;
                            uint comparisonValue51;
                            bool comparisonValue52;
                            for (;;)
                            {
                                sumValue96 = sumValue76 + productValue136;
                                sumValue97 = sumValue77 + productValue137;
                                sumValue98 = sumValue78 + productValue138;
                                uint comparisonValue64 = ((((uint(sumValue76 >= 16.0) << 1u) | uint(sumValue76 < 0.0)) | (uint(sumValue77 < 0.0) << 2u)) | (uint(sumValue77 >= 16.0) << 3u)) | (uint(sumValue78 < 0.0) << 4u);
                                comparisonValue51 = intermediateValue[comparisonValue64 | (uint(sumValue78 >= 16.0) << 5u)];
                                comparisonValue52 = ((((comparisonValue64 | (uint(sumValue78 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue64 & 31u))) == 0u;
                                uint sampledTextureValue49;
                                if (comparisonValue52)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue51 & 31u))) == 0u)
                                    {
                                        intermediateValue213 = 0.0;
                                        intermediateValue215 = 0.0;
                                        intermediateValue217 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue49 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue51)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue49 = ((((uint(sumValue76) << 8u) & 3840u) | (uint(sumValue77) & 15u)) | ((uint(sumValue78) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uvec4 sampledTextureValue61 = texelFetch(voxelBuffer, int(sampledTextureValue49));
                                uint scalarValue69 = sampledTextureValue61.x;
                                if (scalarValue69 == 0u)
                                {
                                    intermediateValue213 = 0.0;
                                    intermediateValue215 = 0.0;
                                    intermediateValue217 = 0.0;
                                    break;
                                }
                                float bitwiseValue32 = float(scalarValue69 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue213 = bitwiseValue32 * float(scalarValue69 & 255u);
                                intermediateValue215 = bitwiseValue32 * float((scalarValue69 >> 8u) & 255u);
                                intermediateValue217 = bitwiseValue32 * float((scalarValue69 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue219;
                            float intermediateValue221;
                            float intermediateValue223;
                            float sumValue105;
                            float sumValue106;
                            float sumValue107;
                            uint comparisonValue61;
                            bool comparisonValue62;
                            for (;;)
                            {
                                sumValue105 = sumValue79 + productValue136;
                                sumValue106 = sumValue80 + productValue137;
                                sumValue107 = sumValue81 + productValue138;
                                uint comparisonValue65 = ((((uint(sumValue79 >= 16.0) << 1u) | uint(sumValue79 < 0.0)) | (uint(sumValue80 < 0.0) << 2u)) | (uint(sumValue80 >= 16.0) << 3u)) | (uint(sumValue81 < 0.0) << 4u);
                                comparisonValue61 = intermediateValue[comparisonValue65 | (uint(sumValue81 >= 16.0) << 5u)];
                                comparisonValue62 = ((((comparisonValue65 | (uint(sumValue81 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue65 & 31u))) == 0u;
                                uint sampledTextureValue53;
                                if (comparisonValue62)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (comparisonValue61 & 31u))) == 0u)
                                    {
                                        intermediateValue219 = 0.0;
                                        intermediateValue221 = 0.0;
                                        intermediateValue223 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue53 = ((((uint(sumValue105 - (floor(sumValue105 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue106 - (floor(sumValue106 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue107 - (floor(sumValue107 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + comparisonValue61)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue53 = ((((uint(sumValue79) << 8u) & 3840u) | (uint(sumValue80) & 15u)) | ((uint(sumValue81) << 4u) & 240u)) + bitwiseValue9;
                                }
                                uvec4 sampledTextureValue62 = texelFetch(voxelBuffer, int(sampledTextureValue53));
                                uint scalarValue70 = sampledTextureValue62.x;
                                if (scalarValue70 == 0u)
                                {
                                    intermediateValue219 = 0.0;
                                    intermediateValue221 = 0.0;
                                    intermediateValue223 = 0.0;
                                    break;
                                }
                                float bitwiseValue33 = float(scalarValue70 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue219 = bitwiseValue33 * float(scalarValue70 & 255u);
                                intermediateValue221 = bitwiseValue33 * float((scalarValue70 >> 8u) & 255u);
                                intermediateValue223 = bitwiseValue33 * float((scalarValue70 >> 16u) & 255u);
                                break;
                            }
                            float sumValue75 = sumValue62 + productValue136;
                            float sumValue85 = sumValue63 + productValue137;
                            float sumValue86 = sumValue64 + productValue138;
                            uint comparisonValue66 = ((((uint(sumValue62 >= 16.0) << 1u) | uint(sumValue62 < 0.0)) | (uint(sumValue63 < 0.0) << 2u)) | (uint(sumValue63 >= 16.0) << 3u)) | (uint(sumValue64 < 0.0) << 4u);
                            uint comparisonValue67 = comparisonValue66 | (uint(sumValue64 >= 16.0) << 5u);
                            uint sampledTextureValue57;
                            if ((((comparisonValue67 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue66 & 31u))) == 0u)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue9 + 4096u)).x & (1u << (intermediateValue[comparisonValue67] & 31u))) == 0u)
                                {
                                    intermediateValue209 = intermediateValue168;
                                    intermediateValue210 = intermediateValue169;
                                    intermediateValue211 = intermediateValue170;
                                    intermediateValue212 = intermediateValue213;
                                    intermediateValue214 = intermediateValue215;
                                    intermediateValue216 = intermediateValue217;
                                    intermediateValue218 = intermediateValue219;
                                    intermediateValue220 = intermediateValue221;
                                    intermediateValue222 = intermediateValue223;
                                    intermediateValue224 = 0.0;
                                    intermediateValue225 = 0.0;
                                    intermediateValue226 = 0.0;
                                    break;
                                }
                                sampledTextureValue57 = ((((uint(sumValue75 - (floor(sumValue75 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue85 - (floor(sumValue85 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue86 - (floor(sumValue86 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue9 + 4097u) + intermediateValue[comparisonValue67])).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue57 = ((((uint(sumValue62) << 8u) & 3840u) | (uint(sumValue63) & 15u)) | ((uint(sumValue64) << 4u) & 240u)) + bitwiseValue9;
                            }
                            uvec4 sampledTextureValue63 = texelFetch(voxelBuffer, int(sampledTextureValue57));
                            uint scalarValue71 = sampledTextureValue63.x;
                            if (scalarValue71 == 0u)
                            {
                                intermediateValue209 = intermediateValue168;
                                intermediateValue210 = intermediateValue169;
                                intermediateValue211 = intermediateValue170;
                                intermediateValue212 = intermediateValue213;
                                intermediateValue214 = intermediateValue215;
                                intermediateValue216 = intermediateValue217;
                                intermediateValue218 = intermediateValue219;
                                intermediateValue220 = intermediateValue221;
                                intermediateValue222 = intermediateValue223;
                                intermediateValue224 = 0.0;
                                intermediateValue225 = 0.0;
                                intermediateValue226 = 0.0;
                                break;
                            }
                            float bitwiseValue34 = float(scalarValue71 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue209 = intermediateValue168;
                            intermediateValue210 = intermediateValue169;
                            intermediateValue211 = intermediateValue170;
                            intermediateValue212 = intermediateValue213;
                            intermediateValue214 = intermediateValue215;
                            intermediateValue216 = intermediateValue217;
                            intermediateValue218 = intermediateValue219;
                            intermediateValue220 = intermediateValue221;
                            intermediateValue222 = intermediateValue223;
                            intermediateValue224 = bitwiseValue34 * float(scalarValue71 & 255u);
                            intermediateValue225 = bitwiseValue34 * float((scalarValue71 >> 8u) & 255u);
                            intermediateValue226 = bitwiseValue34 * float((scalarValue71 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue50 = (((intermediateValue216 * sumValue60) + (intermediateValue211 * sumValue59)) + (intermediateValue222 * sumValue61)) + (intermediateValue226 * intermediateValue123);
                    branchMergedValue56 = (((intermediateValue214 * sumValue60) + (intermediateValue210 * sumValue59)) + (intermediateValue220 * sumValue61)) + (intermediateValue225 * intermediateValue123);
                    branchMergedValue57 = (((intermediateValue212 * sumValue60) + (intermediateValue209 * sumValue59)) + (intermediateValue218 * sumValue61)) + (intermediateValue224 * intermediateValue123);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    float intermediateValue204;
                    float intermediateValue205;
                    float intermediateValue206;
                    float intermediateValue207;
                    float intermediateValue209;
                    float intermediateValue211;
                    float intermediateValue213;
                    float intermediateValue215;
                    float intermediateValue217;
                    float intermediateValue219;
                    float intermediateValue220;
                    float intermediateValue221;
                    float intermediateValue110;
                    float intermediateValue111;
                    float intermediateValue112;
                    uint intermediateValue113;
                    uint intermediateValue114;
                    uint intermediateValue115;
                    float intermediateValue118;
                    float sumValue59;
                    float sumValue60;
                    float sumValue61;
                    float sumValue62;
                    float sumValue63;
                    float sumValue64;
                    bool comparisonValue29;
                    uint productValue150;
                    uint productValue151;
                    uint productValue152;
                    uint productValue153;
                    uint productValue154;
                    uint productValue155;
                    for (;;)
                    {
                        intermediateValue110 = floor(sumValue287);
                        intermediateValue111 = floor(sumValue288);
                        intermediateValue112 = floor(sumValue289);
                        float sumValue297 = sumValue287 - intermediateValue110;
                        float sumValue298 = sumValue288 - intermediateValue111;
                        float sumValue299 = sumValue289 - intermediateValue112;
                        uint comparisonValue273 = ((uint(sumValue298 >= sumValue299) << 1u) | uint(sumValue297 >= sumValue298)) | (uint(sumValue297 >= sumValue299) << 2u);
                        intermediateValue113 = uint(intermediateValue110);
                        intermediateValue114 = uint(intermediateValue111);
                        intermediateValue115 = uint(intermediateValue112);
                        float scalarValue277 = spvNMin(sumValue297, sumValue298);
                        float scalarValue278 = spvNMax(sumValue297, sumValue298);
                        intermediateValue118 = spvNMin(scalarValue277, sumValue299);
                        float scalarValue279 = spvNMax(scalarValue278, sumValue299);
                        float scalarValue280 = spvNMax(spvNMin(scalarValue278, sumValue299), scalarValue277);
                        sumValue59 = 1.0 - scalarValue279;
                        sumValue60 = scalarValue279 - scalarValue280;
                        sumValue61 = scalarValue280 - intermediateValue118;
                        sumValue62 = intermediateValue110 + 1.0;
                        sumValue63 = intermediateValue111 + 1.0;
                        sumValue64 = intermediateValue112 + 1.0;
                        comparisonValue29 = (((intermediateValue110 >= 0.0) && (intermediateValue111 >= 0.0)) && (intermediateValue112 >= 0.0)) && (((sumValue62 < 16.0) && (sumValue63 < 16.0)) && (sumValue64 < 16.0));
                        productValue150 = 0u + (comparisonValue273 * 3u);
                        productValue151 = 1u + (comparisonValue273 * 3u);
                        productValue152 = 2u + (comparisonValue273 * 3u);
                        productValue153 = 0u + (comparisonValue273 * 3u);
                        productValue154 = 1u + (comparisonValue273 * 3u);
                        productValue155 = 2u + (comparisonValue273 * 3u);
                        if (comparisonValue29)
                        {
                            uint bitwiseValue124 = intermediateValue115 << 4u;
                            uint sumValue300 = intermediateValue114 + bitwiseValue115;
                            uint bitwiseValue125 = sumValue300 + (intermediateValue113 << 8u);
                            uvec4 sampledTextureValue126 = texelFetch(voxelBuffer, int(bitwiseValue125 + bitwiseValue124));
                            uint scalarValue281 = sampledTextureValue126.x;
                            float bitwiseValue15;
                            float intermediateValue145;
                            float intermediateValue146;
                            if (scalarValue281 == 0u)
                            {
                                bitwiseValue15 = 0.0;
                                intermediateValue145 = 0.0;
                                intermediateValue146 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue126 = float(scalarValue281 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue15 = bitwiseValue126 * float(scalarValue281 & 255u);
                                intermediateValue145 = bitwiseValue126 * float((scalarValue281 >> 8u) & 255u);
                                intermediateValue146 = bitwiseValue126 * float((scalarValue281 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue127 = texelFetch(voxelBuffer, int(((intermediateValue1[productValue151] + sumValue300) + ((intermediateValue1[productValue150] + intermediateValue113) << 8u)) + ((intermediateValue1[productValue152] + intermediateValue115) << 4u)));
                            uint scalarValue282 = sampledTextureValue127.x;
                            float bitwiseValue19;
                            float intermediateValue160;
                            float intermediateValue161;
                            if (scalarValue282 == 0u)
                            {
                                bitwiseValue19 = 0.0;
                                intermediateValue160 = 0.0;
                                intermediateValue161 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue127 = float(scalarValue282 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue19 = bitwiseValue127 * float(scalarValue282 & 255u);
                                intermediateValue160 = bitwiseValue127 * float((scalarValue282 >> 8u) & 255u);
                                intermediateValue161 = bitwiseValue127 * float((scalarValue282 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue128 = texelFetch(voxelBuffer, int(((intermediateValue2[productValue154] + sumValue300) + ((intermediateValue2[productValue153] + intermediateValue113) << 8u)) + ((intermediateValue2[productValue155] + intermediateValue115) << 4u)));
                            uint scalarValue283 = sampledTextureValue128.x;
                            float bitwiseValue24;
                            float intermediateValue174;
                            float intermediateValue175;
                            if (scalarValue283 == 0u)
                            {
                                bitwiseValue24 = 0.0;
                                intermediateValue174 = 0.0;
                                intermediateValue175 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue128 = float(scalarValue283 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue24 = bitwiseValue128 * float(scalarValue283 & 255u);
                                intermediateValue174 = bitwiseValue128 * float((scalarValue283 >> 8u) & 255u);
                                intermediateValue175 = bitwiseValue128 * float((scalarValue283 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue129 = texelFetch(voxelBuffer, int((bitwiseValue125 + 273u) + bitwiseValue124));
                            uint scalarValue284 = sampledTextureValue129.x;
                            float branchMergedValue18;
                            float branchMergedValue35;
                            float branchMergedValue36;
                            float branchMergedValue37;
                            float branchMergedValue38;
                            float branchMergedValue39;
                            float branchMergedValue40;
                            float branchMergedValue41;
                            float branchMergedValue42;
                            float branchMergedValue43;
                            float branchMergedValue46;
                            float branchMergedValue47;
                            if (scalarValue284 == 0u)
                            {
                                branchMergedValue18 = 0.0;
                                branchMergedValue35 = intermediateValue175;
                                branchMergedValue36 = intermediateValue174;
                                branchMergedValue37 = bitwiseValue24;
                                branchMergedValue38 = intermediateValue161;
                                branchMergedValue39 = intermediateValue160;
                                branchMergedValue40 = bitwiseValue19;
                                branchMergedValue41 = intermediateValue146;
                                branchMergedValue42 = intermediateValue145;
                                branchMergedValue43 = bitwiseValue15;
                                branchMergedValue46 = 0.0;
                                branchMergedValue47 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue129 = float(scalarValue284 >> 24u) * 9.2272217443678528070449829101562e-05;
                                branchMergedValue18 = bitwiseValue129 * float(scalarValue284 & 255u);
                                branchMergedValue35 = intermediateValue175;
                                branchMergedValue36 = intermediateValue174;
                                branchMergedValue37 = bitwiseValue24;
                                branchMergedValue38 = intermediateValue161;
                                branchMergedValue39 = intermediateValue160;
                                branchMergedValue40 = bitwiseValue19;
                                branchMergedValue41 = intermediateValue146;
                                branchMergedValue42 = intermediateValue145;
                                branchMergedValue43 = bitwiseValue15;
                                branchMergedValue46 = bitwiseValue129 * float((scalarValue284 >> 16u) & 255u);
                                branchMergedValue47 = bitwiseValue129 * float((scalarValue284 >> 8u) & 255u);
                            }
                            intermediateValue204 = branchMergedValue43;
                            intermediateValue205 = branchMergedValue42;
                            intermediateValue206 = branchMergedValue41;
                            intermediateValue207 = branchMergedValue40;
                            intermediateValue209 = branchMergedValue39;
                            intermediateValue211 = branchMergedValue38;
                            intermediateValue213 = branchMergedValue37;
                            intermediateValue215 = branchMergedValue36;
                            intermediateValue217 = branchMergedValue35;
                            intermediateValue219 = branchMergedValue18;
                            intermediateValue220 = branchMergedValue47;
                            intermediateValue221 = branchMergedValue46;
                            break;
                        }
                        else
                        {
                            float intermediateValue163;
                            float intermediateValue164;
                            float intermediateValue165;
                            float sumValue76;
                            float sumValue77;
                            float sumValue78;
                            float sumValue79;
                            float sumValue80;
                            float sumValue81;
                            float sumValue82;
                            float sumValue83;
                            float sumValue84;
                            uint comparisonValue39;
                            bool comparisonValue40;
                            for (;;)
                            {
                                sumValue76 = float(intermediateValue1[productValue150]) + intermediateValue110;
                                sumValue77 = float(intermediateValue1[productValue151]) + intermediateValue111;
                                sumValue78 = float(intermediateValue1[productValue152]) + intermediateValue112;
                                sumValue79 = float(intermediateValue2[productValue153]) + intermediateValue110;
                                sumValue80 = float(intermediateValue2[productValue154]) + intermediateValue111;
                                sumValue81 = float(intermediateValue2[productValue155]) + intermediateValue112;
                                sumValue82 = intermediateValue110 + productValue417;
                                sumValue83 = intermediateValue111 + productValue418;
                                sumValue84 = intermediateValue112 + productValue419;
                                uint comparisonValue274 = ((((uint(intermediateValue110 >= 16.0) << 1u) | uint(intermediateValue110 < 0.0)) | (uint(intermediateValue111 < 0.0) << 2u)) | (uint(intermediateValue111 >= 16.0) << 3u)) | (uint(intermediateValue112 < 0.0) << 4u);
                                comparisonValue39 = intermediateValue[comparisonValue274 | (uint(intermediateValue112 >= 16.0) << 5u)];
                                comparisonValue40 = ((((comparisonValue274 | (uint(intermediateValue112 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue274 & 31u))) == 0u;
                                uint sampledTextureValue42;
                                if (comparisonValue40)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue115 + 4096u)).x & (1u << (comparisonValue39 & 31u))) == 0u)
                                    {
                                        intermediateValue163 = 0.0;
                                        intermediateValue164 = 0.0;
                                        intermediateValue165 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue42 = ((((uint(sumValue82 - (floor(sumValue82 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue83 - (floor(sumValue83 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue84 - (floor(sumValue84 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue115 + 4097u) + comparisonValue39)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue42 = ((((intermediateValue113 << 8u) & 3840u) | (intermediateValue114 & 15u)) | ((intermediateValue115 << 4u) & 240u)) + bitwiseValue115;
                                }
                                uvec4 sampledTextureValue130 = texelFetch(voxelBuffer, int(sampledTextureValue42));
                                uint scalarValue285 = sampledTextureValue130.x;
                                if (scalarValue285 == 0u)
                                {
                                    intermediateValue163 = 0.0;
                                    intermediateValue164 = 0.0;
                                    intermediateValue165 = 0.0;
                                    break;
                                }
                                float bitwiseValue130 = float(scalarValue285 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue163 = bitwiseValue130 * float(scalarValue285 & 255u);
                                intermediateValue164 = bitwiseValue130 * float((scalarValue285 >> 8u) & 255u);
                                intermediateValue165 = bitwiseValue130 * float((scalarValue285 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue208;
                            float intermediateValue210;
                            float intermediateValue212;
                            float sumValue96;
                            float sumValue97;
                            float sumValue98;
                            uint comparisonValue51;
                            bool comparisonValue52;
                            for (;;)
                            {
                                sumValue96 = sumValue76 + productValue417;
                                sumValue97 = sumValue77 + productValue418;
                                sumValue98 = sumValue78 + productValue419;
                                uint comparisonValue64 = ((((uint(sumValue76 >= 16.0) << 1u) | uint(sumValue76 < 0.0)) | (uint(sumValue77 < 0.0) << 2u)) | (uint(sumValue77 >= 16.0) << 3u)) | (uint(sumValue78 < 0.0) << 4u);
                                comparisonValue51 = intermediateValue[comparisonValue64 | (uint(sumValue78 >= 16.0) << 5u)];
                                comparisonValue52 = ((((comparisonValue64 | (uint(sumValue78 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue64 & 31u))) == 0u;
                                uint sampledTextureValue50;
                                if (comparisonValue52)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue115 + 4096u)).x & (1u << (comparisonValue51 & 31u))) == 0u)
                                    {
                                        intermediateValue208 = 0.0;
                                        intermediateValue210 = 0.0;
                                        intermediateValue212 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue50 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue115 + 4097u) + comparisonValue51)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue50 = ((((uint(sumValue76) << 8u) & 3840u) | (uint(sumValue77) & 15u)) | ((uint(sumValue78) << 4u) & 240u)) + bitwiseValue115;
                                }
                                uvec4 sampledTextureValue131 = texelFetch(voxelBuffer, int(sampledTextureValue50));
                                uint scalarValue286 = sampledTextureValue131.x;
                                if (scalarValue286 == 0u)
                                {
                                    intermediateValue208 = 0.0;
                                    intermediateValue210 = 0.0;
                                    intermediateValue212 = 0.0;
                                    break;
                                }
                                float bitwiseValue131 = float(scalarValue286 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue208 = bitwiseValue131 * float(scalarValue286 & 255u);
                                intermediateValue210 = bitwiseValue131 * float((scalarValue286 >> 8u) & 255u);
                                intermediateValue212 = bitwiseValue131 * float((scalarValue286 >> 16u) & 255u);
                                break;
                            }
                            float intermediateValue214;
                            float intermediateValue216;
                            float intermediateValue218;
                            float sumValue105;
                            float sumValue106;
                            float sumValue107;
                            uint comparisonValue61;
                            bool comparisonValue62;
                            for (;;)
                            {
                                sumValue105 = sumValue79 + productValue417;
                                sumValue106 = sumValue80 + productValue418;
                                sumValue107 = sumValue81 + productValue419;
                                uint comparisonValue65 = ((((uint(sumValue79 >= 16.0) << 1u) | uint(sumValue79 < 0.0)) | (uint(sumValue80 < 0.0) << 2u)) | (uint(sumValue80 >= 16.0) << 3u)) | (uint(sumValue81 < 0.0) << 4u);
                                comparisonValue61 = intermediateValue[comparisonValue65 | (uint(sumValue81 >= 16.0) << 5u)];
                                comparisonValue62 = ((((comparisonValue65 | (uint(sumValue81 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue65 & 31u))) == 0u;
                                uint sampledTextureValue54;
                                if (comparisonValue62)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue115 + 4096u)).x & (1u << (comparisonValue61 & 31u))) == 0u)
                                    {
                                        intermediateValue214 = 0.0;
                                        intermediateValue216 = 0.0;
                                        intermediateValue218 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue54 = ((((uint(sumValue105 - (floor(sumValue105 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue106 - (floor(sumValue106 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue107 - (floor(sumValue107 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue115 + 4097u) + comparisonValue61)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue54 = ((((uint(sumValue79) << 8u) & 3840u) | (uint(sumValue80) & 15u)) | ((uint(sumValue81) << 4u) & 240u)) + bitwiseValue115;
                                }
                                uvec4 sampledTextureValue132 = texelFetch(voxelBuffer, int(sampledTextureValue54));
                                uint scalarValue287 = sampledTextureValue132.x;
                                if (scalarValue287 == 0u)
                                {
                                    intermediateValue214 = 0.0;
                                    intermediateValue216 = 0.0;
                                    intermediateValue218 = 0.0;
                                    break;
                                }
                                float bitwiseValue132 = float(scalarValue287 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue214 = bitwiseValue132 * float(scalarValue287 & 255u);
                                intermediateValue216 = bitwiseValue132 * float((scalarValue287 >> 8u) & 255u);
                                intermediateValue218 = bitwiseValue132 * float((scalarValue287 >> 16u) & 255u);
                                break;
                            }
                            float sumValue301 = sumValue62 + productValue417;
                            float sumValue302 = sumValue63 + productValue418;
                            float sumValue303 = sumValue64 + productValue419;
                            uint comparisonValue66 = ((((uint(sumValue62 >= 16.0) << 1u) | uint(sumValue62 < 0.0)) | (uint(sumValue63 < 0.0) << 2u)) | (uint(sumValue63 >= 16.0) << 3u)) | (uint(sumValue64 < 0.0) << 4u);
                            uint comparisonValue67 = comparisonValue66 | (uint(sumValue64 >= 16.0) << 5u);
                            uint sampledTextureValue58;
                            if ((((comparisonValue67 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue66 & 31u))) == 0u)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue115 + 4096u)).x & (1u << (intermediateValue[comparisonValue67] & 31u))) == 0u)
                                {
                                    intermediateValue204 = intermediateValue163;
                                    intermediateValue205 = intermediateValue164;
                                    intermediateValue206 = intermediateValue165;
                                    intermediateValue207 = intermediateValue208;
                                    intermediateValue209 = intermediateValue210;
                                    intermediateValue211 = intermediateValue212;
                                    intermediateValue213 = intermediateValue214;
                                    intermediateValue215 = intermediateValue216;
                                    intermediateValue217 = intermediateValue218;
                                    intermediateValue219 = 0.0;
                                    intermediateValue220 = 0.0;
                                    intermediateValue221 = 0.0;
                                    break;
                                }
                                sampledTextureValue58 = ((((uint(sumValue301 - (floor(sumValue301 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue302 - (floor(sumValue302 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue303 - (floor(sumValue303 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue115 + 4097u) + intermediateValue[comparisonValue67])).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue58 = ((((uint(sumValue62) << 8u) & 3840u) | (uint(sumValue63) & 15u)) | ((uint(sumValue64) << 4u) & 240u)) + bitwiseValue115;
                            }
                            uvec4 sampledTextureValue133 = texelFetch(voxelBuffer, int(sampledTextureValue58));
                            uint scalarValue288 = sampledTextureValue133.x;
                            if (scalarValue288 == 0u)
                            {
                                intermediateValue204 = intermediateValue163;
                                intermediateValue205 = intermediateValue164;
                                intermediateValue206 = intermediateValue165;
                                intermediateValue207 = intermediateValue208;
                                intermediateValue209 = intermediateValue210;
                                intermediateValue211 = intermediateValue212;
                                intermediateValue213 = intermediateValue214;
                                intermediateValue215 = intermediateValue216;
                                intermediateValue217 = intermediateValue218;
                                intermediateValue219 = 0.0;
                                intermediateValue220 = 0.0;
                                intermediateValue221 = 0.0;
                                break;
                            }
                            float bitwiseValue133 = float(scalarValue288 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue204 = intermediateValue163;
                            intermediateValue205 = intermediateValue164;
                            intermediateValue206 = intermediateValue165;
                            intermediateValue207 = intermediateValue208;
                            intermediateValue209 = intermediateValue210;
                            intermediateValue211 = intermediateValue212;
                            intermediateValue213 = intermediateValue214;
                            intermediateValue215 = intermediateValue216;
                            intermediateValue217 = intermediateValue218;
                            intermediateValue219 = bitwiseValue133 * float(scalarValue288 & 255u);
                            intermediateValue220 = bitwiseValue133 * float((scalarValue288 >> 8u) & 255u);
                            intermediateValue221 = bitwiseValue133 * float((scalarValue288 >> 16u) & 255u);
                            break;
                        }
                    }
                    branchMergedValue50 = (((intermediateValue207 * sumValue60) + (intermediateValue204 * sumValue59)) + (intermediateValue213 * sumValue61)) + (intermediateValue219 * intermediateValue118);
                    branchMergedValue56 = (((intermediateValue211 * sumValue60) + (intermediateValue206 * sumValue59)) + (intermediateValue217 * sumValue61)) + (intermediateValue221 * intermediateValue118);
                    branchMergedValue57 = (((intermediateValue209 * sumValue60) + (intermediateValue205 * sumValue59)) + (intermediateValue215 * sumValue61)) + (intermediateValue220 * intermediateValue118);
#endif
                }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue65 = intermediateValue88;
                intermediateValue66 = intermediateValue90;
                intermediateValue67 = intermediateValue92;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue63 = intermediateValue86;
                intermediateValue64 = intermediateValue88;
                intermediateValue65 = intermediateValue90;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue10 = branchMergedValue50;
                branchMergedValue19 = branchMergedValue56;
                branchMergedValue20 = branchMergedValue57;
#endif
            }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue34 = intermediateValue65;
            multiplyAddValue35 = intermediateValue66;
            multiplyAddValue36 = intermediateValue67;
        }
        float comparisonValue2;
        float intermediateValue43;
        float intermediateValue45;
        float intermediateValue47;
        if ((reinterpretedBits3 & 1u) == 1u)
        {
            vec4 reinterpretedBits9 = uintBitsToFloat(intermediateValue10.packedValues[scalarValue * 4u]);
            vec4 sampledTextureValue83 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord0.x, reinterpretedBits9.x, reinterpretedBits9.z), fma(varyingTexCoord0.y, reinterpretedBits9.y, reinterpretedBits9.w)));
            intermediateValue47 = sampledTextureValue83.x;
            comparisonValue2 = ((reinterpretedBits3 & 2u) == 2u) ? sampledTextureValue83.w : scalarValue96;
            intermediateValue43 = sampledTextureValue83.y;
            intermediateValue45 = sampledTextureValue83.z;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue37 = intermediateValue63;
            multiplyAddValue38 = intermediateValue64;
            multiplyAddValue39 = intermediateValue65;
        }
        float comparisonValue1;
        float intermediateValue41;
        float intermediateValue43;
        float intermediateValue45;
        if ((reinterpretedBits15 & 1u) == 1u)
        {
            vec4 reinterpretedBits21 = uintBitsToFloat(intermediateValue11.packedValues[scalarValue * 4u]);
            vec4 sampledTextureValue101 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord0.x, reinterpretedBits21.x, reinterpretedBits21.z), fma(varyingTexCoord0.y, reinterpretedBits21.y, reinterpretedBits21.w)));
            intermediateValue45 = sampledTextureValue101.x;
            comparisonValue1 = ((reinterpretedBits15 & 2u) == 2u) ? sampledTextureValue101.w : scalarValue186;
            intermediateValue41 = sampledTextureValue101.y;
            intermediateValue43 = sampledTextureValue101.z;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                branchMergedValue10 = 0.0;
                branchMergedValue19 = 0.0;
                branchMergedValue20 = 0.0;
            }
            intermediateValue46 = branchMergedValue20;
            intermediateValue47 = branchMergedValue19;
            intermediateValue48 = branchMergedValue10;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                branchMergedValue10 = 0.0;
                branchMergedValue19 = 0.0;
                branchMergedValue20 = 0.0;
            }
            intermediateValue41 = branchMergedValue10;
            intermediateValue42 = branchMergedValue20;
            intermediateValue43 = branchMergedValue19;
#endif
        }
        else
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue47 = reinterpretedBits1.w;
            comparisonValue2 = scalarValue96;
            intermediateValue43 = reinterpretedBits1.z;
            intermediateValue45 = reinterpretedBits1.y;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue45 = reinterpretedBits13.w;
            comparisonValue1 = scalarValue186;
            intermediateValue41 = reinterpretedBits13.z;
            intermediateValue43 = reinterpretedBits13.y;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            intermediateValue46 = intermediateValue23;
            intermediateValue47 = productValue29;
            intermediateValue48 = productValue30;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            intermediateValue41 = intermediateValue18;
            intermediateValue42 = productValue26;
            intermediateValue43 = productValue27;
#endif
        }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue117 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue118 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue119 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue21 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue22 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        vec3 vectorValue4 = vec3(comparisonValue117, comparisonValue118, comparisonValue119);
        float inverseLengthValue23 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        intermediateValue41 = comparisonValue2;
        intermediateValue42 = intermediateValue43;
        intermediateValue44 = intermediateValue45;
        intermediateValue46 = intermediateValue47;
        multiplyAddValue3 = fma(inverseLengthValue23 * comparisonValue119, multiplyAddValue36, fma(inverseLengthValue21 * varyingTangent0.z, multiplyAddValue35, multiplyAddValue34 * (inverseLengthValue22 * varyingBitangent0.z)));
        multiplyAddValue4 = fma(inverseLengthValue23 * comparisonValue118, multiplyAddValue36, fma(inverseLengthValue21 * varyingTangent0.y, multiplyAddValue35, multiplyAddValue34 * (inverseLengthValue22 * varyingBitangent0.y)));
        multiplyAddValue5 = fma(inverseLengthValue23 * comparisonValue117, multiplyAddValue36, fma(inverseLengthValue21 * varyingTangent0.x, multiplyAddValue35, multiplyAddValue34 * (inverseLengthValue22 * varyingBitangent0.x)));
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue117 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue118 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue119 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue21 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue22 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        vec3 vectorValue4 = vec3(comparisonValue117, comparisonValue118, comparisonValue119);
        float inverseLengthValue23 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        intermediateValue39 = comparisonValue1;
        intermediateValue40 = intermediateValue41;
        intermediateValue42 = intermediateValue43;
        intermediateValue44 = intermediateValue45;
        multiplyAddValue6 = fma(inverseLengthValue23 * comparisonValue119, multiplyAddValue39, fma(inverseLengthValue21 * varyingTangent0.z, multiplyAddValue38, multiplyAddValue37 * (inverseLengthValue22 * varyingBitangent0.z)));
        multiplyAddValue7 = fma(inverseLengthValue23 * comparisonValue118, multiplyAddValue39, fma(inverseLengthValue21 * varyingTangent0.y, multiplyAddValue38, multiplyAddValue37 * (inverseLengthValue22 * varyingBitangent0.y)));
        multiplyAddValue8 = fma(inverseLengthValue23 * comparisonValue117, multiplyAddValue39, fma(inverseLengthValue21 * varyingTangent0.x, multiplyAddValue38, multiplyAddValue37 * (inverseLengthValue22 * varyingBitangent0.x)));
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float productValue164 = fragmentVectorConstants1.packedValues[111u].y * fragmentVectorConstants1.packedValues[111u].y;
        float productValue165 = productValue164 * productValue164;
        float productValue166 = (((fragmentVectorConstants1.packedValues[76u].y * (productValue164 - productValue165)) + productValue165) * fragmentVectorConstants1.packedValues[111u].y) * fragmentVectorConstants1.packedValues[140u].w;
        float productValue167 = fragmentVectorConstants1.packedValues[123u].w * sumValue12;
        float dotProductValue13 = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float productValue168 = (fragmentVectorConstants1.packedValues[123u].z * intermediateValue15) * fragmentVectorConstants1.packedValues[63u].x;
        productValue36 = (((dotProductValue13 - exponentialValue) * fragmentVectorConstants1.packedValues[63u].y) + exponentialValue) * productValue168;
        productValue37 = (((dotProductValue13 - exponentialValue1) * fragmentVectorConstants1.packedValues[63u].y) + exponentialValue1) * productValue168;
        productValue38 = (((dotProductValue13 - exponentialValue2) * fragmentVectorConstants1.packedValues[63u].y) + exponentialValue2) * productValue168;
        productValue39 = (spvNMax((productValue166 * fragmentVectorConstants1.packedValues[140u].x) + (fragmentVectorConstants1.packedValues[58u].w * intermediateValue46), fragmentVectorConstants1.packedValues[66u].x * fragmentVectorConstants1.packedValues[66u].w) * exponentialValue) * productValue167;
        productValue40 = (spvNMax((productValue166 * fragmentVectorConstants1.packedValues[140u].y) + (fragmentVectorConstants1.packedValues[58u].w * intermediateValue47), fragmentVectorConstants1.packedValues[66u].y * fragmentVectorConstants1.packedValues[66u].w) * exponentialValue1) * productValue167;
        productValue41 = (spvNMax((productValue166 * fragmentVectorConstants1.packedValues[140u].z) + (fragmentVectorConstants1.packedValues[58u].w * intermediateValue48), fragmentVectorConstants1.packedValues[66u].z * fragmentVectorConstants1.packedValues[66u].w) * exponentialValue2) * productValue167;
        intermediateValue28 = intermediateValue29;
        intermediateValue30 = intermediateValue31;
        intermediateValue32 = intermediateValue33;
        intermediateValue34 = intermediateValue35;
        intermediateValue36 = intermediateValue37;
        intermediateValue38 = intermediateValue39;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float productValue426 = fragmentVectorConstants1.packedValues[110u].y * fragmentVectorConstants1.packedValues[110u].y;
        float productValue427 = productValue426 * productValue426;
        float productValue428 = (((fragmentVectorConstants1.packedValues[75u].y * (productValue426 - productValue427)) + productValue427) * fragmentVectorConstants1.packedValues[110u].y) * fragmentVectorConstants1.packedValues[139u].w;
        float productValue429 = fragmentVectorConstants1.packedValues[122u].w * sumValue278;
        float dotProductValue13 = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float productValue430 = (fragmentVectorConstants1.packedValues[122u].z * intermediateValue10) * fragmentVectorConstants1.packedValues[63u].x;
        productValue33 = (((dotProductValue13 - exponentialValue) * fragmentVectorConstants1.packedValues[63u].y) + exponentialValue) * productValue430;
        productValue34 = (((dotProductValue13 - exponentialValue1) * fragmentVectorConstants1.packedValues[63u].y) + exponentialValue1) * productValue430;
        productValue35 = (((dotProductValue13 - exponentialValue2) * fragmentVectorConstants1.packedValues[63u].y) + exponentialValue2) * productValue430;
        productValue36 = (spvNMax((productValue428 * fragmentVectorConstants1.packedValues[139u].x) + (fragmentVectorConstants1.packedValues[58u].w * intermediateValue41), fragmentVectorConstants1.packedValues[65u].x * fragmentVectorConstants1.packedValues[65u].w) * exponentialValue) * productValue429;
        productValue37 = (spvNMax((productValue428 * fragmentVectorConstants1.packedValues[139u].y) + (fragmentVectorConstants1.packedValues[58u].w * intermediateValue42), fragmentVectorConstants1.packedValues[65u].y * fragmentVectorConstants1.packedValues[65u].w) * exponentialValue1) * productValue429;
        productValue38 = (spvNMax((productValue428 * fragmentVectorConstants1.packedValues[139u].z) + (fragmentVectorConstants1.packedValues[58u].w * intermediateValue43), fragmentVectorConstants1.packedValues[65u].z * fragmentVectorConstants1.packedValues[65u].w) * exponentialValue2) * productValue429;
        intermediateValue23 = intermediateValue24;
        intermediateValue25 = intermediateValue26;
        intermediateValue27 = intermediateValue28;
        intermediateValue29 = intermediateValue30;
        intermediateValue31 = intermediateValue32;
        intermediateValue33 = intermediateValue34;
#endif
    }
    else
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue41 = 0.0;
        intermediateValue42 = 0.0;
        intermediateValue44 = 1.0;
        intermediateValue46 = 0.0;
        multiplyAddValue3 = 0.0;
        multiplyAddValue4 = 1.0;
        multiplyAddValue5 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue39 = 0.0;
        intermediateValue40 = 0.0;
        intermediateValue42 = 1.0;
        intermediateValue44 = 0.0;
        multiplyAddValue6 = 0.0;
        multiplyAddValue7 = 1.0;
        multiplyAddValue8 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue36 = 0.0;
        productValue37 = 0.0;
        productValue38 = 0.0;
        productValue39 = 0.0;
        productValue40 = 0.0;
        productValue41 = 0.0;
        intermediateValue28 = 0.0;
        intermediateValue30 = 0.0;
        intermediateValue32 = 0.0;
        intermediateValue34 = 0.0;
        intermediateValue36 = 0.0;
        intermediateValue38 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue33 = 0.0;
        productValue34 = 0.0;
        productValue35 = 0.0;
        productValue36 = 0.0;
        productValue37 = 0.0;
        productValue38 = 0.0;
        intermediateValue23 = 0.0;
        intermediateValue25 = 0.0;
        intermediateValue27 = 0.0;
        intermediateValue29 = 0.0;
        intermediateValue31 = 0.0;
        intermediateValue33 = 0.0;
#endif
    }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue74 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue75 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue76 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue77 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue78 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue77, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue76, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue74, multiplyAddValue75 * fragmentVectorConstants1.packedValues[1u].w)));
    float multiplyAddValue79 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue77, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue76, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue74, multiplyAddValue75 * fragmentVectorConstants1.packedValues[1u].x))) / multiplyAddValue78;
    float multiplyAddValue80 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue77, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue76, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue74, multiplyAddValue75 * fragmentVectorConstants1.packedValues[1u].y))) / multiplyAddValue78;
    float multiplyAddValue92 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue77, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue76, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue74, multiplyAddValue75 * fragmentVectorConstants1.packedValues[1u].z))) / multiplyAddValue78;
    vec3 vectorValue5 = vec3(multiplyAddValue5, multiplyAddValue4, multiplyAddValue3);
    float inverseLengthValue24 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue233 = inverseLengthValue24 * multiplyAddValue5;
    float productValue234 = inverseLengthValue24 * multiplyAddValue4;
    float productValue235 = inverseLengthValue24 * multiplyAddValue3;
    float multiplyAddValue93 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue235, fma(fragmentVectorConstants1.packedValues[4u].x, productValue233, productValue234 * fragmentVectorConstants1.packedValues[5u].x));
    float multiplyAddValue94 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue235, fma(fragmentVectorConstants1.packedValues[4u].y, productValue233, productValue234 * fragmentVectorConstants1.packedValues[5u].y));
    float multiplyAddValue95 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue235, fma(fragmentVectorConstants1.packedValues[4u].z, productValue233, productValue234 * fragmentVectorConstants1.packedValues[5u].z));
    float sumValue6 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[115u].x;
    float sumValue7 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[115u].y;
    float sumValue8 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[115u].z;
    float scalarValue113 = dFdxCoarse(multiplyAddValue76);
    float scalarValue114 = dFdxCoarse(multiplyAddValue74);
    float scalarValue115 = dFdxCoarse(multiplyAddValue75);
    vec3 vectorValue6 = vec3(scalarValue113, scalarValue114, scalarValue115);
    float inverseLengthValue25 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
    float productValue236 = inverseLengthValue25 * scalarValue113;
    float productValue237 = inverseLengthValue25 * scalarValue114;
    float productValue238 = inverseLengthValue25 * scalarValue115;
    float scalarValue116 = dFdyCoarse(-multiplyAddValue75);
    float scalarValue117 = dFdyCoarse(-multiplyAddValue76);
    float scalarValue118 = dFdyCoarse(-multiplyAddValue74);
    vec3 vectorValue7 = vec3(scalarValue116, scalarValue117, scalarValue118);
    float inverseLengthValue26 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue239 = inverseLengthValue26 * scalarValue116;
    float productValue240 = inverseLengthValue26 * scalarValue117;
    float productValue241 = inverseLengthValue26 * scalarValue118;
    float multiplyAddValue96 = fma(productValue238, productValue240, -(productValue236 * productValue239));
    float multiplyAddValue97 = fma(productValue236, productValue241, -(productValue237 * productValue240));
    float multiplyAddValue98 = fma(productValue237, productValue239, -(productValue238 * productValue241));
    vec3 vectorValue8 = vec3(multiplyAddValue96, multiplyAddValue97, multiplyAddValue98);
    float inverseLengthValue27 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
    float productValue242 = inverseLengthValue27 * multiplyAddValue96;
    float productValue243 = inverseLengthValue27 * multiplyAddValue97;
    float productValue244 = inverseLengthValue27 * multiplyAddValue98;
    float multiplyAddValue99 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue244, fma(fragmentVectorConstants1.packedValues[8u].x, productValue242, productValue243 * fragmentVectorConstants1.packedValues[9u].x));
    float multiplyAddValue100 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue244, fma(fragmentVectorConstants1.packedValues[8u].y, productValue242, productValue243 * fragmentVectorConstants1.packedValues[9u].y));
    float multiplyAddValue101 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue244, fma(fragmentVectorConstants1.packedValues[8u].z, productValue242, productValue243 * fragmentVectorConstants1.packedValues[9u].z));
    vec3 vectorValue9 = vec3(multiplyAddValue99, multiplyAddValue100, multiplyAddValue101);
    float inverseLengthValue28 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
    float quotientValue25 = roundEven((inverseLengthValue28 * multiplyAddValue99) / fragmentScalarConstants1.packedValues[548u]) * fragmentScalarConstants1.packedValues[548u];
    float quotientValue26 = roundEven((inverseLengthValue28 * multiplyAddValue100) / fragmentScalarConstants1.packedValues[548u]) * fragmentScalarConstants1.packedValues[548u];
    float quotientValue27 = roundEven((inverseLengthValue28 * multiplyAddValue101) / fragmentScalarConstants1.packedValues[548u]) * fragmentScalarConstants1.packedValues[548u];
    vec3 vectorValue10 = vec3(quotientValue25, quotientValue26, quotientValue27);
    float inverseLengthValue29 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
    float productValue245 = inverseLengthValue29 * quotientValue25;
    float productValue246 = inverseLengthValue29 * quotientValue26;
    float productValue247 = inverseLengthValue29 * quotientValue27;
    float scalarValue119 = -fragmentScalarConstants1.packedValues[538u];
    float multiplyAddValue102 = fma(fragmentScalarConstants1.packedValues[538u], 0.5, -fma(scalarValue119, floor(sumValue6 / fragmentScalarConstants1.packedValues[538u]), sumValue6));
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[538u], 0.5, -fma(scalarValue119, floor(sumValue7 / fragmentScalarConstants1.packedValues[538u]), sumValue7));
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[538u], 0.5, -fma(scalarValue119, floor(sumValue8 / fragmentScalarConstants1.packedValues[538u]), sumValue8));
    float scalarValue120 = -rdDot3Precise2(vec3(multiplyAddValue102, multiplyAddValue103, multiplyAddValue104), vec3(productValue245, productValue246, productValue247));
    float multiplyAddValue105 = (sumValue6 + fma(scalarValue120, productValue245, multiplyAddValue102)) + fragmentVectorConstants1.packedValues[115u].x;
    float multiplyAddValue106 = (sumValue7 + fma(scalarValue120, productValue246, multiplyAddValue103)) + fragmentVectorConstants1.packedValues[115u].y;
    float multiplyAddValue107 = (sumValue8 + fma(scalarValue120, productValue247, multiplyAddValue104)) + fragmentVectorConstants1.packedValues[115u].z;
    bool bitwiseValue35 = (((fragmentScalarConstants1.packedValues[249u] + fragmentScalarConstants1.packedValues[248u]) + fragmentScalarConstants1.packedValues[250u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[444u] > 9.9999997473787516355514526367188e-05);
    float productValue248 = fragmentScalarConstants1.packedValues[444u] * fragmentScalarConstants1.packedValues[444u];
    float comparisonValue120 = bitwiseValue35 ? spvNMin(productValue248, 1.0) : fragmentVectorConstants1.packedValues[62u].x;
    float multiplyAddValue108 = bitwiseValue35 ? spvNMin(fma(fma(productValue248, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue248, 1.0) : fragmentVectorConstants1.packedValues[62u].y;
    float multiplyAddValue109 = bitwiseValue35 ? spvNMin(fma(productValue248 * productValue248, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue248, 1.0) : fragmentVectorConstants1.packedValues[62u].z;
    float sumValue136 = 1.0 - intermediateValue46;
    float multiplyAddValue110 = fma(sumValue136, 0.039999999105930328369140625, exponentialValue6 * intermediateValue46);
    float multiplyAddValue111 = fma(sumValue136, 0.039999999105930328369140625, exponentialValue7 * intermediateValue46);
    float multiplyAddValue112 = fma(sumValue136, 0.039999999105930328369140625, exponentialValue8 * intermediateValue46);
    float exponentialValue3;
    if ((fragmentScalarConstants1.packedValues[448u] != 0.0) && (fragmentScalarConstants1.packedValues[451u] != 0.0))
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue74 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue75 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue76 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue77 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue78 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue77, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue76, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue74, multiplyAddValue75 * fragmentVectorConstants1.packedValues[1u].w)));
    float multiplyAddValue79 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue77, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue76, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue74, multiplyAddValue75 * fragmentVectorConstants1.packedValues[1u].x))) / multiplyAddValue78;
    float multiplyAddValue80 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue77, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue76, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue74, multiplyAddValue75 * fragmentVectorConstants1.packedValues[1u].y))) / multiplyAddValue78;
    float multiplyAddValue92 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue77, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue76, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue74, multiplyAddValue75 * fragmentVectorConstants1.packedValues[1u].z))) / multiplyAddValue78;
    vec3 vectorValue23 = vec3(multiplyAddValue8, multiplyAddValue7, multiplyAddValue6);
    float inverseLengthValue39 = inversesqrt(rdDot3Precise2(vectorValue23, vectorValue23));
    float productValue312 = inverseLengthValue39 * multiplyAddValue8;
    float productValue313 = inverseLengthValue39 * multiplyAddValue7;
    float productValue314 = inverseLengthValue39 * multiplyAddValue6;
    float multiplyAddValue264 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue314, fma(fragmentVectorConstants1.packedValues[4u].x, productValue312, productValue313 * fragmentVectorConstants1.packedValues[5u].x));
    float multiplyAddValue265 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue314, fma(fragmentVectorConstants1.packedValues[4u].y, productValue312, productValue313 * fragmentVectorConstants1.packedValues[5u].y));
    float multiplyAddValue266 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue314, fma(fragmentVectorConstants1.packedValues[4u].z, productValue312, productValue313 * fragmentVectorConstants1.packedValues[5u].z));
    float sumValue217 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[114u].x;
    float sumValue218 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[114u].y;
    float sumValue219 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[114u].z;
    float scalarValue113 = dFdxCoarse(multiplyAddValue76);
    float scalarValue114 = dFdxCoarse(multiplyAddValue74);
    float scalarValue115 = dFdxCoarse(multiplyAddValue75);
    vec3 vectorValue6 = vec3(scalarValue113, scalarValue114, scalarValue115);
    float inverseLengthValue25 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
    float productValue236 = inverseLengthValue25 * scalarValue113;
    float productValue237 = inverseLengthValue25 * scalarValue114;
    float productValue238 = inverseLengthValue25 * scalarValue115;
    float scalarValue116 = dFdyCoarse(-multiplyAddValue75);
    float scalarValue117 = dFdyCoarse(-multiplyAddValue76);
    float scalarValue118 = dFdyCoarse(-multiplyAddValue74);
    vec3 vectorValue7 = vec3(scalarValue116, scalarValue117, scalarValue118);
    float inverseLengthValue26 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue239 = inverseLengthValue26 * scalarValue116;
    float productValue240 = inverseLengthValue26 * scalarValue117;
    float productValue241 = inverseLengthValue26 * scalarValue118;
    float multiplyAddValue96 = fma(productValue238, productValue240, -(productValue236 * productValue239));
    float multiplyAddValue97 = fma(productValue236, productValue241, -(productValue237 * productValue240));
    float multiplyAddValue98 = fma(productValue237, productValue239, -(productValue238 * productValue241));
    vec3 vectorValue8 = vec3(multiplyAddValue96, multiplyAddValue97, multiplyAddValue98);
    float inverseLengthValue27 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
    float productValue242 = inverseLengthValue27 * multiplyAddValue96;
    float productValue243 = inverseLengthValue27 * multiplyAddValue97;
    float productValue244 = inverseLengthValue27 * multiplyAddValue98;
    float multiplyAddValue99 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue244, fma(fragmentVectorConstants1.packedValues[8u].x, productValue242, productValue243 * fragmentVectorConstants1.packedValues[9u].x));
    float multiplyAddValue100 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue244, fma(fragmentVectorConstants1.packedValues[8u].y, productValue242, productValue243 * fragmentVectorConstants1.packedValues[9u].y));
    float multiplyAddValue101 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue244, fma(fragmentVectorConstants1.packedValues[8u].z, productValue242, productValue243 * fragmentVectorConstants1.packedValues[9u].z));
    vec3 vectorValue9 = vec3(multiplyAddValue99, multiplyAddValue100, multiplyAddValue101);
    float inverseLengthValue28 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
    float quotientValue39 = roundEven((inverseLengthValue28 * multiplyAddValue99) / fragmentScalarConstants1.packedValues[544u]) * fragmentScalarConstants1.packedValues[544u];
    float quotientValue40 = roundEven((inverseLengthValue28 * multiplyAddValue100) / fragmentScalarConstants1.packedValues[544u]) * fragmentScalarConstants1.packedValues[544u];
    float quotientValue41 = roundEven((inverseLengthValue28 * multiplyAddValue101) / fragmentScalarConstants1.packedValues[544u]) * fragmentScalarConstants1.packedValues[544u];
    vec3 vectorValue24 = vec3(quotientValue39, quotientValue40, quotientValue41);
    float inverseLengthValue40 = inversesqrt(rdDot3Precise2(vectorValue24, vectorValue24));
    float productValue315 = inverseLengthValue40 * quotientValue39;
    float productValue316 = inverseLengthValue40 * quotientValue40;
    float productValue317 = inverseLengthValue40 * quotientValue41;
    float scalarValue200 = -fragmentScalarConstants1.packedValues[534u];
    float multiplyAddValue267 = fma(fragmentScalarConstants1.packedValues[534u], 0.5, -fma(scalarValue200, floor(sumValue217 / fragmentScalarConstants1.packedValues[534u]), sumValue217));
    float multiplyAddValue268 = fma(fragmentScalarConstants1.packedValues[534u], 0.5, -fma(scalarValue200, floor(sumValue218 / fragmentScalarConstants1.packedValues[534u]), sumValue218));
    float multiplyAddValue269 = fma(fragmentScalarConstants1.packedValues[534u], 0.5, -fma(scalarValue200, floor(sumValue219 / fragmentScalarConstants1.packedValues[534u]), sumValue219));
    float scalarValue201 = -rdDot3Precise2(vec3(multiplyAddValue267, multiplyAddValue268, multiplyAddValue269), vec3(productValue315, productValue316, productValue317));
    float multiplyAddValue270 = (sumValue217 + fma(scalarValue201, productValue315, multiplyAddValue267)) + fragmentVectorConstants1.packedValues[114u].x;
    float multiplyAddValue271 = (sumValue218 + fma(scalarValue201, productValue316, multiplyAddValue268)) + fragmentVectorConstants1.packedValues[114u].y;
    float multiplyAddValue272 = (sumValue219 + fma(scalarValue201, productValue317, multiplyAddValue269)) + fragmentVectorConstants1.packedValues[114u].z;
    bool bitwiseValue71 = (((fragmentScalarConstants1.packedValues[249u] + fragmentScalarConstants1.packedValues[248u]) + fragmentScalarConstants1.packedValues[250u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[440u] > 9.9999997473787516355514526367188e-05);
    float productValue318 = fragmentScalarConstants1.packedValues[440u] * fragmentScalarConstants1.packedValues[440u];
    float comparisonValue193 = bitwiseValue71 ? spvNMin(productValue318, 1.0) : fragmentVectorConstants1.packedValues[62u].x;
    float multiplyAddValue273 = bitwiseValue71 ? spvNMin(fma(fma(productValue318, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue318, 1.0) : fragmentVectorConstants1.packedValues[62u].y;
    float multiplyAddValue274 = bitwiseValue71 ? spvNMin(fma(productValue318 * productValue318, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue318, 1.0) : fragmentVectorConstants1.packedValues[62u].z;
    float sumValue194 = 1.0 - intermediateValue44;
    float multiplyAddValue275 = fma(sumValue194, 0.039999999105930328369140625, multiplyAddValue249 * intermediateValue44);
    float multiplyAddValue276 = fma(sumValue194, 0.039999999105930328369140625, multiplyAddValue250 * intermediateValue44);
    float multiplyAddValue277 = fma(sumValue194, 0.039999999105930328369140625, multiplyAddValue251 * intermediateValue44);
    float exponentialValue;
    if ((fragmentScalarConstants1.packedValues[444u] != 0.0) && (fragmentScalarConstants1.packedValues[447u] != 0.0))
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue87 = ((productValue39 + productValue36) + intermediateValue28) + intermediateValue34;
    float sumValue89 = ((productValue40 + productValue37) + intermediateValue30) + intermediateValue36;
    float sumValue90 = ((productValue41 + productValue38) + intermediateValue32) + intermediateValue38;
    float sumValue99 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue100 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue108 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue15 = inversesqrt(dot(vec3(sumValue99, sumValue100, sumValue108), vec3(sumValue99, sumValue100, sumValue108)));
    float productValue171 = inverseLengthValue15 * sumValue99;
    float productValue174 = inverseLengthValue15 * sumValue100;
    float productValue175 = inverseLengthValue15 * sumValue108;
    bool comparisonValue68 = fragmentVectorConstants1.packedValues[72u].y != 0.0;
    bool comparisonValue69 = fragmentVectorConstants1.packedValues[123u].w != 0.0;
    float productValue47;
    float productValue48;
    float productValue49;
    if ((comparisonValue68 && (fragmentVectorConstants1.packedValues[72u].z != 0.0)) && comparisonValue69)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue304 = ((productValue36 + productValue33) + intermediateValue23) + intermediateValue29;
    float sumValue305 = ((productValue37 + productValue34) + intermediateValue25) + intermediateValue31;
    float sumValue306 = ((productValue38 + productValue35) + intermediateValue27) + intermediateValue33;
    float sumValue99 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue100 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue108 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue15 = inversesqrt(dot(vec3(sumValue99, sumValue100, sumValue108), vec3(sumValue99, sumValue100, sumValue108)));
    float productValue171 = inverseLengthValue15 * sumValue99;
    float productValue174 = inverseLengthValue15 * sumValue100;
    float productValue175 = inverseLengthValue15 * sumValue108;
    bool comparisonValue275 = fragmentVectorConstants1.packedValues[71u].y != 0.0;
    bool comparisonValue276 = fragmentVectorConstants1.packedValues[122u].w != 0.0;
    float productValue44;
    float productValue45;
    float productValue46;
    if ((comparisonValue275 && (fragmentVectorConstants1.packedValues[71u].z != 0.0)) && comparisonValue276)
#endif
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue84 = texture(sampler2DArray(materialTexture6, textureSampler6), vec3((varyingTexCoord3.x - fragmentScalarConstants1.packedValues[460u]) * fragmentScalarConstants1.packedValues[449u], (varyingTexCoord3.z - fragmentScalarConstants1.packedValues[462u]) * fragmentScalarConstants1.packedValues[449u], fragmentScalarConstants1.packedValues[453u]));
        float scalarValue121 = sampledTextureValue84.x;
        exponentialValue3 = exp2(log2((scalarValue121 + scalarValue121) * spvNClamp(productValue234, 0.0, 1.0)) * fragmentScalarConstants1.packedValues[450u]) * (fragmentScalarConstants1.packedValues[450u] + 1.0);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue102 = texture(sampler2DArray(materialTexture6, textureSampler6), vec3((varyingTexCoord3.x - fragmentScalarConstants1.packedValues[456u]) * fragmentScalarConstants1.packedValues[445u], (varyingTexCoord3.z - fragmentScalarConstants1.packedValues[458u]) * fragmentScalarConstants1.packedValues[445u], fragmentScalarConstants1.packedValues[449u]));
        float scalarValue202 = sampledTextureValue102.x;
        exponentialValue = exp2(log2((scalarValue202 + scalarValue202) * spvNClamp(productValue313, 0.0, 1.0)) * fragmentScalarConstants1.packedValues[446u]) * (fragmentScalarConstants1.packedValues[446u] + 1.0);
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue47 = spvNMax(fragmentVectorConstants1.packedValues[58u].w + (fragmentVectorConstants1.packedValues[140u].x * fragmentVectorConstants1.packedValues[140u].w), fragmentVectorConstants1.packedValues[66u].x * fragmentVectorConstants1.packedValues[66u].w) * fragmentVectorConstants1.packedValues[72u].z;
        productValue48 = spvNMax(fragmentVectorConstants1.packedValues[58u].w + (fragmentVectorConstants1.packedValues[140u].y * fragmentVectorConstants1.packedValues[140u].w), fragmentVectorConstants1.packedValues[66u].y * fragmentVectorConstants1.packedValues[66u].w) * fragmentVectorConstants1.packedValues[72u].z;
        productValue49 = spvNMax(fragmentVectorConstants1.packedValues[58u].w + (fragmentVectorConstants1.packedValues[140u].z * fragmentVectorConstants1.packedValues[140u].w), fragmentVectorConstants1.packedValues[66u].z * fragmentVectorConstants1.packedValues[66u].w) * fragmentVectorConstants1.packedValues[72u].z;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue44 = spvNMax(fragmentVectorConstants1.packedValues[58u].w + (fragmentVectorConstants1.packedValues[139u].x * fragmentVectorConstants1.packedValues[139u].w), fragmentVectorConstants1.packedValues[65u].x * fragmentVectorConstants1.packedValues[65u].w) * fragmentVectorConstants1.packedValues[71u].z;
        productValue45 = spvNMax(fragmentVectorConstants1.packedValues[58u].w + (fragmentVectorConstants1.packedValues[139u].y * fragmentVectorConstants1.packedValues[139u].w), fragmentVectorConstants1.packedValues[65u].y * fragmentVectorConstants1.packedValues[65u].w) * fragmentVectorConstants1.packedValues[71u].z;
        productValue46 = spvNMax(fragmentVectorConstants1.packedValues[58u].w + (fragmentVectorConstants1.packedValues[139u].z * fragmentVectorConstants1.packedValues[139u].w), fragmentVectorConstants1.packedValues[65u].z * fragmentVectorConstants1.packedValues[65u].w) * fragmentVectorConstants1.packedValues[71u].z;
#endif
    }
    else
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        exponentialValue3 = 1.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        exponentialValue = 1.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue47 = 0.0;
        productValue48 = 0.0;
        productValue49 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue44 = 0.0;
        productValue45 = 0.0;
        productValue46 = 0.0;
#endif
    }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec3 vectorValue11 = vec3(multiplyAddValue74, multiplyAddValue75, multiplyAddValue76);
    float nonlinearValue5 = sqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    vec3 vectorValue12 = vec3(multiplyAddValue93, multiplyAddValue94, multiplyAddValue95);
    float multiplyAddValue37;
    float multiplyAddValue38;
    float multiplyAddValue39;
    float intermediateValue68;
    float intermediateValue69;
    float intermediateValue70;
    float multiplyAddValue40;
    float multiplyAddValue41;
    float multiplyAddValue42;
    float intermediateValue71;
    float intermediateValue72;
    float intermediateValue73;
    if (multiplyAddValue92 != 1.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec3 vectorValue11 = vec3(multiplyAddValue74, multiplyAddValue75, multiplyAddValue76);
    float nonlinearValue5 = sqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    vec3 vectorValue25 = vec3(multiplyAddValue264, multiplyAddValue265, multiplyAddValue266);
    float multiplyAddValue40;
    float multiplyAddValue41;
    float multiplyAddValue42;
    float intermediateValue66;
    float intermediateValue67;
    float intermediateValue68;
    float multiplyAddValue43;
    float multiplyAddValue44;
    float multiplyAddValue45;
    float intermediateValue69;
    float intermediateValue70;
    float intermediateValue71;
    if (multiplyAddValue92 != 1.0)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue70 = fragmentVectorConstants1.packedValues[146u].x != 0.0;
    bool comparisonValue96 = fragmentVectorConstants1.packedValues[72u].x != 0.0;
    float intermediateValue53;
    float intermediateValue54;
    float intermediateValue55;
    float intermediateValue56;
    if (comparisonValue96)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue277 = fragmentVectorConstants1.packedValues[145u].x != 0.0;
    bool comparisonValue278 = fragmentVectorConstants1.packedValues[71u].x != 0.0;
    float intermediateValue48;
    float intermediateValue49;
    float intermediateValue50;
    float intermediateValue51;
    if (comparisonValue278)
#endif
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue3;
        float quotientValue4;
        float quotientValue5;
        float multiplyAddValue43;
        float multiplyAddValue44;
        float multiplyAddValue45;
        if (!((fragmentScalarConstants1.packedValues[496u] != 0.0) && (abs(fragmentScalarConstants1.packedValues[445u]) < 9.9999997473787516355514526367188e-05)))
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue3;
        float quotientValue4;
        float quotientValue5;
        float multiplyAddValue46;
        float multiplyAddValue47;
        float multiplyAddValue48;
        if (!((fragmentScalarConstants1.packedValues[492u] != 0.0) && (abs(fragmentScalarConstants1.packedValues[441u]) < 9.9999997473787516355514526367188e-05)))
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue21 = spvNClamp(((fragmentVectorConstants1.packedValues[138u].x - fragmentVectorConstants1.packedValues[68u].x) + (nonlinearValue / fragmentVectorConstants1.packedValues[68u].z)) * fragmentVectorConstants1.packedValues[68u].y, 0.0, 1.0);
        float branchMergedValue11;
        float branchMergedValue21;
        float branchMergedValue22;
        float branchMergedValue23;
        if (quotientValue21 > 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue63 = spvNClamp(((fragmentVectorConstants1.packedValues[137u].x - fragmentVectorConstants1.packedValues[67u].x) + (nonlinearValue / fragmentVectorConstants1.packedValues[67u].z)) * fragmentVectorConstants1.packedValues[67u].y, 0.0, 1.0);
        float branchMergedValue11;
        float branchMergedValue21;
        float branchMergedValue22;
        float branchMergedValue23;
        if (quotientValue63 > 0.0)
#endif
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float sumValue137 = nonlinearValue5 + 9.9999997473787516355514526367188e-05;
            float productValue249 = intermediateValue41 * fragmentScalarConstants1.packedValues[564u];
            float multiplyAddValue62;
            float intermediateValue107;
            if (uint(int(fragmentScalarConstants1.packedValues[240u])) == 1u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float sumValue137 = nonlinearValue5 + 9.9999997473787516355514526367188e-05;
            float productValue319 = intermediateValue39 * fragmentScalarConstants1.packedValues[560u];
            float multiplyAddValue65;
            float intermediateValue105;
            if (uint(int(fragmentScalarConstants1.packedValues[240u])) == 1u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue51;
            float branchMergedValue58;
            float branchMergedValue59;
            float branchMergedValue60;
            if (comparisonValue68)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue51;
            float branchMergedValue58;
            float branchMergedValue59;
            float branchMergedValue60;
            if (comparisonValue275)
#endif
            {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool conditionValue12 = int(uint(int(fragmentScalarConstants1.packedValues[537u]))) > int(0u);
                float multiplyAddValue113 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[519u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[518u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[516u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[517u])));
                float multiplyAddValue114 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[519u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[518u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[516u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[517u])));
                float multiplyAddValue115 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[519u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[518u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[516u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[517u])));
                vec3 vectorValue13 = vec3(multiplyAddValue113, multiplyAddValue114, multiplyAddValue115);
                float inverseLengthValue30 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
                float productValue250 = spvNMax(rdDot3Precise2(vectorValue12, vec3(inverseLengthValue30 * multiplyAddValue113, inverseLengthValue30 * multiplyAddValue114, inverseLengthValue30 * multiplyAddValue115)), 0.0);
                float sumValue138 = spvNMax(1.0 - productValue250, 0.0);
                float multiplyAddValue116 = fma(productValue233 * fragmentScalarConstants1.packedValues[559u], sumValue138, conditionValue12 ? multiplyAddValue105 : varyingTexCoord3.x);
                float multiplyAddValue117 = fma(productValue234 * fragmentScalarConstants1.packedValues[559u], sumValue138, conditionValue12 ? multiplyAddValue106 : varyingTexCoord3.y);
                float multiplyAddValue118 = fma(productValue235 * fragmentScalarConstants1.packedValues[559u], sumValue138, conditionValue12 ? multiplyAddValue107 : varyingTexCoord3.z);
                uint scalarValue122 = uint(int(rdDot4Precise(vec4(spvNClamp(fragmentVectorConstants1.packedValues[78u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[78u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[78u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[78u].w, 0.0, 1.0)), vec4(1.0))));
                bool comparisonValue121 = fragmentScalarConstants1.packedValues[536u] != 0.0;
                float intermediateValue108;
                float intermediateValue138;
                intermediateValue138 = 1.0;
                intermediateValue108 = 1.0;
                uint sumValue33;
                float intermediateValue139;
                float intermediateValue140;
                uint intermediateValue142;
                uint scalarValue27 = 0u;
                uint scalarValue28 = 0u;
                for (;;)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool conditionValue31 = int(uint(int(fragmentScalarConstants1.packedValues[533u]))) > int(0u);
                float multiplyAddValue278 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[515u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[514u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[512u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[513u])));
                float multiplyAddValue279 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[515u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[514u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[512u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[513u])));
                float multiplyAddValue280 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[515u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[514u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[512u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[513u])));
                vec3 vectorValue26 = vec3(multiplyAddValue278, multiplyAddValue279, multiplyAddValue280);
                float inverseLengthValue41 = inversesqrt(rdDot3Precise2(vectorValue26, vectorValue26));
                float productValue320 = spvNMax(rdDot3Precise2(vectorValue25, vec3(inverseLengthValue41 * multiplyAddValue278, inverseLengthValue41 * multiplyAddValue279, inverseLengthValue41 * multiplyAddValue280)), 0.0);
                float sumValue220 = spvNMax(1.0 - productValue320, 0.0);
                float multiplyAddValue281 = fma(productValue312 * fragmentScalarConstants1.packedValues[555u], sumValue220, conditionValue31 ? multiplyAddValue270 : varyingTexCoord3.x);
                float multiplyAddValue282 = fma(productValue313 * fragmentScalarConstants1.packedValues[555u], sumValue220, conditionValue31 ? multiplyAddValue271 : varyingTexCoord3.y);
                float multiplyAddValue283 = fma(productValue314 * fragmentScalarConstants1.packedValues[555u], sumValue220, conditionValue31 ? multiplyAddValue272 : varyingTexCoord3.z);
                uint scalarValue203 = uint(int(rdDot4Precise(vec4(spvNClamp(fragmentVectorConstants1.packedValues[77u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[77u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[77u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[77u].w, 0.0, 1.0)), vec4(1.0))));
                bool comparisonValue194 = fragmentScalarConstants1.packedValues[532u] != 0.0;
                float intermediateValue106;
                float intermediateValue136;
                intermediateValue136 = 1.0;
                intermediateValue106 = 1.0;
                uint sumValue33;
                float intermediateValue137;
                float intermediateValue138;
                uint intermediateValue140;
                uint scalarValue27 = 0u;
                uint scalarValue28 = 0u;
                for (;;)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue51 = spvNMax(productValue49, 1.0) * fragmentVectorConstants1.packedValues[73u].z;
                branchMergedValue58 = spvNMax(productValue48, 1.0) * fragmentVectorConstants1.packedValues[73u].y;
                branchMergedValue59 = fragmentVectorConstants1.packedValues[73u].x * spvNMax(productValue47, 1.0);
                branchMergedValue60 = quotientValue21;
            }
            else
            {
                float quotientValue22 = spvNClamp(((productValue174 - fragmentVectorConstants1.packedValues[130u].x) + fragmentVectorConstants1.packedValues[130u].w) / (fragmentVectorConstants1.packedValues[130u].z - fragmentVectorConstants1.packedValues[130u].x), 0.0, 1.0);
                float productValue178 = 1.0 - ((quotientValue22 * quotientValue22) * (3.0 - (quotientValue22 * 2.0)));
                float productValue183 = (productValue178 * productValue178) * productValue178;
                float dotProductValue14 = dot(vec3(productValue171, productValue174, productValue175), vec3(fragmentVectorConstants1.packedValues[135u].xyz));
                float dotProductValue15 = dot(vec3(productValue171, productValue174, productValue175), vec3(fragmentVectorConstants1.packedValues[77u].xyz));
                float sumValue109 = fragmentVectorConstants1.packedValues[130u].x - fragmentVectorConstants1.packedValues[130u].w;
                float quotientValue23 = spvNClamp((productValue174 - sumValue109) / (fragmentVectorConstants1.packedValues[130u].y - sumValue109), 0.0, 1.0);
                float productValue186 = 1.0 - ((quotientValue23 * quotientValue23) * (3.0 - (quotientValue23 * 2.0)));
                float productValue187 = (productValue186 * productValue186) * productValue186;
                float productValue188 = (fragmentVectorConstants1.packedValues[69u].x * 0.75) * ((((dotProductValue15 * dotProductValue15) + 1.0) * fragmentVectorConstants1.packedValues[133u].w) + (((dotProductValue14 * dotProductValue14) + 1.0) * fragmentVectorConstants1.packedValues[142u].w));
                float exponentialValue4 = spvNClamp(exp2(log2(spvNMax(dotProductValue14, 0.0)) * fragmentVectorConstants1.packedValues[69u].w), 0.0, 1.0);
                float exponentialValue5 = spvNClamp(exp2(log2(spvNMax(dotProductValue15, 0.0)) * fragmentVectorConstants1.packedValues[69u].w), 0.0, 1.0);
                float productValue189 = 1.809999942779541015625 - (exponentialValue4 * 1.7999999523162841796875);
                float nonlinearValue3 = 0.036100022494792938232421875 / (sqrt(productValue189) * productValue189);
                float productValue190 = 1.809999942779541015625 - (exponentialValue5 * 1.7999999523162841796875);
                float nonlinearValue4 = 0.036100022494792938232421875 / (sqrt(productValue190) * productValue190);
                float productValue191 = exponentialValue4 * (fragmentVectorConstants1.packedValues[69u].y * fragmentVectorConstants1.packedValues[142u].w);
                float productValue192 = exponentialValue5 * (fragmentVectorConstants1.packedValues[69u].z * fragmentVectorConstants1.packedValues[133u].w);
                float productValue193 = (((productValue183 * fragmentVectorConstants1.packedValues[131u].x) * (((productValue192 * fragmentVectorConstants1.packedValues[133u].x) * nonlinearValue4) + ((productValue191 * fragmentVectorConstants1.packedValues[142u].x) * nonlinearValue3))) + (((productValue187 * (fragmentVectorConstants1.packedValues[131u].x - fragmentVectorConstants1.packedValues[70u].x)) + fragmentVectorConstants1.packedValues[70u].x) * productValue188)) * 0.079577468335628509521484375;
                float productValue194 = (((productValue183 * fragmentVectorConstants1.packedValues[131u].y) * (((productValue192 * fragmentVectorConstants1.packedValues[133u].y) * nonlinearValue4) + ((productValue191 * fragmentVectorConstants1.packedValues[142u].y) * nonlinearValue3))) + (((productValue187 * (fragmentVectorConstants1.packedValues[131u].y - fragmentVectorConstants1.packedValues[70u].y)) + fragmentVectorConstants1.packedValues[70u].y) * productValue188)) * 0.079577468335628509521484375;
                float productValue195 = (((productValue183 * fragmentVectorConstants1.packedValues[131u].z) * (((productValue192 * fragmentVectorConstants1.packedValues[133u].z) * nonlinearValue4) + ((productValue191 * fragmentVectorConstants1.packedValues[142u].z) * nonlinearValue3))) + (((productValue187 * (fragmentVectorConstants1.packedValues[131u].z - fragmentVectorConstants1.packedValues[70u].z)) + fragmentVectorConstants1.packedValues[70u].z) * productValue188)) * 0.079577468335628509521484375;
                float branchMergedValue62;
                float branchMergedValue65;
                float branchMergedValue66;
                float branchMergedValue67;
                if (fragmentVectorConstants1.packedValues[72u].w != 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue51 = spvNMax(productValue46, 1.0) * fragmentVectorConstants1.packedValues[72u].z;
                branchMergedValue58 = spvNMax(productValue45, 1.0) * fragmentVectorConstants1.packedValues[72u].y;
                branchMergedValue59 = fragmentVectorConstants1.packedValues[72u].x * spvNMax(productValue44, 1.0);
                branchMergedValue60 = quotientValue63;
            }
            else
            {
                float quotientValue64 = spvNClamp(((productValue174 - fragmentVectorConstants1.packedValues[129u].x) + fragmentVectorConstants1.packedValues[129u].w) / (fragmentVectorConstants1.packedValues[129u].z - fragmentVectorConstants1.packedValues[129u].x), 0.0, 1.0);
                float productValue431 = 1.0 - ((quotientValue64 * quotientValue64) * (3.0 - (quotientValue64 * 2.0)));
                float productValue432 = (productValue431 * productValue431) * productValue431;
                float dotProductValue30 = dot(vec3(productValue171, productValue174, productValue175), vec3(fragmentVectorConstants1.packedValues[134u].xyz));
                float dotProductValue31 = dot(vec3(productValue171, productValue174, productValue175), vec3(fragmentVectorConstants1.packedValues[76u].xyz));
                float sumValue307 = fragmentVectorConstants1.packedValues[129u].x - fragmentVectorConstants1.packedValues[129u].w;
                float quotientValue65 = spvNClamp((productValue174 - sumValue307) / (fragmentVectorConstants1.packedValues[129u].y - sumValue307), 0.0, 1.0);
                float productValue433 = 1.0 - ((quotientValue65 * quotientValue65) * (3.0 - (quotientValue65 * 2.0)));
                float productValue434 = (productValue433 * productValue433) * productValue433;
                float productValue435 = (fragmentVectorConstants1.packedValues[68u].x * 0.75) * ((((dotProductValue31 * dotProductValue31) + 1.0) * fragmentVectorConstants1.packedValues[132u].w) + (((dotProductValue30 * dotProductValue30) + 1.0) * fragmentVectorConstants1.packedValues[141u].w));
                float exponentialValue13 = spvNClamp(exp2(log2(spvNMax(dotProductValue30, 0.0)) * fragmentVectorConstants1.packedValues[68u].w), 0.0, 1.0);
                float exponentialValue14 = spvNClamp(exp2(log2(spvNMax(dotProductValue31, 0.0)) * fragmentVectorConstants1.packedValues[68u].w), 0.0, 1.0);
                float productValue436 = 1.809999942779541015625 - (exponentialValue13 * 1.7999999523162841796875);
                float nonlinearValue14 = 0.036100022494792938232421875 / (sqrt(productValue436) * productValue436);
                float productValue437 = 1.809999942779541015625 - (exponentialValue14 * 1.7999999523162841796875);
                float nonlinearValue15 = 0.036100022494792938232421875 / (sqrt(productValue437) * productValue437);
                float productValue438 = exponentialValue13 * (fragmentVectorConstants1.packedValues[68u].y * fragmentVectorConstants1.packedValues[141u].w);
                float productValue439 = exponentialValue14 * (fragmentVectorConstants1.packedValues[68u].z * fragmentVectorConstants1.packedValues[132u].w);
                float productValue440 = (((productValue432 * fragmentVectorConstants1.packedValues[130u].x) * (((productValue439 * fragmentVectorConstants1.packedValues[132u].x) * nonlinearValue15) + ((productValue438 * fragmentVectorConstants1.packedValues[141u].x) * nonlinearValue14))) + (((productValue434 * (fragmentVectorConstants1.packedValues[130u].x - fragmentVectorConstants1.packedValues[69u].x)) + fragmentVectorConstants1.packedValues[69u].x) * productValue435)) * 0.079577468335628509521484375;
                float productValue441 = (((productValue432 * fragmentVectorConstants1.packedValues[130u].y) * (((productValue439 * fragmentVectorConstants1.packedValues[132u].y) * nonlinearValue15) + ((productValue438 * fragmentVectorConstants1.packedValues[141u].y) * nonlinearValue14))) + (((productValue434 * (fragmentVectorConstants1.packedValues[130u].y - fragmentVectorConstants1.packedValues[69u].y)) + fragmentVectorConstants1.packedValues[69u].y) * productValue435)) * 0.079577468335628509521484375;
                float productValue442 = (((productValue432 * fragmentVectorConstants1.packedValues[130u].z) * (((productValue439 * fragmentVectorConstants1.packedValues[132u].z) * nonlinearValue15) + ((productValue438 * fragmentVectorConstants1.packedValues[141u].z) * nonlinearValue14))) + (((productValue434 * (fragmentVectorConstants1.packedValues[130u].z - fragmentVectorConstants1.packedValues[69u].z)) + fragmentVectorConstants1.packedValues[69u].z) * productValue435)) * 0.079577468335628509521484375;
                float branchMergedValue62;
                float branchMergedValue65;
                float branchMergedValue66;
                float branchMergedValue67;
                if (fragmentVectorConstants1.packedValues[71u].w != 0.0)
#endif
                {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(scalarValue122) <= int(scalarValue28))
                    {
                        break;
                    }
                    uint scalarValue123 = min(scalarValue28, 68u);
                    uint reinterpretedBits10 = uint(min(int(uint(int(rdDot4Precise(fragmentVectorConstants1.packedValues[78u], vec4(uintBitsToFloat(intermediateValue21[scalarValue123].x), uintBitsToFloat(intermediateValue21[scalarValue123].y), uintBitsToFloat(intermediateValue21[scalarValue123].z), uintBitsToFloat(intermediateValue21[scalarValue123].w))))) + scalarValue27), int(8u)));
                    intermediateValue139 = intermediateValue138;
                    intermediateValue140 = intermediateValue108;
                    intermediateValue142 = scalarValue27;
                    float quotientValue16;
                    float quotientValue17;
                    uint intermediateValue169;
                    for (;;)
                    {
                        if (int(reinterpretedBits10) <= int(intermediateValue142))
                        {
                            break;
                        }
                        uint bitwiseValue36 = intermediateValue142 << 2u;
                        uint sumValue139 = bitwiseValue36 + 80u;
                        uint sumValue140 = bitwiseValue36 + 79u;
                        uint sumValue141 = bitwiseValue36 + 81u;
                        uint sumValue142 = bitwiseValue36 + 82u;
                        float multiplyAddValue119 = fma(fragmentVectorConstants1.packedValues[sumValue141].x, multiplyAddValue118, fma(fragmentVectorConstants1.packedValues[sumValue140].x, multiplyAddValue116, multiplyAddValue117 * fragmentVectorConstants1.packedValues[sumValue139].x)) + fragmentVectorConstants1.packedValues[sumValue142].x;
                        float multiplyAddValue120 = fma(fragmentVectorConstants1.packedValues[sumValue141].y, multiplyAddValue118, fma(fragmentVectorConstants1.packedValues[sumValue140].y, multiplyAddValue116, multiplyAddValue117 * fragmentVectorConstants1.packedValues[sumValue139].y)) + fragmentVectorConstants1.packedValues[sumValue142].y;
                        float multiplyAddValue121 = fma(fragmentVectorConstants1.packedValues[sumValue141].z, multiplyAddValue118, fma(fragmentVectorConstants1.packedValues[sumValue140].z, multiplyAddValue116, multiplyAddValue117 * fragmentVectorConstants1.packedValues[sumValue139].z)) + fragmentVectorConstants1.packedValues[sumValue142].z;
                        if (((abs(multiplyAddValue119) <= 1.0) && (abs(multiplyAddValue120) <= 1.0)) && (abs(multiplyAddValue121) <= 1.0))
                        {
                            uint scalarValue124 = min(intermediateValue142, 68u);
                            float reinterpretedBits11 = spvNMin(spvNMax(productValue250, rdDot4Precise(fragmentVectorConstants1.packedValues[61u], vec4(uintBitsToFloat(intermediateValue21[scalarValue124].x), uintBitsToFloat(intermediateValue21[scalarValue124].y), uintBitsToFloat(intermediateValue21[scalarValue124].z), uintBitsToFloat(intermediateValue21[scalarValue124].w)))), 1.0);
                            float multiplyAddValue122 = fma(multiplyAddValue119, 0.5, 0.5);
                            uint sumValue143 = bitwiseValue36 + 18u;
                            float nonlinearValue6 = sqrt(rdDot4Precise(fragmentVectorConstants1.packedValues[sumValue143], fragmentVectorConstants1.packedValues[sumValue143])) * fragmentScalarConstants1.packedValues[566u];
                            uint clampedValue = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[(((16u * intermediateValue142) + 768u) + 12u) >> 2u] + 0.5))), int(1u), int(9u)));
                            bool conditionValue13 = !comparisonValue121;
                            uint comparisonValue122 = (comparisonValue121 ? 1u : clampedValue) >> 1u;
                            float multiplyAddValue123 = 1.0 - fma(multiplyAddValue120, 0.5, 0.5);
                            float scalarValue125 = rdSignedBitsToFloat(intermediateValue142);
                            float multiplyAddValue124 = multiplyAddValue121 - fma(fragmentScalarConstants1.packedValues[(((16u * intermediateValue142) + 768u) + 8u) >> 2u], sqrt(fma(-reinterpretedBits11, reinterpretedBits11, 1.0)) / reinterpretedBits11, fragmentScalarConstants1.packedValues[(((16u * intermediateValue142) + 768u) + 4u) >> 2u]);
                            float intermediateValue216;
                            float intermediateValue218;
                            intermediateValue216 = 0.0;
                            intermediateValue218 = 0.0;
                            uint sumValue88;
                            float intermediateValue217;
                            float intermediateValue219;
                            uint scalarValue34 = 0u;
                            for (;;)
                            {
                                if ((comparisonValue121 && (int(scalarValue34) >= int(1u))) || ((int(clampedValue) <= int(scalarValue34)) && conditionValue13))
                                {
                                    break;
                                }
                                float sumValue144 = rdSignedBitsToFloat(scalarValue34 - comparisonValue122) + 0.5;
                                intermediateValue217 = intermediateValue216;
                                intermediateValue219 = intermediateValue218;
                                float multiplyAddValue176;
                                float multiplyAddValue177;
                                uint sumValue94;
                                uint scalarValue37 = 0u;
                                for (;;)
                                {
                                    if ((conditionValue13 && (int(clampedValue) <= int(scalarValue37))) || (comparisonValue121 && (int(scalarValue37) >= int(1u))))
                                    {
                                        break;
                                    }
                                    uint bitwiseValue37 = (((16u * intermediateValue142) + 768u) + 0u) >> 2u;
                                    float multiplyAddValue125 = fma(multiplyAddValue122, fragmentScalarConstants1.packedValues[bitwiseValue37], ((rdSignedBitsToFloat(scalarValue37 - comparisonValue122) + 0.5) * fragmentScalarConstants1.packedValues[556u]) * fragmentScalarConstants1.packedValues[bitwiseValue37]);
                                    float multiplyAddValue132 = fma(multiplyAddValue123, fragmentScalarConstants1.packedValues[bitwiseValue37], (sumValue144 * fragmentScalarConstants1.packedValues[556u]) * fragmentScalarConstants1.packedValues[bitwiseValue37]);
                                    vec4 sampledTextureValue85 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue125, multiplyAddValue132, scalarValue125));
                                    float scalarValue126 = sampledTextureValue85.x;
                                    float scalarValue127 = sampledTextureValue85.y;
                                    float scalarValue128 = sampledTextureValue85.z;
                                    float scalarValue129 = sampledTextureValue85.w;
                                    float multiplyAddValue133 = fract(fma(multiplyAddValue125, fragmentScalarConstants1.packedValues[558u], 0.5));
                                    float multiplyAddValue134 = fract(fma(multiplyAddValue132, fragmentScalarConstants1.packedValues[558u], 0.5));
                                    float productValue251 = spvNClamp(nonlinearValue6 * (multiplyAddValue121 - scalarValue126), 0.0, 1.0);
                                    float productValue252 = spvNClamp(nonlinearValue6 * (multiplyAddValue121 - scalarValue127), 0.0, 1.0);
                                    float productValue253 = spvNClamp(nonlinearValue6 * (multiplyAddValue121 - scalarValue128), 0.0, 1.0);
                                    float productValue254 = spvNClamp(nonlinearValue6 * (multiplyAddValue121 - scalarValue129), 0.0, 1.0);
                                    float multiplyAddValue135 = fma(-fma(productValue251, -2.0, 3.0), productValue251 * productValue251, 1.0);
                                    float multiplyAddValue136 = fma(-fma(productValue254, -2.0, 3.0), productValue254 * productValue254, 1.0);
                                    float multiplyAddValue137 = fma(multiplyAddValue133, fma(-fma(productValue253, -2.0, 3.0), productValue253 * productValue253, 1.0) - multiplyAddValue136, multiplyAddValue136);
                                    multiplyAddValue177 = fma(multiplyAddValue134, fma(multiplyAddValue133, fma(-fma(productValue252, -2.0, 3.0), productValue252 * productValue252, 1.0) - multiplyAddValue135, multiplyAddValue135) - multiplyAddValue137, multiplyAddValue137) + intermediateValue219;
                                    bool comparisonValue123 = scalarValue129 >= multiplyAddValue124;
                                    bool comparisonValue124 = scalarValue126 >= multiplyAddValue124;
                                    float comparisonValue125 = float(scalarValue127 >= multiplyAddValue124);
                                    float comparisonValue126 = float(scalarValue128 >= multiplyAddValue124);
                                    float multiplyAddValue138 = fma(multiplyAddValue133, comparisonValue123 ? (comparisonValue126 - 1.0) : comparisonValue126, float(comparisonValue123));
                                    multiplyAddValue176 = comparisonValue121 ? (comparisonValue123 ? (intermediateValue217 + 1.0) : intermediateValue217) : (fma(multiplyAddValue134, fma(multiplyAddValue133, comparisonValue124 ? (comparisonValue125 - 1.0) : comparisonValue125, float(comparisonValue124)) - multiplyAddValue138, multiplyAddValue138) + intermediateValue217);
                                    sumValue94 = scalarValue37 + 1u;
                                    intermediateValue217 = multiplyAddValue176;
                                    intermediateValue219 = multiplyAddValue177;
                                    scalarValue37 = sumValue94;
                                    continue;
                                }
                                sumValue88 = scalarValue34 + 1u;
                                intermediateValue216 = intermediateValue217;
                                intermediateValue218 = intermediateValue219;
                                scalarValue34 = sumValue88;
                                continue;
                            }
                            float comparisonValue127 = rdSignedBitsToFloat(comparisonValue121 ? 1u : (clampedValue * clampedValue));
                            intermediateValue169 = reinterpretedBits10;
                            quotientValue17 = spvNMin(intermediateValue218 / comparisonValue127, intermediateValue140);
                            quotientValue16 = spvNMin(intermediateValue216 / comparisonValue127, intermediateValue139);
                        }
                        else
                        {
                            intermediateValue169 = intermediateValue142 + 1u;
                            quotientValue17 = intermediateValue140;
                            quotientValue16 = intermediateValue139;
                        }
                        intermediateValue139 = quotientValue16;
                        intermediateValue140 = quotientValue17;
                        intermediateValue142 = intermediateValue169;
                        continue;
                    }
                    sumValue33 = scalarValue28 + 1u;
                    intermediateValue138 = intermediateValue139;
                    intermediateValue108 = intermediateValue140;
                    scalarValue27 = intermediateValue142;
                    scalarValue28 = sumValue33;
                    continue;
                }
                float intermediateValue172;
                if (int(uint(int(fragmentScalarConstants1.packedValues[224u]))) > int(0u))
                {
                    float multiplyAddValue139 = fma(fma(fragmentVectorConstants1.packedValues[127u].x, multiplyAddValue118, fma(fragmentVectorConstants1.packedValues[125u].x, multiplyAddValue116, multiplyAddValue117 * fragmentVectorConstants1.packedValues[126u].x)) + fragmentVectorConstants1.packedValues[128u].x, 0.5, 0.5) * fragmentScalarConstants1.packedValues[225u];
                    float multiplyAddValue140 = (1.0 - fma(fma(fragmentVectorConstants1.packedValues[127u].y, multiplyAddValue118, fma(fragmentVectorConstants1.packedValues[125u].y, multiplyAddValue116, multiplyAddValue117 * fragmentVectorConstants1.packedValues[126u].y)) + fragmentVectorConstants1.packedValues[128u].y, 0.5, 0.5)) * fragmentScalarConstants1.packedValues[225u];
                    float comparisonValue42;
                    if ((((multiplyAddValue139 >= 0.0) && (multiplyAddValue139 < fragmentScalarConstants1.packedValues[225u])) && (multiplyAddValue140 >= 0.0)) && (multiplyAddValue140 < fragmentScalarConstants1.packedValues[225u]))
                    {
                        float scalarValue130 = spvNMin(spvNMax(productValue250, fragmentScalarConstants1.packedValues[244u]), 1.0);
                        float multiplyAddValue141 = spvNMin((fma(fragmentVectorConstants1.packedValues[127u].z, multiplyAddValue118, fma(fragmentVectorConstants1.packedValues[125u].z, multiplyAddValue116, multiplyAddValue117 * fragmentVectorConstants1.packedValues[126u].z)) + fragmentVectorConstants1.packedValues[128u].z) - fma(fragmentScalarConstants1.packedValues[194u], sqrt(fma(-scalarValue130, scalarValue130, 1.0)) / scalarValue130, fragmentScalarConstants1.packedValues[193u]), 1.0);
                        bool conditionValue14 = !comparisonValue121;
                        float sumValue145 = rdDot4Precise(fragmentVectorConstants1.packedValues[78u], vec4(1.0)) + 1.0;
                        uint comparisonValue128 = comparisonValue121 ? 0u : 4294967295u;
                        float intermediateValue196;
                        intermediateValue196 = 0.0;
                        uint sumValue71;
                        float intermediateValue197;
                        uint scalarValue40 = 0u;
                        for (;;)
                        {
                            if (((int(scalarValue40) >= int(2u)) && conditionValue14) || (comparisonValue121 && (int(scalarValue40) >= int(1u))))
                            {
                                break;
                            }
                            float sumValue146 = rdSignedBitsToFloat(comparisonValue128 + scalarValue40) + 0.5;
                            intermediateValue197 = intermediateValue196;
                            uint sumValue91;
                            float sampledTextureValue21;
                            uint scalarValue45 = 0u;
                            for (;;)
                            {
                                if ((comparisonValue121 && (int(scalarValue45) >= int(1u))) || (conditionValue14 && (int(scalarValue45) >= int(2u))))
                                {
                                    break;
                                }
                                float multiplyAddValue142 = fma((rdSignedBitsToFloat(comparisonValue128 + scalarValue45) + 0.5) * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue139);
                                float multiplyAddValue143 = fma(sumValue146 * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue140);
                                if (comparisonValue121)
                                {
                                    sampledTextureValue21 = (textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue142, multiplyAddValue143, sumValue145), 0.0).x >= multiplyAddValue141) ? (intermediateValue197 + 1.0) : intermediateValue197;
                                }
                                else
                                {
                                    vec4 sampledTextureValue86 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue142, multiplyAddValue143, sumValue145));
                                    float multiplyAddValue144 = fract(fma(multiplyAddValue142, fragmentScalarConstants1.packedValues[558u], 0.5));
                                    bool comparisonValue129 = sampledTextureValue86.x >= multiplyAddValue141;
                                    bool comparisonValue130 = sampledTextureValue86.w >= multiplyAddValue141;
                                    float comparisonValue131 = float(sampledTextureValue86.y >= multiplyAddValue141);
                                    float comparisonValue132 = float(sampledTextureValue86.z >= multiplyAddValue141);
                                    float multiplyAddValue145 = fma(multiplyAddValue144, comparisonValue130 ? (comparisonValue132 - 1.0) : comparisonValue132, float(comparisonValue130));
                                    sampledTextureValue21 = intermediateValue197 + fma(fract(fma(multiplyAddValue143, fragmentScalarConstants1.packedValues[558u], 0.5)), fma(multiplyAddValue144, comparisonValue129 ? (comparisonValue131 - 1.0) : comparisonValue131, float(comparisonValue129)) - multiplyAddValue145, multiplyAddValue145);
                                }
                                sumValue91 = scalarValue45 + 1u;
                                intermediateValue197 = sampledTextureValue21;
                                scalarValue45 = sumValue91;
                                continue;
                            }
                            sumValue71 = scalarValue40 + 1u;
                            intermediateValue196 = intermediateValue197;
                            scalarValue40 = sumValue71;
                            continue;
                        }
                        comparisonValue42 = intermediateValue196 / (comparisonValue121 ? 1.0 : 4.0);
                    }
                    else
                    {
                        comparisonValue42 = 1.0;
                    }
                    intermediateValue172 = comparisonValue42;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(scalarValue203) <= int(scalarValue28))
                    {
                        break;
                    }
                    uint scalarValue123 = min(scalarValue28, 68u);
                    uint reinterpretedBits22 = uint(min(int(uint(int(rdDot4Precise(fragmentVectorConstants1.packedValues[77u], vec4(uintBitsToFloat(intermediateValue23[scalarValue123].x), uintBitsToFloat(intermediateValue23[scalarValue123].y), uintBitsToFloat(intermediateValue23[scalarValue123].z), uintBitsToFloat(intermediateValue23[scalarValue123].w))))) + scalarValue27), int(8u)));
                    intermediateValue137 = intermediateValue136;
                    intermediateValue138 = intermediateValue106;
                    intermediateValue140 = scalarValue27;
                    float quotientValue16;
                    float quotientValue17;
                    uint intermediateValue167;
                    for (;;)
                    {
                        if (int(reinterpretedBits22) <= int(intermediateValue140))
                        {
                            break;
                        }
                        uint bitwiseValue72 = intermediateValue140 << 2u;
                        uint sumValue221 = bitwiseValue72 + 79u;
                        uint sumValue222 = bitwiseValue72 + 78u;
                        uint sumValue223 = bitwiseValue72 + 80u;
                        uint sumValue224 = bitwiseValue72 + 81u;
                        float multiplyAddValue284 = fma(fragmentVectorConstants1.packedValues[sumValue223].x, multiplyAddValue283, fma(fragmentVectorConstants1.packedValues[sumValue222].x, multiplyAddValue281, multiplyAddValue282 * fragmentVectorConstants1.packedValues[sumValue221].x)) + fragmentVectorConstants1.packedValues[sumValue224].x;
                        float multiplyAddValue285 = fma(fragmentVectorConstants1.packedValues[sumValue223].y, multiplyAddValue283, fma(fragmentVectorConstants1.packedValues[sumValue222].y, multiplyAddValue281, multiplyAddValue282 * fragmentVectorConstants1.packedValues[sumValue221].y)) + fragmentVectorConstants1.packedValues[sumValue224].y;
                        float multiplyAddValue286 = fma(fragmentVectorConstants1.packedValues[sumValue223].z, multiplyAddValue283, fma(fragmentVectorConstants1.packedValues[sumValue222].z, multiplyAddValue281, multiplyAddValue282 * fragmentVectorConstants1.packedValues[sumValue221].z)) + fragmentVectorConstants1.packedValues[sumValue224].z;
                        if (((abs(multiplyAddValue284) <= 1.0) && (abs(multiplyAddValue285) <= 1.0)) && (abs(multiplyAddValue286) <= 1.0))
                        {
                            uint scalarValue204 = min(intermediateValue140, 68u);
                            float reinterpretedBits23 = spvNMin(spvNMax(productValue320, rdDot4Precise(fragmentVectorConstants1.packedValues[61u], vec4(uintBitsToFloat(intermediateValue23[scalarValue204].x), uintBitsToFloat(intermediateValue23[scalarValue204].y), uintBitsToFloat(intermediateValue23[scalarValue204].z), uintBitsToFloat(intermediateValue23[scalarValue204].w)))), 1.0);
                            float multiplyAddValue287 = fma(multiplyAddValue284, 0.5, 0.5);
                            uint sumValue225 = bitwiseValue72 + 18u;
                            float nonlinearValue9 = sqrt(rdDot4Precise(fragmentVectorConstants1.packedValues[sumValue225], fragmentVectorConstants1.packedValues[sumValue225])) * fragmentScalarConstants1.packedValues[562u];
                            uint clampedValue2 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[(((16u * intermediateValue140) + 768u) + 12u) >> 2u] + 0.5))), int(1u), int(9u)));
                            bool conditionValue32 = !comparisonValue194;
                            uint comparisonValue195 = (comparisonValue194 ? 1u : clampedValue2) >> 1u;
                            float multiplyAddValue288 = 1.0 - fma(multiplyAddValue285, 0.5, 0.5);
                            float scalarValue205 = rdSignedBitsToFloat(intermediateValue140);
                            float multiplyAddValue289 = multiplyAddValue286 - fma(fragmentScalarConstants1.packedValues[(((16u * intermediateValue140) + 768u) + 8u) >> 2u], sqrt(fma(-reinterpretedBits23, reinterpretedBits23, 1.0)) / reinterpretedBits23, fragmentScalarConstants1.packedValues[(((16u * intermediateValue140) + 768u) + 4u) >> 2u]);
                            float intermediateValue214;
                            float intermediateValue216;
                            intermediateValue214 = 0.0;
                            intermediateValue216 = 0.0;
                            uint sumValue88;
                            float intermediateValue215;
                            float intermediateValue217;
                            uint scalarValue34 = 0u;
                            for (;;)
                            {
                                if ((comparisonValue194 && (int(scalarValue34) >= int(1u))) || ((int(clampedValue2) <= int(scalarValue34)) && conditionValue32))
                                {
                                    break;
                                }
                                float sumValue226 = rdSignedBitsToFloat(scalarValue34 - comparisonValue195) + 0.5;
                                intermediateValue215 = intermediateValue214;
                                intermediateValue217 = intermediateValue216;
                                float multiplyAddValue179;
                                float multiplyAddValue180;
                                uint sumValue94;
                                uint scalarValue37 = 0u;
                                for (;;)
                                {
                                    if (((int(clampedValue2) <= int(scalarValue37)) && conditionValue32) || (comparisonValue194 && (int(scalarValue37) >= int(1u))))
                                    {
                                        break;
                                    }
                                    uint bitwiseValue73 = (((16u * intermediateValue140) + 768u) + 0u) >> 2u;
                                    float multiplyAddValue290 = fma(multiplyAddValue287, fragmentScalarConstants1.packedValues[bitwiseValue73], ((rdSignedBitsToFloat(scalarValue37 - comparisonValue195) + 0.5) * fragmentScalarConstants1.packedValues[552u]) * fragmentScalarConstants1.packedValues[bitwiseValue73]);
                                    float multiplyAddValue291 = fma(multiplyAddValue288, fragmentScalarConstants1.packedValues[bitwiseValue73], (sumValue226 * fragmentScalarConstants1.packedValues[552u]) * fragmentScalarConstants1.packedValues[bitwiseValue73]);
                                    vec4 sampledTextureValue103 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue290, multiplyAddValue291, scalarValue205));
                                    float scalarValue206 = sampledTextureValue103.x;
                                    float scalarValue207 = sampledTextureValue103.y;
                                    float scalarValue208 = sampledTextureValue103.z;
                                    float scalarValue209 = sampledTextureValue103.w;
                                    float multiplyAddValue292 = fract(fma(multiplyAddValue290, fragmentScalarConstants1.packedValues[554u], 0.5));
                                    float multiplyAddValue293 = fract(fma(multiplyAddValue291, fragmentScalarConstants1.packedValues[554u], 0.5));
                                    float productValue321 = spvNClamp(nonlinearValue9 * (multiplyAddValue286 - scalarValue206), 0.0, 1.0);
                                    float productValue322 = spvNClamp(nonlinearValue9 * (multiplyAddValue286 - scalarValue207), 0.0, 1.0);
                                    float productValue323 = spvNClamp(nonlinearValue9 * (multiplyAddValue286 - scalarValue208), 0.0, 1.0);
                                    float productValue324 = spvNClamp(nonlinearValue9 * (multiplyAddValue286 - scalarValue209), 0.0, 1.0);
                                    float multiplyAddValue294 = fma(-fma(productValue321, -2.0, 3.0), productValue321 * productValue321, 1.0);
                                    float multiplyAddValue295 = fma(-fma(productValue324, -2.0, 3.0), productValue324 * productValue324, 1.0);
                                    float multiplyAddValue296 = fma(multiplyAddValue292, fma(-fma(productValue323, -2.0, 3.0), productValue323 * productValue323, 1.0) - multiplyAddValue295, multiplyAddValue295);
                                    multiplyAddValue180 = fma(multiplyAddValue293, fma(multiplyAddValue292, fma(-fma(productValue322, -2.0, 3.0), productValue322 * productValue322, 1.0) - multiplyAddValue294, multiplyAddValue294) - multiplyAddValue296, multiplyAddValue296) + intermediateValue217;
                                    bool comparisonValue196 = scalarValue209 >= multiplyAddValue289;
                                    bool comparisonValue197 = scalarValue206 >= multiplyAddValue289;
                                    float comparisonValue198 = float(scalarValue207 >= multiplyAddValue289);
                                    float comparisonValue199 = float(scalarValue208 >= multiplyAddValue289);
                                    float multiplyAddValue297 = fma(multiplyAddValue292, comparisonValue196 ? (comparisonValue199 - 1.0) : comparisonValue199, float(comparisonValue196));
                                    multiplyAddValue179 = comparisonValue194 ? (comparisonValue196 ? (intermediateValue215 + 1.0) : intermediateValue215) : (fma(multiplyAddValue293, fma(multiplyAddValue292, comparisonValue197 ? (comparisonValue198 - 1.0) : comparisonValue198, float(comparisonValue197)) - multiplyAddValue297, multiplyAddValue297) + intermediateValue215);
                                    sumValue94 = scalarValue37 + 1u;
                                    intermediateValue215 = multiplyAddValue179;
                                    intermediateValue217 = multiplyAddValue180;
                                    scalarValue37 = sumValue94;
                                    continue;
                                }
                                sumValue88 = scalarValue34 + 1u;
                                intermediateValue214 = intermediateValue215;
                                intermediateValue216 = intermediateValue217;
                                scalarValue34 = sumValue88;
                                continue;
                            }
                            float comparisonValue200 = rdSignedBitsToFloat(comparisonValue194 ? 1u : (clampedValue2 * clampedValue2));
                            intermediateValue167 = reinterpretedBits22;
                            quotientValue17 = spvNMin(intermediateValue216 / comparisonValue200, intermediateValue138);
                            quotientValue16 = spvNMin(intermediateValue214 / comparisonValue200, intermediateValue137);
                        }
                        else
                        {
                            intermediateValue167 = intermediateValue140 + 1u;
                            quotientValue17 = intermediateValue138;
                            quotientValue16 = intermediateValue137;
                        }
                        intermediateValue137 = quotientValue16;
                        intermediateValue138 = quotientValue17;
                        intermediateValue140 = intermediateValue167;
                        continue;
                    }
                    sumValue33 = scalarValue28 + 1u;
                    intermediateValue136 = intermediateValue137;
                    intermediateValue106 = intermediateValue138;
                    scalarValue27 = intermediateValue140;
                    scalarValue28 = sumValue33;
                    continue;
                }
                float intermediateValue170;
                if (int(uint(int(fragmentScalarConstants1.packedValues[224u]))) > int(0u))
                {
                    float multiplyAddValue298 = fma(fma(fragmentVectorConstants1.packedValues[126u].x, multiplyAddValue283, fma(fragmentVectorConstants1.packedValues[124u].x, multiplyAddValue281, multiplyAddValue282 * fragmentVectorConstants1.packedValues[125u].x)) + fragmentVectorConstants1.packedValues[127u].x, 0.5, 0.5) * fragmentScalarConstants1.packedValues[225u];
                    float multiplyAddValue299 = (1.0 - fma(fma(fragmentVectorConstants1.packedValues[126u].y, multiplyAddValue283, fma(fragmentVectorConstants1.packedValues[124u].y, multiplyAddValue281, multiplyAddValue282 * fragmentVectorConstants1.packedValues[125u].y)) + fragmentVectorConstants1.packedValues[127u].y, 0.5, 0.5)) * fragmentScalarConstants1.packedValues[225u];
                    float comparisonValue41;
                    if ((((multiplyAddValue298 >= 0.0) && (multiplyAddValue298 < fragmentScalarConstants1.packedValues[225u])) && (multiplyAddValue299 >= 0.0)) && (multiplyAddValue299 < fragmentScalarConstants1.packedValues[225u]))
                    {
                        float scalarValue210 = spvNMin(spvNMax(productValue320, fragmentScalarConstants1.packedValues[244u]), 1.0);
                        float multiplyAddValue300 = spvNMin((fma(fragmentVectorConstants1.packedValues[126u].z, multiplyAddValue283, fma(fragmentVectorConstants1.packedValues[124u].z, multiplyAddValue281, multiplyAddValue282 * fragmentVectorConstants1.packedValues[125u].z)) + fragmentVectorConstants1.packedValues[127u].z) - fma(fragmentScalarConstants1.packedValues[194u], sqrt(fma(-scalarValue210, scalarValue210, 1.0)) / scalarValue210, fragmentScalarConstants1.packedValues[193u]), 1.0);
                        bool conditionValue33 = !comparisonValue194;
                        float sumValue227 = rdDot4Precise(fragmentVectorConstants1.packedValues[77u], vec4(1.0)) + 1.0;
                        uint comparisonValue201 = comparisonValue194 ? 0u : 4294967295u;
                        float intermediateValue194;
                        intermediateValue194 = 0.0;
                        uint sumValue71;
                        float intermediateValue195;
                        uint scalarValue40 = 0u;
                        for (;;)
                        {
                            if (((int(scalarValue40) >= int(2u)) && conditionValue33) || (comparisonValue194 && (int(scalarValue40) >= int(1u))))
                            {
                                break;
                            }
                            float sumValue228 = rdSignedBitsToFloat(comparisonValue201 + scalarValue40) + 0.5;
                            intermediateValue195 = intermediateValue194;
                            uint sumValue91;
                            float sampledTextureValue22;
                            uint scalarValue45 = 0u;
                            for (;;)
                            {
                                if ((comparisonValue194 && (int(scalarValue45) >= int(1u))) || (conditionValue33 && (int(scalarValue45) >= int(2u))))
                                {
                                    break;
                                }
                                float multiplyAddValue301 = fma((rdSignedBitsToFloat(comparisonValue201 + scalarValue45) + 0.5) * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue298);
                                float multiplyAddValue302 = fma(sumValue228 * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue299);
                                if (comparisonValue194)
                                {
                                    sampledTextureValue22 = (textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue301, multiplyAddValue302, sumValue227), 0.0).x >= multiplyAddValue300) ? (intermediateValue195 + 1.0) : intermediateValue195;
                                }
                                else
                                {
                                    vec4 sampledTextureValue104 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue301, multiplyAddValue302, sumValue227));
                                    float multiplyAddValue303 = fract(fma(multiplyAddValue301, fragmentScalarConstants1.packedValues[554u], 0.5));
                                    bool comparisonValue202 = sampledTextureValue104.x >= multiplyAddValue300;
                                    bool comparisonValue203 = sampledTextureValue104.w >= multiplyAddValue300;
                                    float comparisonValue204 = float(sampledTextureValue104.y >= multiplyAddValue300);
                                    float comparisonValue205 = float(sampledTextureValue104.z >= multiplyAddValue300);
                                    float multiplyAddValue304 = fma(multiplyAddValue303, comparisonValue203 ? (comparisonValue205 - 1.0) : comparisonValue205, float(comparisonValue203));
                                    sampledTextureValue22 = intermediateValue195 + fma(fract(fma(multiplyAddValue302, fragmentScalarConstants1.packedValues[554u], 0.5)), fma(multiplyAddValue303, comparisonValue202 ? (comparisonValue204 - 1.0) : comparisonValue204, float(comparisonValue202)) - multiplyAddValue304, multiplyAddValue304);
                                }
                                sumValue91 = scalarValue45 + 1u;
                                intermediateValue195 = sampledTextureValue22;
                                scalarValue45 = sumValue91;
                                continue;
                            }
                            sumValue71 = scalarValue40 + 1u;
                            intermediateValue194 = intermediateValue195;
                            scalarValue40 = sumValue71;
                            continue;
                        }
                        comparisonValue41 = intermediateValue194 / (comparisonValue194 ? 1.0 : 4.0);
                    }
                    else
                    {
                        comparisonValue41 = 1.0;
                    }
                    intermediateValue170 = comparisonValue41;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    float scalarValue72 = spvNMax(fragmentVectorConstants1.packedValues[75u].y, fragmentVectorConstants1.packedValues[111u].y);
                    branchMergedValue62 = ((productValue195 - fragmentVectorConstants1.packedValues[143u].z) * scalarValue72) + fragmentVectorConstants1.packedValues[143u].z;
                    branchMergedValue65 = ((productValue194 - fragmentVectorConstants1.packedValues[143u].y) * scalarValue72) + fragmentVectorConstants1.packedValues[143u].y;
                    branchMergedValue66 = ((productValue193 - fragmentVectorConstants1.packedValues[143u].x) * scalarValue72) + fragmentVectorConstants1.packedValues[143u].x;
                    branchMergedValue67 = quotientValue21;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    float scalarValue289 = spvNMax(fragmentVectorConstants1.packedValues[74u].y, fragmentVectorConstants1.packedValues[110u].y);
                    branchMergedValue62 = ((productValue442 - fragmentVectorConstants1.packedValues[142u].z) * scalarValue289) + fragmentVectorConstants1.packedValues[142u].z;
                    branchMergedValue65 = ((productValue441 - fragmentVectorConstants1.packedValues[142u].y) * scalarValue289) + fragmentVectorConstants1.packedValues[142u].y;
                    branchMergedValue66 = ((productValue440 - fragmentVectorConstants1.packedValues[142u].x) * scalarValue289) + fragmentVectorConstants1.packedValues[142u].x;
                    branchMergedValue67 = quotientValue63;
#endif
                }
                else
                {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    intermediateValue172 = 1.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    intermediateValue170 = 1.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue62 = productValue195;
                    branchMergedValue65 = productValue194;
                    branchMergedValue66 = productValue193;
                    branchMergedValue67 = quotientValue21;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    branchMergedValue62 = productValue442;
                    branchMergedValue65 = productValue441;
                    branchMergedValue66 = productValue440;
                    branchMergedValue67 = quotientValue63;
#endif
                }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                float comparisonValue45;
                if ((int(uint(int(fragmentScalarConstants1.packedValues[480u]))) > int(0u)) && (int(uint(int(fragmentScalarConstants1.packedValues[241u]))) > int(0u)))
                {
                    float multiplyAddValue146 = fma(fragmentVectorConstants1.packedValues[118u].w, multiplyAddValue118, fma(fragmentVectorConstants1.packedValues[116u].w, multiplyAddValue116, multiplyAddValue117 * fragmentVectorConstants1.packedValues[117u].w)) + fragmentVectorConstants1.packedValues[119u].w;
                    float scalarValue131 = spvNMin(spvNMax(productValue250, fragmentScalarConstants1.packedValues[244u]), 1.0);
                    float multiplyAddValue147 = ((fma(fragmentVectorConstants1.packedValues[118u].z, multiplyAddValue118, fma(fragmentVectorConstants1.packedValues[116u].z, multiplyAddValue116, multiplyAddValue117 * fragmentVectorConstants1.packedValues[117u].z)) + fragmentVectorConstants1.packedValues[119u].z) / multiplyAddValue146) - (fma(fragmentScalarConstants1.packedValues[194u], sqrt(fma(-scalarValue131, scalarValue131, 1.0)) / scalarValue131, fragmentScalarConstants1.packedValues[193u]) / (multiplyAddValue146 / multiplyAddValue146));
                    float multiplyAddValue148 = fma((fma(fragmentVectorConstants1.packedValues[118u].x, multiplyAddValue118, fma(fragmentVectorConstants1.packedValues[116u].x, multiplyAddValue116, multiplyAddValue117 * fragmentVectorConstants1.packedValues[117u].x)) + fragmentVectorConstants1.packedValues[119u].x) / multiplyAddValue146, 0.5, 0.5);
                    float multiplyAddValue149 = 1.0 - fma((fma(fragmentVectorConstants1.packedValues[118u].y, multiplyAddValue118, fma(fragmentVectorConstants1.packedValues[116u].y, multiplyAddValue116, multiplyAddValue117 * fragmentVectorConstants1.packedValues[117u].y)) + fragmentVectorConstants1.packedValues[119u].y) / multiplyAddValue146, 0.5, 0.5);
                    uint clampedValue1 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[254u] + 0.5))), int(1u), int(9u)));
                    bool conditionValue15 = !comparisonValue121;
                    uint comparisonValue133 = (comparisonValue121 ? 1u : clampedValue1) >> 1u;
                    float scalarValue132 = rdDot4Precise(fragmentVectorConstants1.packedValues[78u], vec4(1.0));
                    float intermediateValue199;
                    intermediateValue199 = 0.0;
                    uint sumValue72;
                    float intermediateValue200;
                    uint scalarValue46 = 0u;
                    for (;;)
                    {
                        if ((comparisonValue121 && (int(scalarValue46) >= int(1u))) || (conditionValue15 && (int(clampedValue1) <= int(scalarValue46))))
                        {
                            break;
                        }
                        float sumValue147 = rdSignedBitsToFloat(scalarValue46 - comparisonValue133) + 0.5;
                        intermediateValue200 = intermediateValue199;
                        uint sumValue92;
                        float sampledTextureValue22;
                        uint scalarValue133 = 0u;
                        for (;;)
                        {
                            if ((conditionValue15 && (int(clampedValue1) <= int(scalarValue133))) || (comparisonValue121 && (int(scalarValue133) >= int(1u))))
                            {
                                break;
                            }
                            float multiplyAddValue150 = fma(multiplyAddValue148, fragmentScalarConstants1.packedValues[192u], ((rdSignedBitsToFloat(scalarValue133 - comparisonValue133) + 0.5) * fragmentScalarConstants1.packedValues[556u]) * fragmentScalarConstants1.packedValues[192u]);
                            float multiplyAddValue151 = fma(multiplyAddValue149, fragmentScalarConstants1.packedValues[192u], (sumValue147 * fragmentScalarConstants1.packedValues[556u]) * fragmentScalarConstants1.packedValues[192u]);
                            if (comparisonValue121)
                            {
                                sampledTextureValue22 = (textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue150, multiplyAddValue151, scalarValue132), 0.0).x >= multiplyAddValue147) ? (intermediateValue200 + 1.0) : intermediateValue200;
                            }
                            else
                            {
                                vec4 sampledTextureValue87 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue150, multiplyAddValue151, scalarValue132));
                                float multiplyAddValue152 = fract(fma(multiplyAddValue150, fragmentScalarConstants1.packedValues[558u], 0.5));
                                bool comparisonValue134 = sampledTextureValue87.x >= multiplyAddValue147;
                                bool comparisonValue135 = sampledTextureValue87.w >= multiplyAddValue147;
                                float comparisonValue136 = float(sampledTextureValue87.y >= multiplyAddValue147);
                                float comparisonValue137 = float(sampledTextureValue87.z >= multiplyAddValue147);
                                float multiplyAddValue153 = fma(multiplyAddValue152, comparisonValue135 ? (comparisonValue137 - 1.0) : comparisonValue137, float(comparisonValue135));
                                sampledTextureValue22 = intermediateValue200 + fma(fract(fma(multiplyAddValue151, fragmentScalarConstants1.packedValues[558u], 0.5)), fma(multiplyAddValue152, comparisonValue134 ? (comparisonValue136 - 1.0) : comparisonValue136, float(comparisonValue134)) - multiplyAddValue153, multiplyAddValue153);
                            }
                            sumValue92 = scalarValue133 + 1u;
                            intermediateValue200 = sampledTextureValue22;
                            scalarValue133 = sumValue92;
                            continue;
                        }
                        sumValue72 = scalarValue46 + 1u;
                        intermediateValue199 = intermediateValue200;
                        scalarValue46 = sumValue72;
                        continue;
                    }
                    float comparisonValue138 = intermediateValue199 / rdSignedBitsToFloat(comparisonValue121 ? 1u : (clampedValue1 * clampedValue1));
                    comparisonValue45 = (comparisonValue138 < 1.0) ? spvNMin(spvNMax(comparisonValue138, 1.0 - fragmentScalarConstants1.packedValues[255u]), 1.0) : 1.0;
                }
                else
                {
                    comparisonValue45 = 1.0;
                }
                float scalarValue134 = spvNMin(spvNMin(comparisonValue45, intermediateValue172), intermediateValue138);
                float productValue255 = spvNMax(fragmentScalarConstants1.packedValues[557u] - spvNMin(fragmentScalarConstants1.packedValues[557u] * 0.100000001490116119384765625, 8.0), 0.0);
                float quotientValue28 = spvNClamp((-(productValue255 + multiplyAddValue76)) * (1.0 / (fragmentScalarConstants1.packedValues[557u] - productValue255)), 0.0, 1.0);
                multiplyAddValue62 = fma((quotientValue28 * quotientValue28) * fma(quotientValue28, -2.0, 3.0), 1.0 - scalarValue134, scalarValue134);
                intermediateValue107 = intermediateValue108;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                float comparisonValue44;
                if ((int(uint(int(fragmentScalarConstants1.packedValues[476u]))) > int(0u)) && (int(uint(int(fragmentScalarConstants1.packedValues[241u]))) > int(0u)))
                {
                    float multiplyAddValue305 = fma(fragmentVectorConstants1.packedValues[117u].w, multiplyAddValue283, fma(fragmentVectorConstants1.packedValues[115u].w, multiplyAddValue281, multiplyAddValue282 * fragmentVectorConstants1.packedValues[116u].w)) + fragmentVectorConstants1.packedValues[118u].w;
                    float scalarValue211 = spvNMin(spvNMax(productValue320, fragmentScalarConstants1.packedValues[244u]), 1.0);
                    float multiplyAddValue306 = ((fma(fragmentVectorConstants1.packedValues[117u].z, multiplyAddValue283, fma(fragmentVectorConstants1.packedValues[115u].z, multiplyAddValue281, multiplyAddValue282 * fragmentVectorConstants1.packedValues[116u].z)) + fragmentVectorConstants1.packedValues[118u].z) / multiplyAddValue305) - (fma(fragmentScalarConstants1.packedValues[194u], sqrt(fma(-scalarValue211, scalarValue211, 1.0)) / scalarValue211, fragmentScalarConstants1.packedValues[193u]) / (multiplyAddValue305 / multiplyAddValue305));
                    float multiplyAddValue307 = fma((fma(fragmentVectorConstants1.packedValues[117u].x, multiplyAddValue283, fma(fragmentVectorConstants1.packedValues[115u].x, multiplyAddValue281, multiplyAddValue282 * fragmentVectorConstants1.packedValues[116u].x)) + fragmentVectorConstants1.packedValues[118u].x) / multiplyAddValue305, 0.5, 0.5);
                    float multiplyAddValue308 = 1.0 - fma((fma(fragmentVectorConstants1.packedValues[117u].y, multiplyAddValue283, fma(fragmentVectorConstants1.packedValues[115u].y, multiplyAddValue281, multiplyAddValue282 * fragmentVectorConstants1.packedValues[116u].y)) + fragmentVectorConstants1.packedValues[118u].y) / multiplyAddValue305, 0.5, 0.5);
                    uint clampedValue1 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[254u] + 0.5))), int(1u), int(9u)));
                    bool conditionValue34 = !comparisonValue194;
                    uint comparisonValue206 = (comparisonValue194 ? 1u : clampedValue1) >> 1u;
                    float scalarValue212 = rdDot4Precise(fragmentVectorConstants1.packedValues[77u], vec4(1.0));
                    float intermediateValue197;
                    intermediateValue197 = 0.0;
                    uint sumValue72;
                    float intermediateValue198;
                    uint scalarValue46 = 0u;
                    for (;;)
                    {
                        if ((comparisonValue194 && (int(scalarValue46) >= int(1u))) || (conditionValue34 && (int(clampedValue1) <= int(scalarValue46))))
                        {
                            break;
                        }
                        float sumValue229 = rdSignedBitsToFloat(scalarValue46 - comparisonValue206) + 0.5;
                        intermediateValue198 = intermediateValue197;
                        uint sumValue92;
                        float sampledTextureValue23;
                        uint scalarValue133 = 0u;
                        for (;;)
                        {
                            if ((conditionValue34 && (int(clampedValue1) <= int(scalarValue133))) || (comparisonValue194 && (int(scalarValue133) >= int(1u))))
                            {
                                break;
                            }
                            float multiplyAddValue309 = fma(multiplyAddValue307, fragmentScalarConstants1.packedValues[192u], ((rdSignedBitsToFloat(scalarValue133 - comparisonValue206) + 0.5) * fragmentScalarConstants1.packedValues[552u]) * fragmentScalarConstants1.packedValues[192u]);
                            float multiplyAddValue310 = fma(multiplyAddValue308, fragmentScalarConstants1.packedValues[192u], (sumValue229 * fragmentScalarConstants1.packedValues[552u]) * fragmentScalarConstants1.packedValues[192u]);
                            if (comparisonValue194)
                            {
                                sampledTextureValue23 = (textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue309, multiplyAddValue310, scalarValue212), 0.0).x >= multiplyAddValue306) ? (intermediateValue198 + 1.0) : intermediateValue198;
                            }
                            else
                            {
                                vec4 sampledTextureValue105 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue309, multiplyAddValue310, scalarValue212));
                                float multiplyAddValue311 = fract(fma(multiplyAddValue309, fragmentScalarConstants1.packedValues[554u], 0.5));
                                bool comparisonValue207 = sampledTextureValue105.x >= multiplyAddValue306;
                                bool comparisonValue208 = sampledTextureValue105.w >= multiplyAddValue306;
                                float comparisonValue209 = float(sampledTextureValue105.y >= multiplyAddValue306);
                                float comparisonValue210 = float(sampledTextureValue105.z >= multiplyAddValue306);
                                float multiplyAddValue312 = fma(multiplyAddValue311, comparisonValue208 ? (comparisonValue210 - 1.0) : comparisonValue210, float(comparisonValue208));
                                sampledTextureValue23 = intermediateValue198 + fma(fract(fma(multiplyAddValue310, fragmentScalarConstants1.packedValues[554u], 0.5)), fma(multiplyAddValue311, comparisonValue207 ? (comparisonValue209 - 1.0) : comparisonValue209, float(comparisonValue207)) - multiplyAddValue312, multiplyAddValue312);
                            }
                            sumValue92 = scalarValue133 + 1u;
                            intermediateValue198 = sampledTextureValue23;
                            scalarValue133 = sumValue92;
                            continue;
                        }
                        sumValue72 = scalarValue46 + 1u;
                        intermediateValue197 = intermediateValue198;
                        scalarValue46 = sumValue72;
                        continue;
                    }
                    float comparisonValue211 = intermediateValue197 / rdSignedBitsToFloat(comparisonValue194 ? 1u : (clampedValue1 * clampedValue1));
                    comparisonValue44 = (comparisonValue211 < 1.0) ? spvNMin(spvNMax(comparisonValue211, 1.0 - fragmentScalarConstants1.packedValues[255u]), 1.0) : 1.0;
                }
                else
                {
                    comparisonValue44 = 1.0;
                }
                float scalarValue213 = spvNMin(spvNMin(comparisonValue44, intermediateValue170), intermediateValue136);
                float productValue325 = spvNMax(fragmentScalarConstants1.packedValues[553u] - spvNMin(fragmentScalarConstants1.packedValues[553u] * 0.100000001490116119384765625, 8.0), 0.0);
                float quotientValue42 = spvNClamp((-(productValue325 + multiplyAddValue76)) * (1.0 / (fragmentScalarConstants1.packedValues[553u] - productValue325)), 0.0, 1.0);
                multiplyAddValue65 = fma((quotientValue42 * quotientValue42) * fma(quotientValue42, -2.0, 3.0), 1.0 - scalarValue213, scalarValue213);
                intermediateValue105 = intermediateValue106;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue51 = branchMergedValue62;
                branchMergedValue58 = branchMergedValue65;
                branchMergedValue59 = branchMergedValue66;
                branchMergedValue60 = branchMergedValue67;
            }
            branchMergedValue11 = branchMergedValue51;
            branchMergedValue21 = branchMergedValue58;
            branchMergedValue22 = branchMergedValue59;
            branchMergedValue23 = branchMergedValue60;
        }
        else
        {
            branchMergedValue11 = 0.0;
            branchMergedValue21 = 0.0;
            branchMergedValue22 = 0.0;
            branchMergedValue23 = quotientValue21;
        }
        intermediateValue53 = branchMergedValue23;
        intermediateValue54 = branchMergedValue22;
        intermediateValue55 = branchMergedValue21;
        intermediateValue56 = branchMergedValue11;
    }
    else
    {
        intermediateValue53 = 0.0;
        intermediateValue54 = 0.0;
        intermediateValue55 = 0.0;
        intermediateValue56 = 0.0;
    }
    float productValue106;
    float productValue107;
    float productValue108;
    float productValue109;
    if (comparisonValue70)
    {
        float productValue196 = (multiplyAddValue18 + 1.0) * 0.5;
        float productValue197 = (multiplyAddValue19 + 1.0) * 0.5;
        uint scalarValue73 = uint(int(fragmentVectorConstants1.packedValues[144u].z));
        float multiplyAddValue55 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue20, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue19, multiplyAddValue18 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue20, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue19, multiplyAddValue18 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[145u].x) / (fragmentVectorConstants1.packedValues[145u].y - fragmentVectorConstants1.packedValues[145u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue73))) + (-0.5);
        uint sumValue110 = uint(min(int(uint(max(int(uint(int(multiplyAddValue55))), int(0u)))), int(scalarValue73 + 4294967294u)));
        float scalarValue74 = float(int(sumValue110));
        float sumValue111 = spvNMin(spvNMax(multiplyAddValue55 - scalarValue74, 0.0), 1.0);
        vec4 sampledTextureValue64 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue196, productValue197, scalarValue74), 0.0);
        float scalarValue75 = sampledTextureValue64.x;
        float scalarValue76 = sampledTextureValue64.y;
        float scalarValue77 = sampledTextureValue64.z;
        float scalarValue78 = sampledTextureValue64.w;
        vec4 sampledTextureValue65 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue196, productValue197, float(int(sumValue110 + 1u))), 0.0);
        productValue106 = ((sampledTextureValue65.x - scalarValue75) * sumValue111) + scalarValue75;
        productValue107 = ((sampledTextureValue65.y - scalarValue76) * sumValue111) + scalarValue76;
        productValue108 = ((sampledTextureValue65.z - scalarValue77) * sumValue111) + scalarValue77;
        productValue109 = ((sampledTextureValue65.w - scalarValue78) * sumValue111) + scalarValue78;
    }
    else
    {
        productValue106 = 0.0;
        productValue107 = 0.0;
        productValue108 = 0.0;
        productValue109 = 1.0;
    }
    float intermediateValue87;
    float intermediateValue88;
    float intermediateValue89;
    if (fragmentVectorConstants1.packedValues[132u].x != 0.0)
    {
        bool conditionValue6 = fragmentVectorConstants1.packedValues[136u].x > 0.0;
        float intermediateValue106;
        float intermediateValue107;
        float intermediateValue108;
        float multiplyAddValue35;
        float multiplyAddValue36;
        float multiplyAddValue37;
        if (fragmentVectorConstants1.packedValues[134u].w > 0.0)
        {
            intermediateValue106 = productValue64;
            intermediateValue107 = productValue66;
            intermediateValue108 = productValue67;
            multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue67, fma(fragmentVectorConstants1.packedValues[5u].x, productValue66, productValue64 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x;
            multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue67, fma(fragmentVectorConstants1.packedValues[5u].y, productValue66, productValue64 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y;
            multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue67, fma(fragmentVectorConstants1.packedValues[5u].z, productValue66, productValue64 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z;
        }
        else
        {
            intermediateValue106 = varyingTexCoord3.x;
            intermediateValue107 = varyingTexCoord3.y;
            intermediateValue108 = varyingTexCoord3.z;
            multiplyAddValue35 = multiplyAddValue13;
            multiplyAddValue36 = multiplyAddValue14;
            multiplyAddValue37 = multiplyAddValue15;
        }
        float sumValue112 = intermediateValue106 - fragmentVectorConstants1.packedValues[11u].x;
        float sumValue113 = intermediateValue107 - fragmentVectorConstants1.packedValues[11u].y;
        float sumValue114 = intermediateValue108 - fragmentVectorConstants1.packedValues[11u].z;
        float inverseLengthValue16 = inversesqrt(dot(vec3(sumValue112, sumValue113, sumValue114), vec3(sumValue112, sumValue113, sumValue114)));
        float productValue198 = inverseLengthValue16 * sumValue112;
        float productValue199 = inverseLengthValue16 * sumValue113;
        float productValue200 = inverseLengthValue16 * sumValue114;
        float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37), vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37)));
        float dotProductValue16 = dot(vec3(productValue198, productValue199, productValue200), vec3(productValue21, productValue22, productValue23)) * 2.0;
        float productValue201 = productValue198 - (dotProductValue16 * productValue21);
        float productValue202 = productValue199 - (dotProductValue16 * productValue22);
        float productValue203 = productValue200 - (dotProductValue16 * productValue23);
        float sumValue115 = 1.0 - intermediateValue16;
        float productValue204 = sumValue115 * sumValue115;
        float productValue205 = productValue204 * productValue204;
        precise float comparisonValue97 = 1.0 - ((uint(int(fragmentVectorConstants1.packedValues[114u].x)) == 1u) ? productValue204 : (productValue205 * productValue205));
        precise float productValue206 = (fragmentVectorConstants1.packedValues[132u].y + (-1.0)) * comparisonValue97;
        uint scalarValue79 = uint(int(fragmentVectorConstants1.packedValues[67u].x));
        vec4 sampledTextureValue66 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue201, productValue202, productValue203, float(int(scalarValue79))), productValue206);
        vec4 sampledTextureValue67 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue201, productValue202, productValue203, float(int(uint(int(scalarValue79 + 2u) - int(3u) * (int(scalarValue79 + 2u) / int(3u)))))), productValue206);
        float scalarValue80 = sampledTextureValue67.x;
        float scalarValue81 = sampledTextureValue67.y;
        float scalarValue82 = sampledTextureValue67.z;
        float productValue207 = ((sampledTextureValue66.x - scalarValue80) * fragmentVectorConstants1.packedValues[132u].w) + scalarValue80;
        float productValue208 = ((sampledTextureValue66.y - scalarValue81) * fragmentVectorConstants1.packedValues[132u].w) + scalarValue81;
        float productValue209 = ((sampledTextureValue66.z - scalarValue82) * fragmentVectorConstants1.packedValues[132u].w) + scalarValue82;
        float productValue210 = (((quotientValue9 * quotientValue9) * quotientValue9) * fragmentVectorConstants1.packedValues[132u].x) * fragmentVectorConstants1.packedValues[132u].z;
        float comparisonValue98 = (conditionValue6 ? (productValue207 * 301.72412109375) : productValue207) * productValue210;
        float comparisonValue99 = (conditionValue6 ? (productValue208 * 301.72412109375) : productValue208) * productValue210;
        float comparisonValue100 = (conditionValue6 ? (productValue209 * 301.72412109375) : productValue209) * productValue210;
        float comparisonValue31;
        float comparisonValue32;
        float comparisonValue33;
        if (comparisonValue69)
        {
            float productValue211 = fragmentVectorConstants1.packedValues[66u].x * fragmentVectorConstants1.packedValues[66u].w;
            float productValue212 = fragmentVectorConstants1.packedValues[66u].y * fragmentVectorConstants1.packedValues[66u].w;
            float productValue213 = fragmentVectorConstants1.packedValues[66u].z * fragmentVectorConstants1.packedValues[66u].w;
            float productValue214 = fragmentVectorConstants1.packedValues[58u].w * fragmentVectorConstants1.packedValues[74u].x;
            float productValue215 = productValue214 * intermediateValue23;
            float productValue216 = productValue214 * productValue29;
            float productValue217 = productValue214 * productValue30;
            float dotProductValue17 = spvNClamp(dot(vec3(productValue215, productValue216, productValue217), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
            float productValue218 = ((dotProductValue17 * (productValue215 - productValue211)) + productValue211) * intermediateValue17;
            float productValue219 = ((dotProductValue17 * (productValue216 - productValue212)) + productValue212) * intermediateValue17;
            float productValue220 = ((dotProductValue17 * (productValue217 - productValue213)) + productValue213) * intermediateValue17;
            float intermediateValue140;
            float intermediateValue141;
            float intermediateValue142;
            bool intermediateValue143;
            if (!(dot(vec3(comparisonValue98, comparisonValue99, comparisonValue100), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= dot(vec3(productValue218, productValue219, productValue220), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))))
            {
                intermediateValue140 = productValue218;
                intermediateValue141 = productValue219;
                intermediateValue142 = productValue220;
                intermediateValue143 = true;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue51 = branchMergedValue62;
                branchMergedValue58 = branchMergedValue65;
                branchMergedValue59 = branchMergedValue66;
                branchMergedValue60 = branchMergedValue67;
            }
            branchMergedValue11 = branchMergedValue51;
            branchMergedValue21 = branchMergedValue58;
            branchMergedValue22 = branchMergedValue59;
            branchMergedValue23 = branchMergedValue60;
        }
        else
        {
            branchMergedValue11 = 0.0;
            branchMergedValue21 = 0.0;
            branchMergedValue22 = 0.0;
            branchMergedValue23 = quotientValue63;
        }
        intermediateValue48 = branchMergedValue23;
        intermediateValue49 = branchMergedValue22;
        intermediateValue50 = branchMergedValue21;
        intermediateValue51 = branchMergedValue11;
    }
    else
    {
        intermediateValue48 = 0.0;
        intermediateValue49 = 0.0;
        intermediateValue50 = 0.0;
        intermediateValue51 = 0.0;
    }
    float productValue103;
    float productValue104;
    float productValue105;
    float productValue106;
    if (comparisonValue277)
    {
        float productValue196 = (multiplyAddValue18 + 1.0) * 0.5;
        float productValue197 = (multiplyAddValue19 + 1.0) * 0.5;
        uint scalarValue290 = uint(int(fragmentVectorConstants1.packedValues[143u].z));
        float multiplyAddValue408 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue20, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue19, multiplyAddValue18 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue20, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue19, multiplyAddValue18 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[144u].x) / (fragmentVectorConstants1.packedValues[144u].y - fragmentVectorConstants1.packedValues[144u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue290))) + (-0.5);
        uint sumValue308 = uint(min(int(uint(max(int(uint(int(multiplyAddValue408))), int(0u)))), int(scalarValue290 + 4294967294u)));
        float scalarValue291 = float(int(sumValue308));
        float sumValue309 = spvNMin(spvNMax(multiplyAddValue408 - scalarValue291, 0.0), 1.0);
        vec4 sampledTextureValue134 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue196, productValue197, scalarValue291), 0.0);
        float scalarValue292 = sampledTextureValue134.x;
        float scalarValue293 = sampledTextureValue134.y;
        float scalarValue294 = sampledTextureValue134.z;
        float scalarValue295 = sampledTextureValue134.w;
        vec4 sampledTextureValue135 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue196, productValue197, float(int(sumValue308 + 1u))), 0.0);
        productValue103 = ((sampledTextureValue135.x - scalarValue292) * sumValue309) + scalarValue292;
        productValue104 = ((sampledTextureValue135.y - scalarValue293) * sumValue309) + scalarValue293;
        productValue105 = ((sampledTextureValue135.z - scalarValue294) * sumValue309) + scalarValue294;
        productValue106 = ((sampledTextureValue135.w - scalarValue295) * sumValue309) + scalarValue295;
    }
    else
    {
        productValue103 = 0.0;
        productValue104 = 0.0;
        productValue105 = 0.0;
        productValue106 = 1.0;
    }
    float intermediateValue82;
    float intermediateValue83;
    float intermediateValue84;
    if (fragmentVectorConstants1.packedValues[131u].x != 0.0)
    {
        bool conditionValue46 = fragmentVectorConstants1.packedValues[135u].x > 0.0;
        float intermediateValue101;
        float intermediateValue102;
        float intermediateValue103;
        float multiplyAddValue35;
        float multiplyAddValue36;
        float multiplyAddValue37;
        if (fragmentVectorConstants1.packedValues[133u].w > 0.0)
        {
            intermediateValue101 = productValue376;
            intermediateValue102 = productValue377;
            intermediateValue103 = productValue378;
            multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue378, fma(fragmentVectorConstants1.packedValues[5u].x, productValue377, productValue376 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x;
            multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue378, fma(fragmentVectorConstants1.packedValues[5u].y, productValue377, productValue376 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y;
            multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue378, fma(fragmentVectorConstants1.packedValues[5u].z, productValue377, productValue376 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z;
        }
        else
        {
            intermediateValue101 = varyingTexCoord3.x;
            intermediateValue102 = varyingTexCoord3.y;
            intermediateValue103 = varyingTexCoord3.z;
            multiplyAddValue35 = multiplyAddValue13;
            multiplyAddValue36 = multiplyAddValue14;
            multiplyAddValue37 = multiplyAddValue15;
        }
        float sumValue310 = intermediateValue101 - fragmentVectorConstants1.packedValues[11u].x;
        float sumValue311 = intermediateValue102 - fragmentVectorConstants1.packedValues[11u].y;
        float sumValue312 = intermediateValue103 - fragmentVectorConstants1.packedValues[11u].z;
        float inverseLengthValue48 = inversesqrt(dot(vec3(sumValue310, sumValue311, sumValue312), vec3(sumValue310, sumValue311, sumValue312)));
        float productValue443 = inverseLengthValue48 * sumValue310;
        float productValue444 = inverseLengthValue48 * sumValue311;
        float productValue445 = inverseLengthValue48 * sumValue312;
        float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37), vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37)));
        float dotProductValue32 = dot(vec3(productValue443, productValue444, productValue445), vec3(productValue369, productValue370, productValue371)) * 2.0;
        float productValue446 = productValue443 - (dotProductValue32 * productValue369);
        float productValue447 = productValue444 - (dotProductValue32 * productValue370);
        float productValue448 = productValue445 - (dotProductValue32 * productValue371);
        float sumValue313 = 1.0 - intermediateValue11;
        float productValue449 = sumValue313 * sumValue313;
        float productValue450 = productValue449 * productValue449;
        precise float comparisonValue279 = 1.0 - ((uint(int(fragmentVectorConstants1.packedValues[113u].x)) == 1u) ? productValue449 : (productValue450 * productValue450));
        precise float productValue451 = (fragmentVectorConstants1.packedValues[131u].y + (-1.0)) * comparisonValue279;
        uint scalarValue296 = uint(int(fragmentVectorConstants1.packedValues[66u].x));
        vec4 sampledTextureValue136 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue446, productValue447, productValue448, float(int(scalarValue296))), productValue451);
        vec4 sampledTextureValue137 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue446, productValue447, productValue448, float(int(uint(int(scalarValue296 + 2u) - int(3u) * (int(scalarValue296 + 2u) / int(3u)))))), productValue451);
        float scalarValue297 = sampledTextureValue137.x;
        float scalarValue298 = sampledTextureValue137.y;
        float scalarValue299 = sampledTextureValue137.z;
        float productValue452 = ((sampledTextureValue136.x - scalarValue297) * fragmentVectorConstants1.packedValues[131u].w) + scalarValue297;
        float productValue453 = ((sampledTextureValue136.y - scalarValue298) * fragmentVectorConstants1.packedValues[131u].w) + scalarValue298;
        float productValue454 = ((sampledTextureValue136.z - scalarValue299) * fragmentVectorConstants1.packedValues[131u].w) + scalarValue299;
        float productValue455 = (((quotientValue56 * quotientValue56) * quotientValue56) * fragmentVectorConstants1.packedValues[131u].x) * fragmentVectorConstants1.packedValues[131u].z;
        float comparisonValue280 = (conditionValue46 ? (productValue452 * 301.72412109375) : productValue452) * productValue455;
        float comparisonValue281 = (conditionValue46 ? (productValue453 * 301.72412109375) : productValue453) * productValue455;
        float comparisonValue282 = (conditionValue46 ? (productValue454 * 301.72412109375) : productValue454) * productValue455;
        float comparisonValue31;
        float comparisonValue32;
        float comparisonValue33;
        if (comparisonValue276)
        {
            float productValue456 = fragmentVectorConstants1.packedValues[65u].x * fragmentVectorConstants1.packedValues[65u].w;
            float productValue457 = fragmentVectorConstants1.packedValues[65u].y * fragmentVectorConstants1.packedValues[65u].w;
            float productValue458 = fragmentVectorConstants1.packedValues[65u].z * fragmentVectorConstants1.packedValues[65u].w;
            float productValue459 = fragmentVectorConstants1.packedValues[58u].w * fragmentVectorConstants1.packedValues[73u].x;
            float productValue460 = productValue459 * intermediateValue18;
            float productValue461 = productValue459 * productValue26;
            float productValue462 = productValue459 * productValue27;
            float dotProductValue33 = spvNClamp(dot(vec3(productValue460, productValue461, productValue462), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
            float productValue463 = ((dotProductValue33 * (productValue460 - productValue456)) + productValue456) * intermediateValue12;
            float productValue464 = ((dotProductValue33 * (productValue461 - productValue457)) + productValue457) * intermediateValue12;
            float productValue465 = ((dotProductValue33 * (productValue462 - productValue458)) + productValue458) * intermediateValue12;
            float intermediateValue135;
            float intermediateValue136;
            float intermediateValue137;
            bool intermediateValue138;
            if (!(dot(vec3(comparisonValue280, comparisonValue281, comparisonValue282), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= dot(vec3(productValue463, productValue464, productValue465), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))))
            {
                intermediateValue135 = productValue463;
                intermediateValue136 = productValue464;
                intermediateValue137 = productValue465;
                intermediateValue138 = true;
#endif
            }
            else
            {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                multiplyAddValue62 = 1.0;
                intermediateValue107 = 1.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                multiplyAddValue65 = 1.0;
                intermediateValue105 = 1.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                intermediateValue140 = 0.0;
                intermediateValue141 = 0.0;
                intermediateValue142 = 0.0;
                intermediateValue143 = false;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                intermediateValue135 = 0.0;
                intermediateValue136 = 0.0;
                intermediateValue137 = 0.0;
                intermediateValue138 = false;
#endif
            }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float multiplyAddValue154 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[229u])));
            float multiplyAddValue155 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[229u])));
            float multiplyAddValue156 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[229u])));
            vec3 vectorValue14 = vec3(multiplyAddValue154, multiplyAddValue155, multiplyAddValue156);
            float inverseLengthValue31 = inversesqrt(rdDot3Precise2(vectorValue14, vectorValue14));
            float productValue256 = (exponentialValue3 * (fragmentScalarConstants1.packedValues[487u] * fragmentVectorConstants1.packedValues[121u].x)) * fragmentScalarConstants1.packedValues[256u];
            float productValue257 = (exponentialValue3 * (fragmentScalarConstants1.packedValues[487u] * fragmentVectorConstants1.packedValues[121u].y)) * fragmentScalarConstants1.packedValues[256u];
            float productValue258 = (exponentialValue3 * (fragmentScalarConstants1.packedValues[487u] * fragmentVectorConstants1.packedValues[121u].z)) * fragmentScalarConstants1.packedValues[256u];
            vec3 productValue259 = vec3(inverseLengthValue31 * multiplyAddValue154, inverseLengthValue31 * multiplyAddValue155, inverseLengthValue31 * multiplyAddValue156);
            float scalarValue135 = rdDot3Precise2(vectorValue12, productValue259);
            float scalarValue136 = spvNMax(scalarValue135, 0.0);
            float quotientValue29 = -(multiplyAddValue74 / sumValue137);
            float quotientValue30 = -(multiplyAddValue75 / sumValue137);
            float quotientValue31 = -(multiplyAddValue76 / sumValue137);
            vec3 vectorValue15 = vec3(quotientValue29, quotientValue30, quotientValue31);
            float scalarValue137 = spvNMax(rdDot3Precise2(vectorValue12, vectorValue15), 0.0);
            float sumValue148 = fragmentScalarConstants1.packedValues[565u] + 1.0;
            float productValue260 = sumValue148 * sumValue148;
            float multiplyAddValue157 = fma(productValue249, spvNMax((scalarValue135 + fragmentScalarConstants1.packedValues[565u]) / productValue260, 0.0) - scalarValue136, scalarValue136);
            float quotientValue32 = productValue249 * spvNMax((rdDot3Precise2(vec3(-multiplyAddValue93, -multiplyAddValue94, -multiplyAddValue95), productValue259) + fragmentScalarConstants1.packedValues[565u]) / productValue260, 0.0);
            float multiplyAddValue158 = fma(multiplyAddValue154, inverseLengthValue31, quotientValue29);
            float multiplyAddValue159 = fma(multiplyAddValue155, inverseLengthValue31, quotientValue30);
            float multiplyAddValue160 = fma(multiplyAddValue156, inverseLengthValue31, quotientValue31);
            vec3 vectorValue16 = vec3(multiplyAddValue158, multiplyAddValue159, multiplyAddValue160);
            float inverseLengthValue32 = inversesqrt(rdDot3Precise2(vectorValue16, vectorValue16));
            float scalarValue138 = spvNMax(intermediateValue44, 0.0500000007450580596923828125);
            float productValue261 = scalarValue138 * scalarValue138;
            vec3 productValue262 = vec3(inverseLengthValue32 * multiplyAddValue158, inverseLengthValue32 * multiplyAddValue159, inverseLengthValue32 * multiplyAddValue160);
            float scalarValue139 = spvNMax(rdDot3Precise2(vectorValue12, productValue262), 0.0);
            float multiplyAddValue161 = fma(scalarValue139 * scalarValue139, fma(productValue261, productValue261, -1.0), 1.0);
            float quotientValue33 = (productValue261 * productValue261) / ((multiplyAddValue161 * multiplyAddValue161) * 3.1415927410125732421875);
            float productValue263 = productValue261 * 0.5;
            float multiplyAddValue162 = fma(-productValue261, 0.5, 1.0);
            float multiplyAddValue163 = (scalarValue136 / (fma(scalarValue136, multiplyAddValue162, productValue263) + 9.9999997473787516355514526367188e-05)) * (scalarValue137 / (fma(scalarValue137, multiplyAddValue162, productValue263) + 9.9999997473787516355514526367188e-05));
            float sumValue149 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue15, productValue262), 0.0), 0.0);
            float productValue264 = sumValue149 * sumValue149;
            float productValue265 = sumValue149 * (productValue264 * productValue264);
            float multiplyAddValue164 = fma(1.0 - multiplyAddValue110, productValue265, multiplyAddValue110);
            float multiplyAddValue165 = fma(1.0 - multiplyAddValue111, productValue265, multiplyAddValue111);
            float multiplyAddValue166 = fma(1.0 - multiplyAddValue112, productValue265, multiplyAddValue112);
            float productValue266 = (exponentialValue6 * sumValue136) * 0.3183098733425140380859375;
            float productValue267 = (exponentialValue7 * sumValue136) * 0.3183098733425140380859375;
            float productValue268 = (exponentialValue8 * sumValue136) * 0.3183098733425140380859375;
            float multiplyAddValue167 = fma(scalarValue136 * scalarValue137, 4.0, 9.9999997473787516355514526367188e-05);
            multiplyAddValue45 = (productValue256 * fma(productValue266 * (multiplyAddValue157 * (1.0 - multiplyAddValue164)), multiplyAddValue62, intermediateValue107 * (quotientValue32 * productValue266))) * fragmentScalarConstants1.packedValues[492u];
            multiplyAddValue44 = (productValue257 * fma(productValue267 * (multiplyAddValue157 * (1.0 - multiplyAddValue165)), multiplyAddValue62, intermediateValue107 * (quotientValue32 * productValue267))) * fragmentScalarConstants1.packedValues[492u];
            multiplyAddValue43 = (productValue258 * fma(productValue268 * (multiplyAddValue157 * (1.0 - multiplyAddValue166)), multiplyAddValue62, intermediateValue107 * (quotientValue32 * productValue268))) * fragmentScalarConstants1.packedValues[492u];
            quotientValue5 = (productValue256 * (multiplyAddValue62 * (scalarValue136 * ((multiplyAddValue163 * (quotientValue33 * multiplyAddValue164)) / multiplyAddValue167)))) * fragmentScalarConstants1.packedValues[493u];
            quotientValue4 = (productValue257 * (multiplyAddValue62 * (scalarValue136 * ((multiplyAddValue163 * (quotientValue33 * multiplyAddValue165)) / multiplyAddValue167)))) * fragmentScalarConstants1.packedValues[493u];
            quotientValue3 = (productValue258 * (multiplyAddValue62 * (scalarValue136 * ((multiplyAddValue163 * (quotientValue33 * multiplyAddValue166)) / multiplyAddValue167)))) * fragmentScalarConstants1.packedValues[493u];
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float multiplyAddValue154 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[229u])));
            float multiplyAddValue155 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[229u])));
            float multiplyAddValue156 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[229u])));
            vec3 vectorValue14 = vec3(multiplyAddValue154, multiplyAddValue155, multiplyAddValue156);
            float inverseLengthValue31 = inversesqrt(rdDot3Precise2(vectorValue14, vectorValue14));
            float productValue326 = (exponentialValue * (fragmentScalarConstants1.packedValues[483u] * fragmentVectorConstants1.packedValues[120u].x)) * fragmentScalarConstants1.packedValues[256u];
            float productValue327 = (exponentialValue * (fragmentScalarConstants1.packedValues[483u] * fragmentVectorConstants1.packedValues[120u].y)) * fragmentScalarConstants1.packedValues[256u];
            float productValue328 = (exponentialValue * (fragmentScalarConstants1.packedValues[483u] * fragmentVectorConstants1.packedValues[120u].z)) * fragmentScalarConstants1.packedValues[256u];
            vec3 productValue259 = vec3(inverseLengthValue31 * multiplyAddValue154, inverseLengthValue31 * multiplyAddValue155, inverseLengthValue31 * multiplyAddValue156);
            float scalarValue214 = rdDot3Precise2(vectorValue25, productValue259);
            float scalarValue215 = spvNMax(scalarValue214, 0.0);
            float quotientValue29 = -(multiplyAddValue74 / sumValue137);
            float quotientValue30 = -(multiplyAddValue75 / sumValue137);
            float quotientValue31 = -(multiplyAddValue76 / sumValue137);
            vec3 vectorValue15 = vec3(quotientValue29, quotientValue30, quotientValue31);
            float scalarValue216 = spvNMax(rdDot3Precise2(vectorValue25, vectorValue15), 0.0);
            float sumValue230 = fragmentScalarConstants1.packedValues[561u] + 1.0;
            float productValue329 = sumValue230 * sumValue230;
            float multiplyAddValue313 = fma(productValue319, spvNMax((scalarValue214 + fragmentScalarConstants1.packedValues[561u]) / productValue329, 0.0) - scalarValue215, scalarValue215);
            float quotientValue43 = productValue319 * spvNMax((rdDot3Precise2(vec3(-multiplyAddValue264, -multiplyAddValue265, -multiplyAddValue266), productValue259) + fragmentScalarConstants1.packedValues[561u]) / productValue329, 0.0);
            float multiplyAddValue158 = fma(multiplyAddValue154, inverseLengthValue31, quotientValue29);
            float multiplyAddValue159 = fma(multiplyAddValue155, inverseLengthValue31, quotientValue30);
            float multiplyAddValue160 = fma(multiplyAddValue156, inverseLengthValue31, quotientValue31);
            vec3 vectorValue16 = vec3(multiplyAddValue158, multiplyAddValue159, multiplyAddValue160);
            float inverseLengthValue32 = inversesqrt(rdDot3Precise2(vectorValue16, vectorValue16));
            float scalarValue217 = spvNMax(intermediateValue42, 0.0500000007450580596923828125);
            float productValue330 = scalarValue217 * scalarValue217;
            vec3 productValue262 = vec3(inverseLengthValue32 * multiplyAddValue158, inverseLengthValue32 * multiplyAddValue159, inverseLengthValue32 * multiplyAddValue160);
            float scalarValue218 = spvNMax(rdDot3Precise2(vectorValue25, productValue262), 0.0);
            float multiplyAddValue314 = fma(scalarValue218 * scalarValue218, fma(productValue330, productValue330, -1.0), 1.0);
            float quotientValue44 = (productValue330 * productValue330) / ((multiplyAddValue314 * multiplyAddValue314) * 3.1415927410125732421875);
            float productValue331 = productValue330 * 0.5;
            float multiplyAddValue315 = fma(-productValue330, 0.5, 1.0);
            float multiplyAddValue316 = (scalarValue215 / (fma(scalarValue215, multiplyAddValue315, productValue331) + 9.9999997473787516355514526367188e-05)) * (scalarValue216 / (fma(scalarValue216, multiplyAddValue315, productValue331) + 9.9999997473787516355514526367188e-05));
            float sumValue149 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue15, productValue262), 0.0), 0.0);
            float productValue264 = sumValue149 * sumValue149;
            float productValue265 = sumValue149 * (productValue264 * productValue264);
            float multiplyAddValue317 = fma(1.0 - multiplyAddValue275, productValue265, multiplyAddValue275);
            float multiplyAddValue318 = fma(1.0 - multiplyAddValue276, productValue265, multiplyAddValue276);
            float multiplyAddValue319 = fma(1.0 - multiplyAddValue277, productValue265, multiplyAddValue277);
            float productValue332 = (multiplyAddValue249 * sumValue194) * 0.3183098733425140380859375;
            float productValue333 = (multiplyAddValue250 * sumValue194) * 0.3183098733425140380859375;
            float productValue334 = (multiplyAddValue251 * sumValue194) * 0.3183098733425140380859375;
            float multiplyAddValue320 = fma(scalarValue215 * scalarValue216, 4.0, 9.9999997473787516355514526367188e-05);
            multiplyAddValue48 = (productValue326 * fma(productValue332 * (multiplyAddValue313 * (1.0 - multiplyAddValue317)), multiplyAddValue65, intermediateValue105 * (quotientValue43 * productValue332))) * fragmentScalarConstants1.packedValues[488u];
            multiplyAddValue47 = (productValue327 * fma(productValue333 * (multiplyAddValue313 * (1.0 - multiplyAddValue318)), multiplyAddValue65, intermediateValue105 * (quotientValue43 * productValue333))) * fragmentScalarConstants1.packedValues[488u];
            multiplyAddValue46 = (productValue328 * fma(productValue334 * (multiplyAddValue313 * (1.0 - multiplyAddValue319)), multiplyAddValue65, intermediateValue105 * (quotientValue43 * productValue334))) * fragmentScalarConstants1.packedValues[488u];
            quotientValue5 = (productValue326 * (multiplyAddValue65 * (scalarValue215 * ((multiplyAddValue316 * (quotientValue44 * multiplyAddValue317)) / multiplyAddValue320)))) * fragmentScalarConstants1.packedValues[489u];
            quotientValue4 = (productValue327 * (multiplyAddValue65 * (scalarValue215 * ((multiplyAddValue316 * (quotientValue44 * multiplyAddValue318)) / multiplyAddValue320)))) * fragmentScalarConstants1.packedValues[489u];
            quotientValue3 = (productValue328 * (multiplyAddValue65 * (scalarValue215 * ((multiplyAddValue316 * (quotientValue44 * multiplyAddValue319)) / multiplyAddValue320)))) * fragmentScalarConstants1.packedValues[489u];
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            comparisonValue31 = intermediateValue143 ? intermediateValue140 : comparisonValue98;
            comparisonValue32 = intermediateValue143 ? intermediateValue141 : comparisonValue99;
            comparisonValue33 = intermediateValue143 ? intermediateValue142 : comparisonValue100;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            comparisonValue31 = intermediateValue138 ? intermediateValue135 : comparisonValue280;
            comparisonValue32 = intermediateValue138 ? intermediateValue136 : comparisonValue281;
            comparisonValue33 = intermediateValue138 ? intermediateValue137 : comparisonValue282;
#endif
        }
        else
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue45 = 0.0;
            multiplyAddValue44 = 0.0;
            multiplyAddValue43 = 0.0;
            quotientValue5 = 0.0;
            quotientValue4 = 0.0;
            quotientValue3 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue48 = 0.0;
            multiplyAddValue47 = 0.0;
            multiplyAddValue46 = 0.0;
            quotientValue5 = 0.0;
            quotientValue4 = 0.0;
            quotientValue3 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            comparisonValue31 = comparisonValue98;
            comparisonValue32 = comparisonValue99;
            comparisonValue33 = comparisonValue100;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            comparisonValue31 = comparisonValue280;
            comparisonValue32 = comparisonValue281;
            comparisonValue33 = comparisonValue282;
#endif
        }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue118;
        float intermediateValue120;
        float intermediateValue122;
        if (fragmentScalarConstants1.packedValues[259u] != 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float intermediateValue116;
        float intermediateValue118;
        float intermediateValue120;
        if (fragmentScalarConstants1.packedValues[259u] != 0.0)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue68 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23), vec3((-0.0) - (multiplyAddValue35 * inverseLengthValue17), (-0.0) - (multiplyAddValue36 * inverseLengthValue17), (-0.0) - (multiplyAddValue37 * inverseLengthValue17))), 0.0, 1.0), sumValue115));
        float scalarValue83 = sampledTextureValue68.x;
        float scalarValue84 = sampledTextureValue68.y;
        float quotientValue24 = (fragmentVectorConstants1.packedValues[138u].x - fragmentVectorConstants1.packedValues[68u].x) + (nonlinearValue / fragmentVectorConstants1.packedValues[68u].z);
        float comparisonValue101 = 1.0 - spvNClamp(comparisonValue96 ? (quotientValue24 * fragmentVectorConstants1.packedValues[68u].y) : (quotientValue24 / (fragmentVectorConstants1.packedValues[68u].y - fragmentVectorConstants1.packedValues[68u].x)), 0.0, 1.0);
        float productValue221 = (((scalarValue83 * productValue82) + scalarValue84) * comparisonValue31) * comparisonValue101;
        float productValue222 = (((scalarValue83 * productValue83) + scalarValue84) * comparisonValue32) * comparisonValue101;
        float productValue223 = (((scalarValue83 * productValue84) + scalarValue84) * comparisonValue33) * comparisonValue101;
        float branchMergedValue13;
        float branchMergedValue24;
        float branchMergedValue25;
        if (comparisonValue70)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue138 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue395, multiplyAddValue396, multiplyAddValue397), vec3((-0.0) - (multiplyAddValue35 * inverseLengthValue17), (-0.0) - (multiplyAddValue36 * inverseLengthValue17), (-0.0) - (multiplyAddValue37 * inverseLengthValue17))), 0.0, 1.0), sumValue313));
        float scalarValue300 = sampledTextureValue138.x;
        float scalarValue301 = sampledTextureValue138.y;
        float quotientValue66 = (fragmentVectorConstants1.packedValues[137u].x - fragmentVectorConstants1.packedValues[67u].x) + (nonlinearValue / fragmentVectorConstants1.packedValues[67u].z);
        float comparisonValue283 = 1.0 - spvNClamp(comparisonValue278 ? (quotientValue66 * fragmentVectorConstants1.packedValues[67u].y) : (quotientValue66 / (fragmentVectorConstants1.packedValues[67u].y - fragmentVectorConstants1.packedValues[67u].x)), 0.0, 1.0);
        float productValue466 = (((scalarValue300 * productValue381) + scalarValue301) * comparisonValue31) * comparisonValue283;
        float productValue467 = (((scalarValue300 * productValue382) + scalarValue301) * comparisonValue32) * comparisonValue283;
        float productValue468 = (((scalarValue300 * productValue383) + scalarValue301) * comparisonValue33) * comparisonValue283;
        float branchMergedValue13;
        float branchMergedValue24;
        float branchMergedValue25;
        if (comparisonValue277)
#endif
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float multiplyAddValue168 = fma(productValue233, 0.20000000298023223876953125, sumValue6 - 0.5);
            float multiplyAddValue169 = fma(productValue234, 0.20000000298023223876953125, sumValue7 - 0.5);
            float multiplyAddValue170 = fma(productValue235, 0.20000000298023223876953125, sumValue8 - 0.5);
            uint productValue269 = uint(int(floor(floor(multiplyAddValue168) * 0.0625)));
            uint productValue270 = uint(int(floor(floor(multiplyAddValue169) * 0.0625)));
            uint productValue271 = uint(int(floor(floor(multiplyAddValue170) * 0.0625)));
            uint scalarValue140 = bitfieldInsert(productValue269, productValue270, int(16u), int(16u));
            uint bitwiseValue38 = productValue271 & 65535u;
            uint productValue272 = productValue269 * 1540483477u;
            uint productValue273 = productValue270 * 1540483477u;
            uint productValue274 = productValue271 * 1540483477u;
            uint bitwiseValue39 = (((((productValue273 ^ (productValue273 >> 24u)) * 1540483477u) ^ ((((productValue272 ^ (productValue272 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u) ^ ((productValue274 ^ (productValue274 >> 24u)) * 1540483477u)) * 1540483477u;
            uint bitwiseValue40 = ((bitwiseValue39 >> 13u) ^ bitwiseValue39) * 1540483477u;
            uint bitwiseValue41 = bitwiseValue40 ^ (bitwiseValue40 >> 15u);
            uint bitwiseValue42 = (bitwiseValue41 ^ (bitwiseValue41 >> 16u)) & 65535u;
            bool comparisonValue139 = bitwiseValue42 != 0u;
            uint bitwiseValue43 = bitwiseValue42 | 1u;
            uint sumValue150 = uint(fragmentScalarConstants1.packedValues[236u]) - 1u;
            uint comparisonValue140 = (comparisonValue139 ? bitwiseValue42 : bitwiseValue43) & sumValue150;
            uint comparisonValue26;
            uint comparisonValue27;
            uint bitwiseValue7;
            uint sumValue34;
            uint intermediateValue170;
            uint intermediateValue171;
            uint scalarValue141 = 0u;
            uint scalarValue142 = 0u;
            uint scalarValue143 = comparisonValue140;
            uint scalarValue144 = 0u;
            for (;;)
            {
                if (int(scalarValue144) >= int(8u))
                {
                    intermediateValue170 = scalarValue142;
                    intermediateValue171 = scalarValue141;
                    break;
                }
                uint bitwiseValue44 = intermediateValue7.packedValues[scalarValue143].z & 65535u;
                bool comparisonValue141 = (bitwiseValue38 == intermediateValue7.packedValues[scalarValue143].y) && (((comparisonValue139 && (bitwiseValue42 == bitwiseValue44)) || ((!comparisonValue139) && (bitwiseValue43 == bitwiseValue44))) && (scalarValue140 == intermediateValue7.packedValues[scalarValue143].x));
                bool comparisonValue142 = scalarValue141 != 0u;
                comparisonValue27 = (comparisonValue142 || (!comparisonValue141)) ? scalarValue142 : intermediateValue7.packedValues[scalarValue143].w;
                comparisonValue26 = comparisonValue141 ? 4294967295u : scalarValue141;
                bitwiseValue7 = sumValue150 & (scalarValue143 + 1u);
                bool comparisonValue143 = (bitwiseValue44 == 0u) || comparisonValue141;
                if (comparisonValue143 || (comparisonValue142 && (!comparisonValue143)))
                {
                    intermediateValue170 = comparisonValue27;
                    intermediateValue171 = comparisonValue26;
                    break;
                }
                sumValue34 = scalarValue144 + 1u;
                scalarValue141 = comparisonValue26;
                scalarValue142 = comparisonValue27;
                scalarValue143 = bitwiseValue7;
                scalarValue144 = sumValue34;
                continue;
            }
            float intermediateValue119;
            float intermediateValue121;
            float intermediateValue123;
            if (intermediateValue171 != 0u)
            {
                float productValue275 = floor(multiplyAddValue168 * 0.0625);
                float productValue276 = floor(multiplyAddValue169 * 0.0625);
                float productValue277 = floor(multiplyAddValue170 * 0.0625);
                float multiplyAddValue171 = fma(-productValue275, 16.0, multiplyAddValue168);
                float multiplyAddValue172 = fma(-productValue276, 16.0, multiplyAddValue169);
                float multiplyAddValue173 = fma(-productValue277, 16.0, multiplyAddValue170);
                uint bitwiseValue45 = intermediateValue170 >> 2u;
                float scalarValue145 = abs(productValue233);
                float scalarValue146 = abs(productValue234);
                float scalarValue147 = abs(productValue235);
                float multiplyAddValue126;
                float multiplyAddValue127;
                float multiplyAddValue128;
                if (((scalarValue145 >= 1.0) || (scalarValue146 >= 1.0)) || (scalarValue147 >= 1.0))
                {
                    vec3 vectorValue17 = vec3(scalarValue145, scalarValue146, scalarValue147);
                    float scalarValue148 = rdDot3Precise2(vec3(multiplyAddValue171, multiplyAddValue172, multiplyAddValue173), vectorValue17);
                    float scalarValue149 = rdDot3Precise2(vec3(multiplyAddValue172, multiplyAddValue173, multiplyAddValue171), vectorValue17);
                    float scalarValue150 = rdDot3Precise2(vec3(multiplyAddValue173, multiplyAddValue171, multiplyAddValue172), vectorValue17);
                    float multiplyAddValue174 = (fma(multiplyAddValue3, inverseLengthValue24, productValue234 + productValue233) > 0.0) ? ceil(scalarValue148) : floor(scalarValue148);
                    float scalarValue151 = floor(scalarValue149);
                    float scalarValue152 = floor(scalarValue150);
                    float multiplyAddValue175 = fma(scalarValue146, scalarValue152, fma(scalarValue145, multiplyAddValue174, scalarValue151 * scalarValue147));
                    float multiplyAddValue178 = fma(scalarValue147, scalarValue152, fma(scalarValue146, multiplyAddValue174, scalarValue151 * scalarValue145));
                    float multiplyAddValue181 = fma(scalarValue145, scalarValue152, fma(scalarValue147, multiplyAddValue174, scalarValue151 * scalarValue146));
                    float sumValue151 = scalarValue147 + multiplyAddValue175;
                    float sumValue152 = scalarValue145 + multiplyAddValue178;
                    float sumValue153 = scalarValue146 + multiplyAddValue181;
                    float sumValue154 = scalarValue146 + multiplyAddValue175;
                    float sumValue155 = scalarValue147 + multiplyAddValue178;
                    float sumValue156 = scalarValue145 + multiplyAddValue181;
                    float sumValue157 = scalarValue146 + sumValue151;
                    float sumValue158 = scalarValue147 + sumValue152;
                    float sumValue159 = scalarValue145 + sumValue153;
                    float sumValue160 = scalarValue149 - scalarValue151;
                    float sumValue161 = scalarValue150 - scalarValue152;
                    float sumValue162 = (scalarValue151 - scalarValue149) + 1.0;
                    float sumValue163 = (scalarValue152 - scalarValue150) + 1.0;
                    float productValue278 = sumValue162 * sumValue163;
                    float productValue279 = sumValue160 * sumValue163;
                    float productValue280 = sumValue161 * sumValue162;
                    float productValue281 = sumValue160 * sumValue161;
                    float comparisonValue72;
                    float comparisonValue73;
                    float comparisonValue74;
                    float comparisonValue75;
                    float comparisonValue76;
                    float comparisonValue77;
                    float comparisonValue78;
                    float comparisonValue79;
                    float comparisonValue80;
                    float comparisonValue81;
                    float comparisonValue82;
                    float comparisonValue83;
                    if ((((multiplyAddValue175 >= 0.0) && (multiplyAddValue178 >= 0.0)) && (multiplyAddValue181 >= 0.0)) && ((sumValue159 < 16.0) && ((sumValue157 < 16.0) && (sumValue158 < 16.0))))
                    {
                        uint bitwiseValue46 = bitwiseValue45 + (((uint(multiplyAddValue181) << 4u) + uint(multiplyAddValue178)) + (uint(multiplyAddValue175) << 8u));
                        float bitwiseValue47 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue46] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue144 = intermediateValue11.packedValues[bitwiseValue46] != 0u;
                        uint bitwiseValue48 = bitwiseValue45 + (((uint(sumValue153) << 4u) + uint(sumValue152)) + (uint(sumValue151) << 8u));
                        float bitwiseValue49 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue48] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue145 = intermediateValue11.packedValues[bitwiseValue48] != 0u;
                        uint bitwiseValue50 = bitwiseValue45 + (((uint(sumValue156) << 4u) + uint(sumValue155)) + (uint(sumValue154) << 8u));
                        float bitwiseValue51 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue50] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue146 = intermediateValue11.packedValues[bitwiseValue50] != 0u;
                        uint bitwiseValue52 = bitwiseValue45 + (((uint(sumValue159) << 4u) + uint(sumValue158)) + (uint(sumValue157) << 8u));
                        float bitwiseValue53 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue52] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue147 = intermediateValue11.packedValues[bitwiseValue52] != 0u;
                        comparisonValue72 = comparisonValue147 ? ((bitwiseValue53 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue52] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue73 = comparisonValue147 ? ((bitwiseValue53 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue52] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue74 = comparisonValue147 ? ((bitwiseValue53 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue52] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue75 = comparisonValue146 ? ((bitwiseValue51 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue50] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue76 = comparisonValue146 ? ((bitwiseValue51 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue50] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue77 = comparisonValue146 ? ((bitwiseValue51 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue50] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue78 = comparisonValue144 ? ((bitwiseValue47 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue46] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue79 = comparisonValue144 ? ((bitwiseValue47 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue46] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue80 = comparisonValue144 ? ((bitwiseValue47 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue46] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue81 = comparisonValue145 ? ((bitwiseValue49 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue48] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue82 = comparisonValue145 ? ((bitwiseValue49 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue48] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue83 = comparisonValue145 ? ((bitwiseValue49 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue48] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    else
                    {
                        float multiplyAddValue182 = fma(productValue275, 16.0, multiplyAddValue175);
                        float multiplyAddValue183 = fma(productValue276, 16.0, multiplyAddValue178);
                        float multiplyAddValue184 = fma(productValue277, 16.0, multiplyAddValue181);
                        uint comparisonValue148 = min((((((bitfieldInsert(bitfieldInsert(0u, (multiplyAddValue175 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (multiplyAddValue175 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (multiplyAddValue178 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue178 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue181 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue181 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue16 = int(intermediateValue21[comparisonValue148].x) < int(0u);
                        uint sumValue164 = bitwiseValue45 + 4097u;
                        uint sumValue165 = bitwiseValue45 + 4096u;
                        uint multiplyAddValue185 = conditionValue16 ? (bitwiseValue45 + (bitfieldInsert(bitfieldInsert(0u, uint(multiplyAddValue181), int(4u), int(4u)), uint(multiplyAddValue178), int(0u), int(4u)) + bitfieldInsert(0u, uint(multiplyAddValue175), int(8u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue148].x + sumValue164] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue184 * 0.0625), 16.0, multiplyAddValue184)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue183 * 0.0625), 16.0, multiplyAddValue183)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue182 * 0.0625), 16.0, multiplyAddValue182)), int(8u), int(4u))));
                        float bitwiseValue54 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue185] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue149 = (conditionValue16 || (((1u << (intermediateValue21[comparisonValue148].x & 31u)) & intermediateValue11.packedValues[sumValue165]) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue185] != 0u);
                        float multiplyAddValue186 = fma(productValue275, 16.0, sumValue151);
                        float multiplyAddValue187 = fma(productValue276, 16.0, sumValue152);
                        float multiplyAddValue188 = fma(productValue277, 16.0, sumValue153);
                        uint comparisonValue150 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue151 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue151 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue152 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue152 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue153 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue153 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue17 = int(intermediateValue21[comparisonValue150].x) < int(0u);
                        uint multiplyAddValue189 = conditionValue17 ? (bitwiseValue45 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue153), int(4u), int(4u)), uint(sumValue152), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue151), int(8u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue150].x + sumValue164] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue188 * 0.0625), 16.0, multiplyAddValue188)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue187 * 0.0625), 16.0, multiplyAddValue187)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue186 * 0.0625), 16.0, multiplyAddValue186)), int(8u), int(4u))));
                        float bitwiseValue55 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue189] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue151 = (conditionValue17 || (((1u << (intermediateValue21[comparisonValue150].x & 31u)) & intermediateValue11.packedValues[sumValue165]) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue189] != 0u);
                        float multiplyAddValue190 = fma(productValue275, 16.0, sumValue154);
                        float multiplyAddValue191 = fma(productValue276, 16.0, sumValue155);
                        float multiplyAddValue192 = fma(productValue277, 16.0, sumValue156);
                        uint comparisonValue152 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue154 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue154 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue155 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue155 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue156 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue156 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue18 = int(intermediateValue21[comparisonValue152].x) < int(0u);
                        uint multiplyAddValue193 = conditionValue18 ? (bitwiseValue45 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue156), int(4u), int(4u)), uint(sumValue155), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue154), int(8u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue152].x + sumValue164] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue192 * 0.0625), 16.0, multiplyAddValue192)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue191 * 0.0625), 16.0, multiplyAddValue191)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue190 * 0.0625), 16.0, multiplyAddValue190)), int(8u), int(4u))));
                        float bitwiseValue56 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue193] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue153 = (conditionValue18 || (((1u << (intermediateValue21[comparisonValue152].x & 31u)) & intermediateValue11.packedValues[sumValue165]) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue193] != 0u);
                        float multiplyAddValue194 = fma(productValue275, 16.0, sumValue157);
                        float multiplyAddValue195 = fma(productValue276, 16.0, sumValue158);
                        float multiplyAddValue196 = fma(productValue277, 16.0, sumValue159);
                        uint comparisonValue154 = min(((bitfieldInsert(0u, (sumValue159 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue159 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue158 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue157 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue157 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue158 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue19 = int(intermediateValue21[comparisonValue154].x) < int(0u);
                        uint multiplyAddValue197 = conditionValue19 ? (bitwiseValue45 + (bitfieldInsert(0u, uint(sumValue157), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue159), int(4u), int(4u)), uint(sumValue158), int(0u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue154].x + sumValue164] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue194 * 0.0625), 16.0, multiplyAddValue194)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue196 * 0.0625), 16.0, multiplyAddValue196)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue195 * 0.0625), 16.0, multiplyAddValue195)), int(0u), int(4u))));
                        float bitwiseValue57 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue197] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue155 = (conditionValue19 || (((1u << (intermediateValue21[comparisonValue154].x & 31u)) & intermediateValue11.packedValues[sumValue165]) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue197] != 0u);
                        comparisonValue72 = comparisonValue155 ? ((bitwiseValue57 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue197] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue73 = comparisonValue155 ? ((bitwiseValue57 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue197] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue74 = comparisonValue155 ? ((bitwiseValue57 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue197] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue75 = comparisonValue153 ? ((bitwiseValue56 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue193] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue76 = comparisonValue153 ? ((bitwiseValue56 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue193] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue77 = comparisonValue153 ? ((bitwiseValue56 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue193] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue78 = comparisonValue149 ? ((bitwiseValue54 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue185] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue79 = comparisonValue149 ? ((bitwiseValue54 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue185] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue80 = comparisonValue149 ? ((bitwiseValue54 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue185] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue81 = comparisonValue151 ? ((bitwiseValue55 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue189] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue82 = comparisonValue151 ? ((bitwiseValue55 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue189] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue83 = comparisonValue151 ? ((bitwiseValue55 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue189] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    multiplyAddValue126 = fma(comparisonValue74, productValue281, fma(comparisonValue77, productValue280, fma(comparisonValue80, productValue278, productValue279 * comparisonValue83)));
                    multiplyAddValue127 = fma(comparisonValue73, productValue281, fma(comparisonValue76, productValue280, fma(comparisonValue79, productValue278, productValue279 * comparisonValue82)));
                    multiplyAddValue128 = fma(comparisonValue72, productValue281, fma(comparisonValue75, productValue280, fma(comparisonValue78, productValue278, productValue279 * comparisonValue81)));
                }
                else
                {
                    float scalarValue153 = floor(multiplyAddValue171);
                    float scalarValue154 = floor(multiplyAddValue172);
                    float scalarValue155 = floor(multiplyAddValue173);
                    float sumValue166 = multiplyAddValue171 - scalarValue153;
                    float sumValue167 = multiplyAddValue172 - scalarValue154;
                    float sumValue168 = multiplyAddValue173 - scalarValue155;
                    uint comparisonValue156 = bitfieldInsert(bitfieldInsert(0u, (sumValue167 >= sumValue168) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue166 >= sumValue167) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue166 >= sumValue168) ? 4294967295u : 0u, int(2u), int(1u));
                    float scalarValue156 = spvNMin(sumValue167, sumValue166);
                    float scalarValue157 = spvNMax(sumValue167, sumValue166);
                    float scalarValue158 = spvNMin(sumValue168, scalarValue156);
                    float scalarValue159 = spvNMax(sumValue168, scalarValue157);
                    float scalarValue160 = spvNMax(scalarValue156, spvNMin(sumValue168, scalarValue157));
                    float sumValue169 = 1.0 - scalarValue159;
                    float sumValue170 = scalarValue159 - scalarValue160;
                    float sumValue171 = scalarValue160 - scalarValue158;
                    float sumValue172 = scalarValue153 + 1.0;
                    float sumValue173 = scalarValue154 + 1.0;
                    float sumValue174 = scalarValue155 + 1.0;
                    float comparisonValue84;
                    float comparisonValue85;
                    float comparisonValue86;
                    float comparisonValue87;
                    float comparisonValue88;
                    float comparisonValue89;
                    float comparisonValue90;
                    float comparisonValue91;
                    float comparisonValue92;
                    float comparisonValue93;
                    float comparisonValue94;
                    float comparisonValue95;
                    if (((sumValue174 < 16.0) && ((sumValue172 < 16.0) && (sumValue173 < 16.0))) && (((scalarValue153 >= 0.0) && (scalarValue154 >= 0.0)) && (scalarValue155 >= 0.0)))
                    {
                        uint scalarValue161 = uint(scalarValue153);
                        uint scalarValue162 = uint(scalarValue154);
                        uint scalarValue163 = uint(scalarValue155);
                        uint sumValue175 = min((comparisonValue156 + 4u), 68u);
                        uint sumValue176 = min((comparisonValue156 + 12u), 68u);
                        uint bitwiseValue58 = bitwiseValue45 + (((scalarValue163 << 4u) + scalarValue162) + (scalarValue161 << 8u));
                        float bitwiseValue59 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue58] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue157 = intermediateValue11.packedValues[bitwiseValue58] != 0u;
                        uint bitwiseValue60 = bitwiseValue45 + ((((uint(comparisonValue156 < 2u) + scalarValue163) << 4u) + (intermediateValue21[sumValue175].z + scalarValue162)) + ((intermediateValue21[sumValue175].y + scalarValue161) << 8u));
                        float bitwiseValue61 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue60] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue158 = intermediateValue11.packedValues[bitwiseValue60] != 0u;
                        uint bitwiseValue62 = bitwiseValue45 + ((((uint(comparisonValue156 < 6u) + scalarValue163) << 4u) + (intermediateValue21[sumValue176].z + scalarValue162)) + ((intermediateValue21[sumValue176].y + scalarValue161) << 8u));
                        float bitwiseValue63 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue62] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue159 = intermediateValue11.packedValues[bitwiseValue62] != 0u;
                        uint bitwiseValue64 = bitwiseValue45 + ((((scalarValue163 + 1u) << 4u) + (scalarValue162 + 1u)) + ((scalarValue161 + 1u) << 8u));
                        float bitwiseValue65 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue64] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue160 = intermediateValue11.packedValues[bitwiseValue64] != 0u;
                        comparisonValue84 = comparisonValue160 ? ((bitwiseValue65 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue64] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue85 = comparisonValue160 ? ((bitwiseValue65 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue64] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue86 = comparisonValue160 ? ((bitwiseValue65 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue64] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue87 = comparisonValue159 ? ((bitwiseValue63 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue62] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue88 = comparisonValue159 ? ((bitwiseValue63 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue62] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue89 = comparisonValue159 ? ((bitwiseValue63 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue62] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue90 = comparisonValue157 ? ((bitwiseValue59 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue58] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue91 = comparisonValue157 ? ((bitwiseValue59 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue58] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue92 = comparisonValue157 ? ((bitwiseValue59 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue58] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue93 = comparisonValue158 ? ((bitwiseValue61 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue60] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue94 = comparisonValue158 ? ((bitwiseValue61 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue60] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue95 = comparisonValue158 ? ((bitwiseValue61 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue60] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    else
                    {
                        uint sumValue177 = min((comparisonValue156 + 4u), 68u);
                        float sumValue178 = scalarValue153 + rdEvaluateFloatExpression(intermediateValue21[sumValue177].y);
                        float sumValue179 = scalarValue154 + rdEvaluateFloatExpression(intermediateValue21[sumValue177].z);
                        float sumValue180 = scalarValue155 + rdEvaluateFloatExpression(uint(comparisonValue156 < 2u));
                        uint sumValue181 = min((comparisonValue156 + 12u), 68u);
                        float sumValue182 = scalarValue153 + rdEvaluateFloatExpression(intermediateValue21[sumValue181].y);
                        float sumValue183 = scalarValue154 + rdEvaluateFloatExpression(intermediateValue21[sumValue181].z);
                        float sumValue184 = scalarValue155 + rdEvaluateFloatExpression(uint(comparisonValue156 < 6u));
                        float multiplyAddValue198 = fma(productValue275, 16.0, scalarValue153);
                        float multiplyAddValue199 = fma(productValue276, 16.0, scalarValue154);
                        float multiplyAddValue200 = fma(productValue277, 16.0, scalarValue155);
                        uint comparisonValue161 = min((((((bitfieldInsert(bitfieldInsert(0u, (scalarValue153 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (scalarValue153 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (scalarValue154 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (scalarValue154 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (scalarValue155 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (scalarValue155 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue20 = int(intermediateValue21[comparisonValue161].x) < int(0u);
                        uint sumValue185 = bitwiseValue45 + 4097u;
                        uint sumValue186 = bitwiseValue45 + 4096u;
                        uint multiplyAddValue201 = conditionValue20 ? (bitwiseValue45 + (bitfieldInsert(bitfieldInsert(0u, uint(scalarValue155), int(4u), int(4u)), uint(scalarValue154), int(0u), int(4u)) + bitfieldInsert(0u, uint(scalarValue153), int(8u), int(4u)))) : ((intermediateValue11.packedValues[sumValue185 + intermediateValue21[comparisonValue161].x] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue200 * 0.0625), 16.0, multiplyAddValue200)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue199 * 0.0625), 16.0, multiplyAddValue199)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue198 * 0.0625), 16.0, multiplyAddValue198)), int(8u), int(4u))));
                        float bitwiseValue66 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue201] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue162 = (conditionValue20 || ((intermediateValue11.packedValues[sumValue186] & (1u << (intermediateValue21[comparisonValue161].x & 31u))) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue201] != 0u);
                        float multiplyAddValue202 = fma(productValue275, 16.0, sumValue178);
                        float multiplyAddValue203 = fma(productValue276, 16.0, sumValue179);
                        float multiplyAddValue204 = fma(productValue277, 16.0, sumValue180);
                        uint comparisonValue163 = min(((bitfieldInsert(0u, (sumValue180 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue180 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue179 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue178 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue178 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue179 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue21 = int(intermediateValue21[comparisonValue163].x) < int(0u);
                        uint multiplyAddValue205 = conditionValue21 ? (bitwiseValue45 + (bitfieldInsert(0u, uint(sumValue178), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue180), int(4u), int(4u)), uint(sumValue179), int(0u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue163].x + sumValue185] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue202 * 0.0625), 16.0, multiplyAddValue202)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue204 * 0.0625), 16.0, multiplyAddValue204)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue203 * 0.0625), 16.0, multiplyAddValue203)), int(0u), int(4u))));
                        float bitwiseValue67 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue205] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue164 = (conditionValue21 || ((intermediateValue11.packedValues[sumValue186] & (1u << (intermediateValue21[comparisonValue163].x & 31u))) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue205] != 0u);
                        float multiplyAddValue206 = fma(productValue275, 16.0, sumValue182);
                        float multiplyAddValue207 = fma(productValue276, 16.0, sumValue183);
                        float multiplyAddValue208 = fma(productValue277, 16.0, sumValue184);
                        uint comparisonValue165 = min(((bitfieldInsert(0u, (sumValue184 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue184 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue183 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue182 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue182 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue183 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue22 = int(intermediateValue21[comparisonValue165].x) < int(0u);
                        uint multiplyAddValue209 = conditionValue22 ? (bitwiseValue45 + (bitfieldInsert(0u, uint(sumValue182), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue184), int(4u), int(4u)), uint(sumValue183), int(0u), int(4u)))) : ((intermediateValue11.packedValues[sumValue185 + intermediateValue21[comparisonValue165].x] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue206 * 0.0625), 16.0, multiplyAddValue206)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue208 * 0.0625), 16.0, multiplyAddValue208)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue207 * 0.0625), 16.0, multiplyAddValue207)), int(0u), int(4u))));
                        float bitwiseValue68 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue209] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue166 = (conditionValue22 || ((intermediateValue11.packedValues[sumValue186] & (1u << (intermediateValue21[comparisonValue165].x & 31u))) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue209] != 0u);
                        float multiplyAddValue210 = fma(productValue275, 16.0, sumValue172);
                        float multiplyAddValue211 = fma(productValue276, 16.0, sumValue173);
                        float multiplyAddValue212 = fma(productValue277, 16.0, sumValue174);
                        uint comparisonValue167 = min(((bitfieldInsert(0u, (sumValue174 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue174 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue173 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue172 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue172 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue173 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue23 = int(intermediateValue21[comparisonValue167].x) < int(0u);
                        uint multiplyAddValue213 = conditionValue23 ? (bitwiseValue45 + (bitfieldInsert(0u, uint(sumValue172), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue174), int(4u), int(4u)), uint(sumValue173), int(0u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue167].x + sumValue185] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue210 * 0.0625), 16.0, multiplyAddValue210)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue212 * 0.0625), 16.0, multiplyAddValue212)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue211 * 0.0625), 16.0, multiplyAddValue211)), int(0u), int(4u))));
                        float bitwiseValue69 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue213] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue168 = (conditionValue23 || ((intermediateValue11.packedValues[sumValue186] & (1u << (intermediateValue21[comparisonValue167].x & 31u))) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue213] != 0u);
                        comparisonValue84 = comparisonValue168 ? ((bitwiseValue69 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue213] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue85 = comparisonValue168 ? ((bitwiseValue69 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue213] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue86 = comparisonValue168 ? ((bitwiseValue69 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue213] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue87 = comparisonValue166 ? ((bitwiseValue68 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue209] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue88 = comparisonValue166 ? ((bitwiseValue68 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue209] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue89 = comparisonValue166 ? ((bitwiseValue68 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue209] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue90 = comparisonValue162 ? ((bitwiseValue66 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue201] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue91 = comparisonValue162 ? ((bitwiseValue66 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue201] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue92 = comparisonValue162 ? ((bitwiseValue66 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue201] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue93 = comparisonValue164 ? ((bitwiseValue67 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue205] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue94 = comparisonValue164 ? ((bitwiseValue67 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue205] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue95 = comparisonValue164 ? ((bitwiseValue67 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue205] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    multiplyAddValue126 = fma(comparisonValue86, scalarValue158, fma(comparisonValue89, sumValue171, fma(comparisonValue92, sumValue169, sumValue170 * comparisonValue95)));
                    multiplyAddValue127 = fma(comparisonValue85, scalarValue158, fma(comparisonValue88, sumValue171, fma(comparisonValue91, sumValue169, sumValue170 * comparisonValue94)));
                    multiplyAddValue128 = fma(comparisonValue84, scalarValue158, fma(comparisonValue87, sumValue171, fma(comparisonValue90, sumValue169, sumValue170 * comparisonValue93)));
                }
                intermediateValue123 = multiplyAddValue126;
                intermediateValue121 = multiplyAddValue127;
                intermediateValue119 = multiplyAddValue128;
            }
            else
            {
                intermediateValue123 = 0.0;
                intermediateValue121 = 0.0;
                intermediateValue119 = 0.0;
            }
            intermediateValue118 = intermediateValue119;
            intermediateValue120 = intermediateValue121;
            intermediateValue122 = intermediateValue123;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float multiplyAddValue321 = fma(productValue312, 0.20000000298023223876953125, sumValue217 - 0.5);
            float multiplyAddValue322 = fma(productValue313, 0.20000000298023223876953125, sumValue218 - 0.5);
            float multiplyAddValue323 = fma(productValue314, 0.20000000298023223876953125, sumValue219 - 0.5);
            uint productValue335 = uint(int(floor(floor(multiplyAddValue321) * 0.0625)));
            uint productValue336 = uint(int(floor(floor(multiplyAddValue322) * 0.0625)));
            uint productValue337 = uint(int(floor(floor(multiplyAddValue323) * 0.0625)));
            uint scalarValue219 = bitfieldInsert(productValue335, productValue336, int(16u), int(16u));
            uint bitwiseValue74 = productValue337 & 65535u;
            uint productValue338 = productValue335 * 1540483477u;
            uint productValue339 = productValue336 * 1540483477u;
            uint productValue340 = productValue337 * 1540483477u;
            uint bitwiseValue75 = (((productValue340 ^ (productValue340 >> 24u)) * 1540483477u) ^ ((((productValue339 ^ (productValue339 >> 24u)) * 1540483477u) ^ ((((productValue338 ^ (productValue338 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u)) * 1540483477u;
            uint bitwiseValue76 = ((bitwiseValue75 >> 13u) ^ bitwiseValue75) * 1540483477u;
            uint bitwiseValue77 = bitwiseValue76 ^ (bitwiseValue76 >> 15u);
            uint bitwiseValue78 = (bitwiseValue77 ^ (bitwiseValue77 >> 16u)) & 65535u;
            bool comparisonValue212 = bitwiseValue78 != 0u;
            uint bitwiseValue79 = bitwiseValue78 | 1u;
            uint sumValue150 = uint(fragmentScalarConstants1.packedValues[236u]) - 1u;
            uint comparisonValue213 = (comparisonValue212 ? bitwiseValue78 : bitwiseValue79) & sumValue150;
            uint comparisonValue25;
            uint comparisonValue26;
            uint bitwiseValue7;
            uint sumValue34;
            uint intermediateValue168;
            uint intermediateValue169;
            uint scalarValue141 = 0u;
            uint scalarValue142 = 0u;
            uint scalarValue220 = comparisonValue213;
            uint scalarValue144 = 0u;
            for (;;)
            {
                if (int(scalarValue144) >= int(8u))
                {
                    intermediateValue168 = scalarValue142;
                    intermediateValue169 = scalarValue141;
                    break;
                }
                uint bitwiseValue80 = intermediateValue8.packedValues[scalarValue220].z & 65535u;
                bool comparisonValue214 = (bitwiseValue74 == intermediateValue8.packedValues[scalarValue220].y) && (((comparisonValue212 && (bitwiseValue78 == bitwiseValue80)) || ((!comparisonValue212) && (bitwiseValue79 == bitwiseValue80))) && (scalarValue219 == intermediateValue8.packedValues[scalarValue220].x));
                bool comparisonValue142 = scalarValue141 != 0u;
                comparisonValue26 = (comparisonValue142 || (!comparisonValue214)) ? scalarValue142 : intermediateValue8.packedValues[scalarValue220].w;
                comparisonValue25 = comparisonValue214 ? 4294967295u : scalarValue141;
                bitwiseValue7 = sumValue150 & (scalarValue220 + 1u);
                bool comparisonValue215 = (bitwiseValue80 == 0u) || comparisonValue214;
                if ((comparisonValue142 && (!comparisonValue215)) || comparisonValue215)
                {
                    intermediateValue168 = comparisonValue26;
                    intermediateValue169 = comparisonValue25;
                    break;
                }
                sumValue34 = scalarValue144 + 1u;
                scalarValue141 = comparisonValue25;
                scalarValue142 = comparisonValue26;
                scalarValue220 = bitwiseValue7;
                scalarValue144 = sumValue34;
                continue;
            }
            float intermediateValue117;
            float intermediateValue119;
            float intermediateValue121;
            if (intermediateValue169 != 0u)
            {
                float productValue341 = floor(multiplyAddValue321 * 0.0625);
                float productValue342 = floor(multiplyAddValue322 * 0.0625);
                float productValue343 = floor(multiplyAddValue323 * 0.0625);
                float multiplyAddValue324 = fma(-productValue341, 16.0, multiplyAddValue321);
                float multiplyAddValue325 = fma(-productValue342, 16.0, multiplyAddValue322);
                float multiplyAddValue326 = fma(-productValue343, 16.0, multiplyAddValue323);
                uint bitwiseValue81 = intermediateValue168 >> 2u;
                float scalarValue221 = abs(productValue312);
                float scalarValue222 = abs(productValue313);
                float scalarValue223 = abs(productValue314);
                float multiplyAddValue129;
                float multiplyAddValue130;
                float multiplyAddValue131;
                if (((scalarValue221 >= 1.0) || (scalarValue222 >= 1.0)) || (scalarValue223 >= 1.0))
                {
                    vec3 vectorValue27 = vec3(scalarValue221, scalarValue222, scalarValue223);
                    float scalarValue224 = rdDot3Precise2(vec3(multiplyAddValue324, multiplyAddValue325, multiplyAddValue326), vectorValue27);
                    float scalarValue225 = rdDot3Precise2(vec3(multiplyAddValue325, multiplyAddValue326, multiplyAddValue324), vectorValue27);
                    float scalarValue226 = rdDot3Precise2(vec3(multiplyAddValue326, multiplyAddValue324, multiplyAddValue325), vectorValue27);
                    float multiplyAddValue327 = (fma(multiplyAddValue6, inverseLengthValue39, productValue313 + productValue312) > 0.0) ? ceil(scalarValue224) : floor(scalarValue224);
                    float scalarValue227 = floor(scalarValue225);
                    float scalarValue228 = floor(scalarValue226);
                    float multiplyAddValue328 = fma(scalarValue222, scalarValue228, fma(scalarValue221, multiplyAddValue327, scalarValue227 * scalarValue223));
                    float multiplyAddValue329 = fma(scalarValue223, scalarValue228, fma(scalarValue222, multiplyAddValue327, scalarValue227 * scalarValue221));
                    float multiplyAddValue330 = fma(scalarValue221, scalarValue228, fma(scalarValue223, multiplyAddValue327, scalarValue227 * scalarValue222));
                    float sumValue231 = scalarValue223 + multiplyAddValue328;
                    float sumValue232 = scalarValue221 + multiplyAddValue329;
                    float sumValue233 = scalarValue222 + multiplyAddValue330;
                    float sumValue234 = scalarValue222 + multiplyAddValue328;
                    float sumValue235 = scalarValue223 + multiplyAddValue329;
                    float sumValue236 = scalarValue221 + multiplyAddValue330;
                    float sumValue237 = scalarValue222 + sumValue231;
                    float sumValue238 = scalarValue223 + sumValue232;
                    float sumValue239 = scalarValue221 + sumValue233;
                    float sumValue240 = scalarValue225 - scalarValue227;
                    float sumValue241 = scalarValue226 - scalarValue228;
                    float sumValue242 = (scalarValue227 - scalarValue225) + 1.0;
                    float sumValue243 = (scalarValue228 - scalarValue226) + 1.0;
                    float productValue344 = sumValue242 * sumValue243;
                    float productValue345 = sumValue240 * sumValue243;
                    float productValue346 = sumValue241 * sumValue242;
                    float productValue347 = sumValue240 * sumValue241;
                    float comparisonValue71;
                    float comparisonValue72;
                    float comparisonValue73;
                    float comparisonValue74;
                    float comparisonValue75;
                    float comparisonValue76;
                    float comparisonValue77;
                    float comparisonValue78;
                    float comparisonValue79;
                    float comparisonValue80;
                    float comparisonValue81;
                    float comparisonValue82;
                    if ((((multiplyAddValue328 >= 0.0) && (multiplyAddValue329 >= 0.0)) && (multiplyAddValue330 >= 0.0)) && (((sumValue237 < 16.0) && (sumValue238 < 16.0)) && (sumValue239 < 16.0)))
                    {
                        uint bitwiseValue82 = bitwiseValue81 + (((uint(multiplyAddValue330) << 4u) + uint(multiplyAddValue329)) + (uint(multiplyAddValue328) << 8u));
                        float bitwiseValue83 = rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue82] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue216 = intermediateValue12.packedValues[bitwiseValue82] != 0u;
                        uint bitwiseValue84 = bitwiseValue81 + (((uint(sumValue233) << 4u) + uint(sumValue232)) + (uint(sumValue231) << 8u));
                        float bitwiseValue85 = rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue84] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue217 = intermediateValue12.packedValues[bitwiseValue84] != 0u;
                        uint bitwiseValue86 = bitwiseValue81 + ((uint(sumValue234) << 8u) + ((uint(sumValue236) << 4u) + uint(sumValue235)));
                        float bitwiseValue87 = rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue86] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue218 = intermediateValue12.packedValues[bitwiseValue86] != 0u;
                        uint bitwiseValue88 = bitwiseValue81 + (((uint(sumValue239) << 4u) + uint(sumValue238)) + (uint(sumValue237) << 8u));
                        float bitwiseValue89 = rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue88] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue219 = intermediateValue12.packedValues[bitwiseValue88] != 0u;
                        comparisonValue71 = comparisonValue219 ? ((bitwiseValue89 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue88] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue72 = comparisonValue219 ? ((bitwiseValue89 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue88] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue73 = comparisonValue219 ? ((bitwiseValue89 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[bitwiseValue88] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue74 = comparisonValue218 ? ((bitwiseValue87 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue86] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue75 = comparisonValue218 ? ((bitwiseValue87 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue86] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue76 = comparisonValue218 ? ((bitwiseValue87 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[bitwiseValue86] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue77 = comparisonValue216 ? ((bitwiseValue83 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue82] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue78 = comparisonValue216 ? ((bitwiseValue83 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue82] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue79 = comparisonValue216 ? ((bitwiseValue83 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[bitwiseValue82] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue80 = comparisonValue217 ? ((bitwiseValue85 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue84] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue81 = comparisonValue217 ? ((bitwiseValue85 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue84] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue82 = comparisonValue217 ? ((bitwiseValue85 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[bitwiseValue84] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    else
                    {
                        float multiplyAddValue331 = fma(productValue341, 16.0, multiplyAddValue328);
                        float multiplyAddValue332 = fma(productValue342, 16.0, multiplyAddValue329);
                        float multiplyAddValue333 = fma(productValue343, 16.0, multiplyAddValue330);
                        uint comparisonValue220 = min((((((bitfieldInsert(bitfieldInsert(0u, (multiplyAddValue328 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (multiplyAddValue328 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (multiplyAddValue329 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue329 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue330 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue330 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue35 = int(intermediateValue23[comparisonValue220].x) < int(0u);
                        uint sumValue244 = bitwiseValue81 + 4097u;
                        uint sumValue245 = bitwiseValue81 + 4096u;
                        uint multiplyAddValue334 = conditionValue35 ? (bitwiseValue81 + (bitfieldInsert(bitfieldInsert(0u, uint(multiplyAddValue330), int(4u), int(4u)), uint(multiplyAddValue329), int(0u), int(4u)) + bitfieldInsert(0u, uint(multiplyAddValue328), int(8u), int(4u)))) : ((intermediateValue12.packedValues[intermediateValue23[comparisonValue220].x + sumValue244] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue333 * 0.0625), 16.0, multiplyAddValue333)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue332 * 0.0625), 16.0, multiplyAddValue332)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue331 * 0.0625), 16.0, multiplyAddValue331)), int(8u), int(4u))));
                        float bitwiseValue90 = rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue334] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue221 = (conditionValue35 || (((1u << (intermediateValue23[comparisonValue220].x & 31u)) & intermediateValue12.packedValues[sumValue245]) != 0u)) && (intermediateValue12.packedValues[multiplyAddValue334] != 0u);
                        float multiplyAddValue335 = fma(productValue341, 16.0, sumValue231);
                        float multiplyAddValue336 = fma(productValue342, 16.0, sumValue232);
                        float multiplyAddValue337 = fma(productValue343, 16.0, sumValue233);
                        uint comparisonValue222 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue231 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue231 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue232 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue232 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue233 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue233 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue36 = int(intermediateValue23[comparisonValue222].x) < int(0u);
                        uint multiplyAddValue338 = conditionValue36 ? (bitwiseValue81 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue233), int(4u), int(4u)), uint(sumValue232), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue231), int(8u), int(4u)))) : ((intermediateValue12.packedValues[intermediateValue23[comparisonValue222].x + sumValue244] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue337 * 0.0625), 16.0, multiplyAddValue337)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue336 * 0.0625), 16.0, multiplyAddValue336)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue335 * 0.0625), 16.0, multiplyAddValue335)), int(8u), int(4u))));
                        float bitwiseValue91 = rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue338] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue223 = (conditionValue36 || (((1u << (intermediateValue23[comparisonValue222].x & 31u)) & intermediateValue12.packedValues[sumValue245]) != 0u)) && (intermediateValue12.packedValues[multiplyAddValue338] != 0u);
                        float multiplyAddValue339 = fma(productValue341, 16.0, sumValue234);
                        float multiplyAddValue340 = fma(productValue342, 16.0, sumValue235);
                        float multiplyAddValue341 = fma(productValue343, 16.0, sumValue236);
                        uint comparisonValue224 = min(((bitfieldInsert(0u, (sumValue236 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue236 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue235 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue234 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue234 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue235 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue37 = int(intermediateValue23[comparisonValue224].x) < int(0u);
                        uint multiplyAddValue342 = conditionValue37 ? (bitwiseValue81 + (bitfieldInsert(0u, uint(sumValue234), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue236), int(4u), int(4u)), uint(sumValue235), int(0u), int(4u)))) : ((intermediateValue12.packedValues[sumValue244 + intermediateValue23[comparisonValue224].x] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue339 * 0.0625), 16.0, multiplyAddValue339)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue341 * 0.0625), 16.0, multiplyAddValue341)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue340 * 0.0625), 16.0, multiplyAddValue340)), int(0u), int(4u))));
                        float bitwiseValue92 = rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue342] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue225 = (conditionValue37 || (((1u << (intermediateValue23[comparisonValue224].x & 31u)) & intermediateValue12.packedValues[sumValue245]) != 0u)) && (intermediateValue12.packedValues[multiplyAddValue342] != 0u);
                        float multiplyAddValue343 = fma(productValue341, 16.0, sumValue237);
                        float multiplyAddValue344 = fma(productValue342, 16.0, sumValue238);
                        float multiplyAddValue345 = fma(productValue343, 16.0, sumValue239);
                        uint comparisonValue226 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue237 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue237 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue238 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue238 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue239 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue239 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue38 = int(intermediateValue23[comparisonValue226].x) < int(0u);
                        uint multiplyAddValue346 = conditionValue38 ? (bitwiseValue81 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue239), int(4u), int(4u)), uint(sumValue238), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue237), int(8u), int(4u)))) : ((intermediateValue12.packedValues[sumValue244 + intermediateValue23[comparisonValue226].x] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue345 * 0.0625), 16.0, multiplyAddValue345)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue344 * 0.0625), 16.0, multiplyAddValue344)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue343 * 0.0625), 16.0, multiplyAddValue343)), int(8u), int(4u))));
                        float bitwiseValue93 = rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue346] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue227 = (conditionValue38 || (((1u << (intermediateValue23[comparisonValue226].x & 31u)) & intermediateValue12.packedValues[sumValue245]) != 0u)) && (intermediateValue12.packedValues[multiplyAddValue346] != 0u);
                        comparisonValue71 = comparisonValue227 ? ((bitwiseValue93 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue346] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue72 = comparisonValue227 ? ((bitwiseValue93 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue346] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue73 = comparisonValue227 ? ((bitwiseValue93 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[multiplyAddValue346] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue74 = comparisonValue225 ? ((bitwiseValue92 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue342] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue75 = comparisonValue225 ? ((bitwiseValue92 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue342] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue76 = comparisonValue225 ? ((bitwiseValue92 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[multiplyAddValue342] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue77 = comparisonValue221 ? ((bitwiseValue90 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue334] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue78 = comparisonValue221 ? ((bitwiseValue90 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue334] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue79 = comparisonValue221 ? ((bitwiseValue90 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[multiplyAddValue334] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue80 = comparisonValue223 ? ((bitwiseValue91 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue338] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue81 = comparisonValue223 ? ((bitwiseValue91 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue338] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue82 = comparisonValue223 ? ((bitwiseValue91 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[multiplyAddValue338] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    multiplyAddValue129 = fma(comparisonValue73, productValue347, fma(comparisonValue76, productValue346, fma(comparisonValue79, productValue344, productValue345 * comparisonValue82)));
                    multiplyAddValue130 = fma(comparisonValue72, productValue347, fma(comparisonValue75, productValue346, fma(comparisonValue78, productValue344, productValue345 * comparisonValue81)));
                    multiplyAddValue131 = fma(comparisonValue71, productValue347, fma(comparisonValue74, productValue346, fma(comparisonValue77, productValue344, productValue345 * comparisonValue80)));
                }
                else
                {
                    float scalarValue229 = floor(multiplyAddValue324);
                    float scalarValue230 = floor(multiplyAddValue325);
                    float scalarValue231 = floor(multiplyAddValue326);
                    float sumValue246 = multiplyAddValue324 - scalarValue229;
                    float sumValue247 = multiplyAddValue325 - scalarValue230;
                    float sumValue248 = multiplyAddValue326 - scalarValue231;
                    uint comparisonValue228 = bitfieldInsert(bitfieldInsert(0u, (sumValue247 >= sumValue248) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue246 >= sumValue247) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue246 >= sumValue248) ? 4294967295u : 0u, int(2u), int(1u));
                    float scalarValue232 = spvNMin(sumValue247, sumValue246);
                    float scalarValue233 = spvNMax(sumValue247, sumValue246);
                    float scalarValue234 = spvNMin(sumValue248, scalarValue232);
                    float scalarValue235 = spvNMax(sumValue248, scalarValue233);
                    float scalarValue236 = spvNMax(scalarValue232, spvNMin(sumValue248, scalarValue233));
                    float sumValue249 = 1.0 - scalarValue235;
                    float sumValue250 = scalarValue235 - scalarValue236;
                    float sumValue251 = scalarValue236 - scalarValue234;
                    float sumValue252 = scalarValue229 + 1.0;
                    float sumValue253 = scalarValue230 + 1.0;
                    float sumValue254 = scalarValue231 + 1.0;
                    float comparisonValue83;
                    float comparisonValue84;
                    float comparisonValue85;
                    float comparisonValue86;
                    float comparisonValue87;
                    float comparisonValue88;
                    float comparisonValue89;
                    float comparisonValue90;
                    float comparisonValue91;
                    float comparisonValue92;
                    float comparisonValue93;
                    float comparisonValue94;
                    if (((sumValue254 < 16.0) && ((sumValue252 < 16.0) && (sumValue253 < 16.0))) && (((scalarValue229 >= 0.0) && (scalarValue230 >= 0.0)) && (scalarValue231 >= 0.0)))
                    {
                        uint scalarValue237 = uint(scalarValue229);
                        uint scalarValue238 = uint(scalarValue230);
                        uint scalarValue239 = uint(scalarValue231);
                        uint sumValue255 = min((comparisonValue228 + 4u), 68u);
                        uint sumValue256 = min((comparisonValue228 + 12u), 68u);
                        uint bitwiseValue94 = bitwiseValue81 + (((scalarValue239 << 4u) + scalarValue238) + (scalarValue237 << 8u));
                        float bitwiseValue95 = rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue94] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue229 = intermediateValue12.packedValues[bitwiseValue94] != 0u;
                        uint bitwiseValue96 = bitwiseValue81 + ((((uint(comparisonValue228 < 2u) + scalarValue239) << 4u) + (scalarValue238 + intermediateValue23[sumValue255].z)) + ((intermediateValue23[sumValue255].y + scalarValue237) << 8u));
                        float bitwiseValue97 = rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue96] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue230 = intermediateValue12.packedValues[bitwiseValue96] != 0u;
                        uint bitwiseValue98 = bitwiseValue81 + ((((uint(comparisonValue228 < 6u) + scalarValue239) << 4u) + (intermediateValue23[sumValue256].z + scalarValue238)) + ((intermediateValue23[sumValue256].y + scalarValue237) << 8u));
                        float bitwiseValue99 = rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue98] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue231 = intermediateValue12.packedValues[bitwiseValue98] != 0u;
                        uint bitwiseValue100 = bitwiseValue81 + ((((scalarValue239 + 1u) << 4u) + (scalarValue238 + 1u)) + ((scalarValue237 + 1u) << 8u));
                        float bitwiseValue101 = rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue100] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue232 = intermediateValue12.packedValues[bitwiseValue100] != 0u;
                        comparisonValue83 = comparisonValue232 ? ((bitwiseValue101 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue100] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue84 = comparisonValue232 ? ((bitwiseValue101 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue100] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue85 = comparisonValue232 ? ((bitwiseValue101 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[bitwiseValue100] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue86 = comparisonValue231 ? ((bitwiseValue99 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue98] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue87 = comparisonValue231 ? ((bitwiseValue99 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue98] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue88 = comparisonValue231 ? ((bitwiseValue99 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[bitwiseValue98] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue89 = comparisonValue229 ? ((bitwiseValue95 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue94] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue90 = comparisonValue229 ? ((bitwiseValue95 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue94] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue91 = comparisonValue229 ? ((bitwiseValue95 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[bitwiseValue94] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue92 = comparisonValue230 ? ((bitwiseValue97 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue96] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue93 = comparisonValue230 ? ((bitwiseValue97 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[bitwiseValue96] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue94 = comparisonValue230 ? ((bitwiseValue97 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[bitwiseValue96] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    else
                    {
                        uint sumValue257 = min((comparisonValue228 + 4u), 68u);
                        float sumValue258 = scalarValue229 + rdEvaluateFloatExpression(intermediateValue23[sumValue257].y);
                        float sumValue259 = scalarValue230 + rdEvaluateFloatExpression(intermediateValue23[sumValue257].z);
                        float sumValue260 = scalarValue231 + rdEvaluateFloatExpression(uint(comparisonValue228 < 2u));
                        uint sumValue261 = min((comparisonValue228 + 12u), 68u);
                        float sumValue262 = scalarValue229 + rdEvaluateFloatExpression(intermediateValue23[sumValue261].y);
                        float sumValue263 = scalarValue230 + rdEvaluateFloatExpression(intermediateValue23[sumValue261].z);
                        float sumValue264 = scalarValue231 + rdEvaluateFloatExpression(uint(comparisonValue228 < 6u));
                        float multiplyAddValue347 = fma(productValue341, 16.0, scalarValue229);
                        float multiplyAddValue348 = fma(productValue342, 16.0, scalarValue230);
                        float multiplyAddValue349 = fma(productValue343, 16.0, scalarValue231);
                        uint comparisonValue233 = min((((((bitfieldInsert(bitfieldInsert(0u, (scalarValue229 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (scalarValue229 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (scalarValue230 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (scalarValue230 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (scalarValue231 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (scalarValue231 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue39 = int(intermediateValue23[comparisonValue233].x) < int(0u);
                        uint sumValue265 = bitwiseValue81 + 4097u;
                        uint sumValue266 = bitwiseValue81 + 4096u;
                        uint multiplyAddValue350 = conditionValue39 ? (bitwiseValue81 + (bitfieldInsert(bitfieldInsert(0u, uint(scalarValue231), int(4u), int(4u)), uint(scalarValue230), int(0u), int(4u)) + bitfieldInsert(0u, uint(scalarValue229), int(8u), int(4u)))) : ((intermediateValue12.packedValues[sumValue265 + intermediateValue23[comparisonValue233].x] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue349 * 0.0625), 16.0, multiplyAddValue349)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue348 * 0.0625), 16.0, multiplyAddValue348)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue347 * 0.0625), 16.0, multiplyAddValue347)), int(8u), int(4u))));
                        float bitwiseValue102 = rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue350] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue234 = (conditionValue39 || ((intermediateValue12.packedValues[sumValue266] & (1u << (intermediateValue23[comparisonValue233].x & 31u))) != 0u)) && (intermediateValue12.packedValues[multiplyAddValue350] != 0u);
                        float multiplyAddValue351 = fma(productValue341, 16.0, sumValue258);
                        float multiplyAddValue352 = fma(productValue342, 16.0, sumValue259);
                        float multiplyAddValue353 = fma(productValue343, 16.0, sumValue260);
                        uint comparisonValue235 = min(((bitfieldInsert(0u, (sumValue260 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue260 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue259 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue258 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue258 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue259 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue40 = int(intermediateValue23[comparisonValue235].x) < int(0u);
                        uint multiplyAddValue354 = conditionValue40 ? (bitwiseValue81 + (bitfieldInsert(0u, uint(sumValue258), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue260), int(4u), int(4u)), uint(sumValue259), int(0u), int(4u)))) : ((intermediateValue12.packedValues[sumValue265 + intermediateValue23[comparisonValue235].x] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue351 * 0.0625), 16.0, multiplyAddValue351)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue353 * 0.0625), 16.0, multiplyAddValue353)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue352 * 0.0625), 16.0, multiplyAddValue352)), int(0u), int(4u))));
                        float bitwiseValue103 = rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue354] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue236 = (conditionValue40 || ((intermediateValue12.packedValues[sumValue266] & (1u << (intermediateValue23[comparisonValue235].x & 31u))) != 0u)) && (intermediateValue12.packedValues[multiplyAddValue354] != 0u);
                        float multiplyAddValue355 = fma(productValue341, 16.0, sumValue262);
                        float multiplyAddValue356 = fma(productValue342, 16.0, sumValue263);
                        float multiplyAddValue357 = fma(productValue343, 16.0, sumValue264);
                        uint comparisonValue237 = min(((bitfieldInsert(0u, (sumValue264 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue264 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue263 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue262 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue262 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue263 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue41 = int(intermediateValue23[comparisonValue237].x) < int(0u);
                        uint multiplyAddValue358 = conditionValue41 ? (bitwiseValue81 + (bitfieldInsert(0u, uint(sumValue262), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue264), int(4u), int(4u)), uint(sumValue263), int(0u), int(4u)))) : ((intermediateValue12.packedValues[intermediateValue23[comparisonValue237].x + sumValue265] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue355 * 0.0625), 16.0, multiplyAddValue355)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue357 * 0.0625), 16.0, multiplyAddValue357)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue356 * 0.0625), 16.0, multiplyAddValue356)), int(0u), int(4u))));
                        float bitwiseValue104 = rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue358] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue238 = (conditionValue41 || ((intermediateValue12.packedValues[sumValue266] & (1u << (intermediateValue23[comparisonValue237].x & 31u))) != 0u)) && (intermediateValue12.packedValues[multiplyAddValue358] != 0u);
                        float multiplyAddValue359 = fma(productValue341, 16.0, sumValue252);
                        float multiplyAddValue360 = fma(productValue342, 16.0, sumValue253);
                        float multiplyAddValue361 = fma(productValue343, 16.0, sumValue254);
                        uint comparisonValue239 = min(((bitfieldInsert(0u, (sumValue254 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue254 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue253 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue252 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue252 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue253 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue42 = int(intermediateValue23[comparisonValue239].x) < int(0u);
                        uint multiplyAddValue362 = conditionValue42 ? (bitwiseValue81 + (bitfieldInsert(0u, uint(sumValue252), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue254), int(4u), int(4u)), uint(sumValue253), int(0u), int(4u)))) : ((intermediateValue12.packedValues[sumValue265 + intermediateValue23[comparisonValue239].x] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue359 * 0.0625), 16.0, multiplyAddValue359)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue361 * 0.0625), 16.0, multiplyAddValue361)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue360 * 0.0625), 16.0, multiplyAddValue360)), int(0u), int(4u))));
                        float bitwiseValue105 = rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue362] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue240 = (conditionValue42 || ((intermediateValue12.packedValues[sumValue266] & (1u << (intermediateValue23[comparisonValue239].x & 31u))) != 0u)) && (intermediateValue12.packedValues[multiplyAddValue362] != 0u);
                        comparisonValue83 = comparisonValue240 ? ((bitwiseValue105 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue362] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue84 = comparisonValue240 ? ((bitwiseValue105 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue362] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue85 = comparisonValue240 ? ((bitwiseValue105 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[multiplyAddValue362] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue86 = comparisonValue238 ? ((bitwiseValue104 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue358] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue87 = comparisonValue238 ? ((bitwiseValue104 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue358] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue88 = comparisonValue238 ? ((bitwiseValue104 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[multiplyAddValue358] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue89 = comparisonValue234 ? ((bitwiseValue102 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue350] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue90 = comparisonValue234 ? ((bitwiseValue102 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue350] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue91 = comparisonValue234 ? ((bitwiseValue102 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[multiplyAddValue350] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue92 = comparisonValue236 ? ((bitwiseValue103 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue354] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue93 = comparisonValue236 ? ((bitwiseValue103 * (rdEvaluateFloatExpression((intermediateValue12.packedValues[multiplyAddValue354] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue94 = comparisonValue236 ? ((bitwiseValue103 * (rdEvaluateFloatExpression(intermediateValue12.packedValues[multiplyAddValue354] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    multiplyAddValue129 = fma(comparisonValue85, scalarValue234, fma(comparisonValue88, sumValue251, fma(comparisonValue91, sumValue249, sumValue250 * comparisonValue94)));
                    multiplyAddValue130 = fma(comparisonValue84, scalarValue234, fma(comparisonValue87, sumValue251, fma(comparisonValue90, sumValue249, sumValue250 * comparisonValue93)));
                    multiplyAddValue131 = fma(comparisonValue83, scalarValue234, fma(comparisonValue86, sumValue251, fma(comparisonValue89, sumValue249, sumValue250 * comparisonValue92)));
                }
                intermediateValue121 = multiplyAddValue129;
                intermediateValue119 = multiplyAddValue130;
                intermediateValue117 = multiplyAddValue131;
            }
            else
            {
                intermediateValue121 = 0.0;
                intermediateValue119 = 0.0;
                intermediateValue117 = 0.0;
            }
            intermediateValue116 = intermediateValue117;
            intermediateValue118 = intermediateValue119;
            intermediateValue120 = intermediateValue121;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float productValue224 = (multiplyAddValue18 + 1.0) * 0.5;
            float productValue225 = (multiplyAddValue19 + 1.0) * 0.5;
            uint scalarValue85 = uint(int(fragmentVectorConstants1.packedValues[144u].z));
            float multiplyAddValue56 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue20, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue19, multiplyAddValue18 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue20, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue19, multiplyAddValue18 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[145u].x) / (fragmentVectorConstants1.packedValues[145u].y - fragmentVectorConstants1.packedValues[145u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue85))) + (-0.5);
            uint sumValue116 = uint(min(int(uint(max(int(uint(int(multiplyAddValue56))), int(0u)))), int(scalarValue85 + 4294967294u)));
            float scalarValue86 = float(int(sumValue116));
            vec4 sampledTextureValue69 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue224, productValue225, scalarValue86), 0.0);
            float scalarValue87 = sampledTextureValue69.w;
            float sampledTextureValue70 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue224, productValue225, float(int(sumValue116 + 1u))), 0.0).w - scalarValue87) * spvNMin(spvNMax(multiplyAddValue56 - scalarValue86, 0.0), 1.0)) + scalarValue87;
            branchMergedValue13 = sampledTextureValue70 * productValue223;
            branchMergedValue24 = sampledTextureValue70 * productValue222;
            branchMergedValue25 = sampledTextureValue70 * productValue221;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float productValue224 = (multiplyAddValue18 + 1.0) * 0.5;
            float productValue225 = (multiplyAddValue19 + 1.0) * 0.5;
            uint scalarValue302 = uint(int(fragmentVectorConstants1.packedValues[143u].z));
            float multiplyAddValue409 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue20, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue19, multiplyAddValue18 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue20, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue19, multiplyAddValue18 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[144u].x) / (fragmentVectorConstants1.packedValues[144u].y - fragmentVectorConstants1.packedValues[144u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue302))) + (-0.5);
            uint sumValue314 = uint(min(int(uint(max(int(uint(int(multiplyAddValue409))), int(0u)))), int(scalarValue302 + 4294967294u)));
            float scalarValue303 = float(int(sumValue314));
            vec4 sampledTextureValue139 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue224, productValue225, scalarValue303), 0.0);
            float scalarValue304 = sampledTextureValue139.w;
            float sampledTextureValue140 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue224, productValue225, float(int(sumValue314 + 1u))), 0.0).w - scalarValue304) * spvNMin(spvNMax(multiplyAddValue409 - scalarValue303, 0.0), 1.0)) + scalarValue304;
            branchMergedValue13 = sampledTextureValue140 * productValue468;
            branchMergedValue24 = sampledTextureValue140 * productValue467;
            branchMergedValue25 = sampledTextureValue140 * productValue466;
#endif
        }
        else
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue118 = multiplyAddValue109;
            intermediateValue120 = multiplyAddValue108;
            intermediateValue122 = comparisonValue120;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue116 = multiplyAddValue274;
            intermediateValue118 = multiplyAddValue273;
            intermediateValue120 = comparisonValue193;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            branchMergedValue13 = productValue223;
            branchMergedValue24 = productValue222;
            branchMergedValue25 = productValue221;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            branchMergedValue13 = productValue468;
            branchMergedValue24 = productValue467;
            branchMergedValue25 = productValue466;
#endif
        }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float productValue282 = fragmentScalarConstants1.packedValues[445u] * fragmentScalarConstants1.packedValues[445u];
        float productValue283 = (productValue282 * productValue282) * fragmentScalarConstants1.packedValues[445u];
        float multiplyAddValue214 = fma(fragmentScalarConstants1.packedValues[305u], fma(productValue282, fragmentScalarConstants1.packedValues[445u], -productValue283), productValue283);
        float scalarValue164 = rdDot3Precise2(vec3(exponentialValue6, exponentialValue7, exponentialValue8), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        multiplyAddValue37 = (intermediateValue42 * (fma(fragmentScalarConstants1.packedValues[253u], scalarValue164 - exponentialValue8, exponentialValue8) * fragmentScalarConstants1.packedValues[494u])) * fragmentScalarConstants1.packedValues[252u];
        multiplyAddValue38 = (intermediateValue42 * (fma(fragmentScalarConstants1.packedValues[253u], scalarValue164 - exponentialValue7, exponentialValue7) * fragmentScalarConstants1.packedValues[494u])) * fragmentScalarConstants1.packedValues[252u];
        multiplyAddValue39 = (intermediateValue42 * (fma(fragmentScalarConstants1.packedValues[253u], scalarValue164 - exponentialValue6, exponentialValue6) * fragmentScalarConstants1.packedValues[494u])) * fragmentScalarConstants1.packedValues[252u];
        intermediateValue68 = quotientValue3;
        intermediateValue69 = quotientValue4;
        intermediateValue70 = quotientValue5;
        multiplyAddValue40 = ((exponentialValue8 * sumValue136) * spvNMax(fma(intermediateValue118, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue214 * fragmentVectorConstants1.packedValues[140u].z) * fragmentScalarConstants1.packedValues[563u]), fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].z)) * fragmentScalarConstants1.packedValues[495u];
        multiplyAddValue41 = ((exponentialValue7 * sumValue136) * spvNMax(fma(intermediateValue120, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue214 * fragmentVectorConstants1.packedValues[140u].y) * fragmentScalarConstants1.packedValues[563u]), fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].y)) * fragmentScalarConstants1.packedValues[495u];
        multiplyAddValue42 = ((exponentialValue6 * sumValue136) * spvNMax(fma(intermediateValue122, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue214 * fragmentVectorConstants1.packedValues[140u].x) * fragmentScalarConstants1.packedValues[563u]), fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].x)) * fragmentScalarConstants1.packedValues[495u];
        intermediateValue71 = multiplyAddValue43;
        intermediateValue72 = multiplyAddValue44;
        intermediateValue73 = multiplyAddValue45;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float productValue348 = fragmentScalarConstants1.packedValues[441u] * fragmentScalarConstants1.packedValues[441u];
        float productValue349 = (productValue348 * productValue348) * fragmentScalarConstants1.packedValues[441u];
        float multiplyAddValue363 = fma(fragmentScalarConstants1.packedValues[301u], fma(productValue348, fragmentScalarConstants1.packedValues[441u], -productValue349), productValue349);
        float scalarValue240 = rdDot3Precise2(vec3(multiplyAddValue249, multiplyAddValue250, multiplyAddValue251), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        multiplyAddValue40 = (intermediateValue40 * (fma(fragmentScalarConstants1.packedValues[253u], scalarValue240 - multiplyAddValue251, multiplyAddValue251) * fragmentScalarConstants1.packedValues[490u])) * fragmentScalarConstants1.packedValues[252u];
        multiplyAddValue41 = (intermediateValue40 * (fma(fragmentScalarConstants1.packedValues[253u], scalarValue240 - multiplyAddValue250, multiplyAddValue250) * fragmentScalarConstants1.packedValues[490u])) * fragmentScalarConstants1.packedValues[252u];
        multiplyAddValue42 = (intermediateValue40 * (fma(fragmentScalarConstants1.packedValues[253u], scalarValue240 - multiplyAddValue249, multiplyAddValue249) * fragmentScalarConstants1.packedValues[490u])) * fragmentScalarConstants1.packedValues[252u];
        intermediateValue66 = quotientValue3;
        intermediateValue67 = quotientValue4;
        intermediateValue68 = quotientValue5;
        multiplyAddValue43 = ((multiplyAddValue251 * sumValue194) * spvNMax(fma(intermediateValue116, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue363 * fragmentVectorConstants1.packedValues[139u].z) * fragmentScalarConstants1.packedValues[559u]), fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].z)) * fragmentScalarConstants1.packedValues[491u];
        multiplyAddValue44 = ((multiplyAddValue250 * sumValue194) * spvNMax(fma(intermediateValue118, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue363 * fragmentVectorConstants1.packedValues[139u].y) * fragmentScalarConstants1.packedValues[559u]), fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].y)) * fragmentScalarConstants1.packedValues[491u];
        multiplyAddValue45 = ((multiplyAddValue249 * sumValue194) * spvNMax(fma(intermediateValue120, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue363 * fragmentVectorConstants1.packedValues[139u].x) * fragmentScalarConstants1.packedValues[559u]), fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].x)) * fragmentScalarConstants1.packedValues[491u];
        intermediateValue69 = multiplyAddValue46;
        intermediateValue70 = multiplyAddValue47;
        intermediateValue71 = multiplyAddValue48;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue87 = branchMergedValue25;
        intermediateValue88 = branchMergedValue24;
        intermediateValue89 = branchMergedValue13;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue82 = branchMergedValue25;
        intermediateValue83 = branchMergedValue24;
        intermediateValue84 = branchMergedValue13;
#endif
    }
    else
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        multiplyAddValue37 = 0.0;
        multiplyAddValue38 = 0.0;
        multiplyAddValue39 = 0.0;
        intermediateValue68 = 0.0;
        intermediateValue69 = 0.0;
        intermediateValue70 = 0.0;
        multiplyAddValue40 = 0.0;
        multiplyAddValue41 = 0.0;
        multiplyAddValue42 = 0.0;
        intermediateValue71 = 0.0;
        intermediateValue72 = 0.0;
        intermediateValue73 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        multiplyAddValue40 = 0.0;
        multiplyAddValue41 = 0.0;
        multiplyAddValue42 = 0.0;
        intermediateValue66 = 0.0;
        intermediateValue67 = 0.0;
        intermediateValue68 = 0.0;
        multiplyAddValue43 = 0.0;
        multiplyAddValue44 = 0.0;
        multiplyAddValue45 = 0.0;
        intermediateValue69 = 0.0;
        intermediateValue70 = 0.0;
        intermediateValue71 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue87 = 0.0;
        intermediateValue88 = 0.0;
        intermediateValue89 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue82 = 0.0;
        intermediateValue83 = 0.0;
        intermediateValue84 = 0.0;
#endif
    }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue187 = multiplyAddValue39 + (intermediateValue70 + (intermediateValue73 + multiplyAddValue42));
    float sumValue188 = multiplyAddValue38 + (intermediateValue69 + (intermediateValue72 + multiplyAddValue41));
    float sumValue189 = multiplyAddValue37 + (intermediateValue68 + (intermediateValue71 + multiplyAddValue40));
    bool comparisonValue169 = fragmentScalarConstants1.packedValues[495u] != 0.0;
    float productValue284 = fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].x;
    float productValue285 = fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].y;
    float productValue286 = fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].z;
    bool comparisonValue170 = fragmentScalarConstants1.packedValues[288u] != 0.0;
    bool comparisonValue171 = fragmentScalarConstants1.packedValues[584u] != 0.0;
    float intermediateValue94;
    float intermediateValue95;
    float intermediateValue97;
    float intermediateValue99;
    if (comparisonValue170)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float sumValue267 = multiplyAddValue42 + (intermediateValue68 + (intermediateValue71 + multiplyAddValue45));
    float sumValue268 = multiplyAddValue41 + (intermediateValue67 + (intermediateValue70 + multiplyAddValue44));
    float sumValue269 = multiplyAddValue40 + (intermediateValue66 + (intermediateValue69 + multiplyAddValue43));
    bool comparisonValue241 = fragmentScalarConstants1.packedValues[491u] != 0.0;
    bool comparisonValue242 = fragmentScalarConstants1.packedValues[284u] != 0.0;
    bool comparisonValue243 = fragmentScalarConstants1.packedValues[580u] != 0.0;
    float intermediateValue92;
    float intermediateValue93;
    float intermediateValue95;
    float intermediateValue97;
    if (comparisonValue242)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue226 = ((productValue109 * (((intermediateValue54 - sumValue87) * intermediateValue53) + sumValue87)) + productValue106) + intermediateValue87;
    float productValue227 = ((productValue109 * (((intermediateValue55 - sumValue89) * intermediateValue53) + sumValue89)) + productValue107) + intermediateValue88;
    float productValue228 = ((productValue109 * (((intermediateValue56 - sumValue90) * intermediateValue53) + sumValue90)) + productValue108) + intermediateValue89;
    float productValue143;
    float productValue144;
    float productValue145;
    if (fragmentVectorConstants1.packedValues[136u].x > 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue469 = ((productValue106 * (((intermediateValue49 - sumValue304) * intermediateValue48) + sumValue304)) + productValue103) + intermediateValue82;
    float productValue470 = ((productValue106 * (((intermediateValue50 - sumValue305) * intermediateValue48) + sumValue305)) + productValue104) + intermediateValue83;
    float productValue471 = ((productValue106 * (((intermediateValue51 - sumValue306) * intermediateValue48) + sumValue306)) + productValue105) + intermediateValue84;
    float productValue140;
    float productValue141;
    float productValue142;
    if (fragmentVectorConstants1.packedValues[135u].x > 0.0)
#endif
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue34 = spvNClamp((((nonlinearValue5 / fragmentScalarConstants1.packedValues[274u]) + fragmentScalarConstants1.packedValues[552u]) - fragmentScalarConstants1.packedValues[272u]) * fragmentScalarConstants1.packedValues[273u], 0.0, 1.0);
        float intermediateValue96;
        float intermediateValue98;
        float intermediateValue100;
        if (quotientValue34 > 0.0)
        {
            float multiplyAddValue81;
            float multiplyAddValue82;
            float multiplyAddValue83;
            if (fragmentScalarConstants1.packedValues[289u] != 0.0)
            {
                bool comparisonValue172 = comparisonValue169 && (fragmentScalarConstants1.packedValues[290u] != 0.0);
                multiplyAddValue81 = spvNMax(comparisonValue172 ? (spvNMax(productValue284, fma(fragmentVectorConstants1.packedValues[140u].x, fragmentScalarConstants1.packedValues[563u], fragmentScalarConstants1.packedValues[235u])) * fragmentScalarConstants1.packedValues[290u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[73u].x;
                multiplyAddValue82 = spvNMax(comparisonValue172 ? (spvNMax(productValue285, fma(fragmentVectorConstants1.packedValues[140u].y, fragmentScalarConstants1.packedValues[563u], fragmentScalarConstants1.packedValues[235u])) * fragmentScalarConstants1.packedValues[290u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[73u].y;
                multiplyAddValue83 = spvNMax(comparisonValue172 ? (spvNMax(productValue286, fma(fragmentVectorConstants1.packedValues[140u].z, fragmentScalarConstants1.packedValues[563u], fragmentScalarConstants1.packedValues[235u])) * fragmentScalarConstants1.packedValues[290u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[73u].z;
            }
            else
            {
                float sumValue99 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
                float sumValue100 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
                float sumValue108 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
                vec3 vectorValue18 = vec3(sumValue99, sumValue100, sumValue108);
                float inverseLengthValue33 = inversesqrt(rdDot3Precise2(vectorValue18, vectorValue18));
                float sumValue190 = fragmentScalarConstants1.packedValues[523u] - fragmentScalarConstants1.packedValues[520u];
                float multiplyAddValue215 = fma(sumValue100, inverseLengthValue33, sumValue190);
                float quotientValue35 = spvNClamp(multiplyAddValue215 * (1.0 / (sumValue190 + (fragmentScalarConstants1.packedValues[522u] - fragmentScalarConstants1.packedValues[523u]))), 0.0, 1.0);
                float multiplyAddValue216 = fma(-fma(quotientValue35, -2.0, 3.0), quotientValue35 * quotientValue35, 1.0);
                float productValue287 = multiplyAddValue216 * (multiplyAddValue216 * multiplyAddValue216);
                vec3 productValue288 = vec3(inverseLengthValue33 * sumValue99, inverseLengthValue33 * sumValue100, inverseLengthValue33 * sumValue108);
                float scalarValue165 = rdDot3Precise2(productValue288, vec3(fragmentVectorConstants1.packedValues[135u].xyz));
                float scalarValue166 = rdDot3Precise2(productValue288, vec3(fragmentVectorConstants1.packedValues[77u].xyz));
                float quotientValue36 = spvNClamp(multiplyAddValue215 * (1.0 / (sumValue190 + fragmentScalarConstants1.packedValues[521u])), 0.0, 1.0);
                float multiplyAddValue217 = fma(-fma(quotientValue36, -2.0, 3.0), quotientValue36 * quotientValue36, 1.0);
                float productValue289 = multiplyAddValue217 * (multiplyAddValue217 * multiplyAddValue217);
                float multiplyAddValue218 = fma(fma(scalarValue165, scalarValue165, 1.0) * fragmentScalarConstants1.packedValues[571u], 0.75, (fma(scalarValue166, scalarValue166, 1.0) * fragmentScalarConstants1.packedValues[535u]) * 0.75);
                float exponentialValue9 = spvNMin(exp2(log2(spvNMax(scalarValue165, 0.0)) * fragmentScalarConstants1.packedValues[279u]), 1.0);
                float exponentialValue10 = spvNMin(exp2(log2(spvNMax(scalarValue166, 0.0)) * fragmentScalarConstants1.packedValues[279u]), 1.0);
                float multiplyAddValue219 = fma(-exponentialValue9, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue7 = 0.0361000001430511474609375 / (multiplyAddValue219 * sqrt(multiplyAddValue219));
                float multiplyAddValue220 = fma(-exponentialValue10, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue8 = 0.0361000001430511474609375 / (multiplyAddValue220 * sqrt(multiplyAddValue220));
                float multiplyAddValue221 = fma((fma(productValue289, fragmentVectorConstants1.packedValues[131u].x - fragmentVectorConstants1.packedValues[70u].x, fragmentVectorConstants1.packedValues[70u].x) * fragmentScalarConstants1.packedValues[276u]) * 0.079577468335628509521484375, multiplyAddValue218, fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[142u].x * fragmentScalarConstants1.packedValues[571u]) * fragmentScalarConstants1.packedValues[277u]), nonlinearValue7, nonlinearValue8 * (exponentialValue10 * ((fragmentVectorConstants1.packedValues[133u].x * fragmentScalarConstants1.packedValues[535u]) * fragmentScalarConstants1.packedValues[278u]))) * ((productValue287 * fragmentVectorConstants1.packedValues[131u].x) * 0.079577468335628509521484375));
                float multiplyAddValue222 = fma((fma(productValue289, fragmentVectorConstants1.packedValues[131u].y - fragmentVectorConstants1.packedValues[70u].y, fragmentVectorConstants1.packedValues[70u].y) * fragmentScalarConstants1.packedValues[276u]) * 0.079577468335628509521484375, multiplyAddValue218, fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[142u].y * fragmentScalarConstants1.packedValues[571u]) * fragmentScalarConstants1.packedValues[277u]), nonlinearValue7, nonlinearValue8 * (exponentialValue10 * ((fragmentVectorConstants1.packedValues[133u].y * fragmentScalarConstants1.packedValues[535u]) * fragmentScalarConstants1.packedValues[278u]))) * ((productValue287 * fragmentVectorConstants1.packedValues[131u].y) * 0.079577468335628509521484375));
                float multiplyAddValue223 = fma((fma(productValue289, fragmentVectorConstants1.packedValues[131u].z - fragmentVectorConstants1.packedValues[70u].z, fragmentVectorConstants1.packedValues[70u].z) * fragmentScalarConstants1.packedValues[276u]) * 0.079577468335628509521484375, multiplyAddValue218, fma(exponentialValue9 * ((fragmentVectorConstants1.packedValues[142u].z * fragmentScalarConstants1.packedValues[571u]) * fragmentScalarConstants1.packedValues[277u]), nonlinearValue7, nonlinearValue8 * (exponentialValue10 * ((fragmentVectorConstants1.packedValues[133u].z * fragmentScalarConstants1.packedValues[535u]) * fragmentScalarConstants1.packedValues[278u]))) * ((productValue287 * fragmentVectorConstants1.packedValues[131u].z) * 0.079577468335628509521484375));
                bool comparisonValue173 = fragmentScalarConstants1.packedValues[291u] != 0.0;
                float scalarValue167 = spvNMax(fragmentScalarConstants1.packedValues[301u], fragmentScalarConstants1.packedValues[445u]);
                multiplyAddValue81 = comparisonValue173 ? fma(scalarValue167, multiplyAddValue221 - fragmentVectorConstants1.packedValues[143u].x, fragmentVectorConstants1.packedValues[143u].x) : multiplyAddValue221;
                multiplyAddValue82 = comparisonValue173 ? fma(scalarValue167, multiplyAddValue222 - fragmentVectorConstants1.packedValues[143u].y, fragmentVectorConstants1.packedValues[143u].y) : multiplyAddValue222;
                multiplyAddValue83 = comparisonValue173 ? fma(scalarValue167, multiplyAddValue223 - fragmentVectorConstants1.packedValues[143u].z, fragmentVectorConstants1.packedValues[143u].z) : multiplyAddValue223;
            }
            intermediateValue100 = multiplyAddValue81;
            intermediateValue98 = multiplyAddValue82;
            intermediateValue96 = multiplyAddValue83;
        }
        else
        {
            intermediateValue100 = 0.0;
            intermediateValue98 = 0.0;
            intermediateValue96 = 0.0;
        }
        intermediateValue94 = quotientValue34;
        intermediateValue95 = intermediateValue96;
        intermediateValue97 = intermediateValue98;
        intermediateValue99 = intermediateValue100;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue45 = spvNClamp((((nonlinearValue5 / fragmentScalarConstants1.packedValues[270u]) + fragmentScalarConstants1.packedValues[548u]) - fragmentScalarConstants1.packedValues[268u]) * fragmentScalarConstants1.packedValues[269u], 0.0, 1.0);
        float intermediateValue94;
        float intermediateValue96;
        float intermediateValue98;
        if (quotientValue45 > 0.0)
        {
            float multiplyAddValue84;
            float multiplyAddValue85;
            float multiplyAddValue86;
            if (fragmentScalarConstants1.packedValues[285u] != 0.0)
            {
                bool comparisonValue244 = comparisonValue241 && (fragmentScalarConstants1.packedValues[286u] != 0.0);
                multiplyAddValue84 = spvNMax(comparisonValue244 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[139u].x, fragmentScalarConstants1.packedValues[559u], fragmentScalarConstants1.packedValues[235u]), fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].x) * fragmentScalarConstants1.packedValues[286u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[72u].x;
                multiplyAddValue85 = spvNMax(comparisonValue244 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[139u].y, fragmentScalarConstants1.packedValues[559u], fragmentScalarConstants1.packedValues[235u]), fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].y) * fragmentScalarConstants1.packedValues[286u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[72u].y;
                multiplyAddValue86 = spvNMax(comparisonValue244 ? (spvNMax(fma(fragmentVectorConstants1.packedValues[139u].z, fragmentScalarConstants1.packedValues[559u], fragmentScalarConstants1.packedValues[235u]), fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].z) * fragmentScalarConstants1.packedValues[286u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[72u].z;
            }
            else
            {
                float sumValue99 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
                float sumValue100 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
                float sumValue108 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
                vec3 vectorValue18 = vec3(sumValue99, sumValue100, sumValue108);
                float inverseLengthValue33 = inversesqrt(rdDot3Precise2(vectorValue18, vectorValue18));
                float sumValue270 = fragmentScalarConstants1.packedValues[519u] - fragmentScalarConstants1.packedValues[516u];
                float multiplyAddValue364 = fma(sumValue100, inverseLengthValue33, sumValue270);
                float quotientValue46 = spvNClamp(multiplyAddValue364 * (1.0 / (sumValue270 + (fragmentScalarConstants1.packedValues[518u] - fragmentScalarConstants1.packedValues[519u]))), 0.0, 1.0);
                float multiplyAddValue365 = fma(-fma(quotientValue46, -2.0, 3.0), quotientValue46 * quotientValue46, 1.0);
                float productValue350 = multiplyAddValue365 * (multiplyAddValue365 * multiplyAddValue365);
                vec3 productValue288 = vec3(inverseLengthValue33 * sumValue99, inverseLengthValue33 * sumValue100, inverseLengthValue33 * sumValue108);
                float scalarValue241 = rdDot3Precise2(productValue288, vec3(fragmentVectorConstants1.packedValues[134u].xyz));
                float scalarValue242 = rdDot3Precise2(productValue288, vec3(fragmentVectorConstants1.packedValues[76u].xyz));
                float quotientValue47 = spvNClamp(multiplyAddValue364 * (1.0 / (sumValue270 + fragmentScalarConstants1.packedValues[517u])), 0.0, 1.0);
                float multiplyAddValue366 = fma(-fma(quotientValue47, -2.0, 3.0), quotientValue47 * quotientValue47, 1.0);
                float productValue351 = multiplyAddValue366 * (multiplyAddValue366 * multiplyAddValue366);
                float multiplyAddValue367 = fma(fma(scalarValue241, scalarValue241, 1.0) * fragmentScalarConstants1.packedValues[567u], 0.75, (fma(scalarValue242, scalarValue242, 1.0) * fragmentScalarConstants1.packedValues[531u]) * 0.75);
                float exponentialValue11 = spvNMin(exp2(log2(spvNMax(scalarValue241, 0.0)) * fragmentScalarConstants1.packedValues[275u]), 1.0);
                float exponentialValue12 = spvNMin(exp2(log2(spvNMax(scalarValue242, 0.0)) * fragmentScalarConstants1.packedValues[275u]), 1.0);
                float multiplyAddValue368 = fma(-exponentialValue11, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue10 = 0.0361000001430511474609375 / (multiplyAddValue368 * sqrt(multiplyAddValue368));
                float multiplyAddValue369 = fma(-exponentialValue12, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue11 = 0.0361000001430511474609375 / (multiplyAddValue369 * sqrt(multiplyAddValue369));
                float multiplyAddValue370 = fma((fma(productValue351, fragmentVectorConstants1.packedValues[130u].x - fragmentVectorConstants1.packedValues[69u].x, fragmentVectorConstants1.packedValues[69u].x) * fragmentScalarConstants1.packedValues[272u]) * 0.079577468335628509521484375, multiplyAddValue367, fma(exponentialValue11 * ((fragmentVectorConstants1.packedValues[141u].x * fragmentScalarConstants1.packedValues[567u]) * fragmentScalarConstants1.packedValues[273u]), nonlinearValue10, nonlinearValue11 * (exponentialValue12 * ((fragmentVectorConstants1.packedValues[132u].x * fragmentScalarConstants1.packedValues[531u]) * fragmentScalarConstants1.packedValues[274u]))) * ((productValue350 * fragmentVectorConstants1.packedValues[130u].x) * 0.079577468335628509521484375));
                float multiplyAddValue371 = fma((fma(productValue351, fragmentVectorConstants1.packedValues[130u].y - fragmentVectorConstants1.packedValues[69u].y, fragmentVectorConstants1.packedValues[69u].y) * fragmentScalarConstants1.packedValues[272u]) * 0.079577468335628509521484375, multiplyAddValue367, fma(exponentialValue11 * ((fragmentVectorConstants1.packedValues[141u].y * fragmentScalarConstants1.packedValues[567u]) * fragmentScalarConstants1.packedValues[273u]), nonlinearValue10, nonlinearValue11 * (exponentialValue12 * ((fragmentVectorConstants1.packedValues[132u].y * fragmentScalarConstants1.packedValues[531u]) * fragmentScalarConstants1.packedValues[274u]))) * ((productValue350 * fragmentVectorConstants1.packedValues[130u].y) * 0.079577468335628509521484375));
                float multiplyAddValue372 = fma((fma(productValue351, fragmentVectorConstants1.packedValues[130u].z - fragmentVectorConstants1.packedValues[69u].z, fragmentVectorConstants1.packedValues[69u].z) * fragmentScalarConstants1.packedValues[272u]) * 0.079577468335628509521484375, multiplyAddValue367, fma(exponentialValue11 * ((fragmentVectorConstants1.packedValues[141u].z * fragmentScalarConstants1.packedValues[567u]) * fragmentScalarConstants1.packedValues[273u]), nonlinearValue10, nonlinearValue11 * (exponentialValue12 * ((fragmentVectorConstants1.packedValues[132u].z * fragmentScalarConstants1.packedValues[531u]) * fragmentScalarConstants1.packedValues[274u]))) * ((productValue350 * fragmentVectorConstants1.packedValues[130u].z) * 0.079577468335628509521484375));
                bool comparisonValue245 = fragmentScalarConstants1.packedValues[287u] != 0.0;
                float scalarValue243 = spvNMax(fragmentScalarConstants1.packedValues[297u], fragmentScalarConstants1.packedValues[441u]);
                multiplyAddValue84 = comparisonValue245 ? fma(scalarValue243, multiplyAddValue370 - fragmentVectorConstants1.packedValues[142u].x, fragmentVectorConstants1.packedValues[142u].x) : multiplyAddValue370;
                multiplyAddValue85 = comparisonValue245 ? fma(scalarValue243, multiplyAddValue371 - fragmentVectorConstants1.packedValues[142u].y, fragmentVectorConstants1.packedValues[142u].y) : multiplyAddValue371;
                multiplyAddValue86 = comparisonValue245 ? fma(scalarValue243, multiplyAddValue372 - fragmentVectorConstants1.packedValues[142u].z, fragmentVectorConstants1.packedValues[142u].z) : multiplyAddValue372;
            }
            intermediateValue98 = multiplyAddValue84;
            intermediateValue96 = multiplyAddValue85;
            intermediateValue94 = multiplyAddValue86;
        }
        else
        {
            intermediateValue98 = 0.0;
            intermediateValue96 = 0.0;
            intermediateValue94 = 0.0;
        }
        intermediateValue92 = quotientValue45;
        intermediateValue93 = intermediateValue94;
        intermediateValue95 = intermediateValue96;
        intermediateValue97 = intermediateValue98;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue71 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue143 = sampledTextureValue71 * productValue226;
        productValue144 = sampledTextureValue71 * productValue227;
        productValue145 = sampledTextureValue71 * productValue228;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue71 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue140 = sampledTextureValue71 * productValue469;
        productValue141 = sampledTextureValue71 * productValue470;
        productValue142 = sampledTextureValue71 * productValue471;
#endif
    }
    else
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue94 = 0.0;
        intermediateValue95 = 0.0;
        intermediateValue97 = 0.0;
        intermediateValue99 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        intermediateValue92 = 0.0;
        intermediateValue93 = 0.0;
        intermediateValue95 = 0.0;
        intermediateValue97 = 0.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue143 = productValue226;
        productValue144 = productValue227;
        productValue145 = productValue228;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue140 = productValue469;
        productValue141 = productValue470;
        productValue142 = productValue471;
#endif
    }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue85;
    float multiplyAddValue86;
    float multiplyAddValue87;
    float multiplyAddValue88;
    if (comparisonValue171)
    {
        float productValue290 = (multiplyAddValue79 + 1.0) * 0.5;
        float productValue291 = (multiplyAddValue80 + 1.0) * 0.5;
        float multiplyAddValue224 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue92, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue79, multiplyAddValue80 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue92, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue79, multiplyAddValue80 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[580u]) / (fragmentScalarConstants1.packedValues[581u] - fragmentScalarConstants1.packedValues[580u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[578u]), -0.5);
        uint sumValue191 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[578u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue224))), int(0u))))));
        float scalarValue168 = rdSignedBitsToFloat(sumValue191);
        float sumValue192 = spvNClamp(multiplyAddValue224 - scalarValue168, 0.0, 1.0);
        vec4 sampledTextureValue88 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue290, productValue291, scalarValue168), 0.0);
        float scalarValue169 = sampledTextureValue88.x;
        float scalarValue170 = sampledTextureValue88.y;
        float scalarValue171 = sampledTextureValue88.z;
        float scalarValue172 = sampledTextureValue88.w;
        vec4 sampledTextureValue89 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue290, productValue291, rdSignedBitsToFloat(sumValue191 + 1u)), 0.0);
        multiplyAddValue85 = fma(sumValue192, sampledTextureValue89.z - scalarValue171, scalarValue171);
        multiplyAddValue86 = fma(sumValue192, sampledTextureValue89.y - scalarValue170, scalarValue170);
        multiplyAddValue87 = fma(sumValue192, sampledTextureValue89.x - scalarValue169, scalarValue169);
        multiplyAddValue88 = fma(sumValue192, sampledTextureValue89.w - scalarValue172, scalarValue172);
    }
    else
    {
        multiplyAddValue85 = 0.0;
        multiplyAddValue86 = 0.0;
        multiplyAddValue87 = 0.0;
        multiplyAddValue88 = 1.0;
    }
    float intermediateValue163;
    float intermediateValue164;
    float intermediateValue165;
    if (fragmentScalarConstants1.packedValues[528u] != 0.0)
    {
        float multiplyAddValue225 = spvNClamp(fma(fragmentScalarConstants1.packedValues[445u], 16.0, -fragmentScalarConstants1.packedValues[285u]) / spvNMax(fragmentScalarConstants1.packedValues[284u] - fragmentScalarConstants1.packedValues[285u], 1.0), 0.0, 1.0);
        float productValue292 = (multiplyAddValue225 * (multiplyAddValue225 * multiplyAddValue225)) * fragmentScalarConstants1.packedValues[528u];
        bool conditionValue24 = fragmentScalarConstants1.packedValues[544u] > 0.0;
        bool conditionValue25 = fragmentScalarConstants1.packedValues[539u] > 0.0;
        float multiplyAddValue226 = conditionValue25 ? (fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue107, fma(fragmentVectorConstants1.packedValues[4u].x, multiplyAddValue105, multiplyAddValue106 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue74;
        float multiplyAddValue227 = conditionValue25 ? (fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue107, fma(fragmentVectorConstants1.packedValues[4u].y, multiplyAddValue105, multiplyAddValue106 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue75;
        float multiplyAddValue228 = conditionValue25 ? (fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue107, fma(fragmentVectorConstants1.packedValues[4u].z, multiplyAddValue105, multiplyAddValue106 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue76;
        float comparisonValue174 = (conditionValue25 ? multiplyAddValue105 : varyingTexCoord3.x) - fragmentVectorConstants1.packedValues[11u].x;
        float comparisonValue175 = (conditionValue25 ? multiplyAddValue106 : varyingTexCoord3.y) - fragmentVectorConstants1.packedValues[11u].y;
        float comparisonValue176 = (conditionValue25 ? multiplyAddValue107 : varyingTexCoord3.z) - fragmentVectorConstants1.packedValues[11u].z;
        vec3 vectorValue19 = vec3(comparisonValue174, comparisonValue175, comparisonValue176);
        float inverseLengthValue34 = inversesqrt(rdDot3Precise2(vectorValue19, vectorValue19));
        float productValue293 = inverseLengthValue34 * comparisonValue174;
        float productValue294 = inverseLengthValue34 * comparisonValue175;
        float productValue295 = inverseLengthValue34 * comparisonValue176;
        vec3 vectorValue20 = vec3(multiplyAddValue226, multiplyAddValue227, multiplyAddValue228);
        float inverseLengthValue35 = inversesqrt(rdDot3Precise2(vectorValue20, vectorValue20));
        float scalarValue173 = rdDot3Precise2(vec3(productValue293, productValue294, productValue295), vec3(productValue233, productValue234, productValue235));
        float sumValue193 = -(scalarValue173 + scalarValue173);
        float multiplyAddValue229 = fma(productValue233, sumValue193, productValue293);
        float multiplyAddValue230 = fma(productValue234, sumValue193, productValue294);
        float multiplyAddValue231 = fma(productValue235, sumValue193, productValue295);
        float sumValue194 = 1.0 - intermediateValue44;
        float productValue296 = sumValue194 * sumValue194;
        float sumValue195 = fragmentScalarConstants1.packedValues[529u] - 1.0;
        float productValue297 = productValue296 * productValue296;
        float multiplyAddValue232 = (uint(int(fragmentScalarConstants1.packedValues[456u])) == 1u) ? (fma(intermediateValue44 - 1.0, sumValue194, 1.0) * sumValue195) : (fma(-productValue297, productValue297, 1.0) * sumValue195);
        uint sumValue196 = uint(int(fragmentScalarConstants1.packedValues[268u])) + 2u;
        uint scalarValue174 = uint(abs(int(sumValue196))) % 3u;
        vec4 sampledTextureValue90 = textureLod(samplerCubeArray(materialTexture9, textureSampler9), vec4(multiplyAddValue229, multiplyAddValue230, multiplyAddValue231, trunc(fragmentScalarConstants1.packedValues[268u])), multiplyAddValue232);
        vec4 sampledTextureValue91 = textureLod(samplerCubeArray(materialTexture9, textureSampler9), vec4(multiplyAddValue229, multiplyAddValue230, multiplyAddValue231, rdSignedBitsToFloat(((sumValue196 & 2147483648u) != 0u) ? (-scalarValue174) : scalarValue174)), multiplyAddValue232);
        float scalarValue175 = sampledTextureValue91.x;
        float scalarValue176 = sampledTextureValue91.y;
        float scalarValue177 = sampledTextureValue91.z;
        float multiplyAddValue233 = fma(fragmentScalarConstants1.packedValues[531u], sampledTextureValue90.x - scalarValue175, scalarValue175);
        float multiplyAddValue234 = fma(fragmentScalarConstants1.packedValues[531u], sampledTextureValue90.y - scalarValue176, scalarValue176);
        float multiplyAddValue235 = fma(fragmentScalarConstants1.packedValues[531u], sampledTextureValue90.z - scalarValue177, scalarValue177);
        float comparisonValue177 = (productValue292 * (conditionValue24 ? (multiplyAddValue233 * 301.72412109375) : multiplyAddValue233)) * fragmentScalarConstants1.packedValues[530u];
        float comparisonValue178 = (productValue292 * (conditionValue24 ? (multiplyAddValue234 * 301.72412109375) : multiplyAddValue234)) * fragmentScalarConstants1.packedValues[530u];
        float comparisonValue179 = (productValue292 * (conditionValue24 ? (multiplyAddValue235 * 301.72412109375) : multiplyAddValue235)) * fragmentScalarConstants1.packedValues[530u];
        float productValue298 = comparisonValue120 * fragmentScalarConstants1.packedValues[235u];
        float productValue299 = multiplyAddValue108 * fragmentScalarConstants1.packedValues[235u];
        float productValue300 = multiplyAddValue109 * fragmentScalarConstants1.packedValues[235u];
        float productValue301 = spvNClamp(rdDot3Precise2(vec3(productValue298 * fragmentScalarConstants1.packedValues[296u], productValue299 * fragmentScalarConstants1.packedValues[296u], productValue300 * fragmentScalarConstants1.packedValues[296u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
        float multiplyAddValue236 = intermediateValue46 * fma(productValue301, fma(fragmentScalarConstants1.packedValues[296u], productValue298, -productValue284), productValue284);
        float multiplyAddValue237 = intermediateValue46 * fma(productValue301, fma(fragmentScalarConstants1.packedValues[296u], productValue299, -productValue285), productValue285);
        float multiplyAddValue238 = intermediateValue46 * fma(productValue301, fma(fragmentScalarConstants1.packedValues[296u], productValue300, -productValue286), productValue286);
        bool bitwiseValue70 = comparisonValue169 && (rdDot3Precise2(vec3(comparisonValue177, comparisonValue178, comparisonValue179), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < rdDot3Precise2(vec3(multiplyAddValue236, multiplyAddValue237, multiplyAddValue238), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)));
        vec4 sampledTextureValue92 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(vectorValue12, vec3(-(multiplyAddValue226 * inverseLengthValue35), -(multiplyAddValue227 * inverseLengthValue35), -(multiplyAddValue228 * inverseLengthValue35))), 0.0, 1.0), sumValue194));
        float scalarValue178 = sampledTextureValue92.x;
        float scalarValue179 = sampledTextureValue92.y;
        float multiplyAddValue239 = (bitwiseValue70 ? multiplyAddValue236 : comparisonValue177) * fma(multiplyAddValue110, scalarValue178, scalarValue179);
        float multiplyAddValue240 = (bitwiseValue70 ? multiplyAddValue237 : comparisonValue178) * fma(multiplyAddValue111, scalarValue178, scalarValue179);
        float multiplyAddValue241 = (bitwiseValue70 ? multiplyAddValue238 : comparisonValue179) * fma(multiplyAddValue112, scalarValue178, scalarValue179);
        float quotientValue37 = ((nonlinearValue5 / fragmentScalarConstants1.packedValues[274u]) + fragmentScalarConstants1.packedValues[552u]) - fragmentScalarConstants1.packedValues[272u];
        float productValue302 = 1.0 - spvNClamp(quotientValue37 * fragmentScalarConstants1.packedValues[273u], 0.0, 1.0);
        float quotientValue38 = 1.0 - spvNClamp(quotientValue37 / (fragmentScalarConstants1.packedValues[273u] - fragmentScalarConstants1.packedValues[272u]), 0.0, 1.0);
        float comparisonValue180 = comparisonValue170 ? (multiplyAddValue239 * productValue302) : (quotientValue38 * multiplyAddValue239);
        float comparisonValue181 = comparisonValue170 ? (multiplyAddValue240 * productValue302) : (quotientValue38 * multiplyAddValue240);
        float comparisonValue182 = comparisonValue170 ? (multiplyAddValue241 * productValue302) : (quotientValue38 * multiplyAddValue241);
        float productValue71;
        float productValue72;
        float productValue73;
        if (comparisonValue171)
        {
            float productValue303 = (multiplyAddValue79 + 1.0) * 0.5;
            float productValue304 = (multiplyAddValue80 + 1.0) * 0.5;
            float multiplyAddValue242 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue92, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue79, multiplyAddValue80 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue92, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue79, multiplyAddValue80 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[580u]) / (fragmentScalarConstants1.packedValues[581u] - fragmentScalarConstants1.packedValues[580u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[578u]), -0.5);
            uint sumValue197 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[578u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue242))), int(0u))))));
            float scalarValue180 = rdSignedBitsToFloat(sumValue197);
            vec4 sampledTextureValue93 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue303, productValue304, scalarValue180), 0.0);
            float scalarValue181 = sampledTextureValue93.w;
            float sampledTextureValue94 = fma(spvNClamp(multiplyAddValue242 - scalarValue180, 0.0, 1.0), textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue303, productValue304, rdSignedBitsToFloat(sumValue197 + 1u)), 0.0).w - scalarValue181, scalarValue181);
            productValue73 = comparisonValue180 * sampledTextureValue94;
            productValue72 = comparisonValue181 * sampledTextureValue94;
            productValue71 = comparisonValue182 * sampledTextureValue94;
        }
        else
        {
            productValue73 = comparisonValue180;
            productValue72 = comparisonValue181;
            productValue71 = comparisonValue182;
        }
        intermediateValue163 = productValue71;
        intermediateValue164 = productValue72;
        intermediateValue165 = productValue73;
    }
    else
    {
        intermediateValue163 = 0.0;
        intermediateValue164 = 0.0;
        intermediateValue165 = 0.0;
    }
    float multiplyAddValue243 = fma(multiplyAddValue88, fma(intermediateValue94, intermediateValue99 - sumValue187, sumValue187), multiplyAddValue87) + intermediateValue165;
    float multiplyAddValue244 = fma(multiplyAddValue88, fma(intermediateValue94, intermediateValue97 - sumValue188, sumValue188), multiplyAddValue86) + intermediateValue164;
    float multiplyAddValue245 = fma(multiplyAddValue88, fma(intermediateValue94, intermediateValue95 - sumValue189, sumValue189), multiplyAddValue85) + intermediateValue163;
    float productValue76;
    float productValue77;
    float productValue78;
    if (fragmentScalarConstants1.packedValues[544u] > 0.0)
    {
        float sampledTextureValue95 = (0.180000007152557373046875 / texture(sampler2D(materialTexture4, textureSampler4), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue76 = multiplyAddValue245 * sampledTextureValue95;
        productValue77 = multiplyAddValue244 * sampledTextureValue95;
        productValue78 = multiplyAddValue243 * sampledTextureValue95;
    }
    else
    {
        productValue76 = multiplyAddValue245;
        productValue77 = multiplyAddValue244;
        productValue78 = multiplyAddValue243;
    }
    fragmentColor0.x = productValue78;
    fragmentColor0.y = productValue77;
    fragmentColor0.z = productValue76;
    fragmentColor0.w = comparisonValue102 ? 1.0 : (scalarValue91 * varyingColor0.w);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue88;
    float multiplyAddValue89;
    float multiplyAddValue90;
    float multiplyAddValue91;
    if (comparisonValue243)
    {
        float productValue290 = (multiplyAddValue79 + 1.0) * 0.5;
        float productValue291 = (multiplyAddValue80 + 1.0) * 0.5;
        float multiplyAddValue373 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue92, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue79, multiplyAddValue80 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue92, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue79, multiplyAddValue80 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[576u]) / (fragmentScalarConstants1.packedValues[577u] - fragmentScalarConstants1.packedValues[576u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[574u]), -0.5);
        uint sumValue271 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[574u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue373))), int(0u))))));
        float scalarValue244 = rdSignedBitsToFloat(sumValue271);
        float sumValue272 = spvNClamp(multiplyAddValue373 - scalarValue244, 0.0, 1.0);
        vec4 sampledTextureValue106 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue290, productValue291, scalarValue244), 0.0);
        float scalarValue245 = sampledTextureValue106.x;
        float scalarValue246 = sampledTextureValue106.y;
        float scalarValue247 = sampledTextureValue106.z;
        float scalarValue248 = sampledTextureValue106.w;
        vec4 sampledTextureValue107 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue290, productValue291, rdSignedBitsToFloat(sumValue271 + 1u)), 0.0);
        multiplyAddValue88 = fma(sumValue272, sampledTextureValue107.z - scalarValue247, scalarValue247);
        multiplyAddValue89 = fma(sumValue272, sampledTextureValue107.y - scalarValue246, scalarValue246);
        multiplyAddValue90 = fma(sumValue272, sampledTextureValue107.x - scalarValue245, scalarValue245);
        multiplyAddValue91 = fma(sumValue272, sampledTextureValue107.w - scalarValue248, scalarValue248);
    }
    else
    {
        multiplyAddValue88 = 0.0;
        multiplyAddValue89 = 0.0;
        multiplyAddValue90 = 0.0;
        multiplyAddValue91 = 1.0;
    }
    float intermediateValue161;
    float intermediateValue162;
    float intermediateValue163;
    if (fragmentScalarConstants1.packedValues[524u] != 0.0)
    {
        float multiplyAddValue374 = spvNClamp(fma(fragmentScalarConstants1.packedValues[441u], 16.0, -fragmentScalarConstants1.packedValues[281u]) / spvNMax(fragmentScalarConstants1.packedValues[280u] - fragmentScalarConstants1.packedValues[281u], 1.0), 0.0, 1.0);
        float productValue352 = (multiplyAddValue374 * (multiplyAddValue374 * multiplyAddValue374)) * fragmentScalarConstants1.packedValues[524u];
        bool conditionValue43 = fragmentScalarConstants1.packedValues[540u] > 0.0;
        bool conditionValue44 = fragmentScalarConstants1.packedValues[535u] > 0.0;
        float multiplyAddValue375 = conditionValue44 ? (fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue272, fma(fragmentVectorConstants1.packedValues[4u].x, multiplyAddValue270, multiplyAddValue271 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue74;
        float multiplyAddValue376 = conditionValue44 ? (fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue272, fma(fragmentVectorConstants1.packedValues[4u].y, multiplyAddValue270, multiplyAddValue271 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue75;
        float multiplyAddValue377 = conditionValue44 ? (fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue272, fma(fragmentVectorConstants1.packedValues[4u].z, multiplyAddValue270, multiplyAddValue271 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue76;
        float comparisonValue246 = (conditionValue44 ? multiplyAddValue270 : varyingTexCoord3.x) - fragmentVectorConstants1.packedValues[11u].x;
        float comparisonValue247 = (conditionValue44 ? multiplyAddValue271 : varyingTexCoord3.y) - fragmentVectorConstants1.packedValues[11u].y;
        float comparisonValue248 = (conditionValue44 ? multiplyAddValue272 : varyingTexCoord3.z) - fragmentVectorConstants1.packedValues[11u].z;
        vec3 vectorValue28 = vec3(comparisonValue246, comparisonValue247, comparisonValue248);
        float inverseLengthValue42 = inversesqrt(rdDot3Precise2(vectorValue28, vectorValue28));
        float productValue353 = inverseLengthValue42 * comparisonValue246;
        float productValue354 = inverseLengthValue42 * comparisonValue247;
        float productValue355 = inverseLengthValue42 * comparisonValue248;
        vec3 vectorValue29 = vec3(multiplyAddValue375, multiplyAddValue376, multiplyAddValue377);
        float inverseLengthValue43 = inversesqrt(rdDot3Precise2(vectorValue29, vectorValue29));
        float scalarValue249 = rdDot3Precise2(vec3(productValue353, productValue354, productValue355), vec3(productValue312, productValue313, productValue314));
        float sumValue273 = -(scalarValue249 + scalarValue249);
        float multiplyAddValue378 = fma(productValue312, sumValue273, productValue353);
        float multiplyAddValue379 = fma(productValue313, sumValue273, productValue354);
        float multiplyAddValue380 = fma(productValue314, sumValue273, productValue355);
        float sumValue274 = 1.0 - intermediateValue42;
        float productValue356 = sumValue274 * sumValue274;
        float sumValue275 = fragmentScalarConstants1.packedValues[525u] - 1.0;
        float productValue357 = productValue356 * productValue356;
        float multiplyAddValue381 = (uint(int(fragmentScalarConstants1.packedValues[452u])) == 1u) ? (fma(intermediateValue42 - 1.0, sumValue274, 1.0) * sumValue275) : (fma(-productValue357, productValue357, 1.0) * sumValue275);
        uint sumValue276 = uint(int(fragmentScalarConstants1.packedValues[264u])) + 2u;
        uint scalarValue250 = uint(abs(int(sumValue276))) % 3u;
        vec4 sampledTextureValue108 = textureLod(samplerCubeArray(materialTexture9, textureSampler9), vec4(multiplyAddValue378, multiplyAddValue379, multiplyAddValue380, trunc(fragmentScalarConstants1.packedValues[264u])), multiplyAddValue381);
        vec4 sampledTextureValue109 = textureLod(samplerCubeArray(materialTexture9, textureSampler9), vec4(multiplyAddValue378, multiplyAddValue379, multiplyAddValue380, rdSignedBitsToFloat(((sumValue276 & 2147483648u) != 0u) ? (-scalarValue250) : scalarValue250)), multiplyAddValue381);
        float scalarValue251 = sampledTextureValue109.x;
        float scalarValue252 = sampledTextureValue109.y;
        float scalarValue253 = sampledTextureValue109.z;
        float multiplyAddValue382 = fma(fragmentScalarConstants1.packedValues[527u], sampledTextureValue108.x - scalarValue251, scalarValue251);
        float multiplyAddValue383 = fma(fragmentScalarConstants1.packedValues[527u], sampledTextureValue108.y - scalarValue252, scalarValue252);
        float multiplyAddValue384 = fma(fragmentScalarConstants1.packedValues[527u], sampledTextureValue108.z - scalarValue253, scalarValue253);
        float comparisonValue249 = (productValue352 * (conditionValue43 ? (multiplyAddValue382 * 301.72412109375) : multiplyAddValue382)) * fragmentScalarConstants1.packedValues[526u];
        float comparisonValue250 = (productValue352 * (conditionValue43 ? (multiplyAddValue383 * 301.72412109375) : multiplyAddValue383)) * fragmentScalarConstants1.packedValues[526u];
        float comparisonValue251 = (productValue352 * (conditionValue43 ? (multiplyAddValue384 * 301.72412109375) : multiplyAddValue384)) * fragmentScalarConstants1.packedValues[526u];
        float productValue358 = fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].x;
        float productValue359 = fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].y;
        float productValue360 = fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].z;
        float productValue361 = comparisonValue193 * fragmentScalarConstants1.packedValues[235u];
        float productValue362 = multiplyAddValue273 * fragmentScalarConstants1.packedValues[235u];
        float productValue363 = multiplyAddValue274 * fragmentScalarConstants1.packedValues[235u];
        float productValue364 = spvNClamp(rdDot3Precise2(vec3(productValue361 * fragmentScalarConstants1.packedValues[292u], productValue362 * fragmentScalarConstants1.packedValues[292u], productValue363 * fragmentScalarConstants1.packedValues[292u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
        float multiplyAddValue385 = intermediateValue44 * fma(productValue364, fma(fragmentScalarConstants1.packedValues[292u], productValue361, -productValue358), productValue358);
        float multiplyAddValue386 = intermediateValue44 * fma(productValue364, fma(fragmentScalarConstants1.packedValues[292u], productValue362, -productValue359), productValue359);
        float multiplyAddValue387 = intermediateValue44 * fma(productValue364, fma(fragmentScalarConstants1.packedValues[292u], productValue363, -productValue360), productValue360);
        bool bitwiseValue106 = comparisonValue241 && (rdDot3Precise2(vec3(comparisonValue249, comparisonValue250, comparisonValue251), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < rdDot3Precise2(vec3(multiplyAddValue385, multiplyAddValue386, multiplyAddValue387), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)));
        vec4 sampledTextureValue110 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(vectorValue25, vec3(-(multiplyAddValue375 * inverseLengthValue43), -(multiplyAddValue376 * inverseLengthValue43), -(multiplyAddValue377 * inverseLengthValue43))), 0.0, 1.0), sumValue274));
        float scalarValue254 = sampledTextureValue110.x;
        float scalarValue255 = sampledTextureValue110.y;
        float multiplyAddValue388 = (bitwiseValue106 ? multiplyAddValue385 : comparisonValue249) * fma(multiplyAddValue275, scalarValue254, scalarValue255);
        float multiplyAddValue389 = (bitwiseValue106 ? multiplyAddValue386 : comparisonValue250) * fma(multiplyAddValue276, scalarValue254, scalarValue255);
        float multiplyAddValue390 = (bitwiseValue106 ? multiplyAddValue387 : comparisonValue251) * fma(multiplyAddValue277, scalarValue254, scalarValue255);
        float quotientValue48 = ((nonlinearValue5 / fragmentScalarConstants1.packedValues[270u]) + fragmentScalarConstants1.packedValues[548u]) - fragmentScalarConstants1.packedValues[268u];
        float productValue365 = 1.0 - spvNClamp(quotientValue48 * fragmentScalarConstants1.packedValues[269u], 0.0, 1.0);
        float quotientValue49 = 1.0 - spvNClamp(quotientValue48 / (fragmentScalarConstants1.packedValues[269u] - fragmentScalarConstants1.packedValues[268u]), 0.0, 1.0);
        float comparisonValue252 = comparisonValue242 ? (multiplyAddValue388 * productValue365) : (quotientValue49 * multiplyAddValue388);
        float comparisonValue253 = comparisonValue242 ? (multiplyAddValue389 * productValue365) : (quotientValue49 * multiplyAddValue389);
        float comparisonValue254 = comparisonValue242 ? (multiplyAddValue390 * productValue365) : (quotientValue49 * multiplyAddValue390);
        float productValue74;
        float productValue75;
        float productValue76;
        if (comparisonValue243)
        {
            float productValue303 = (multiplyAddValue79 + 1.0) * 0.5;
            float productValue304 = (multiplyAddValue80 + 1.0) * 0.5;
            float multiplyAddValue391 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue92, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue79, multiplyAddValue80 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue92, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue79, multiplyAddValue80 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[576u]) / (fragmentScalarConstants1.packedValues[577u] - fragmentScalarConstants1.packedValues[576u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[574u]), -0.5);
            uint sumValue277 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[574u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue391))), int(0u))))));
            float scalarValue256 = rdSignedBitsToFloat(sumValue277);
            vec4 sampledTextureValue111 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue303, productValue304, scalarValue256), 0.0);
            float scalarValue257 = sampledTextureValue111.w;
            float sampledTextureValue112 = fma(spvNClamp(multiplyAddValue391 - scalarValue256, 0.0, 1.0), textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue303, productValue304, rdSignedBitsToFloat(sumValue277 + 1u)), 0.0).w - scalarValue257, scalarValue257);
            productValue76 = comparisonValue252 * sampledTextureValue112;
            productValue75 = comparisonValue253 * sampledTextureValue112;
            productValue74 = comparisonValue254 * sampledTextureValue112;
        }
        else
        {
            productValue76 = comparisonValue252;
            productValue75 = comparisonValue253;
            productValue74 = comparisonValue254;
        }
        intermediateValue161 = productValue74;
        intermediateValue162 = productValue75;
        intermediateValue163 = productValue76;
    }
    else
    {
        intermediateValue161 = 0.0;
        intermediateValue162 = 0.0;
        intermediateValue163 = 0.0;
    }
    float multiplyAddValue392 = fma(multiplyAddValue91, fma(intermediateValue92, intermediateValue97 - sumValue267, sumValue267), multiplyAddValue90) + intermediateValue163;
    float multiplyAddValue393 = fma(multiplyAddValue91, fma(intermediateValue92, intermediateValue95 - sumValue268, sumValue268), multiplyAddValue89) + intermediateValue162;
    float multiplyAddValue394 = fma(multiplyAddValue91, fma(intermediateValue92, intermediateValue93 - sumValue269, sumValue269), multiplyAddValue88) + intermediateValue161;
    float productValue79;
    float productValue80;
    float productValue81;
    if (fragmentScalarConstants1.packedValues[540u] > 0.0)
    {
        float sampledTextureValue95 = (0.180000007152557373046875 / texture(sampler2D(materialTexture4, textureSampler4), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue79 = sampledTextureValue95 * multiplyAddValue394;
        productValue80 = sampledTextureValue95 * multiplyAddValue393;
        productValue81 = sampledTextureValue95 * multiplyAddValue392;
    }
    else
    {
        productValue79 = multiplyAddValue394;
        productValue80 = multiplyAddValue393;
        productValue81 = multiplyAddValue392;
    }
    fragmentColor0.x = productValue81;
    fragmentColor0.y = productValue80;
    fragmentColor0.z = productValue79;
    fragmentColor0.w = 1.0;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = productValue143;
    fragmentColor0.y = productValue144;
    fragmentColor0.z = productValue145;
    fragmentColor0.w = intermediateValue10;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = productValue140;
    fragmentColor0.y = productValue141;
    fragmentColor0.z = productValue142;
    fragmentColor0.w = 1.0;
#endif
}
