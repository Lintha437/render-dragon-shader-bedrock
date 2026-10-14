#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandPrepassTextured / GeometryPrepass / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
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

#include "../../include/materials/ItemInHandPrepassTextured/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool comparisonValue = fragmentScalarConstants1.packedValues[48u] != 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float multiplyAddValue = ((comparisonValue ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x)) * fragmentVectorConstants1.packedValues[15u].x) * fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue1 = ((comparisonValue ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y)) * fragmentVectorConstants1.packedValues[15u].y) * fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue2 = ((comparisonValue ? (fma(scalarValue3, fma(scalarValue2, varyingColor0.z, -scalarValue2), scalarValue2) * varyingColor0.w) : (scalarValue2 * varyingColor0.z)) * fragmentVectorConstants1.packedValues[15u].z) * fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue3 = fma(varyingColor0.w, fma(multiplyAddValue, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue), multiplyAddValue);
    float multiplyAddValue4 = fma(varyingColor0.w, fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue1), multiplyAddValue1);
    float multiplyAddValue9 = fma(varyingColor0.w, fma(multiplyAddValue2, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue2), multiplyAddValue2);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].x - multiplyAddValue3, multiplyAddValue3);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].y - multiplyAddValue4, multiplyAddValue4);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].z - multiplyAddValue9, multiplyAddValue9);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    bool comparisonValue = fragmentScalarConstants1.packedValues[48u] != 0.0;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    float multiplyAddValue38 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.x - 1.0, 1.0) * ((comparisonValue ? (fma(scalarValue3, fma(scalarValue, varyingColor0.x, -scalarValue), scalarValue) * varyingColor0.w) : (scalarValue * varyingColor0.x)) * fragmentVectorConstants1.packedValues[15u].x);
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[52u], varyingColor0.y - 1.0, 1.0) * ((comparisonValue ? (fma(scalarValue3, fma(scalarValue1, varyingColor0.y, -scalarValue1), scalarValue1) * varyingColor0.w) : (scalarValue1 * varyingColor0.y)) * fragmentVectorConstants1.packedValues[15u].y);
    float productValue68 = multiplyAddValue38 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue69 = multiplyAddValue38 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue70 = multiplyAddValue38 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue47 = ceil(multiplyAddValue39);
    float multiplyAddValue40 = fma(scalarValue47, fma(multiplyAddValue39, fragmentVectorConstants1.packedValues[16u].x, -productValue68), productValue68);
    float multiplyAddValue41 = fma(scalarValue47, fma(multiplyAddValue39, fragmentVectorConstants1.packedValues[16u].y, -productValue69), productValue69);
    float multiplyAddValue42 = fma(scalarValue47, fma(multiplyAddValue39, fragmentVectorConstants1.packedValues[16u].z, -productValue70), productValue70);
    fragmentColor1.x = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].x - multiplyAddValue40, multiplyAddValue40);
    fragmentColor1.y = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].y - multiplyAddValue41, multiplyAddValue41);
    fragmentColor1.z = fma(fragmentScalarConstants1.packedValues[23u], fragmentVectorConstants1.packedValues[5u].z - multiplyAddValue42, multiplyAddValue42);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    bool comparisonValue31 = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
#endif
    uint scalarValue4 = uint(varyingTexCoord4);
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float intermediateValue21;
    float intermediateValue23;
    float multiplyAddValue6;
    float multiplyAddValue7;
    float multiplyAddValue8;
    float intermediateValue25;
    float intermediateValue27;
    if (scalarValue4 != 65535u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float intermediateValue21;
    float intermediateValue23;
    float multiplyAddValue5;
    float multiplyAddValue6;
    float multiplyAddValue7;
    float intermediateValue25;
    float intermediateValue27;
    if (scalarValue4 != 65535u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue15 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue26 = sampledTextureValue15.x;
    float scalarValue27 = sampledTextureValue15.y;
    float scalarValue28 = sampledTextureValue15.z;
    float scalarValue29 = sampledTextureValue15.w;
    float productValue26 = scalarValue26 * varyingColor0.x;
    float productValue27 = scalarValue27 * varyingColor0.y;
    float productValue28 = scalarValue28 * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    if (fragmentVectorConstants1.packedValues[12u].x != 0.0)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue15 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue26 = sampledTextureValue15.x;
    float scalarValue27 = sampledTextureValue15.y;
    float scalarValue29 = sampledTextureValue15.w;
    float productValue26 = scalarValue26 * varyingColor0.x;
    float productValue27 = scalarValue27 * varyingColor0.y;
    float productValue2;
    float productValue3;
    if (fragmentVectorConstants1.packedValues[12u].x != 0.0)
#endif
    {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue4 * 4u) + 1u]);
        float scalarValue5 = reinterpretedBits.x;
        float scalarValue6 = reinterpretedBits.y;
        float scalarValue7 = reinterpretedBits.z;
        float scalarValue8 = reinterpretedBits.w;
        vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue4 * 4u) + 2u]);
        vec2 reinterpretedBits2 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue4 * 8u) + 6u]);
        float scalarValue9 = reinterpretedBits2.x;
        float scalarValue10 = reinterpretedBits2.y;
        uint reinterpretedBits3 = floatBitsToUint(reinterpretedBits1.x);
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        if ((reinterpretedBits3 & 4u) == 4u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        vec4 reinterpretedBits = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue4 * 4u) + 1u]);
        float scalarValue5 = reinterpretedBits.x;
        float scalarValue6 = reinterpretedBits.y;
        float scalarValue7 = reinterpretedBits.z;
        float scalarValue8 = reinterpretedBits.w;
        vec4 reinterpretedBits1 = uintBitsToFloat(intermediateValue3.packedValues[(scalarValue4 * 4u) + 2u]);
        vec2 reinterpretedBits2 = uintBitsToFloat(intermediateValue2.packedValues[(scalarValue4 * 8u) + 6u]);
        float scalarValue9 = reinterpretedBits2.x;
        float scalarValue10 = reinterpretedBits2.y;
        uint reinterpretedBits3 = floatBitsToUint(reinterpretedBits1.x);
        float multiplyAddValue12;
        float multiplyAddValue13;
        float multiplyAddValue14;
        if ((reinterpretedBits3 & 4u) == 4u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue3 = (((productValue26 - scalarValue26) * scalarValue29) + scalarValue26) * varyingColor0.w;
        productValue4 = (((productValue27 - scalarValue27) * scalarValue29) + scalarValue27) * varyingColor0.w;
        productValue5 = (((productValue28 - scalarValue28) * scalarValue29) + scalarValue28) * varyingColor0.w;
    }
    else
    {
        productValue3 = productValue26;
        productValue4 = productValue27;
        productValue5 = productValue28;
    }
    float productValue29 = (fragmentVectorConstants1.packedValues[15u].x * productValue3) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue30 = (fragmentVectorConstants1.packedValues[15u].y * productValue4) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue31 = (fragmentVectorConstants1.packedValues[15u].z * productValue5) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue32 = (((productValue29 * fragmentVectorConstants1.packedValues[0u].x) - productValue29) * varyingColor0.w) + productValue29;
    float productValue33 = (((productValue30 * fragmentVectorConstants1.packedValues[0u].y) - productValue30) * varyingColor0.w) + productValue30;
    float productValue34 = (((productValue31 * fragmentVectorConstants1.packedValues[0u].z) - productValue31) * varyingColor0.w) + productValue31;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if (scalarValue4 == 65535u)
    {
        intermediateValue7 = 0.0;
        intermediateValue8 = 1.0;
        intermediateValue9 = 0.0;
        intermediateValue10 = 0.0;
        intermediateValue12 = varyingNormal0.x;
        intermediateValue13 = varyingNormal0.y;
        intermediateValue14 = varyingNormal0.z;
    }
    else
    {
        float sampledTextureValue16 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 4u)).x);
        float sampledTextureValue17 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 5u)).x);
        float sampledTextureValue18 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 6u)).x);
        float sampledTextureValue19 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 7u)).x);
        uvec4 sampledTextureValue20 = texelFetch(pbrData, int((scalarValue4 * 16u) + 8u));
        uint scalarValue30 = sampledTextureValue20.x;
        float sampledTextureValue21 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 12u)).x);
        float sampledTextureValue22 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 13u)).x);
        float sampledTextureValue23 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 15u)).x);
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue30 & 4u) == 0u)
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        productValue2 = (((productValue26 - scalarValue26) * scalarValue29) + scalarValue26) * varyingColor0.w;
        productValue3 = (((productValue27 - scalarValue27) * scalarValue29) + scalarValue27) * varyingColor0.w;
    }
    else
    {
        productValue2 = productValue26;
        productValue3 = productValue27;
    }
    float productValue60 = (fragmentVectorConstants1.packedValues[15u].x * productValue2) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue61 = (fragmentVectorConstants1.packedValues[15u].y * productValue3) * ((fragmentVectorConstants1.packedValues[13u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue62 = productValue60 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue63 = productValue60 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue64 = productValue60 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue46 = ceil(productValue61);
    float productValue65 = (((productValue61 * fragmentVectorConstants1.packedValues[16u].x) - productValue62) * scalarValue46) + productValue62;
    float productValue66 = (((productValue61 * fragmentVectorConstants1.packedValues[16u].y) - productValue63) * scalarValue46) + productValue63;
    float productValue67 = (((productValue61 * fragmentVectorConstants1.packedValues[16u].z) - productValue64) * scalarValue46) + productValue64;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if (scalarValue4 == 65535u)
    {
        intermediateValue7 = 0.0;
        intermediateValue8 = 1.0;
        intermediateValue9 = 0.0;
        intermediateValue10 = 0.0;
        intermediateValue12 = varyingNormal0.x;
        intermediateValue13 = varyingNormal0.y;
        intermediateValue14 = varyingNormal0.z;
    }
    else
    {
        float sampledTextureValue16 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 4u)).x);
        float sampledTextureValue17 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 5u)).x);
        float sampledTextureValue18 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 6u)).x);
        float sampledTextureValue19 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 7u)).x);
        uvec4 sampledTextureValue20 = texelFetch(pbrData, int((scalarValue4 * 16u) + 8u));
        uint scalarValue30 = sampledTextureValue20.x;
        float sampledTextureValue21 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 12u)).x);
        float sampledTextureValue22 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 13u)).x);
        float sampledTextureValue23 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 15u)).x);
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue30 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, scalarValue5, scalarValue7), fma(varyingTexCoord0.y, scalarValue6, scalarValue8)));
            multiplyAddValue13 = fma(sampledTextureValue4.y, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue4.x, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue4.z, 2.0, -1.0);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, scalarValue5, scalarValue7), fma(varyingTexCoord0.y, scalarValue6, scalarValue8)));
            multiplyAddValue12 = fma(sampledTextureValue4.y, 2.0, -1.0);
            multiplyAddValue13 = fma(sampledTextureValue4.x, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue4.z, 2.0, -1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue30 & 8u) == 0u)
            {
                float branchMergedValue3;
                float branchMergedValue5;
                float branchMergedValue6;
                if ((scalarValue30 & 16u) == 0u)
                {
                    branchMergedValue3 = 0.0;
                    branchMergedValue5 = 0.0;
                    branchMergedValue6 = 1.0;
                }
                else
                {
                    float multiplyAddValue30 = fma(varyingTexCoord0.x, sampledTextureValue16, sampledTextureValue18);
                    float multiplyAddValue31 = fma(varyingTexCoord0.y, sampledTextureValue17, sampledTextureValue19);
                    vec4 sampledTextureValue24 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue30, multiplyAddValue31), 0.0);
                    float scalarValue31 = sampledTextureValue24.x;
                    float scalarValue32 = sampledTextureValue24.y;
                    float scalarValue33 = sampledTextureValue24.z;
                    float multiplyAddValue32 = spvNClamp(fma(spvNMin(sampledTextureValue23 - sampledTextureValue22, sampledTextureValue23), -1.0, 2.0), 0.0, 1.0);
                    bool conditionValue6 = multiplyAddValue32 > 0.0;
                    float branchMergedValue9;
                    float branchMergedValue10;
                    float branchMergedValue11;
                    if ((scalarValue31 == scalarValue32) && (scalarValue32 == scalarValue33))
                    {
                        float branchMergedValue12;
                        float branchMergedValue14;
                        float branchMergedValue15;
                        if (conditionValue6)
                        {
                            uvec2 sampledTextureValue25 = uvec2(textureSize(matTextureTexture, int(0u)));
                            float productValue35 = float(int(uint(int(float(int(sampledTextureValue25.x)))))) * multiplyAddValue30;
                            float productValue36 = float(int(uint(int(float(int(sampledTextureValue25.y)))))) * multiplyAddValue31;
                            float scalarValue34 = fract(productValue35);
                            float scalarValue35 = fract(productValue36);
                            float comparisonValue10;
                            if (abs(scalarValue34 + (-0.5)) < 0.0625)
                            {
                                comparisonValue10 = ((scalarValue34 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue30;
                            }
                            else
                            {
                                comparisonValue10 = multiplyAddValue30;
                            }
                            float comparisonValue11;
                            if (abs(scalarValue35 + (-0.5)) < 0.0625)
                            {
                                comparisonValue11 = ((scalarValue35 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue31;
                            }
                            else
                            {
                                comparisonValue11 = multiplyAddValue31;
                            }
                            vec4 sampledTextureValue26 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue10, comparisonValue11));
                            float scalarValue36 = sampledTextureValue26.x;
                            float scalarValue37 = sampledTextureValue26.y;
                            float scalarValue38 = sampledTextureValue26.z;
                            float scalarValue39 = sampledTextureValue26.w;
                            float sumValue23 = fract(productValue35 + 0.5);
                            float sumValue24 = fract(productValue36 + 0.5);
                            bool conditionValue7 = sumValue24 > 0.5;
                            float intermediateValue1[2];
                            intermediateValue1[0u] = conditionValue7 ? scalarValue36 : scalarValue39;
                            intermediateValue1[1u] = conditionValue7 ? scalarValue37 : scalarValue38;
                            float productValue37 = intermediateValue1[uint(int(spvNClamp((sumValue23 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                            float productValue38 = intermediateValue1[uint(int(spvNClamp((sumValue23 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float sumValue25 = productValue37 - productValue38;
                            bool conditionValue8 = sumValue23 > 0.5;
                            intermediateValue1[0u] = conditionValue8 ? scalarValue38 : scalarValue39;
                            intermediateValue1[1u] = conditionValue8 ? scalarValue37 : scalarValue36;
                            float productValue39 = intermediateValue1[uint(int(spvNClamp((sumValue24 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue24 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                            float inverseLengthValue7 = inversesqrt(dot(vec3(sumValue25, productValue39, 0.25), vec3(sumValue25, productValue39, 0.25)));
                            float productValue40 = inverseLengthValue7 * multiplyAddValue32;
                            branchMergedValue12 = productValue40 * sumValue25;
                            branchMergedValue14 = productValue40 * productValue39;
                            branchMergedValue15 = inverseLengthValue7 * 0.25;
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
                        uvec2 sampledTextureValue27 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float branchMergedValue13;
                        float branchMergedValue16;
                        float branchMergedValue17;
                        if (conditionValue6)
                        {
                            float productValue41 = fract(float(int(uint(int(float(int(sampledTextureValue27.x)))))) * multiplyAddValue30);
                            float productValue42 = fract(float(int(uint(int(float(int(sampledTextureValue27.y)))))) * multiplyAddValue31);
                            float comparisonValue32 = (((productValue41 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue32 * 2.0) + (-1.0))) - (((productValue41 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue24.w * 2.0) + (-1.0)));
                            float comparisonValue33 = (((productValue42 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue33 * 2.0) + (-1.0))) - (((productValue42 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue31 * 2.0) + (-1.0)));
                            float comparisonValue34 = ((abs(comparisonValue32) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue32;
                            float comparisonValue35 = ((abs(comparisonValue33) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue33;
                            float inverseLengthValue8 = inversesqrt(dot(vec3(comparisonValue34, comparisonValue35, 0.25), vec3(comparisonValue34, comparisonValue35, 0.25)));
                            float productValue43 = inverseLengthValue8 * multiplyAddValue32;
                            branchMergedValue13 = productValue43 * comparisonValue34;
                            branchMergedValue16 = productValue43 * comparisonValue35;
                            branchMergedValue17 = inverseLengthValue8 * 0.25;
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
                float multiplyAddValue33 = fma(varyingTexCoord0.x, sampledTextureValue16, sampledTextureValue18);
                float multiplyAddValue34 = fma(varyingTexCoord0.y, sampledTextureValue17, sampledTextureValue19);
                float multiplyAddValue35 = spvNClamp(fma(spvNMin(sampledTextureValue23 - sampledTextureValue22, sampledTextureValue23), -1.0, 2.0), 0.0, 1.0);
                float branchMergedValue4;
                float branchMergedValue7;
                float branchMergedValue8;
                if (multiplyAddValue35 > 0.0)
                {
                    uvec2 sampledTextureValue28 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float productValue44 = float(int(uint(int(float(int(sampledTextureValue28.x)))))) * multiplyAddValue33;
                    float productValue45 = float(int(uint(int(float(int(sampledTextureValue28.y)))))) * multiplyAddValue34;
                    float scalarValue40 = fract(productValue44);
                    float scalarValue41 = fract(productValue45);
                    float comparisonValue4;
                    if (abs(scalarValue40 + (-0.5)) < 0.0625)
                    {
                        comparisonValue4 = ((scalarValue40 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue33;
                    }
                    else
                    {
                        comparisonValue4 = multiplyAddValue33;
                    }
                    float comparisonValue9;
                    if (abs(scalarValue41 + (-0.5)) < 0.0625)
                    {
                        comparisonValue9 = ((scalarValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue34;
                    }
                    else
                    {
                        comparisonValue9 = multiplyAddValue34;
                    }
                    vec4 sampledTextureValue29 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue4, comparisonValue9));
                    float scalarValue42 = sampledTextureValue29.x;
                    float scalarValue43 = sampledTextureValue29.y;
                    float scalarValue44 = sampledTextureValue29.z;
                    float scalarValue45 = sampledTextureValue29.w;
                    float sumValue26 = fract(productValue44 + 0.5);
                    float sumValue27 = fract(productValue45 + 0.5);
                    bool conditionValue9 = sumValue27 > 0.5;
                    float intermediateValue2[2];
                    intermediateValue2[0u] = conditionValue9 ? scalarValue42 : scalarValue45;
                    intermediateValue2[1u] = conditionValue9 ? scalarValue43 : scalarValue44;
                    float productValue46 = intermediateValue2[uint(int(spvNClamp((sumValue26 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                    float productValue47 = intermediateValue2[uint(int(spvNClamp((sumValue26 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float sumValue28 = productValue46 - productValue47;
                    bool conditionValue10 = sumValue26 > 0.5;
                    intermediateValue2[0u] = conditionValue10 ? scalarValue44 : scalarValue45;
                    intermediateValue2[1u] = conditionValue10 ? scalarValue43 : scalarValue42;
                    float productValue48 = intermediateValue2[uint(int(spvNClamp((sumValue27 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue2[uint(int(spvNClamp((sumValue27 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                    float inverseLengthValue9 = inversesqrt(dot(vec3(sumValue28, productValue48, 0.25), vec3(sumValue28, productValue48, 0.25)));
                    float productValue49 = inverseLengthValue9 * multiplyAddValue35;
                    branchMergedValue4 = productValue49 * sumValue28;
                    branchMergedValue7 = productValue49 * productValue48;
                    branchMergedValue8 = inverseLengthValue9 * 0.25;
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
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits4 = uintBitsToFloat(intermediateValue1.packedValues[(scalarValue4 * 16u) + 15u]);
            float intermediateValue30;
            float intermediateValue31;
            float intermediateValue32;
            if ((reinterpretedBits3 & 8u) == 8u)
            {
                float sumValue = spvNClamp(2.0 - spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue10), 0.0, 1.0);
                float productValue10;
                float productValue11;
                float productValue12;
                if (sumValue > 0.0)
                {
                    float multiplyAddValue10 = fma(varyingTexCoord0.x, scalarValue5, scalarValue7);
                    float multiplyAddValue11 = fma(varyingTexCoord0.y, scalarValue6, scalarValue8);
                    bool sampledTextureValue5 = uint(textureQueryLevels(materialTexture0)) > 0u;
                    uvec2 sampledTextureValue6 = uvec2(textureSize(materialTexture0, int(0u)));
                    uint scalarValue11 = sampledTextureValue6.x;
                    float comparisonValue2 = rdEvaluateFloatExpression(sampledTextureValue5 ? scalarValue11 : 0u);
                    float comparisonValue3 = rdEvaluateFloatExpression(sampledTextureValue5 ? sampledTextureValue6.y : 0u);
                    float productValue = fract(multiplyAddValue10 * comparisonValue2);
                    float productValue1 = fract(multiplyAddValue11 * comparisonValue3);
                    vec4 sampledTextureValue7 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue - 0.5) < 0.0625) ? (multiplyAddValue10 + ((productValue > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue10, (abs(productValue1 - 0.5) < 0.0625) ? (multiplyAddValue11 + ((productValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue11));
                    float scalarValue12 = sampledTextureValue7.x;
                    float scalarValue13 = sampledTextureValue7.y;
                    float scalarValue14 = sampledTextureValue7.z;
                    float scalarValue15 = sampledTextureValue7.w;
                    float multiplyAddValue16 = fract(fma(multiplyAddValue10, comparisonValue2, 0.5));
                    float multiplyAddValue17 = fract(fma(multiplyAddValue11, comparisonValue3, 0.5));
                    bool conditionValue = multiplyAddValue17 > 0.5;
                    bool conditionValue1 = multiplyAddValue16 > 0.5;
                    float comparisonValue5 = conditionValue ? scalarValue12 : scalarValue15;
                    float comparisonValue6 = conditionValue ? scalarValue13 : scalarValue14;
                    float comparisonValue7 = conditionValue1 ? scalarValue14 : scalarValue15;
                    float comparisonValue8 = conditionValue1 ? scalarValue13 : scalarValue12;
                    float sumValue1 = multiplyAddValue16 - 0.083333335816860198974609375;
                    float sumValue2 = multiplyAddValue16 + 0.083333335816860198974609375;
                    float sumValue3 = multiplyAddValue17 - 0.083333335816860198974609375;
                    float sumValue4 = multiplyAddValue17 + 0.083333335816860198974609375;
                    uint sumValue5 = uint(int(spvNClamp(sumValue1 + sumValue1, 0.0, 1.0)));
                    uint sumValue6 = uint(int(spvNClamp(sumValue2 + sumValue2, 0.0, 1.0)));
                    uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                    uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                    float comparisonValue12 = ((sumValue5 == 1u) ? comparisonValue6 : ((sumValue5 == 0u) ? comparisonValue5 : 0.0)) - ((sumValue6 == 1u) ? comparisonValue6 : ((sumValue6 == 0u) ? comparisonValue5 : 0.0));
                    float comparisonValue13 = ((sumValue7 == 1u) ? comparisonValue8 : ((sumValue7 == 0u) ? comparisonValue7 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue8 : ((sumValue8 == 0u) ? comparisonValue7 : 0.0));
                    vec3 vectorValue = vec3(comparisonValue12, comparisonValue13, 0.25);
                    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                    productValue10 = sumValue * (inverseLengthValue * comparisonValue13);
                    productValue11 = sumValue * (inverseLengthValue * comparisonValue12);
                    productValue12 = inverseLengthValue * 0.25;
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
                    float multiplyAddValue18 = fma(varyingTexCoord0.x, scalarValue5, scalarValue7);
                    float multiplyAddValue19 = fma(varyingTexCoord0.y, scalarValue6, scalarValue8);
                    float sumValue9 = spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue10);
                    vec4 sampledTextureValue8 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue18, multiplyAddValue19), 0.0);
                    float scalarValue16 = sampledTextureValue8.x;
                    float scalarValue17 = sampledTextureValue8.y;
                    float scalarValue18 = sampledTextureValue8.z;
                    float intermediateValue48;
                    float intermediateValue50;
                    float intermediateValue52;
                    if ((scalarValue17 == scalarValue16) && (scalarValue18 == scalarValue17))
                    {
                        float scalarValue19 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        float productValue15;
                        float productValue16;
                        float productValue17;
                        if (scalarValue19 > 0.0)
                        {
                            bool sampledTextureValue9 = uint(textureQueryLevels(materialTexture0)) > 0u;
                            uvec2 sampledTextureValue10 = uvec2(textureSize(materialTexture0, int(0u)));
                            uint scalarValue20 = sampledTextureValue10.x;
                            float comparisonValue14 = rdEvaluateFloatExpression(sampledTextureValue9 ? scalarValue20 : 0u);
                            float comparisonValue15 = rdEvaluateFloatExpression(sampledTextureValue9 ? sampledTextureValue10.y : 0u);
                            float productValue6 = fract(multiplyAddValue18 * comparisonValue14);
                            float productValue7 = fract(multiplyAddValue19 * comparisonValue15);
                            vec4 sampledTextureValue11 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue6 - 0.5) < 0.0625) ? (multiplyAddValue18 + ((productValue6 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue18, (abs(productValue7 - 0.5) < 0.0625) ? (multiplyAddValue19 + ((productValue7 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue19));
                            float scalarValue21 = sampledTextureValue11.x;
                            float scalarValue22 = sampledTextureValue11.y;
                            float scalarValue23 = sampledTextureValue11.z;
                            float scalarValue24 = sampledTextureValue11.w;
                            float multiplyAddValue20 = fract(fma(multiplyAddValue18, comparisonValue14, 0.5));
                            float multiplyAddValue21 = fract(fma(multiplyAddValue19, comparisonValue15, 0.5));
                            bool conditionValue2 = multiplyAddValue21 > 0.5;
                            bool conditionValue3 = multiplyAddValue20 > 0.5;
                            float comparisonValue16 = conditionValue2 ? scalarValue21 : scalarValue24;
                            float comparisonValue17 = conditionValue2 ? scalarValue22 : scalarValue23;
                            float comparisonValue18 = conditionValue3 ? scalarValue23 : scalarValue24;
                            float comparisonValue19 = conditionValue3 ? scalarValue22 : scalarValue21;
                            float sumValue10 = multiplyAddValue20 - 0.083333335816860198974609375;
                            float sumValue11 = multiplyAddValue20 + 0.083333335816860198974609375;
                            float sumValue12 = multiplyAddValue21 - 0.083333335816860198974609375;
                            float sumValue13 = multiplyAddValue21 + 0.083333335816860198974609375;
                            uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                            uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                            uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                            uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                            float comparisonValue20 = ((sumValue14 == 1u) ? comparisonValue17 : ((sumValue14 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue15 == 1u) ? comparisonValue17 : ((sumValue15 == 0u) ? comparisonValue16 : 0.0));
                            float comparisonValue21 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                            vec3 vectorValue1 = vec3(comparisonValue20, comparisonValue21, 0.25);
                            float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                            productValue15 = scalarValue19 * (inverseLengthValue1 * comparisonValue21);
                            productValue16 = scalarValue19 * (inverseLengthValue1 * comparisonValue20);
                            productValue17 = inverseLengthValue1 * 0.25;
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
                        bool sampledTextureValue12 = uint(textureQueryLevels(materialTexture0)) > 0u;
                        uvec2 sampledTextureValue13 = uvec2(textureSize(materialTexture0, int(0u)));
                        uint scalarValue25 = sampledTextureValue13.x;
                        float sumValue18 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        bool conditionValue4 = sumValue18 > 0.0;
                        float comparisonValue22 = fract(multiplyAddValue18 * rdEvaluateFloatExpression(sampledTextureValue12 ? scalarValue25 : 0u));
                        float comparisonValue23 = fract(multiplyAddValue19 * rdEvaluateFloatExpression(sampledTextureValue12 ? sampledTextureValue13.y : 0u));
                        float multiplyAddValue22 = (comparisonValue22 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue8.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue23 = (comparisonValue23 <= 0.083333335816860198974609375) ? (-fma(scalarValue16, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue24 = (comparisonValue22 >= 0.916666686534881591796875) ? (fma(scalarValue17, 2.0, -1.0) + multiplyAddValue22) : multiplyAddValue22;
                        float multiplyAddValue25 = (comparisonValue23 >= 0.916666686534881591796875) ? (fma(scalarValue18, 2.0, -1.0) + multiplyAddValue23) : multiplyAddValue23;
                        bool comparisonValue24 = abs(multiplyAddValue24) >= 0.004999999888241291046142578125;
                        bool comparisonValue25 = abs(multiplyAddValue25) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue26 = vec3(comparisonValue24 ? multiplyAddValue24 : 0.0, comparisonValue25 ? multiplyAddValue25 : 0.0, 0.25);
                        float inverseLengthValue2 = inversesqrt(rdDot3Precise2(comparisonValue26, comparisonValue26));
                        intermediateValue48 = (conditionValue4 && comparisonValue25) ? (sumValue18 * (inverseLengthValue2 * multiplyAddValue25)) : 0.0;
                        intermediateValue50 = (conditionValue4 && comparisonValue24) ? (sumValue18 * (inverseLengthValue2 * multiplyAddValue24)) : 0.0;
                        intermediateValue52 = conditionValue4 ? (inverseLengthValue2 * 0.25) : 1.0;
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
            multiplyAddValue13 = intermediateValue30;
            multiplyAddValue14 = intermediateValue31;
            multiplyAddValue15 = intermediateValue32;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float reinterpretedBits4 = uintBitsToFloat(intermediateValue1.packedValues[(scalarValue4 * 16u) + 15u]);
            float intermediateValue30;
            float intermediateValue31;
            float intermediateValue32;
            if ((reinterpretedBits3 & 8u) == 8u)
            {
                float sumValue = spvNClamp(2.0 - spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue10), 0.0, 1.0);
                float productValue13;
                float productValue14;
                float productValue15;
                if (sumValue > 0.0)
                {
                    float multiplyAddValue10 = fma(varyingTexCoord0.x, scalarValue5, scalarValue7);
                    float multiplyAddValue11 = fma(varyingTexCoord0.y, scalarValue6, scalarValue8);
                    bool sampledTextureValue5 = uint(textureQueryLevels(materialTexture0)) > 0u;
                    uvec2 sampledTextureValue6 = uvec2(textureSize(materialTexture0, int(0u)));
                    uint scalarValue11 = sampledTextureValue6.x;
                    float comparisonValue2 = rdEvaluateFloatExpression(sampledTextureValue5 ? scalarValue11 : 0u);
                    float comparisonValue3 = rdEvaluateFloatExpression(sampledTextureValue5 ? sampledTextureValue6.y : 0u);
                    float productValue = fract(multiplyAddValue10 * comparisonValue2);
                    float productValue1 = fract(multiplyAddValue11 * comparisonValue3);
                    vec4 sampledTextureValue7 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue - 0.5) < 0.0625) ? (multiplyAddValue10 + ((productValue > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue10, (abs(productValue1 - 0.5) < 0.0625) ? (multiplyAddValue11 + ((productValue1 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue11));
                    float scalarValue12 = sampledTextureValue7.x;
                    float scalarValue13 = sampledTextureValue7.y;
                    float scalarValue14 = sampledTextureValue7.z;
                    float scalarValue15 = sampledTextureValue7.w;
                    float multiplyAddValue16 = fract(fma(multiplyAddValue10, comparisonValue2, 0.5));
                    float multiplyAddValue17 = fract(fma(multiplyAddValue11, comparisonValue3, 0.5));
                    bool conditionValue = multiplyAddValue17 > 0.5;
                    bool conditionValue1 = multiplyAddValue16 > 0.5;
                    float comparisonValue5 = conditionValue ? scalarValue12 : scalarValue15;
                    float comparisonValue6 = conditionValue ? scalarValue13 : scalarValue14;
                    float comparisonValue7 = conditionValue1 ? scalarValue14 : scalarValue15;
                    float comparisonValue8 = conditionValue1 ? scalarValue13 : scalarValue12;
                    float sumValue1 = multiplyAddValue16 - 0.083333335816860198974609375;
                    float sumValue2 = multiplyAddValue16 + 0.083333335816860198974609375;
                    float sumValue3 = multiplyAddValue17 - 0.083333335816860198974609375;
                    float sumValue4 = multiplyAddValue17 + 0.083333335816860198974609375;
                    uint sumValue5 = uint(int(spvNClamp(sumValue1 + sumValue1, 0.0, 1.0)));
                    uint sumValue6 = uint(int(spvNClamp(sumValue2 + sumValue2, 0.0, 1.0)));
                    uint sumValue7 = uint(int(spvNClamp(sumValue3 + sumValue3, 0.0, 1.0)));
                    uint sumValue8 = uint(int(spvNClamp(sumValue4 + sumValue4, 0.0, 1.0)));
                    float comparisonValue12 = ((sumValue5 == 1u) ? comparisonValue6 : ((sumValue5 == 0u) ? comparisonValue5 : 0.0)) - ((sumValue6 == 1u) ? comparisonValue6 : ((sumValue6 == 0u) ? comparisonValue5 : 0.0));
                    float comparisonValue13 = ((sumValue7 == 1u) ? comparisonValue8 : ((sumValue7 == 0u) ? comparisonValue7 : 0.0)) - ((sumValue8 == 1u) ? comparisonValue8 : ((sumValue8 == 0u) ? comparisonValue7 : 0.0));
                    vec3 vectorValue = vec3(comparisonValue12, comparisonValue13, 0.25);
                    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
                    productValue13 = sumValue * (inverseLengthValue * comparisonValue13);
                    productValue14 = sumValue * (inverseLengthValue * comparisonValue12);
                    productValue15 = inverseLengthValue * 0.25;
                }
                else
                {
                    productValue13 = 0.0;
                    productValue14 = 0.0;
                    productValue15 = 1.0;
                }
                intermediateValue30 = productValue13;
                intermediateValue31 = productValue14;
                intermediateValue32 = productValue15;
            }
            else
            {
                float intermediateValue47;
                float intermediateValue49;
                float intermediateValue51;
                if ((reinterpretedBits3 & 16u) == 16u)
                {
                    float multiplyAddValue18 = fma(varyingTexCoord0.x, scalarValue5, scalarValue7);
                    float multiplyAddValue19 = fma(varyingTexCoord0.y, scalarValue6, scalarValue8);
                    float sumValue9 = spvNMin(reinterpretedBits4, reinterpretedBits4 - scalarValue10);
                    vec4 sampledTextureValue8 = textureLod(sampler2D(materialTexture0, textureSampler0), vec2(multiplyAddValue18, multiplyAddValue19), 0.0);
                    float scalarValue16 = sampledTextureValue8.x;
                    float scalarValue17 = sampledTextureValue8.y;
                    float scalarValue18 = sampledTextureValue8.z;
                    float intermediateValue48;
                    float intermediateValue50;
                    float intermediateValue52;
                    if ((scalarValue17 == scalarValue16) && (scalarValue18 == scalarValue17))
                    {
                        float scalarValue19 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        float productValue18;
                        float productValue19;
                        float productValue20;
                        if (scalarValue19 > 0.0)
                        {
                            bool sampledTextureValue9 = uint(textureQueryLevels(materialTexture0)) > 0u;
                            uvec2 sampledTextureValue10 = uvec2(textureSize(materialTexture0, int(0u)));
                            uint scalarValue20 = sampledTextureValue10.x;
                            float comparisonValue14 = rdEvaluateFloatExpression(sampledTextureValue9 ? scalarValue20 : 0u);
                            float comparisonValue15 = rdEvaluateFloatExpression(sampledTextureValue9 ? sampledTextureValue10.y : 0u);
                            float productValue6 = fract(multiplyAddValue18 * comparisonValue14);
                            float productValue7 = fract(multiplyAddValue19 * comparisonValue15);
                            vec4 sampledTextureValue11 = textureGather(sampler2D(materialTexture0, textureSampler0), vec2((abs(productValue6 - 0.5) < 0.0625) ? (multiplyAddValue18 + ((productValue6 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue18, (abs(productValue7 - 0.5) < 0.0625) ? (multiplyAddValue19 + ((productValue7 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue19));
                            float scalarValue21 = sampledTextureValue11.x;
                            float scalarValue22 = sampledTextureValue11.y;
                            float scalarValue23 = sampledTextureValue11.z;
                            float scalarValue24 = sampledTextureValue11.w;
                            float multiplyAddValue20 = fract(fma(multiplyAddValue18, comparisonValue14, 0.5));
                            float multiplyAddValue21 = fract(fma(multiplyAddValue19, comparisonValue15, 0.5));
                            bool conditionValue2 = multiplyAddValue21 > 0.5;
                            bool conditionValue3 = multiplyAddValue20 > 0.5;
                            float comparisonValue16 = conditionValue2 ? scalarValue21 : scalarValue24;
                            float comparisonValue17 = conditionValue2 ? scalarValue22 : scalarValue23;
                            float comparisonValue18 = conditionValue3 ? scalarValue23 : scalarValue24;
                            float comparisonValue19 = conditionValue3 ? scalarValue22 : scalarValue21;
                            float sumValue10 = multiplyAddValue20 - 0.083333335816860198974609375;
                            float sumValue11 = multiplyAddValue20 + 0.083333335816860198974609375;
                            float sumValue12 = multiplyAddValue21 - 0.083333335816860198974609375;
                            float sumValue13 = multiplyAddValue21 + 0.083333335816860198974609375;
                            uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                            uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                            uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                            uint sumValue17 = uint(int(spvNClamp(sumValue13 + sumValue13, 0.0, 1.0)));
                            float comparisonValue20 = ((sumValue14 == 1u) ? comparisonValue17 : ((sumValue14 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue15 == 1u) ? comparisonValue17 : ((sumValue15 == 0u) ? comparisonValue16 : 0.0));
                            float comparisonValue21 = ((sumValue16 == 1u) ? comparisonValue19 : ((sumValue16 == 0u) ? comparisonValue18 : 0.0)) - ((sumValue17 == 1u) ? comparisonValue19 : ((sumValue17 == 0u) ? comparisonValue18 : 0.0));
                            vec3 vectorValue1 = vec3(comparisonValue20, comparisonValue21, 0.25);
                            float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
                            productValue18 = scalarValue19 * (inverseLengthValue1 * comparisonValue21);
                            productValue19 = scalarValue19 * (inverseLengthValue1 * comparisonValue20);
                            productValue20 = inverseLengthValue1 * 0.25;
                        }
                        else
                        {
                            productValue18 = 0.0;
                            productValue19 = 0.0;
                            productValue20 = 1.0;
                        }
                        intermediateValue48 = productValue18;
                        intermediateValue50 = productValue19;
                        intermediateValue52 = productValue20;
                    }
                    else
                    {
                        bool sampledTextureValue12 = uint(textureQueryLevels(materialTexture0)) > 0u;
                        uvec2 sampledTextureValue13 = uvec2(textureSize(materialTexture0, int(0u)));
                        uint scalarValue25 = sampledTextureValue13.x;
                        float sumValue18 = spvNClamp(2.0 - sumValue9, 0.0, 1.0);
                        bool conditionValue4 = sumValue18 > 0.0;
                        float comparisonValue22 = fract(multiplyAddValue18 * rdEvaluateFloatExpression(sampledTextureValue12 ? scalarValue25 : 0u));
                        float comparisonValue23 = fract(multiplyAddValue19 * rdEvaluateFloatExpression(sampledTextureValue12 ? sampledTextureValue13.y : 0u));
                        float multiplyAddValue22 = (comparisonValue22 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue8.w, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue23 = (comparisonValue23 <= 0.083333335816860198974609375) ? (-fma(scalarValue16, 2.0, -1.0)) : 0.0;
                        float multiplyAddValue24 = (comparisonValue22 >= 0.916666686534881591796875) ? (fma(scalarValue17, 2.0, -1.0) + multiplyAddValue22) : multiplyAddValue22;
                        float multiplyAddValue25 = (comparisonValue23 >= 0.916666686534881591796875) ? (fma(scalarValue18, 2.0, -1.0) + multiplyAddValue23) : multiplyAddValue23;
                        bool comparisonValue24 = abs(multiplyAddValue24) >= 0.004999999888241291046142578125;
                        bool comparisonValue25 = abs(multiplyAddValue25) >= 0.004999999888241291046142578125;
                        vec3 comparisonValue26 = vec3(comparisonValue24 ? multiplyAddValue24 : 0.0, comparisonValue25 ? multiplyAddValue25 : 0.0, 0.25);
                        float inverseLengthValue2 = inversesqrt(rdDot3Precise2(comparisonValue26, comparisonValue26));
                        intermediateValue48 = (conditionValue4 && comparisonValue25) ? (sumValue18 * (inverseLengthValue2 * multiplyAddValue25)) : 0.0;
                        intermediateValue50 = (conditionValue4 && comparisonValue24) ? (sumValue18 * (inverseLengthValue2 * multiplyAddValue24)) : 0.0;
                        intermediateValue52 = conditionValue4 ? (inverseLengthValue2 * 0.25) : 1.0;
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
            multiplyAddValue12 = intermediateValue30;
            multiplyAddValue13 = intermediateValue31;
            multiplyAddValue14 = intermediateValue32;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            vec4 sampledTextureValue30 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, sampledTextureValue16, sampledTextureValue18), fma(varyingTexCoord0.y, sampledTextureValue17, sampledTextureValue19)));
            intermediateValue18 = (sampledTextureValue30.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue30.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue30.z * 2.0) + (-1.0);
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM50
        float intermediateValue22;
        float intermediateValue24;
        float intermediateValue26;
        float comparisonValue1;
        if ((reinterpretedBits3 & 1u) == 1u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float sampledTextureValue1;
        float sampledTextureValue2;
        float sampledTextureValue3;
        float intermediateValue11;
        if ((scalarValue30 & 1u) == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            vec4 reinterpretedBits5 = uintBitsToFloat(intermediateValue3.packedValues[scalarValue4 * 4u]);
            vec4 sampledTextureValue14 = texture(sampler2D(materialTexture0, textureSampler0), vec2(fma(varyingTexCoord0.x, reinterpretedBits5.x, reinterpretedBits5.z), fma(varyingTexCoord0.y, reinterpretedBits5.y, reinterpretedBits5.w)));
            comparisonValue1 = ((reinterpretedBits3 & 2u) == 2u) ? sampledTextureValue14.w : scalarValue9;
            intermediateValue26 = sampledTextureValue14.x;
            intermediateValue24 = sampledTextureValue14.z;
            intermediateValue22 = sampledTextureValue14.y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            sampledTextureValue3 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 10u)).x);
            sampledTextureValue1 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 11u)).x);
            sampledTextureValue2 = uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 9u)).x);
            intermediateValue11 = sampledTextureValue21;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            comparisonValue1 = scalarValue9;
            intermediateValue26 = reinterpretedBits1.w;
            intermediateValue24 = reinterpretedBits1.y;
            intermediateValue22 = reinterpretedBits1.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            vec4 sampledTextureValue31 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord0.x, uintBitsToFloat(texelFetch(pbrData, int(scalarValue4 * 16u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 2u)).x)), fma(varyingTexCoord0.y, uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 1u)).x), uintBitsToFloat(texelFetch(pbrData, int((scalarValue4 * 16u) + 3u)).x))));
            sampledTextureValue3 = sampledTextureValue31.y;
            sampledTextureValue1 = sampledTextureValue31.x;
            sampledTextureValue2 = sampledTextureValue31.z;
            intermediateValue11 = ((scalarValue30 & 2u) != 0u) ? sampledTextureValue31.w : sampledTextureValue21;
#endif
        }
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue27 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue28 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue29 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        vec3 vectorValue4 = vec3(comparisonValue27, comparisonValue28, comparisonValue29);
        float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        intermediateValue21 = intermediateValue22;
        intermediateValue23 = intermediateValue24;
        multiplyAddValue6 = fma(inverseLengthValue5 * comparisonValue29, multiplyAddValue15, fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue14, multiplyAddValue13 * (inverseLengthValue4 * varyingBitangent0.z)));
        multiplyAddValue7 = fma(inverseLengthValue5 * comparisonValue28, multiplyAddValue15, fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue14, multiplyAddValue13 * (inverseLengthValue4 * varyingBitangent0.y)));
        multiplyAddValue8 = fma(inverseLengthValue5 * comparisonValue27, multiplyAddValue15, fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue14, multiplyAddValue13 * (inverseLengthValue4 * varyingBitangent0.x)));
        intermediateValue25 = intermediateValue26;
        intermediateValue27 = comparisonValue1;
    }
    else
    {
        intermediateValue21 = 0.0;
        intermediateValue23 = 1.0;
        multiplyAddValue6 = varyingNormal0.z;
        multiplyAddValue7 = varyingNormal0.y;
        multiplyAddValue8 = varyingNormal0.x;
        intermediateValue25 = 0.0;
        intermediateValue27 = 0.0;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue27 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue28 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue29 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
        vec3 vectorValue4 = vec3(comparisonValue27, comparisonValue28, comparisonValue29);
        float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue4, vectorValue4));
        intermediateValue21 = intermediateValue22;
        intermediateValue23 = intermediateValue24;
        multiplyAddValue5 = fma(inverseLengthValue5 * comparisonValue29, multiplyAddValue14, fma(inverseLengthValue3 * varyingTangent0.z, multiplyAddValue13, multiplyAddValue12 * (inverseLengthValue4 * varyingBitangent0.z)));
        multiplyAddValue6 = fma(inverseLengthValue5 * comparisonValue28, multiplyAddValue14, fma(inverseLengthValue3 * varyingTangent0.y, multiplyAddValue13, multiplyAddValue12 * (inverseLengthValue4 * varyingBitangent0.y)));
        multiplyAddValue7 = fma(inverseLengthValue5 * comparisonValue27, multiplyAddValue14, fma(inverseLengthValue3 * varyingTangent0.x, multiplyAddValue13, multiplyAddValue12 * (inverseLengthValue4 * varyingBitangent0.x)));
        intermediateValue25 = intermediateValue26;
        intermediateValue27 = comparisonValue1;
    }
    else
    {
        intermediateValue21 = 0.0;
        intermediateValue23 = 1.0;
        multiplyAddValue5 = varyingNormal0.z;
        multiplyAddValue6 = varyingNormal0.y;
        multiplyAddValue7 = varyingNormal0.x;
        intermediateValue25 = 0.0;
        intermediateValue27 = 0.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float comparisonValue36 = comparisonValue31 ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
        float comparisonValue37 = comparisonValue31 ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
        float comparisonValue38 = comparisonValue31 ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
        float inverseLengthValue10 = inversesqrt(dot(vec3(comparisonValue36, comparisonValue37, comparisonValue38), vec3(comparisonValue36, comparisonValue37, comparisonValue38)));
        float inverseLengthValue11 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue12 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        intermediateValue7 = sampledTextureValue1;
        intermediateValue8 = sampledTextureValue2;
        intermediateValue9 = sampledTextureValue3;
        intermediateValue10 = intermediateValue11;
        intermediateValue12 = fma(inverseLengthValue10 * comparisonValue36, intermediateValue20, fma(inverseLengthValue11 * varyingBitangent0.x, intermediateValue19, inverseLengthValue12 * varyingTangent0.x));
        intermediateValue13 = fma(inverseLengthValue10 * comparisonValue37, intermediateValue20, fma(inverseLengthValue11 * varyingBitangent0.y, intermediateValue19, inverseLengthValue12 * varyingTangent0.y));
        intermediateValue14 = fma(inverseLengthValue10 * comparisonValue38, intermediateValue20, fma(inverseLengthValue11 * varyingBitangent0.z, intermediateValue19, inverseLengthValue12 * varyingTangent0.z));
#endif
    }
    float sumValue19 = varyingTexCoord5.x - fragmentVectorConstants1.packedValues[11u].x;
    float sumValue20 = varyingTexCoord5.y - fragmentVectorConstants1.packedValues[11u].y;
    float sumValue21 = varyingTexCoord5.z - fragmentVectorConstants1.packedValues[11u].z;
#if (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor1.w = (intermediateValue27 < intermediateValue25) ? fma(intermediateValue25, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue27, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue5 = vec3(multiplyAddValue8, multiplyAddValue7, multiplyAddValue6);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue8 = inverseLengthValue6 * multiplyAddValue8;
    float productValue9 = inverseLengthValue6 * multiplyAddValue7;
    float productValue21 = inverseLengthValue6 * multiplyAddValue6;
    float quotientValue = 1.0 / (abs(productValue21) + (abs(productValue9) + abs(productValue8)));
    float productValue22 = quotientValue * productValue8;
    float productValue23 = quotientValue * productValue9;
    bool conditionValue5 = productValue21 < 0.0;
    float sumValue22 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? ((1.0 - abs(productValue23)) * ((productValue22 >= 0.0) ? sumValue22 : (-1.0))) : productValue22;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue22)) * ((productValue23 >= 0.0) ? sumValue22 : (-1.0))) : productValue23;
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[35u], sumValue21, fma(fragmentScalarConstants1.packedValues[27u], sumValue19, sumValue20 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue26, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue21, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue19, sumValue20 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue27, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue26, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue21, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue19, sumValue20 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue27, 0.5, 0.5);
    bool bitwiseValue = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[56u] > 9.9999997473787516355514526367188e-05);
    float productValue24 = fragmentScalarConstants1.packedValues[56u] * fragmentScalarConstants1.packedValues[56u];
    float comparisonValue30 = (bitwiseValue ? spvNMin(productValue24, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue28 = (bitwiseValue ? spvNMin(fma(fma(productValue24, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue24, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue29 = (bitwiseValue ? spvNMin(fma(productValue24 * productValue24, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue24, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue25 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue28, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue29, comparisonValue30)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue28 / productValue25, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue30 / productValue25, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue29 / productValue25, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue25, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(fragmentScalarConstants1.packedValues[57u], 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor1.w = (intermediateValue27 < intermediateValue25) ? fma(intermediateValue25, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-intermediateValue27, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(multiplyAddValue7, multiplyAddValue6, multiplyAddValue5);
    float inverseLengthValue14 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
    float productValue71 = inverseLengthValue14 * multiplyAddValue7;
    float productValue72 = inverseLengthValue14 * multiplyAddValue6;
    float productValue73 = inverseLengthValue14 * multiplyAddValue5;
    float quotientValue2 = 1.0 / (abs(productValue73) + (abs(productValue72) + abs(productValue71)));
    float productValue74 = quotientValue2 * productValue71;
    float productValue75 = quotientValue2 * productValue72;
    bool conditionValue12 = productValue73 < 0.0;
    float sumValue22 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue12 ? ((1.0 - abs(productValue75)) * ((productValue74 >= 0.0) ? sumValue22 : (-1.0))) : productValue74;
    fragmentColor2.y = conditionValue12 ? ((1.0 - abs(productValue74)) * ((productValue75 >= 0.0) ? sumValue22 : (-1.0))) : productValue75;
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[15u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[7u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[11u])) + fragmentScalarConstants1.packedValues[19u];
    float multiplyAddValue27 = fma(fragmentScalarConstants1.packedValues[35u], sumValue21, fma(fragmentScalarConstants1.packedValues[27u], sumValue19, sumValue20 * fragmentScalarConstants1.packedValues[31u])) + fragmentScalarConstants1.packedValues[39u];
    fragmentColor2.z = fma((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue26, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue21, fma(fragmentVectorConstants1.packedValues[6u].x, sumValue19, sumValue20 * fragmentVectorConstants1.packedValues[7u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue27, 0.5, 0.5);
    fragmentColor2.w = fma((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[2u].y)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue26, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue21, fma(fragmentVectorConstants1.packedValues[6u].y, sumValue19, sumValue20 * fragmentVectorConstants1.packedValues[7u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue27, 0.5, 0.5);
    bool bitwiseValue = (((fragmentScalarConstants1.packedValues[41u] + fragmentScalarConstants1.packedValues[40u]) + fragmentScalarConstants1.packedValues[42u]) < 9.9999997473787516355514526367188e-05) && (fragmentScalarConstants1.packedValues[56u] > 9.9999997473787516355514526367188e-05);
    float productValue24 = fragmentScalarConstants1.packedValues[56u] * fragmentScalarConstants1.packedValues[56u];
    float comparisonValue30 = (bitwiseValue ? spvNMin(productValue24, 1.0) : fragmentVectorConstants1.packedValues[10u].x) * 0.16666667163372039794921875;
    float multiplyAddValue28 = (bitwiseValue ? spvNMin(fma(fma(productValue24, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue24, 1.0) : fragmentVectorConstants1.packedValues[10u].y) * 0.16666667163372039794921875;
    float multiplyAddValue29 = (bitwiseValue ? spvNMin(fma(productValue24 * productValue24, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue24, 1.0) : fragmentVectorConstants1.packedValues[10u].z) * 0.16666667163372039794921875;
    float productValue25 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue28, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue29, comparisonValue30)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue28 / productValue25, 0.0, 1.0) * 255.0) + (uint(spvNClamp(comparisonValue30 / productValue25, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue29 / productValue25, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue25, 0.0, 1.0) * 255.0);
    fragmentColor0.w = uint(spvNClamp(fragmentScalarConstants1.packedValues[57u], 0.0, 1.0) * 255.0);
    fragmentColor0.x = uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float inverseLengthValue13 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue50 = inverseLengthValue13 * intermediateValue12;
    float productValue51 = inverseLengthValue13 * intermediateValue13;
    float productValue52 = inverseLengthValue13 * intermediateValue14;
    float quotientValue1 = 1.0 / ((abs(productValue51) + abs(productValue50)) + abs(productValue52));
    float productValue53 = quotientValue1 * productValue50;
    float productValue54 = quotientValue1 * productValue51;
    bool conditionValue11 = productValue52 < 0.0;
    float multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue21, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue17;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[14u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue55 = fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue17 = spvNClamp(productValue55, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue55 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue55, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue55 * productValue55) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue55, 0.0, 1.0);
    }
    else
    {
        intermediateValue17 = fragmentVectorConstants1.packedValues[10u].x;
        productValue18 = fragmentVectorConstants1.packedValues[10u].y;
        productValue19 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue56 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue57 = productValue18 * 0.16666667163372039794921875;
    float productValue58 = productValue19 * 0.16666667163372039794921875;
    float productValue59 = ceil(spvNClamp(spvNMax(spvNMax(productValue56, productValue58), spvNMax(productValue57, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue56 / productValue59, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue57 / productValue59, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue58 / productValue59, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue59, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[14u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue32) * fragmentVectorConstants1.packedValues[5u].w) + productValue32;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue33) * fragmentVectorConstants1.packedValues[5u].w) + productValue33;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue34) * fragmentVectorConstants1.packedValues[5u].w) + productValue34;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue11 ? (((productValue53 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue54))) : productValue53;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue53)) * ((productValue54 < 0.0) ? (-1.0) : 1.0)) : productValue54;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue36) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue21, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue37)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue36) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue21, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue37)) * 0.5;
#elif (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float inverseLengthValue13 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue50 = inverseLengthValue13 * intermediateValue12;
    float productValue51 = inverseLengthValue13 * intermediateValue13;
    float productValue52 = inverseLengthValue13 * intermediateValue14;
    float quotientValue1 = 1.0 / ((abs(productValue51) + abs(productValue50)) + abs(productValue52));
    float productValue53 = quotientValue1 * productValue50;
    float productValue54 = quotientValue1 * productValue51;
    bool conditionValue11 = productValue52 < 0.0;
    float multiplyAddValue36 = fma(fragmentVectorConstants1.packedValues[3u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue37 = fma(fragmentVectorConstants1.packedValues[8u].w, sumValue21, fma(fragmentVectorConstants1.packedValues[7u].w, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[6u].w)) + fragmentVectorConstants1.packedValues[9u].w;
    float intermediateValue17;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[14u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[10u].x + fragmentVectorConstants1.packedValues[10u].y) + fragmentVectorConstants1.packedValues[10u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue55 = fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[14u].x;
        intermediateValue17 = spvNClamp(productValue55, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue55 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue55, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue55 * productValue55) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue55, 0.0, 1.0);
    }
    else
    {
        intermediateValue17 = fragmentVectorConstants1.packedValues[10u].x;
        productValue18 = fragmentVectorConstants1.packedValues[10u].y;
        productValue19 = fragmentVectorConstants1.packedValues[10u].z;
    }
    float productValue56 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue57 = productValue18 * 0.16666667163372039794921875;
    float productValue58 = productValue19 * 0.16666667163372039794921875;
    float productValue59 = ceil(spvNClamp(spvNMax(spvNMax(productValue56, productValue58), spvNMax(productValue57, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue56 / productValue59, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue57 / productValue59, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue58 / productValue59, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue59, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = uint(spvNClamp(fragmentVectorConstants1.packedValues[14u].y, 0.0, 1.0) * 255.0);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[5u].x - productValue65) * fragmentVectorConstants1.packedValues[5u].w) + productValue65;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[5u].y - productValue66) * fragmentVectorConstants1.packedValues[5u].w) + productValue66;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[5u].z - productValue67) * fragmentVectorConstants1.packedValues[5u].w) + productValue67;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue11 ? (((productValue53 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue54))) : productValue53;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue53)) * ((productValue54 < 0.0) ? (-1.0) : 1.0)) : productValue54;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[3u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].x) / multiplyAddValue36) - ((fma(fragmentVectorConstants1.packedValues[8u].x, sumValue21, fma(fragmentVectorConstants1.packedValues[7u].x, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[6u].x)) + fragmentVectorConstants1.packedValues[9u].x) / multiplyAddValue37)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[3u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[1u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[4u].y) / multiplyAddValue36) - ((fma(fragmentVectorConstants1.packedValues[8u].y, sumValue21, fma(fragmentVectorConstants1.packedValues[7u].y, sumValue20, sumValue19 * fragmentVectorConstants1.packedValues[6u].y)) + fragmentVectorConstants1.packedValues[9u].y) / multiplyAddValue37)) * 0.5;
#endif
}
