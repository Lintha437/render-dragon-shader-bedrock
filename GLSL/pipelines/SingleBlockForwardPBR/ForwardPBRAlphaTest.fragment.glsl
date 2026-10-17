#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlockForwardPBR / ForwardPBRAlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 9
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
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool comparisonValue = fragmentScalarConstants1.packedValues[260u] != 0.0;
    float multiplyAddValue1 = comparisonValue ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x);
    float multiplyAddValue2 = comparisonValue ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y);
    float multiplyAddValue9 = comparisonValue ? (fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w) : (scalarValue2 * varyingColor0.z);
    bool comparisonValue3 = fragmentScalarConstants1.packedValues[488u] != 0.0;
    float exponentialValue4 = comparisonValue3 ? exp2(log2(spvNMax(multiplyAddValue1, 0.0)) * 2.2000000476837158203125) : ((multiplyAddValue1 <= 0.040449999272823333740234375) ? (multiplyAddValue1 * 0.077399380505084991455078125) : exp2(log2((multiplyAddValue1 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue5 = comparisonValue3 ? exp2(log2(spvNMax(multiplyAddValue2, 0.0)) * 2.2000000476837158203125) : ((multiplyAddValue2 <= 0.040449999272823333740234375) ? (multiplyAddValue2 * 0.077399380505084991455078125) : exp2(log2((multiplyAddValue2 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float exponentialValue6 = comparisonValue3 ? exp2(log2(spvNMax(multiplyAddValue9, 0.0)) * 2.2000000476837158203125) : ((multiplyAddValue9 <= 0.040449999272823333740234375) ? (multiplyAddValue9 * 0.077399380505084991455078125) : exp2(log2((multiplyAddValue9 + 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue96 = texture(sampler2D(materialTexture5, textureSampler5), vec2(varyingColor0.x, varyingColor0.y));
    float multiplyAddValue246 = sampledTextureValue.x * fma(varyingColor0.z, fma(sampledTextureValue96.x, 2.0, -1.0), 1.0);
    float multiplyAddValue247 = sampledTextureValue.y * fma(varyingColor0.z, fma(sampledTextureValue96.y, 2.0, -1.0), 1.0);
    float multiplyAddValue248 = sampledTextureValue.z * fma(varyingColor0.z, fma(sampledTextureValue96.z, 2.0, -1.0), 1.0);
    float productValue305 = multiplyAddValue246 * varyingColor0.w;
    float productValue306 = multiplyAddValue247 * varyingColor0.w;
    float productValue307 = multiplyAddValue248 * varyingColor0.w;
    bool comparisonValue183 = fragmentScalarConstants1.packedValues[484u] != 0.0;
    float multiplyAddValue249 = comparisonValue183 ? exp2(log2(spvNMax(productValue305, 0.0)) * 2.2000000476837158203125) : ((productValue305 <= 0.040449999272823333740234375) ? (productValue305 * 0.077399380505084991455078125) : exp2(log2(fma(multiplyAddValue246, varyingColor0.w, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float multiplyAddValue250 = comparisonValue183 ? exp2(log2(spvNMax(productValue306, 0.0)) * 2.2000000476837158203125) : ((productValue306 <= 0.040449999272823333740234375) ? (productValue306 * 0.077399380505084991455078125) : exp2(log2(fma(multiplyAddValue247, varyingColor0.w, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
    float multiplyAddValue251 = comparisonValue183 ? exp2(log2(spvNMax(productValue307, 0.0)) * 2.2000000476837158203125) : ((productValue307 <= 0.040449999272823333740234375) ? (productValue307 * 0.077399380505084991455078125) : exp2(log2(fma(multiplyAddValue248, varyingColor0.w, 0.054999999701976776123046875) * 0.947867333889007568359375) * 2.400000095367431640625));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool comparisonValue138 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
#endif
    uint scalarValue4 = uint(varyingTexCoord4);
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float intermediateValue41;
    float intermediateValue42;
    float intermediateValue44;
    float intermediateValue46;
    float multiplyAddValue3;
    float multiplyAddValue4;
    float multiplyAddValue5;
    if (scalarValue4 != 65535u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float intermediateValue39;
    float intermediateValue40;
    float intermediateValue42;
    float intermediateValue44;
    float multiplyAddValue6;
    float multiplyAddValue7;
    float multiplyAddValue8;
    if (scalarValue4 != 65535u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue34 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue102 = sampledTextureValue34.x;
    float scalarValue103 = sampledTextureValue34.y;
    float scalarValue104 = sampledTextureValue34.z;
    float scalarValue105 = sampledTextureValue34.w;
    float productValue123 = scalarValue102 * varyingColor0.x;
    float productValue124 = scalarValue103 * varyingColor0.y;
    float productValue125 = scalarValue104 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue10;
    if (fragmentVectorConstants1.packedValues[65u].x != 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue34 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue113 = texture(sampler2D(seasonsTextureTexture, seasonsTextureSampler), vec2(varyingColor0.x, varyingColor0.y));
    float productValue366 = (sampledTextureValue34.x * varyingColor0.w) * ((((sampledTextureValue113.x * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    float productValue367 = (sampledTextureValue34.y * varyingColor0.w) * ((((sampledTextureValue113.y * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    float productValue368 = (sampledTextureValue34.z * varyingColor0.w) * ((((sampledTextureValue113.z * 2.0) + (-1.0)) * varyingColor0.z) + 1.0);
    float exponentialValue;
    float exponentialValue1;
    float exponentialValue2;
    if (fragmentVectorConstants1.packedValues[121u].x != 0.0)
#endif
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits = uintBitsToFloat(intermediateValue10.packedValues[(scalarValue4 * 4u) + 1u]);
        float scalarValue5 = reinterpretedBits.x;
        float scalarValue6 = reinterpretedBits.y;
        float scalarValue7 = reinterpretedBits.z;
        float scalarValue8 = reinterpretedBits.w;
        vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue10.packedValues[(scalarValue4 * 4u) + 2u]);
        vec2 reinterpretedBits2 = uintBitsToFloat(intermediateValue9.packedValues[(scalarValue4 * 8u) + 6u]);
        float scalarValue9 = reinterpretedBits2.x;
        float scalarValue10 = reinterpretedBits2.y;
        uint reinterpretedBits3 = floatBitsToUint(reinterpretedBits1.x);
        float multiplyAddValue34;
        float multiplyAddValue35;
        float multiplyAddValue36;
        if ((reinterpretedBits3 & 4u) == 4u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits12 = uintBitsToFloat(intermediateValue11.packedValues[(scalarValue4 * 4u) + 1u]);
        float scalarValue182 = reinterpretedBits12.x;
        float scalarValue183 = reinterpretedBits12.y;
        float scalarValue184 = reinterpretedBits12.z;
        float scalarValue185 = reinterpretedBits12.w;
        vec4 reinterpretedBits13 = uintBitsToFloat(intermediateValue11.packedValues[(scalarValue4 * 4u) + 2u]);
        vec2 reinterpretedBits14 = uintBitsToFloat(intermediateValue10.packedValues[(scalarValue4 * 8u) + 6u]);
        float scalarValue186 = reinterpretedBits14.x;
        float scalarValue187 = reinterpretedBits14.y;
        uint reinterpretedBits15 = floatBitsToUint(reinterpretedBits13.x);
        float multiplyAddValue37;
        float multiplyAddValue38;
        float multiplyAddValue39;
        if ((reinterpretedBits15 & 4u) == 4u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue3 = (((productValue123 - scalarValue102) * scalarValue105) + scalarValue102) * varyingColor0.w;
        productValue4 = (((productValue124 - scalarValue103) * scalarValue105) + scalarValue103) * varyingColor0.w;
        productValue5 = (((productValue125 - scalarValue104) * scalarValue105) + scalarValue104) * varyingColor0.w;
        intermediateValue10 = 1.0;
    }
    else
    {
        productValue3 = productValue123;
        productValue4 = productValue124;
        productValue5 = productValue125;
        intermediateValue10 = scalarValue105 * varyingColor0.w;
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
    if (scalarValue4 == 65535u)
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
        float sampledTextureValue35 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 4u)).x);
        float sampledTextureValue36 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 5u)).x);
        float sampledTextureValue37 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 6u)).x);
        float sampledTextureValue40 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 7u)).x);
        uvec4 sampledTextureValue43 = texelFetch(pbrData, int((scalarValue4 * 16u) + 8u));
        uint scalarValue106 = sampledTextureValue43.x;
        float sampledTextureValue44 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 12u)).x);
        float sampledTextureValue45 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 13u)).x);
        float sampledTextureValue46 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 15u)).x);
        float intermediateValue24;
        float intermediateValue25;
        float intermediateValue26;
        if ((scalarValue106 & 4u) == 0u)
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
    if (scalarValue4 == 65535u)
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
        float sampledTextureValue35 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 4u)).x);
        float sampledTextureValue36 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 5u)).x);
        float sampledTextureValue37 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 6u)).x);
        float sampledTextureValue40 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 7u)).x);
        uvec4 sampledTextureValue43 = texelFetch(pbrData, int((scalarValue4 * 16u) + 8u));
        uint scalarValue106 = sampledTextureValue43.x;
        float sampledTextureValue44 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 12u)).x);
        float sampledTextureValue45 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 13u)).x);
        float sampledTextureValue46 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 15u)).x);
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
        if ((scalarValue106 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord0.x, scalarValue5, scalarValue7), fma(varyingTexCoord0.y, scalarValue6, scalarValue8)));
            multiplyAddValue34 = fma(sampledTextureValue5.y, 2.0, -1.0);
            multiplyAddValue35 = fma(sampledTextureValue5.x, 2.0, -1.0);
            multiplyAddValue36 = fma(sampledTextureValue5.z, 2.0, -1.0);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue97 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord0.x, scalarValue182, scalarValue184), fma(varyingTexCoord0.y, scalarValue183, scalarValue185)));
            multiplyAddValue37 = fma(sampledTextureValue97.y, 2.0, -1.0);
            multiplyAddValue38 = fma(sampledTextureValue97.x, 2.0, -1.0);
            multiplyAddValue39 = fma(sampledTextureValue97.z, 2.0, -1.0);
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue9;
            float branchMergedValue17;
            float branchMergedValue18;
            if ((scalarValue106 & 8u) == 0u)
            {
                float branchMergedValue48;
                float branchMergedValue52;
                float branchMergedValue53;
                if ((scalarValue106 & 16u) == 0u)
                {
                    branchMergedValue48 = 1.0;
                    branchMergedValue52 = 0.0;
                    branchMergedValue53 = 0.0;
                }
                else
                {
                    float multiplyAddValue211 = fma(varyingTexCoord0.x, sampledTextureValue35, sampledTextureValue37);
                    float multiplyAddValue212 = fma(varyingTexCoord0.y, sampledTextureValue36, sampledTextureValue40);
                    vec4 sampledTextureValue59 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue211, multiplyAddValue212), 0.0);
                    float scalarValue107 = sampledTextureValue59.x;
                    float scalarValue108 = sampledTextureValue59.y;
                    float scalarValue109 = sampledTextureValue59.z;
                    float multiplyAddValue213 = spvNClamp(fma(spvNMin(sampledTextureValue46 - sampledTextureValue45, sampledTextureValue46), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue19 = multiplyAddValue213 > 0.0;
                    float branchMergedValue61;
                    float branchMergedValue63;
                    float branchMergedValue64;
                    if ((scalarValue107 == scalarValue108) && (scalarValue108 == scalarValue109))
                    {
                        float branchMergedValue68;
                        float branchMergedValue70;
                        float branchMergedValue71;
                        if (conditionValue19)
                        {
                            uvec2 sampledTextureValue60 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue126 = float(int(uint(int(float(int(sampledTextureValue60.x)))))) * multiplyAddValue211;
                            float productValue127 = float(int(uint(int(float(int(sampledTextureValue60.y)))))) * multiplyAddValue212;
                            float scalarValue110 = fract(productValue126);
                            float scalarValue111 = fract(productValue127);
                            float comparisonValue18;
                            if (abs(scalarValue110 + (-0.5)) < 0.0625)
                            {
                                comparisonValue18 = ((scalarValue110 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue211;
                            }
                            else
                            {
                                comparisonValue18 = multiplyAddValue211;
                            }
                            float comparisonValue20;
                            if (abs(scalarValue111 + (-0.5)) < 0.0625)
                            {
                                comparisonValue20 = ((scalarValue111 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue212;
                            }
                            else
                            {
                                comparisonValue20 = multiplyAddValue212;
                            }
                            vec4 sampledTextureValue61 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue18, comparisonValue20));
                            float scalarValue112 = sampledTextureValue61.x;
                            float scalarValue113 = sampledTextureValue61.y;
                            float scalarValue114 = sampledTextureValue61.z;
                            float scalarValue115 = sampledTextureValue61.w;
                            float sumValue134 = fract(productValue126 + 0.5);
                            float sumValue135 = fract(productValue127 + 0.5);
                            bool conditionValue20 = sumValue135 > 0.5;
                            float intermediateValue4[2];
                            intermediateValue4[0u] = conditionValue20 ? scalarValue112 : scalarValue115;
                            intermediateValue4[1u] = conditionValue20 ? scalarValue113 : scalarValue114;
                            float productValue128 = intermediateValue4[uint(int(spvNClamp((sumValue134 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue129 = intermediateValue4[uint(int(spvNClamp((sumValue134 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue136 = productValue128 - productValue129;
                            bool conditionValue21 = sumValue134 > 0.5;
                            intermediateValue4[0u] = conditionValue21 ? scalarValue114 : scalarValue115;
                            intermediateValue4[1u] = conditionValue21 ? scalarValue113 : scalarValue112;
                            float productValue130 = intermediateValue4[uint(int(spvNClamp((sumValue135 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue4[uint(int(spvNClamp((sumValue135 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue18 = inversesqrt(dot(vec3(sumValue136, productValue130, 0.25), vec3(sumValue136, productValue130, 0.25)));
                            float productValue131 = inverseLengthValue18 * multiplyAddValue213;
                            branchMergedValue68 = inverseLengthValue18 * 0.25;
                            branchMergedValue70 = productValue131 * productValue130;
                            branchMergedValue71 = productValue131 * sumValue136;
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
                        uvec2 sampledTextureValue62 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue69;
                        float branchMergedValue72;
                        float branchMergedValue73;
                        if (conditionValue19)
                        {
                            float productValue132 = fract(float(int(uint(int(float(int(sampledTextureValue62.x)))))) * multiplyAddValue211);
                            float productValue133 = fract(float(int(uint(int(float(int(sampledTextureValue62.y)))))) * multiplyAddValue212);
                            float comparisonValue139 = (((productValue132 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue108 * 2.0) + (-1.0))) - (((productValue132 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue59.w * 2.0) + (-1.0)));
                            float comparisonValue140 = (((productValue133 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue109 * 2.0) + (-1.0))) - (((productValue133 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue107 * 2.0) + (-1.0)));
                            float comparisonValue141 = ((abs(comparisonValue139) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue139;
                            float comparisonValue142 = ((abs(comparisonValue140) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue140;
                            float inverseLengthValue19 = inversesqrt(dot(vec3(comparisonValue141, comparisonValue142, 0.25), vec3(comparisonValue141, comparisonValue142, 0.25)));
                            float productValue134 = inverseLengthValue19 * multiplyAddValue213;
                            branchMergedValue69 = inverseLengthValue19 * 0.25;
                            branchMergedValue72 = productValue134 * comparisonValue142;
                            branchMergedValue73 = productValue134 * comparisonValue141;
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
                float multiplyAddValue214 = fma(varyingTexCoord0.x, sampledTextureValue35, sampledTextureValue37);
                float multiplyAddValue215 = fma(varyingTexCoord0.y, sampledTextureValue36, sampledTextureValue40);
                float multiplyAddValue216 = spvNClamp(fma(spvNMin(sampledTextureValue46 - sampledTextureValue45, sampledTextureValue46), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue49;
                float branchMergedValue54;
                float branchMergedValue55;
                if (multiplyAddValue216 > 0.0)
                {
                    uvec2 sampledTextureValue63 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue135 = float(int(uint(int(float(int(sampledTextureValue63.x)))))) * multiplyAddValue214;
                    float productValue136 = float(int(uint(int(float(int(sampledTextureValue63.y)))))) * multiplyAddValue215;
                    float scalarValue116 = fract(productValue135);
                    float scalarValue117 = fract(productValue136);
                    float comparisonValue8;
                    if (abs(scalarValue116 + (-0.5)) < 0.0625)
                    {
                        comparisonValue8 = ((scalarValue116 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue214;
                    }
                    else
                    {
                        comparisonValue8 = multiplyAddValue214;
                    }
                    float comparisonValue17;
                    if (abs(scalarValue117 + (-0.5)) < 0.0625)
                    {
                        comparisonValue17 = ((scalarValue117 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue215;
                    }
                    else
                    {
                        comparisonValue17 = multiplyAddValue215;
                    }
                    vec4 sampledTextureValue64 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue8, comparisonValue17));
                    float scalarValue118 = sampledTextureValue64.x;
                    float scalarValue119 = sampledTextureValue64.y;
                    float scalarValue120 = sampledTextureValue64.z;
                    float scalarValue121 = sampledTextureValue64.w;
                    float sumValue137 = fract(productValue135 + 0.5);
                    float sumValue138 = fract(productValue136 + 0.5);
                    bool conditionValue22 = sumValue138 > 0.5;
                    float intermediateValue5[2];
                    intermediateValue5[0u] = conditionValue22 ? scalarValue118 : scalarValue121;
                    intermediateValue5[1u] = conditionValue22 ? scalarValue119 : scalarValue120;
                    float productValue137 = intermediateValue5[uint(int(spvNClamp((sumValue137 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue138 = intermediateValue5[uint(int(spvNClamp((sumValue137 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue139 = productValue137 - productValue138;
                    bool conditionValue23 = sumValue137 > 0.5;
                    intermediateValue5[0u] = conditionValue23 ? scalarValue120 : scalarValue121;
                    intermediateValue5[1u] = conditionValue23 ? scalarValue119 : scalarValue118;
                    float productValue139 = intermediateValue5[uint(int(spvNClamp((sumValue138 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue5[uint(int(spvNClamp((sumValue138 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue20 = inversesqrt(dot(vec3(sumValue139, productValue139, 0.25), vec3(sumValue139, productValue139, 0.25)));
                    float productValue159 = inverseLengthValue20 * multiplyAddValue216;
                    branchMergedValue49 = inverseLengthValue20 * 0.25;
                    branchMergedValue54 = productValue159 * productValue139;
                    branchMergedValue55 = productValue159 * sumValue139;
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
            if ((scalarValue106 & 8u) == 0u)
            {
                float branchMergedValue48;
                float branchMergedValue52;
                float branchMergedValue53;
                if ((scalarValue106 & 16u) == 0u)
                {
                    branchMergedValue48 = 1.0;
                    branchMergedValue52 = 0.0;
                    branchMergedValue53 = 0.0;
                }
                else
                {
                    float multiplyAddValue211 = fma(varyingTexCoord0.x, sampledTextureValue35, sampledTextureValue37);
                    float multiplyAddValue212 = fma(varyingTexCoord0.y, sampledTextureValue36, sampledTextureValue40);
                    vec4 sampledTextureValue59 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue211, multiplyAddValue212), 0.0);
                    float scalarValue107 = sampledTextureValue59.x;
                    float scalarValue108 = sampledTextureValue59.y;
                    float scalarValue109 = sampledTextureValue59.z;
                    float multiplyAddValue213 = spvNClamp(fma(spvNMin(sampledTextureValue46 - sampledTextureValue45, sampledTextureValue46), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue19 = multiplyAddValue213 > 0.0;
                    float branchMergedValue61;
                    float branchMergedValue63;
                    float branchMergedValue64;
                    if ((scalarValue107 == scalarValue108) && (scalarValue108 == scalarValue109))
                    {
                        float branchMergedValue68;
                        float branchMergedValue70;
                        float branchMergedValue71;
                        if (conditionValue19)
                        {
                            uvec2 sampledTextureValue60 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue126 = float(int(uint(int(float(int(sampledTextureValue60.x)))))) * multiplyAddValue211;
                            float productValue127 = float(int(uint(int(float(int(sampledTextureValue60.y)))))) * multiplyAddValue212;
                            float scalarValue110 = fract(productValue126);
                            float scalarValue111 = fract(productValue127);
                            float comparisonValue18;
                            if (abs(scalarValue110 + (-0.5)) < 0.0625)
                            {
                                comparisonValue18 = ((scalarValue110 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue211;
                            }
                            else
                            {
                                comparisonValue18 = multiplyAddValue211;
                            }
                            float comparisonValue20;
                            if (abs(scalarValue111 + (-0.5)) < 0.0625)
                            {
                                comparisonValue20 = ((scalarValue111 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue212;
                            }
                            else
                            {
                                comparisonValue20 = multiplyAddValue212;
                            }
                            vec4 sampledTextureValue61 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue18, comparisonValue20));
                            float scalarValue112 = sampledTextureValue61.x;
                            float scalarValue113 = sampledTextureValue61.y;
                            float scalarValue114 = sampledTextureValue61.z;
                            float scalarValue115 = sampledTextureValue61.w;
                            float sumValue134 = fract(productValue126 + 0.5);
                            float sumValue135 = fract(productValue127 + 0.5);
                            bool conditionValue20 = sumValue135 > 0.5;
                            float intermediateValue4[2];
                            intermediateValue4[0u] = conditionValue20 ? scalarValue112 : scalarValue115;
                            intermediateValue4[1u] = conditionValue20 ? scalarValue113 : scalarValue114;
                            float productValue128 = intermediateValue4[uint(int(spvNClamp((sumValue134 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue129 = intermediateValue4[uint(int(spvNClamp((sumValue134 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue136 = productValue128 - productValue129;
                            bool conditionValue21 = sumValue134 > 0.5;
                            intermediateValue4[0u] = conditionValue21 ? scalarValue114 : scalarValue115;
                            intermediateValue4[1u] = conditionValue21 ? scalarValue113 : scalarValue112;
                            float productValue130 = intermediateValue4[uint(int(spvNClamp((sumValue135 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue4[uint(int(spvNClamp((sumValue135 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue18 = inversesqrt(dot(vec3(sumValue136, productValue130, 0.25), vec3(sumValue136, productValue130, 0.25)));
                            float productValue131 = inverseLengthValue18 * multiplyAddValue213;
                            branchMergedValue68 = inverseLengthValue18 * 0.25;
                            branchMergedValue70 = productValue131 * productValue130;
                            branchMergedValue71 = productValue131 * sumValue136;
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
                        uvec2 sampledTextureValue62 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue69;
                        float branchMergedValue72;
                        float branchMergedValue73;
                        if (conditionValue19)
                        {
                            float productValue132 = fract(float(int(uint(int(float(int(sampledTextureValue62.x)))))) * multiplyAddValue211);
                            float productValue133 = fract(float(int(uint(int(float(int(sampledTextureValue62.y)))))) * multiplyAddValue212);
                            float comparisonValue139 = (((productValue132 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue108 * 2.0) + (-1.0))) - (((productValue132 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue59.w * 2.0) + (-1.0)));
                            float comparisonValue140 = (((productValue133 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue109 * 2.0) + (-1.0))) - (((productValue133 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue107 * 2.0) + (-1.0)));
                            float comparisonValue141 = ((abs(comparisonValue139) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue139;
                            float comparisonValue142 = ((abs(comparisonValue140) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue140;
                            float inverseLengthValue19 = inversesqrt(dot(vec3(comparisonValue141, comparisonValue142, 0.25), vec3(comparisonValue141, comparisonValue142, 0.25)));
                            float productValue134 = inverseLengthValue19 * multiplyAddValue213;
                            branchMergedValue69 = inverseLengthValue19 * 0.25;
                            branchMergedValue72 = productValue134 * comparisonValue142;
                            branchMergedValue73 = productValue134 * comparisonValue141;
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
                float multiplyAddValue214 = fma(varyingTexCoord0.x, sampledTextureValue35, sampledTextureValue37);
                float multiplyAddValue215 = fma(varyingTexCoord0.y, sampledTextureValue36, sampledTextureValue40);
                float multiplyAddValue216 = spvNClamp(fma(spvNMin(sampledTextureValue46 - sampledTextureValue45, sampledTextureValue46), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue49;
                float branchMergedValue54;
                float branchMergedValue55;
                if (multiplyAddValue216 > 0.0)
                {
                    uvec2 sampledTextureValue63 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue135 = float(int(uint(int(float(int(sampledTextureValue63.x)))))) * multiplyAddValue214;
                    float productValue136 = float(int(uint(int(float(int(sampledTextureValue63.y)))))) * multiplyAddValue215;
                    float scalarValue116 = fract(productValue135);
                    float scalarValue117 = fract(productValue136);
                    float comparisonValue8;
                    if (abs(scalarValue116 + (-0.5)) < 0.0625)
                    {
                        comparisonValue8 = ((scalarValue116 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue214;
                    }
                    else
                    {
                        comparisonValue8 = multiplyAddValue214;
                    }
                    float comparisonValue17;
                    if (abs(scalarValue117 + (-0.5)) < 0.0625)
                    {
                        comparisonValue17 = ((scalarValue117 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue215;
                    }
                    else
                    {
                        comparisonValue17 = multiplyAddValue215;
                    }
                    vec4 sampledTextureValue64 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue8, comparisonValue17));
                    float scalarValue118 = sampledTextureValue64.x;
                    float scalarValue119 = sampledTextureValue64.y;
                    float scalarValue120 = sampledTextureValue64.z;
                    float scalarValue121 = sampledTextureValue64.w;
                    float sumValue137 = fract(productValue135 + 0.5);
                    float sumValue138 = fract(productValue136 + 0.5);
                    bool conditionValue22 = sumValue138 > 0.5;
                    float intermediateValue5[2];
                    intermediateValue5[0u] = conditionValue22 ? scalarValue118 : scalarValue121;
                    intermediateValue5[1u] = conditionValue22 ? scalarValue119 : scalarValue120;
                    float productValue137 = intermediateValue5[uint(int(spvNClamp((sumValue137 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue138 = intermediateValue5[uint(int(spvNClamp((sumValue137 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue139 = productValue137 - productValue138;
                    bool conditionValue23 = sumValue137 > 0.5;
                    intermediateValue5[0u] = conditionValue23 ? scalarValue120 : scalarValue121;
                    intermediateValue5[1u] = conditionValue23 ? scalarValue119 : scalarValue118;
                    float productValue139 = intermediateValue5[uint(int(spvNClamp((sumValue138 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue5[uint(int(spvNClamp((sumValue138 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue20 = inversesqrt(dot(vec3(sumValue139, productValue139, 0.25), vec3(sumValue139, productValue139, 0.25)));
                    float productValue159 = inverseLengthValue20 * multiplyAddValue216;
                    branchMergedValue49 = inverseLengthValue20 * 0.25;
                    branchMergedValue54 = productValue159 * productValue139;
                    branchMergedValue55 = productValue159 * sumValue139;
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
            float reinterpretedBits4 = uintBitsToFloat(intermediateValue8.packedValues[(scalarValue4 * 16u) + 15u]);
            float intermediateValue65;
            float intermediateValue66;
            float intermediateValue67;
            if ((reinterpretedBits3 & 8u) == 8u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits16 = uintBitsToFloat(intermediateValue9.packedValues[(scalarValue4 * 16u) + 15u]);
            float intermediateValue63;
            float intermediateValue64;
            float intermediateValue65;
            if ((reinterpretedBits15 & 8u) == 8u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            vec4 sampledTextureValue65 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue35, sampledTextureValue37), fma(varyingTexCoord0.y, sampledTextureValue36, sampledTextureValue40)));
            intermediateValue24 = (sampledTextureValue65.x * 2.0) + (-1.0);
            intermediateValue25 = (sampledTextureValue65.y * 2.0) + (-1.0);
            intermediateValue26 = (sampledTextureValue65.z * 2.0) + (-1.0);
        }
        float intermediateValue14;
        float sampledTextureValue1;
        float sampledTextureValue2;
        float sampledTextureValue3;
        if ((scalarValue106 & 1u) == 0u)
        {
            sampledTextureValue1 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 10u)).x);
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 11u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 9u)).x);
            intermediateValue14 = sampledTextureValue44;
        }
        else
        {
            vec4 sampledTextureValue66 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue4 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 3u)).x))));
            sampledTextureValue1 = sampledTextureValue66.y;
            sampledTextureValue3 = sampledTextureValue66.x;
            sampledTextureValue2 = sampledTextureValue66.z;
            intermediateValue14 = ((scalarValue106 & 2u) != 0u) ? sampledTextureValue66.w : sampledTextureValue44;
        }
        float comparisonValue143 = comparisonValue138 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue144 = comparisonValue138 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue145 = comparisonValue138 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue21 = inversesqrt(dot(vec3(comparisonValue143, comparisonValue144, comparisonValue145), vec3(comparisonValue143, comparisonValue144, comparisonValue145)));
        float inverseLengthValue22 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue23 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue24;
        multiplyAddValue = fma(inverseLengthValue21 * comparisonValue143, intermediateValue26, fma(inverseLengthValue22 * varyingBitangent0.x, intermediateValue25, inverseLengthValue23 * varyingTangent0.x));
        intermediateValue11 = fma(inverseLengthValue21 * comparisonValue144, intermediateValue26, fma(inverseLengthValue22 * varyingBitangent0.y, intermediateValue25, inverseLengthValue23 * varyingTangent0.y));
        intermediateValue12 = fma(inverseLengthValue21 * comparisonValue145, intermediateValue26, fma(inverseLengthValue22 * varyingBitangent0.z, intermediateValue25, inverseLengthValue23 * varyingTangent0.z));
        intermediateValue13 = intermediateValue14;
        intermediateValue15 = sampledTextureValue1;
        intermediateValue16 = sampledTextureValue2;
        intermediateValue17 = sampledTextureValue3;
    }
    float multiplyAddValue217 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue218 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue219 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue220 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue221 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue220, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue219, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue218, multiplyAddValue217 * fragmentVectorConstants1.packedValues[0u].w)));
    float multiplyAddValue222 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue220, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue219, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue218, multiplyAddValue217 * fragmentVectorConstants1.packedValues[0u].x))) / multiplyAddValue221;
    float multiplyAddValue223 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue220, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue219, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue218, multiplyAddValue217 * fragmentVectorConstants1.packedValues[0u].y))) / multiplyAddValue221;
    float multiplyAddValue224 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue220, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue219, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue218, multiplyAddValue217 * fragmentVectorConstants1.packedValues[0u].z))) / multiplyAddValue221;
    float inverseLengthValue24 = inversesqrt(dot(vec3(multiplyAddValue, intermediateValue11, intermediateValue12), vec3(multiplyAddValue, intermediateValue11, intermediateValue12)));
    float productValue160 = inverseLengthValue24 * multiplyAddValue;
    float productValue161 = inverseLengthValue24 * intermediateValue11;
    float productValue162 = inverseLengthValue24 * intermediateValue12;
    float multiplyAddValue225 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue162, fma(fragmentVectorConstants1.packedValues[5u].x, productValue161, productValue160 * fragmentVectorConstants1.packedValues[4u].x));
    float multiplyAddValue226 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue162, fma(fragmentVectorConstants1.packedValues[5u].y, productValue161, productValue160 * fragmentVectorConstants1.packedValues[4u].y));
    float multiplyAddValue227 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue162, fma(fragmentVectorConstants1.packedValues[5u].z, productValue161, productValue160 * fragmentVectorConstants1.packedValues[4u].z));
    float sumValue19 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[115u].x;
    float sumValue20 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[115u].y;
    float sumValue21 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[115u].z;
    float scalarValue122 = dFdxCoarse(multiplyAddValue217);
    float scalarValue123 = dFdxCoarse(multiplyAddValue218);
    float scalarValue124 = dFdxCoarse(multiplyAddValue219);
    float inverseLengthValue25 = inversesqrt(dot(vec3(scalarValue122, scalarValue123, scalarValue124), vec3(scalarValue122, scalarValue123, scalarValue124)));
    float productValue163 = inverseLengthValue25 * scalarValue122;
    float productValue164 = inverseLengthValue25 * scalarValue123;
    float productValue165 = inverseLengthValue25 * scalarValue124;
    float sumValue140 = (-0.0) - multiplyAddValue219;
    float sumValue141 = dFdyCoarse((-0.0) - multiplyAddValue217);
    float sumValue142 = dFdyCoarse((-0.0) - multiplyAddValue218);
    float scalarValue125 = dFdyCoarse(sumValue140);
    float inverseLengthValue26 = inversesqrt(dot(vec3(sumValue141, sumValue142, scalarValue125), vec3(sumValue141, sumValue142, scalarValue125)));
    float productValue166 = inverseLengthValue26 * sumValue141;
    float productValue167 = inverseLengthValue26 * sumValue142;
    float productValue168 = inverseLengthValue26 * scalarValue125;
    float productValue171 = (productValue168 * productValue164) - (productValue167 * productValue165);
    float productValue174 = (productValue166 * productValue165) - (productValue168 * productValue163);
    float productValue175 = (productValue167 * productValue163) - (productValue166 * productValue164);
    float inverseLengthValue27 = inversesqrt(dot(vec3(productValue171, productValue174, productValue175), vec3(productValue171, productValue174, productValue175)));
    float productValue178 = productValue171 * inverseLengthValue27;
    float productValue183 = productValue174 * inverseLengthValue27;
    float productValue186 = productValue175 * inverseLengthValue27;
    float multiplyAddValue228 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue186, fma(fragmentVectorConstants1.packedValues[9u].x, productValue183, productValue178 * fragmentVectorConstants1.packedValues[8u].x));
    float multiplyAddValue229 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue186, fma(fragmentVectorConstants1.packedValues[9u].y, productValue183, productValue178 * fragmentVectorConstants1.packedValues[8u].y));
    float multiplyAddValue230 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue186, fma(fragmentVectorConstants1.packedValues[9u].z, productValue183, productValue178 * fragmentVectorConstants1.packedValues[8u].z));
    float inverseLengthValue28 = inversesqrt(dot(vec3(multiplyAddValue228, multiplyAddValue229, multiplyAddValue230), vec3(multiplyAddValue228, multiplyAddValue229, multiplyAddValue230)));
    float quotientValue19 = roundEven((inverseLengthValue28 * multiplyAddValue228) / fragmentVectorConstants1.packedValues[137u].x) * fragmentVectorConstants1.packedValues[137u].x;
    float quotientValue20 = roundEven((inverseLengthValue28 * multiplyAddValue229) / fragmentVectorConstants1.packedValues[137u].x) * fragmentVectorConstants1.packedValues[137u].x;
    float quotientValue21 = roundEven((inverseLengthValue28 * multiplyAddValue230) / fragmentVectorConstants1.packedValues[137u].x) * fragmentVectorConstants1.packedValues[137u].x;
    float inverseLengthValue29 = inversesqrt(dot(vec3(quotientValue19, quotientValue20, quotientValue21), vec3(quotientValue19, quotientValue20, quotientValue21)));
    float productValue187 = inverseLengthValue29 * quotientValue19;
    float productValue188 = inverseLengthValue29 * quotientValue20;
    float productValue189 = inverseLengthValue29 * quotientValue21;
    float productValue190 = fragmentVectorConstants1.packedValues[134u].z * 0.5;
    float quotientValue22 = productValue190 - (sumValue19 - (floor(sumValue19 / fragmentVectorConstants1.packedValues[134u].z) * fragmentVectorConstants1.packedValues[134u].z));
    float quotientValue23 = productValue190 - (sumValue20 - (floor(sumValue20 / fragmentVectorConstants1.packedValues[134u].z) * fragmentVectorConstants1.packedValues[134u].z));
    float quotientValue24 = productValue190 - (sumValue21 - (floor(sumValue21 / fragmentVectorConstants1.packedValues[134u].z) * fragmentVectorConstants1.packedValues[134u].z));
    float dotProductValue = dot(vec3(quotientValue22, quotientValue23, quotientValue24), vec3(productValue187, productValue188, productValue189));
    float productValue191 = ((quotientValue22 + sumValue19) - (dotProductValue * productValue187)) + fragmentVectorConstants1.packedValues[115u].x;
    float productValue192 = ((sumValue20 - (dotProductValue * productValue188)) + quotientValue23) + fragmentVectorConstants1.packedValues[115u].y;
    float productValue193 = ((sumValue21 - (dotProductValue * productValue189)) + quotientValue24) + fragmentVectorConstants1.packedValues[115u].z;
    float intermediateValue23;
    float productValue29;
    float productValue30;
    if ((fragmentVectorConstants1.packedValues[111u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[62u].x + fragmentVectorConstants1.packedValues[62u].y) + fragmentVectorConstants1.packedValues[62u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue194 = fragmentVectorConstants1.packedValues[111u].x * fragmentVectorConstants1.packedValues[111u].x;
        intermediateValue23 = spvNClamp(productValue194, 0.0, 1.0);
        productValue29 = spvNClamp(((productValue194 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue194, 0.0, 1.0);
        productValue30 = spvNClamp((((productValue194 * productValue194) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue194, 0.0, 1.0);
    }
    else
    {
        intermediateValue23 = fragmentVectorConstants1.packedValues[62u].x;
        productValue29 = fragmentVectorConstants1.packedValues[62u].y;
        productValue30 = fragmentVectorConstants1.packedValues[62u].z;
    }
    float sumValue143 = 1.0 - intermediateValue17;
    float productValue195 = sumValue143 * 0.039999999105930328369140625;
    float productValue196 = productValue195 + (intermediateValue17 * exponentialValue);
    float productValue197 = productValue195 + (intermediateValue17 * exponentialValue1);
    float productValue198 = productValue195 + (intermediateValue17 * exponentialValue2);
    float sampledTextureValue13;
    if ((fragmentVectorConstants1.packedValues[112u].x != 0.0) && (fragmentVectorConstants1.packedValues[112u].w != 0.0))
    {
        sampledTextureValue13 = exp2(log2((texture(sampler2DArray(causticsTextureTexture, causticsTextureSampler), vec3((varyingTexCoord3.x - fragmentVectorConstants1.packedValues[115u].x) * fragmentVectorConstants1.packedValues[112u].y, (varyingTexCoord3.z - fragmentVectorConstants1.packedValues[115u].z) * fragmentVectorConstants1.packedValues[112u].y, fragmentVectorConstants1.packedValues[113u].y)).x * 2.0) * spvNClamp(dot(vec3(0.0, 1.0, 0.0), vec3(productValue160, productValue161, productValue162)), 0.0, 1.0)) * fragmentVectorConstants1.packedValues[112u].z) * (fragmentVectorConstants1.packedValues[112u].z + 1.0);
    }
    else
    {
        sampledTextureValue13 = 1.0;
    }
    float quotientValue25 = spvNClamp(((fragmentVectorConstants1.packedValues[111u].y * 16.0) - fragmentVectorConstants1.packedValues[71u].y) / spvNMax(fragmentVectorConstants1.packedValues[71u].x - fragmentVectorConstants1.packedValues[71u].y, 1.0), 0.0, 1.0);
    float nonlinearValue4 = sqrt(((multiplyAddValue218 * multiplyAddValue218) + (multiplyAddValue217 * multiplyAddValue217)) + (multiplyAddValue219 * multiplyAddValue219));
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
    if (multiplyAddValue224 != 1.0)
    {
        float sumValue144 = nonlinearValue4 + 9.9999997473787516355514526367188e-05;
        float quotientValue26 = multiplyAddValue217 / sumValue144;
        float quotientValue27 = multiplyAddValue218 / sumValue144;
        float quotientValue28 = multiplyAddValue219 / sumValue144;
        float sumValue145 = (-0.0) - quotientValue26;
        float sumValue146 = (-0.0) - quotientValue27;
        float sumValue147 = (-0.0) - quotientValue28;
        float productValue199 = fragmentVectorConstants1.packedValues[141u].x * intermediateValue13;
        bool conditionValue24 = int(uint(int(fragmentVectorConstants1.packedValues[134u].y))) > int(0u);
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
            vec4 sampledTextureValue65 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue35, sampledTextureValue37), fma(varyingTexCoord0.y, sampledTextureValue36, sampledTextureValue40)));
            intermediateValue19 = (sampledTextureValue65.x * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue65.y * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue65.z * 2.0) + (-1.0);
        }
        float intermediateValue9;
        float sampledTextureValue2;
        float sampledTextureValue3;
        float sampledTextureValue4;
        if ((scalarValue106 & 1u) == 0u)
        {
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 10u)).x);
            sampledTextureValue4 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 11u)).x);
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 9u)).x);
            intermediateValue9 = sampledTextureValue44;
        }
        else
        {
            vec4 sampledTextureValue66 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue4 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 3u)).x))));
            sampledTextureValue2 = sampledTextureValue66.y;
            sampledTextureValue4 = sampledTextureValue66.x;
            sampledTextureValue3 = sampledTextureValue66.z;
            intermediateValue9 = ((scalarValue106 & 2u) != 0u) ? sampledTextureValue66.w : sampledTextureValue44;
        }
        float comparisonValue143 = comparisonValue138 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue144 = comparisonValue138 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue145 = comparisonValue138 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue21 = inversesqrt(dot(vec3(comparisonValue143, comparisonValue144, comparisonValue145), vec3(comparisonValue143, comparisonValue144, comparisonValue145)));
        float inverseLengthValue22 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue44 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        multiplyAddValue = fma(inverseLengthValue21 * comparisonValue143, intermediateValue21, fma(inverseLengthValue22 * varyingBitangent0.x, intermediateValue20, inverseLengthValue44 * varyingTangent0.x));
        intermediateValue6 = fma(inverseLengthValue21 * comparisonValue144, intermediateValue21, fma(inverseLengthValue22 * varyingBitangent0.y, intermediateValue20, inverseLengthValue44 * varyingTangent0.y));
        intermediateValue7 = fma(inverseLengthValue21 * comparisonValue145, intermediateValue21, fma(inverseLengthValue22 * varyingBitangent0.z, intermediateValue20, inverseLengthValue44 * varyingTangent0.z));
        intermediateValue8 = intermediateValue9;
        intermediateValue10 = sampledTextureValue2;
        intermediateValue11 = sampledTextureValue3;
        intermediateValue12 = sampledTextureValue4;
    }
    float multiplyAddValue217 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue218 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue219 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].z, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].z * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue220 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[5u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[4u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue221 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue220, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue219, fma(fragmentVectorConstants1.packedValues[1u].w, multiplyAddValue218, multiplyAddValue217 * fragmentVectorConstants1.packedValues[0u].w)));
    float multiplyAddValue222 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue220, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue219, fma(fragmentVectorConstants1.packedValues[1u].x, multiplyAddValue218, multiplyAddValue217 * fragmentVectorConstants1.packedValues[0u].x))) / multiplyAddValue221;
    float multiplyAddValue223 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue220, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue219, fma(fragmentVectorConstants1.packedValues[1u].y, multiplyAddValue218, multiplyAddValue217 * fragmentVectorConstants1.packedValues[0u].y))) / multiplyAddValue221;
    float multiplyAddValue224 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue220, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue219, fma(fragmentVectorConstants1.packedValues[1u].z, multiplyAddValue218, multiplyAddValue217 * fragmentVectorConstants1.packedValues[0u].z))) / multiplyAddValue221;
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
    float scalarValue122 = dFdxCoarse(multiplyAddValue217);
    float scalarValue123 = dFdxCoarse(multiplyAddValue218);
    float scalarValue124 = dFdxCoarse(multiplyAddValue219);
    float inverseLengthValue25 = inversesqrt(dot(vec3(scalarValue122, scalarValue123, scalarValue124), vec3(scalarValue122, scalarValue123, scalarValue124)));
    float productValue163 = inverseLengthValue25 * scalarValue122;
    float productValue164 = inverseLengthValue25 * scalarValue123;
    float productValue165 = inverseLengthValue25 * scalarValue124;
    float sumValue140 = (-0.0) - multiplyAddValue219;
    float sumValue141 = dFdyCoarse((-0.0) - multiplyAddValue217);
    float sumValue142 = dFdyCoarse((-0.0) - multiplyAddValue218);
    float scalarValue125 = dFdyCoarse(sumValue140);
    float inverseLengthValue26 = inversesqrt(dot(vec3(sumValue141, sumValue142, scalarValue125), vec3(sumValue141, sumValue142, scalarValue125)));
    float productValue166 = inverseLengthValue26 * sumValue141;
    float productValue167 = inverseLengthValue26 * sumValue142;
    float productValue168 = inverseLengthValue26 * scalarValue125;
    float productValue171 = (productValue168 * productValue164) - (productValue167 * productValue165);
    float productValue174 = (productValue166 * productValue165) - (productValue168 * productValue163);
    float productValue175 = (productValue167 * productValue163) - (productValue166 * productValue164);
    float inverseLengthValue27 = inversesqrt(dot(vec3(productValue171, productValue174, productValue175), vec3(productValue171, productValue174, productValue175)));
    float productValue178 = productValue171 * inverseLengthValue27;
    float productValue183 = productValue174 * inverseLengthValue27;
    float productValue186 = productValue175 * inverseLengthValue27;
    float multiplyAddValue228 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue186, fma(fragmentVectorConstants1.packedValues[9u].x, productValue183, productValue178 * fragmentVectorConstants1.packedValues[8u].x));
    float multiplyAddValue229 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue186, fma(fragmentVectorConstants1.packedValues[9u].y, productValue183, productValue178 * fragmentVectorConstants1.packedValues[8u].y));
    float multiplyAddValue230 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue186, fma(fragmentVectorConstants1.packedValues[9u].z, productValue183, productValue178 * fragmentVectorConstants1.packedValues[8u].z));
    float inverseLengthValue28 = inversesqrt(dot(vec3(multiplyAddValue228, multiplyAddValue229, multiplyAddValue230), vec3(multiplyAddValue228, multiplyAddValue229, multiplyAddValue230)));
    float quotientValue50 = roundEven((inverseLengthValue28 * multiplyAddValue228) / fragmentVectorConstants1.packedValues[136u].x) * fragmentVectorConstants1.packedValues[136u].x;
    float quotientValue51 = roundEven((inverseLengthValue28 * multiplyAddValue229) / fragmentVectorConstants1.packedValues[136u].x) * fragmentVectorConstants1.packedValues[136u].x;
    float quotientValue52 = roundEven((inverseLengthValue28 * multiplyAddValue230) / fragmentVectorConstants1.packedValues[136u].x) * fragmentVectorConstants1.packedValues[136u].x;
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
    float nonlinearValue4 = sqrt(((multiplyAddValue218 * multiplyAddValue218) + (multiplyAddValue217 * multiplyAddValue217)) + (multiplyAddValue219 * multiplyAddValue219));
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
    if (multiplyAddValue224 != 1.0)
    {
        float sumValue144 = nonlinearValue4 + 9.9999997473787516355514526367188e-05;
        float quotientValue26 = multiplyAddValue217 / sumValue144;
        float quotientValue27 = multiplyAddValue218 / sumValue144;
        float quotientValue28 = multiplyAddValue219 / sumValue144;
        float sumValue145 = (-0.0) - quotientValue26;
        float sumValue146 = (-0.0) - quotientValue27;
        float sumValue147 = (-0.0) - quotientValue28;
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
                float sumValue = spvNClamp(2.0 - spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue10), 0.0, 1.0);
                float productValue24;
                float productValue25;
                float productValue26;
                if (sumValue > 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                float sumValue198 = spvNClamp(2.0 - spvNMin(reinterpretedBits16, reinterpretedBits16 - scalarValue187), 0.0, 1.0);
                float productValue24;
                float productValue25;
                float productValue26;
                if (sumValue198 > 0.0)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float multiplyAddValue231 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[129u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[129u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[129u].y, fragmentVectorConstants1.packedValues[129u].x * fragmentVectorConstants1.packedValues[4u].x)));
                float multiplyAddValue232 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[129u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[129u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[129u].y, fragmentVectorConstants1.packedValues[129u].x * fragmentVectorConstants1.packedValues[4u].y)));
                float multiplyAddValue233 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[129u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[129u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[129u].y, fragmentVectorConstants1.packedValues[129u].x * fragmentVectorConstants1.packedValues[4u].z)));
                float inverseLengthValue30 = inversesqrt(dot(vec3(multiplyAddValue231, multiplyAddValue232, multiplyAddValue233), vec3(multiplyAddValue231, multiplyAddValue232, multiplyAddValue233)));
                float dotProductValue1 = spvNMax(dot(vec3(multiplyAddValue225, multiplyAddValue226, multiplyAddValue227), vec3(inverseLengthValue30 * multiplyAddValue231, inverseLengthValue30 * multiplyAddValue232, inverseLengthValue30 * multiplyAddValue233)), 0.0);
                float productValue200 = spvNClamp(1.0 - dotProductValue1, 0.0, 1.0) * fragmentVectorConstants1.packedValues[139u].w;
                float comparisonValue146 = (productValue200 * productValue160) + (conditionValue24 ? productValue191 : varyingTexCoord3.x);
                float comparisonValue147 = (productValue200 * productValue161) + (conditionValue24 ? productValue192 : varyingTexCoord3.y);
                float comparisonValue148 = (productValue200 * productValue162) + (conditionValue24 ? productValue193 : varyingTexCoord3.z);
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
                    float multiplyAddValue10 = fma(varyingTexCoord0.x, scalarValue5, scalarValue7);
                    float multiplyAddValue11 = fma(varyingTexCoord0.y, scalarValue6, scalarValue8);
                    bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture2)) > 0u;
                    uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture2, int(0u)));
                    uint scalarValue11 = sampledTextureValue7.x;
                    float comparisonValue4 = rdEvaluateFloatExpression(sampledTextureValue6 ? scalarValue11 : 0u);
                    float comparisonValue5 = rdEvaluateFloatExpression(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                    float productValue = fract(multiplyAddValue10 * comparisonValue4);
                    float productValue1 = fract(multiplyAddValue11 * comparisonValue5);
                    vec4 sampledTextureValue8 = textureGather(sampler2D(materialTexture2, textureSampler2), vec2((abs(productValue - 0.5) < 0.0625) ? (((productValue > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue10) : multiplyAddValue10, (abs(productValue1 - 0.5) < 0.0625) ? (((productValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue11) : multiplyAddValue11));
                    float scalarValue12 = sampledTextureValue8.x;
                    float scalarValue13 = sampledTextureValue8.y;
                    float scalarValue14 = sampledTextureValue8.z;
                    float scalarValue15 = sampledTextureValue8.w;
                    float multiplyAddValue12 = fract(fma(multiplyAddValue10, comparisonValue4, 0.5));
                    float multiplyAddValue13 = fract(fma(multiplyAddValue11, comparisonValue5, 0.5));
                    bool conditionValue = multiplyAddValue13 > 0.5;
                    bool conditionValue1 = multiplyAddValue12 > 0.5;
                    float sumValue1 = multiplyAddValue12 - 0.083333335816860198974609375;
                    float sumValue2 = multiplyAddValue12 + 0.083333335816860198974609375;
                    float sumValue3 = multiplyAddValue13 - 0.083333335816860198974609375;
                    float sumValue4 = multiplyAddValue13 + 0.083333335816860198974609375;
                    vec2 comparisonValue6 = vec2(conditionValue ? scalarValue12 : scalarValue15, conditionValue ? scalarValue13 : scalarValue14);
                    uint sumValue5 = min(uint(int(spvNClamp(sumValue1 + sumValue1, 0.0, 1.0))), 68u);
                    uint sumValue6 = min(uint(int(spvNClamp(sumValue2 + sumValue2, 0.0, 1.0))), 68u);
                    float reinterpretedBits5 = rdDot2Precise(comparisonValue6, vec2(uintBitsToFloat(intermediateValue21[sumValue5].x), uintBitsToFloat(intermediateValue21[sumValue5].y))) - rdDot2Precise(comparisonValue6, vec2(uintBitsToFloat(intermediateValue21[sumValue6].x), uintBitsToFloat(intermediateValue21[sumValue6].y)));
                    vec2 comparisonValue7 = vec2(conditionValue1 ? scalarValue14 : scalarValue15, conditionValue1 ? scalarValue13 : scalarValue12);
                    uint sumValue7 = min(uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0))), 68u);
                    uint sumValue8 = min(uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0))), 68u);
                    float reinterpretedBits6 = rdDot2Precise(comparisonValue7, vec2(uintBitsToFloat(intermediateValue21[sumValue7].x), uintBitsToFloat(intermediateValue21[sumValue7].y))) - rdDot2Precise(comparisonValue7, vec2(uintBitsToFloat(intermediateValue21[sumValue8].x), uintBitsToFloat(intermediateValue21[sumValue8].y)));
                    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, 0.25);
                    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                    productValue24 = sumValue * (inverseLengthValue * reinterpretedBits6);
                    productValue25 = sumValue * (inverseLengthValue * reinterpretedBits5);
                    productValue26 = inverseLengthValue * 0.25;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    float multiplyAddValue252 = fma(varyingTexCoord0.x, scalarValue182, scalarValue184);
                    float multiplyAddValue253 = fma(varyingTexCoord0.y, scalarValue183, scalarValue185);
                    bool sampledTextureValue6 = uint(textureQueryLevels(materialTexture2)) > 0u;
                    uvec2 sampledTextureValue7 = uvec2(textureSize(materialTexture2, int(0u)));
                    uint scalarValue11 = sampledTextureValue7.x;
                    float comparisonValue4 = rdEvaluateFloatExpression(sampledTextureValue6 ? scalarValue11 : 0u);
                    float comparisonValue5 = rdEvaluateFloatExpression(sampledTextureValue6 ? sampledTextureValue7.y : 0u);
                    float productValue308 = fract(multiplyAddValue252 * comparisonValue4);
                    float productValue309 = fract(multiplyAddValue253 * comparisonValue5);
                    vec4 sampledTextureValue98 = textureGather(sampler2D(materialTexture2, textureSampler2), vec2((abs(productValue308 - 0.5) < 0.0625) ? (((productValue308 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue252) : multiplyAddValue252, (abs(productValue309 - 0.5) < 0.0625) ? (((productValue309 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue253) : multiplyAddValue253));
                    float scalarValue188 = sampledTextureValue98.x;
                    float scalarValue189 = sampledTextureValue98.y;
                    float scalarValue190 = sampledTextureValue98.z;
                    float scalarValue191 = sampledTextureValue98.w;
                    float multiplyAddValue254 = fract(fma(multiplyAddValue252, comparisonValue4, 0.5));
                    float multiplyAddValue255 = fract(fma(multiplyAddValue253, comparisonValue5, 0.5));
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
                    float scalarValue126 = 1.0;
                    float scalarValue127 = 1.0;
                    uint scalarValue36 = 0u;
                    uint scalarValue37 = 0u;
                    uint sumValue34;
                    bool intermediateValue83;
                    for (;;)
                    {
                        sumValue34 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[scalarValue37 + 312u])) + scalarValue36), int(8u)));
                        intermediateValue83 = int(scalarValue36) < int(sumValue34);
                        uint branchMergedValue;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (intermediateValue83)
                        {
                            float intermediateValue99;
                            float intermediateValue100;
                            uint intermediateValue101;
                            float scalarValue128 = scalarValue126;
                            float scalarValue129 = scalarValue127;
                            uint scalarValue130 = scalarValue36;
                            uint bitwiseValue10;
                            float multiplyAddValue38;
                            float multiplyAddValue39;
                            float multiplyAddValue40;
                            bool comparisonValue30;
                            for (;;)
                            {
                                bitwiseValue10 = scalarValue130 << 2u;
                                uint sumValue148 = bitwiseValue10 + 79u;
                                uint sumValue149 = bitwiseValue10 + 80u;
                                uint sumValue150 = bitwiseValue10 + 81u;
                                uint sumValue151 = bitwiseValue10 + 82u;
                                multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[sumValue150].x, comparisonValue148, fma(fragmentVectorConstants1.packedValues[sumValue149].x, comparisonValue147, fragmentVectorConstants1.packedValues[sumValue148].x * comparisonValue146)) + fragmentVectorConstants1.packedValues[sumValue151].x;
                                multiplyAddValue39 = fma(fragmentVectorConstants1.packedValues[sumValue150].y, comparisonValue148, fma(fragmentVectorConstants1.packedValues[sumValue149].y, comparisonValue147, fragmentVectorConstants1.packedValues[sumValue148].y * comparisonValue146)) + fragmentVectorConstants1.packedValues[sumValue151].y;
                                multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[sumValue150].z, comparisonValue148, fma(fragmentVectorConstants1.packedValues[sumValue149].z, comparisonValue147, fragmentVectorConstants1.packedValues[sumValue148].z * comparisonValue146)) + fragmentVectorConstants1.packedValues[sumValue151].z;
                                comparisonValue30 = ((abs(multiplyAddValue38) <= 1.0) && (abs(multiplyAddValue39) <= 1.0)) && (abs(multiplyAddValue40) <= 1.0);
                                float branchMergedValue1;
                                uint branchMergedValue7;
                                float branchMergedValue8;
                                if (comparisonValue30)
                                {
                                    uint sumValue152 = scalarValue130 + 48u;
                                    float sumValue153 = spvNMin(spvNMax(dotProductValue1, fragmentScalarConstants1.packedValues[scalarValue130 + 244u]), 1.0);
                                    float nonlinearValue5 = (sqrt(1.0 - (sumValue153 * sumValue153)) / sumValue153) * fragmentVectorConstants1.packedValues[sumValue152].z;
                                    float productValue201 = (multiplyAddValue38 * 0.5) + 0.5;
                                    float productValue202 = 0.5 - (multiplyAddValue39 * 0.5);
                                    uint sumValue154 = bitwiseValue10 + 18u;
                                    float nonlinearValue6 = sqrt((((fragmentVectorConstants1.packedValues[sumValue154].x * fragmentVectorConstants1.packedValues[sumValue154].x) + (fragmentVectorConstants1.packedValues[sumValue154].y * fragmentVectorConstants1.packedValues[sumValue154].y)) + (fragmentVectorConstants1.packedValues[sumValue154].z * fragmentVectorConstants1.packedValues[sumValue154].z)) + (fragmentVectorConstants1.packedValues[sumValue154].w * fragmentVectorConstants1.packedValues[sumValue154].w)) * fragmentVectorConstants1.packedValues[141u].z;
                                    uint comparisonValue149 = (fragmentVectorConstants1.packedValues[134u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[sumValue152].w + 0.5))), int(1u)))), int(9u)));
                                    uint quotientValue29 = uint(int(comparisonValue149) / int(2u));
                                    float intermediateValue153;
                                    float intermediateValue154;
                                    if (int(comparisonValue149) > int(0u))
                                    {
                                        float sumValue91;
                                        float productValue176;
                                        float intermediateValue182;
                                        float intermediateValue183;
                                        uint intermediateValue184;
                                        float scalarValue131 = 0.0;
                                        float scalarValue132 = 0.0;
                                        uint scalarValue41 = 0u;
                                        for (;;)
                                        {
                                            intermediateValue182 = scalarValue131;
                                            intermediateValue183 = scalarValue132;
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
                                                float productValue203 = (productValue201 + ((float(int(intermediateValue184 - quotientValue29)) + 0.5) * fragmentVectorConstants1.packedValues[139u].x)) * fragmentVectorConstants1.packedValues[sumValue152].x;
                                                float productValue204 = (productValue202 + (fragmentVectorConstants1.packedValues[139u].x * (float(int(scalarValue41 - quotientValue29)) + 0.5))) * fragmentVectorConstants1.packedValues[sumValue152].x;
                                                vec4 sampledTextureValue67 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue203, productValue204, float(int(scalarValue130))));
                                                intermediateValue185 = sampledTextureValue67.x;
                                                intermediateValue186 = sampledTextureValue67.y;
                                                intermediateValue187 = sampledTextureValue67.z;
                                                intermediateValue188 = sampledTextureValue67.w;
                                                productValue184 = fract((productValue203 * fragmentVectorConstants1.packedValues[139u].z) + 0.5);
                                                productValue185 = fract((productValue204 * fragmentVectorConstants1.packedValues[139u].z) + 0.5);
                                                float productValue205 = spvNClamp((multiplyAddValue40 - intermediateValue185) * nonlinearValue6, 0.0, 1.0);
                                                float productValue206 = spvNClamp((multiplyAddValue40 - intermediateValue186) * nonlinearValue6, 0.0, 1.0);
                                                float productValue207 = spvNClamp((multiplyAddValue40 - intermediateValue187) * nonlinearValue6, 0.0, 1.0);
                                                float productValue208 = spvNClamp((multiplyAddValue40 - intermediateValue188) * nonlinearValue6, 0.0, 1.0);
                                                float productValue209 = 1.0 - ((productValue205 * productValue205) * (3.0 - (productValue205 * 2.0)));
                                                float productValue210 = 1.0 - ((productValue208 * productValue208) * (3.0 - (productValue208 * 2.0)));
                                                float productValue211 = (((1.0 - ((productValue207 * productValue207) * (3.0 - (productValue207 * 2.0)))) - productValue210) * productValue184) + productValue210;
                                                productValue176 = (productValue211 + intermediateValue183) + ((((((1.0 - ((productValue206 * productValue206) * (3.0 - (productValue206 * 2.0)))) - productValue209) * productValue184) + productValue209) - productValue211) * productValue185);
                                                comparisonValue56 = fragmentVectorConstants1.packedValues[134u].x != 0.0;
                                                sumValue101 = (multiplyAddValue40 - fragmentVectorConstants1.packedValues[sumValue152].y) - nonlinearValue5;
                                                float branchMergedValue4;
                                                if (comparisonValue56)
                                                {
                                                    branchMergedValue4 = float(intermediateValue188 >= sumValue101);
                                                }
                                                else
                                                {
                                                    float comparisonValue150 = (intermediateValue185 < sumValue101) ? 0.0 : 1.0;
                                                    float comparisonValue151 = (intermediateValue188 < sumValue101) ? 0.0 : 1.0;
                                                    float comparisonValue152 = ((((intermediateValue187 < sumValue101) ? 0.0 : 1.0) - comparisonValue151) * productValue184) + comparisonValue151;
                                                    branchMergedValue4 = (((((((intermediateValue186 < sumValue101) ? 0.0 : 1.0) - comparisonValue150) * productValue184) + comparisonValue150) - comparisonValue152) * productValue185) + comparisonValue152;
                                                }
                                                intermediateValue228 = branchMergedValue4;
                                                sumValue91 = intermediateValue228 + intermediateValue182;
                                                uint sumValue155 = intermediateValue184 + 1u;
                                                if (sumValue155 == comparisonValue149)
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    intermediateValue182 = sumValue91;
                                                    intermediateValue183 = productValue176;
                                                    intermediateValue184 = sumValue155;
                                                    continue;
                                                }
                                            }
                                            uint sumValue156 = scalarValue41 + 1u;
                                            if (sumValue156 == comparisonValue149)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                scalarValue131 = sumValue91;
                                                scalarValue132 = productValue176;
                                                scalarValue41 = sumValue156;
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
                                    float productValue212 = float(int(comparisonValue149 * comparisonValue149));
                                    branchMergedValue1 = spvNMin(scalarValue129, intermediateValue153 / productValue212);
                                    branchMergedValue7 = sumValue34;
                                    branchMergedValue8 = spvNMin(scalarValue128, intermediateValue154 / productValue212);
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue129;
                                    branchMergedValue7 = scalarValue130 + 1u;
                                    branchMergedValue8 = scalarValue128;
                                }
                                intermediateValue100 = branchMergedValue1;
                                intermediateValue101 = branchMergedValue7;
                                intermediateValue99 = branchMergedValue8;
                                if (int(intermediateValue101) < int(sumValue34))
                                {
                                    scalarValue128 = intermediateValue99;
                                    scalarValue129 = intermediateValue100;
                                    scalarValue130 = intermediateValue101;
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
                            branchMergedValue = scalarValue36;
                            branchMergedValue5 = scalarValue127;
                            branchMergedValue6 = scalarValue126;
                        }
                        intermediateValue81 = branchMergedValue;
                        intermediateValue70 = branchMergedValue5;
                        intermediateValue68 = branchMergedValue6;
                        uint sumValue157 = scalarValue37 + 1u;
                        if (sumValue157 == dotProductValue2)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue126 = intermediateValue68;
                            scalarValue127 = intermediateValue70;
                            scalarValue36 = intermediateValue81;
                            scalarValue37 = sumValue157;
                            continue;
                        }
                    }
                    intermediateValue50 = intermediateValue68;
                    intermediateValue69 = intermediateValue70;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    float intermediateValue63;
                    float intermediateValue65;
                    uint intermediateValue76;
                    float scalarValue126 = 1.0;
                    float scalarValue127 = 1.0;
                    uint scalarValue36 = 0u;
                    uint scalarValue37 = 0u;
                    uint sumValue34;
                    bool intermediateValue78;
                    for (;;)
                    {
                        sumValue34 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[scalarValue37 + 308u])) + scalarValue36), int(8u)));
                        intermediateValue78 = int(scalarValue36) < int(sumValue34);
                        uint branchMergedValue;
                        float branchMergedValue5;
                        float branchMergedValue6;
                        if (intermediateValue78)
                        {
                            float intermediateValue94;
                            float intermediateValue95;
                            uint intermediateValue96;
                            float scalarValue128 = scalarValue126;
                            float scalarValue129 = scalarValue127;
                            uint scalarValue130 = scalarValue36;
                            uint bitwiseValue10;
                            float multiplyAddValue38;
                            float multiplyAddValue39;
                            float multiplyAddValue40;
                            bool comparisonValue30;
                            for (;;)
                            {
                                bitwiseValue10 = scalarValue130 << 2u;
                                uint sumValue279 = bitwiseValue10 + 78u;
                                uint sumValue148 = bitwiseValue10 + 79u;
                                uint sumValue149 = bitwiseValue10 + 80u;
                                uint sumValue150 = bitwiseValue10 + 81u;
                                multiplyAddValue38 = fma(fragmentVectorConstants1.packedValues[sumValue149].x, comparisonValue257, fma(fragmentVectorConstants1.packedValues[sumValue148].x, comparisonValue256, fragmentVectorConstants1.packedValues[sumValue279].x * comparisonValue255)) + fragmentVectorConstants1.packedValues[sumValue150].x;
                                multiplyAddValue39 = fma(fragmentVectorConstants1.packedValues[sumValue149].y, comparisonValue257, fma(fragmentVectorConstants1.packedValues[sumValue148].y, comparisonValue256, fragmentVectorConstants1.packedValues[sumValue279].y * comparisonValue255)) + fragmentVectorConstants1.packedValues[sumValue150].y;
                                multiplyAddValue40 = fma(fragmentVectorConstants1.packedValues[sumValue149].z, comparisonValue257, fma(fragmentVectorConstants1.packedValues[sumValue148].z, comparisonValue256, fragmentVectorConstants1.packedValues[sumValue279].z * comparisonValue255)) + fragmentVectorConstants1.packedValues[sumValue150].z;
                                comparisonValue30 = ((abs(multiplyAddValue38) <= 1.0) && (abs(multiplyAddValue39) <= 1.0)) && (abs(multiplyAddValue40) <= 1.0);
                                uint branchMergedValue1;
                                float branchMergedValue7;
                                float branchMergedValue8;
                                if (comparisonValue30)
                                {
                                    uint sumValue152 = scalarValue130 + 48u;
                                    float sumValue280 = spvNMin(spvNMax(dotProductValue19, fragmentScalarConstants1.packedValues[scalarValue130 + 244u]), 1.0);
                                    float nonlinearValue12 = (sqrt(1.0 - (sumValue280 * sumValue280)) / sumValue280) * fragmentVectorConstants1.packedValues[sumValue152].z;
                                    float productValue201 = (multiplyAddValue38 * 0.5) + 0.5;
                                    float productValue202 = 0.5 - (multiplyAddValue39 * 0.5);
                                    uint sumValue154 = bitwiseValue10 + 18u;
                                    float nonlinearValue13 = sqrt((((fragmentVectorConstants1.packedValues[sumValue154].x * fragmentVectorConstants1.packedValues[sumValue154].x) + (fragmentVectorConstants1.packedValues[sumValue154].y * fragmentVectorConstants1.packedValues[sumValue154].y)) + (fragmentVectorConstants1.packedValues[sumValue154].z * fragmentVectorConstants1.packedValues[sumValue154].z)) + (fragmentVectorConstants1.packedValues[sumValue154].w * fragmentVectorConstants1.packedValues[sumValue154].w)) * fragmentVectorConstants1.packedValues[140u].z;
                                    uint comparisonValue258 = (fragmentVectorConstants1.packedValues[133u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[sumValue152].w + 0.5))), int(1u)))), int(9u)));
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
                                        float scalarValue131 = 0.0;
                                        float scalarValue132 = 0.0;
                                        uint scalarValue41 = 0u;
                                        for (;;)
                                        {
                                            intermediateValue177 = scalarValue131;
                                            intermediateValue178 = scalarValue132;
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
                                                float productValue386 = (productValue201 + ((float(int(intermediateValue179 - quotientValue57)) + 0.5) * fragmentVectorConstants1.packedValues[138u].x)) * fragmentVectorConstants1.packedValues[sumValue152].x;
                                                float productValue387 = (productValue202 + (fragmentVectorConstants1.packedValues[138u].x * (float(int(scalarValue41 - quotientValue57)) + 0.5))) * fragmentVectorConstants1.packedValues[sumValue152].x;
                                                vec4 sampledTextureValue114 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue386, productValue387, float(int(scalarValue130))));
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
                                                sumValue101 = (multiplyAddValue40 - fragmentVectorConstants1.packedValues[sumValue152].y) - nonlinearValue12;
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
                                            uint sumValue156 = scalarValue41 + 1u;
                                            if (sumValue156 == comparisonValue258)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                scalarValue131 = sumValue91;
                                                scalarValue132 = productValue173;
                                                scalarValue41 = sumValue156;
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
                                    branchMergedValue7 = spvNMin(scalarValue129, intermediateValue148 / productValue395);
                                    branchMergedValue8 = spvNMin(scalarValue128, intermediateValue149 / productValue395);
                                }
                                else
                                {
                                    branchMergedValue1 = scalarValue130 + 1u;
                                    branchMergedValue7 = scalarValue129;
                                    branchMergedValue8 = scalarValue128;
                                }
                                intermediateValue96 = branchMergedValue1;
                                intermediateValue95 = branchMergedValue7;
                                intermediateValue94 = branchMergedValue8;
                                if (int(intermediateValue96) < int(sumValue34))
                                {
                                    scalarValue128 = intermediateValue94;
                                    scalarValue129 = intermediateValue95;
                                    scalarValue130 = intermediateValue96;
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
                            branchMergedValue = scalarValue36;
                            branchMergedValue5 = scalarValue127;
                            branchMergedValue6 = scalarValue126;
                        }
                        intermediateValue76 = branchMergedValue;
                        intermediateValue65 = branchMergedValue5;
                        intermediateValue63 = branchMergedValue6;
                        uint sumValue157 = scalarValue37 + 1u;
                        if (sumValue157 == dotProductValue20)
                        {
                            break;
                        }
                        else
                        {
                            scalarValue126 = intermediateValue63;
                            scalarValue127 = intermediateValue65;
                            scalarValue36 = intermediateValue76;
                            scalarValue37 = sumValue157;
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
                    float scalarValue133 = spvNMin(spvNMax(dotProductValue1, fragmentVectorConstants1.packedValues[61u].x), 1.0);
                    float multiplyAddValue234 = spvNMin(((fragmentVectorConstants1.packedValues[128u].z - fragmentVectorConstants1.packedValues[48u].y) + fma(fragmentVectorConstants1.packedValues[127u].z, comparisonValue148, fma(fragmentVectorConstants1.packedValues[126u].z, comparisonValue147, fragmentVectorConstants1.packedValues[125u].z * comparisonValue146))) - ((sqrt(1.0 - (scalarValue133 * scalarValue133)) / scalarValue133) * fragmentVectorConstants1.packedValues[48u].z), 1.0);
                    float multiplyAddValue235 = (((fma(fragmentVectorConstants1.packedValues[127u].x, comparisonValue148, fma(fragmentVectorConstants1.packedValues[126u].x, comparisonValue147, fragmentVectorConstants1.packedValues[125u].x * comparisonValue146)) + fragmentVectorConstants1.packedValues[128u].x) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[56u].y;
                    float multiplyAddValue236 = (0.5 - ((fma(fragmentVectorConstants1.packedValues[127u].y, comparisonValue148, fma(fragmentVectorConstants1.packedValues[126u].y, comparisonValue147, fragmentVectorConstants1.packedValues[125u].y * comparisonValue146)) + fragmentVectorConstants1.packedValues[128u].y) * 0.5)) * fragmentVectorConstants1.packedValues[56u].y;
                    uint comparisonValue153 = (fragmentVectorConstants1.packedValues[134u].x != 0.0) ? 1u : 2u;
                    uint bitwiseValue44 = comparisonValue153 >> 1u;
                    float branchMergedValue12;
                    if ((multiplyAddValue236 < fragmentVectorConstants1.packedValues[56u].y) && (((multiplyAddValue235 >= 0.0) && (multiplyAddValue235 < fragmentVectorConstants1.packedValues[56u].y)) && (multiplyAddValue236 >= 0.0)))
                    {
                        float dotProductValue3 = dot(vec4(fragmentVectorConstants1.packedValues[78u]), vec4(1.0)) + 1.0;
                        float sumValue69;
                        float intermediateValue136;
                        uint intermediateValue137;
                        float scalarValue134 = 0.0;
                        uint scalarValue42 = 0u;
                        for (;;)
                        {
                            intermediateValue136 = scalarValue134;
                            intermediateValue137 = 0u;
                            float intermediateValue175;
                            float productValue172;
                            float productValue173;
                            bool comparisonValue42;
                            for (;;)
                            {
                                float productValue213 = fragmentVectorConstants1.packedValues[56u].y * fragmentVectorConstants1.packedValues[56u].z;
                                productValue172 = (productValue213 * (float(int(intermediateValue137 - bitwiseValue44)) + 0.5)) + multiplyAddValue235;
                                productValue173 = (productValue213 * (float(int(scalarValue42 - bitwiseValue44)) + 0.5)) + multiplyAddValue236;
                                comparisonValue42 = fragmentVectorConstants1.packedValues[134u].x != 0.0;
                                float branchMergedValue2;
                                if (comparisonValue42)
                                {
                                    branchMergedValue2 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue172, productValue173, dotProductValue3), 0.0).x >= multiplyAddValue234);
                                }
                                else
                                {
                                    vec4 sampledTextureValue68 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue172, productValue173, dotProductValue3));
                                    float productValue214 = fract((fragmentVectorConstants1.packedValues[139u].z * productValue172) + 0.5);
                                    float comparisonValue154 = (sampledTextureValue68.x < multiplyAddValue234) ? 0.0 : 1.0;
                                    float comparisonValue155 = (sampledTextureValue68.w < multiplyAddValue234) ? 0.0 : 1.0;
                                    float comparisonValue156 = ((((sampledTextureValue68.z < multiplyAddValue234) ? 0.0 : 1.0) - comparisonValue155) * productValue214) + comparisonValue155;
                                    branchMergedValue2 = (((((((sampledTextureValue68.y < multiplyAddValue234) ? 0.0 : 1.0) - comparisonValue154) * productValue214) + comparisonValue154) - comparisonValue156) * fract((fragmentVectorConstants1.packedValues[139u].z * productValue173) + 0.5)) + comparisonValue156;
                                }
                                intermediateValue175 = branchMergedValue2;
                                sumValue69 = intermediateValue175 + intermediateValue136;
                                uint sumValue158 = intermediateValue137 + 1u;
                                if (int(sumValue158) < int(comparisonValue153))
                                {
                                    intermediateValue136 = sumValue69;
                                    intermediateValue137 = sumValue158;
                                    continue;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            uint sumValue159 = scalarValue42 + 1u;
                            if (int(sumValue159) < int(comparisonValue153))
                            {
                                scalarValue134 = sumValue69;
                                scalarValue42 = sumValue159;
                                continue;
                            }
                            else
                            {
                                break;
                            }
                        }
                        branchMergedValue12 = sumValue69 / float(int(comparisonValue153 * comparisonValue153));
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
                    float multiplyAddValue237 = fma(fragmentVectorConstants1.packedValues[118u].w, comparisonValue148, fma(fragmentVectorConstants1.packedValues[117u].w, comparisonValue147, fragmentVectorConstants1.packedValues[116u].w * comparisonValue146)) + fragmentVectorConstants1.packedValues[119u].w;
                    float scalarValue135 = spvNMin(spvNMax(dotProductValue1, fragmentVectorConstants1.packedValues[61u].x), 1.0);
                    float multiplyAddValue238 = (((fma(fragmentVectorConstants1.packedValues[118u].z, comparisonValue148, fma(fragmentVectorConstants1.packedValues[117u].z, comparisonValue147, fragmentVectorConstants1.packedValues[116u].z * comparisonValue146)) + fragmentVectorConstants1.packedValues[119u].z) / multiplyAddValue237) - fragmentVectorConstants1.packedValues[48u].y) - ((sqrt(1.0 - (scalarValue135 * scalarValue135)) / scalarValue135) * fragmentVectorConstants1.packedValues[48u].z);
                    float multiplyAddValue239 = (((fma(fragmentVectorConstants1.packedValues[118u].x, comparisonValue148, fma(fragmentVectorConstants1.packedValues[117u].x, comparisonValue147, fragmentVectorConstants1.packedValues[116u].x * comparisonValue146)) + fragmentVectorConstants1.packedValues[119u].x) / multiplyAddValue237) * 0.5) + 0.5;
                    float multiplyAddValue240 = 0.5 - (((fma(fragmentVectorConstants1.packedValues[118u].y, comparisonValue148, fma(fragmentVectorConstants1.packedValues[117u].y, comparisonValue147, fragmentVectorConstants1.packedValues[116u].y * comparisonValue146)) + fragmentVectorConstants1.packedValues[119u].y) / multiplyAddValue237) * 0.5);
                    uint comparisonValue157 = (fragmentVectorConstants1.packedValues[134u].x != 0.0) ? 1u : uint(min(int(uint(max(int(uint(int(fragmentVectorConstants1.packedValues[63u].z + 0.5))), int(1u)))), int(9u)));
                    uint quotientValue30 = uint(int(comparisonValue157) / int(2u));
                    float dotProductValue4 = dot(vec4(fragmentVectorConstants1.packedValues[78u]), vec4(1.0));
                    float intermediateValue131;
                    if (int(comparisonValue157) > int(0u))
                    {
                        float sumValue71;
                        float intermediateValue155;
                        uint intermediateValue156;
                        float scalarValue136 = 0.0;
                        uint scalarValue48 = 0u;
                        for (;;)
                        {
                            intermediateValue155 = scalarValue136;
                            intermediateValue156 = 0u;
                            float intermediateValue189;
                            vec4 intermediateValue157;
                            float productValue179;
                            float productValue180;
                            bool comparisonValue46;
                            for (;;)
                            {
                                intermediateValue157 = fragmentVectorConstants1.packedValues[139u];
                                productValue179 = (multiplyAddValue239 + ((float(int(intermediateValue156 - quotientValue30)) + 0.5) * intermediateValue157.x)) * fragmentVectorConstants1.packedValues[48u].x;
                                productValue180 = (multiplyAddValue240 + (intermediateValue157.x * (float(int(scalarValue48 - quotientValue30)) + 0.5))) * fragmentVectorConstants1.packedValues[48u].x;
                                comparisonValue46 = fragmentVectorConstants1.packedValues[134u].x != 0.0;
                                float branchMergedValue3;
                                if (comparisonValue46)
                                {
                                    branchMergedValue3 = float(textureLod(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue179, productValue180, dotProductValue4), 0.0).x >= multiplyAddValue238);
                                }
                                else
                                {
                                    vec4 sampledTextureValue69 = textureGather(sampler2DArray(shadowCascadesTexture, shadowCascadesSampler), vec3(productValue179, productValue180, dotProductValue4));
                                    float productValue215 = fract((productValue179 * intermediateValue157.z) + 0.5);
                                    float comparisonValue158 = (sampledTextureValue69.x < multiplyAddValue238) ? 0.0 : 1.0;
                                    float comparisonValue159 = (sampledTextureValue69.w < multiplyAddValue238) ? 0.0 : 1.0;
                                    float comparisonValue160 = ((((sampledTextureValue69.z < multiplyAddValue238) ? 0.0 : 1.0) - comparisonValue159) * productValue215) + comparisonValue159;
                                    branchMergedValue3 = (((((((sampledTextureValue69.y < multiplyAddValue238) ? 0.0 : 1.0) - comparisonValue158) * productValue215) + comparisonValue158) - comparisonValue160) * fract((productValue180 * intermediateValue157.z) + 0.5)) + comparisonValue160;
                                }
                                intermediateValue189 = branchMergedValue3;
                                sumValue71 = intermediateValue189 + intermediateValue155;
                                uint sumValue160 = intermediateValue156 + 1u;
                                if (sumValue160 == comparisonValue157)
                                {
                                    break;
                                }
                                else
                                {
                                    intermediateValue155 = sumValue71;
                                    intermediateValue156 = sumValue160;
                                    continue;
                                }
                            }
                            uint sumValue161 = scalarValue48 + 1u;
                            if (sumValue161 == comparisonValue157)
                            {
                                break;
                            }
                            else
                            {
                                scalarValue136 = sumValue71;
                                scalarValue48 = sumValue161;
                                continue;
                            }
                        }
                        intermediateValue131 = sumValue71;
                    }
                    else
                    {
                        intermediateValue131 = 0.0;
                    }
                    float quotientValue31 = intermediateValue131 / float(int(comparisonValue157 * comparisonValue157));
                    float branchMergedValue14;
                    if (quotientValue31 < 1.0)
                    {
                        branchMergedValue14 = spvNMin(1.0, spvNMax(quotientValue31, 1.0 - fragmentVectorConstants1.packedValues[63u].w));
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
                float scalarValue137 = spvNMin(intermediateValue69, spvNMin(intermediateValue85, intermediateValue103));
                float productValue216 = spvNMax(0.0, fragmentVectorConstants1.packedValues[139u].y - spvNMin(fragmentVectorConstants1.packedValues[139u].y * 0.100000001490116119384765625, 8.0));
                float quotientValue32 = spvNClamp((sumValue140 - productValue216) / (fragmentVectorConstants1.packedValues[139u].y - productValue216), 0.0, 1.0);
                productValue68 = (((quotientValue32 * quotientValue32) * (1.0 - scalarValue137)) * (3.0 - (quotientValue32 * 2.0))) + scalarValue137;
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
                        float scalarValue134 = 0.0;
                        uint scalarValue42 = 0u;
                        for (;;)
                        {
                            intermediateValue131 = scalarValue134;
                            intermediateValue132 = 0u;
                            float intermediateValue170;
                            float productValue169;
                            float productValue170;
                            bool comparisonValue42;
                            for (;;)
                            {
                                float productValue213 = fragmentVectorConstants1.packedValues[56u].y * fragmentVectorConstants1.packedValues[56u].z;
                                productValue169 = (productValue213 * (float(int(intermediateValue132 - bitwiseValue107)) + 0.5)) + multiplyAddValue402;
                                productValue170 = (productValue213 * (float(int(scalarValue42 - bitwiseValue107)) + 0.5)) + multiplyAddValue403;
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
                            uint sumValue159 = scalarValue42 + 1u;
                            if (int(sumValue159) < int(comparisonValue262))
                            {
                                scalarValue134 = sumValue69;
                                scalarValue42 = sumValue159;
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
                        float scalarValue136 = 0.0;
                        uint scalarValue48 = 0u;
                        for (;;)
                        {
                            intermediateValue150 = scalarValue136;
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
                                productValue177 = (multiplyAddValue407 + (intermediateValue152.x * (float(int(scalarValue48 - quotientValue58)) + 0.5))) * fragmentVectorConstants1.packedValues[48u].x;
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
                            uint sumValue161 = scalarValue48 + 1u;
                            if (sumValue161 == comparisonValue266)
                            {
                                break;
                            }
                            else
                            {
                                scalarValue136 = sumValue71;
                                scalarValue48 = sumValue161;
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
                float quotientValue60 = spvNClamp((sumValue140 - productValue398) / (fragmentVectorConstants1.packedValues[138u].y - productValue398), 0.0, 1.0);
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
            float multiplyAddValue241 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].x)));
            float multiplyAddValue242 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].y)));
            float multiplyAddValue243 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].z)));
            float inverseLengthValue31 = inversesqrt(dot(vec3(multiplyAddValue241, multiplyAddValue242, multiplyAddValue243), vec3(multiplyAddValue241, multiplyAddValue242, multiplyAddValue243)));
            float productValue217 = inverseLengthValue31 * multiplyAddValue241;
            float productValue218 = inverseLengthValue31 * multiplyAddValue242;
            float productValue219 = inverseLengthValue31 * multiplyAddValue243;
            float productValue220 = fragmentVectorConstants1.packedValues[64u].x * (fragmentVectorConstants1.packedValues[121u].w * sampledTextureValue13);
            float productValue221 = productValue220 * fragmentVectorConstants1.packedValues[121u].x;
            float productValue222 = productValue220 * fragmentVectorConstants1.packedValues[121u].y;
            float productValue223 = productValue220 * fragmentVectorConstants1.packedValues[121u].z;
            float dotProductValue5 = dot(vec3(multiplyAddValue225, multiplyAddValue226, multiplyAddValue227), vec3(productValue217, productValue218, productValue219));
            float scalarValue138 = spvNMax(dotProductValue5, 0.0);
            float dotProductValue6 = spvNMax(dot(vec3(multiplyAddValue225, multiplyAddValue226, multiplyAddValue227), vec3(sumValue145, sumValue146, sumValue147)), 0.0);
            float sumValue162 = fragmentVectorConstants1.packedValues[141u].y + 1.0;
            float productValue224 = sumValue162 * sumValue162;
            float sumValue163 = productValue217 - quotientValue26;
            float sumValue164 = productValue218 - quotientValue27;
            float sumValue165 = productValue219 - quotientValue28;
            float inverseLengthValue32 = inversesqrt(dot(vec3(sumValue163, sumValue164, sumValue165), vec3(sumValue163, sumValue164, sumValue165)));
            float productValue225 = inverseLengthValue32 * sumValue163;
            float productValue226 = inverseLengthValue32 * sumValue164;
            float productValue227 = inverseLengthValue32 * sumValue165;
            float scalarValue139 = spvNMax(intermediateValue16, 0.0500000007450580596923828125);
            float productValue228 = scalarValue139 * scalarValue139;
            float productValue229 = productValue228 * productValue228;
            float dotProductValue7 = spvNMax(dot(vec3(multiplyAddValue225, multiplyAddValue226, multiplyAddValue227), vec3(productValue225, productValue226, productValue227)), 0.0);
            float productValue230 = ((dotProductValue7 * dotProductValue7) * (productValue229 + (-1.0))) + 1.0;
            float productValue231 = productValue228 * 0.5;
            float sumValue166 = 1.0 - productValue231;
            float sumValue167 = productValue231 + 9.9999997473787516355514526367188e-05;
            float dotProductValue8 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue145, sumValue146, sumValue147), vec3(productValue225, productValue226, productValue227)), 0.0), 0.0, 1.0);
            float productValue232 = dotProductValue8 * dotProductValue8;
            float productValue233 = (productValue232 * productValue232) * dotProductValue8;
            float productValue234 = (productValue233 * (1.0 - productValue196)) + productValue196;
            float productValue235 = (productValue233 * (1.0 - productValue197)) + productValue197;
            float productValue236 = (productValue233 * (1.0 - productValue198)) + productValue198;
            float quotientValue33 = ((dotProductValue6 / ((sumValue166 * dotProductValue6) + sumValue167)) * (productValue229 / ((productValue230 * productValue230) * 3.1415927410125732421875))) * (scalarValue138 / ((sumValue166 * scalarValue138) + sumValue167));
            float productValue237 = ((scalarValue138 * 4.0) * dotProductValue6) + 9.9999997473787516355514526367188e-05;
            float quotientValue34 = (((spvNMax((dotProductValue5 + fragmentVectorConstants1.packedValues[141u].y) / productValue224, 0.0) - scalarValue138) * productValue199) + scalarValue138) * productValue68;
            float dotProductValue9 = (intermediateValue49 * productValue199) * spvNMax((dot(vec3((-0.0) - multiplyAddValue225, (-0.0) - multiplyAddValue226, (-0.0) - multiplyAddValue227), vec3(productValue217, productValue218, productValue219)) + fragmentVectorConstants1.packedValues[141u].y) / productValue224, 0.0);
            float productValue238 = sumValue143 * 0.3183098733425140380859375;
            float productValue239 = fragmentVectorConstants1.packedValues[123u].y * (scalarValue138 * productValue68);
            intermediateValue29 = (productValue239 * productValue221) * ((productValue234 * quotientValue33) / productValue237);
            intermediateValue31 = (productValue239 * productValue222) * ((productValue235 * quotientValue33) / productValue237);
            intermediateValue33 = (productValue239 * productValue223) * ((productValue236 * quotientValue33) / productValue237);
            intermediateValue35 = (((productValue238 * exponentialValue) * productValue221) * fragmentVectorConstants1.packedValues[123u].x) * (((1.0 - productValue234) * quotientValue34) + dotProductValue9);
            intermediateValue37 = (((productValue238 * exponentialValue1) * productValue222) * fragmentVectorConstants1.packedValues[123u].x) * (((1.0 - productValue235) * quotientValue34) + dotProductValue9);
            intermediateValue39 = (((productValue238 * exponentialValue2) * productValue223) * fragmentVectorConstants1.packedValues[123u].x) * (((1.0 - productValue236) * quotientValue34) + dotProductValue9);
        }
        float intermediateValue46;
        float intermediateValue47;
        float intermediateValue48;
        if (fragmentVectorConstants1.packedValues[64u].w != 0.0)
        {
            float productValue240 = ((varyingTexCoord3.x + (-0.5)) + (productValue160 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[115u].x;
            float productValue241 = ((varyingTexCoord3.y + (-0.5)) + (productValue161 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[115u].y;
            float productValue242 = ((varyingTexCoord3.z + (-0.5)) + (productValue162 * 0.20000000298023223876953125)) - fragmentVectorConstants1.packedValues[115u].z;
            float productValue243 = floor(productValue240 * 0.0625) * 16.0;
            float productValue244 = floor(productValue241 * 0.0625) * 16.0;
            float productValue245 = floor(productValue242 * 0.0625) * 16.0;
            uint productValue246 = uint(int(floor(float(int(uint(int(floor(productValue240))))) * 0.0625)));
            uint productValue247 = uint(int(floor(float(int(uint(int(floor(productValue241))))) * 0.0625)));
            uint productValue248 = uint(int(floor(float(int(uint(int(floor(productValue242))))) * 0.0625)));
            float sumValue168 = productValue240 - productValue243;
            float sumValue169 = productValue241 - productValue244;
            float sumValue170 = productValue242 - productValue245;
            uint bitwiseValue45 = (productValue247 << 16u) | (productValue246 & 65535u);
            uint bitwiseValue46 = productValue248 & 65535u;
            uint productValue249 = productValue246 * 1540483477u;
            uint productValue250 = productValue247 * 1540483477u;
            uint productValue251 = productValue248 * 1540483477u;
            uint bitwiseValue47 = ((((((((productValue249 >> 24u) ^ productValue249) * 1540483477u) ^ 2293326976u) * 1540483477u) ^ (((productValue250 >> 24u) ^ productValue250) * 1540483477u)) * 1540483477u) ^ (((productValue251 >> 24u) ^ productValue251) * 1540483477u)) * 1540483477u;
            uint bitwiseValue48 = ((bitwiseValue47 >> 13u) ^ bitwiseValue47) * 1540483477u;
            uint bitwiseValue49 = (bitwiseValue48 >> 15u) ^ bitwiseValue48;
            uint bitwiseValue50 = bitwiseValue49 >> 16u;
            uint bitwiseValue51 = bitwiseValue49 & 65535u;
            uint comparisonValue161 = uint(bitwiseValue51 == bitwiseValue50) | (bitwiseValue51 ^ bitwiseValue50);
            uint sumValue171 = uint(fragmentVectorConstants1.packedValues[59u].x) + 4294967295u;
            bool intermediateValue77;
            uint scalarValue140 = comparisonValue161;
            uint scalarValue49 = 0u;
            uint scalarValue52 = 0u;
            uint sampledTextureValue20;
            uint bitwiseValue7;
            for (;;)
            {
                bitwiseValue7 = scalarValue140 & sumValue171;
                uint sampledTextureValue70 = texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 2u)).x & 65535u;
                bool sampledTextureValue71 = (texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 1u)).x == bitwiseValue46) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue7 * 4u)).x == bitwiseValue45) && (sampledTextureValue70 == comparisonValue161));
                sampledTextureValue20 = sampledTextureValue71 ? texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 3u)).x : scalarValue49;
                if ((sampledTextureValue70 == 0u) || sampledTextureValue71)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                productValue65 = 1.0;
                intermediateValue44 = 1.0;
            }
            float multiplyAddValue241 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].x, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].x)));
            float multiplyAddValue242 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].y, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].y)));
            float multiplyAddValue243 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentVectorConstants1.packedValues[57u].w, fma(fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[57u].z, fma(fragmentVectorConstants1.packedValues[5u].z, fragmentVectorConstants1.packedValues[57u].y, fragmentVectorConstants1.packedValues[57u].x * fragmentVectorConstants1.packedValues[4u].z)));
            float inverseLengthValue31 = inversesqrt(dot(vec3(multiplyAddValue241, multiplyAddValue242, multiplyAddValue243), vec3(multiplyAddValue241, multiplyAddValue242, multiplyAddValue243)));
            float productValue217 = inverseLengthValue31 * multiplyAddValue241;
            float productValue218 = inverseLengthValue31 * multiplyAddValue242;
            float productValue219 = inverseLengthValue31 * multiplyAddValue243;
            float productValue399 = fragmentVectorConstants1.packedValues[64u].x * (fragmentVectorConstants1.packedValues[120u].w * sampledTextureValue14);
            float productValue400 = productValue399 * fragmentVectorConstants1.packedValues[120u].x;
            float productValue401 = productValue399 * fragmentVectorConstants1.packedValues[120u].y;
            float productValue402 = productValue399 * fragmentVectorConstants1.packedValues[120u].z;
            float dotProductValue23 = dot(vec3(multiplyAddValue395, multiplyAddValue396, multiplyAddValue397), vec3(productValue217, productValue218, productValue219));
            float scalarValue261 = spvNMax(dotProductValue23, 0.0);
            float dotProductValue24 = spvNMax(dot(vec3(multiplyAddValue395, multiplyAddValue396, multiplyAddValue397), vec3(sumValue145, sumValue146, sumValue147)), 0.0);
            float sumValue284 = fragmentVectorConstants1.packedValues[140u].y + 1.0;
            float productValue403 = sumValue284 * sumValue284;
            float sumValue163 = productValue217 - quotientValue26;
            float sumValue164 = productValue218 - quotientValue27;
            float sumValue165 = productValue219 - quotientValue28;
            float inverseLengthValue32 = inversesqrt(dot(vec3(sumValue163, sumValue164, sumValue165), vec3(sumValue163, sumValue164, sumValue165)));
            float productValue225 = inverseLengthValue32 * sumValue163;
            float productValue226 = inverseLengthValue32 * sumValue164;
            float productValue227 = inverseLengthValue32 * sumValue165;
            float scalarValue262 = spvNMax(intermediateValue11, 0.0500000007450580596923828125);
            float productValue404 = scalarValue262 * scalarValue262;
            float productValue405 = productValue404 * productValue404;
            float dotProductValue25 = spvNMax(dot(vec3(multiplyAddValue395, multiplyAddValue396, multiplyAddValue397), vec3(productValue225, productValue226, productValue227)), 0.0);
            float productValue406 = ((dotProductValue25 * dotProductValue25) * (productValue405 + (-1.0))) + 1.0;
            float productValue407 = productValue404 * 0.5;
            float sumValue285 = 1.0 - productValue407;
            float sumValue286 = productValue407 + 9.9999997473787516355514526367188e-05;
            float dotProductValue8 = spvNClamp(1.0 - spvNMax(dot(vec3(sumValue145, sumValue146, sumValue147), vec3(productValue225, productValue226, productValue227)), 0.0), 0.0, 1.0);
            float productValue232 = dotProductValue8 * dotProductValue8;
            float productValue233 = (productValue232 * productValue232) * dotProductValue8;
            float productValue408 = (productValue233 * (1.0 - productValue381)) + productValue381;
            float productValue409 = (productValue233 * (1.0 - productValue382)) + productValue382;
            float productValue410 = (productValue233 * (1.0 - productValue383)) + productValue383;
            float quotientValue61 = ((dotProductValue24 / ((sumValue285 * dotProductValue24) + sumValue286)) * (productValue405 / ((productValue406 * productValue406) * 3.1415927410125732421875))) * (scalarValue261 / ((sumValue285 * scalarValue261) + sumValue286));
            float productValue411 = ((scalarValue261 * 4.0) * dotProductValue24) + 9.9999997473787516355514526367188e-05;
            float quotientValue62 = (((spvNMax((dotProductValue23 + fragmentVectorConstants1.packedValues[140u].y) / productValue403, 0.0) - scalarValue261) * productValue384) + scalarValue261) * productValue65;
            float dotProductValue26 = (intermediateValue44 * productValue384) * spvNMax((dot(vec3((-0.0) - multiplyAddValue395, (-0.0) - multiplyAddValue396, (-0.0) - multiplyAddValue397), vec3(productValue217, productValue218, productValue219)) + fragmentVectorConstants1.packedValues[140u].y) / productValue403, 0.0);
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
            uint sumValue171 = uint(fragmentVectorConstants1.packedValues[59u].x) + 4294967295u;
            bool intermediateValue72;
            uint scalarValue263 = comparisonValue270;
            uint scalarValue49 = 0u;
            uint scalarValue52 = 0u;
            uint sampledTextureValue21;
            uint bitwiseValue7;
            for (;;)
            {
                bitwiseValue7 = scalarValue263 & sumValue171;
                uint sampledTextureValue70 = texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 2u)).x & 65535u;
                bool sampledTextureValue117 = (texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 1u)).x == bitwiseValue109) && ((texelFetch(gpuEntryBuffer, int(bitwiseValue7 * 4u)).x == bitwiseValue108) && (sampledTextureValue70 == comparisonValue270));
                sampledTextureValue21 = sampledTextureValue117 ? texelFetch(gpuEntryBuffer, int((bitwiseValue7 * 4u) + 3u)).x : scalarValue49;
                if ((sampledTextureValue70 == 0u) || sampledTextureValue117)
#endif
                {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    float multiplyAddValue14 = fma(varyingTexCoord0.x, scalarValue5, scalarValue7);
                    float multiplyAddValue15 = fma(varyingTexCoord0.y, scalarValue6, scalarValue8);
                    float sumValue9 = spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue10);
                    vec4 sampledTextureValue9 = textureLod(sampler2D(materialTexture2, textureSampler2), vec2(multiplyAddValue14, multiplyAddValue15), 0.0);
                    float scalarValue16 = sampledTextureValue9.x;
                    float scalarValue17 = sampledTextureValue9.y;
                    float scalarValue18 = sampledTextureValue9.z;
                    float intermediateValue89;
                    float intermediateValue91;
                    float intermediateValue93;
                    if ((scalarValue17 == scalarValue16) && (scalarValue18 == scalarValue17))
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
                    intermediateValue77 = sampledTextureValue71;
                    break;
                }
                else
                {
                    uint sumValue172 = scalarValue52 + 1u;
                    if (int(sumValue172) < int(8u))
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                    intermediateValue72 = sampledTextureValue117;
                    break;
                }
                else
                {
                    uint sumValue172 = scalarValue52 + 1u;
                    if (int(sumValue172) < int(8u))
#endif
                    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                        float scalarValue19 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        float productValue54;
                        float productValue55;
                        float productValue56;
                        if (scalarValue19 > 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                        float scalarValue195 = spvNClamp(2.0 - sumValue207, 0.0, 1.0);
                        float productValue54;
                        float productValue55;
                        float productValue56;
                        if (scalarValue195 > 0.0)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                        scalarValue140 = bitwiseValue7 + 1u;
                        scalarValue49 = sampledTextureValue20;
                        scalarValue52 = sumValue172;
                        continue;
                    }
                    else
                    {
                        intermediateValue77 = false;
                        break;
                    }
                }
            }
            uint bitwiseValue52 = sampledTextureValue20 >> 2u;
            float branchMergedValue10;
            float branchMergedValue19;
            float branchMergedValue20;
            if (intermediateValue77)
            {
                float scalarValue141 = abs(productValue160);
                float scalarValue142 = abs(productValue161);
                float scalarValue143 = abs(productValue162);
                float branchMergedValue50;
                float branchMergedValue56;
                float branchMergedValue57;
                if (((scalarValue141 >= 1.0) || (scalarValue142 >= 1.0)) || (scalarValue143 >= 1.0))
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
                        float dotProductValue10 = dot(vec3(sumValue168, sumValue169, sumValue170), vec3(scalarValue141, scalarValue142, scalarValue143));
                        float dotProductValue11 = dot(vec3(sumValue168, sumValue169, sumValue170), vec3(scalarValue143, scalarValue141, scalarValue142));
                        float dotProductValue12 = dot(vec3(sumValue168, sumValue169, sumValue170), vec3(scalarValue142, scalarValue143, scalarValue141));
                        float comparisonValue162 = ((inverseLengthValue24 * ((intermediateValue11 + multiplyAddValue) + intermediateValue12)) > 0.0) ? ceil(dotProductValue10) : floor(dotProductValue10);
                        float scalarValue144 = floor(dotProductValue11);
                        float scalarValue145 = floor(dotProductValue12);
                        productValue146 = ((comparisonValue162 * scalarValue141) + (scalarValue144 * scalarValue143)) + (scalarValue145 * scalarValue142);
                        productValue147 = ((comparisonValue162 * scalarValue142) + (scalarValue144 * scalarValue141)) + (scalarValue145 * scalarValue143);
                        productValue148 = ((comparisonValue162 * scalarValue143) + (scalarValue144 * scalarValue142)) + (scalarValue145 * scalarValue141);
                        sumValue43 = productValue146 + scalarValue143;
                        sumValue44 = productValue147 + scalarValue141;
                        sumValue45 = productValue148 + scalarValue142;
                        sumValue46 = productValue146 + scalarValue142;
                        sumValue47 = productValue147 + scalarValue143;
                        sumValue48 = productValue148 + scalarValue141;
                        sumValue49 = sumValue43 + scalarValue142;
                        sumValue50 = sumValue47 + scalarValue141;
                        sumValue51 = sumValue45 + scalarValue141;
                        float sumValue173 = dotProductValue11 - scalarValue144;
                        float sumValue174 = dotProductValue12 - scalarValue145;
                        float sumValue175 = 1.0 - sumValue173;
                        float sumValue176 = 1.0 - sumValue174;
                        productValue149 = sumValue176 * sumValue175;
                        productValue150 = sumValue176 * sumValue173;
                        productValue151 = sumValue175 * sumValue174;
                        productValue152 = sumValue174 * sumValue173;
                        comparisonValue27 = ((productValue148 >= 0.0) && ((productValue146 >= 0.0) && (productValue147 >= 0.0))) && ((sumValue51 < 16.0) && ((sumValue49 < 16.0) && (sumValue50 < 16.0)));
                        if (comparisonValue27)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                        scalarValue263 = bitwiseValue7 + 1u;
                        scalarValue49 = sampledTextureValue21;
                        scalarValue52 = sumValue172;
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
                            bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture2)) > 0u;
                            uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture2, int(0u)));
                            uint scalarValue20 = sampledTextureValue11.x;
                            float comparisonValue9 = rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue20 : 0u);
                            float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                            float productValue2 = fract(multiplyAddValue14 * comparisonValue9);
                            float productValue6 = fract(multiplyAddValue15 * comparisonValue10);
                            vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture2, textureSampler2), vec2((abs(productValue2 - 0.5) < 0.0625) ? (multiplyAddValue14 + ((productValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue14, (abs(productValue6 - 0.5) < 0.0625) ? (multiplyAddValue15 + ((productValue6 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue15));
                            float scalarValue21 = sampledTextureValue12.x;
                            float scalarValue22 = sampledTextureValue12.y;
                            float scalarValue23 = sampledTextureValue12.z;
                            float scalarValue24 = sampledTextureValue12.w;
                            float multiplyAddValue16 = fract(fma(multiplyAddValue14, comparisonValue9, 0.5));
                            float multiplyAddValue17 = fract(fma(multiplyAddValue15, comparisonValue10, 0.5));
                            bool conditionValue2 = multiplyAddValue17 > 0.5;
                            bool conditionValue3 = multiplyAddValue16 > 0.5;
                            float sumValue10 = multiplyAddValue16 - 0.083333335816860198974609375;
                            float sumValue11 = multiplyAddValue16 + 0.083333335816860198974609375;
                            float sumValue12 = multiplyAddValue17 - 0.083333335816860198974609375;
                            float sumValue13 = multiplyAddValue17 + 0.083333335816860198974609375;
                            vec2 comparisonValue11 = vec2(conditionValue2 ? scalarValue21 : scalarValue24, conditionValue2 ? scalarValue22 : scalarValue23);
                            uint sumValue14 = min(uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0))), 68u);
                            uint sumValue15 = min(uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0))), 68u);
                            float reinterpretedBits7 = rdDot2Precise(comparisonValue11, vec2(uintBitsToFloat(intermediateValue21[sumValue14].x), uintBitsToFloat(intermediateValue21[sumValue14].y))) - rdDot2Precise(comparisonValue11, vec2(uintBitsToFloat(intermediateValue21[sumValue15].x), uintBitsToFloat(intermediateValue21[sumValue15].y)));
                            vec2 comparisonValue12 = vec2(conditionValue3 ? scalarValue23 : scalarValue24, conditionValue3 ? scalarValue22 : scalarValue21);
                            uint sumValue16 = min(uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0))), 68u);
                            uint sumValue17 = min(uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0))), 68u);
                            float reinterpretedBits8 = rdDot2Precise(comparisonValue12, vec2(uintBitsToFloat(intermediateValue21[sumValue16].x), uintBitsToFloat(intermediateValue21[sumValue16].y))) - rdDot2Precise(comparisonValue12, vec2(uintBitsToFloat(intermediateValue21[sumValue17].x), uintBitsToFloat(intermediateValue21[sumValue17].y)));
                            vec3 vectorValue1 = vec3(reinterpretedBits7, reinterpretedBits8, 0.25);
                            float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                            productValue54 = scalarValue19 * (inverseLengthValue1 * reinterpretedBits8);
                            productValue55 = scalarValue19 * (inverseLengthValue1 * reinterpretedBits7);
                            productValue56 = inverseLengthValue1 * 0.25;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                            bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture2)) > 0u;
                            uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture2, int(0u)));
                            uint scalarValue20 = sampledTextureValue11.x;
                            float comparisonValue9 = rdEvaluateFloatExpression(sampledTextureValue10 ? scalarValue20 : 0u);
                            float comparisonValue10 = rdEvaluateFloatExpression(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                            float productValue310 = fract(multiplyAddValue256 * comparisonValue9);
                            float productValue311 = fract(multiplyAddValue257 * comparisonValue10);
                            vec4 sampledTextureValue100 = textureGather(sampler2D(materialTexture2, textureSampler2), vec2((abs(productValue310 - 0.5) < 0.0625) ? (multiplyAddValue256 + ((productValue310 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue256, (abs(productValue311 - 0.5) < 0.0625) ? (multiplyAddValue257 + ((productValue311 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue257));
                            float scalarValue196 = sampledTextureValue100.x;
                            float scalarValue197 = sampledTextureValue100.y;
                            float scalarValue198 = sampledTextureValue100.z;
                            float scalarValue199 = sampledTextureValue100.w;
                            float multiplyAddValue258 = fract(fma(multiplyAddValue256, comparisonValue9, 0.5));
                            float multiplyAddValue259 = fract(fma(multiplyAddValue257, comparisonValue10, 0.5));
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
                            uvec4 sampledTextureValue72 = texelFetch(voxelBuffer, int(((uint(productValue147) + bitwiseValue52) + (uint(productValue148) << 4u)) + (uint(productValue146) << 8u)));
                            uint scalarValue146 = sampledTextureValue72.x;
                            float bitwiseValue13;
                            float intermediateValue147;
                            float intermediateValue148;
                            if (scalarValue146 == 0u)
                            {
                                bitwiseValue13 = 0.0;
                                intermediateValue147 = 0.0;
                                intermediateValue148 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue53 = float(scalarValue146 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue13 = bitwiseValue53 * float(scalarValue146 & 255u);
                                intermediateValue147 = bitwiseValue53 * float((scalarValue146 >> 8u) & 255u);
                                intermediateValue148 = bitwiseValue53 * float((scalarValue146 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue73 = texelFetch(voxelBuffer, int(((uint(sumValue44) + bitwiseValue52) + (uint(sumValue45) << 4u)) + (uint(sumValue43) << 8u)));
                            uint scalarValue147 = sampledTextureValue73.x;
                            float bitwiseValue17;
                            float intermediateValue158;
                            float intermediateValue159;
                            if (scalarValue147 == 0u)
                            {
                                bitwiseValue17 = 0.0;
                                intermediateValue158 = 0.0;
                                intermediateValue159 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue54 = float(scalarValue147 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue17 = bitwiseValue54 * float(scalarValue147 & 255u);
                                intermediateValue158 = bitwiseValue54 * float((scalarValue147 >> 8u) & 255u);
                                intermediateValue159 = bitwiseValue54 * float((scalarValue147 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue74 = texelFetch(voxelBuffer, int(((uint(sumValue47) + bitwiseValue52) + (uint(sumValue48) << 4u)) + (uint(sumValue46) << 8u)));
                            uint scalarValue148 = sampledTextureValue74.x;
                            float bitwiseValue21;
                            float intermediateValue176;
                            float intermediateValue177;
                            if (scalarValue148 == 0u)
                            {
                                bitwiseValue21 = 0.0;
                                intermediateValue176 = 0.0;
                                intermediateValue177 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue55 = float(scalarValue148 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue21 = bitwiseValue55 * float(scalarValue148 & 255u);
                                intermediateValue176 = bitwiseValue55 * float((scalarValue148 >> 8u) & 255u);
                                intermediateValue177 = bitwiseValue55 * float((scalarValue148 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue75 = texelFetch(voxelBuffer, int(((uint(sumValue50) + bitwiseValue52) + (uint(sumValue51) << 4u)) + (uint(sumValue49) << 8u)));
                            uint scalarValue149 = sampledTextureValue75.x;
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
                            if (scalarValue149 == 0u)
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
                                float bitwiseValue56 = float(scalarValue149 >> 24u) * 9.2272217443678528070449829101562e-05;
                                branchMergedValue15 = bitwiseValue56 * float((scalarValue149 >> 16u) & 255u);
                                branchMergedValue26 = bitwiseValue56 * float((scalarValue149 >> 8u) & 255u);
                                branchMergedValue27 = bitwiseValue56 * float(scalarValue149 & 255u);
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
                                sumValue72 = productValue146 + productValue243;
                                sumValue73 = productValue147 + productValue244;
                                sumValue74 = productValue148 + productValue245;
                                uint comparisonValue163 = ((((uint(productValue146 >= 16.0) << 1u) | uint(productValue146 < 0.0)) | (uint(productValue147 < 0.0) << 2u)) | (uint(productValue147 >= 16.0) << 3u)) | (uint(productValue148 < 0.0) << 4u);
                                comparisonValue36 = intermediateValue[comparisonValue163 | (uint(productValue148 >= 16.0) << 5u)];
                                comparisonValue37 = ((((comparisonValue163 | (uint(productValue148 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue163 & 31u))) == 0u;
                                uint sampledTextureValue38;
                                if (comparisonValue37)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue52 + 4096u)).x & (1u << (comparisonValue36 & 31u))) == 0u)
                                    {
                                        intermediateValue161 = 0.0;
                                        intermediateValue162 = 0.0;
                                        intermediateValue163 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue38 = ((((uint(sumValue72 - (floor(sumValue72 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue73 - (floor(sumValue73 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue74 - (floor(sumValue74 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue52 + 4097u) + comparisonValue36)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue38 = ((((uint(productValue148) << 4u) & 240u) | (uint(productValue147) & 15u)) | ((uint(productValue146) << 8u) & 3840u)) + bitwiseValue52;
                                }
                                uvec4 sampledTextureValue76 = texelFetch(voxelBuffer, int(sampledTextureValue38));
                                uint scalarValue150 = sampledTextureValue76.x;
                                if (scalarValue150 == 0u)
                                {
                                    intermediateValue161 = 0.0;
                                    intermediateValue162 = 0.0;
                                    intermediateValue163 = 0.0;
                                    break;
                                }
                                float bitwiseValue57 = float(scalarValue150 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue161 = bitwiseValue57 * float(scalarValue150 & 255u);
                                intermediateValue162 = bitwiseValue57 * float((scalarValue150 >> 8u) & 255u);
                                intermediateValue163 = bitwiseValue57 * float((scalarValue150 >> 16u) & 255u);
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
                                sumValue93 = sumValue43 + productValue243;
                                sumValue94 = sumValue44 + productValue244;
                                sumValue95 = sumValue45 + productValue245;
                                uint comparisonValue164 = ((((uint(sumValue43 >= 16.0) << 1u) | uint(sumValue43 < 0.0)) | (uint(sumValue44 < 0.0) << 2u)) | (uint(sumValue44 >= 16.0) << 3u)) | (uint(sumValue45 < 0.0) << 4u);
                                comparisonValue48 = intermediateValue[comparisonValue164 | (uint(sumValue45 >= 16.0) << 5u)];
                                comparisonValue49 = ((((comparisonValue164 | (uint(sumValue45 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue164 & 31u))) == 0u;
                                uint sampledTextureValue47;
                                if (comparisonValue49)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue52 + 4096u)).x & (1u << (comparisonValue48 & 31u))) == 0u)
                                    {
                                        intermediateValue194 = 0.0;
                                        intermediateValue196 = 0.0;
                                        intermediateValue198 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue47 = ((((uint(sumValue93 - (floor(sumValue93 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue94 - (floor(sumValue94 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue95 - (floor(sumValue95 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue52 + 4097u) + comparisonValue48)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue47 = ((((uint(sumValue45) << 4u) & 240u) | (uint(sumValue44) & 15u)) | ((uint(sumValue43) << 8u) & 3840u)) + bitwiseValue52;
                                }
                                uvec4 sampledTextureValue77 = texelFetch(voxelBuffer, int(sampledTextureValue47));
                                uint scalarValue151 = sampledTextureValue77.x;
                                if (scalarValue151 == 0u)
                                {
                                    intermediateValue194 = 0.0;
                                    intermediateValue196 = 0.0;
                                    intermediateValue198 = 0.0;
                                    break;
                                }
                                float bitwiseValue58 = float(scalarValue151 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue194 = bitwiseValue58 * float(scalarValue151 & 255u);
                                intermediateValue196 = bitwiseValue58 * float((scalarValue151 >> 8u) & 255u);
                                intermediateValue198 = bitwiseValue58 * float((scalarValue151 >> 16u) & 255u);
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
                                sumValue102 = sumValue46 + productValue243;
                                sumValue103 = sumValue47 + productValue244;
                                sumValue104 = sumValue48 + productValue245;
                                uint comparisonValue165 = ((((uint(sumValue46 >= 16.0) << 1u) | uint(sumValue46 < 0.0)) | (uint(sumValue47 < 0.0) << 2u)) | (uint(sumValue47 >= 16.0) << 3u)) | (uint(sumValue48 < 0.0) << 4u);
                                comparisonValue58 = intermediateValue[comparisonValue165 | (uint(sumValue48 >= 16.0) << 5u)];
                                comparisonValue59 = ((((comparisonValue165 | (uint(sumValue48 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue165 & 31u))) == 0u;
                                uint sampledTextureValue51;
                                if (comparisonValue59)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue52 + 4096u)).x & (1u << (comparisonValue58 & 31u))) == 0u)
                                    {
                                        intermediateValue200 = 0.0;
                                        intermediateValue202 = 0.0;
                                        intermediateValue204 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue51 = ((((uint(sumValue102 - (floor(sumValue102 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue103 - (floor(sumValue103 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue104 - (floor(sumValue104 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue52 + 4097u) + comparisonValue58)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue51 = ((((uint(sumValue48) << 4u) & 240u) | (uint(sumValue47) & 15u)) | ((uint(sumValue46) << 8u) & 3840u)) + bitwiseValue52;
                                }
                                uvec4 sampledTextureValue78 = texelFetch(voxelBuffer, int(sampledTextureValue51));
                                uint scalarValue152 = sampledTextureValue78.x;
                                if (scalarValue152 == 0u)
                                {
                                    intermediateValue200 = 0.0;
                                    intermediateValue202 = 0.0;
                                    intermediateValue204 = 0.0;
                                    break;
                                }
                                float bitwiseValue59 = float(scalarValue152 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue200 = bitwiseValue59 * float(scalarValue152 & 255u);
                                intermediateValue202 = bitwiseValue59 * float((scalarValue152 >> 8u) & 255u);
                                intermediateValue204 = bitwiseValue59 * float((scalarValue152 >> 16u) & 255u);
                                break;
                            }
                            float sumValue177 = sumValue49 + productValue243;
                            float sumValue178 = sumValue50 + productValue244;
                            float sumValue179 = sumValue51 + productValue245;
                            uint comparisonValue166 = ((((uint(sumValue49 >= 16.0) << 1u) | uint(sumValue49 < 0.0)) | (uint(sumValue50 < 0.0) << 2u)) | (uint(sumValue50 >= 16.0) << 3u)) | (uint(sumValue51 < 0.0) << 4u);
                            uint comparisonValue167 = comparisonValue166 | (uint(sumValue51 >= 16.0) << 5u);
                            uint sampledTextureValue55;
                            if ((((comparisonValue167 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue166 & 31u))) == 0u)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue52 + 4096u)).x & (1u << (intermediateValue[comparisonValue167] & 31u))) == 0u)
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
                                sampledTextureValue55 = ((((uint(sumValue177 - (floor(sumValue177 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue178 - (floor(sumValue178 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue179 - (floor(sumValue179 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue52 + 4097u) + intermediateValue[comparisonValue167])).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue55 = ((((uint(sumValue51) << 4u) & 240u) | (uint(sumValue50) & 15u)) | ((uint(sumValue49) << 8u) & 3840u)) + bitwiseValue52;
                            }
                            uvec4 sampledTextureValue79 = texelFetch(voxelBuffer, int(sampledTextureValue55));
                            uint scalarValue153 = sampledTextureValue79.x;
                            if (scalarValue153 == 0u)
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
                            float bitwiseValue60 = float(scalarValue153 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue190 = intermediateValue161;
                            intermediateValue191 = intermediateValue162;
                            intermediateValue192 = intermediateValue163;
                            intermediateValue193 = intermediateValue194;
                            intermediateValue195 = intermediateValue196;
                            intermediateValue197 = intermediateValue198;
                            intermediateValue199 = intermediateValue200;
                            intermediateValue201 = intermediateValue202;
                            intermediateValue203 = intermediateValue204;
                            intermediateValue205 = bitwiseValue60 * float(scalarValue153 & 255u);
                            intermediateValue206 = bitwiseValue60 * float((scalarValue153 >> 8u) & 255u);
                            intermediateValue207 = bitwiseValue60 * float((scalarValue153 >> 16u) & 255u);
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
                                uint comparisonValue164 = ((((uint(sumValue43 >= 16.0) << 1u) | uint(sumValue43 < 0.0)) | (uint(sumValue44 < 0.0) << 2u)) | (uint(sumValue44 >= 16.0) << 3u)) | (uint(sumValue45 < 0.0) << 4u);
                                comparisonValue48 = intermediateValue[comparisonValue164 | (uint(sumValue45 >= 16.0) << 5u)];
                                comparisonValue49 = ((((comparisonValue164 | (uint(sumValue45 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue164 & 31u))) == 0u;
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
                                uint comparisonValue165 = ((((uint(sumValue46 >= 16.0) << 1u) | uint(sumValue46 < 0.0)) | (uint(sumValue47 < 0.0) << 2u)) | (uint(sumValue47 >= 16.0) << 3u)) | (uint(sumValue48 < 0.0) << 4u);
                                comparisonValue58 = intermediateValue[comparisonValue165 | (uint(sumValue48 >= 16.0) << 5u)];
                                comparisonValue59 = ((((comparisonValue165 | (uint(sumValue48 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue165 & 31u))) == 0u;
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
                            uint comparisonValue166 = ((((uint(sumValue49 >= 16.0) << 1u) | uint(sumValue49 < 0.0)) | (uint(sumValue50 < 0.0) << 2u)) | (uint(sumValue50 >= 16.0) << 3u)) | (uint(sumValue51 < 0.0) << 4u);
                            uint comparisonValue167 = comparisonValue166 | (uint(sumValue51 >= 16.0) << 5u);
                            uint sampledTextureValue56;
                            if ((((comparisonValue167 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue166 & 31u))) == 0u)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue115 + 4096u)).x & (1u << (intermediateValue[comparisonValue167] & 31u))) == 0u)
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
                                sampledTextureValue56 = ((((uint(sumValue294 - (floor(sumValue294 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue295 - (floor(sumValue295 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue296 - (floor(sumValue296 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue115 + 4097u) + intermediateValue[comparisonValue167])).x >> 2u);
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
                        bool sampledTextureValue15 = uint(textureQueryLevels(materialTexture2)) > 0u;
                        uvec2 sampledTextureValue16 = uvec2(textureSize(materialTexture2, int(0u)));
                        uint scalarValue25 = sampledTextureValue16.x;
                        float sumValue18 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        bool conditionValue4 = sumValue18 > 0.0;
                        float comparisonValue13 = fract(rdEvaluateFloatExpression(sampledTextureValue15 ? scalarValue25 : 0u) * multiplyAddValue14);
                        float comparisonValue14 = fract(rdEvaluateFloatExpression(sampledTextureValue15 ? sampledTextureValue16.y : 0u) * multiplyAddValue15);
                        float multiplyAddValue18 = (comparisonValue13 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue9.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue19 = (comparisonValue14 <= 0.083333335816860198974609375) ? (-fma(scalarValue16, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue20 = (comparisonValue13 >= 0.916666686534881591796875) ? (fma(scalarValue17, 2.0, -1.0) + multiplyAddValue18) : multiplyAddValue18;
                        float multiplyAddValue21 = (comparisonValue14 >= 0.916666686534881591796875) ? (fma(scalarValue18, 2.0, -1.0) + multiplyAddValue19) : multiplyAddValue19;
                        bool comparisonValue15 = abs(multiplyAddValue20) >= 0.004999999888241291046142578125;
                        bool comparisonValue16 = abs(multiplyAddValue21) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue19 = vec3(comparisonValue15 ? multiplyAddValue20 : 0.0, comparisonValue16 ? multiplyAddValue21 : 0.0, 0.25);
                        float inverseLengthValue2 = inversesqrt(rdDot3Precise2(comparisonValue19, comparisonValue19));
                        intermediateValue89 = (conditionValue4 && comparisonValue16) ? (sumValue18 * (inverseLengthValue2 * multiplyAddValue21)) : 0.0;
                        intermediateValue91 = (conditionValue4 && comparisonValue15) ? (sumValue18 * (inverseLengthValue2 * multiplyAddValue20)) : 0.0;
                        intermediateValue93 = conditionValue4 ? (inverseLengthValue2 * 0.25) : 1.0;
                    }
                    intermediateValue88 = intermediateValue89;
                    intermediateValue90 = intermediateValue91;
                    intermediateValue92 = intermediateValue93;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    else
                    {
                        bool sampledTextureValue15 = uint(textureQueryLevels(materialTexture2)) > 0u;
                        uvec2 sampledTextureValue16 = uvec2(textureSize(materialTexture2, int(0u)));
                        uint scalarValue25 = sampledTextureValue16.x;
                        float sumValue216 = spvNClamp(2.0 - sumValue207, 0.0, 1.0);
                        bool conditionValue30 = sumValue216 > 0.0;
                        float comparisonValue188 = fract(rdEvaluateFloatExpression(sampledTextureValue15 ? scalarValue25 : 0u) * multiplyAddValue256);
                        float comparisonValue189 = fract(rdEvaluateFloatExpression(sampledTextureValue15 ? sampledTextureValue16.y : 0u) * multiplyAddValue257);
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
                        intermediateValue115 = floor(sumValue168);
                        intermediateValue116 = floor(sumValue169);
                        intermediateValue117 = floor(sumValue170);
                        float sumValue180 = sumValue168 - intermediateValue115;
                        float sumValue181 = sumValue169 - intermediateValue116;
                        float sumValue182 = sumValue170 - intermediateValue117;
                        uint comparisonValue168 = ((uint(sumValue181 >= sumValue182) << 1u) | uint(sumValue180 >= sumValue181)) | (uint(sumValue180 >= sumValue182) << 2u);
                        intermediateValue118 = uint(intermediateValue115);
                        intermediateValue119 = uint(intermediateValue116);
                        intermediateValue120 = uint(intermediateValue117);
                        float scalarValue154 = spvNMin(sumValue180, sumValue181);
                        float scalarValue155 = spvNMax(sumValue180, sumValue181);
                        intermediateValue123 = spvNMin(scalarValue154, sumValue182);
                        float scalarValue156 = spvNMax(scalarValue155, sumValue182);
                        float scalarValue157 = spvNMax(spvNMin(scalarValue155, sumValue182), scalarValue154);
                        sumValue59 = 1.0 - scalarValue156;
                        sumValue60 = scalarValue156 - scalarValue157;
                        sumValue61 = scalarValue157 - intermediateValue123;
                        sumValue62 = intermediateValue115 + 1.0;
                        sumValue63 = intermediateValue116 + 1.0;
                        sumValue64 = intermediateValue117 + 1.0;
                        comparisonValue29 = (((intermediateValue115 >= 0.0) && (intermediateValue116 >= 0.0)) && (intermediateValue117 >= 0.0)) && (((sumValue62 < 16.0) && (sumValue63 < 16.0)) && (sumValue64 < 16.0));
                        productValue153 = 0u + (comparisonValue168 * 3u);
                        productValue154 = 1u + (comparisonValue168 * 3u);
                        productValue155 = 2u + (comparisonValue168 * 3u);
                        productValue156 = 0u + (comparisonValue168 * 3u);
                        productValue157 = 1u + (comparisonValue168 * 3u);
                        productValue158 = 2u + (comparisonValue168 * 3u);
                        if (comparisonValue29)
                        {
                            uint bitwiseValue61 = intermediateValue120 << 4u;
                            uint sumValue183 = intermediateValue119 + bitwiseValue52;
                            uint bitwiseValue62 = sumValue183 + (intermediateValue118 << 8u);
                            uvec4 sampledTextureValue80 = texelFetch(voxelBuffer, int(bitwiseValue62 + bitwiseValue61));
                            uint scalarValue158 = sampledTextureValue80.x;
                            float bitwiseValue15;
                            float intermediateValue150;
                            float intermediateValue151;
                            if (scalarValue158 == 0u)
                            {
                                bitwiseValue15 = 0.0;
                                intermediateValue150 = 0.0;
                                intermediateValue151 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue63 = float(scalarValue158 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue15 = bitwiseValue63 * float(scalarValue158 & 255u);
                                intermediateValue150 = bitwiseValue63 * float((scalarValue158 >> 8u) & 255u);
                                intermediateValue151 = bitwiseValue63 * float((scalarValue158 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue81 = texelFetch(voxelBuffer, int(((intermediateValue1[productValue154] + sumValue183) + ((intermediateValue1[productValue153] + intermediateValue118) << 8u)) + ((intermediateValue1[productValue155] + intermediateValue120) << 4u)));
                            uint scalarValue159 = sampledTextureValue81.x;
                            float bitwiseValue19;
                            float intermediateValue165;
                            float intermediateValue166;
                            if (scalarValue159 == 0u)
                            {
                                bitwiseValue19 = 0.0;
                                intermediateValue165 = 0.0;
                                intermediateValue166 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue64 = float(scalarValue159 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue19 = bitwiseValue64 * float(scalarValue159 & 255u);
                                intermediateValue165 = bitwiseValue64 * float((scalarValue159 >> 8u) & 255u);
                                intermediateValue166 = bitwiseValue64 * float((scalarValue159 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue82 = texelFetch(voxelBuffer, int(((intermediateValue2[productValue157] + sumValue183) + ((intermediateValue2[productValue156] + intermediateValue118) << 8u)) + ((intermediateValue2[productValue158] + intermediateValue120) << 4u)));
                            uint scalarValue160 = sampledTextureValue82.x;
                            float bitwiseValue24;
                            float intermediateValue179;
                            float intermediateValue180;
                            if (scalarValue160 == 0u)
                            {
                                bitwiseValue24 = 0.0;
                                intermediateValue179 = 0.0;
                                intermediateValue180 = 0.0;
                            }
                            else
                            {
                                float bitwiseValue65 = float(scalarValue160 >> 24u) * 9.2272217443678528070449829101562e-05;
                                bitwiseValue24 = bitwiseValue65 * float(scalarValue160 & 255u);
                                intermediateValue179 = bitwiseValue65 * float((scalarValue160 >> 8u) & 255u);
                                intermediateValue180 = bitwiseValue65 * float((scalarValue160 >> 16u) & 255u);
                            }
                            uvec4 sampledTextureValue83 = texelFetch(voxelBuffer, int((bitwiseValue62 + 273u) + bitwiseValue61));
                            uint scalarValue161 = sampledTextureValue83.x;
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
                            if (scalarValue161 == 0u)
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
                                float bitwiseValue66 = float(scalarValue161 >> 24u) * 9.2272217443678528070449829101562e-05;
                                branchMergedValue16 = bitwiseValue66 * float((scalarValue161 >> 16u) & 255u);
                                branchMergedValue35 = bitwiseValue66 * float((scalarValue161 >> 8u) & 255u);
                                branchMergedValue36 = bitwiseValue66 * float(scalarValue161 & 255u);
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
                                sumValue82 = intermediateValue115 + productValue243;
                                sumValue83 = intermediateValue116 + productValue244;
                                sumValue84 = intermediateValue117 + productValue245;
                                uint comparisonValue169 = ((((uint(intermediateValue115 >= 16.0) << 1u) | uint(intermediateValue115 < 0.0)) | (uint(intermediateValue116 < 0.0) << 2u)) | (uint(intermediateValue116 >= 16.0) << 3u)) | (uint(intermediateValue117 < 0.0) << 4u);
                                comparisonValue39 = intermediateValue[comparisonValue169 | (uint(intermediateValue117 >= 16.0) << 5u)];
                                comparisonValue40 = ((((comparisonValue169 | (uint(intermediateValue117 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue169 & 31u))) == 0u;
                                uint sampledTextureValue41;
                                if (comparisonValue40)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue52 + 4096u)).x & (1u << (comparisonValue39 & 31u))) == 0u)
                                    {
                                        intermediateValue168 = 0.0;
                                        intermediateValue169 = 0.0;
                                        intermediateValue170 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue41 = ((((uint(sumValue82 - (floor(sumValue82 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue83 - (floor(sumValue83 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue84 - (floor(sumValue84 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue52 + 4097u) + comparisonValue39)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue41 = ((((intermediateValue118 << 8u) & 3840u) | (intermediateValue119 & 15u)) | ((intermediateValue120 << 4u) & 240u)) + bitwiseValue52;
                                }
                                uvec4 sampledTextureValue84 = texelFetch(voxelBuffer, int(sampledTextureValue41));
                                uint scalarValue162 = sampledTextureValue84.x;
                                if (scalarValue162 == 0u)
                                {
                                    intermediateValue168 = 0.0;
                                    intermediateValue169 = 0.0;
                                    intermediateValue170 = 0.0;
                                    break;
                                }
                                float bitwiseValue67 = float(scalarValue162 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue168 = bitwiseValue67 * float(scalarValue162 & 255u);
                                intermediateValue169 = bitwiseValue67 * float((scalarValue162 >> 8u) & 255u);
                                intermediateValue170 = bitwiseValue67 * float((scalarValue162 >> 16u) & 255u);
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
                                sumValue96 = sumValue76 + productValue243;
                                sumValue97 = sumValue77 + productValue244;
                                sumValue98 = sumValue78 + productValue245;
                                uint comparisonValue170 = ((((uint(sumValue76 >= 16.0) << 1u) | uint(sumValue76 < 0.0)) | (uint(sumValue77 < 0.0) << 2u)) | (uint(sumValue77 >= 16.0) << 3u)) | (uint(sumValue78 < 0.0) << 4u);
                                comparisonValue51 = intermediateValue[comparisonValue170 | (uint(sumValue78 >= 16.0) << 5u)];
                                comparisonValue52 = ((((comparisonValue170 | (uint(sumValue78 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue170 & 31u))) == 0u;
                                uint sampledTextureValue49;
                                if (comparisonValue52)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue52 + 4096u)).x & (1u << (comparisonValue51 & 31u))) == 0u)
                                    {
                                        intermediateValue213 = 0.0;
                                        intermediateValue215 = 0.0;
                                        intermediateValue217 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue49 = ((((uint(sumValue96 - (floor(sumValue96 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue97 - (floor(sumValue97 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue98 - (floor(sumValue98 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue52 + 4097u) + comparisonValue51)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue49 = ((((uint(sumValue76) << 8u) & 3840u) | (uint(sumValue77) & 15u)) | ((uint(sumValue78) << 4u) & 240u)) + bitwiseValue52;
                                }
                                uvec4 sampledTextureValue85 = texelFetch(voxelBuffer, int(sampledTextureValue49));
                                uint scalarValue163 = sampledTextureValue85.x;
                                if (scalarValue163 == 0u)
                                {
                                    intermediateValue213 = 0.0;
                                    intermediateValue215 = 0.0;
                                    intermediateValue217 = 0.0;
                                    break;
                                }
                                float bitwiseValue68 = float(scalarValue163 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue213 = bitwiseValue68 * float(scalarValue163 & 255u);
                                intermediateValue215 = bitwiseValue68 * float((scalarValue163 >> 8u) & 255u);
                                intermediateValue217 = bitwiseValue68 * float((scalarValue163 >> 16u) & 255u);
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
                                sumValue105 = sumValue79 + productValue243;
                                sumValue106 = sumValue80 + productValue244;
                                sumValue107 = sumValue81 + productValue245;
                                uint comparisonValue171 = ((((uint(sumValue79 >= 16.0) << 1u) | uint(sumValue79 < 0.0)) | (uint(sumValue80 < 0.0) << 2u)) | (uint(sumValue80 >= 16.0) << 3u)) | (uint(sumValue81 < 0.0) << 4u);
                                comparisonValue61 = intermediateValue[comparisonValue171 | (uint(sumValue81 >= 16.0) << 5u)];
                                comparisonValue62 = ((((comparisonValue171 | (uint(sumValue81 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue171 & 31u))) == 0u;
                                uint sampledTextureValue53;
                                if (comparisonValue62)
                                {
                                    if ((texelFetch(voxelBuffer, int(bitwiseValue52 + 4096u)).x & (1u << (comparisonValue61 & 31u))) == 0u)
                                    {
                                        intermediateValue219 = 0.0;
                                        intermediateValue221 = 0.0;
                                        intermediateValue223 = 0.0;
                                        break;
                                    }
                                    sampledTextureValue53 = ((((uint(sumValue105 - (floor(sumValue105 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue106 - (floor(sumValue106 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue107 - (floor(sumValue107 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue52 + 4097u) + comparisonValue61)).x >> 2u);
                                }
                                else
                                {
                                    sampledTextureValue53 = ((((uint(sumValue79) << 8u) & 3840u) | (uint(sumValue80) & 15u)) | ((uint(sumValue81) << 4u) & 240u)) + bitwiseValue52;
                                }
                                uvec4 sampledTextureValue86 = texelFetch(voxelBuffer, int(sampledTextureValue53));
                                uint scalarValue164 = sampledTextureValue86.x;
                                if (scalarValue164 == 0u)
                                {
                                    intermediateValue219 = 0.0;
                                    intermediateValue221 = 0.0;
                                    intermediateValue223 = 0.0;
                                    break;
                                }
                                float bitwiseValue69 = float(scalarValue164 >> 24u) * 9.2272217443678528070449829101562e-05;
                                intermediateValue219 = bitwiseValue69 * float(scalarValue164 & 255u);
                                intermediateValue221 = bitwiseValue69 * float((scalarValue164 >> 8u) & 255u);
                                intermediateValue223 = bitwiseValue69 * float((scalarValue164 >> 16u) & 255u);
                                break;
                            }
                            float sumValue184 = sumValue62 + productValue243;
                            float sumValue185 = sumValue63 + productValue244;
                            float sumValue186 = sumValue64 + productValue245;
                            uint comparisonValue172 = ((((uint(sumValue62 >= 16.0) << 1u) | uint(sumValue62 < 0.0)) | (uint(sumValue63 < 0.0) << 2u)) | (uint(sumValue63 >= 16.0) << 3u)) | (uint(sumValue64 < 0.0) << 4u);
                            uint comparisonValue173 = comparisonValue172 | (uint(sumValue64 >= 16.0) << 5u);
                            uint sampledTextureValue57;
                            if ((((comparisonValue173 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue172 & 31u))) == 0u)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue52 + 4096u)).x & (1u << (intermediateValue[comparisonValue173] & 31u))) == 0u)
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
                                sampledTextureValue57 = ((((uint(sumValue184 - (floor(sumValue184 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue185 - (floor(sumValue185 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue186 - (floor(sumValue186 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue52 + 4097u) + intermediateValue[comparisonValue173])).x >> 2u);
                            }
                            else
                            {
                                sampledTextureValue57 = ((((uint(sumValue62) << 8u) & 3840u) | (uint(sumValue63) & 15u)) | ((uint(sumValue64) << 4u) & 240u)) + bitwiseValue52;
                            }
                            uvec4 sampledTextureValue87 = texelFetch(voxelBuffer, int(sampledTextureValue57));
                            uint scalarValue165 = sampledTextureValue87.x;
                            if (scalarValue165 == 0u)
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
                            float bitwiseValue70 = float(scalarValue165 >> 24u) * 9.2272217443678528070449829101562e-05;
                            intermediateValue209 = intermediateValue168;
                            intermediateValue210 = intermediateValue169;
                            intermediateValue211 = intermediateValue170;
                            intermediateValue212 = intermediateValue213;
                            intermediateValue214 = intermediateValue215;
                            intermediateValue216 = intermediateValue217;
                            intermediateValue218 = intermediateValue219;
                            intermediateValue220 = intermediateValue221;
                            intermediateValue222 = intermediateValue223;
                            intermediateValue224 = bitwiseValue70 * float(scalarValue165 & 255u);
                            intermediateValue225 = bitwiseValue70 * float((scalarValue165 >> 8u) & 255u);
                            intermediateValue226 = bitwiseValue70 * float((scalarValue165 >> 16u) & 255u);
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
                                uint comparisonValue170 = ((((uint(sumValue76 >= 16.0) << 1u) | uint(sumValue76 < 0.0)) | (uint(sumValue77 < 0.0) << 2u)) | (uint(sumValue77 >= 16.0) << 3u)) | (uint(sumValue78 < 0.0) << 4u);
                                comparisonValue51 = intermediateValue[comparisonValue170 | (uint(sumValue78 >= 16.0) << 5u)];
                                comparisonValue52 = ((((comparisonValue170 | (uint(sumValue78 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue170 & 31u))) == 0u;
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
                                uint comparisonValue171 = ((((uint(sumValue79 >= 16.0) << 1u) | uint(sumValue79 < 0.0)) | (uint(sumValue80 < 0.0) << 2u)) | (uint(sumValue80 >= 16.0) << 3u)) | (uint(sumValue81 < 0.0) << 4u);
                                comparisonValue61 = intermediateValue[comparisonValue171 | (uint(sumValue81 >= 16.0) << 5u)];
                                comparisonValue62 = ((((comparisonValue171 | (uint(sumValue81 >= 16.0) << 5u)) < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue171 & 31u))) == 0u;
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
                            uint comparisonValue172 = ((((uint(sumValue62 >= 16.0) << 1u) | uint(sumValue62 < 0.0)) | (uint(sumValue63 < 0.0) << 2u)) | (uint(sumValue63 >= 16.0) << 3u)) | (uint(sumValue64 < 0.0) << 4u);
                            uint comparisonValue173 = comparisonValue172 | (uint(sumValue64 >= 16.0) << 5u);
                            uint sampledTextureValue58;
                            if ((((comparisonValue173 < 32u) ? 4169726089u : 4294965384u) & (1u << (comparisonValue172 & 31u))) == 0u)
                            {
                                if ((texelFetch(voxelBuffer, int(bitwiseValue115 + 4096u)).x & (1u << (intermediateValue[comparisonValue173] & 31u))) == 0u)
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
                                sampledTextureValue58 = ((((uint(sumValue301 - (floor(sumValue301 * 0.0625) * 16.0)) << 8u) & 3840u) | (uint(sumValue302 - (floor(sumValue302 * 0.0625) * 16.0)) & 15u)) | ((uint(sumValue303 - (floor(sumValue303 * 0.0625) * 16.0)) << 4u) & 240u)) + (texelFetch(voxelBuffer, int((bitwiseValue115 + 4097u) + intermediateValue[comparisonValue173])).x >> 2u);
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
            vec4 reinterpretedBits9 = uintBitsToFloat(intermediateValue10.packedValues[scalarValue4 * 4u]);
            vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(varyingTexCoord0.x, reinterpretedBits9.x, reinterpretedBits9.z), fma(varyingTexCoord0.y, reinterpretedBits9.y, reinterpretedBits9.w)));
            intermediateValue47 = sampledTextureValue17.x;
            comparisonValue2 = ((reinterpretedBits3 & 2u) == 2u) ? sampledTextureValue17.w : scalarValue9;
            intermediateValue43 = sampledTextureValue17.y;
            intermediateValue45 = sampledTextureValue17.z;
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
            vec4 reinterpretedBits21 = uintBitsToFloat(intermediateValue11.packedValues[scalarValue4 * 4u]);
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
            comparisonValue2 = scalarValue9;
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
        float comparisonValue21 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue22 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue23 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        vec3 vectorValue4 = vec3(comparisonValue21, comparisonValue22, comparisonValue23);
        float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        intermediateValue41 = comparisonValue2;
        intermediateValue42 = intermediateValue43;
        intermediateValue44 = intermediateValue45;
        intermediateValue46 = intermediateValue47;
        multiplyAddValue3 = fma(inverseLengthValue5 * comparisonValue23, multiplyAddValue36, fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue35, multiplyAddValue34 * (inverseLengthValue4 * varyingBitangent0.z)));
        multiplyAddValue4 = fma(inverseLengthValue5 * comparisonValue22, multiplyAddValue36, fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue35, multiplyAddValue34 * (inverseLengthValue4 * varyingBitangent0.y)));
        multiplyAddValue5 = fma(inverseLengthValue5 * comparisonValue21, multiplyAddValue36, fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue35, multiplyAddValue34 * (inverseLengthValue4 * varyingBitangent0.x)));
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue21 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue22 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue23 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        vec3 vectorValue4 = vec3(comparisonValue21, comparisonValue22, comparisonValue23);
        float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        intermediateValue39 = comparisonValue1;
        intermediateValue40 = intermediateValue41;
        intermediateValue42 = intermediateValue43;
        intermediateValue44 = intermediateValue45;
        multiplyAddValue6 = fma(inverseLengthValue5 * comparisonValue23, multiplyAddValue39, fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue38, multiplyAddValue37 * (inverseLengthValue4 * varyingBitangent0.z)));
        multiplyAddValue7 = fma(inverseLengthValue5 * comparisonValue22, multiplyAddValue39, fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue38, multiplyAddValue37 * (inverseLengthValue4 * varyingBitangent0.y)));
        multiplyAddValue8 = fma(inverseLengthValue5 * comparisonValue21, multiplyAddValue39, fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue38, multiplyAddValue37 * (inverseLengthValue4 * varyingBitangent0.x)));
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float productValue252 = fragmentVectorConstants1.packedValues[111u].y * fragmentVectorConstants1.packedValues[111u].y;
        float productValue253 = productValue252 * productValue252;
        float productValue254 = (((fragmentVectorConstants1.packedValues[76u].y * (productValue252 - productValue253)) + productValue253) * fragmentVectorConstants1.packedValues[111u].y) * fragmentVectorConstants1.packedValues[140u].w;
        float productValue255 = fragmentVectorConstants1.packedValues[123u].w * sumValue143;
        float dotProductValue13 = dot(vec3(exponentialValue, exponentialValue1, exponentialValue2), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float productValue256 = (fragmentVectorConstants1.packedValues[123u].z * intermediateValue15) * fragmentVectorConstants1.packedValues[63u].x;
        productValue36 = (((dotProductValue13 - exponentialValue) * fragmentVectorConstants1.packedValues[63u].y) + exponentialValue) * productValue256;
        productValue37 = (((dotProductValue13 - exponentialValue1) * fragmentVectorConstants1.packedValues[63u].y) + exponentialValue1) * productValue256;
        productValue38 = (((dotProductValue13 - exponentialValue2) * fragmentVectorConstants1.packedValues[63u].y) + exponentialValue2) * productValue256;
        productValue39 = (spvNMax((productValue254 * fragmentVectorConstants1.packedValues[140u].x) + (fragmentVectorConstants1.packedValues[58u].w * intermediateValue46), fragmentVectorConstants1.packedValues[66u].x * fragmentVectorConstants1.packedValues[66u].w) * exponentialValue) * productValue255;
        productValue40 = (spvNMax((productValue254 * fragmentVectorConstants1.packedValues[140u].y) + (fragmentVectorConstants1.packedValues[58u].w * intermediateValue47), fragmentVectorConstants1.packedValues[66u].y * fragmentVectorConstants1.packedValues[66u].w) * exponentialValue1) * productValue255;
        productValue41 = (spvNMax((productValue254 * fragmentVectorConstants1.packedValues[140u].z) + (fragmentVectorConstants1.packedValues[58u].w * intermediateValue48), fragmentVectorConstants1.packedValues[66u].z * fragmentVectorConstants1.packedValues[66u].w) * exponentialValue2) * productValue255;
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
    float multiplyAddValue22 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue23 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue24 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue25 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue25, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].w)));
    float multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue25, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].x))) / multiplyAddValue26;
    float multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue25, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].y))) / multiplyAddValue26;
    float multiplyAddValue29 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue25, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].z))) / multiplyAddValue26;
    vec3 vectorValue5 = vec3(multiplyAddValue5, multiplyAddValue4, multiplyAddValue3);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue7 = inverseLengthValue6 * multiplyAddValue5;
    float productValue8 = inverseLengthValue6 * multiplyAddValue4;
    float productValue9 = inverseLengthValue6 * multiplyAddValue3;
    float multiplyAddValue30 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue9, fma(fragmentVectorConstants1.packedValues[4u].x, productValue7, productValue8 * fragmentVectorConstants1.packedValues[5u].x));
    float multiplyAddValue31 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue9, fma(fragmentVectorConstants1.packedValues[4u].y, productValue7, productValue8 * fragmentVectorConstants1.packedValues[5u].y));
    float multiplyAddValue32 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue9, fma(fragmentVectorConstants1.packedValues[4u].z, productValue7, productValue8 * fragmentVectorConstants1.packedValues[5u].z));
    float sumValue19 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[115u].x;
    float sumValue20 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[115u].y;
    float sumValue21 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[115u].z;
    float scalarValue26 = dFdxCoarse(multiplyAddValue24);
    float scalarValue27 = dFdxCoarse(multiplyAddValue22);
    float scalarValue28 = dFdxCoarse(multiplyAddValue23);
    vec3 vectorValue6 = vec3(scalarValue26, scalarValue27, scalarValue28);
    float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
    float productValue10 = inverseLengthValue7 * scalarValue26;
    float productValue11 = inverseLengthValue7 * scalarValue27;
    float productValue12 = inverseLengthValue7 * scalarValue28;
    float scalarValue29 = dFdyCoarse(-multiplyAddValue23);
    float scalarValue30 = dFdyCoarse(-multiplyAddValue24);
    float scalarValue31 = dFdyCoarse(-multiplyAddValue22);
    vec3 vectorValue7 = vec3(scalarValue29, scalarValue30, scalarValue31);
    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue13 = inverseLengthValue8 * scalarValue29;
    float productValue14 = inverseLengthValue8 * scalarValue30;
    float productValue15 = inverseLengthValue8 * scalarValue31;
    float multiplyAddValue33 = fma(productValue12, productValue14, -(productValue10 * productValue13));
    float multiplyAddValue49 = fma(productValue10, productValue15, -(productValue11 * productValue14));
    float multiplyAddValue50 = fma(productValue11, productValue13, -(productValue12 * productValue15));
    vec3 vectorValue8 = vec3(multiplyAddValue33, multiplyAddValue49, multiplyAddValue50);
    float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
    float productValue16 = inverseLengthValue9 * multiplyAddValue33;
    float productValue17 = inverseLengthValue9 * multiplyAddValue49;
    float productValue18 = inverseLengthValue9 * multiplyAddValue50;
    float multiplyAddValue51 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue18, fma(fragmentVectorConstants1.packedValues[8u].x, productValue16, productValue17 * fragmentVectorConstants1.packedValues[9u].x));
    float multiplyAddValue52 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue18, fma(fragmentVectorConstants1.packedValues[8u].y, productValue16, productValue17 * fragmentVectorConstants1.packedValues[9u].y));
    float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue18, fma(fragmentVectorConstants1.packedValues[8u].z, productValue16, productValue17 * fragmentVectorConstants1.packedValues[9u].z));
    vec3 vectorValue9 = vec3(multiplyAddValue51, multiplyAddValue52, multiplyAddValue53);
    float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
    float quotientValue = roundEven((inverseLengthValue10 * multiplyAddValue51) / fragmentScalarConstants1.packedValues[548u]) * fragmentScalarConstants1.packedValues[548u];
    float quotientValue1 = roundEven((inverseLengthValue10 * multiplyAddValue52) / fragmentScalarConstants1.packedValues[548u]) * fragmentScalarConstants1.packedValues[548u];
    float quotientValue2 = roundEven((inverseLengthValue10 * multiplyAddValue53) / fragmentScalarConstants1.packedValues[548u]) * fragmentScalarConstants1.packedValues[548u];
    vec3 vectorValue10 = vec3(quotientValue, quotientValue1, quotientValue2);
    float inverseLengthValue11 = inversesqrt(rdDot3Precise2(vectorValue10, vectorValue10));
    float productValue19 = inverseLengthValue11 * quotientValue;
    float productValue20 = inverseLengthValue11 * quotientValue1;
    float productValue21 = inverseLengthValue11 * quotientValue2;
    float scalarValue32 = -fragmentScalarConstants1.packedValues[538u];
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[538u], 0.5, -fma(scalarValue32, floor(sumValue19 / fragmentScalarConstants1.packedValues[538u]), sumValue19));
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[538u], 0.5, -fma(scalarValue32, floor(sumValue20 / fragmentScalarConstants1.packedValues[538u]), sumValue20));
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[538u], 0.5, -fma(scalarValue32, floor(sumValue21 / fragmentScalarConstants1.packedValues[538u]), sumValue21));
    float scalarValue33 = -rdDot3Precise2(vec3(multiplyAddValue54, multiplyAddValue55, multiplyAddValue56), vec3(productValue19, productValue20, productValue21));
    float multiplyAddValue57 = (sumValue19 + fma(scalarValue33, productValue19, multiplyAddValue54)) + fragmentVectorConstants1.packedValues[115u].x;
    float multiplyAddValue58 = (sumValue20 + fma(scalarValue33, productValue20, multiplyAddValue55)) + fragmentVectorConstants1.packedValues[115u].y;
    float multiplyAddValue59 = (sumValue21 + fma(scalarValue33, productValue21, multiplyAddValue56)) + fragmentVectorConstants1.packedValues[115u].z;
    bool bitwiseValue = (((fragmentScalarConstants1.packedValues[249u] + fragmentScalarConstants1.packedValues[248u]) + fragmentScalarConstants1.packedValues[250u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[444u] > 9.9999997473787516355514526367188e-05);
    float productValue22 = fragmentScalarConstants1.packedValues[444u] * fragmentScalarConstants1.packedValues[444u];
    float comparisonValue24 = bitwiseValue ? spvNMin(productValue22, 1.0) : fragmentVectorConstants1.packedValues[62u].x;
    float multiplyAddValue60 = bitwiseValue ? spvNMin(fma(fma(productValue22, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue22, 1.0) : fragmentVectorConstants1.packedValues[62u].y;
    float multiplyAddValue61 = bitwiseValue ? spvNMin(fma(productValue22 * productValue22, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue22, 1.0) : fragmentVectorConstants1.packedValues[62u].z;
    float sumValue22 = 1.0 - intermediateValue46;
    float multiplyAddValue63 = fma(sumValue22, 0.039999999105930328369140625, exponentialValue4 * intermediateValue46);
    float multiplyAddValue64 = fma(sumValue22, 0.039999999105930328369140625, exponentialValue5 * intermediateValue46);
    float multiplyAddValue66 = fma(sumValue22, 0.039999999105930328369140625, exponentialValue6 * intermediateValue46);
    float exponentialValue3;
    if ((fragmentScalarConstants1.packedValues[448u] != 0.0) && (fragmentScalarConstants1.packedValues[451u] != 0.0))
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue22 = fma(fragmentVectorConstants1.packedValues[6u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue23 = fma(fragmentVectorConstants1.packedValues[6u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue24 = fma(fragmentVectorConstants1.packedValues[6u].z, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].z, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue25 = fma(fragmentVectorConstants1.packedValues[6u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[4u].w, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[5u].w)) + fragmentVectorConstants1.packedValues[7u].w;
    float multiplyAddValue26 = fma(fragmentVectorConstants1.packedValues[3u].w, multiplyAddValue25, fma(fragmentVectorConstants1.packedValues[2u].w, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].w, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].w)));
    float multiplyAddValue27 = fma(fragmentVectorConstants1.packedValues[3u].x, multiplyAddValue25, fma(fragmentVectorConstants1.packedValues[2u].x, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].x, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].x))) / multiplyAddValue26;
    float multiplyAddValue28 = fma(fragmentVectorConstants1.packedValues[3u].y, multiplyAddValue25, fma(fragmentVectorConstants1.packedValues[2u].y, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].y, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].y))) / multiplyAddValue26;
    float multiplyAddValue29 = fma(fragmentVectorConstants1.packedValues[3u].z, multiplyAddValue25, fma(fragmentVectorConstants1.packedValues[2u].z, multiplyAddValue24, fma(fragmentVectorConstants1.packedValues[0u].z, multiplyAddValue22, multiplyAddValue23 * fragmentVectorConstants1.packedValues[1u].z))) / multiplyAddValue26;
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
    float scalarValue26 = dFdxCoarse(multiplyAddValue24);
    float scalarValue27 = dFdxCoarse(multiplyAddValue22);
    float scalarValue28 = dFdxCoarse(multiplyAddValue23);
    vec3 vectorValue6 = vec3(scalarValue26, scalarValue27, scalarValue28);
    float inverseLengthValue7 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
    float productValue10 = inverseLengthValue7 * scalarValue26;
    float productValue11 = inverseLengthValue7 * scalarValue27;
    float productValue12 = inverseLengthValue7 * scalarValue28;
    float scalarValue29 = dFdyCoarse(-multiplyAddValue23);
    float scalarValue30 = dFdyCoarse(-multiplyAddValue24);
    float scalarValue31 = dFdyCoarse(-multiplyAddValue22);
    vec3 vectorValue7 = vec3(scalarValue29, scalarValue30, scalarValue31);
    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue13 = inverseLengthValue8 * scalarValue29;
    float productValue14 = inverseLengthValue8 * scalarValue30;
    float productValue15 = inverseLengthValue8 * scalarValue31;
    float multiplyAddValue33 = fma(productValue12, productValue14, -(productValue10 * productValue13));
    float multiplyAddValue49 = fma(productValue10, productValue15, -(productValue11 * productValue14));
    float multiplyAddValue50 = fma(productValue11, productValue13, -(productValue12 * productValue15));
    vec3 vectorValue8 = vec3(multiplyAddValue33, multiplyAddValue49, multiplyAddValue50);
    float inverseLengthValue9 = inversesqrt(rdDot3Precise2(vectorValue8, vectorValue8));
    float productValue16 = inverseLengthValue9 * multiplyAddValue33;
    float productValue17 = inverseLengthValue9 * multiplyAddValue49;
    float productValue18 = inverseLengthValue9 * multiplyAddValue50;
    float multiplyAddValue51 = fma(fragmentVectorConstants1.packedValues[10u].x, productValue18, fma(fragmentVectorConstants1.packedValues[8u].x, productValue16, productValue17 * fragmentVectorConstants1.packedValues[9u].x));
    float multiplyAddValue52 = fma(fragmentVectorConstants1.packedValues[10u].y, productValue18, fma(fragmentVectorConstants1.packedValues[8u].y, productValue16, productValue17 * fragmentVectorConstants1.packedValues[9u].y));
    float multiplyAddValue53 = fma(fragmentVectorConstants1.packedValues[10u].z, productValue18, fma(fragmentVectorConstants1.packedValues[8u].z, productValue16, productValue17 * fragmentVectorConstants1.packedValues[9u].z));
    vec3 vectorValue9 = vec3(multiplyAddValue51, multiplyAddValue52, multiplyAddValue53);
    float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue9, vectorValue9));
    float quotientValue39 = roundEven((inverseLengthValue10 * multiplyAddValue51) / fragmentScalarConstants1.packedValues[544u]) * fragmentScalarConstants1.packedValues[544u];
    float quotientValue40 = roundEven((inverseLengthValue10 * multiplyAddValue52) / fragmentScalarConstants1.packedValues[544u]) * fragmentScalarConstants1.packedValues[544u];
    float quotientValue41 = roundEven((inverseLengthValue10 * multiplyAddValue53) / fragmentScalarConstants1.packedValues[544u]) * fragmentScalarConstants1.packedValues[544u];
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
    float sumValue130 = 1.0 - intermediateValue44;
    float multiplyAddValue275 = fma(sumValue130, 0.039999999105930328369140625, multiplyAddValue249 * intermediateValue44);
    float multiplyAddValue276 = fma(sumValue130, 0.039999999105930328369140625, multiplyAddValue250 * intermediateValue44);
    float multiplyAddValue277 = fma(sumValue130, 0.039999999105930328369140625, multiplyAddValue251 * intermediateValue44);
    float exponentialValue;
    if ((fragmentScalarConstants1.packedValues[444u] != 0.0) && (fragmentScalarConstants1.packedValues[447u] != 0.0))
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue187 = ((productValue39 + productValue36) + intermediateValue28) + intermediateValue34;
    float sumValue188 = ((productValue40 + productValue37) + intermediateValue30) + intermediateValue36;
    float sumValue189 = ((productValue41 + productValue38) + intermediateValue32) + intermediateValue38;
    float sumValue123 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue124 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue125 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue33 = inversesqrt(dot(vec3(sumValue123, sumValue124, sumValue125), vec3(sumValue123, sumValue124, sumValue125)));
    float productValue257 = inverseLengthValue33 * sumValue123;
    float productValue258 = inverseLengthValue33 * sumValue124;
    float productValue259 = inverseLengthValue33 * sumValue125;
    bool comparisonValue174 = fragmentVectorConstants1.packedValues[72u].y != 0.0;
    bool comparisonValue175 = fragmentVectorConstants1.packedValues[123u].w != 0.0;
    float productValue47;
    float productValue48;
    float productValue49;
    if ((comparisonValue174 && (fragmentVectorConstants1.packedValues[72u].z != 0.0)) && comparisonValue175)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float sumValue304 = ((productValue36 + productValue33) + intermediateValue23) + intermediateValue29;
    float sumValue305 = ((productValue37 + productValue34) + intermediateValue25) + intermediateValue31;
    float sumValue306 = ((productValue38 + productValue35) + intermediateValue27) + intermediateValue33;
    float sumValue123 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue124 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue125 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
    float inverseLengthValue33 = inversesqrt(dot(vec3(sumValue123, sumValue124, sumValue125), vec3(sumValue123, sumValue124, sumValue125)));
    float productValue257 = inverseLengthValue33 * sumValue123;
    float productValue258 = inverseLengthValue33 * sumValue124;
    float productValue259 = inverseLengthValue33 * sumValue125;
    bool comparisonValue275 = fragmentVectorConstants1.packedValues[71u].y != 0.0;
    bool comparisonValue276 = fragmentVectorConstants1.packedValues[122u].w != 0.0;
    float productValue44;
    float productValue45;
    float productValue46;
    if ((comparisonValue275 && (fragmentVectorConstants1.packedValues[71u].z != 0.0)) && comparisonValue276)
#endif
    {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 sampledTextureValue18 = texture(sampler2DArray(materialTexture6, textureSampler6), vec3((varyingTexCoord3.x - fragmentScalarConstants1.packedValues[460u]) * fragmentScalarConstants1.packedValues[449u], (varyingTexCoord3.z - fragmentScalarConstants1.packedValues[462u]) * fragmentScalarConstants1.packedValues[449u], fragmentScalarConstants1.packedValues[453u]));
        float scalarValue34 = sampledTextureValue18.x;
        exponentialValue3 = exp2(log2((scalarValue34 + scalarValue34) * spvNClamp(productValue8, 0.0, 1.0)) * fragmentScalarConstants1.packedValues[450u]) * (fragmentScalarConstants1.packedValues[450u] + 1.0);
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
    vec3 vectorValue11 = vec3(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24);
    float nonlinearValue = sqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    vec3 vectorValue12 = vec3(multiplyAddValue30, multiplyAddValue31, multiplyAddValue32);
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
    if (multiplyAddValue29 != 1.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec3 vectorValue11 = vec3(multiplyAddValue22, multiplyAddValue23, multiplyAddValue24);
    float nonlinearValue = sqrt(rdDot3Precise2(vectorValue11, vectorValue11));
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
    if (multiplyAddValue29 != 1.0)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue176 = fragmentVectorConstants1.packedValues[146u].x != 0.0;
    bool comparisonValue177 = fragmentVectorConstants1.packedValues[72u].x != 0.0;
    float intermediateValue53;
    float intermediateValue54;
    float intermediateValue55;
    float intermediateValue56;
    if (comparisonValue177)
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
        float quotientValue35 = spvNClamp(((fragmentVectorConstants1.packedValues[138u].x - fragmentVectorConstants1.packedValues[68u].x) + (nonlinearValue4 / fragmentVectorConstants1.packedValues[68u].z)) * fragmentVectorConstants1.packedValues[68u].y, 0.0, 1.0);
        float branchMergedValue11;
        float branchMergedValue21;
        float branchMergedValue22;
        float branchMergedValue23;
        if (quotientValue35 > 0.0)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float quotientValue63 = spvNClamp(((fragmentVectorConstants1.packedValues[137u].x - fragmentVectorConstants1.packedValues[67u].x) + (nonlinearValue4 / fragmentVectorConstants1.packedValues[67u].z)) * fragmentVectorConstants1.packedValues[67u].y, 0.0, 1.0);
        float branchMergedValue11;
        float branchMergedValue21;
        float branchMergedValue22;
        float branchMergedValue23;
        if (quotientValue63 > 0.0)
#endif
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float sumValue23 = nonlinearValue + 9.9999997473787516355514526367188e-05;
            float productValue23 = intermediateValue41 * fragmentScalarConstants1.packedValues[564u];
            float multiplyAddValue62;
            float intermediateValue107;
            if (uint(int(fragmentScalarConstants1.packedValues[240u])) == 1u)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float sumValue23 = nonlinearValue + 9.9999997473787516355514526367188e-05;
            float productValue319 = intermediateValue39 * fragmentScalarConstants1.packedValues[560u];
            float multiplyAddValue65;
            float intermediateValue105;
            if (uint(int(fragmentScalarConstants1.packedValues[240u])) == 1u)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue51;
            float branchMergedValue58;
            float branchMergedValue59;
            float branchMergedValue60;
            if (comparisonValue174)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue51;
            float branchMergedValue58;
            float branchMergedValue59;
            float branchMergedValue60;
            if (comparisonValue275)
#endif
            {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool conditionValue5 = int(uint(int(fragmentScalarConstants1.packedValues[537u]))) > int(0u);
                float multiplyAddValue67 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[519u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[518u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[516u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[517u])));
                float multiplyAddValue68 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[519u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[518u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[516u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[517u])));
                float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[519u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[518u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[516u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[517u])));
                vec3 vectorValue13 = vec3(multiplyAddValue67, multiplyAddValue68, multiplyAddValue69);
                float inverseLengthValue12 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
                float productValue28 = spvNMax(rdDot3Precise2(vectorValue12, vec3(inverseLengthValue12 * multiplyAddValue67, inverseLengthValue12 * multiplyAddValue68, inverseLengthValue12 * multiplyAddValue69)), 0.0);
                float sumValue24 = spvNMax(1.0 - productValue28, 0.0);
                float multiplyAddValue70 = fma(productValue7 * fragmentScalarConstants1.packedValues[559u], sumValue24, conditionValue5 ? multiplyAddValue57 : varyingTexCoord3.x);
                float multiplyAddValue71 = fma(productValue8 * fragmentScalarConstants1.packedValues[559u], sumValue24, conditionValue5 ? multiplyAddValue58 : varyingTexCoord3.y);
                float multiplyAddValue72 = fma(productValue9 * fragmentScalarConstants1.packedValues[559u], sumValue24, conditionValue5 ? multiplyAddValue59 : varyingTexCoord3.z);
                uint scalarValue35 = uint(int(rdDot4Precise(vec4(spvNClamp(fragmentVectorConstants1.packedValues[78u].x, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[78u].y, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[78u].z, 0.0, 1.0), spvNClamp(fragmentVectorConstants1.packedValues[78u].w, 0.0, 1.0)), vec4(1.0))));
                bool comparisonValue28 = fragmentScalarConstants1.packedValues[536u] != 0.0;
                float intermediateValue108;
                float intermediateValue138;
                intermediateValue138 = 1.0;
                intermediateValue108 = 1.0;
                uint sumValue33;
                float intermediateValue139;
                float intermediateValue140;
                uint intermediateValue142;
                uint scalarValue36 = 0u;
                uint scalarValue37 = 0u;
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
                uint scalarValue36 = 0u;
                uint scalarValue37 = 0u;
                for (;;)
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                branchMergedValue51 = spvNMax(productValue49, 1.0) * fragmentVectorConstants1.packedValues[73u].z;
                branchMergedValue58 = spvNMax(productValue48, 1.0) * fragmentVectorConstants1.packedValues[73u].y;
                branchMergedValue59 = fragmentVectorConstants1.packedValues[73u].x * spvNMax(productValue47, 1.0);
                branchMergedValue60 = quotientValue35;
            }
            else
            {
                float quotientValue36 = spvNClamp(((productValue258 - fragmentVectorConstants1.packedValues[130u].x) + fragmentVectorConstants1.packedValues[130u].w) / (fragmentVectorConstants1.packedValues[130u].z - fragmentVectorConstants1.packedValues[130u].x), 0.0, 1.0);
                float productValue260 = 1.0 - ((quotientValue36 * quotientValue36) * (3.0 - (quotientValue36 * 2.0)));
                float productValue261 = (productValue260 * productValue260) * productValue260;
                float dotProductValue14 = dot(vec3(productValue257, productValue258, productValue259), vec3(fragmentVectorConstants1.packedValues[135u].xyz));
                float dotProductValue15 = dot(vec3(productValue257, productValue258, productValue259), vec3(fragmentVectorConstants1.packedValues[77u].xyz));
                float sumValue190 = fragmentVectorConstants1.packedValues[130u].x - fragmentVectorConstants1.packedValues[130u].w;
                float quotientValue37 = spvNClamp((productValue258 - sumValue190) / (fragmentVectorConstants1.packedValues[130u].y - sumValue190), 0.0, 1.0);
                float productValue262 = 1.0 - ((quotientValue37 * quotientValue37) * (3.0 - (quotientValue37 * 2.0)));
                float productValue263 = (productValue262 * productValue262) * productValue262;
                float productValue264 = (fragmentVectorConstants1.packedValues[69u].x * 0.75) * ((((dotProductValue15 * dotProductValue15) + 1.0) * fragmentVectorConstants1.packedValues[133u].w) + (((dotProductValue14 * dotProductValue14) + 1.0) * fragmentVectorConstants1.packedValues[142u].w));
                float exponentialValue9 = spvNClamp(exp2(log2(spvNMax(dotProductValue14, 0.0)) * fragmentVectorConstants1.packedValues[69u].w), 0.0, 1.0);
                float exponentialValue10 = spvNClamp(exp2(log2(spvNMax(dotProductValue15, 0.0)) * fragmentVectorConstants1.packedValues[69u].w), 0.0, 1.0);
                float productValue265 = 1.809999942779541015625 - (exponentialValue9 * 1.7999999523162841796875);
                float nonlinearValue7 = 0.036100022494792938232421875 / (sqrt(productValue265) * productValue265);
                float productValue266 = 1.809999942779541015625 - (exponentialValue10 * 1.7999999523162841796875);
                float nonlinearValue8 = 0.036100022494792938232421875 / (sqrt(productValue266) * productValue266);
                float productValue267 = exponentialValue9 * (fragmentVectorConstants1.packedValues[69u].y * fragmentVectorConstants1.packedValues[142u].w);
                float productValue268 = exponentialValue10 * (fragmentVectorConstants1.packedValues[69u].z * fragmentVectorConstants1.packedValues[133u].w);
                float productValue269 = (((productValue261 * fragmentVectorConstants1.packedValues[131u].x) * (((productValue268 * fragmentVectorConstants1.packedValues[133u].x) * nonlinearValue8) + ((productValue267 * fragmentVectorConstants1.packedValues[142u].x) * nonlinearValue7))) + (((productValue263 * (fragmentVectorConstants1.packedValues[131u].x - fragmentVectorConstants1.packedValues[70u].x)) + fragmentVectorConstants1.packedValues[70u].x) * productValue264)) * 0.079577468335628509521484375;
                float productValue270 = (((productValue261 * fragmentVectorConstants1.packedValues[131u].y) * (((productValue268 * fragmentVectorConstants1.packedValues[133u].y) * nonlinearValue8) + ((productValue267 * fragmentVectorConstants1.packedValues[142u].y) * nonlinearValue7))) + (((productValue263 * (fragmentVectorConstants1.packedValues[131u].y - fragmentVectorConstants1.packedValues[70u].y)) + fragmentVectorConstants1.packedValues[70u].y) * productValue264)) * 0.079577468335628509521484375;
                float productValue271 = (((productValue261 * fragmentVectorConstants1.packedValues[131u].z) * (((productValue268 * fragmentVectorConstants1.packedValues[133u].z) * nonlinearValue8) + ((productValue267 * fragmentVectorConstants1.packedValues[142u].z) * nonlinearValue7))) + (((productValue263 * (fragmentVectorConstants1.packedValues[131u].z - fragmentVectorConstants1.packedValues[70u].z)) + fragmentVectorConstants1.packedValues[70u].z) * productValue264)) * 0.079577468335628509521484375;
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
                float quotientValue64 = spvNClamp(((productValue258 - fragmentVectorConstants1.packedValues[129u].x) + fragmentVectorConstants1.packedValues[129u].w) / (fragmentVectorConstants1.packedValues[129u].z - fragmentVectorConstants1.packedValues[129u].x), 0.0, 1.0);
                float productValue431 = 1.0 - ((quotientValue64 * quotientValue64) * (3.0 - (quotientValue64 * 2.0)));
                float productValue432 = (productValue431 * productValue431) * productValue431;
                float dotProductValue30 = dot(vec3(productValue257, productValue258, productValue259), vec3(fragmentVectorConstants1.packedValues[134u].xyz));
                float dotProductValue31 = dot(vec3(productValue257, productValue258, productValue259), vec3(fragmentVectorConstants1.packedValues[76u].xyz));
                float sumValue307 = fragmentVectorConstants1.packedValues[129u].x - fragmentVectorConstants1.packedValues[129u].w;
                float quotientValue65 = spvNClamp((productValue258 - sumValue307) / (fragmentVectorConstants1.packedValues[129u].y - sumValue307), 0.0, 1.0);
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
                    if (int(scalarValue35) <= int(scalarValue37))
                    {
                        break;
                    }
                    uint scalarValue38 = min(scalarValue37, 68u);
                    uint reinterpretedBits10 = uint(min(int(uint(int(rdDot4Precise(fragmentVectorConstants1.packedValues[78u], vec4(uintBitsToFloat(intermediateValue21[scalarValue38].x), uintBitsToFloat(intermediateValue21[scalarValue38].y), uintBitsToFloat(intermediateValue21[scalarValue38].z), uintBitsToFloat(intermediateValue21[scalarValue38].w))))) + scalarValue36), int(8u)));
                    intermediateValue139 = intermediateValue138;
                    intermediateValue140 = intermediateValue108;
                    intermediateValue142 = scalarValue36;
                    float quotientValue16;
                    float quotientValue17;
                    uint intermediateValue169;
                    for (;;)
                    {
                        if (int(reinterpretedBits10) <= int(intermediateValue142))
                        {
                            break;
                        }
                        uint bitwiseValue1 = intermediateValue142 << 2u;
                        uint sumValue25 = bitwiseValue1 + 80u;
                        uint sumValue26 = bitwiseValue1 + 79u;
                        uint sumValue27 = bitwiseValue1 + 81u;
                        uint sumValue28 = bitwiseValue1 + 82u;
                        float multiplyAddValue73 = fma(fragmentVectorConstants1.packedValues[sumValue27].x, multiplyAddValue72, fma(fragmentVectorConstants1.packedValues[sumValue26].x, multiplyAddValue70, multiplyAddValue71 * fragmentVectorConstants1.packedValues[sumValue25].x)) + fragmentVectorConstants1.packedValues[sumValue28].x;
                        float multiplyAddValue74 = fma(fragmentVectorConstants1.packedValues[sumValue27].y, multiplyAddValue72, fma(fragmentVectorConstants1.packedValues[sumValue26].y, multiplyAddValue70, multiplyAddValue71 * fragmentVectorConstants1.packedValues[sumValue25].y)) + fragmentVectorConstants1.packedValues[sumValue28].y;
                        float multiplyAddValue75 = fma(fragmentVectorConstants1.packedValues[sumValue27].z, multiplyAddValue72, fma(fragmentVectorConstants1.packedValues[sumValue26].z, multiplyAddValue70, multiplyAddValue71 * fragmentVectorConstants1.packedValues[sumValue25].z)) + fragmentVectorConstants1.packedValues[sumValue28].z;
                        if ((abs(multiplyAddValue75) <= 1.0) && ((abs(multiplyAddValue73) <= 1.0) && (abs(multiplyAddValue74) <= 1.0)))
                        {
                            uint scalarValue39 = min(intermediateValue142, 68u);
                            float reinterpretedBits11 = spvNMin(spvNMax(productValue28, rdDot4Precise(fragmentVectorConstants1.packedValues[61u], vec4(uintBitsToFloat(intermediateValue21[scalarValue39].x), uintBitsToFloat(intermediateValue21[scalarValue39].y), uintBitsToFloat(intermediateValue21[scalarValue39].z), uintBitsToFloat(intermediateValue21[scalarValue39].w)))), 1.0);
                            float multiplyAddValue76 = fma(multiplyAddValue73, 0.5, 0.5);
                            uint sumValue29 = bitwiseValue1 + 18u;
                            float nonlinearValue1 = sqrt(rdDot4Precise(fragmentVectorConstants1.packedValues[sumValue29], fragmentVectorConstants1.packedValues[sumValue29])) * fragmentScalarConstants1.packedValues[566u];
                            uint clampedValue = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[(((16u * intermediateValue142) + 768u) + 12u) >> 2u] + 0.5))), int(1u), int(9u)));
                            bool conditionValue6 = !comparisonValue28;
                            uint comparisonValue34 = (comparisonValue28 ? 1u : clampedValue) >> 1u;
                            float multiplyAddValue77 = 1.0 - fma(multiplyAddValue74, 0.5, 0.5);
                            float scalarValue40 = rdSignedBitsToFloat(intermediateValue142);
                            float multiplyAddValue78 = multiplyAddValue75 - fma(fragmentScalarConstants1.packedValues[(((16u * intermediateValue142) + 768u) + 8u) >> 2u], sqrt(fma(-reinterpretedBits11, reinterpretedBits11, 1.0)) / reinterpretedBits11, fragmentScalarConstants1.packedValues[(((16u * intermediateValue142) + 768u) + 4u) >> 2u]);
                            float intermediateValue216;
                            float intermediateValue218;
                            intermediateValue216 = 0.0;
                            intermediateValue218 = 0.0;
                            uint sumValue88;
                            float intermediateValue217;
                            float intermediateValue219;
                            uint scalarValue41 = 0u;
                            for (;;)
                            {
                                if ((comparisonValue28 && (int(scalarValue41) >= int(1u))) || ((int(clampedValue) <= int(scalarValue41)) && conditionValue6))
                                {
                                    break;
                                }
                                float sumValue30 = rdSignedBitsToFloat(scalarValue41 - comparisonValue34) + 0.5;
                                intermediateValue217 = intermediateValue216;
                                intermediateValue219 = intermediateValue218;
                                float multiplyAddValue176;
                                float multiplyAddValue177;
                                uint sumValue94;
                                uint scalarValue42 = 0u;
                                for (;;)
                                {
                                    if ((conditionValue6 && (int(clampedValue) <= int(scalarValue42))) || (comparisonValue28 && (int(scalarValue42) >= int(1u))))
                                    {
                                        break;
                                    }
                                    uint bitwiseValue2 = (((16u * intermediateValue142) + 768u) + 0u) >> 2u;
                                    float multiplyAddValue79 = fma(multiplyAddValue76, fragmentScalarConstants1.packedValues[bitwiseValue2], ((rdSignedBitsToFloat(scalarValue42 - comparisonValue34) + 0.5) * fragmentScalarConstants1.packedValues[556u]) * fragmentScalarConstants1.packedValues[bitwiseValue2]);
                                    float multiplyAddValue80 = fma(multiplyAddValue77, fragmentScalarConstants1.packedValues[bitwiseValue2], (sumValue30 * fragmentScalarConstants1.packedValues[556u]) * fragmentScalarConstants1.packedValues[bitwiseValue2]);
                                    vec4 sampledTextureValue19 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue79, multiplyAddValue80, scalarValue40));
                                    float scalarValue43 = sampledTextureValue19.x;
                                    float scalarValue44 = sampledTextureValue19.y;
                                    float scalarValue45 = sampledTextureValue19.z;
                                    float scalarValue46 = sampledTextureValue19.w;
                                    float multiplyAddValue92 = fract(fma(multiplyAddValue79, fragmentScalarConstants1.packedValues[558u], 0.5));
                                    float multiplyAddValue93 = fract(fma(multiplyAddValue80, fragmentScalarConstants1.packedValues[558u], 0.5));
                                    float productValue31 = spvNClamp(nonlinearValue1 * (multiplyAddValue75 - scalarValue43), 0.0, 1.0);
                                    float productValue32 = spvNClamp(nonlinearValue1 * (multiplyAddValue75 - scalarValue44), 0.0, 1.0);
                                    float productValue42 = spvNClamp(nonlinearValue1 * (multiplyAddValue75 - scalarValue45), 0.0, 1.0);
                                    float productValue43 = spvNClamp(nonlinearValue1 * (multiplyAddValue75 - scalarValue46), 0.0, 1.0);
                                    float multiplyAddValue94 = fma(-fma(productValue31, -2.0, 3.0), productValue31 * productValue31, 1.0);
                                    float multiplyAddValue95 = fma(-fma(productValue43, -2.0, 3.0), productValue43 * productValue43, 1.0);
                                    float multiplyAddValue96 = fma(multiplyAddValue92, fma(-fma(productValue42, -2.0, 3.0), productValue42 * productValue42, 1.0) - multiplyAddValue95, multiplyAddValue95);
                                    multiplyAddValue177 = fma(multiplyAddValue93, fma(multiplyAddValue92, fma(-fma(productValue32, -2.0, 3.0), productValue32 * productValue32, 1.0) - multiplyAddValue94, multiplyAddValue94) - multiplyAddValue96, multiplyAddValue96) + intermediateValue219;
                                    bool comparisonValue35 = scalarValue46 >= multiplyAddValue78;
                                    bool comparisonValue38 = scalarValue43 >= multiplyAddValue78;
                                    float comparisonValue43 = float(scalarValue44 >= multiplyAddValue78);
                                    float comparisonValue47 = float(scalarValue45 >= multiplyAddValue78);
                                    float multiplyAddValue97 = fma(multiplyAddValue92, comparisonValue35 ? (comparisonValue47 - 1.0) : comparisonValue47, float(comparisonValue35));
                                    multiplyAddValue176 = comparisonValue28 ? (comparisonValue35 ? (intermediateValue217 + 1.0) : intermediateValue217) : (fma(multiplyAddValue93, fma(multiplyAddValue92, comparisonValue38 ? (comparisonValue43 - 1.0) : comparisonValue43, float(comparisonValue38)) - multiplyAddValue97, multiplyAddValue97) + intermediateValue217);
                                    sumValue94 = scalarValue42 + 1u;
                                    intermediateValue217 = multiplyAddValue176;
                                    intermediateValue219 = multiplyAddValue177;
                                    scalarValue42 = sumValue94;
                                    continue;
                                }
                                sumValue88 = scalarValue41 + 1u;
                                intermediateValue216 = intermediateValue217;
                                intermediateValue218 = intermediateValue219;
                                scalarValue41 = sumValue88;
                                continue;
                            }
                            float comparisonValue50 = rdSignedBitsToFloat(comparisonValue28 ? 1u : (clampedValue * clampedValue));
                            intermediateValue169 = reinterpretedBits10;
                            quotientValue17 = spvNMin(intermediateValue218 / comparisonValue50, intermediateValue140);
                            quotientValue16 = spvNMin(intermediateValue216 / comparisonValue50, intermediateValue139);
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
                    sumValue33 = scalarValue37 + 1u;
                    intermediateValue138 = intermediateValue139;
                    intermediateValue108 = intermediateValue140;
                    scalarValue36 = intermediateValue142;
                    scalarValue37 = sumValue33;
                    continue;
                }
                float intermediateValue172;
                if (int(uint(int(fragmentScalarConstants1.packedValues[224u]))) > int(0u))
                {
                    float multiplyAddValue98 = fma(fma(fragmentVectorConstants1.packedValues[127u].x, multiplyAddValue72, fma(fragmentVectorConstants1.packedValues[125u].x, multiplyAddValue70, multiplyAddValue71 * fragmentVectorConstants1.packedValues[126u].x)) + fragmentVectorConstants1.packedValues[128u].x, 0.5, 0.5) * fragmentScalarConstants1.packedValues[225u];
                    float multiplyAddValue99 = (1.0 - fma(fma(fragmentVectorConstants1.packedValues[127u].y, multiplyAddValue72, fma(fragmentVectorConstants1.packedValues[125u].y, multiplyAddValue70, multiplyAddValue71 * fragmentVectorConstants1.packedValues[126u].y)) + fragmentVectorConstants1.packedValues[128u].y, 0.5, 0.5)) * fragmentScalarConstants1.packedValues[225u];
                    float comparisonValue42;
                    if ((((multiplyAddValue98 >= 0.0) && (multiplyAddValue98 < fragmentScalarConstants1.packedValues[225u])) && (multiplyAddValue99 >= 0.0)) && (multiplyAddValue99 < fragmentScalarConstants1.packedValues[225u]))
                    {
                        float scalarValue47 = spvNMin(spvNMax(productValue28, fragmentScalarConstants1.packedValues[244u]), 1.0);
                        float multiplyAddValue100 = spvNMin((fma(fragmentVectorConstants1.packedValues[127u].z, multiplyAddValue72, fma(fragmentVectorConstants1.packedValues[125u].z, multiplyAddValue70, multiplyAddValue71 * fragmentVectorConstants1.packedValues[126u].z)) + fragmentVectorConstants1.packedValues[128u].z) - fma(fragmentScalarConstants1.packedValues[194u], sqrt(fma(-scalarValue47, scalarValue47, 1.0)) / scalarValue47, fragmentScalarConstants1.packedValues[193u]), 1.0);
                        bool conditionValue7 = !comparisonValue28;
                        float sumValue31 = rdDot4Precise(fragmentVectorConstants1.packedValues[78u], vec4(1.0)) + 1.0;
                        uint comparisonValue53 = comparisonValue28 ? 0u : 4294967295u;
                        float intermediateValue196;
                        intermediateValue196 = 0.0;
                        uint sumValue71;
                        float intermediateValue197;
                        uint scalarValue48 = 0u;
                        for (;;)
                        {
                            if (((int(scalarValue48) >= int(2u)) && conditionValue7) || (comparisonValue28 && (int(scalarValue48) >= int(1u))))
                            {
                                break;
                            }
                            float sumValue32 = rdSignedBitsToFloat(comparisonValue53 + scalarValue48) + 0.5;
                            intermediateValue197 = intermediateValue196;
                            uint sumValue91;
                            float sampledTextureValue21;
                            uint scalarValue49 = 0u;
                            for (;;)
                            {
                                if ((conditionValue7 && (int(scalarValue49) >= int(2u))) || (comparisonValue28 && (int(scalarValue49) >= int(1u))))
                                {
                                    break;
                                }
                                float multiplyAddValue101 = fma((rdSignedBitsToFloat(comparisonValue53 + scalarValue49) + 0.5) * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue98);
                                float multiplyAddValue102 = fma(sumValue32 * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue99);
                                if (comparisonValue28)
                                {
                                    sampledTextureValue21 = (textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue101, multiplyAddValue102, sumValue31), 0.0).x >= multiplyAddValue100) ? (intermediateValue197 + 1.0) : intermediateValue197;
                                }
                                else
                                {
                                    vec4 sampledTextureValue24 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue101, multiplyAddValue102, sumValue31));
                                    float multiplyAddValue103 = fract(fma(multiplyAddValue101, fragmentScalarConstants1.packedValues[558u], 0.5));
                                    bool comparisonValue54 = sampledTextureValue24.x >= multiplyAddValue100;
                                    bool comparisonValue55 = sampledTextureValue24.w >= multiplyAddValue100;
                                    float comparisonValue57 = float(sampledTextureValue24.y >= multiplyAddValue100);
                                    float comparisonValue60 = float(sampledTextureValue24.z >= multiplyAddValue100);
                                    float multiplyAddValue104 = fma(multiplyAddValue103, comparisonValue55 ? (comparisonValue60 - 1.0) : comparisonValue60, float(comparisonValue55));
                                    sampledTextureValue21 = intermediateValue197 + fma(fract(fma(multiplyAddValue102, fragmentScalarConstants1.packedValues[558u], 0.5)), fma(multiplyAddValue103, comparisonValue54 ? (comparisonValue57 - 1.0) : comparisonValue57, float(comparisonValue54)) - multiplyAddValue104, multiplyAddValue104);
                                }
                                sumValue91 = scalarValue49 + 1u;
                                intermediateValue197 = sampledTextureValue21;
                                scalarValue49 = sumValue91;
                                continue;
                            }
                            sumValue71 = scalarValue48 + 1u;
                            intermediateValue196 = intermediateValue197;
                            scalarValue48 = sumValue71;
                            continue;
                        }
                        comparisonValue42 = intermediateValue196 / (comparisonValue28 ? 1.0 : 4.0);
                    }
                    else
                    {
                        comparisonValue42 = 1.0;
                    }
                    intermediateValue172 = comparisonValue42;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    if (int(scalarValue203) <= int(scalarValue37))
                    {
                        break;
                    }
                    uint scalarValue38 = min(scalarValue37, 68u);
                    uint reinterpretedBits22 = uint(min(int(uint(int(rdDot4Precise(fragmentVectorConstants1.packedValues[77u], vec4(uintBitsToFloat(intermediateValue23[scalarValue38].x), uintBitsToFloat(intermediateValue23[scalarValue38].y), uintBitsToFloat(intermediateValue23[scalarValue38].z), uintBitsToFloat(intermediateValue23[scalarValue38].w))))) + scalarValue36), int(8u)));
                    intermediateValue137 = intermediateValue136;
                    intermediateValue138 = intermediateValue106;
                    intermediateValue140 = scalarValue36;
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
                        if ((abs(multiplyAddValue286) <= 1.0) && ((abs(multiplyAddValue284) <= 1.0) && (abs(multiplyAddValue285) <= 1.0)))
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
                            uint scalarValue41 = 0u;
                            for (;;)
                            {
                                if ((comparisonValue194 && (int(scalarValue41) >= int(1u))) || ((int(clampedValue2) <= int(scalarValue41)) && conditionValue32))
                                {
                                    break;
                                }
                                float sumValue226 = rdSignedBitsToFloat(scalarValue41 - comparisonValue195) + 0.5;
                                intermediateValue215 = intermediateValue214;
                                intermediateValue217 = intermediateValue216;
                                float multiplyAddValue179;
                                float multiplyAddValue180;
                                uint sumValue94;
                                uint scalarValue42 = 0u;
                                for (;;)
                                {
                                    if ((comparisonValue194 && (int(scalarValue42) >= int(1u))) || ((int(clampedValue2) <= int(scalarValue42)) && conditionValue32))
                                    {
                                        break;
                                    }
                                    uint bitwiseValue73 = (((16u * intermediateValue140) + 768u) + 0u) >> 2u;
                                    float multiplyAddValue290 = fma(multiplyAddValue287, fragmentScalarConstants1.packedValues[bitwiseValue73], ((rdSignedBitsToFloat(scalarValue42 - comparisonValue195) + 0.5) * fragmentScalarConstants1.packedValues[552u]) * fragmentScalarConstants1.packedValues[bitwiseValue73]);
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
                                    sumValue94 = scalarValue42 + 1u;
                                    intermediateValue215 = multiplyAddValue179;
                                    intermediateValue217 = multiplyAddValue180;
                                    scalarValue42 = sumValue94;
                                    continue;
                                }
                                sumValue88 = scalarValue41 + 1u;
                                intermediateValue214 = intermediateValue215;
                                intermediateValue216 = intermediateValue217;
                                scalarValue41 = sumValue88;
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
                    sumValue33 = scalarValue37 + 1u;
                    intermediateValue136 = intermediateValue137;
                    intermediateValue106 = intermediateValue138;
                    scalarValue36 = intermediateValue140;
                    scalarValue37 = sumValue33;
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
                        uint scalarValue48 = 0u;
                        for (;;)
                        {
                            if (((int(scalarValue48) >= int(2u)) && conditionValue33) || (comparisonValue194 && (int(scalarValue48) >= int(1u))))
                            {
                                break;
                            }
                            float sumValue228 = rdSignedBitsToFloat(comparisonValue201 + scalarValue48) + 0.5;
                            intermediateValue195 = intermediateValue194;
                            uint sumValue91;
                            float sampledTextureValue22;
                            uint scalarValue49 = 0u;
                            for (;;)
                            {
                                if ((comparisonValue194 && (int(scalarValue49) >= int(1u))) || (conditionValue33 && (int(scalarValue49) >= int(2u))))
                                {
                                    break;
                                }
                                float multiplyAddValue301 = fma((rdSignedBitsToFloat(comparisonValue201 + scalarValue49) + 0.5) * fragmentScalarConstants1.packedValues[226u], fragmentScalarConstants1.packedValues[225u], multiplyAddValue298);
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
                                sumValue91 = scalarValue49 + 1u;
                                intermediateValue195 = sampledTextureValue22;
                                scalarValue49 = sumValue91;
                                continue;
                            }
                            sumValue71 = scalarValue48 + 1u;
                            intermediateValue194 = intermediateValue195;
                            scalarValue48 = sumValue71;
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
                    float scalarValue166 = spvNMax(fragmentVectorConstants1.packedValues[75u].y, fragmentVectorConstants1.packedValues[111u].y);
                    branchMergedValue62 = ((productValue271 - fragmentVectorConstants1.packedValues[143u].z) * scalarValue166) + fragmentVectorConstants1.packedValues[143u].z;
                    branchMergedValue65 = ((productValue270 - fragmentVectorConstants1.packedValues[143u].y) * scalarValue166) + fragmentVectorConstants1.packedValues[143u].y;
                    branchMergedValue66 = ((productValue269 - fragmentVectorConstants1.packedValues[143u].x) * scalarValue166) + fragmentVectorConstants1.packedValues[143u].x;
                    branchMergedValue67 = quotientValue35;
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
                    branchMergedValue62 = productValue271;
                    branchMergedValue65 = productValue270;
                    branchMergedValue66 = productValue269;
                    branchMergedValue67 = quotientValue35;
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
                    float multiplyAddValue105 = fma(fragmentVectorConstants1.packedValues[118u].w, multiplyAddValue72, fma(fragmentVectorConstants1.packedValues[116u].w, multiplyAddValue70, multiplyAddValue71 * fragmentVectorConstants1.packedValues[117u].w)) + fragmentVectorConstants1.packedValues[119u].w;
                    float scalarValue50 = spvNMin(spvNMax(productValue28, fragmentScalarConstants1.packedValues[244u]), 1.0);
                    float multiplyAddValue106 = ((fma(fragmentVectorConstants1.packedValues[118u].z, multiplyAddValue72, fma(fragmentVectorConstants1.packedValues[116u].z, multiplyAddValue70, multiplyAddValue71 * fragmentVectorConstants1.packedValues[117u].z)) + fragmentVectorConstants1.packedValues[119u].z) / multiplyAddValue105) - (fma(fragmentScalarConstants1.packedValues[194u], sqrt(fma(-scalarValue50, scalarValue50, 1.0)) / scalarValue50, fragmentScalarConstants1.packedValues[193u]) / (multiplyAddValue105 / multiplyAddValue105));
                    float multiplyAddValue107 = fma((fma(fragmentVectorConstants1.packedValues[118u].x, multiplyAddValue72, fma(fragmentVectorConstants1.packedValues[116u].x, multiplyAddValue70, multiplyAddValue71 * fragmentVectorConstants1.packedValues[117u].x)) + fragmentVectorConstants1.packedValues[119u].x) / multiplyAddValue105, 0.5, 0.5);
                    float multiplyAddValue108 = 1.0 - fma((fma(fragmentVectorConstants1.packedValues[118u].y, multiplyAddValue72, fma(fragmentVectorConstants1.packedValues[116u].y, multiplyAddValue70, multiplyAddValue71 * fragmentVectorConstants1.packedValues[117u].y)) + fragmentVectorConstants1.packedValues[119u].y) / multiplyAddValue105, 0.5, 0.5);
                    uint clampedValue1 = uint(clamp(int(uint(int(fragmentScalarConstants1.packedValues[254u] + 0.5))), int(1u), int(9u)));
                    bool conditionValue8 = !comparisonValue28;
                    uint comparisonValue63 = (comparisonValue28 ? 1u : clampedValue1) >> 1u;
                    float scalarValue51 = rdDot4Precise(fragmentVectorConstants1.packedValues[78u], vec4(1.0));
                    float intermediateValue199;
                    intermediateValue199 = 0.0;
                    uint sumValue72;
                    float intermediateValue200;
                    uint scalarValue52 = 0u;
                    for (;;)
                    {
                        if ((comparisonValue28 && (int(scalarValue52) >= int(1u))) || (conditionValue8 && (int(clampedValue1) <= int(scalarValue52))))
                        {
                            break;
                        }
                        float sumValue35 = rdSignedBitsToFloat(scalarValue52 - comparisonValue63) + 0.5;
                        intermediateValue200 = intermediateValue199;
                        uint sumValue92;
                        float sampledTextureValue22;
                        uint scalarValue53 = 0u;
                        for (;;)
                        {
                            if ((comparisonValue28 && (int(scalarValue53) >= int(1u))) || (conditionValue8 && (int(clampedValue1) <= int(scalarValue53))))
                            {
                                break;
                            }
                            float multiplyAddValue109 = fma(multiplyAddValue107, fragmentScalarConstants1.packedValues[192u], ((rdSignedBitsToFloat(scalarValue53 - comparisonValue63) + 0.5) * fragmentScalarConstants1.packedValues[556u]) * fragmentScalarConstants1.packedValues[192u]);
                            float multiplyAddValue110 = fma(multiplyAddValue108, fragmentScalarConstants1.packedValues[192u], (sumValue35 * fragmentScalarConstants1.packedValues[556u]) * fragmentScalarConstants1.packedValues[192u]);
                            if (comparisonValue28)
                            {
                                sampledTextureValue22 = (textureLod(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue109, multiplyAddValue110, scalarValue51), 0.0).x >= multiplyAddValue106) ? (intermediateValue200 + 1.0) : intermediateValue200;
                            }
                            else
                            {
                                vec4 sampledTextureValue25 = textureGather(sampler2DArray(materialTexture8, textureSampler8), vec3(multiplyAddValue109, multiplyAddValue110, scalarValue51));
                                float multiplyAddValue111 = fract(fma(multiplyAddValue109, fragmentScalarConstants1.packedValues[558u], 0.5));
                                bool comparisonValue64 = sampledTextureValue25.x >= multiplyAddValue106;
                                bool comparisonValue65 = sampledTextureValue25.w >= multiplyAddValue106;
                                float comparisonValue66 = float(sampledTextureValue25.y >= multiplyAddValue106);
                                float comparisonValue67 = float(sampledTextureValue25.z >= multiplyAddValue106);
                                float multiplyAddValue112 = fma(multiplyAddValue111, comparisonValue65 ? (comparisonValue67 - 1.0) : comparisonValue67, float(comparisonValue65));
                                sampledTextureValue22 = intermediateValue200 + fma(fract(fma(multiplyAddValue110, fragmentScalarConstants1.packedValues[558u], 0.5)), fma(multiplyAddValue111, comparisonValue64 ? (comparisonValue66 - 1.0) : comparisonValue66, float(comparisonValue64)) - multiplyAddValue112, multiplyAddValue112);
                            }
                            sumValue92 = scalarValue53 + 1u;
                            intermediateValue200 = sampledTextureValue22;
                            scalarValue53 = sumValue92;
                            continue;
                        }
                        sumValue72 = scalarValue52 + 1u;
                        intermediateValue199 = intermediateValue200;
                        scalarValue52 = sumValue72;
                        continue;
                    }
                    float comparisonValue68 = intermediateValue199 / rdSignedBitsToFloat(comparisonValue28 ? 1u : (clampedValue1 * clampedValue1));
                    comparisonValue45 = (comparisonValue68 < 1.0) ? spvNMin(spvNMax(comparisonValue68, 1.0 - fragmentScalarConstants1.packedValues[255u]), 1.0) : 1.0;
                }
                else
                {
                    comparisonValue45 = 1.0;
                }
                float scalarValue54 = spvNMin(spvNMin(comparisonValue45, intermediateValue172), intermediateValue138);
                float productValue50 = spvNMax(fragmentScalarConstants1.packedValues[557u] - spvNMin(fragmentScalarConstants1.packedValues[557u] * 0.100000001490116119384765625, 8.0), 0.0);
                float quotientValue6 = spvNClamp((-(productValue50 + multiplyAddValue24)) * (1.0 / (fragmentScalarConstants1.packedValues[557u] - productValue50)), 0.0, 1.0);
                multiplyAddValue62 = fma((quotientValue6 * quotientValue6) * fma(quotientValue6, -2.0, 3.0), 1.0 - scalarValue54, scalarValue54);
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
                    uint scalarValue52 = 0u;
                    for (;;)
                    {
                        if ((comparisonValue194 && (int(scalarValue52) >= int(1u))) || (conditionValue34 && (int(clampedValue1) <= int(scalarValue52))))
                        {
                            break;
                        }
                        float sumValue229 = rdSignedBitsToFloat(scalarValue52 - comparisonValue206) + 0.5;
                        intermediateValue198 = intermediateValue197;
                        uint sumValue92;
                        float sampledTextureValue23;
                        uint scalarValue53 = 0u;
                        for (;;)
                        {
                            if ((conditionValue34 && (int(clampedValue1) <= int(scalarValue53))) || (comparisonValue194 && (int(scalarValue53) >= int(1u))))
                            {
                                break;
                            }
                            float multiplyAddValue309 = fma(multiplyAddValue307, fragmentScalarConstants1.packedValues[192u], ((rdSignedBitsToFloat(scalarValue53 - comparisonValue206) + 0.5) * fragmentScalarConstants1.packedValues[552u]) * fragmentScalarConstants1.packedValues[192u]);
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
                            sumValue92 = scalarValue53 + 1u;
                            intermediateValue198 = sampledTextureValue23;
                            scalarValue53 = sumValue92;
                            continue;
                        }
                        sumValue72 = scalarValue52 + 1u;
                        intermediateValue197 = intermediateValue198;
                        scalarValue52 = sumValue72;
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
                float quotientValue42 = spvNClamp((-(productValue325 + multiplyAddValue24)) * (1.0 / (fragmentScalarConstants1.packedValues[553u] - productValue325)), 0.0, 1.0);
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
            branchMergedValue23 = quotientValue35;
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
    if (comparisonValue176)
    {
        float productValue272 = (multiplyAddValue222 + 1.0) * 0.5;
        float productValue273 = (multiplyAddValue223 + 1.0) * 0.5;
        uint scalarValue167 = uint(int(fragmentVectorConstants1.packedValues[144u].z));
        float multiplyAddValue244 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue224, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue223, multiplyAddValue222 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue224, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue223, multiplyAddValue222 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[145u].x) / (fragmentVectorConstants1.packedValues[145u].y - fragmentVectorConstants1.packedValues[145u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue167))) + (-0.5);
        uint sumValue191 = uint(min(int(uint(max(int(uint(int(multiplyAddValue244))), int(0u)))), int(scalarValue167 + 4294967294u)));
        float scalarValue168 = float(int(sumValue191));
        float sumValue192 = spvNMin(spvNMax(multiplyAddValue244 - scalarValue168, 0.0), 1.0);
        vec4 sampledTextureValue88 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue272, productValue273, scalarValue168), 0.0);
        float scalarValue169 = sampledTextureValue88.x;
        float scalarValue170 = sampledTextureValue88.y;
        float scalarValue171 = sampledTextureValue88.z;
        float scalarValue172 = sampledTextureValue88.w;
        vec4 sampledTextureValue89 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue272, productValue273, float(int(sumValue191 + 1u))), 0.0);
        productValue106 = ((sampledTextureValue89.x - scalarValue169) * sumValue192) + scalarValue169;
        productValue107 = ((sampledTextureValue89.y - scalarValue170) * sumValue192) + scalarValue170;
        productValue108 = ((sampledTextureValue89.z - scalarValue171) * sumValue192) + scalarValue171;
        productValue109 = ((sampledTextureValue89.w - scalarValue172) * sumValue192) + scalarValue172;
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
        bool conditionValue25 = fragmentVectorConstants1.packedValues[136u].x > 0.0;
        float intermediateValue106;
        float intermediateValue107;
        float intermediateValue108;
        float multiplyAddValue35;
        float multiplyAddValue36;
        float multiplyAddValue37;
        if (fragmentVectorConstants1.packedValues[134u].w > 0.0)
        {
            intermediateValue106 = productValue191;
            intermediateValue107 = productValue192;
            intermediateValue108 = productValue193;
            multiplyAddValue35 = fma(fragmentVectorConstants1.packedValues[6u].x, productValue193, fma(fragmentVectorConstants1.packedValues[5u].x, productValue192, productValue191 * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x;
            multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[6u].y, productValue193, fma(fragmentVectorConstants1.packedValues[5u].y, productValue192, productValue191 * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y;
            multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[6u].z, productValue193, fma(fragmentVectorConstants1.packedValues[5u].z, productValue192, productValue191 * fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[7u].z;
        }
        else
        {
            intermediateValue106 = varyingTexCoord3.x;
            intermediateValue107 = varyingTexCoord3.y;
            intermediateValue108 = varyingTexCoord3.z;
            multiplyAddValue35 = multiplyAddValue217;
            multiplyAddValue36 = multiplyAddValue218;
            multiplyAddValue37 = multiplyAddValue219;
        }
        float sumValue193 = intermediateValue106 - fragmentVectorConstants1.packedValues[11u].x;
        float sumValue194 = intermediateValue107 - fragmentVectorConstants1.packedValues[11u].y;
        float sumValue195 = intermediateValue108 - fragmentVectorConstants1.packedValues[11u].z;
        float inverseLengthValue34 = inversesqrt(dot(vec3(sumValue193, sumValue194, sumValue195), vec3(sumValue193, sumValue194, sumValue195)));
        float productValue274 = inverseLengthValue34 * sumValue193;
        float productValue275 = inverseLengthValue34 * sumValue194;
        float productValue276 = inverseLengthValue34 * sumValue195;
        float inverseLengthValue35 = inversesqrt(dot(vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37), vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37)));
        float dotProductValue16 = dot(vec3(productValue274, productValue275, productValue276), vec3(productValue160, productValue161, productValue162)) * 2.0;
        float productValue277 = productValue274 - (dotProductValue16 * productValue160);
        float productValue278 = productValue275 - (dotProductValue16 * productValue161);
        float productValue279 = productValue276 - (dotProductValue16 * productValue162);
        float sumValue196 = 1.0 - intermediateValue16;
        float productValue280 = sumValue196 * sumValue196;
        float productValue281 = productValue280 * productValue280;
        precise float comparisonValue178 = 1.0 - ((uint(int(fragmentVectorConstants1.packedValues[114u].x)) == 1u) ? productValue280 : (productValue281 * productValue281));
        precise float productValue282 = (fragmentVectorConstants1.packedValues[132u].y + (-1.0)) * comparisonValue178;
        uint scalarValue173 = uint(int(fragmentVectorConstants1.packedValues[67u].x));
        vec4 sampledTextureValue90 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue277, productValue278, productValue279, float(int(scalarValue173))), productValue282);
        vec4 sampledTextureValue91 = textureLod(samplerCubeArray(specularIblRecordsTexture, specularIblRecordsSampler), vec4(productValue277, productValue278, productValue279, float(int(uint(int(scalarValue173 + 2u) - int(3u) * (int(scalarValue173 + 2u) / int(3u)))))), productValue282);
        float scalarValue174 = sampledTextureValue91.x;
        float scalarValue175 = sampledTextureValue91.y;
        float scalarValue176 = sampledTextureValue91.z;
        float productValue283 = ((sampledTextureValue90.x - scalarValue174) * fragmentVectorConstants1.packedValues[132u].w) + scalarValue174;
        float productValue284 = ((sampledTextureValue90.y - scalarValue175) * fragmentVectorConstants1.packedValues[132u].w) + scalarValue175;
        float productValue285 = ((sampledTextureValue90.z - scalarValue176) * fragmentVectorConstants1.packedValues[132u].w) + scalarValue176;
        float productValue286 = (((quotientValue25 * quotientValue25) * quotientValue25) * fragmentVectorConstants1.packedValues[132u].x) * fragmentVectorConstants1.packedValues[132u].z;
        float comparisonValue179 = (conditionValue25 ? (productValue283 * 301.72412109375) : productValue283) * productValue286;
        float comparisonValue180 = (conditionValue25 ? (productValue284 * 301.72412109375) : productValue284) * productValue286;
        float comparisonValue181 = (conditionValue25 ? (productValue285 * 301.72412109375) : productValue285) * productValue286;
        float comparisonValue31;
        float comparisonValue32;
        float comparisonValue33;
        if (comparisonValue175)
        {
            float productValue287 = fragmentVectorConstants1.packedValues[66u].x * fragmentVectorConstants1.packedValues[66u].w;
            float productValue288 = fragmentVectorConstants1.packedValues[66u].y * fragmentVectorConstants1.packedValues[66u].w;
            float productValue289 = fragmentVectorConstants1.packedValues[66u].z * fragmentVectorConstants1.packedValues[66u].w;
            float productValue290 = fragmentVectorConstants1.packedValues[58u].w * fragmentVectorConstants1.packedValues[74u].x;
            float productValue291 = productValue290 * intermediateValue23;
            float productValue292 = productValue290 * productValue29;
            float productValue293 = productValue290 * productValue30;
            float dotProductValue17 = spvNClamp(dot(vec3(productValue291, productValue292, productValue293), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
            float productValue294 = ((dotProductValue17 * (productValue291 - productValue287)) + productValue287) * intermediateValue17;
            float productValue295 = ((dotProductValue17 * (productValue292 - productValue288)) + productValue288) * intermediateValue17;
            float productValue296 = ((dotProductValue17 * (productValue293 - productValue289)) + productValue289) * intermediateValue17;
            float intermediateValue140;
            float intermediateValue141;
            float intermediateValue142;
            bool intermediateValue143;
            if (!(dot(vec3(comparisonValue179, comparisonValue180, comparisonValue181), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) >= dot(vec3(productValue294, productValue295, productValue296), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))))
            {
                intermediateValue140 = productValue294;
                intermediateValue141 = productValue295;
                intermediateValue142 = productValue296;
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
        float productValue272 = (multiplyAddValue222 + 1.0) * 0.5;
        float productValue273 = (multiplyAddValue223 + 1.0) * 0.5;
        uint scalarValue290 = uint(int(fragmentVectorConstants1.packedValues[143u].z));
        float multiplyAddValue408 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue224, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue223, multiplyAddValue222 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue224, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue223, multiplyAddValue222 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[144u].x) / (fragmentVectorConstants1.packedValues[144u].y - fragmentVectorConstants1.packedValues[144u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue290))) + (-0.5);
        uint sumValue308 = uint(min(int(uint(max(int(uint(int(multiplyAddValue408))), int(0u)))), int(scalarValue290 + 4294967294u)));
        float scalarValue291 = float(int(sumValue308));
        float sumValue309 = spvNMin(spvNMax(multiplyAddValue408 - scalarValue291, 0.0), 1.0);
        vec4 sampledTextureValue134 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue272, productValue273, scalarValue291), 0.0);
        float scalarValue292 = sampledTextureValue134.x;
        float scalarValue293 = sampledTextureValue134.y;
        float scalarValue294 = sampledTextureValue134.z;
        float scalarValue295 = sampledTextureValue134.w;
        vec4 sampledTextureValue135 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue272, productValue273, float(int(sumValue308 + 1u))), 0.0);
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
            multiplyAddValue35 = multiplyAddValue217;
            multiplyAddValue36 = multiplyAddValue218;
            multiplyAddValue37 = multiplyAddValue219;
        }
        float sumValue310 = intermediateValue101 - fragmentVectorConstants1.packedValues[11u].x;
        float sumValue311 = intermediateValue102 - fragmentVectorConstants1.packedValues[11u].y;
        float sumValue312 = intermediateValue103 - fragmentVectorConstants1.packedValues[11u].z;
        float inverseLengthValue48 = inversesqrt(dot(vec3(sumValue310, sumValue311, sumValue312), vec3(sumValue310, sumValue311, sumValue312)));
        float productValue443 = inverseLengthValue48 * sumValue310;
        float productValue444 = inverseLengthValue48 * sumValue311;
        float productValue445 = inverseLengthValue48 * sumValue312;
        float inverseLengthValue35 = inversesqrt(dot(vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37), vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37)));
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
            float multiplyAddValue113 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[229u])));
            float multiplyAddValue114 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[229u])));
            float multiplyAddValue115 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[229u])));
            vec3 vectorValue14 = vec3(multiplyAddValue113, multiplyAddValue114, multiplyAddValue115);
            float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue14, vectorValue14));
            float productValue51 = (exponentialValue3 * (fragmentScalarConstants1.packedValues[487u] * fragmentVectorConstants1.packedValues[121u].x)) * fragmentScalarConstants1.packedValues[256u];
            float productValue52 = (exponentialValue3 * (fragmentScalarConstants1.packedValues[487u] * fragmentVectorConstants1.packedValues[121u].y)) * fragmentScalarConstants1.packedValues[256u];
            float productValue53 = (exponentialValue3 * (fragmentScalarConstants1.packedValues[487u] * fragmentVectorConstants1.packedValues[121u].z)) * fragmentScalarConstants1.packedValues[256u];
            vec3 productValue57 = vec3(inverseLengthValue13 * multiplyAddValue113, inverseLengthValue13 * multiplyAddValue114, inverseLengthValue13 * multiplyAddValue115);
            float scalarValue55 = rdDot3Precise2(vectorValue12, productValue57);
            float scalarValue56 = spvNMax(scalarValue55, 0.0);
            float quotientValue7 = -(multiplyAddValue22 / sumValue23);
            float quotientValue8 = -(multiplyAddValue23 / sumValue23);
            float quotientValue9 = -(multiplyAddValue24 / sumValue23);
            vec3 vectorValue15 = vec3(quotientValue7, quotientValue8, quotientValue9);
            float scalarValue57 = spvNMax(rdDot3Precise2(vectorValue12, vectorValue15), 0.0);
            float sumValue36 = fragmentScalarConstants1.packedValues[565u] + 1.0;
            float productValue58 = sumValue36 * sumValue36;
            float multiplyAddValue116 = fma(productValue23, spvNMax((scalarValue55 + fragmentScalarConstants1.packedValues[565u]) / productValue58, 0.0) - scalarValue56, scalarValue56);
            float quotientValue10 = productValue23 * spvNMax((rdDot3Precise2(vec3(-multiplyAddValue30, -multiplyAddValue31, -multiplyAddValue32), productValue57) + fragmentScalarConstants1.packedValues[565u]) / productValue58, 0.0);
            float multiplyAddValue117 = fma(multiplyAddValue113, inverseLengthValue13, quotientValue7);
            float multiplyAddValue118 = fma(multiplyAddValue114, inverseLengthValue13, quotientValue8);
            float multiplyAddValue119 = fma(multiplyAddValue115, inverseLengthValue13, quotientValue9);
            vec3 vectorValue16 = vec3(multiplyAddValue117, multiplyAddValue118, multiplyAddValue119);
            float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue16, vectorValue16));
            float scalarValue58 = spvNMax(intermediateValue44, 0.0500000007450580596923828125);
            float productValue59 = scalarValue58 * scalarValue58;
            vec3 productValue60 = vec3(inverseLengthValue14 * multiplyAddValue117, inverseLengthValue14 * multiplyAddValue118, inverseLengthValue14 * multiplyAddValue119);
            float scalarValue59 = spvNMax(rdDot3Precise2(vectorValue12, productValue60), 0.0);
            float multiplyAddValue120 = fma(scalarValue59 * scalarValue59, fma(productValue59, productValue59, -1.0), 1.0);
            float quotientValue11 = (productValue59 * productValue59) / ((multiplyAddValue120 * multiplyAddValue120) * 3.1415927410125732421875);
            float productValue61 = productValue59 * 0.5;
            float multiplyAddValue121 = fma(-productValue59, 0.5, 1.0);
            float multiplyAddValue122 = (scalarValue56 / (fma(scalarValue56, multiplyAddValue121, productValue61) + 9.9999997473787516355514526367188e-05)) * (scalarValue57 / (fma(scalarValue57, multiplyAddValue121, productValue61) + 9.9999997473787516355514526367188e-05));
            float sumValue37 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue15, productValue60), 0.0), 0.0);
            float productValue62 = sumValue37 * sumValue37;
            float productValue63 = sumValue37 * (productValue62 * productValue62);
            float multiplyAddValue123 = fma(1.0 - multiplyAddValue63, productValue63, multiplyAddValue63);
            float multiplyAddValue124 = fma(1.0 - multiplyAddValue64, productValue63, multiplyAddValue64);
            float multiplyAddValue125 = fma(1.0 - multiplyAddValue66, productValue63, multiplyAddValue66);
            float productValue64 = (exponentialValue4 * sumValue22) * 0.3183098733425140380859375;
            float productValue66 = (exponentialValue5 * sumValue22) * 0.3183098733425140380859375;
            float productValue67 = (exponentialValue6 * sumValue22) * 0.3183098733425140380859375;
            float multiplyAddValue132 = fma(scalarValue56 * scalarValue57, 4.0, 9.9999997473787516355514526367188e-05);
            multiplyAddValue45 = (productValue51 * fma(productValue64 * (multiplyAddValue116 * (1.0 - multiplyAddValue123)), multiplyAddValue62, intermediateValue107 * (quotientValue10 * productValue64))) * fragmentScalarConstants1.packedValues[492u];
            multiplyAddValue44 = (productValue52 * fma(productValue66 * (multiplyAddValue116 * (1.0 - multiplyAddValue124)), multiplyAddValue62, intermediateValue107 * (quotientValue10 * productValue66))) * fragmentScalarConstants1.packedValues[492u];
            multiplyAddValue43 = (productValue53 * fma(productValue67 * (multiplyAddValue116 * (1.0 - multiplyAddValue125)), multiplyAddValue62, intermediateValue107 * (quotientValue10 * productValue67))) * fragmentScalarConstants1.packedValues[492u];
            quotientValue5 = (productValue51 * (multiplyAddValue62 * (scalarValue56 * ((multiplyAddValue122 * (quotientValue11 * multiplyAddValue123)) / multiplyAddValue132)))) * fragmentScalarConstants1.packedValues[493u];
            quotientValue4 = (productValue52 * (multiplyAddValue62 * (scalarValue56 * ((multiplyAddValue122 * (quotientValue11 * multiplyAddValue124)) / multiplyAddValue132)))) * fragmentScalarConstants1.packedValues[493u];
            quotientValue3 = (productValue53 * (multiplyAddValue62 * (scalarValue56 * ((multiplyAddValue122 * (quotientValue11 * multiplyAddValue125)) / multiplyAddValue132)))) * fragmentScalarConstants1.packedValues[493u];
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float multiplyAddValue113 = fma(fragmentVectorConstants1.packedValues[7u].x, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].x, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].x, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].x * fragmentScalarConstants1.packedValues[229u])));
            float multiplyAddValue114 = fma(fragmentVectorConstants1.packedValues[7u].y, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].y, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].y, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].y * fragmentScalarConstants1.packedValues[229u])));
            float multiplyAddValue115 = fma(fragmentVectorConstants1.packedValues[7u].z, fragmentScalarConstants1.packedValues[231u], fma(fragmentVectorConstants1.packedValues[6u].z, fragmentScalarConstants1.packedValues[230u], fma(fragmentVectorConstants1.packedValues[4u].z, fragmentScalarConstants1.packedValues[228u], fragmentVectorConstants1.packedValues[5u].z * fragmentScalarConstants1.packedValues[229u])));
            vec3 vectorValue14 = vec3(multiplyAddValue113, multiplyAddValue114, multiplyAddValue115);
            float inverseLengthValue13 = inversesqrt(rdDot3Precise2(vectorValue14, vectorValue14));
            float productValue326 = (exponentialValue * (fragmentScalarConstants1.packedValues[483u] * fragmentVectorConstants1.packedValues[120u].x)) * fragmentScalarConstants1.packedValues[256u];
            float productValue327 = (exponentialValue * (fragmentScalarConstants1.packedValues[483u] * fragmentVectorConstants1.packedValues[120u].y)) * fragmentScalarConstants1.packedValues[256u];
            float productValue328 = (exponentialValue * (fragmentScalarConstants1.packedValues[483u] * fragmentVectorConstants1.packedValues[120u].z)) * fragmentScalarConstants1.packedValues[256u];
            vec3 productValue57 = vec3(inverseLengthValue13 * multiplyAddValue113, inverseLengthValue13 * multiplyAddValue114, inverseLengthValue13 * multiplyAddValue115);
            float scalarValue214 = rdDot3Precise2(vectorValue25, productValue57);
            float scalarValue215 = spvNMax(scalarValue214, 0.0);
            float quotientValue7 = -(multiplyAddValue22 / sumValue23);
            float quotientValue8 = -(multiplyAddValue23 / sumValue23);
            float quotientValue9 = -(multiplyAddValue24 / sumValue23);
            vec3 vectorValue15 = vec3(quotientValue7, quotientValue8, quotientValue9);
            float scalarValue216 = spvNMax(rdDot3Precise2(vectorValue25, vectorValue15), 0.0);
            float sumValue230 = fragmentScalarConstants1.packedValues[561u] + 1.0;
            float productValue329 = sumValue230 * sumValue230;
            float multiplyAddValue313 = fma(productValue319, spvNMax((scalarValue214 + fragmentScalarConstants1.packedValues[561u]) / productValue329, 0.0) - scalarValue215, scalarValue215);
            float quotientValue43 = productValue319 * spvNMax((rdDot3Precise2(vec3(-multiplyAddValue264, -multiplyAddValue265, -multiplyAddValue266), productValue57) + fragmentScalarConstants1.packedValues[561u]) / productValue329, 0.0);
            float multiplyAddValue117 = fma(multiplyAddValue113, inverseLengthValue13, quotientValue7);
            float multiplyAddValue118 = fma(multiplyAddValue114, inverseLengthValue13, quotientValue8);
            float multiplyAddValue119 = fma(multiplyAddValue115, inverseLengthValue13, quotientValue9);
            vec3 vectorValue16 = vec3(multiplyAddValue117, multiplyAddValue118, multiplyAddValue119);
            float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue16, vectorValue16));
            float scalarValue217 = spvNMax(intermediateValue42, 0.0500000007450580596923828125);
            float productValue330 = scalarValue217 * scalarValue217;
            vec3 productValue60 = vec3(inverseLengthValue14 * multiplyAddValue117, inverseLengthValue14 * multiplyAddValue118, inverseLengthValue14 * multiplyAddValue119);
            float scalarValue218 = spvNMax(rdDot3Precise2(vectorValue25, productValue60), 0.0);
            float multiplyAddValue314 = fma(scalarValue218 * scalarValue218, fma(productValue330, productValue330, -1.0), 1.0);
            float quotientValue44 = (productValue330 * productValue330) / ((multiplyAddValue314 * multiplyAddValue314) * 3.1415927410125732421875);
            float productValue331 = productValue330 * 0.5;
            float multiplyAddValue315 = fma(-productValue330, 0.5, 1.0);
            float multiplyAddValue316 = (scalarValue215 / (fma(scalarValue215, multiplyAddValue315, productValue331) + 9.9999997473787516355514526367188e-05)) * (scalarValue216 / (fma(scalarValue216, multiplyAddValue315, productValue331) + 9.9999997473787516355514526367188e-05));
            float sumValue37 = spvNMax(1.0 - spvNMax(rdDot3Precise2(vectorValue15, productValue60), 0.0), 0.0);
            float productValue62 = sumValue37 * sumValue37;
            float productValue63 = sumValue37 * (productValue62 * productValue62);
            float multiplyAddValue317 = fma(1.0 - multiplyAddValue275, productValue63, multiplyAddValue275);
            float multiplyAddValue318 = fma(1.0 - multiplyAddValue276, productValue63, multiplyAddValue276);
            float multiplyAddValue319 = fma(1.0 - multiplyAddValue277, productValue63, multiplyAddValue277);
            float productValue332 = (multiplyAddValue249 * sumValue130) * 0.3183098733425140380859375;
            float productValue333 = (multiplyAddValue250 * sumValue130) * 0.3183098733425140380859375;
            float productValue334 = (multiplyAddValue251 * sumValue130) * 0.3183098733425140380859375;
            float multiplyAddValue320 = fma(scalarValue215 * scalarValue216, 4.0, 9.9999997473787516355514526367188e-05);
            multiplyAddValue48 = (productValue326 * fma(productValue332 * (multiplyAddValue313 * (1.0 - multiplyAddValue317)), multiplyAddValue65, intermediateValue105 * (quotientValue43 * productValue332))) * fragmentScalarConstants1.packedValues[488u];
            multiplyAddValue47 = (productValue327 * fma(productValue333 * (multiplyAddValue313 * (1.0 - multiplyAddValue318)), multiplyAddValue65, intermediateValue105 * (quotientValue43 * productValue333))) * fragmentScalarConstants1.packedValues[488u];
            multiplyAddValue46 = (productValue328 * fma(productValue334 * (multiplyAddValue313 * (1.0 - multiplyAddValue319)), multiplyAddValue65, intermediateValue105 * (quotientValue43 * productValue334))) * fragmentScalarConstants1.packedValues[488u];
            quotientValue5 = (productValue326 * (multiplyAddValue65 * (scalarValue215 * ((multiplyAddValue316 * (quotientValue44 * multiplyAddValue317)) / multiplyAddValue320)))) * fragmentScalarConstants1.packedValues[489u];
            quotientValue4 = (productValue327 * (multiplyAddValue65 * (scalarValue215 * ((multiplyAddValue316 * (quotientValue44 * multiplyAddValue318)) / multiplyAddValue320)))) * fragmentScalarConstants1.packedValues[489u];
            quotientValue3 = (productValue328 * (multiplyAddValue65 * (scalarValue215 * ((multiplyAddValue316 * (quotientValue44 * multiplyAddValue319)) / multiplyAddValue320)))) * fragmentScalarConstants1.packedValues[489u];
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            comparisonValue31 = intermediateValue143 ? intermediateValue140 : comparisonValue179;
            comparisonValue32 = intermediateValue143 ? intermediateValue141 : comparisonValue180;
            comparisonValue33 = intermediateValue143 ? intermediateValue142 : comparisonValue181;
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
            comparisonValue31 = comparisonValue179;
            comparisonValue32 = comparisonValue180;
            comparisonValue33 = comparisonValue181;
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
        vec4 sampledTextureValue92 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue225, multiplyAddValue226, multiplyAddValue227), vec3((-0.0) - (multiplyAddValue35 * inverseLengthValue35), (-0.0) - (multiplyAddValue36 * inverseLengthValue35), (-0.0) - (multiplyAddValue37 * inverseLengthValue35))), 0.0, 1.0), sumValue196));
        float scalarValue177 = sampledTextureValue92.x;
        float scalarValue178 = sampledTextureValue92.y;
        float quotientValue38 = (fragmentVectorConstants1.packedValues[138u].x - fragmentVectorConstants1.packedValues[68u].x) + (nonlinearValue4 / fragmentVectorConstants1.packedValues[68u].z);
        float comparisonValue182 = 1.0 - spvNClamp(comparisonValue177 ? (quotientValue38 * fragmentVectorConstants1.packedValues[68u].y) : (quotientValue38 / (fragmentVectorConstants1.packedValues[68u].y - fragmentVectorConstants1.packedValues[68u].x)), 0.0, 1.0);
        float productValue297 = (((scalarValue177 * productValue196) + scalarValue178) * comparisonValue31) * comparisonValue182;
        float productValue298 = (((scalarValue177 * productValue197) + scalarValue178) * comparisonValue32) * comparisonValue182;
        float productValue299 = (((scalarValue177 * productValue198) + scalarValue178) * comparisonValue33) * comparisonValue182;
        float branchMergedValue13;
        float branchMergedValue24;
        float branchMergedValue25;
        if (comparisonValue176)
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue138 = texture(sampler2D(brdfLutTexture, brdfLutSampler), vec2(spvNClamp(dot(vec3(multiplyAddValue395, multiplyAddValue396, multiplyAddValue397), vec3((-0.0) - (multiplyAddValue35 * inverseLengthValue35), (-0.0) - (multiplyAddValue36 * inverseLengthValue35), (-0.0) - (multiplyAddValue37 * inverseLengthValue35))), 0.0, 1.0), sumValue313));
        float scalarValue300 = sampledTextureValue138.x;
        float scalarValue301 = sampledTextureValue138.y;
        float quotientValue66 = (fragmentVectorConstants1.packedValues[137u].x - fragmentVectorConstants1.packedValues[67u].x) + (nonlinearValue4 / fragmentVectorConstants1.packedValues[67u].z);
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
            float multiplyAddValue133 = fma(productValue7, 0.20000000298023223876953125, sumValue19 - 0.5);
            float multiplyAddValue134 = fma(productValue8, 0.20000000298023223876953125, sumValue20 - 0.5);
            float multiplyAddValue135 = fma(productValue9, 0.20000000298023223876953125, sumValue21 - 0.5);
            uint productValue69 = uint(int(floor(floor(multiplyAddValue133) * 0.0625)));
            uint productValue70 = uint(int(floor(floor(multiplyAddValue134) * 0.0625)));
            uint productValue82 = uint(int(floor(floor(multiplyAddValue135) * 0.0625)));
            uint scalarValue60 = bitfieldInsert(productValue69, productValue70, int(16u), int(16u));
            uint bitwiseValue3 = productValue82 & 65535u;
            uint productValue83 = productValue69 * 1540483477u;
            uint productValue84 = productValue70 * 1540483477u;
            uint productValue85 = productValue82 * 1540483477u;
            uint bitwiseValue4 = (((((productValue84 ^ (productValue84 >> 24u)) * 1540483477u) ^ ((((productValue83 ^ (productValue83 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u) ^ ((productValue85 ^ (productValue85 >> 24u)) * 1540483477u)) * 1540483477u;
            uint bitwiseValue5 = ((bitwiseValue4 >> 13u) ^ bitwiseValue4) * 1540483477u;
            uint bitwiseValue6 = bitwiseValue5 ^ (bitwiseValue5 >> 15u);
            uint bitwiseValue8 = (bitwiseValue6 ^ (bitwiseValue6 >> 16u)) & 65535u;
            bool comparisonValue69 = bitwiseValue8 != 0u;
            uint bitwiseValue9 = bitwiseValue8 | 1u;
            uint sumValue38 = uint(fragmentScalarConstants1.packedValues[236u]) - 1u;
            uint comparisonValue70 = (comparisonValue69 ? bitwiseValue8 : bitwiseValue9) & sumValue38;
            uint comparisonValue26;
            uint comparisonValue27;
            uint bitwiseValue7;
            uint sumValue34;
            uint intermediateValue170;
            uint intermediateValue171;
            uint scalarValue61 = 0u;
            uint scalarValue62 = 0u;
            uint scalarValue63 = comparisonValue70;
            uint scalarValue64 = 0u;
            for (;;)
            {
                if (int(scalarValue64) >= int(8u))
                {
                    intermediateValue170 = scalarValue62;
                    intermediateValue171 = scalarValue61;
                    break;
                }
                uint bitwiseValue11 = intermediateValue7.packedValues[scalarValue63].z & 65535u;
                bool comparisonValue96 = (bitwiseValue3 == intermediateValue7.packedValues[scalarValue63].y) && ((((bitwiseValue9 == bitwiseValue11) && (!comparisonValue69)) || (comparisonValue69 && (bitwiseValue8 == bitwiseValue11))) && (scalarValue60 == intermediateValue7.packedValues[scalarValue63].x));
                bool comparisonValue97 = scalarValue61 != 0u;
                comparisonValue27 = (comparisonValue97 || (!comparisonValue96)) ? scalarValue62 : intermediateValue7.packedValues[scalarValue63].w;
                comparisonValue26 = comparisonValue96 ? 4294967295u : scalarValue61;
                bitwiseValue7 = sumValue38 & (scalarValue63 + 1u);
                bool comparisonValue98 = (bitwiseValue11 == 0u) || comparisonValue96;
                if (comparisonValue98 || (comparisonValue97 && (!comparisonValue98)))
                {
                    intermediateValue170 = comparisonValue27;
                    intermediateValue171 = comparisonValue26;
                    break;
                }
                sumValue34 = scalarValue64 + 1u;
                scalarValue61 = comparisonValue26;
                scalarValue62 = comparisonValue27;
                scalarValue63 = bitwiseValue7;
                scalarValue64 = sumValue34;
                continue;
            }
            float intermediateValue119;
            float intermediateValue121;
            float intermediateValue123;
            if (intermediateValue171 != 0u)
            {
                float productValue86 = floor(multiplyAddValue133 * 0.0625);
                float productValue87 = floor(multiplyAddValue134 * 0.0625);
                float productValue88 = floor(multiplyAddValue135 * 0.0625);
                float multiplyAddValue136 = fma(-productValue86, 16.0, multiplyAddValue133);
                float multiplyAddValue137 = fma(-productValue87, 16.0, multiplyAddValue134);
                float multiplyAddValue138 = fma(-productValue88, 16.0, multiplyAddValue135);
                uint bitwiseValue12 = intermediateValue170 >> 2u;
                float scalarValue65 = abs(productValue7);
                float scalarValue66 = abs(productValue8);
                float scalarValue67 = abs(productValue9);
                float multiplyAddValue126;
                float multiplyAddValue127;
                float multiplyAddValue128;
                if (((scalarValue65 >= 1.0) || (scalarValue66 >= 1.0)) || (scalarValue67 >= 1.0))
                {
                    vec3 vectorValue17 = vec3(scalarValue65, scalarValue66, scalarValue67);
                    float scalarValue68 = rdDot3Precise2(vec3(multiplyAddValue136, multiplyAddValue137, multiplyAddValue138), vectorValue17);
                    float scalarValue69 = rdDot3Precise2(vec3(multiplyAddValue137, multiplyAddValue138, multiplyAddValue136), vectorValue17);
                    float scalarValue70 = rdDot3Precise2(vec3(multiplyAddValue138, multiplyAddValue136, multiplyAddValue137), vectorValue17);
                    float multiplyAddValue139 = (fma(multiplyAddValue3, inverseLengthValue6, productValue8 + productValue7) > 0.0) ? ceil(scalarValue68) : floor(scalarValue68);
                    float scalarValue71 = floor(scalarValue69);
                    float scalarValue72 = floor(scalarValue70);
                    float multiplyAddValue140 = fma(scalarValue66, scalarValue72, fma(scalarValue65, multiplyAddValue139, scalarValue71 * scalarValue67));
                    float multiplyAddValue141 = fma(scalarValue67, scalarValue72, fma(scalarValue66, multiplyAddValue139, scalarValue71 * scalarValue65));
                    float multiplyAddValue142 = fma(scalarValue65, scalarValue72, fma(scalarValue67, multiplyAddValue139, scalarValue71 * scalarValue66));
                    float sumValue39 = scalarValue67 + multiplyAddValue140;
                    float sumValue40 = scalarValue65 + multiplyAddValue141;
                    float sumValue41 = scalarValue66 + multiplyAddValue142;
                    float sumValue42 = scalarValue66 + multiplyAddValue140;
                    float sumValue52 = scalarValue67 + multiplyAddValue141;
                    float sumValue53 = scalarValue65 + multiplyAddValue142;
                    float sumValue54 = scalarValue66 + sumValue39;
                    float sumValue55 = scalarValue67 + sumValue40;
                    float sumValue56 = scalarValue65 + sumValue41;
                    float sumValue57 = scalarValue69 - scalarValue71;
                    float sumValue58 = scalarValue70 - scalarValue72;
                    float sumValue65 = (scalarValue71 - scalarValue69) + 1.0;
                    float sumValue66 = (scalarValue72 - scalarValue70) + 1.0;
                    float productValue89 = sumValue65 * sumValue66;
                    float productValue90 = sumValue57 * sumValue66;
                    float productValue91 = sumValue58 * sumValue65;
                    float productValue92 = sumValue57 * sumValue58;
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
                    if (((sumValue56 < 16.0) && ((sumValue54 < 16.0) && (sumValue55 < 16.0))) && (((multiplyAddValue140 >= 0.0) && (multiplyAddValue141 >= 0.0)) && (multiplyAddValue142 >= 0.0)))
                    {
                        uint bitwiseValue14 = bitwiseValue12 + (((uint(multiplyAddValue142) << 4u) + uint(multiplyAddValue141)) + (uint(multiplyAddValue140) << 8u));
                        float bitwiseValue16 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue14] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue99 = intermediateValue11.packedValues[bitwiseValue14] != 0u;
                        uint bitwiseValue18 = bitwiseValue12 + (((uint(sumValue41) << 4u) + uint(sumValue40)) + (uint(sumValue39) << 8u));
                        float bitwiseValue20 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue18] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue100 = intermediateValue11.packedValues[bitwiseValue18] != 0u;
                        uint bitwiseValue22 = bitwiseValue12 + (((uint(sumValue53) << 4u) + uint(sumValue52)) + (uint(sumValue42) << 8u));
                        float bitwiseValue23 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue22] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue101 = intermediateValue11.packedValues[bitwiseValue22] != 0u;
                        uint bitwiseValue25 = bitwiseValue12 + (((uint(sumValue56) << 4u) + uint(sumValue55)) + (uint(sumValue54) << 8u));
                        float bitwiseValue26 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue25] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue102 = intermediateValue11.packedValues[bitwiseValue25] != 0u;
                        comparisonValue72 = comparisonValue102 ? ((bitwiseValue26 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue25] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue73 = comparisonValue102 ? ((bitwiseValue26 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue25] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue74 = comparisonValue102 ? ((bitwiseValue26 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue25] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue75 = comparisonValue101 ? ((bitwiseValue23 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue22] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue76 = comparisonValue101 ? ((bitwiseValue23 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue22] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue77 = comparisonValue101 ? ((bitwiseValue23 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue22] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue78 = comparisonValue99 ? ((bitwiseValue16 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue14] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue79 = comparisonValue99 ? ((bitwiseValue16 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue14] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue80 = comparisonValue99 ? ((bitwiseValue16 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue14] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue81 = comparisonValue100 ? ((bitwiseValue20 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue18] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue82 = comparisonValue100 ? ((bitwiseValue20 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue18] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue83 = comparisonValue100 ? ((bitwiseValue20 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue18] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    else
                    {
                        float multiplyAddValue143 = fma(productValue86, 16.0, multiplyAddValue140);
                        float multiplyAddValue144 = fma(productValue87, 16.0, multiplyAddValue141);
                        float multiplyAddValue145 = fma(productValue88, 16.0, multiplyAddValue142);
                        uint comparisonValue103 = min((((((bitfieldInsert(bitfieldInsert(0u, (multiplyAddValue140 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (multiplyAddValue140 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (multiplyAddValue141 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue141 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue142 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (multiplyAddValue142 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue9 = int(intermediateValue21[comparisonValue103].x) < int(0u);
                        uint sumValue67 = bitwiseValue12 + 4097u;
                        uint sumValue68 = bitwiseValue12 + 4096u;
                        uint multiplyAddValue146 = conditionValue9 ? (bitwiseValue12 + (bitfieldInsert(bitfieldInsert(0u, uint(multiplyAddValue142), int(4u), int(4u)), uint(multiplyAddValue141), int(0u), int(4u)) + bitfieldInsert(0u, uint(multiplyAddValue140), int(8u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue103].x + sumValue67] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue145 * 0.0625), 16.0, multiplyAddValue145)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue144 * 0.0625), 16.0, multiplyAddValue144)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue143 * 0.0625), 16.0, multiplyAddValue143)), int(8u), int(4u))));
                        float bitwiseValue27 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue146] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue104 = (conditionValue9 || (((1u << (intermediateValue21[comparisonValue103].x & 31u)) & intermediateValue11.packedValues[sumValue68]) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue146] != 0u);
                        float multiplyAddValue147 = fma(productValue86, 16.0, sumValue39);
                        float multiplyAddValue148 = fma(productValue87, 16.0, sumValue40);
                        float multiplyAddValue149 = fma(productValue88, 16.0, sumValue41);
                        uint comparisonValue105 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue39 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue39 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue40 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue40 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue41 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue41 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue10 = int(intermediateValue21[comparisonValue105].x) < int(0u);
                        uint multiplyAddValue150 = conditionValue10 ? (bitwiseValue12 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue41), int(4u), int(4u)), uint(sumValue40), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue39), int(8u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue105].x + sumValue67] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue149 * 0.0625), 16.0, multiplyAddValue149)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue148 * 0.0625), 16.0, multiplyAddValue148)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue147 * 0.0625), 16.0, multiplyAddValue147)), int(8u), int(4u))));
                        float bitwiseValue28 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue150] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue106 = (conditionValue10 || (((1u << (intermediateValue21[comparisonValue105].x & 31u)) & intermediateValue11.packedValues[sumValue68]) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue150] != 0u);
                        float multiplyAddValue151 = fma(productValue86, 16.0, sumValue42);
                        float multiplyAddValue152 = fma(productValue87, 16.0, sumValue52);
                        float multiplyAddValue153 = fma(productValue88, 16.0, sumValue53);
                        uint comparisonValue107 = min((((((bitfieldInsert(bitfieldInsert(0u, (sumValue42 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue42 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue52 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (sumValue52 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (sumValue53 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (sumValue53 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue11 = int(intermediateValue21[comparisonValue107].x) < int(0u);
                        uint multiplyAddValue154 = conditionValue11 ? (bitwiseValue12 + (bitfieldInsert(bitfieldInsert(0u, uint(sumValue53), int(4u), int(4u)), uint(sumValue52), int(0u), int(4u)) + bitfieldInsert(0u, uint(sumValue42), int(8u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue107].x + sumValue67] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue153 * 0.0625), 16.0, multiplyAddValue153)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue152 * 0.0625), 16.0, multiplyAddValue152)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue151 * 0.0625), 16.0, multiplyAddValue151)), int(8u), int(4u))));
                        float bitwiseValue29 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue154] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue108 = (conditionValue11 || (((1u << (intermediateValue21[comparisonValue107].x & 31u)) & intermediateValue11.packedValues[sumValue68]) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue154] != 0u);
                        float multiplyAddValue155 = fma(productValue86, 16.0, sumValue54);
                        float multiplyAddValue156 = fma(productValue87, 16.0, sumValue55);
                        float multiplyAddValue157 = fma(productValue88, 16.0, sumValue56);
                        uint comparisonValue109 = min(((bitfieldInsert(0u, (sumValue56 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue56 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue55 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue54 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue54 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue55 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue12 = int(intermediateValue21[comparisonValue109].x) < int(0u);
                        uint multiplyAddValue158 = conditionValue12 ? (bitwiseValue12 + (bitfieldInsert(0u, uint(sumValue54), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue56), int(4u), int(4u)), uint(sumValue55), int(0u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue109].x + sumValue67] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue155 * 0.0625), 16.0, multiplyAddValue155)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue157 * 0.0625), 16.0, multiplyAddValue157)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue156 * 0.0625), 16.0, multiplyAddValue156)), int(0u), int(4u))));
                        float bitwiseValue30 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue158] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue110 = (conditionValue12 || (((1u << (intermediateValue21[comparisonValue109].x & 31u)) & intermediateValue11.packedValues[sumValue68]) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue158] != 0u);
                        comparisonValue72 = comparisonValue110 ? ((bitwiseValue30 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue158] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue73 = comparisonValue110 ? ((bitwiseValue30 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue158] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue74 = comparisonValue110 ? ((bitwiseValue30 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue158] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue75 = comparisonValue108 ? ((bitwiseValue29 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue154] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue76 = comparisonValue108 ? ((bitwiseValue29 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue154] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue77 = comparisonValue108 ? ((bitwiseValue29 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue154] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue78 = comparisonValue104 ? ((bitwiseValue27 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue146] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue79 = comparisonValue104 ? ((bitwiseValue27 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue146] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue80 = comparisonValue104 ? ((bitwiseValue27 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue146] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue81 = comparisonValue106 ? ((bitwiseValue28 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue150] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue82 = comparisonValue106 ? ((bitwiseValue28 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue150] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue83 = comparisonValue106 ? ((bitwiseValue28 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue150] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    multiplyAddValue126 = fma(comparisonValue74, productValue92, fma(comparisonValue77, productValue91, fma(comparisonValue80, productValue89, productValue90 * comparisonValue83)));
                    multiplyAddValue127 = fma(comparisonValue73, productValue92, fma(comparisonValue76, productValue91, fma(comparisonValue79, productValue89, productValue90 * comparisonValue82)));
                    multiplyAddValue128 = fma(comparisonValue72, productValue92, fma(comparisonValue75, productValue91, fma(comparisonValue78, productValue89, productValue90 * comparisonValue81)));
                }
                else
                {
                    float scalarValue73 = floor(multiplyAddValue136);
                    float scalarValue74 = floor(multiplyAddValue137);
                    float scalarValue75 = floor(multiplyAddValue138);
                    float sumValue70 = multiplyAddValue136 - scalarValue73;
                    float sumValue75 = multiplyAddValue137 - scalarValue74;
                    float sumValue85 = multiplyAddValue138 - scalarValue75;
                    uint comparisonValue111 = bitfieldInsert(bitfieldInsert(0u, (sumValue75 >= sumValue85) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue70 >= sumValue75) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue70 >= sumValue85) ? 4294967295u : 0u, int(2u), int(1u));
                    float scalarValue76 = spvNMin(sumValue75, sumValue70);
                    float scalarValue77 = spvNMax(sumValue75, sumValue70);
                    float scalarValue78 = spvNMin(sumValue85, scalarValue76);
                    float scalarValue79 = spvNMax(sumValue85, scalarValue77);
                    float scalarValue80 = spvNMax(scalarValue76, spvNMin(sumValue85, scalarValue77));
                    float sumValue86 = 1.0 - scalarValue79;
                    float sumValue87 = scalarValue79 - scalarValue80;
                    float sumValue89 = scalarValue80 - scalarValue78;
                    float sumValue90 = scalarValue73 + 1.0;
                    float sumValue99 = scalarValue74 + 1.0;
                    float sumValue100 = scalarValue75 + 1.0;
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
                    if (((sumValue100 < 16.0) && ((sumValue90 < 16.0) && (sumValue99 < 16.0))) && (((scalarValue73 >= 0.0) && (scalarValue74 >= 0.0)) && (scalarValue75 >= 0.0)))
                    {
                        uint scalarValue81 = uint(scalarValue73);
                        uint scalarValue82 = uint(scalarValue74);
                        uint scalarValue83 = uint(scalarValue75);
                        uint sumValue108 = min((comparisonValue111 + 4u), 68u);
                        uint sumValue109 = min((comparisonValue111 + 12u), 68u);
                        uint bitwiseValue31 = bitwiseValue12 + (((scalarValue83 << 4u) + scalarValue82) + (scalarValue81 << 8u));
                        float bitwiseValue32 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue31] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue112 = intermediateValue11.packedValues[bitwiseValue31] != 0u;
                        uint bitwiseValue33 = bitwiseValue12 + ((((uint(comparisonValue111 < 2u) + scalarValue83) << 4u) + (intermediateValue21[sumValue108].z + scalarValue82)) + ((intermediateValue21[sumValue108].y + scalarValue81) << 8u));
                        float bitwiseValue34 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue33] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue113 = intermediateValue11.packedValues[bitwiseValue33] != 0u;
                        uint bitwiseValue35 = bitwiseValue12 + ((((uint(comparisonValue111 < 6u) + scalarValue83) << 4u) + (intermediateValue21[sumValue109].z + scalarValue82)) + ((intermediateValue21[sumValue109].y + scalarValue81) << 8u));
                        float bitwiseValue36 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue35] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue114 = intermediateValue11.packedValues[bitwiseValue35] != 0u;
                        uint bitwiseValue37 = bitwiseValue12 + ((((scalarValue83 + 1u) << 4u) + (scalarValue82 + 1u)) + ((scalarValue81 + 1u) << 8u));
                        float bitwiseValue38 = rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue37] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue115 = intermediateValue11.packedValues[bitwiseValue37] != 0u;
                        comparisonValue84 = comparisonValue115 ? ((bitwiseValue38 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue37] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue85 = comparisonValue115 ? ((bitwiseValue38 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue37] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue86 = comparisonValue115 ? ((bitwiseValue38 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue37] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue87 = comparisonValue114 ? ((bitwiseValue36 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue35] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue88 = comparisonValue114 ? ((bitwiseValue36 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue35] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue89 = comparisonValue114 ? ((bitwiseValue36 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue35] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue90 = comparisonValue112 ? ((bitwiseValue32 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue31] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue91 = comparisonValue112 ? ((bitwiseValue32 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue31] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue92 = comparisonValue112 ? ((bitwiseValue32 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue31] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue93 = comparisonValue113 ? ((bitwiseValue34 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue33] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue94 = comparisonValue113 ? ((bitwiseValue34 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[bitwiseValue33] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue95 = comparisonValue113 ? ((bitwiseValue34 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[bitwiseValue33] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    else
                    {
                        uint sumValue110 = min((comparisonValue111 + 4u), 68u);
                        float sumValue111 = scalarValue73 + rdEvaluateFloatExpression(intermediateValue21[sumValue110].y);
                        float sumValue112 = scalarValue74 + rdEvaluateFloatExpression(intermediateValue21[sumValue110].z);
                        float sumValue113 = scalarValue75 + rdEvaluateFloatExpression(uint(comparisonValue111 < 2u));
                        uint sumValue114 = min((comparisonValue111 + 12u), 68u);
                        float sumValue115 = scalarValue73 + rdEvaluateFloatExpression(intermediateValue21[sumValue114].y);
                        float sumValue116 = scalarValue74 + rdEvaluateFloatExpression(intermediateValue21[sumValue114].z);
                        float sumValue117 = scalarValue75 + rdEvaluateFloatExpression(uint(comparisonValue111 < 6u));
                        float multiplyAddValue159 = fma(productValue86, 16.0, scalarValue73);
                        float multiplyAddValue160 = fma(productValue87, 16.0, scalarValue74);
                        float multiplyAddValue161 = fma(productValue88, 16.0, scalarValue75);
                        uint comparisonValue116 = min((((((bitfieldInsert(bitfieldInsert(0u, (scalarValue73 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (scalarValue73 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (scalarValue74 < 0.0) ? 4294967295u : 0u, int(2u), int(1u))) + bitfieldInsert(0u, (scalarValue74 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u))) + bitfieldInsert(0u, (scalarValue75 < 0.0) ? 4294967295u : 0u, int(4u), int(1u))) + bitfieldInsert(0u, (scalarValue75 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u))) + 4u), 68u);
                        bool conditionValue13 = int(intermediateValue21[comparisonValue116].x) < int(0u);
                        uint sumValue118 = bitwiseValue12 + 4097u;
                        uint sumValue119 = bitwiseValue12 + 4096u;
                        uint multiplyAddValue162 = conditionValue13 ? (bitwiseValue12 + (bitfieldInsert(bitfieldInsert(0u, uint(scalarValue75), int(4u), int(4u)), uint(scalarValue74), int(0u), int(4u)) + bitfieldInsert(0u, uint(scalarValue73), int(8u), int(4u)))) : ((intermediateValue11.packedValues[sumValue118 + intermediateValue21[comparisonValue116].x] >> 2u) + (bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue161 * 0.0625), 16.0, multiplyAddValue161)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue160 * 0.0625), 16.0, multiplyAddValue160)), int(0u), int(4u)) + bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue159 * 0.0625), 16.0, multiplyAddValue159)), int(8u), int(4u))));
                        float bitwiseValue39 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue162] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue117 = (conditionValue13 || ((intermediateValue11.packedValues[sumValue119] & (1u << (intermediateValue21[comparisonValue116].x & 31u))) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue162] != 0u);
                        float multiplyAddValue163 = fma(productValue86, 16.0, sumValue111);
                        float multiplyAddValue164 = fma(productValue87, 16.0, sumValue112);
                        float multiplyAddValue165 = fma(productValue88, 16.0, sumValue113);
                        uint comparisonValue118 = min(((bitfieldInsert(0u, (sumValue113 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue113 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue112 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue111 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue111 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue112 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue14 = int(intermediateValue21[comparisonValue118].x) < int(0u);
                        uint multiplyAddValue166 = conditionValue14 ? (bitwiseValue12 + (bitfieldInsert(0u, uint(sumValue111), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue113), int(4u), int(4u)), uint(sumValue112), int(0u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue118].x + sumValue118] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue163 * 0.0625), 16.0, multiplyAddValue163)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue165 * 0.0625), 16.0, multiplyAddValue165)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue164 * 0.0625), 16.0, multiplyAddValue164)), int(0u), int(4u))));
                        float bitwiseValue40 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue166] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue119 = (conditionValue14 || ((intermediateValue11.packedValues[sumValue119] & (1u << (intermediateValue21[comparisonValue118].x & 31u))) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue166] != 0u);
                        float multiplyAddValue167 = fma(productValue86, 16.0, sumValue115);
                        float multiplyAddValue168 = fma(productValue87, 16.0, sumValue116);
                        float multiplyAddValue169 = fma(productValue88, 16.0, sumValue117);
                        uint comparisonValue120 = min(((bitfieldInsert(0u, (sumValue117 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue117 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue116 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue115 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue115 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue116 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue15 = int(intermediateValue21[comparisonValue120].x) < int(0u);
                        uint multiplyAddValue170 = conditionValue15 ? (bitwiseValue12 + (bitfieldInsert(0u, uint(sumValue115), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue117), int(4u), int(4u)), uint(sumValue116), int(0u), int(4u)))) : ((intermediateValue11.packedValues[sumValue118 + intermediateValue21[comparisonValue120].x] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue167 * 0.0625), 16.0, multiplyAddValue167)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue169 * 0.0625), 16.0, multiplyAddValue169)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue168 * 0.0625), 16.0, multiplyAddValue168)), int(0u), int(4u))));
                        float bitwiseValue41 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue170] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue121 = (conditionValue15 || ((intermediateValue11.packedValues[sumValue119] & (1u << (intermediateValue21[comparisonValue120].x & 31u))) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue170] != 0u);
                        float multiplyAddValue171 = fma(productValue86, 16.0, sumValue90);
                        float multiplyAddValue172 = fma(productValue87, 16.0, sumValue99);
                        float multiplyAddValue173 = fma(productValue88, 16.0, sumValue100);
                        uint comparisonValue122 = min(((bitfieldInsert(0u, (sumValue100 >= 16.0) ? 4294967295u : 0u, int(5u), int(1u)) + (bitfieldInsert(0u, (sumValue100 < 0.0) ? 4294967295u : 0u, int(4u), int(1u)) + (bitfieldInsert(0u, (sumValue99 >= 16.0) ? 4294967295u : 0u, int(3u), int(1u)) + (bitfieldInsert(bitfieldInsert(0u, (sumValue90 >= 16.0) ? 4294967295u : 0u, int(1u), int(1u)), (sumValue90 < 0.0) ? 4294967295u : 0u, int(0u), int(1u)) + bitfieldInsert(0u, (sumValue99 < 0.0) ? 4294967295u : 0u, int(2u), int(1u)))))) + 4u), 68u);
                        bool conditionValue16 = int(intermediateValue21[comparisonValue122].x) < int(0u);
                        uint multiplyAddValue174 = conditionValue16 ? (bitwiseValue12 + (bitfieldInsert(0u, uint(sumValue90), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(sumValue100), int(4u), int(4u)), uint(sumValue99), int(0u), int(4u)))) : ((intermediateValue11.packedValues[intermediateValue21[comparisonValue122].x + sumValue118] >> 2u) + (bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue171 * 0.0625), 16.0, multiplyAddValue171)), int(8u), int(4u)) + bitfieldInsert(bitfieldInsert(0u, uint(fma(-floor(multiplyAddValue173 * 0.0625), 16.0, multiplyAddValue173)), int(4u), int(4u)), uint(fma(-floor(multiplyAddValue172 * 0.0625), 16.0, multiplyAddValue172)), int(0u), int(4u))));
                        float bitwiseValue42 = rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue174] >> 24u) & 255u) * 0.0039215688593685626983642578125;
                        bool comparisonValue123 = (conditionValue16 || ((intermediateValue11.packedValues[sumValue119] & (1u << (intermediateValue21[comparisonValue122].x & 31u))) != 0u)) && (intermediateValue11.packedValues[multiplyAddValue174] != 0u);
                        comparisonValue84 = comparisonValue123 ? ((bitwiseValue42 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue174] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue85 = comparisonValue123 ? ((bitwiseValue42 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue174] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue86 = comparisonValue123 ? ((bitwiseValue42 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue174] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue87 = comparisonValue121 ? ((bitwiseValue41 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue170] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue88 = comparisonValue121 ? ((bitwiseValue41 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue170] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue89 = comparisonValue121 ? ((bitwiseValue41 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue170] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue90 = comparisonValue117 ? ((bitwiseValue39 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue162] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue91 = comparisonValue117 ? ((bitwiseValue39 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue162] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue92 = comparisonValue117 ? ((bitwiseValue39 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue162] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue93 = comparisonValue119 ? ((bitwiseValue40 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue166] >> 16u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue94 = comparisonValue119 ? ((bitwiseValue40 * (rdEvaluateFloatExpression((intermediateValue11.packedValues[multiplyAddValue166] >> 8u) & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                        comparisonValue95 = comparisonValue119 ? ((bitwiseValue40 * (rdEvaluateFloatExpression(intermediateValue11.packedValues[multiplyAddValue166] & 255u) * 0.0039215688593685626983642578125)) * 6.0) : 0.0;
                    }
                    multiplyAddValue126 = fma(comparisonValue86, scalarValue78, fma(comparisonValue89, sumValue89, fma(comparisonValue92, sumValue86, sumValue87 * comparisonValue95)));
                    multiplyAddValue127 = fma(comparisonValue85, scalarValue78, fma(comparisonValue88, sumValue89, fma(comparisonValue91, sumValue86, sumValue87 * comparisonValue94)));
                    multiplyAddValue128 = fma(comparisonValue84, scalarValue78, fma(comparisonValue87, sumValue89, fma(comparisonValue90, sumValue86, sumValue87 * comparisonValue93)));
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
            uint bitwiseValue75 = (((((productValue339 ^ (productValue339 >> 24u)) * 1540483477u) ^ ((((productValue338 ^ (productValue338 >> 24u)) * 1540483477u) ^ 2293326976u) * 1540483477u)) * 1540483477u) ^ ((productValue340 ^ (productValue340 >> 24u)) * 1540483477u)) * 1540483477u;
            uint bitwiseValue76 = ((bitwiseValue75 >> 13u) ^ bitwiseValue75) * 1540483477u;
            uint bitwiseValue77 = bitwiseValue76 ^ (bitwiseValue76 >> 15u);
            uint bitwiseValue78 = (bitwiseValue77 ^ (bitwiseValue77 >> 16u)) & 65535u;
            bool comparisonValue212 = bitwiseValue78 != 0u;
            uint bitwiseValue79 = bitwiseValue78 | 1u;
            uint sumValue38 = uint(fragmentScalarConstants1.packedValues[236u]) - 1u;
            uint comparisonValue213 = (comparisonValue212 ? bitwiseValue78 : bitwiseValue79) & sumValue38;
            uint comparisonValue25;
            uint comparisonValue26;
            uint bitwiseValue7;
            uint sumValue34;
            uint intermediateValue168;
            uint intermediateValue169;
            uint scalarValue61 = 0u;
            uint scalarValue62 = 0u;
            uint scalarValue220 = comparisonValue213;
            uint scalarValue64 = 0u;
            for (;;)
            {
                if (int(scalarValue64) >= int(8u))
                {
                    intermediateValue168 = scalarValue62;
                    intermediateValue169 = scalarValue61;
                    break;
                }
                uint bitwiseValue80 = intermediateValue8.packedValues[scalarValue220].z & 65535u;
                bool comparisonValue214 = (bitwiseValue74 == intermediateValue8.packedValues[scalarValue220].y) && ((((!comparisonValue212) && (bitwiseValue79 == bitwiseValue80)) || (comparisonValue212 && (bitwiseValue78 == bitwiseValue80))) && (scalarValue219 == intermediateValue8.packedValues[scalarValue220].x));
                bool comparisonValue97 = scalarValue61 != 0u;
                comparisonValue26 = (comparisonValue97 || (!comparisonValue214)) ? scalarValue62 : intermediateValue8.packedValues[scalarValue220].w;
                comparisonValue25 = comparisonValue214 ? 4294967295u : scalarValue61;
                bitwiseValue7 = sumValue38 & (scalarValue220 + 1u);
                bool comparisonValue215 = (bitwiseValue80 == 0u) || comparisonValue214;
                if (comparisonValue215 || (comparisonValue97 && (!comparisonValue215)))
                {
                    intermediateValue168 = comparisonValue26;
                    intermediateValue169 = comparisonValue25;
                    break;
                }
                sumValue34 = scalarValue64 + 1u;
                scalarValue61 = comparisonValue25;
                scalarValue62 = comparisonValue26;
                scalarValue220 = bitwiseValue7;
                scalarValue64 = sumValue34;
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
                    if ((((sumValue237 < 16.0) && (sumValue238 < 16.0)) && (sumValue239 < 16.0)) && (((multiplyAddValue328 >= 0.0) && (multiplyAddValue329 >= 0.0)) && (multiplyAddValue330 >= 0.0)))
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
            float productValue300 = (multiplyAddValue222 + 1.0) * 0.5;
            float productValue301 = (multiplyAddValue223 + 1.0) * 0.5;
            uint scalarValue179 = uint(int(fragmentVectorConstants1.packedValues[144u].z));
            float multiplyAddValue245 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue224, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue223, multiplyAddValue222 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue224, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue223, multiplyAddValue222 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[145u].x) / (fragmentVectorConstants1.packedValues[145u].y - fragmentVectorConstants1.packedValues[145u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue179))) + (-0.5);
            uint sumValue197 = uint(min(int(uint(max(int(uint(int(multiplyAddValue245))), int(0u)))), int(scalarValue179 + 4294967294u)));
            float scalarValue180 = float(int(sumValue197));
            vec4 sampledTextureValue93 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue300, productValue301, scalarValue180), 0.0);
            float scalarValue181 = sampledTextureValue93.w;
            float sampledTextureValue94 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue300, productValue301, float(int(sumValue197 + 1u))), 0.0).w - scalarValue181) * spvNMin(spvNMax(multiplyAddValue245 - scalarValue180, 0.0), 1.0)) + scalarValue181;
            branchMergedValue13 = sampledTextureValue94 * productValue299;
            branchMergedValue24 = sampledTextureValue94 * productValue298;
            branchMergedValue25 = sampledTextureValue94 * productValue297;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float productValue300 = (multiplyAddValue222 + 1.0) * 0.5;
            float productValue301 = (multiplyAddValue223 + 1.0) * 0.5;
            uint scalarValue302 = uint(int(fragmentVectorConstants1.packedValues[143u].z));
            float multiplyAddValue409 = ((log2(((((((-0.0) - (fragmentVectorConstants1.packedValues[15u].z + fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue224, fma(fragmentVectorConstants1.packedValues[13u].z, multiplyAddValue223, multiplyAddValue222 * fragmentVectorConstants1.packedValues[12u].z)))) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue224, fma(fragmentVectorConstants1.packedValues[13u].w, multiplyAddValue223, multiplyAddValue222 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentVectorConstants1.packedValues[144u].x) / (fragmentVectorConstants1.packedValues[144u].y - fragmentVectorConstants1.packedValues[144u].x)) * 53.598148345947265625) + 1.0) * 0.17328679561614990234375) * float(int(scalarValue302))) + (-0.5);
            uint sumValue314 = uint(min(int(uint(max(int(uint(int(multiplyAddValue409))), int(0u)))), int(scalarValue302 + 4294967294u)));
            float scalarValue303 = float(int(sumValue314));
            vec4 sampledTextureValue139 = textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue300, productValue301, scalarValue303), 0.0);
            float scalarValue304 = sampledTextureValue139.w;
            float sampledTextureValue140 = ((textureLod(sampler2DArray(scatteringBufferTexture, scatteringBufferSampler), vec3(productValue300, productValue301, float(int(sumValue314 + 1u))), 0.0).w - scalarValue304) * spvNMin(spvNMax(multiplyAddValue409 - scalarValue303, 0.0), 1.0)) + scalarValue304;
            branchMergedValue13 = sampledTextureValue140 * productValue468;
            branchMergedValue24 = sampledTextureValue140 * productValue467;
            branchMergedValue25 = sampledTextureValue140 * productValue466;
#endif
        }
        else
        {
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue118 = multiplyAddValue61;
            intermediateValue120 = multiplyAddValue60;
            intermediateValue122 = comparisonValue24;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue116 = multiplyAddValue274;
            intermediateValue118 = multiplyAddValue273;
            intermediateValue120 = comparisonValue193;
#elif (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            branchMergedValue13 = productValue299;
            branchMergedValue24 = productValue298;
            branchMergedValue25 = productValue297;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            branchMergedValue13 = productValue468;
            branchMergedValue24 = productValue467;
            branchMergedValue25 = productValue466;
#endif
        }
#if (RD_FEATURE_SEASONS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float productValue93 = fragmentScalarConstants1.packedValues[445u] * fragmentScalarConstants1.packedValues[445u];
        float productValue94 = (productValue93 * productValue93) * fragmentScalarConstants1.packedValues[445u];
        float multiplyAddValue175 = fma(fragmentScalarConstants1.packedValues[305u], fma(productValue93, fragmentScalarConstants1.packedValues[445u], -productValue94), productValue94);
        float scalarValue84 = rdDot3Precise2(vec3(exponentialValue4, exponentialValue5, exponentialValue6), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        multiplyAddValue37 = (intermediateValue42 * (fma(fragmentScalarConstants1.packedValues[253u], scalarValue84 - exponentialValue6, exponentialValue6) * fragmentScalarConstants1.packedValues[494u])) * fragmentScalarConstants1.packedValues[252u];
        multiplyAddValue38 = (intermediateValue42 * (fma(fragmentScalarConstants1.packedValues[253u], scalarValue84 - exponentialValue5, exponentialValue5) * fragmentScalarConstants1.packedValues[494u])) * fragmentScalarConstants1.packedValues[252u];
        multiplyAddValue39 = (intermediateValue42 * (fma(fragmentScalarConstants1.packedValues[253u], scalarValue84 - exponentialValue4, exponentialValue4) * fragmentScalarConstants1.packedValues[494u])) * fragmentScalarConstants1.packedValues[252u];
        intermediateValue68 = quotientValue3;
        intermediateValue69 = quotientValue4;
        intermediateValue70 = quotientValue5;
        multiplyAddValue40 = ((exponentialValue6 * sumValue22) * spvNMax(fma(intermediateValue118, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue175 * fragmentVectorConstants1.packedValues[140u].z) * fragmentScalarConstants1.packedValues[563u]), fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].z)) * fragmentScalarConstants1.packedValues[495u];
        multiplyAddValue41 = ((exponentialValue5 * sumValue22) * spvNMax(fma(intermediateValue120, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue175 * fragmentVectorConstants1.packedValues[140u].y) * fragmentScalarConstants1.packedValues[563u]), fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].y)) * fragmentScalarConstants1.packedValues[495u];
        multiplyAddValue42 = ((exponentialValue4 * sumValue22) * spvNMax(fma(intermediateValue122, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue175 * fragmentVectorConstants1.packedValues[140u].x) * fragmentScalarConstants1.packedValues[563u]), fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].x)) * fragmentScalarConstants1.packedValues[495u];
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
        multiplyAddValue43 = ((multiplyAddValue251 * sumValue130) * spvNMax(fma(intermediateValue116, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue363 * fragmentVectorConstants1.packedValues[139u].z) * fragmentScalarConstants1.packedValues[559u]), fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].z)) * fragmentScalarConstants1.packedValues[491u];
        multiplyAddValue44 = ((multiplyAddValue250 * sumValue130) * spvNMax(fma(intermediateValue118, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue363 * fragmentVectorConstants1.packedValues[139u].y) * fragmentScalarConstants1.packedValues[559u]), fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].y)) * fragmentScalarConstants1.packedValues[491u];
        multiplyAddValue45 = ((multiplyAddValue249 * sumValue130) * spvNMax(fma(intermediateValue120, fragmentScalarConstants1.packedValues[235u], (multiplyAddValue363 * fragmentVectorConstants1.packedValues[139u].x) * fragmentScalarConstants1.packedValues[559u]), fragmentScalarConstants1.packedValues[263u] * fragmentVectorConstants1.packedValues[65u].x)) * fragmentScalarConstants1.packedValues[491u];
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
    float sumValue120 = multiplyAddValue39 + (intermediateValue70 + (intermediateValue73 + multiplyAddValue42));
    float sumValue121 = multiplyAddValue38 + (intermediateValue69 + (intermediateValue72 + multiplyAddValue41));
    float sumValue122 = multiplyAddValue37 + (intermediateValue68 + (intermediateValue71 + multiplyAddValue40));
    bool comparisonValue124 = fragmentScalarConstants1.packedValues[495u] != 0.0;
    float productValue95 = fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].x;
    float productValue96 = fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].y;
    float productValue97 = fragmentScalarConstants1.packedValues[267u] * fragmentVectorConstants1.packedValues[66u].z;
    bool comparisonValue125 = fragmentScalarConstants1.packedValues[288u] != 0.0;
    bool comparisonValue126 = fragmentScalarConstants1.packedValues[584u] != 0.0;
    float intermediateValue94;
    float intermediateValue95;
    float intermediateValue97;
    float intermediateValue99;
    if (comparisonValue125)
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
    float productValue302 = ((productValue109 * (((intermediateValue54 - sumValue187) * intermediateValue53) + sumValue187)) + productValue106) + intermediateValue87;
    float productValue303 = ((productValue109 * (((intermediateValue55 - sumValue188) * intermediateValue53) + sumValue188)) + productValue107) + intermediateValue88;
    float productValue304 = ((productValue109 * (((intermediateValue56 - sumValue189) * intermediateValue53) + sumValue189)) + productValue108) + intermediateValue89;
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
        float quotientValue12 = spvNClamp((((nonlinearValue / fragmentScalarConstants1.packedValues[274u]) + fragmentScalarConstants1.packedValues[552u]) - fragmentScalarConstants1.packedValues[272u]) * fragmentScalarConstants1.packedValues[273u], 0.0, 1.0);
        float intermediateValue96;
        float intermediateValue98;
        float intermediateValue100;
        if (quotientValue12 > 0.0)
        {
            float multiplyAddValue81;
            float multiplyAddValue82;
            float multiplyAddValue83;
            if (fragmentScalarConstants1.packedValues[289u] != 0.0)
            {
                bool comparisonValue127 = comparisonValue124 && (fragmentScalarConstants1.packedValues[290u] != 0.0);
                multiplyAddValue81 = spvNMax(comparisonValue127 ? (spvNMax(productValue95, fma(fragmentVectorConstants1.packedValues[140u].x, fragmentScalarConstants1.packedValues[563u], fragmentScalarConstants1.packedValues[235u])) * fragmentScalarConstants1.packedValues[290u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[73u].x;
                multiplyAddValue82 = spvNMax(comparisonValue127 ? (spvNMax(productValue96, fma(fragmentVectorConstants1.packedValues[140u].y, fragmentScalarConstants1.packedValues[563u], fragmentScalarConstants1.packedValues[235u])) * fragmentScalarConstants1.packedValues[290u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[73u].y;
                multiplyAddValue83 = spvNMax(comparisonValue127 ? (spvNMax(productValue97, fma(fragmentVectorConstants1.packedValues[140u].z, fragmentScalarConstants1.packedValues[563u], fragmentScalarConstants1.packedValues[235u])) * fragmentScalarConstants1.packedValues[290u]) : 0.0, 1.0) * fragmentVectorConstants1.packedValues[73u].z;
            }
            else
            {
                float sumValue123 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
                float sumValue124 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
                float sumValue125 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
                vec3 vectorValue18 = vec3(sumValue123, sumValue124, sumValue125);
                float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue18, vectorValue18));
                float sumValue126 = fragmentScalarConstants1.packedValues[523u] - fragmentScalarConstants1.packedValues[520u];
                float multiplyAddValue178 = fma(sumValue124, inverseLengthValue15, sumValue126);
                float quotientValue13 = spvNClamp(multiplyAddValue178 * (1.0 / (sumValue126 + (fragmentScalarConstants1.packedValues[522u] - fragmentScalarConstants1.packedValues[523u]))), 0.0, 1.0);
                float multiplyAddValue181 = fma(-fma(quotientValue13, -2.0, 3.0), quotientValue13 * quotientValue13, 1.0);
                float productValue98 = multiplyAddValue181 * (multiplyAddValue181 * multiplyAddValue181);
                vec3 productValue99 = vec3(inverseLengthValue15 * sumValue123, inverseLengthValue15 * sumValue124, inverseLengthValue15 * sumValue125);
                float scalarValue85 = rdDot3Precise2(productValue99, vec3(fragmentVectorConstants1.packedValues[135u].xyz));
                float scalarValue86 = rdDot3Precise2(productValue99, vec3(fragmentVectorConstants1.packedValues[77u].xyz));
                float quotientValue14 = spvNClamp(multiplyAddValue178 * (1.0 / (sumValue126 + fragmentScalarConstants1.packedValues[521u])), 0.0, 1.0);
                float multiplyAddValue182 = fma(-fma(quotientValue14, -2.0, 3.0), quotientValue14 * quotientValue14, 1.0);
                float productValue100 = multiplyAddValue182 * (multiplyAddValue182 * multiplyAddValue182);
                float multiplyAddValue183 = fma(fma(scalarValue85, scalarValue85, 1.0) * fragmentScalarConstants1.packedValues[571u], 0.75, (fma(scalarValue86, scalarValue86, 1.0) * fragmentScalarConstants1.packedValues[535u]) * 0.75);
                float exponentialValue7 = spvNMin(exp2(log2(spvNMax(scalarValue85, 0.0)) * fragmentScalarConstants1.packedValues[279u]), 1.0);
                float exponentialValue8 = spvNMin(exp2(log2(spvNMax(scalarValue86, 0.0)) * fragmentScalarConstants1.packedValues[279u]), 1.0);
                float multiplyAddValue184 = fma(-exponentialValue7, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue2 = 0.0361000001430511474609375 / (multiplyAddValue184 * sqrt(multiplyAddValue184));
                float multiplyAddValue185 = fma(-exponentialValue8, 1.7999999523162841796875, 1.809999942779541015625);
                float nonlinearValue3 = 0.0361000001430511474609375 / (multiplyAddValue185 * sqrt(multiplyAddValue185));
                float multiplyAddValue186 = fma((fma(productValue100, fragmentVectorConstants1.packedValues[131u].x - fragmentVectorConstants1.packedValues[70u].x, fragmentVectorConstants1.packedValues[70u].x) * fragmentScalarConstants1.packedValues[276u]) * 0.079577468335628509521484375, multiplyAddValue183, fma(exponentialValue7 * ((fragmentVectorConstants1.packedValues[142u].x * fragmentScalarConstants1.packedValues[571u]) * fragmentScalarConstants1.packedValues[277u]), nonlinearValue2, nonlinearValue3 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[133u].x * fragmentScalarConstants1.packedValues[535u]) * fragmentScalarConstants1.packedValues[278u]))) * ((productValue98 * fragmentVectorConstants1.packedValues[131u].x) * 0.079577468335628509521484375));
                float multiplyAddValue187 = fma((fma(productValue100, fragmentVectorConstants1.packedValues[131u].y - fragmentVectorConstants1.packedValues[70u].y, fragmentVectorConstants1.packedValues[70u].y) * fragmentScalarConstants1.packedValues[276u]) * 0.079577468335628509521484375, multiplyAddValue183, fma(exponentialValue7 * ((fragmentVectorConstants1.packedValues[142u].y * fragmentScalarConstants1.packedValues[571u]) * fragmentScalarConstants1.packedValues[277u]), nonlinearValue2, nonlinearValue3 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[133u].y * fragmentScalarConstants1.packedValues[535u]) * fragmentScalarConstants1.packedValues[278u]))) * ((productValue98 * fragmentVectorConstants1.packedValues[131u].y) * 0.079577468335628509521484375));
                float multiplyAddValue188 = fma((fma(productValue100, fragmentVectorConstants1.packedValues[131u].z - fragmentVectorConstants1.packedValues[70u].z, fragmentVectorConstants1.packedValues[70u].z) * fragmentScalarConstants1.packedValues[276u]) * 0.079577468335628509521484375, multiplyAddValue183, fma(exponentialValue7 * ((fragmentVectorConstants1.packedValues[142u].z * fragmentScalarConstants1.packedValues[571u]) * fragmentScalarConstants1.packedValues[277u]), nonlinearValue2, nonlinearValue3 * (exponentialValue8 * ((fragmentVectorConstants1.packedValues[133u].z * fragmentScalarConstants1.packedValues[535u]) * fragmentScalarConstants1.packedValues[278u]))) * ((productValue98 * fragmentVectorConstants1.packedValues[131u].z) * 0.079577468335628509521484375));
                bool comparisonValue128 = fragmentScalarConstants1.packedValues[291u] != 0.0;
                float scalarValue87 = spvNMax(fragmentScalarConstants1.packedValues[301u], fragmentScalarConstants1.packedValues[445u]);
                multiplyAddValue81 = comparisonValue128 ? fma(scalarValue87, multiplyAddValue186 - fragmentVectorConstants1.packedValues[143u].x, fragmentVectorConstants1.packedValues[143u].x) : multiplyAddValue186;
                multiplyAddValue82 = comparisonValue128 ? fma(scalarValue87, multiplyAddValue187 - fragmentVectorConstants1.packedValues[143u].y, fragmentVectorConstants1.packedValues[143u].y) : multiplyAddValue187;
                multiplyAddValue83 = comparisonValue128 ? fma(scalarValue87, multiplyAddValue188 - fragmentVectorConstants1.packedValues[143u].z, fragmentVectorConstants1.packedValues[143u].z) : multiplyAddValue188;
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
        intermediateValue94 = quotientValue12;
        intermediateValue95 = intermediateValue96;
        intermediateValue97 = intermediateValue98;
        intermediateValue99 = intermediateValue100;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float quotientValue45 = spvNClamp((((nonlinearValue / fragmentScalarConstants1.packedValues[270u]) + fragmentScalarConstants1.packedValues[548u]) - fragmentScalarConstants1.packedValues[268u]) * fragmentScalarConstants1.packedValues[269u], 0.0, 1.0);
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
                float sumValue123 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[11u].x;
                float sumValue124 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[11u].y;
                float sumValue125 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[11u].z;
                vec3 vectorValue18 = vec3(sumValue123, sumValue124, sumValue125);
                float inverseLengthValue15 = inversesqrt(rdDot3Precise2(vectorValue18, vectorValue18));
                float sumValue270 = fragmentScalarConstants1.packedValues[519u] - fragmentScalarConstants1.packedValues[516u];
                float multiplyAddValue364 = fma(sumValue124, inverseLengthValue15, sumValue270);
                float quotientValue46 = spvNClamp(multiplyAddValue364 * (1.0 / (sumValue270 + (fragmentScalarConstants1.packedValues[518u] - fragmentScalarConstants1.packedValues[519u]))), 0.0, 1.0);
                float multiplyAddValue365 = fma(-fma(quotientValue46, -2.0, 3.0), quotientValue46 * quotientValue46, 1.0);
                float productValue350 = multiplyAddValue365 * (multiplyAddValue365 * multiplyAddValue365);
                vec3 productValue99 = vec3(inverseLengthValue15 * sumValue123, inverseLengthValue15 * sumValue124, inverseLengthValue15 * sumValue125);
                float scalarValue241 = rdDot3Precise2(productValue99, vec3(fragmentVectorConstants1.packedValues[134u].xyz));
                float scalarValue242 = rdDot3Precise2(productValue99, vec3(fragmentVectorConstants1.packedValues[76u].xyz));
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
        float sampledTextureValue95 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue143 = sampledTextureValue95 * productValue302;
        productValue144 = sampledTextureValue95 * productValue303;
        productValue145 = sampledTextureValue95 * productValue304;
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float sampledTextureValue95 = (0.180000007152557373046875 / texture(sampler2D(previousFrameAverageLuminanceTexture, previousFrameAverageLuminanceSampler), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue140 = sampledTextureValue95 * productValue469;
        productValue141 = sampledTextureValue95 * productValue470;
        productValue142 = sampledTextureValue95 * productValue471;
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
        productValue143 = productValue302;
        productValue144 = productValue303;
        productValue145 = productValue304;
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
    if (comparisonValue126)
    {
        float productValue101 = (multiplyAddValue27 + 1.0) * 0.5;
        float productValue102 = (multiplyAddValue28 + 1.0) * 0.5;
        float multiplyAddValue189 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue29, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue27, multiplyAddValue28 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue29, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue27, multiplyAddValue28 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[580u]) / (fragmentScalarConstants1.packedValues[581u] - fragmentScalarConstants1.packedValues[580u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[578u]), -0.5);
        uint sumValue127 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[578u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue189))), int(0u))))));
        float scalarValue88 = rdSignedBitsToFloat(sumValue127);
        float sumValue128 = spvNClamp(multiplyAddValue189 - scalarValue88, 0.0, 1.0);
        vec4 sampledTextureValue26 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue101, productValue102, scalarValue88), 0.0);
        float scalarValue89 = sampledTextureValue26.x;
        float scalarValue90 = sampledTextureValue26.y;
        float scalarValue91 = sampledTextureValue26.z;
        float scalarValue92 = sampledTextureValue26.w;
        vec4 sampledTextureValue27 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue101, productValue102, rdSignedBitsToFloat(sumValue127 + 1u)), 0.0);
        multiplyAddValue85 = fma(sumValue128, sampledTextureValue27.z - scalarValue91, scalarValue91);
        multiplyAddValue86 = fma(sumValue128, sampledTextureValue27.y - scalarValue90, scalarValue90);
        multiplyAddValue87 = fma(sumValue128, sampledTextureValue27.x - scalarValue89, scalarValue89);
        multiplyAddValue88 = fma(sumValue128, sampledTextureValue27.w - scalarValue92, scalarValue92);
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
        float multiplyAddValue190 = spvNClamp(fma(fragmentScalarConstants1.packedValues[445u], 16.0, -fragmentScalarConstants1.packedValues[285u]) / spvNMax(fragmentScalarConstants1.packedValues[284u] - fragmentScalarConstants1.packedValues[285u], 1.0), 0.0, 1.0);
        float productValue110 = (multiplyAddValue190 * (multiplyAddValue190 * multiplyAddValue190)) * fragmentScalarConstants1.packedValues[528u];
        bool conditionValue17 = fragmentScalarConstants1.packedValues[544u] > 0.0;
        bool conditionValue18 = fragmentScalarConstants1.packedValues[539u] > 0.0;
        float multiplyAddValue191 = conditionValue18 ? (fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue59, fma(fragmentVectorConstants1.packedValues[4u].x, multiplyAddValue57, multiplyAddValue58 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue22;
        float multiplyAddValue192 = conditionValue18 ? (fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue59, fma(fragmentVectorConstants1.packedValues[4u].y, multiplyAddValue57, multiplyAddValue58 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue23;
        float multiplyAddValue193 = conditionValue18 ? (fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue59, fma(fragmentVectorConstants1.packedValues[4u].z, multiplyAddValue57, multiplyAddValue58 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue24;
        float comparisonValue129 = (conditionValue18 ? multiplyAddValue57 : varyingTexCoord3.x) - fragmentVectorConstants1.packedValues[11u].x;
        float comparisonValue130 = (conditionValue18 ? multiplyAddValue58 : varyingTexCoord3.y) - fragmentVectorConstants1.packedValues[11u].y;
        float comparisonValue131 = (conditionValue18 ? multiplyAddValue59 : varyingTexCoord3.z) - fragmentVectorConstants1.packedValues[11u].z;
        vec3 vectorValue19 = vec3(comparisonValue129, comparisonValue130, comparisonValue131);
        float inverseLengthValue16 = inversesqrt(rdDot3Precise2(vectorValue19, vectorValue19));
        float productValue111 = inverseLengthValue16 * comparisonValue129;
        float productValue112 = inverseLengthValue16 * comparisonValue130;
        float productValue113 = inverseLengthValue16 * comparisonValue131;
        vec3 vectorValue20 = vec3(multiplyAddValue191, multiplyAddValue192, multiplyAddValue193);
        float inverseLengthValue17 = inversesqrt(rdDot3Precise2(vectorValue20, vectorValue20));
        float scalarValue93 = rdDot3Precise2(vec3(productValue111, productValue112, productValue113), vec3(productValue7, productValue8, productValue9));
        float sumValue129 = -(scalarValue93 + scalarValue93);
        float multiplyAddValue194 = fma(productValue7, sumValue129, productValue111);
        float multiplyAddValue195 = fma(productValue8, sumValue129, productValue112);
        float multiplyAddValue196 = fma(productValue9, sumValue129, productValue113);
        float sumValue130 = 1.0 - intermediateValue44;
        float productValue114 = sumValue130 * sumValue130;
        float sumValue131 = fragmentScalarConstants1.packedValues[529u] - 1.0;
        float productValue115 = productValue114 * productValue114;
        float multiplyAddValue197 = (uint(int(fragmentScalarConstants1.packedValues[456u])) == 1u) ? (fma(intermediateValue44 - 1.0, sumValue130, 1.0) * sumValue131) : (fma(-productValue115, productValue115, 1.0) * sumValue131);
        uint sumValue132 = uint(int(fragmentScalarConstants1.packedValues[268u])) + 2u;
        uint scalarValue94 = uint(abs(int(sumValue132))) % 3u;
        vec4 sampledTextureValue28 = textureLod(samplerCubeArray(materialTexture9, textureSampler9), vec4(multiplyAddValue194, multiplyAddValue195, multiplyAddValue196, trunc(fragmentScalarConstants1.packedValues[268u])), multiplyAddValue197);
        vec4 sampledTextureValue29 = textureLod(samplerCubeArray(materialTexture9, textureSampler9), vec4(multiplyAddValue194, multiplyAddValue195, multiplyAddValue196, rdSignedBitsToFloat(((sumValue132 & 2147483648u) != 0u) ? (-scalarValue94) : scalarValue94)), multiplyAddValue197);
        float scalarValue95 = sampledTextureValue29.x;
        float scalarValue96 = sampledTextureValue29.y;
        float scalarValue97 = sampledTextureValue29.z;
        float multiplyAddValue198 = fma(fragmentScalarConstants1.packedValues[531u], sampledTextureValue28.x - scalarValue95, scalarValue95);
        float multiplyAddValue199 = fma(fragmentScalarConstants1.packedValues[531u], sampledTextureValue28.y - scalarValue96, scalarValue96);
        float multiplyAddValue200 = fma(fragmentScalarConstants1.packedValues[531u], sampledTextureValue28.z - scalarValue97, scalarValue97);
        float comparisonValue132 = (productValue110 * (conditionValue17 ? (multiplyAddValue198 * 301.72412109375) : multiplyAddValue198)) * fragmentScalarConstants1.packedValues[530u];
        float comparisonValue133 = (productValue110 * (conditionValue17 ? (multiplyAddValue199 * 301.72412109375) : multiplyAddValue199)) * fragmentScalarConstants1.packedValues[530u];
        float comparisonValue134 = (productValue110 * (conditionValue17 ? (multiplyAddValue200 * 301.72412109375) : multiplyAddValue200)) * fragmentScalarConstants1.packedValues[530u];
        float productValue116 = comparisonValue24 * fragmentScalarConstants1.packedValues[235u];
        float productValue117 = multiplyAddValue60 * fragmentScalarConstants1.packedValues[235u];
        float productValue118 = multiplyAddValue61 * fragmentScalarConstants1.packedValues[235u];
        float productValue119 = spvNClamp(rdDot3Precise2(vec3(productValue116 * fragmentScalarConstants1.packedValues[296u], productValue117 * fragmentScalarConstants1.packedValues[296u], productValue118 * fragmentScalarConstants1.packedValues[296u]), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), 0.0, 1.0);
        float multiplyAddValue201 = intermediateValue46 * fma(productValue119, fma(fragmentScalarConstants1.packedValues[296u], productValue116, -productValue95), productValue95);
        float multiplyAddValue202 = intermediateValue46 * fma(productValue119, fma(fragmentScalarConstants1.packedValues[296u], productValue117, -productValue96), productValue96);
        float multiplyAddValue203 = intermediateValue46 * fma(productValue119, fma(fragmentScalarConstants1.packedValues[296u], productValue118, -productValue97), productValue97);
        bool bitwiseValue43 = comparisonValue124 && (rdDot3Precise2(vec3(comparisonValue132, comparisonValue133, comparisonValue134), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)) < rdDot3Precise2(vec3(multiplyAddValue201, multiplyAddValue202, multiplyAddValue203), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)));
        vec4 sampledTextureValue30 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNClamp(rdDot3Precise2(vectorValue12, vec3(-(multiplyAddValue191 * inverseLengthValue17), -(multiplyAddValue192 * inverseLengthValue17), -(multiplyAddValue193 * inverseLengthValue17))), 0.0, 1.0), sumValue130));
        float scalarValue98 = sampledTextureValue30.x;
        float scalarValue99 = sampledTextureValue30.y;
        float multiplyAddValue204 = (bitwiseValue43 ? multiplyAddValue201 : comparisonValue132) * fma(multiplyAddValue63, scalarValue98, scalarValue99);
        float multiplyAddValue205 = (bitwiseValue43 ? multiplyAddValue202 : comparisonValue133) * fma(multiplyAddValue64, scalarValue98, scalarValue99);
        float multiplyAddValue206 = (bitwiseValue43 ? multiplyAddValue203 : comparisonValue134) * fma(multiplyAddValue66, scalarValue98, scalarValue99);
        float quotientValue15 = ((nonlinearValue / fragmentScalarConstants1.packedValues[274u]) + fragmentScalarConstants1.packedValues[552u]) - fragmentScalarConstants1.packedValues[272u];
        float productValue120 = 1.0 - spvNClamp(quotientValue15 * fragmentScalarConstants1.packedValues[273u], 0.0, 1.0);
        float quotientValue18 = 1.0 - spvNClamp(quotientValue15 / (fragmentScalarConstants1.packedValues[273u] - fragmentScalarConstants1.packedValues[272u]), 0.0, 1.0);
        float comparisonValue135 = comparisonValue125 ? (multiplyAddValue204 * productValue120) : (quotientValue18 * multiplyAddValue204);
        float comparisonValue136 = comparisonValue125 ? (multiplyAddValue205 * productValue120) : (quotientValue18 * multiplyAddValue205);
        float comparisonValue137 = comparisonValue125 ? (multiplyAddValue206 * productValue120) : (quotientValue18 * multiplyAddValue206);
        float productValue71;
        float productValue72;
        float productValue73;
        if (comparisonValue126)
        {
            float productValue121 = (multiplyAddValue27 + 1.0) * 0.5;
            float productValue122 = (multiplyAddValue28 + 1.0) * 0.5;
            float multiplyAddValue207 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue29, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue27, multiplyAddValue28 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue29, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue27, multiplyAddValue28 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[580u]) / (fragmentScalarConstants1.packedValues[581u] - fragmentScalarConstants1.packedValues[580u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[578u]), -0.5);
            uint sumValue133 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[578u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue207))), int(0u))))));
            float scalarValue100 = rdSignedBitsToFloat(sumValue133);
            vec4 sampledTextureValue31 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue121, productValue122, scalarValue100), 0.0);
            float scalarValue101 = sampledTextureValue31.w;
            float sampledTextureValue32 = fma(spvNClamp(multiplyAddValue207 - scalarValue100, 0.0, 1.0), textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue121, productValue122, rdSignedBitsToFloat(sumValue133 + 1u)), 0.0).w - scalarValue101, scalarValue101);
            productValue73 = comparisonValue135 * sampledTextureValue32;
            productValue72 = comparisonValue136 * sampledTextureValue32;
            productValue71 = comparisonValue137 * sampledTextureValue32;
        }
        else
        {
            productValue73 = comparisonValue135;
            productValue72 = comparisonValue136;
            productValue71 = comparisonValue137;
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
    float multiplyAddValue208 = fma(multiplyAddValue88, fma(intermediateValue94, intermediateValue99 - sumValue120, sumValue120), multiplyAddValue87) + intermediateValue165;
    float multiplyAddValue209 = fma(multiplyAddValue88, fma(intermediateValue94, intermediateValue97 - sumValue121, sumValue121), multiplyAddValue86) + intermediateValue164;
    float multiplyAddValue210 = fma(multiplyAddValue88, fma(intermediateValue94, intermediateValue95 - sumValue122, sumValue122), multiplyAddValue85) + intermediateValue163;
    float productValue76;
    float productValue77;
    float productValue78;
    if (fragmentScalarConstants1.packedValues[544u] > 0.0)
    {
        float sampledTextureValue33 = (0.180000007152557373046875 / texture(sampler2D(materialTexture4, textureSampler4), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue76 = multiplyAddValue210 * sampledTextureValue33;
        productValue77 = multiplyAddValue209 * sampledTextureValue33;
        productValue78 = multiplyAddValue208 * sampledTextureValue33;
    }
    else
    {
        productValue76 = multiplyAddValue210;
        productValue77 = multiplyAddValue209;
        productValue78 = multiplyAddValue208;
    }
    fragmentColor0.x = productValue78;
    fragmentColor0.y = productValue77;
    fragmentColor0.z = productValue76;
    fragmentColor0.w = comparisonValue ? 1.0 : (scalarValue3 * varyingColor0.w);
#elif (RD_FEATURE_SEASONS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue88;
    float multiplyAddValue89;
    float multiplyAddValue90;
    float multiplyAddValue91;
    if (comparisonValue243)
    {
        float productValue101 = (multiplyAddValue27 + 1.0) * 0.5;
        float productValue102 = (multiplyAddValue28 + 1.0) * 0.5;
        float multiplyAddValue373 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue29, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue27, multiplyAddValue28 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue29, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue27, multiplyAddValue28 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[576u]) / (fragmentScalarConstants1.packedValues[577u] - fragmentScalarConstants1.packedValues[576u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[574u]), -0.5);
        uint sumValue271 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[574u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue373))), int(0u))))));
        float scalarValue244 = rdSignedBitsToFloat(sumValue271);
        float sumValue272 = spvNClamp(multiplyAddValue373 - scalarValue244, 0.0, 1.0);
        vec4 sampledTextureValue106 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue101, productValue102, scalarValue244), 0.0);
        float scalarValue245 = sampledTextureValue106.x;
        float scalarValue246 = sampledTextureValue106.y;
        float scalarValue247 = sampledTextureValue106.z;
        float scalarValue248 = sampledTextureValue106.w;
        vec4 sampledTextureValue107 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue101, productValue102, rdSignedBitsToFloat(sumValue271 + 1u)), 0.0);
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
        float multiplyAddValue375 = conditionValue44 ? (fma(fragmentVectorConstants1.packedValues[6u].x, multiplyAddValue272, fma(fragmentVectorConstants1.packedValues[4u].x, multiplyAddValue270, multiplyAddValue271 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) : multiplyAddValue22;
        float multiplyAddValue376 = conditionValue44 ? (fma(fragmentVectorConstants1.packedValues[6u].y, multiplyAddValue272, fma(fragmentVectorConstants1.packedValues[4u].y, multiplyAddValue270, multiplyAddValue271 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) : multiplyAddValue23;
        float multiplyAddValue377 = conditionValue44 ? (fma(fragmentVectorConstants1.packedValues[6u].z, multiplyAddValue272, fma(fragmentVectorConstants1.packedValues[4u].z, multiplyAddValue270, multiplyAddValue271 * fragmentVectorConstants1.packedValues[5u].z)) + fragmentVectorConstants1.packedValues[7u].z) : multiplyAddValue24;
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
        float quotientValue48 = ((nonlinearValue / fragmentScalarConstants1.packedValues[270u]) + fragmentScalarConstants1.packedValues[548u]) - fragmentScalarConstants1.packedValues[268u];
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
            float productValue121 = (multiplyAddValue27 + 1.0) * 0.5;
            float productValue122 = (multiplyAddValue28 + 1.0) * 0.5;
            float multiplyAddValue391 = fma(log2(fma((((-(fma(fragmentVectorConstants1.packedValues[14u].z, multiplyAddValue29, fma(fragmentVectorConstants1.packedValues[12u].z, multiplyAddValue27, multiplyAddValue28 * fragmentVectorConstants1.packedValues[13u].z)) + fragmentVectorConstants1.packedValues[15u].z)) / (fma(fragmentVectorConstants1.packedValues[14u].w, multiplyAddValue29, fma(fragmentVectorConstants1.packedValues[12u].w, multiplyAddValue27, multiplyAddValue28 * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[15u].w)) - fragmentScalarConstants1.packedValues[576u]) / (fragmentScalarConstants1.packedValues[577u] - fragmentScalarConstants1.packedValues[576u]), 53.598148345947265625, 1.0)) * 0.17328679561614990234375, trunc(fragmentScalarConstants1.packedValues[574u]), -0.5);
            uint sumValue277 = uint(min(int(uint(int(fragmentScalarConstants1.packedValues[574u])) - 2u), int(uint(max(int(uint(int(multiplyAddValue391))), int(0u))))));
            float scalarValue256 = rdSignedBitsToFloat(sumValue277);
            vec4 sampledTextureValue111 = textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue121, productValue122, scalarValue256), 0.0);
            float scalarValue257 = sampledTextureValue111.w;
            float sampledTextureValue112 = fma(spvNClamp(multiplyAddValue391 - scalarValue256, 0.0, 1.0), textureLod(sampler2DArray(materialTexture7, textureSampler7), vec3(productValue121, productValue122, rdSignedBitsToFloat(sumValue277 + 1u)), 0.0).w - scalarValue257, scalarValue257);
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
        float sampledTextureValue33 = (0.180000007152557373046875 / texture(sampler2D(materialTexture4, textureSampler4), vec2(0.5)).x) + 9.9999997473787516355514526367188e-05;
        productValue79 = sampledTextureValue33 * multiplyAddValue394;
        productValue80 = sampledTextureValue33 * multiplyAddValue393;
        productValue81 = sampledTextureValue33 * multiplyAddValue392;
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
    fragmentColor1.x = 0.0;
    fragmentColor1.y = 0.0;
    fragmentColor1.z = 0.0;
    fragmentColor1.w = 0.0;
}
