#version 460
#extension GL_GOOGLE_include_directive : require
// ActorBannerPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 11
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
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION2_FLOAT_7 1
#endif

#include "../../include/materials/ActorBannerPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord2.x, varyingTexCoord2.y));
    float scalarValue18 = sampledTextureValue10.x;
    float scalarValue19 = sampledTextureValue10.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue20 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue20);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits), -(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits6 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue14 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue15 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue37 = floor(multiplyAddValue15 * 0.25);
    float productValue38 = floor(multiplyAddValue15 * 0.5);
    float scalarValue21 = floor(multiplyAddValue15);
    if ((fma(varyingColor0.w, fma(-scalarValue18, scalarValue19, scalarValue19), scalarValue19 * scalarValue18) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue14 * 0.25), 0.5, (productValue37 * productValue37) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue14 * 0.5), 0.5, (productValue38 * productValue38) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue14), 0.5, (scalarValue21 * scalarValue21) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0)))))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue20 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue20);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits), -(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits6 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue14 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue15 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue37 = floor(multiplyAddValue15 * 0.25);
    float productValue38 = floor(multiplyAddValue15 * 0.5);
    float scalarValue21 = floor(multiplyAddValue15);
    if ((sampledTextureValue11.w < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue14 * 0.25), 0.5, (productValue37 * productValue37) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue14 * 0.5), 0.5, (productValue38 * productValue38) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue14), 0.5, (scalarValue21 * scalarValue21) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0)))))
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord2.x, varyingTexCoord2.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue = sampledTextureValue1.x * scalarValue;
    bool comparisonValue1;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[23u].x) / (fragmentVectorConstants1.packedValues[23u].y - fragmentVectorConstants1.packedValues[23u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[26u].x) / fragmentVectorConstants1.packedValues[23u].z) * fragmentVectorConstants1.packedValues[23u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[26u].y) / fragmentVectorConstants1.packedValues[23u].z) * fragmentVectorConstants1.packedValues[23u].z;
        float productValue1 = floor(quotientValue1 * 0.25);
        float productValue2 = floor(quotientValue1 * 0.5);
        float scalarValue1 = floor(quotientValue1);
        comparisonValue1 = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue2 * productValue2) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue1 * productValue1) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue1 * scalarValue1) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue1 = false;
    }
    if (((((scalarValue - productValue) * varyingColor0.w) + productValue) < fragmentVectorConstants1.packedValues[18u].x) || comparisonValue1)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    bool comparisonValue = (gl_FrontFacing ? 4294967295u : 0u) != 0u;
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    bool comparisonValue1;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[23u].x) / (fragmentVectorConstants1.packedValues[23u].y - fragmentVectorConstants1.packedValues[23u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[26u].x) / fragmentVectorConstants1.packedValues[23u].z) * fragmentVectorConstants1.packedValues[23u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[26u].y) / fragmentVectorConstants1.packedValues[23u].z) * fragmentVectorConstants1.packedValues[23u].z;
        float productValue1 = floor(quotientValue1 * 0.25);
        float productValue2 = floor(quotientValue1 * 0.5);
        float scalarValue1 = floor(quotientValue1);
        comparisonValue1 = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue2 * productValue2) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue1 * productValue1) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue1 * scalarValue1) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue1 = false;
    }
    if ((sampledTextureValue.w < fragmentVectorConstants1.packedValues[18u].x) || comparisonValue1)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord2.z, varyingTexCoord2.w));
    fragmentColor1.x = sampledTextureValue11.x * varyingColor0.x;
    fragmentColor1.y = sampledTextureValue11.y * varyingColor0.y;
    fragmentColor1.z = sampledTextureValue11.z * varyingColor0.z;
    uint reinterpretedBits9 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))));
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    if ((reinterpretedBits9 & 4u) == 4u)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint reinterpretedBits9 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))));
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    if ((reinterpretedBits9 & 4u) == 4u)
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue2 = uint(int(fragmentVectorConstants1.packedValues[21u].x));
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if ((scalarValue2 & 4u) == 0u)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint scalarValue2 = uint(int(fragmentVectorConstants1.packedValues[21u].x));
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if ((scalarValue2 & 4u) == 0u)
#endif
    {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord2.z, uintBitsToFloat(reinterpretedBits10.x), uintBitsToFloat(reinterpretedBits10.z)), fma(varyingTexCoord2.w, uintBitsToFloat(reinterpretedBits10.y), uintBitsToFloat(reinterpretedBits10.w))));
        multiplyAddValue2 = fma(sampledTextureValue12.y, 2.0, -1.0);
        multiplyAddValue3 = fma(sampledTextureValue12.x, 2.0, -1.0);
        multiplyAddValue4 = fma(sampledTextureValue12.z, 2.0, -1.0);
    }
    else
    {
        float intermediateValue12;
        float intermediateValue13;
        float intermediateValue14;
        if ((reinterpretedBits9 & 8u) == 8u)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord2.z, uintBitsToFloat(reinterpretedBits10.x), uintBitsToFloat(reinterpretedBits10.z)), fma(varyingTexCoord2.w, uintBitsToFloat(reinterpretedBits10.y), uintBitsToFloat(reinterpretedBits10.w))));
        multiplyAddValue2 = fma(sampledTextureValue12.y, 2.0, -1.0);
        multiplyAddValue3 = fma(sampledTextureValue12.x, 2.0, -1.0);
        multiplyAddValue4 = fma(sampledTextureValue12.z, 2.0, -1.0);
    }
    else
    {
        float intermediateValue10;
        float intermediateValue11;
        float intermediateValue12;
        if ((reinterpretedBits9 & 8u) == 8u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        if ((scalarValue2 & 8u) == 0u)
#endif
        {
#if RD_PLATFORM == RD_PLATFORM_SM50
            float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[91u]));
            float reinterpretedBits12 = spvNClamp(2.0 - spvNMin(reinterpretedBits11 - uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])), reinterpretedBits11), 0.0, 1.0);
            float productValue5;
            float productValue6;
            float productValue7;
            if (reinterpretedBits12 > 0.0)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float branchMergedValue3;
            float branchMergedValue5;
            float branchMergedValue6;
            if ((scalarValue2 & 16u) == 0u)
#endif
            {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
                float multiplyAddValue16 = fma(varyingTexCoord2.z, uintBitsToFloat(reinterpretedBits13.x), uintBitsToFloat(reinterpretedBits13.z));
                float multiplyAddValue17 = fma(varyingTexCoord2.w, uintBitsToFloat(reinterpretedBits13.y), uintBitsToFloat(reinterpretedBits13.w));
                bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture1)) > 0u;
                uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture1, int(0u)));
                uint scalarValue22 = sampledTextureValue14.x;
                float comparisonValue13 = rdEvaluateFloatExpression2(sampledTextureValue13 ? scalarValue22 : 0u);
                float comparisonValue14 = rdEvaluateFloatExpression2(sampledTextureValue13 ? sampledTextureValue14.y : 0u);
                float productValue39 = fract(multiplyAddValue16 * comparisonValue13);
                float productValue40 = fract(multiplyAddValue17 * comparisonValue14);
                vec4 sampledTextureValue15 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue39 - 0.5) < 0.0625) ? (((productValue39 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue16) : multiplyAddValue16, (abs(productValue40 - 0.5) < 0.0625) ? (((productValue40 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue17) : multiplyAddValue17));
                float scalarValue23 = sampledTextureValue15.x;
                float scalarValue24 = sampledTextureValue15.y;
                float scalarValue25 = sampledTextureValue15.z;
                float scalarValue26 = sampledTextureValue15.w;
                float multiplyAddValue18 = fract(fma(multiplyAddValue16, comparisonValue13, 0.5));
                float multiplyAddValue19 = fract(fma(multiplyAddValue17, comparisonValue14, 0.5));
                bool conditionValue6 = multiplyAddValue19 > 0.5;
                bool conditionValue7 = multiplyAddValue18 > 0.5;
                float comparisonValue15 = conditionValue6 ? scalarValue23 : scalarValue26;
                float comparisonValue16 = conditionValue6 ? scalarValue24 : scalarValue25;
                float comparisonValue17 = conditionValue7 ? scalarValue25 : scalarValue26;
                float comparisonValue18 = conditionValue7 ? scalarValue24 : scalarValue23;
                float sumValue9 = multiplyAddValue18 - 0.083333335816860198974609375;
                float sumValue10 = multiplyAddValue18 + 0.083333335816860198974609375;
                float sumValue11 = multiplyAddValue19 - 0.083333335816860198974609375;
                float sumValue12 = multiplyAddValue19 + 0.083333335816860198974609375;
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                float comparisonValue19 = ((sumValue13 == 1u) ? comparisonValue16 : ((sumValue13 == 0u) ? comparisonValue15 : 0.0)) - ((sumValue14 == 1u) ? comparisonValue16 : ((sumValue14 == 0u) ? comparisonValue15 : 0.0));
                float comparisonValue20 = ((sumValue15 == 1u) ? comparisonValue18 : ((sumValue15 == 0u) ? comparisonValue17 : 0.0)) - ((sumValue16 == 1u) ? comparisonValue18 : ((sumValue16 == 0u) ? comparisonValue17 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue19, comparisonValue20, 0.25);
                float scalarValue27 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue27);
                productValue5 = reinterpretedBits12 * (inverseLengthValue9 * comparisonValue20);
                productValue6 = reinterpretedBits12 * (inverseLengthValue9 * comparisonValue19);
                productValue7 = inverseLengthValue9 * 0.25;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
                float multiplyAddValue16 = fma(varyingTexCoord2.z, uintBitsToFloat(reinterpretedBits13.x), uintBitsToFloat(reinterpretedBits13.z));
                float multiplyAddValue17 = fma(varyingTexCoord2.w, uintBitsToFloat(reinterpretedBits13.y), uintBitsToFloat(reinterpretedBits13.w));
                bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture1)) > 0u;
                uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture1, int(0u)));
                uint scalarValue22 = sampledTextureValue14.x;
                float comparisonValue13 = rdEvaluateFloatExpression2(sampledTextureValue13 ? scalarValue22 : 0u);
                float comparisonValue14 = rdEvaluateFloatExpression2(sampledTextureValue13 ? sampledTextureValue14.y : 0u);
                float productValue39 = fract(multiplyAddValue16 * comparisonValue13);
                float productValue40 = fract(multiplyAddValue17 * comparisonValue14);
                vec4 sampledTextureValue23 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue39 - 0.5) < 0.0625) ? (multiplyAddValue16 + ((productValue39 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue16, (abs(productValue40 - 0.5) < 0.0625) ? (multiplyAddValue17 + ((productValue40 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue17));
                float scalarValue44 = sampledTextureValue23.x;
                float scalarValue45 = sampledTextureValue23.y;
                float scalarValue46 = sampledTextureValue23.z;
                float scalarValue47 = sampledTextureValue23.w;
                float multiplyAddValue18 = fract(fma(multiplyAddValue16, comparisonValue13, 0.5));
                float multiplyAddValue19 = fract(fma(multiplyAddValue17, comparisonValue14, 0.5));
                bool conditionValue6 = multiplyAddValue19 > 0.5;
                bool conditionValue7 = multiplyAddValue18 > 0.5;
                float comparisonValue37 = conditionValue6 ? scalarValue44 : scalarValue47;
                float comparisonValue38 = conditionValue6 ? scalarValue45 : scalarValue46;
                float comparisonValue39 = conditionValue7 ? scalarValue46 : scalarValue47;
                float comparisonValue40 = conditionValue7 ? scalarValue45 : scalarValue44;
                float sumValue9 = multiplyAddValue18 - 0.083333335816860198974609375;
                float sumValue10 = multiplyAddValue18 + 0.083333335816860198974609375;
                float sumValue11 = multiplyAddValue19 - 0.083333335816860198974609375;
                float sumValue12 = multiplyAddValue19 + 0.083333335816860198974609375;
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                uint sumValue14 = uint(int(spvNClamp(sumValue10 + sumValue10, 0.0, 1.0)));
                uint sumValue15 = uint(int(spvNClamp(sumValue11 + sumValue11, 0.0, 1.0)));
                uint sumValue16 = uint(int(spvNClamp(sumValue12 + sumValue12, 0.0, 1.0)));
                float comparisonValue41 = ((sumValue13 == 1u) ? comparisonValue38 : ((sumValue13 == 0u) ? comparisonValue37 : 0.0)) - ((sumValue14 == 1u) ? comparisonValue38 : ((sumValue14 == 0u) ? comparisonValue37 : 0.0));
                float comparisonValue42 = ((sumValue15 == 1u) ? comparisonValue40 : ((sumValue15 == 0u) ? comparisonValue39 : 0.0)) - ((sumValue16 == 1u) ? comparisonValue40 : ((sumValue16 == 0u) ? comparisonValue39 : 0.0));
                vec3 vectorValue7 = vec3(comparisonValue41, comparisonValue42, 0.25);
                float scalarValue48 = rdDot3Precise(vectorValue7, vectorValue7);
                float inverseLengthValue18 = inversesqrt(scalarValue48);
                productValue5 = reinterpretedBits12 * (inverseLengthValue18 * comparisonValue42);
                productValue6 = reinterpretedBits12 * (inverseLengthValue18 * comparisonValue41);
                productValue7 = inverseLengthValue18 * 0.25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue3 = 0.0;
                branchMergedValue5 = 0.0;
                branchMergedValue6 = 1.0;
#endif
            }
            else
            {
#if RD_PLATFORM == RD_PLATFORM_SM50
                productValue5 = 0.0;
                productValue6 = 0.0;
                productValue7 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float multiplyAddValue = fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[20u].x, fragmentVectorConstants1.packedValues[20u].z);
                float multiplyAddValue1 = fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[20u].y, fragmentVectorConstants1.packedValues[20u].w);
                vec4 sampledTextureValue2 = textureLod(sampler2D(matTextureTexture, matTextureSampler), vec2(multiplyAddValue, multiplyAddValue1), 0.0);
                float scalarValue3 = sampledTextureValue2.x;
                float scalarValue4 = sampledTextureValue2.y;
                float scalarValue5 = sampledTextureValue2.z;
                float multiplyAddValue5 = spvNClamp(fma(spvNMin(fragmentVectorConstants1.packedValues[22u].w - fragmentVectorConstants1.packedValues[22u].y, fragmentVectorConstants1.packedValues[22u].w), -1.0, 2.0), 0.0, 1.0);
                bool conditionValue = multiplyAddValue5 > 0.0;
                float branchMergedValue9;
                float branchMergedValue10;
                float branchMergedValue11;
                if ((scalarValue3 == scalarValue4) && (scalarValue4 == scalarValue5))
                {
                    float branchMergedValue12;
                    float branchMergedValue14;
                    float branchMergedValue15;
                    if (conditionValue)
                    {
                        uvec2 sampledTextureValue3 = uvec2(textureSize(matTextureTexture, int(0u)));
                        float productValue3 = float(int(uint(int(float(int(sampledTextureValue3.x)))))) * multiplyAddValue;
                        float productValue4 = float(int(uint(int(float(int(sampledTextureValue3.y)))))) * multiplyAddValue1;
                        float scalarValue6 = fract(productValue3);
                        float scalarValue7 = fract(productValue4);
                        float comparisonValue11;
                        if (abs(scalarValue6 + (-0.5)) < 0.0625)
                        {
                            comparisonValue11 = ((scalarValue6 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue;
                        }
                        else
                        {
                            comparisonValue11 = multiplyAddValue;
                        }
                        float comparisonValue12;
                        if (abs(scalarValue7 + (-0.5)) < 0.0625)
                        {
                            comparisonValue12 = ((scalarValue7 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue1;
                        }
                        else
                        {
                            comparisonValue12 = multiplyAddValue1;
                        }
                        vec4 sampledTextureValue4 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue11, comparisonValue12));
                        float scalarValue8 = sampledTextureValue4.x;
                        float scalarValue9 = sampledTextureValue4.y;
                        float scalarValue10 = sampledTextureValue4.z;
                        float scalarValue11 = sampledTextureValue4.w;
                        float sumValue = fract(productValue3 + 0.5);
                        float sumValue1 = fract(productValue4 + 0.5);
                        bool conditionValue1 = sumValue1 > 0.5;
                        float intermediateValue[2];
                        intermediateValue[0u] = conditionValue1 ? scalarValue8 : scalarValue11;
                        intermediateValue[1u] = conditionValue1 ? scalarValue9 : scalarValue10;
                        float productValue8 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                        float productValue9 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                        float sumValue2 = productValue8 - productValue9;
                        bool conditionValue2 = sumValue > 0.5;
                        intermediateValue[0u] = conditionValue2 ? scalarValue10 : scalarValue11;
                        intermediateValue[1u] = conditionValue2 ? scalarValue9 : scalarValue8;
                        float productValue13 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                        float inverseLengthValue1 = inversesqrt(dot(vec3(sumValue2, productValue13, 0.25), vec3(sumValue2, productValue13, 0.25)));
                        float productValue14 = inverseLengthValue1 * multiplyAddValue5;
                        branchMergedValue12 = productValue14 * sumValue2;
                        branchMergedValue14 = productValue14 * productValue13;
                        branchMergedValue15 = inverseLengthValue1 * 0.25;
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
                    uvec2 sampledTextureValue5 = uvec2(textureSize(matTextureTexture, int(0u)));
                    float branchMergedValue13;
                    float branchMergedValue16;
                    float branchMergedValue17;
                    if (conditionValue)
                    {
                        float productValue15 = fract(float(int(uint(int(float(int(sampledTextureValue5.x)))))) * multiplyAddValue);
                        float productValue16 = fract(float(int(uint(int(float(int(sampledTextureValue5.y)))))) * multiplyAddValue1);
                        float comparisonValue2 = (((productValue15 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue4 * 2.0) + (-1.0))) - (((productValue15 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue2.w * 2.0) + (-1.0)));
                        float comparisonValue3 = (((productValue16 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((scalarValue5 * 2.0) + (-1.0))) - (((productValue16 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((scalarValue3 * 2.0) + (-1.0)));
                        float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue2;
                        float comparisonValue6 = ((abs(comparisonValue3) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue3;
                        float inverseLengthValue2 = inversesqrt(dot(vec3(comparisonValue4, comparisonValue6, 0.25), vec3(comparisonValue4, comparisonValue6, 0.25)));
                        float productValue17 = inverseLengthValue2 * multiplyAddValue5;
                        branchMergedValue13 = productValue17 * comparisonValue4;
                        branchMergedValue16 = productValue17 * comparisonValue6;
                        branchMergedValue17 = inverseLengthValue2 * 0.25;
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
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue12 = productValue5;
            intermediateValue13 = productValue6;
            intermediateValue14 = productValue7;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue10 = productValue5;
            intermediateValue11 = productValue6;
            intermediateValue12 = productValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = branchMergedValue3;
            branchMergedValue1 = branchMergedValue5;
            branchMergedValue2 = branchMergedValue6;
#endif
        }
        else
        {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            float intermediateValue27;
            float intermediateValue29;
            float intermediateValue31;
            if ((reinterpretedBits9 & 16u) == 16u)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            float intermediateValue25;
            float intermediateValue27;
            float intermediateValue29;
            if ((reinterpretedBits9 & 16u) == 16u)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float multiplyAddValue6 = fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[20u].x, fragmentVectorConstants1.packedValues[20u].z);
            float multiplyAddValue7 = fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[20u].y, fragmentVectorConstants1.packedValues[20u].w);
            float multiplyAddValue8 = spvNClamp(fma(spvNMin(fragmentVectorConstants1.packedValues[22u].w - fragmentVectorConstants1.packedValues[22u].y, fragmentVectorConstants1.packedValues[22u].w), -1.0, 2.0), 0.0, 1.0);
            float branchMergedValue4;
            float branchMergedValue7;
            float branchMergedValue8;
            if (multiplyAddValue8 > 0.0)
#endif
            {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
                float multiplyAddValue20 = fma(varyingTexCoord2.z, uintBitsToFloat(reinterpretedBits14.x), uintBitsToFloat(reinterpretedBits14.z));
                float multiplyAddValue21 = fma(varyingTexCoord2.w, uintBitsToFloat(reinterpretedBits14.y), uintBitsToFloat(reinterpretedBits14.w));
                float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[91u]));
                float reinterpretedBits16 = spvNMin(reinterpretedBits15 - uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])), reinterpretedBits15);
                vec4 sampledTextureValue16 = textureLod(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue20, multiplyAddValue21), 0.0);
                float scalarValue28 = sampledTextureValue16.x;
                float scalarValue29 = sampledTextureValue16.y;
                float scalarValue30 = sampledTextureValue16.z;
                float intermediateValue28;
                float intermediateValue30;
                float intermediateValue32;
                if ((scalarValue29 == scalarValue28) && (scalarValue30 == scalarValue29))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
                float multiplyAddValue20 = fma(varyingTexCoord2.z, uintBitsToFloat(reinterpretedBits14.x), uintBitsToFloat(reinterpretedBits14.z));
                float multiplyAddValue21 = fma(varyingTexCoord2.w, uintBitsToFloat(reinterpretedBits14.y), uintBitsToFloat(reinterpretedBits14.w));
                float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[91u]));
                float reinterpretedBits16 = spvNMin(reinterpretedBits15 - uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])), reinterpretedBits15);
                vec4 sampledTextureValue16 = textureLod(sampler2D(materialTexture1, textureSampler1), vec2(multiplyAddValue20, multiplyAddValue21), 0.0);
                float scalarValue28 = sampledTextureValue16.x;
                float scalarValue29 = sampledTextureValue16.y;
                float scalarValue30 = sampledTextureValue16.z;
                float intermediateValue26;
                float intermediateValue28;
                float intermediateValue30;
                if ((scalarValue29 == scalarValue28) && (scalarValue30 == scalarValue29))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                uvec2 sampledTextureValue6 = uvec2(textureSize(matTextureTexture, int(0u)));
                float productValue18 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * multiplyAddValue6;
                float productValue22 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * multiplyAddValue7;
                float scalarValue12 = fract(productValue18);
                float scalarValue13 = fract(productValue22);
                float comparisonValue5;
                if (abs(scalarValue12 + (-0.5)) < 0.0625)
#endif
                {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    float scalarValue31 = spvNClamp(2.0 - reinterpretedBits16, 0.0, 1.0);
                    float productValue19;
                    float productValue20;
                    float productValue21;
                    if (scalarValue31 > 0.0)
                    {
                        bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture1)) > 0u;
                        uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture1, int(0u)));
                        uint scalarValue32 = sampledTextureValue18.x;
                        float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue17 ? scalarValue32 : 0u);
                        float comparisonValue22 = rdEvaluateFloatExpression2(sampledTextureValue17 ? sampledTextureValue18.y : 0u);
                        float productValue41 = fract(multiplyAddValue20 * comparisonValue21);
                        float productValue42 = fract(multiplyAddValue21 * comparisonValue22);
                        vec4 sampledTextureValue19 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue41 - 0.5) < 0.0625) ? (multiplyAddValue20 + ((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue20, (abs(productValue42 - 0.5) < 0.0625) ? (multiplyAddValue21 + ((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue21));
                        float scalarValue33 = sampledTextureValue19.x;
                        float scalarValue34 = sampledTextureValue19.y;
                        float scalarValue35 = sampledTextureValue19.z;
                        float scalarValue36 = sampledTextureValue19.w;
                        float multiplyAddValue22 = fract(fma(multiplyAddValue20, comparisonValue21, 0.5));
                        float multiplyAddValue23 = fract(fma(multiplyAddValue21, comparisonValue22, 0.5));
                        bool conditionValue8 = multiplyAddValue23 > 0.5;
                        bool conditionValue9 = multiplyAddValue22 > 0.5;
                        float comparisonValue23 = conditionValue8 ? scalarValue33 : scalarValue36;
                        float comparisonValue24 = conditionValue8 ? scalarValue34 : scalarValue35;
                        float comparisonValue25 = conditionValue9 ? scalarValue35 : scalarValue36;
                        float comparisonValue26 = conditionValue9 ? scalarValue34 : scalarValue33;
                        float sumValue17 = multiplyAddValue22 - 0.083333335816860198974609375;
                        float sumValue18 = multiplyAddValue22 + 0.083333335816860198974609375;
                        float sumValue19 = multiplyAddValue23 - 0.083333335816860198974609375;
                        float sumValue20 = multiplyAddValue23 + 0.083333335816860198974609375;
                        uint sumValue21 = uint(int(spvNClamp(sumValue17 + sumValue17, 0.0, 1.0)));
                        uint sumValue22 = uint(int(spvNClamp(sumValue18 + sumValue18, 0.0, 1.0)));
                        uint sumValue23 = uint(int(spvNClamp(sumValue19 + sumValue19, 0.0, 1.0)));
                        uint sumValue24 = uint(int(spvNClamp(sumValue20 + sumValue20, 0.0, 1.0)));
                        float comparisonValue27 = ((sumValue21 == 1u) ? comparisonValue24 : ((sumValue21 == 0u) ? comparisonValue23 : 0.0)) - ((sumValue22 == 1u) ? comparisonValue24 : ((sumValue22 == 0u) ? comparisonValue23 : 0.0));
                        float comparisonValue28 = ((sumValue23 == 1u) ? comparisonValue26 : ((sumValue23 == 0u) ? comparisonValue25 : 0.0)) - ((sumValue24 == 1u) ? comparisonValue26 : ((sumValue24 == 0u) ? comparisonValue25 : 0.0));
                        vec3 vectorValue2 = vec3(comparisonValue27, comparisonValue28, 0.25);
                        float scalarValue37 = rdDot3Precise(vectorValue2, vectorValue2);
                        float inverseLengthValue10 = inversesqrt(scalarValue37);
                        productValue19 = scalarValue31 * (inverseLengthValue10 * comparisonValue28);
                        productValue20 = scalarValue31 * (inverseLengthValue10 * comparisonValue27);
                        productValue21 = inverseLengthValue10 * 0.25;
                    }
                    else
                    {
                        productValue19 = 0.0;
                        productValue20 = 0.0;
                        productValue21 = 1.0;
                    }
                    intermediateValue28 = productValue19;
                    intermediateValue30 = productValue20;
                    intermediateValue32 = productValue21;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    float scalarValue31 = spvNClamp(2.0 - reinterpretedBits16, 0.0, 1.0);
                    float productValue19;
                    float productValue20;
                    float productValue21;
                    if (scalarValue31 > 0.0)
                    {
                        bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture1)) > 0u;
                        uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture1, int(0u)));
                        uint scalarValue32 = sampledTextureValue18.x;
                        float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue17 ? scalarValue32 : 0u);
                        float comparisonValue22 = rdEvaluateFloatExpression2(sampledTextureValue17 ? sampledTextureValue18.y : 0u);
                        float productValue41 = fract(multiplyAddValue20 * comparisonValue21);
                        float productValue42 = fract(multiplyAddValue21 * comparisonValue22);
                        vec4 sampledTextureValue19 = textureGather(sampler2D(materialTexture1, textureSampler1), vec2((abs(productValue41 - 0.5) < 0.0625) ? (multiplyAddValue20 + ((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue20, (abs(productValue42 - 0.5) < 0.0625) ? (multiplyAddValue21 + ((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06))) : multiplyAddValue21));
                        float scalarValue33 = sampledTextureValue19.x;
                        float scalarValue34 = sampledTextureValue19.y;
                        float scalarValue35 = sampledTextureValue19.z;
                        float scalarValue36 = sampledTextureValue19.w;
                        float multiplyAddValue22 = fract(fma(multiplyAddValue20, comparisonValue21, 0.5));
                        float multiplyAddValue23 = fract(fma(multiplyAddValue21, comparisonValue22, 0.5));
                        bool conditionValue8 = multiplyAddValue23 > 0.5;
                        bool conditionValue9 = multiplyAddValue22 > 0.5;
                        float comparisonValue23 = conditionValue8 ? scalarValue33 : scalarValue36;
                        float comparisonValue24 = conditionValue8 ? scalarValue34 : scalarValue35;
                        float comparisonValue25 = conditionValue9 ? scalarValue35 : scalarValue36;
                        float comparisonValue26 = conditionValue9 ? scalarValue34 : scalarValue33;
                        float sumValue17 = multiplyAddValue22 - 0.083333335816860198974609375;
                        float sumValue18 = multiplyAddValue22 + 0.083333335816860198974609375;
                        float sumValue19 = multiplyAddValue23 - 0.083333335816860198974609375;
                        float sumValue20 = multiplyAddValue23 + 0.083333335816860198974609375;
                        uint sumValue21 = uint(int(spvNClamp(sumValue17 + sumValue17, 0.0, 1.0)));
                        uint sumValue22 = uint(int(spvNClamp(sumValue18 + sumValue18, 0.0, 1.0)));
                        uint sumValue23 = uint(int(spvNClamp(sumValue19 + sumValue19, 0.0, 1.0)));
                        uint sumValue24 = uint(int(spvNClamp(sumValue20 + sumValue20, 0.0, 1.0)));
                        float comparisonValue27 = ((sumValue21 == 1u) ? comparisonValue24 : ((sumValue21 == 0u) ? comparisonValue23 : 0.0)) - ((sumValue22 == 1u) ? comparisonValue24 : ((sumValue22 == 0u) ? comparisonValue23 : 0.0));
                        float comparisonValue28 = ((sumValue23 == 1u) ? comparisonValue26 : ((sumValue23 == 0u) ? comparisonValue25 : 0.0)) - ((sumValue24 == 1u) ? comparisonValue26 : ((sumValue24 == 0u) ? comparisonValue25 : 0.0));
                        vec3 vectorValue2 = vec3(comparisonValue27, comparisonValue28, 0.25);
                        float scalarValue37 = rdDot3Precise(vectorValue2, vectorValue2);
                        float inverseLengthValue10 = inversesqrt(scalarValue37);
                        productValue19 = scalarValue31 * (inverseLengthValue10 * comparisonValue28);
                        productValue20 = scalarValue31 * (inverseLengthValue10 * comparisonValue27);
                        productValue21 = inverseLengthValue10 * 0.25;
                    }
                    else
                    {
                        productValue19 = 0.0;
                        productValue20 = 0.0;
                        productValue21 = 1.0;
                    }
                    intermediateValue26 = productValue19;
                    intermediateValue28 = productValue20;
                    intermediateValue30 = productValue21;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    comparisonValue5 = ((scalarValue12 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue6;
#endif
                }
                else
                {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue20 = uint(textureQueryLevels(materialTexture1)) > 0u;
                    uvec2 sampledTextureValue21 = uvec2(textureSize(materialTexture1, int(0u)));
                    uint scalarValue38 = sampledTextureValue21.x;
                    float comparisonValue29 = rdEvaluateFloatExpression2(sampledTextureValue20 ? scalarValue38 : 0u);
                    float comparisonValue30 = rdEvaluateFloatExpression2(sampledTextureValue20 ? sampledTextureValue21.y : 0u);
                    float sumValue25 = spvNClamp(2.0 - reinterpretedBits16, 0.0, 1.0);
                    bool conditionValue10 = sumValue25 > 0.0;
                    float productValue43 = fract(multiplyAddValue20 * comparisonValue29);
                    float productValue44 = fract(multiplyAddValue21 * comparisonValue30);
                    float multiplyAddValue24 = (productValue43 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue16.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue25 = (productValue44 <= 0.083333335816860198974609375) ? (-fma(scalarValue28, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue26 = (productValue43 >= 0.916666686534881591796875) ? (fma(scalarValue29, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                    float multiplyAddValue27 = (productValue44 >= 0.916666686534881591796875) ? (fma(scalarValue30, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                    bool comparisonValue31 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                    bool comparisonValue32 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue33 = vec3(comparisonValue31 ? multiplyAddValue26 : 0.0, comparisonValue32 ? multiplyAddValue27 : 0.0, 0.25);
                    float scalarValue39 = rdDot3Precise(comparisonValue33, comparisonValue33);
                    float inverseLengthValue11 = inversesqrt(scalarValue39);
                    intermediateValue28 = (conditionValue10 && comparisonValue32) ? (sumValue25 * (inverseLengthValue11 * multiplyAddValue27)) : 0.0;
                    intermediateValue30 = (conditionValue10 && comparisonValue31) ? (sumValue25 * (inverseLengthValue11 * multiplyAddValue26)) : 0.0;
                    intermediateValue32 = conditionValue10 ? (inverseLengthValue11 * 0.25) : 1.0;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue20 = uint(textureQueryLevels(materialTexture1)) > 0u;
                    uvec2 sampledTextureValue21 = uvec2(textureSize(materialTexture1, int(0u)));
                    uint scalarValue38 = sampledTextureValue21.x;
                    float comparisonValue29 = rdEvaluateFloatExpression2(sampledTextureValue20 ? scalarValue38 : 0u);
                    float comparisonValue30 = rdEvaluateFloatExpression2(sampledTextureValue20 ? sampledTextureValue21.y : 0u);
                    float sumValue25 = spvNClamp(2.0 - reinterpretedBits16, 0.0, 1.0);
                    bool conditionValue10 = sumValue25 > 0.0;
                    float productValue43 = fract(multiplyAddValue20 * comparisonValue29);
                    float productValue44 = fract(multiplyAddValue21 * comparisonValue30);
                    float multiplyAddValue24 = (productValue43 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue16.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue25 = (productValue44 <= 0.083333335816860198974609375) ? (-fma(scalarValue28, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue26 = (productValue43 >= 0.916666686534881591796875) ? (fma(scalarValue29, 2.0, -1.0) + multiplyAddValue24) : multiplyAddValue24;
                    float multiplyAddValue27 = (productValue44 >= 0.916666686534881591796875) ? (fma(scalarValue30, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                    bool comparisonValue31 = abs(multiplyAddValue26) >= 0.004999999888241291046142578125;
                    bool comparisonValue32 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue33 = vec3(comparisonValue31 ? multiplyAddValue26 : 0.0, comparisonValue32 ? multiplyAddValue27 : 0.0, 0.25);
                    float scalarValue39 = rdDot3Precise(comparisonValue33, comparisonValue33);
                    float inverseLengthValue11 = inversesqrt(scalarValue39);
                    intermediateValue26 = (conditionValue10 && comparisonValue32) ? (sumValue25 * (inverseLengthValue11 * multiplyAddValue27)) : 0.0;
                    intermediateValue28 = (conditionValue10 && comparisonValue31) ? (sumValue25 * (inverseLengthValue11 * multiplyAddValue26)) : 0.0;
                    intermediateValue30 = conditionValue10 ? (inverseLengthValue11 * 0.25) : 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    comparisonValue5 = multiplyAddValue6;
#endif
                }
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = intermediateValue28;
                intermediateValue29 = intermediateValue30;
                intermediateValue31 = intermediateValue32;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue25 = intermediateValue26;
                intermediateValue27 = intermediateValue28;
                intermediateValue29 = intermediateValue30;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                float comparisonValue10;
                if (abs(scalarValue13 + (-0.5)) < 0.0625)
                {
                    comparisonValue10 = ((scalarValue13 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + multiplyAddValue7;
                }
                else
                {
                    comparisonValue10 = multiplyAddValue7;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(matTextureTexture, matTextureSampler), vec2(comparisonValue5, comparisonValue10));
                float scalarValue14 = sampledTextureValue7.x;
                float scalarValue15 = sampledTextureValue7.y;
                float scalarValue16 = sampledTextureValue7.z;
                float scalarValue17 = sampledTextureValue7.w;
                float sumValue3 = fract(productValue18 + 0.5);
                float sumValue4 = fract(productValue22 + 0.5);
                bool conditionValue3 = sumValue4 > 0.5;
                float intermediateValue1[2];
                intermediateValue1[0u] = conditionValue3 ? scalarValue14 : scalarValue17;
                intermediateValue1[1u] = conditionValue3 ? scalarValue15 : scalarValue16;
                float productValue23 = intermediateValue1[uint(int(spvNClamp((sumValue3 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue24 = intermediateValue1[uint(int(spvNClamp((sumValue3 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue5 = productValue23 - productValue24;
                bool conditionValue4 = sumValue3 > 0.5;
                intermediateValue1[0u] = conditionValue4 ? scalarValue16 : scalarValue17;
                intermediateValue1[1u] = conditionValue4 ? scalarValue15 : scalarValue14;
                float productValue25 = intermediateValue1[uint(int(spvNClamp((sumValue4 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue1[uint(int(spvNClamp((sumValue4 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue3 = inversesqrt(dot(vec3(sumValue5, productValue25, 0.25), vec3(sumValue5, productValue25, 0.25)));
                float productValue26 = inverseLengthValue3 * multiplyAddValue8;
                branchMergedValue4 = productValue26 * sumValue5;
                branchMergedValue7 = productValue26 * productValue25;
                branchMergedValue8 = inverseLengthValue3 * 0.25;
#endif
            }
            else
            {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = 0.0;
                intermediateValue29 = 0.0;
                intermediateValue31 = 1.0;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue25 = 0.0;
                intermediateValue27 = 0.0;
                intermediateValue29 = 1.0;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue4 = 0.0;
                branchMergedValue7 = 0.0;
                branchMergedValue8 = 1.0;
#endif
            }
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue12 = intermediateValue27;
            intermediateValue13 = intermediateValue29;
            intermediateValue14 = intermediateValue31;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            intermediateValue10 = intermediateValue25;
            intermediateValue11 = intermediateValue27;
            intermediateValue12 = intermediateValue29;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = branchMergedValue4;
            branchMergedValue1 = branchMergedValue7;
            branchMergedValue2 = branchMergedValue8;
#endif
        }
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        multiplyAddValue2 = intermediateValue12;
        multiplyAddValue3 = intermediateValue13;
        multiplyAddValue4 = intermediateValue14;
    }
    float intermediateValue33;
    float intermediateValue34;
    float intermediateValue35;
    float reinterpretedBits19;
    if ((reinterpretedBits9 & 1u) == 1u)
    {
        uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
        vec4 sampledTextureValue22 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord2.z, uintBitsToFloat(reinterpretedBits17.x), uintBitsToFloat(reinterpretedBits17.z)), fma(varyingTexCoord2.w, uintBitsToFloat(reinterpretedBits17.y), uintBitsToFloat(reinterpretedBits17.w))));
        intermediateValue33 = sampledTextureValue22.y;
        intermediateValue34 = sampledTextureValue22.z;
        intermediateValue35 = sampledTextureValue22.x;
        reinterpretedBits19 = ((reinterpretedBits9 & 2u) == 2u) ? sampledTextureValue22.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        multiplyAddValue2 = intermediateValue10;
        multiplyAddValue3 = intermediateValue11;
        multiplyAddValue4 = intermediateValue12;
    }
    float intermediateValue31;
    float intermediateValue32;
    float intermediateValue33;
    float reinterpretedBits19;
    if ((reinterpretedBits9 & 1u) == 1u)
    {
        uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
        vec4 sampledTextureValue22 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fma(varyingTexCoord2.z, uintBitsToFloat(reinterpretedBits17.x), uintBitsToFloat(reinterpretedBits17.z)), fma(varyingTexCoord2.w, uintBitsToFloat(reinterpretedBits17.y), uintBitsToFloat(reinterpretedBits17.w))));
        intermediateValue31 = sampledTextureValue22.y;
        intermediateValue32 = sampledTextureValue22.z;
        intermediateValue33 = sampledTextureValue22.x;
        reinterpretedBits19 = ((reinterpretedBits9 & 2u) == 2u) ? sampledTextureValue22.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue5 = branchMergedValue;
        intermediateValue6 = branchMergedValue1;
        intermediateValue7 = branchMergedValue2;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue4 = branchMergedValue;
        intermediateValue5 = branchMergedValue1;
        intermediateValue6 = branchMergedValue2;
#endif
    }
    else
    {
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[21u]);
        intermediateValue33 = uintBitsToFloat(reinterpretedBits18.z);
        intermediateValue34 = uintBitsToFloat(reinterpretedBits18.y);
        intermediateValue35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[87u]));
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[21u]);
        intermediateValue31 = uintBitsToFloat(reinterpretedBits18.z);
        intermediateValue32 = uintBitsToFloat(reinterpretedBits18.y);
        intermediateValue33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[87u]));
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[20u].x, fragmentVectorConstants1.packedValues[20u].z), fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[20u].y, fragmentVectorConstants1.packedValues[20u].w)));
        intermediateValue5 = (sampledTextureValue8.x * 2.0) + (-1.0);
        intermediateValue6 = (sampledTextureValue8.y * 2.0) + (-1.0);
        intermediateValue7 = (sampledTextureValue8.z * 2.0) + (-1.0);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        vec4 sampledTextureValue8 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[20u].x, fragmentVectorConstants1.packedValues[20u].z), fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[20u].y, fragmentVectorConstants1.packedValues[20u].w)));
        intermediateValue4 = (sampledTextureValue8.x * 2.0) + (-1.0);
        intermediateValue5 = (sampledTextureValue8.y * 2.0) + (-1.0);
        intermediateValue6 = (sampledTextureValue8.z * 2.0) + (-1.0);
#endif
    }
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float comparisonValue34 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
    float comparisonValue35 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
    float comparisonValue36 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
    vec3 vectorValue3 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
    float scalarValue40 = rdDot3Precise(vectorValue3, vectorValue3);
    float inverseLengthValue12 = inversesqrt(scalarValue40);
    vec3 vectorValue4 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
    float scalarValue41 = rdDot3Precise(vectorValue4, vectorValue4);
    float inverseLengthValue13 = inversesqrt(scalarValue41);
    vec3 vectorValue5 = vec3(comparisonValue34, comparisonValue35, comparisonValue36);
    float scalarValue42 = rdDot3Precise(vectorValue5, vectorValue5);
    float inverseLengthValue14 = inversesqrt(scalarValue42);
    float multiplyAddValue28 = fma(inverseLengthValue14 * comparisonValue34, multiplyAddValue4, fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue3, multiplyAddValue2 * (inverseLengthValue13 * varyingBitangent0.x)));
    float multiplyAddValue29 = fma(inverseLengthValue14 * comparisonValue35, multiplyAddValue4, fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue3, multiplyAddValue2 * (inverseLengthValue13 * varyingBitangent0.y)));
    float multiplyAddValue30 = fma(inverseLengthValue14 * comparisonValue36, multiplyAddValue4, fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue3, multiplyAddValue2 * (inverseLengthValue13 * varyingBitangent0.z)));
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits21 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits20.x);
    float reinterpretedBits22 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits20.y);
    float reinterpretedBits23 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits20.z);
    fragmentColor1.w = (reinterpretedBits19 < intermediateValue35) ? fma(intermediateValue35, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits19, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30);
    float scalarValue43 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue43);
    float productValue45 = inverseLengthValue15 * multiplyAddValue28;
    float productValue46 = inverseLengthValue15 * multiplyAddValue29;
    float productValue47 = inverseLengthValue15 * multiplyAddValue30;
    float quotientValue3 = 1.0 / (abs(productValue47) + (abs(productValue46) + abs(productValue45)));
    float productValue48 = quotientValue3 * productValue45;
    float productValue49 = quotientValue3 * productValue46;
    bool conditionValue11 = productValue47 < 0.0;
    float sumValue26 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? (((productValue48 >= 0.0) ? sumValue26 : (-1.0)) * (1.0 - abs(productValue49))) : productValue48;
    fragmentColor2.y = conditionValue11 ? (((productValue49 >= 0.0) ? sumValue26 : (-1.0)) * (1.0 - abs(productValue48))) : productValue49;
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue31 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u]));
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float multiplyAddValue32 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits23, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), reinterpretedBits21, reinterpretedBits22 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits26.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits25.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits24.x))) + uintBitsToFloat(reinterpretedBits27.x)) / multiplyAddValue31, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits30.x), reinterpretedBits23, fma(uintBitsToFloat(reinterpretedBits29.x), reinterpretedBits21, reinterpretedBits22 * uintBitsToFloat(reinterpretedBits28.x))) + uintBitsToFloat(reinterpretedBits31.x)) / multiplyAddValue32, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits26.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits25.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits24.y))) + uintBitsToFloat(reinterpretedBits27.y)) / multiplyAddValue31, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits30.y), reinterpretedBits23, fma(uintBitsToFloat(reinterpretedBits29.y), reinterpretedBits21, reinterpretedBits22 * uintBitsToFloat(reinterpretedBits28.y))) + uintBitsToFloat(reinterpretedBits31.y)) / multiplyAddValue32, 0.5, 0.5);
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits33 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[65u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[66u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits32 > 9.9999997473787516355514526367188e-05);
    float productValue50 = reinterpretedBits32 * reinterpretedBits32;
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits35 = (reinterpretedBits33 ? spvNMin(productValue50, 1.0) : uintBitsToFloat(reinterpretedBits34.x)) * 0.16666667163372039794921875;
    float multiplyAddValue33 = (reinterpretedBits33 ? spvNMin(fma(fma(productValue50, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : uintBitsToFloat(reinterpretedBits34.y)) * 0.16666667163372039794921875;
    float multiplyAddValue34 = (reinterpretedBits33 ? spvNMin(fma(productValue50 * productValue50, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : uintBitsToFloat(reinterpretedBits34.z)) * 0.16666667163372039794921875;
    float productValue51 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue33, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue34, reinterpretedBits35)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue33 / productValue51, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits35 / productValue51, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue34 / productValue51, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue51, 0.0, 1.0) * 255.0);
    uint reinterpretedBits36 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits36 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits36 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue33, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue34, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float comparisonValue34 = gl_FrontFacing ? (-varyingNormal0.x) : varyingNormal0.x;
    float comparisonValue35 = gl_FrontFacing ? (-varyingNormal0.y) : varyingNormal0.y;
    float comparisonValue36 = gl_FrontFacing ? (-varyingNormal0.z) : varyingNormal0.z;
    vec3 vectorValue3 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
    float scalarValue40 = rdDot3Precise(vectorValue3, vectorValue3);
    float inverseLengthValue12 = inversesqrt(scalarValue40);
    vec3 vectorValue4 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
    float scalarValue41 = rdDot3Precise(vectorValue4, vectorValue4);
    float inverseLengthValue13 = inversesqrt(scalarValue41);
    vec3 vectorValue5 = vec3(comparisonValue34, comparisonValue35, comparisonValue36);
    float scalarValue42 = rdDot3Precise(vectorValue5, vectorValue5);
    float inverseLengthValue14 = inversesqrt(scalarValue42);
    float multiplyAddValue28 = fma(inverseLengthValue14 * comparisonValue34, multiplyAddValue4, fma(inverseLengthValue12 * varyingTangent0.x, multiplyAddValue3, multiplyAddValue2 * (inverseLengthValue13 * varyingBitangent0.x)));
    float multiplyAddValue29 = fma(inverseLengthValue14 * comparisonValue35, multiplyAddValue4, fma(inverseLengthValue12 * varyingTangent0.y, multiplyAddValue3, multiplyAddValue2 * (inverseLengthValue13 * varyingBitangent0.y)));
    float multiplyAddValue30 = fma(inverseLengthValue14 * comparisonValue36, multiplyAddValue4, fma(inverseLengthValue12 * varyingTangent0.z, multiplyAddValue3, multiplyAddValue2 * (inverseLengthValue13 * varyingBitangent0.z)));
    uvec4 reinterpretedBits20 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits21 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits20.x);
    float reinterpretedBits22 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits20.y);
    float reinterpretedBits23 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits20.z);
    fragmentColor1.w = (reinterpretedBits19 < intermediateValue33) ? fma(intermediateValue33, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits19, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30);
    float scalarValue43 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue43);
    float productValue45 = inverseLengthValue15 * multiplyAddValue28;
    float productValue46 = inverseLengthValue15 * multiplyAddValue29;
    float productValue47 = inverseLengthValue15 * multiplyAddValue30;
    float quotientValue3 = 1.0 / (abs(productValue47) + (abs(productValue46) + abs(productValue45)));
    float productValue48 = quotientValue3 * productValue45;
    float productValue49 = quotientValue3 * productValue46;
    bool conditionValue11 = productValue47 < 0.0;
    float sumValue26 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue11 ? ((1.0 - abs(productValue49)) * ((productValue48 >= 0.0) ? sumValue26 : (-1.0))) : productValue48;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue48)) * ((productValue49 >= 0.0) ? sumValue26 : (-1.0))) : productValue49;
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue31 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u]));
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float multiplyAddValue32 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits23, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), reinterpretedBits21, reinterpretedBits22 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits26.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits25.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits24.x))) + uintBitsToFloat(reinterpretedBits27.x)) / multiplyAddValue31, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits30.x), reinterpretedBits23, fma(uintBitsToFloat(reinterpretedBits29.x), reinterpretedBits21, reinterpretedBits22 * uintBitsToFloat(reinterpretedBits28.x))) + uintBitsToFloat(reinterpretedBits31.x)) / multiplyAddValue32, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits26.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits25.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits24.y))) + uintBitsToFloat(reinterpretedBits27.y)) / multiplyAddValue31, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits30.y), reinterpretedBits23, fma(uintBitsToFloat(reinterpretedBits29.y), reinterpretedBits21, reinterpretedBits22 * uintBitsToFloat(reinterpretedBits28.y))) + uintBitsToFloat(reinterpretedBits31.y)) / multiplyAddValue32, 0.5, 0.5);
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits33 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[65u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[66u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits32 > 9.9999997473787516355514526367188e-05);
    float productValue50 = reinterpretedBits32 * reinterpretedBits32;
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits35 = (reinterpretedBits33 ? spvNMin(productValue50, 1.0) : uintBitsToFloat(reinterpretedBits34.x)) * 0.16666667163372039794921875;
    float multiplyAddValue33 = (reinterpretedBits33 ? spvNMin(fma(fma(productValue50, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : uintBitsToFloat(reinterpretedBits34.y)) * 0.16666667163372039794921875;
    float multiplyAddValue34 = (reinterpretedBits33 ? spvNMin(fma(productValue50 * productValue50, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : uintBitsToFloat(reinterpretedBits34.z)) * 0.16666667163372039794921875;
    float productValue51 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue33, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue34, reinterpretedBits35)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue33 / productValue51, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits35 / productValue51, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue34 / productValue51, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue51, 0.0, 1.0) * 255.0);
    uint reinterpretedBits36 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits36 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits36 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue31, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue32, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor1.x = sampledTextureValue11.x;
    fragmentColor1.y = sampledTextureValue11.y;
    fragmentColor1.z = sampledTextureValue11.z;
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if ((scalarValue2 & 1u) == 0u)
    {
        intermediateValue14 = fragmentVectorConstants1.packedValues[21u].z;
        intermediateValue15 = fragmentVectorConstants1.packedValues[21u].w;
        intermediateValue16 = fragmentVectorConstants1.packedValues[21u].y;
        intermediateValue17 = fragmentVectorConstants1.packedValues[22u].x;
    }
    else
    {
        vec4 sampledTextureValue9 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[19u].x, fragmentVectorConstants1.packedValues[19u].z), fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[19u].y, fragmentVectorConstants1.packedValues[19u].w)));
        intermediateValue14 = sampledTextureValue9.y;
        intermediateValue15 = sampledTextureValue9.x;
        intermediateValue16 = sampledTextureValue9.z;
        intermediateValue17 = ((scalarValue2 & 2u) != 0u) ? sampledTextureValue9.w : fragmentVectorConstants1.packedValues[22u].x;
    }
    float comparisonValue7 = comparisonValue ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
    float comparisonValue8 = comparisonValue ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
    float comparisonValue9 = comparisonValue ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
    float inverseLengthValue4 = inversesqrt(dot(vec3(comparisonValue7, comparisonValue8, comparisonValue9), vec3(comparisonValue7, comparisonValue8, comparisonValue9)));
    float inverseLengthValue5 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
    float inverseLengthValue6 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue5;
    float multiplyAddValue9 = fma(inverseLengthValue4 * comparisonValue7, intermediateValue7, fma(inverseLengthValue5 * varyingBitangent0.x, intermediateValue6, inverseLengthValue6 * varyingTangent0.x));
    float multiplyAddValue10 = fma(inverseLengthValue4 * comparisonValue8, intermediateValue7, fma(inverseLengthValue5 * varyingBitangent0.y, intermediateValue6, inverseLengthValue6 * varyingTangent0.y));
    float multiplyAddValue11 = fma(inverseLengthValue4 * comparisonValue9, intermediateValue7, fma(inverseLengthValue5 * varyingBitangent0.z, intermediateValue6, inverseLengthValue6 * varyingTangent0.z));
    float sumValue6 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[17u].x;
    float sumValue7 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[17u].y;
    float sumValue8 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[17u].z;
    float inverseLengthValue7 = inversesqrt(dot(vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue27 = inverseLengthValue7 * multiplyAddValue9;
    float productValue28 = inverseLengthValue7 * multiplyAddValue10;
    float productValue29 = inverseLengthValue7 * multiplyAddValue11;
    float quotientValue2 = 1.0 / ((abs(productValue28) + abs(productValue27)) + abs(productValue29));
    float productValue30 = quotientValue2 * productValue27;
    float productValue31 = quotientValue2 * productValue28;
    bool conditionValue5 = productValue29 < 0.0;
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].w;
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[14u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].w, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w;
    float intermediateValue19;
    float productValue11;
    float productValue12;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[16u].x + fragmentVectorConstants1.packedValues[16u].y) + fragmentVectorConstants1.packedValues[16u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue32 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue19 = spvNClamp(productValue32, 0.0, 1.0);
        productValue11 = spvNClamp(((productValue32 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue32, 0.0, 1.0);
        productValue12 = spvNClamp((((productValue32 * productValue32) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue32, 0.0, 1.0);
    }
    else
    {
        intermediateValue19 = fragmentVectorConstants1.packedValues[16u].x;
        productValue11 = fragmentVectorConstants1.packedValues[16u].y;
        productValue12 = fragmentVectorConstants1.packedValues[16u].z;
    }
    float productValue33 = intermediateValue19 * 0.16666667163372039794921875;
    float productValue34 = productValue11 * 0.16666667163372039794921875;
    float productValue35 = productValue12 * 0.16666667163372039794921875;
    float productValue36 = ceil(spvNClamp(spvNMax(spvNMax(productValue33, productValue35), spvNMax(productValue34, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[16u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue33 / productValue36, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue34 / productValue36, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue35 / productValue36, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue36, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = sampledTextureValue.x * varyingColor0.x;
    fragmentColor1.y = sampledTextureValue.y * varyingColor0.y;
    fragmentColor1.z = sampledTextureValue.z * varyingColor0.z;
    fragmentColor1.w = (intermediateValue15 > intermediateValue17) ? ((intermediateValue15 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue17 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue5 ? (((productValue30 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue31))) : productValue30;
    fragmentColor2.y = conditionValue5 ? ((1.0 - abs(productValue30)) * ((productValue31 < 0.0) ? (-1.0) : 1.0)) : productValue31;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[14u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].x, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].x)) + fragmentVectorConstants1.packedValues[15u].x) / multiplyAddValue13)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[14u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].y, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].y)) + fragmentVectorConstants1.packedValues[15u].y) / multiplyAddValue13)) * 0.5;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((scalarValue2 & 1u) == 0u)
    {
        intermediateValue13 = fragmentVectorConstants1.packedValues[21u].z;
        intermediateValue14 = fragmentVectorConstants1.packedValues[21u].w;
        intermediateValue15 = fragmentVectorConstants1.packedValues[21u].y;
        intermediateValue16 = fragmentVectorConstants1.packedValues[22u].x;
    }
    else
    {
        vec4 sampledTextureValue9 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(fma(varyingTexCoord2.z, fragmentVectorConstants1.packedValues[19u].x, fragmentVectorConstants1.packedValues[19u].z), fma(varyingTexCoord2.w, fragmentVectorConstants1.packedValues[19u].y, fragmentVectorConstants1.packedValues[19u].w)));
        intermediateValue13 = sampledTextureValue9.y;
        intermediateValue14 = sampledTextureValue9.x;
        intermediateValue15 = sampledTextureValue9.z;
        intermediateValue16 = ((scalarValue2 & 2u) != 0u) ? sampledTextureValue9.w : fragmentVectorConstants1.packedValues[22u].x;
    }
    float comparisonValue7 = comparisonValue ? ((-0.0) - varyingNormal0.x) : varyingNormal0.x;
    float comparisonValue8 = comparisonValue ? ((-0.0) - varyingNormal0.y) : varyingNormal0.y;
    float comparisonValue9 = comparisonValue ? ((-0.0) - varyingNormal0.z) : varyingNormal0.z;
    float inverseLengthValue4 = inversesqrt(dot(vec3(comparisonValue7, comparisonValue8, comparisonValue9), vec3(comparisonValue7, comparisonValue8, comparisonValue9)));
    float inverseLengthValue5 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
    float inverseLengthValue16 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue4;
    float multiplyAddValue35 = fma(inverseLengthValue4 * comparisonValue7, intermediateValue6, fma(inverseLengthValue5 * varyingBitangent0.x, intermediateValue5, inverseLengthValue16 * varyingTangent0.x));
    float multiplyAddValue36 = fma(inverseLengthValue4 * comparisonValue8, intermediateValue6, fma(inverseLengthValue5 * varyingBitangent0.y, intermediateValue5, inverseLengthValue16 * varyingTangent0.y));
    float multiplyAddValue37 = fma(inverseLengthValue4 * comparisonValue9, intermediateValue6, fma(inverseLengthValue5 * varyingBitangent0.z, intermediateValue5, inverseLengthValue16 * varyingTangent0.z));
    float sumValue6 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[17u].x;
    float sumValue7 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[17u].y;
    float sumValue8 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[17u].z;
    float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37), vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37)));
    float productValue52 = inverseLengthValue17 * multiplyAddValue35;
    float productValue53 = inverseLengthValue17 * multiplyAddValue36;
    float productValue54 = inverseLengthValue17 * multiplyAddValue37;
    float quotientValue4 = 1.0 / ((abs(productValue53) + abs(productValue52)) + abs(productValue54));
    float productValue55 = quotientValue4 * productValue52;
    float productValue56 = quotientValue4 * productValue53;
    bool conditionValue12 = productValue54 < 0.0;
    float multiplyAddValue12 = fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].w;
    float multiplyAddValue13 = fma(fragmentVectorConstants1.packedValues[14u].w, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].w, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].w)) + fragmentVectorConstants1.packedValues[15u].w;
    float intermediateValue18;
    float productValue10;
    float productValue11;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[16u].x + fragmentVectorConstants1.packedValues[16u].y) + fragmentVectorConstants1.packedValues[16u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue32 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue18 = spvNClamp(productValue32, 0.0, 1.0);
        productValue10 = spvNClamp(((productValue32 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue32, 0.0, 1.0);
        productValue11 = spvNClamp((((productValue32 * productValue32) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue32, 0.0, 1.0);
    }
    else
    {
        intermediateValue18 = fragmentVectorConstants1.packedValues[16u].x;
        productValue10 = fragmentVectorConstants1.packedValues[16u].y;
        productValue11 = fragmentVectorConstants1.packedValues[16u].z;
    }
    float productValue57 = intermediateValue18 * 0.16666667163372039794921875;
    float productValue58 = productValue10 * 0.16666667163372039794921875;
    float productValue34 = productValue11 * 0.16666667163372039794921875;
    float productValue59 = ceil(spvNClamp(spvNMax(spvNMax(productValue57, productValue34), spvNMax(productValue58, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[16u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue57 / productValue59, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue58 / productValue59, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue34 / productValue59, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue59, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = sampledTextureValue.x;
    fragmentColor1.y = sampledTextureValue.y;
    fragmentColor1.z = sampledTextureValue.z;
    fragmentColor1.w = (intermediateValue14 > intermediateValue16) ? ((intermediateValue14 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue16 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue12 ? (((productValue55 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue56))) : productValue55;
    fragmentColor2.y = conditionValue12 ? ((1.0 - abs(productValue55)) * ((productValue56 < 0.0) ? (-1.0) : 1.0)) : productValue56;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[14u].x, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].x, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].x)) + fragmentVectorConstants1.packedValues[15u].x) / multiplyAddValue13)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue12) - ((fma(fragmentVectorConstants1.packedValues[14u].y, sumValue8, fma(fragmentVectorConstants1.packedValues[13u].y, sumValue7, sumValue6 * fragmentVectorConstants1.packedValues[12u].y)) + fragmentVectorConstants1.packedValues[15u].y) / multiplyAddValue13)) * 0.5;
#endif
    discardIfRequested();
}
